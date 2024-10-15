Return-Path: <linux-input+bounces-7459-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3523399F9A3
	for <lists+linux-input@lfdr.de>; Tue, 15 Oct 2024 23:35:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 5948D1C2386B
	for <lists+linux-input@lfdr.de>; Tue, 15 Oct 2024 21:35:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9E4D51D6DB1;
	Tue, 15 Oct 2024 21:30:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="aC4zduTo"
X-Original-To: linux-input@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F6381B0F10;
	Tue, 15 Oct 2024 21:29:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729027802; cv=none; b=Vu4saJYD3J7MyOBZFCr1nyHQGXq6bIegLPmnvPqcjufBs7QohjO9n0qY5D9jtyd3OG0tKjMpTCNdVXEfghPmV3Pe4AZ3d54ULUQmklou3GFX39gTjPEWXPRRf8ajR8k6Ln+jSOJBfNrL7wCdK2YJSq4UdrDvYvjJJM6Nb94ln/s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729027802; c=relaxed/simple;
	bh=VHY/IpxLsqrKso/ubGG8dZw0luXv4oOhTYzevc+M8OA=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=WISwtP0LZrr0aN88Md6+taw1JgHyQevrXfBJib2JopY7+e0qMCWbGzwSpeLUPxpHpVmywFXLn4YzbDJDWiUqNj7slrIERPhkwOqmUeebMmQK9o3XawggxsDypiBoIbWVGrtaQs2wuVFelTxo4PNFChfPa5b58vq0crBMJGKT558=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=aC4zduTo; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 49FLBufs012627;
	Tue, 15 Oct 2024 21:29:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	R1FqWp+DRKYOUqlQ4LUib0IV2t85IXqXgjKgvw2+jyA=; b=aC4zduTonKotKL2C
	F4hKwoKfKpNdngCraez6P96o9PXQUgYdHVTjyqZgWzj8Nw7ZCsBJdkBUxZ1hyj9n
	C6C9KMVcOZ3Zjs8mJjglTjnCTKhV+F/J9aMm5676tMprrdEl5P4wN6oAJejGpE6r
	/4BJAt169twcyjsQfOZncyDIo2PLORf2n+GXpUOsnoHufdqf38i54vXy2TFIGV39
	BJEdX00eVsgtVA7l8yUwv7qJgvPDjjybInWNatAk49oMxrLXR91dvRUobFSXBc0G
	Ln5Nx1aEzfpP0a3/a0c/92fVO8ewdrKIdjW6rFIJXA/P5Z0Yeo5xe513ttPVy5i8
	/se6cA==
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 427g2rs46m-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 15 Oct 2024 21:29:28 +0000 (GMT)
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com [10.47.209.197])
	by NALASPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 49FLTR0B030469
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 15 Oct 2024 21:29:27 GMT
Received: from hu-wcheng-lv.qualcomm.com (10.49.16.6) by
 nalasex01b.na.qualcomm.com (10.47.209.197) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Tue, 15 Oct 2024 14:29:27 -0700
From: Wesley Cheng <quic_wcheng@quicinc.com>
To: <srinivas.kandagatla@linaro.org>, <mathias.nyman@intel.com>,
        <perex@perex.cz>, <conor+dt@kernel.org>, <dmitry.torokhov@gmail.com>,
        <corbet@lwn.net>, <lgirdwood@gmail.com>, <tiwai@suse.com>,
        <krzk+dt@kernel.org>, <pierre-louis.bossart@linux.intel.com>,
        <Thinh.Nguyen@synopsys.com>, <broonie@kernel.org>,
        <bgoswami@quicinc.com>, <robh@kernel.org>,
        <gregkh@linuxfoundation.org>
CC: <linux-kernel@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-sound@vger.kernel.org>, <linux-input@vger.kernel.org>,
        <linux-usb@vger.kernel.org>, <linux-arm-msm@vger.kernel.org>,
        <linux-doc@vger.kernel.org>, <alsa-devel@alsa-project.org>,
        Mathias Nyman
	<mathias.nyman@linux.intel.com>,
        Wesley Cheng <quic_wcheng@quicinc.com>
