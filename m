Return-Path: <linux-input+bounces-332-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 832C27FD8A5
	for <lists+linux-input@lfdr.de>; Wed, 29 Nov 2023 14:51:56 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 357221F20ECE
	for <lists+linux-input@lfdr.de>; Wed, 29 Nov 2023 13:51:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9561C21113;
	Wed, 29 Nov 2023 13:51:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="oSVidB/y"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-lf1-x136.google.com (mail-lf1-x136.google.com [IPv6:2a00:1450:4864:20::136])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B8F4DDD
	for <linux-input@vger.kernel.org>; Wed, 29 Nov 2023 05:51:48 -0800 (PST)
Received: by mail-lf1-x136.google.com with SMTP id 2adb3069b0e04-50bc9931c82so15293e87.3
        for <linux-input@vger.kernel.org>; Wed, 29 Nov 2023 05:51:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1701265906; x=1701870706; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=IJVDxJRhkC1R0NB1OybcfNwTfEmKrwSlSr9/Hamx9NY=;
        b=oSVidB/yApS3ENl61PqtUewxp5QIx7oVzU5HNK2Smd9caAOOFnNOoYJDfAK4qZf69I
         Kx1bQIHM8BtA0wUH0/EOpLFdgmZdGtNqtWKgxWFH24rBfxQXeNee/41yYlg7uylAY4j8
         z0fdnkbtX1Lr8sdpaSBlXqT2hdF+WPCvmAgUafTxGiEAwQBwBXURzvLjmwlO2ZvhHyaS
         odn42+iU57aOlRMn4uRsocZEeH5w9iQN/NIPX9U6/TKZBlHJA3vv/9apqo3G+3rpqMm+
         YiHg69BL7ZxyCNoqFxl0uS9Qjd2+KM4/QvVzLsTg1Gexvw+ZEY1vOK205FMFBAoP6LB8
         zUwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701265906; x=1701870706;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=IJVDxJRhkC1R0NB1OybcfNwTfEmKrwSlSr9/Hamx9NY=;
        b=IpbLps0udfewcw2LJ8XWBiuyTb17HZcatrpROTqpM3kW5v6YBLBQvgp9W0AW6+6HOI
         1BSlomeCnD/g1XTvXzwDMxy/Rcmw8D2hm0b3atdJgWvJGwA54RCrgBvOBrNGuD8IZA3Q
         uGDSVNwUYtuNoyWX5HVW+4NzZZHyUmaVWCxMt+RmRNOpMPH78x7xPddEv/6b0oTa4WQR
         vSkOouG2ysV/R0yEHyPXyRCv8dIAvDhK8hiXhXFk72FaW93YGazjtmLrWzilG8tiaOuR
         5VkYlysUlsmf6mb33SsNSqw7vnnfvSf8GVgoTKdphTsn/rmLrympQfX6mmZsVGAWju84
         Ylrw==
X-Gm-Message-State: AOJu0YxvE8rNdOXKZ+JjwDVKr+d2p8DxOKx9PggODdz03ZgI1B72OBWK
	vjyj3BPPptHU6w8444zsYYQUZ/UaK5HFt6HyhsE=
X-Google-Smtp-Source: AGHT+IHprW1qmodT+TbJta5oVD18X/Vp5LiOuWOUJ+39saDp9YaTJu2M14OtyTRYBLNr9DelpSKpNw==
X-Received: by 2002:a05:6512:e81:b0:50b:c8a0:5657 with SMTP id bi1-20020a0565120e8100b0050bc8a05657mr531485lfb.17.1701265906583;
        Wed, 29 Nov 2023 05:51:46 -0800 (PST)
Received: from [127.0.1.1] ([85.235.12.238])
        by smtp.gmail.com with ESMTPSA id a28-20020ac2521c000000b0050ab88758b8sm2164280lfl.84.2023.11.29.05.51.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Nov 2023 05:51:46 -0800 (PST)
From: Linus Walleij <linus.walleij@linaro.org>
Date: Wed, 29 Nov 2023 14:51:45 +0100
Subject: [PATCH 1/4] Input: navpoint - Convert to use GPIO descriptor
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20231129-descriptors-input-v1-1-9433162914a3@linaro.org>
References: <20231129-descriptors-input-v1-0-9433162914a3@linaro.org>
In-Reply-To: <20231129-descriptors-input-v1-0-9433162914a3@linaro.org>
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>, 
 Tony Lindgren <tony@atomide.com>
Cc: linux-input@vger.kernel.org, Linus Walleij <linus.walleij@linaro.org>
X-Mailer: b4 0.12.4

The Navpoint driver uses a GPIO line, convert this to use
a GPIO descriptor. There are no in-kernel users but outoftree
users can easily be added or converted using a GPIO descriptor
table as with numerous other drivers.

Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
 drivers/input/mouse/navpoint.c | 41 +++++++++++++++--------------------------
 include/linux/input/navpoint.h |  1 -
 2 files changed, 15 insertions(+), 27 deletions(-)

diff --git a/drivers/input/mouse/navpoint.c b/drivers/input/mouse/navpoint.c
index c00dc1275da2..ba757783c258 100644
--- a/drivers/input/mouse/navpoint.c
+++ b/drivers/input/mouse/navpoint.c
@@ -10,7 +10,7 @@
 #include <linux/platform_device.h>
 #include <linux/clk.h>
 #include <linux/delay.h>
-#include <linux/gpio.h>
+#include <linux/gpio/consumer.h>
 #include <linux/input.h>
 #include <linux/input/navpoint.h>
 #include <linux/interrupt.h>
@@ -32,7 +32,7 @@ struct navpoint {
 	struct ssp_device	*ssp;
 	struct input_dev	*input;
 	struct device		*dev;
-	int			gpio;
+	struct gpio_desc	*gpiod;
 	int			index;
 	u8			data[1 + HEADER_LENGTH(0xff)];
 };
@@ -170,16 +170,14 @@ static void navpoint_up(struct navpoint *navpoint)
 		dev_err(navpoint->dev,
 			"timeout waiting for SSSR[CSS] to clear\n");
 
-	if (gpio_is_valid(navpoint->gpio))
-		gpio_set_value(navpoint->gpio, 1);
+	gpiod_set_value(navpoint->gpiod, 1);
 }
 
 static void navpoint_down(struct navpoint *navpoint)
 {
 	struct ssp_device *ssp = navpoint->ssp;
 
-	if (gpio_is_valid(navpoint->gpio))
-		gpio_set_value(navpoint->gpio, 0);
+	gpiod_set_value(navpoint->gpiod, 0);
 
 	pxa_ssp_write_reg(ssp, SSCR0, 0);
 
@@ -216,18 +214,9 @@ static int navpoint_probe(struct platform_device *pdev)
 		return -EINVAL;
 	}
 
-	if (gpio_is_valid(pdata->gpio)) {
-		error = gpio_request_one(pdata->gpio, GPIOF_OUT_INIT_LOW,
-					 "SYNAPTICS_ON");
-		if (error)
-			return error;
-	}
-
 	ssp = pxa_ssp_request(pdata->port, pdev->name);
-	if (!ssp) {
-		error = -ENODEV;
-		goto err_free_gpio;
-	}
+	if (!ssp)
+		return -ENODEV;
 
 	/* HaRET does not disable devices before jumping into Linux */
 	if (pxa_ssp_read_reg(ssp, SSCR0) & SSCR0_SSE) {
@@ -242,10 +231,18 @@ static int navpoint_probe(struct platform_device *pdev)
 		goto err_free_mem;
 	}
 
+	navpoint->gpiod = gpiod_get_optional(&pdev->dev,
+					     NULL, GPIOD_OUT_LOW);
+	if (IS_ERR(navpoint->gpiod)) {
+		error = PTR_ERR(navpoint->gpiod);
+		dev_err(&pdev->dev, "error getting GPIO\n");
+		goto err_free_mem;
+	}
+	gpiod_set_consumer_name(navpoint->gpiod, "SYNAPTICS_ON");
+
 	navpoint->ssp = ssp;
 	navpoint->input = input;
 	navpoint->dev = &pdev->dev;
-	navpoint->gpio = pdata->gpio;
 
 	input->name = pdev->name;
 	input->dev.parent = &pdev->dev;
@@ -288,17 +285,12 @@ static int navpoint_probe(struct platform_device *pdev)
 	input_free_device(input);
 	kfree(navpoint);
 	pxa_ssp_free(ssp);
-err_free_gpio:
-	if (gpio_is_valid(pdata->gpio))
-		gpio_free(pdata->gpio);
 
 	return error;
 }
 
 static void navpoint_remove(struct platform_device *pdev)
 {
-	const struct navpoint_platform_data *pdata =
-					dev_get_platdata(&pdev->dev);
 	struct navpoint *navpoint = platform_get_drvdata(pdev);
 	struct ssp_device *ssp = navpoint->ssp;
 
@@ -308,9 +300,6 @@ static void navpoint_remove(struct platform_device *pdev)
 	kfree(navpoint);
 
 	pxa_ssp_free(ssp);
-
-	if (gpio_is_valid(pdata->gpio))
-		gpio_free(pdata->gpio);
 }
 
 static int navpoint_suspend(struct device *dev)
diff --git a/include/linux/input/navpoint.h b/include/linux/input/navpoint.h
index d464ffb4db52..5192ae3f5ec1 100644
--- a/include/linux/input/navpoint.h
+++ b/include/linux/input/navpoint.h
@@ -5,5 +5,4 @@
 
 struct navpoint_platform_data {
 	int		port;		/* PXA SSP port for pxa_ssp_request() */
-	int		gpio;		/* GPIO for power on/off */
 };

-- 
2.34.1


