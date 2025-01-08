Return-Path: <linux-input+bounces-9034-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id AB83AA04F09
	for <lists+linux-input@lfdr.de>; Wed,  8 Jan 2025 02:24:30 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 3089018819D7
	for <lists+linux-input@lfdr.de>; Wed,  8 Jan 2025 01:24:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 94BE419E83C;
	Wed,  8 Jan 2025 01:22:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="Bx5/pd5x"
X-Original-To: linux-input@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 79AA6155382;
	Wed,  8 Jan 2025 01:22:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736299368; cv=none; b=EFT3oQqF0VqS6PsPVZetFmNehHZaMt6N2zybAz1Bv/BoQl7hOOPPZFTDEvGKsLopQdGvxsTS6Gum3Fxd65oH/xiFCgley5uXSDYrIqsW9SJrAgKxlETe4JIurA9NmJF9Knhr9mJ6fz0FoD79UWH9h6j/cRYMTt6TWQ7ILhfjxsw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736299368; c=relaxed/simple;
	bh=00ovhSUsrpqPmeg9Z97Mold1re0pm4qXWH7dZbojWMc=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=mHAG7RkVzr3Vor630q1iOgoiRtRCTN5NfmwV7RCduJC9ueRKsArZO7bf8FNBbjvAxrcsbGtQDPTfzxsOZdXlL6IEObsDRLPwjLnldxehvSbzBUnjDDS6MWpkiHhIOhxc/hCqymYDW2agQMGGyvS1Q6w1M/LE35x8szCvKadul3M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=Bx5/pd5x; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 507E4TMt016204;
	Wed, 8 Jan 2025 01:22:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	IdzR6SU8FWDkEFEo5Q8AckTbqJJi2y2HoHkJbCidabY=; b=Bx5/pd5xk9ehwwzj
	24Mm95MDmwRD869AiOnlBm27bXo74ejMjZrweMt9mnYPagLvZqB3g4RKAMXQtzsW
	4g9H10BDXeHBlF51vYJLtKFmnQ0U0NG7mnFKcXbiqO8U0zIEuW9o4HWj/Cc894dF
	1HaQv0Li9kGsCuzOANZbguUNfOxLifzjiaZ38tTNqFJ3bL4AR+4y5tGdttAWVlSI
	Gqlm4Qb8+mVnKbK5K2zz6xqgvETIKSBRJJ1IQxFr+o1ENUdRWgYFHj7BADCb8Vic
	EnG5EViPdjCAUL1fsKSzn0jH14PztS2ijvdVeh8iZCCt5xKiNrj+kLJxTfP7XZv/
	N6UAYw==
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4415qahg00-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 08 Jan 2025 01:22:26 +0000 (GMT)
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com [10.47.209.197])
	by NALASPPMTA05.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 5081MQVg027979
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 8 Jan 2025 01:22:26 GMT
Received: from hu-wcheng-lv.qualcomm.com (10.49.16.6) by
 nalasex01b.na.qualcomm.com (10.47.209.197) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Tue, 7 Jan 2025 17:22:25 -0800
From: Wesley Cheng <quic_wcheng@quicinc.com>
To: <srinivas.kandagatla@linaro.org>, <mathias.nyman@intel.com>,
        <perex@perex.cz>, <conor+dt@kernel.org>, <dmitry.torokhov@gmail.com>,
        <corbet@lwn.net>, <broonie@kernel.org>, <lgirdwood@gmail.com>,
        <krzk+dt@kernel.org>, <pierre-louis.bossart@linux.intel.com>,
        <Thinh.Nguyen@synopsys.com>, <tiwai@suse.com>, <robh@kernel.org>,
        <gregkh@linuxfoundation.org>
CC: <linux-kernel@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-sound@vger.kernel.org>, <linux-input@vger.kernel.org>,
        <linux-usb@vger.kernel.org>, <linux-arm-msm@vger.kernel.org>,
        <linux-doc@vger.kernel.org>, Wesley Cheng <quic_wcheng@quicinc.com>
Subject: [PATCH v32 06/32] usb: host: xhci: Notify xHCI sideband on transfer ring free
Date: Tue, 7 Jan 2025 17:21:47 -0800
Message-ID: <20250108012213.1659364-7-quic_wcheng@quicinc.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250108012213.1659364-1-quic_wcheng@quicinc.com>
References: <20250108012213.1659364-1-quic_wcheng@quicinc.com>
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
X-Proofpoint-ORIG-GUID: eteVyTk1cI7sydYjOPfxpr5bvJ-iQpRh
X-Proofpoint-GUID: eteVyTk1cI7sydYjOPfxpr5bvJ-iQpRh
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 adultscore=0 mlxscore=0 phishscore=0 impostorscore=0 mlxlogscore=825
 suspectscore=0 bulkscore=0 spamscore=0 clxscore=1015 malwarescore=0
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2501080007

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
index 6b58d29f57cd..cd1bdba6a9e3 100644
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
@@ -344,7 +368,9 @@ EXPORT_SYMBOL_GPL(xhci_sideband_interrupter_id);
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
@@ -383,6 +409,7 @@ xhci_sideband_register(struct usb_interface *intf, enum xhci_sideband_type type)
 	sb->vdev = vdev;
 	sb->intf = intf;
 	sb->type = type;
+	sb->notify_client = notify_client;
 	vdev->sideband = sb;
 
 	spin_unlock_irq(&xhci->lock);
diff --git a/drivers/usb/host/xhci.c b/drivers/usb/host/xhci.c
index 514a36914ed9..972395d297f1 100644
--- a/drivers/usb/host/xhci.c
+++ b/drivers/usb/host/xhci.c
@@ -19,6 +19,7 @@
 #include <linux/slab.h>
 #include <linux/dmi.h>
 #include <linux/dma-mapping.h>
+#include <linux/usb/xhci-sideband.h>
 
 #include "xhci.h"
 #include "xhci-trace.h"
@@ -3909,6 +3910,8 @@ static int xhci_discover_or_reset_device(struct usb_hcd *hcd,
 		}
 
 		if (ep->ring) {
+			if (ep->sideband)
+				xhci_sideband_notify_ep_ring_free(ep->sideband, i);
 			xhci_debugfs_remove_endpoint(xhci, virt_dev, i);
 			xhci_free_endpoint_ring(xhci, virt_dev, i);
 		}
diff --git a/include/linux/usb/xhci-sideband.h b/include/linux/usb/xhci-sideband.h
index 7ec23e6e27d0..233c3e16d804 100644
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
@@ -29,6 +43,7 @@ enum xhci_sideband_type {
  * @ir: event handling and buffer for sideband accessed device
  * @mutex: mutex for sideband operations
  * @intf: USB sideband client interface
+ * @notify_client: callback for xHCI sideband sequences
  *
  * FIXME usb device accessed via sideband Keeping track of sideband accessed usb devices.
  */
@@ -43,10 +58,14 @@ struct xhci_sideband {
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
@@ -70,4 +89,13 @@ void
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