Subject: [PATCH v29 01/33] xhci: support setting interrupt moderation IMOD for secondary interrupters
Date: Tue, 15 Oct 2024 14:28:43 -0700
Message-ID: <20241015212915.1206789-2-quic_wcheng@quicinc.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241015212915.1206789-1-quic_wcheng@quicinc.com>
References: <20241015212915.1206789-1-quic_wcheng@quicinc.com>
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
X-Proofpoint-ORIG-GUID: BieIO-vRCV2mskKO2Wk8tdMgeNoS14lf
X-Proofpoint-GUID: BieIO-vRCV2mskKO2Wk8tdMgeNoS14lf
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 lowpriorityscore=0 suspectscore=0 phishscore=0 malwarescore=0
 clxscore=1015 spamscore=0 adultscore=0 mlxlogscore=722 impostorscore=0
 mlxscore=0 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2409260000 definitions=main-2410150143

From: Mathias Nyman <mathias.nyman@linux.intel.com>

Allow creators of xHCI secondary interrupters to specify the interrupt
moderation interval value in nanoseconds when creating the interrupter.

If not sure what value to use then use the xhci driver default
xhci->imod_interval

Suggested-by: Wesley Cheng <quic_wcheng@quicinc.com>
Signed-off-by: Mathias Nyman <mathias.nyman@linux.intel.com>
Link: https://lore.kernel.org/r/20240905143300.1959279-13-mathias.nyman@linux.intel.com
Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
---
 drivers/usb/host/xhci-mem.c | 8 +++++++-
 drivers/usb/host/xhci.c     | 4 ++--
 drivers/usb/host/xhci.h     | 5 ++++-
 3 files changed, 13 insertions(+), 4 deletions(-)

diff --git a/drivers/usb/host/xhci-mem.c b/drivers/usb/host/xhci-mem.c
index 3100219d6496..a25576f27e66 100644
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
@@ -2367,6 +2368,11 @@ xhci_create_secondary_interrupter(struct usb_hcd *hcd, unsigned int segs)
 		return NULL;
 	}
 
+	err = xhci_set_interrupter_moderation(ir, imod_interval);
+	if (err)
+		xhci_warn(xhci, "Failed to set interrupter %d moderation to %uns\n",
+			  i, imod_interval);
+
 	xhci_dbg(xhci, "Add secondary interrupter %d, max interrupters %d\n",
 		 i, xhci->max_interrupters);
 
diff --git a/drivers/usb/host/xhci.c b/drivers/usb/host/xhci.c
index 37eb37b0affa..ed1bb7ed44b0 100644
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
index 30415158ed3c..324644165d93 100644
--- a/drivers/usb/host/xhci.h
+++ b/drivers/usb/host/xhci.h
@@ -1827,7 +1827,8 @@ struct xhci_container_ctx *xhci_alloc_container_ctx(struct xhci_hcd *xhci,
 void xhci_free_container_ctx(struct xhci_hcd *xhci,
 		struct xhci_container_ctx *ctx);
 struct xhci_interrupter *
-xhci_create_secondary_interrupter(struct usb_hcd *hcd, unsigned int segs);
+xhci_create_secondary_interrupter(struct usb_hcd *hcd, unsigned int segs,
+				  u32 imod_interval);
 void xhci_remove_secondary_interrupter(struct usb_hcd
 				       *hcd, struct xhci_interrupter *ir);
 
@@ -1867,6 +1868,8 @@ int xhci_alloc_tt_info(struct xhci_hcd *xhci,
 		struct xhci_virt_device *virt_dev,
 		struct usb_device *hdev,
 		struct usb_tt *tt, gfp_t mem_flags);
+int xhci_set_interrupter_moderation(struct xhci_interrupter *ir,
+				    u32 imod_interval);
 
 /* xHCI ring, segment, TRB, and TD functions */
 dma_addr_t xhci_trb_virt_to_dma(struct xhci_segment *seg, union xhci_trb *trb);

