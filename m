Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A091F356481
	for <lists+linux-input@lfdr.de>; Wed,  7 Apr 2021 08:49:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243733AbhDGGtz (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 7 Apr 2021 02:49:55 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59268 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S243813AbhDGGty (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Wed, 7 Apr 2021 02:49:54 -0400
Received: from mail-pl1-x632.google.com (mail-pl1-x632.google.com [IPv6:2607:f8b0:4864:20::632])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F3B47C06174A;
        Tue,  6 Apr 2021 23:49:44 -0700 (PDT)
Received: by mail-pl1-x632.google.com with SMTP id l1so8834774plg.12;
        Tue, 06 Apr 2021 23:49:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id;
        bh=hA/dPnooA5S+ny4t+sDLWeyDcw49IUVDMgqesssoN5k=;
        b=brDgb/liqUxMQa0Vgbl6JwPUURmnenCnN4l0WDhzzlwKgH/37TqDGg2iZP6t8mJ/wV
         Q6EmCnOeHjcVcYbCtCeEFF927w3SaAIxodcyY8bJZ/fKvZbTbxDHmM2QK7MG/fzVy87C
         1m+YTgBBAM8bdBVUp9HutxSbihXRm2FR+QYPpggqoEFAUjltYgYqwz2GqnmPH98tuA9Q
         j5qD8yXvR3eagUSgf/3COgXpQ50tfCX2X6E29ulk+iJ0GLUfW9DCGh3OmjZ3ERWLNvD3
         8grQpZ397pB1hMeSHeivwTGzdmEcYteWed6QMU90n2WVmTDGIzgEy1EVk+ztcrff9rT/
         8kZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=hA/dPnooA5S+ny4t+sDLWeyDcw49IUVDMgqesssoN5k=;
        b=dlJHkcuzTdgodWZE8fmV+qcuO4tTgXNabpLjXM8RWfZNpLYK9UVqE59vUAWrik7DVd
         Rp7lt0AkEOJANihguTs+kxB7MGqbpAtNYRfT1zJRa4J2oPcbmy61d1wdnM6n8ilEvNjv
         rUgIYhcjcmQuHeUBFRVPizo2om0kFqXDQOD3ebK/6fZgtgUhHlGYW2ulWSrAKxWCVrsW
         g0acVktqBM8SAIQyI/FlPKagZUXxO1x44p/85XNwHzT3BSs6weHQlo73dE9HDFm8/Ti0
         atbpVz/E3ONkBp1V0phTp6rFEz4YPFBLyvv3iTk0QUiwDGz48eoMjT7IMtsdGQ0Qzutb
         hO3w==
X-Gm-Message-State: AOAM5313+djrIdQRyKyDrEgFtcJyAi2QB9SutiudxVBjq/WVkACfHOXm
        tT/yKjwDlvRZTn0cEJwwH4Q=
X-Google-Smtp-Source: ABdhPJw1seYdAkQL/xYppWBEq8bvohog3ufBE/aaAYZ1oCuB3Aa8FN/iGaO+iBQRy83oRFr8Fvv/oQ==
X-Received: by 2002:a17:90a:d902:: with SMTP id c2mr1822932pjv.152.1617778184595;
        Tue, 06 Apr 2021 23:49:44 -0700 (PDT)
Received: from localhost.localdomain ([2401:e180:8843:9f5a:945d:de90:edc9:855b])
        by smtp.gmail.com with ESMTPSA id d6sm20429882pfq.109.2021.04.06.23.49.40
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 06 Apr 2021 23:49:43 -0700 (PDT)
From:   Johnny Chuang <johnny.chuang.emc@gmail.com>
To:     Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>,
        Peter Hutterer <peter.hutterer@who-t.net>,
        linux-kernel@vger.kernel.org, linux-input@vger.kernel.org,
        Harry Cutts <hcutts@chromium.org>,
        Johnny Chuang <johnny.chuang@emc.com.tw>
Cc:     James Chen <james.chen@emc.com.tw>,
        Jennifer Tsai <jennifer.tsai@emc.com.tw>,
        Paul Liang <paul.liang@emc.com.tw>,
        Jeff Chuang <jeff.chuang@emc.com.tw>,
        Douglas Anderson <dianders@chromium.org>,
        Jingle <jingle.wu@emc.com.tw>
Subject: [PATCH] HID: i2c-hid: Skip ELAN power-on command after reset
Date:   Wed,  7 Apr 2021 14:49:17 +0800
Message-Id: <1617778157-11007-1-git-send-email-johnny.chuang.emc@gmail.com>
X-Mailer: git-send-email 2.7.4
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Previous commit 43b7029f475e ("HID: i2c-hid:
Send power-on command after reset"), it fixed issue for SIS touchscreen.

For ELAN touchscreen, we found our boot code of IC was not flexible enough
to receive and handle this command.
Once the FW main code of our controller is crashed for some reason,
the controller could not be enumerated successfully to be recognized
by the system host. therefore, it lost touch functionality.

Add quirk for skip send power-on command after reset.
It will impact to ELAN touchscreen and touchpad on HID over I2C projects.

Signed-off-by: Johnny Chuang <johnny.chuang.emc@gmail.com>
---
 drivers/hid/i2c-hid/i2c-hid-core.c | 10 +++++++++-
 1 file changed, 9 insertions(+), 1 deletion(-)

diff --git a/drivers/hid/i2c-hid/i2c-hid-core.c b/drivers/hid/i2c-hid/i2c-hid-core.c
index 9993133..6b407f7 100644
--- a/drivers/hid/i2c-hid/i2c-hid-core.c
+++ b/drivers/hid/i2c-hid/i2c-hid-core.c
@@ -45,6 +45,7 @@
 #define I2C_HID_QUIRK_BOGUS_IRQ			BIT(4)
 #define I2C_HID_QUIRK_RESET_ON_RESUME		BIT(5)
 #define I2C_HID_QUIRK_BAD_INPUT_SIZE		BIT(6)
+#define I2C_HID_QUIRK_NO_WAKEUP_AFTER_RESET	BIT(7)
 
 
 /* flags */
@@ -157,6 +158,10 @@ struct i2c_hid {
 	struct i2chid_ops	*ops;
 };
 
+/*
+ * Sending the wakeup after reset actually break ELAN touchscreen controller
+ * So add I2C_HID_QUIRK_NO_WAKEUP_AFTER_RESET to skip wakeup after reset
+ */
 static const struct i2c_hid_quirks {
 	__u16 idVendor;
 	__u16 idProduct;
@@ -178,6 +183,8 @@ static const struct i2c_hid_quirks {
 		 I2C_HID_QUIRK_RESET_ON_RESUME },
 	{ USB_VENDOR_ID_ITE, I2C_DEVICE_ID_ITE_LENOVO_LEGION_Y720,
 		I2C_HID_QUIRK_BAD_INPUT_SIZE },
+	{ USB_VENDOR_ID_ELAN, HID_ANY_ID,
+		 I2C_HID_QUIRK_NO_WAKEUP_AFTER_RESET },
 	{ 0, 0 }
 };
 
@@ -461,7 +468,8 @@ static int i2c_hid_hwreset(struct i2c_client *client)
 	}
 
 	/* At least some SIS devices need this after reset */
-	ret = i2c_hid_set_power(client, I2C_HID_PWR_ON);
+	if (!(ihid->quirks & I2C_HID_QUIRK_NO_WAKEUP_AFTER_RESET))
+		ret = i2c_hid_set_power(client, I2C_HID_PWR_ON);
 
 out_unlock:
 	mutex_unlock(&ihid->reset_lock);
-- 
2.7.4

