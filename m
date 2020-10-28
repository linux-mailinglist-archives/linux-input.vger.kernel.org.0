Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D293C29D96F
	for <lists+linux-input@lfdr.de>; Wed, 28 Oct 2020 23:55:18 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2389712AbgJ1Wyv (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 28 Oct 2020 18:54:51 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59792 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731882AbgJ1WyR (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Wed, 28 Oct 2020 18:54:17 -0400
Received: from mail-ej1-x641.google.com (mail-ej1-x641.google.com [IPv6:2a00:1450:4864:20::641])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id ABB44C0613CF
        for <linux-input@vger.kernel.org>; Wed, 28 Oct 2020 15:54:14 -0700 (PDT)
Received: by mail-ej1-x641.google.com with SMTP id s15so1200364ejf.8
        for <linux-input@vger.kernel.org>; Wed, 28 Oct 2020 15:54:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=J41W71IQ8WSj0cCZqufjh6ZHmQkGRw/0YT8/352UCGg=;
        b=a2fMGqvD/R5ExXo7ON4SNTQow6QSUXZJ0oEN74ayDLbg5utNqTPolAjE7pddYpbZSP
         f7NczRPuiC6UdRNZovCzI0x684EeBMw6LseeFtivV1OW1Z2fJlokPJdPN8gZOZ489ST5
         kEyPJOMFl4Sv47u2iFs7+oGLCuDRTR78hXZnqKlRMj2NOHwtvD0zrTfhBD9uEjRSRi/b
         wJr1k/Os2Sw/gb+3dwHuTERC3IJ/LeMimPscbDaC/6+0aDDOcZO9+Id2O9dkjkdzN6+d
         eHMonCC8G1hTf+c6rerzru+xIDq2+z9lliI8HoeStLY3ZXX58AQ3Lyk4RUsoSbwQVwGJ
         poEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=J41W71IQ8WSj0cCZqufjh6ZHmQkGRw/0YT8/352UCGg=;
        b=dX0hNM/ruLIBb7eMQ3bVS4ghRjRagl17I6cIEP+dWnLxCji24CbfTCC2NNB/a3fQgK
         vggZGastCnZPSq4tMvKJmDsd/Z1cD1HRv0zNCi2oclLE7Smd7lN6T6FXV6v2oQPhw83v
         8qWFLfrRRuN6mewNy5dVGxBRK0jPUGyXz63ok5C+AxjBgtd6iNwl2NRm0Om8zBOSCpb7
         diLxlrx7aeI5TkuyPcTy23xKdfD85ISHQZDuKZHj+LDPeX2V+jtnHBaSktf//lKmFpOL
         5w22Fahj1I33VjICU12G5zfiO14dB8jc9ostCZbro1znDu3/CH0iitV2ZU3lQPq88PU4
         3Krg==
X-Gm-Message-State: AOAM530Grtz7SU3oQ+3Bf3BM2HVfkcBKMet3v9cKCboeidnCVyWuXDl5
        KhaO35UDEtu79Mpgvq1e5tewl9qVqQx4os0w
X-Google-Smtp-Source: ABdhPJw/4cihqwk4b0ci0MVLCI/GHS4dkvEWisPNkUShxWsYG/Ue9visClupCfzthEks0JpYzP7XgQ==
X-Received: by 2002:a19:b14:: with SMTP id 20mr2693296lfl.308.1603880239749;
        Wed, 28 Oct 2020 03:17:19 -0700 (PDT)
Received: from localhost.bredbandsbolaget (c-92d7225c.014-348-6c756e10.bbcust.telenor.se. [92.34.215.146])
        by smtp.gmail.com with ESMTPSA id b12sm478741lfo.177.2020.10.28.03.17.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Oct 2020 03:17:19 -0700 (PDT)
From:   Linus Walleij <linus.walleij@linaro.org>
To:     Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        linux-input@vger.kernel.org
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Nick Dyer <nick@shmanahar.org>,
        Stephan Gerhold <stephan@gerhold.net>
Subject: [PATCH 2/2] Input: atmel_mxt_ts: Support regulator supplies
Date:   Wed, 28 Oct 2020 11:17:11 +0100
Message-Id: <20201028101711.696423-2-linus.walleij@linaro.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20201028101711.696423-1-linus.walleij@linaro.org>
References: <20201028101711.696423-1-linus.walleij@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

This adds the code for the Atmel touchscreens such as
mXT224 to obtain power regulators for the supply voltages
AVDD and VDD. On mobile phones such as Samsung GT-I8190
(Golden) this is needed to explicitly bring power online.

We just enable the regulators at probe() and disable
them at remove() or in the errorpath for now.

As regulators are naturally stubbed if not available,
this should have no impact on existing systems.

Cc: Nick Dyer <nick@shmanahar.org>
Cc: Stephan Gerhold <stephan@gerhold.net>
Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
 drivers/input/touchscreen/atmel_mxt_ts.c | 37 +++++++++++++++++++++++-
 1 file changed, 36 insertions(+), 1 deletion(-)

diff --git a/drivers/input/touchscreen/atmel_mxt_ts.c b/drivers/input/touchscreen/atmel_mxt_ts.c
index 98f17fa3a892..701269f9744f 100644
--- a/drivers/input/touchscreen/atmel_mxt_ts.c
+++ b/drivers/input/touchscreen/atmel_mxt_ts.c
@@ -24,6 +24,7 @@
 #include <linux/of.h>
 #include <linux/property.h>
 #include <linux/slab.h>
+#include <linux/regulator/consumer.h>
 #include <linux/gpio/consumer.h>
 #include <asm/unaligned.h>
 #include <media/v4l2-device.h>
@@ -309,6 +310,7 @@ struct mxt_data {
 	u8 multitouch;
 	struct t7_config t7_cfg;
 	struct mxt_dbg dbg;
+	struct regulator_bulk_data regulators[2];
 	struct gpio_desc *reset_gpio;
 	bool use_retrigen_workaround;
 
@@ -3134,6 +3136,21 @@ static int mxt_probe(struct i2c_client *client, const struct i2c_device_id *id)
 	if (error)
 		return error;
 
+	/*
+	 * VDDA is the analog voltage supply 2.57..3.47 V
+	 * VDD  is the digital voltage supply 1.71..3.47 V
+	 */
+	data->regulators[0].supply = "vdda";
+	data->regulators[1].supply = "vdd";
+	error = devm_regulator_bulk_get(&client->dev, ARRAY_SIZE(data->regulators),
+					data->regulators);
+	if (error) {
+		if (error != -EPROBE_DEFER)
+			dev_err(&client->dev, "Failed to get regulators %d\n",
+				error);
+		return error;
+	}
+
 	data->reset_gpio = devm_gpiod_get_optional(&client->dev,
 						   "reset", GPIOD_OUT_LOW);
 	if (IS_ERR(data->reset_gpio)) {
@@ -3152,6 +3169,19 @@ static int mxt_probe(struct i2c_client *client, const struct i2c_device_id *id)
 
 	disable_irq(client->irq);
 
+	error = regulator_bulk_enable(ARRAY_SIZE(data->regulators),
+				      data->regulators);
+	if (error) {
+		dev_err(&client->dev, "failed to enable regulators: %d\n",
+			error);
+		return error;
+	}
+	/*
+	 * The device takes 40ms to come up after power-on according
+	 * to the mXT224 datasheet, page 13.
+	 */
+	msleep(MXT_BACKUP_TIME);
+
 	if (data->reset_gpio) {
 		msleep(MXT_RESET_GPIO_TIME);
 		gpiod_set_value(data->reset_gpio, 1);
@@ -3160,7 +3190,7 @@ static int mxt_probe(struct i2c_client *client, const struct i2c_device_id *id)
 
 	error = mxt_initialize(data);
 	if (error)
-		return error;
+		goto err_disable_regulators;
 
 	error = sysfs_create_group(&client->dev.kobj, &mxt_attr_group);
 	if (error) {
@@ -3174,6 +3204,9 @@ static int mxt_probe(struct i2c_client *client, const struct i2c_device_id *id)
 err_free_object:
 	mxt_free_input_device(data);
 	mxt_free_object_table(data);
+err_disable_regulators:
+	regulator_bulk_disable(ARRAY_SIZE(data->regulators),
+			       data->regulators);
 	return error;
 }
 
@@ -3185,6 +3218,8 @@ static int mxt_remove(struct i2c_client *client)
 	sysfs_remove_group(&client->dev.kobj, &mxt_attr_group);
 	mxt_free_input_device(data);
 	mxt_free_object_table(data);
+	regulator_bulk_disable(ARRAY_SIZE(data->regulators),
+			       data->regulators);
 
 	return 0;
 }
-- 
2.26.2

