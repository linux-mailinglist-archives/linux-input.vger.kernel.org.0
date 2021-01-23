Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id ADA0A30158D
	for <lists+linux-input@lfdr.de>; Sat, 23 Jan 2021 14:53:17 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726026AbhAWNus (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Sat, 23 Jan 2021 08:50:48 -0500
Received: from mout.kundenserver.de ([212.227.126.187]:57751 "EHLO
        mout.kundenserver.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725932AbhAWNuM (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Sat, 23 Jan 2021 08:50:12 -0500
Received: from envy.fritz.box ([82.207.207.243]) by mrelayeu.kundenserver.de
 (mreue011 [213.165.67.97]) with ESMTPSA (Nemesis) id
 1MXXdn-1lVgP22pup-00YwFF; Sat, 23 Jan 2021 14:47:27 +0100
From:   mail@richard-neumann.de
To:     nehal-bakulchandra.shah@amd.com, sandeep.singh@amd.com,
        mail@richard-neumann.de, corbet@lwn.net, jikos@kernel.org,
        benjamin.tissoires@redhat.com, linux-input@vger.kernel.org,
        linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH v9 6/8] Refactored HID LL driver.
Date:   Sat, 23 Jan 2021 14:47:14 +0100
Message-Id: <20210123134716.13414-7-mail@richard-neumann.de>
X-Mailer: git-send-email 2.30.0
In-Reply-To: <20210123134716.13414-1-mail@richard-neumann.de>
References: <20210123134716.13414-1-mail@richard-neumann.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:W2F9WB0C1F7qDZBNph5fFOUIgJ+lmntnkmzfzf5vTHliiPwbat+
 lWsPLybXK9G9WlJ4o62PH907MliMpEjQzjJ/IGem3q3024wJW2vnF7s53SRbwcPRDSnICa2
 oKARdLAX+dRIcg2N6AV6YEx1LR1Pi0A4EwtApKNLGfcB2RDLY8Md8rcaZYoUmBzVcVeBhgc
 pEsfzV+oY1t2Ser7nHe2w==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:ZPcKq5/6b+4=:Ss/ofWdCAVMqYTqbJ6uj2C
 iJkFsh2GZyzib8Y5k0uYGaF/EzY0nXzAqTITDR9iwN7SdOUQs8a0uaVqCw+tX4OOS3XxFY3pX
 HFDqO9rf8fSKJUuRBK8msMVHvZHY67t1amV9uAlBda9cubwT9NKIHTknJtBRWFrf5ZQ+WT36e
 CXDyi+xX/czR4qfouBKkH3PKzuBQxs1nYkOCt74Y8EJiY7QwTLSDl8IkhCN21PDXZLk2SsS3Z
 log7p2PyCBRMbG8N0WymY8nMcsgJ1TQ7gpgQfHzQA8FJC+DdIjigIXniDEHmtLKkcQYJ46Ekk
 gVxAmEV6i26//auqCt9HTkynmHkxgT+xEnG2DUSIvWEqEguwsxO4RO14kox5ipWysFpkIgpAn
 Cht9weSPPhm/tWb//jrxgc/8sIo/wvGuZKH2k/+QmsbXV1vsKkO+5Ff5hT0V2bPIfjuT87oLn
 mK7Y5+/6/Q==
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

From: Richard Neumann <mail@richard-neumann.de>

Refactored the HID low-level driver to implement the according API.
Implemented functions:

* parse
* start
* stop
* open
* close
* raw_request

Signed-off-by: Richard Neumann <mail@richard-neumann.de>
---
 drivers/hid/amd-sfh-hid/amd-sfh-hid-ll-drv.c | 175 +++++++++++++++++++
 drivers/hid/amd-sfh-hid/amd-sfh-hid-ll-drv.h |  41 +++++
 drivers/hid/amd-sfh-hid/amd_sfh_hid.c        | 174 ------------------
 drivers/hid/amd-sfh-hid/amd_sfh_hid.h        |  67 -------
 4 files changed, 216 insertions(+), 241 deletions(-)
 create mode 100644 drivers/hid/amd-sfh-hid/amd-sfh-hid-ll-drv.c
 create mode 100644 drivers/hid/amd-sfh-hid/amd-sfh-hid-ll-drv.h
 delete mode 100644 drivers/hid/amd-sfh-hid/amd_sfh_hid.c
 delete mode 100644 drivers/hid/amd-sfh-hid/amd_sfh_hid.h

diff --git a/drivers/hid/amd-sfh-hid/amd-sfh-hid-ll-drv.c b/drivers/hid/amd-sfh-hid/amd-sfh-hid-ll-drv.c
new file mode 100644
index 000000000000..8667ef41062c
--- /dev/null
+++ b/drivers/hid/amd-sfh-hid/amd-sfh-hid-ll-drv.c
@@ -0,0 +1,175 @@
+// SPDX-License-Identifier: GPL-2.0 OR BSD-3-Clause
+/*
+ * AMD Sensor Fusion Hub HID low-level driver
+ *
+ * Authors: Sandeep Singh <sandeep.singh@amd.com>
+ *          Nehal Bakulchandra Shah <Nehal-bakulchandra.shah@amd.com>
+ *          Richard Neumann <mail@richard-neumann.de>
+ */
+
+#include <linux/dma-mapping.h>
+#include <linux/hid.h>
+#include <linux/pci.h>
+#include <linux/wait.h>
+#include <linux/sched.h>
+#include <linux/workqueue.h>
+
+#include "amd-sfh-hid-ll-drv.h"
+#include "amd-sfh-hid-reports.h"
+#include "amd-sfh-pci.h"
+
+#define AMD_SFH_HID_DMA_SIZE	(sizeof(int) * 8)
+
+/**
+ * amd_sfh_hid_ll_parse - Callback to parse HID descriptor.
+ * @hid:	The HID device
+ *
+ * This function gets called during call to hid_add_device
+ *
+ * Return: 0 on success and non zero on error.
+ */
+static int amd_sfh_hid_ll_parse(struct hid_device *hid)
+{
+	int rc;
+	u8 *buf;
+	size_t size;
+	struct amd_sfh_hid_data *hid_data;
+
+	hid_data = hid->driver_data;
+
+	size = get_descriptor_size(hid_data->sensor_idx, AMD_SFH_DESCRIPTOR);
+	if (size < 0) {
+		hid_err(hid, "Failed to get report descriptor size!\n");
+		return -EINVAL;
+	}
+
+	buf = kzalloc(size, GFP_KERNEL);
+	if (!buf)
+		return -ENOMEM;
+
+	rc = get_report_descriptor(hid_data->sensor_idx, buf);
+	if (rc) {
+		hid_err(hid, "Failed to get report descriptor!\n");
+		goto free_buf;
+	}
+
+	rc = hid_parse_report(hid, buf, size);
+	if (rc)
+		hid_err(hid, "Failed to parse HID report!\n");
+
+free_buf:
+	kfree(buf);
+	return rc;
+}
+
+/**
+ * amd_sfh_hid_ll_start - Starts the HID device.
+ * @hid:	The HID device
+ *
+ * Allocates DMA memory on the PCI device.
+ * Returns 0 on success and non-zero on error.
+ */
+static int amd_sfh_hid_ll_start(struct hid_device *hid)
+{
+	struct amd_sfh_hid_data *hid_data = hid->driver_data;
+
+	hid_data->cpu_addr = dma_alloc_coherent(&hid_data->pci_dev->dev,
+						AMD_SFH_HID_DMA_SIZE,
+						&hid_data->dma_handle,
+						GFP_KERNEL);
+	if (!hid_data->cpu_addr)
+		return -EIO;
+
+	return 0;
+}
+
+/**
+ * amd_sfh_hid_ll_stop - Stops the HID device.
+ * @hid:	The HID device
+ *
+ * Frees the DMA memory on the PCI device.
+ */
+static void amd_sfh_hid_ll_stop(struct hid_device *hid)
+{
+	struct amd_sfh_hid_data *hid_data = hid->driver_data;
+
+	dma_free_coherent(&hid_data->pci_dev->dev, AMD_SFH_HID_DMA_SIZE,
+			  hid_data->cpu_addr, hid_data->dma_handle);
+	hid_data->cpu_addr = NULL;
+}
+
+/**
+ * amd_sfh_hid_ll_open - Opens the HID device.
+ * @hid:	The HID device
+ *
+ * Starts the corresponding sensor via the PCI driver
+ * and schedules report polling.
+ * Always returns 0.
+ */
+static int amd_sfh_hid_ll_open(struct hid_device *hid)
+{
+	struct amd_sfh_hid_data *hid_data = hid->driver_data;
+
+	amd_sfh_start_sensor(hid_data->pci_dev, hid_data->sensor_idx,
+			     hid_data->dma_handle, hid_data->interval);
+	schedule_delayed_work(&hid_data->work, hid_data->interval);
+	return 0;
+}
+
+/**
+ * amd_sfh_hid_ll_close - Closes the HID device.
+ * @hid:	The HID device
+ *
+ * Stops report polling and the corresponding sensor via the PCI driver.
+ */
+static void amd_sfh_hid_ll_close(struct hid_device *hid)
+{
+	struct amd_sfh_hid_data *hid_data = hid->driver_data;
+
+	cancel_delayed_work_sync(&hid_data->work);
+	amd_sfh_stop_sensor(hid_data->pci_dev, hid_data->sensor_idx);
+}
+
+/**
+ * amd_sfh_hid_ll_raw_request - Handles HID requests.
+ * @hid:	The HID device
+ * @reportnum:	The HID report ID
+ * @buf:	The write buffer for HID data
+ * @len:	The size of the write buffer
+ * @rtype:	The report type
+ * @reqtype:	The request type
+ *
+ * Delegates to the reporting functions
+ * defined in amd-sfh-hid-descriptor.h.
+ */
+static int amd_sfh_hid_ll_raw_request(struct hid_device *hid,
+				      unsigned char reportnum, u8 *buf,
+				      size_t len, unsigned char rtype,
+				      int reqtype)
+{
+	struct amd_sfh_hid_data *hid_data = hid->driver_data;
+
+	switch (rtype) {
+	case HID_FEATURE_REPORT:
+		return get_feature_report(hid_data->sensor_idx, reportnum, buf,
+					  len);
+	case HID_INPUT_REPORT:
+		return get_input_report(hid_data->sensor_idx, reportnum, buf,
+					len, hid_data->cpu_addr);
+	default:
+		hid_err(hid, "Unsupported report type: %u\n", rtype);
+		return -EINVAL;
+	}
+}
+
+/**
+ * The HID low-level driver for SFH HID devices.
+ */
+struct hid_ll_driver amd_sfh_hid_ll_driver = {
+	.parse	=	amd_sfh_hid_ll_parse,
+	.start	=	amd_sfh_hid_ll_start,
+	.stop	=	amd_sfh_hid_ll_stop,
+	.open	=	amd_sfh_hid_ll_open,
+	.close	=	amd_sfh_hid_ll_close,
+	.raw_request  =	amd_sfh_hid_ll_raw_request,
+};
diff --git a/drivers/hid/amd-sfh-hid/amd-sfh-hid-ll-drv.h b/drivers/hid/amd-sfh-hid/amd-sfh-hid-ll-drv.h
new file mode 100644
index 000000000000..3c5ea8c7cdb0
--- /dev/null
+++ b/drivers/hid/amd-sfh-hid/amd-sfh-hid-ll-drv.h
@@ -0,0 +1,41 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/*
+ * AMD Sensor Fusion Hub HID low-level driver interface
+ *
+ * Authors: Sandeep Singh <sandeep.singh@amd.com>
+ *          Nehal Bakulchandra Shah <Nehal-bakulchandra.shah@amd.com>
+ *          Richard Neumann <mail@richard-neumann.de>
+ */
+
+#ifndef AMD_SFH_HID_LL_DRV_H
+#define AMD_SFH_HID_LL_DRV_H
+
+#include <linux/hid.h>
+#include <linux/pci.h>
+
+#include "amd-sfh-pci.h"
+
+/**
+ * struct amd_sfh_hid_data - Per HID device driver data.
+ * @sensor_idx:		The sensor index
+ * @pci_dev:		The uderlying PCI device
+ * @work:		Work buffer for device polling
+ * @hid:		Backref to the hid device
+ * @cpu_addr:		The DMA mapped CPU address
+ * @dma_handle:		The DMA handle
+ * @interval:		The sensor update interval
+ */
+struct amd_sfh_hid_data {
+	enum sensor_idx sensor_idx;
+	struct pci_dev *pci_dev;
+	struct delayed_work work;
+	struct hid_device *hid;
+	u32 *cpu_addr;
+	dma_addr_t dma_handle;
+	unsigned int interval;
+};
+
+/* The low-level driver for AMD SFH HID devices */
+extern struct hid_ll_driver amd_sfh_hid_ll_driver;
+
+#endif
diff --git a/drivers/hid/amd-sfh-hid/amd_sfh_hid.c b/drivers/hid/amd-sfh-hid/amd_sfh_hid.c
deleted file mode 100644
index 4f989483aa03..000000000000
--- a/drivers/hid/amd-sfh-hid/amd_sfh_hid.c
+++ /dev/null
@@ -1,174 +0,0 @@
-// SPDX-License-Identifier: GPL-2.0-or-later
-/*
- * AMD MP2 Sensors transport driver
- *
- * Authors: Nehal Bakulchandra Shah <Nehal-bakulchandra.shah@amd.com>
- *	    Sandeep Singh <sandeep.singh@amd.com>
- */
-#include <linux/hid.h>
-#include <linux/wait.h>
-#include <linux/sched.h>
-
-#include "amd_sfh_hid.h"
-
-#define AMD_SFH_RESPONSE_TIMEOUT	1500
-
-/**
- * amdtp_hid_parse() - hid-core .parse() callback
- * @hid:	hid device instance
- *
- * This function gets called during call to hid_add_device
- *
- * Return: 0 on success and non zero on error
- */
-static int amdtp_hid_parse(struct hid_device *hid)
-{
-	struct amdtp_hid_data *hid_data = hid->driver_data;
-	struct amdtp_cl_data *cli_data = hid_data->cli_data;
-
-	return hid_parse_report(hid, cli_data->report_descr[hid_data->index],
-			      cli_data->report_descr_sz[hid_data->index]);
-}
-
-/* Empty callbacks with success return code */
-static int amdtp_hid_start(struct hid_device *hid)
-{
-	return 0;
-}
-
-static void amdtp_hid_stop(struct hid_device *hid)
-{
-}
-
-static int amdtp_hid_open(struct hid_device *hid)
-{
-	return 0;
-}
-
-static void amdtp_hid_close(struct hid_device *hid)
-{
-}
-
-static int amdtp_raw_request(struct hid_device *hdev, u8 reportnum,
-			     u8 *buf, size_t len, u8 rtype, int reqtype)
-{
-	return 0;
-}
-
-static void amdtp_hid_request(struct hid_device *hid, struct hid_report *rep, int reqtype)
-{
-	int rc;
-
-	switch (reqtype) {
-	case HID_REQ_GET_REPORT:
-		rc = amd_sfh_get_report(hid, rep->id, rep->type);
-		if (rc)
-			dev_err(&hid->dev, "AMDSFH  get report error\n");
-		break;
-	case HID_REQ_SET_REPORT:
-		amd_sfh_set_report(hid, rep->id, reqtype);
-		break;
-	default:
-		break;
-	}
-}
-
-static int amdtp_wait_for_response(struct hid_device *hid)
-{
-	struct amdtp_hid_data *hid_data =  hid->driver_data;
-	struct amdtp_cl_data *cli_data = hid_data->cli_data;
-	int i, ret = 0;
-
-	for (i = 0; i < cli_data->num_hid_devices; i++) {
-		if (cli_data->hid_sensor_hubs[i] == hid)
-			break;
-	}
-
-	if (!cli_data->request_done[i])
-		ret = wait_event_interruptible_timeout(hid_data->hid_wait,
-						       cli_data->request_done[i],
-						       msecs_to_jiffies(AMD_SFH_RESPONSE_TIMEOUT));
-	if (ret == -ERESTARTSYS)
-		return -ERESTARTSYS;
-	else if (ret < 0)
-		return -ETIMEDOUT;
-	else
-		return 0;
-}
-
-void amdtp_hid_wakeup(struct hid_device *hid)
-{
-	struct amdtp_hid_data *hid_data = hid->driver_data;
-	struct amdtp_cl_data *cli_data = hid_data->cli_data;
-
-	cli_data->request_done[cli_data->cur_hid_dev] = true;
-	wake_up_interruptible(&hid_data->hid_wait);
-}
-
-static struct hid_ll_driver amdtp_hid_ll_driver = {
-	.parse	=	amdtp_hid_parse,
-	.start	=	amdtp_hid_start,
-	.stop	=	amdtp_hid_stop,
-	.open	=	amdtp_hid_open,
-	.close	=	amdtp_hid_close,
-	.request  =	amdtp_hid_request,
-	.wait	=	amdtp_wait_for_response,
-	.raw_request  =	amdtp_raw_request,
-};
-
-int amdtp_hid_probe(u32 cur_hid_dev, struct amdtp_cl_data *cli_data)
-{
-	struct hid_device *hid;
-	struct amdtp_hid_data *hid_data;
-	int rc;
-
-	hid = hid_allocate_device();
-	if (IS_ERR(hid))
-		return PTR_ERR(hid);
-
-	hid_data = kzalloc(sizeof(*hid_data), GFP_KERNEL);
-	if (!hid_data) {
-		rc = -ENOMEM;
-		goto err_hid_data;
-	}
-
-	hid->ll_driver = &amdtp_hid_ll_driver;
-	hid_data->index = cur_hid_dev;
-	hid_data->cli_data = cli_data;
-	init_waitqueue_head(&hid_data->hid_wait);
-
-	hid->driver_data = hid_data;
-	cli_data->hid_sensor_hubs[cur_hid_dev] = hid;
-	hid->bus = BUS_AMD_AMDTP;
-	hid->vendor = AMD_SFH_HID_VENDOR;
-	hid->product = AMD_SFH_HID_PRODUCT;
-	snprintf(hid->name, sizeof(hid->name), "%s %04X:%04X", "hid-amdtp",
-		 hid->vendor, hid->product);
-
-	rc = hid_add_device(hid);
-	if (rc)
-		goto err_hid_device;
-	return 0;
-
-err_hid_device:
-	kfree(hid_data);
-err_hid_data:
-	hid_destroy_device(hid);
-	return rc;
-}
-
-void amdtp_hid_remove(struct amdtp_cl_data *cli_data)
-{
-	int i;
-
-	for (i = 0; i < cli_data->num_hid_devices; ++i) {
-		kfree(cli_data->feature_report[i]);
-		kfree(cli_data->input_report[i]);
-		kfree(cli_data->report_descr[i]);
-		if (cli_data->hid_sensor_hubs[i]) {
-			kfree(cli_data->hid_sensor_hubs[i]->driver_data);
-			hid_destroy_device(cli_data->hid_sensor_hubs[i]);
-			cli_data->hid_sensor_hubs[i] = NULL;
-		}
-	}
-}
diff --git a/drivers/hid/amd-sfh-hid/amd_sfh_hid.h b/drivers/hid/amd-sfh-hid/amd_sfh_hid.h
deleted file mode 100644
index d7eac1728e31..000000000000
--- a/drivers/hid/amd-sfh-hid/amd_sfh_hid.h
+++ /dev/null
@@ -1,67 +0,0 @@
-/* SPDX-License-Identifier: GPL-2.0-or-later */
-/*
- * AMD MP2 Sensors transport driver
- *
- * Authors: Nehal Bakulchandra Shah <Nehal-bakulchandra.shah@amd.com>
- *	    Sandeep Singh <sandeep.singh@amd.com>
- */
-
-#ifndef AMDSFH_HID_H
-#define AMDSFH_HID_H
-
-#define MAX_HID_DEVICES		4
-#define BUS_AMD_AMDTP		0x20
-#define AMD_SFH_HID_VENDOR	0x1022
-#define AMD_SFH_HID_PRODUCT	0x0001
-
-struct amdtp_cl_data {
-	u8 init_done;
-	u32 cur_hid_dev;
-	u32 hid_dev_count;
-	u32 num_hid_devices;
-	struct device_info *hid_devices;
-	u8  *report_descr[MAX_HID_DEVICES];
-	int report_descr_sz[MAX_HID_DEVICES];
-	struct hid_device *hid_sensor_hubs[MAX_HID_DEVICES];
-	u8 *hid_descr[MAX_HID_DEVICES];
-	int hid_descr_size[MAX_HID_DEVICES];
-	phys_addr_t phys_addr_base;
-	u32 *sensor_virt_addr[MAX_HID_DEVICES];
-	dma_addr_t sensor_dma_addr[MAX_HID_DEVICES];
-	u32 sensor_sts[MAX_HID_DEVICES];
-	u32 sensor_requested_cnt[MAX_HID_DEVICES];
-	u8 report_type[MAX_HID_DEVICES];
-	u8 report_id[MAX_HID_DEVICES];
-	u8 sensor_idx[MAX_HID_DEVICES];
-	u8 *feature_report[MAX_HID_DEVICES];
-	u8 *input_report[MAX_HID_DEVICES];
-	u8 request_done[MAX_HID_DEVICES];
-	struct delayed_work work;
-	struct delayed_work work_buffer;
-};
-
-/**
- * struct amdtp_hid_data - Per instance HID data
- * @index:		Device index in the order of enumeration
- * @request_done:	Get Feature/Input report complete flag
- *			used during get/set request from hid core
- * @cli_data:		Link to the client instance
- * @hid_wait:		Completion waitq
- *
- * Used to tie hid->driver data to driver client instance
- */
-struct amdtp_hid_data {
-	int index;
-	struct amdtp_cl_data *cli_data;
-	wait_queue_head_t hid_wait;
-};
-
-/* Interface functions between HID LL driver and AMD SFH client */
-void hid_amdtp_set_feature(struct hid_device *hid, char *buf, u32 len, int report_id);
-void hid_amdtp_get_report(struct hid_device *hid, int report_id, int report_type);
-int amdtp_hid_probe(u32 cur_hid_dev, struct amdtp_cl_data *cli_data);
-void amdtp_hid_remove(struct amdtp_cl_data *cli_data);
-int amd_sfh_get_report(struct hid_device *hid, int report_id, int report_type);
-void amd_sfh_set_report(struct hid_device *hid, int report_id, int report_type);
-void amdtp_hid_wakeup(struct hid_device *hid);
-#endif
-- 
2.30.0

