Return-Path: <linux-input+bounces-3478-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id AD5758BC575
	for <lists+linux-input@lfdr.de>; Mon,  6 May 2024 03:30:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id D06ED1C210DA
	for <lists+linux-input@lfdr.de>; Mon,  6 May 2024 01:30:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CA7583C485;
	Mon,  6 May 2024 01:30:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="cYZvsvs2"
X-Original-To: linux-input@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 75623381AA
	for <linux-input@vger.kernel.org>; Mon,  6 May 2024 01:30:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714959052; cv=none; b=mBMrfflE6DKQL1KOZA4fA2CUGrJcUGTwCLLyg7RMq2NLRKUa5N7zCL3HbjVfsR5BgrE6mQwoBTiS5U6+td9g8cRyemzAYAg2ApIEor/1BwI3bkTCrNx2O2WwMm5zZ4gCdbMdOq1zect9OQszl+3VHeZj8vSHAOGMd2JWWW9qXQs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714959052; c=relaxed/simple;
	bh=gm+qttAIcoj00DzmsYcdM5NLisYQaT12lf3t/9TN4Qs=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=B2nssqya+kDOzIOJGJB2PRYy1sI969qESlv72EAqfKc6Sw6CwX5jmGVqalhTG8py0ZeZE1cxelNCvzPRl6UDB7cxQZqENgoBRMBKHF2HC78DJ+pJMUiD5Ggd+lH9tLwLOJFOiqOQsaMy9/gD3lNh/7GtwSQCWmFJPbwEOnnIQjw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=cYZvsvs2; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1714959051; x=1746495051;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=gm+qttAIcoj00DzmsYcdM5NLisYQaT12lf3t/9TN4Qs=;
  b=cYZvsvs2MIE/BsTwiethNyBwnk9u/CLOQlv8E2XRDQMlGUS5q4S5zGSm
   4AghFmLRs/XhRBHFzwgQ4dUvFCfJvWLvOByn1D5AJn7uBkwTcxgFJAMUA
   Jr4SmuFOGuG8NrGJo8KFftfJ0rn59JjEwFxjNWmIVrmXQk6YW+FIvSPv2
   pZpbEeXF7zcoB+lPAEj9hG0UYiiXbrG8u2FEJqbRUD5P0QqQE+fkU7FPB
   m9FIluaceKoVkOBIC/ssZf97fq2kMDGBxMfWR5bDviUUR2JSomJeyOuYY
   OUJMLDzApP1TLvN4ka6ZGHJT1XTTPFwWbTLhBLSk0rXuaSmL4k4obuyN5
   Q==;
X-CSE-ConnectionGUID: vgiRmBAlQIeyDJOdEK9cGQ==
X-CSE-MsgGUID: WQt5d//aRh+7bQUz1m+RUA==
X-IronPort-AV: E=McAfee;i="6600,9927,11064"; a="14503871"
X-IronPort-AV: E=Sophos;i="6.07,257,1708416000"; 
   d="scan'208";a="14503871"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 May 2024 18:30:50 -0700
X-CSE-ConnectionGUID: 6HqODHdcSTysL/XHKFvFkg==
X-CSE-MsgGUID: mSyx6M/TTNeKNZ4tFtbigg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,257,1708416000"; 
   d="scan'208";a="28092923"
Received: from unknown (HELO ipg-l-lixuzha.sh.intel.com) ([10.239.153.157])
  by fmviesa010.fm.intel.com with ESMTP; 05 May 2024 18:30:48 -0700
From: Zhang Lixu <lixu.zhang@intel.com>
To: linux-input@vger.kernel.org,
	srinivas.pandruvada@linux.intel.com,
	jikos@kernel.org,
	benjamin.tissoires@redhat.com
Cc: lixu.zhang@intel.com
Subject: [PATCH 4/5] HID: intel-ish-hid: Implement loading firmware from host feature
Date: Mon,  6 May 2024 09:30:39 +0800
Message-Id: <20240506013040.10700-5-lixu.zhang@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240506013040.10700-1-lixu.zhang@intel.com>
References: <20240506013040.10700-1-lixu.zhang@intel.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Starting from the Lunar Lake generation, the ISH firmware has been
divided into two components for better space optimization and increased
flexibility. These components include a bootloader that is integrated
into the BIOS, and a main firmware that is stored within the operating
system's file system.

