Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9EAB72A67AF
	for <lists+linux-input@lfdr.de>; Wed,  4 Nov 2020 16:30:49 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730001AbgKDPaq (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 4 Nov 2020 10:30:46 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55344 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726919AbgKDPaq (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Wed, 4 Nov 2020 10:30:46 -0500
Received: from mail-lf1-x143.google.com (mail-lf1-x143.google.com [IPv6:2a00:1450:4864:20::143])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 86A1CC0613D3
        for <linux-input@vger.kernel.org>; Wed,  4 Nov 2020 07:30:45 -0800 (PST)
Received: by mail-lf1-x143.google.com with SMTP id 126so27640131lfi.8
        for <linux-input@vger.kernel.org>; Wed, 04 Nov 2020 07:30:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=vJ6ztVVBRZ16uubquzSyqQMF+41h20JXH1K/EAQ8XR8=;
        b=aFqLXMtOp/aZcVBxAO2hTADOyF8hDQKgYCgjygp441e/DpdlMfqEj4l+jOW8ESpkEe
         CDMQJuDWcOhqH5hB2f3xM8Jl0gq11EqdzPvy5L5OY/8HsopBql0ZV5fwZ7FlN7EDmQ3w
         8is5XgP9Ly7PkZoMMsP7nhfIxQxrScFrs2uVA5ONV5RFBHni2LScNrnzqDPNCZTdNU5f
         EOPsywP4sioUzkUPTMDGFUqdd/XEu4RvHq/I/0Oq+zJq/xpfh3WUoQaqkH0102g02HVh
         5PvjQ3hOE7FbB+W4GKmVz78KD9T6HVjRyX4twh9d71n1JmexkXdt9cMvC21OAs+zaxW0
         qIhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=vJ6ztVVBRZ16uubquzSyqQMF+41h20JXH1K/EAQ8XR8=;
        b=FV/s3khpIh+gIkIRE3q54vtn8dAaEwaDaKbgy4OAQM4F0CZBV4q/fxmRhDynu9HQ3I
         VyCRtpQiyEiYFR87arSIIK84h7fReQNuLQvIZInNHPYBcq2IHMAQfTgtF1TYZc1uWaxd
         3HSfHSmaGkEMnbZwtlb0Gn9aKiS+a/znQEXMJurHSN6QGZiBtLlUA91Hf5e5ubfa+VU1
         xFGcldVBiHDY4azrS6tP9gIe6T2NUE859LZtoxdOo6x3g8Itn2vFCrTwmlvRFLre+8PY
         gtdyRmjO0nRtfEmp/xLp9mL0MPNGGtk7LIO71vfzs6IOstxjRRO9eVZqZUS6f+AoQOKi
         RXzQ==
X-Gm-Message-State: AOAM5323fgo3zUQZvz57ZL/+zdOjCFzXAZR8Ah7VXSBH9bMPlnFVzOmb
        VW2s2XjHOaV1w8VyaO7e+B1KNw==
X-Google-Smtp-Source: ABdhPJzGW3+1FlSbRvfqgXmWj+kd1i/bnRjfpcYviiI+TpsZqc7cj8HG31LgQ7PXmSkmXl04bilShw==
X-Received: by 2002:a19:5f5c:: with SMTP id a28mr9442210lfj.434.1604503843933;
        Wed, 04 Nov 2020 07:30:43 -0800 (PST)
Received: from localhost.bredbandsbolaget (c-92d7225c.014-348-6c756e10.bbcust.telenor.se. [92.34.215.146])
        by smtp.gmail.com with ESMTPSA id c131sm440453lfg.110.2020.11.04.07.30.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Nov 2020 07:30:43 -0800 (PST)
From:   Linus Walleij <linus.walleij@linaro.org>
To:     Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        linux-input@vger.kernel.org
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Nick Dyer <nick@shmanahar.org>,
        Stephan Gerhold <stephan@gerhold.net>
Subject: [PATCH 3/3 v2] Input: atmel_mxt_ts - Support regulator supplies
Date:   Wed,  4 Nov 2020 16:30:32 +0100
Message-Id: <20201104153032.1387747-3-linus.walleij@linaro.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20201104153032.1387747-1-linus.walleij@linaro.org>
References: <20201104153032.1387747-1-linus.walleij@linaro.org>
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
ChangeLog v1->v2:
- Resend with the other changes.
---
 drivers/input/touchscreen/atmel_mxt_ts.c | 37 +++++++++++++++++++++++-
 1 file changed, 36 insertions(+), 1 deletion(-)

diff --git a/drivers/input/touchscreen/atmel_mxt_ts.c b/drivers/input/touchscreen/atmel_mxt_ts.c
index ef7915400c9f..e34984388791 100644
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
 	/* Request the RESET line as asserted so we go into reset */
 	data->reset_gpio = devm_gpiod_get_optional(&client->dev,
 						   "reset", GPIOD_OUT_HIGH);
@@ -3153,6 +3170,19 @@ static int mxt_probe(struct i2c_client *client, const struct i2c_device_id *id)
 
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
 		/* Wait a while and then de-assert the RESET GPIO line */
 		msleep(MXT_RESET_GPIO_TIME);
@@ -3162,7 +3192,7 @@ static int mxt_probe(struct i2c_client *client, const struct i2c_device_id *id)
 
 	error = mxt_initialize(data);
 	if (error)
-		return error;
+		goto err_disable_regulators;
 
 	error = sysfs_create_group(&client->dev.kobj, &mxt_attr_group);
 	if (error) {
@@ -3176,6 +3206,9 @@ static int mxt_probe(struct i2c_client *client, const struct i2c_device_id *id)
 err_free_object:
 	mxt_free_input_device(data);
 	mxt_free_object_table(data);
+err_disable_regulators:
+	regulator_bulk_disable(ARRAY_SIZE(data->regulators),
+			       data->regulators);
 	return error;
 }
 
@@ -3187,6 +3220,8 @@ static int mxt_remove(struct i2c_client *client)
 	sysfs_remove_group(&client->dev.kobj, &mxt_attr_group);
 	mxt_free_input_device(data);
 	mxt_free_object_table(data);
+	regulator_bulk_disable(ARRAY_SIZE(data->regulators),
+			       data->regulators);
 
 	return 0;
 }
-- 
2.26.2

