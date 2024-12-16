Return-Path: <linux-input+bounces-8590-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F1DC9F27FC
	for <lists+linux-input@lfdr.de>; Mon, 16 Dec 2024 02:46:06 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id D02F81884D79
	for <lists+linux-input@lfdr.de>; Mon, 16 Dec 2024 01:46:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E3DAD154C0F;
	Mon, 16 Dec 2024 01:42:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Z0W6rsI4"
X-Original-To: linux-input@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 80D5215383C;
	Mon, 16 Dec 2024 01:42:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734313359; cv=none; b=KWXMgqtM2MvnwrUX2cVo794G6k4WaVn1Cuy+YB2JHsohZAuaGhdOZ062VMF8a5wjWofabCK6mPJPRTDnwfcrV0AV7IrhbPT5InLG5JbDdqmRsL/mrKVcVhuMTxfP1vtxU51ETG0ok/yDrN8KxdAYTANXlagIXJhZ69L4j1dCLBA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734313359; c=relaxed/simple;
	bh=hPnU7O7muzBhA8lonmMcYDzNNQCd3DJ3HxNG8mlK8QA=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version:Content-Type; b=ezSfVXbVcHeCPMAJ5+D5WssD8pnQB692CsydkajFK/ThgL0mw92LY5TAHcLUtCduVvbCoFFPPbpWyrqNTb4ByiMhuN0cQ71TwnQrU6TNq/R01Cz9f/pEZel9tpJvShuDZMTc7zXcC/0c6+D1Ewq0re8roW58Lb4ykEMfW9kPxUc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Z0W6rsI4; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1734313357; x=1765849357;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=hPnU7O7muzBhA8lonmMcYDzNNQCd3DJ3HxNG8mlK8QA=;
  b=Z0W6rsI4h8gBKl6MV3ac0j45nyd52yCjKI2ITz56fiP2SMuzaQFtEZSm
   ZX9s635B58fqU/IPe7TEzCdRSf4G4ihoKjdxJwzkgeWnTeA9AEFHcxINC
   qcdLAWBuhG/U4b+/kMI7A8sJMM7pXoFKBY8m2RWf9g6xQxei+6dnMfc4/
   AWFtFFxPqR8OfWWPRhlR/M26J1/JAsPw54CV2a4YZAu8vHF+12UQwtHV3
   ujDU9qvg0KLqM0qwjMUzmnQo3D+b8JYn3tI5SYVWcI63ynM72baMXwc8T
   oziPa039WRJPUvq/PyDs2JthVEkhV6iyInIilq+evu/YeW3uLzO4HdSUt
   A==;
X-CSE-ConnectionGUID: 8diKvjvRRSq13+31shAvEg==
X-CSE-MsgGUID: 1pbwdMfpRaifcPjEEB9Pzg==
X-IronPort-AV: E=McAfee;i="6700,10204,11287"; a="34013050"
X-IronPort-AV: E=Sophos;i="6.12,237,1728975600"; 
   d="scan'208";a="34013050"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Dec 2024 17:42:37 -0800
X-CSE-ConnectionGUID: jWsCoMwPTOqixeB9SjckUQ==
X-CSE-MsgGUID: ASBA1I5PR1SdWB443I6Rog==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,237,1728975600"; 
   d="scan'208";a="102084239"
Received: from shsensorbuild.sh.intel.com ([10.239.133.18])
  by orviesa004.jf.intel.com with ESMTP; 15 Dec 2024 17:42:33 -0800
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
Subject: [PATCH v3 14/22] HID: intel-thc-hid: intel-quickspi: Add HIDSPI protocol implementation
Date: Mon, 16 Dec 2024 09:41:19 +0800
Message-Id: <20241216014127.3722172-15-even.xu@intel.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20241216014127.3722172-1-even.xu@intel.com>
References: <20241216014127.3722172-1-even.xu@intel.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Intel QuickSPI driver uses THC hardware to accelerate HID over SPI
(HIDSPI) protocol flow.

This patch implements all data flows described in HID over SPI protocol
SPEC by using THC hardware layer APIs.

HID over SPI SPEC:
https://www.microsoft.com/download/details.aspx?id=103325

