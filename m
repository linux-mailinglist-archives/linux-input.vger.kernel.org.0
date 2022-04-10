Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id EBF194FADBB
	for <lists+linux-input@lfdr.de>; Sun, 10 Apr 2022 14:03:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238648AbiDJMFe (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Sun, 10 Apr 2022 08:05:34 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54024 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236345AbiDJMFa (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Sun, 10 Apr 2022 08:05:30 -0400
Received: from mail-lj1-x22e.google.com (mail-lj1-x22e.google.com [IPv6:2a00:1450:4864:20::22e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A796C515A7
        for <linux-input@vger.kernel.org>; Sun, 10 Apr 2022 05:03:19 -0700 (PDT)
Received: by mail-lj1-x22e.google.com with SMTP id r2so1534376ljd.10
        for <linux-input@vger.kernel.org>; Sun, 10 Apr 2022 05:03:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=Z+hX7ZywiI6nnWAjek7vTxivDNNO4zg0+bjY8RT7gU4=;
        b=NjU5IGzBceY39DxMTrBqmYVlEuPiPVK+4AlPb0qkSAFHBoxkET2/DpNUT+MesZx0LB
         yAWi7cMX/tTqarDAwTB/EjcttM3j73EV/phL6OXBW5ZDsUMhBYi6BgnrXZGHorYf68Jb
         TeoXGsCRFpEadDc77zVDSccvTAvPDQGD+/5MWtsYKXa+aj19TOXdIxlqGhj6HWn2JXQ1
         Dh9IRXM584GbyJt6spUT3cE9yEtaZ+Or9EkMTrYUw7L7Qs+LojTQvzoaTPafuqRJG5FZ
         53rUbTSmm17Jh2lhreQK6f0HSKWCHwsDR1kM3Vy70T9NC4SqfQoX0syzDGXOIgFu9Vgc
         BK/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=Z+hX7ZywiI6nnWAjek7vTxivDNNO4zg0+bjY8RT7gU4=;
        b=Iglf1m738SGZnnmNqXSjORW9h87TIxX7I0wKlsSpf6/nyJRob+tCv47pmJnl3yXXsp
         23FYSkBXyHtZ6+M9oaOqXDVg+L+SNA0Do+ftq4IQNBSGEy8gAONMKy2bzWJd51/T3xDt
         86cTcsrofPi2zJ3q5RSz4BSRjOHujzIUkHhubEuDakQPtGKkLQWYcFjlFC92URWOYEjp
         VxSObEIIPzvgWw5LKPSFC4U2efMUCRj0hM+8WLuMvdFLVjgmi2iq6kw4L/JO9yLxnyja
         Q8Ri3FSCl6jTlRo4Rirel2yTiyzjFwPQOU65l4/oU/pZRGxdC5diQRtC9oW54bL1MSQA
         I8HQ==
X-Gm-Message-State: AOAM533mKjYRXGhKNhE8QnQCTNNaYfmmE8MgOCbTXdRDLucFB8J/Wbso
        79oyTSn4chcuMN79dH8P6S6AFA==
X-Google-Smtp-Source: ABdhPJzLkI3aBdeP9HK7BjiLQ1/7oLBz10JaOjqRqYIN6dUlFt7Bw+3IGYEJOF8B4vYHDxo0Ugq0MQ==
X-Received: by 2002:a2e:b6c3:0:b0:249:9b61:656f with SMTP id m3-20020a2eb6c3000000b002499b61656fmr17173390ljo.266.1649592197847;
        Sun, 10 Apr 2022 05:03:17 -0700 (PDT)
Received: from localhost.localdomain (c-fdcc225c.014-348-6c756e10.bbcust.telenor.se. [92.34.204.253])
        by smtp.gmail.com with ESMTPSA id s10-20020a19ad4a000000b0044826a25a2esm2992216lfd.292.2022.04.10.05.03.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 10 Apr 2022 05:03:17 -0700 (PDT)
From:   Linus Walleij <linus.walleij@linaro.org>
To:     Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        linux-input@vger.kernel.org
Cc:     Nikita Travkin <nikita@trvn.ru>,
        Michael Srba <Michael.Srba@seznam.cz>,
        Linus Walleij <linus.walleij@linaro.org>
Subject: [PATCH 3/5] Input: zinitix - Rename defines ZINITIX_*
Date:   Sun, 10 Apr 2022 14:00:57 +0200
Message-Id: <20220410120059.2583849-3-linus.walleij@linaro.org>
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

The defines are sometimes named BT541_* and sometimes
ZINITIX_*, name them all ZINITIX_* because they certainly
apply to a lot more touchscreens than the BT541.

Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
 drivers/input/touchscreen/zinitix.c | 112 ++++++++++++++--------------
 1 file changed, 56 insertions(+), 56 deletions(-)

diff --git a/drivers/input/touchscreen/zinitix.c b/drivers/input/touchscreen/zinitix.c
index 11af1264cafa..f89dea49cf1f 100644
--- a/drivers/input/touchscreen/zinitix.c
+++ b/drivers/input/touchscreen/zinitix.c
@@ -15,75 +15,75 @@
 
 /* Register Map */
 
-#define BT541_SWRESET_CMD			0x0000
-#define BT541_WAKEUP_CMD			0x0001
+#define ZINITIX_SWRESET_CMD			0x0000
+#define ZINITIX_WAKEUP_CMD			0x0001
 
-#define BT541_IDLE_CMD				0x0004
-#define BT541_SLEEP_CMD				0x0005
+#define ZINITIX_IDLE_CMD			0x0004
+#define ZINITIX_SLEEP_CMD			0x0005
 
-#define BT541_CLEAR_INT_STATUS_CMD		0x0003
-#define BT541_CALIBRATE_CMD			0x0006
-#define BT541_SAVE_STATUS_CMD			0x0007
-#define BT541_SAVE_CALIBRATION_CMD		0x0008
-#define BT541_RECALL_FACTORY_CMD		0x000f
+#define ZINITIX_CLEAR_INT_STATUS_CMD		0x0003
+#define ZINITIX_CALIBRATE_CMD			0x0006
+#define ZINITIX_SAVE_STATUS_CMD			0x0007
+#define ZINITIX_SAVE_CALIBRATION_CMD		0x0008
+#define ZINITIX_RECALL_FACTORY_CMD		0x000f
 
-#define BT541_THRESHOLD				0x0020
+#define ZINITIX_THRESHOLD			0x0020
 
-#define BT541_LARGE_PALM_REJECT_AREA_TH		0x003F
+#define ZINITIX_LARGE_PALM_REJECT_AREA_TH	0x003F
 
-#define BT541_DEBUG_REG				0x0115 /* 0~7 */
+#define ZINITIX_DEBUG_REG			0x0115 /* 0~7 */
 
-#define BT541_TOUCH_MODE			0x0010
-#define BT541_CHIP_REVISION			0x0011
-#define BT541_FIRMWARE_VERSION			0x0012
+#define ZINITIX_TOUCH_MODE			0x0010
+#define ZINITIX_CHIP_REVISION			0x0011
+#define ZINITIX_FIRMWARE_VERSION		0x0012
 
 #define ZINITIX_USB_DETECT			0x116
 
-#define BT541_MINOR_FW_VERSION			0x0121
+#define ZINITIX_MINOR_FW_VERSION		0x0121
 
-#define BT541_VENDOR_ID				0x001C
-#define BT541_HW_ID				0x0014
+#define ZINITIX_VENDOR_ID			0x001C
+#define ZINITIX_HW_ID				0x0014
 
-#define BT541_DATA_VERSION_REG			0x0013
-#define BT541_SUPPORTED_FINGER_NUM		0x0015
-#define BT541_EEPROM_INFO			0x0018
-#define BT541_INITIAL_TOUCH_MODE		0x0019
+#define ZINITIX_DATA_VERSION_REG		0x0013
+#define ZINITIX_SUPPORTED_FINGER_NUM		0x0015
+#define ZINITIX_EEPROM_INFO			0x0018
+#define ZINITIX_INITIAL_TOUCH_MODE		0x0019
 
-#define BT541_TOTAL_NUMBER_OF_X			0x0060
-#define BT541_TOTAL_NUMBER_OF_Y			0x0061
+#define ZINITIX_TOTAL_NUMBER_OF_X		0x0060
+#define ZINITIX_TOTAL_NUMBER_OF_Y		0x0061
 
-#define BT541_DELAY_RAW_FOR_HOST		0x007f
+#define ZINITIX_DELAY_RAW_FOR_HOST		0x007f
 
-#define BT541_BUTTON_SUPPORTED_NUM		0x00B0
-#define BT541_BUTTON_SENSITIVITY		0x00B2
-#define BT541_DUMMY_BUTTON_SENSITIVITY		0X00C8
+#define ZINITIX_BUTTON_SUPPORTED_NUM		0x00B0
+#define ZINITIX_BUTTON_SENSITIVITY		0x00B2
+#define ZINITIX_DUMMY_BUTTON_SENSITIVITY	0X00C8
 
-#define BT541_X_RESOLUTION			0x00C0
-#define BT541_Y_RESOLUTION			0x00C1
+#define ZINITIX_X_RESOLUTION			0x00C0
+#define ZINITIX_Y_RESOLUTION			0x00C1
 
-#define BT541_POINT_STATUS_REG			0x0080
-#define BT541_ICON_STATUS_REG			0x00AA
+#define ZINITIX_POINT_STATUS_REG		0x0080
+#define ZINITIX_ICON_STATUS_REG			0x00AA
 
-#define BT541_POINT_COORD_REG			(BT541_POINT_STATUS_REG + 2)
+#define ZINITIX_POINT_COORD_REG			(ZINITIX_POINT_STATUS_REG + 2)
 
-#define BT541_AFE_FREQUENCY			0x0100
-#define BT541_DND_N_COUNT			0x0122
-#define BT541_DND_U_COUNT			0x0135
+#define ZINITIX_AFE_FREQUENCY			0x0100
+#define ZINITIX_DND_N_COUNT			0x0122
+#define ZINITIX_DND_U_COUNT			0x0135
 
-#define BT541_RAWDATA_REG			0x0200
+#define ZINITIX_RAWDATA_REG			0x0200
 
-#define BT541_EEPROM_INFO_REG			0x0018
+#define ZINITIX_EEPROM_INFO_REG			0x0018
 
-#define BT541_INT_ENABLE_FLAG			0x00f0
-#define BT541_PERIODICAL_INTERRUPT_INTERVAL	0x00f1
+#define ZINITIX_INT_ENABLE_FLAG			0x00f0
+#define ZINITIX_PERIODICAL_INTERRUPT_INTERVAL	0x00f1
 
-#define BT541_BTN_WIDTH				0x016d
+#define ZINITIX_BTN_WIDTH			0x016d
 
-#define BT541_CHECKSUM_RESULT			0x012c
+#define ZINITIX_CHECKSUM_RESULT			0x012c
 
-#define BT541_INIT_FLASH			0x01d0
-#define BT541_WRITE_FLASH			0x01d1
-#define BT541_READ_FLASH			0x01d2
+#define ZINITIX_INIT_FLASH			0x01d0
+#define ZINITIX_WRITE_FLASH			0x01d1
+#define ZINITIX_READ_FLASH			0x01d2
 
 #define ZINITIX_INTERNAL_FLAG_02		0x011e
 #define ZINITIX_INTERNAL_FLAG_03		0x011f
@@ -197,13 +197,13 @@ static int zinitix_init_touch(struct bt541_ts_data *bt541)
 	int i;
 	int error;
 
-	error = zinitix_write_cmd(client, BT541_SWRESET_CMD);
+	error = zinitix_write_cmd(client, ZINITIX_SWRESET_CMD);
 	if (error) {
 		dev_err(bt541->dev, "Failed to write reset command\n");
 		return error;
 	}
 
-	error = zinitix_write_u16(client, BT541_INT_ENABLE_FLAG, 0x0);
+	error = zinitix_write_u16(client, ZINITIX_INT_ENABLE_FLAG, 0x0);
 	if (error) {
 		dev_err(bt541->dev,
 			"Failed to reset interrupt enable flag\n");
@@ -211,32 +211,32 @@ static int zinitix_init_touch(struct bt541_ts_data *bt541)
 	}
 
 	/* initialize */
-	error = zinitix_write_u16(client, BT541_X_RESOLUTION,
+	error = zinitix_write_u16(client, ZINITIX_X_RESOLUTION,
 				  bt541->prop.max_x);
 	if (error)
 		return error;
 
-	error = zinitix_write_u16(client, BT541_Y_RESOLUTION,
+	error = zinitix_write_u16(client, ZINITIX_Y_RESOLUTION,
 				  bt541->prop.max_y);
 	if (error)
 		return error;
 
-	error = zinitix_write_u16(client, BT541_SUPPORTED_FINGER_NUM,
+	error = zinitix_write_u16(client, ZINITIX_SUPPORTED_FINGER_NUM,
 				  MAX_SUPPORTED_FINGER_NUM);
 	if (error)
 		return error;
 
-	error = zinitix_write_u16(client, BT541_INITIAL_TOUCH_MODE,
+	error = zinitix_write_u16(client, ZINITIX_INITIAL_TOUCH_MODE,
 				  bt541->zinitix_mode);
 	if (error)
 		return error;
 
-	error = zinitix_write_u16(client, BT541_TOUCH_MODE,
+	error = zinitix_write_u16(client, ZINITIX_TOUCH_MODE,
 				  bt541->zinitix_mode);
 	if (error)
 		return error;
 
-	error = zinitix_write_u16(client, BT541_INT_ENABLE_FLAG,
+	error = zinitix_write_u16(client, ZINITIX_INT_ENABLE_FLAG,
 				  BIT_PT_CNT_CHANGE | BIT_DOWN | BIT_MOVE |
 					BIT_UP);
 	if (error)
@@ -244,7 +244,7 @@ static int zinitix_init_touch(struct bt541_ts_data *bt541)
 
 	/* clear queue */
 	for (i = 0; i < 10; i++) {
-		zinitix_write_cmd(client, BT541_CLEAR_INT_STATUS_CMD);
+		zinitix_write_cmd(client, ZINITIX_CLEAR_INT_STATUS_CMD);
 		udelay(10);
 	}
 
@@ -361,7 +361,7 @@ static irqreturn_t zinitix_ts_irq_handler(int irq, void *bt541_handler)
 
 	memset(&touch_event, 0, sizeof(struct touch_event));
 
-	error = zinitix_read_data(bt541->client, BT541_POINT_STATUS_REG,
+	error = zinitix_read_data(bt541->client, ZINITIX_POINT_STATUS_REG,
 				  &touch_event, sizeof(struct touch_event));
 	if (error) {
 		dev_err(bt541->dev, "Failed to read in touchpoint struct\n");
@@ -381,7 +381,7 @@ static irqreturn_t zinitix_ts_irq_handler(int irq, void *bt541_handler)
 	input_sync(bt541->input_dev);
 
 out:
-	zinitix_write_cmd(bt541->client, BT541_CLEAR_INT_STATUS_CMD);
+	zinitix_write_cmd(bt541->client, ZINITIX_CLEAR_INT_STATUS_CMD);
 	return IRQ_HANDLED;
 }
 
-- 
2.35.1

