Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C3A62386DF7
	for <lists+linux-input@lfdr.de>; Tue, 18 May 2021 01:57:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1344696AbhEQX61 (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 17 May 2021 19:58:27 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56040 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239438AbhEQX61 (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Mon, 17 May 2021 19:58:27 -0400
Received: from mail-pl1-x62c.google.com (mail-pl1-x62c.google.com [IPv6:2607:f8b0:4864:20::62c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 94BA9C061573;
        Mon, 17 May 2021 16:57:10 -0700 (PDT)
Received: by mail-pl1-x62c.google.com with SMTP id h20so4074745plr.4;
        Mon, 17 May 2021 16:57:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id;
        bh=mrA6QYKCPF2lj2bs79YVLd0793GXiSeQ4kwvYnZexSY=;
        b=VdZ3jCRCPYKnFWF+8V3cA7U9U28qnpPKFePpSXnCUz5mIcOYBksp5xPZNipDMzGqJB
         a3/+D/0Ukgn8IcZ1gitizLRGnjgdFW59im34EKWadYMMc6sg7Sb+npna7vferXd2hOu5
         joyBkRtCYsj1exgdkdI64eCtRllLoK6+bIxvbiiv/IOTRKOKn0yQEU4txFLWuL1fPoG1
         u9jv7ufUN+HE8+lVrblu+ficsMWXG7MG15uWrCRHBrrsHQi11+znHA76YjrwfgXGjuOT
         Y1WT7R8JdVMrc/431Cfa9nWTKF2JlPAOFCYjXXoSIm260JiDAM8SYmI0+oxdtEpzzE5W
         3Byg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=mrA6QYKCPF2lj2bs79YVLd0793GXiSeQ4kwvYnZexSY=;
        b=oSCor00renBPTwXOeT/AZQCvwO0v73Qy/2GFBTvLIgMw0I7ju8a4gB0cgqOAsh43my
         YvN6bnH+g2z0m1cKNkTXDShfOxKXvSRrpNKHtPFXPDLCFXZ6xp/YtlVrfs/8ykZb2630
         xSlwiugJKN/tUcrZelYTrfnUUpci89nOVYUIgpKI8bO5J0zjyePjr2jaFZLN9MnYZ8va
         w4COgAsjDGfFbmk3FDUCiUaIPI0n/kPPWV0HogFTFiLw1UbVJrLcsFK5BLx8UnL3bF0X
         sY3v7VbW950mjh/nmjjdm1zREuaTFKk8Ztmoe1bXeVv6auEi1Q/BLOx3D5l93X9bfDwD
         VvNw==
X-Gm-Message-State: AOAM531ezyN03+h/rJyqtA+ZK71qrpkv8f1QCNMsM5yBkE4ZorhQS0fc
        6KDeoh+8cDNn42sinJOUmE0=
X-Google-Smtp-Source: ABdhPJwJS4y/e4j/5sZowDsm6SZ8B0/UDi1X/kRz8MJ0gpAJpbqIdPibNvayTOhk6e5mW0DMB73iNw==
X-Received: by 2002:a17:90a:43e2:: with SMTP id r89mr2145244pjg.182.1621295830184;
        Mon, 17 May 2021 16:57:10 -0700 (PDT)
Received: from localhost.localdomain ([2401:e180:8891:36a1:f153:748:2ea9:f579])
        by smtp.gmail.com with ESMTPSA id t12sm397745pjw.57.2021.05.17.16.57.05
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 17 May 2021 16:57:09 -0700 (PDT)
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
        Jingle <jingle.wu@emc.com.tw>, Paris Yeh <pyeh@google.com>,
        "sukumar . ghorai" <sukumar.ghorai@intel.corp-partner.google.com>
Subject: [PATCH] HID: i2c-hid: Add I2C_HID_QUIRK_NO_DELAY_AFTER_PWR_ON to optimize timing
Date:   Tue, 18 May 2021 07:57:04 +0800
Message-Id: <1621295824-12730-1-git-send-email-johnny.chuang.emc@gmail.com>
X-Mailer: git-send-email 2.7.4
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

There is a hard coding 60ms delay after I2C_HID_PWR_ON commadn.
Elan didn't need the delay, so we add a quirk to reduce boot time and resume time.

Optimized: eef4016243e9("HID: i2c-hid: Always sleep 60ms after I2C_HID_PWR_ON commands")

Signed-off-by: Johnny Chuang <johnny.chuang.emc@gmail.com>
---
 drivers/hid/i2c-hid/i2c-hid-core.c | 9 ++++++++-
 1 file changed, 8 insertions(+), 1 deletion(-)

diff --git a/drivers/hid/i2c-hid/i2c-hid-core.c b/drivers/hid/i2c-hid/i2c-hid-core.c
index 9993133..e7ec280 100644
--- a/drivers/hid/i2c-hid/i2c-hid-core.c
+++ b/drivers/hid/i2c-hid/i2c-hid-core.c
@@ -45,6 +45,7 @@
 #define I2C_HID_QUIRK_BOGUS_IRQ			BIT(4)
 #define I2C_HID_QUIRK_RESET_ON_RESUME		BIT(5)
 #define I2C_HID_QUIRK_BAD_INPUT_SIZE		BIT(6)
+#define I2C_HID_QUIRK_NO_DELAY_AFTER_PWR_ON	BIT(8)
 
 
 /* flags */
@@ -178,6 +179,11 @@ static const struct i2c_hid_quirks {
 		 I2C_HID_QUIRK_RESET_ON_RESUME },
 	{ USB_VENDOR_ID_ITE, I2C_DEVICE_ID_ITE_LENOVO_LEGION_Y720,
 		I2C_HID_QUIRK_BAD_INPUT_SIZE },
+	/*
+	 * Optimize boot time and resume time
+	 */
+	{ USB_VENDOR_ID_ELAN, HID_ANY_ID,
+		 I2C_HID_QUIRK_NO_DELAY_AFTER_PWR_ON },
 	{ 0, 0 }
 };
 
@@ -427,7 +433,8 @@ static int i2c_hid_set_power(struct i2c_client *client, int power_state)
 	 * PWR_ON requests. Testing has confirmed that several devices
 	 * will not work properly without a delay after a PWR_ON request.
 	 */
-	if (!ret && power_state == I2C_HID_PWR_ON)
+	if (!ret && power_state == I2C_HID_PWR_ON &&
+	    !(ihid->quirks & I2C_HID_QUIRK_NO_DELAY_AFTER_PWR_ON))
 		msleep(60);
 
 	return ret;
-- 
2.7.4

