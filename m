Return-Path: <linux-input+bounces-14734-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C8B6B57EB7
	for <lists+linux-input@lfdr.de>; Mon, 15 Sep 2025 16:20:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 19AAC4E216F
	for <lists+linux-input@lfdr.de>; Mon, 15 Sep 2025 14:20:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6C184322529;
	Mon, 15 Sep 2025 14:20:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="cxrGFFiY"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E88BD31D74E
	for <linux-input@vger.kernel.org>; Mon, 15 Sep 2025 14:20:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757946016; cv=none; b=YsMsHD2WuMTo70mSIBhK+/Un3sj/k5RxN1mAwyVr8jNB995KhHTJZ/FGI8jdXGXB0pJUHGyxY7Hk2Wi9lk5wDmn7WvJYNcD4SnXqRnxATJCF7JTrGZb1Ma3BSe5433PKLF/4KLgesjqBRxNIxZpMZRuUIQTZyzJs/iIExAyqmpU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757946016; c=relaxed/simple;
	bh=IaKoxFq9bosUrFMFRmC4pglgB2Ez6v2Wwe4EF54jWxA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=DkouekPnhxQCUjEshoO6NhyiVBN/Wws61hWnbSEz4jHAb05YMf9lMK0OiHtmd8s2lzTbAF7Ti5fiEGPD6VOwJVCmZL5Ra4dqo4eZf07PXNo2cbnsMBiBJD7YEvNFBMHRmSa0uuQikj4c4fnNOlGCZwwfdfRvD//YgQ2wwA50REM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=cxrGFFiY; arc=none smtp.client-ip=209.85.221.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-3e98c5adbbeso710660f8f.0
        for <linux-input@vger.kernel.org>; Mon, 15 Sep 2025 07:20:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1757946012; x=1758550812; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=SAAhdahObRTXBffDn8987Td/pNcUh1CI1nUDnSU/rNo=;
        b=cxrGFFiY2LMs8Il2T0Qf6j9elJG9vmWZJ+90+IaOTegBj+8TNAuVthPl0GqgjuOsMV
         BAI+XFijvCUFT1IW7UxNUBdELQqrevj9lU7ll4Yde5hvwHPsQ15TXH0iy3e2e+yTZwvo
         8HMJh7c7NgByXRN4uHD4o9RikOnlTVWtE7MiUDtbquSrcnPlYr9FE4BX7Jvp2hZIT1gs
         btdYghA1QLZyfAY2V8sAyuXPZ+g1kTJ6YdohZYtD0FkrWF5rzu4dYLRl7v7OY5JpYlTq
         9x7YGlN4m2U3P5aUfx1Qpd16G2+6arq9DVTkisvMY2GStUyyGUp5MDmMZBSUXaDQx2jY
         +Y+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757946012; x=1758550812;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=SAAhdahObRTXBffDn8987Td/pNcUh1CI1nUDnSU/rNo=;
        b=IkGiQiWTNV3Y2iVcx26lKKd5bGiiGNYRorLuy1RTzY13PINzVEveS9YNCEXGws5qj7
         lcfQvV++m8qvaAsFeQZPpRVXTbZRob03XR4JDlvXRhS9LT4x517EqvAUv8drbIPMUR/q
         yjgmEn8Q0KxjItmTdYuR6sKR76VC/aKFzcgBuPWX6Mq1ByQEgAz3oEWGLqBxakictW4D
         HpuhKnNjxBkKMu2pHKgv7zcZ/rvNuI/I99D4GlNXaKq0wkqpUkf5/uDhw2PrjP5/1ejj
         +xemGu1oNGyF5YEkVFilIE2uTHURVgiJIiPPQvxpiQEyXq7wYso5TAUsTJzoxasdwjT8
         FqJw==
X-Forwarded-Encrypted: i=1; AJvYcCXUecpkB7XhCVIV0Q16qzvsbJJT248KAxMr6k5SMX4VZw38m7jXYrUw1RlQHvgE1Sy5WQ7aao+6vs37Bw==@vger.kernel.org
X-Gm-Message-State: AOJu0YwaC8qJbgk/1gyUtlZ3QJMA7DMaSc+4PshvfaXjbJqgVnsdAF6n
	jcDQ9b18Kx3y/SVm1WZwJeqmjXXAgWnayb+pceK6lcLFOToR14d+YV6E22haBRUXXtA=
