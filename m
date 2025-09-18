Return-Path: <linux-input+bounces-14851-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 2FDB1B85226
	for <lists+linux-input@lfdr.de>; Thu, 18 Sep 2025 16:17:12 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 12D334E13B6
	for <lists+linux-input@lfdr.de>; Thu, 18 Sep 2025 14:17:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D623A30FC0D;
	Thu, 18 Sep 2025 14:08:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mainlining.org header.i=@mainlining.org header.b="ktQVGohl";
	dkim=permerror (0-bit key) header.d=mainlining.org header.i=@mainlining.org header.b="ZSOo3sN+"
X-Original-To: linux-input@vger.kernel.org
Received: from mail.mainlining.org (mail.mainlining.org [5.75.144.95])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A0B1830C111;
	Thu, 18 Sep 2025 14:08:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=5.75.144.95
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758204503; cv=none; b=llPLL8+RvaVZy6n5cO1LuIoaGv3HtfJ+65vjz/oi1q9gLoinhAR57x27xxOHEO5oI83YFAgxgxhrRY5W0kWxyM+Wk5htccaMO1afN8upPNbcjXc1k/q7fGK/QpLzgs4n/lw/gZqCkcOHFbWeXKvU0GGH2Y/s5GsVLLVwrjk6zkE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758204503; c=relaxed/simple;
	bh=OKSh9+XudWsaQH/2bRyB/JL2MbeBa0TuxwT2zHdDEww=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=pNU5hVgGJM2roeHuKvZuLMMsYrKanM8+0RSbz0p7OaTR5x4E2tCiiFaKu2Hf3UW66ZFOokp4Fpww9lEEMjaHrgCV+98QEgaHl+kmcznbsS7PZutsTzfq0MWEdhXHDZXgGVn9iIJWkCbhbu7miZRxoW3S9xud5c06mnCcN0bmQRg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mainlining.org; spf=pass smtp.mailfrom=mainlining.org; dkim=pass (2048-bit key) header.d=mainlining.org header.i=@mainlining.org header.b=ktQVGohl; dkim=permerror (0-bit key) header.d=mainlining.org header.i=@mainlining.org header.b=ZSOo3sN+; arc=none smtp.client-ip=5.75.144.95
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mainlining.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mainlining.org
DKIM-Signature: v=1; a=rsa-sha256; s=202507r; d=mainlining.org; c=relaxed/relaxed;
	h=To:Message-Id:Subject:Date:From; t=1758204206; bh=q0C0x0uIpntkNixvWizyuzh
	y8PlR2AWRrD4igWCOBGg=; b=ktQVGohl8rdr63e/TSpO/HikFy7Kc8ef8PH1m3ujSi4oXZ37J3
	vMm9HGYkTgGk2zGefBS3G9w32XFYr90wplZpDxMv6LKGCvxfwu/ZSAfw2bsWoeqgV+7V1vt29e1
	F0BXvWLrQIHnLhXLPXy/ExbbDlBOuVBHmisb4MlX3yqoAvwEXZJ2CPo4Y0nFk6Dbg0JVBvnXW/t
	mDrcWHClK9zgvW0PTJH+hW5g0GNH2HKTySiX/A0QEcj9xVnAFZD/9FYWFidY59jJTTpEuc3BQBf
	pYBy5/FrVZjKXaPqyhNBVQza3ZbGNOGf8rzOPwcL5FbzcJFfXjmTjkvSnXRW1Y17+LQ==;
DKIM-Signature: v=1; a=ed25519-sha256; s=202507e; d=mainlining.org; c=relaxed/relaxed;
	h=To:Message-Id:Subject:Date:From; t=1758204206; bh=q0C0x0uIpntkNixvWizyuzh
	y8PlR2AWRrD4igWCOBGg=; b=ZSOo3sN+2YrhERAa2xH1i4sTpK9AP6KPhCG+oZIPPlk/APr8yB
	imjwekQUz+2OFwkMEyn/PTUUWP6eadT0sACA==;
From: Jens Reidel <adrian@mainlining.org>
Date: Thu, 18 Sep 2025 16:02:49 +0200
Subject: [PATCH RFC 2/3] Input: add support for Goodix GTX8 Touchscreen ICs
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250918-gtx8-v1-2-cba879c84775@mainlining.org>
References: <20250918-gtx8-v1-0-cba879c84775@mainlining.org>
In-Reply-To: <20250918-gtx8-v1-0-cba879c84775@mainlining.org>
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Hans de Goede <hansg@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Henrik Rydberg <rydberg@bitmath.org>
Cc: linux-input@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux@mainlining.org, 
 phone-devel@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht, 
 Jens Reidel <adrian@mainlining.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=23706;
 i=adrian@mainlining.org; h=from:subject:message-id;
 bh=OKSh9+XudWsaQH/2bRyB/JL2MbeBa0TuxwT2zHdDEww=;
 b=owGbwMvMwCWmfPDpV6GDysyMp9WSGDLOCKpJ6q7m+hOf6nPIqEB5Notze8nelutc/Ts+/jn7U
 Zjpf49+RykLgxgXg6yYIkv9jQSTq9bfDs3Pt1kNM4eVCWQIAxenAExkGQ8jw6rLYYaHuKofPZre
 90twb/a0dVwG2UIHhdN45+xNzgp68Irhf7a8R3zkSaXNSendh0yubNnGdu+NUECne7O2n5rDIbY
 57AA=
