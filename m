Return-Path: <linux-input+bounces-11509-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 542D5A7B467
	for <lists+linux-input@lfdr.de>; Fri,  4 Apr 2025 02:39:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 4F7F117670E
	for <lists+linux-input@lfdr.de>; Fri,  4 Apr 2025 00:37:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 672981F09AF;
	Fri,  4 Apr 2025 00:28:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="mnnSuoTJ"
X-Original-To: linux-input@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DDEB51917D0;
	Fri,  4 Apr 2025 00:28:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743726483; cv=none; b=EiC/aH02Mq29+2ZLUbNNL+KGxNF5O5DW2RWa4OE7cae5v0ZbL3Qfwu1zbvZmRda5w8L5Gn3XZjvgLXtAAGGNAPhdM0Ly5iNn45PSsfI16E9UJidmoq5NLch4pl79iUv5IRQD+EZ5rdNNAXU5m1znta8VHzBqU8ssaAy7BmhQWz0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743726483; c=relaxed/simple;
	bh=kE4NonA73BCU12fxnroa0XQ7kxz6bynM/FWqYa+afzA=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=YlK4peCUoEIUM+/pKzkV0rNw0cFEUSm9ZU5WLfbf3jFb86eBRKSvlcHnbOZhUp5LPEci8fE677wwcHY0HRJBDWixwZ0uwqIpiMD2Bw8+mEh8nqtAlUzOCpKwVjiYGw9i3JZT7sz7cxHzHHS1GzsumzoFj40kQtAHkJ0CTdPttTA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=mnnSuoTJ; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 533NXAUb027094;
	Fri, 4 Apr 2025 00:27:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Q9NX9QH0yg232RbWCMRuDD8bMeZlMYDZWgoM+quwImc=; b=mnnSuoTJnJh/U2Pf
	mHuLRJlqnk9Vaw3IdWkoxtJR/F55R2paWHV5eL9F0iyKbjwMFMnCoQZuz2GKLq57
	RhVc8OLiqUYaf+vRIl9Tl9nMaRcddye4fO7QD8RAHzjdPes2uq301WghylscMy2v
	4iTq+uw8MoU2ehaAiSFf0JaBIcOC4Yzpo3DeDa6KU5es4fxvl2/eRdE/qPT7dqq7
	SJ+mA53m2sfzKmw1dbErdifL+QVue4pa5SrnAmMazlamLWCPU4EgqC4rn2qyUUEM
	UPv3TJwENEyQ/xEqb7X8kFrc9766ZqyTIZYVkBb7eAoHXnTOiJhNEMWThrEh1S0+
	gETs4w==
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45t2deg8r6-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 04 Apr 2025 00:27:48 +0000 (GMT)
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com [10.47.209.197])
	by NALASPPMTA03.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 5340RlVu013359
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 4 Apr 2025 00:27:47 GMT
Received: from hu-wcheng-lv.qualcomm.com (10.49.16.6) by
 nalasex01b.na.qualcomm.com (10.47.209.197) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Thu, 3 Apr 2025 17:27:46 -0700
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
Subject: [PATCH v37 29/31] ALSA: usb-audio: qcom: Don't allow USB offload path if PCM device is in use
Date: Thu, 3 Apr 2025 17:27:26 -0700
Message-ID: <20250404002728.3590501-30-quic_wcheng@quicinc.com>
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
X-Proofpoint-GUID: YLdNdqrArjgFiYrOpNZPuzBPaJAOYRm9
X-Proofpoint-ORIG-GUID: YLdNdqrArjgFiYrOpNZPuzBPaJAOYRm9
X-Authority-Analysis: v=2.4 cv=boxMBFai c=1 sm=1 tr=0 ts=67ef2784 cx=c_pps a=ouPCqIW2jiPt+lZRy3xVPw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17 a=hd6Mmwxu1EEWD_7P:21 a=3H110R4YSZwA:10 a=XR8D0OoHHMoA:10 a=COk6AnOGAAAA:8 a=xMhJj1ptYhvQCmcriIMA:9
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-03_11,2025-04-03_03,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 lowpriorityscore=0 malwarescore=0 mlxlogscore=999 spamscore=0 phishscore=0
 clxscore=1015 impostorscore=0 bulkscore=0 suspectscore=0 adultscore=0
 mlxscore=0 classifier=spam authscore=0 authtc=n/a authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2504040001

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
index 87e74c949370..464c5106b420 100644
--- a/sound/usb/qcom/qc_audio_offload.c
+++ b/sound/usb/qcom/qc_audio_offload.c
@@ -1567,12 +1567,17 @@ static void handle_uaudio_stream_req(struct qmi_handle *handle,
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
@@ -1594,6 +1599,11 @@ static void handle_uaudio_stream_req(struct qmi_handle *handle,
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
@@ -1623,6 +1633,9 @@ static void handle_uaudio_stream_req(struct qmi_handle *handle,
 		}
 
 		disable_audio_stream(subs);
+		mutex_lock(&chip->mutex);
+		subs->opened = 0;
+		mutex_unlock(&chip->mutex);
 	}
 
 response:

