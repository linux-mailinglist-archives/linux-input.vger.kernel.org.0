Return-Path: <linux-input+bounces-5957-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B9CF0964F38
	for <lists+linux-input@lfdr.de>; Thu, 29 Aug 2024 21:41:53 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id DF6B31C20A3F
	for <lists+linux-input@lfdr.de>; Thu, 29 Aug 2024 19:41:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DB27E1BA27A;
	Thu, 29 Aug 2024 19:41:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="Q2ZADykL"
X-Original-To: linux-input@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 40E5B1537C7;
	Thu, 29 Aug 2024 19:41:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724960506; cv=none; b=gvgEtacAwSnxGAWaEyzllgGhR2g1SP+o/L8pSAuMy2IsZefKkko/ml+4bpYZg/r5BhtX1mjJjJj6mkBxhrtfnPqTxN0VzuiUAwQobMTTzryKIshGOpsLytfEeO1xPFJoqJoqrtur90iztVRuVExhFiqe6Rx2pRFLMZ+vs0Yc0QA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724960506; c=relaxed/simple;
	bh=HqCwXA08WX0BPyhzSF2IQJIqCfa4GgJBS3Z/vN3UBjk=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=WT8U117xIl4b8Vv6UKColuKhv32r1YX5NRZUGqqlz79JkJ3sGTEcXuH5wx7YpSEACWHwgz8QhOWDhmad1tifphzIKQs/Mok+xKZHjT10wRwAnWpM4EXMXesXQJ7avCt6E94CrsZL6YPeKC4Q9T523XE5P4rKGCM5pQ9cAj+exv4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=Q2ZADykL; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 47TGuDVB019971;
	Thu, 29 Aug 2024 19:41:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	f6GosI4IkxOUyPuuOEHDH7rHFquPuxGUJilkq36iPwg=; b=Q2ZADykLIsp2Ui1N
	nR2O+439vlZRxJMgTXNMZPjYlu2txx0s7CsW4VMGRKucGk41cRy+L0wseL16Ul2y
	HXI3jmdHUyBnS0GPI3Wxq7rmT+ZWaDk3GGlhnURS5qBDJuYFBDDQwy++9AwgBPMe
	5DhDfkIh/qpL1UzpHtnfIh8cJ0nTBWyppYVOqH5Mz1Nxq8htgegYDYdk1ORgfBEB
	pSUruxPsr8ifSachz/b/gCE1FbwIizxqlk2DWA49bEpwQ4mzbRmXvdUZff7W3/4/
	9GwVEsMkl0Hpiyh8+19rbwEayj5EVVTboZTYHRbmUfUeHSXB/Jk8Rq9W+hra16at
	pg2dHA==
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 419putph4n-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 29 Aug 2024 19:41:26 +0000 (GMT)
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com [10.47.209.197])
	by NALASPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 47TJfP9I019289
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
Subject: [PATCH v26 04/33] usb: xhci: Allow for secondary interrupter to set IMOD
Date: Thu, 29 Aug 2024 12:40:36 -0700
Message-ID: <20240829194105.1504814-5-quic_wcheng@quicinc.com>
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
X-Proofpoint-GUID: 0KlNI5NaT8fy3F82RPrvJuS6HKvpsKNa
X-Proofpoint-ORIG-GUID: 0KlNI5NaT8fy3F82RPrvJuS6HKvpsKNa
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-08-29_06,2024-08-29_02,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015
 lowpriorityscore=0 mlxscore=0 phishscore=0 adultscore=0 priorityscore=1501
 impostorscore=0 malwarescore=0 suspectscore=0 spamscore=0 bulkscore=0
 mlxlogscore=675 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2407110000 definitions=main-2408290138

When creating a secondary interrupter, add an argument for XHCI sideband
clients to specify an interrupt moderation value for the interrupter
context.

Signed-off-by: Wesley Cheng <quic_wcheng@quicinc.com>
---
 drivers/usb/host/xhci-mem.c       | 4 +++-
 drivers/usb/host/xhci-sideband.c  | 4 ++--
 drivers/usb/host/xhci.c           | 4 ++--
 drivers/usb/host/xhci.h           | 5 ++++-
 include/linux/usb/xhci-sideband.h | 2 +-
 5 files changed, 12 insertions(+), 7 deletions(-)

diff --git a/drivers/usb/host/xhci-mem.c b/drivers/usb/host/xhci-mem.c
index 3100219d6496..48b1e6ac434b 100644
--- a/drivers/usb/host/xhci-mem.c
+++ b/drivers/usb/host/xhci-mem.c
@@ -2334,7 +2334,8 @@ xhci_add_interrupter(struct xhci_hcd *xhci, struct xhci_interrupter *ir,
 }
 
 struct xhci_interrupter *
