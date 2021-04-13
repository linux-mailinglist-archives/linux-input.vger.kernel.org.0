Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BB15E35D4B8
	for <lists+linux-input@lfdr.de>; Tue, 13 Apr 2021 03:20:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238194AbhDMBVP (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 12 Apr 2021 21:21:15 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56490 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235837AbhDMBVP (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Mon, 12 Apr 2021 21:21:15 -0400
Received: from mail-pj1-x1033.google.com (mail-pj1-x1033.google.com [IPv6:2607:f8b0:4864:20::1033])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A0CE2C061574;
        Mon, 12 Apr 2021 18:20:56 -0700 (PDT)
Received: by mail-pj1-x1033.google.com with SMTP id e8-20020a17090a7288b029014e51f5a6baso2819670pjg.2;
        Mon, 12 Apr 2021 18:20:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id;
        bh=yheRx+kYUsbNUD7gJ5pySz1Sr2ILfCsXaKYlyJifNug=;
        b=SjJPOJQw3GzbMhck9SE/ymw2UYnJispVYGjMPUusA0rigSRiMzorrPnOljdlHyqsE1
         mVlMQLcUmJCy91zWbdR4+qQxlcFQ5sQc5QlF7T+dCENiCwEz9gZcapR/TDMRu/iDw985
         8i4qkTB+P12CJZn+Puiel1RX6jV0IGI8UKElzscv7rbggIRu2nAp8udcwk7fq+V+wFTc
         bsmojpb0+vNqEOSw42NbyAR2yix5SIII+ZHxkCQU4/e94KjFIexK+VJz/Riledn73mUH
         wq/6F65d0rYoS+hsZaFRvLBX9bjURWOQbXJlGJ0dW2HqzQO2UlO2Ut5zYI9CNmCcOlgb
         NhQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=yheRx+kYUsbNUD7gJ5pySz1Sr2ILfCsXaKYlyJifNug=;
        b=AfY49Td9VCg3/5NWwszK1OE6snailjEGkm+SZnxuk72QkvIlDusaSrsggOTVn42mhF
         hbuXzLnXxBBr2e6rV1coR42hEXsifleLgHWhpvdhbUG0RG3VUF2EIppwTr54BDyhJmxd
         9SGnudmAQrJNwSaKsbJEcT4nxCLmpg7SoVsbQAnrSMTIRoHiEe8a0lfQ6rjt043iziiz
         u4xFvbLB9kc9pUWzu23hXFOftRWv9Q/t3nOPAF9ALbqXkUYy+t1eTgXPRtD5Rq5qNBpd
         UBwALET0+y+2aHcVY40LmTrKP4+YKhSTYB3+LDuNx3mEDhO3WvnNzQHtBlwWmcPErc2C
         czXw==
X-Gm-Message-State: AOAM5302AFIBaPZfSfWF0y5JK9XpdI4BiLVGAQs0ivjlNKWfxVltBWRz
        Xebk7kwQ4SL63XFT7aUhhyk=
X-Google-Smtp-Source: ABdhPJwwXImzc4a7nHQ9vSY+xVT5JxCAWg8ef7cVhlyxbtUv4GUYCTKm4caH7uJN0xTKDqVEwBn4pw==
X-Received: by 2002:a17:902:e889:b029:e7:1490:9da5 with SMTP id w9-20020a170902e889b02900e714909da5mr28568352plg.20.1618276856107;
        Mon, 12 Apr 2021 18:20:56 -0700 (PDT)
Received: from localhost.localdomain ([2401:e180:8d00:23:945d:de90:edc9:855b])
        by smtp.gmail.com with ESMTPSA id e13sm3402514pfd.64.2021.04.12.18.20.52
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 12 Apr 2021 18:20:55 -0700 (PDT)
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
Subject: [PATCH v3] HID: i2c-hid: Skip ELAN power-on command after reset
Date:   Tue, 13 Apr 2021 09:20:50 +0800
Message-Id: <1618276850-27178-1-git-send-email-johnny.chuang.emc@gmail.com>
X-Mailer: git-send-email 2.7.4
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Fixes: 43b7029f475e ("HID: i2c-hid: Send power-on command after reset").

For ELAN touchscreen, we found our boot code of IC was not flexible enough
to receive and handle this command.
Once the FW main code of our controller is crashed for some reason,
the controller could not be enumerated successfully to be recognized
by the system host. therefore, it lost touch functionality.

Add quirk for skip send power-on command after reset.
It will impact to ELAN touchscreen and touchpad on HID over I2C projects.

Signed-off-by: Johnny Chuang <johnny.chuang.emc@gmail.com>
---
Changes in V3:
    - intent the comment at qurik entry
    - add Fixes:flag for previous commit id

Changes in v2:
    - move comment to quirk entry
---
 drivers/hid/i2c-hid/i2c-hid-core.c | 10 +++++++++-
 1 file changed, 9 insertions(+), 1 deletion(-)

diff --git a/drivers/hid/i2c-hid/i2c-hid-core.c b/drivers/hid/i2c-hid/i2c-hid-core.c
index 9993133..32e3287 100644
--- a/drivers/hid/i2c-hid/i2c-hid-core.c
+++ b/drivers/hid/i2c-hid/i2c-hid-core.c
@@ -45,6 +45,7 @@
 #define I2C_HID_QUIRK_BOGUS_IRQ			BIT(4)
 #define I2C_HID_QUIRK_RESET_ON_RESUME		BIT(5)
 #define I2C_HID_QUIRK_BAD_INPUT_SIZE		BIT(6)
+#define I2C_HID_QUIRK_NO_WAKEUP_AFTER_RESET	BIT(7)
 
 
 /* flags */
@@ -178,6 +179,12 @@ static const struct i2c_hid_quirks {
 		 I2C_HID_QUIRK_RESET_ON_RESUME },
 	{ USB_VENDOR_ID_ITE, I2C_DEVICE_ID_ITE_LENOVO_LEGION_Y720,
 		I2C_HID_QUIRK_BAD_INPUT_SIZE },
+	/*
+	 * Sending the wakeup after reset actually break ELAN touchscreen controller
+	 * Add I2C_HID_QUIRK_NO_WAKEUP_AFTER_RESET to skip wakeup after reset
+	 */
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

