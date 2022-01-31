Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 79BE44A48C6
	for <lists+linux-input@lfdr.de>; Mon, 31 Jan 2022 14:54:47 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1377275AbiAaNyq (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 31 Jan 2022 08:54:46 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:49956 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S243076AbiAaNyq (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Mon, 31 Jan 2022 08:54:46 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1643637285;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding;
        bh=/7eLXGeEcbnzwvP0Ge/eOhaNZyrffnA2V6159pVPOTY=;
        b=Yt2c+FgsG28ZKGF30zxCdMUOsQyxQO6evymnlin/eHitLo3xw5Z/jgEfb/N+BMEZax4vmL
        AmXClooglxw72Y3wdnymfhcq2XYgTpo5jrKgijcoMGTGZmAVZUh04av/p2tQEy8bFUKaJF
        NAv1A9bgIqllavW622rHgSdnDho+EP4=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-553-PruI2ypoPOay5GzPufsb4g-1; Mon, 31 Jan 2022 08:54:41 -0500
X-MC-Unique: PruI2ypoPOay5GzPufsb4g-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com [10.5.11.14])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 90C221932488;
        Mon, 31 Jan 2022 13:54:40 +0000 (UTC)
Received: from x1.localdomain.com (unknown [10.39.194.59])
        by smtp.corp.redhat.com (Postfix) with ESMTP id 346CB78AA2;
        Mon, 31 Jan 2022 13:54:38 +0000 (UTC)
From:   Hans de Goede <hdegoede@redhat.com>
To:     Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        "Jingle . Wu" <jingle.wu@emc.com.tw>
Cc:     Hans de Goede <hdegoede@redhat.com>, linux-input@vger.kernel.org
Subject: [PATCH v2 1/2] Input: elan_i2c - Move regulator_[en|dis]able() out of elan_[en|dis]able_power()
Date:   Mon, 31 Jan 2022 14:54:35 +0100
Message-Id: <20220131135436.29638-1-hdegoede@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

elan_disable_power() is called conditionally on suspend, where as
elan_enable_power() is always called on resume. This leads to
an imbalance in the regulator's enable count.

Move the regulator_[en|dis]able() calls out of elan_[en|dis]able_power()
in preparation of fixing this.

No functional changes intended.

Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
Changes in v2:
- New patch in v2 of this patch-set
---
 drivers/input/mouse/elan_i2c_core.c | 36 ++++++++++++++---------------
 1 file changed, 17 insertions(+), 19 deletions(-)

diff --git a/drivers/input/mouse/elan_i2c_core.c b/drivers/input/mouse/elan_i2c_core.c
index 47af62c12267..d8965f3c6bf5 100644
--- a/drivers/input/mouse/elan_i2c_core.c
+++ b/drivers/input/mouse/elan_i2c_core.c
@@ -191,13 +191,6 @@ static int elan_enable_power(struct elan_tp_data *data)
 	int repeat = ETP_RETRY_COUNT;
 	int error;
 
-	error = regulator_enable(data->vcc);
-	if (error) {
-		dev_err(&data->client->dev,
-			"failed to enable regulator: %d\n", error);
-		return error;
-	}
-
 	do {
 		error = data->ops->power_control(data->client, true);
 		if (error >= 0)
@@ -217,19 +210,8 @@ static int elan_disable_power(struct elan_tp_data *data)
 
 	do {
 		error = data->ops->power_control(data->client, false);
-		if (!error) {
-			error = regulator_disable(data->vcc);
-			if (error) {
-				dev_err(&data->client->dev,
-					"failed to disable regulator: %d\n",
-					error);
-				/* Attempt to power the chip back up */
-				data->ops->power_control(data->client, true);
-				break;
-			}
-
+		if (!error)
 			return 0;
-		}
 
 		msleep(30);
 	} while (--repeat > 0);
@@ -1400,8 +1382,18 @@ static int __maybe_unused elan_suspend(struct device *dev)
 		data->irq_wake = (enable_irq_wake(client->irq) == 0);
 	} else {
 		ret = elan_disable_power(data);
+		if (ret)
+			goto err;
+
+		ret = regulator_disable(data->vcc);
+		if (ret) {
+			dev_err(dev, "error %d disabling regulator\n", ret);
+			/* Attempt to power the chip back up */
+			elan_enable_power(data);
+		}
 	}
 
+err:
 	mutex_unlock(&data->sysfs_mutex);
 	return ret;
 }
@@ -1417,6 +1409,12 @@ static int __maybe_unused elan_resume(struct device *dev)
 		data->irq_wake = false;
 	}
 
+	error = regulator_enable(data->vcc);
+	if (error) {
+		dev_err(dev, "error %d enabling regulator\n", error);
+		goto err;
+	}
+
 	error = elan_enable_power(data);
 	if (error) {
 		dev_err(dev, "power up when resuming failed: %d\n", error);
-- 
2.33.1

