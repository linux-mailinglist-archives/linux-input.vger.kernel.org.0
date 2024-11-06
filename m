Return-Path: <linux-input+bounces-7915-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 17DE39BF6E4
	for <lists+linux-input@lfdr.de>; Wed,  6 Nov 2024 20:38:47 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 4A2001C24C86
	for <lists+linux-input@lfdr.de>; Wed,  6 Nov 2024 19:38:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C2A2C20F5BE;
	Wed,  6 Nov 2024 19:34:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="gIK8ELoJ"
X-Original-To: linux-input@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B41320D511;
	Wed,  6 Nov 2024 19:34:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730921693; cv=none; b=Adi6m4WR6RRDR38kB/IVUnG9sOoDGgZ9SPmrM40puK2cH+YLw70HP4OfXuUbjEmb4sGUNWZU+tZcznKkDSGpJ1V1u5ne5VXI/Qv55evWxVEW0q6UKQqEE/JwX2qW0XoJ11QyvwcfL5f30A2ryiooZCZQ1BL64wZBbB2n2Y59pRM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730921693; c=relaxed/simple;
	bh=dlA+a/A3s2H8Ik64s93JljXJruBfc1fYp3Gmv6QOOPQ=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=QdGSbWN1YPoGUOPAz4aKpyfsqw9KbipuUcMJfcejOZtvvGy3p3eJHKApCrca+i8IstBo29PFrrByc1lXXyT917HaadK0bRm0Anh3O+jlcFaaYnXPBQIpm6i2xWr8axNPmwpOffsQ162RxXOkVjWqsCneW78SWTGZt8Jr98KSRGc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=gIK8ELoJ; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4A6EQYMv002118;
	Wed, 6 Nov 2024 19:34:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	bWI9BC72pkjgdWXKFDEZd1bqI6IAUkLy1t0yA+scJnM=; b=gIK8ELoJ8ArI8cRo
	fAmtMjVmSyFxAbWWt20454tESkGjftYR0nqOtxnV8Omv4AIpUxb2q0ihnTjGKMlN
	6dqDzRFpTOedNmPfheL0jkggE2cIMF8XUbtHzZRXLYfi1KidCnjzVqN0XoKTZPc4
	Kps8KO1NOESg9RRlw9vYHdCI2DuSIFk+gY4mTM3cbs6fwfvL8D6OoUkerXpEegXb
	WPbN+rRXHPHL9eHLlLWPTFwOxhij9gsauEB54qQkaNl4GgFTywFGP49FGWjTGfre
	rVHUvRcIJmmmexMpaeOnsxEAElCB9K+Lbck1XQEgvTPYLi2r/CHbKAIIDWdEK1Nh
	kkLqHw==
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 42r072jf9t-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 06 Nov 2024 19:34:37 +0000 (GMT)
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com [10.47.209.197])
	by NALASPPMTA03.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 4A6JYb2x004033
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 6 Nov 2024 19:34:37 GMT
Received: from hu-wcheng-lv.qualcomm.com (10.49.16.6) by
 nalasex01b.na.qualcomm.com (10.47.209.197) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Wed, 6 Nov 2024 11:34:36 -0800
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
Subject: [PATCH v30 27/30] ALSA: usb-audio: qcom: Don't allow USB offload path if PCM device is in use
Date: Wed, 6 Nov 2024 11:34:10 -0800
Message-ID: <20241106193413.1730413-28-quic_wcheng@quicinc.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241106193413.1730413-1-quic_wcheng@quicinc.com>
References: <20241106193413.1730413-1-quic_wcheng@quicinc.com>
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
X-Proofpoint-ORIG-GUID: Gi_aM_1ogx2bc32PllNEFKQyeAboQ5z2
X-Proofpoint-GUID: Gi_aM_1ogx2bc32PllNEFKQyeAboQ5z2
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015
 priorityscore=1501 mlxscore=0 suspectscore=0 mlxlogscore=970 spamscore=0
 adultscore=0 malwarescore=0 phishscore=0 impostorscore=0 bulkscore=0
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2409260000 definitions=main-2411060149

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
index 4ef7c949a6ee..9e1c94d28461 100644
--- a/sound/usb/qcom/qc_audio_offload.c
+++ b/sound/usb/qcom/qc_audio_offload.c
@@ -1479,12 +1479,17 @@ static void handle_uaudio_stream_req(struct qmi_handle *handle,
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
@@ -1506,6 +1511,11 @@ static void handle_uaudio_stream_req(struct qmi_handle *handle,
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
@@ -1535,6 +1545,9 @@ static void handle_uaudio_stream_req(struct qmi_handle *handle,
 		}
 
 		disable_audio_stream(subs);
+		mutex_lock(&chip->mutex);
+		subs->opened = 0;
+		mutex_unlock(&chip->mutex);
 	}
 
 response:

