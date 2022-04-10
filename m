Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8919F4FADB9
	for <lists+linux-input@lfdr.de>; Sun, 10 Apr 2022 14:03:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235668AbiDJMFQ (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Sun, 10 Apr 2022 08:05:16 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53964 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230125AbiDJMFQ (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Sun, 10 Apr 2022 08:05:16 -0400
Received: from mail-lj1-x22a.google.com (mail-lj1-x22a.google.com [IPv6:2a00:1450:4864:20::22a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 99CE3515A3
        for <linux-input@vger.kernel.org>; Sun, 10 Apr 2022 05:03:05 -0700 (PDT)
Received: by mail-lj1-x22a.google.com with SMTP id o16so10989425ljp.3
        for <linux-input@vger.kernel.org>; Sun, 10 Apr 2022 05:03:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=lzK5d2lY8VIogMRp4Vbt/no5kR/b2VMZcJXJLKKMdRg=;
        b=IRNqNpBt3n6AMPapGV/3wMTwWcEE5UcsvNi43toOSopVRj0gU49PWiYv6Lhnk/XD5X
         zuKnUomRc+yz4m5NWHgWyKMqTyi5KsAGdg2XPVW6M1iSmtm5ecRGbZvjUAquvSDkr5eg
         /xDXbBBYAbx8x5TAaeoaXyDPJ9QSUh6c7urk8GRbNHytIfLvEz018z5uuGns6w7YkFa1
         ONu8xqc1ZKayOOP4Sv2UneJy4l/7dpDQWDXtySIcp8FSauD0KNDWpHyz2nrSpuXhl8Ie
         0rw4CIsxKKRFAnsMH7gkIlqfcpYhlvzdDEgNT4fFKVtJrVJScC0GrZmgpfZSOngs0ZGS
         kpBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=lzK5d2lY8VIogMRp4Vbt/no5kR/b2VMZcJXJLKKMdRg=;
        b=xOm37hkgFm8fVJJN2UqfKnKd/aHHAPNIUnuvYusxCQWnk/sJmSXXX3ICd/q/zA8Do5
         /2KmQzN+NA+XpNY9zbfUvDDwFwtJCicN/SiP762kNPVE+toDac2vgFiGXTfGjjOXiSwD
         XKvKHkxsbIQ+e8ftBaz1WOd38i4xqhUS6E+225+3ZPtyyOyuOTI4/CqLc0Wiip4jiQWs
         U86dfW05B8vc49yJn1MZ3xECeIteDKiJ/PWcXgCx8pbd/7aZN+8qzpHfX/LG24rznxfu
         Y1Fk4nwrP5EwDuCYjcE56uyA+yHsksbJ3xyWRR74lwcCzTIMnw9IHItzby6PDSX2CBpt
         t18w==
X-Gm-Message-State: AOAM532OQyeo8VC4/b4fJNB97Zhca5O0X2iGE+BRCnb7ykQpq/IdtSD8
        aF6bg6n6wCWlAHLZ+jpKogzwmA==
X-Google-Smtp-Source: ABdhPJwXT1tH0UgUs2X4ONgLS0+3Hpja7xrcULfUOky5WlgegLMdQmrMO4qwSUTQSQJf9dPdFgKeYA==
X-Received: by 2002:a2e:9348:0:b0:249:7117:b7ad with SMTP id m8-20020a2e9348000000b002497117b7admr16860731ljh.85.1649592183508;
        Sun, 10 Apr 2022 05:03:03 -0700 (PDT)
Received: from localhost.localdomain (c-fdcc225c.014-348-6c756e10.bbcust.telenor.se. [92.34.204.253])
        by smtp.gmail.com with ESMTPSA id s10-20020a19ad4a000000b0044826a25a2esm2992216lfd.292.2022.04.10.05.03.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 10 Apr 2022 05:03:02 -0700 (PDT)
From:   Linus Walleij <linus.walleij@linaro.org>
To:     Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        linux-input@vger.kernel.org
Cc:     Nikita Travkin <nikita@trvn.ru>,
        Michael Srba <Michael.Srba@seznam.cz>,
        Linus Walleij <linus.walleij@linaro.org>
Subject: [PATCH 1/5] Input: zinitix - Helper dev variable in probe()
Date:   Sun, 10 Apr 2022 14:00:55 +0200
Message-Id: <20220410120059.2583849-1-linus.walleij@linaro.org>
X-Mailer: git-send-email 2.35.1
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

Create a helper variable struct device *dev in probe() to
make the code more compact and easier to read.

Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
 drivers/input/touchscreen/zinitix.c | 17 +++++++++--------
 1 file changed, 9 insertions(+), 8 deletions(-)

diff --git a/drivers/input/touchscreen/zinitix.c b/drivers/input/touchscreen/zinitix.c
index 8bd03278ad9a..cd13075ae3ab 100644
--- a/drivers/input/touchscreen/zinitix.c
+++ b/drivers/input/touchscreen/zinitix.c
@@ -503,15 +503,16 @@ static int zinitix_init_input_dev(struct bt541_ts_data *bt541)
 static int zinitix_ts_probe(struct i2c_client *client)
 {
 	struct bt541_ts_data *bt541;
+	struct device *dev = &client->dev;
 	int error;
 
 	if (!i2c_check_functionality(client->adapter, I2C_FUNC_I2C)) {
-		dev_err(&client->dev,
+		dev_err(dev,
 			"Failed to assert adapter's support for plain I2C.\n");
 		return -ENXIO;
 	}
 
-	bt541 = devm_kzalloc(&client->dev, sizeof(*bt541), GFP_KERNEL);
+	bt541 = devm_kzalloc(dev, sizeof(*bt541), GFP_KERNEL);
 	if (!bt541)
 		return -ENOMEM;
 
@@ -520,28 +521,28 @@ static int zinitix_ts_probe(struct i2c_client *client)
 
 	error = zinitix_init_regulators(bt541);
 	if (error) {
-		dev_err(&client->dev,
+		dev_err(dev,
 			"Failed to initialize regulators: %d\n", error);
 		return error;
 	}
 
-	error = devm_request_threaded_irq(&client->dev, client->irq,
+	error = devm_request_threaded_irq(dev, client->irq,
 					  NULL, zinitix_ts_irq_handler,
 					  IRQF_ONESHOT | IRQF_NO_AUTOEN,
 					  client->name, bt541);
 	if (error) {
-		dev_err(&client->dev, "Failed to request IRQ: %d\n", error);
+		dev_err(dev, "Failed to request IRQ: %d\n", error);
 		return error;
 	}
 
 	error = zinitix_init_input_dev(bt541);
 	if (error) {
-		dev_err(&client->dev,
+		dev_err(dev,
 			"Failed to initialize input device: %d\n", error);
 		return error;
 	}
 
-	error = device_property_read_u32(&client->dev, "zinitix,mode",
+	error = device_property_read_u32(dev, "zinitix,mode",
 					 &bt541->zinitix_mode);
 	if (error < 0) {
 		/* fall back to mode 2 */
@@ -553,7 +554,7 @@ static int zinitix_ts_probe(struct i2c_client *client)
 		 * If there are devices that don't support mode 2, support
 		 * for other modes (0, 1) will be needed.
 		 */
-		dev_err(&client->dev,
+		dev_err(dev,
 			"Malformed zinitix,mode property, must be 2 (supplied: %d)\n",
 			bt541->zinitix_mode);
 		return -EINVAL;
-- 
2.35.1

