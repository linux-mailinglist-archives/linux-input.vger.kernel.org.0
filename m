Return-Path: <linux-input+bounces-10941-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D5890A6820F
	for <lists+linux-input@lfdr.de>; Wed, 19 Mar 2025 01:56:28 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id BC1D0426AF3
	for <lists+linux-input@lfdr.de>; Wed, 19 Mar 2025 00:55:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D6C8E1DE2CA;
	Wed, 19 Mar 2025 00:52:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="Gnj8IGEY"
X-Original-To: linux-input@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1679B1C760D;
	Wed, 19 Mar 2025 00:52:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742345539; cv=none; b=pw3Xy3NW0H58388j/UtIHGmt5J4ZwPeT96anO0QuNj0slZXo++VXm06dFvt+0dWVSzQcYkdYMJYuDaAojUP7BTEEfQ0+Y653f5cOUjp3BOkpA4/6Z+EoDhF/myNeqJ7GE9EEbz++Xb8QK9TqtAUYQitcYhIuvB0sRBIUnlS6ZKU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742345539; c=relaxed/simple;
	bh=L0m3GGB7vk+mBDykN4rUegUC+8hHnwk4iKasFb6Wn8A=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=DB1ghFJ4TtKuON+5GO0kMzEDFnkfFC49ORQj/eCCxdXcfb5qLQd235A6w2UJVT9zbOnEfE0zI2lI9pUcTLaD2yZGFlrNiW+6K6wshIA0oPvR2xdy+tgfw8W5b7q7CxKPyzoaz3iWrmlfJ83AnR6HvYiA0tTF3mSIcxLqiGpYgZI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=Gnj8IGEY; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 52IL1Sas023271;
	Wed, 19 Mar 2025 00:51:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	2scjNHPDxW6lWApzs5zrS9UwSBER7dyJZ8Kg/6/nCoU=; b=Gnj8IGEYZQ49dIjf
	xkoPTXXvZHEa6XLsiGxfyHmHj1xulOLd3LUMpeJluLUD9dMAUYai9q9udb+me4iN
	26SwLyhdP4HeC0uQLgNQv+m0ksX/Cu6z+/K7npbUwGEFZHi2+qN9ePgJkJCLJ3bu
	2Ftp3zQvMVtkTuToQqzZZuxfOzkGGC2/URGYBsk6KBbfu8BCRZiK0Jh/pvrRjPUu
	QSkr+uBbbS5MDXiIDOgdY40eRKPQk8iHbOUwhse/8wdyMY7bUd74aVbdCYQbRoUi
	/In+fPa8l+43n3wkk7ukWs74kTUUCz8stD5FUxMhP5uW+ngYctl3Ynyxs5WltuNp
	uDJ+eg==
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45exwx3hrj-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 19 Mar 2025 00:51:56 +0000 (GMT)
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com [10.47.209.197])
	by NALASPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 52J0pugu019359
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 19 Mar 2025 00:51:56 GMT
Received: from hu-wcheng-lv.qualcomm.com (10.49.16.6) by
 nalasex01b.na.qualcomm.com (10.47.209.197) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Tue, 18 Mar 2025 17:51:55 -0700
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
Subject: [PATCH v36 17/31] ASoC: usb: Fetch ASoC card and pcm device information
Date: Tue, 18 Mar 2025 17:51:27 -0700
Message-ID: <20250319005141.312805-18-quic_wcheng@quicinc.com>
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
X-Proofpoint-ORIG-GUID: mTsl9JZSp2DW2fLyuPcsdpqFQcpO_h07
X-Authority-Analysis: v=2.4 cv=INICChvG c=1 sm=1 tr=0 ts=67da152c cx=c_pps a=ouPCqIW2jiPt+lZRy3xVPw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17 a=3H110R4YSZwA:10 a=Vs1iUdzkB0EA:10 a=QyXUC8HyAAAA:8 a=COk6AnOGAAAA:8 a=hJkMVypUZhg2lV3Ev_wA:9
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: mTsl9JZSp2DW2fLyuPcsdpqFQcpO_h07
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1093,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-18_10,2025-03-17_03,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0 adultscore=0
 priorityscore=1501 lowpriorityscore=0 malwarescore=0 clxscore=1015
 mlxlogscore=967 impostorscore=0 phishscore=0 mlxscore=0 spamscore=0
 bulkscore=0 classifier=spam authscore=0 authtc=n/a authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2503190003

USB SND needs to know how the USB offload path is being routed.  This would
allow for applications to open the corresponding sound card and pcm device
when it wants to take the audio offload path.  This callback should return
the mapped indexes based on the USB SND device information.

Reviewed-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Signed-off-by: Wesley Cheng <quic_wcheng@quicinc.com>
---
 include/sound/soc-usb.h | 25 +++++++++++++++++++++++++
 sound/soc/soc-usb.c     | 37 +++++++++++++++++++++++++++++++++++++
 2 files changed, 62 insertions(+)

diff --git a/include/sound/soc-usb.h b/include/sound/soc-usb.h
index e9eb8dbb2e0e..124acb1939e5 100644
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
index ec894182f816..406bc4a1015d 100644
--- a/sound/soc/soc-usb.c
+++ b/sound/soc/soc-usb.c
@@ -90,6 +90,43 @@ int snd_soc_usb_setup_offload_jack(struct snd_soc_component *component,
 }
 EXPORT_SYMBOL_GPL(snd_soc_usb_setup_offload_jack);
 
+/**
+ * snd_soc_usb_update_offload_route - Find active USB offload path
+ * @dev: USB device to get offload status
+ * @card: USB card index
+ * @pcm: USB PCM device index
+ * @direction: playback or capture direction
+ * @path: pcm or card index
+ * @route: pointer to route output array
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

