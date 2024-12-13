Return-Path: <linux-input+bounces-8557-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 678EC9F1AAB
	for <lists+linux-input@lfdr.de>; Sat, 14 Dec 2024 00:58:35 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 7C36216418B
	for <lists+linux-input@lfdr.de>; Fri, 13 Dec 2024 23:58:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2E7751F7072;
	Fri, 13 Dec 2024 23:54:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="KKVtvS2d"
X-Original-To: linux-input@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B984E1F37C9;
	Fri, 13 Dec 2024 23:54:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734134081; cv=none; b=EadNqhIJj7tLgQjsWRw7ORKS0QJfNFl/CicJG6yDr9xBbSvyqWC2S+ThkTgINCzd/1ET2urH9AnDvDuiMkvgv2t6dV9sMWyDYzyNVoj8AnxfM4kNsq7BvBAkHsfm6v4i7dqD9le4xWH9VamQATJVbOZhXn8WXZ115f8ywHsGbso=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734134081; c=relaxed/simple;
	bh=JoXbEiTskMsM77I9de1ldeQr4l1/yuobNPsEZwk5Dbc=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=DAxzTQh/5/MIoMKwfxh6oL4QZqgteYkkz48LCAOmAzA6T7VyS+pZNrxHmIJP9hWEiC9bFtppJNIyqL6pz/i5A0YY73Z1p7gvgLB0XWvK3OWJI8DZ72NJOtzRE/WzhUEpg67ROvJlAu5Yt2wAIJ2XRe6wYOULIYu2mXmEccUr6v8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=KKVtvS2d; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4BDJ8QqH022112;
	Fri, 13 Dec 2024 23:54:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	whJIBzfo2yeTF1wYbqlZNxJqsLiTNYoEgb9xPCGTO7Y=; b=KKVtvS2duuW4FAUb
	r0n/KlDRteSKp/kFyIMErCeRc8dCBjAIRraszuBHYqMZ6bdFAKLkIcJNIRrFBfsP
	z/btb2nT5YY/MabuhkDweJ8EJhMHiQvwz95nkRep6e2b46poyLj3p2P7hYX+evrU
	AxT0gmACEhm4Eg9Q9hyWScoZPRyJ59O/NVNKXJHlHPv0imW9uY2HkqmYplimic06
	Z9pJX3soRSa9kWnELtVv5+iN9T48LDULPygM5KCBJlTwcXJUrzDfwmIhbHrEr/7T
	9OQViYOtw4Bs+DtWNgkj13yfSWZoe9tWFnFpXDDOgq3345qScn9k6RcZF/4u0YQ7
	7amnjw==
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 43gh2728fe-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 13 Dec 2024 23:54:15 +0000 (GMT)
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com [10.47.209.197])
	by NALASPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 4BDNsEUC015732
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 13 Dec 2024 23:54:14 GMT
Received: from hu-wcheng-lv.qualcomm.com (10.49.16.6) by
 nalasex01b.na.qualcomm.com (10.47.209.197) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Fri, 13 Dec 2024 15:54:14 -0800
From: Wesley Cheng <quic_wcheng@quicinc.com>
To: <srinivas.kandagatla@linaro.org>, <mathias.nyman@intel.com>,
        <perex@perex.cz>, <conor+dt@kernel.org>, <dmitry.torokhov@gmail.com>,
        <corbet@lwn.net>, <broonie@kernel.org>, <lgirdwood@gmail.com>,
        <tiwai@suse.com>, <krzk+dt@kernel.org>,
        <pierre-louis.bossart@linux.dev>, <Thinh.Nguyen@synopsys.com>,
        <robh@kernel.org>, <gregkh@linuxfoundation.org>
CC: <linux-kernel@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-sound@vger.kernel.org>, <linux-input@vger.kernel.org>,
        <linux-usb@vger.kernel.org>, <linux-arm-msm@vger.kernel.org>,
        <linux-doc@vger.kernel.org>,
        Mathias Nyman <mathias.nyman@linux.intel.com>,
        Wesley Cheng <quic_wcheng@quicinc.com>
Subject: [PATCH v31 02/32] xhci: sideband: add initial api to register a secondary interrupter entity
Date: Fri, 13 Dec 2024 15:53:33 -0800
Message-ID: <20241213235403.4109199-3-quic_wcheng@quicinc.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241213235403.4109199-1-quic_wcheng@quicinc.com>
References: <20241213235403.4109199-1-quic_wcheng@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: nalasex01a.na.qualcomm.com (10.47.209.196) To
 nalasex01b.na.qualcomm.com (10.47.209.197)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: gLPvm3t8FcNImvsJo3nkV1aL1Q4cS5yC
X-Proofpoint-GUID: gLPvm3t8FcNImvsJo3nkV1aL1Q4cS5yC
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 malwarescore=0
 priorityscore=1501 spamscore=0 mlxlogscore=999 impostorscore=0
 suspectscore=0 phishscore=0 lowpriorityscore=0 bulkscore=0 adultscore=0
 clxscore=1015 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2412130170

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
 drivers/usb/host/Kconfig          |   9 +
 drivers/usb/host/Makefile         |   2 +
 drivers/usb/host/xhci-sideband.c  | 431 ++++++++++++++++++++++++++++++
 drivers/usb/host/xhci.h           |   4 +
 include/linux/usb/xhci-sideband.h |  73 +++++
 5 files changed, 519 insertions(+)
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
index 000000000000..821b015af9bb
--- /dev/null
+++ b/drivers/usb/host/xhci-sideband.c
@@ -0,0 +1,431 @@
+// SPDX-License-Identifier: GPL-2.0
+
+/*
+ * xHCI host controller sideband support
+ *
+ * Copyright (c) 2023-2024, Intel Corporation.
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
index 5edd276bb9e0..e78648c39b1e 100644
--- a/drivers/usb/host/xhci.h
+++ b/drivers/usb/host/xhci.h
@@ -696,6 +696,8 @@ struct xhci_virt_ep {
 	int			next_frame_id;
 	/* Use new Isoch TRB layout needed for extended TBC support */
 	bool			use_extended_tbc;
+	/* set if this endpoint is controlled via sideband access*/
+	struct xhci_sideband	*sideband;
 };
 
 enum xhci_overhead_type {
@@ -758,6 +760,8 @@ struct xhci_virt_device {
 	u16				current_mel;
 	/* Used for the debugfs interfaces. */
 	void				*debugfs_private;
+	/* set if this endpoint is controlled via sideband access*/
+	struct xhci_sideband	*sideband;
 };
 
 /*
diff --git a/include/linux/usb/xhci-sideband.h b/include/linux/usb/xhci-sideband.h
new file mode 100644
index 000000000000..04c4ba604266
--- /dev/null
+++ b/include/linux/usb/xhci-sideband.h
@@ -0,0 +1,73 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/*
+ * xHCI host controller sideband support
+ *
+ * Copyright (c) 2023-2024, Intel Corporation.
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

