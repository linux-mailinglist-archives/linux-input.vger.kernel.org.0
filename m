Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1BEF0386F5B
	for <lists+linux-input@lfdr.de>; Tue, 18 May 2021 03:37:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239969AbhERBij (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 17 May 2021 21:38:39 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50346 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240665AbhERBig (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Mon, 17 May 2021 21:38:36 -0400
Received: from mail-pj1-x102b.google.com (mail-pj1-x102b.google.com [IPv6:2607:f8b0:4864:20::102b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 99346C061573;
        Mon, 17 May 2021 18:37:18 -0700 (PDT)
Received: by mail-pj1-x102b.google.com with SMTP id b13-20020a17090a8c8db029015cd97baea9so878742pjo.0;
        Mon, 17 May 2021 18:37:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id;
        bh=GYAYPUFZq7/QeDMZ8M5DkimvQ3Zl9qErKdzMaX8z1ks=;
        b=BPiKOFE6QhuvDSzH8fiO1OIqMQF+xk8UwHyG9nO4nv7xBThMTLIQ853paAgFohG2vC
         iGBUcw29qlwFfbUNkGTEMTAihhKOdhn1oRPX2PBL3uZXsGKBMS/JDpex+O/SffMK+A5d
         NmvNcmhbNMW1qFbwzQZ7tLg6ZWsU6H/hHcJ/UZrmstFsYOuhA/X0AQetA3vl0NnmPQTw
         f2er/bg6WQnd/C35enXwDV4YPtdbzs8RXCboYgN/Hqp9MkK8eNFR18JcVoqEZSt18806
         NBkzdKa5SqXeetqTaNUBmwK/kNUUdzdCsVOslL1Dd4U8OY63pCRFujBzZIsw6z8mS2TS
         sesA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=GYAYPUFZq7/QeDMZ8M5DkimvQ3Zl9qErKdzMaX8z1ks=;
        b=YUCHndxsduNLrr1k93z1fWwPPAghxKw1Urxj6tHEklI6izZ5NhaCBcfe5YRpqHn2o4
         IxUu1TzVmGYiDWQWKkxrccM/sjFWEz/C7Kza86+MRIWkbfgGj0fKnSxZuPWxurgpEk+t
         iUFCJ81/OSuUc31wYsW0AJl4Sza1Fw264//75mgyz2siDHC/nlwmp6lW3dN3VxBMtNNX
         scV4QmfjfppQmjOCOfCIIdO3cNpjMXcEcWBELPbYalJMQP+A1LfuYN370I4HENLcEIqK
         /G+kSxW2QrXcw0XIbwg/EEn+jBMl1xqy34U4VXYrihGAvqef1bnkShOkhoTfBWdhAA06
         dHdg==
X-Gm-Message-State: AOAM5301Or3magBW+YF1rHiZl7qNkGgQ4/xk4B/jo0bQjiVnzvGolpNc
        nHPD9uClo/9VLpCexBQAeAU=
X-Google-Smtp-Source: ABdhPJzzcRaS1/5Hnlnc5v1hCfbiCSvbqedPSv7VM2SFdlhY6YxnVB8mcZ1xzERwpdCS2SmWijnv8g==
X-Received: by 2002:a17:90a:1588:: with SMTP id m8mr2278642pja.226.1621301838209;
        Mon, 17 May 2021 18:37:18 -0700 (PDT)
Received: from localhost.localdomain ([2401:e180:8891:36a1:f153:748:2ea9:f579])
        by smtp.gmail.com with ESMTPSA id g8sm510893pju.6.2021.05.17.18.37.14
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 17 May 2021 18:37:17 -0700 (PDT)
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
Subject: [PATCH v2] HID: i2c-hid: Add I2C_HID_QUIRK_NO_DELAY_AFTER_PWR_ON to optimize timing
Date:   Tue, 18 May 2021 09:37:12 +0800
Message-Id: <1621301832-25479-1-git-send-email-johnny.chuang.emc@gmail.com>
X-Mailer: git-send-email 2.7.4
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

There is a hard coding 60ms delay after I2C_HID_PWR_ON commadn.
Elan didn't need the delay, so we add a quirk to reduce boot time and resume time.

Fixed: eef4016243e9("HID: i2c-hid: Always sleep 60ms after I2C_HID_PWR_ON commands")

Signed-off-by: Johnny Chuang <johnny.chuang.emc@gmail.com>
---
Change in v2:
    - Modify Optimized tag to Fixed tag
    - Modify comment for i2c_hid_quirks
---
 drivers/hid/i2c-hid/i2c-hid-core.c | 9 ++++++++-
 1 file changed, 8 insertions(+), 1 deletion(-)

diff --git a/drivers/hid/i2c-hid/i2c-hid-core.c b/drivers/hid/i2c-hid/i2c-hid-core.c
index 9993133..f4ee690 100644
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
+	 * Elan devices don't need delay after I2C_HID_PWR_ON
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

