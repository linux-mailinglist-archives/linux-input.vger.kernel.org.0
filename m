Return-Path: <linux-input+bounces-5959-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B21B964F42
	for <lists+linux-input@lfdr.de>; Thu, 29 Aug 2024 21:42:12 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 1A7C91F24085
	for <lists+linux-input@lfdr.de>; Thu, 29 Aug 2024 19:42:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3A4521BA889;
	Thu, 29 Aug 2024 19:41:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="NOaeOJWE"
X-Original-To: linux-input@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 75ACC1B86F2;
	Thu, 29 Aug 2024 19:41:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724960507; cv=none; b=SvHfY4WPkEA7Dee7wPsHntTAVKmWrXi7pzGU/iH6laOePJ2JXiVVezqHr+sY98kw8rthIByMYrgLMVZGsMQkg0ntaTljk2dzTKhiw3+JUQ4bODJKszB/ewTdkyeyDKQsJj8L/gffURBzw/SNb4pBqenvEhcWdZPc3JU4NB7gEQ4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724960507; c=relaxed/simple;
	bh=Hbgtp/7IqaqAzfu+fEZsRqxdhkOrJKUt50HVIjPcfm0=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Kb4A5kOY13bRKh8FFaLVT8GWZWA92zT8DpaakhtUVqI57IQqnmOxe8Hq/G5OqODRTMU+GFgHST54N40jV6OHJPqx2A12+QT/lrRdaYwjPASpGPnidqAl3zL9+0a4jWlzLECxp0uzBiSldU5VDrBeoQFaR6yOizKq1YC+wNMVvtc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=NOaeOJWE; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 47THUnvw013573;
	Thu, 29 Aug 2024 19:41:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	eNuZT+67ODxrUP1gxGJI4KgjjtHE8GGokck0XORH4Bk=; b=NOaeOJWEtA3gkuAO
	3q+GmQhIbYO8DC39Oq9HC3Ma/s2hZ5ILq6u+tdBWqRNprZ9BXPcai/CIOQiyZQNM
	sOre6DnM2/IC60h4y1oxYHisFUy6EF6UBcqyo0app+7y0O3AB0yEdgJlbMzo3afZ
	3VOygFFiBGEG5zmPCu54aS2LpwypJdWlLitR3bIGAS2JJo4XMBi/BJLkNLgV2IoZ
	T37co1dPhJAF4AFM0G5uVCqMaF6fEadzBY4UOnH1HNEpZV12j+lsi2j0Rv0wIVeB
	VAno7ELCTUF+OFnVSA4tcG38IGpNuPt3Sj6t12Bju8YTXxX5DEyUN1L7nF+Ehk9H
	Qz6GNQ==
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 419px5pcsv-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 29 Aug 2024 19:41:26 +0000 (GMT)
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com [10.47.209.197])
	by NALASPPMTA04.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 47TJfPhd016259
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 29 Aug 2024 19:41:25 GMT
Received: from hu-wcheng-lv.qualcomm.com (10.49.16.6) by
 nalasex01b.na.qualcomm.com (10.47.209.197) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Thu, 29 Aug 2024 12:41:25 -0700
From: Wesley Cheng <quic_wcheng@quicinc.com>
To: <srinivas.kandagatla@linaro.org>, <mathias.nyman@intel.com>,
        <perex@perex.cz>, <conor+dt@kernel.org>, <dmitry.torokhov@gmail.com>,
        <corbet@lwn.net>, <broonie@kernel.org>, <lgirdwood@gmail.com>,
        <tiwai@suse.com>, <krzk+dt@kernel.org>, <Thinh.Nguyen@synopsys.com>,
        <bgoswami@quicinc.com>, <robh@kernel.org>,
        <gregkh@linuxfoundation.org>
CC: <linux-kernel@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-sound@vger.kernel.org>, <linux-input@vger.kernel.org>,
        <linux-usb@vger.kernel.org>, <linux-arm-msm@vger.kernel.org>,
        <linux-doc@vger.kernel.org>, <alsa-devel@alsa-project.org>,
        Wesley Cheng
	<quic_wcheng@quicinc.com>
