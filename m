Return-Path: <linux-input+bounces-7313-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id EE9439996A0
	for <lists+linux-input@lfdr.de>; Fri, 11 Oct 2024 02:14:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 5BFAEB216D1
	for <lists+linux-input@lfdr.de>; Fri, 11 Oct 2024 00:14:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8EF691CF5FD;
	Fri, 11 Oct 2024 00:07:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="JRzsexJD"
X-Original-To: linux-input@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1CC08195B18;
	Fri, 11 Oct 2024 00:07:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728605259; cv=none; b=LwUViDO/J9KLft4wiQdk06zyn0TJDIB4fi2fB4HnTuI9pqIHNabDZSA+s8/HiDRGDhdeXbidPRtqYSzm08m/Kl/RNxHWYuXIuRUVw/krNNuUPufeiiaa8SuRgEqJvaPipnLEykjT1rbiYZfUHuykYD/aoGvveyibwncqHx4/9rw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728605259; c=relaxed/simple;
	bh=skg6UIxU/pMv3E9zD9o2TZGC4pkMoAHN4igM72YfWMA=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Br3i94UNE1nxGjm/iD1wRmibOZYJwpZrXROWm4IrNqZOJNXxltugNIpVI9wSNRBvmqdgctc5mhCFXJ0ZHr46t7cH691bDpK8WkmBG5ulTBSZdahbcK9T4NMuyTwYLZGI4vHA7mGTV4Y78P4vR9/duKmkVziCGhWC6bOvl+3uJSQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=JRzsexJD; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 49AHf3VG024126;
	Fri, 11 Oct 2024 00:07:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	0ZOt60nzqTKhSEbIxsqylHw856gJTMJM0gWwrXx4SQw=; b=JRzsexJDmtSemTvS
	FbGYNeF+46hg9yGSpA0VD6jW764aIPGK3QRtajdHRD3bpEJ66HPnGWJyfMzryhb5
	zgI4wZ9hZcM2rEcTYEC0q7m2ZGchbw073mRBfysYrk5MCfWdx9AxcMjfKp/rSXR9
	r+G9uqSZi9IpSEAUvuguQeGgrSeVvXFpr6QxRsuXLNLiLpte1W4bAsS7bFXDx8hx
	dlcIfpv93Cng6ptX08ZUjJSbId9qUiefWncqyA3/Ip+1+AF/ByzxR4AgH0vVBK67
	MtRfqDjspusXNxRFOMrsf3uqZ1WH2FHCdqe7083ZhwhIAfgH31skAIjLODUzvv6Q
	9It/5w==
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 426adhjdnr-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 11 Oct 2024 00:07:06 +0000 (GMT)
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com [10.47.209.197])
	by NALASPPMTA05.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 49B0751v015235
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 11 Oct 2024 00:07:05 GMT
Received: from hu-wcheng-lv.qualcomm.com (10.49.16.6) by
 nalasex01b.na.qualcomm.com (10.47.209.197) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Thu, 10 Oct 2024 17:07:04 -0700
From: Wesley Cheng <quic_wcheng@quicinc.com>
To: <srinivas.kandagatla@linaro.org>, <mathias.nyman@intel.com>,
        <perex@perex.cz>, <conor+dt@kernel.org>, <dmitry.torokhov@gmail.com>,
        <corbet@lwn.net>, <broonie@kernel.org>, <lgirdwood@gmail.com>,
        <tiwai@suse.com>, <krzk+dt@kernel.org>,
        <pierre-louis.bossart@linux.intel.com>, <Thinh.Nguyen@synopsys.com>,
        <bgoswami@quicinc.com>, <robh@kernel.org>,
        <gregkh@linuxfoundation.org>
CC: <linux-kernel@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-sound@vger.kernel.org>, <linux-input@vger.kernel.org>,
        <linux-usb@vger.kernel.org>, <linux-arm-msm@vger.kernel.org>,
        <linux-doc@vger.kernel.org>, <alsa-devel@alsa-project.org>,
        Mathias Nyman
	<mathias.nyman@linux.intel.com>,
        Wesley Cheng <quic_wcheng@quicinc.com>
Subject: [PATCH v28 04/33] xhci: sideband: add initial api to register a sideband entity
Date: Thu, 10 Oct 2024 17:05:53 -0700
Message-ID: <20241011000650.2585600-9-quic_wcheng@quicinc.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241011000650.2585600-1-quic_wcheng@quicinc.com>
References: <20241011000650.2585600-1-quic_wcheng@quicinc.com>
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
X-Proofpoint-GUID: FRoQ_YFIYdE7k3XOLypT-nYXBEOObcBC
X-Proofpoint-ORIG-GUID: FRoQ_YFIYdE7k3XOLypT-nYXBEOObcBC
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0
 mlxlogscore=999 clxscore=1015 mlxscore=0 impostorscore=0 phishscore=0
 bulkscore=0 lowpriorityscore=0 adultscore=0 suspectscore=0
 priorityscore=1501 spamscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.19.0-2409260000 definitions=main-2410100159

From: Mathias Nyman <mathias.nyman@linux.intel.com>

Introduce XHCI sideband, which manages the USB endpoints being requested by
a client driver.  This is used for when client drivers are attempting to
offload USB endpoints to another entity for handling USB transfers.  XHCI
sideband will allow for drivers to fetch the required information about the
transfer ring, so the user can submit transfers independently.  Expose the
required APIs for drivers to register and request for a USB endpoint and to
manage XHCI secondary interrupters.

Multiple ring segment page linking, proper endpoint clean up, and allowing
module compilation added by Wesley Cheng to complete original concept code
by Mathias Nyman.

Signed-off-by: Mathias Nyman <mathias.nyman@linux.intel.com>
Co-developed-by: Wesley Cheng <quic_wcheng@quicinc.com>
Signed-off-by: Wesley Cheng <quic_wcheng@quicinc.com>
---
 drivers/usb/host/Kconfig          |   9 +
 drivers/usb/host/Makefile         |   2 +
 drivers/usb/host/xhci-sideband.c  | 424 ++++++++++++++++++++++++++++++
 drivers/usb/host/xhci.h           |   4 +
 include/linux/usb/xhci-sideband.h |  70 +++++
 5 files changed, 509 insertions(+)
 create mode 100644 drivers/usb/host/xhci-sideband.c
 create mode 100644 include/linux/usb/xhci-sideband.h

diff --git a/drivers/usb/host/Kconfig b/drivers/usb/host/Kconfig
index 4448d0ab06f0..96659efa4be5 100644
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
index 000000000000..69bc234818d2
--- /dev/null
+++ b/drivers/usb/host/xhci-sideband.c
@@ -0,0 +1,424 @@
+// SPDX-License-Identifier: GPL-2.0
+
+/*
+ * xHCI host controller sideband support
+ *
+ * Copyright (c) 2023, Intel Corporation.
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
+	xhci_initialize_ring_info(ep->ring, 1);
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
+	if (!ep || !ep->sideband || ep->sideband != sb)
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
+				 bool ip_autoclear)
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
+						   num_seg);
+	if (!sb->ir) {
+		ret = -ENOMEM;
+		goto out;
+	}
+
+	sb->ir->ip_autoclear = ip_autoclear;
+	/* skip events for secondary interrupters by default */
+	sb->ir->skip_events = true;
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
+ * @udev: usb device to be accessed via sideband
+ *
+ * Allows for clients to utilize XHCI interrupters and fetch transfer and event
+ * ring parameters for executing data transfers.
+ *
+ * Return: pointer to a new xhci_sideband instance if successful. NULL otherwise.
+ */
+struct xhci_sideband *
+xhci_sideband_register(struct usb_device *udev)
+{
+	struct usb_hcd *hcd = bus_to_hcd(udev->bus);
+	struct xhci_hcd *xhci = hcd_to_xhci(hcd);
+	struct xhci_virt_device *vdev;
+	struct xhci_sideband *sb;
+
+	/* make sure the usb device is connected to a xhci controller */
+	if (!udev->slot_id)
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
index a6fbfc11fb1d..503784345787 100644
--- a/drivers/usb/host/xhci.h
+++ b/drivers/usb/host/xhci.h
@@ -693,6 +693,8 @@ struct xhci_virt_ep {
 	int			next_frame_id;
 	/* Use new Isoch TRB layout needed for extended TBC support */
 	bool			use_extended_tbc;
+	/* set if this endpoint is controlled via sideband access*/
+	struct xhci_sideband	*sideband;
 };
 
 enum xhci_overhead_type {
@@ -755,6 +757,8 @@ struct xhci_virt_device {
 	u16				current_mel;
 	/* Used for the debugfs interfaces. */
 	void				*debugfs_private;
+	/* set if this device is registered for sideband access */
+	struct xhci_sideband		*sideband;
 };
 
 /*
diff --git a/include/linux/usb/xhci-sideband.h b/include/linux/usb/xhci-sideband.h
new file mode 100644
index 000000000000..6c11e240fbca
--- /dev/null
+++ b/include/linux/usb/xhci-sideband.h
@@ -0,0 +1,70 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/*
+ * xHCI host controller sideband support
+ *
+ * Copyright (c) 2023, Intel Corporation.
+ *
+ * Author: Mathias Nyman <mathias.nyman@linux.intel.com>
+ */
+
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
+/**
+ * struct xhci_sideband - representation of a sideband accessed usb device.
+ * @xhci: The xhci host controller the usb device is connected to
+ * @vdev: the usb device accessed via sideband
+ * @eps: array of endpoints controlled via sideband
+ * @ir: event handling and buffer for sideband accessed device
+ * @mutex: mutex for sideband operations
+ *
+ * FIXME usb device accessed via sideband Keeping track of sideband accessed usb devices.
+ */
+
+struct xhci_sideband {
+	struct xhci_hcd                 *xhci;
+	struct xhci_virt_device         *vdev;
+	struct xhci_virt_ep             *eps[EP_CTX_PER_DEV];
+	struct xhci_interrupter         *ir;
+
+	/* Synchronizing xHCI sideband operations with client drivers operations */
+	struct mutex			mutex;
+};
+
+struct xhci_sideband *
+xhci_sideband_register(struct usb_device *udev);
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
+
+int
+xhci_sideband_create_interrupter(struct xhci_sideband *sb, int num_seg,
+				 bool ip_autoclear);
+
+void
+xhci_sideband_remove_interrupter(struct xhci_sideband *sb);
+
+int
+xhci_sideband_interrupter_id(struct xhci_sideband *sb);
+
+#endif /* __LINUX_XHCI_SIDEBAND_H */