X-Gm-Gg: ASbGncv/Bi8R1EcVCLcxhMBpsAlWFDICs4v0ro7bgqem5VU3SKOgc3URV3LXHtuRHiX
	S8r75WZr5ePfYdT5AWGaJ2aIZB3e0anMTOaRtsuhHs/doC6IURkOkiLk6U2E8geWgd1jDVIh5Jl
	o7khloO6PLNI+QqyW2+f9s10GKdeeecrKcxsGWN5KEiYXaLsumqENlcGZZjSTJsEaGL/Sd0YPd1
	pBwuKPvVrAUHxuIDB2gyB6sZQStnKgMI+P+KtTqvxk75mK6AwRJDL4+5I/cOL6KwfplF/wnehaF
	tyG8Gu6ENeZ44hZUyOpPJFaLSZMfkJHUReifaw2AuTNAoHpdmeJZ7bUuvFAnysAlxaB1Em/AqxR
	TJ7mHmX+FoxWSuFf9Nw6h6WAUvADR01KBf/8=
X-Google-Smtp-Source: AGHT+IEzGre1dIp83vLTlA3sojlaeFrXKoLd050PHxQ/X6FOOB9Pbf0NxDTDzTJw5ypYJ6at6GDvdg==
X-Received: by 2002:a05:6000:2283:b0:3e7:48ab:7695 with SMTP id ffacd0b85a97d-3e7659f931fmr11354056f8f.59.1757946012024;
        Mon, 15 Sep 2025 07:20:12 -0700 (PDT)
Received: from [127.0.0.2] ([2a02:2454:ff21:41:eee1:5042:e713:2e9a])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3e7ff9f77c4sm11801928f8f.27.2025.09.15.07.20.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Sep 2025 07:20:11 -0700 (PDT)
From: Stephan Gerhold <stephan.gerhold@linaro.org>
Date: Mon, 15 Sep 2025 16:19:57 +0200
Subject: [PATCH v5 2/2] Input: add Himax HX852x(ES) touchscreen driver
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250915-hx852x-v5-2-b938182f1056@linaro.org>
References: <20250915-hx852x-v5-0-b938182f1056@linaro.org>
In-Reply-To: <20250915-hx852x-v5-0-b938182f1056@linaro.org>
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Henrik Rydberg <rydberg@bitmath.org>, 
 Jeff LaBundy <jeff@labundy.com>, 
 Jonathan Albrieux <jonathan.albrieux@gmail.com>, 
 linux-input@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Stephan Gerhold <stephan@gerhold.net>
X-Mailer: b4 0.14.2

From: Stephan Gerhold <stephan@gerhold.net>

Add a simple driver for the Himax HX852x(ES) touch panel controller,
with support for multi-touch and capacitive touch keys.

The driver is somewhat based on sample code from Himax. However, that
code was rather confusing, so that we spent a significant amount of
time just trying to understand the packet format and register commands.
In this driver they are described with clean structs and defines rather
than magic numbers and offset calculations.

Co-developed-by: Jonathan Albrieux <jonathan.albrieux@gmail.com>
Signed-off-by: Jonathan Albrieux <jonathan.albrieux@gmail.com>
Reviewed-by: Jeff LaBundy <jeff@labundy.com>
Signed-off-by: Stephan Gerhold <stephan@gerhold.net>
---
 MAINTAINERS                              |   7 +
 drivers/input/touchscreen/Kconfig        |  10 +
 drivers/input/touchscreen/Makefile       |   1 +
 drivers/input/touchscreen/himax_hx852x.c | 500 +++++++++++++++++++++++++++++++
 4 files changed, 518 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index daf520a13bdf6a991c0160a96620f40308c29ee0..8d9c8d68f3fd0d50db0235cd17c4d1f1021a78be 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -10965,6 +10965,13 @@ S:	Maintained
 F:	Documentation/devicetree/bindings/input/touchscreen/himax,hx83112b.yaml
 F:	drivers/input/touchscreen/himax_hx83112b.c
 
+HIMAX HX852X TOUCHSCREEN DRIVER
+M:	Stephan Gerhold <stephan@gerhold.net>
+L:	linux-input@vger.kernel.org
+S:	Maintained
+F:	Documentation/devicetree/bindings/input/touchscreen/himax,hx852es.yaml
+F:	drivers/input/touchscreen/himax_hx852x.c
+
 HIPPI
 M:	Jes Sorensen <jes@trained-monkey.org>
 S:	Maintained