Subject: [PATCH v26 05/33] usb: host: xhci-mem: Cleanup pending secondary event ring events
Date: Thu, 29 Aug 2024 12:40:37 -0700
Message-ID: <20240829194105.1504814-6-quic_wcheng@quicinc.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240829194105.1504814-1-quic_wcheng@quicinc.com>
References: <20240829194105.1504814-1-quic_wcheng@quicinc.com>
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
X-Proofpoint-ORIG-GUID: NL6cSiAELwdM9jNABHMuVoVRntbqYV8a
X-Proofpoint-GUID: NL6cSiAELwdM9jNABHMuVoVRntbqYV8a
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-08-29_06,2024-08-29_02,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0 clxscore=1015
 adultscore=0 suspectscore=0 lowpriorityscore=0 mlxlogscore=949 spamscore=0
 priorityscore=1501 bulkscore=0 mlxscore=0 malwarescore=0 impostorscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2407110000
 definitions=main-2408290139

As part of xHCI bus suspend, the xHCI is halted.  However, if there are
pending events in the secondary event ring, it is observed that the xHCI
controller stops responding to further commands upon host or device
initiated bus resume.  Iterate through all pending events and update the
dequeue pointer to the beginning of the event ring.

Signed-off-by: Wesley Cheng <quic_wcheng@quicinc.com>
---
 drivers/usb/host/xhci-mem.c  |  7 ++++++-
 drivers/usb/host/xhci-ring.c | 37 +++++++++++++++++++++++++++++++++---
 drivers/usb/host/xhci.c      |  2 +-
 drivers/usb/host/xhci.h      |  7 +++++++
 4 files changed, 48 insertions(+), 5 deletions(-)

diff --git a/drivers/usb/host/xhci-mem.c b/drivers/usb/host/xhci-mem.c
index 48b1e6ac434b..651b42ac6296 100644
--- a/drivers/usb/host/xhci-mem.c
+++ b/drivers/usb/host/xhci-mem.c
@@ -1816,7 +1816,7 @@ xhci_remove_interrupter(struct xhci_hcd *xhci, struct xhci_interrupter *ir)
 		tmp &= ERST_SIZE_MASK;
 		writel(tmp, &ir->ir_set->erst_size);
 
-		xhci_write_64(xhci, ERST_EHB, &ir->ir_set->erst_dequeue);
+		xhci_update_erst_dequeue(xhci, ir, true);
 	}
 }
 
@@ -1859,6 +1859,11 @@ void xhci_remove_secondary_interrupter(struct usb_hcd *hcd, struct xhci_interrup
 		return;
 	}
 
+	/*
+	 * Cleanup secondary interrupter to ensure there are no pending events.
+	 * This also updates event ring dequeue pointer back to the start.
+	 */
+	xhci_skip_sec_intr_events(xhci, ir->event_ring, ir);
 	intr_num = ir->intr_num;
 
 	xhci_remove_interrupter(xhci, ir);
diff --git a/drivers/usb/host/xhci-ring.c b/drivers/usb/host/xhci-ring.c
index 74bdc94d863b..b7009aee4130 100644
--- a/drivers/usb/host/xhci-ring.c
+++ b/drivers/usb/host/xhci-ring.c
@@ -3012,9 +3012,9 @@ static int xhci_handle_event_trb(struct xhci_hcd *xhci, struct xhci_interrupter
  * - When all events have finished
  * - To avoid "Event Ring Full Error" condition
  */
-static void xhci_update_erst_dequeue(struct xhci_hcd *xhci,
-				     struct xhci_interrupter *ir,
-				     bool clear_ehb)
+void xhci_update_erst_dequeue(struct xhci_hcd *xhci,
+			      struct xhci_interrupter *ir,
+			      bool clear_ehb)
 {
 	u64 temp_64;
 	dma_addr_t deq;
@@ -3112,6 +3112,37 @@ static int xhci_handle_events(struct xhci_hcd *xhci, struct xhci_interrupter *ir
 	return 0;
 }
 
+/*
+ * Move the event ring dequeue pointer to skip events kept in the secondary
+ * event ring.  This is used to ensure that pending events in the ring are
+ * acknowledged, so the xHCI HCD can properly enter suspend/resume.  The
+ * secondary ring is typically maintained by an external component.
+ */
+void xhci_skip_sec_intr_events(struct xhci_hcd *xhci,
+			       struct xhci_ring *ring,	struct xhci_interrupter *ir)
+{
+	union xhci_trb *current_trb;
+	u64 erdp_reg;
+	dma_addr_t deq;
+
+	/* disable irq, ack pending interrupt and ack all pending events */
+	xhci_disable_interrupter(ir);
+
+	/* last acked event trb is in erdp reg  */
+	erdp_reg = xhci_read_64(xhci, &ir->ir_set->erst_dequeue);
+	deq = (dma_addr_t)(erdp_reg & ERST_PTR_MASK);
+	if (!deq) {
+		xhci_err(xhci, "event ring handling not required\n");
+		return;
+	}
+
+	current_trb = ir->event_ring->dequeue;
+	/* read cycle state of the last acked trb to find out CCS */
+	ring->cycle_state = le32_to_cpu(current_trb->event_cmd.flags) & TRB_CYCLE;
+
+	xhci_handle_events(xhci, ir);
+}
+
 /*
  * xHCI spec says we can get an interrupt, and if the HC has an error condition,
  * we might get bad data out of the event ring.  Section 4.10.2.7 has a list of
diff --git a/drivers/usb/host/xhci.c b/drivers/usb/host/xhci.c
index 1fafba95d407..52116fb35ee0 100644
--- a/drivers/usb/host/xhci.c
+++ b/drivers/usb/host/xhci.c
@@ -333,7 +333,7 @@ static int xhci_enable_interrupter(struct xhci_interrupter *ir)
 	return 0;
 }
 
-static int xhci_disable_interrupter(struct xhci_interrupter *ir)
+int xhci_disable_interrupter(struct xhci_interrupter *ir)
 {
 	u32 iman;
 
diff --git a/drivers/usb/host/xhci.h b/drivers/usb/host/xhci.h
index 503784345787..e37d27190e3c 100644
--- a/drivers/usb/host/xhci.h
+++ b/drivers/usb/host/xhci.h
@@ -1836,6 +1836,9 @@ xhci_create_secondary_interrupter(struct usb_hcd *hcd, unsigned int segs,
 				  u32 imod_interval);
 void xhci_remove_secondary_interrupter(struct usb_hcd
 				       *hcd, struct xhci_interrupter *ir);
+void xhci_skip_sec_intr_events(struct xhci_hcd *xhci,
+			       struct xhci_ring *ring,
+			       struct xhci_interrupter *ir);
 
 /* xHCI host controller glue */
 typedef void (*xhci_get_quirks_t)(struct device *, struct xhci_hcd *);
@@ -1875,6 +1878,7 @@ int xhci_alloc_tt_info(struct xhci_hcd *xhci,
 		struct usb_tt *tt, gfp_t mem_flags);
 int xhci_set_interrupter_moderation(struct xhci_interrupter *ir,
 				    u32 imod_interval);
+int xhci_disable_interrupter(struct xhci_interrupter *ir);
 
 /* xHCI ring, segment, TRB, and TD functions */
 dma_addr_t xhci_trb_virt_to_dma(struct xhci_segment *seg, union xhci_trb *trb);
@@ -1924,6 +1928,9 @@ void inc_deq(struct xhci_hcd *xhci, struct xhci_ring *ring);
 unsigned int count_trbs(u64 addr, u64 len);
 int xhci_stop_endpoint_sync(struct xhci_hcd *xhci, struct xhci_virt_ep *ep,
 			    int suspend, gfp_t gfp_flags);
+void xhci_update_erst_dequeue(struct xhci_hcd *xhci,
+			      struct xhci_interrupter *ir,
+			      bool clear_ehb);
 
 /* xHCI roothub code */
 void xhci_set_link_state(struct xhci_hcd *xhci, struct xhci_port *port,