Introduce support for loading ISH main firmware from host. This feature is
applicable for Lunar Lake and later generation.

Current intel-ishtp-loader, is designed for Chrome OS based systems which
uses core boot and has different firmware loading method. For non chrome
systems the ISH firmware loading uses different method.

Key differences include:
1. The new method utilizes ISHTP capability/fixed client to enumerate the
firmware loader function. It does not require a connection or flow control,
unlike the method used in Chrome OS, which is enumerated as an ISHTP
dynamic client driver, necessitating connect/disconnect operations and flow
control.

2. The new method employs a table to describe firmware fragments, which are
sent to ISH in a single operation. Conversely, the Chrome OS method sends
firmware fragments in multiple operations within a loop, sending only one
fragment at a time.

Additionally, address potential error scenarios to ensure graceful failure
handling.
- Firmware Not Found: Triggers if request_firmware() fails, leaving ISH in
  a waiting state.
  Recovery: Re-insmod the ISH drivers to retry.

- DMA Buffer Allocation Failure: Occurs during prepare_dma_bufs(), leading
  to ISH waiting state. Allocated resources are released.
  Recovery: Re-insmod the ISH drivers to retry.

- Incorrect Firmware Image: Causes ISH to refuse loading after three failed
  attempts.
  Recovery: A platform reset is required.

Please refer to the [Documentation](Documentation/hid/intel-ish-hid.rst)
for the details on flows.

Signed-off-by: Zhang Lixu <lixu.zhang@intel.com>
Acked-by: Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>
---
 drivers/hid/intel-ish-hid/Makefile          |   1 +
 drivers/hid/intel-ish-hid/ishtp/hbm.c       |  21 ++
 drivers/hid/intel-ish-hid/ishtp/init.c      |   8 +
 drivers/hid/intel-ish-hid/ishtp/ishtp-dev.h |  11 +
 drivers/hid/intel-ish-hid/ishtp/loader.c    | 275 ++++++++++++++++++++
 drivers/hid/intel-ish-hid/ishtp/loader.h    | 226 ++++++++++++++++
 6 files changed, 542 insertions(+)
 create mode 100644 drivers/hid/intel-ish-hid/ishtp/loader.c
 create mode 100644 drivers/hid/intel-ish-hid/ishtp/loader.h

diff --git a/drivers/hid/intel-ish-hid/Makefile b/drivers/hid/intel-ish-hid/Makefile
index f0a82b1c7cb9..a927b224cd44 100644
--- a/drivers/hid/intel-ish-hid/Makefile
+++ b/drivers/hid/intel-ish-hid/Makefile
@@ -11,6 +11,7 @@ intel-ishtp-objs += ishtp/client.o
 intel-ishtp-objs += ishtp/bus.o
 intel-ishtp-objs += ishtp/dma-if.o
 intel-ishtp-objs += ishtp/client-buffers.o
+intel-ishtp-objs += ishtp/loader.o
 
 obj-$(CONFIG_INTEL_ISH_HID) += intel-ish-ipc.o
 intel-ish-ipc-objs := ipc/ipc.o
diff --git a/drivers/hid/intel-ish-hid/ishtp/hbm.c b/drivers/hid/intel-ish-hid/ishtp/hbm.c
index 9c031a06e4c4..8ee5467127d8 100644
--- a/drivers/hid/intel-ish-hid/ishtp/hbm.c
+++ b/drivers/hid/intel-ish-hid/ishtp/hbm.c
@@ -13,6 +13,7 @@
 #include "ishtp-dev.h"
 #include "hbm.h"
 #include "client.h"
