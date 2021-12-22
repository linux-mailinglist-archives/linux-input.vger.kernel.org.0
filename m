Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 437D347D926
	for <lists+linux-input@lfdr.de>; Wed, 22 Dec 2021 23:06:58 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230328AbhLVWG5 (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 22 Dec 2021 17:06:57 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:43171 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S230063AbhLVWG5 (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Wed, 22 Dec 2021 17:06:57 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1640210816;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding;
        bh=5bAK5sdieX4U9atiGAI5totDiEEK1BezJsS+15eJ3kU=;
        b=SceITGq2yRlIumV9cXJItUYS7kXmJqSV4fa100ewxrAykhg77GCndMkXb1g4fTlsBhgvWN
        eqCKICw1rom1UNgGlDOZK0wBN9bBDePPPZiTC3wAgZv2r89QEjudAbNZvitcJRoowPykWp
        5Yi2l4gN6R8qyh4Do00Eb3UII67YS+0=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-120-_i8_VqdcP4eEjsHSWwYX8A-1; Wed, 22 Dec 2021 17:06:53 -0500
X-MC-Unique: _i8_VqdcP4eEjsHSWwYX8A-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.12])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx01.redhat.com (Postfix) with ESMTPS id EB1F3760C5;
        Wed, 22 Dec 2021 22:06:51 +0000 (UTC)
Received: from localhost.localdomain (unknown [10.39.192.45])
        by smtp.corp.redhat.com (Postfix) with ESMTP id 213217ED87;
        Wed, 22 Dec 2021 22:06:46 +0000 (UTC)
From:   Hans de Goede <hdegoede@redhat.com>
To:     Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc:     Hans de Goede <hdegoede@redhat.com>,
        Jingle Wu <jingle.wu@emc.com.tw>, linux-input@vger.kernel.org
Subject: [PATCH] Input: elan_i2c - Fix regulator enable count imbalance after suspend/resume
Date:   Wed, 22 Dec 2021 23:06:41 +0100
Message-Id: <20211222220641.439863-1-hdegoede@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Before these changes elan_suspend() would only call elan_disable_power()
when device_may_wakeup() returns false; whereas elan_resume() would
unconditionally call elan_enable_power(), leading to an enable count
imbalance when device_may_wakeup() returns true.

This triggers the "WARN_ON(regulator->enable_count)" in regulator_put()
when the elan_i2c driver gets unbound, this happens e.g. with the
hot-plugable dock with Elan I2C touchpad for the Asus TF103C 2-in-1.

Fix this by making the elan_enable_power() call also be conditional
on device_may_wakeup() returning false.

Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 drivers/input/mouse/elan_i2c_core.c | 14 +++++++-------
 1 file changed, 7 insertions(+), 7 deletions(-)

diff --git a/drivers/input/mouse/elan_i2c_core.c b/drivers/input/mouse/elan_i2c_core.c
index 47af62c12267..cdb36d35ffa4 100644
--- a/drivers/input/mouse/elan_i2c_core.c
+++ b/drivers/input/mouse/elan_i2c_core.c
@@ -1412,17 +1412,17 @@ static int __maybe_unused elan_resume(struct device *dev)
 	struct elan_tp_data *data = i2c_get_clientdata(client);
 	int error;
 
-	if (device_may_wakeup(dev) && data->irq_wake) {
+	if (!device_may_wakeup(dev)) {
+		error = elan_enable_power(data);
+		if (error) {
+			dev_err(dev, "power up when resuming failed: %d\n", error);
+			goto err;
+		}
+	} else if (data->irq_wake) {
 		disable_irq_wake(client->irq);
 		data->irq_wake = false;
 	}
 
-	error = elan_enable_power(data);
-	if (error) {
-		dev_err(dev, "power up when resuming failed: %d\n", error);
-		goto err;
-	}
-
 	error = elan_initialize(data, data->quirks & ETP_QUIRK_QUICK_WAKEUP);
 	if (error)
 		dev_err(dev, "initialize when resuming failed: %d\n", error);
-- 
2.33.1

