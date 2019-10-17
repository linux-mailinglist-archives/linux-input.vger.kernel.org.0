Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 092D1DB88E
	for <lists+linux-input@lfdr.de>; Thu, 17 Oct 2019 22:44:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2501949AbfJQUm3 (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 17 Oct 2019 16:42:29 -0400
Received: from mail-pg1-f194.google.com ([209.85.215.194]:42139 "EHLO
        mail-pg1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2440678AbfJQUm3 (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Thu, 17 Oct 2019 16:42:29 -0400
Received: by mail-pg1-f194.google.com with SMTP id f14so2006751pgi.9;
        Thu, 17 Oct 2019 13:42:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=xREUl1NsyRw48QZ1koCr3VjBYFASQ7LMvhvI9Mxd8Eg=;
        b=hkbKRcr0aDKQQEgH7N63R/GPV3ypco9E2U5GEYGBOHp4gT2lm3d4LglyQbO/fKT+D5
         /Yf+zkhIMahQs8azEFXBur489HQqdJ5CEvJhqlhMHnljIOtTqavHAXORy8/py9TL4G09
         soYNXlynNEVJQkOu6rS/5m0GYwI1fV6X/2oMRgLXe9m/xptJTe1u3HfUacG5T614DGTY
         +dXvKok79BUUm0dNlX/9unpfmkXPPszLpC2Z8TK6vFmSetwg510IRA6pcZ3X8AOwbQv4
         x2pg5YPPrEi+vQXEg0YhrtiPSCi6vA0vnYuiFNjTP5w803iCKtCcX1WEJlTXOxSA6Uua
         U+vQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=xREUl1NsyRw48QZ1koCr3VjBYFASQ7LMvhvI9Mxd8Eg=;
        b=Cmkt0+Qr9roFu7NZt/tpPHCEjSIYA2gUEf8SITU4M2nLi8S0AfKokoogTEwGOFx/3/
         nguLmsFTQQaCPWng6TfKyEV/80uw7vwSUi1bA9Z7d1cDWP5ykfI0DNQk2Xby42A+RRzu
         2V0FXbtj8OTE/O9hyfCot7PiP5+GIFacyCQeeFF1t+4HCjBAx/4T/JwhKVHUq3uCx9mZ
         QBHJ0yyC1i5NKPWlrqvY/LUSB2UyL0ZAQ1ov4TfxvPppKxLK0/jOxJ/yPtwHZn49E9Kj
         pi2ovr9Xzlb365N9uidQt3k1Jw31g5heZFY/ZHXP1tVPM5WPyvrVOjiUUcuVUNhszNvm
         tRzg==
X-Gm-Message-State: APjAAAWnRG6dwlPXKd/ibNc55V5YtYE2DjdwrE/9n96PuUr23KQQ2xco
        xE+ihxYm7PwBexF+TjIOndPAMetn
X-Google-Smtp-Source: APXvYqzS7MmleeeZ6TVFaT71zNM54PUh5o6nDqqhWIdh0jbEFDPo1mN/AzPsjK8jG+rxOjGgSBp7Fg==
X-Received: by 2002:a63:5162:: with SMTP id r34mr6146979pgl.339.1571344947454;
        Thu, 17 Oct 2019 13:42:27 -0700 (PDT)
Received: from dtor-ws.mtv.corp.google.com ([2620:15c:202:201:3adc:b08c:7acc:b325])
        by smtp.gmail.com with ESMTPSA id b3sm4626365pfd.125.2019.10.17.13.42.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Oct 2019 13:42:26 -0700 (PDT)
From:   Dmitry Torokhov <dmitry.torokhov@gmail.com>
To:     linux-input@vger.kernel.org
Cc:     Anders Roxell <anders.roxell@linaro.org>,
        Jeff LaBundy <jeff@labundy.com>,
        Martin Kepplinger <martink@posteo.de>,
        Nicolas Saenz Julienne <nsaenzjulienne@suse.de>,
        linux-kernel@vger.kernel.org
Subject: [PATCH 04/22] Input: tsc6507x-ts - switch to using polled mode of input devices
Date:   Thu, 17 Oct 2019 13:41:58 -0700
Message-Id: <20191017204217.106453-5-dmitry.torokhov@gmail.com>
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
retiring input_polled_dev. This converts tsc6507x-ts driver to use the
polling mode of standard input devices and removes dependency on
INPUT_POLLDEV.

Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
---

 drivers/input/touchscreen/Kconfig       |  1 -
 drivers/input/touchscreen/tps6507x-ts.c | 36 ++++++++++++-------------
 2 files changed, 17 insertions(+), 20 deletions(-)

diff --git a/drivers/input/touchscreen/Kconfig b/drivers/input/touchscreen/Kconfig
index 2c00232b2506..40bfc551ce30 100644
--- a/drivers/input/touchscreen/Kconfig
+++ b/drivers/input/touchscreen/Kconfig
@@ -1243,7 +1243,6 @@ config TOUCHSCREEN_SX8654
 config TOUCHSCREEN_TPS6507X
 	tristate "TPS6507x based touchscreens"
 	depends on I2C
-	select INPUT_POLLDEV
 	help
 	  Say Y here if you have a TPS6507x based touchscreen
 	  controller.
diff --git a/drivers/input/touchscreen/tps6507x-ts.c b/drivers/input/touchscreen/tps6507x-ts.c
index 75170a7439b1..357a3108f2e5 100644
--- a/drivers/input/touchscreen/tps6507x-ts.c
+++ b/drivers/input/touchscreen/tps6507x-ts.c
@@ -17,7 +17,6 @@
 #include <linux/workqueue.h>
 #include <linux/slab.h>
 #include <linux/input.h>
-#include <linux/input-polldev.h>
 #include <linux/platform_device.h>
 #include <linux/mfd/tps6507x.h>
 #include <linux/input/tps6507x-ts.h>
@@ -40,7 +39,7 @@ struct ts_event {
 
 struct tps6507x_ts {
 	struct device		*dev;
-	struct input_polled_dev	*poll_dev;
+	struct input_dev	*input;
 	struct tps6507x_dev	*mfd;
 	char			phys[32];
 	struct ts_event		tc;
@@ -148,10 +147,9 @@ static s32 tps6507x_adc_standby(struct tps6507x_ts *tsc)
 	return ret;
 }
 
-static void tps6507x_ts_poll(struct input_polled_dev *poll_dev)
+static void tps6507x_ts_poll(struct input_dev *input_dev)
 {
-	struct tps6507x_ts *tsc = poll_dev->private;
-	struct input_dev *input_dev = poll_dev->input;
+	struct tps6507x_ts *tsc = input_get_drvdata(input_dev);
 	bool pendown;
 	s32 ret;
 
@@ -205,7 +203,6 @@ static int tps6507x_ts_probe(struct platform_device *pdev)
 	const struct tps6507x_board *tps_board;
 	const struct touchscreen_init_data *init_data;
 	struct tps6507x_ts *tsc;
-	struct input_polled_dev *poll_dev;
 	struct input_dev *input_dev;
 	int error;
 
@@ -240,23 +237,16 @@ static int tps6507x_ts_probe(struct platform_device *pdev)
 	snprintf(tsc->phys, sizeof(tsc->phys),
 		 "%s/input0", dev_name(tsc->dev));
 
-	poll_dev = devm_input_allocate_polled_device(&pdev->dev);
-	if (!poll_dev) {
+	input_dev = devm_input_allocate_device(&pdev->dev);
+	if (!input_dev) {
 		dev_err(tsc->dev, "Failed to allocate polled input device.\n");
 		return -ENOMEM;
 	}
 
-	tsc->poll_dev = poll_dev;
-
-	poll_dev->private = tsc;
-	poll_dev->poll = tps6507x_ts_poll;
-	poll_dev->poll_interval = init_data ?
-			init_data->poll_period : TSC_DEFAULT_POLL_PERIOD;
-
-	input_dev = poll_dev->input;
-	input_dev->evbit[0] = BIT_MASK(EV_KEY) | BIT_MASK(EV_ABS);
-	input_dev->keybit[BIT_WORD(BTN_TOUCH)] = BIT_MASK(BTN_TOUCH);
+	tsc->input = input_dev;
+	input_set_drvdata(input_dev, tsc);
 
+	input_set_capability(input_dev, EV_KEY, BTN_TOUCH);
 	input_set_abs_params(input_dev, ABS_X, 0, MAX_10BIT, 0, 0);
 	input_set_abs_params(input_dev, ABS_Y, 0, MAX_10BIT, 0, 0);
 	input_set_abs_params(input_dev, ABS_PRESSURE, 0, MAX_10BIT, 0, 0);
@@ -275,7 +265,15 @@ static int tps6507x_ts_probe(struct platform_device *pdev)
 	if (error)
 		return error;
 
-	error = input_register_polled_device(poll_dev);
+	error = input_setup_polling(input_dev, tps6507x_ts_poll);
+	if (error)
+		return error;
+
+	input_set_poll_interval(input_dev,
+				init_data ? init_data->poll_period :
+					    TSC_DEFAULT_POLL_PERIOD);
+
+	error = input_register_device(input_dev);
 	if (error)
 		return error;
 
-- 
2.23.0.866.gb869b98d4c-goog

