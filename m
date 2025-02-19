Return-Path: <linux-input+bounces-10160-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id F3DB3A3AD89
	for <lists+linux-input@lfdr.de>; Wed, 19 Feb 2025 01:50:05 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 9D89C1897194
	for <lists+linux-input@lfdr.de>; Wed, 19 Feb 2025 00:50:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 948BE199EB2;
	Wed, 19 Feb 2025 00:48:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="D4dEBis4"
X-Original-To: linux-input@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C382E157487;
	Wed, 19 Feb 2025 00:48:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739926107; cv=none; b=iaAgi/Zyd3igW694JFc/HQ7IT/5YGI8njpBIOZVdaxKkuqfU3X8K/oy8QaN76nvyYLxrQcsPlZA+UwooCTjm3k0RHU22ZIWjfcb4HwUF1FjlRZ73MMFa1dzQ4qLvl4mBZuXJBb8fjBrA1RXle0TsqAl9EvmuFXKBVBN6UJEHZt8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739926107; c=relaxed/simple;
	bh=Hn9vHJKw5OJgxxFMYID4KrOcTyUNbtvVMhcSgcYso0o=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=DZ/f+YNMjUR8NFTUkJFRwlzSknnM9f0NXcdS+fcLhOSPnF8GnVGRjD26RyOaRrd1iJj6lKktqacElc/tLK9X7/BCC7R4eZ/Fv6ylQo1FVvf67Nf2qZ9Eilh5tL2jOinb+b7OWAQ8COWvCooWuyBw4qjyhpAiAqiC92P0O1DxTT0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=D4dEBis4; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 51IIwZRS022494;
	Wed, 19 Feb 2025 00:48:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	FhXGeTH1BMvYyfq4ziF7xnDpPIJZZkZPWWjvmi5bSa0=; b=D4dEBis4LDpAYVXP
	z7E8zjbkq/cy4RsP8WvQanGneZnR/A0KiurW7eEaLzkNcAXt8/faSKG5Wp4+Qj+X
	2AY0Sldba9+86iPaGAS5alcGOz5YX5Lq/6O/q/j9sr4KIx3s5e9Yo2r6LHhqaxPF
	EgMlNHcwR14ByZl7VU0kVZaAIaqI7eOr1Aci2qWArLHeghv7KPktiyLqqK8an/GO
	vQjPJqQgupbC5OorpT64Ra53+bmCRYD0NZbgqUGHvpUwOCYCtAuL1rbYAuZ9FC6j
	ihhhtttSKeMR5AKEUHveA5r6kIvu+d3hJg4sfbv7by1WEyVzF6teuZysPtM4eyCa
	b1d7Tw==
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 44vyy3gq17-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 19 Feb 2025 00:48:13 +0000 (GMT)
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com [10.47.209.197])
	by NALASPPMTA03.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 51J0mCiM010189
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 19 Feb 2025 00:48:12 GMT
Received: from hu-wcheng-lv.qualcomm.com (10.49.16.6) by
 nalasex01b.na.qualcomm.com (10.47.209.197) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Tue, 18 Feb 2025 16:48:12 -0800
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
Subject: [PATCH v35 29/31] ALSA: usb-audio: qcom: Don't allow USB offload path if PCM device is in use
Date: Tue, 18 Feb 2025 16:47:52 -0800
Message-ID: <20250219004754.497985-30-quic_wcheng@quicinc.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250219004754.497985-1-quic_wcheng@quicinc.com>
References: <20250219004754.497985-1-quic_wcheng@quicinc.com>
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
X-Proofpoint-GUID: dyfePnsfvsSEICdlVNUDYkV4ZJaqSLUE
X-Proofpoint-ORIG-GUID: dyfePnsfvsSEICdlVNUDYkV4ZJaqSLUE
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-18_11,2025-02-18_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 impostorscore=0 lowpriorityscore=0 suspectscore=0 spamscore=0
 malwarescore=0 phishscore=0 mlxscore=0 mlxlogscore=999 bulkscore=0
 adultscore=0 clxscore=1015 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2502100000 definitions=main-2502190004

Add proper checks and updates to the USB substream once receiving a USB QMI
stream enable request.  If the substream is already in use from the non
offload path, reject the stream enable request.  In addition, update the
USB substream opened parameter when enabling the offload path, so the
non offload path can be blocked.

Signed-off-by: Wesley Cheng <quic_wcheng@quicinc.com>
---
 sound/usb/qcom/qc_audio_offload.c | 15 ++++++++++++++-
 1 file changed, 14 insertions(+), 1 deletion(-)

diff --git a/sound/usb/qcom/qc_audio_offload.c b/sound/usb/qcom/qc_audio_offload.c
index 3319363a0fd0..370890f64355 100644
--- a/sound/usb/qcom/qc_audio_offload.c
+++ b/sound/usb/qcom/qc_audio_offload.c
@@ -1576,12 +1576,17 @@ static void handle_uaudio_stream_req(struct qmi_handle *handle,
 		goto response;
 	}
 
+	mutex_lock(&chip->mutex);
 	if (req_msg->enable) {
-		if (info_idx < 0 || chip->system_suspend) {
+		if (info_idx < 0 || chip->system_suspend || subs->opened) {
 			ret = -EBUSY;
+			mutex_unlock(&chip->mutex);
+
 			goto response;
 		}
+		subs->opened = 1;
 	}
+	mutex_unlock(&chip->mutex);
 
 	if (req_msg->service_interval_valid) {
 		ret = get_data_interval_from_si(subs,
@@ -1603,6 +1608,11 @@ static void handle_uaudio_stream_req(struct qmi_handle *handle,
 		if (!ret)
 			ret = prepare_qmi_response(subs, req_msg, &resp,
 						   info_idx);
+		if (ret < 0) {
+			mutex_lock(&chip->mutex);
+			subs->opened = 0;
+			mutex_unlock(&chip->mutex);
+		}
 	} else {
 		info = &uadev[pcm_card_num].info[info_idx];
 		if (info->data_ep_pipe) {
@@ -1632,6 +1642,9 @@ static void handle_uaudio_stream_req(struct qmi_handle *handle,
 		}
 
 		disable_audio_stream(subs);
+		mutex_lock(&chip->mutex);
+		subs->opened = 0;
+		mutex_unlock(&chip->mutex);
 	}
 
 response:

