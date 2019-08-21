Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 77AA897572
	for <lists+linux-input@lfdr.de>; Wed, 21 Aug 2019 10:56:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726680AbfHUIzI (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 21 Aug 2019 04:55:08 -0400
Received: from mail-lj1-f195.google.com ([209.85.208.195]:42014 "EHLO
        mail-lj1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726648AbfHUIzI (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Wed, 21 Aug 2019 04:55:08 -0400
Received: by mail-lj1-f195.google.com with SMTP id l14so1375093ljj.9
        for <linux-input@vger.kernel.org>; Wed, 21 Aug 2019 01:55:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=13vFYsKZqbPCH3/HgxJlsrt96ycJv8bPLdusJ/ixmDc=;
        b=Ai2rGuF745mco9BWVx6IXAWpy7RzAV3nqNpkaTZ3NhA2J9Qh5OBjyOXAnJpyUfI17w
         X8snu1lOog6lyxBe8Ra/RAZTNlrc+qOtJ8RY+NvagnaqssrwuLT+KlxbzId+VCX23cZu
         h0mrD0AhIMp58TdbTdQyGCUtM3lzxTUDJB+5ZMrhw7iKcZE036+mK8AED1+R0ntFciID
         tncS/VpclJqRFiRoegUo1p+iqbYlYN4yC59NHTHS3GIj52eLdy5cKkSnFM2RcrzFW2yz
         ZkpbyE52Y53FOeSLIMaVm3LFGRZZkLTlPkgiFpxTqfX7pV3RaAMSInCUhn2hBlUHq1AT
         wU0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=13vFYsKZqbPCH3/HgxJlsrt96ycJv8bPLdusJ/ixmDc=;
        b=DsLhQ+ZL5zv4ZL9ZY6ddiGvG5wyzx0ILAu7yUT1MzSyJBAVqdGBwrL1XXTjWMJmeeL
         bNZWG1RNHxhyV9nmVR1LxD6mWglI8T3obn2ch9fYGVphHJttfDoL1gArFiUTPETp9vZV
         SjCdqB6hcA+MMltg/J8vaDxDlnvUG5e56Fw5CeHKe8uxRPH8zGO5z6zWzH0fE/2zqKH0
         L5/buqNHM8YB4q3OIqDnfAlbVLCZGQ0KDOc5/mGAoihJs+ZQJkpF5XocA8HdLAYg5pov
         Bjz5X2A+U8GUICkotfeGZ76mg2e9zvkNcNyg2Hx7tPKnxLw+AA4LNOccnVkUy945sIlH
         9B+A==
X-Gm-Message-State: APjAAAUgCVHPi0ZMEsIy4hhxQN6br1RCY3Er+Clz0c+84t1Q5JXi6agY
        4ZWXUWSh4Zob4Qn3uFZD0mSzR9M0jdg=
X-Google-Smtp-Source: APXvYqydtRfZDGs0Vzv4PI8flKH7pGNNav6/GWq6xlyKwiKM96GDFggMCBwLQBBf8z67cNOlZaHMuA==
X-Received: by 2002:a2e:2b0a:: with SMTP id q10mr12813916lje.203.1566377706441;
        Wed, 21 Aug 2019 01:55:06 -0700 (PDT)
Received: from genomnajs.ideon.se ([85.235.10.227])
        by smtp.gmail.com with ESMTPSA id 69sm3154699ljj.101.2019.08.21.01.55.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Aug 2019 01:55:05 -0700 (PDT)
From:   Linus Walleij <linus.walleij@linaro.org>
To:     Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        linux-input@vger.kernel.org
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        "H . Nikolaus Schaller" <hns@goldelico.com>
Subject: [PATCH] Input: tsc2007 - use GPIO descriptor
Date:   Wed, 21 Aug 2019 10:55:03 +0200
Message-Id: <20190821085503.8062-1-linus.walleij@linaro.org>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

This switches the TSC2007 to use a GPIO descriptor to read
the pendown GPIO line.

Cc: H. Nikolaus Schaller <hns@goldelico.com>
Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
 drivers/input/touchscreen/tsc2007.h      |  4 +++-
 drivers/input/touchscreen/tsc2007_core.c | 14 +++++++-------
 2 files changed, 10 insertions(+), 8 deletions(-)

diff --git a/drivers/input/touchscreen/tsc2007.h b/drivers/input/touchscreen/tsc2007.h
index 91c60bf6dcaf..0306c38b56c7 100644
--- a/drivers/input/touchscreen/tsc2007.h
+++ b/drivers/input/touchscreen/tsc2007.h
@@ -49,6 +49,8 @@
 #define READ_X		(ADC_ON_12BIT | TSC2007_MEASURE_X)
 #define PWRDOWN		(TSC2007_12BIT | TSC2007_POWER_OFF_IRQ_EN)
 
+struct gpio_desc;
+
 struct ts_event {
 	u16	x;
 	u16	y;
@@ -69,7 +71,7 @@ struct tsc2007 {
 	int			fuzzy;
 	int			fuzzz;
 
-	unsigned int		gpio;
+	struct gpio_desc	*gpiod;
 	int			irq;
 
 	wait_queue_head_t	wait;
diff --git a/drivers/input/touchscreen/tsc2007_core.c b/drivers/input/touchscreen/tsc2007_core.c
index 3b80abfc1eca..5d9c6128622e 100644
--- a/drivers/input/touchscreen/tsc2007_core.c
+++ b/drivers/input/touchscreen/tsc2007_core.c
@@ -23,7 +23,7 @@
 #include <linux/interrupt.h>
 #include <linux/i2c.h>
 #include <linux/of_device.h>
-#include <linux/of_gpio.h>
+#include <linux/gpio/consumer.h>
 #include <linux/platform_data/tsc2007.h>
 #include "tsc2007.h"
 
@@ -226,7 +226,7 @@ static int tsc2007_get_pendown_state_gpio(struct device *dev)
 	struct i2c_client *client = to_i2c_client(dev);
 	struct tsc2007 *ts = i2c_get_clientdata(client);
 
-	return !gpio_get_value(ts->gpio);
+	return !gpiod_get_value(ts->gpiod);
 }
 
 static int tsc2007_probe_dt(struct i2c_client *client, struct tsc2007 *ts)
@@ -266,13 +266,13 @@ static int tsc2007_probe_dt(struct i2c_client *client, struct tsc2007 *ts)
 		return -EINVAL;
 	}
 
-	ts->gpio = of_get_gpio(np, 0);
-	if (gpio_is_valid(ts->gpio))
+	ts->gpiod = devm_gpiod_get_optional(&client->dev, NULL, GPIOD_IN);
+	if (IS_ERR(ts->gpiod))
+		return PTR_ERR(ts->gpiod);
+	if (ts->gpiod)
 		ts->get_pendown_state = tsc2007_get_pendown_state_gpio;
 	else
-		dev_warn(&client->dev,
-			 "GPIO not specified in DT (of_get_gpio returned %d)\n",
-			 ts->gpio);
+		dev_warn(&client->dev, "GPIO not specified in DT\n");
 
 	return 0;
 }
-- 
2.21.0

