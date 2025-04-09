Return-Path: <linux-input+bounces-11649-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E55EA830C3
	for <lists+linux-input@lfdr.de>; Wed,  9 Apr 2025 21:49:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 77D7D19E7C6C
	for <lists+linux-input@lfdr.de>; Wed,  9 Apr 2025 19:49:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BCE8D214216;
	Wed,  9 Apr 2025 19:48:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="e2S6XtIj"
X-Original-To: linux-input@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 240912101B3;
	Wed,  9 Apr 2025 19:48:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744228118; cv=none; b=Fi5IZB1ZEQbHplpTvvmyrjJv2sUdj2/k0GHL0cuJgOSRnwyD8qNTSJbvqlTL7rXk5oKqa1BukunhNBEXaI8fNq54xMI56lpWVK34BhqQ/4DvnRmwmkEq3z0o1u6hbOI3tRK/SIfM67mwanGfbf2WQWF+UvX0nSPCapKqeQ2S8VE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744228118; c=relaxed/simple;
	bh=iCtHLk33YvZVAWXt7i5RyMq9fMhcsg+qWem2feATC5g=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=t7hT7bVaO7mSjZvNcRoXW6BR6Q11xIy2c5n3melxRPs6+n3IUgnkusWwoDKTlgKZIT9lPell+85dGJ31xkWZSPxpqFhQwTPF1nVptopCLYGlEyV3RU42QPzvpl2Aj9tZo3L++huDpD6C9Q/+0B8vuJsCxlSau080dVOrY/ylHTA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=e2S6XtIj; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 539HE1fJ005921;
	Wed, 9 Apr 2025 19:48:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	coBhNxrqtvBjPYHNF8KL0UPazsmtH2wkILUKTEDK9Ns=; b=e2S6XtIjbzWLlY6q
	fo78D1uUsMyMxOYWpZpFxhOCCARzdl7gtnOj53Rdl5NISfNXMnxpL+wNkS3PjSgL
	70tEo+M+3hg4xC0hMGnMvLL2d5t+d9SMSxs87U09EsqbZbkJTjL1flpu1nJEWpbu
	rmwPcMu9ifoOcazPSOK/2R4xChDjn523xVqP5Hj4eXGA+3rDAAH8R9smBy/HmEaL
	MKDHlV5LvWRMHS+QQb1C9y4E6jbMzrNW61NJYB18EI/S5ggeLZwPuit98n+AjQoH
	aQ/7SeNwiIzmDniW9t/3jcqHYEwzdTbufT0kq1aJAtTNWmw3A+yl4Ak+uTBOEXX2
	Hulo6w==
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45twtb4pc5-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 09 Apr 2025 19:48:25 +0000 (GMT)
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com [10.47.209.197])
	by NALASPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 539JmOYE031475
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 9 Apr 2025 19:48:24 GMT
Received: from hu-wcheng-lv.qualcomm.com (10.49.16.6) by
 nalasex01b.na.qualcomm.com (10.47.209.197) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Wed, 9 Apr 2025 12:48:24 -0700
From: Wesley Cheng <quic_wcheng@quicinc.com>
To: <srinivas.kandagatla@linaro.org>, <mathias.nyman@intel.com>,
        <perex@perex.cz>, <conor+dt@kernel.org>, <dmitry.torokhov@gmail.com>,
        <corbet@lwn.net>, <broonie@kernel.org>, <lgirdwood@gmail.com>,
        <robh@kernel.org>, <krzk+dt@kernel.org>,
        <pierre-louis.bossart@linux.intel.com>, <Thinh.Nguyen@synopsys.com>,
        <tiwai@suse.com>, <gregkh@linuxfoundation.org>
CC: <linux-kernel@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-sound@vger.kernel.org>, <linux-input@vger.kernel.org>,
        <linux-usb@vger.kernel.org>, <linux-arm-msm@vger.kernel.org>,
        <linux-doc@vger.kernel.org>, Wesley Cheng <quic_wcheng@quicinc.com>
Subject: [PATCH v38 31/31] ALSA: usb-audio: qcom: Notify USB audio devices on USB offload probing
Date: Wed, 9 Apr 2025 12:48:04 -0700
Message-ID: <20250409194804.3773260-32-quic_wcheng@quicinc.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250409194804.3773260-1-quic_wcheng@quicinc.com>
References: <20250409194804.3773260-1-quic_wcheng@quicinc.com>
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
X-Proofpoint-GUID: NyMvLVILQomADtA_HpADUenBomJUU4EG
X-Authority-Analysis: v=2.4 cv=LLlmQIW9 c=1 sm=1 tr=0 ts=67f6cf09 cx=c_pps a=ouPCqIW2jiPt+lZRy3xVPw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17 a=3H110R4YSZwA:10 a=XR8D0OoHHMoA:10 a=COk6AnOGAAAA:8 a=0R9NKns1a96QCZ5VGfgA:9 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: NyMvLVILQomADtA_HpADUenBomJUU4EG
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-09_06,2025-04-08_04,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0 bulkscore=0
 clxscore=1015 mlxlogscore=999 malwarescore=0 phishscore=0
 lowpriorityscore=0 priorityscore=1501 mlxscore=0 spamscore=0 adultscore=0
 suspectscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2504090132

If the vendor USB offload class driver is not ready/initialized before USB
SND discovers attached devices, utilize snd_usb_rediscover_devices() to
find all currently attached devices, so that the ASoC entities are notified
on available USB audio devices.

Signed-off-by: Wesley Cheng <quic_wcheng@quicinc.com>
---
 sound/usb/qcom/qc_audio_offload.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/sound/usb/qcom/qc_audio_offload.c b/sound/usb/qcom/qc_audio_offload.c
index 378249a264a3..5874eb5ba827 100644
--- a/sound/usb/qcom/qc_audio_offload.c
+++ b/sound/usb/qcom/qc_audio_offload.c
@@ -1952,6 +1952,8 @@ static int qc_usb_audio_probe(struct auxiliary_device *auxdev,
 	if (ret < 0)
 		goto release_qmi;
 
+	snd_usb_rediscover_devices();
+
 	return 0;
 
 release_qmi:

