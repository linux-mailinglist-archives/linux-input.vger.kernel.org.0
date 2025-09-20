Return-Path: <linux-input+bounces-14937-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 053E8B8BCE2
	for <lists+linux-input@lfdr.de>; Sat, 20 Sep 2025 03:45:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 0C9221C05865
	for <lists+linux-input@lfdr.de>; Sat, 20 Sep 2025 01:46:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E08AB1C863B;
	Sat, 20 Sep 2025 01:45:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VyukAlyL"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-pf1-f172.google.com (mail-pf1-f172.google.com [209.85.210.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CFA341FDE31
	for <linux-input@vger.kernel.org>; Sat, 20 Sep 2025 01:45:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758332735; cv=none; b=GYmLetiP0Yq2Xb8UheWGMVEO9miiz0nNa/07J3AtJSIZIEVFKbPsqEm31pUNqGmhBDxx8sUCg0PXZNrgUywYwwZ+/7Zz4vNym5UegqEr4kDS+3WgIP+MU4iWUjkoT1lpcdcOEdN45dKLbUiVyTzNikHrL+WvU1qsD1A4XqeSCw4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758332735; c=relaxed/simple;
	bh=o4qUOlDYmFq9xYpIrjy0Z2W5Dm+iG3WCVwV+xO9pyHQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=ZQl0KWFO3n5SErnJxcRcSPjjZz0TDD2HV4nwQ/K3leAQuZj4ncsLksfKrdYh3mTMztZXHGptbgFBaCptlwPfAs0zCs4BsldQHzHzOm3k5o/5XU6U/P+caE+hVAnspeQ62Fo6i9LjHJmxEklyr39/bez0eRvaQ5aQAA33aAQvtCw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=VyukAlyL; arc=none smtp.client-ip=209.85.210.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f172.google.com with SMTP id d2e1a72fcca58-77716518125so1526708b3a.3
        for <linux-input@vger.kernel.org>; Fri, 19 Sep 2025 18:45:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1758332733; x=1758937533; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xbwulDlTdWV1a2vX4sVnF8YoDTywRhMEwTux0md1QtA=;
        b=VyukAlyLNM6k5WDTSCZ7Qvt+1E2IGY8F5W+NxcYnKyIuV1J2Uhhvzl+SCqZnENkfwn
         98ttgtOPjgtD/9YMTt4fX+a+8iGocXer6tCU4QuuKmUSzBF4gIrHGbt9Jubbv9SrjvaA
         Z7b/kOf3kVGFOfRuFGFx0jNKqCAIsXlgOI/oG7jYlTFAt2iT8MIwuxlkAhNz56nl18Ve
         4htV9Zt7zbXUqPHqJEdCKDYS1Urh7n8/M7vWAQSsQF969fGySVQirLuvgNiMLJnc5qLg
         GDKGA+zBe9QKmOqlonEYa8mwVxyv/BhPnF4A1GUb1TN8GxWKrLgCI1CDRAUg1nKU6onx
         u/Og==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758332733; x=1758937533;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xbwulDlTdWV1a2vX4sVnF8YoDTywRhMEwTux0md1QtA=;
        b=LbmzhvxuI06LitrLOS8Luw+2NGIIT3AICKqbqfMBZxruEY+at/j1HaodTurKJOombq
         n/jRweiYCAnkcC3oTPlj3gSIcXAgyvwrO6GNrfrHozWfE6u+iyJQ2zCS7ZmVxkQNoD/J
         AuTFI89DoL10kj80xmm6vAqndC5wwCkKYETz2C1UfxOBxB6CY2i7TcrSMDu9IdsWRV6d
         QkZRQfpfthZBVzOyDD0bUppiq75H93w9sTVSfuDwH0Cvi0mxPwatB4tRSuCQsXZe9wmj
         vklY3YDgljshCw3E2noriNxtM7L7ICMik/EfQpDEoIKOf6oiUDGlYl9xUWesAusQSrjF
         Da2Q==
