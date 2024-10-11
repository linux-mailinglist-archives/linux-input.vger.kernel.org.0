Return-Path: <linux-input+bounces-7287-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B1FC79995FC
	for <lists+linux-input@lfdr.de>; Fri, 11 Oct 2024 02:07:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id F4100B214F0
	for <lists+linux-input@lfdr.de>; Fri, 11 Oct 2024 00:07:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5B9E81C27;
	Fri, 11 Oct 2024 00:07:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="XnxYNnzv"
X-Original-To: linux-input@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BCA652F34;
	Fri, 11 Oct 2024 00:07:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728605250; cv=none; b=ukl6Kgvk7DaAtpyJz2aiMVsVeIuF+M5LbPptSGzvNB2WojAoDWNH6jbTJZ5Cjxu8/JRqdR+5nxogqqM4EOhKpaBZyxRe/553OUrOzFFfQN8fiSKHzi43GQd4k9fpZQysnIaB7esbOOGpy9aG+Dn/3kTwABNFlftKMvWRZrqRRLs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728605250; c=relaxed/simple;
	bh=2azGS4Mn0hl3bJLIVZjYNoRlE2MsVGBfb5n8aG0ud74=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=WAFFN5PWsgp58gvCW0kJNHiq44ChwTM2W55goujmSj1u81piqoIOf+/jlU6QmzKC61WxwTCqz/NG3D9uA5/BiLgS1Ra6JA1XuJ4uqUdK5noN2H9zV9PEgvw8uCn6IOx9kEpUD/RngolHvPZFFo5+v4l05KyA9sJW7HIHQgu4w6g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=XnxYNnzv; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 49ABuv91009168;
	Fri, 11 Oct 2024 00:07:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	8pUtfboEtVwzj3gvJFEJdvS9Fn04qc2yCNOn552kLBs=; b=XnxYNnzvLmM1bhJp
	Ok6nd+YGWqTPtNbOnVFWCR72uA2mSgAKPFwl0BveN14jnUSHIrAxpmZQTjXlh5m6
	CbGiydpUUmXAUXGb/OyNxiHIkFOBgOWVBPYVaz9KTXAHAMfiBBghFJoHNKKcPJcH
	fxd2iMgPTpOoHd4eBaDMhRXgb2GTzQvtaiQQQkbXox7IFXY+O4FIYVICGmkObxbB
	C5leUhI8iUl8JfTOftCTkiTYMVkbZUx1877jAFpmD6fhuIle8ZOZ/FEjm9XqnPQf
	jp63iHRa9RKIa2NYTonFuYofp3mE0dRd/ZVLYFQPlCWFYxjkofju4k6LJUWaC24r
	DQxG/g==
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 425tn150vr-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 11 Oct 2024 00:07:04 +0000 (GMT)
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com [10.47.209.197])
	by NALASPPMTA04.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 49B07337003282
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 11 Oct 2024 00:07:03 GMT
Received: from hu-wcheng-lv.qualcomm.com (10.49.16.6) by
 nalasex01b.na.qualcomm.com (10.47.209.197) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Thu, 10 Oct 2024 17:07:03 -0700
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
        Wesley Cheng
	<quic_wcheng@quicinc.com>
Subject: [PATCH v28 02/32] usb: host: xhci: Repurpose event handler for skipping interrupter events
Date: Thu, 10 Oct 2024 17:05:48 -0700
Message-ID: <20241011000650.2585600-4-quic_wcheng@quicinc.com>
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
X-Proofpoint-ORIG-GUID: awIp6GitvHvjFRhklxud-UWXefmokHKa
X-Proofpoint-GUID: awIp6GitvHvjFRhklxud-UWXefmokHKa
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 bulkscore=0
 suspectscore=0 priorityscore=1501 mlxlogscore=934 impostorscore=0
 spamscore=0 lowpriorityscore=0 phishscore=0 clxscore=1015 malwarescore=0
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2409260000 definitions=main-2410100159

Depending on the interrupter use case, the OS may only be used to handle
the interrupter event ring clean up.  In these scenarios, event TRBs don't
need to be handled by the OS, so introduce an xhci interrupter flag to tag
if the events from an interrupter needs to be handled or not.

Signed-off-by: Wesley Cheng <quic_wcheng@quicinc.com>
---
 drivers/usb/host/xhci-ring.c | 17 +++++++++++++----
 drivers/usb/host/xhci.h      |  1 +
 2 files changed, 14 insertions(+), 4 deletions(-)

diff --git a/drivers/usb/host/xhci-ring.c b/drivers/usb/host/xhci-ring.c
index 9e90d2952760..74bdc94d863b 100644
--- a/drivers/usb/host/xhci-ring.c
+++ b/drivers/usb/host/xhci-ring.c
@@ -2951,14 +2951,22 @@ static int handle_tx_event(struct xhci_hcd *xhci,
 }
 
 /*
- * This function handles one OS-owned event on the event ring. It may drop
- * xhci->lock between event processing (e.g. to pass up port status changes).
+ * This function handles one OS-owned event on the event ring, or ignores one event
+ * on interrupters which are non-OS owned. It may drop xhci->lock between event
+ * processing (e.g. to pass up port status changes).
  */
 static int xhci_handle_event_trb(struct xhci_hcd *xhci, struct xhci_interrupter *ir,
 				 union xhci_trb *event)
 {
 	u32 trb_type;
 
+	/*
+	 * Some interrupters do not need to handle event TRBs, as they may be
+	 * managed by another entity, but rely on the OS to clean up.
+	 */
+	if (ir->skip_events)
+		return 0;
+
 	trace_xhci_handle_event(ir->event_ring, &event->generic);
 
 	/*
@@ -3047,8 +3055,9 @@ static void xhci_clear_interrupt_pending(struct xhci_hcd *xhci,
 }
 
 /*
- * Handle all OS-owned events on an interrupter event ring. It may drop
- * and reaquire xhci->lock between event processing.
+ * Handle all OS-owned events on an interrupter event ring, or skip pending events
+ * for non OS owned interrupter event ring. It may drop and reacquire xhci->lock
+ * between event processing.
  */
 static int xhci_handle_events(struct xhci_hcd *xhci, struct xhci_interrupter *ir)
 {
diff --git a/drivers/usb/host/xhci.h b/drivers/usb/host/xhci.h
index 51a992d8ffcf..a6fbfc11fb1d 100644
--- a/drivers/usb/host/xhci.h
+++ b/drivers/usb/host/xhci.h
@@ -1430,6 +1430,7 @@ struct xhci_interrupter {
 	struct xhci_intr_reg __iomem *ir_set;
 	unsigned int		intr_num;
 	bool			ip_autoclear;
+	bool			skip_events;
 	u32			isoc_bei_interval;
 	/* For interrupter registers save and restore over suspend/resume */
 	u32	s3_irq_pending;