X-Developer-Key: i=adrian@mainlining.org; a=openpgp;
 fpr=7FD86034D53BF6C29F6F3CAB23C1E5F512C12303

Add initial support for the Goodix GTX8 touchscreen ICs.

These ICs support SPI and I2C interfaces, up to 10 finger touch, stylus
and gesture events.

This driver is derived from the Goodix gtx8_driver_linux available at
[1] and only supports the GT9886 and GT9896 ICs present in the Xiaomi
Mi 9T and Xiaomi Redmi Note 10 Pro smartphones.

The current implementation only supports Normandy and Yellowstone type
ICs, aka only GT9886 and GT9896. It is also limited to I2C only, since I
don't have a device with GTX8 over SPI at hand. Adding support for SPI
should be fairly easy in the future, since the code uses a regmap.

Support for advanced features like:
- Firmware updates
- Stylus events
- Gesture events
- Nanjing IC support
is not included in current version.

The current support requires a previously flashed firmware to be
present.

As I did not have access to datasheets for these ICs, I extracted the
addresses from a couple of config files using a small tool [2]. The
addresses are identical for the same IC families in all configs I
observed, however not all of them make sense and I stubbed out firmware
request support due to this.

[1] https://github.com/goodix/gtx8_driver_linux
[2] https://github.com/sm7150-mainline/goodix-cfg-bin

Signed-off-by: Jens Reidel <adrian@mainlining.org>
---
 drivers/input/touchscreen/Kconfig       |  15 +
 drivers/input/touchscreen/Makefile      |   1 +
 drivers/input/touchscreen/goodix_gtx8.c | 562 ++++++++++++++++++++++++++++++++
 drivers/input/touchscreen/goodix_gtx8.h | 137 ++++++++
 4 files changed, 715 insertions(+)

diff --git a/drivers/input/touchscreen/Kconfig b/drivers/input/touchscreen/Kconfig
index 196905162945d59e775c3e0bff6540a82842229a..722a3c11b83b5e1c7355cc430b60ff8e7f63942a 100644
--- a/drivers/input/touchscreen/Kconfig
+++ b/drivers/input/touchscreen/Kconfig
@@ -429,6 +429,21 @@ config TOUCHSCREEN_GOODIX_BERLIN_SPI
 	  To compile this driver as a module, choose M here: the
 	  module will be called goodix_berlin_spi.
 
+config TOUCHSCREEN_GOODIX_GTX8
+	tristate "Goodix GTX8 touchscreen"
+	depends on I2C
+	select REGMAP_I2C
+	help
+	  Say Y here if you have a Goodix GTX8 IC connected to
+	  your system via I2C. This driver supports Normandy and
+	  Yellowstone ICs like the GT9886 and GT9896.
+	  They are commonly found in mobile phones.
+
+	  if unsure, say N.
+
+	  To compile this driver as a module, choose M here: the
+	  module will be called goodix_gtx8.
+
 config TOUCHSCREEN_HIDEEP
 	tristate "HiDeep Touch IC"
 	depends on I2C
diff --git a/drivers/input/touchscreen/Makefile b/drivers/input/touchscreen/Makefile
index 97a025c6a3770fb80255246eb63c11688ebd79eb..3605da4bdc3c70f6378c09790f6bd8170e2f994b 100644
--- a/drivers/input/touchscreen/Makefile
+++ b/drivers/input/touchscreen/Makefile
@@ -48,6 +48,7 @@ obj-$(CONFIG_TOUCHSCREEN_GOODIX)	+= goodix_ts.o
 obj-$(CONFIG_TOUCHSCREEN_GOODIX_BERLIN_CORE)	+= goodix_berlin_core.o
 obj-$(CONFIG_TOUCHSCREEN_GOODIX_BERLIN_I2C)	+= goodix_berlin_i2c.o
 obj-$(CONFIG_TOUCHSCREEN_GOODIX_BERLIN_SPI)	+= goodix_berlin_spi.o
