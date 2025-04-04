Return-Path: <linux-input+bounces-11522-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C8BCA7B4DE
	for <lists+linux-input@lfdr.de>; Fri,  4 Apr 2025 02:43:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 87CF6189FB34
	for <lists+linux-input@lfdr.de>; Fri,  4 Apr 2025 00:40:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 829881F872F;
	Fri,  4 Apr 2025 00:28:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="FAnDRclz"
X-Original-To: linux-input@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 153BC1F4184;
	Fri,  4 Apr 2025 00:28:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743726488; cv=none; b=LAj6yDqooEZK8iS+cVRkHqUNLJ/nzLot7J7UHKF5F1zwsum0RSBCT5L7thONQSllefQz5ATTEcAeIoKpiDgzUPKZYO2QZ0KBt5DuuiflJgT8cVVEOrbzEjsJwvXTODMLyaR9+9t2CnVEvNJ2jLVffBuHzpDXHyg+Ms36mage3rc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743726488; c=relaxed/simple;
	bh=dDhKxAXZ45+Ucquw39gLMthlWFwBw6mrBIV5h3rGhKY=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=gzGR6v5URprDjwG7PSzO5XVj3H2subi7AQQGfpeXOYCAi/eikIGKx3uXeY36Sc/nkvD80Cw0Dgij6qF8BbZXW1krvtpKsP1Rve8rVePjmpmyAA0nVDN2pXDPJESfRWWVCcI5k1msNmIlpkutKBRIya3AsNbnVnPKEQ9fjW0037k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=FAnDRclz; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 533NXWvo026047;
	Fri, 4 Apr 2025 00:27:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	C70Mei9UlM5pP4fvoHMaFZBqI/xUKrmauwfnK0Lwc5I=; b=FAnDRclz3KdvesiC
	T4RtKJMwzhDLFsgGHq8aeBAfLkJ4LXmecUDaz2jDW2hFER0qndOzojwfnv/k5QNC
	CX8sGOiHi7XIaCeJKM1Z4Fsn+nBxYThJPutslRg8UCGF86PP961OuseJtcXWT78k
	sXJb8gzALqWHr3zYd6cNL2JrqUQrPywvvMVcaBNdoxbr2gCK4nVgzQhusxiXBolf
	Fb5TGFtmg0h6fJPXwcmrfRU/xlY/9zx6xDTBu9dnN6ZpT0orgtdacmx4pqB4XzKv
	iVwfC3hW3runn1arNuDMxn0Q8zCElyZ5SpilyM1uRfgYtv7jBKJ/aUEdTYOI9tmi
	IpqWtg==
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45t2d708q3-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 04 Apr 2025 00:27:41 +0000 (GMT)
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com [10.47.209.197])
	by NALASPPMTA05.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 5340ReQG010208
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 4 Apr 2025 00:27:40 GMT
Received: from hu-wcheng-lv.qualcomm.com (10.49.16.6) by
 nalasex01b.na.qualcomm.com (10.47.209.197) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Thu, 3 Apr 2025 17:27:40 -0700
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
        <linux-doc@vger.kernel.org>, Wesley Cheng <quic_wcheng@quicinc.com>,
        Puma Hsu
	<pumahsu@google.com>, Daehwan Jung <dh10.jung@samsung.com>
Subject: [PATCH v37 04/31] usb: host: xhci-plat: Set XHCI max interrupters if property is present
Date: Thu, 3 Apr 2025 17:27:01 -0700
Message-ID: <20250404002728.3590501-5-quic_wcheng@quicinc.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250404002728.3590501-1-quic_wcheng@quicinc.com>
References: <20250404002728.3590501-1-quic_wcheng@quicinc.com>
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
X-Authority-Analysis: v=2.4 cv=CfwI5Krl c=1 sm=1 tr=0 ts=67ef277d cx=c_pps a=ouPCqIW2jiPt+lZRy3xVPw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17 a=3H110R4YSZwA:10 a=XR8D0OoHHMoA:10 a=1XWaLZrsAAAA:8 a=hD80L64hAAAA:8 a=COk6AnOGAAAA:8 a=dEvupuCLpZ67s4bg89oA:9
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: 8bgrO57Y4ug4kMnRnINHFfER0FEAusQn
X-Proofpoint-GUID: 8bgrO57Y4ug4kMnRnINHFfER0FEAusQn
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-03_11,2025-04-03_03,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 phishscore=0 impostorscore=0 lowpriorityscore=0 bulkscore=0 adultscore=0
 mlxscore=0 mlxlogscore=999 suspectscore=0 clxscore=1015 spamscore=0
 malwarescore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2504040001

Some platforms may want to limit the number of XHCI interrupters allocated.
This is passed to xhci-plat as a device property.  Ensure that this is read
and the max_interrupters field is set.

Tested-by: Puma Hsu <pumahsu@google.com>
Tested-by: Daehwan Jung <dh10.jung@samsung.com>
Signed-off-by: Wesley Cheng <quic_wcheng@quicinc.com>
---
 drivers/usb/host/xhci-plat.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/usb/host/xhci-plat.c b/drivers/usb/host/xhci-plat.c
index 3155e3a842da..6dab142e7278 100644
--- a/drivers/usb/host/xhci-plat.c
+++ b/drivers/usb/host/xhci-plat.c
@@ -267,6 +267,8 @@ int xhci_plat_probe(struct platform_device *pdev, struct device *sysdev, const s
 
 		device_property_read_u32(tmpdev, "imod-interval-ns",
 					 &xhci->imod_interval);
+		device_property_read_u16(tmpdev, "num-hc-interrupters",
+					 &xhci->max_interrupters);
 	}
 
 	/*