+#include "loader.h"
 
 /**
  * ishtp_hbm_fw_cl_allocate() - Allocate FW clients
@@ -570,6 +571,10 @@ void ishtp_hbm_dispatch(struct ishtp_device *dev,
 			return;
 		}
 
+		/* Start firmware loading process if it has loader capability */
+		if (version_res->host_version_supported & ISHTP_SUPPORT_CAP_LOADER)
+			schedule_work(&dev->work_fw_loader);
+
 		dev->version.major_version = HBM_MAJOR_VERSION;
 		dev->version.minor_version = HBM_MINOR_VERSION;
 		if (dev->dev_state == ISHTP_DEV_INIT_CLIENTS &&
@@ -864,6 +869,20 @@ void	recv_hbm(struct ishtp_device *dev, struct ishtp_msg_hdr *ishtp_hdr)
 	return;
 }
 
+/**
+ * ishtp_loader_recv_msg() - Receive a message from the ISHTP device
+ * @dev: The ISHTP device
+ * @buf: The buffer containing the message
+ */
+static void ishtp_loader_recv_msg(struct ishtp_device *dev, void *buf)
+{
+	if (dev->fw_loader_rx_buf)
+		memcpy(dev->fw_loader_rx_buf, buf, dev->fw_loader_rx_size);
+
+	dev->fw_loader_received = true;
+	wake_up_interruptible(&dev->wait_loader_recvd_msg);
+}
+
 /**
  * recv_fixed_cl_msg() - Receive fixed client message
  * @dev: ISHTP device instance
@@ -890,6 +909,8 @@ void recv_fixed_cl_msg(struct ishtp_device *dev,
 		else
 			dev_err(dev->devc, "unknown fixed client msg [%02X]\n",
 				msg_hdr->cmd);
+	} else if (ishtp_hdr->fw_addr == ISHTP_LOADER_CLIENT_ADDR) {
+		ishtp_loader_recv_msg(dev, rd_msg_buf);
 	}
 }
 
diff --git a/drivers/hid/intel-ish-hid/ishtp/init.c b/drivers/hid/intel-ish-hid/ishtp/init.c
index 02a00cc2dd11..07fdd52e4c5e 100644
--- a/drivers/hid/intel-ish-hid/ishtp/init.c
+++ b/drivers/hid/intel-ish-hid/ishtp/init.c
@@ -5,12 +5,14 @@
  * Copyright (c) 2003-2016, Intel Corporation.
  */
 
+#include <linux/devm-helpers.h>
 #include <linux/export.h>
 #include <linux/slab.h>
 #include <linux/sched.h>
 #include "ishtp-dev.h"
 #include "hbm.h"
 #include "client.h"
+#include "loader.h"
 
 /**
  * ishtp_dev_state_str() -Convert to string format
@@ -51,6 +53,8 @@ const char *ishtp_dev_state_str(int state)
  */
 void ishtp_device_init(struct ishtp_device *dev)
 {
+	int ret;
+
 	dev->dev_state = ISHTP_DEV_INITIALIZING;
 	INIT_LIST_HEAD(&dev->cl_list);
 	INIT_LIST_HEAD(&dev->device_list);
@@ -59,6 +63,7 @@ void ishtp_device_init(struct ishtp_device *dev)
 	spin_lock_init(&dev->rd_msg_spinlock);
 
 	init_waitqueue_head(&dev->wait_hbm_recvd_msg);
+	init_waitqueue_head(&dev->wait_loader_recvd_msg);
 	spin_lock_init(&dev->read_list_spinlock);
 	spin_lock_init(&dev->device_lock);
 	spin_lock_init(&dev->device_list_lock);
@@ -76,6 +81,9 @@ void ishtp_device_init(struct ishtp_device *dev)
 
 	INIT_LIST_HEAD(&dev->read_list.list);
 
+	ret = devm_work_autocancel(dev->devc, &dev->work_fw_loader, ishtp_loader_work);
+	if (ret)
+		dev_err_probe(dev->devc, ret, "Failed to initialise FW loader work\n");
 }
 EXPORT_SYMBOL(ishtp_device_init);
 
