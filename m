Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 788004FADBD
	for <lists+linux-input@lfdr.de>; Sun, 10 Apr 2022 14:03:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230125AbiDJMFg (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Sun, 10 Apr 2022 08:05:36 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54044 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238644AbiDJMFd (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Sun, 10 Apr 2022 08:05:33 -0400
Received: from mail-lf1-x136.google.com (mail-lf1-x136.google.com [IPv6:2a00:1450:4864:20::136])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 76DF7515A8
        for <linux-input@vger.kernel.org>; Sun, 10 Apr 2022 05:03:22 -0700 (PDT)
Received: by mail-lf1-x136.google.com with SMTP id x17so13000508lfa.10
        for <linux-input@vger.kernel.org>; Sun, 10 Apr 2022 05:03:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=p63T0wI5Y0SynUtb2tKtw6BTlbvTq7jOTGTQDwjUp7k=;
        b=a5ttDyLSTLXhL88n9LwXkFnwQ73rZlcfxxlWOYZtqcfaFfpjS3xPmhQF+kDnOWrcf6
         YYOjEc681OhngudXk5e/a9JUuD73Q1j3DK8W1zXz/NduDGsZEJlu7qOefm1JEE2XyEez
         LkrF2r27FVtHADzoeEGkUk6R1AalEY7APRcm+HcTtG2+mfYjonttwPfFkOJskkZwjYsa
         vBEiOHvy3Dhmm5windjh7PmtLyQyxZvwsKzoLzg3MDnxGjCpqaAnTHFGGje4kE99FSYG
         pz+7eRoVxyAkRF0EI2c6lG9m/4xiVb7kfCAlNYci/gqD5mz24aqUB+FR6I5RWVKHZx7w
         vt2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=p63T0wI5Y0SynUtb2tKtw6BTlbvTq7jOTGTQDwjUp7k=;
        b=B57kqeElQcIG12wdWbdgbYpcSjEjTi5aamXRaL1Ug32B9YsCBL9Th9U9KUzOivbaR7
         sOH+Fs+XwFrCajRN5H0LkNJXWEG73RnHKvIy/Wrue1ofdLpi4RlKlkAfZagpe8NN7TEk
         hOSYKtVrMwiZBsZuM9eQ+mpPs8SEyZoUTNSJFC5hy5licO3sX/Q/ltZPsPv5ugcBHuM7
         DFTKrd0xLBnXj18VYh5fe8PUFFJBngMWmx9IMPvPa4JUnXb49wsF7ad94ofQJVpIgWXI
         3To4LG1OM8jtj9eEakkhQAuvB/5KBKE0ufABDwqq9mNB+J/u/P7lHczt+8nvTQQPKOhB
         MDug==
X-Gm-Message-State: AOAM53342Lno93S8hzv1VsmgTnFwuutTmjZxtCIb0pe3OeiuCN76UmOo
        7eM27gXUVbNRrr+qMH70PXrIkg==
X-Google-Smtp-Source: ABdhPJxVm9OTqYdnXbiKAU4Oigj/9C7d4pvkiPgDsgnbXDlzkk7wx0SLIzwfDwshLK9FbmSsZ1vlQA==
X-Received: by 2002:a05:6512:2313:b0:46b:a1e2:854a with SMTP id o19-20020a056512231300b0046ba1e2854amr1778517lfu.55.1649592200678;
        Sun, 10 Apr 2022 05:03:20 -0700 (PDT)
Received: from localhost.localdomain (c-fdcc225c.014-348-6c756e10.bbcust.telenor.se. [92.34.204.253])
        by smtp.gmail.com with ESMTPSA id s10-20020a19ad4a000000b0044826a25a2esm2992216lfd.292.2022.04.10.05.03.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 10 Apr 2022 05:03:20 -0700 (PDT)
From:   Linus Walleij <linus.walleij@linaro.org>
To:     Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        linux-input@vger.kernel.org
Cc:     Nikita Travkin <nikita@trvn.ru>,
        Michael Srba <Michael.Srba@seznam.cz>,
        Linus Walleij <linus.walleij@linaro.org>
Subject: [PATCH 5/5] Input: zinitix - Support calibration
Date:   Sun, 10 Apr 2022 14:00:59 +0200
Message-Id: <20220410120059.2583849-5-linus.walleij@linaro.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220410120059.2583849-1-linus.walleij@linaro.org>
References: <20220410120059.2583849-1-linus.walleij@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Support both hardware and software calibration on the Zinitix
touchscreens. This is lifted from the vendor driver but rewritten
to use the chip revision number in the hardware instead of
compile-time defines.

Use defines for the new "calibration mode" and add a new define
for the default touchpoint mode.

The registers for reading the EEPROM status actually differs
between BT5x2 and BT4x3+ so create very unique defines for
those registers and use a register variable in the state to
keep track of the right one to use.

Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
 drivers/input/touchscreen/zinitix.c | 138 ++++++++++++++++++++++++++--
 1 file changed, 132 insertions(+), 6 deletions(-)

diff --git a/drivers/input/touchscreen/zinitix.c b/drivers/input/touchscreen/zinitix.c
index ea807b972f26..440ffc7c9b32 100644
--- a/drivers/input/touchscreen/zinitix.c
+++ b/drivers/input/touchscreen/zinitix.c
@@ -34,6 +34,8 @@
 #define ZINITIX_DEBUG_REG			0x0115 /* 0~7 */
 
 #define ZINITIX_TOUCH_MODE			0x0010
+#define ZINITIX_MODE_TOUCH_POINT		0x02
+#define ZINITIX_MODE_CALIBRATION		0x07
 #define ZINITIX_CHIP_REVISION			0x0011
 #define ZINITIX_CHIP_BT404			0x4040
 #define ZINITIX_CHIP_BT532			0x5320
@@ -49,7 +51,11 @@
 
 #define ZINITIX_DATA_VERSION_REG		0x0013
 #define ZINITIX_SUPPORTED_FINGER_NUM		0x0015
-#define ZINITIX_EEPROM_INFO			0x0018
+
+#define BT4X2_EEPROM_INFO			0x0014
+#define BT4X3_EEPROM_INFO			0x0018
+#define ZINITIX_EEPROM_HW_CALIB			BIT(0)
+
 #define ZINITIX_INITIAL_TOUCH_MODE		0x0019
 
 #define ZINITIX_TOTAL_NUMBER_OF_X		0x0060
@@ -57,6 +63,8 @@
 
 #define ZINITIX_DELAY_RAW_FOR_HOST		0x007f
 
+#define BT4X2_EEPROM_INFO_REG			0x00aa
+
 #define ZINITIX_BUTTON_SUPPORTED_NUM		0x00B0
 #define ZINITIX_BUTTON_SENSITIVITY		0x00B2
 #define ZINITIX_DUMMY_BUTTON_SENSITIVITY	0X00C8
@@ -75,8 +83,6 @@
 
 #define ZINITIX_RAWDATA_REG			0x0200
 
-#define ZINITIX_EEPROM_INFO_REG			0x0018
-
 #define ZINITIX_INT_ENABLE_FLAG			0x00f0
 #define ZINITIX_PERIODICAL_INTERRUPT_INTERVAL	0x00f1
 
@@ -120,7 +126,6 @@
 #define SUB_BIT_UPDATE				BIT(4)
 #define SUB_BIT_WAIT				BIT(5)
 
-#define DEFAULT_TOUCH_POINT_MODE		2
 #define MAX_SUPPORTED_FINGER_NUM		5
 
 #define CHIP_ON_DELAY				15 // ms
@@ -153,8 +158,33 @@ struct bt541_ts_data {
 	u16 chip_revision;
 	u16 firmware_version;
 	u16 regdata_version;
+	u16 eeprom_info_reg;
 };
 
+static bool zinitix_is_4x2(struct bt541_ts_data *bt541)
+{
+	u16 ver;
+
+	/* The revision is the high nybbles so shift down */
+	ver = bt541->chip_revision >> 4;
+	/* Skip middle digit */
+	ver &= 0xf0f;
+
+	return (ver == 0x402);
+}
+
+static bool zinitix_is_4x3_and_above(struct bt541_ts_data *bt541)
+{
+	u16 ver;
+
+	/* The revision is the high nybbles so shift down */
+	ver = bt541->chip_revision >> 4;
+	/* Skip middle digit */
+	ver &= 0xf0f;
+
+	return (ver >= 0x403);
+}
+
 static int zinitix_read_data(struct i2c_client *client,
 			     u16 reg, void *values, size_t length)
 {
@@ -209,12 +239,92 @@ static u16 zinitix_get_u16_reg(struct bt541_ts_data *bt541, u16 vreg)
         return le16_to_cpu(val);
 }
 
+static int zinitix_calibrate(struct bt541_ts_data *bt541)
+{
+	struct i2c_client *client = bt541->client;
+	int maxsec = 10;
+	int error;
+	u16 val;
+
+	dev_info(bt541->dev, "HW calibration - calibrating\n");
+
+	error = zinitix_write_u16(client, ZINITIX_TOUCH_MODE,
+				  ZINITIX_MODE_CALIBRATION);
+	if (error)
+		return error;
+	error = zinitix_write_cmd(client, ZINITIX_CALIBRATE_CMD);
+	if (error)
+		return error;
+	error = zinitix_write_cmd(client, ZINITIX_SWRESET_CMD);
+	if (error)
+		return error;
+	msleep(1);
+	error = zinitix_write_cmd(client, ZINITIX_CLEAR_INT_STATUS_CMD);
+	if (error)
+		return error;
+
+	/* Wait for hardware calibration to commence */
+	do {
+		msleep(1000);
+		val = zinitix_get_u16_reg(bt541, bt541->eeprom_info_reg);
+		maxsec --;
+	} while ((val & ZINITIX_EEPROM_HW_CALIB) && maxsec);
+
+	if (!maxsec) {
+		dev_err(bt541->dev, "timeout waiting for HW calibration\n");
+		return -ETIMEDOUT;
+	}
+
+	/* Get out of calibration mode */
+	error = zinitix_write_u16(client, ZINITIX_TOUCH_MODE,
+				  bt541->zinitix_mode);
+	if (error)
+		return error;
+
+	error = zinitix_write_u16(client, ZINITIX_INT_ENABLE_FLAG, 0x0);
+	if (error)
+		return error;
+
+	msleep(10);
+
+	error = zinitix_write_cmd(client, ZINITIX_SWRESET_CMD);
+	if (error)
+		return error;
+
+	if (zinitix_is_4x3_and_above(bt541)) {
+		error = zinitix_write_cmd(client, ZINITIX_SAVE_CALIBRATION_CMD);
+		if (error)
+			return error;
+		msleep(500);
+	}
+
+	if (zinitix_is_4x2(bt541)) {
+		error = zinitix_write_cmd(client, ZINITIX_SAVE_STATUS_CMD);
+		if (error)
+			return error;
+		/* Wait for fusing EEPROM */
+		msleep(1000);
+		error = zinitix_write_cmd(client, ZINITIX_SWRESET_CMD);
+		if (error)
+			return error;
+	}
+
+	error = zinitix_write_u16(client, ZINITIX_INT_ENABLE_FLAG, 0x0);
+	if (error)
+		return error;
+
+	dev_info(bt541->dev, "HW calibration complete\n");
+
+	return 0;
+}
+
 static int zinitix_init_touch(struct bt541_ts_data *bt541)
 {
 	struct i2c_client *client = bt541->client;
 	int i;
 	int error;
 	static bool read_static = false;
+	u16 val;
 
 	error = zinitix_write_cmd(client, ZINITIX_SWRESET_CMD);
 	if (error) {
@@ -237,9 +347,20 @@ static int zinitix_init_touch(struct bt541_ts_data *bt541)
 			 "chip revision %04x firmware version %04x regdata version %04x\n",
 			 bt541->chip_revision, bt541->firmware_version,
 			 bt541->regdata_version);
+		if (zinitix_is_4x2(bt541))
+			bt541->eeprom_info_reg = BT4X2_EEPROM_INFO_REG;
+		else
+			bt541->eeprom_info_reg = BT4X3_EEPROM_INFO;
 		read_static = true;
 	}
 
+	val = zinitix_get_u16_reg(bt541, bt541->eeprom_info_reg);
+	if (val & ZINITIX_EEPROM_HW_CALIB) {
+		error = zinitix_calibrate(bt541);
+		if (error)
+			return error;
+	}
+
 	error = zinitix_write_u16(client, ZINITIX_INT_ENABLE_FLAG, 0x0);
 	if (error) {
 		dev_err(bt541->dev,
@@ -273,6 +394,11 @@ static int zinitix_init_touch(struct bt541_ts_data *bt541)
 	if (error)
 		return error;
 
+	/* Software calibration */
+	error = zinitix_write_cmd(client, ZINITIX_CALIBRATE_CMD);
+	if (error)
+		return error;
+
 	error = zinitix_write_u16(client, ZINITIX_INT_ENABLE_FLAG,
 				  BIT_PT_CNT_CHANGE | BIT_DOWN | BIT_MOVE |
 					BIT_UP);
@@ -584,10 +710,10 @@ static int zinitix_ts_probe(struct i2c_client *client)
 					 &bt541->zinitix_mode);
 	if (error < 0) {
 		/* fall back to mode 2 */
-		bt541->zinitix_mode = DEFAULT_TOUCH_POINT_MODE;
+		bt541->zinitix_mode = ZINITIX_MODE_TOUCH_POINT;
 	}
 
-	if (bt541->zinitix_mode != 2) {
+	if (bt541->zinitix_mode != ZINITIX_MODE_TOUCH_POINT) {
 		/*
 		 * If there are devices that don't support mode 2, support
 		 * for other modes (0, 1) will be needed.
-- 
2.35.1

