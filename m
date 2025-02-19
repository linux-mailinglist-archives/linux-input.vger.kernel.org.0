Return-Path: <linux-input+bounces-10176-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 5BB57A3ADE3
	for <lists+linux-input@lfdr.de>; Wed, 19 Feb 2025 01:54:07 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 9B148165B90
	for <lists+linux-input@lfdr.de>; Wed, 19 Feb 2025 00:53:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DD4DD1C7019;
	Wed, 19 Feb 2025 00:48:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="DwXGZRiz"
X-Original-To: linux-input@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD26C1DA4E;
	Wed, 19 Feb 2025 00:48:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739926113; cv=none; b=KUL6aYdBXD2IvTx5Vsa4ACGOOqS6FIm/K96HymDX/fYWk9roWLDgiQO1ReaMEKUz1577cOgAUJW72Uewe6pwjAgJNNSeQAAC8MYBC/DBGTHhe0OZXMFpseNP71eMIkS0W6eul2AI7X/qXomSiTvmhT8PGxaTMVbKIY4BTCPDhrQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739926113; c=relaxed/simple;
	bh=/Veh1ottXNpu4DDFV4Cyc6jCUNUbPmhO2SvxeMtlgTo=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=RmK+HvGPua7T3xFgmHpplSlBXHbe+G9brcwEB9KQC53g/nDNGtsb21WtGEDU+i7qS39m/IO8gnfzZUfnVj0XvB2aTxnnqY8vlzQt7lQUWfc2Q1zyLcK9YQClDmkX9jfVMk8yz0mVR3AgHct5DBMQbhEFdp3R6k4ZEO2kLlWvCU8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=DwXGZRiz; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 51IIx1KP011183;
	Wed, 19 Feb 2025 00:48:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	t1SCDgqvsr9YQFBGd5Qayz/Po0G4z4WaDMw/sfwou1Q=; b=DwXGZRizD3QlcqVm
	1gMhvAuJWECYmHJcw1QvZ0iD6n8YYi39cmIu6sIP/mfdo+elgkqSqb1zXyHjgY7H
	CFIlmV/qUSZf8hx+nJ8TEW+NLXZV4ZLEOyll1G4wH2dVwTyf4eOMUOw/jvVWDEws
	Z+YzO6Kcb7RfYJLVtGRR3nf7r8RDhjTZOe+7pi5ISQMjmKEZUW6CViHL9XZlPKot
	FviPb4wapNiREVwLGslgDGf6BfZb7Uj6cKfuKTjnCOKS/PsryTniIZjMnVqnhk3R
	0NPm1dtfSIMXKDAoKD64L6TQtUOYD55hT9iT8lF4pp2ya5ELD9xpJoP+4ILl0Ash
	Um6thA==
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 44vyy1rqen-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 19 Feb 2025 00:48:07 +0000 (GMT)
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com [10.47.209.197])
	by NALASPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 51J0m6q3028815
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 19 Feb 2025 00:48:06 GMT
Received: from hu-wcheng-lv.qualcomm.com (10.49.16.6) by
 nalasex01b.na.qualcomm.com (10.47.209.197) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Tue, 18 Feb 2025 16:48:05 -0800
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
        <linux-doc@vger.kernel.org>, Wesley Cheng <quic_wcheng@quicinc.com>
Subject: [PATCH v35 05/31] usb: host: xhci: Notify xHCI sideband on transfer ring free
Date: Tue, 18 Feb 2025 16:47:28 -0800
Message-ID: <20250219004754.497985-6-quic_wcheng@quicinc.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250219004754.497985-1-quic_wcheng@quicinc.com>
References: <20250219004754.497985-1-quic_wcheng@quicinc.com>
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
X-Proofpoint-GUID: bDpvhcxK520-ueTMWxJIlPhrVo9f8rHd
X-Proofpoint-ORIG-GUID: bDpvhcxK520-ueTMWxJIlPhrVo9f8rHd
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-18_11,2025-02-18_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015 adultscore=0
 bulkscore=0 phishscore=0 suspectscore=0 malwarescore=0 spamscore=0
 priorityscore=1501 impostorscore=0 lowpriorityscore=0 mlxscore=0
 mlxlogscore=875 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2502100000 definitions=main-2502190004

In the case of handling a USB bus reset, the xhci_discover_or_reset_device
can run without first notifying the xHCI sideband client driver to stop or
prevent the use of the transfer ring.  It was seen that when a bus reset
situation happened, the USB offload driver was attempting to fetch the xHCI
transfer ring information, which was already freed.

Signed-off-by: Wesley Cheng <quic_wcheng@quicinc.com>
---
 drivers/usb/host/xhci-sideband.c  | 29 ++++++++++++++++++++++++++++-
 drivers/usb/host/xhci.c           |  3 +++
 include/linux/usb/xhci-sideband.h | 30 +++++++++++++++++++++++++++++-
 3 files changed, 60 insertions(+), 2 deletions(-)

