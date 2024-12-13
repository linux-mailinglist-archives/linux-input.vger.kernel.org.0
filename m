Return-Path: <linux-input+bounces-8551-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B9B59F1A8D
	for <lists+linux-input@lfdr.de>; Sat, 14 Dec 2024 00:57:15 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 8F99E188DFC6
	for <lists+linux-input@lfdr.de>; Fri, 13 Dec 2024 23:57:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4194C1F4716;
	Fri, 13 Dec 2024 23:54:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="d1giDtrm"
X-Original-To: linux-input@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E18961F0E52;
	Fri, 13 Dec 2024 23:54:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734134079; cv=none; b=MeF6VEuCyStjz7kSz8AjMlxiI/s8eUwWNN5UYed3P19z2XRw/+tJEPN15AnLVE/0fcvsgboD1UpJO6VhiWwy157c+u4/30EqDbj2V1vOeJZ1Wp+3hYOkzc0zId2sibN4Elpn5UMhNjUHK1x1RdS9o67VnLmk4wo4w0XlYiJHO8g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734134079; c=relaxed/simple;
	bh=A15vsAAJLz3IZcSEYuLJ42/mD2IejG7+PIUMm9Wn7ZQ=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=ZGG72Q+2acan8vQzrQz63K1sRrfo+Sk7M9e6Eie7XgiH7huE2iCF8KLReh4yrM8QfhlTnoUFXLeEXT9Y48bmBwLnHyU7GtEJQoSZIfz19Iu4GiMB7qoSpmincCJzN1mPrk9wG3JmofXfJ9f0RudPe7zVOqLZPLhcSXYznFm7T1w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=d1giDtrm; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4BDMH24i030094;
	Fri, 13 Dec 2024 23:54:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ShIyn0Y8PzNyoo0t5H+n9R+dLt6OY5Z7h+mklJUsyss=; b=d1giDtrmxH6xxuiZ
	+ftTuamHIsJHt8fd+4XGTgSiBcOVAgUFU5WJJeu3ojBqePq8oGqadSCAx9UCIdO3
	ELyvLTK3Za2OVlisvjLIM10b2KHPziedIISntbEoz28FPS0ISVQI0x+L2HaR/1oN
	u9mE27/nqmMcUyFerITJ8EZzCA+PRZpY7HMnA5WE7Hj1cQVsmWWo6ndI00egez9N
	MnairDXF9iP3DlS8WihEi98PFfPB535QKHz8UrfigGU7vKSa4haN+7k27H289ku5
	Sc23fk92Cg4Vh0MI9B7Pk2uLCKC9PDpLlXV7c90RRsN+nqKORUWYRSbAjd+o9vby
	BfjyUA==
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 43fwgen9a2-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 13 Dec 2024 23:54:15 +0000 (GMT)
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com [10.47.209.197])
	by NALASPPMTA04.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 4BDNsFQw008421
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 13 Dec 2024 23:54:15 GMT
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
        <linux-doc@vger.kernel.org>, Wesley Cheng <quic_wcheng@quicinc.com>
Subject: [PATCH v31 04/32] usb: host: xhci-mem: Allow for interrupter clients to choose specific index
Date: Fri, 13 Dec 2024 15:53:35 -0800
Message-ID: <20241213235403.4109199-5-quic_wcheng@quicinc.com>
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
X-Proofpoint-GUID: wU8NNkktFHv6Z1xowR6UTiRbvysPaGHA
X-Proofpoint-ORIG-GUID: wU8NNkktFHv6Z1xowR6UTiRbvysPaGHA
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 suspectscore=0 bulkscore=0 mlxlogscore=806 spamscore=0 clxscore=1015
 impostorscore=0 mlxscore=0 lowpriorityscore=0 malwarescore=0 phishscore=0
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2412130170

Some clients may operate only on a specific XHCI interrupter instance.
Allow for the associated class driver to request for the interrupter that
it requires.

Signed-off-by: Wesley Cheng <quic_wcheng@quicinc.com>
---
 drivers/usb/host/xhci-mem.c       | 24 ++++++++++++++----------
 drivers/usb/host/xhci-sideband.c  |  5 +++--
 drivers/usb/host/xhci.h           |  2 +-
 include/linux/usb/xhci-sideband.h |  2 +-
 4 files changed, 19 insertions(+), 14 deletions(-)

diff --git a/drivers/usb/host/xhci-mem.c b/drivers/usb/host/xhci-mem.c
index 84eb3b0f5f8d..b9e5396bfa7a 100644
--- a/drivers/usb/host/xhci-mem.c
+++ b/drivers/usb/host/xhci-mem.c
@@ -2332,14 +2332,15 @@ xhci_add_interrupter(struct xhci_hcd *xhci, struct xhci_interrupter *ir,
 
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
@@ -2347,15 +2348,18 @@ xhci_create_secondary_interrupter(struct usb_hcd *hcd, unsigned int segs,
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
@@ -2371,7 +2375,7 @@ xhci_create_secondary_interrupter(struct usb_hcd *hcd, unsigned int segs,
 			  i, imod_interval);
 
 	xhci_dbg(xhci, "Add secondary interrupter %d, max interrupters %d\n",
-		 i, xhci->max_interrupters);
+		 ir->intr_num, xhci->max_interrupters);
 
 	return ir;
 }
diff --git a/drivers/usb/host/xhci-sideband.c b/drivers/usb/host/xhci-sideband.c
index 821b015af9bb..baf252a3de48 100644
--- a/drivers/usb/host/xhci-sideband.c
+++ b/drivers/usb/host/xhci-sideband.c
@@ -259,7 +259,7 @@ EXPORT_SYMBOL_GPL(xhci_sideband_get_event_buffer);
  */
 int
 xhci_sideband_create_interrupter(struct xhci_sideband *sb, int num_seg,
-				 bool ip_autoclear, u32 imod_interval)
+				 bool ip_autoclear, u32 imod_interval, int intr_num)
 {
 	int ret = 0;
 
@@ -273,7 +273,8 @@ xhci_sideband_create_interrupter(struct xhci_sideband *sb, int num_seg,
 	}
 
 	sb->ir = xhci_create_secondary_interrupter(xhci_to_hcd(sb->xhci),
-						   num_seg, imod_interval);
+						   num_seg, imod_interval,
+						   intr_num);
 	if (!sb->ir) {
 		ret = -ENOMEM;
 		goto out;
diff --git a/drivers/usb/host/xhci.h b/drivers/usb/host/xhci.h
index 3791a6c6408c..22b75b5e3de1 100644
--- a/drivers/usb/host/xhci.h
+++ b/drivers/usb/host/xhci.h
@@ -1840,7 +1840,7 @@ void xhci_free_container_ctx(struct xhci_hcd *xhci,
 		struct xhci_container_ctx *ctx);
 struct xhci_interrupter *
 xhci_create_secondary_interrupter(struct usb_hcd *hcd, unsigned int segs,
-				  u32 imod_interval);
+				  u32 imod_interval, unsigned int intr_num);
 void xhci_remove_secondary_interrupter(struct usb_hcd
 				       *hcd, struct xhci_interrupter *ir);
 void xhci_skip_sec_intr_events(struct xhci_hcd *xhci,
diff --git a/include/linux/usb/xhci-sideband.h b/include/linux/usb/xhci-sideband.h
index 04c4ba604266..f6023b1b062b 100644
--- a/include/linux/usb/xhci-sideband.h
+++ b/include/linux/usb/xhci-sideband.h
@@ -65,7 +65,7 @@ struct sg_table *
 xhci_sideband_get_event_buffer(struct xhci_sideband *sb);
 int
 xhci_sideband_create_interrupter(struct xhci_sideband *sb, int num_seg,
-				 bool ip_autoclear, u32 imod_interval);
+				 bool ip_autoclear, u32 imod_interval, int intr_num);
 void
 xhci_sideband_remove_interrupter(struct xhci_sideband *sb);
 int

