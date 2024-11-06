Return-Path: <linux-input+bounces-7913-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F11A9BF6D6
	for <lists+linux-input@lfdr.de>; Wed,  6 Nov 2024 20:38:02 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 31C871C2457E
	for <lists+linux-input@lfdr.de>; Wed,  6 Nov 2024 19:38:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 71FCD20E32D;
	Wed,  6 Nov 2024 19:34:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="C3eY1Mhs"
X-Original-To: linux-input@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C54A20C327;
	Wed,  6 Nov 2024 19:34:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730921692; cv=none; b=SkZlN2IUmLsZyiMyZIlKBWUwxQBPuHPuevnzdvGJuMBbmrHe4jezKQUkD6H3WWRIV3KzygpUEbftKodCNpYK19Wx8WzkSyDphaWlp7hS1Xdb63AeWg6oof1JZ+AsOZ0t7yvIWWSOurlEXX+kyLy2sR5VRDgFlNeAK4gv2iGoMXY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730921692; c=relaxed/simple;
	bh=laVScmsW6CVoKvh/TcWDw+CWsb55H4jEgaVpghUAmEA=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=RLGIJReFpwrYYOC9QsYa7mGeebiM/1nnx5PBdEvJIz7DJqdL80Qi3paNzPkCFLGXvftioj/4iqwYZ+g0riiuEb50+lvFGcqUn3Tm4q5EpExS2hNs3YA8JG2MQ1MPQJv1B1gZGl0oCVhS1oj8Zsk/FCrjXyfjLR67voGdfLKQsKw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=C3eY1Mhs; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4A6Fc1wQ006933;
	Wed, 6 Nov 2024 19:34:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	7XMyWIyAjG0dyYiXJF85kAHL0Q6noKknyTQb8vOivmE=; b=C3eY1MhsH1X4PkTx
	AiCrZjC4oPDp9T51tEmE27lepe/2QUXdrFZGtmWIv6sCgbcXPiVHFeF81026iDrl
	bT88+nXMKMLej1B5Io4TGTwM6PBcJ5duWPNRq6gt90y9z5+xmidPOaBCko1OjaYA
	KtkR2jFZRgGMvltap/mLL8Kip94cDHLyhbTqfBQgPVQFp758U8OVHpu61nU5FbGk
	4PBkqqeHkCqKn3LhabDTGPpwodbHANe3t2h4VpuzAhwTme9xdQ2WdfqPsUPpN+Wx
	mW5qspZy6j2iMNiLK/rv34fOyVaLjP5dRTkF23xY7jxY3tq9yAruOLSrBFr8m5NQ
	KnpjoA==
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 42r07hjg8x-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 06 Nov 2024 19:34:31 +0000 (GMT)
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com [10.47.209.197])
	by NALASPPMTA05.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 4A6JYTOJ027625
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 6 Nov 2024 19:34:29 GMT
Received: from hu-wcheng-lv.qualcomm.com (10.49.16.6) by
 nalasex01b.na.qualcomm.com (10.47.209.197) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Wed, 6 Nov 2024 11:34:29 -0800
From: Wesley Cheng <quic_wcheng@quicinc.com>
To: <srinivas.kandagatla@linaro.org>, <mathias.nyman@intel.com>,
        <perex@perex.cz>, <conor+dt@kernel.org>, <dmitry.torokhov@gmail.com>,
        <corbet@lwn.net>, <broonie@kernel.org>, <lgirdwood@gmail.com>,
        <krzk+dt@kernel.org>, <pierre-louis.bossart@linux.intel.com>,
        <Thinh.Nguyen@synopsys.com>, <tiwai@suse.com>, <robh@kernel.org>,
        <gregkh@linuxfoundation.org>
CC: <linux-kernel@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-sound@vger.kernel.org>, <linux-usb@vger.kernel.org>,
        <linux-input@vger.kernel.org>, <linux-arm-msm@vger.kernel.org>,
        <linux-doc@vger.kernel.org>,
        Mathias Nyman <mathias.nyman@linux.intel.com>,
        Wesley Cheng <quic_wcheng@quicinc.com>
