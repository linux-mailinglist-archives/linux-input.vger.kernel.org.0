Return-Path: <linux-input+bounces-5771-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 93FC295D666
	for <lists+linux-input@lfdr.de>; Fri, 23 Aug 2024 22:02:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 13B4B1F23F81
	for <lists+linux-input@lfdr.de>; Fri, 23 Aug 2024 20:02:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 88C5E194138;
	Fri, 23 Aug 2024 20:01:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="fvb8GXrJ"
X-Original-To: linux-input@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC51D19307D;
	Fri, 23 Aug 2024 20:01:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724443302; cv=none; b=l6aFCikN3QpMwjnVZUpeelYheuczNlaqHRTfJt/LfugJrgGaqVMuYxbaUpkEwzs5nm37Hs1z/ArGikzsAGQxfH1ZLnmfXkyYtG2BJPf5SPbRRP7wnAJizQiPtGDciM0tTjkmv7zE3odkUFODrgueU2g1tu1vpKYROKEARw17NFM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724443302; c=relaxed/simple;
	bh=u1dWUqIEca7XH/A4ra7W55fG56soe/paLClrACCbIY0=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=KgTvP/GMIuYoM95fGeCD1g0us9slAyq4akEZHw4nXGuhYT3c0Ws1RidUfMnvhhI1TJqacha8y8h8vcB2QuHkCn367Yf0E3Q988wK6z380VoNBACoRY9O2C6fWbOnSwHY7+8DcXAY4kpMrMZYPLk1hhx0KVLIy2hVUprfeoFWbi4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=fvb8GXrJ; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 47NEFXn8011175;
	Fri, 23 Aug 2024 20:01:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=ouBODxkb/nIv7zI5SdwMqKG6
	w7PPLR6pL5rn8EaKM/g=; b=fvb8GXrJPENxEKUplc7ITobT2mOKqJKGkrIJIRlm
	aUp6hwTi/WhNJZfBsSjt3Ve0pG86oEYy1c1aY0pCkQ58keBMSIK53d+vhHPONvU8
	dwqhGoQRR/TntqRTkN2/HlsfxemnIJA8prYw4qS0dfsWsYRxzLd3QFlner25yoUK
	L8SpzmMIkgPQZ1ZAcQ4G/dkGd9jHW7nPWeNZjMC4CdujDGrr52SGtj3GtXAhxjTp
	6ejeBLwoapydophjwwSByr4Nib+lIciAu5YGM+1jKh/tC8fDpaAx2Gl5Q9ltntPU
	bJIyR++1gbpmRkPdDcZg9LoeQ49TdVDaIDdhPCl27lHcOg==
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 416mnma6ph-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 23 Aug 2024 20:01:19 +0000 (GMT)
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com [10.47.209.197])
	by NALASPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 47NK1H85021606
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 23 Aug 2024 20:01:18 GMT
Received: from hu-wcheng-lv.qualcomm.com (10.49.16.6) by
 nalasex01b.na.qualcomm.com (10.47.209.197) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Fri, 23 Aug 2024 13:01:17 -0700
From: Wesley Cheng <quic_wcheng@quicinc.com>
To: <srinivas.kandagatla@linaro.org>, <mathias.nyman@intel.com>,
        <perex@perex.cz>, <conor+dt@kernel.org>, <dmitry.torokhov@gmail.com>,
        <corbet@lwn.net>, <broonie@kernel.org>, <lgirdwood@gmail.com>,
        <tiwai@suse.com>, <krzk+dt@kernel.org>, <Thinh.Nguyen@synopsys.com>,
        <bgoswami@quicinc.com>, <robh@kernel.org>,
        <gregkh@linuxfoundation.org>
CC: <linux-kernel@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-sound@vger.kernel.org>, <linux-usb@vger.kernel.org>,
        <linux-input@vger.kernel.org>, <linux-arm-msm@vger.kernel.org>,
        <linux-doc@vger.kernel.org>, <alsa-devel@alsa-project.org>,
        Wesley Cheng
	<quic_wcheng@quicinc.com>
Subject: [PATCH v25 15/33] ASoC: usb: Fetch ASoC card and pcm device information
Date: Fri, 23 Aug 2024 13:00:43 -0700
Message-ID: <20240823200101.26755-16-quic_wcheng@quicinc.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20240823200101.26755-1-quic_wcheng@quicinc.com>
References: <20240823200101.26755-1-quic_wcheng@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain
X-ClientProxiedBy: nalasex01a.na.qualcomm.com (10.47.209.196) To
 nalasex01b.na.qualcomm.com (10.47.209.197)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: THJe7NmAbX_cbvNhgG_MGAcRBlDuMDk_
X-Proofpoint-GUID: THJe7NmAbX_cbvNhgG_MGAcRBlDuMDk_
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-08-23_16,2024-08-23_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0 mlxscore=0
 adultscore=0 spamscore=0 lowpriorityscore=0 suspectscore=0 phishscore=0
 priorityscore=1501 impostorscore=0 bulkscore=0 clxscore=1015
 mlxlogscore=926 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2407110000 definitions=main-2408230147

USB SND needs to know how the USB offload path is being routed.  This would
allow for applications to open the corresponding sound card and pcm device
when it wants to take the audio offload path.  This callback should return
the mapped indexes based on the USB SND device information.

Signed-off-by: Wesley Cheng <quic_wcheng@quicinc.com>
---
 include/sound/soc-usb.h | 12 ++++++++++++
 sound/soc/soc-usb.c     | 31 +++++++++++++++++++++++++++++++
 2 files changed, 43 insertions(+)

diff --git a/include/sound/soc-usb.h b/include/sound/soc-usb.h
index 3ad15e9b8e15..34cd2860df86 100644
--- a/include/sound/soc-usb.h
+++ b/include/sound/soc-usb.h
@@ -36,6 +36,7 @@ struct snd_soc_usb_device {
  * @list - list head for SND SOC struct list
  * @component - reference to ASoC component
  * @connection_status_cb - callback to notify connection events
+ * @update_offload_route_info - callback to fetch mapped ASoC device
  * @priv_data - driver data
  **/
 struct snd_soc_usb {
@@ -43,6 +44,9 @@ struct snd_soc_usb {
 	struct snd_soc_component *component;
 	int (*connection_status_cb)(struct snd_soc_usb *usb,
 			struct snd_soc_usb_device *sdev, bool connected);
+	int (*update_offload_route_info)(struct snd_soc_component *component,
+					 int card, int pcm, int direction,
+					 long *route);
 	void *priv_data;
 };
 
@@ -57,6 +61,8 @@ void *snd_soc_usb_find_priv_data(struct device *dev);
 int snd_soc_usb_setup_offload_jack(struct snd_soc_component *component,
 					struct snd_soc_jack *jack);
 int snd_soc_usb_disable_offload_jack(struct snd_soc_component *component);
+int snd_soc_usb_update_offload_route(struct device *dev, int card, int pcm,
+				     int direction, long *route);
 
 struct snd_soc_usb *snd_soc_usb_allocate_port(struct snd_soc_component *component,
 					      void *data);
@@ -99,6 +105,12 @@ static inline int snd_soc_usb_disable_offload_jack(struct snd_soc_component *com
 	return 0;
 }
 
+static int snd_soc_usb_update_offload_route(struct device *dev, int card, int pcm,
+					    int direction, long *route)
+{
+	return -ENODEV;
+}
+
 static inline struct snd_soc_usb *snd_soc_usb_allocate_port(
 					      struct snd_soc_component *component,
 					      void *data)
diff --git a/sound/soc/soc-usb.c b/sound/soc/soc-usb.c
index 90266fd7a7ff..81de64884817 100644
--- a/sound/soc/soc-usb.c
+++ b/sound/soc/soc-usb.c
@@ -117,6 +117,37 @@ int snd_soc_usb_disable_offload_jack(struct snd_soc_component *component)
 }
 EXPORT_SYMBOL_GPL(snd_soc_usb_disable_offload_jack);
 
+/**
+ * snd_soc_usb_update_offload_route - Find active USB offload path
+ * @dev - USB device to get offload status
+ * @card - USB card index
+ * @pcm - USB PCM device index
+ * @direction - playback or capture direction
+ * @route - pointer to route output array
+ *
+ * Fetch the current status for the USB SND card and PCM device indexes
+ * specified.
+ */
+int snd_soc_usb_update_offload_route(struct device *dev, int card, int pcm,
+				     int direction, long *route)
+{
+	struct snd_soc_usb *ctx;
+	int ret;
+
+	ctx = snd_soc_find_usb_ctx(dev);
+	if (!ctx)
+		return -ENODEV;
+
+	mutex_lock(&ctx_mutex);
+	if (ctx && ctx->update_offload_route_info)
+		ret = ctx->update_offload_route_info(ctx->component, card, pcm,
+						     direction, route);
+	mutex_unlock(&ctx_mutex);
+
+	return ret;
+}
+EXPORT_SYMBOL_GPL(snd_soc_usb_update_offload_route);
+
 /**
  * snd_soc_usb_find_priv_data() - Retrieve private data stored
  * @dev: device reference