Co-developed-by: Xinpeng Sun <xinpeng.sun@intel.com>
Signed-off-by: Xinpeng Sun <xinpeng.sun@intel.com>
Signed-off-by: Even Xu <even.xu@intel.com>
Tested-by: Rui Zhang <rui1.zhang@intel.com>
Reviewed-by: Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>
---
 drivers/hid/intel-thc-hid/Makefile            |   1 +
 .../intel-quickspi/quickspi-dev.h             |  38 ++
 .../intel-quickspi/quickspi-hid.c             |  17 +-
 .../intel-quickspi/quickspi-protocol.c        | 406 ++++++++++++++++++
 .../intel-quickspi/quickspi-protocol.h        |  25 ++
 include/linux/hid-over-spi.h                  | 118 +++++
 6 files changed, 604 insertions(+), 1 deletion(-)
 create mode 100644 drivers/hid/intel-thc-hid/intel-quickspi/quickspi-protocol.c
 create mode 100644 drivers/hid/intel-thc-hid/intel-quickspi/quickspi-protocol.h

diff --git a/drivers/hid/intel-thc-hid/Makefile b/drivers/hid/intel-thc-hid/Makefile
index 4dd9e815021d..2dba4db70c33 100644
--- a/drivers/hid/intel-thc-hid/Makefile
+++ b/drivers/hid/intel-thc-hid/Makefile
@@ -12,5 +12,6 @@ intel-thc-objs += intel-thc/intel-thc-dma.o
 obj-$(CONFIG_INTEL_QUICKSPI) += intel-quickspi.o
 intel-quickspi-objs += intel-quickspi/pci-quickspi.o
 intel-quickspi-objs += intel-quickspi/quickspi-hid.o
+intel-quickspi-objs += intel-quickspi/quickspi-protocol.o
 
 ccflags-y += -I $(src)/intel-thc
diff --git a/drivers/hid/intel-thc-hid/intel-quickspi/quickspi-dev.h b/drivers/hid/intel-thc-hid/intel-quickspi/quickspi-dev.h
index deb24dd1a0fa..c5257378c1e9 100644
--- a/drivers/hid/intel-thc-hid/intel-quickspi/quickspi-dev.h
+++ b/drivers/hid/intel-thc-hid/intel-quickspi/quickspi-dev.h
@@ -4,7 +4,12 @@
 #ifndef _QUICKSPI_DEV_H_
 #define _QUICKSPI_DEV_H_
 
+#include <linux/bits.h>
 #include <linux/hid-over-spi.h>
+#include <linux/sizes.h>
+#include <linux/wait.h>
+
+#include "quickspi-protocol.h"
 
 #define PCI_DEVICE_ID_INTEL_THC_MTL_DEVICE_ID_SPI_PORT1		0x7E49
 #define PCI_DEVICE_ID_INTEL_THC_MTL_DEVICE_ID_SPI_PORT2		0x7E4B
@@ -92,6 +97,21 @@ struct acpi_device;
  * @active_ltr_val: THC active LTR value
  * @low_power_ltr_val: THC low power LTR value
  * @report_descriptor: store a copy of device report descriptor