Subject: [PATCH v30 02/30] xhci: sec-intr: add initial api to register a secondary interrupter entity
Date: Wed, 6 Nov 2024 11:33:45 -0800
Message-ID: <20241106193413.1730413-3-quic_wcheng@quicinc.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241106193413.1730413-1-quic_wcheng@quicinc.com>
References: <20241106193413.1730413-1-quic_wcheng@quicinc.com>
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
X-Proofpoint-GUID: Gup-w5hh67QTmfnu5Ob-flyUJXegeQav
X-Proofpoint-ORIG-GUID: Gup-w5hh67QTmfnu5Ob-flyUJXegeQav
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015 impostorscore=0
 mlxlogscore=999 malwarescore=0 phishscore=0 adultscore=0 mlxscore=0
 spamscore=0 bulkscore=0 lowpriorityscore=0 priorityscore=1501
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2409260000 definitions=main-2411060149

From: Mathias Nyman <mathias.nyman@linux.intel.com>

Introduce XHCI sec intr, which manages the USB endpoints being requested by
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
 drivers/usb/host/Kconfig          |  11 +
 drivers/usb/host/Makefile         |   2 +
 drivers/usb/host/xhci-sec-intr.c  | 438 ++++++++++++++++++++++++++++++
 drivers/usb/host/xhci.h           |   4 +
 include/linux/usb/xhci-sec-intr.h |  70 +++++
 5 files changed, 525 insertions(+)
 create mode 100644 drivers/usb/host/xhci-sec-intr.c
 create mode 100644 include/linux/usb/xhci-sec-intr.h

diff --git a/drivers/usb/host/Kconfig b/drivers/usb/host/Kconfig
index d011d6c753ed..a2d549e3e076 100644
--- a/drivers/usb/host/Kconfig
+++ b/drivers/usb/host/Kconfig
@@ -104,6 +104,17 @@ config USB_XHCI_RZV2M
 	  Say 'Y' to enable the support for the xHCI host controller
 	  found in Renesas RZ/V2M SoC.
 
+config USB_XHCI_SEC_INTR
+	tristate "xHCI support for secondary interrupter management"
+	help
+	  Say 'Y' to enable the support for the xHCI secondary management.
+	  Provide a mechanism for a sideband datapath for payload associated
+	  with audio class endpoints. This allows for an audio DSP to use
+	  xHCI USB endpoints directly, allowing CPU to sleep while playing
+	  audio.  This is not the same feature as the audio sideband
+	  capability mentioned within the xHCI specification, and continues
+	  to utilize main system memory for data transfers.
+
 config USB_XHCI_TEGRA
 	tristate "xHCI support for NVIDIA Tegra SoCs"
 	depends on PHY_TEGRA_XUSB
diff --git a/drivers/usb/host/Makefile b/drivers/usb/host/Makefile
index be4e5245c52f..d4b127f48cf9 100644
--- a/drivers/usb/host/Makefile
+++ b/drivers/usb/host/Makefile
@@ -32,6 +32,8 @@ endif
 xhci-rcar-hcd-y				+= xhci-rcar.o
 xhci-rcar-hcd-$(CONFIG_USB_XHCI_RZV2M)	+= xhci-rzv2m.o
 
+obj-$(CONFIG_USB_XHCI_SEC_INTR) += xhci-sec-intr.o
+
 obj-$(CONFIG_USB_PCI)	+= pci-quirks.o
 
 obj-$(CONFIG_USB_EHCI_HCD)	+= ehci-hcd.o
