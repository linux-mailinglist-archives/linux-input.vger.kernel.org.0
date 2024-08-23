Return-Path: <linux-input+bounces-5769-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E84B95D65B
	for <lists+linux-input@lfdr.de>; Fri, 23 Aug 2024 22:01:58 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 734991C211CC
	for <lists+linux-input@lfdr.de>; Fri, 23 Aug 2024 20:01:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EC9C1193087;
	Fri, 23 Aug 2024 20:01:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="OIPbGLHg"
X-Original-To: linux-input@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 52A6E192D6F;
	Fri, 23 Aug 2024 20:01:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724443300; cv=none; b=FDTVBVwyj6N9sOBn0t/2QqdcUhehciuQHg49z1CDJN1A2GWkAwTiGgtOpQJs5/yN5D5WGkjYUOgLUoQ6GUGV4C30RDI17RZU1MlG1jaRIkxNFkngAnrO5tIOu+B5pASCKqodG6C7CBaTFF8cUIzFJ70rAZGAN8syozL/y62g8So=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724443300; c=relaxed/simple;
	bh=aw59SIunqFIELS5Fh0+Q8lxZNWNSMCUFa1CSIJx6JvQ=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=DO07kbhYVQ+e6sqGf3gfVJ0rpdK1cn/G7/4Q+0h312GIZWojzp8V5wD7sFdTh7R1vDSs3Us6PElpko0yo9xxI4MDWLlO+iOhuAyu3AsrmTX+Jf9cs8KtHadMbfkpDeeH0FTHPbQs6omZhz3S6zJU3KeT7/TVgb1lGX/wbHdhjtQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=OIPbGLHg; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 47NBD2wA009021;
	Fri, 23 Aug 2024 20:01:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=EbpUGdZYWaz1gSCzAD70ouF4
	KW64zbhrUQmGahwL2ZM=; b=OIPbGLHgBM/uSttHDcD7BY9T0AzRWDNJiCh1Nb0E
	AIsFU6Qkyr1/Fk+f53/xKcjJtWUVHo9QakbjSrzCqK5maP5X0us2BeAFOZSgSxAP
	29pbePjghq92Ugo9lrtSeGcQ8Cg9NWeqFe2A8R53BjgsrFsGUxD/jwnEn8Sq77C4
	Ovh0u9ow2so3sXIPId56HS+zdp0Bbrf1wqaEz9T2FLcDWL+H5UXsZC73HEUer5Lm
	+LyJUDs3MTrp/ELNGssKgIIxaJ2HXXQTz1oVjH+lygpFE34VE8zcvaQMC2QmG3Na
	MzbPfd9A0bK9U98LJbvFkwAtRdu+ljT7wEKwRhir/ORENg==
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 414pe5v8ch-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 23 Aug 2024 20:01:16 +0000 (GMT)
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com [10.47.209.197])
	by NALASPPMTA04.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 47NK1EVG008329
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 23 Aug 2024 20:01:14 GMT
Received: from hu-wcheng-lv.qualcomm.com (10.49.16.6) by
 nalasex01b.na.qualcomm.com (10.47.209.197) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Fri, 23 Aug 2024 13:01:14 -0700
From: Wesley Cheng <quic_wcheng@quicinc.com>
To: <srinivas.kandagatla@linaro.org>, <mathias.nyman@intel.com>,
        <perex@perex.cz>, <conor+dt@kernel.org>, <dmitry.torokhov@gmail.com>,
        <corbet@lwn.net>, <broonie@kernel.org>, <lgirdwood@gmail.com>,
        <tiwai@suse.com>, <krzk+dt@kernel.org>, <Thinh.Nguyen@synopsys.com>,
        <bgoswami@quicinc.com>, <robh@kernel.org>,
        <gregkh@linuxfoundation.org>
CC: <linux-kernel@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-sound@vger.kernel.org>, <linux-usb@vger.kernel.org>,
        <linux-input@vger.kernel.org>, <linux-arm-msm@vger.kernel.org>,
        <linux-doc@vger.kernel.org>, <alsa-devel@alsa-project.org>,
        Wesley Cheng
	<quic_wcheng@quicinc.com>
Subject: [PATCH v25 04/33] usb: xhci: Allow for secondary interrupter to set IMOD
Date: Fri, 23 Aug 2024 13:00:32 -0700
Message-ID: <20240823200101.26755-5-quic_wcheng@quicinc.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20240823200101.26755-1-quic_wcheng@quicinc.com>
References: <20240823200101.26755-1-quic_wcheng@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain
X-ClientProxiedBy: nalasex01a.na.qualcomm.com (10.47.209.196) To
 nalasex01b.na.qualcomm.com (10.47.209.197)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: kUAMkixSalBMAvNgxvAJbo6QLoj3pMjW
X-Proofpoint-GUID: kUAMkixSalBMAvNgxvAJbo6QLoj3pMjW
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-08-23_16,2024-08-23_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0 suspectscore=0
 mlxscore=0 lowpriorityscore=0 adultscore=0 priorityscore=1501
 impostorscore=0 clxscore=1015 spamscore=0 mlxlogscore=675 phishscore=0
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2407110000 definitions=main-2408230147

When creating a secondary interrupter, add an argument for XHCI sideband
clients to specify an interrupt moderation value for the interrupter
context.

Signed-off-by: Wesley Cheng <quic_wcheng@quicinc.com>
---
 drivers/usb/host/xhci-mem.c       | 4 +++-
 drivers/usb/host/xhci-sideband.c  | 4 ++--
 drivers/usb/host/xhci.c           | 2 +-
 drivers/usb/host/xhci.h           | 5 ++++-
 include/linux/usb/xhci-sideband.h | 2 +-
 5 files changed, 11 insertions(+), 6 deletions(-)

diff --git a/drivers/usb/host/xhci-mem.c b/drivers/usb/host/xhci-mem.c
index 3100219d6496..2ca5937b73f4 100644
--- a/drivers/usb/host/xhci-mem.c
+++ b/drivers/usb/host/xhci-mem.c
@@ -2334,7 +2334,8 @@ xhci_add_interrupter(struct xhci_hcd *xhci, struct xhci_interrupter *ir,
 }
 
 struct xhci_interrupter *
-xhci_create_secondary_interrupter(struct usb_hcd *hcd, unsigned int segs)
+xhci_create_secondary_interrupter(struct usb_hcd *hcd, unsigned int segs,
+					u32 imod_interval)
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
index 281ab4c1fc42..f06bb49ede4d 100644
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
-			num_seg);
+			num_seg, imod_interval);
 	if (!sb->ir) {
 		ret = -ENOMEM;
 		goto out;
diff --git a/drivers/usb/host/xhci.c b/drivers/usb/host/xhci.c
index 3a051ed32907..0b22342bbff1 100644
--- a/drivers/usb/host/xhci.c
+++ b/drivers/usb/host/xhci.c
@@ -347,7 +347,7 @@ static int xhci_disable_interrupter(struct xhci_interrupter *ir)
 }
 
 /* interrupt moderation interval imod_interval in nanoseconds */
-static int xhci_set_interrupter_moderation(struct xhci_interrupter *ir,
+int xhci_set_interrupter_moderation(struct xhci_interrupter *ir,
 					   u32 imod_interval)
 {
 	u32 imod;
diff --git a/drivers/usb/host/xhci.h b/drivers/usb/host/xhci.h
index 58236b435e1c..a2db8250b1fd 100644
--- a/drivers/usb/host/xhci.h
+++ b/drivers/usb/host/xhci.h
@@ -1832,7 +1832,8 @@ struct xhci_container_ctx *xhci_alloc_container_ctx(struct xhci_hcd *xhci,
 void xhci_free_container_ctx(struct xhci_hcd *xhci,
 		struct xhci_container_ctx *ctx);
 struct xhci_interrupter *
-xhci_create_secondary_interrupter(struct usb_hcd *hcd, unsigned int segs);
+xhci_create_secondary_interrupter(struct usb_hcd *hcd, unsigned int segs,
+					u32 imod_interval);
 void xhci_remove_secondary_interrupter(struct usb_hcd
 				       *hcd, struct xhci_interrupter *ir);
 
@@ -1872,6 +1873,8 @@ int xhci_alloc_tt_info(struct xhci_hcd *xhci,
 		struct xhci_virt_device *virt_dev,
 		struct usb_device *hdev,
 		struct usb_tt *tt, gfp_t mem_flags);
+int xhci_set_interrupter_moderation(struct xhci_interrupter *ir,
+					   u32 imod_interval);
 
 /* xHCI ring, segment, TRB, and TD functions */
 dma_addr_t xhci_trb_virt_to_dma(struct xhci_segment *seg, union xhci_trb *trb);
diff --git a/include/linux/usb/xhci-sideband.h b/include/linux/usb/xhci-sideband.h
index a03f0958ebed..dd4b1a27c08d 100644
--- a/include/linux/usb/xhci-sideband.h
+++ b/include/linux/usb/xhci-sideband.h
@@ -56,7 +56,7 @@ xhci_sideband_get_event_buffer(struct xhci_sideband *sb);
 
 int
 xhci_sideband_create_interrupter(struct xhci_sideband *sb, int num_seg,
-				 bool ip_autoclear);
+				 bool ip_autoclear, u32 imod_interval);
 
 void
 xhci_sideband_remove_interrupter(struct xhci_sideband *sb);

