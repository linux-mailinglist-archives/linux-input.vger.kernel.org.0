Return-Path: <linux-input+bounces-10159-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 686F8A3AD86
	for <lists+linux-input@lfdr.de>; Wed, 19 Feb 2025 01:49:57 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id EFDB8167D37
	for <lists+linux-input@lfdr.de>; Wed, 19 Feb 2025 00:49:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4E7A917CA12;
	Wed, 19 Feb 2025 00:48:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="Zuty1vDS"
X-Original-To: linux-input@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 484141C28E;
	Wed, 19 Feb 2025 00:48:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739926106; cv=none; b=Pzys4VYjyUKKfQHl9gii/aYrkbBrpZFOtDzRbRGrY1hSs0FHWtNOzSe2Lkc/GxLrg9httfnOujxsmDqcvmiUuuCi5nGUjPVJH8JsaMFgtDfE5IYIiq3KzXQeyVlVxkx/e/86SkpJ30uezi7P0WEn+JyGP33Lf+VdInI+JDGfVi4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739926106; c=relaxed/simple;
	bh=MZK9eaAQMJgRn5Zy+6EOYkcG9mOBfgdLcan0jZgMFC4=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=XT4sF1m5fItH5UF4KLdihVe2fNboCZFO0E0Hr9S1+UZCfVTjz9OPmjqq+Wz84cBtyktxGhWAvB6KEjAZkT3lge+uOC3HkV2gvkhs0la/oB2mN3rbUXQ9J3N651YncxFVfOE1wvqInjdVk2vFAYXjKeYMKODZ38wti+5LNbV6bXg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=Zuty1vDS; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 51IIwFUW011711;
	Wed, 19 Feb 2025 00:48:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	GusFLVcQWc0SPfbLUQPCYl3xOWqboypqOEgH1K48Jdo=; b=Zuty1vDS/ITImPNp
	AJa8Le8njfGgHGI14EBYU9wltL5PUfzwI23ayKFOMZ53XhUJ4fO+Rbg/0Nj3cJxo
	BmaxfqE6qPw+l1xLA+7AltbmFu8gG+CltjxzuTe4viSt/qifPDrp7lO6oXad22rf
	QDbJ20OW5zP2a0uJW+Mt561uOibC0i/GN+8vvkRB2VLz3jPF/1Aju2XBTQIGLT1u
	iWGDpd9A8XgDZ4JIWKtCU7fnrhIa73mgGY+5WLQ9kBNQIauZNkqt1ky+Gm0GP/25
	D18p3KmmjBmdHxP6AZMcNR50Lpnn+d2S47QRUTLQNlGlaJPqZeh3rWCWMAfW1Ewh
	JypkSw==
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 44vyy1gqft-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 19 Feb 2025 00:48:06 +0000 (GMT)
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com [10.47.209.197])
	by NALASPPMTA05.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 51J0m5WO006471
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 19 Feb 2025 00:48:05 GMT
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
Subject: [PATCH v35 02/31] usb: host: xhci-mem: Cleanup pending secondary event ring events
Date: Tue, 18 Feb 2025 16:47:25 -0800
Message-ID: <20250219004754.497985-3-quic_wcheng@quicinc.com>
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
X-Proofpoint-GUID: 1UTjOB60WVEWCskNJfEF0SK1mpaIuAy6
X-Proofpoint-ORIG-GUID: 1UTjOB60WVEWCskNJfEF0SK1mpaIuAy6
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-18_11,2025-02-18_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0 clxscore=1015
 adultscore=0 malwarescore=0 mlxscore=0 priorityscore=1501
 lowpriorityscore=0 mlxlogscore=838 suspectscore=0 phishscore=0 spamscore=0
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2502100000 definitions=main-2502190004

As part of xHCI bus suspend, the xHCI is halted.  However, if there are
pending events in the secondary event ring, it is observed that the xHCI
controller stops responding to further commands upon host or device
initiated bus resume.  Iterate through all pending events and update the
dequeue pointer to the beginning of the event ring.

Signed-off-by: Wesley Cheng <quic_wcheng@quicinc.com>
---
 drivers/usb/host/xhci-mem.c  |  7 +++++-
 drivers/usb/host/xhci-ring.c | 47 ++++++++++++++++++++++++++++++------
 drivers/usb/host/xhci.c      |  2 +-
 drivers/usb/host/xhci.h      |  7 ++++++
 4 files changed, 54 insertions(+), 9 deletions(-)

diff --git a/drivers/usb/host/xhci-mem.c b/drivers/usb/host/xhci-mem.c
index 92703efda1f7..a9129f5e3dce 100644
--- a/drivers/usb/host/xhci-mem.c
+++ b/drivers/usb/host/xhci-mem.c
@@ -1805,7 +1805,7 @@ xhci_remove_interrupter(struct xhci_hcd *xhci, struct xhci_interrupter *ir)
 		tmp &= ERST_SIZE_MASK;
 		writel(tmp, &ir->ir_set->erst_size);
 
-		xhci_write_64(xhci, ERST_EHB, &ir->ir_set->erst_dequeue);
+		xhci_update_erst_dequeue(xhci, ir, true);
 	}
 }
 
