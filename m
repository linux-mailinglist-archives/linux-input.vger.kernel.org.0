Return-Path: <linux-input+bounces-5548-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id B3D3F9506D5
	for <lists+linux-input@lfdr.de>; Tue, 13 Aug 2024 15:42:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 64C92B2956B
	for <lists+linux-input@lfdr.de>; Tue, 13 Aug 2024 13:37:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D70FC19B5A6;
	Tue, 13 Aug 2024 13:37:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="I6FOYLrU"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A9AB760EC4;
	Tue, 13 Aug 2024 13:37:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723556231; cv=none; b=B3ZFNmRsHdrZ2C++2vHCIKbplOt060JNUo0N2ltLHa6HIZyL2ETxWD0G5mXBOX6/16+MXINmbuUDBiCtybSejSNUl5ThrIMKyHwsd4jHJN0S1374nPCe76Po/Qi4AwgXySnxHg+vnXtvbv+ddJ58qX7428+ZCzArC5RJKCduGKU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723556231; c=relaxed/simple;
	bh=R+iaXhSxRg5hWpdFONd8h3733hR3uGckyDnVo8RcLKM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=cuVVnUc7aVPIhz3BaKsQHAXHBYiePWXehN8wcjwTMeT/vf/u49sm/nx/QoepOGH/aSOIRQGi+OOFcZqoyPKhBvBC7uuLtwXUb2dEk+V61RM+e02oA8SKvIxU7rjaxEpLv3OtA3lAweOGc6bcM2zXvprYFyrU1d8bSUdshlSuxn0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=I6FOYLrU; arc=none smtp.client-ip=209.85.214.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-201cd78c6a3so6617855ad.1;
        Tue, 13 Aug 2024 06:37:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1723556229; x=1724161029; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NdWujSmVovAf44FupiHxII+x8fEg/zl8z2OgKDrI/ok=;
        b=I6FOYLrUDWPLGw9W/OYDRGUPA0MQ+QezL+Ry+Vi2rvIpP126LDtk13QdcVIL2qrnGk
         g7BDG1nsf07EEZe5oYR69BxaryPzkN/BeS85HfCh9eyWlbY6CAVhs9392rLMbVpRAqXJ
         mIA1c9nHVPeXrenO86p6S2SXOxUIrmJvJghqArvHKOieknT142FcXG1hWpnuf8DW+dfh
         Lq4Tn3ul4JHWDpGHADdnGZeElZsO8UWAd5+U+rLLGQ+oGnshRHeesDmZkLLJdz0MnaCb
         S8XBD98v8jxvhQoVFLHowXwJe33k2oLmpwvmJBSsVnAKaN/EhFWiX89OC1eMV5TezNeo
         ufQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723556229; x=1724161029;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=NdWujSmVovAf44FupiHxII+x8fEg/zl8z2OgKDrI/ok=;
        b=pTqo4QZyW/iEv/huyUVkDs+bbbOCanHHBX/Lotktr7gWiF3tvypajS7IA6Iw+s4Xue
         UU7EUU0LtIlqAVy76RoEN6sfSxOcDOkPrBj9tyCam2N+RWLL1WpwhqpLVLDgxa4HalXv
         Ba7XNAnaoFGYldRezvLfA93r9uXI2ZBHPP+hwBt0VgU9z1X+xDz8vULQf7UM6fukvOLK
         4IPkYQb8u/XAWsojryAm+5k0W3QcXuBUYb1sb9twVPR1itgT4OAYKERmT4fNLUWNzirW
         QqYtpcQXiV0mAP7ma3v2egsVq4VoNIDXxcbEgkuWm4OzKDbiupN9baYTe3qlBrZlqkbF
         XnZA==
X-Forwarded-Encrypted: i=1; AJvYcCWTjgHRRjcY2mQaEQTEh6a6g8rTpwU665joFKcbEZZsz0fHgIzje8bc9mNi5zDSuVQPTtHNyja77dWNiDeL3zh73ChZhEHLc9M7AUBRd9YHvZn4UXINGqiVK8xXlM9oIuFgv7GUmmn1pBnqJZSZ5cSb5Qa5OX5gnNGNzS3sIIfqdOA37iIc
X-Gm-Message-State: AOJu0YxXKDsTyGDXOfxF7d1WW6nmU8ZzdUfbEPEdRE/UNPgPWIzhsSdK
	gKERp9QpIi/IrJIr4gK7045hN0b1NTTC/2MYrq5jfVRCyZ0Wy0m3Fe1P6o/GRw0=
X-Google-Smtp-Source: AGHT+IH1w1tPhdiOPRx9IEvNZGQ4AC02Ft9wG5Lbj3Uf4s4FE6jS5+pyPDCN0lJ19Pvk1o+j3Lrjww==
X-Received: by 2002:a17:903:249:b0:200:953b:75a6 with SMTP id d9443c01a7336-201ca185938mr43593115ad.5.1723556228613;
        Tue, 13 Aug 2024 06:37:08 -0700 (PDT)
Received: from ux-UP-WHL01.. ([240e:47e:2ef8:4fc3:dde8:ca2c:7f06:eeca])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-201d3e23a56sm2529545ad.48.2024.08.13.06.36.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Aug 2024 06:37:08 -0700 (PDT)
From: Charles Wang <charles.goodix@gmail.com>
To: dmitry.torokhov@gmail.com,
	dianders@chromium.org,
	dan.carpenter@linaro.org,
	conor@kernel.org,
	robh@kernel.org
Cc: krzk+dt@kernel.org,
	jikos@kernel.org,
	bentiss@kernel.org,
	hbarnor@chromium.org,
	linux-input@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Charles Wang <charles.goodix@gmail.com>
Subject: [PATCH v6 1/2] HID: hid-goodix: Add Goodix HID-over-SPI driver
Date: Tue, 13 Aug 2024 21:36:11 +0800
Message-ID: <20240813133612.49095-2-charles.goodix@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240813133612.49095-1-charles.goodix@gmail.com>
References: <20240813133612.49095-1-charles.goodix@gmail.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This patch introduces a new driver to support the Goodix GT7986U
touch controller. This device is not compatible with Microsoft's
HID-over-SPI protocol and therefore needs to implement its own
flavor. The data reported is packaged according to the HID
protocol but uses SPI for communication to improve speed. This
enables the device to transmit not only coordinate data but also
corresponding raw data that can be accessed by user-space programs
through the hidraw interface. The raw data can be utilized for
functions like palm rejection, thereby improving the touch experience.

Key features:
- Device connection confirmation and initialization
- IRQ-based event reporting to the input subsystem
- Support for HIDRAW operations (GET_REPORT and SET_REPORT)

Signed-off-by: Charles Wang <charles.goodix@gmail.com>
---
 drivers/hid/Kconfig          |   6 +
 drivers/hid/Makefile         |   1 +
 drivers/hid/hid-goodix-spi.c | 810 +++++++++++++++++++++++++++++++++++
 3 files changed, 817 insertions(+)
 create mode 100644 drivers/hid/hid-goodix-spi.c

diff --git a/drivers/hid/Kconfig b/drivers/hid/Kconfig
index 4c682c650..03e750e04 100644
--- a/drivers/hid/Kconfig
+++ b/drivers/hid/Kconfig
@@ -404,6 +404,12 @@ config HID_VIVALDI_COMMON
 	  option so that drivers can use common code to parse the HID
 	  descriptors for vivaldi function row keymap.
 
+config HID_GOODIX_SPI
+	tristate "Goodix GT7986U SPI HID touchscreen"
+	depends on SPI_MASTER
+	help
+	  Support for Goodix GT7986U SPI HID touchscreen device.
+
 config HID_GOOGLE_HAMMER
 	tristate "Google Hammer Keyboard"
 	select HID_VIVALDI_COMMON
diff --git a/drivers/hid/Makefile b/drivers/hid/Makefile
index 082a728ea..56e3ed4c1 100644
--- a/drivers/hid/Makefile
+++ b/drivers/hid/Makefile
@@ -54,6 +54,7 @@ obj-$(CONFIG_HID_GEMBIRD)	+= hid-gembird.o
 obj-$(CONFIG_HID_GFRM)		+= hid-gfrm.o
 obj-$(CONFIG_HID_GLORIOUS)  += hid-glorious.o
 obj-$(CONFIG_HID_VIVALDI_COMMON) += hid-vivaldi-common.o
+obj-$(CONFIG_HID_GOODIX_SPI)	+= hid-goodix-spi.o
 obj-$(CONFIG_HID_GOOGLE_HAMMER)	+= hid-google-hammer.o
 obj-$(CONFIG_HID_GOOGLE_STADIA_FF)	+= hid-google-stadiaff.o
 obj-$(CONFIG_HID_VIVALDI)	+= hid-vivaldi.o
diff --git a/drivers/hid/hid-goodix-spi.c b/drivers/hid/hid-goodix-spi.c
new file mode 100644
index 000000000..5103bf0aa
--- /dev/null
+++ b/drivers/hid/hid-goodix-spi.c
@@ -0,0 +1,810 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+/*
+ * Goodix GT7986U SPI Driver Code for HID.
+ *
+ * Copyright (C) 2024 Godix, Inc.
+ */
+#include <asm/unaligned.h>
+#include <linux/delay.h>
+#include <linux/hid.h>
+#include <linux/interrupt.h>
+#include <linux/kernel.h>
+#include <linux/module.h>
+#include <linux/mutex.h>
+#include <linux/of.h>
+#include <linux/sizes.h>
+#include <linux/spi/spi.h>
+
+#define GOODIX_DEV_CONFIRM_ADDR		0x10000
+#define GOODIX_HID_DESC_ADDR		0x1058C
+#define GOODIX_HID_REPORT_DESC_ADDR	0x105AA
+#define GOODIX_HID_SIGN_ADDR		0x10D32
+
+#define GOODIX_HID_GET_REPORT_CMD	0x02
+#define GOODIX_HID_SET_REPORT_CMD	0x03
+
+#define GOODIX_HID_MAX_INBUF_SIZE	128
+#define GOODIX_HID_ACK_READY_FLAG	0x01
+#define GOODIX_HID_REPORT_READY_FLAG	0x80
+
+#define GOODIX_DEV_CONFIRM_VAL		0xAA
+
+#define GOODIX_SPI_WRITE_FLAG		0xF0
+#define GOODIX_SPI_READ_FLAG		0xF1
+#define GOODIX_SPI_TRANS_PREFIX_LEN	1
+#define GOODIX_REGISTER_WIDTH		4
+#define GOODIX_SPI_READ_DUMMY_LEN	3
+#define GOODIX_SPI_READ_PREFIX_LEN	(GOODIX_SPI_TRANS_PREFIX_LEN + \
+					 GOODIX_REGISTER_WIDTH + \
+					 GOODIX_SPI_READ_DUMMY_LEN)
+#define GOODIX_SPI_WRITE_PREFIX_LEN	(GOODIX_SPI_TRANS_PREFIX_LEN + \
+					 GOODIX_REGISTER_WIDTH)
+
+#define GOODIX_CHECKSUM_SIZE		sizeof(u16)
+#define GOODIX_NORMAL_RESET_DELAY_MS	150
+
+struct goodix_hid_report_header {
+	u8 flag;
+	__le16 size;
+} __packed;
+#define GOODIX_HID_ACK_HEADER_SIZE	sizeof(struct goodix_hid_report_header)
+
+struct goodix_hid_report_package {
+	__le16 size;
+	u8 data[];
+};
+
+#define GOODIX_HID_PKG_LEN_SIZE		sizeof(u16)
+#define GOODIX_HID_COOR_DATA_LEN	82
+#define GOODIX_HID_COOR_PKG_LEN		(GOODIX_HID_PKG_LEN_SIZE + \
+					 GOODIX_HID_COOR_DATA_LEN)
+
+/* power state */
+#define GOODIX_SPI_POWER_ON		0x00
+#define GOODIX_SPI_POWER_SLEEP		0x01
+
+/* flags used to record the current device operating state */
+#define GOODIX_HID_STARTED		0
+
+struct goodix_hid_report_event {
+	struct goodix_hid_report_header hdr;
+	u8 data[GOODIX_HID_COOR_PKG_LEN];
+} __packed;
+
+struct goodix_hid_desc {
+	__le16 desc_length;
+	__le16 bcd_version;
+	__le16 report_desc_length;
+	__le16 report_desc_register;
+	__le16 input_register;
+	__le16 max_input_length;
+	__le16 output_register;
+	__le16 max_output_length;
+	__le16 cmd_register;
+	__le16 data_register;
+	__le16 vendor_id;
+	__le16 product_id;
+	__le16 version_id;
+	__le32 reserved;
+} __packed;
+
+struct goodix_ts_data {
+	struct device *dev;
+	struct spi_device *spi;
+	struct hid_device *hid;
+	struct goodix_hid_desc hid_desc;
+
+	struct gpio_desc *reset_gpio;
+	u32 hid_report_addr;
+
+	unsigned long flags;
+	/* lock for hid raw request operation */
+	struct mutex hid_request_lock;
+	/* buffer used to store hid report event */
+	u8 *event_buf;
+	u32 hid_max_event_sz;
+	/* buffer used to do spi data transfer */
+	u8 xfer_buf[SZ_2K] ____cacheline_aligned;
+};
+
+static void *goodix_get_event_report(struct goodix_ts_data *ts, u32 addr,
+				     u8 *data, size_t len)
+{
+	struct spi_device *spi = to_spi_device(&ts->spi->dev);
+	struct spi_transfer xfers;
+	struct spi_message spi_msg;
+	int error;
+
+	/* buffer format: 0xF1 + addr(4bytes) + dummy(3bytes) + data */
+	data[0] = GOODIX_SPI_READ_FLAG;
+	put_unaligned_be32(addr, data + GOODIX_SPI_TRANS_PREFIX_LEN);
+
+	spi_message_init(&spi_msg);
+	memset(&xfers, 0, sizeof(xfers));
+	xfers.tx_buf = data;
+	xfers.rx_buf = data;
+	xfers.len = GOODIX_SPI_READ_PREFIX_LEN + len;
+	spi_message_add_tail(&xfers, &spi_msg);
+
+	error = spi_sync(spi, &spi_msg);
+	if (error) {
+		dev_err(ts->dev, "spi transfer error: %d", error);
+		return NULL;
+	}
+
+	return data + GOODIX_SPI_READ_PREFIX_LEN;
+}
+
+static int goodix_spi_read(struct goodix_ts_data *ts, u32 addr,
+			   void *data, size_t len)
+{
+	struct spi_device *spi = to_spi_device(&ts->spi->dev);
+	struct spi_transfer xfers;
+	struct spi_message spi_msg;
+	int error;
+
+	if (GOODIX_SPI_READ_PREFIX_LEN + len > sizeof(ts->xfer_buf)) {
+		dev_err(ts->dev, "read data len exceed limit %zu",
+			sizeof(ts->xfer_buf) - GOODIX_SPI_READ_PREFIX_LEN);
+		return -EINVAL;
+	}
+
+	/* buffer format: 0xF1 + addr(4bytes) + dummy(3bytes) + data */
+	ts->xfer_buf[0] = GOODIX_SPI_READ_FLAG;
+	put_unaligned_be32(addr, ts->xfer_buf + GOODIX_SPI_TRANS_PREFIX_LEN);
+
+	spi_message_init(&spi_msg);
+	memset(&xfers, 0, sizeof(xfers));
+	xfers.tx_buf = ts->xfer_buf;
+	xfers.rx_buf = ts->xfer_buf;
+	xfers.len = GOODIX_SPI_READ_PREFIX_LEN + len;
+	spi_message_add_tail(&xfers, &spi_msg);
+
+	error = spi_sync(spi, &spi_msg);
+	if (error)
+		dev_err(ts->dev, "spi transfer error: %d", error);
+	else
+		memcpy(data, ts->xfer_buf + GOODIX_SPI_READ_PREFIX_LEN, len);
+
+	return error;
+}
+
+static int goodix_spi_write(struct goodix_ts_data *ts, u32 addr,
+			    const void *data, size_t len)
+{
+	struct spi_device *spi = to_spi_device(&ts->spi->dev);
+	struct spi_transfer xfers;
+	struct spi_message spi_msg;
+	int error;
+
+	if (GOODIX_SPI_WRITE_PREFIX_LEN + len > sizeof(ts->xfer_buf)) {
+		dev_err(ts->dev, "write data len exceed limit %zu",
+			sizeof(ts->xfer_buf) - GOODIX_SPI_WRITE_PREFIX_LEN);
+		return -EINVAL;
+	}
+
+	/* buffer format: 0xF0 + addr(4bytes) + data */
+	ts->xfer_buf[0] = GOODIX_SPI_WRITE_FLAG;
+	put_unaligned_be32(addr, ts->xfer_buf + GOODIX_SPI_TRANS_PREFIX_LEN);
+	memcpy(ts->xfer_buf + GOODIX_SPI_WRITE_PREFIX_LEN, data, len);
+
+	spi_message_init(&spi_msg);
+	memset(&xfers, 0, sizeof(xfers));
+	xfers.tx_buf = ts->xfer_buf;
+	xfers.len = GOODIX_SPI_WRITE_PREFIX_LEN + len;
+	spi_message_add_tail(&xfers, &spi_msg);
+
+	error = spi_sync(spi, &spi_msg);
+	if (error)
+		dev_err(ts->dev, "spi transfer error: %d", error);
+
+	return error;
+}
+
+static int goodix_dev_confirm(struct goodix_ts_data *ts)
+{
+	u8 tx_buf[8], rx_buf[8];
+	int retry = 3;
+	int error;
+
+	gpiod_set_value_cansleep(ts->reset_gpio, 0);
+	usleep_range(4000, 4100);
+
+	memset(tx_buf, GOODIX_DEV_CONFIRM_VAL, sizeof(tx_buf));
+	while (retry--) {
+		error = goodix_spi_write(ts, GOODIX_DEV_CONFIRM_ADDR,
+					 tx_buf, sizeof(tx_buf));
+		if (error)
+			return error;
+
+		error = goodix_spi_read(ts, GOODIX_DEV_CONFIRM_ADDR,
+					rx_buf, sizeof(rx_buf));
+		if (error)
+			return error;
+
+		if (!memcmp(tx_buf, rx_buf, sizeof(tx_buf)))
+			return 0;
+
+		usleep_range(5000, 5100);
+	}
+
+	dev_err(ts->dev, "device confirm failed, rx_buf: %*ph", 8, rx_buf);
+	return -EINVAL;
+}
+
+/**
+ * goodix_hid_parse() - hid-core .parse() callback
+ * @hid: hid device instance
+ *
+ * This function gets called during call to hid_add_device
+ *
+ * Return: 0 on success and non zero on error
+ */
+static int goodix_hid_parse(struct hid_device *hid)
+{
+	struct goodix_ts_data *ts = hid->driver_data;
+	u16 rsize;
+	int error;
+
+	rsize = le16_to_cpu(ts->hid_desc.report_desc_length);
+	if (!rsize || rsize > HID_MAX_DESCRIPTOR_SIZE) {
+		dev_err(ts->dev, "invalid report desc size, %d", rsize);
+		return -EINVAL;
+	}
+
+	u8 *rdesc __free(kfree) = kzalloc(rsize, GFP_KERNEL);
+	if (!rdesc)
+		return -ENOMEM;
+
+	error = goodix_spi_read(ts, GOODIX_HID_REPORT_DESC_ADDR, rdesc, rsize);
+	if (error) {
+		dev_err(ts->dev, "failed get report desc, %d", error);
+		return error;
+	}
+
+	error = hid_parse_report(hid, rdesc, rsize);
+	if (error) {
+		dev_err(ts->dev, "failed parse report, %d", error);
+		return error;
+	}
+
+	return 0;
+}
+
+static int goodix_hid_get_report_length(struct hid_report *report)
+{
+	return ((report->size - 1) >> 3) + 1 +
+		report->device->report_enum[report->type].numbered + 2;
+}
+
+static void goodix_hid_find_max_report(struct hid_device *hid, unsigned int type,
+				       unsigned int *max)
+{
+	struct hid_report *report;
+	unsigned int size;
+
+	list_for_each_entry(report, &hid->report_enum[type].report_list, list) {
+		size = goodix_hid_get_report_length(report);
+		if (*max < size)
+			*max = size;
+	}
+}
+
+static int goodix_hid_start(struct hid_device *hid)
+{
+	struct goodix_ts_data *ts = hid->driver_data;
+	unsigned int bufsize = GOODIX_HID_COOR_PKG_LEN;
+	u32 report_size;
+
+	goodix_hid_find_max_report(hid, HID_INPUT_REPORT, &bufsize);
+	goodix_hid_find_max_report(hid, HID_OUTPUT_REPORT, &bufsize);
+	goodix_hid_find_max_report(hid, HID_FEATURE_REPORT, &bufsize);
+
+	report_size = GOODIX_SPI_READ_PREFIX_LEN +
+			GOODIX_HID_ACK_HEADER_SIZE + bufsize;
+	if (report_size <= ts->hid_max_event_sz)
+		return 0;
+
+	ts->event_buf = devm_krealloc(ts->dev, ts->event_buf,
+				      report_size, GFP_KERNEL);
+	if (!ts->event_buf)
+		return -ENOMEM;
+
+	ts->hid_max_event_sz = report_size;
+	return 0;
+}
+
+static void goodix_hid_stop(struct hid_device *hid)
+{
+	hid->claimed = 0;
+}
+
+static int goodix_hid_open(struct hid_device *hid)
+{
+	struct goodix_ts_data *ts = hid->driver_data;
+
+	set_bit(GOODIX_HID_STARTED, &ts->flags);
+	return 0;
+}
+
+static void goodix_hid_close(struct hid_device *hid)
+{
+	struct goodix_ts_data *ts = hid->driver_data;
+
+	clear_bit(GOODIX_HID_STARTED, &ts->flags);
+}
+
+/* Return date length of response data */
+static int goodix_hid_check_ack_status(struct goodix_ts_data *ts)
+{
+	struct goodix_hid_report_header hdr;
+	int retry = 20;
+	int error;
+
+	while (retry--) {
+		/*
+		 * 3 bytes of hid request response data
+		 * - byte 0:    Ack flag, value of 1 for data ready
+		 * - bytes 1-2: Response data length
+		 */
+		error = goodix_spi_read(ts, ts->hid_report_addr,
+					&hdr, sizeof(hdr));
+		if (!error && (hdr.flag & GOODIX_HID_ACK_READY_FLAG))
+			return le16_to_cpu(hdr.size);
+
+		/* Wait 10ms for another try */
+		usleep_range(10000, 11000);
+	}
+
+	return -EINVAL;
+}
+
+/**
+ * goodix_hid_get_raw_report() - Process hidraw GET REPORT operation
+ * @hid: hid device instance
+ * @reportnum: Report ID
+ * @buf: Buffer for store the report date
+ * @len: Length fo report data
+ * @report_type: Report type
+ *
+ * The function for hid_ll_driver.get_raw_report to handle the HIDRAW ioctl
+ * get report request. The transmitted data follows the standard i2c-hid
+ * protocol with a specified header.
+ *
+ * Return: The length of the data in the buf on success, negative error code
+ */
+static int goodix_hid_get_raw_report(struct hid_device *hid,
+				     unsigned char reportnum,
+				     u8 *buf, size_t len,
+				     unsigned char report_type)
+{
+	struct goodix_ts_data *ts = hid->driver_data;
+	u16 data_register = le16_to_cpu(ts->hid_desc.data_register);
+	u16 cmd_register = le16_to_cpu(ts->hid_desc.cmd_register);
+	u8 tmp_buf[GOODIX_HID_MAX_INBUF_SIZE];
+	int tx_len = 0, args_len = 0;
+	int response_data_len;
+	u8 args[3];
+	int error;
+
+	if (report_type == HID_OUTPUT_REPORT)
+		return -EINVAL;
+
+	if (reportnum == 3) {
+		/* Get win8 signature data */
+		error = goodix_spi_read(ts, GOODIX_HID_SIGN_ADDR, buf, len);
+		if (error) {
+			dev_err(ts->dev, "failed get win8 sign: %d", error);
+			return -EINVAL;
+		}
+		return len;
+	}
+
+	if (reportnum >= 0x0F)
+		args[args_len++] = reportnum;
+
+	put_unaligned_le16(data_register, args + args_len);
+	args_len += sizeof(data_register);
+
+	/* Clean 3 bytes of hid ack header data */
+	memset(tmp_buf, 0, GOODIX_HID_ACK_HEADER_SIZE);
+	tx_len += GOODIX_HID_ACK_HEADER_SIZE;
+
+	put_unaligned_le16(cmd_register, tmp_buf + tx_len);
+	tx_len += sizeof(cmd_register);
+
+	tmp_buf[tx_len] = (report_type == HID_FEATURE_REPORT ? 0x03 : 0x01) << 4;
+	tmp_buf[tx_len] |=  reportnum >= 0x0F ? 0x0F : reportnum;
+	tx_len++;
+
+	tmp_buf[tx_len++] = GOODIX_HID_GET_REPORT_CMD;
+
+	memcpy(tmp_buf + tx_len, args, args_len);
+	tx_len += args_len;
+
+	/* Step1: write report request info */
+	error = goodix_spi_write(ts, ts->hid_report_addr, tmp_buf, tx_len);
+	if (error) {
+		dev_err(ts->dev, "failed send read feature cmd, %d", error);
+		return error;
+	}
+
+	/* No need read response data */
+	if (!len)
+		return 0;
+
+	/* Step2: check response data status */
+	response_data_len = goodix_hid_check_ack_status(ts);
+	if (response_data_len <= GOODIX_HID_PKG_LEN_SIZE)
+		return -EINVAL;
+
+	len = min(len, response_data_len - GOODIX_HID_PKG_LEN_SIZE);
+	/* Step3: read response data(skip 2bytes of hid pkg length) */
+	error = goodix_spi_read(ts, ts->hid_report_addr +
+				GOODIX_HID_ACK_HEADER_SIZE +
+				GOODIX_HID_PKG_LEN_SIZE, buf, len);
+	if (error) {
+		dev_err(ts->dev, "failed read hid response data, %d", error);
+		return error;
+	}
+
+	if (buf[0] != reportnum) {
+		dev_err(ts->dev, "incorrect report (%d vs %d expected)",
+			buf[0], reportnum);
+		return -EINVAL;
+	}
+	return len;
+}
+
+/**
+ * goodix_hid_set_raw_report() - process hidraw SET REPORT operation
+ * @hid: HID device
+ * @reportnum: Report ID
+ * @buf: Buffer for communication
+ * @len: Length of data in the buffer
+ * @report_type: Report type
+ *
+ * The function for hid_ll_driver.get_raw_report to handle the HIDRAW ioctl
+ * set report request. The transmitted data follows the standard i2c-hid
+ * protocol with a specified header.
+ *
+ * Return: The length of the data sent, negative error code on failure
+ */
+static int goodix_hid_set_raw_report(struct hid_device *hid,
+				     unsigned char reportnum,
+				     __u8 *buf, size_t len,
+				     unsigned char report_type)
+{
+	struct goodix_ts_data *ts = hid->driver_data;
+	u16 data_register = le16_to_cpu(ts->hid_desc.data_register);
+	u16 cmd_register = le16_to_cpu(ts->hid_desc.cmd_register);
+	int tx_len = 0, args_len = 0;
+	u8 tmp_buf[GOODIX_HID_MAX_INBUF_SIZE];
+	u8 args[5];
+	int error;
+
+	if (reportnum >= 0x0F) {
+		args[args_len++] = reportnum;
+		reportnum = 0x0F;
+	}
+
+	put_unaligned_le16(data_register, args + args_len);
+	args_len += sizeof(data_register);
+
+	put_unaligned_le16(GOODIX_HID_PKG_LEN_SIZE + len, args + args_len);
+	args_len += GOODIX_HID_PKG_LEN_SIZE;
+
+	/* Clean 3 bytes of hid ack header data */
+	memset(tmp_buf, 0, GOODIX_HID_ACK_HEADER_SIZE);
+	tx_len += GOODIX_HID_ACK_HEADER_SIZE;
+
+	put_unaligned_le16(cmd_register, tmp_buf + tx_len);
+	tx_len += sizeof(cmd_register);
+
+	tmp_buf[tx_len++] = ((report_type == HID_FEATURE_REPORT ? 0x03 : 0x02) << 4) | reportnum;
+	tmp_buf[tx_len++] = GOODIX_HID_SET_REPORT_CMD;
+
+	memcpy(tmp_buf + tx_len, args, args_len);
+	tx_len += args_len;
+
+	memcpy(tmp_buf + tx_len, buf, len);
+	tx_len += len;
+
+	error = goodix_spi_write(ts, ts->hid_report_addr, tmp_buf, tx_len);
+	if (error) {
+		dev_err(ts->dev, "failed send report: %*ph", tx_len, tmp_buf);
+		return error;
+	}
+	return len;
+}
+
+static int goodix_hid_raw_request(struct hid_device *hid,
+				  unsigned char reportnum,
+				  __u8 *buf, size_t len,
+				  unsigned char rtype, int reqtype)
+{
+	struct goodix_ts_data *ts = hid->driver_data;
+	int error = -EINVAL;
+
+	guard(mutex)(&ts->hid_request_lock);
+	switch (reqtype) {
+	case HID_REQ_GET_REPORT:
+		error = goodix_hid_get_raw_report(hid, reportnum, buf,
+						  len, rtype);
+		break;
+	case HID_REQ_SET_REPORT:
+		if (buf[0] == reportnum)
+			error = goodix_hid_set_raw_report(hid, reportnum,
+							  buf, len, rtype);
+		break;
+	default:
+		break;
+	}
+
+	return error;
+}
+
+static struct hid_ll_driver goodix_hid_ll_driver = {
+	.parse = goodix_hid_parse,
+	.start = goodix_hid_start,
+	.stop = goodix_hid_stop,
+	.open = goodix_hid_open,
+	.close = goodix_hid_close,
+	.raw_request = goodix_hid_raw_request
+};
+
+static irqreturn_t goodix_hid_irq(int irq, void *data)
+{
+	struct goodix_ts_data *ts = data;
+	struct goodix_hid_report_event *event;
+	struct goodix_hid_report_package *pkg;
+	u16 report_size;
+
+	if (!test_bit(GOODIX_HID_STARTED, &ts->flags))
+		return IRQ_HANDLED;
+	/*
+	 * First, read buffer with space for header and coordinate package:
+	 * - event header = 3 bytes
+	 * - coordinate event = GOODIX_HID_COOR_PKG_LEN bytes
+	 *
+	 * If the data size info in the event header exceeds
+	 * GOODIX_HID_COOR_PKG_LEN, it means that there are other packages
+	 * besides the coordinate package.
+	 */
+	event = goodix_get_event_report(ts, ts->hid_report_addr, ts->event_buf,
+					GOODIX_HID_ACK_HEADER_SIZE +
+					GOODIX_HID_COOR_PKG_LEN);
+	if (!event) {
+		dev_err(ts->dev, "failed get coordinate data");
+		return IRQ_HANDLED;
+	}
+
+	/* Check coordinate data valid falg */
+	if (event->hdr.flag != GOODIX_HID_REPORT_READY_FLAG)
+		return IRQ_HANDLED;
+
+	pkg = (struct goodix_hid_report_package *)event->data;
+	if (le16_to_cpu(pkg->size) < GOODIX_HID_PKG_LEN_SIZE) {
+		dev_err(ts->dev, "invalid coordinate event package size, %d",
+			le16_to_cpu(pkg->size));
+		return IRQ_HANDLED;
+	}
+	hid_input_report(ts->hid, HID_INPUT_REPORT, pkg->data,
+			 le16_to_cpu(pkg->size) - GOODIX_HID_PKG_LEN_SIZE, 1);
+
+	report_size = le16_to_cpu(event->hdr.size);
+	/* Check if there are other packages */
+	if (report_size <= GOODIX_HID_COOR_PKG_LEN)
+		return IRQ_HANDLED;
+
+	if (report_size >= ts->hid_max_event_sz) {
+		dev_err(ts->dev, "package size exceed limit %d vs %d",
+			report_size, ts->hid_max_event_sz);
+		return IRQ_HANDLED;
+	}
+
+	/* Read the package behind the coordinate data */
+	pkg = goodix_get_event_report(ts, ts->hid_report_addr + sizeof(*event),
+				      ts->event_buf,
+				      report_size - GOODIX_HID_COOR_PKG_LEN);
+	if (!pkg) {
+		dev_err(ts->dev, "failed read attachment data content");
+		return IRQ_HANDLED;
+	}
+
+	hid_input_report(ts->hid, HID_INPUT_REPORT, pkg->data,
+			 le16_to_cpu(pkg->size) - GOODIX_HID_PKG_LEN_SIZE, 1);
+
+	return IRQ_HANDLED;
+}
+
+static int goodix_hid_init(struct goodix_ts_data *ts)
+{
+	struct hid_device *hid;
+	int error;
+
+	/* Get hid descriptor */
+	error = goodix_spi_read(ts, GOODIX_HID_DESC_ADDR, &ts->hid_desc,
+				sizeof(ts->hid_desc));
+	if (error) {
+		dev_err(ts->dev, "failed get hid desc, %d", error);
+		return error;
+	}
+
+	hid = hid_allocate_device();
+	if (IS_ERR(hid))
+		return PTR_ERR(hid);
+
+	hid->driver_data = ts;
+	hid->ll_driver = &goodix_hid_ll_driver;
+	hid->bus = BUS_SPI;
+	hid->dev.parent = &ts->spi->dev;
+
+	hid->version = le16_to_cpu(ts->hid_desc.bcd_version);
+	hid->vendor = le16_to_cpu(ts->hid_desc.vendor_id);
+	hid->product = le16_to_cpu(ts->hid_desc.product_id);
+	snprintf(hid->name, sizeof(hid->name), "%s %04X:%04X", "hid-gdix",
+		 hid->vendor, hid->product);
+
+	error = hid_add_device(hid);
+	if (error) {
+		dev_err(ts->dev, "failed add hid device, %d", error);
+		hid_destroy_device(hid);
+		return error;
+	}
+
+	ts->hid = hid;
+	return 0;
+}
+
+static int goodix_spi_probe(struct spi_device *spi)
+{
+	struct device *dev = &spi->dev;
+	struct goodix_ts_data *ts;
+	int error;
+
+	/* init spi_device */
+	spi->mode            = SPI_MODE_0;
+	spi->bits_per_word   = 8;
+	error = spi_setup(spi);
+	if (error)
+		return error;
+
+	ts = devm_kzalloc(dev, sizeof(*ts), GFP_KERNEL);
+	if (!ts)
+		return -ENOMEM;
+
+	mutex_init(&ts->hid_request_lock);
+	spi_set_drvdata(spi, ts);
+	ts->spi = spi;
+	ts->dev = dev;
+	ts->hid_max_event_sz = GOODIX_SPI_READ_PREFIX_LEN +
+			       GOODIX_HID_ACK_HEADER_SIZE + GOODIX_HID_COOR_PKG_LEN;
+	ts->event_buf = devm_kmalloc(dev, ts->hid_max_event_sz, GFP_KERNEL);
+	if (!ts->event_buf)
+		return -ENOMEM;
+
+	ts->reset_gpio = devm_gpiod_get_optional(dev, "reset", GPIOD_OUT_HIGH);
+	if (IS_ERR(ts->reset_gpio))
+		return dev_err_probe(dev, PTR_ERR(ts->reset_gpio),
+				     "failed to request reset gpio\n");
+
+	error = device_property_read_u32(dev, "goodix,hid-report-addr",
+					 &ts->hid_report_addr);
+	if (error)
+		return dev_err_probe(dev, error,
+				     "failed get hid report addr\n");
+
+	error = goodix_dev_confirm(ts);
+	if (error)
+		return error;
+
+	/* Waits 150ms for firmware to fully boot */
+	msleep(GOODIX_NORMAL_RESET_DELAY_MS);
+
+	error = goodix_hid_init(ts);
+	if (error) {
+		dev_err(dev, "failed init hid device");
+		return error;
+	}
+
+	error = devm_request_threaded_irq(&ts->spi->dev, ts->spi->irq,
+					  NULL, goodix_hid_irq, IRQF_ONESHOT,
+					  "goodix_spi_hid", ts);
+	if (error) {
+		dev_err(ts->dev, "could not register interrupt, irq = %d, %d",
+			ts->spi->irq, error);
+		goto err_destroy_hid;
+	}
+
+	return 0;
+
+err_destroy_hid:
+	hid_destroy_device(ts->hid);
+	return error;
+}
+
+static void goodix_spi_remove(struct spi_device *spi)
+{
+	struct goodix_ts_data *ts = spi_get_drvdata(spi);
+
+	disable_irq(spi->irq);
+	hid_destroy_device(ts->hid);
+}
+
+static int goodix_spi_set_power(struct goodix_ts_data *ts, int power_state)
+{
+	u8 power_control_cmd[] = {0x00, 0x00, 0x00, 0x87, 0x02, 0x00, 0x08};
+	int error;
+
+	/* value 0 for power on, 1 for power sleep */
+	power_control_cmd[5] = power_state;
+
+	guard(mutex)(&ts->hid_request_lock);
+	error = goodix_spi_write(ts, ts->hid_report_addr, power_control_cmd,
+				 sizeof(power_control_cmd));
+	if (error) {
+		dev_err(ts->dev, "failed set power mode: %s",
+			power_state == GOODIX_SPI_POWER_ON ? "on" : "sleep");
+		return error;
+	}
+	return 0;
+}
+
+static int goodix_spi_suspend(struct device *dev)
+{
+	struct goodix_ts_data *ts = dev_get_drvdata(dev);
+
+	disable_irq(ts->spi->irq);
+	return goodix_spi_set_power(ts, GOODIX_SPI_POWER_SLEEP);
+}
+
+static int goodix_spi_resume(struct device *dev)
+{
+	struct goodix_ts_data *ts = dev_get_drvdata(dev);
+
+	enable_irq(ts->spi->irq);
+	return goodix_spi_set_power(ts, GOODIX_SPI_POWER_ON);
+}
+
+static DEFINE_SIMPLE_DEV_PM_OPS(goodix_spi_pm_ops,
+				goodix_spi_suspend, goodix_spi_resume);
+
+#ifdef CONFIG_ACPI
+static const struct acpi_device_id goodix_spi_acpi_match[] = {
+	{ "GXTS7986" },
+	{ },
+};
+MODULE_DEVICE_TABLE(acpi, goodix_spi_acpi_match);
+#endif
+
+#ifdef CONFIG_OF
+static const struct of_device_id goodix_spi_of_match[] = {
+	{ .compatible = "goodix,gt7986u", },
+	{ }
+};
+MODULE_DEVICE_TABLE(of, goodix_spi_of_match);
+#endif
+
+static const struct spi_device_id goodix_spi_ids[] = {
+	{ "gt7986u" },
+	{ },
+};
+MODULE_DEVICE_TABLE(spi, goodix_spi_ids);
+
+static struct spi_driver goodix_spi_driver = {
+	.driver = {
+		.name = "goodix-spi-hid",
+		.acpi_match_table = ACPI_PTR(goodix_spi_acpi_match),
+		.of_match_table = of_match_ptr(goodix_spi_of_match),
+		.pm = pm_sleep_ptr(&goodix_spi_pm_ops),
+	},
+	.probe =	goodix_spi_probe,
+	.remove =	goodix_spi_remove,
+	.id_table =	goodix_spi_ids,
+};
+module_spi_driver(goodix_spi_driver);
+
+MODULE_DESCRIPTION("Goodix SPI driver for HID touchscreen");
+MODULE_AUTHOR("Goodix, Inc.");
+MODULE_LICENSE("GPL");
-- 
2.43.0


