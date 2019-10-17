Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C393EDB881
	for <lists+linux-input@lfdr.de>; Thu, 17 Oct 2019 22:43:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2502911AbfJQUms (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 17 Oct 2019 16:42:48 -0400
Received: from mail-pf1-f195.google.com ([209.85.210.195]:44135 "EHLO
        mail-pf1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2502847AbfJQUmr (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Thu, 17 Oct 2019 16:42:47 -0400
Received: by mail-pf1-f195.google.com with SMTP id q21so2360330pfn.11;
        Thu, 17 Oct 2019 13:42:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=GEKRNk3+QkHLGS5SoKpdCHIgbctxhbvYiOrQ84TzMNs=;
        b=hY7q6TdyrEkXN/Xfmg7eHuNh6G2X8Ih8dc8Auh5ky5Ji0SRfN5zs/D50sXgocYLecb
         7x3pDa/f2OFRqW1IflBmLaR1XG0f+C6Be3bvN6pPTxRd0aABI0an7pah2Afpf2N4T1AC
         WJUqw+dtx9bjP/IJDEMCXyguBN96emVQ7scdzhbW/tFGUdWapD+m7D23SEdguPSTOAKs
         THjmEiYuhO6xGYXLqyRFXaGYGmtYLK4bQOMamXnwGj8de3pq7xk3wJh7x4mjerXkxdl3
         mlcX7tCeQuGipMayOTJMnl9crGbCg996IknwnutfG/JKnx5YLHoa7I0keeZB9AgGM2Eo
         BJ/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=GEKRNk3+QkHLGS5SoKpdCHIgbctxhbvYiOrQ84TzMNs=;
        b=S1y2ZjGuXAZb3GeH+3kZ1QCR7b1ir42HwunI3lU5SvtNPQlpoxSfboke6ZC0uUlyDC
         Qs2iHBaRCyxMgdf7VlUjUKYaucwkeqQeq7Vk2gt+ISL+Guwpq5u95KgudjSd752h/o/w
         R8DO3vrEc1hq+cZ+ERGWHhyL8Nl2dlND3fbSrBM78Ll9pZ2fVYBmxpMuQlEdC88Sl5K8
         mDMhYXascgkttypC1FW6E2FDNwYsOr6RzO/axWyrMp3LTuAx0ie7+W7bx5LGRHhXs3bc
         1ARGbmWC2wYqvWw9Tge4T3APn4DQXbY1dSASFEPC3UH0wL+wo1YMugXMsVCl0sruGIJV
         yMjA==
X-Gm-Message-State: APjAAAX50o5ad0ZFTYHqcq4fWa2ZmxsAK2tNl+LtegXeRX3fSUFXVa0X
        4zFvCiq5tSqeMBqd2x9hHoEpBz60
X-Google-Smtp-Source: APXvYqzg9ZKoArye3kOHPW48Es/ba5aPjwjIw9jZ6abbc53culSCzhD4LvQi5DqApogShAzfCU7kEw==
X-Received: by 2002:a17:90a:2522:: with SMTP id j31mr6575663pje.123.1571344966474;
        Thu, 17 Oct 2019 13:42:46 -0700 (PDT)
Received: from dtor-ws.mtv.corp.google.com ([2620:15c:202:201:3adc:b08c:7acc:b325])
        by smtp.gmail.com with ESMTPSA id b3sm4626365pfd.125.2019.10.17.13.42.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Oct 2019 13:42:45 -0700 (PDT)
From:   Dmitry Torokhov <dmitry.torokhov@gmail.com>
To:     linux-input@vger.kernel.org
Cc:     Allison Randal <allison@lohutok.net>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Brian Masney <masneyb@onstation.org>,
        Luca Weiss <luca@z3ntu.xyz>,
        Maximilian Luz <luzmaximilian@gmail.com>,
        Richard Fontana <rfontana@redhat.com>,
        linux-kernel@vger.kernel.org
Subject: [PATCH 18/22] Input: mma8450 - switch to using polled mode of input devices
Date:   Thu, 17 Oct 2019 13:42:12 -0700
Message-Id: <20191017204217.106453-19-dmitry.torokhov@gmail.com>
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
retiring input_polled_dev. This converts mma8450 driver to use the polling
mode of standard input devices and removes dependency on INPUT_POLLDEV.

Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
---

 drivers/input/misc/Kconfig   |   1 -
 drivers/input/misc/mma8450.c | 101 ++++++++++++++++-------------------
 2 files changed, 46 insertions(+), 56 deletions(-)

diff --git a/drivers/input/misc/Kconfig b/drivers/input/misc/Kconfig
index b108c992bb7a..e1309cb190e1 100644
--- a/drivers/input/misc/Kconfig
+++ b/drivers/input/misc/Kconfig
@@ -246,7 +246,6 @@ config INPUT_MC13783_PWRBUTTON
 config INPUT_MMA8450
 	tristate "MMA8450 - Freescale's 3-Axis, 8/12-bit Digital Accelerometer"
 	depends on I2C
-	select INPUT_POLLDEV
 	help
 	  Say Y here if you want to support Freescale's MMA8450 Accelerometer
 	  through I2C interface.
diff --git a/drivers/input/misc/mma8450.c b/drivers/input/misc/mma8450.c
index 49f5242bc54c..1b5a5e19230a 100644
--- a/drivers/input/misc/mma8450.c
+++ b/drivers/input/misc/mma8450.c
@@ -10,7 +10,7 @@
 #include <linux/slab.h>
 #include <linux/delay.h>
 #include <linux/i2c.h>
-#include <linux/input-polldev.h>
+#include <linux/input.h>
 #include <linux/of_device.h>
 
 #define MMA8450_DRV_NAME	"mma8450"
@@ -39,15 +39,8 @@
 #define MMA8450_CTRL_REG1	0x38
 #define MMA8450_CTRL_REG2	0x39
 
-/* mma8450 status */
-struct mma8450 {
-	struct i2c_client	*client;
-	struct input_polled_dev	*idev;
-};
-
-static int mma8450_read(struct mma8450 *m, unsigned off)
+static int mma8450_read(struct i2c_client *c, unsigned int off)
 {
-	struct i2c_client *c = m->client;
 	int ret;
 
 	ret = i2c_smbus_read_byte_data(c, off);
@@ -59,9 +52,8 @@ static int mma8450_read(struct mma8450 *m, unsigned off)
 	return ret;
 }
 
-static int mma8450_write(struct mma8450 *m, unsigned off, u8 v)
+static int mma8450_write(struct i2c_client *c, unsigned int off, u8 v)
 {
-	struct i2c_client *c = m->client;
 	int error;
 
 	error = i2c_smbus_write_byte_data(c, off, v);
@@ -75,10 +67,9 @@ static int mma8450_write(struct mma8450 *m, unsigned off, u8 v)
 	return 0;
 }
 
-static int mma8450_read_block(struct mma8450 *m, unsigned off,
+static int mma8450_read_block(struct i2c_client *c, unsigned int off,
 			      u8 *buf, size_t size)
 {
-	struct i2c_client *c = m->client;
 	int err;
 
 	err = i2c_smbus_read_i2c_block_data(c, off, size, buf);
@@ -92,21 +83,21 @@ static int mma8450_read_block(struct mma8450 *m, unsigned off,
 	return 0;
 }
 
-static void mma8450_poll(struct input_polled_dev *dev)
+static void mma8450_poll(struct input_dev *input)
 {
-	struct mma8450 *m = dev->private;
+	struct i2c_client *c = input_get_drvdata(input);
 	int x, y, z;
 	int ret;
 	u8 buf[6];
 
-	ret = mma8450_read(m, MMA8450_STATUS);
+	ret = mma8450_read(c, MMA8450_STATUS);
 	if (ret < 0)
 		return;
 
 	if (!(ret & MMA8450_STATUS_ZXYDR))
 		return;
 
-	ret = mma8450_read_block(m, MMA8450_OUT_X_LSB, buf, sizeof(buf));
+	ret = mma8450_read_block(c, MMA8450_OUT_X_LSB, buf, sizeof(buf));
 	if (ret < 0)
 		return;
 
@@ -114,41 +105,42 @@ static void mma8450_poll(struct input_polled_dev *dev)
 	y = ((int)(s8)buf[3] << 4) | (buf[2] & 0xf);
 	z = ((int)(s8)buf[5] << 4) | (buf[4] & 0xf);
 
-	input_report_abs(dev->input, ABS_X, x);
-	input_report_abs(dev->input, ABS_Y, y);
-	input_report_abs(dev->input, ABS_Z, z);
-	input_sync(dev->input);
+	input_report_abs(input, ABS_X, x);
+	input_report_abs(input, ABS_Y, y);
+	input_report_abs(input, ABS_Z, z);
+	input_sync(input);
 }
 
 /* Initialize the MMA8450 chip */
-static void mma8450_open(struct input_polled_dev *dev)
+static int mma8450_open(struct input_dev *input)
 {
-	struct mma8450 *m = dev->private;
+	struct i2c_client *c = input_get_drvdata(input);
 	int err;
 
 	/* enable all events from X/Y/Z, no FIFO */
-	err = mma8450_write(m, MMA8450_XYZ_DATA_CFG, 0x07);
+	err = mma8450_write(c, MMA8450_XYZ_DATA_CFG, 0x07);
 	if (err)
-		return;
+		return err;
 
 	/*
 	 * Sleep mode poll rate - 50Hz
 	 * System output data rate - 400Hz
 	 * Full scale selection - Active, +/- 2G
 	 */
-	err = mma8450_write(m, MMA8450_CTRL_REG1, 0x01);
-	if (err < 0)
-		return;
+	err = mma8450_write(c, MMA8450_CTRL_REG1, 0x01);
+	if (err)
+		return err;
 
 	msleep(MODE_CHANGE_DELAY_MS);
+	return 0;
 }
 
-static void mma8450_close(struct input_polled_dev *dev)
+static void mma8450_close(struct input_dev *input)
 {
-	struct mma8450 *m = dev->private;
+	struct i2c_client *c = input_get_drvdata(input);
 
-	mma8450_write(m, MMA8450_CTRL_REG1, 0x00);
-	mma8450_write(m, MMA8450_CTRL_REG2, 0x01);
+	mma8450_write(c, MMA8450_CTRL_REG1, 0x00);
+	mma8450_write(c, MMA8450_CTRL_REG2, 0x01);
 }
 
 /*
@@ -157,38 +149,37 @@ static void mma8450_close(struct input_polled_dev *dev)
 static int mma8450_probe(struct i2c_client *c,
 			 const struct i2c_device_id *id)
 {
-	struct input_polled_dev *idev;
-	struct mma8450 *m;
+	struct input_dev *input;
 	int err;
 
-	m = devm_kzalloc(&c->dev, sizeof(*m), GFP_KERNEL);
-	if (!m)
+	input = devm_input_allocate_device(&c->dev);
+	if (!input)
 		return -ENOMEM;
 
-	idev = devm_input_allocate_polled_device(&c->dev);
-	if (!idev)
-		return -ENOMEM;
+	input_set_drvdata(input, c);
+
+	input->name = MMA8450_DRV_NAME;
+	input->id.bustype = BUS_I2C;
+
+	input->open = mma8450_open;
+	input->close = mma8450_close;
 
-	m->client = c;
-	m->idev = idev;
+	input_set_abs_params(input, ABS_X, -2048, 2047, 32, 32);
+	input_set_abs_params(input, ABS_Y, -2048, 2047, 32, 32);
+	input_set_abs_params(input, ABS_Z, -2048, 2047, 32, 32);
 
-	idev->private		= m;
-	idev->input->name	= MMA8450_DRV_NAME;
-	idev->input->id.bustype	= BUS_I2C;
-	idev->poll		= mma8450_poll;
-	idev->poll_interval	= POLL_INTERVAL;
-	idev->poll_interval_max	= POLL_INTERVAL_MAX;
-	idev->open		= mma8450_open;
-	idev->close		= mma8450_close;
+	err = input_setup_polling(input, mma8450_poll);
+	if (err) {
+		dev_err(&c->dev, "failed to set up polling\n");
+		return err;
+	}
 
-	__set_bit(EV_ABS, idev->input->evbit);
-	input_set_abs_params(idev->input, ABS_X, -2048, 2047, 32, 32);
-	input_set_abs_params(idev->input, ABS_Y, -2048, 2047, 32, 32);
-	input_set_abs_params(idev->input, ABS_Z, -2048, 2047, 32, 32);
+	input_set_poll_interval(input, POLL_INTERVAL);
+	input_set_max_poll_interval(input, POLL_INTERVAL_MAX);
 
-	err = input_register_polled_device(idev);
+	err = input_register_device(input);
 	if (err) {
-		dev_err(&c->dev, "failed to register polled input device\n");
+		dev_err(&c->dev, "failed to register input device\n");
 		return err;
 	}
 
-- 
2.23.0.866.gb869b98d4c-goog

