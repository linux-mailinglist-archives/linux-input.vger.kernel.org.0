Return-Path: <linux-input+bounces-9293-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 1EAE1A145B8
	for <lists+linux-input@lfdr.de>; Fri, 17 Jan 2025 00:29:39 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 7D4D0188BA71
	for <lists+linux-input@lfdr.de>; Thu, 16 Jan 2025 23:29:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F30942442C9;
	Thu, 16 Jan 2025 23:29:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="PA9Pf7kC"
X-Original-To: linux-input@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C51FA2361E7;
	Thu, 16 Jan 2025 23:29:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737070143; cv=none; b=f1nj7WXVNRHyjrJhspk+PQLU6/wp7ErUo7g99jodUGH9cLfl1H+nYKDR8Kbu0FJ51n4Xu9hnYfD8IRArAJGbDz+hXp2FaZghJrDdkzA8FBWo2bNwY70Ynh33TqUwSEm2CbBr5qQvR2bck5i6k7BkoAYtMPCLdH/rW9QeEojjEyo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737070143; c=relaxed/simple;
	bh=fz3dWJECQrWW8qH/MQlxfS2nNh3jM2uYIvuScZFYBG8=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=LEp0/DjJAOWG9mj8OvxkPONAIwJCpDlSm1PCv9MHzKPRmVuCmKRQnCnNm+WVrl/X63F569e8HLK81pVmxqnNnM2bQIEHiR/OL32NyQuHAa53cqLLcdYM4bS2iOO6bqhu0bjb2TiqDfJYKdZk/ZhQsNeZ+ZMSaDuBrixRo+MWeZU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=PA9Pf7kC; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 50GEJkvF005439;
	Thu, 16 Jan 2025 23:28:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	E4ac7XKHLeBId41/pNXzZQDLJM9pL/sYfePnt9miOyU=; b=PA9Pf7kCv+b0mkgq
	jQ+krzX0JjH2LAOw9O0E1qgBqlWzq6dhT+l3zSdhkeyVR8bi+tOcwKOWFLEYqfU2
	iPjmxUH7ZPdzY0OAGTch+g0ah36Jk5AaAHi5C0Csp4gOEWh6sN47sbtRN6+cGZv3
	+2GigCZ/CL3SF7UyVwzuOvbrdw0e1mfAxamZxUBb94CkiPKzXrwjWV/RX3gqvV51
	wMhIDESlWfeVIBFWTO4LdvbONcyFThSzRaaigcZWvO21dZWpedl0qVOOQBItfTi+
	fcfyNIIW2wShHGLRbLDF2uxNA2mjK50qa0HcI9vI9RyAyxHeekGZaMyzMNcrcWvT
	+GYNng==
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4473sfs6n1-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 16 Jan 2025 23:28:47 +0000 (GMT)
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com [10.47.209.197])
	by NALASPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 50GNSku8032095
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 16 Jan 2025 23:28:46 GMT
Received: from hu-wcheng-lv.qualcomm.com (10.49.16.6) by
 nalasex01b.na.qualcomm.com (10.47.209.197) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Thu, 16 Jan 2025 15:28:45 -0800
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
Subject: [PATCH v33 17/31] ASoC: usb: Fetch ASoC card and pcm device information
Date: Thu, 16 Jan 2025 15:28:10 -0800
Message-ID: <20250116232824.3748438-18-quic_wcheng@quicinc.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250116232824.3748438-1-quic_wcheng@quicinc.com>
References: <20250116232824.3748438-1-quic_wcheng@quicinc.com>
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
X-Proofpoint-GUID: yFlx7icrg1ORFLiR-V3mQjvf2cpGJNBo
X-Proofpoint-ORIG-GUID: yFlx7icrg1ORFLiR-V3mQjvf2cpGJNBo
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-01-16_10,2025-01-16_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 spamscore=0 phishscore=0
 impostorscore=0 malwarescore=0 priorityscore=1501 suspectscore=0
 mlxscore=0 lowpriorityscore=0 clxscore=1015 mlxlogscore=974 adultscore=0
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2501160174

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
index 7c4100094258..4fab9996917b 100644
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
  * struct snd_soc_usb_device
  * @card_idx - sound card index associated with USB device
@@ -36,6 +41,12 @@ struct snd_soc_usb_device {
  * @list - list head for SND SOC struct list
  * @component - reference to ASoC component
  * @connection_status_cb - callback to notify connection events
+ * @update_offload_route_info - callback to fetch mapped ASoC card and pcm
+ *				device pair.  This is unrelated to the concept
+ *				of DAPM route.  The "route" argument carries
+ *				an array used for a kcontrol output for either
+ *				the card or pcm index.  "path" determines the
+ *				which entry to look for. (ie mapped card or pcm)
  * @priv_data - driver data
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
index 23d0ef5b1031..86f0d1b9fe43 100644
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

