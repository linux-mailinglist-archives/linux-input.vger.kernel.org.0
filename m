Return-Path: <linux-input+bounces-7907-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id AD01B9BF6B5
	for <lists+linux-input@lfdr.de>; Wed,  6 Nov 2024 20:36:02 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 3E9071F21A66
	for <lists+linux-input@lfdr.de>; Wed,  6 Nov 2024 19:36:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DFB3F20C309;
	Wed,  6 Nov 2024 19:34:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="pvQ20/tL"
X-Original-To: linux-input@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9521C20B1E9;
	Wed,  6 Nov 2024 19:34:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730921688; cv=none; b=oDGK/uTIL7ScoJv2RgOadlwuQ8X3eJn6qNwiL26JtwOzHoIBLecsFZK/crHyVrT95H28cBSeuWl/M1oxo+MfYSbO23NUCAkIqqa287Uw01NfVpcXjTPlWvjxl9e1dOf0ZOEzFcuyaLfT4xeUcfHC/unyI9u6q1q6VGfuKX9JshU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730921688; c=relaxed/simple;
	bh=S6FMCZqhVORDjmGIdqc8rXu1RNcS+gjVrsIOxyBtOW8=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=aMx9205ptmTp1yOJivwRlPlYnxDVcZ9zMPv8KQRuFASOKv3P3qDNr9+iH/ydgaq10fJe6djd1/71bVNJZCXBOZ3POjFQzkchEB+L6dHSYU0Z89P1FLUGGXA9WW+LpgOZn2+gFxX3G+fAgtEhVCZQTzdkQN+6tTg+Mlsi+9Exlcc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=pvQ20/tL; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4A6G9I1g024567;
	Wed, 6 Nov 2024 19:34:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	bioXrssGHt22KXnwOvG5MvHodH36aHbdDnMMtMovjy4=; b=pvQ20/tLlyO+N0T1
	h96RTp1rm2cFCPPaE0mjac2/IefoiEp0OLnEATzAjAX0ronTfi8KFBhRSYBiu6Mk
	D+kqPLpt7VYUogbjr3kkCq+NlPAVnG7G8n/l0Gj3P4UnrPKq7qpEzfqrVCE8F86h
	SAfJHCk2+8RTsmI8G12Ad3Bb1PL+qEVpJ8XHGLhy2zCoJEJ0DT89shUdB7BJFcq9
	wRWXLBcvvaKmwz9ZIGu8sBiU9AeBMrGxK00527b+sN8gnS/EVNfjZKHiK5WB7jtT
	gMLLxdovQY3qB/kexRt91lxFbIFNgpG0p6xOCFQfjM8XD1t2jw+N1nqLpPywXHOe
	wJN88A==
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 42r2ugt4yx-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 06 Nov 2024 19:34:31 +0000 (GMT)
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com [10.47.209.197])
	by NALASPPMTA03.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 4A6JYUC5003973
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 6 Nov 2024 19:34:30 GMT
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
        <linux-doc@vger.kernel.org>, Wesley Cheng <quic_wcheng@quicinc.com>
Subject: [PATCH v30 04/30] usb: host: xhci-mem: Allow for interrupter clients to choose specific index
Date: Wed, 6 Nov 2024 11:33:47 -0800
Message-ID: <20241106193413.1730413-5-quic_wcheng@quicinc.com>
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
X-Proofpoint-ORIG-GUID: gH_O-TLzL0txk96D-5qOX6fYa_B78s-f
X-Proofpoint-GUID: gH_O-TLzL0txk96D-5qOX6fYa_B78s-f
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 adultscore=0 mlxscore=0 suspectscore=0 priorityscore=1501 phishscore=0
 clxscore=1015 impostorscore=0 malwarescore=0 bulkscore=0 mlxlogscore=760
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2409260000 definitions=main-2411060149

Some clients may operate only on a specific XHCI interrupter instance.
Allow for the associated class driver to request for the interrupter that
it requires.

Signed-off-by: Wesley Cheng <quic_wcheng@quicinc.com>
---
 drivers/usb/host/xhci-mem.c       | 24 ++++++++++++++----------
 drivers/usb/host/xhci-sec-intr.c  |  5 +++--
 drivers/usb/host/xhci.h           |  2 +-
 include/linux/usb/xhci-sec-intr.h |  2 +-
 4 files changed, 19 insertions(+), 14 deletions(-)