+ * @input_buf: store a copy of latest input report data
+ * @report_buf: store a copy of latest input/output report packet from set/get feature
+ * @report_len: the length of input/output report packet
+ * @reset_ack_wq: workqueue for waiting reset response from device
+ * @reset_ack: indicate reset response received or not
+ * @nondma_int_received_wq: workqueue for waiting THC non-DMA interrupt
+ * @nondma_int_received: indicate THC non-DMA interrupt received or not
+ * @report_desc_got_wq: workqueue for waiting device report descriptor
+ * @report_desc_got: indicate device report descritor received or not
+ * @set_power_on_wq: workqueue for waiting set power on response from device
+ * @set_power_on: indicate set power on response received or not
+ * @get_feature_cmpl_wq: workqueue for waiting get feature response from device
+ * @get_feature_cmpl: indicate get feature received or not
+ * @set_feature_cmpl_wq: workqueue for waiting set feature to device
+ * @set_feature_cmpl: indicate set feature send complete or not
  */
 struct quickspi_device {
 	struct device *dev;
@@ -121,6 +141,24 @@ struct quickspi_device {
 	u32 low_power_ltr_val;
 
 	u8 *report_descriptor;
+	u8 *input_buf;
+	u8 *report_buf;
+	u32 report_len;
+
+	wait_queue_head_t reset_ack_wq;
+	bool reset_ack;
+
+	wait_queue_head_t nondma_int_received_wq;
+	bool nondma_int_received;
+
+	wait_queue_head_t report_desc_got_wq;
+	bool report_desc_got;
+
+	wait_queue_head_t get_report_cmpl_wq;
+	bool get_report_cmpl;
+
+	wait_queue_head_t set_report_cmpl_wq;
+	bool set_report_cmpl;
 };
 
 #endif /* _QUICKSPI_DEV_H_ */
diff --git a/drivers/hid/intel-thc-hid/intel-quickspi/quickspi-hid.c b/drivers/hid/intel-thc-hid/intel-quickspi/quickspi-hid.c
index eae53a749a38..2553d4b42b51 100644
--- a/drivers/hid/intel-thc-hid/intel-quickspi/quickspi-hid.c
+++ b/drivers/hid/intel-thc-hid/intel-quickspi/quickspi-hid.c
@@ -51,7 +51,22 @@ static int quickspi_hid_raw_request(struct hid_device *hid,
 				    __u8 *buf, size_t len,
 				    unsigned char rtype, int reqtype)
 {
-	return 0;
+	struct quickspi_device *qsdev = hid->driver_data;
+	int ret = 0;
+
+	switch (reqtype) {
+	case HID_REQ_GET_REPORT:
+		ret = quickspi_get_report(qsdev, rtype, reportnum, buf);
+		break;
+	case HID_REQ_SET_REPORT:
+		ret = quickspi_set_report(qsdev, rtype, reportnum, buf, len);
+		break;
+	default:
+		dev_err_once(qsdev->dev, "Not supported request type %d\n", reqtype);
+		break;
+	}
+
+	return ret;
 }
 
 static int quickspi_hid_power(struct hid_device *hid, int lvl)
diff --git a/drivers/hid/intel-thc-hid/intel-quickspi/quickspi-protocol.c b/drivers/hid/intel-thc-hid/intel-quickspi/quickspi-protocol.c
new file mode 100644
index 000000000000..b575d3311e61
--- /dev/null
+++ b/drivers/hid/intel-thc-hid/intel-quickspi/quickspi-protocol.c
@@ -0,0 +1,406 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/* Copyright © 2024 Intel Corporation */
+
+#include <linux/acpi.h>
+#include <linux/bitfield.h>
+#include <linux/delay.h>
+#include <linux/hid.h>
+
+#include "intel-thc-dev.h"
+#include "intel-thc-dma.h"
+
+#include "quickspi-dev.h"
+#include "quickspi-hid.h"
+#include "quickspi-protocol.h"
+
+/* THC uses HW to accelerate HID over SPI protocol, THC_M_PRT_DEV_INT_CAUSE
+ * register is used to store message header and body header, below definition
+ * let driver retrieve needed data filed easier from THC_M_PRT_DEV_INT_CAUSE
+ * register.
+ */
+#define HIDSPI_IN_REP_BDY_HDR_REP_TYPE     GENMASK(7, 0)
+
+static int write_cmd_to_txdma(struct quickspi_device *qsdev,
+			      int report_type, int report_id,
+			      u8 *report_buf, const int report_buf_len)
+{
+	struct output_report *write_buf;
+	int write_buf_len;
+	int ret;
+
+	write_buf = (struct output_report *)qsdev->report_buf;
+
+	write_buf->output_hdr.report_type = report_type;
+	write_buf->output_hdr.content_len = cpu_to_le16(report_buf_len);
+	write_buf->output_hdr.content_id = report_id;
+
+	if (report_buf && report_buf_len > 0)
+		memcpy(write_buf->content, report_buf, report_buf_len);
+
+	write_buf_len = HIDSPI_OUTPUT_REPORT_SIZE(report_buf_len);
+
+	ret = thc_dma_write(qsdev->thc_hw, write_buf, write_buf_len);
+	if (ret)
+		dev_err_once(qsdev->dev, "DMA write failed, ret = %d\n", ret);
+
+	return ret;
+}
+
+static int quickspi_get_device_descriptor(struct quickspi_device *qsdev)
+{
+	u8 read_buf[HIDSPI_INPUT_DEVICE_DESCRIPTOR_SIZE];
+	struct output_report output_rep;
+	u32 input_len, read_len = 0;
+	u32 int_cause_val;
+	u8 input_rep_type;
+	int ret;
+
+	output_rep.output_hdr.report_type = DEVICE_DESCRIPTOR;
+	output_rep.output_hdr.content_len = 0;
+	output_rep.output_hdr.content_id = 0;
+
+	qsdev->nondma_int_received = false;
+
+	ret = thc_tic_pio_write(qsdev->thc_hw, qsdev->output_report_addr,
+				HIDSPI_OUTPUT_REPORT_SIZE(0), (u32 *)&output_rep);
+	if (ret) {
+		dev_err_once(qsdev->dev,
+			     "Write DEVICE_DESCRIPTOR command failed, ret = %d\n", ret);
+		return ret;
+	}
+
+	ret = wait_event_interruptible_timeout(qsdev->nondma_int_received_wq,
+					       qsdev->nondma_int_received,
+					       QUICKSPI_ACK_WAIT_TIMEOUT * HZ);
+	if (ret <= 0 || !qsdev->nondma_int_received) {
+		dev_err_once(qsdev->dev, "Wait DEVICE_DESCRIPTOR timeout, ret:%d\n", ret);
+		return -ETIMEDOUT;
+	}
+	qsdev->nondma_int_received = false;
+
+	int_cause_val = thc_int_cause_read(qsdev->thc_hw);
+	input_len = FIELD_GET(HIDSPI_INPUT_HEADER_REPORT_LEN, int_cause_val);
+
+	input_len = input_len * sizeof(u32);
+	if (input_len != HIDSPI_INPUT_DEVICE_DESCRIPTOR_SIZE) {
+		dev_err_once(qsdev->dev, "Receive wrong DEVICE_DESCRIPTOR length, len = %u\n",
+			     input_len);
+		return -EINVAL;
+	}
+
+	ret = thc_tic_pio_read(qsdev->thc_hw, qsdev->input_report_bdy_addr,
+			       input_len, &read_len, (u32 *)read_buf);
+	if (ret || read_len != input_len) {
+		dev_err_once(qsdev->dev, "Read DEVICE_DESCRIPTOR failed, ret = %d\n", ret);
+		dev_err_once(qsdev->dev, "DEVICE_DESCRIPTOR expected len = %u, actual read = %u\n",
+			     input_len, read_len);
+		return ret;
+	}
+
+	input_rep_type = ((struct input_report_body_header *)read_buf)->input_report_type;
+
+	if (input_rep_type == DEVICE_DESCRIPTOR_RESPONSE) {
+		memcpy(&qsdev->dev_desc,
+		       read_buf + HIDSPI_INPUT_BODY_HEADER_SIZE,
+		       HIDSPI_DEVICE_DESCRIPTOR_SIZE);
+
+		return 0;
+	}
+
+	dev_err_once(qsdev->dev, "Unexpected intput report type: %d\n", input_rep_type);
+	return -EINVAL;
+}
+
+int quickspi_get_report_descriptor(struct quickspi_device *qsdev)
+{
+	int ret;
+
+	ret = write_cmd_to_txdma(qsdev, REPORT_DESCRIPTOR, 0, NULL, 0);
+	if (ret) {
+		dev_err_once(qsdev->dev,
+			     "Write REPORT_DESCRIPTOR command failed, ret = %d\n", ret);
+		return ret;
+	}
+
+	ret = wait_event_interruptible_timeout(qsdev->report_desc_got_wq,
+					       qsdev->report_desc_got,
+					       QUICKSPI_ACK_WAIT_TIMEOUT * HZ);
+	if (ret <= 0 || !qsdev->report_desc_got) {
+		dev_err_once(qsdev->dev, "Wait Report Descriptor timeout, ret:%d\n", ret);
+		return -ETIMEDOUT;
+	}
+	qsdev->report_desc_got = false;
+
+	return 0;
+}
+
+int quickspi_set_power(struct quickspi_device *qsdev,
+		       enum hidspi_power_state power_state)
+{
+	u8 cmd_content = power_state;
+	int ret;
+
+	ret = write_cmd_to_txdma(qsdev, COMMAND_CONTENT,
+				 HIDSPI_SET_POWER_CMD_ID,
+				 &cmd_content,
+				 sizeof(cmd_content));
+	if (ret) {
+		dev_err_once(qsdev->dev, "Write SET_POWER command failed, ret = %d\n", ret);
+		return ret;
+	}
+
+	return 0;
+}
+
+void quickspi_handle_input_data(struct quickspi_device *qsdev, u32 buf_len)
+{
+	struct input_report_body_header *body_hdr;
+	struct input_report_body *input_body;
+	u8 *input_report;
+	u32 input_len;
+	int ret = 0;
+
+	input_body = (struct input_report_body *)qsdev->input_buf;
+	body_hdr = &input_body->body_hdr;
+	input_len = le16_to_cpu(body_hdr->content_len);
+
+	if (HIDSPI_INPUT_BODY_SIZE(input_len) > buf_len) {
+		dev_err_once(qsdev->dev, "Wrong input report length: %u",
+			     input_len);
+		return;
+	}
+
+	switch (body_hdr->input_report_type) {
+	case REPORT_DESCRIPTOR_RESPONSE:
+		if (input_len != le16_to_cpu(qsdev->dev_desc.rep_desc_len)) {
+			dev_err_once(qsdev->dev, "Unexpected report descriptor length: %u\n",
+				     input_len);
+			return;
+		}
+
+		memcpy(qsdev->report_descriptor, input_body->content, input_len);
+
+		qsdev->report_desc_got = true;
+		wake_up_interruptible(&qsdev->report_desc_got_wq);
+
+		break;
+
+	case COMMAND_RESPONSE:
+		if (body_hdr->content_id == HIDSPI_SET_POWER_CMD_ID) {
+			dev_dbg(qsdev->dev, "Receive set power on response\n");
+		} else {
+			dev_err_once(qsdev->dev, "Unknown command response type: %u\n",
+				     body_hdr->content_id);
+		}
+
+		break;
+
+	case RESET_RESPONSE:
+		dev_dbg(qsdev->dev, "Receive DIR reset response\n");
+		/* TODO: to add device initiated reset flow */
+		break;
+
+	case GET_FEATURE_RESPONSE:
+	case GET_INPUT_REPORT_RESPONSE:
+		qsdev->report_len = sizeof(body_hdr->content_id) + input_len;
+		input_report = input_body->content - sizeof(body_hdr->content_id);
+
+		memcpy(qsdev->report_buf, input_report, qsdev->report_len);
+
+		qsdev->get_report_cmpl = true;
+		wake_up_interruptible(&qsdev->get_report_cmpl_wq);
+
+		break;
+
+	case SET_FEATURE_RESPONSE:
+	case OUTPUT_REPORT_RESPONSE:
+		qsdev->set_report_cmpl = true;
+		wake_up_interruptible(&qsdev->set_report_cmpl_wq);
+
+		break;
+
+	case DATA:
+		if (input_len > le16_to_cpu(qsdev->dev_desc.max_input_len)) {
+			dev_err_once(qsdev->dev, "Unexpected too large input report length: %u\n",
+				     input_len);
+			return;
+		}
+
+		input_len = sizeof(body_hdr->content_id) + input_len;
+		input_report = input_body->content - sizeof(body_hdr->content_id);
+
+		ret = quickspi_hid_send_report(qsdev, input_report, input_len);
+		if (ret)
+			dev_err_once(qsdev->dev, "Failed to send HID input report: %d\n", ret);
+
+		break;
+
+	default:
+		dev_err_once(qsdev->dev, "Unsupported input report type: %u\n",
+			     body_hdr->input_report_type);
+		break;
+	}
+}
+
+static int acpi_tic_reset(struct quickspi_device *qsdev)
+{
+	acpi_status status = 0;
+	acpi_handle handle;
+
+	if (!qsdev->acpi_dev)
+		return -ENODEV;
+
+	handle = acpi_device_handle(qsdev->acpi_dev);
+	status = acpi_execute_simple_method(handle, "_RST", 0);
+	if (ACPI_FAILURE(status)) {
+		dev_err_once(qsdev->dev,
+			     "Failed to reset device through ACPI method, ret = %d\n", status);
+		return -EIO;
+	}
+
+	return 0;
+}
+
+int reset_tic(struct quickspi_device *qsdev)
+{
+	u32 actual_read_len, read_len = 0;
+	u32 input_report_len, reset_response, int_cause_val;
+	u8  input_rep_type;
+	int ret;
+
+	qsdev->state = QUICKSPI_RESETING;
+
+	qsdev->reset_ack = false;
+
+	/* First interrupt uses level trigger to avoid missing interrupt */
+	thc_int_trigger_type_select(qsdev->thc_hw, false);
+
+	ret = acpi_tic_reset(qsdev);
+	if (ret)
+		return ret;
+
+	ret = thc_interrupt_quiesce(qsdev->thc_hw, false);
+	if (ret)
+		return ret;
+
+	ret = wait_event_interruptible_timeout(qsdev->reset_ack_wq,
+					       qsdev->reset_ack,
+					       QUICKSPI_ACK_WAIT_TIMEOUT * HZ);
+	if (ret <= 0 || !qsdev->reset_ack) {
+		dev_err_once(qsdev->dev, "Wait RESET_RESPONSE timeout, ret:%d\n", ret);
+		return -ETIMEDOUT;
+	}
+
+	int_cause_val = thc_int_cause_read(qsdev->thc_hw);
+	input_report_len = FIELD_GET(HIDSPI_INPUT_HEADER_REPORT_LEN, int_cause_val);
+
+	read_len = input_report_len * sizeof(u32);
+	if (read_len != HIDSPI_INPUT_BODY_SIZE(0)) {
+		dev_err_once(qsdev->dev, "Receive wrong RESET_RESPONSE, len = %u\n",
+			     read_len);
+		return -EINVAL;
+	}
+
+	/* Switch to edge trigger matching with HIDSPI protocol definition */
+	thc_int_trigger_type_select(qsdev->thc_hw, true);
+
+	ret = thc_tic_pio_read(qsdev->thc_hw, qsdev->input_report_bdy_addr,
+			       read_len, &actual_read_len,
+			       (u32 *)&reset_response);
+	if (ret || actual_read_len != read_len) {
+		dev_err_once(qsdev->dev, "Read RESET_RESPONSE body failed, ret = %d\n", ret);
+		dev_err_once(qsdev->dev, "RESET_RESPONSE body expected len = %u, actual = %u\n",
+			     read_len, actual_read_len);
+		return ret;
+	}
+
+	input_rep_type = FIELD_GET(HIDSPI_IN_REP_BDY_HDR_REP_TYPE, reset_response);
+
+	if (input_rep_type == RESET_RESPONSE) {
+		dev_dbg(qsdev->dev, "RESET_RESPONSE received\n");
+	} else {
+		dev_err_once(qsdev->dev,
+			     "Unexpected input report type: %d, expect RESET_RESPONSE\n",
+			     input_rep_type);
+		return -EINVAL;
+	}
+
+	qsdev->state = QUICKSPI_RESETED;
+
+	ret = quickspi_get_device_descriptor(qsdev);
+	if (ret)
+		return ret;
+
+	return 0;
+}
+
+int quickspi_get_report(struct quickspi_device *qsdev,
+			u8 report_type, unsigned int report_id, void *buf)
+{
+	int rep_type;
+	int ret;
+
+	if (report_type == HID_INPUT_REPORT) {
+		rep_type = GET_INPUT_REPORT;
+	} else if (report_type == HID_FEATURE_REPORT) {
+		rep_type = GET_FEATURE;
+	} else {
+		dev_err_once(qsdev->dev, "Unsupported report type for GET REPORT: %d\n",
+			     report_type);
+		return -EINVAL;
+	}
+
+	ret = write_cmd_to_txdma(qsdev, rep_type, report_id, NULL, 0);
+	if (ret) {
+		dev_err_once(qsdev->dev, "Write GET_REPORT command failed, ret = %d\n", ret);
+		return ret;
+	}
+
+	ret = wait_event_interruptible_timeout(qsdev->get_report_cmpl_wq,
+					       qsdev->get_report_cmpl,
+					       QUICKSPI_ACK_WAIT_TIMEOUT * HZ);
+	if (ret <= 0 || !qsdev->get_report_cmpl) {
+		dev_err_once(qsdev->dev, "Wait Get Report Response timeout, ret:%d\n", ret);
+		return -ETIMEDOUT;
+	}
+	qsdev->get_report_cmpl = false;
+
+	memcpy(buf, qsdev->report_buf, qsdev->report_len);
+
+	return qsdev->report_len;
+}
+
+int quickspi_set_report(struct quickspi_device *qsdev,
+			u8 report_type, unsigned int report_id,
+			void *buf, u32 buf_len)
+{
+	int rep_type;
+	int ret;
+
+	if (report_type == HID_OUTPUT_REPORT) {
+		rep_type = OUTPUT_REPORT;
+	} else if (report_type == HID_FEATURE_REPORT) {
+		rep_type = SET_FEATURE;
+	} else {
+		dev_err_once(qsdev->dev, "Unsupported report type for SET REPORT: %d\n",
+			     report_type);
+		return -EINVAL;
+	}
+
+	ret = write_cmd_to_txdma(qsdev, rep_type, report_id, buf + 1, buf_len - 1);
+	if (ret) {
+		dev_err_once(qsdev->dev, "Write SET_REPORT command failed, ret = %d\n", ret);
+		return ret;
+	}
+
+	ret = wait_event_interruptible_timeout(qsdev->set_report_cmpl_wq,
+					       qsdev->set_report_cmpl,
+					       QUICKSPI_ACK_WAIT_TIMEOUT * HZ);
+	if (ret <= 0 || !qsdev->set_report_cmpl) {
+		dev_err_once(qsdev->dev, "Wait Set Report Response timeout, ret:%d\n", ret);
+		return -ETIMEDOUT;
+	}
+	qsdev->set_report_cmpl = false;
+
+	return buf_len;
+}
diff --git a/drivers/hid/intel-thc-hid/intel-quickspi/quickspi-protocol.h b/drivers/hid/intel-thc-hid/intel-quickspi/quickspi-protocol.h
new file mode 100644
index 000000000000..775e29c1ed13
--- /dev/null
+++ b/drivers/hid/intel-thc-hid/intel-quickspi/quickspi-protocol.h
@@ -0,0 +1,25 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/* Copyright (c) 2024 Intel Corporation */
+
+#ifndef _QUICKSPI_PROTOCOL_H_
+#define _QUICKSPI_PROTOCOL_H_
+
+#include <linux/hid-over-spi.h>
+
+#define QUICKSPI_ACK_WAIT_TIMEOUT    5
+
+struct quickspi_device;
+
+void quickspi_handle_input_data(struct quickspi_device *qsdev, u32 buf_len);
+int quickspi_get_report(struct quickspi_device *qsdev, u8 report_type,
+			unsigned int report_id, void *buf);
+int quickspi_set_report(struct quickspi_device *qsdev, u8 report_type,
+			unsigned int report_id, void *buf, u32 buf_len);
+int quickspi_get_report_descriptor(struct quickspi_device *qsdev);
+
+int quickspi_set_power(struct quickspi_device *qsdev,
+		       enum hidspi_power_state power_state);
+
+int reset_tic(struct quickspi_device *qsdev);
+
+#endif /* _QUICKSPI_PROTOCOL_H_ */
diff --git a/include/linux/hid-over-spi.h b/include/linux/hid-over-spi.h
index ddbe41c5d8fd..da5a14b5e89b 100644
--- a/include/linux/hid-over-spi.h
+++ b/include/linux/hid-over-spi.h
@@ -4,6 +4,120 @@
 #ifndef _HID_OVER_SPI_H_
 #define _HID_OVER_SPI_H_
 
+#include <linux/bits.h>
+#include <linux/types.h>
+
+/* Input report type definition in HIDSPI protocol */
+enum input_report_type {
+	INVALID_INPUT_REPORT_TYPE_0	= 0,
+	DATA				= 1,
+	INVALID_TYPE_2			= 2,
+	RESET_RESPONSE			= 3,
+	COMMAND_RESPONSE		= 4,
+	GET_FEATURE_RESPONSE		= 5,
+	INVALID_TYPE_6			= 6,
+	DEVICE_DESCRIPTOR_RESPONSE	= 7,
+	REPORT_DESCRIPTOR_RESPONSE	= 8,
+	SET_FEATURE_RESPONSE		= 9,
+	OUTPUT_REPORT_RESPONSE		= 10,
+	GET_INPUT_REPORT_RESPONSE	= 11,
+	INVALID_INPUT_REPORT_TYPE	= 0xF,
+};
+
+/* Output report type definition in HIDSPI protocol */
+enum output_report_type {
+	INVALID_OUTPUT_REPORT_TYPE_0	= 0,
+	DEVICE_DESCRIPTOR		= 1,
+	REPORT_DESCRIPTOR		= 2,
+	SET_FEATURE			= 3,
+	GET_FEATURE			= 4,
+	OUTPUT_REPORT			= 5,
+	GET_INPUT_REPORT		= 6,
+	COMMAND_CONTENT			= 7,
+};
+
+/* Set power command ID for output report */
+#define HIDSPI_SET_POWER_CMD_ID  1
+
+/* Power state definition in HIDSPI protocol */
+enum hidspi_power_state {
+	HIDSPI_ON	= 1,
+	HIDSPI_SLEEP	= 2,
+	HIDSPI_OFF	= 3,
+};
+
+/**
+ * Input report header definition in HIDSPI protocol
+ * Report header size is 32bits, it includes:
+ * protocol_ver:     [0:3] Current supported HIDSPI protocol version, must be 0x3
+ * reserved0:        [4:7] Reserved bits
+ * input_report_len: [8:21] Input report length in number bytes divided by 4
+ * last_frag_flag:   [22]Indicate if this packet is last fragment.
+ *                       1 - indicates last fragment
+ *                       0 - indicates additional fragments
+ * reserved1:        [23] Reserved bits
+ * @sync_const:      [24:31] Used to validate input report header, must be 0x5A
+ */
+#define HIDSPI_INPUT_HEADER_SIZE		sizeof(u32)
+#define HIDSPI_INPUT_HEADER_VER			GENMASK(3, 0)
+#define HIDSPI_INPUT_HEADER_REPORT_LEN		GENMASK(21, 8)
+#define HIDSPI_INPUT_HEADER_LAST_FLAG		BIT(22)
+#define HIDSPI_INPUT_HEADER_SYNC		GENMASK(31, 24)
+
+/**
+ * struct input_report_body_header - Input report body header definition in HIDSPI protocol
+ * @input_report_type: indicate input report type, reference to enum input_report_type
+ * @content_len: this input report body packet length
+ * @content_id: indicate this input report's report id
+ */
+struct input_report_body_header {
+	u8 input_report_type;
+	__le16 content_len;
+	u8 content_id;
+} __packed;
+
+#define HIDSPI_INPUT_BODY_HEADER_SIZE	sizeof(struct input_report_body_header)
+
+/**
+ * struct input_report_body - Input report body definition in HIDSPI protocol
+ * @body_hdr: input report body header
+ * @content: input report body content
+ */
+struct input_report_body {
+	struct input_report_body_header body_hdr;
+	u8 content[];
+} __packed;
+
+#define HIDSPI_INPUT_BODY_SIZE(content_len)	((content_len) + HIDSPI_INPUT_BODY_HEADER_SIZE)
+
+/**
+ * struct output_report_header - Output report header definition in HIDSPI protocol
+ * @report_type: output report type, reference to enum output_report_type
+ * @content_len: length of content
+ * @content_id: 0x00 - descriptors
+ *              report id - Set/Feature feature or Input/Output Reports
+ *              command opcode - for commands
+ */
+struct output_report_header {
+	u8 report_type;
+	__le16 content_len;
+	u8 content_id;
+} __packed;
+
+#define HIDSPI_OUTPUT_REPORT_HEADER_SIZE	sizeof(struct output_report_header)
+
+/**
+ * struct output_report - Output report definition in HIDSPI protocol
+ * @output_hdr: output report header
+ * @content: output report content
+ */
+struct output_report {
+	struct output_report_header output_hdr;
+	u8 content[];
+} __packed;
+
+#define HIDSPI_OUTPUT_REPORT_SIZE(content_len)	((content_len) + HIDSPI_OUTPUT_REPORT_HEADER_SIZE)
+
 /**
  * struct hidspi_dev_descriptor - HIDSPI device descriptor definition
  * @dev_desc_len: The length of the complete device descriptor, fixed to 0x18 (24).
@@ -34,4 +148,8 @@ struct hidspi_dev_descriptor {
 	__le32 reserved;
 };
 
+#define HIDSPI_DEVICE_DESCRIPTOR_SIZE		sizeof(struct hidspi_dev_descriptor)
+#define HIDSPI_INPUT_DEVICE_DESCRIPTOR_SIZE	\
+	(HIDSPI_INPUT_BODY_HEADER_SIZE + HIDSPI_DEVICE_DESCRIPTOR_SIZE)
+
 #endif /* _HID_OVER_SPI_H_ */
-- 
2.40.1