diff --git a/drivers/usb/host/xhci-sec-intr.c b/drivers/usb/host/xhci-sec-intr.c
new file mode 100644
index 000000000000..b112c3388368
--- /dev/null
+++ b/drivers/usb/host/xhci-sec-intr.c
@@ -0,0 +1,438 @@
+// SPDX-License-Identifier: GPL-2.0
+
+/*
+ * xHCI host controller secondary interrupter management
+ *
+ * Provides logic for client drivers that support utilizing xHCI secondary
+ * interrupters.
+ *
+ * Copyright (c) 2023-2024, Intel Corporation.
+ *
+ * Author: Mathias Nyman
+ */
+
+#include <linux/usb/xhci-sec-intr.h>
+#include <linux/dma-direct.h>
+
+#include "xhci.h"
+
+/* internal helpers */
+static struct sg_table *
+xhci_ring_to_sgtable(struct xhci_sec_intr *si, struct xhci_ring *ring)
+{
+	struct xhci_segment *seg;
+	struct sg_table	*sgt;
+	unsigned int n_pages;
+	struct page **pages;
+	struct device *dev;
+	size_t sz;
+	int i;
+
+	dev = xhci_to_hcd(si->xhci)->self.sysdev;
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
+__xhci_sec_intr_remove_endpoint(struct xhci_sec_intr *si, struct xhci_virt_ep *ep)
+{
+	/*
+	 * Issue a stop endpoint command when an endpoint is removed.
+	 * The stop ep cmd handler will handle the ring cleanup.
+	 */
+	xhci_stop_endpoint_sync(si->xhci, ep, 0, GFP_KERNEL);
+
+	ep->sec = NULL;
+	si->eps[ep->ep_index] = NULL;
+}
+
+/* endpoint api functions */
+
+/**
+ * xhci_sec_intr_add_endpoint - add endpoint to access list
+ * @si: secondary interrupter instance for this usb device
+ * @host_ep: usb host endpoint
+ *
+ * Adds an endpoint to the list of endpoints utilizing secondary interrupters
+ * for this usb device.
+ * After an endpoint is added the client can get the endpoint transfer ring
+ * buffer by calling xhci_sec_intr_get_endpoint_buffer()
+ *
+ * Return: 0 on success, negative error otherwise.
+ */
+int
+xhci_sec_intr_add_endpoint(struct xhci_sec_intr *si,
+			   struct usb_host_endpoint *host_ep)
+{
+	struct xhci_virt_ep *ep;
+	unsigned int ep_index;
+
+	mutex_lock(&si->mutex);
+	ep_index = xhci_get_endpoint_index(&host_ep->desc);
+	ep = &si->vdev->eps[ep_index];
+
+	if (ep->ep_state & EP_HAS_STREAMS) {
+		mutex_unlock(&si->mutex);
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
+	if (si->eps[ep_index] || ep->sec) {
+		mutex_unlock(&si->mutex);
+		return -EBUSY;
+	}
+
+	ep->sec = si;
+	si->eps[ep_index] = ep;
+	mutex_unlock(&si->mutex);
+
+	return 0;
+}
+EXPORT_SYMBOL_GPL(xhci_sec_intr_add_endpoint);
+
+/**
+ * xhci_sec_intr_remove_endpoint - remove endpoint from access list
+ * @si: secondary interrupter instance for this usb device
+ * @host_ep: usb host endpoint
+ *
+ * Removes an endpoint from the list of endpoints utilizing secondary
+ * interrupters for this usb device.
+ * Clients should no longer touch the endpoint transfer buffer after
+ * calling this.
+ *
+ * Return: 0 on success, negative error otherwise.
+ */
+int
+xhci_sec_intr_remove_endpoint(struct xhci_sec_intr *si,
+			      struct usb_host_endpoint *host_ep)
+{
+	struct xhci_virt_ep *ep;
+	unsigned int ep_index;
+
+	mutex_lock(&si->mutex);
+	ep_index = xhci_get_endpoint_index(&host_ep->desc);
+	ep = si->eps[ep_index];
+
+	if (!ep || !ep->sec || ep->sec != si) {
+		mutex_unlock(&si->mutex);
+		return -ENODEV;
+	}
+
+	__xhci_sec_intr_remove_endpoint(si, ep);
+	xhci_initialize_ring_info(ep->ring, 1);
+	mutex_unlock(&si->mutex);
+
+	return 0;
+}
+EXPORT_SYMBOL_GPL(xhci_sec_intr_remove_endpoint);
+
+/**
+ * xhci_sec_intr_stop_endpoint - stops a client managed endpoint
+ * @si: secondary interrupter instance for this usb device
+ * @host_ep: usb host endpoint
+ *
+ * Issue a synchronous stop endpoint command to halt any data transfers
+ * occurring.  This also is required before the xHCI controller enters
+ * suspend.
+ *
+ * Return: 0 on success, and negative on failure.
+ */
+int
+xhci_sec_intr_stop_endpoint(struct xhci_sec_intr *si,
+			    struct usb_host_endpoint *host_ep)
+{
+	struct xhci_virt_ep *ep;
+	unsigned int ep_index;
+
+	ep_index = xhci_get_endpoint_index(&host_ep->desc);
+	ep = si->eps[ep_index];
+
+	if (!ep || !ep->sec || ep->sec != si)
+		return -EINVAL;
+
+	return xhci_stop_endpoint_sync(si->xhci, ep, 0, GFP_KERNEL);
+}
+EXPORT_SYMBOL_GPL(xhci_sec_intr_stop_endpoint);
+
+/**
+ * xhci_sec_intr_get_endpoint_buffer - gets the endpoint transfer buffer address
+ * @si: secondary interrupter instance for this usb device
+ * @host_ep: usb host endpoint
+ *
+ * Returns the address of the endpoint buffer where xHC controller reads queued
+ * transfer TRBs from. This is the starting address of the ringbuffer where the
+ * client should write TRBs to.
+ *
+ * Caller needs to free the returned sg_table
+ *
+ * Return: struct sg_table * if successful. NULL otherwise.
+ */
+struct sg_table *
+xhci_sec_intr_get_endpoint_buffer(struct xhci_sec_intr *si,
+				  struct usb_host_endpoint *host_ep)
+{
+	struct xhci_virt_ep *ep;
+	unsigned int ep_index;
+
+	ep_index = xhci_get_endpoint_index(&host_ep->desc);
+	ep = si->eps[ep_index];
+
+	if (!ep || !ep->sec || ep->sec != si)
+		return NULL;
+
+	return xhci_ring_to_sgtable(si, ep->ring);
+}
+EXPORT_SYMBOL_GPL(xhci_sec_intr_get_endpoint_buffer);
+
+/**
+ * xhci_sec_intr_get_event_buffer - return the event buffer for this device
+ * @si: secondary interrupter instance for this usb device
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
+xhci_sec_intr_get_event_buffer(struct xhci_sec_intr *si)
+{
+	if (!si || !si->ir)
+		return NULL;
+
+	return xhci_ring_to_sgtable(si, si->ir->event_ring);
+}
+EXPORT_SYMBOL_GPL(xhci_sec_intr_get_event_buffer);
+
+/**
+ * xhci_sec_intr_create_interrupter - creates a new interrupter
+ * @si: secondary interrupter instance for this usb device
+ * @num_seg: number of event ring segments to allocate
+ * @ip_autoclear: IP autoclearing support such as MSI implemented
+ *
+ * Sets up a xhci interrupter that can be used for this sideband accessed usb
+ * device. Transfer events for this device can be routed to this interrupters
+ * event ring by setting the 'Interrupter Target' field correctly when queueing
+ * the transfer TRBs.
+ * Once this interrupter is created the interrupter target ID can be obtained
+ * by calling xhci_sec_intr_interrupter_id()
+ *
+ * Returns 0 on success, negative error otherwise
+ */
+int
+xhci_sec_intr_create_interrupter(struct xhci_sec_intr *si, int num_seg,
+				 bool ip_autoclear, u32 imod_interval)
+{
+	int ret = 0;
+
+	if (!si || !si->xhci)
+		return -ENODEV;
+
+	mutex_lock(&si->mutex);
+	if (si->ir) {
+		ret = -EBUSY;
+		goto out;
+	}
+
+	si->ir = xhci_create_secondary_interrupter(xhci_to_hcd(si->xhci),
+						   num_seg, imod_interval);
+	if (!si->ir) {
+		ret = -ENOMEM;
+		goto out;
+	}
+
+	si->ir->ip_autoclear = ip_autoclear;
+	/* skip events for secondary interrupters by default */
+	si->ir->skip_events = true;
+
+out:
+	mutex_unlock(&si->mutex);
+
+	return ret;
+}
+EXPORT_SYMBOL_GPL(xhci_sec_intr_create_interrupter);
+
+/**
+ * xhci_sec_intr_remove_interrupter - remove the secondary interrupter for a device
+ * @si: secondary interrupter instance for this usb device
+ *
+ * Removes a registered interrupter for a usb device.  This would allow for other
+ * users to utilize this interrupter.
+ */
+void
+xhci_sec_intr_remove_interrupter(struct xhci_sec_intr *si)
+{
+	if (!si || !si->ir)
+		return;
+
+	mutex_lock(&si->mutex);
+	xhci_remove_secondary_interrupter(xhci_to_hcd(si->xhci), si->ir);
+
+	si->ir = NULL;
+	mutex_unlock(&si->mutex);
+}
+EXPORT_SYMBOL_GPL(xhci_sec_intr_remove_interrupter);
+
+/**
+ * xhci_sec_intr_interrupter_id - return the interrupter target id
+ * @si: secondary interrupter instance for this usb device
+ *
+ * If a secondary xhci interrupter is set up for this usb device then this
+ * function returns the ID used by the interrupter. The client needs
+ * to write this ID to the 'Interrupter Target' field of the transfer TRBs
+ * it queues on the endpoints transfer ring to ensure transfer completion event
+ * are written by xHC to the correct interrupter event ring.
+ *
+ * Returns interrupter id on success, negative error otherwise
+ */
+int
+xhci_sec_intr_interrupter_id(struct xhci_sec_intr *si)
+{
+	if (!si || !si->ir)
+		return -ENODEV;
+
+	return si->ir->intr_num;
+}
+EXPORT_SYMBOL_GPL(xhci_sec_intr_interrupter_id);
+
+/**
+ * xhci_sec_intr_register - register a secondary interrupter for a usb device
+ * @udev: usb device to be accessed via sideband
+ *
+ * Allows for clients to utilize XHCI interrupters and fetch transfer and event
+ * ring parameters for executing data transfers.
+ *
+ * Return: pointer to a new xhci_sec_intr instance if successful. NULL otherwise.
+ */
+struct xhci_sec_intr *
+xhci_sec_intr_register(struct usb_device *udev)
+{
+	struct usb_hcd *hcd = bus_to_hcd(udev->bus);
+	struct xhci_hcd *xhci = hcd_to_xhci(hcd);
+	struct xhci_virt_device *vdev;
+	struct xhci_sec_intr *si;
+
+	/* make sure the usb device is connected to a xhci controller */
+	if (!udev->slot_id)
+		return NULL;
+
+	si = kzalloc_node(sizeof(*si), GFP_KERNEL, dev_to_node(hcd->self.sysdev));
+	if (!si)
+		return NULL;
+
+	mutex_init(&si->mutex);
+
+	/* check this device isn't already controlled via sideband */
+	spin_lock_irq(&xhci->lock);
+
+	vdev = xhci->devs[udev->slot_id];
+
+	if (!vdev || vdev->sec) {
+		xhci_warn(xhci, "XHCI sideband for slot %d already in use\n",
+			  udev->slot_id);
+		spin_unlock_irq(&xhci->lock);
+		kfree(si);
+		return NULL;
+	}
+
+	si->xhci = xhci;
+	si->vdev = vdev;
+	vdev->sec = si;
+
+	spin_unlock_irq(&xhci->lock);
+
+	return si;
+}
+EXPORT_SYMBOL_GPL(xhci_sec_intr_register);
+
+/**
+ * xhci_sec_intr_unregister - unregister secondary interrupter for a usb device
+ * @si: secondary interrupter instance to be unregistered
+ *
+ * Unregisters sideband access to a usb device and frees the secondary interrupter
+ * instance.
+ * After this the endpoint and interrupter event buffers should no longer
+ * be accessed via sideband. The xhci driver can now take over handling
+ * the buffers.
+ */
+void
+xhci_sec_intr_unregister(struct xhci_sec_intr *si)
+{
+	struct xhci_hcd *xhci;
+	int i;
+
+	if (!si)
+		return;
+
+	xhci = si->xhci;
+
+	mutex_lock(&si->mutex);
+	for (i = 0; i < EP_CTX_PER_DEV; i++)
+		if (si->eps[i])
+			__xhci_sec_intr_remove_endpoint(si, si->eps[i]);
+	mutex_unlock(&si->mutex);
+
+	xhci_sec_intr_remove_interrupter(si);
+
+	spin_lock_irq(&xhci->lock);
+	si->xhci = NULL;
+	si->vdev->sec = NULL;
+	spin_unlock_irq(&xhci->lock);
+
+	kfree(si);
+}
+EXPORT_SYMBOL_GPL(xhci_sec_intr_unregister);
+MODULE_DESCRIPTION("xHCI sideband driver for secondary interrupter management");
+MODULE_LICENSE("GPL");
diff --git a/drivers/usb/host/xhci.h b/drivers/usb/host/xhci.h
index 92cde885acd3..4a6ca048a14c 100644
--- a/drivers/usb/host/xhci.h
+++ b/drivers/usb/host/xhci.h
@@ -694,6 +694,8 @@ struct xhci_virt_ep {
 	int			next_frame_id;
 	/* Use new Isoch TRB layout needed for extended TBC support */
 	bool			use_extended_tbc;
+	/* set if this endpoint is controlled via sideband access*/
+	struct xhci_sec_intr	*sec;
 };
 
 enum xhci_overhead_type {
@@ -756,6 +758,8 @@ struct xhci_virt_device {
 	u16				current_mel;
 	/* Used for the debugfs interfaces. */
 	void				*debugfs_private;
+	/* set if this device is registered for sideband access */
+	struct xhci_sec_intr		*sec;
 };
 
 /*
diff --git a/include/linux/usb/xhci-sec-intr.h b/include/linux/usb/xhci-sec-intr.h
new file mode 100644
index 000000000000..f6edb27b1d99
--- /dev/null
+++ b/include/linux/usb/xhci-sec-intr.h
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
+#ifndef __LINUX_XHCI_SEC_INTR_H
+#define __LINUX_XHCI_SEC_INTR_H
+
+#include <linux/scatterlist.h>
+#include <linux/usb.h>
+
+#define	EP_CTX_PER_DEV		31	/* FIXME defined twice, from xhci.h */
+
+struct xhci_sec_intr;
+
+/**
+ * struct xhci_sec_intr - representation of a sideband accessed usb device.
+ * @xhci: The xhci host controller the usb device is connected to
+ * @vdev: the usb device accessed via sideband
+ * @eps: array of endpoints controlled via sideband
+ * @ir: event handling and buffer for sideband accessed device
+ * @mutex: mutex for sideband operations
+ *
+ * FIXME usb device accessed via sideband Keeping track of sideband accessed usb devices.
+ */
+
+struct xhci_sec_intr {
+	struct xhci_hcd                 *xhci;
+	struct xhci_virt_device         *vdev;
+	struct xhci_virt_ep             *eps[EP_CTX_PER_DEV];
+	struct xhci_interrupter         *ir;
+
+	/* Synchronizing xHCI sec intr operations with client drivers operations */
+	struct mutex			mutex;
+};
+
+struct xhci_sec_intr *
+xhci_sec_intr_register(struct usb_device *udev);
+void
+xhci_sec_intr_unregister(struct xhci_sec_intr *si);
+int
+xhci_sec_intr_add_endpoint(struct xhci_sec_intr *si,
+			   struct usb_host_endpoint *host_ep);
+int
+xhci_sec_intr_remove_endpoint(struct xhci_sec_intr *si,
+			      struct usb_host_endpoint *host_ep);
+int
+xhci_sec_intr_stop_endpoint(struct xhci_sec_intr *si,
+			    struct usb_host_endpoint *host_ep);
+struct sg_table *
+xhci_sec_intr_get_endpoint_buffer(struct xhci_sec_intr *si,
+				  struct usb_host_endpoint *host_ep);
+struct sg_table *
+xhci_sec_intr_get_event_buffer(struct xhci_sec_intr *si);
+
+int
+xhci_sec_intr_create_interrupter(struct xhci_sec_intr *si, int num_seg,
+				 bool ip_autoclear, u32 imod_interval);
+
+void
+xhci_sec_intr_remove_interrupter(struct xhci_sec_intr *si);
+
+int
+xhci_sec_intr_interrupter_id(struct xhci_sec_intr *si);
+
+#endif /* __LINUX_XHCI_SIDEBAND_H */