X-Forwarded-Encrypted: i=1; AJvYcCXsg4JZ5EQ5XGuS9DexEL8dmU8NWLLiwQTy89c7SNO0QYeFm7kXwgbnF6x7lHhrGQla9iPvJGSLKQEQEA==@vger.kernel.org
X-Gm-Message-State: AOJu0YyvwIIrMkwn/OomMlALt9v5V2mc5VQMxx9laVLQBsD88MQllhkC
	tlWmRrGhdWdFAQPoDoqJe7xBgrkT+9t8f2jXm4XY3bo8wAKFyDNA/R16N2TnoNi7
X-Gm-Gg: ASbGncsC29eiKtZCoftub8bcpOXJ5YCTaKa0z0ENw+cGWiJ5CUCJ6LFixF167s+LWDQ
	a7LM6+778VKNcM9/h9ePlS4ldkSdW0+1NLnM7zgjDCcygMXzBhFT1QiMUnP9MqaCHBOmug3zAkn
	IawGOJd/6uBH5kO42Dvl/qwg8Lp48ATpyGQ9V+RGk49eR+c7beWIrh/D6rglLpSaX13m1p08DxM
	hg0dHJsdxxfP3QM4ugq56saqD/yrmQin8zNmJTnOo223JJboEqlCa4PpWJR3Yy18g4Ccg5zFNH3
	8JeLhPHyF142joTovh6tv06iXmxufDJiH4Kvuw8QZgRJM+HC7iPbUATz3fTp7M3sT55CedvJleU
	pKHuMSESwTPBTdJkxZFvV
X-Google-Smtp-Source: AGHT+IFrfFS/+61ivOxGlktBEadH3PUIFPWX62BhORRzrKhDDIyeIyMbitDikCHEeefgfbYt7GLMVQ==
X-Received: by 2002:a05:6a00:2394:b0:771:f951:16c6 with SMTP id d2e1a72fcca58-77e4eeac840mr5785114b3a.15.1758332733062;
        Fri, 19 Sep 2025 18:45:33 -0700 (PDT)
Received: from archlinux ([191.193.70.152])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-77f1a72e7afsm529395b3a.92.2025.09.19.18.45.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 19 Sep 2025 18:45:32 -0700 (PDT)
From: =?UTF-8?q?Eric=20Gon=C3=A7alves?= <ghatto404@gmail.com>
To: Henrik Rydberg <rydberg@bitmath.org>,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>,
	devicetree@vger.kernel.org,
	linux-input@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v1 2/2] Input: add support for the STM FTS2BA61Y touchscreen
Date: Sat, 20 Sep 2025 01:44:50 +0000
Message-ID: <20250920014450.37787-3-ghatto404@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20250920014450.37787-1-ghatto404@gmail.com>
References: <20250920014450.37787-1-ghatto404@gmail.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

The ST-Microelectronics FTS2BA61Y touchscreen is a capacitive multi-touch
controller connected through SPI at 0x0, the touchscreen is typically
used in mobile devices (like the Galaxy S22 series)

Signed-off-by: Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>
Signed-off-by: Eric Gonçalves <ghatto404@gmail.com>
---
 drivers/input/touchscreen/Kconfig     |  11 +
 drivers/input/touchscreen/Makefile    |   1 +
 drivers/input/touchscreen/fts2ba61y.c | 588 ++++++++++++++++++++++++++
 3 files changed, 600 insertions(+)
 create mode 100644 drivers/input/touchscreen/fts2ba61y.c

diff --git a/drivers/input/touchscreen/Kconfig b/drivers/input/touchscreen/Kconfig
index 196905162945..1e199191f527 100644
--- a/drivers/input/touchscreen/Kconfig
+++ b/drivers/input/touchscreen/Kconfig
@@ -370,6 +370,17 @@ config TOUCHSCREEN_EXC3000
 	  To compile this driver as a module, choose M here: the
 	  module will be called exc3000.
 
+config TOUCHSCREEN_FTS2BA61Y
+	tristate "ST-Microelectronics FTS2BA61Y touchscreen"
+	depends on SPI
+	help
+	  Say Y here if you have the ST-Microelectronics FTS2BA61Y touchscreen
+
+	  If unsure, say N.
+
+	  To compile this driver as a module, choose M here: the
+	  module will be called fts2ba61y.
+
 config TOUCHSCREEN_FUJITSU
 	tristate "Fujitsu serial touchscreen"
 	select SERIO
diff --git a/drivers/input/touchscreen/Makefile b/drivers/input/touchscreen/Makefile
index 97a025c6a377..408a9fd5bd35 100644
--- a/drivers/input/touchscreen/Makefile
+++ b/drivers/input/touchscreen/Makefile
@@ -43,6 +43,7 @@ obj-$(CONFIG_TOUCHSCREEN_ELO)		+= elo.o
 obj-$(CONFIG_TOUCHSCREEN_EGALAX)	+= egalax_ts.o
 obj-$(CONFIG_TOUCHSCREEN_EGALAX_SERIAL)	+= egalax_ts_serial.o
 obj-$(CONFIG_TOUCHSCREEN_EXC3000)	+= exc3000.o
+obj-$(CONFIG_TOUCHSCREEN_FTS2BA61Y)	+= fts2ba61y.o
 obj-$(CONFIG_TOUCHSCREEN_FUJITSU)	+= fujitsu_ts.o
 obj-$(CONFIG_TOUCHSCREEN_GOODIX)	+= goodix_ts.o
 obj-$(CONFIG_TOUCHSCREEN_GOODIX_BERLIN_CORE)	+= goodix_berlin_core.o
diff --git a/drivers/input/touchscreen/fts2ba61y.c b/drivers/input/touchscreen/fts2ba61y.c
new file mode 100644
index 000000000000..b3b3abca5404
--- /dev/null
+++ b/drivers/input/touchscreen/fts2ba61y.c
@@ -0,0 +1,588 @@
+// SPDX-License-Identifier: GPL-2.0
+// Based loosely on s6sy761.c
+
+#include <linux/delay.h>
+#include <linux/input.h>
+#include <linux/interrupt.h>
+#include <linux/module.h>
+#include <linux/of.h>
+#include <linux/input/mt.h>
+#include <linux/spi/spi.h>
+#include <linux/input/touchscreen.h>
+#include <linux/unaligned.h>
+#include <linux/regulator/consumer.h>
+
+/* commands */
+#define FTS2BA61Y_CMD_SENSE_ON			0x10
+#define FTS2BA61Y_CMD_SENSE_OFF			0x11
+#define FTS2BA61Y_CMD_READ_PANEL_INFO		0x23
+#define FTS2BA61Y_CMD_READ_FW_VER		0x24
+#define FTS2BA61Y_CMD_TOUCHTYPE			0x30 /* R/W for get/set */
+#define FTS2BA61Y_CMD_CLEAR_EVENTS		0x62
+#define FTS2BA61Y_CMD_READ_EVENT		0x87
+#define FTS2BA61Y_CMD_CUSTOM_W			0xC0
+#define FTS2BA61Y_CMD_CUSTOM_R			0xD1
+#define FTS2BA61Y_CMD_REG_W			0xFA
+#define FTS2BA61Y_CMD_REG_R			0xFB
+
+/* touch type masks */
+#define FTS2BA61Y_MASK_TOUCH			BIT(0)
+#define FTS2BA61Y_MASK_HOVER			BIT(1)
+#define FTS2BA61Y_MASK_COVER			BIT(2)
+#define FTS2BA61Y_MASK_GLOVE			BIT(3)
+#define FTS2BA61Y_MASK_STYLUS			BIT(4)
+#define FTS2BA61Y_MASK_PALM			BIT(5)
+#define FTS2BA61Y_MASK_WET			BIT(6)
+#define FTS2BA61Y_TOUCHTYPE_DEFAULT		(FTS2BA61Y_MASK_TOUCH | \
+						 FTS2BA61Y_MASK_PALM | \
+						 FTS2BA61Y_MASK_WET)
+
+/* event status masks */
+#define FTS2BA61Y_MASK_STYPE			GENMASK(5, 2)
+#define FTS2BA61Y_MASK_EVENT_ID			GENMASK(1, 0)
+
+/* event coordinate masks */
+#define FTS2BA61Y_MASK_TCHSTA			GENMASK(7, 6)
+#define FTS2BA61Y_MASK_TID			GENMASK(5, 2)
+#define FTS2BA61Y_MASK_X_3_0			GENMASK(7, 4)
+#define FTS2BA61Y_MASK_Y_3_0			GENMASK(3, 0)
+#define FTS2BA61Y_MASK_Z			GENMASK(5, 0)
+#define FTS2BA61Y_MASK_TTYPE_3_2		GENMASK(7, 6)
+#define FTS2BA61Y_MASK_TTYPE_1_0		GENMASK(1, 0)
+#define FTS2BA61Y_MASK_LEFT_EVENTS		GENMASK(4, 0)
+
+/* event error status */
+#define FTS2BA61Y_EVENT_STATUSTYPE_INFO		0x2
+
+/* information report */
+#define FTS2BA61Y_INFO_READY_STATUS		0x0
+
+/* event status */
+#define FTS2BA61Y_COORDINATE_EVENT		0x0
+
+/* touch types */
+#define FTS2BA61Y_TOUCHTYPE_NORMAL		0x0
+#define FTS2BA61Y_TOUCHTYPE_HOVER		0x1
+#define FTS2BA61Y_TOUCHTYPE_FLIPCOVER		0x2
+#define FTS2BA61Y_TOUCHTYPE_GLOVE		0x3
+#define FTS2BA61Y_TOUCHTYPE_STYLUS		0x4
+#define FTS2BA61Y_TOUCHTYPE_PALM		0x5
+#define FTS2BA61Y_TOUCHTYPE_WET			0x6
+#define FTS2BA61Y_TOUCHTYPE_PROXIMITY		0x7
+#define FTS2BA61Y_TOUCHTYPE_JIG			0x8
+
+#define FTS2BA61Y_COORDINATE_ACTION_NONE	0x0
+#define FTS2BA61Y_COORDINATE_ACTION_PRESS	0x1
+#define FTS2BA61Y_COORDINATE_ACTION_MOVE	0x2
+#define FTS2BA61Y_COORDINATE_ACTION_RELEASE	0x3
+
+#define FTS2BA61Y_DEV_NAME			"fts2ba61y"
+#define FTS2BA61Y_EVENT_BUFF_SIZE		16
+#define FTS2BA61Y_PANEL_INFO_SIZE		11
+#define FTS2BA61Y_RESET_CMD_SIZE		5
+#define FTS2BA61Y_EVENT_COUNT			31
+#define MAX_TRANSFER_SIZE			256
+
+enum fts2ba61y_regulators {
+	FTS2BA61Y_REGULATOR_VDD,
+	FTS2BA61Y_REGULATOR_AVDD,
+};
+
+struct fts2ba61y_data {
+	struct spi_device *spi;
+	struct regulator_bulk_data regulators[2];
+	struct input_dev *input_dev;
+	struct mutex mutex;
+	struct touchscreen_properties prop;
+
+	u8 tx_count;
+
+	unsigned int max_x;
+	unsigned int max_y;
+};
+
+static int fts2ba61y_write(struct fts2ba61y_data *ts,
+			   u8 *reg, int cmd_len, u8 *data, int data_len)
+{
+	struct spi_message msg;
+	struct spi_transfer xfers;
+	char *tx_buf;
+	int len;
+	int ret;
+
+	tx_buf = kzalloc(cmd_len + data_len + 1, GFP_KERNEL);
+	if (!tx_buf) {
+		ret = -ENOMEM;
+		goto out;
+	}
+
+	memset(&xfers, 0, sizeof(xfers));
+	spi_message_init(&msg);
+
+	memcpy(&tx_buf[0], reg, cmd_len);
+	if (data_len && data)
+		memcpy(&tx_buf[cmd_len], data, data_len);
+
+	len = cmd_len + data_len;
+
+	/* custom write cmd */
+	if (reg[0] != FTS2BA61Y_CMD_REG_W &&
+	    reg[0] != FTS2BA61Y_CMD_REG_R) {
+		memmove(tx_buf + 1, tx_buf, len);
+		tx_buf[0] = FTS2BA61Y_CMD_CUSTOM_W;
+		len++;
+	}
+
+	xfers.len = len;
+	xfers.tx_buf = tx_buf;
+
+	spi_message_add_tail(&xfers, &msg);
+
+	mutex_lock(&ts->mutex);
+	ret = spi_sync(ts->spi, &msg);
+	if (ret)
+		dev_err(&ts->spi->dev, "spi transfer error, %d", ret);
+	mutex_unlock(&ts->mutex);
+
+out:
+	kfree(tx_buf);
+	return ret;
+}
+
+static int fts2ba61y_spi_raw_read(struct fts2ba61y_data *ts,
+				  u8 *tx_buf, u8 *rx_buf, int len)
+{
+	struct spi_message msg;
+	struct spi_transfer xfer;
+	int ret;
+
+	memset(&xfer, 0, sizeof(xfer));
+	spi_message_init(&msg);
+
+	xfer.len = len;
+	xfer.tx_buf = tx_buf;
+	xfer.rx_buf = rx_buf;
+	spi_message_add_tail(&xfer, &msg);
+
+	mutex_lock(&ts->mutex);
+	ret = spi_sync(ts->spi, &msg);
+	if (ret)
+		dev_err(&ts->spi->dev, "spi transfer error, %d", ret);
+	mutex_unlock(&ts->mutex);
+
+	return ret;
+}
+
+/*
+ * higher-level wrapper that prepares the buffers for a read.
+ */
+static int fts2ba61y_read(struct fts2ba61y_data *ts,
+			  u8 reg[], int tx_len, u8 buf[], int rx_len)
+{
+	char *tx_buf, *rx_buf;
+	int ret, mem_len;
+	u16 reg_val;
+
+	if (tx_len > 3)
+		mem_len = rx_len + 1 + tx_len;
+	else
+		mem_len = rx_len + 4;
+
+	tx_buf = kzalloc(mem_len, GFP_KERNEL);
+	rx_buf = kzalloc(mem_len, GFP_KERNEL);
+	if (!tx_buf || !rx_buf) {
+		ret = -ENOMEM;
+		goto out;
+	}
+
+	switch (reg[0]) {
+	case FTS2BA61Y_CMD_READ_EVENT:
+	case FTS2BA61Y_CMD_REG_W:
+	case FTS2BA61Y_CMD_REG_R:
+		memcpy(tx_buf, reg, tx_len);
+		break;
+
+	default:
+		tx_buf[0] = FTS2BA61Y_CMD_CUSTOM_R;
+
+		if (tx_len == 1)
+			reg_val = 0;
+		else if (tx_len == 2)
+			reg_val = reg[0];
+		else if (tx_len == 3)
+			reg_val = reg[0] | (reg[1] << 8);
+		else {
+			ret = -EINVAL;
+			goto out;
+		}
+
+		tx_len = 3;
+		put_unaligned_be16(reg_val, &tx_buf[1]);
+
+		ret = fts2ba61y_write(ts, reg, 1, NULL, 0);
+		if (ret < 0)
+			goto out;
+		break;
+	}
+
+	ret = fts2ba61y_spi_raw_read(ts, tx_buf, rx_buf, rx_len + 1 + tx_len);
+	if (ret < 0)
+		goto out;
+
+	memcpy(buf, &rx_buf[1 + tx_len], rx_len);
+
+out:
+	kfree(tx_buf);
+	kfree(rx_buf);
+	return ret;
+}
+
+static int fts2ba61y_wait_for_ready(struct fts2ba61y_data *ts)
+{
+	u8 buffer[FTS2BA61Y_EVENT_BUFF_SIZE];
+	u8 cmd = FTS2BA61Y_CMD_READ_EVENT;
+	u8 status_id, stype;
+	int ret;
+
+	for (int retries = 5; retries > 0; retries--) {
+		ret = fts2ba61y_read(ts, &cmd, 1, buffer, FTS2BA61Y_EVENT_BUFF_SIZE);
+
+		stype = FIELD_GET(FTS2BA61Y_MASK_STYPE, buffer[0]);
+		status_id = buffer[1];
+
+		if (stype == FTS2BA61Y_EVENT_STATUSTYPE_INFO &&
+		    status_id == FTS2BA61Y_INFO_READY_STATUS) {
+			ret = 0;
+			break;
+		} else
+			ret = -ENODEV;
+
+		msleep(20);
+	}
+
+	return ret;
+}
+
+static int fts2ba61y_reset(struct fts2ba61y_data *ts)
+{
+	u8 cmd = FTS2BA61Y_CMD_REG_W;
+	/* the following sequence is undocumented */
+	u8 reset[FTS2BA61Y_RESET_CMD_SIZE] = { 0x20, 0x00,
+					       0x00, 0x24, 0x81 };
+	int ret;
+
+	disable_irq(ts->spi->irq);
+
+	ret = fts2ba61y_write(ts, &cmd, 1, &reset[0], FTS2BA61Y_RESET_CMD_SIZE);
+	if (ret)
+		return ret;
+	msleep(30);
+
+	ret = fts2ba61y_wait_for_ready(ts);
+	if (ret)
+		return ret;
+
+	enable_irq(ts->spi->irq);
+
+	return 0;
+}
+
+static int fts2ba61y_set_channels(struct fts2ba61y_data *ts)
+{
+	int ret;
+	u8 cmd = FTS2BA61Y_CMD_READ_PANEL_INFO;
+	u8 data[FTS2BA61Y_PANEL_INFO_SIZE];
+
+	ret = fts2ba61y_read(ts, &cmd, 1, data, FTS2BA61Y_PANEL_INFO_SIZE);
+	if (ret)
+		return ret;
+
+	ts->max_x = get_unaligned_be16(data);
+	ts->max_y = get_unaligned_be16(data + 2);
+
+	/* if no tx channels defined, at least keep one */
+	ts->tx_count = max_t(u8, data[8], 1);
+
+	return 0;
+}
+
+static int fts2ba61y_set_touch_func(struct fts2ba61y_data *ts)
+{
+	u8 cmd = FTS2BA61Y_CMD_TOUCHTYPE;
+	u16 touchtype = cpu_to_le16(FTS2BA61Y_TOUCHTYPE_DEFAULT);
+
+	return fts2ba61y_write(ts, &cmd, 1, (u8 *)&touchtype, 2);
+}
+
+static int fts2ba61y_hw_init(struct fts2ba61y_data *ts)
+{
+	int ret;
+
+	ret = regulator_bulk_enable(ARRAY_SIZE(ts->regulators),
+								ts->regulators);
+	if (ret)
+		return ret;
+
+	msleep(140);
+
+	ret = fts2ba61y_reset(ts);
+	if (ret)
+		return ret;
+
+	ret = fts2ba61y_set_channels(ts);
+	if (ret)
+		return ret;
+
+	return fts2ba61y_set_touch_func(ts);
+}
+
+static int fts2ba61y_get_event(struct fts2ba61y_data *ts, u8 *data, int *n_events)
+{
+	int ret;
+	u8 cmd = FTS2BA61Y_CMD_READ_EVENT;
+
+	ret = fts2ba61y_read(ts, &cmd, 1, data, FTS2BA61Y_EVENT_BUFF_SIZE);
+	if (ret < 0)
+		return ret;
+
+	if (!data[0]) {
+		*n_events = 0;
+		return 0;
+	}
+
+	*n_events = FIELD_GET(FTS2BA61Y_MASK_LEFT_EVENTS, data[7]);
+	if (unlikely(*n_events >= FTS2BA61Y_EVENT_COUNT)) {
+		cmd = FTS2BA61Y_CMD_CLEAR_EVENTS;
+		fts2ba61y_write(ts, &cmd, 1, NULL, 0);
+		*n_events = 0;
+		return -EINVAL;
+	}
+
+	if (*n_events > 0) {
+		ret = fts2ba61y_read(ts, &cmd, 1,
+				     &data[1 * FTS2BA61Y_EVENT_BUFF_SIZE],
+				     FTS2BA61Y_EVENT_BUFF_SIZE * (*n_events));
+		if (ret)
+			return ret;
+	}
+
+	return 0;
+}
+
+static void fts2ba61y_report_coordinates(struct fts2ba61y_data *ts,
+					 u8 *event, u8 tid)
+{
+	u8 major = event[4];
+	u8 minor = event[5];
+	u8 z = FIELD_GET(FTS2BA61Y_MASK_Z, event[6]);
+
+	u16 x = (event[1] << 4) |
+		FIELD_GET(FTS2BA61Y_MASK_X_3_0, event[3]);
+	u16 y = (event[2] << 4) |
+		FIELD_GET(FTS2BA61Y_MASK_Y_3_0, event[3]);
+	u16 ttype = (FIELD_GET(FTS2BA61Y_MASK_TTYPE_3_2, event[6]) << 2) |
+		    (FIELD_GET(FTS2BA61Y_MASK_TTYPE_1_0, event[7]) << 0);
+
+	if (ttype != FTS2BA61Y_TOUCHTYPE_NORMAL &&
+	    ttype != FTS2BA61Y_TOUCHTYPE_PALM &&
+	    ttype != FTS2BA61Y_TOUCHTYPE_WET &&
+	    ttype != FTS2BA61Y_TOUCHTYPE_GLOVE)
+		return;
+
+	input_mt_slot(ts->input_dev, tid);
+	input_mt_report_slot_state(ts->input_dev, MT_TOOL_FINGER, true);
+	input_report_abs(ts->input_dev, ABS_MT_POSITION_X, x);
+	input_report_abs(ts->input_dev, ABS_MT_POSITION_Y, y);
+	input_report_abs(ts->input_dev, ABS_MT_TOUCH_MAJOR, major);
+	input_report_abs(ts->input_dev, ABS_MT_TOUCH_MINOR, minor);
+	input_report_abs(ts->input_dev, ABS_MT_PRESSURE, z);
+
+	input_mt_sync_frame(ts->input_dev);
+	input_sync(ts->input_dev);
+}
+
+static void fts2ba61y_report_release(struct fts2ba61y_data *ts, u8 tid)
+{
+	input_mt_slot(ts->input_dev, tid);
+	input_mt_report_slot_state(ts->input_dev, MT_TOOL_FINGER, false);
+
+	input_mt_sync_frame(ts->input_dev);
+	input_sync(ts->input_dev);
+}
+
+static void fts2ba61y_handle_coordinates(struct fts2ba61y_data *ts, u8 *event)
+{
+	u8 t_id = FIELD_GET(FTS2BA61Y_MASK_TID, event[0]);
+	u8 action = FIELD_GET(FTS2BA61Y_MASK_TCHSTA, event[0]);
+
+	if (t_id > ts->tx_count)
+		return;
+
+	switch (action) {
+	case FTS2BA61Y_COORDINATE_ACTION_PRESS:
+	case FTS2BA61Y_COORDINATE_ACTION_MOVE:
+		fts2ba61y_report_coordinates(ts, event, t_id);
+		break;
+
+	case FTS2BA61Y_COORDINATE_ACTION_RELEASE:
+		fts2ba61y_report_release(ts, t_id);
+		break;
+	}
+}
+
+static irqreturn_t fts2ba61y_irq_handler(int irq, void *handle)
+{
+	struct fts2ba61y_data *ts = handle;
+	u8 buffer[FTS2BA61Y_EVENT_COUNT * FTS2BA61Y_EVENT_BUFF_SIZE];
+	u8 *event;
+	u8 event_id;
+	int n_events = 0;
+	int ret;
+
+	usleep(1);
+
+	ret = fts2ba61y_get_event(ts, buffer, &n_events);
+	if (ret < 0) {
+		dev_dbg(&ts->spi->dev, "failed to get event: %d", ret);
+		return IRQ_HANDLED;
+	}
+
+	for (int i = 0; i <= n_events; i++) {
+		event = &buffer[i * FTS2BA61Y_EVENT_BUFF_SIZE];
+		event_id = FIELD_GET(FTS2BA61Y_MASK_EVENT_ID, event[0]);
+
+		if (event_id == FTS2BA61Y_COORDINATE_EVENT)
+			fts2ba61y_handle_coordinates(ts, event);
+	}
+
+	return IRQ_HANDLED;
+}
+
+static int fts2ba61y_input_open(struct input_dev *dev)
+{
+	struct fts2ba61y_data *ts = input_get_drvdata(dev);
+	u8 cmd = FTS2BA61Y_CMD_SENSE_ON;
+
+	return fts2ba61y_write(ts, &cmd, 1, NULL, 0);
+}
+
+static void fts2ba61y_input_close(struct input_dev *dev)
+{
+	struct fts2ba61y_data *ts = input_get_drvdata(dev);
+	int ret;
+	u8 cmd = FTS2BA61Y_CMD_SENSE_OFF;
+
+	ret = fts2ba61y_write(ts, &cmd, 1, NULL, 0);
+	if (ret)
+		dev_err(&ts->spi->dev, "failed to turn off sensing\n");
+}
+
+static void fts2ba61y_power_off(void *data)
+{
+	struct fts2ba61y_data *ts = data;
+
+	disable_irq(ts->spi->irq);
+	regulator_bulk_disable(ARRAY_SIZE(ts->regulators),
+						   ts->regulators);
+}
+
+static int fts2ba61y_probe(struct spi_device *spi) {
+	struct fts2ba61y_data *ts;
+	struct input_dev *input_dev;
+	int error;
+
+	ts = devm_kzalloc(&spi->dev, sizeof(*ts), GFP_KERNEL);
+	if (!ts)
+		return -ENOMEM;
+
+	ts->spi = spi;
+	mutex_init(&ts->mutex);
+
+	spi->mode = SPI_MODE_0;
+	spi->bits_per_word = 8;
+
+	error = spi_setup(spi);
+	if (error)
+		return error;
+
+	ts->regulators[FTS2BA61Y_REGULATOR_VDD].supply = "vdd";
+	ts->regulators[FTS2BA61Y_REGULATOR_AVDD].supply = "avdd";
+	error = devm_regulator_bulk_get(&spi->dev,
+									ARRAY_SIZE(ts->regulators),
+									ts->regulators);
+	if (error)
+		return error;
+
+	error = fts2ba61y_hw_init(ts);
+	if (error)
+		return error;
+
+	error = devm_add_action_or_reset(&ts->spi->dev, fts2ba61y_power_off, ts);
+	if (error)
+		return error;
+
+	input_dev = devm_input_allocate_device(&spi->dev);
+	if (!input_dev)
+		return -ENOMEM;
+
+	ts->input_dev = input_dev;
+
+	input_dev->name = FTS2BA61Y_DEV_NAME;
+	input_dev->id.bustype = BUS_SPI;
+	input_dev->open = fts2ba61y_input_open;
+	input_dev->close = fts2ba61y_input_close;
+
+	input_set_abs_params(input_dev, ABS_MT_POSITION_X, 0, ts->max_x, 0, 0);
+	input_set_abs_params(input_dev, ABS_MT_POSITION_Y, 0, ts->max_y, 0, 0);
+	input_set_abs_params(input_dev, ABS_MT_TOUCH_MAJOR, 0, 255, 0, 0);
+	input_set_abs_params(input_dev, ABS_MT_TOUCH_MINOR, 0, 255, 0, 0);
+	input_set_abs_params(input_dev, ABS_MT_PRESSURE, 0, 255, 0, 0);
+
+	touchscreen_parse_properties(input_dev, true, &ts->prop);
+
+	spi_set_drvdata(spi, ts);
+	input_set_drvdata(input_dev, ts);
+
+	error = input_mt_init_slots(input_dev, ts->tx_count, INPUT_MT_DIRECT);
+	if (error)
+		return error;
+
+	error = input_register_device(input_dev);
+	if (error)
+		return error;
+
+	error = devm_request_threaded_irq(&spi->dev, spi->irq, NULL,
+					  fts2ba61y_irq_handler,
+					  IRQF_TRIGGER_LOW | IRQF_ONESHOT,
+					  "fts2ba61y_irq", ts);
+	return error;
+}
+
+#ifdef CONFIG_OF
+static const struct of_device_id spi_touchscreen_dt_ids[] = {
+	{ .compatible = "st,fts2ba61y" },
+	{},
+};
+MODULE_DEVICE_TABLE(of, spi_touchscreen_dt_ids);
+#endif
+
+static const struct spi_device_id fts2ba61y_spi_ids[] = {
+	{ "fts2ba61y" },
+	{ },
+};
+MODULE_DEVICE_TABLE(spi, fts2ba61y_spi_ids);
+
+static struct spi_driver spi_touchscreen_driver = {
+	.driver = {
+		.name = FTS2BA61Y_DEV_NAME,
+		.of_match_table = of_match_ptr(spi_touchscreen_dt_ids),
+	},
+	.probe = fts2ba61y_probe,
+	.id_table = fts2ba61y_spi_ids,
+};
+
+module_spi_driver(spi_touchscreen_driver);
+
+MODULE_AUTHOR("Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>");
+MODULE_DESCRIPTION("ST-Microelectronics FTS2BA61Y Touch Screen");
+MODULE_LICENSE("GPL");
-- 
2.51.0


