Return-Path: <linux-input+bounces-9869-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E5ACA2E352
	for <lists+linux-input@lfdr.de>; Mon, 10 Feb 2025 06:02:51 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id A93651636DD
	for <lists+linux-input@lfdr.de>; Mon, 10 Feb 2025 05:02:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 779D335977;
	Mon, 10 Feb 2025 05:02:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=kaechele.ca header.i=@kaechele.ca header.b="SPZlCrJ8"
X-Original-To: linux-input@vger.kernel.org
Received: from mail.kaechele.ca (mail.kaechele.ca [54.39.219.105])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA4D52F2A;
	Mon, 10 Feb 2025 05:02:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=54.39.219.105
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739163766; cv=none; b=S0XF0mISCBMf9ZC4F8Cqd9Y3+Jym2z8bmsggauajCLbzC5nZMsLW/qIf8684+3xkGhYXmT7vhiRjpSKkV47eF5msX4dvYWFDrosTeUocXAaH9908G74EBmB7bihMRH+BYi2rIaorxjwf7LwCg1RgxmTTMByhsO3UUJxRwlJupXo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739163766; c=relaxed/simple;
	bh=dj0TKfk5lmdhnyy8yBqB3UF6wNeDh11HLS3XDxff4F8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=JpYfhJ4A/J5ksFNaAJds2yjg5zc6H6RhBCidsP0uKurGqa72ghxrW+epzvNqkQr/9vUbiQvvtC2n0jSZwApk4Dmmv2ZSWIJml4+um+LpJ7MAd2kdfPttPax6KbXf3u9GL4ZgXTBNTh/SVv+RO0qWthFIPphdc2p0Xz0MyAKGN6g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=kaechele.ca; spf=pass smtp.mailfrom=kaechele.ca; dkim=pass (1024-bit key) header.d=kaechele.ca header.i=@kaechele.ca header.b=SPZlCrJ8; arc=none smtp.client-ip=54.39.219.105
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=kaechele.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kaechele.ca
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 2260EC006A;
	Mon, 10 Feb 2025 00:02:34 -0500 (EST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kaechele.ca; s=201907;
	t=1739163759;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=gGADIh97zIcbr/W+/NgjtXwdlW0zk4tHNG7sqPEye4E=;
	b=SPZlCrJ8hy9EbwZ3jYdHeS3rWbdQweVq7R7N8irmm7y8Su9FN9jIjJXnMUlXHRhivBWEyE
	InhqB9igKH/OV9IfKouI8QHaA0s4zawftEYbpGtuS/rkUkeK9Rkb/w4UQYE5pVY98kSAOy
	z3IQ/tWPiKOrxn3itllYQigqLI+5AkI=
From: Felix Kaechele <felix@kaechele.ca>
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: =?UTF-8?q?Barnab=C3=A1s=20Cz=C3=A9m=C3=A1n?= <barnabas.czeman@mainlining.org>,
	linux-input@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 1/1] Input: rmi_i2c: introduce reset GPIO handling
Date: Mon, 10 Feb 2025 00:02:09 -0500
Message-ID: <20250210050220.634497-2-felix@kaechele.ca>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250210050220.634497-1-felix@kaechele.ca>
References: <20250210050220.634497-1-felix@kaechele.ca>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3

Implement reset GPIO handling logic for the rmi_i2c driver. This logic
is required for some mobile devices to successfully initialize the touch
controller.

The timings for the assertion of the reset GPIO were derived from the
GPLv2+ licensed synaptics-dsx-v2.1 vendor driver release and research I
conducted into downstream device tree sources. Values of 10ms to 20ms
are commonly found.

Tested-On: Motorola Moto G5 Plus (XT1685 "potter")

Signed-off-by: Felix Kaechele <felix@kaechele.ca>
---
 drivers/input/rmi4/rmi_driver.c |  1 -
 drivers/input/rmi4/rmi_driver.h |  2 ++
 drivers/input/rmi4/rmi_i2c.c    | 23 +++++++++++++++++++++++
 3 files changed, 25 insertions(+), 1 deletion(-)