diff --git a/drivers/usb/host/xhci-mem.c b/drivers/usb/host/xhci-mem.c
index f6cfc989e28e..598d0b92c6fe 100644
--- a/drivers/usb/host/xhci-mem.c
+++ b/drivers/usb/host/xhci-mem.c
@@ -2338,14 +2338,15 @@ xhci_add_interrupter(struct xhci_hcd *xhci, struct xhci_interrupter *ir,
 
 struct xhci_interrupter *
 xhci_create_secondary_interrupter(struct usb_hcd *hcd, unsigned int segs,
-				  u32 imod_interval)
+				  u32 imod_interval, unsigned int intr_num)
 {
 	struct xhci_hcd *xhci = hcd_to_xhci(hcd);
 	struct xhci_interrupter *ir;
 	unsigned int i;
 	int err = -ENOSPC;
 
-	if (!xhci->interrupters || xhci->max_interrupters <= 1)
+	if (!xhci->interrupters || xhci->max_interrupters <= 1 ||
+	    intr_num >= xhci->max_interrupters)
 		return NULL;
 
 	ir = xhci_alloc_interrupter(xhci, segs, GFP_KERNEL);
@@ -2353,15 +2354,18 @@ xhci_create_secondary_interrupter(struct usb_hcd *hcd, unsigned int segs,
 		return NULL;
 
 	spin_lock_irq(&xhci->lock);
-
-	/* Find available secondary interrupter, interrupter 0 is reserved for primary */
-	for (i = 1; i < xhci->max_interrupters; i++) {
-		if (xhci->interrupters[i] == NULL) {
-			err = xhci_add_interrupter(xhci, ir, i);
-			break;
+	if (!intr_num) {
+		/* Find available secondary interrupter, interrupter 0 is reserved for primary */
+		for (i = 1; i < xhci->max_interrupters; i++) {
+			if (!xhci->interrupters[i]) {
+				err = xhci_add_interrupter(xhci, ir, i);
+				break;
+			}
 		}
+	} else {
+		if (!xhci->interrupters[intr_num])
+			err = xhci_add_interrupter(xhci, ir, intr_num);
 	}
-
 	spin_unlock_irq(&xhci->lock);
 
 	if (err) {
@@ -2377,7 +2381,7 @@ xhci_create_secondary_interrupter(struct usb_hcd *hcd, unsigned int segs,
 			  i, imod_interval);
 
 	xhci_dbg(xhci, "Add secondary interrupter %d, max interrupters %d\n",
-		 i, xhci->max_interrupters);
+		 ir->intr_num, xhci->max_interrupters);
 
 	return ir;
 }
diff --git a/drivers/usb/host/xhci-sec-intr.c b/drivers/usb/host/xhci-sec-intr.c
index b112c3388368..80d889979f30 100644
--- a/drivers/usb/host/xhci-sec-intr.c
+++ b/drivers/usb/host/xhci-sec-intr.c
@@ -273,7 +273,7 @@ EXPORT_SYMBOL_GPL(xhci_sec_intr_get_event_buffer);
  */
 int
 xhci_sec_intr_create_interrupter(struct xhci_sec_intr *si, int num_seg,
-				 bool ip_autoclear, u32 imod_interval)
+				 bool ip_autoclear, u32 imod_interval, int intr_num)
 {
 	int ret = 0;
 
@@ -287,7 +287,8 @@ xhci_sec_intr_create_interrupter(struct xhci_sec_intr *si, int num_seg,
 	}
 
 	si->ir = xhci_create_secondary_interrupter(xhci_to_hcd(si->xhci),
-						   num_seg, imod_interval);
+						   num_seg, imod_interval,
+						   intr_num);
 	if (!si->ir) {
 		ret = -ENOMEM;
 		goto out;
diff --git a/drivers/usb/host/xhci.h b/drivers/usb/host/xhci.h
index cde0105a7f1e..a95adbfc583b 100644
--- a/drivers/usb/host/xhci.h
+++ b/drivers/usb/host/xhci.h
@@ -1833,7 +1833,7 @@ void xhci_free_container_ctx(struct xhci_hcd *xhci,
 		struct xhci_container_ctx *ctx);
 struct xhci_interrupter *
 xhci_create_secondary_interrupter(struct usb_hcd *hcd, unsigned int segs,
-				  u32 imod_interval);
+				  u32 imod_interval, unsigned int intr_num);
 void xhci_remove_secondary_interrupter(struct usb_hcd
 				       *hcd, struct xhci_interrupter *ir);
 void xhci_skip_sec_intr_events(struct xhci_hcd *xhci,
diff --git a/include/linux/usb/xhci-sec-intr.h b/include/linux/usb/xhci-sec-intr.h
index f6edb27b1d99..6e9b891bdced 100644
--- a/include/linux/usb/xhci-sec-intr.h
+++ b/include/linux/usb/xhci-sec-intr.h
@@ -59,7 +59,7 @@ xhci_sec_intr_get_event_buffer(struct xhci_sec_intr *si);
 
 int
 xhci_sec_intr_create_interrupter(struct xhci_sec_intr *si, int num_seg,
-				 bool ip_autoclear, u32 imod_interval);
+				 bool ip_autoclear, u32 imod_interval, int intr_num);
 
 void
 xhci_sec_intr_remove_interrupter(struct xhci_sec_intr *si);

