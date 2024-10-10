Return-Path: <linux-input+bounces-7243-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 984E999887B
	for <lists+linux-input@lfdr.de>; Thu, 10 Oct 2024 15:58:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 0D31B283EBE
	for <lists+linux-input@lfdr.de>; Thu, 10 Oct 2024 13:58:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 967971C9DE9;
	Thu, 10 Oct 2024 13:58:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gerhold.net header.i=@gerhold.net header.b="TZ5dumYU";
	dkim=permerror (0-bit key) header.d=gerhold.net header.i=@gerhold.net header.b="iON9NR0M"
X-Original-To: linux-input@vger.kernel.org
Received: from mo4-p02-ob.smtp.rzone.de (mo4-p02-ob.smtp.rzone.de [85.215.255.82])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E42121C4604;
	Thu, 10 Oct 2024 13:57:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=85.215.255.82
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728568682; cv=pass; b=PdfVnhxFjWorHICyfMlCoip1q6LHkItBQN1J/gKuVqKSdDUs888+wJpp9WOeP5Fs4nZveG/rdP0wt+1ulOl2++onKnfCX4u+tFvg7V3x9IMs2Ow4AYbw6I6EJchq2h8OYLvU7SKiz1nnePTO7wXSTa9DjLBZRfAYlnuvktkxQ50=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728568682; c=relaxed/simple;
	bh=q1tKL13mICIv9fqBjZICOfPwIrVGvCrEsSKrBfCTRkU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=uZJ2kftUF5GM35EnV9+PUX8dq2EI7P91fzycwGuJ+IkTA3FiDZ8JpRoJ2FFAyyykNc1CpPW8ON5oATqQxXtDX+USNOMYE3/GDuLBBCLP+sMlXEH27FnDMzEbTQ14aNg3nJg1TRrNdAUkdUCdPNuCaYSB/fRgR953NEWDbiIrM7g=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=gerhold.net; spf=none smtp.mailfrom=gerhold.net; dkim=pass (2048-bit key) header.d=gerhold.net header.i=@gerhold.net header.b=TZ5dumYU; dkim=permerror (0-bit key) header.d=gerhold.net header.i=@gerhold.net header.b=iON9NR0M; arc=pass smtp.client-ip=85.215.255.82
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=gerhold.net
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=gerhold.net
ARC-Seal: i=1; a=rsa-sha256; t=1728567944; cv=none;
    d=strato.com; s=strato-dkim-0002;
    b=PqMGvkUjWBsSsOofe042UuXVxl5vpQ0A7ver1c0PKxCRJz5dHIHAftU3JRzlA1rwn9
    Yj57xyHzJPCOdkUWTDYH0+dFuuZeMh8MPJ404aASACDajM6hvqa9Ce9Jkr7S3E90frB5
    msiIRhbSjpBLw/8/jS81hUD7xbnGnkw/CMuQtogUGFZALNIfNGhx7ZC4GEJpP/AGtenG
    2TS0wdBTGhMjwcECaezmOmwgEBqoiwa6Me/3nWDpb/mXOIzLUl5ZFfnZ9iLJlYo6kGNR
    O1sRReqwaM/d1v02KuGK+nplXTemClwuYtURDOGDU6ROfV32SqHS0Aaqd7+I5ZEpQhbr
    wW/A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; t=1728567944;
    s=strato-dkim-0002; d=strato.com;
    h=Cc:To:In-Reply-To:References:Message-Id:Subject:Date:From:Cc:Date:
    From:Subject:Sender;
    bh=S46j5ajWST/iBR7dSUoAnnVj94ahqxzUr5SEMsFofA0=;
    b=R8fA7oUupLsXLNNpzNYJ8bv4yxckU4hRY1ec428PNbUp9bsIIR7Coztjbbnk79m0vy
    YqxN7OPnjYjtDT6Vpqy7R3naoF2rJqPq1Rk+lvrH99zZ0kp+2rTIc0s5giSXtWv7/n0z
    0vRWKmpUeLX7b8egi64rQKF1GyaYN87cSATcj+/s647tLIMkiYY5ntmIDmRjLjktYObL
    qyNl1X0NFyjFbQ46tw6/UeRd6YCiUvBtQtimq1A8l64iMCvwj2HJ3mFwidPz/RbJZyT8
    rZWmQ2aaP+OEwVIoKBhEYxpIAcly5BmbeQ1p0T2o8SdCY6UfUS3TwcXtq1fVVJq0dVU7
    8jTA==
ARC-Authentication-Results: i=1; strato.com;
    arc=none;
    dkim=none