diff --git a/drivers/input/touchscreen/Kconfig b/drivers/input/touchscreen/Kconfig
index 196905162945d59e775c3e0bff6540a82842229a..762d71f79abd43ebd58f9caf3c99f07a276c4b16 100644
--- a/drivers/input/touchscreen/Kconfig
+++ b/drivers/input/touchscreen/Kconfig
@@ -441,6 +441,16 @@ config TOUCHSCREEN_HIDEEP
 	  To compile this driver as a module, choose M here : the
 	  module will be called hideep_ts.
 
+config TOUCHSCREEN_HIMAX_HX852X
+	tristate "Himax HX852x(ES) touchscreen"
+	depends on I2C
+	help
+	  Say Y here if you have a Himax HX852x(ES) touchscreen.
+	  If unsure, say N.
+
+	  To compile this driver as a module, choose M here: the module
+	  will be called himax_hx852x.
+
 config TOUCHSCREEN_HYCON_HY46XX
 	tristate "Hycon hy46xx touchscreen support"
 	depends on I2C
diff --git a/drivers/input/touchscreen/Makefile b/drivers/input/touchscreen/Makefile
index 97a025c6a3770fb80255246eb63c11688ebd79eb..1e7c2f324e12a413e112ad0a116784f0042e2af7 100644
--- a/drivers/input/touchscreen/Makefile
+++ b/drivers/input/touchscreen/Makefile
@@ -49,6 +49,7 @@ obj-$(CONFIG_TOUCHSCREEN_GOODIX_BERLIN_CORE)	+= goodix_berlin_core.o
 obj-$(CONFIG_TOUCHSCREEN_GOODIX_BERLIN_I2C)	+= goodix_berlin_i2c.o
 obj-$(CONFIG_TOUCHSCREEN_GOODIX_BERLIN_SPI)	+= goodix_berlin_spi.o
 obj-$(CONFIG_TOUCHSCREEN_HIDEEP)	+= hideep.o
+obj-$(CONFIG_TOUCHSCREEN_HIMAX_HX852X)	+= himax_hx852x.o
 obj-$(CONFIG_TOUCHSCREEN_HYNITRON_CSTXXX)	+= hynitron_cstxxx.o
 obj-$(CONFIG_TOUCHSCREEN_ILI210X)	+= ili210x.o
 obj-$(CONFIG_TOUCHSCREEN_ILITEK)	+= ilitek_ts_i2c.o
