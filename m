Return-Path: <linux-input+bounces-11525-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id E7F9EA7B4EA
	for <lists+linux-input@lfdr.de>; Fri,  4 Apr 2025 02:44:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id E795A188A82F
	for <lists+linux-input@lfdr.de>; Fri,  4 Apr 2025 00:41:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 819F61F9F75;
	Fri,  4 Apr 2025 00:28:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="NAaSg5wA"
X-Original-To: linux-input@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8136E1F419D;
	Fri,  4 Apr 2025 00:28:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743726489; cv=none; b=OO/MxdB/h5h8UBaKUxnTCF7dC3F31E+8pa8ywNavQdoC9tb+X6xmK1bWocDuQETayMcOAqsVvZ/QDIq7+8k697WXlJrEwMdmCcsuYzL8OAq6kSOv3iN05M3Qko0Ssl7qlL1OWhzLFTn6Z7YY9fNSG1G4Hh/RzrYtWPRHB/ZZvaM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743726489; c=relaxed/simple;
	bh=AiOuGIWbh5AgvHy0VpoQG1rlFPMbVahxbue2kuHdAfM=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Ymlvu6/jiSsgVtisFO/+JvbuqRcAgtZbrX/ni05KygHwAKZOyXEFvgIhFsnZGOajDsO9XWzXAb9/tRiobvZsHm9MmIBJwyCGB3WBdH8ZF90q406yaF0xp5Ly6g2lpWVER8+uDcsxzOXKq0tHdJbN5W4g9YG1FqbX3aTveoRJaks=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=NAaSg5wA; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 533NXPko009114;
	Fri, 4 Apr 2025 00:27:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	XDmiN7kBvSnRKsA+s3nSnlDJjm7NS2990LU02NodEm4=; b=NAaSg5wAqgdaFyTy
	Xm8qy9iLCPjPmIOq5CWiIGeg6dd2fEzFd96D50c1hiMOV1g4ES1AYrEJNsw5+4Ye
	3Ubvtp6u2lJqf0Tq8LZ9ogsZ00o4103o7UExANxqgamL5lmvOU3F6hNt2YTIFSpF
	T04dhAMhnvmrcwIhYlevuZjAEJLBZ941JNwpnfkd+NZwNswzi/9CGLdH14Z3LAYv
	0qG8ivtAW9K94GLITihLn5oc0AC7RwN7EJqdY/wXoGAwetMpMMek4/frgcR9JLiR
	nciMwitvwjSjiVKlRyXo06jmRyiedWa9bnCQL1IwHn3A7iz0bQmO+VoT+S+Um6w+
	XzT6oQ==
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45t2d988rn-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 04 Apr 2025 00:27:41 +0000 (GMT)
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com [10.47.209.197])
	by NALASPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 5340ReP7006276
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 4 Apr 2025 00:27:40 GMT
Received: from hu-wcheng-lv.qualcomm.com (10.49.16.6) by
 nalasex01b.na.qualcomm.com (10.47.209.197) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Thu, 3 Apr 2025 17:27:40 -0700
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
        <linux-doc@vger.kernel.org>, Wesley Cheng <quic_wcheng@quicinc.com>,
        Puma Hsu
	<pumahsu@google.com>, Daehwan Jung <dh10.jung@samsung.com>
Subject: [PATCH v37 05/31] usb: host: xhci: Notify xHCI sideband on transfer ring free
Date: Thu, 3 Apr 2025 17:27:02 -0700
Message-ID: <20250404002728.3590501-6-quic_wcheng@quicinc.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250404002728.3590501-1-quic_wcheng@quicinc.com>
References: <20250404002728.3590501-1-quic_wcheng@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: nalasex01c.na.qualcomm.com (10.47.97.35) To
 nalasex01b.na.qualcomm.com (10.47.209.197)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: iL3rAKcQ7FKlySNTY_PgL-vJjaRgRvAP
X-Authority-Analysis: v=2.4 cv=cpybk04i c=1 sm=1 tr=0 ts=67ef277d cx=c_pps a=ouPCqIW2jiPt+lZRy3xVPw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17 a=3H110R4YSZwA:10 a=XR8D0OoHHMoA:10 a=1XWaLZrsAAAA:8 a=hD80L64hAAAA:8 a=COk6AnOGAAAA:8 a=PreZEog4GvDKfhablsMA:9
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: iL3rAKcQ7FKlySNTY_PgL-vJjaRgRvAP
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-03_11,2025-04-03_03,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 spamscore=0
 lowpriorityscore=0 mlxscore=0 impostorscore=0 malwarescore=0 clxscore=1011
 phishscore=0 suspectscore=0 mlxlogscore=874 bulkscore=0 adultscore=0
 priorityscore=1501 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2504040001

In the case of handling a USB bus reset, the xhci_discover_or_reset_device
can run without first notifying the xHCI sideband client driver to stop or
prevent the use of the transfer ring.  It was seen that when a bus reset
situation happened, the USB offload driver was attempting to fetch the xHCI
transfer ring information, which was already freed.

Tested-by: Puma Hsu <pumahsu@google.com>
Tested-by: Daehwan Jung <dh10.jung@samsung.com>
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
index 61950a350432..91e2d6eac8b7 100644
--- a/drivers/usb/host/xhci.c
+++ b/drivers/usb/host/xhci.c
@@ -20,6 +20,7 @@
 #include <linux/string_choices.h>
 #include <linux/dmi.h>
 #include <linux/dma-mapping.h>
+#include <linux/usb/xhci-sideband.h>
 
 #include "xhci.h"
 #include "xhci-trace.h"
@@ -3919,6 +3920,8 @@ static int xhci_discover_or_reset_device(struct usb_hcd *hcd,
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