+obj-$(CONFIG_TOUCHSCREEN_GOODIX_GTX8)	+= goodix_gtx8.o
 obj-$(CONFIG_TOUCHSCREEN_HIDEEP)	+= hideep.o
 obj-$(CONFIG_TOUCHSCREEN_HYNITRON_CSTXXX)	+= hynitron_cstxxx.o
 obj-$(CONFIG_TOUCHSCREEN_ILI210X)	+= ili210x.o
diff --git a/drivers/input/touchscreen/goodix_gtx8.c b/drivers/input/touchscreen/goodix_gtx8.c
new file mode 100644
index 0000000000000000000000000000000000000000..bd2ccfc2c6919b5f56807917ce7147c69df7db03
--- /dev/null
+++ b/drivers/input/touchscreen/goodix_gtx8.c
@@ -0,0 +1,562 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Driver for Goodix GTX8 Touchscreens
+ *
+ * Copyright (c) 2019 - 2020 Goodix, Inc.
+ * Copyright (C) 2023 Linaro Ltd.
+ * Copyright (c) 2025 Jens Reidel <adrian@mainlining.org>
+ *
+ * Based on gtx8_driver_linux vendor driver and goodix_berlin kernel driver.
+ *
+ * The driver currently relies on the pre-flashed firmware and only supports
+ * Normandy / Yellowstone ICs.
+ * Pen support is also missing.
+ */
+#include <linux/gpio/consumer.h>
+#include <linux/i2c.h>
+#include <linux/input.h>
+#include <linux/input/mt.h>
+#include <linux/input/touchscreen.h>
+#include <linux/module.h>
+#include <linux/regmap.h>
+#include <linux/unaligned.h>
+
+#include "goodix_gtx8.h"
+
+static const struct regmap_config goodix_gtx8_regmap_conf = {
+	.reg_bits = 16,
+	.val_bits = 8,
+	.max_raw_read = I2C_MAX_TRANSFER_SIZE,
+	.max_raw_write = I2C_MAX_TRANSFER_SIZE,
+};
+
+/* vendor & product left unassigned here, should probably be updated from fw info */
+static const struct input_id goodix_gtx8_input_id = {
+	.bustype = BUS_I2C,
+};
+
+static bool goodix_gtx8_checksum_valid_normandy(const u8 *data, int size)
+{
+	u8 cal_checksum = 0;
+	int i;
+
+	if (size < GOODIX_GTX8_CHECKSUM_SIZE)
+		return false;
+
+	for (i = 0; i < size; i++)
+		cal_checksum += data[i];
+
+	return cal_checksum == 0;
+}
+
+static bool goodix_gtx8_checksum_valid_yellowstone(const u8 *data, int size)
+{
+	u16 cal_checksum = 0;
+	u16 r_checksum;
+	int i;
+
+	if (size < GOODIX_GTX8_CHECKSUM_SIZE)
+		return false;
+
+	for (i = 0; i < size - GOODIX_GTX8_CHECKSUM_SIZE; i++)
+		cal_checksum += data[i];
+
+	r_checksum = get_unaligned_be16(&data[i]);
+
+	return cal_checksum == r_checksum;
+}
+
+static int goodix_gtx8_get_remaining_contacts(struct goodix_gtx8_core *cd,
+					      int n)
+{
+	size_t offset = cd->ic_data->header_size + GOODIX_GTX8_TOUCH_SIZE +
+			GOODIX_GTX8_CHECKSUM_SIZE;
+	u32 addr = cd->ic_data->touch_data_addr + offset;
+	int error;
+
+	error = regmap_raw_read(cd->regmap, addr, &cd->event_buffer[offset],
+				(n - 1) * GOODIX_GTX8_TOUCH_SIZE);
+	if (error) {
+		dev_err_ratelimited(cd->dev, "failed to get touch data, %d\n",
+				    error);
+		return error;
+	}
+
+	return 0;
+}
+
+static void goodix_gtx8_report_state(struct goodix_gtx8_core *cd, u8 touch_num,
+				     union goodix_gtx8_touch *touch_data)
+{
+	union goodix_gtx8_touch *t;
+	int i;
+	u8 finger_id;
+
+	for (i = 0; i < touch_num; i++) {
+		t = &touch_data[i];
+
+		if (cd->ic_data->ic_type == IC_TYPE_NORMANDY) {
+			input_mt_slot(cd->input_dev, t->normandy.finger_id);
+			input_mt_report_slot_state(cd->input_dev,
+						   MT_TOOL_FINGER, true);
+
+			touchscreen_report_pos(cd->input_dev, &cd->props,
+					       __le16_to_cpu(t->normandy.x),
+					       __le16_to_cpu(t->normandy.y),
+					       true);
+			input_report_abs(cd->input_dev, ABS_MT_TOUCH_MAJOR,
+					 t->normandy.w);
+		} else {
+			finger_id = FIELD_GET(
+				GOODIX_GTX8_FINGER_ID_MASK_YELLOWSTONE,
+				t->yellowstone.finger_id);
+			input_mt_slot(cd->input_dev, finger_id);
+			input_mt_report_slot_state(cd->input_dev,
+						   MT_TOOL_FINGER, true);
+
+			touchscreen_report_pos(cd->input_dev, &cd->props,
+					       __be16_to_cpu(t->yellowstone.x),
+					       __be16_to_cpu(t->yellowstone.y),
+					       true);
+			input_report_abs(cd->input_dev, ABS_MT_TOUCH_MAJOR,
+					 t->yellowstone.w);
+		}
+	}
+
+	input_mt_sync_frame(cd->input_dev);
+	input_sync(cd->input_dev);
+}
+
+static void goodix_gtx8_touch_handler(struct goodix_gtx8_core *cd, u8 touch_num,
+				      union goodix_gtx8_touch *touch_data)
+{
+	int error;
+
+	touch_num = FIELD_GET(GOODIX_GTX8_TOUCH_COUNT_MASK, touch_num);
+
+	if (touch_num > GOODIX_GTX8_MAX_TOUCH) {
+		dev_warn(cd->dev, "invalid touch num %d\n", touch_num);
+		return;
+	}
+
+	if (touch_num > 1) {
+		/* read additional contact data if more than 1 touch event */
+		error = goodix_gtx8_get_remaining_contacts(cd, touch_num);
+		if (error)
+			return;
+	}
+
+	if (touch_num) {
+		/*
+		 * Normandy checksum is for the entire read buffer,
+		 * Yellowstone is only for the touch data (since header
+		 * has a separate checksum)
+		 */
+		if (cd->ic_data->ic_type == IC_TYPE_NORMANDY) {
+			int len = GOODIX_GTX8_HEADER_SIZE_NORMANDY +
+				  touch_num * GOODIX_GTX8_TOUCH_SIZE +
+				  GOODIX_GTX8_CHECKSUM_SIZE;
+			if (!goodix_gtx8_checksum_valid_normandy(
+				    cd->event_buffer, len)) {
+				dev_err(cd->dev,
+					"touch data checksum error: %*ph\n",
+					len, cd->event_buffer);
+				return;
+			}
+		} else {
+			int len = touch_num * GOODIX_GTX8_TOUCH_SIZE +
+				  GOODIX_GTX8_CHECKSUM_SIZE;
+			if (!goodix_gtx8_checksum_valid_yellowstone(
+				    (u8 *)touch_data, len)) {
+				dev_err(cd->dev,
+					"touch data checksum error: %*ph\n",
+					len, (u8 *)touch_data);
+				return;
+			}
+		}
+	}
+
+	goodix_gtx8_report_state(cd, touch_num, touch_data);
+}
+
+static irqreturn_t goodix_gtx8_irq(int irq, void *data)
+{
+	struct goodix_gtx8_core *cd = data;
+	struct goodix_gtx8_event_normandy *ev_normandy;
+	struct goodix_gtx8_event_yellowstone *ev_yellowstone;
+	union goodix_gtx8_touch *touch_data;
+	int error;
+	u8 status, touch_num;
+
+	error = regmap_raw_read(
+		cd->regmap, cd->ic_data->touch_data_addr, cd->event_buffer,
+		cd->ic_data->header_size + GOODIX_GTX8_TOUCH_SIZE +
+			GOODIX_GTX8_CHECKSUM_SIZE);
+	if (error) {
+		dev_warn_ratelimited(
+			cd->dev, "failed to get event head data: %d\n", error);
+		goto out;
+	}
+
+	/*
+	 * Both IC types have the same data in the header, just at different
+	 * offsets
+	 */
+	if (cd->ic_data->ic_type == IC_TYPE_NORMANDY) {
+		ev_normandy =
+			(struct goodix_gtx8_event_normandy *)cd->event_buffer;
+		status = ev_normandy->hdr.status;
+		touch_num = ev_normandy->hdr.touch_num;
+		touch_data = (union goodix_gtx8_touch *)ev_normandy->data;
+	} else {
+		ev_yellowstone = (struct goodix_gtx8_event_yellowstone *)
+					 cd->event_buffer;
+		status = ev_yellowstone->hdr.status;
+		touch_num = ev_yellowstone->hdr.touch_num;
+		touch_data = (union goodix_gtx8_touch *)ev_yellowstone->data;
+	}
+
+	if (status == 0)
+		goto out;
+
+	/* Yellowstone ICs have a checksum for the header */
+	if (cd->ic_data->ic_type == IC_TYPE_YELLOWSTONE &&
+	    !goodix_gtx8_checksum_valid_yellowstone(
+		    cd->event_buffer, GOODIX_GTX8_HEADER_SIZE_YELLOWSTONE)) {
+		dev_warn_ratelimited(cd->dev,
+				     "touch head checksum error: %*ph\n",
+				     (int)GOODIX_GTX8_HEADER_SIZE_YELLOWSTONE,
+				     cd->event_buffer);
+		goto out_clear;
+	}
+
+	if (status & GOODIX_GTX8_TOUCH_EVENT)
+		goodix_gtx8_touch_handler(cd, touch_num, touch_data);
+
+	if (status & GOODIX_GTX8_REQUEST_EVENT) {
+		/*
+		 * All configs seen so far either set the firmware request
+		 * address to 0 (Normandy) or have it equal the touch data
+		 * address (Yellowstone). Neither seems correct, and this
+		 * is not testable. Therefore it is currently omitted.
+		 */
+		dev_dbg(cd->dev, "received request event, ignoring\n");
+	}
+
+out_clear:
+	/* Clear up status field */
+	regmap_write(cd->regmap, cd->ic_data->touch_data_addr, 0);
+
+out:
+	return IRQ_HANDLED;
+}
+
+static int goodix_gtx8_input_dev_config(struct goodix_gtx8_core *cd)
+{
+	struct input_dev *input_dev;
+	int error;
+
+	input_dev = devm_input_allocate_device(cd->dev);
+	if (!input_dev)
+		return -ENOMEM;
+
+	cd->input_dev = input_dev;
+	input_set_drvdata(input_dev, cd);
+
+	input_dev->name = "Goodix GTX8 Capacitive TouchScreen";
+	input_dev->phys = "input/ts";
+
+	input_dev->id = goodix_gtx8_input_id;
+
+	input_set_abs_params(cd->input_dev, ABS_MT_POSITION_X, 0, SZ_64K - 1, 0,
+			     0);
+	input_set_abs_params(cd->input_dev, ABS_MT_POSITION_Y, 0, SZ_64K - 1, 0,
+			     0);
+	input_set_abs_params(cd->input_dev, ABS_MT_TOUCH_MAJOR, 0, 255, 0, 0);
+
+	touchscreen_parse_properties(cd->input_dev, true, &cd->props);
+
+	error = input_mt_init_slots(cd->input_dev, GOODIX_GTX8_MAX_TOUCH,
+				    INPUT_MT_DIRECT | INPUT_MT_DROP_UNUSED);
+	if (error)
+		return error;
+
+	error = input_register_device(cd->input_dev);
+	if (error)
+		return error;
+
+	return 0;
+}
+
+static int goodix_gtx8_read_version(struct goodix_gtx8_core *cd)
+{
+	int error;
+
+	/*
+	 * The vendor driver reads a whole lot more data to calculate and
+	 * verify a checksum. Without documentation, we don't know what
+	 * most of that data is, so we only read the parts we know about
+	 * and instead ensure their values are as expected
+	 */
+	error = regmap_raw_read(cd->regmap, cd->ic_data->fw_version_addr,
+				&cd->fw_version, sizeof(cd->fw_version));
+	if (error) {
+		dev_err(cd->dev, "error reading fw version, %d\n", error);
+		return error;
+	}
+
+	/*
+	 * Since we don't verify the checksum, do a basic check that the
+	 * product ID meets expectations
+	 */
+	if (memcmp(cd->fw_version.product_id, cd->ic_data->product_id,
+		   sizeof(cd->fw_version.product_id))) {
+		dev_err(cd->dev, "unexpected product ID, got: %c%c%c%c\n",
+			cd->fw_version.product_id[0],
+			cd->fw_version.product_id[1],
+			cd->fw_version.product_id[2],
+			cd->fw_version.product_id[3]);
+		return -EINVAL;
+	}
+
+	return 0;
+}
+
+static int goodix_gtx8_dev_confirm(struct goodix_gtx8_core *cd)
+{
+	u8 rx_buf[1];
+	int retry = 3;
+	int error;
+
+	while (retry--) {
+		/*
+		 * test_addr appears to always be the touch_data_addr for
+		 * Normandy, but it doesn't really matter since all we
+		 * need is a valid address
+		 */
+		error = regmap_raw_read(cd->regmap,
+					cd->ic_data->touch_data_addr, rx_buf,
+					sizeof(rx_buf));
+
+		if (!error)
+			return 0;
+
+		usleep_range(5000, 5100);
+	}
+
+	dev_err(cd->dev, "device confirm failed\n");
+
+	return -EINVAL;
+}
+
+static int goodix_gtx8_power_on(struct goodix_gtx8_core *cd)
+{
+	int error;
+
+	error = regulator_enable(cd->vddio);
+	if (error) {
+		dev_err(cd->dev, "Failed to enable VDDIO: %d\n", error);
+		return error;
+	}
+
+	error = regulator_enable(cd->avdd);
+	if (error) {
+		dev_err(cd->dev, "Failed to enable AVDD: %d\n", error);
+		goto err_vddio_disable;
+	}
+
+	/* Vendors usually configure the power on delay as 300ms */
+	msleep(GOODIX_GTX8_POWER_ON_DELAY_MS);
+
+	gpiod_set_value_cansleep(cd->reset_gpio, 0);
+
+	/* Vendor waits 5ms for firmware to initialize */
+	usleep_range(5000, 5100);
+
+	error = goodix_gtx8_dev_confirm(cd);
+	if (error)
+		goto err_dev_reset;
+
+	/* Vendor waits 100ms for firmware to fully boot */
+	msleep(GOODIX_GTX8_NORMAL_RESET_DELAY_MS);
+
+	return 0;
+
+err_dev_reset:
+	gpiod_set_value_cansleep(cd->reset_gpio, 1);
+	regulator_disable(cd->avdd);
+err_vddio_disable:
+	regulator_disable(cd->vddio);
+	return error;
+}
+
+static void goodix_gtx8_power_off(struct goodix_gtx8_core *cd)
+{
+	gpiod_set_value_cansleep(cd->reset_gpio, 1);
+	regulator_disable(cd->avdd);
+	regulator_disable(cd->vddio);
+}
+
+static int goodix_gtx8_suspend(struct device *dev)
+{
+	struct goodix_gtx8_core *cd = dev_get_drvdata(dev);
+
+	disable_irq(cd->irq);
+	goodix_gtx8_power_off(cd);
+
+	return 0;
+}
+
+static int goodix_gtx8_resume(struct device *dev)
+{
+	struct goodix_gtx8_core *cd = dev_get_drvdata(dev);
+	int error;
+
+	error = goodix_gtx8_power_on(cd);
+	if (error)
+		return error;
+
+	enable_irq(cd->irq);
+
+	return 0;
+}
+
+EXPORT_GPL_SIMPLE_DEV_PM_OPS(goodix_gtx8_pm_ops, goodix_gtx8_suspend,
+			     goodix_gtx8_resume);
+
+static void goodix_gtx8_power_off_act(void *data)
+{
+	struct goodix_gtx8_core *cd = data;
+
+	goodix_gtx8_power_off(cd);
+}
+
+static int goodix_gtx8_probe(struct i2c_client *client)
+{
+	struct goodix_gtx8_core *cd;
+	struct regmap *regmap;
+	int error;
+
+	cd = devm_kzalloc(&client->dev, sizeof(*cd), GFP_KERNEL);
+	if (!cd)
+		return -ENOMEM;
+
+	regmap = devm_regmap_init_i2c(client, &goodix_gtx8_regmap_conf);
+	if (IS_ERR(regmap))
+		return PTR_ERR(regmap);
+
+	cd->dev = &client->dev;
+	cd->irq = client->irq;
+	cd->regmap = regmap;
+	cd->ic_data = i2c_get_match_data(client);
+
+	cd->event_buffer =
+		devm_kzalloc(cd->dev, cd->ic_data->event_size, GFP_KERNEL);
+	if (!cd->event_buffer)
+		return -ENOMEM;
+
+	cd->reset_gpio =
+		devm_gpiod_get_optional(cd->dev, "reset", GPIOD_OUT_HIGH);
+	if (IS_ERR(cd->reset_gpio))
+		return dev_err_probe(cd->dev, PTR_ERR(cd->reset_gpio),
+				     "Failed to request reset GPIO\n");
+
+	cd->avdd = devm_regulator_get(cd->dev, "avdd");
+	if (IS_ERR(cd->avdd))
+		return dev_err_probe(cd->dev, PTR_ERR(cd->avdd),
+				     "Failed to request AVDD regulator\n");
+
+	cd->vddio = devm_regulator_get(cd->dev, "vddio");
+	if (IS_ERR(cd->vddio))
+		return dev_err_probe(cd->dev, PTR_ERR(cd->vddio),
+				     "Failed to request VDDIO regulator\n");
+
+	error = goodix_gtx8_power_on(cd);
+	if (error) {
+		dev_err(cd->dev, "failed power on");
+		return error;
+	}
+
+	error = devm_add_action_or_reset(cd->dev, goodix_gtx8_power_off_act,
+					 cd);
+	if (error)
+		return error;
+
+	error = goodix_gtx8_read_version(cd);
+	if (error) {
+		dev_err(cd->dev, "failed to get version info");
+		return error;
+	}
+
+	error = goodix_gtx8_input_dev_config(cd);
+	if (error) {
+		dev_err(cd->dev, "failed to set input device");
+		return error;
+	}
+
+	error = devm_request_threaded_irq(cd->dev, cd->irq, NULL,
+					  goodix_gtx8_irq, IRQF_ONESHOT,
+					  "goodix-gtx8", cd);
+	if (error) {
+		dev_err(cd->dev, "request threaded IRQ failed: %d\n", error);
+		return error;
+	}
+
+	dev_set_drvdata(cd->dev, cd);
+
+	dev_dbg(cd->dev,
+		"Goodix GT%c%c%c%c Touchscreen Controller, Version %d.%d.%d.%d\n",
+		cd->fw_version.product_id[0], cd->fw_version.product_id[1],
+		cd->fw_version.product_id[2], cd->fw_version.product_id[3],
+		cd->fw_version.fw_version[0], cd->fw_version.fw_version[1],
+		cd->fw_version.fw_version[2], cd->fw_version.fw_version[3]);
+
+	return 0;
+}
+
+static const struct goodix_gtx8_ic_data gt9886_data = {
+	.event_size = GOODIX_GTX8_EVENT_SIZE_NORMANDY,
+	.fw_version_addr = GOODIX_GTX8_FW_VERSION_ADDR_NORMANDY,
+	.header_size = GOODIX_GTX8_HEADER_SIZE_NORMANDY,
+	.ic_type = IC_TYPE_NORMANDY,
+	.product_id = { '9', '8', '8', '6' },
+	.touch_data_addr = GOODIX_GTX8_TOUCH_DATA_ADDR_NORMANDY,
+};
+
+static const struct goodix_gtx8_ic_data gt9896_data = {
+	.event_size = GOODIX_GTX8_EVENT_SIZE_YELLOWSTONE,
+	.fw_version_addr = GOODIX_GTX8_FW_VERSION_ADDR_YELLOWSTONE,
+	.header_size = GOODIX_GTX8_HEADER_SIZE_YELLOWSTONE,
+	.ic_type = IC_TYPE_YELLOWSTONE,
+	.product_id = { '9', '8', '9', '6' },
+	.touch_data_addr = GOODIX_GTX8_TOUCH_DATA_ADDR_YELLOWSTONE,
+};
+
+static const struct i2c_device_id goodix_gtx8_i2c_id[] = {
+	{ .name = "gt9886", .driver_data = (long)&gt9886_data },
+	{ .name = "gt9896", .driver_data = (long)&gt9896_data },
+	{},
+};
+MODULE_DEVICE_TABLE(i2c, goodix_gtx8_i2c_id);
+
+static const struct of_device_id goodix_gtx8_of_match[] = {
+	{ .compatible = "goodix,gt9886", .data = &gt9886_data },
+	{ .compatible = "goodix,gt9896", .data = &gt9896_data },
+	{},
+};
+MODULE_DEVICE_TABLE(of, goodix_gtx8_of_match);
+
+static struct i2c_driver goodix_gtx8_driver = {
+	.probe = goodix_gtx8_probe,
+	.id_table = goodix_gtx8_i2c_id,
+	.driver = {
+		.name = "goodix-gtx8",
+		.of_match_table = of_match_ptr(goodix_gtx8_of_match),
+		.pm = pm_sleep_ptr(&goodix_gtx8_pm_ops),
+	},
+};
+module_i2c_driver(goodix_gtx8_driver);
+
+MODULE_LICENSE("GPL");
+MODULE_DESCRIPTION("Goodix GTX8 Touchscreen driver");
+MODULE_AUTHOR("Jens Reidel <adrian@mainlining.org>");
diff --git a/drivers/input/touchscreen/goodix_gtx8.h b/drivers/input/touchscreen/goodix_gtx8.h
new file mode 100644
index 0000000000000000000000000000000000000000..79e79988869b46a3fc70fa64b4698cdb1d7a0394
--- /dev/null
+++ b/drivers/input/touchscreen/goodix_gtx8.h
@@ -0,0 +1,137 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+#ifndef __GOODIX_GTX8_H__
+#define __GOODIX_GTX8_H__
+
+#define GOODIX_GTX8_NORMAL_RESET_DELAY_MS	100
+#define GOODIX_GTX8_POWER_ON_DELAY_MS		300
+
+#define GOODIX_GTX8_TOUCH_EVENT			BIT(7)
+#define GOODIX_GTX8_REQUEST_EVENT		BIT(6)
+#define GOODIX_GTX8_TOUCH_COUNT_MASK		GENMASK(3, 0)
+#define GOODIX_GTX8_FINGER_ID_MASK_YELLOWSTONE	GENMASK(7, 4)
+
+#define GOODIX_GTX8_MAX_TOUCH			10
+#define GOODIX_GTX8_CHECKSUM_SIZE		sizeof(u16)
+
+#define GOODIX_GTX8_FW_VERSION_ADDR_NORMANDY	0x4535
+#define GOODIX_GTX8_FW_VERSION_ADDR_YELLOWSTONE	0x4022
+#define GOODIX_GTX8_TOUCH_DATA_ADDR_NORMANDY	0x4100
+#define GOODIX_GTX8_TOUCH_DATA_ADDR_YELLOWSTONE	0x4180
+
+#define I2C_MAX_TRANSFER_SIZE			256
+
+enum goodix_gtx8_ic_type {
+	IC_TYPE_NORMANDY,
+	IC_TYPE_YELLOWSTONE,
+};
+
+struct goodix_gtx8_ic_data {
+	size_t event_size;
+	/*
+	 * This is technically not the firmware version address
+	 * referenced in the vendor driver, but rather the
+	 * address of the product ID part. The meaning of the
+	 * other parts is unknown and they are therefore omitted
+	 * for now.
+	 */
+	int fw_version_addr;
+	size_t header_size;
+	enum goodix_gtx8_ic_type ic_type;
+	char product_id[4];
+	int touch_data_addr;
+};
+
+struct goodix_gtx8_header_normandy {
+	u8 status;
+	/* Only the lower 4 bits are actually used */
+	u8 touch_num;
+};
+#define GOODIX_GTX8_HEADER_SIZE_NORMANDY \
+	sizeof(struct goodix_gtx8_header_normandy)
+
+struct goodix_gtx8_header_yellowstone {
+	u8 status;
+	/* Most likely unused */
+	u8 __unknown1;
+	/* Only the lower 4 bits are actually used */
+	u8 touch_num;
+	/* Most likely unused */
+	u8 __unknown2[3];
+	__le16 checksum;
+} __packed __aligned(1);
+#define GOODIX_GTX8_HEADER_SIZE_YELLOWSTONE \
+	sizeof(struct goodix_gtx8_header_yellowstone)
+
+struct goodix_gtx8_touch_normandy {
+	u8 finger_id;
+	__le16 x;
+	__le16 y;
+	u8 w;
+	u8 __unknown[2];
+} __packed __aligned(1);
+
+struct goodix_gtx8_touch_yellowstone {
+	/*
+	 * Only the upper 4 bits are used, lower 4 bits are
+	 * probably the sensor ID.
+	 */
+	u8 finger_id;
+	u8 __unknown1;
+	__be16 x;
+	__be16 y;
+	/*
+	 * Vendor driver claims that this is a single __be16,
+	 * but testing shows that it likely isn't.
+	 */
+	u8 __unknown2;
+	u8 w;
+} __packed __aligned(1);
+
+union goodix_gtx8_touch {
+	struct goodix_gtx8_touch_normandy normandy;
+	struct goodix_gtx8_touch_yellowstone yellowstone;
+};
+#define GOODIX_GTX8_TOUCH_SIZE		sizeof(union goodix_gtx8_touch)
+
+struct goodix_gtx8_event_normandy {
+	struct goodix_gtx8_header_normandy hdr;
+	/* The data below is u16 aligned */
+	u8 data[GOODIX_GTX8_TOUCH_SIZE * GOODIX_GTX8_MAX_TOUCH +
+		GOODIX_GTX8_CHECKSUM_SIZE];
+};
+#define GOODIX_GTX8_EVENT_SIZE_NORMANDY \
+	sizeof(struct goodix_gtx8_event_normandy)
+
+struct goodix_gtx8_event_yellowstone {
+	struct goodix_gtx8_header_yellowstone hdr;
+	/* The data below is u16 aligned */
+	u8 data[GOODIX_GTX8_TOUCH_SIZE * GOODIX_GTX8_MAX_TOUCH +
+		GOODIX_GTX8_CHECKSUM_SIZE];
+};
+#define GOODIX_GTX8_EVENT_SIZE_YELLOWSTONE \
+	sizeof(struct goodix_gtx8_event_yellowstone)
+
+struct goodix_gtx8_fw_version {
+	/* 4 digits IC number */
+	char product_id[4];
+	/* Most likely unused */
+	u8 __unknown[4];
+	/* Four components version number */
+	u8 fw_version[4];
+};
+
+struct goodix_gtx8_core {
+	struct device *dev;
+	struct regmap *regmap;
+	struct regulator *avdd;
+	struct regulator *vddio;
+	struct gpio_desc *reset_gpio;
+	struct touchscreen_properties props;
+	struct goodix_gtx8_fw_version fw_version;
+	struct input_dev *input_dev;
+	int irq;
+	const struct goodix_gtx8_ic_data *ic_data;
+	u8 *event_buffer;
+};
+
+#endif

-- 
2.51.0


