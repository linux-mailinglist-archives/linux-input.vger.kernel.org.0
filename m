Return-Path: <linux-input+bounces-11652-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id AC498A830D0
	for <lists+linux-input@lfdr.de>; Wed,  9 Apr 2025 21:50:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 6B34919E7163
	for <lists+linux-input@lfdr.de>; Wed,  9 Apr 2025 19:50:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 34BF28BEA;
	Wed,  9 Apr 2025 19:48:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="Llo1WrXT"
X-Original-To: linux-input@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 40237212B3E;
	Wed,  9 Apr 2025 19:48:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744228121; cv=none; b=eucxG9gT3PDD7PObS/4eIznNyuauoAdMtyX/cQS+yeZ6SAtQB+wSUaQuIsa3qSEV0VunxG1Qm1WFmF20gnzsYdYExfH0mNAczGyVHN9BVQXW7dHqpgBXTS+H2u8Pgjek0C7WQj7bp0JnsZjH1OCcDbWD7Wce26TRUWJoNWCYy6I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744228121; c=relaxed/simple;
	bh=j/c6lBUb/+5zMcmoE9IPvHYGY8MPsPKhxhlYshndOKA=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=VOMbF55KoRecs+FfvrC3X6Nn/gwqF7iKObJg1tr0rX0EFaXzqZkJggmXUd3WyaE+3Y+jMtUiY+16WA4i1otFEpDxJTnqzBVzPSr+KJWXgpdYincF6FfTnqfEh5PFAjlHLqb3Y290/fkrndDLVH+AxMF9iJjzOL5DgMd0qoUV0xM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=Llo1WrXT; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 539HD7Sv015755;
	Wed, 9 Apr 2025 19:48:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	9t+5MC6CtzjYmpWFQEWwq0uUNuZ/YS/w2dz1hCFRDhs=; b=Llo1WrXT3EyjCtmB
	Ic4AniUqMcffpRZQJcTht7bjQX4r2QQ937o5ccwB3kClZRfK3qADMBOWinD+TP10
	LFa4NxdZ85B6g7UUKEQIIQe5XPAmNoa+akLFFXPDrF/6yLMB5l86JOWgGTWY6oPo
	UUAVabSHddJPGWI1qRqLGelOdQhLF7jwfAt2mqesxLkZdN8bcp6aUTha+M7q1rqJ
	/2us+jqKz8PcBbuND7Wkj7guSeB2Q1ZExwi8Ijf1iStkhdtUqkbJE8nCz4eB1nYc
	A3TqJYzQT6EIhOG7OPCNR3h7/IwtmIMYi9uihx42uYUmOL49tSADo3x5d4zPJfRA
	DVOEPg==
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45twd2vj6f-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 09 Apr 2025 19:48:20 +0000 (GMT)
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com [10.47.209.197])
	by NALASPPMTA05.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 539JmJIN002402
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 9 Apr 2025 19:48:19 GMT
Received: from hu-wcheng-lv.qualcomm.com (10.49.16.6) by
 nalasex01b.na.qualcomm.com (10.47.209.197) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Wed, 9 Apr 2025 12:48:19 -0700
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
Subject: [PATCH v38 13/31] ALSA: usb-audio: Allow for rediscovery of connected USB SND devices
Date: Wed, 9 Apr 2025 12:47:46 -0700
Message-ID: <20250409194804.3773260-14-quic_wcheng@quicinc.com>
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
X-Proofpoint-ORIG-GUID: PkXiFxUVfqEXPwUxB2m2woZgBawYnTZ7
X-Proofpoint-GUID: PkXiFxUVfqEXPwUxB2m2woZgBawYnTZ7
X-Authority-Analysis: v=2.4 cv=NaLm13D4 c=1 sm=1 tr=0 ts=67f6cf04 cx=c_pps a=ouPCqIW2jiPt+lZRy3xVPw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17 a=3H110R4YSZwA:10 a=XR8D0OoHHMoA:10 a=COk6AnOGAAAA:8 a=Lm6deZJNLIjBs02OztQA:9 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-09_06,2025-04-08_04,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 impostorscore=0
 priorityscore=1501 adultscore=0 malwarescore=0 suspectscore=0
 lowpriorityscore=0 bulkscore=0 mlxlogscore=999 clxscore=1015 phishscore=0
 spamscore=0 classifier=spam authscore=0 authtc=n/a authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2504090132

In case of notifying SND platform drivers of connection events, some of
these use cases, such as offloading, require an ASoC USB backend device to
be initialized before the events can be handled.  If the USB backend device
has not yet been probed, this leads to missing initial USB audio device
connection events.

Expose an API that traverses the usb_chip array for connected devices, and
to call the respective connection callback registered to the SND platform
driver.

Signed-off-by: Wesley Cheng <quic_wcheng@quicinc.com>
---
 sound/usb/card.c | 21 +++++++++++++++++++++
 sound/usb/card.h |  2 ++
 2 files changed, 23 insertions(+)

diff --git a/sound/usb/card.c b/sound/usb/card.c
index 4ac7f2b8309a..9fb8726a6c93 100644
--- a/sound/usb/card.c
+++ b/sound/usb/card.c
@@ -155,6 +155,27 @@ int snd_usb_unregister_platform_ops(void)
 }
 EXPORT_SYMBOL_GPL(snd_usb_unregister_platform_ops);
 
+/*
+ * in case the platform driver was not ready at the time of USB SND
+ * device connect, expose an API to discover all connected USB devices
+ * so it can populate any dependent resources/structures.
+ */
+void snd_usb_rediscover_devices(void)
+{
+	int i;
+
+	guard(mutex)(&register_mutex);
+
+	if (!platform_ops || !platform_ops->connect_cb)
+		return;
+
+	for (i = 0; i < SNDRV_CARDS; i++) {
+		if (usb_chip[i])
+			platform_ops->connect_cb(usb_chip[i]);
+	}
+}
+EXPORT_SYMBOL_GPL(snd_usb_rediscover_devices);
+
 /*
  * Checks to see if requested audio profile, i.e sample rate, # of
  * channels, etc... is supported by the substream associated to the
diff --git a/sound/usb/card.h b/sound/usb/card.h
index d8b8522e1613..94404c24d240 100644
--- a/sound/usb/card.h
+++ b/sound/usb/card.h
@@ -222,4 +222,6 @@ snd_usb_find_suppported_substream(int card_idx, struct snd_pcm_hw_params *params
 
 int snd_usb_register_platform_ops(struct snd_usb_platform_ops *ops);
 int snd_usb_unregister_platform_ops(void);
+
+void snd_usb_rediscover_devices(void);
 #endif /* __USBAUDIO_CARD_H */