diff --git a/drivers/input/touchscreen/himax_hx852x.c b/drivers/input/touchscreen/himax_hx852x.c
new file mode 100644
index 0000000000000000000000000000000000000000..3a418557645b561ddf3df342a104c012f57c9dc0
--- /dev/null
+++ b/drivers/input/touchscreen/himax_hx852x.c
@@ -0,0 +1,500 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Himax HX852x(ES) Touchscreen Driver
+ * Copyright (c) 2020-2024 Stephan Gerhold <stephan@gerhold.net>
+ * Copyright (c) 2020 Jonathan Albrieux <jonathan.albrieux@gmail.com>
+ *
+ * Based on the Himax Android Driver Sample Code Ver 0.3 for HMX852xES chipset:
+ * Copyright (c) 2014 Himax Corporation.
+ */
+
+#include <linux/delay.h>
+#include <linux/gpio/consumer.h>
+#include <linux/i2c.h>
+#include <linux/input.h>
+#include <linux/input/mt.h>
+#include <linux/input/touchscreen.h>
+#include <linux/interrupt.h>
+#include <linux/kernel.h>
+#include <linux/mod_devicetable.h>
+#include <linux/module.h>
+#include <linux/of.h>
+#include <linux/regulator/consumer.h>
+#include <linux/unaligned.h>
+
+#define HX852X_COORD_SIZE(fingers)	((fingers) * sizeof(struct hx852x_coord))
+#define HX852X_WIDTH_SIZE(fingers)	ALIGN(fingers, 4)
+#define HX852X_BUF_SIZE(fingers)	(HX852X_COORD_SIZE(fingers) + \
+					 HX852X_WIDTH_SIZE(fingers) + \
+					 sizeof(struct hx852x_touch_info))
+
+#define HX852X_MAX_FINGERS		12
+#define HX852X_MAX_KEY_COUNT		4
+#define HX852X_MAX_BUF_SIZE		HX852X_BUF_SIZE(HX852X_MAX_FINGERS)
+
+#define HX852X_TS_SLEEP_IN		0x80
+#define HX852X_TS_SLEEP_OUT		0x81
+#define HX852X_TS_SENSE_OFF		0x82
+#define HX852X_TS_SENSE_ON		0x83
+#define HX852X_READ_ONE_EVENT		0x85
+#define HX852X_READ_ALL_EVENTS		0x86
+#define HX852X_READ_LATEST_EVENT	0x87
+#define HX852X_CLEAR_EVENT_STACK	0x88
+
+#define HX852X_REG_SRAM_SWITCH		0x8c
+#define HX852X_REG_SRAM_ADDR		0x8b
+#define HX852X_REG_FLASH_RPLACE		0x5a
+
+#define HX852X_SRAM_SWITCH_TEST_MODE	0x14
+#define HX852X_SRAM_ADDR_CONFIG		0x7000
+
+struct hx852x {
+	struct i2c_client *client;
+	struct input_dev *input_dev;
+	struct touchscreen_properties props;
+	struct gpio_desc *reset_gpiod;
+	struct regulator_bulk_data supplies[2];
+	unsigned int max_fingers;
+	unsigned int keycount;
+	unsigned int keycodes[HX852X_MAX_KEY_COUNT];
+};
+
+struct hx852x_config {
+	u8 rx_num;
+	u8 tx_num;
+	u8 max_pt;
+	u8 padding1[3];
+	__be16 x_res;
+	__be16 y_res;
+	u8 padding2[2];
+} __packed __aligned(4);
+
+struct hx852x_coord {
+	__be16 x;
+	__be16 y;
+} __packed __aligned(4);
+
+struct hx852x_touch_info {
+	u8 finger_num;
+	__le16 finger_pressed;
+	u8 padding;
+} __packed __aligned(4);
+
+static int hx852x_i2c_read(struct hx852x *hx, u8 cmd, void *data, u16 len)
+{
+	struct i2c_client *client = hx->client;
+	int ret;
+
+	struct i2c_msg msg[] = {
+		{
+			.addr = client->addr,
+			.flags = 0,
+			.len = 1,
+			.buf = &cmd,
+		},
+		{
+			.addr = client->addr,
+			.flags = I2C_M_RD,
+			.len = len,
+			.buf = data,
+		},
+	};
+
+	ret = i2c_transfer(client->adapter, msg, ARRAY_SIZE(msg));
+	if (ret != ARRAY_SIZE(msg)) {
+		dev_err(&client->dev, "failed to read %#x: %d\n", cmd, ret);
+		return ret;
+	}
+
+	return 0;
+}
+
+static int hx852x_power_on(struct hx852x *hx)
+{
+	struct device *dev = &hx->client->dev;
+	int error;
+
+	error = regulator_bulk_enable(ARRAY_SIZE(hx->supplies), hx->supplies);
+	if (error) {
+		dev_err(dev, "failed to enable regulators: %d\n", error);
+		return error;
+	}
+
+	gpiod_set_value_cansleep(hx->reset_gpiod, 1);
+	msleep(20);
+	gpiod_set_value_cansleep(hx->reset_gpiod, 0);
+	msleep(50);
+
+	return 0;
+}
+
+static int hx852x_start(struct hx852x *hx)
+{
+	struct device *dev = &hx->client->dev;
+	int error;
+
+	error = i2c_smbus_write_byte(hx->client, HX852X_TS_SLEEP_OUT);
+	if (error) {
+		dev_err(dev, "failed to send TS_SLEEP_OUT: %d\n", error);
+		return error;
+	}
+	msleep(30);
+
+	error = i2c_smbus_write_byte(hx->client, HX852X_TS_SENSE_ON);
+	if (error) {
+		dev_err(dev, "failed to send TS_SENSE_ON: %d\n", error);
+		return error;
+	}
+	msleep(20);
+
+	return 0;
+}
+
+static int hx852x_stop(struct hx852x *hx)
+{
+	struct device *dev = &hx->client->dev;
+	int error;
+
+	error = i2c_smbus_write_byte(hx->client, HX852X_TS_SENSE_OFF);
+	if (error) {
+		dev_err(dev, "failed to send TS_SENSE_OFF: %d\n", error);
+		return error;
+	}
+	msleep(20);
+
+	error = i2c_smbus_write_byte(hx->client, HX852X_TS_SLEEP_IN);
+	if (error) {
+		dev_err(dev, "failed to send TS_SLEEP_IN: %d\n", error);
+		return error;
+	}
+	msleep(30);
+
+	return 0;
+}
+
+static int hx852x_power_off(struct hx852x *hx)
+{
+	struct device *dev = &hx->client->dev;
+	int error;
+
+	error = regulator_bulk_disable(ARRAY_SIZE(hx->supplies), hx->supplies);
+	if (error) {
+		dev_err(dev, "failed to disable regulators: %d\n", error);
+		return error;
+	}
+
+	return 0;
+}
+
+static int hx852x_read_config(struct hx852x *hx)
+{
+	struct device *dev = &hx->client->dev;
+	struct hx852x_config conf;
+	int x_res, y_res;
+	int error;
+
+	error = hx852x_power_on(hx);
+	if (error)
+		return error;
+
+	/* Sensing must be turned on briefly to load the config */
+	error = hx852x_start(hx);
+	if (error)
+		goto err_power_off;
+
+	error = hx852x_stop(hx);
+	if (error)
+		goto err_power_off;
+
+	error = i2c_smbus_write_byte_data(hx->client, HX852X_REG_SRAM_SWITCH,
+					  HX852X_SRAM_SWITCH_TEST_MODE);
+	if (error)
+		goto err_power_off;
+
+	error = i2c_smbus_write_word_data(hx->client, HX852X_REG_SRAM_ADDR,
+					  HX852X_SRAM_ADDR_CONFIG);
+	if (error)
+		goto err_test_mode;
+
+	error = hx852x_i2c_read(hx, HX852X_REG_FLASH_RPLACE, &conf, sizeof(conf));
+	if (error)
+		goto err_test_mode;
+
+	x_res = be16_to_cpu(conf.x_res);
+	y_res = be16_to_cpu(conf.y_res);
+	hx->max_fingers = (conf.max_pt & 0xf0) >> 4;
+	dev_dbg(dev, "x res: %u, y res: %u, max fingers: %u\n",
+		x_res, y_res, hx->max_fingers);
+
+	if (hx->max_fingers > HX852X_MAX_FINGERS) {
+		dev_err(dev, "max supported fingers: %u, found: %u\n",
+			HX852X_MAX_FINGERS, hx->max_fingers);
+		error = -EINVAL;
+		goto err_test_mode;
+	}
+
+	if (x_res && y_res) {
+		input_set_abs_params(hx->input_dev, ABS_MT_POSITION_X, 0, x_res - 1, 0, 0);
+		input_set_abs_params(hx->input_dev, ABS_MT_POSITION_Y, 0, y_res - 1, 0, 0);
+	}
+
+err_test_mode:
+	error = i2c_smbus_write_byte_data(hx->client, HX852X_REG_SRAM_SWITCH, 0) ? : error;
+err_power_off:
+	return hx852x_power_off(hx) ? : error;
+}
+
+static int hx852x_handle_events(struct hx852x *hx)
+{
+	/*
+	 * The event packets have variable size, depending on the amount of
+	 * supported fingers (hx->max_fingers). They are laid out as follows:
+	 *  - struct hx852x_coord[hx->max_fingers]: Coordinates for each finger
+	 *  - u8[ALIGN(hx->max_fingers, 4)]: Touch width for each finger
+	 *      with padding for 32-bit alignment
+	 *  - struct hx852x_touch_info
+	 *
+	 * Load everything into a 32-bit aligned buffer so the coordinates
+	 * can be assigned directly, without using get_unaligned_*().
+	 */
+	u8 buf[HX852X_MAX_BUF_SIZE] __aligned(4);
+	struct hx852x_coord *coord = (struct hx852x_coord *)buf;
+	u8 *width = &buf[HX852X_COORD_SIZE(hx->max_fingers)];
+	struct hx852x_touch_info *info = (struct hx852x_touch_info *)
+		&width[HX852X_WIDTH_SIZE(hx->max_fingers)];
+	unsigned long finger_pressed, key_pressed;
+	unsigned int i, x, y, w;
+	int error;
+
+	error = hx852x_i2c_read(hx, HX852X_READ_ALL_EVENTS, buf,
+				HX852X_BUF_SIZE(hx->max_fingers));
+	if (error)
+		return error;
+
+	finger_pressed = get_unaligned_le16(&info->finger_pressed);
+	key_pressed = finger_pressed >> HX852X_MAX_FINGERS;
+
+	/* All bits are set when no touch is detected */
+	if (info->finger_num == 0xff || !(info->finger_num & 0x0f))
+		finger_pressed = 0;
+	if (key_pressed == 0xf)
+		key_pressed = 0;
+
+	for_each_set_bit(i, &finger_pressed, hx->max_fingers) {
+		x = be16_to_cpu(coord[i].x);
+		y = be16_to_cpu(coord[i].y);
+		w = width[i];
+
+		input_mt_slot(hx->input_dev, i);
+		input_mt_report_slot_state(hx->input_dev, MT_TOOL_FINGER, 1);
+		touchscreen_report_pos(hx->input_dev, &hx->props, x, y, true);
+		input_report_abs(hx->input_dev, ABS_MT_TOUCH_MAJOR, w);
+	}
+	input_mt_sync_frame(hx->input_dev);
+
+	for (i = 0; i < hx->keycount; i++)
+		input_report_key(hx->input_dev, hx->keycodes[i], key_pressed & BIT(i));
+
+	input_sync(hx->input_dev);
+	return 0;
+}
+
+static irqreturn_t hx852x_interrupt(int irq, void *ptr)
+{
+	struct hx852x *hx = ptr;
+	int error;
+
+	error = hx852x_handle_events(hx);
+	if (error) {
+		dev_err_ratelimited(&hx->client->dev, "failed to handle events: %d\n", error);
+		return IRQ_NONE;
+	}
+
+	return IRQ_HANDLED;
+}
+
+static int hx852x_input_open(struct input_dev *dev)
+{
+	struct hx852x *hx = input_get_drvdata(dev);
+	int error;
+
+	error = hx852x_power_on(hx);
+	if (error)
+		return error;
+
+	error = hx852x_start(hx);
+	if (error) {
+		hx852x_power_off(hx);
+		return error;
+	}
+
+	enable_irq(hx->client->irq);
+	return 0;
+}
+
+static void hx852x_input_close(struct input_dev *dev)
+{
+	struct hx852x *hx = input_get_drvdata(dev);
+
+	hx852x_stop(hx);
+	disable_irq(hx->client->irq);
+	hx852x_power_off(hx);
+}
+
+static int hx852x_parse_properties(struct hx852x *hx)
+{
+	struct device *dev = &hx->client->dev;
+	int error, count;
+
+	count = device_property_count_u32(dev, "linux,keycodes");
+	if (count == -EINVAL) {
+		/* Property does not exist, keycodes are optional */
+		return 0;
+	} else if (count < 0) {
+		dev_err(dev, "Failed to read linux,keycodes: %d\n", count);
+		return count;
+	} else if (count > HX852X_MAX_KEY_COUNT) {
+		dev_err(dev, "max supported keys: %u, found: %u\n",
+			HX852X_MAX_KEY_COUNT, hx->keycount);
+		return -EINVAL;
+	}
+	hx->keycount = count;
+
+	error = device_property_read_u32_array(dev, "linux,keycodes",
+					       hx->keycodes, hx->keycount);
+	if (error) {
+		dev_err(dev, "failed to read linux,keycodes: %d\n", error);
+		return error;
+	}
+
+	return 0;
+}
+
+static int hx852x_probe(struct i2c_client *client)
+{
+	struct device *dev = &client->dev;
+	struct hx852x *hx;
+	int error, i;
+
+	if (!i2c_check_functionality(client->adapter, I2C_FUNC_I2C |
+				     I2C_FUNC_SMBUS_WRITE_BYTE |
+				     I2C_FUNC_SMBUS_WRITE_BYTE_DATA |
+				     I2C_FUNC_SMBUS_WRITE_WORD_DATA)) {
+		dev_err(dev, "not all required i2c functionality supported\n");
+		return -ENXIO;
+	}
+
+	hx = devm_kzalloc(dev, sizeof(*hx), GFP_KERNEL);
+	if (!hx)
+		return -ENOMEM;
+
+	hx->client = client;
+	hx->input_dev = devm_input_allocate_device(dev);
+	if (!hx->input_dev)
+		return -ENOMEM;
+
+	hx->input_dev->name = "Himax HX852x";
+	hx->input_dev->id.bustype = BUS_I2C;
+	hx->input_dev->open = hx852x_input_open;
+	hx->input_dev->close = hx852x_input_close;
+
+	i2c_set_clientdata(client, hx);
+	input_set_drvdata(hx->input_dev, hx);
+
+	hx->supplies[0].supply = "vcca";
+	hx->supplies[1].supply = "vccd";
+	error = devm_regulator_bulk_get(dev, ARRAY_SIZE(hx->supplies), hx->supplies);
+	if (error)
+		return dev_err_probe(dev, error, "failed to get regulators\n");
+
+	hx->reset_gpiod = devm_gpiod_get(dev, "reset", GPIOD_OUT_HIGH);
+	if (IS_ERR(hx->reset_gpiod))
+		return dev_err_probe(dev, PTR_ERR(hx->reset_gpiod),
+				     "failed to get reset gpio\n");
+
+	error = devm_request_threaded_irq(dev, client->irq, NULL, hx852x_interrupt,
+					  IRQF_ONESHOT | IRQF_NO_AUTOEN, NULL, hx);
+	if (error)
+		return dev_err_probe(dev, error, "failed to request irq %d", client->irq);
+
+	error = hx852x_read_config(hx);
+	if (error)
+		return error;
+
+	input_set_capability(hx->input_dev, EV_ABS, ABS_MT_POSITION_X);
+	input_set_capability(hx->input_dev, EV_ABS, ABS_MT_POSITION_Y);
+	input_set_abs_params(hx->input_dev, ABS_MT_TOUCH_MAJOR, 0, 255, 0, 0);
+
+	touchscreen_parse_properties(hx->input_dev, true, &hx->props);
+	error = hx852x_parse_properties(hx);
+	if (error)
+		return error;
+
+	hx->input_dev->keycode = hx->keycodes;
+	hx->input_dev->keycodemax = hx->keycount;
+	hx->input_dev->keycodesize = sizeof(hx->keycodes[0]);
+	for (i = 0; i < hx->keycount; i++)
+		input_set_capability(hx->input_dev, EV_KEY, hx->keycodes[i]);
+
+	error = input_mt_init_slots(hx->input_dev, hx->max_fingers,
+				    INPUT_MT_DIRECT | INPUT_MT_DROP_UNUSED);
+	if (error)
+		return dev_err_probe(dev, error, "failed to init MT slots\n");
+
+	error = input_register_device(hx->input_dev);
+	if (error)
+		return dev_err_probe(dev, error, "failed to register input device\n");
+
+	return 0;
+}
+
+static int hx852x_suspend(struct device *dev)
+{
+	struct hx852x *hx = dev_get_drvdata(dev);
+	int error = 0;
+
+	mutex_lock(&hx->input_dev->mutex);
+	if (input_device_enabled(hx->input_dev))
+		error = hx852x_stop(hx);
+	mutex_unlock(&hx->input_dev->mutex);
+
+	return error;
+}
+
+static int hx852x_resume(struct device *dev)
+{
+	struct hx852x *hx = dev_get_drvdata(dev);
+	int error = 0;
+
+	mutex_lock(&hx->input_dev->mutex);
+	if (input_device_enabled(hx->input_dev))
+		error = hx852x_start(hx);
+	mutex_unlock(&hx->input_dev->mutex);
+
+	return error;
+}
+
+static DEFINE_SIMPLE_DEV_PM_OPS(hx852x_pm_ops, hx852x_suspend, hx852x_resume);
+
+#ifdef CONFIG_OF
+static const struct of_device_id hx852x_of_match[] = {
+	{ .compatible = "himax,hx852es" },
+	{ }
+};
+MODULE_DEVICE_TABLE(of, hx852x_of_match);
+#endif
+
+static struct i2c_driver hx852x_driver = {
+	.probe = hx852x_probe,
+	.driver = {
+		.name = "himax_hx852x",
+		.pm = pm_sleep_ptr(&hx852x_pm_ops),
+		.of_match_table = of_match_ptr(hx852x_of_match),
+	},
+};
+module_i2c_driver(hx852x_driver);
+
+MODULE_DESCRIPTION("Himax HX852x(ES) Touchscreen Driver");
+MODULE_AUTHOR("Jonathan Albrieux <jonathan.albrieux@gmail.com>");
+MODULE_AUTHOR("Stephan Gerhold <stephan@gerhold.net>");
+MODULE_LICENSE("GPL");

-- 
2.50.1


