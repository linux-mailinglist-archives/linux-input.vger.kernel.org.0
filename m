Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E19294A48C7
	for <lists+linux-input@lfdr.de>; Mon, 31 Jan 2022 14:54:48 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1346094AbiAaNys (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 31 Jan 2022 08:54:48 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:53247 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S243076AbiAaNyr (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Mon, 31 Jan 2022 08:54:47 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1643637287;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=Yu0VwXvkL6XBmt3SfSCF2I/Qu1oSvMyxpf3tK8PmpNA=;
        b=WXsQ8/VC1Cw9gMpCvOs+NWNCOJjXS+KGyzseMvC/Y/HTo782I3LohuY+tPXM9366htrI5Y
        mGhYn710ibLuEbunpzmXfqHR3Wh6xJt9I0VUgUaZpH3BOHQMAjwYS5TpGBa+DCfU2/Fmtt
        h5EzExby5Zui0RIKjQph0ph7U8QOGZU=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-314-BqrVJsSyMyyXdI1tq_AywA-1; Mon, 31 Jan 2022 08:54:44 -0500
X-MC-Unique: BqrVJsSyMyyXdI1tq_AywA-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com [10.5.11.14])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 3C83284BA44;
        Mon, 31 Jan 2022 13:54:43 +0000 (UTC)
Received: from x1.localdomain.com (unknown [10.39.194.59])
        by smtp.corp.redhat.com (Postfix) with ESMTP id E3C9678AA2;
        Mon, 31 Jan 2022 13:54:40 +0000 (UTC)
From:   Hans de Goede <hdegoede@redhat.com>
To:     Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        "Jingle . Wu" <jingle.wu@emc.com.tw>
Cc:     Hans de Goede <hdegoede@redhat.com>, linux-input@vger.kernel.org
Subject: [PATCH v2 2/2] Input: elan_i2c - Fix regulator enable count imbalance after suspend/resume
Date:   Mon, 31 Jan 2022 14:54:36 +0100
Message-Id: <20220131135436.29638-2-hdegoede@redhat.com>
In-Reply-To: <20220131135436.29638-1-hdegoede@redhat.com>
References: <20220131135436.29638-1-hdegoede@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Before these changes elan_suspend() would only disable the regulator
when device_may_wakeup() returns false; whereas elan_resume() would
unconditionally enable it, leading to an enable count imbalance when
device_may_wakeup() returns true.

This triggers the "WARN_ON(regulator->enable_count)" in regulator_put()
when the elan_i2c driver gets unbound, this happens e.g. with the
hot-plugable dock with Elan I2C touchpad for the Asus TF103C 2-in-1.

Fix this by making the regulator_enable() call also be conditional
on device_may_wakeup() returning false.

Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
Changes in v2:
-Only make the regulator_enable() conditional, leaving the behavior
 of always calling elan_enable_power() on resume intact
---
 drivers/input/mouse/elan_i2c_core.c | 14 +++++++-------
 1 file changed, 7 insertions(+), 7 deletions(-)

diff --git a/drivers/input/mouse/elan_i2c_core.c b/drivers/input/mouse/elan_i2c_core.c
index d8965f3c6bf5..4dbf4dc78aa4 100644
--- a/drivers/input/mouse/elan_i2c_core.c
+++ b/drivers/input/mouse/elan_i2c_core.c
@@ -1404,17 +1404,17 @@ static int __maybe_unused elan_resume(struct device *dev)
 	struct elan_tp_data *data = i2c_get_clientdata(client);
 	int error;
 
-	if (device_may_wakeup(dev) && data->irq_wake) {
+	if (!device_may_wakeup(dev)) {
+		error = regulator_enable(data->vcc);
+		if (error) {
+			dev_err(dev, "error %d enabling regulator\n", error);
+			goto err;
+		}
+	} else if (data->irq_wake) {
 		disable_irq_wake(client->irq);
 		data->irq_wake = false;
 	}
 
-	error = regulator_enable(data->vcc);
-	if (error) {
-		dev_err(dev, "error %d enabling regulator\n", error);
-		goto err;
-	}
-
 	error = elan_enable_power(data);
 	if (error) {
 		dev_err(dev, "power up when resuming failed: %d\n", error);
-- 
2.33.1

