Return-Path: <linux-input+bounces-9303-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 85C17A145EE
	for <lists+linux-input@lfdr.de>; Fri, 17 Jan 2025 00:31:09 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id F345A3A4047
	for <lists+linux-input@lfdr.de>; Thu, 16 Jan 2025 23:31:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EBE8328EC8C;
	Thu, 16 Jan 2025 23:29:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="QF5sJhi3"
X-Original-To: linux-input@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 68D99242277;
	Thu, 16 Jan 2025 23:29:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737070146; cv=none; b=Kn8le4AOgPL5a1455KwSS2hCHS1Sa8fDKHY0VDlL9/olfK6kVfpvm+8ELIIGYkU1rXyxN8T2FZG4eqIiZxRRrSWtwLrelMysFTyRaKooY+Ttcvn3CyvsQNoXPvaWqGHHUZo8y+QTTfOSa1iUDnP4G7cSPZIdP24tRI691mZ6Q6E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737070146; c=relaxed/simple;
	bh=7KTBWtugZvhwX5n9aGwuLe/yTvWxyCu0S1Si9YBSypQ=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Q/YC1b3xdrHeKq037Cy+uCTzD7RsZPvggIjx/DR0pUox7pGUvjl1jSZvdrQTwMbfsvQd1akvCWRmPz9ZdNOdo7XPrKKtbg7TKNhhL83VIGEBnDhYIN20WZ3xxvA/euhsUijEcNEus10kxSFOprTw+G6BdVctJawQiupk2GWy7HY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=QF5sJhi3; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 50GKwnm8028777;
	Thu, 16 Jan 2025 23:28:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	SHieyDg2X64OItzOVzxhREShaPtGca6Zt5seT1MFC4U=; b=QF5sJhi3Bqvk6rSN
	SkbbHQuoNGLzi9Yq5gYi9sxJhsQPd4ljSt3XNkIdGG4KQFhXxUt/HCrMeKpxYCb/
	R+GRQSK097GmOHQg4vmJWRMzIQED2RaePkMZZKLbc+HEyt2SEygVgQ4KiNKuHM/U
	RdqTUMYuG4MObhHq09tshVUtCgK0zKO1et7gbD9ZvYNYq0q9ebJ9bAiFFlwYf19H
	rxoBca4erVxqYbSzbWIpI8dVvMnKkVHC5VGfKhzy6XuaSouqANcleaxDMQzyhXot
	2w4vpxBiOSM20flyak/AT9/8gNRoH6JttoeHyVgKbYWMWt3LSOOhdQGztqPsLfq7
	/Q0i5w==
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4479mf883c-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 16 Jan 2025 23:28:43 +0000 (GMT)
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com [10.47.209.197])
	by NALASPPMTA03.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 50GNSf8k031813
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 16 Jan 2025 23:28:42 GMT
Received: from hu-wcheng-lv.qualcomm.com (10.49.16.6) by
 nalasex01b.na.qualcomm.com (10.47.209.197) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Thu, 16 Jan 2025 15:28:41 -0800
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
Subject: [PATCH v33 03/31] usb: host: xhci-mem: Allow for interrupter clients to choose specific index
Date: Thu, 16 Jan 2025 15:27:56 -0800
Message-ID: <20250116232824.3748438-4-quic_wcheng@quicinc.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250116232824.3748438-1-quic_wcheng@quicinc.com>
References: <20250116232824.3748438-1-quic_wcheng@quicinc.com>
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
X-Proofpoint-GUID: YaLdhc8Eg5V2Kh512G-rMmBOegMLK_rO
X-Proofpoint-ORIG-GUID: YaLdhc8Eg5V2Kh512G-rMmBOegMLK_rO
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-01-16_10,2025-01-16_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0 bulkscore=0
 clxscore=1015 suspectscore=0 lowpriorityscore=0 priorityscore=1501
 mlxlogscore=807 mlxscore=0 malwarescore=0 phishscore=0 spamscore=0
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2501160174

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
index a9129f5e3dce..2f6e1ed4c678 100644
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
index 19c58ae60414..742bbc6c2d9b 100644
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
index ae604f37f757..06c69d0c7f99 100644
--- a/drivers/usb/host/xhci.h
+++ b/drivers/usb/host/xhci.h
@@ -1843,7 +1843,7 @@ void xhci_free_container_ctx(struct xhci_hcd *xhci,
 		struct xhci_container_ctx *ctx);
 struct xhci_interrupter *
 xhci_create_secondary_interrupter(struct usb_hcd *hcd, unsigned int segs,
-				  u32 imod_interval);
+				  u32 imod_interval, unsigned int intr_num);
 void xhci_remove_secondary_interrupter(struct usb_hcd
 				       *hcd, struct xhci_interrupter *ir);
 void xhci_skip_sec_intr_events(struct xhci_hcd *xhci,
diff --git a/include/linux/usb/xhci-sideband.h b/include/linux/usb/xhci-sideband.h
index 0f92335517ab..7ec23e6e27d0 100644
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