-xhci_create_secondary_interrupter(struct usb_hcd *hcd, unsigned int segs)
+xhci_create_secondary_interrupter(struct usb_hcd *hcd, unsigned int segs,
+				  u32 imod_interval)
 {
 	struct xhci_hcd *xhci = hcd_to_xhci(hcd);
 	struct xhci_interrupter *ir;
@@ -2367,6 +2368,7 @@ xhci_create_secondary_interrupter(struct usb_hcd *hcd, unsigned int segs)
 		return NULL;
 	}
 
+	xhci_set_interrupter_moderation(ir, imod_interval);
 	xhci_dbg(xhci, "Add secondary interrupter %d, max interrupters %d\n",
 		 i, xhci->max_interrupters);
 
diff --git a/drivers/usb/host/xhci-sideband.c b/drivers/usb/host/xhci-sideband.c
index 4380a1910a19..324e1c45378a 100644
--- a/drivers/usb/host/xhci-sideband.c
+++ b/drivers/usb/host/xhci-sideband.c
@@ -259,7 +259,7 @@ EXPORT_SYMBOL_GPL(xhci_sideband_get_event_buffer);
  */
 int
 xhci_sideband_create_interrupter(struct xhci_sideband *sb, int num_seg,
-				 bool ip_autoclear)
+				 bool ip_autoclear, u32 imod_interval)
 {
 	int ret = 0;
 
@@ -273,7 +273,7 @@ xhci_sideband_create_interrupter(struct xhci_sideband *sb, int num_seg,
 	}
 
 	sb->ir = xhci_create_secondary_interrupter(xhci_to_hcd(sb->xhci),
-						   num_seg);
+						   num_seg, imod_interval);
 	if (!sb->ir) {
 		ret = -ENOMEM;
 		goto out;
diff --git a/drivers/usb/host/xhci.c b/drivers/usb/host/xhci.c
index 3a051ed32907..1fafba95d407 100644
--- a/drivers/usb/host/xhci.c
+++ b/drivers/usb/host/xhci.c
@@ -347,8 +347,8 @@ static int xhci_disable_interrupter(struct xhci_interrupter *ir)
 }
 
 /* interrupt moderation interval imod_interval in nanoseconds */
-static int xhci_set_interrupter_moderation(struct xhci_interrupter *ir,
-					   u32 imod_interval)
+int xhci_set_interrupter_moderation(struct xhci_interrupter *ir,
+				    u32 imod_interval)
 {
 	u32 imod;
 
diff --git a/drivers/usb/host/xhci.h b/drivers/usb/host/xhci.h
index 58236b435e1c..503784345787 100644
--- a/drivers/usb/host/xhci.h
+++ b/drivers/usb/host/xhci.h
@@ -1832,7 +1832,8 @@ struct xhci_container_ctx *xhci_alloc_container_ctx(struct xhci_hcd *xhci,
 void xhci_free_container_ctx(struct xhci_hcd *xhci,
 		struct xhci_container_ctx *ctx);
 struct xhci_interrupter *
-xhci_create_secondary_interrupter(struct usb_hcd *hcd, unsigned int segs);
+xhci_create_secondary_interrupter(struct usb_hcd *hcd, unsigned int segs,
+				  u32 imod_interval);
 void xhci_remove_secondary_interrupter(struct usb_hcd
 				       *hcd, struct xhci_interrupter *ir);
 
@@ -1872,6 +1873,8 @@ int xhci_alloc_tt_info(struct xhci_hcd *xhci,
 		struct xhci_virt_device *virt_dev,
 		struct usb_device *hdev,
 		struct usb_tt *tt, gfp_t mem_flags);
+int xhci_set_interrupter_moderation(struct xhci_interrupter *ir,
+				    u32 imod_interval);
 
 /* xHCI ring, segment, TRB, and TD functions */
 dma_addr_t xhci_trb_virt_to_dma(struct xhci_segment *seg, union xhci_trb *trb);
diff --git a/include/linux/usb/xhci-sideband.h b/include/linux/usb/xhci-sideband.h
index 6c11e240fbca..bc5b56a77e37 100644
--- a/include/linux/usb/xhci-sideband.h
+++ b/include/linux/usb/xhci-sideband.h
@@ -59,7 +59,7 @@ xhci_sideband_get_event_buffer(struct xhci_sideband *sb);
 
 int
 xhci_sideband_create_interrupter(struct xhci_sideband *sb, int num_seg,
-				 bool ip_autoclear);
+				 bool ip_autoclear, u32 imod_interval);
 
 void
 xhci_sideband_remove_interrupter(struct xhci_sideband *sb);