X-RZG-CLASS-ID: mo02
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1728567944;
    s=strato-dkim-0002; d=gerhold.net;
    h=Cc:To:In-Reply-To:References:Message-Id:Subject:Date:From:Cc:Date:
    From:Subject:Sender;
    bh=S46j5ajWST/iBR7dSUoAnnVj94ahqxzUr5SEMsFofA0=;
    b=TZ5dumYU7JS/G1Pg2g/iK1EIgSGF6bfgzzJoRLTL4IZIisjJHWQLw/Jb2brGQBQ4q0
    1LtKAZfH3bpdfibVq2fDiLJhvQSqBwb4KD0JpJOka3CutxhtLz5TuvywnNCBRyOGLvCl
    v/5jwZ6nU45rQGFmzeSFY0RLimbCPawuuSPuTeNrv5I2OLBLchsP9Gj9SpGu0LWzB6I9
    qR5KnkKpAkNncaLfr/At0fFzz50m40CF3v3AFnkNeUAlUpfap+zbjd9nx0NyVc8sBInk
    +oKfl0y0UiEi0zEAP91FN3W+1aVBUJZuV4bgT0b93mrEuIzb8j9x7YcATmZe3gzY7kab
    HclA==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; t=1728567944;
    s=strato-dkim-0003; d=gerhold.net;
    h=Cc:To:In-Reply-To:References:Message-Id:Subject:Date:From:Cc:Date:
    From:Subject:Sender;
    bh=S46j5ajWST/iBR7dSUoAnnVj94ahqxzUr5SEMsFofA0=;
    b=iON9NR0Me651DaQj8Skq9OYG0mz/RjaijHSbVEDW1L0ZM0NFBWq8Q0q/ZlngtjZvyZ
    fWpzWQ44dRBRrq1iJ1BQ==
X-RZG-AUTH: ":P3gBZUipdd93FF5ZZvYFPugejmSTVR2nRPhVORvLd4SsytBXSOYQGpRtZhZnncGoRCMF/3aEZ/InzRrReCnzIuT5eMHSlE941iZFlw=="
Received: from [127.0.0.2]
    by smtp.strato.de (RZmta 51.2.8 AUTH)
    with ESMTPSA id R0d46809ADjixFb
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
	(Client did not present a certificate);
    Thu, 10 Oct 2024 15:45:44 +0200 (CEST)
From: Stephan Gerhold <stephan@gerhold.net>
Date: Thu, 10 Oct 2024 15:45:33 +0200
Subject: [PATCH v4 2/2] Input: add Himax HX852x(ES) touchscreen driver
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241010-hx852x-v4-2-7e6a20177938@gerhold.net>
References: <20241010-hx852x-v4-0-7e6a20177938@gerhold.net>
In-Reply-To: <20241010-hx852x-v4-0-7e6a20177938@gerhold.net>
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Henrik Rydberg <rydberg@bitmath.org>, 
 linux-input@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Jeff LaBundy <jeff@labundy.com>, 
 Christophe JAILLET <christophe.jaillet@wanadoo.fr>, 
 Jonathan Albrieux <jonathan.albrieux@gmail.com>, 
 Stephan Gerhold <stephan@gerhold.net>
X-Mailer: b4 0.13.0

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
index b1058f02e613..e96c28a25da0 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -10232,6 +10232,13 @@ S:	Maintained
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
 L:	linux-hippi@sunsite.dk
diff --git a/drivers/input/touchscreen/Kconfig b/drivers/input/touchscreen/Kconfig
index 1ac26fc2e3eb..da1bffe53aad 100644
--- a/drivers/input/touchscreen/Kconfig
+++ b/drivers/input/touchscreen/Kconfig
@@ -428,6 +428,16 @@ config TOUCHSCREEN_HIDEEP
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
index 82bc837ca01e..8055087b4ebb 100644
--- a/drivers/input/touchscreen/Makefile
+++ b/drivers/input/touchscreen/Makefile
@@ -48,6 +48,7 @@ obj-$(CONFIG_TOUCHSCREEN_GOODIX_BERLIN_CORE)	+= goodix_berlin_core.o
 obj-$(CONFIG_TOUCHSCREEN_GOODIX_BERLIN_I2C)	+= goodix_berlin_i2c.o
 obj-$(CONFIG_TOUCHSCREEN_GOODIX_BERLIN_SPI)	+= goodix_berlin_spi.o
 obj-$(CONFIG_TOUCHSCREEN_HIDEEP)	+= hideep.o
+obj-$(CONFIG_TOUCHSCREEN_HIMAX_HX852X)	+= himax_hx852x.o
 obj-$(CONFIG_TOUCHSCREEN_HYNITRON_CSTXXX)	+= hynitron_cstxxx.o
 obj-$(CONFIG_TOUCHSCREEN_ILI210X)	+= ili210x.o
 obj-$(CONFIG_TOUCHSCREEN_ILITEK)	+= ilitek_ts_i2c.o
diff --git a/drivers/input/touchscreen/himax_hx852x.c b/drivers/input/touchscreen/himax_hx852x.c
new file mode 100644
index 000000000000..3a418557645b
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
2.44.1