diff --git a/drivers/usb/host/xhci-sideband.c b/drivers/usb/host/xhci-sideband.c
index 742bbc6c2d9b..d49f9886dd84 100644
--- a/drivers/usb/host/xhci-sideband.c
+++ b/drivers/usb/host/xhci-sideband.c
@@ -88,6 +88,30 @@ __xhci_sideband_remove_endpoint(struct xhci_sideband *sb, struct xhci_virt_ep *e
 
 /* sideband api functions */
 
+/**
+ * xhci_sideband_notify_ep_ring_free - notify client of xfer ring free
+ * @sb: sideband instance for this usb device
+ * @ep_index: usb endpoint index
+ *
+ * Notifies the xHCI sideband client driver of a xHCI transfer ring free
+ * routine.  This will allow for the client to ensure that all transfers
+ * are completed.
+ *
+ * The callback should be synchronous, as the ring free happens after.
+ */
+void xhci_sideband_notify_ep_ring_free(struct xhci_sideband *sb,
+				       unsigned int ep_index)
+{
+	struct xhci_sideband_event evt;
+
+	evt.type = XHCI_SIDEBAND_XFER_RING_FREE;
+	evt.evt_data = &ep_index;
+
+	if (sb->notify_client)
+		sb->notify_client(sb->intf, &evt);
+}
+EXPORT_SYMBOL_GPL(xhci_sideband_notify_ep_ring_free);
+
 /**
  * xhci_sideband_add_endpoint - add endpoint to sideband access list
  * @sb: sideband instance for this usb device
@@ -342,7 +366,9 @@ EXPORT_SYMBOL_GPL(xhci_sideband_interrupter_id);
  * Return: pointer to a new xhci_sideband instance if successful. NULL otherwise.
  */
 struct xhci_sideband *
-xhci_sideband_register(struct usb_interface *intf, enum xhci_sideband_type type)
+xhci_sideband_register(struct usb_interface *intf, enum xhci_sideband_type type,
+		       int (*notify_client)(struct usb_interface *intf,
+				    struct xhci_sideband_event *evt))
 {
 	struct usb_device *udev = interface_to_usbdev(intf);
 	struct usb_hcd *hcd = bus_to_hcd(udev->bus);
@@ -381,6 +407,7 @@ xhci_sideband_register(struct usb_interface *intf, enum xhci_sideband_type type)
 	sb->vdev = vdev;
 	sb->intf = intf;
 	sb->type = type;
+	sb->notify_client = notify_client;
 	vdev->sideband = sb;
 
 	spin_unlock_irq(&xhci->lock);
diff --git a/drivers/usb/host/xhci.c b/drivers/usb/host/xhci.c
index 26424396bd52..c7a7c11072de 100644
--- a/drivers/usb/host/xhci.c
+++ b/drivers/usb/host/xhci.c
@@ -20,6 +20,7 @@
 #include <linux/string_choices.h>
 #include <linux/dmi.h>
 #include <linux/dma-mapping.h>
+#include <linux/usb/xhci-sideband.h>
 
 #include "xhci.h"
 #include "xhci-trace.h"
@@ -3910,6 +3911,8 @@ static int xhci_discover_or_reset_device(struct usb_hcd *hcd,
 		}
 
 		if (ep->ring) {
+			if (ep->sideband)
+				xhci_sideband_notify_ep_ring_free(ep->sideband, i);
 			xhci_debugfs_remove_endpoint(xhci, virt_dev, i);
 			xhci_free_endpoint_ring(xhci, virt_dev, i);
 		}
diff --git a/include/linux/usb/xhci-sideband.h b/include/linux/usb/xhci-sideband.h
index f8722afb8a2d..45288c392f6e 100644
--- a/include/linux/usb/xhci-sideband.h
+++ b/include/linux/usb/xhci-sideband.h
@@ -21,6 +21,20 @@ enum xhci_sideband_type {
 	XHCI_SIDEBAND_VENDOR,
 };
 
+enum xhci_sideband_notify_type {
+	XHCI_SIDEBAND_XFER_RING_FREE,
+};
+
+/**
+ * struct xhci_sideband_event - sideband event
+ * @type: notifier type
+ * @evt_data: event data
+ */
+struct xhci_sideband_event {
+	enum xhci_sideband_notify_type type;
+	void *evt_data;
+};
+
 /**
  * struct xhci_sideband - representation of a sideband accessed usb device.
  * @xhci: The xhci host controller the usb device is connected to
@@ -30,6 +44,7 @@ enum xhci_sideband_type {
  * @type: xHCI sideband type
  * @mutex: mutex for sideband operations
  * @intf: USB sideband client interface
+ * @notify_client: callback for xHCI sideband sequences
  *
  * FIXME usb device accessed via sideband Keeping track of sideband accessed usb devices.
  */
@@ -44,10 +59,14 @@ struct xhci_sideband {
 	struct mutex			mutex;
 
 	struct usb_interface		*intf;
+	int (*notify_client)(struct usb_interface *intf,
+			     struct xhci_sideband_event *evt);
 };
 
 struct xhci_sideband *
-xhci_sideband_register(struct usb_interface *intf, enum xhci_sideband_type type);
+xhci_sideband_register(struct usb_interface *intf, enum xhci_sideband_type type,
+		       int (*notify_client)(struct usb_interface *intf,
+				    struct xhci_sideband_event *evt));
 void
 xhci_sideband_unregister(struct xhci_sideband *sb);
 int
@@ -71,4 +90,13 @@ void
 xhci_sideband_remove_interrupter(struct xhci_sideband *sb);
 int
 xhci_sideband_interrupter_id(struct xhci_sideband *sb);
+
+#if IS_ENABLED(CONFIG_USB_XHCI_SIDEBAND)
+void xhci_sideband_notify_ep_ring_free(struct xhci_sideband *sb,
+				       unsigned int ep_index);
+#else
+static inline void xhci_sideband_notify_ep_ring_free(struct xhci_sideband *sb,
+						     unsigned int ep_index)
+{ }
+#endif /* IS_ENABLED(CONFIG_USB_XHCI_SIDEBAND) */
 #endif /* __LINUX_XHCI_SIDEBAND_H */

