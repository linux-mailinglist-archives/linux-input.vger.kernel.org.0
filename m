Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 51651DB897
	for <lists+linux-input@lfdr.de>; Thu, 17 Oct 2019 22:44:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2439070AbfJQUm0 (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 17 Oct 2019 16:42:26 -0400
Received: from mail-pl1-f194.google.com ([209.85.214.194]:46084 "EHLO
        mail-pl1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727269AbfJQUm0 (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Thu, 17 Oct 2019 16:42:26 -0400
Received: by mail-pl1-f194.google.com with SMTP id q24so1685022plr.13;
        Thu, 17 Oct 2019 13:42:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=FRd9N8H3Zj0SBuvRkmIjq6Ws5g96mPSLFpPokjqPplU=;
        b=BWRmDSXMRq9DoKgr1v2TSx8T0o32gfU2NU+n8mZZyn9YytbJa1bS48b5fWxU9soMxh
         R4EVBZEP2tv6sS/FBQP1fpZsiXKue+Z60nLeEvcPQERTXp2beG5IZsvuMoLC8WUp0NAJ
         uuWPBdqmIsxBfwDlbuwnZKi8M0UqOOUZzAQ8rXvH0yZ0E5eYtkDMnMcH3TsebswcmPFz
         B5DvU5QvDoJxaskcMtkQkBfRjwTApFS3ULlc8tC2pOJrc+PFV5hKOjzbARkE6n8YMxNL
         P4RcD8NY3FqR14BrbbWIJzJI2uqB7vR+sTyRcPli8oM7b/v8ThPVExLnd2O0RUmcRSRP
         8UUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=FRd9N8H3Zj0SBuvRkmIjq6Ws5g96mPSLFpPokjqPplU=;
        b=XGCsuiz3TUDIzpKSs0uXLXQNfWOBeu/IaKQXffSp5lSLyvJ2nrhJb+nK4vCpTNDwsR
         v8wgFfpjjoC0piAiKe1HdFcIINLnTuWUeOsay7LrbEgxcFK6ECrTS4c9JW4lKHKWccFw
         BfneZTuw/5FVkyL5bI1Bpd/c33lCD0+vXJ+1Z2RD4kgWIf6FpGWD98dahVsKvbCc9ssW
         +k/DCyPtz7720rkl6QL3KMDlJBS1qtGNKtWZTrySRYv6lLX6CPXRaEhGZ4Dpy//68DnE
         cHS2X/v/X85Oi/Gq80uAiKi7cugD1iUFcFt9+W4egkMyy0SvPxZLA2zp6aWHfUsbxHZk
         HWFg==
X-Gm-Message-State: APjAAAUAoVnUYIqjecTG8ALsvHI5tkyoQBPcLJALxHAxwb8CvCVFT6a+
        pdZn69Sz0+1fKbUwm7UivC2OoT+E
X-Google-Smtp-Source: APXvYqy4DjIZZDAFfKWysG4JMraEBfmKvTJP+p74rT2vrlpeq0Fph0yu/ub3pwgysEU92y35pS8dMw==
X-Received: by 2002:a17:902:ac8a:: with SMTP id h10mr5853080plr.180.1571344943241;
        Thu, 17 Oct 2019 13:42:23 -0700 (PDT)
Received: from dtor-ws.mtv.corp.google.com ([2620:15c:202:201:3adc:b08c:7acc:b325])
        by smtp.gmail.com with ESMTPSA id b3sm4626365pfd.125.2019.10.17.13.42.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Oct 2019 13:42:21 -0700 (PDT)
From:   Dmitry Torokhov <dmitry.torokhov@gmail.com>
To:     linux-input@vger.kernel.org
Cc:     Anders Roxell <anders.roxell@linaro.org>,
        Eric Anholt <eric@anholt.net>, Jeff LaBundy <jeff@labundy.com>,
        Luis Chamberlain <mcgrof@kernel.org>,
        Martin Kepplinger <martink@posteo.de>,
        Nicolas Saenz Julienne <nsaenzjulienne@suse.de>,
        linux-kernel@vger.kernel.org
Subject: [PATCH 01/22] Input: raspberrypi-ts - switch to using polled mode of input devices
Date:   Thu, 17 Oct 2019 13:41:55 -0700
Message-Id: <20191017204217.106453-2-dmitry.torokhov@gmail.com>
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
retiring input_polled_dev. This converts raspberrypi-ts driver to use the
polling mode of standard input devices and removes dependency on
INPUT_POLLDEV.

Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
---

 drivers/input/touchscreen/Kconfig          |  1 -
 drivers/input/touchscreen/raspberrypi-ts.c | 38 ++++++++++++----------
 2 files changed, 20 insertions(+), 19 deletions(-)

diff --git a/drivers/input/touchscreen/Kconfig b/drivers/input/touchscreen/Kconfig
index 46ad9090493b..00e7a9f218bc 100644
--- a/drivers/input/touchscreen/Kconfig
+++ b/drivers/input/touchscreen/Kconfig
@@ -700,7 +700,6 @@ config TOUCHSCREEN_EDT_FT5X06
 config TOUCHSCREEN_RASPBERRYPI_FW
 	tristate "Raspberry Pi's firmware base touch screen support"
 	depends on RASPBERRYPI_FIRMWARE || (RASPBERRYPI_FIRMWARE=n && COMPILE_TEST)
-	select INPUT_POLLDEV
 	help
 	  Say Y here if you have the official Raspberry Pi 7 inch screen on
 	  your system.
diff --git a/drivers/input/touchscreen/raspberrypi-ts.c b/drivers/input/touchscreen/raspberrypi-ts.c
index 69881265d121..0e2e08f3f433 100644
--- a/drivers/input/touchscreen/raspberrypi-ts.c
+++ b/drivers/input/touchscreen/raspberrypi-ts.c
@@ -16,7 +16,6 @@
 #include <linux/platform_device.h>
 #include <linux/input.h>
 #include <linux/input/mt.h>
-#include <linux/input-polldev.h>
 #include <linux/input/touchscreen.h>
 #include <soc/bcm2835/raspberrypi-firmware.h>
 
@@ -34,7 +33,7 @@
 
 struct rpi_ts {
 	struct platform_device *pdev;
-	struct input_polled_dev *poll_dev;
+	struct input_dev *input;
 	struct touchscreen_properties prop;
 
 	void __iomem *fw_regs_va;
@@ -57,10 +56,9 @@ struct rpi_ts_regs {
 	} point[RPI_TS_MAX_SUPPORTED_POINTS];
 };
 
-static void rpi_ts_poll(struct input_polled_dev *dev)
+static void rpi_ts_poll(struct input_dev *input)
 {
-	struct input_dev *input = dev->input;
-	struct rpi_ts *ts = dev->private;
+	struct rpi_ts *ts = input_get_drvdata(input);
 	struct rpi_ts_regs regs;
 	int modified_ids = 0;
 	long released_ids;
@@ -123,10 +121,9 @@ static int rpi_ts_probe(struct platform_device *pdev)
 {
 	struct device *dev = &pdev->dev;
 	struct device_node *np = dev->of_node;
-	struct input_polled_dev *poll_dev;
+	struct input_dev *input;
 	struct device_node *fw_node;
 	struct rpi_firmware *fw;
-	struct input_dev *input;
 	struct rpi_ts *ts;
 	u32 touchbuf;
 	int error;
@@ -160,7 +157,6 @@ static int rpi_ts_probe(struct platform_device *pdev)
 		return error;
 	}
 
-
 	touchbuf = (u32)ts->fw_regs_phys;
 	error = rpi_firmware_property(fw, RPI_FIRMWARE_FRAMEBUFFER_SET_TOUCHBUF,
 				      &touchbuf, sizeof(touchbuf));
@@ -170,19 +166,17 @@ static int rpi_ts_probe(struct platform_device *pdev)
 		return error;
 	}
 
-	poll_dev = devm_input_allocate_polled_device(dev);
-	if (!poll_dev) {
+	input = devm_input_allocate_device(dev);
+	if (!input) {
 		dev_err(dev, "Failed to allocate input device\n");
 		return -ENOMEM;
 	}
-	ts->poll_dev = poll_dev;
-	input = poll_dev->input;
+
+	ts->input = input;
+	input_set_drvdata(input, ts);
 
 	input->name = "raspberrypi-ts";
 	input->id.bustype = BUS_HOST;
-	poll_dev->poll_interval = RPI_TS_POLL_INTERVAL;
-	poll_dev->poll = rpi_ts_poll;
-	poll_dev->private = ts;
 
 	input_set_abs_params(input, ABS_MT_POSITION_X, 0,
 			     RPI_TS_DEFAULT_WIDTH, 0, 0);
@@ -197,7 +191,15 @@ static int rpi_ts_probe(struct platform_device *pdev)
 		return error;
 	}
 
-	error = input_register_polled_device(poll_dev);
+	error = input_setup_polling(input, rpi_ts_poll);
+	if (error) {
+		dev_err(dev, "could not set up polling mode, %d\n", error);
+		return error;
+	}
+
+	input_set_poll_interval(input, RPI_TS_POLL_INTERVAL);
+
+	error = input_register_device(input);
 	if (error) {
 		dev_err(dev, "could not register input device, %d\n", error);
 		return error;
@@ -214,10 +216,10 @@ MODULE_DEVICE_TABLE(of, rpi_ts_match);
 
 static struct platform_driver rpi_ts_driver = {
 	.driver = {
-		.name   = "raspberrypi-ts",
+		.name = "raspberrypi-ts",
 		.of_match_table = rpi_ts_match,
 	},
-	.probe          = rpi_ts_probe,
+	.probe = rpi_ts_probe,
 };
 module_platform_driver(rpi_ts_driver);
 
-- 
2.23.0.866.gb869b98d4c-goog

