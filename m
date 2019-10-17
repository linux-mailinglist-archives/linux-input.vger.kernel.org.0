Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 332A8DB86B
	for <lists+linux-input@lfdr.de>; Thu, 17 Oct 2019 22:42:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2440791AbfJQUm3 (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 17 Oct 2019 16:42:29 -0400
Received: from mail-pg1-f195.google.com ([209.85.215.195]:35929 "EHLO
        mail-pg1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727269AbfJQUm3 (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Thu, 17 Oct 2019 16:42:29 -0400
Received: by mail-pg1-f195.google.com with SMTP id 23so2026689pgk.3;
        Thu, 17 Oct 2019 13:42:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=/mXh8WjJ84Xe5TPBXdxoghR6RYUn9xReRFHQXe2AzjQ=;
        b=Q+8X1Hp37Rq29G/LGyQDyZJT89lEC455WByv5xthezcA/h+TnnZzPFY2NqtFN6/azh
         TMCMLepNRMYh4Jl9p36ArOoHxdyqt/ZbKK9Dew/TJ8B4vp28LnjZfvkCki6FTouQSWw0
         tI4FTA621mPhHvOP9Psoi5HwMD0xrqM1iASIboCGkgWlOP7/CqssYb6SxBeFr1g4nQS8
         ODXGqpT2adJw5kl2Vp5m/ag1MNEPhtqwSSmod1azk7y3Y6WyQBt85WISkTQLOnN9OXVG
         xL0s1sQjNZHncroI2MrnXlGsmw2KEo5sQGigjnZnWnq19OSpo7q9Xpz1Kbe3xrjE83il
         DhSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=/mXh8WjJ84Xe5TPBXdxoghR6RYUn9xReRFHQXe2AzjQ=;
        b=hj3wY/xeOHEPZlgwWDgNehbHF1FbE66061pf6gScb/92hRHdoLrZtEwZIosEXF1WAl
         bjL/GRiJAihoF/NUTtyAeelYOuISRhGyETyKKHbmU+KipDfB+UMwtAZdcRodXMqx6Uln
         2/t+CjQEiVkDuSzViQOijxwIYaO9D1v1btJMnvuXHIe9zDhpQRtlWCdV9/ep+YU8Na4p
         XCxgmcu+4heOFnyeC9kQvCx8frvB8vE7AN+hBNC/fcZrqoX3nGzmqTOWz4abbkSLnv5v
         l2tEJ1LWvoWlfpDdWX6U27BO195rq939pTZxfXAwyhbiGaHrbKVuXBcDG2TPgIS3LgDX
         tMjg==
X-Gm-Message-State: APjAAAXdfWzZd6FKWc/l+oOtX6pvoYQBWGWy0MVVRO7i8WsA86cykpu7
        BGX1JIuyOObOwyK98yJMOGasppCr
X-Google-Smtp-Source: APXvYqxRpEh6skic+1OjBIzOhOXjdDuMCG/hGlSb2M9JafhBr1a+59XrUWGHA3l+ptZkT0f/Bv4xLw==
X-Received: by 2002:a63:b551:: with SMTP id u17mr6092921pgo.88.1571344946094;
        Thu, 17 Oct 2019 13:42:26 -0700 (PDT)
Received: from dtor-ws.mtv.corp.google.com ([2620:15c:202:201:3adc:b08c:7acc:b325])
        by smtp.gmail.com with ESMTPSA id b3sm4626365pfd.125.2019.10.17.13.42.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Oct 2019 13:42:25 -0700 (PDT)
From:   Dmitry Torokhov <dmitry.torokhov@gmail.com>
To:     linux-input@vger.kernel.org
Cc:     Anders Roxell <anders.roxell@linaro.org>,
        Jeff LaBundy <jeff@labundy.com>,
        Martin Kepplinger <martink@posteo.de>,
        Mukesh Ojha <mojha@codeaurora.org>,
        Nicolas Saenz Julienne <nsaenzjulienne@suse.de>,
        linux-kernel@vger.kernel.org
Subject: [PATCH 03/22] Input: ts4800-ts - switch to using polled mode of input devices
Date:   Thu, 17 Oct 2019 13:41:57 -0700
Message-Id: <20191017204217.106453-4-dmitry.torokhov@gmail.com>
X-Mailer: git-send-email 2.23.0.866.gb869b98d4c-goog
In-Reply-To: <20191017204217.106453-1-dmitry.torokhov@gmail.com>
References: <20191017204217.106453-1-dmitry.torokhov@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

We have added polled mode to the normal input devices with the intent of
retiring input_polled_dev. This converts ts4800-ts driver to use the
polling mode of standard input devices and removes dependency on
INPUT_POLLDEV.

Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
---

 drivers/input/touchscreen/Kconfig     |  1 -
 drivers/input/touchscreen/ts4800-ts.c | 68 +++++++++++++++------------
 2 files changed, 38 insertions(+), 31 deletions(-)

diff --git a/drivers/input/touchscreen/Kconfig b/drivers/input/touchscreen/Kconfig
index df9cb92166c3..2c00232b2506 100644
--- a/drivers/input/touchscreen/Kconfig
+++ b/drivers/input/touchscreen/Kconfig
@@ -1037,7 +1037,6 @@ config TOUCHSCREEN_TS4800
 	depends on HAS_IOMEM && OF
 	depends on SOC_IMX51 || COMPILE_TEST
 	select MFD_SYSCON
-	select INPUT_POLLDEV
 	help
 	  Say Y here if you have a touchscreen on a TS-4800 board.
 
diff --git a/drivers/input/touchscreen/ts4800-ts.c b/drivers/input/touchscreen/ts4800-ts.c
index 5b4f5362c67b..6cf66aadc10e 100644
--- a/drivers/input/touchscreen/ts4800-ts.c
+++ b/drivers/input/touchscreen/ts4800-ts.c
@@ -10,7 +10,6 @@
 
 #include <linux/bitops.h>
 #include <linux/input.h>
-#include <linux/input-polldev.h>
 #include <linux/io.h>
 #include <linux/kernel.h>
 #include <linux/mfd/syscon.h>
@@ -33,7 +32,7 @@
 #define Y_OFFSET		0x2
 
 struct ts4800_ts {
-	struct input_polled_dev *poll_dev;
+	struct input_dev        *input;
 	struct device           *dev;
 	char                    phys[32];
 
@@ -46,22 +45,26 @@ struct ts4800_ts {
 	int                     debounce;
 };
 
-static void ts4800_ts_open(struct input_polled_dev *dev)
+static int ts4800_ts_open(struct input_dev *input_dev)
 {
-	struct ts4800_ts *ts = dev->private;
-	int ret;
+	struct ts4800_ts *ts = input_get_drvdata(input_dev);
+	int error;
 
 	ts->pendown = false;
 	ts->debounce = DEBOUNCE_COUNT;
 
-	ret = regmap_update_bits(ts->regmap, ts->reg, ts->bit, ts->bit);
-	if (ret)
-		dev_warn(ts->dev, "Failed to enable touchscreen\n");
+	error = regmap_update_bits(ts->regmap, ts->reg, ts->bit, ts->bit);
+	if (error) {
+		dev_warn(ts->dev, "Failed to enable touchscreen: %d\n", error);
+		return error;
+	}
+
+	return 0;
 }
 
-static void ts4800_ts_close(struct input_polled_dev *dev)
+static void ts4800_ts_close(struct input_dev *input_dev)
 {
-	struct ts4800_ts *ts = dev->private;
+	struct ts4800_ts *ts = input_get_drvdata(input_dev);
 	int ret;
 
 	ret = regmap_update_bits(ts->regmap, ts->reg, ts->bit, 0);
@@ -70,10 +73,9 @@ static void ts4800_ts_close(struct input_polled_dev *dev)
 
 }
 
-static void ts4800_ts_poll(struct input_polled_dev *dev)
+static void ts4800_ts_poll(struct input_dev *input_dev)
 {
-	struct input_dev *input_dev = dev->input;
-	struct ts4800_ts *ts = dev->private;
+	struct ts4800_ts *ts = input_get_drvdata(input_dev);
 	u16 last_x = readw(ts->base + X_OFFSET);
 	u16 last_y = readw(ts->base + Y_OFFSET);
 	bool pendown = last_x & PENDOWN_MASK;
@@ -146,7 +148,7 @@ static int ts4800_parse_dt(struct platform_device *pdev,
 
 static int ts4800_ts_probe(struct platform_device *pdev)
 {
-	struct input_polled_dev *poll_dev;
+	struct input_dev *input_dev;
 	struct ts4800_ts *ts;
 	int error;
 
@@ -162,32 +164,38 @@ static int ts4800_ts_probe(struct platform_device *pdev)
 	if (IS_ERR(ts->base))
 		return PTR_ERR(ts->base);
 
-	poll_dev = devm_input_allocate_polled_device(&pdev->dev);
-	if (!poll_dev)
+	input_dev = devm_input_allocate_device(&pdev->dev);
+	if (!input_dev)
 		return -ENOMEM;
 
 	snprintf(ts->phys, sizeof(ts->phys), "%s/input0", dev_name(&pdev->dev));
-	ts->poll_dev = poll_dev;
+	ts->input = input_dev;
 	ts->dev = &pdev->dev;
 
-	poll_dev->private = ts;
-	poll_dev->poll_interval = POLL_INTERVAL;
-	poll_dev->open = ts4800_ts_open;
-	poll_dev->close = ts4800_ts_close;
-	poll_dev->poll = ts4800_ts_poll;
+	input_set_drvdata(input_dev, ts);
+
+	input_dev->name = "TS-4800 Touchscreen";
+	input_dev->phys = ts->phys;
+
+	input_dev->open = ts4800_ts_open;
+	input_dev->close = ts4800_ts_close;
+
+	input_set_capability(input_dev, EV_KEY, BTN_TOUCH);
+	input_set_abs_params(input_dev, ABS_X, 0, MAX_12BIT, 0, 0);
+	input_set_abs_params(input_dev, ABS_Y, 0, MAX_12BIT, 0, 0);
 
-	poll_dev->input->name = "TS-4800 Touchscreen";
-	poll_dev->input->phys = ts->phys;
+	error = input_setup_polling(input_dev, ts4800_ts_poll);
+	if (error) {
+		dev_err(&pdev->dev, "Unable to set up polling: %d\n", error);
+		return error;
+	}
 
-	input_set_capability(poll_dev->input, EV_KEY, BTN_TOUCH);
-	input_set_abs_params(poll_dev->input, ABS_X, 0, MAX_12BIT, 0, 0);
-	input_set_abs_params(poll_dev->input, ABS_Y, 0, MAX_12BIT, 0, 0);
+	input_set_poll_interval(input_dev, POLL_INTERVAL);
 
-	error = input_register_polled_device(poll_dev);
+	error = input_register_device(input_dev);
 	if (error) {
 		dev_err(&pdev->dev,
-			"Unabled to register polled input device (%d)\n",
-			error);
+			"Unable to register input device: %d\n", error);
 		return error;
 	}
 
-- 
2.23.0.866.gb869b98d4c-goog