diff --git a/drivers/input/rmi4/rmi_driver.c b/drivers/input/rmi4/rmi_driver.c
index 2168b6cd7167..ff6aed6a11c1 100644
--- a/drivers/input/rmi4/rmi_driver.c
+++ b/drivers/input/rmi4/rmi_driver.c
@@ -30,7 +30,6 @@
 #define RMI4_PAGE_MASK 0xFF00
 
 #define RMI_DEVICE_RESET_CMD	0x01
-#define DEFAULT_RESET_DELAY_MS	100
 
 void rmi_free_function_list(struct rmi_device *rmi_dev)
 {
diff --git a/drivers/input/rmi4/rmi_driver.h b/drivers/input/rmi4/rmi_driver.h
index 3bfe9013043e..e01453bd680f 100644
--- a/drivers/input/rmi4/rmi_driver.h
+++ b/drivers/input/rmi4/rmi_driver.h
@@ -16,6 +16,8 @@
 #define SYNAPTICS_INPUT_DEVICE_NAME "Synaptics RMI4 Touch Sensor"
 #define SYNAPTICS_VENDOR_ID 0x06cb
 
+#define DEFAULT_RESET_DELAY_MS	100
+
 #define GROUP(_attrs) { \
 	.attrs = _attrs,  \
 }
diff --git a/drivers/input/rmi4/rmi_i2c.c b/drivers/input/rmi4/rmi_i2c.c
index 3c0c5fd44702..beff566ca2c8 100644
--- a/drivers/input/rmi4/rmi_i2c.c
+++ b/drivers/input/rmi4/rmi_i2c.c
@@ -4,6 +4,7 @@
  * Copyright (c) 2011 Unixphere
  */
 
+#include <linux/gpio/consumer.h>
 #include <linux/i2c.h>
 #include <linux/rmi.h>
 #include <linux/of.h>
@@ -26,7 +27,9 @@
  * @tx_buf_size: Size of the buffer
  *
  * @supplies: Array of voltage regulators
+ * @reset_gpio: Reference to the reset GPIO
  * @startup_delay: Milliseconds to pause after powering up the regulators
+ * @reset_delay: Milliseconds to pause after resetting the device
  */
 struct rmi_i2c_xport {
 	struct rmi_transport_dev xport;
@@ -39,7 +42,9 @@ struct rmi_i2c_xport {
 	size_t tx_buf_size;
 
 	struct regulator_bulk_data supplies[2];
+	struct gpio_desc *reset_gpio;
 	u32 startup_delay;
+	u32 reset_delay;
 };
 
 #define RMI_PAGE_SELECT_REGISTER 0xff
@@ -227,6 +232,15 @@ static int rmi_i2c_probe(struct i2c_client *client)
 		return -ENODEV;
 	}
 
+	rmi_i2c->reset_gpio = devm_gpiod_get_optional(&client->dev, "reset",
+						      GPIOD_OUT_HIGH);
+	if (IS_ERR(rmi_i2c->reset_gpio)) {
+		error = PTR_ERR(rmi_i2c->reset_gpio);
+		dev_err(&client->dev, "failed to get reset GPIO: %d\n", error);
+		return error;
+	}
+	gpiod_set_consumer_name(rmi_i2c->reset_gpio, "rmi4 reset");
+
 	rmi_i2c->supplies[0].supply = "vdd";
 	rmi_i2c->supplies[1].supply = "vio";
 	error = devm_regulator_bulk_get(&client->dev,
@@ -251,6 +265,15 @@ static int rmi_i2c_probe(struct i2c_client *client)
 
 	msleep(rmi_i2c->startup_delay);
 
+	if (rmi_i2c->reset_gpio) {
+		of_property_read_u32(client->dev.of_node, "syna,reset-delay-ms",
+				     &rmi_i2c->reset_delay);
+		gpiod_set_value_cansleep(rmi_i2c->reset_gpio, 1);
+		usleep_range(10000, 20000);
+		gpiod_set_value_cansleep(rmi_i2c->reset_gpio, 0);
+		msleep(rmi_i2c->reset_delay ?: DEFAULT_RESET_DELAY_MS);
+	}
+
 	rmi_i2c->client = client;
 	mutex_init(&rmi_i2c->page_mutex);
 
-- 
2.48.1


