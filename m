Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id EEF09DB894
	for <lists+linux-input@lfdr.de>; Thu, 17 Oct 2019 22:44:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2394819AbfJQUoF (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 17 Oct 2019 16:44:05 -0400
Received: from mail-pf1-f193.google.com ([209.85.210.193]:42736 "EHLO
        mail-pf1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2440795AbfJQUm3 (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Thu, 17 Oct 2019 16:42:29 -0400
Received: by mail-pf1-f193.google.com with SMTP id q12so2366456pff.9;
        Thu, 17 Oct 2019 13:42:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=sSHq9wsAzsKM4AZ9LGW0ongN+PTn6qrVrduasflfRcM=;
        b=goASVb+k6liB5swYO63ZxWWekRVhGn3GuMsbPw2TeHuX0v/VFzTJCpHLCRpFv0Ngnb
         LDGiCtYWcJ5zxIOqmhrr8IRDjleOtxitzOhSew4NHmeu8aeP9liDUrHqYjVvAnqwV4zH
         N5L7jKq6ZDhb3VLiEOTOI33zZuv1Lkfz+qSzqCaS9uscoIxmpqq+I5004S23Amu2lZtA
         0LNv4aB5iMDEzF5XBMiWsmGiolIBLswcBn0H8sP70z0tcnbaiNP1bEtvVB5Ax6yN/NoC
         Vcrf+XdBoZiwnuh+rw/j2N5m6MBuI1x0wXLofqExCv8gVjBRLj+wdnnJqcuOK43KkonH
         Sg2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=sSHq9wsAzsKM4AZ9LGW0ongN+PTn6qrVrduasflfRcM=;
        b=rOoO7vJdwabAco+NHVuuiWz1sAWZ9hEmaRz9qHVkZhg1cBSA2gUq582FtL7brLvy3q
         e6S0x3DrI2KZZjGlscccTn1W10dUrmEwIA0HmFhPYF5q1e0V1+USZLtwlRBF3aVJW7ph
         KbXfYyrGy7+N1tdZ3OpwbZ1Q1tWLuaAlBTJb2guTMQ9eLi3O735dKupSvxSP7b3lSosh
         iBL2T0b4l91VKtFiN94nWMt25hmI8deRbcFngjWEmfwM5XvZiMot4zPlYj1/w5X3eCj7
         R/gn8aXjBsZgQqysX8LKYsB39OrK24AHHA7syk8Rs1F2YYbuEhPF83JVrb7uXJ14TphF
         JKlg==
X-Gm-Message-State: APjAAAU+qOoEdo3CzK+9QebMtIyGCzofVR7Rs69Tj1RA2MaImJCdhvYg
        xkba92K1NQzCc9cFPNbMn0jpO6o7
X-Google-Smtp-Source: APXvYqyktynoW+tHdAI7M/o/NlB+6UWZag6mmwJUE/SBDpFkO+Z8MwjOuwMRnXuQj9tturz5DYTVgw==
X-Received: by 2002:a63:fe44:: with SMTP id x4mr6257421pgj.118.1571344948576;
        Thu, 17 Oct 2019 13:42:28 -0700 (PDT)
Received: from dtor-ws.mtv.corp.google.com ([2620:15c:202:201:3adc:b08c:7acc:b325])
        by smtp.gmail.com with ESMTPSA id b3sm4626365pfd.125.2019.10.17.13.42.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Oct 2019 13:42:28 -0700 (PDT)
From:   Dmitry Torokhov <dmitry.torokhov@gmail.com>
To:     linux-input@vger.kernel.org
Cc:     Allison Randal <allison@lohutok.net>,
        Anson Huang <Anson.Huang@nxp.com>,
        Dong Aisheng <aisheng.dong@nxp.com>,
        Jacky Bai <ping.bai@nxp.com>,
        Marco Felsch <m.felsch@pengutronix.de>,
        =?UTF-8?q?Ronald=20Tschal=C3=A4r?= <ronald@innovation.ch>,
        Stefan Agner <stefan@agner.ch>, linux-kernel@vger.kernel.org
Subject: [PATCH 05/22] Input: adc-keys - switch to using polled mode of input devices
Date:   Thu, 17 Oct 2019 13:41:59 -0700
Message-Id: <20191017204217.106453-6-dmitry.torokhov@gmail.com>
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
retiring input_polled_dev. This converts adc-keys driver to use the
polling mode of standard input devices and removes dependency on
INPUT_POLLDEV.

Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
---

 drivers/input/keyboard/Kconfig    |  1 -
 drivers/input/keyboard/adc-keys.c | 36 ++++++++++++++++---------------
 2 files changed, 19 insertions(+), 18 deletions(-)

diff --git a/drivers/input/keyboard/Kconfig b/drivers/input/keyboard/Kconfig
index a716a90de683..c6bf99d23b1a 100644
--- a/drivers/input/keyboard/Kconfig
+++ b/drivers/input/keyboard/Kconfig
@@ -16,7 +16,6 @@ if INPUT_KEYBOARD
 config KEYBOARD_ADC
 	tristate "ADC Ladder Buttons"
 	depends on IIO
-	select INPUT_POLLDEV
 	help
 	  This driver implements support for buttons connected
 	  to an ADC using a resistor ladder.
diff --git a/drivers/input/keyboard/adc-keys.c b/drivers/input/keyboard/adc-keys.c
index 9885fd56f5f9..6d5be48d1b3d 100644
--- a/drivers/input/keyboard/adc-keys.c
+++ b/drivers/input/keyboard/adc-keys.c
@@ -9,7 +9,6 @@
 #include <linux/iio/consumer.h>
 #include <linux/iio/types.h>
 #include <linux/input.h>
-#include <linux/input-polldev.h>
 #include <linux/kernel.h>
 #include <linux/module.h>
 #include <linux/of.h>
@@ -30,9 +29,9 @@ struct adc_keys_state {
 	const struct adc_keys_button *map;
 };
 
-static void adc_keys_poll(struct input_polled_dev *dev)
+static void adc_keys_poll(struct input_dev *input)
 {
-	struct adc_keys_state *st = dev->private;
+	struct adc_keys_state *st = input_get_drvdata(input);
 	int i, value, ret;
 	u32 diff, closest = 0xffffffff;
 	int keycode = 0;
@@ -55,12 +54,12 @@ static void adc_keys_poll(struct input_polled_dev *dev)
 		keycode = 0;
 
 	if (st->last_key && st->last_key != keycode)
-		input_report_key(dev->input, st->last_key, 0);
+		input_report_key(input, st->last_key, 0);
 
 	if (keycode)
-		input_report_key(dev->input, keycode, 1);
+		input_report_key(input, keycode, 1);
 
-	input_sync(dev->input);
+	input_sync(input);
 	st->last_key = keycode;
 }
 
@@ -108,7 +107,6 @@ static int adc_keys_probe(struct platform_device *pdev)
 {
 	struct device *dev = &pdev->dev;
 	struct adc_keys_state *st;
-	struct input_polled_dev *poll_dev;
 	struct input_dev *input;
 	enum iio_chan_type type;
 	int i, value;
@@ -145,19 +143,13 @@ static int adc_keys_probe(struct platform_device *pdev)
 	if (error)
 		return error;
 
-	poll_dev = devm_input_allocate_polled_device(dev);
-	if (!poll_dev) {
+	input = devm_input_allocate_device(dev);
+	if (!input) {
 		dev_err(dev, "failed to allocate input device\n");
 		return -ENOMEM;
 	}
 
-	if (!device_property_read_u32(dev, "poll-interval", &value))
-		poll_dev->poll_interval = value;
-
-	poll_dev->poll = adc_keys_poll;
-	poll_dev->private = st;
-
-	input = poll_dev->input;
+	input_set_drvdata(input, st);
 
 	input->name = pdev->name;
 	input->phys = "adc-keys/input0";
@@ -174,7 +166,17 @@ static int adc_keys_probe(struct platform_device *pdev)
 	if (device_property_read_bool(dev, "autorepeat"))
 		__set_bit(EV_REP, input->evbit);
 
-	error = input_register_polled_device(poll_dev);
+
+	error = input_setup_polling(input, adc_keys_poll);
+	if (error) {
+		dev_err(dev, "Unable to set up polling: %d\n", error);
+		return error;
+	}
+
+	if (!device_property_read_u32(dev, "poll-interval", &value))
+		input_set_poll_interval(input, value);
+
+	error = input_register_device(input);
 	if (error) {
 		dev_err(dev, "Unable to register input device: %d\n", error);
 		return error;
-- 
2.23.0.866.gb869b98d4c-goog

