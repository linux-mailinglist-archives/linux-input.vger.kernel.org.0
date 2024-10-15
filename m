Return-Path: <linux-input+bounces-7458-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B81EB99F99D
	for <lists+linux-input@lfdr.de>; Tue, 15 Oct 2024 23:34:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 7C6DD282D18
	for <lists+linux-input@lfdr.de>; Tue, 15 Oct 2024 21:34:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0F35D205129;
	Tue, 15 Oct 2024 21:30:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="jflm0P0G"
X-Original-To: linux-input@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0DC261B0F0C;
	Tue, 15 Oct 2024 21:29:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729027801; cv=none; b=LkyjLh8XjUgtA5Zws3qINfUeg7+NbXJGjq1onchpuBaymRtdW4KsbODusgNa7ijz2KGvq8DBKFTIIU627Mp2eQcabQCQHKrAGS6EavPfz8pNwgSfujKCnIWdiVa+Fuzrf2WhjKF6Dreh2N8NdLRc3KiT6OC3IRNF8iO2lGsUpdY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729027801; c=relaxed/simple;
	bh=S7gNn/zMH9Mq7yohNCakzHW+ZK7IqUedqKKHCL3FDOU=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=HL7o2rh6sUPlhPPaFzJPQCY3e+WWXVrgGmxD2DvaHV8ODKZvYQPX62r7i8QDxyTQoz6HyBSGlTvRJ7vpaZnqOQuce3VfkKl2PQ6+FLkJzrHSIdDsuADNJoukBGfUbly5x748NAzKHVCzOsAyuy5FjWfgZ8z3oMfBGFo901R6gGQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=jflm0P0G; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 49FER2IW025730;
	Tue, 15 Oct 2024 21:29:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	c5gwoddCxMnmmFAKaTw4cQrxCONcapW95+AyW+pR6yQ=; b=jflm0P0GA1CY7UJI
	IUDDwpO2yBektHtxKVgIjP1nLkbgVHWJjmBLdPpMFh9FoU/PEmG2HdMmriowOF3A
	liH9Ro8KbdPwwfJSPldrNOe+Dtg0KJboiBL1DHJEonkPp4WxpspLQcQFhNFpj9qQ
	Sqkq6RlJ4bpLiDNKLQcRXEhdbyPvVJKSHsOSak/8O5qtVTE+v5Xq6tovWMYE2YCM
	yKCbCeEdKlMo9zSa2NNNOBkaalPWkS9NHntbFCGfFg1qYmp537HO1XL7pu4ezAGn
	xIVqlgWJLnym//wcsSAwVadHk8SqJ1Y4m0lUKrKTmf3ciLrpEjH+FfJuxwRkzKu6
	qbfBog==
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 429t5kh89h-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 15 Oct 2024 21:29:29 +0000 (GMT)
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com [10.47.209.197])
	by NALASPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 49FLTSPe022317
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 15 Oct 2024 21:29:28 GMT
Received: from hu-wcheng-lv.qualcomm.com (10.49.16.6) by
 nalasex01b.na.qualcomm.com (10.47.209.197) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Tue, 15 Oct 2024 14:29:28 -0700
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
        Wesley Cheng
	<quic_wcheng@quicinc.com>
Subject: [PATCH v29 05/33] usb: xhci: xhci-sideband: Set IMOD for xHCI sideband clients
Date: Tue, 15 Oct 2024 14:28:47 -0700
Message-ID: <20241015212915.1206789-6-quic_wcheng@quicinc.com>
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
X-Proofpoint-ORIG-GUID: 7k6m7wafILGF1agNjjMI426F17m3W6S-
X-Proofpoint-GUID: 7k6m7wafILGF1agNjjMI426F17m3W6S-
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0 impostorscore=0
 bulkscore=0 mlxscore=0 spamscore=0 lowpriorityscore=0 priorityscore=1501
 malwarescore=0 phishscore=0 clxscore=1015 suspectscore=0 mlxlogscore=664
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2409260000
 definitions=main-2410150143

When creating a secondary interrupter over xHCI, add an argument for
xHCI sideband clients to specify an interrupt moderation value for
the interrupter context assigned.

Signed-off-by: Wesley Cheng <quic_wcheng@quicinc.com>
---
 drivers/usb/host/xhci-sideband.c  | 4 ++--
 include/linux/usb/xhci-sideband.h | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/usb/host/xhci-sideband.c b/drivers/usb/host/xhci-sideband.c
index 69bc234818d2..248d9713570e 100644
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