diff --git a/drivers/hid/intel-ish-hid/ishtp/ishtp-dev.h b/drivers/hid/intel-ish-hid/ishtp/ishtp-dev.h
index ed294bf0bc8f..181838c3d7ac 100644
--- a/drivers/hid/intel-ish-hid/ishtp/ishtp-dev.h
+++ b/drivers/hid/intel-ish-hid/ishtp/ishtp-dev.h
@@ -164,6 +164,17 @@ struct ishtp_device {
 	struct hbm_version version;
 	int transfer_path; /* Choice of transfer path: IPC or DMA */
 
+	/* work structure for scheduling firmware loading tasks */
+	struct work_struct work_fw_loader;
+	/* waitq for waiting for command response from the firmware loader */
+	wait_queue_head_t wait_loader_recvd_msg;
+	/* indicating whether a message from the firmware loader has been received */
+	bool fw_loader_received;
+	/* pointer to a buffer for receiving messages from the firmware loader */
+	void *fw_loader_rx_buf;
+	/* size of the buffer pointed to by fw_loader_rx_buf */
+	int fw_loader_rx_size;
+
 	/* ishtp device states */
 	enum ishtp_dev_state dev_state;
 	enum ishtp_hbm_state hbm_state;
diff --git a/drivers/hid/intel-ish-hid/ishtp/loader.c b/drivers/hid/intel-ish-hid/ishtp/loader.c
new file mode 100644
index 000000000000..993f8b390e57
--- /dev/null
+++ b/drivers/hid/intel-ish-hid/ishtp/loader.c
@@ -0,0 +1,275 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * ISHTP firmware loader function
+ *
+ * Copyright (c) 2024, Intel Corporation.
+ *
+ * This module implements the functionality to load the main ISH firmware from the host, starting
+ * with the Lunar Lake generation. It leverages a new method that enhances space optimization and
+ * flexibility by dividing the ISH firmware into a bootloader and main firmware.
+ *
+ * Please refer to the [Documentation](Documentation/hid/intel-ish-hid.rst) for the details on
+ * flows.
+ *
+ * Additionally, address potential error scenarios to ensure graceful failure handling.
+ * - Firmware Image Not Found:
+ *   Occurs when `request_firmware()` cannot locate the firmware image. The ISH firmware will
+ *   remain in a state awaiting firmware loading from the host, with no further action from
+ *   the ISHTP driver.
+ *   Recovery: Re-insmod the ISH drivers allows for a retry of the firmware loading from the host.
+ *
+ * - DMA Buffer Allocation Failure:
+ *   This happens if allocating a DMA buffer during `prepare_dma_bufs()` fails. The ISH firmware
+ *   will stay in a waiting state, and the ISHTP driver will release any allocated DMA buffers and
+ *   firmware without further actions.
+ *   Recovery: Re-insmod the ISH drivers allows for a retry of the firmware loading from the host.
+ *
+ * - Incorrect Firmware Image:
+ *   Using an incorrect firmware image will initiate the firmware loading process but will
+ *   eventually be refused by the ISH firmware after three unsuccessful attempts, indicated by
+ *   returning an error code. The ISHTP driver will stop attempting after three tries.
+ *   Recovery: A platform reset is required to retry firmware loading from the host.
+ */
+
+#define dev_fmt(fmt) "ISH loader: " fmt
+
+#include <linux/cacheflush.h>
+#include <linux/container_of.h>
+#include <linux/dev_printk.h>
+#include <linux/dma-mapping.h>
+#include <linux/errno.h>
+#include <linux/firmware.h>
+#include <linux/gfp_types.h>
+#include <linux/math.h>
+#include <linux/module.h>
+#include <linux/pfn.h>
+#include <linux/string.h>
+#include <linux/types.h>
+#include <linux/wait.h>
+
+#include "hbm.h"
+#include "loader.h"
+
+/**
+ * loader_write_message() - Write a message to the ISHTP device
+ * @dev: The ISHTP device
+ * @buf: The buffer containing the message
+ * @len: The length of the message
+ *
+ * Return: 0 on success, negative error code on failure
+ */
+static int loader_write_message(struct ishtp_device *dev, void *buf, int len)
+{
+	struct ishtp_msg_hdr ishtp_hdr = {
+		.fw_addr = ISHTP_LOADER_CLIENT_ADDR,
+		.length = len,
+		.msg_complete = 1,
+	};
+
+	dev->fw_loader_received = false;
+
+	return ishtp_write_message(dev, &ishtp_hdr, buf);
+}
+
+/**
+ * loader_xfer_cmd() - Transfer a command to the ISHTP device
+ * @dev: The ISHTP device
+ * @req: The request buffer
+ * @req_len: The length of the request
+ * @resp: The response buffer
+ * @resp_len: The length of the response
+ *
+ * Return: 0 on success, negative error code on failure
+ */
+static int loader_xfer_cmd(struct ishtp_device *dev, void *req, int req_len,
+			   void *resp, int resp_len)
+{
+	struct loader_msg_header *req_hdr = req;
+	struct loader_msg_header *resp_hdr = resp;
+	struct device *devc = dev->devc;
+	int rv;
+
+	dev->fw_loader_rx_buf = resp;
+	dev->fw_loader_rx_size = resp_len;
+
+	rv = loader_write_message(dev, req, req_len);
+	if (rv < 0) {
+		dev_err(devc, "write cmd %u failed:%d\n", req_hdr->command, rv);
+		return rv;
+	}
+
+	/* Wait the ACK */
+	wait_event_interruptible_timeout(dev->wait_loader_recvd_msg, dev->fw_loader_received,
+					 ISHTP_LOADER_TIMEOUT);
+	dev->fw_loader_rx_size = 0;
+	dev->fw_loader_rx_buf = NULL;
+	if (!dev->fw_loader_received) {
+		dev_err(devc, "wait response of cmd %u timeout\n", req_hdr->command);
+		return -ETIMEDOUT;
+	}
+
+	if (!resp_hdr->is_response) {
+		dev_err(devc, "not a response for %u\n", req_hdr->command);
+		return -EBADMSG;
+	}
+
+	if (req_hdr->command != resp_hdr->command) {
+		dev_err(devc, "unexpected cmd response %u:%u\n", req_hdr->command,
+			resp_hdr->command);
+		return -EBADMSG;
+	}
+
+	if (resp_hdr->status) {
+		dev_err(devc, "cmd %u failed %u\n", req_hdr->command, resp_hdr->status);
+		return -EIO;
+	}
+
+	return 0;
+}
+
+/**
+ * release_dma_bufs() - Release the DMA buffer for transferring firmware fragments
+ * @dev: The ISHTP device
+ * @fragment: The ISHTP firmware fragment descriptor
+ * @dma_bufs: The array of DMA fragment buffers
+ * @fragment_size: The size of a single DMA fragment
+ */
+static void release_dma_bufs(struct ishtp_device *dev,
+			     struct loader_xfer_dma_fragment *fragment,
+			     void **dma_bufs, u32 fragment_size)
+{
+	int i;
+
+	for (i = 0; i < FRAGMENT_MAX_NUM; i++) {
+		if (dma_bufs[i]) {
+			dma_free_coherent(dev->devc, fragment_size, dma_bufs[i],
+					  fragment->fragment_tbl[i].ddr_adrs);
+			dma_bufs[i] = NULL;
+		}
+	}
+}
+
+/**
+ * prepare_dma_bufs() - Prepare the DMA buffer for transferring firmware fragments
+ * @dev: The ISHTP device
+ * @ish_fw: The ISH firmware
+ * @fragment: The ISHTP firmware fragment descriptor
+ * @dma_bufs: The array of DMA fragment buffers
+ * @fragment_size: The size of a single DMA fragment
+ *
+ * Return: 0 on success, negative error code on failure
+ */
+static int prepare_dma_bufs(struct ishtp_device *dev,
+			    const struct firmware *ish_fw,
+			    struct loader_xfer_dma_fragment *fragment,
+			    void **dma_bufs, u32 fragment_size)
+{
+	u32 offset = 0;
+	int i;
+
+	for (i = 0; i < fragment->fragment_cnt && offset < ish_fw->size; i++) {
+		dma_bufs[i] = dma_alloc_coherent(dev->devc, fragment_size,
+						 &fragment->fragment_tbl[i].ddr_adrs, GFP_KERNEL);
+		if (!dma_bufs[i])
+			return -ENOMEM;
+
+		fragment->fragment_tbl[i].length = clamp(ish_fw->size - offset, 0, fragment_size);
+		fragment->fragment_tbl[i].fw_off = offset;
+		memcpy(dma_bufs[i], ish_fw->data + offset, fragment->fragment_tbl[i].length);
+		clflush_cache_range(dma_bufs[i], fragment_size);
+
+		offset += fragment->fragment_tbl[i].length;
+	}
+
+	return 0;
+}
+
+/**
+ * ishtp_loader_work() - Load the ISHTP firmware
+ * @work: The work structure
+ *
+ * The ISH Loader attempts to load firmware by sending a series of commands
+ * to the ISH device. If a command fails to be acknowledged by the ISH device,
+ * the loader will retry sending the command, up to a maximum of
+ * ISHTP_LOADER_RETRY_TIMES.
+ *
+ * After the maximum number of retries has been reached without success, the
+ * ISH bootloader will return an error status code and will no longer respond
+ * to the driver's commands. This behavior indicates that the ISH Loader has
+ * encountered a critical error during the firmware loading process.
+ *
+ * In such a case, where the ISH bootloader is unresponsive after all retries
+ * have been exhausted, a platform reset is required to restore communication
+ * with the ISH device and to recover from this error state.
+ */
+void ishtp_loader_work(struct work_struct *work)
+{
+	DEFINE_RAW_FLEX(struct loader_xfer_dma_fragment, fragment, fragment_tbl, FRAGMENT_MAX_NUM);
+	struct ishtp_device *dev = container_of(work, struct ishtp_device, work_fw_loader);
+	struct loader_xfer_query query = {
+		.header.command = LOADER_CMD_XFER_QUERY,
+	};
+	struct loader_start start = {
+		.header.command = LOADER_CMD_START,
+	};
+	union loader_recv_message recv_msg;
+	char *filename = dev->driver_data->fw_filename;
+	const struct firmware *ish_fw;
+	void *dma_bufs[FRAGMENT_MAX_NUM] = {};
+	u32 fragment_size;
+	int retry = ISHTP_LOADER_RETRY_TIMES;
+	int rv;
+
+	rv = request_firmware(&ish_fw, filename, dev->devc);
+	if (rv < 0) {
+		dev_err(dev->devc, "request firmware %s failed:%d\n", filename, rv);
+		return;
+	}
+
+	fragment->fragment.header.command = LOADER_CMD_XFER_FRAGMENT;
+	fragment->fragment.xfer_mode = LOADER_XFER_MODE_DMA;
+	fragment->fragment.is_last = 1;
+	fragment->fragment.size = ish_fw->size;
+	/* Calculate the size of a single DMA fragment */
+	fragment_size = PFN_ALIGN(DIV_ROUND_UP(ish_fw->size, FRAGMENT_MAX_NUM));
+	/* Calculate the count of DMA fragments */
+	fragment->fragment_cnt = DIV_ROUND_UP(ish_fw->size, fragment_size);
+
+	rv = prepare_dma_bufs(dev, ish_fw, fragment, dma_bufs, fragment_size);
+	if (rv) {
+		dev_err(dev->devc, "prepare DMA buffer failed.\n");
+		goto out;
+	}
+
+	do {
+		query.image_size = ish_fw->size;
+		rv = loader_xfer_cmd(dev, &query, sizeof(query), recv_msg.raw_data,
+				     sizeof(struct loader_xfer_query_ack));
+		if (rv)
+			continue; /* try again if failed */
+
+		dev_dbg(dev->devc, "ISH Version %u.%u.%u.%u\n",
+			recv_msg.query_ack.version_major,
+			recv_msg.query_ack.version_minor,
+			recv_msg.query_ack.version_hotfix,
+			recv_msg.query_ack.version_build);
+
+		rv = loader_xfer_cmd(dev, fragment,
+				     struct_size(fragment, fragment_tbl, fragment->fragment_cnt),
+				     recv_msg.raw_data, sizeof(struct loader_xfer_fragment_ack));
+		if (rv)
+			continue; /* try again if failed */
+
+		rv = loader_xfer_cmd(dev, &start, sizeof(start), recv_msg.raw_data,
+				     sizeof(struct loader_start_ack));
+		if (rv)
+			continue; /* try again if failed */
+
+		dev_info(dev->devc, "firmware loaded. size:%zu\n", ish_fw->size);
+		break;
+	} while (--retry);
+
+out:
+	release_dma_bufs(dev, fragment, dma_bufs, fragment_size);
+	release_firmware(ish_fw);
+}
diff --git a/drivers/hid/intel-ish-hid/ishtp/loader.h b/drivers/hid/intel-ish-hid/ishtp/loader.h
new file mode 100644
index 000000000000..7aa45ebc3f7b
--- /dev/null
+++ b/drivers/hid/intel-ish-hid/ishtp/loader.h
@@ -0,0 +1,226 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+/*
+ * ISHTP firmware loader header
+ *
+ * Copyright (c) 2024, Intel Corporation.
+ */
+
+#ifndef _ISHTP_LOADER_H_
+#define _ISHTP_LOADER_H_
+
+#include <linux/bits.h>
+#include <linux/jiffies.h>
+#include <linux/types.h>
+
+#include "ishtp-dev.h"
+
+struct work_struct;
+
+#define LOADER_MSG_SIZE \
+	(IPC_PAYLOAD_SIZE - sizeof(struct ishtp_msg_hdr))
+
+/*
+ * ISHTP firmware loader protocol definition
+ */
+#define LOADER_CMD_XFER_QUERY		0	/* SW -> FW */
+#define LOADER_CMD_XFER_FRAGMENT	1	/* SW -> FW */
+#define LOADER_CMD_START		2	/* SW -> FW */
+
+/* Only support DMA mode */
+#define LOADER_XFER_MODE_DMA BIT(0)
+
+/**
+ * struct loader_msg_header - ISHTP firmware loader message header
+ * @command: Command type
+ * @is_response: Indicates if the message is a response
+ * @has_next: Indicates if there is a next message
+ * @reserved: Reserved for future use
+ * @status: Status of the message
+ */
+struct loader_msg_header {
+	__le32 command:7;
+	__le32 is_response:1;
+	__le32 has_next:1;
+	__le32 reserved:15;
+	__le32 status:8;
+};
+
+/**
+ * struct loader_xfer_query - ISHTP firmware loader transfer query packet
+ * @header: Header of the message
+ * @image_size: Size of the image
+ */
+struct loader_xfer_query {
+	struct loader_msg_header header;
+	__le32 image_size;
+};
+
+/**
+ * struct loader_version - ISHTP firmware loader version
+ * @value: Value of the version
+ * @major: Major version
+ * @minor: Minor version
+ * @hotfix: Hotfix version
+ * @build: Build version
+ */
+struct loader_version {
+	union {
+		__le32 value;
+		struct {
+			__u8 major;
+			__u8 minor;
+			__u8 hotfix;
+			__u8 build;
+		};
+	};
+};
+
+/**
+ * struct loader_capability - ISHTP firmware loader capability
+ * @max_fw_image_size: Maximum firmware image size
+ * @support_mode: Support mode
+ * @reserved: Reserved for future use
+ * @platform: Platform
+ * @max_dma_buf_size: Maximum DMA buffer size, multiples of 4096
+ */
+struct loader_capability {
+	__le32 max_fw_image_size;
+	__le16 support_mode;
+	__u8 reserved;
+	__u8 platform;
+	__le32 max_dma_buf_size;
+};
+
+/**
+ * struct loader_xfer_query_ack - ISHTP firmware loader transfer query acknowledgment
+ * @header: Header of the message
+ * @version_major: ISH Major version
+ * @version_minor: ISH Minor version
+ * @version_hotfix: ISH Hotfix version
+ * @version_build: ISH Build version
+ * @protocol_version: Protocol version
+ * @loader_version: Loader version
+ * @capability: Loader capability
+ */
+struct loader_xfer_query_ack {
+	struct loader_msg_header header;
+	__le16 version_major;
+	__le16 version_minor;
+	__le16 version_hotfix;
+	__le16 version_build;
+	__le32 protocol_version;
+	struct loader_version loader_version;
+	struct loader_capability capability;
+};
+
+/**
+ * struct loader_xfer_fragment - ISHTP firmware loader transfer fragment
+ * @header: Header of the message
+ * @xfer_mode: Transfer mode
+ * @offset: Offset
+ * @size: Size
+ * @is_last: Is last
+ */
+struct loader_xfer_fragment {
+	struct loader_msg_header header;
+	__le32 xfer_mode;
+	__le32 offset;
+	__le32 size;
+	__le32 is_last;
+};
+
+/**
+ * struct loader_xfer_fragment_ack - ISHTP firmware loader transfer fragment acknowledgment
+ * @header: Header of the message
+ */
+struct loader_xfer_fragment_ack {
+	struct loader_msg_header header;
+};
+
+/**
+ * struct fragment_dscrpt - ISHTP firmware loader fragment descriptor
+ * @ddr_adrs: The address in host DDR
+ * @fw_off: The offset of the fragment in the fw image
+ * @length: The length of the fragment
+ */
+struct fragment_dscrpt {
+	__le64 ddr_adrs;
+	__le32 fw_off;
+	__le32 length;
+};
+
+#define FRAGMENT_MAX_NUM \
+	((LOADER_MSG_SIZE - sizeof(struct loader_xfer_dma_fragment)) / \
+	 sizeof(struct fragment_dscrpt))
+
+/**
+ * struct loader_xfer_dma_fragment - ISHTP firmware loader transfer DMA fragment
+ * @fragment: Fragment
+ * @fragment_cnt: How many descriptors in the fragment_tbl
+ * @fragment_tbl: Fragment table
+ */
+struct loader_xfer_dma_fragment {
+	struct loader_xfer_fragment fragment;
+	__le32 fragment_cnt;
+	struct fragment_dscrpt fragment_tbl[] __counted_by(fragment_cnt);
+};
+
+/**
+ * struct loader_start - ISHTP firmware loader start
+ * @header: Header of the message
+ */
+struct loader_start {
+	struct loader_msg_header header;
+};
+
+/**
+ * struct loader_start_ack - ISHTP firmware loader start acknowledgment
+ * @header: Header of the message
+ */
+struct loader_start_ack {
+	struct loader_msg_header header;
+};
+
+union loader_recv_message {
+	struct loader_xfer_query_ack query_ack;
+	struct loader_xfer_fragment_ack fragment_ack;
+	struct loader_start_ack start_ack;
+	__u8 raw_data[LOADER_MSG_SIZE];
+};
+
+/*
+ * ISHTP firmware loader internal use
+ */
+/* ISHTP firmware loader command timeout */
+#define ISHTP_LOADER_TIMEOUT msecs_to_jiffies(100)
+
+/* ISHTP firmware loader retry times */
+#define ISHTP_LOADER_RETRY_TIMES 3
+
+/**
+ * struct ish_firmware_variant - ISH firmware variant
+ * @device: PCI Device ID
+ * @filename: The firmware file name
+ */
+struct ish_firmware_variant {
+	unsigned short device;
+	const char *filename;
+};
+
+/*
+ * ISHTP firmware loader API for ISHTP hbm
+ */
+
+/* ISHTP capability bit for firmware loader */
+#define ISHTP_SUPPORT_CAP_LOADER BIT(4)
+
+/* Firmware loader address */
+#define ISHTP_LOADER_CLIENT_ADDR 16
+
+/**
+ * ishtp_loader_work - The work function to start the firmware loading process
+ * @work: The work structure
+ */
+void ishtp_loader_work(struct work_struct *work);
+
+#endif /* _ISHTP_LOADER_H_ */
-- 
2.34.1


