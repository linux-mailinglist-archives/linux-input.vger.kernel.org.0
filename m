Return-Path: <linux-input+bounces-10935-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 32442A681EA
	for <lists+linux-input@lfdr.de>; Wed, 19 Mar 2025 01:55:01 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 78D733BD9C8
	for <lists+linux-input@lfdr.de>; Wed, 19 Mar 2025 00:53:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D3F991C5D65;
	Wed, 19 Mar 2025 00:52:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="glVSwiBs"
X-Original-To: linux-input@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A9A9914D43D;
	Wed, 19 Mar 2025 00:52:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742345536; cv=none; b=WyQe6zuDwxYMjwLzl17H4CvR6w16VM6Rgki5HdOSpWugywGh6Bj5n3snmszBI+loNucf1wKYUEHLDxOAs5wxtKiwtJegYINV6QUdxFQQ6sC2uOddT0tn854sUhb3E+xMTL6bKM5UGrjORvcFTSHBihRYZqLwnJnzGQnX3HTssqI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742345536; c=relaxed/simple;
	bh=tHcXDwbmG9clKLv81IEEz9Giw5qRYs1/YjdseAv9Dbg=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=LXWQVmz9Cscr+HfeR78Lwf3O9D4/x4q1D+KQVbUVFWYTBA725N/bGPMtPTuGCUpQfFXBNzbbnXQovuNbqwjVliS2Ydkkk739f7WDsmlLBQlDfeUrLZV1dAGozmuixtCMkPTh1gdjYjGZ7+7ZGTOWjhF4p+TP19oCmbk3SETCi6k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=glVSwiBs; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 52IJienq022737;
	Wed, 19 Mar 2025 00:52:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Z7WMBFHQhktNaf8pql7zKR7DGPBcFESHbjhgEvWcI5U=; b=glVSwiBs6djJpD0c
	J40hbl/sivkbLZgY0lnEe0f59K7hzB4Ts44HQ8HkD5zuCl5lLL2Pi/2v/M4sOkHS
	+squSiEQe9NHmJkHuI1gPBFJOOgNEt7LV3jlYmdSk5u42ox2WGYdQyQuvty0AYVo
	hI5Ehi8FFvlCFgUp3pNnUrO/cIpUKghlCOTZmsPNtTVGl+w5cHI+cHjPpAp6oVy+
	0zxFQx2MJOYT6tBu8g+XQhT8hrTPTktSl3bXPS0QhkXtI7fXXOyDvY8WTnAgdtXZ
	Vi6uvq/rQEodBUJdfCKEwWw8Uyt6jcy+ijs0PaYIiDyQeEGejRz4P3uGrpn90zO9
	t7zmMQ==
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45exwx3hrn-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 19 Mar 2025 00:52:00 +0000 (GMT)
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com [10.47.209.197])
	by NALASPPMTA03.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 52J0q0Bt006594
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 19 Mar 2025 00:52:00 GMT
Received: from hu-wcheng-lv.qualcomm.com (10.49.16.6) by
 nalasex01b.na.qualcomm.com (10.47.209.197) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Tue, 18 Mar 2025 17:51:59 -0700
From: Wesley Cheng <quic_wcheng@quicinc.com>
To: <srinivas.kandagatla@linaro.org>, <mathias.nyman@intel.com>,
        <perex@perex.cz>, <conor+dt@kernel.org>, <dmitry.torokhov@gmail.com>,
        <corbet@lwn.net>, <broonie@kernel.org>, <lgirdwood@gmail.com>,
        <krzk+dt@kernel.org>, <pierre-louis.bossart@linux.intel.com>,
        <Thinh.Nguyen@synopsys.com>, <tiwai@suse.com>, <robh@kernel.org>,
        <gregkh@linuxfoundation.org>
CC: <linux-kernel@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-sound@vger.kernel.org>, <linux-input@vger.kernel.org>,
        <linux-usb@vger.kernel.org>, <linux-arm-msm@vger.kernel.org>,
        <linux-doc@vger.kernel.org>, Wesley Cheng <quic_wcheng@quicinc.com>
Subject: [PATCH v36 31/31] ALSA: usb-audio: qcom: Notify USB audio devices on USB offload probing
Date: Tue, 18 Mar 2025 17:51:41 -0700
Message-ID: <20250319005141.312805-32-quic_wcheng@quicinc.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250319005141.312805-1-quic_wcheng@quicinc.com>
References: <20250319005141.312805-1-quic_wcheng@quicinc.com>
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
X-Proofpoint-ORIG-GUID: jkD5seBvxtpwfKY3v3DbjE-nNgIK8KL-
X-Authority-Analysis: v=2.4 cv=INICChvG c=1 sm=1 tr=0 ts=67da1530 cx=c_pps a=ouPCqIW2jiPt+lZRy3xVPw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17 a=3H110R4YSZwA:10 a=Vs1iUdzkB0EA:10 a=COk6AnOGAAAA:8 a=0R9NKns1a96QCZ5VGfgA:9 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: jkD5seBvxtpwfKY3v3DbjE-nNgIK8KL-
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1093,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-18_10,2025-03-17_03,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0 adultscore=0
 priorityscore=1501 lowpriorityscore=0 malwarescore=0 clxscore=1015
 mlxlogscore=999 impostorscore=0 phishscore=0 mlxscore=0 spamscore=0
 bulkscore=0 classifier=spam authscore=0 authtc=n/a authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2503190003

If the vendor USB offload class driver is not ready/initialized before USB
SND discovers attached devices, utilize snd_usb_rediscover_devices() to
find all currently attached devices, so that the ASoC entities are notified
on available USB audio devices.

Signed-off-by: Wesley Cheng <quic_wcheng@quicinc.com>
---
 sound/usb/qcom/qc_audio_offload.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/sound/usb/qcom/qc_audio_offload.c b/sound/usb/qcom/qc_audio_offload.c
index 31624753284e..1a3688cc83d6 100644
--- a/sound/usb/qcom/qc_audio_offload.c
+++ b/sound/usb/qcom/qc_audio_offload.c
@@ -1966,6 +1966,8 @@ static int __init qc_usb_audio_offload_init(void)
 	if (ret < 0)
 		goto release_qmi;
 
+	snd_usb_rediscover_devices();
+
 	return 0;
 
 release_qmi:

