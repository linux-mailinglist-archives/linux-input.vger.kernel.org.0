Return-Path: <linux-input+bounces-9437-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 33798A1868D
	for <lists+linux-input@lfdr.de>; Tue, 21 Jan 2025 22:07:17 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id B49C57A30E6
	for <lists+linux-input@lfdr.de>; Tue, 21 Jan 2025 21:07:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 233E81FA151;
	Tue, 21 Jan 2025 21:05:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="Fx3Vqv3T"
X-Original-To: linux-input@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 932B21F8662;
	Tue, 21 Jan 2025 21:05:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737493548; cv=none; b=J5vi//+qL+hVL04qcLyBtKodilWzyvdvZW+GBv0+uCZqQMEfGcRGjW6QAO/unHCdZwNykLDjGsJAJonkx75kA73BrQH1VRhok7UlOcWq1A0d1eI7CZG7MEE6swlV2E7H0U6U1JIsm26BCpDmRH+6XSyduCMmr2gmardFzbUugZ8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737493548; c=relaxed/simple;
	bh=/Veh1ottXNpu4DDFV4Cyc6jCUNUbPmhO2SvxeMtlgTo=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=JXgxUDwX6u1ULyCF7/NozJ/LtQNY+WAFKlbSueskXNtz6VSCm8dlyqPGrBEUJ+Xe3MK1dKEo7PMmzbE7GCHwnmFdSPbuA/qbq+6n/j577E3ID+hJDucH9CHTX4KJW1vGew/AXVQ/t9BueUNkIFfqyq4PqVlRs1QGmHJ91q0Vy70=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=Fx3Vqv3T; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 50LEw3eW032737;
	Tue, 21 Jan 2025 21:05:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	t1SCDgqvsr9YQFBGd5Qayz/Po0G4z4WaDMw/sfwou1Q=; b=Fx3Vqv3Tr0nZ0wlX
	zFLqYuvwv0915bRbv+I0X5Dk91XH2ZvrDkD8lr2/TmdmnLek0BvmKF4VI58sIkX5
	mKx0G/GkKjLfdzbqIcFbAQl30FTcZvDEbqcLOGXN7PoCYOUfiemDrdaY0K2qRmeN
	b4UTNLtlV9HvVaBXUih563GUsXH4hEEwJLqOuU+x2jP+UPfp5E546+Suvrpl2M9a
	+fdzA29oHZTpTRYZWUBTpjABNqNTi9slThCEofmPveAdOmtmGuKQlzGSxWckvbp2
	ivbWHqJJmthEHCEtsAq17py37C4ARpa0RfcV8NfVAZ7r1umMo6dKAEnoa3pjqXvJ
	rOqQ9A==
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 44adt5gvt5-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 21 Jan 2025 21:05:30 +0000 (GMT)
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com [10.47.209.197])
	by NALASPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 50LL5U79029157
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 21 Jan 2025 21:05:30 GMT
Received: from hu-wcheng-lv.qualcomm.com (10.49.16.6) by
 nalasex01b.na.qualcomm.com (10.47.209.197) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Tue, 21 Jan 2025 13:05:29 -0800
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
Subject: [PATCH v34 05/31] usb: host: xhci: Notify xHCI sideband on transfer ring free
Date: Tue, 21 Jan 2025 13:04:52 -0800
Message-ID: <20250121210518.2436771-6-quic_wcheng@quicinc.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250121210518.2436771-1-quic_wcheng@quicinc.com>
References: <20250121210518.2436771-1-quic_wcheng@quicinc.com>
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
X-Proofpoint-GUID: 6-3YT_Ad-g7Ny0xeg_YXM56PbS_fBYF0
X-Proofpoint-ORIG-GUID: 6-3YT_Ad-g7Ny0xeg_YXM56PbS_fBYF0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-01-21_08,2025-01-21_03,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0 suspectscore=0
 clxscore=1015 mlxlogscore=866 mlxscore=0 malwarescore=0 lowpriorityscore=0
 priorityscore=1501 spamscore=0 impostorscore=0 phishscore=0 bulkscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2411120000
 definitions=main-2501210167

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

