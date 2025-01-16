Return-Path: <linux-input+bounces-9296-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id F1F27A145CC
	for <lists+linux-input@lfdr.de>; Fri, 17 Jan 2025 00:30:20 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 1B797165016
	for <lists+linux-input@lfdr.de>; Thu, 16 Jan 2025 23:30:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D537F246A36;
	Thu, 16 Jan 2025 23:29:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="Nk8CgueH"
X-Original-To: linux-input@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F235A236A87;
	Thu, 16 Jan 2025 23:29:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737070145; cv=none; b=TGeSOT0/bbL1ztNR6+Ore1+Z0jUpKmScK2dtEet5DumRB8tUYtSi3J0Bd6l3oXyKIV5PYL1OE1oHApYw0591QXKwnrtYE2tZjAfuH/E6UL0aLPZdJr5vzj4DdeC8GD0Jh0TUrlpebLjasWMB8bkUaxT4BFL4dHtuge9as9xZKyk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737070145; c=relaxed/simple;
	bh=VY0qqb1f0D1wjOTLrZ0tj69RM706ZOFko3EfeR/Ywlw=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=HPYC1Ip3O+R77cU/otma4d0DkJ6YN202kICGTm4Z3BZ6h0uzC6sbX3kTspZIBugcUbzLqGEVRfodgFTuQ0ss2DlkHsNYNryVHrantjsw3Wl5rlagDlIzR/PS9f07UF25ieA23viyl0fY29ZO+H8dB2oVjbSzzNrWe1bHTJaOFkQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=Nk8CgueH; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 50GN7gEF011119;
	Thu, 16 Jan 2025 23:28:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	zE/y1UAOhCJ31jF00rXMwAFsSRgMWUz68/3SAFHGF/w=; b=Nk8CgueHNKgO70O1
	/RgcKDwhu4sgq9plAmeKe0pZ+CDVSBa768T+WInozMA7aeS9bBZU6vbTAoJsAH6r
	5SIAJODtmLhxGqGhvJvq2MlZFRFkJduFkYf+lKhg5MXvbZJ8LIBkK2pxVX+7rh5w
	JnZ05Kq/VykPXRCZVDZjqwbIFi7NSxZPr/jVQBJNyeLGG98u83mZ8Fa2LEEZuyI5
	6W0oh/HMRJkT152+/Teyvu2gTCTreo1bzOm/qo16jKlAjim9g08jNHvesXDBcC/8
	tafutCHwW626DB4nfXzIoE4W258/8wEWBoRMg84n8YJMZbbVyaovwgcZtkGSTRbH
	PLKHLw==
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 447bgw810n-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 16 Jan 2025 23:28:42 +0000 (GMT)
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com [10.47.209.197])
	by NALASPPMTA03.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 50GNSf8i031813
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 16 Jan 2025 23:28:41 GMT
Received: from hu-wcheng-lv.qualcomm.com (10.49.16.6) by
 nalasex01b.na.qualcomm.com (10.47.209.197) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Thu, 16 Jan 2025 15:28:41 -0800
From: Wesley Cheng <quic_wcheng@quicinc.com>
To: <srinivas.kandagatla@linaro.org>, <mathias.nyman@intel.com>,
        <perex@perex.cz>, <conor+dt@kernel.org>, <dmitry.torokhov@gmail.com>,
        <corbet@lwn.net>, <broonie@kernel.org>, <lgirdwood@gmail.com>,
        <tiwai@suse.com>, <krzk+dt@kernel.org>,
        <pierre-louis.bossart@linux.intel.com>, <Thinh.Nguyen@synopsys.com>,
        <robh@kernel.org>, <gregkh@linuxfoundation.org>
CC: <linux-kernel@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-sound@vger.kernel.org>, <linux-input@vger.kernel.org>,
        <linux-usb@vger.kernel.org>, <linux-arm-msm@vger.kernel.org>,
        <linux-doc@vger.kernel.org>,
        Mathias Nyman <mathias.nyman@linux.intel.com>,
        Wesley Cheng <quic_wcheng@quicinc.com>
Subject: [PATCH v33 01/31] xhci: sideband: add initial api to register a secondary interrupter entity
Date: Thu, 16 Jan 2025 15:27:54 -0800
Message-ID: <20250116232824.3748438-2-quic_wcheng@quicinc.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250116232824.3748438-1-quic_wcheng@quicinc.com>
References: <20250116232824.3748438-1-quic_wcheng@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: nalasex01b.na.qualcomm.com (10.47.209.197) To
 nalasex01b.na.qualcomm.com (10.47.209.197)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: JpYGoc7cb2qhkdOIZcYPgzSUtLnWM0aQ
X-Proofpoint-ORIG-GUID: JpYGoc7cb2qhkdOIZcYPgzSUtLnWM0aQ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-01-16_10,2025-01-16_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 adultscore=0 bulkscore=0 mlxscore=0 impostorscore=0 clxscore=1015
 lowpriorityscore=0 phishscore=0 mlxlogscore=999 malwarescore=0
 suspectscore=0 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2501160174

From: Mathias Nyman <mathias.nyman@linux.intel.com>

Introduce XHCI sideband, which manages the USB endpoints being requested by
a client driver.  This is used for when client drivers are attempting to
offload USB endpoints to another entity for handling USB transfers.  XHCI
sec intr will allow for drivers to fetch the required information about the
transfer ring, so the user can submit transfers independently.  Expose the
required APIs for drivers to register and request for a USB endpoint and to
manage XHCI secondary interrupters.

Driver renaming, multiple ring segment page linking, proper endpoint clean
up, and allowing module compilation added by Wesley Cheng to complete
original concept code by Mathias Nyman.

Signed-off-by: Mathias Nyman <mathias.nyman@linux.intel.com>
Co-developed-by: Wesley Cheng <quic_wcheng@quicinc.com>
Signed-off-by: Wesley Cheng <quic_wcheng@quicinc.com>
---
 drivers/usb/host/Kconfig          |   9 +
 drivers/usb/host/Makefile         |   2 +
 drivers/usb/host/xhci-sideband.c  | 429 ++++++++++++++++++++++++++++++
 drivers/usb/host/xhci.h           |   4 +
 include/linux/usb/xhci-sideband.h |  73 +++++
 5 files changed, 517 insertions(+)
 create mode 100644 drivers/usb/host/xhci-sideband.c
 create mode 100644 include/linux/usb/xhci-sideband.h

diff --git a/drivers/usb/host/Kconfig b/drivers/usb/host/Kconfig
index d011d6c753ed..6b9872f16a0b 100644
--- a/drivers/usb/host/Kconfig
+++ b/drivers/usb/host/Kconfig
@@ -104,6 +104,15 @@ config USB_XHCI_RZV2M
 	  Say 'Y' to enable the support for the xHCI host controller
 	  found in Renesas RZ/V2M SoC.
 
+config USB_XHCI_SIDEBAND
+	tristate "xHCI support for sideband"
+	help
+	  Say 'Y' to enable the support for the xHCI sideband capability.
+	  Provide a mechanism for a sideband datapath for payload associated
+	  with audio class endpoints. This allows for an audio DSP to use
+	  xHCI USB endpoints directly, allowing CPU to sleep while playing
+	  audio.
+
 config USB_XHCI_TEGRA
 	tristate "xHCI support for NVIDIA Tegra SoCs"
 	depends on PHY_TEGRA_XUSB
diff --git a/drivers/usb/host/Makefile b/drivers/usb/host/Makefile
index be4e5245c52f..435a1e93b40b 100644
--- a/drivers/usb/host/Makefile
+++ b/drivers/usb/host/Makefile
@@ -32,6 +32,8 @@ endif
 xhci-rcar-hcd-y				+= xhci-rcar.o
 xhci-rcar-hcd-$(CONFIG_USB_XHCI_RZV2M)	+= xhci-rzv2m.o
 
+obj-$(CONFIG_USB_XHCI_SIDEBAND) += xhci-sideband.o
+
 obj-$(CONFIG_USB_PCI)	+= pci-quirks.o
 
 obj-$(CONFIG_USB_EHCI_HCD)	+= ehci-hcd.o
diff --git a/drivers/usb/host/xhci-sideband.c b/drivers/usb/host/xhci-sideband.c
new file mode 100644
index 000000000000..19c58ae60414
--- /dev/null
+++ b/drivers/usb/host/xhci-sideband.c
@@ -0,0 +1,429 @@
+// SPDX-License-Identifier: GPL-2.0
+
+/*
+ * xHCI host controller sideband support
+ *
+ * Copyright (c) 2023-2025, Intel Corporation.
+ *
+ * Author: Mathias Nyman
+ */
+
+#include <linux/usb/xhci-sideband.h>
+#include <linux/dma-direct.h>
+
+#include "xhci.h"
+
+/* sideband internal helpers */
+static struct sg_table *
+xhci_ring_to_sgtable(struct xhci_sideband *sb, struct xhci_ring *ring)
+{
+	struct xhci_segment *seg;
+	struct sg_table	*sgt;
+	unsigned int n_pages;
+	struct page **pages;
+	struct device *dev;
+	size_t sz;
+	int i;
+
+	dev = xhci_to_hcd(sb->xhci)->self.sysdev;
+	sz = ring->num_segs * TRB_SEGMENT_SIZE;
+	n_pages = PAGE_ALIGN(sz) >> PAGE_SHIFT;
+	pages = kvmalloc_array(n_pages, sizeof(struct page *), GFP_KERNEL);
+	if (!pages)
+		return NULL;
+
+	sgt = kzalloc(sizeof(*sgt), GFP_KERNEL);
+	if (!sgt) {
+		kvfree(pages);
+		return NULL;
+	}
+
+	seg = ring->first_seg;
+	if (!seg)
+		goto err;
+	/*
+	 * Rings can potentially have multiple segments, create an array that
+	 * carries page references to allocated segments.  Utilize the
+	 * sg_alloc_table_from_pages() to create the sg table, and to ensure
+	 * that page links are created.
+	 */
+	for (i = 0; i < ring->num_segs; i++) {
+		dma_get_sgtable(dev, sgt, seg->trbs, seg->dma,
+				TRB_SEGMENT_SIZE);
+		pages[i] = sg_page(sgt->sgl);
+		sg_free_table(sgt);
+		seg = seg->next;
+	}
+
+	if (sg_alloc_table_from_pages(sgt, pages, n_pages, 0, sz, GFP_KERNEL))
+		goto err;
+
+	/*
+	 * Save first segment dma address to sg dma_address field for the sideband
+	 * client to have access to the IOVA of the ring.
+	 */
+	sg_dma_address(sgt->sgl) = ring->first_seg->dma;
+
+	return sgt;
+
+err:
+	kvfree(pages);
+	kfree(sgt);
+
+	return NULL;
+}
+
+static void
+__xhci_sideband_remove_endpoint(struct xhci_sideband *sb, struct xhci_virt_ep *ep)
+{
+	/*
+	 * Issue a stop endpoint command when an endpoint is removed.
+	 * The stop ep cmd handler will handle the ring cleanup.
+	 */
+	xhci_stop_endpoint_sync(sb->xhci, ep, 0, GFP_KERNEL);
+
+	ep->sideband = NULL;
+	sb->eps[ep->ep_index] = NULL;
+}
+
+/* sideband api functions */
+
+/**
+ * xhci_sideband_add_endpoint - add endpoint to sideband access list
+ * @sb: sideband instance for this usb device
+ * @host_ep: usb host endpoint
+ *
+ * Adds an endpoint to the list of sideband accessed endpoints for this usb
+ * device.
+ * After an endpoint is added the sideband client can get the endpoint transfer
+ * ring buffer by calling xhci_sideband_endpoint_buffer()
+ *
+ * Return: 0 on success, negative error otherwise.
+ */
+int
+xhci_sideband_add_endpoint(struct xhci_sideband *sb,
+			   struct usb_host_endpoint *host_ep)
+{
+	struct xhci_virt_ep *ep;
+	unsigned int ep_index;
+
+	mutex_lock(&sb->mutex);
+	ep_index = xhci_get_endpoint_index(&host_ep->desc);
+	ep = &sb->vdev->eps[ep_index];
+
+	if (ep->ep_state & EP_HAS_STREAMS) {
+		mutex_unlock(&sb->mutex);
+		return -EINVAL;
+	}
+
+	/*
+	 * Note, we don't know the DMA mask of the audio DSP device, if its
+	 * smaller than for xhci it won't be able to access the endpoint ring
+	 * buffer. This could be solved by not allowing the audio class driver
+	 * to add the endpoint the normal way, but instead offload it immediately,
+	 * and let this function add the endpoint and allocate the ring buffer
+	 * with the smallest common DMA mask
+	 */
+	if (sb->eps[ep_index] || ep->sideband) {
+		mutex_unlock(&sb->mutex);
+		return -EBUSY;
+	}
+
+	ep->sideband = sb;
+	sb->eps[ep_index] = ep;
+	mutex_unlock(&sb->mutex);
+
+	return 0;
+}
+EXPORT_SYMBOL_GPL(xhci_sideband_add_endpoint);
+
+/**
+ * xhci_sideband_remove_endpoint - remove endpoint from sideband access list
+ * @sb: sideband instance for this usb device
+ * @host_ep: usb host endpoint
+ *
+ * Removes an endpoint from the list of sideband accessed endpoints for this usb
+ * device.
+ * sideband client should no longer touch the endpoint transfer buffer after
+ * calling this.
+ *
+ * Return: 0 on success, negative error otherwise.
+ */
+int
+xhci_sideband_remove_endpoint(struct xhci_sideband *sb,
+			      struct usb_host_endpoint *host_ep)
+{
+	struct xhci_virt_ep *ep;
+	unsigned int ep_index;
+
+	mutex_lock(&sb->mutex);
+	ep_index = xhci_get_endpoint_index(&host_ep->desc);
+	ep = sb->eps[ep_index];
+
+	if (!ep || !ep->sideband || ep->sideband != sb) {
+		mutex_unlock(&sb->mutex);
+		return -ENODEV;
+	}
+
+	__xhci_sideband_remove_endpoint(sb, ep);
+	xhci_initialize_ring_info(ep->ring);
+	mutex_unlock(&sb->mutex);
+
+	return 0;
+}
+EXPORT_SYMBOL_GPL(xhci_sideband_remove_endpoint);
+
+int
+xhci_sideband_stop_endpoint(struct xhci_sideband *sb,
+			    struct usb_host_endpoint *host_ep)
+{
+	struct xhci_virt_ep *ep;
+	unsigned int ep_index;
+
+	ep_index = xhci_get_endpoint_index(&host_ep->desc);
+	ep = sb->eps[ep_index];
+
+	if (!ep || !ep->sideband || ep->sideband != sb)
+		return -EINVAL;
+
+	return xhci_stop_endpoint_sync(sb->xhci, ep, 0, GFP_KERNEL);
+}
+EXPORT_SYMBOL_GPL(xhci_sideband_stop_endpoint);
+
+/**
+ * xhci_sideband_get_endpoint_buffer - gets the endpoint transfer buffer address
+ * @sb: sideband instance for this usb device
+ * @host_ep: usb host endpoint
+ *
+ * Returns the address of the endpoint buffer where xHC controller reads queued
+ * transfer TRBs from. This is the starting address of the ringbuffer where the
+ * sideband client should write TRBs to.
+ *
+ * Caller needs to free the returned sg_table
+ *
+ * Return: struct sg_table * if successful. NULL otherwise.
+ */
+struct sg_table *
+xhci_sideband_get_endpoint_buffer(struct xhci_sideband *sb,
+				  struct usb_host_endpoint *host_ep)
+{
+	struct xhci_virt_ep *ep;
+	unsigned int ep_index;
+
+	ep_index = xhci_get_endpoint_index(&host_ep->desc);
+	ep = sb->eps[ep_index];
+
+	if (!ep || !ep->ring || !ep->sideband || ep->sideband != sb)
+		return NULL;
+
+	return xhci_ring_to_sgtable(sb, ep->ring);
+}
+EXPORT_SYMBOL_GPL(xhci_sideband_get_endpoint_buffer);
+
+/**
+ * xhci_sideband_get_event_buffer - return the event buffer for this device
+ * @sb: sideband instance for this usb device
+ *
+ * If a secondary xhci interupter is set up for this usb device then this
+ * function returns the address of the event buffer where xHC writes
+ * the transfer completion events.
+ *
+ * Caller needs to free the returned sg_table
+ *
+ * Return: struct sg_table * if successful. NULL otherwise.
+ */
+struct sg_table *
+xhci_sideband_get_event_buffer(struct xhci_sideband *sb)
+{
+	if (!sb || !sb->ir)
+		return NULL;
+
+	return xhci_ring_to_sgtable(sb, sb->ir->event_ring);
+}
+EXPORT_SYMBOL_GPL(xhci_sideband_get_event_buffer);
+
+/**
+ * xhci_sideband_create_interrupter - creates a new interrupter for this sideband
+ * @sb: sideband instance for this usb device
+ * @num_seg: number of event ring segments to allocate
+ * @ip_autoclear: IP autoclearing support such as MSI implemented
+ *
+ * Sets up a xhci interrupter that can be used for this sideband accessed usb
+ * device. Transfer events for this device can be routed to this interrupters
+ * event ring by setting the 'Interrupter Target' field correctly when queueing
+ * the transfer TRBs.
+ * Once this interrupter is created the interrupter target ID can be obtained
+ * by calling xhci_sideband_interrupter_id()
+ *
+ * Returns 0 on success, negative error otherwise
+ */
+int
+xhci_sideband_create_interrupter(struct xhci_sideband *sb, int num_seg,
+				 bool ip_autoclear, u32 imod_interval)
+{
+	int ret = 0;
+
+	if (!sb || !sb->xhci)
+		return -ENODEV;
+
+	mutex_lock(&sb->mutex);
+	if (sb->ir) {
+		ret = -EBUSY;
+		goto out;
+	}
+
+	sb->ir = xhci_create_secondary_interrupter(xhci_to_hcd(sb->xhci),
+						   num_seg, imod_interval);
+	if (!sb->ir) {
+		ret = -ENOMEM;
+		goto out;
+	}
+
+	sb->ir->ip_autoclear = ip_autoclear;
+
+out:
+	mutex_unlock(&sb->mutex);
+
+	return ret;
+}
+EXPORT_SYMBOL_GPL(xhci_sideband_create_interrupter);
+
+/**
+ * xhci_sideband_remove_interrupter - remove the interrupter from a sideband
+ * @sb: sideband instance for this usb device
+ *
+ * Removes a registered interrupt for a sideband.  This would allow for other
+ * sideband users to utilize this interrupter.
+ */
+void
+xhci_sideband_remove_interrupter(struct xhci_sideband *sb)
+{
+	if (!sb || !sb->ir)
+		return;
+
+	mutex_lock(&sb->mutex);
+	xhci_remove_secondary_interrupter(xhci_to_hcd(sb->xhci), sb->ir);
+
+	sb->ir = NULL;
+	mutex_unlock(&sb->mutex);
+}
+EXPORT_SYMBOL_GPL(xhci_sideband_remove_interrupter);
+
+/**
+ * xhci_sideband_interrupter_id - return the interrupter target id
+ * @sb: sideband instance for this usb device
+ *
+ * If a secondary xhci interrupter is set up for this usb device then this
+ * function returns the ID used by the interrupter. The sideband client
+ * needs to write this ID to the 'Interrupter Target' field of the transfer TRBs
+ * it queues on the endpoints transfer ring to ensure transfer completion event
+ * are written by xHC to the correct interrupter event ring.
+ *
+ * Returns interrupter id on success, negative error othgerwise
+ */
+int
+xhci_sideband_interrupter_id(struct xhci_sideband *sb)
+{
+	if (!sb || !sb->ir)
+		return -ENODEV;
+
+	return sb->ir->intr_num;
+}
+EXPORT_SYMBOL_GPL(xhci_sideband_interrupter_id);
+
+/**
+ * xhci_sideband_register - register a sideband for a usb device
+ * @intf: usb interface associated with the sideband device
+ *
+ * Allows for clients to utilize XHCI interrupters and fetch transfer and event
+ * ring parameters for executing data transfers.
+ *
+ * Return: pointer to a new xhci_sideband instance if successful. NULL otherwise.
+ */
+struct xhci_sideband *
+xhci_sideband_register(struct usb_interface *intf, enum xhci_sideband_type type)
+{
+	struct usb_device *udev = interface_to_usbdev(intf);
+	struct usb_hcd *hcd = bus_to_hcd(udev->bus);
+	struct xhci_hcd *xhci = hcd_to_xhci(hcd);
+	struct xhci_virt_device *vdev;
+	struct xhci_sideband *sb;
+
+	/*
+	 * Make sure the usb device is connected to a xhci controller.  Fail
+	 * registration if the type is anything other than  XHCI_SIDEBAND_VENDOR,
+	 * as this is the only type that is currently supported by xhci-sideband.
+	 */
+	if (!udev->slot_id || type != XHCI_SIDEBAND_VENDOR)
+		return NULL;
+
+	sb = kzalloc_node(sizeof(*sb), GFP_KERNEL, dev_to_node(hcd->self.sysdev));
+	if (!sb)
+		return NULL;
+
+	mutex_init(&sb->mutex);
+
+	/* check this device isn't already controlled via sideband */
+	spin_lock_irq(&xhci->lock);
+
+	vdev = xhci->devs[udev->slot_id];
+
+	if (!vdev || vdev->sideband) {
+		xhci_warn(xhci, "XHCI sideband for slot %d already in use\n",
+			  udev->slot_id);
+		spin_unlock_irq(&xhci->lock);
+		kfree(sb);
+		return NULL;
+	}
+
+	sb->xhci = xhci;
+	sb->vdev = vdev;
+	sb->intf = intf;
+	sb->type = type;
+	vdev->sideband = sb;
+
+	spin_unlock_irq(&xhci->lock);
+
+	return sb;
+}
+EXPORT_SYMBOL_GPL(xhci_sideband_register);
+
+/**
+ * xhci_sideband_unregister - unregister sideband access to a usb device
+ * @sb: sideband instance to be unregistered
+ *
+ * Unregisters sideband access to a usb device and frees the sideband
+ * instance.
+ * After this the endpoint and interrupter event buffers should no longer
+ * be accessed via sideband. The xhci driver can now take over handling
+ * the buffers.
+ */
+void
+xhci_sideband_unregister(struct xhci_sideband *sb)
+{
+	struct xhci_hcd *xhci;
+	int i;
+
+	if (!sb)
+		return;
+
+	xhci = sb->xhci;
+
+	mutex_lock(&sb->mutex);
+	for (i = 0; i < EP_CTX_PER_DEV; i++)
+		if (sb->eps[i])
+			__xhci_sideband_remove_endpoint(sb, sb->eps[i]);
+	mutex_unlock(&sb->mutex);
+
+	xhci_sideband_remove_interrupter(sb);
+
+	spin_lock_irq(&xhci->lock);
+	sb->xhci = NULL;
+	sb->vdev->sideband = NULL;
+	spin_unlock_irq(&xhci->lock);
+
+	kfree(sb);
+}
+EXPORT_SYMBOL_GPL(xhci_sideband_unregister);
+MODULE_DESCRIPTION("xHCI sideband driver for secondary interrupter management");
+MODULE_LICENSE("GPL");
diff --git a/drivers/usb/host/xhci.h b/drivers/usb/host/xhci.h
index 8c164340a2c3..55d126d49ecc 100644
--- a/drivers/usb/host/xhci.h
+++ b/drivers/usb/host/xhci.h
@@ -697,6 +697,8 @@ struct xhci_virt_ep {
 	int			next_frame_id;
 	/* Use new Isoch TRB layout needed for extended TBC support */
 	bool			use_extended_tbc;
+	/* set if this endpoint is controlled via sideband access*/
+	struct xhci_sideband	*sideband;
 };
 
 enum xhci_overhead_type {
@@ -759,6 +761,8 @@ struct xhci_virt_device {
 	u16				current_mel;
 	/* Used for the debugfs interfaces. */
 	void				*debugfs_private;
+	/* set if this endpoint is controlled via sideband access*/
+	struct xhci_sideband	*sideband;
 };
 
 /*
diff --git a/include/linux/usb/xhci-sideband.h b/include/linux/usb/xhci-sideband.h
new file mode 100644
index 000000000000..0f92335517ab
--- /dev/null
+++ b/include/linux/usb/xhci-sideband.h
@@ -0,0 +1,73 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/*
+ * xHCI host controller sideband support
+ *
+ * Copyright (c) 2023-2025, Intel Corporation.
+ *
+ * Author: Mathias Nyman <mathias.nyman@linux.intel.com>
+ */
+#ifndef __LINUX_XHCI_SIDEBAND_H
+#define __LINUX_XHCI_SIDEBAND_H
+
+#include <linux/scatterlist.h>
+#include <linux/usb.h>
+
+#define	EP_CTX_PER_DEV		31	/* FIXME defined twice, from xhci.h */
+
+struct xhci_sideband;
+
+enum xhci_sideband_type {
+	XHCI_SIDEBAND_AUDIO,
+	XHCI_SIDEBAND_VENDOR,
+};
+
+/**
+ * struct xhci_sideband - representation of a sideband accessed usb device.
+ * @xhci: The xhci host controller the usb device is connected to
+ * @vdev: the usb device accessed via sideband
+ * @eps: array of endpoints controlled via sideband
+ * @ir: event handling and buffer for sideband accessed device
+ * @mutex: mutex for sideband operations
+ * @intf: USB sideband client interface
+ *
+ * FIXME usb device accessed via sideband Keeping track of sideband accessed usb devices.
+ */
+struct xhci_sideband {
+	struct xhci_hcd                 *xhci;
+	struct xhci_virt_device         *vdev;
+	struct xhci_virt_ep             *eps[EP_CTX_PER_DEV];
+	struct xhci_interrupter         *ir;
+	enum xhci_sideband_type		type;
+
+	/* Synchronizing xHCI sideband operations with client drivers operations */
+	struct mutex			mutex;
+
+	struct usb_interface		*intf;
+};
+
+struct xhci_sideband *
+xhci_sideband_register(struct usb_interface *intf, enum xhci_sideband_type type);
+void
+xhci_sideband_unregister(struct xhci_sideband *sb);
+int
+xhci_sideband_add_endpoint(struct xhci_sideband *sb,
+			   struct usb_host_endpoint *host_ep);
+int
+xhci_sideband_remove_endpoint(struct xhci_sideband *sb,
+			      struct usb_host_endpoint *host_ep);
+int
+xhci_sideband_stop_endpoint(struct xhci_sideband *sb,
+			    struct usb_host_endpoint *host_ep);
+struct sg_table *
+xhci_sideband_get_endpoint_buffer(struct xhci_sideband *sb,
+				  struct usb_host_endpoint *host_ep);
+struct sg_table *
+xhci_sideband_get_event_buffer(struct xhci_sideband *sb);
+int
+xhci_sideband_create_interrupter(struct xhci_sideband *sb, int num_seg,
+				 bool ip_autoclear, u32 imod_interval);
+void
+xhci_sideband_remove_interrupter(struct xhci_sideband *sb);
+int
+xhci_sideband_interrupter_id(struct xhci_sideband *sb);
+#endif /* __LINUX_XHCI_SIDEBAND_H */