@@ -1848,6 +1848,11 @@ void xhci_remove_secondary_interrupter(struct usb_hcd *hcd, struct xhci_interrup
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
index 965bffce301e..a53f35de549b 100644
--- a/drivers/usb/host/xhci-ring.c
+++ b/drivers/usb/host/xhci-ring.c
@@ -3025,9 +3025,9 @@ static int xhci_handle_event_trb(struct xhci_hcd *xhci, struct xhci_interrupter
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
@@ -3070,10 +3070,11 @@ static void xhci_clear_interrupt_pending(struct xhci_interrupter *ir)
  * Handle all OS-owned events on an interrupter event ring. It may drop
  * and reaquire xhci->lock between event processing.
  */
-static int xhci_handle_events(struct xhci_hcd *xhci, struct xhci_interrupter *ir)
+static int xhci_handle_events(struct xhci_hcd *xhci, struct xhci_interrupter *ir,
+			      bool skip_events)
 {
 	int event_loop = 0;
-	int err;
+	int err = 0;
 	u64 temp;
 
 	xhci_clear_interrupt_pending(ir);
@@ -3096,7 +3097,8 @@ static int xhci_handle_events(struct xhci_hcd *xhci, struct xhci_interrupter *ir
 
 	/* Process all OS owned event TRBs on this event ring */
 	while (unhandled_event_trb(ir->event_ring)) {
-		err = xhci_handle_event_trb(xhci, ir, ir->event_ring->dequeue);
+		if (!skip_events)
+			err = xhci_handle_event_trb(xhci, ir, ir->event_ring->dequeue);
 
 		/*
 		 * If half a segment of events have been handled in one go then
@@ -3123,6 +3125,37 @@ static int xhci_handle_events(struct xhci_hcd *xhci, struct xhci_interrupter *ir
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
+	xhci_handle_events(xhci, ir, true);
+}
+
 /*
  * xHCI spec says we can get an interrupt, and if the HC has an error condition,
  * we might get bad data out of the event ring.  Section 4.10.2.7 has a list of
@@ -3167,7 +3200,7 @@ irqreturn_t xhci_irq(struct usb_hcd *hcd)
 	writel(status, &xhci->op_regs->status);
 
 	/* This is the handler of the primary interrupter */
-	xhci_handle_events(xhci, xhci->interrupters[0]);
+	xhci_handle_events(xhci, xhci->interrupters[0], false);
 out:
 	spin_unlock(&xhci->lock);
 
diff --git a/drivers/usb/host/xhci.c b/drivers/usb/host/xhci.c
index 45653114ccd7..26424396bd52 100644
--- a/drivers/usb/host/xhci.c
+++ b/drivers/usb/host/xhci.c
@@ -335,7 +335,7 @@ static int xhci_enable_interrupter(struct xhci_interrupter *ir)
 	return 0;
 }
 
-static int xhci_disable_interrupter(struct xhci_interrupter *ir)
+int xhci_disable_interrupter(struct xhci_interrupter *ir)
 {
 	u32 iman;
 
diff --git a/drivers/usb/host/xhci.h b/drivers/usb/host/xhci.h
index 55d126d49ecc..ae604f37f757 100644
--- a/drivers/usb/host/xhci.h
+++ b/drivers/usb/host/xhci.h
@@ -1846,6 +1846,9 @@ xhci_create_secondary_interrupter(struct usb_hcd *hcd, unsigned int segs,
 				  u32 imod_interval);
 void xhci_remove_secondary_interrupter(struct usb_hcd
 				       *hcd, struct xhci_interrupter *ir);
+void xhci_skip_sec_intr_events(struct xhci_hcd *xhci,
+			       struct xhci_ring *ring,
+			       struct xhci_interrupter *ir);
 
 /* xHCI host controller glue */
 typedef void (*xhci_get_quirks_t)(struct device *, struct xhci_hcd *);
@@ -1885,6 +1888,7 @@ int xhci_alloc_tt_info(struct xhci_hcd *xhci,
 		struct usb_tt *tt, gfp_t mem_flags);
 int xhci_set_interrupter_moderation(struct xhci_interrupter *ir,
 				    u32 imod_interval);
+int xhci_disable_interrupter(struct xhci_interrupter *ir);
 
 /* xHCI ring, segment, TRB, and TD functions */
 dma_addr_t xhci_trb_virt_to_dma(struct xhci_segment *seg, union xhci_trb *trb);
@@ -1931,6 +1935,9 @@ unsigned int count_trbs(u64 addr, u64 len);
 int xhci_stop_endpoint_sync(struct xhci_hcd *xhci, struct xhci_virt_ep *ep,
 			    int suspend, gfp_t gfp_flags);
 void xhci_process_cancelled_tds(struct xhci_virt_ep *ep);
+void xhci_update_erst_dequeue(struct xhci_hcd *xhci,
+			      struct xhci_interrupter *ir,
+			      bool clear_ehb);
 
 /* xHCI roothub code */
 void xhci_set_link_state(struct xhci_hcd *xhci, struct xhci_port *port,

