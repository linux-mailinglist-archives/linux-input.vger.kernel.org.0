Return-Path: <linux-input+bounces-11512-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 5787DA7B4BF
	for <lists+linux-input@lfdr.de>; Fri,  4 Apr 2025 02:42:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 36317188547A
	for <lists+linux-input@lfdr.de>; Fri,  4 Apr 2025 00:38:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9D2131EEA3D;
	Fri,  4 Apr 2025 00:28:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="Ertbc6M7"
X-Original-To: linux-input@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 393DC193062;
	Fri,  4 Apr 2025 00:28:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743726484; cv=none; b=HU3lZs7ZerGn1znq1hSY/S6QYlMAurhYyVfUiCybw8CqQFn4rj9WvNWeBJ7xKOl6x47Vhsh5+9m7jn7iYHpvysdU8cgKyvrmjEMcw5OHwNjlOwdTbyN6u2+zuXhUbnn7H51WPSoUD4v7q+Z/jM0lNYlvLYQrOAIewYZWms/Ke+E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743726484; c=relaxed/simple;
	bh=+8wwm2JzJZfiOY9VmSBXyHJnyItRjvPuaM6UrPBoMyg=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=UffA59AvRgeEEyfIMRllctVZFiVhjwPyuv5nXLnAZas3igwwYy3Hh5b/HKGgIRYLkMfZzuBfD1+gUvLul+x3ryIXkhPg1A2eyV0KmyNUaxZCA7UB/OTxLAbslbgAXyKFQu6MwxffbMG6h4DJ4F8KEjzgH/dd5oZrxb+IbtCfbNo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=Ertbc6M7; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 533NXHaI031149;
	Fri, 4 Apr 2025 00:27:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	pHviY++geRE+pqH09QXFb93gWJ64h7kh5hxC8jpSzbA=; b=Ertbc6M7nAwSAcCr
	YuGn0aIlfeZ+wBpkSXondJPklLNaekPG4wkUbnQy/l+BJEpGPpw3wPGDjw+HIgzA
	uTRqM/NtP47EV2FzvD+u24DOFWrLDouYmaf+o1JC+CsxbYJcaun+oS93Kbq/YOjb
	BDVIqSgbBx8jMBnMWH+l0jWRhvmU1WSX5io23EVHXa+Wz2mFKRQiwCiZzrgCaMLl
	WweCCRWX53mgz5EFn55kGbiPwfTc0oZxFITznItBBiG6jUonLPcBDMHSbLgqCR6O
	ViaNEpBL0uAELGeO9Syi2hzsbpVp20suyrWih0q7EuyQ7FCE8ws/xVIhmqMwdaxW
	YUR3IA==
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45t2d908qj-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 04 Apr 2025 00:27:43 +0000 (GMT)
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com [10.47.209.197])
	by NALASPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 5340RgGl006294
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 4 Apr 2025 00:27:42 GMT
Received: from hu-wcheng-lv.qualcomm.com (10.49.16.6) by
 nalasex01b.na.qualcomm.com (10.47.209.197) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Thu, 3 Apr 2025 17:27:41 -0700
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
Subject: [PATCH v37 10/31] ALSA: usb-audio: Save UAC sample size information
Date: Thu, 3 Apr 2025 17:27:07 -0700
Message-ID: <20250404002728.3590501-11-quic_wcheng@quicinc.com>
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
X-Proofpoint-ORIG-GUID: aBpa871me7X-XFH09pr_R_Iyo0E4eT_e
X-Proofpoint-GUID: aBpa871me7X-XFH09pr_R_Iyo0E4eT_e
X-Authority-Analysis: v=2.4 cv=CPUqXQrD c=1 sm=1 tr=0 ts=67ef277f cx=c_pps a=ouPCqIW2jiPt+lZRy3xVPw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17 a=3H110R4YSZwA:10 a=XR8D0OoHHMoA:10 a=QyXUC8HyAAAA:8 a=COk6AnOGAAAA:8 a=OB-lhTx6MjRBhgu3pGAA:9
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-03_11,2025-04-03_03,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 impostorscore=0 clxscore=1015 malwarescore=0 suspectscore=0 spamscore=0
 phishscore=0 adultscore=0 mlxlogscore=999 mlxscore=0 bulkscore=0
 priorityscore=1501 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2504040001

Within the UAC descriptor, there is information describing the size of a
sample (bSubframeSize/bSubslotSize) and the number of relevant bits
(bBitResolution).  Currently, fmt_bits carries only the bit resolution,
however, some offloading entities may also require the overall size of the
sample.  Save this information in a separate parameter, as depending on the
UAC format type, the sample size can not easily be decoded from other
existing parameters.

Reviewed-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Signed-off-by: Wesley Cheng <quic_wcheng@quicinc.com>
---
 sound/usb/card.h   | 1 +
 sound/usb/format.c | 1 +
 2 files changed, 2 insertions(+)

diff --git a/sound/usb/card.h b/sound/usb/card.h
index 4f4f3f39b7fa..b65163c60176 100644
--- a/sound/usb/card.h
+++ b/sound/usb/card.h
@@ -15,6 +15,7 @@ struct audioformat {
 	unsigned int channels;		/* # channels */
 	unsigned int fmt_type;		/* USB audio format type (1-3) */
 	unsigned int fmt_bits;		/* number of significant bits */
+	unsigned int fmt_sz;		/* overall audio sub frame/slot size */
 	unsigned int frame_size;	/* samples per frame for non-audio */
 	unsigned char iface;		/* interface number */
 	unsigned char altsetting;	/* corresponding alternate setting */
diff --git a/sound/usb/format.c b/sound/usb/format.c
index 9d32b21a5fbb..8490d80ade36 100644
--- a/sound/usb/format.c
+++ b/sound/usb/format.c
@@ -85,6 +85,7 @@ static u64 parse_audio_format_i_type(struct snd_usb_audio *chip,
 	}
 
 	fp->fmt_bits = sample_width;
+	fp->fmt_sz = sample_bytes;
 
 	if ((pcm_formats == 0) &&
 	    (format == 0 || format == BIT(UAC_FORMAT_TYPE_I_UNDEFINED))) {

