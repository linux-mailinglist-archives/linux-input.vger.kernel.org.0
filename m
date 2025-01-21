Return-Path: <linux-input+bounces-9434-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 737A6A18680
	for <lists+linux-input@lfdr.de>; Tue, 21 Jan 2025 22:06:49 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 14FB9188AD22
	for <lists+linux-input@lfdr.de>; Tue, 21 Jan 2025 21:06:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3ECAC1F91D9;
	Tue, 21 Jan 2025 21:05:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="UnBBLvkz"
X-Original-To: linux-input@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F6B11B4258;
	Tue, 21 Jan 2025 21:05:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737493547; cv=none; b=cLvjU8Py46sSYNjB8lO8RW4wjD5EJCpUXdULLV4RoZJ6hIZGqKyAC/1aiVkL1AGC2fLabTPA8ne/fkIGgH+6ciedO2g2UomRf3OBBXE5eqvjQZrbWUhukJsuz0uRfIu0E1Cyba4GX3MJrlPZBUZnSAJFHXNm189X0/7lfiicGks=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737493547; c=relaxed/simple;
	bh=D1tk8T1ErJiNJ+GPC1iCmuX1zXRuiqUFRXo8xEpU2P4=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=ebXPM2MQWdNPqfEcrJ5S0U5qSR44U7me0cKRBBnhtazsl3RE2IcQYWIC2oi2fpPNPUcmPvpQpFpb9TJnTily47DVNPm4jZdPcJWhG3i8TRQPRaZnEun+xf1iz2Fu7alArWm6TNvKHCu+XmobdfCmdd4RFDzGdXiYX0wK9dNilLA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=UnBBLvkz; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 50LGtbq7032080;
	Tue, 21 Jan 2025 21:05:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	fQZeaBXgwp/wU6F/79Me0uBcCuqJh8nM6J4hKlt+dlU=; b=UnBBLvkze0nizfk/
	jRRNvVHaOa6rGhUrt3tEAg0D81dx2gtvFmQbI73EOeQRgU6aQTexdm7yhz0rrvfj
	ISzWsM5vx5OlIob9vUbHanjMhWiwyvORxC931mab97v8VPvcbQRNUQvwuqfztbHC
	v4GZQT+40mBJbDD0AehhR9TLu/ydIPsqflOIu+Z21WmF+eoLcmdBijclPhxUQlw7
	sJP4rOkoUqkkUXoGMuQniTJyCDCEr7AXxT2ljG3Av20Wsf+tcGx6sNfiju2cu6bz
	BktLWE2Kei2cUcKY8lVK940C98DFGmmFoWY6jXpbXgDCdquq0vrTMcQnaRi5OspY
	EkD1Ug==
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 44afhhgkgg-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 21 Jan 2025 21:05:34 +0000 (GMT)
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com [10.47.209.197])
	by NALASPPMTA05.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 50LL5XEw003323
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 21 Jan 2025 21:05:33 GMT
Received: from hu-wcheng-lv.qualcomm.com (10.49.16.6) by
 nalasex01b.na.qualcomm.com (10.47.209.197) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Tue, 21 Jan 2025 13:05:33 -0800
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
Subject: [PATCH v34 17/31] ASoC: usb: Fetch ASoC card and pcm device information
Date: Tue, 21 Jan 2025 13:05:04 -0800
Message-ID: <20250121210518.2436771-18-quic_wcheng@quicinc.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250121210518.2436771-1-quic_wcheng@quicinc.com>
References: <20250121210518.2436771-1-quic_wcheng@quicinc.com>
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
X-Proofpoint-ORIG-GUID: zifwZg__hparO3336s1GE-DReSySjO8F
X-Proofpoint-GUID: zifwZg__hparO3336s1GE-DReSySjO8F
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-01-21_08,2025-01-21_03,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0
 lowpriorityscore=0 bulkscore=0 adultscore=0 mlxlogscore=967 spamscore=0
 clxscore=1015 malwarescore=0 suspectscore=0 priorityscore=1501
 impostorscore=0 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2501210167

USB SND needs to know how the USB offload path is being routed.  This would
allow for applications to open the corresponding sound card and pcm device
when it wants to take the audio offload path.  This callback should return
the mapped indexes based on the USB SND device information.

Reviewed-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Signed-off-by: Wesley Cheng <quic_wcheng@quicinc.com>
---
 include/sound/soc-usb.h | 25 +++++++++++++++++++++++++
 sound/soc/soc-usb.c     | 36 ++++++++++++++++++++++++++++++++++++
 2 files changed, 61 insertions(+)

diff --git a/include/sound/soc-usb.h b/include/sound/soc-usb.h
index 71837c1cdac9..c8e5e52639cb 100644
--- a/include/sound/soc-usb.h
+++ b/include/sound/soc-usb.h
@@ -8,6 +8,11 @@
 
 #include <sound/soc.h>
 
+enum snd_soc_usb_kctl {
+	SND_SOC_USB_KCTL_CARD_ROUTE,
+	SND_SOC_USB_KCTL_PCM_ROUTE,
+};
+
 /**
  * struct snd_soc_usb_device - SoC USB representation of a USB sound device
  * @card_idx: sound card index associated with USB device
@@ -36,6 +41,12 @@ struct snd_soc_usb_device {
  * @list: list head for SND SOC struct list
  * @component: reference to ASoC component
  * @connection_status_cb: callback to notify connection events
+ * @update_offload_route_info: callback to fetch mapped ASoC card and pcm
+ *			       device pair.  This is unrelated to the concept
+ *			       of DAPM route.  The "route" argument carries
+ *			       an array used for a kcontrol output for either
+ *			       the card or pcm index.  "path" determines the
+ *			       which entry to look for. (ie mapped card or pcm)
  * @priv_data: driver data
  **/
 struct snd_soc_usb {
@@ -44,6 +55,10 @@ struct snd_soc_usb {
 	int (*connection_status_cb)(struct snd_soc_usb *usb,
 				    struct snd_soc_usb_device *sdev,
 				    bool connected);
+	int (*update_offload_route_info)(struct snd_soc_component *component,
+					 int card, int pcm, int direction,
+					 enum snd_soc_usb_kctl path,
+					 long *route);
 	void *priv_data;
 };
 
@@ -58,6 +73,9 @@ void *snd_soc_usb_find_priv_data(struct device *usbdev);
 
 int snd_soc_usb_setup_offload_jack(struct snd_soc_component *component,
 				   struct snd_soc_jack *jack);
+int snd_soc_usb_update_offload_route(struct device *dev, int card, int pcm,
+				     int direction, enum snd_soc_usb_kctl path,
+				     long *route);
 
 struct snd_soc_usb *snd_soc_usb_allocate_port(struct snd_soc_component *component,
 					      void *data);
@@ -95,6 +113,13 @@ static inline int snd_soc_usb_setup_offload_jack(struct snd_soc_component *compo
 	return 0;
 }
 
+static int snd_soc_usb_update_offload_route(struct device *dev, int card, int pcm,
+					    int direction, enum snd_soc_usb_kctl path,
+					    long *route)
+{
+	return -ENODEV;
+}
+
 static inline struct snd_soc_usb *
 snd_soc_usb_allocate_port(struct snd_soc_component *component, void *data)
 {
diff --git a/sound/soc/soc-usb.c b/sound/soc/soc-usb.c
index 22cc3826184a..874488c69524 100644
--- a/sound/soc/soc-usb.c
+++ b/sound/soc/soc-usb.c
@@ -90,6 +90,42 @@ int snd_soc_usb_setup_offload_jack(struct snd_soc_component *component,
 }
 EXPORT_SYMBOL_GPL(snd_soc_usb_setup_offload_jack);
 
+/**
+ * snd_soc_usb_update_offload_route - Find active USB offload path
+ * @dev - USB device to get offload status
+ * @card - USB card index
+ * @pcm - USB PCM device index
+ * @direction - playback or capture direction
+ * @route - pointer to route output array
+ *
+ * Fetch the current status for the USB SND card and PCM device indexes
+ * specified.  The "route" argument should be an array of integers being
+ * used for a kcontrol output.  The first element should have the selected
+ * card index, and the second element should have the selected pcm device
+ * index.
+ */
+int snd_soc_usb_update_offload_route(struct device *dev, int card, int pcm,
+				     int direction, enum snd_soc_usb_kctl path,
+				     long *route)
+{
+	struct snd_soc_usb *ctx;
+	int ret = -ENODEV;
+
+	mutex_lock(&ctx_mutex);
+	ctx = snd_soc_find_usb_ctx(dev);
+	if (!ctx)
+		goto exit;
+
+	if (ctx->update_offload_route_info)
+		ret = ctx->update_offload_route_info(ctx->component, card, pcm,
+						     direction, path, route);
+exit:
+	mutex_unlock(&ctx_mutex);
+
+	return ret;
+}
+EXPORT_SYMBOL_GPL(snd_soc_usb_update_offload_route);
+
 /**
  * snd_soc_usb_find_priv_data() - Retrieve private data stored
  * @usbdev: device reference

