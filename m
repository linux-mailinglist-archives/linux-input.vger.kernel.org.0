Return-Path: <linux-input+bounces-8596-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 410D59F282E
	for <lists+linux-input@lfdr.de>; Mon, 16 Dec 2024 02:52:12 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id BBBFC188911D
	for <lists+linux-input@lfdr.de>; Mon, 16 Dec 2024 01:52:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 593671D90B6;
	Mon, 16 Dec 2024 01:43:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="U8u4xISN"
X-Original-To: linux-input@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E2401D90A2;
	Mon, 16 Dec 2024 01:42:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734313382; cv=none; b=bCBFMrhTw0X2rUkwwVEFYyaTM1S/KnYMmsqeT3NDdRwy/ixLhVku880Ur7RQLaF+IPvoYwTE1IAeR5iTEQ4QT/6rS9AXVzY12a4JReC7pJPCtGURbqnYH0df/+ebZEo+hbBKzgMUrDvjgMxpUvNPwyGUkJWJXdi2HSPEcV3wWPw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734313382; c=relaxed/simple;
	bh=CjRXp+jT/wH8uNqJ7s8QC42y7VuWPl2pshB9Gpe/NRs=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=eBPw+mcgOiRHK+BNI1WCcsf76J+yoGuZbuLKVLB3S5WyqVzlZUfKs3ShWwzzaV6Z419Kz4gKMZG01Gvrjo5QWvZ2x/81ZNmQmuJGQW02EfjrLvGLBXoCjao6KbEbCvohhoEBWFEuL4gJW3/ayUL4yrYTC+GfG7KXbYoU7/0c0eI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=U8u4xISN; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1734313379; x=1765849379;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=CjRXp+jT/wH8uNqJ7s8QC42y7VuWPl2pshB9Gpe/NRs=;
  b=U8u4xISNAIG3ROphwdy3AimGicIxVHh/z0iUuIp6JQpvXyfaLfToX61V
   qYC2aQbNm+pE1m72BLvk3J2UBEc1Vh7PVueIvPRwd0SF0Z7yN8+642d6U
   IKIWrphyVVxcJNwzWC68QMMrIUMJ4e8vOxM6m02wli/LEW8kh44YqjuKI
   FvDQDXyD4E86i/3sLep3NS3/sEbJPnJHQiuzUKki6CNOvGvW9Cfig/Wo6
   rjFFkj19wHzMe8es6G9Mw8paomHQ5Hy71vA0j2s0ePzuCSXT6MCGtkMm0
   5kJJy/MhvBxx779Xu8SvXxw+V6yclW92OL7LMO+JXZBzHtE/dnUbhFpNa
   A==;
X-CSE-ConnectionGUID: AQaeKp+4QqCcSHYOFd4Kog==
X-CSE-MsgGUID: Oauv5qIOTqmzaRs1ymDnBg==
X-IronPort-AV: E=McAfee;i="6700,10204,11287"; a="34013158"
X-IronPort-AV: E=Sophos;i="6.12,237,1728975600"; 
   d="scan'208";a="34013158"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Dec 2024 17:42:59 -0800
X-CSE-ConnectionGUID: G/Xo4YvWRoqjQmEyguXDpQ==
X-CSE-MsgGUID: QnL1Cg+aTsCgq9qXM6i3HQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,237,1728975600"; 
   d="scan'208";a="102084281"
Received: from shsensorbuild.sh.intel.com ([10.239.133.18])
  by orviesa004.jf.intel.com with ESMTP; 15 Dec 2024 17:42:55 -0800
From: Even Xu <even.xu@intel.com>
To: jikos@kernel.org,
	bentiss@kernel.org,
	corbet@lwn.net,
	bagasdotme@gmail.com,
	aaron.ma@canonical.com,
	rdunlap@infradead.org
Cc: linux-input@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org,
	Even Xu <even.xu@intel.com>,
	Xinpeng Sun <xinpeng.sun@intel.com>,
	Rui Zhang <rui1.zhang@intel.com>,
	Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>
Subject: [PATCH v3 20/22] HID: intel-thc-hid: intel-quicki2c: Add HIDI2C protocol implementation
Date: Mon, 16 Dec 2024 09:41:25 +0800
Message-Id: <20241216014127.3722172-21-even.xu@intel.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20241216014127.3722172-1-even.xu@intel.com>
References: <20241216014127.3722172-1-even.xu@intel.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Intel QuickI2C driver uses THC hardware to accelerate HID over I2C
(HIDI2C) protocol flow.

This patch implements all data flows described in HID over I2C protocol
SPEC by using THC hardware layer APIs.

HID over I2C SPEC:
https://learn.microsoft.com/en-us/previous-versions/windows/hardware/design/dn642101(v=vs.85)

Co-developed-by: Xinpeng Sun <xinpeng.sun@intel.com>
Signed-off-by: Xinpeng Sun <xinpeng.sun@intel.com>
Signed-off-by: Even Xu <even.xu@intel.com>
Tested-by: Rui Zhang <rui1.zhang@intel.com>
Reviewed-by: Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>
---
 drivers/hid/intel-thc-hid/Makefile            |   1 +
 .../intel-quicki2c/quicki2c-dev.h             |   6 +
 .../intel-quicki2c/quicki2c-hid.c             |  18 +-
 .../intel-quicki2c/quicki2c-protocol.c        | 197 ++++++++++++++++++
 .../intel-quicki2c/quicki2c-protocol.h        |  19 ++
 include/linux/hid-over-i2c.h                  |  73 +++++++
 6 files changed, 313 insertions(+), 1 deletion(-)
 create mode 100644 drivers/hid/intel-thc-hid/intel-quicki2c/quicki2c-protocol.c
 create mode 100644 drivers/hid/intel-thc-hid/intel-quicki2c/quicki2c-protocol.h

diff --git a/drivers/hid/intel-thc-hid/Makefile b/drivers/hid/intel-thc-hid/Makefile
index 91bde6d6aa14..6f762d87af07 100644
--- a/drivers/hid/intel-thc-hid/Makefile
+++ b/drivers/hid/intel-thc-hid/Makefile
@@ -17,5 +17,6 @@ intel-quickspi-objs += intel-quickspi/quickspi-protocol.o
 obj-$(CONFIG_INTEL_QUICKI2C) += intel-quicki2c.o
 intel-quicki2c-objs += intel-quicki2c/pci-quicki2c.o
 intel-quicki2c-objs += intel-quicki2c/quicki2c-hid.o
+intel-quicki2c-objs += intel-quicki2c/quicki2c-protocol.o
 
 ccflags-y += -I $(src)/intel-thc
diff --git a/drivers/hid/intel-thc-hid/intel-quicki2c/quicki2c-dev.h b/drivers/hid/intel-thc-hid/intel-quicki2c/quicki2c-dev.h
index 60cb736bd5e5..d6ad731120ce 100644
--- a/drivers/hid/intel-thc-hid/intel-quicki2c/quicki2c-dev.h
+++ b/drivers/hid/intel-thc-hid/intel-quicki2c/quicki2c-dev.h
@@ -138,6 +138,9 @@ struct acpi_device;
  * @i2c_clock_hcnt: I2C CLK high period time (unit in cycle count)
  * @i2c_clock_lcnt: I2C CLK low period time (unit in cycle count)
  * @report_descriptor: store a copy of device report descriptor
+ * @input_buf: store a copy of latest input report data
+ * @report_buf: store a copy of latest input/output report packet from set/get feature
+ * @report_len: the length of input/output report packet
  */
 struct quicki2c_device {
 	struct device *dev;
@@ -161,6 +164,9 @@ struct quicki2c_device {
 	u32 i2c_clock_lcnt;
 
 	u8 *report_descriptor;
+	u8 *input_buf;
+	u8 *report_buf;
+	u32 report_len;
 };
 
 #endif /* _QUICKI2C_DEV_H_ */
diff --git a/drivers/hid/intel-thc-hid/intel-quicki2c/quicki2c-hid.c b/drivers/hid/intel-thc-hid/intel-quicki2c/quicki2c-hid.c
index 4236603f3f76..e8e6f10b7952 100644
--- a/drivers/hid/intel-thc-hid/intel-quicki2c/quicki2c-hid.c
+++ b/drivers/hid/intel-thc-hid/intel-quicki2c/quicki2c-hid.c
@@ -6,6 +6,7 @@
 
 #include "quicki2c-dev.h"
 #include "quicki2c-hid.h"
+#include "quicki2c-protocol.h"
 
 /**
  * quicki2c_hid_parse() - HID core parse() callback
@@ -51,7 +52,22 @@ static int quicki2c_hid_raw_request(struct hid_device *hid,
 				    __u8 *buf, size_t len,
 				    unsigned char rtype, int reqtype)
 {
-	return 0;
+	struct quicki2c_device *qcdev = hid->driver_data;
+	int ret = 0;
+
+	switch (reqtype) {
+	case HID_REQ_GET_REPORT:
+		ret = quicki2c_get_report(qcdev, rtype, reportnum, buf, len);
+		break;
+	case HID_REQ_SET_REPORT:
+		ret = quicki2c_set_report(qcdev, rtype, reportnum, buf, len);
+		break;
+	default:
+		dev_err(qcdev->dev, "Not supported request type %d\n", reqtype);
+		break;
+	}
+
+	return ret;
 }
 
 static int quicki2c_hid_power(struct hid_device *hid, int lvl)
diff --git a/drivers/hid/intel-thc-hid/intel-quicki2c/quicki2c-protocol.c b/drivers/hid/intel-thc-hid/intel-quicki2c/quicki2c-protocol.c
new file mode 100644
index 000000000000..0540003c221e
--- /dev/null
+++ b/drivers/hid/intel-thc-hid/intel-quicki2c/quicki2c-protocol.c
@@ -0,0 +1,197 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+/* Copyright (c) 2024 Intel Corporation */
+
+#include <linux/bitfield.h>
+#include <linux/hid.h>
+#include <linux/hid-over-i2c.h>
+
+#include "intel-thc-dev.h"
+#include "intel-thc-dma.h"
+
+#include "quicki2c-dev.h"
+#include "quicki2c-hid.h"
+#include "quicki2c-protocol.h"
+
+static int quicki2c_init_write_buf(struct quicki2c_device *qcdev, u32 cmd, int cmd_len,
+				   bool append_data_reg, u8 *data, int data_len,
+				   u8 *write_buf, int write_buf_len)
+{
+	int buf_len, offset = 0;
+
+	buf_len = HIDI2C_REG_LEN + cmd_len;
+
+	if (append_data_reg)
+		buf_len += HIDI2C_REG_LEN;
+
+	if (data && data_len)
+		buf_len += data_len + HIDI2C_LENGTH_LEN;
+
+	if (buf_len > write_buf_len)
+		return -EINVAL;
+
+	memcpy(write_buf, &qcdev->dev_desc.cmd_reg, HIDI2C_REG_LEN);
+	offset += HIDI2C_REG_LEN;
+	memcpy(write_buf + offset, &cmd, cmd_len);
+	offset += cmd_len;
+
+	if (append_data_reg) {
+		memcpy(write_buf + offset, &qcdev->dev_desc.data_reg, HIDI2C_REG_LEN);
+		offset += HIDI2C_REG_LEN;
+	}
+
+	if (data && data_len) {
+		__le16 len = cpu_to_le16(data_len + HIDI2C_LENGTH_LEN);
+
+		memcpy(write_buf + offset, &len, HIDI2C_LENGTH_LEN);
+		offset += HIDI2C_LENGTH_LEN;
+		memcpy(write_buf + offset, data, data_len);
+	}
+
+	return buf_len;
+}
+
+static int quicki2c_encode_cmd(struct quicki2c_device *qcdev, u32 *cmd_buf,
+			       u8 opcode, u8 report_type, u8 report_id)
+{
+	int cmd_len;
+
+	*cmd_buf = FIELD_PREP(HIDI2C_CMD_OPCODE, opcode) |
+		   FIELD_PREP(HIDI2C_CMD_REPORT_TYPE, report_type);
+
+	if (report_id < HIDI2C_CMD_MAX_RI) {
+		*cmd_buf |= FIELD_PREP(HIDI2C_CMD_REPORT_ID, report_id);
+		cmd_len = HIDI2C_CMD_LEN;
+	} else {
+		*cmd_buf |= FIELD_PREP(HIDI2C_CMD_REPORT_ID, HIDI2C_CMD_MAX_RI) |
+			    FIELD_PREP(HIDI2C_CMD_3RD_BYTE, report_id);
+		cmd_len = HIDI2C_CMD_LEN_OPT;
+	}
+
+	return cmd_len;
+}
+
+static int write_cmd_to_txdma(struct quicki2c_device *qcdev, int opcode,
+			      int report_type, int report_id, u8 *buf, int buf_len)
+{
+	size_t write_buf_len;
+	int cmd_len, ret;
+	u32 cmd;
+
+	cmd_len = quicki2c_encode_cmd(qcdev, &cmd, opcode, report_type, report_id);
+
+	ret = quicki2c_init_write_buf(qcdev, cmd, cmd_len, buf ? true : false, buf,
+				      buf_len, qcdev->report_buf, qcdev->report_len);
+	if (ret < 0)
+		return ret;
+
+	write_buf_len = ret;
+
+	return thc_dma_write(qcdev->thc_hw, qcdev->report_buf, write_buf_len);
+}
+
+int quicki2c_set_power(struct quicki2c_device *qcdev, enum hidi2c_power_state power_state)
+{
+	return write_cmd_to_txdma(qcdev, HIDI2C_SET_POWER, HIDI2C_RESERVED, power_state, NULL, 0);
+}
+
+int quicki2c_get_device_descriptor(struct quicki2c_device *qcdev)
+{
+	u32 read_len = 0;
+	int ret;
+
+	ret = thc_tic_pio_write_and_read(qcdev->thc_hw, qcdev->hid_desc_addr,
+					 HIDI2C_REG_LEN, NULL, HIDI2C_DEV_DESC_LEN,
+					 &read_len, (u32 *)&qcdev->dev_desc);
+	if (ret || HIDI2C_DEV_DESC_LEN != read_len) {
+		dev_err_once(qcdev->dev, "Get device descriptor failed, ret %d, read len %u\n",
+			     ret, read_len);
+		return -EIO;
+	}
+
+	if (le16_to_cpu(qcdev->dev_desc.bcd_ver) != HIDI2C_HID_DESC_BCDVERSION)
+		return -EOPNOTSUPP;
+
+	return 0;
+}
+
+int quicki2c_get_report_descriptor(struct quicki2c_device *qcdev)
+{
+	u16 desc_reg = le16_to_cpu(qcdev->dev_desc.report_desc_reg);
+	size_t read_len = le16_to_cpu(qcdev->dev_desc.report_desc_len);
+	u32 prd_len = read_len;
+
+	return thc_swdma_read(qcdev->thc_hw, (u8 *)&desc_reg, HIDI2C_REG_LEN,
+			      &prd_len, qcdev->report_descriptor, &read_len);
+}
+
+int quicki2c_get_report(struct quicki2c_device *qcdev, u8 report_type,
+			unsigned int reportnum, void *buf, u32 buf_len)
+{
+	struct hidi2c_report_packet *rpt;
+	size_t write_buf_len, read_len = 0;
+	int cmd_len, rep_type;
+	u32 cmd;
+	int ret;
+
+	if (report_type == HID_INPUT_REPORT) {
+		rep_type = HIDI2C_INPUT;
+	} else if (report_type == HID_FEATURE_REPORT) {
+		rep_type = HIDI2C_FEATURE;
+	} else {
+		dev_err(qcdev->dev, "Unsupported report type for GET REPORT: %d\n", report_type);
+		return -EINVAL;
+	}
+
+	cmd_len = quicki2c_encode_cmd(qcdev, &cmd, HIDI2C_GET_REPORT, rep_type, reportnum);
+
+	ret = quicki2c_init_write_buf(qcdev, cmd, cmd_len, true, NULL, 0,
+				      qcdev->report_buf, qcdev->report_len);
+	if (ret < 0)
+		return ret;
+
+	write_buf_len = ret;
+
+	rpt = (struct hidi2c_report_packet *)qcdev->input_buf;
+
+	ret = thc_swdma_read(qcdev->thc_hw, qcdev->report_buf, write_buf_len,
+			     NULL, rpt, &read_len);
+	if (ret) {
+		dev_err_once(qcdev->dev, "Get report failed, ret %d, read len (%zu vs %d)\n",
+			     ret, read_len, buf_len);
+		return ret;
+	}
+
+	if (HIDI2C_DATA_LEN(le16_to_cpu(rpt->len)) != buf_len || rpt->data[0] != reportnum) {
+		dev_err_once(qcdev->dev, "Invalid packet, len (%d vs %d) report id (%d vs %d)\n",
+			     le16_to_cpu(rpt->len), buf_len, rpt->data[0], reportnum);
+		return -EINVAL;
+	}
+
+	memcpy(buf, rpt->data, buf_len);
+
+	return buf_len;
+}
+
+int quicki2c_set_report(struct quicki2c_device *qcdev, u8 report_type,
+			unsigned int reportnum, void *buf, u32 buf_len)
+{
+	int rep_type;
+	int ret;
+
+	if (report_type == HID_OUTPUT_REPORT) {
+		rep_type = HIDI2C_OUTPUT;
+	} else if (report_type == HID_FEATURE_REPORT) {
+		rep_type = HIDI2C_FEATURE;
+	} else {
+		dev_err(qcdev->dev, "Unsupported report type for SET REPORT: %d\n", report_type);
+		return -EINVAL;
+	}
+
+	ret = write_cmd_to_txdma(qcdev, HIDI2C_SET_REPORT, rep_type, reportnum, buf, buf_len);
+	if (ret) {
+		dev_err_once(qcdev->dev, "Set Report failed, ret %d\n", ret);
+		return ret;
+	}
+
+	return buf_len;
+}
diff --git a/drivers/hid/intel-thc-hid/intel-quicki2c/quicki2c-protocol.h b/drivers/hid/intel-thc-hid/intel-quicki2c/quicki2c-protocol.h
new file mode 100644
index 000000000000..3a0d66c7d9ef
--- /dev/null
+++ b/drivers/hid/intel-thc-hid/intel-quicki2c/quicki2c-protocol.h
@@ -0,0 +1,19 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/* Copyright (c) 2024 Intel Corporation */
+
+#ifndef _QUICKI2C_PROTOCOL_H_
+#define _QUICKI2C_PROTOCOL_H_
+
+#include <linux/hid-over-i2c.h>
+
+struct quicki2c_device;
+
+int quicki2c_set_power(struct quicki2c_device *qcdev, enum hidi2c_power_state power_state);
+int quicki2c_get_report(struct quicki2c_device *qcdev, u8 report_type,
+			unsigned int reportnum, void *buf, u32 buf_len);
+int quicki2c_set_report(struct quicki2c_device *qcdev, u8 report_type,
+			unsigned int reportnum, void *buf, u32 buf_len);
+int quicki2c_get_device_descriptor(struct quicki2c_device *qcdev);
+int quicki2c_get_report_descriptor(struct quicki2c_device *qcdev);
+
+#endif /* _QUICKI2C_PROTOCOL_H_ */
diff --git a/include/linux/hid-over-i2c.h b/include/linux/hid-over-i2c.h
index b70626723a38..3b1a0208a6b8 100644
--- a/include/linux/hid-over-i2c.h
+++ b/include/linux/hid-over-i2c.h
@@ -1,9 +1,80 @@
 /* SPDX-License-Identifier: GPL-2.0 */
 /* Copyright 2024 Intel Corporation */
 
+#include <linux/bits.h>
+
 #ifndef _HID_OVER_I2C_H_
 #define _HID_OVER_I2C_H_
 
+#define HIDI2C_REG_LEN		sizeof(__le16)
+
+/* Input report type definition in HIDI2C protocol */
+enum hidi2c_report_type {
+	HIDI2C_RESERVED = 0,
+	HIDI2C_INPUT,
+	HIDI2C_OUTPUT,
+	HIDI2C_FEATURE,
+};
+
+/* Power state type definition in HIDI2C protocol */
+enum hidi2c_power_state {
+	HIDI2C_ON,
+	HIDI2C_SLEEP,
+};
+
+/* Opcode type definition in HIDI2C protocol */
+enum hidi2c_opcode {
+	HIDI2C_RESET = 1,
+	HIDI2C_GET_REPORT,
+	HIDI2C_SET_REPORT,
+	HIDI2C_GET_IDLE,
+	HIDI2C_SET_IDLE,
+	HIDI2C_GET_PROTOCOL,
+	HIDI2C_SET_PROTOCOL,
+	HIDI2C_SET_POWER,
+};
+
+/**
+ * struct hidi2c_report_packet - Report packet definition in HIDI2C protocol
+ * @len: data field length
+ * @data: HIDI2C report packet data
+ */
+struct hidi2c_report_packet {
+	__le16 len;
+	u8 data[];
+} __packed;
+
+#define HIDI2C_LENGTH_LEN	sizeof(__le16)
+
+#define HIDI2C_PACKET_LEN(data_len)	((data_len) + HIDI2C_LENGTH_LEN)
+#define HIDI2C_DATA_LEN(pkt_len)	((pkt_len) - HIDI2C_LENGTH_LEN)
+
+#define HIDI2C_CMD_MAX_RI	0x0F
+
+/**
+ * HIDI2C command data packet - Command packet definition in HIDI2C protocol
+ * @report_id:		[0:3] report id (<15) for features or output reports
+ * @report_type:	[4:5] indicate report type, reference to hidi2c_report_type
+ * @reserved0:		[6:7] reserved bits
+ * @opcode:		[8:11] command operation code, reference to hidi2c_opcode
+ * @reserved1:		[12:15] reserved bits
+ * @report_id_optional: [23:16] appended 3rd byte.
+ *                      If the report_id in the low byte is set to the
+ *                      sentinel value (HIDI2C_CMD_MAX_RI), then this
+ *                      optional third byte represents the report id (>=15)
+ *                      Otherwise, not this 3rd byte.
+ */
+
+#define HIDI2C_CMD_LEN			sizeof(__le16)
+#define HIDI2C_CMD_LEN_OPT		(sizeof(__le16) + 1)
+#define HIDI2C_CMD_REPORT_ID		GENMASK(3, 0)
+#define HIDI2C_CMD_REPORT_TYPE		GENMASK(5, 4)
+#define HIDI2C_CMD_OPCODE		GENMASK(11, 8)
+#define HIDI2C_CMD_OPCODE		GENMASK(11, 8)
+#define HIDI2C_CMD_3RD_BYTE		GENMASK(23, 16)
+
+#define HIDI2C_HID_DESC_BCDVERSION	0x100
+
 /**
  * struct hidi2c_dev_descriptor - HIDI2C device descriptor definition
  * @dev_desc_len: The length of the complete device descriptor, fixed to 0x1E (30).
@@ -41,4 +112,6 @@ struct hidi2c_dev_descriptor {
 	__le16 reserved1;
 } __packed;
 
+#define HIDI2C_DEV_DESC_LEN		sizeof(struct hidi2c_dev_descriptor)
+
 #endif /* _HID_OVER_I2C_H_ */
-- 
2.40.1


