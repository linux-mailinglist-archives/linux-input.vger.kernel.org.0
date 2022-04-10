Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id DE1D04FADBA
	for <lists+linux-input@lfdr.de>; Sun, 10 Apr 2022 14:03:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235725AbiDJMF3 (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Sun, 10 Apr 2022 08:05:29 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54012 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230125AbiDJMF3 (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Sun, 10 Apr 2022 08:05:29 -0400
Received: from mail-lj1-x233.google.com (mail-lj1-x233.google.com [IPv6:2a00:1450:4864:20::233])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6936F515A3
        for <linux-input@vger.kernel.org>; Sun, 10 Apr 2022 05:03:18 -0700 (PDT)
Received: by mail-lj1-x233.google.com with SMTP id u19so7270825ljd.11
        for <linux-input@vger.kernel.org>; Sun, 10 Apr 2022 05:03:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=V+q1j/OTIHZ45TDEMMRT3/8gIJnTLMHDNQ2Nn92NyME=;
        b=xdwjebIzYJKPx0dK2sBRCqpQQr96syrmCWHSogYEaPUG0GzUqR2HvGXfSzdoazuEm2
         3blyi4lme1R8lHuBawWdH/ohaPJ3pTb+rLzBKCY3gd5UZZ5U7NjzualRU8H8yWSd9KaT
         cJA80rj+KDd/mvOstcwvFNrBbzS5skfnalkBMCRacoal4o5uIGoDVOpM52qskQDYRBFR
         A0brEZLjcOqdvrHjYGO1hAcY0oqbkQ5DlprG/cylvkYEmUKxjKIIEILhg4wg2XecGCwh
         AsZzHFMMldrbNfTZhYll4VyElE0e5N29bRPhpSnm+hQvarzPRlkx1JpnyeigfsrPPh98
         L3gw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=V+q1j/OTIHZ45TDEMMRT3/8gIJnTLMHDNQ2Nn92NyME=;
        b=VtgnbzRrz9I/gL1uwefycvVxgCDe830gAfN5Wqp2o1CEQzJQVB5fb+bOR2+Dwvt3vD
         DSDMsEcBWjoY8M70YiL26pivWDLEwq68qkMC336EnDeMvCbRMceOttCLNK0EPyXWZGLc
         KhLc9Q76jQ5rvZicPTIwaVI6XmCFnEQrV4rvMRtleM/gmXqDNJ94IGv23v0SLdexulny
         SwaOhyew0nLeKTAXLeVYRSNhkiUFfnURx9KnGKNZvHgngaMdm1i86tcmBoWLBzeuperY
         60Q8VM9+BpfV7W0fS94FWgsPdqIicsMHbBnd4EpK0sHYft+TLOx+Ic9fKletVT/9UIkU
         fKJg==
X-Gm-Message-State: AOAM53149tUoJQqL+BvWJ+W3NALUVhOebyPiSbXOsEp6JsVlm1YGaPjV
        eFBNzsSV4pkAlFtMb0A8OPQMuQ==
X-Google-Smtp-Source: ABdhPJy03EF/yESnInxHlyQVeSvg+97UiXsxhuZPBCd/RoZUs1wLXSBQe+4loQVKiHGDAeCW4zZ+uw==
X-Received: by 2002:a2e:b70b:0:b0:24b:62fa:91b6 with SMTP id j11-20020a2eb70b000000b0024b62fa91b6mr362548ljo.288.1649592196484;
        Sun, 10 Apr 2022 05:03:16 -0700 (PDT)
Received: from localhost.localdomain (c-fdcc225c.014-348-6c756e10.bbcust.telenor.se. [92.34.204.253])
        by smtp.gmail.com with ESMTPSA id s10-20020a19ad4a000000b0044826a25a2esm2992216lfd.292.2022.04.10.05.03.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 10 Apr 2022 05:03:16 -0700 (PDT)
From:   Linus Walleij <linus.walleij@linaro.org>
To:     Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        linux-input@vger.kernel.org
Cc:     Nikita Travkin <nikita@trvn.ru>,
        Michael Srba <Michael.Srba@seznam.cz>,
        Linus Walleij <linus.walleij@linaro.org>
Subject: [PATCH 2/5] Input: zinitix - Add dev variable in state
Date:   Sun, 10 Apr 2022 14:00:56 +0200
Message-Id: <20220410120059.2583849-2-linus.walleij@linaro.org>
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

To avoid several steps of dereferencing the struct device from
the client, add a struct device *dev pointer to the state
container so we can easily get to the struct device. This makes
the code more compact and easier to read.

Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
 drivers/input/touchscreen/zinitix.c | 37 +++++++++++++++--------------
 1 file changed, 19 insertions(+), 18 deletions(-)

diff --git a/drivers/input/touchscreen/zinitix.c b/drivers/input/touchscreen/zinitix.c
index cd13075ae3ab..11af1264cafa 100644
--- a/drivers/input/touchscreen/zinitix.c
+++ b/drivers/input/touchscreen/zinitix.c
@@ -142,6 +142,7 @@ struct touch_event {
 
 struct bt541_ts_data {
 	struct i2c_client *client;
+	struct device *dev;
 	struct input_dev *input_dev;
 	struct touchscreen_properties prop;
 	struct regulator_bulk_data supplies[2];
@@ -198,13 +199,13 @@ static int zinitix_init_touch(struct bt541_ts_data *bt541)
 
 	error = zinitix_write_cmd(client, BT541_SWRESET_CMD);
 	if (error) {
-		dev_err(&client->dev, "Failed to write reset command\n");
+		dev_err(bt541->dev, "Failed to write reset command\n");
 		return error;
 	}
 
 	error = zinitix_write_u16(client, BT541_INT_ENABLE_FLAG, 0x0);
 	if (error) {
-		dev_err(&client->dev,
+		dev_err(bt541->dev,
 			"Failed to reset interrupt enable flag\n");
 		return error;
 	}
@@ -252,7 +253,7 @@ static int zinitix_init_touch(struct bt541_ts_data *bt541)
 
 static int zinitix_init_regulators(struct bt541_ts_data *bt541)
 {
-	struct device *dev = &bt541->client->dev;
+	struct device *dev = bt541->dev;
 	int error;
 
 	/*
@@ -286,7 +287,7 @@ static int zinitix_send_power_on_sequence(struct bt541_ts_data *bt541)
 
 	error = zinitix_write_u16(client, 0xc000, 0x0001);
 	if (error) {
-		dev_err(&client->dev,
+		dev_err(bt541->dev,
 			"Failed to send power sequence(vendor cmd enable)\n");
 		return error;
 	}
@@ -294,7 +295,7 @@ static int zinitix_send_power_on_sequence(struct bt541_ts_data *bt541)
 
 	error = zinitix_write_cmd(client, 0xc004);
 	if (error) {
-		dev_err(&client->dev,
+		dev_err(bt541->dev,
 			"Failed to send power sequence (intn clear)\n");
 		return error;
 	}
@@ -302,7 +303,7 @@ static int zinitix_send_power_on_sequence(struct bt541_ts_data *bt541)
 
 	error = zinitix_write_u16(client, 0xc002, 0x0001);
 	if (error) {
-		dev_err(&client->dev,
+		dev_err(bt541->dev,
 			"Failed to send power sequence (nvm init)\n");
 		return error;
 	}
@@ -310,7 +311,7 @@ static int zinitix_send_power_on_sequence(struct bt541_ts_data *bt541)
 
 	error = zinitix_write_u16(client, 0xc001, 0x0001);
 	if (error) {
-		dev_err(&client->dev,
+		dev_err(bt541->dev,
 			"Failed to send power sequence (program start)\n");
 		return error;
 	}
@@ -353,7 +354,6 @@ static void zinitix_report_finger(struct bt541_ts_data *bt541, int slot,
 static irqreturn_t zinitix_ts_irq_handler(int irq, void *bt541_handler)
 {
 	struct bt541_ts_data *bt541 = bt541_handler;
-	struct i2c_client *client = bt541->client;
 	struct touch_event touch_event;
 	unsigned long finger_mask;
 	int error;
@@ -364,7 +364,7 @@ static irqreturn_t zinitix_ts_irq_handler(int irq, void *bt541_handler)
 	error = zinitix_read_data(bt541->client, BT541_POINT_STATUS_REG,
 				  &touch_event, sizeof(struct touch_event));
 	if (error) {
-		dev_err(&client->dev, "Failed to read in touchpoint struct\n");
+		dev_err(bt541->dev, "Failed to read in touchpoint struct\n");
 		goto out;
 	}
 
@@ -392,7 +392,7 @@ static int zinitix_start(struct bt541_ts_data *bt541)
 	error = regulator_bulk_enable(ARRAY_SIZE(bt541->supplies),
 				      bt541->supplies);
 	if (error) {
-		dev_err(&bt541->client->dev,
+		dev_err(bt541->dev,
 			"Failed to enable regulators: %d\n", error);
 		return error;
 	}
@@ -401,14 +401,14 @@ static int zinitix_start(struct bt541_ts_data *bt541)
 
 	error = zinitix_send_power_on_sequence(bt541);
 	if (error) {
-		dev_err(&bt541->client->dev,
+		dev_err(bt541->dev,
 			"Error while sending power-on sequence: %d\n", error);
 		return error;
 	}
 
 	error = zinitix_init_touch(bt541);
 	if (error) {
-		dev_err(&bt541->client->dev,
+		dev_err(bt541->dev,
 			"Error while configuring touch IC\n");
 		return error;
 	}
@@ -427,7 +427,7 @@ static int zinitix_stop(struct bt541_ts_data *bt541)
 	error = regulator_bulk_disable(ARRAY_SIZE(bt541->supplies),
 				       bt541->supplies);
 	if (error) {
-		dev_err(&bt541->client->dev,
+		dev_err(bt541->dev,
 			"Failed to disable regulators: %d\n", error);
 		return error;
 	}
@@ -454,9 +454,9 @@ static int zinitix_init_input_dev(struct bt541_ts_data *bt541)
 	struct input_dev *input_dev;
 	int error;
 
-	input_dev = devm_input_allocate_device(&bt541->client->dev);
+	input_dev = devm_input_allocate_device(bt541->dev);
 	if (!input_dev) {
-		dev_err(&bt541->client->dev,
+		dev_err(bt541->dev,
 			"Failed to allocate input device.");
 		return -ENOMEM;
 	}
@@ -477,7 +477,7 @@ static int zinitix_init_input_dev(struct bt541_ts_data *bt541)
 
 	touchscreen_parse_properties(input_dev, true, &bt541->prop);
 	if (!bt541->prop.max_x || !bt541->prop.max_y) {
-		dev_err(&bt541->client->dev,
+		dev_err(bt541->dev,
 			"Touchscreen-size-x and/or touchscreen-size-y not set in dts\n");
 		return -EINVAL;
 	}
@@ -485,14 +485,14 @@ static int zinitix_init_input_dev(struct bt541_ts_data *bt541)
 	error = input_mt_init_slots(input_dev, MAX_SUPPORTED_FINGER_NUM,
 				    INPUT_MT_DIRECT | INPUT_MT_DROP_UNUSED);
 	if (error) {
-		dev_err(&bt541->client->dev,
+		dev_err(bt541->dev,
 			"Failed to initialize MT slots: %d", error);
 		return error;
 	}
 
 	error = input_register_device(input_dev);
 	if (error) {
-		dev_err(&bt541->client->dev,
+		dev_err(bt541->dev,
 			"Failed to register input device: %d", error);
 		return error;
 	}
@@ -517,6 +517,7 @@ static int zinitix_ts_probe(struct i2c_client *client)
 		return -ENOMEM;
 
 	bt541->client = client;
+	bt541->dev = dev;
 	i2c_set_clientdata(client, bt541);
 
 	error = zinitix_init_regulators(bt541);
-- 
2.35.1

