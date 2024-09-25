Return-Path: <linux-input+bounces-6666-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 32F2F984FD3
	for <lists+linux-input@lfdr.de>; Wed, 25 Sep 2024 03:03:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id A31431F2460D
	for <lists+linux-input@lfdr.de>; Wed, 25 Sep 2024 01:03:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 55541149C55;
	Wed, 25 Sep 2024 01:01:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="JQMwdqds"
X-Original-To: linux-input@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9592914831D;
	Wed, 25 Sep 2024 01:01:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727226062; cv=none; b=puscylq2PfSLgc7chDdDz9jsb/unhyy1/Hy5Wj8Qydh7wg6hS10w83No16uiDgCIooPeFv0BnrB0H+yNexBh+isjqd46EWXfR2m/M1eqQjwyrrWjifSvZIGSC/Rb9dNDWiK05s2q6fG34KFyjHuvfd2vZF/yFquViduDnhCyDic=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727226062; c=relaxed/simple;
	bh=t7n8rhO3AEi7st/FJuPVX9s4BxgP3J6zupir+2XpTCw=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=hIr9IPrbt9Ufrj7TEaJr84hJhMKvwqB5mHGuL5i+AjYE4I/yd19mS89k5XWrT0TfgO8KPrjE/698w+w0HMFwtu02b781bAwQessCbqvwa47NKuwLGfudR2idr7lEHqu9HQPX66zeTTYp6ZyVcOKpfSfVVmiBRDvYOaGk4VkHHTo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=JQMwdqds; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 48OHxiW5021675;
	Wed, 25 Sep 2024 01:00:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	swybFnIRHPLzluHHFQvvDyLicOhSUsPc7nkVL7emCFI=; b=JQMwdqdsWn2qa3xB
	DlByFIF/YoXSDzHTzLCqjOW76Gwbl+PJMgl5V1+oeDJH1uFLAE2c1njYnvh5V/oG
	7XM8eqo0Ex6zj7jgULly/4o0ZDH1mdKDYrcBa8UzivmYql0RQpVXvpAIm0VVQwfC
	46+Hy9vG1FVNbISnkCt/oOxZWQNXpAhu98YqsTIICZtX3edI1r3GyEx+J4JDaYtf
	0/5V46usx6odKOoiJduoMDkgxJYRFJSUnLr1QseHUL6+6RCNs16gZ3kZ2AysumcQ
	M9xINsmHTW5lshZmrEwnq5JlX2visuWFIWLx6NS0aSt/FKuetW+XiqqCPpnk/gbq
	mgCIQA==
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 41sp7ujj82-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 25 Sep 2024 01:00:17 +0000 (GMT)
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com [10.47.209.197])
	by NALASPPMTA05.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 48P10GL0018717
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 25 Sep 2024 01:00:16 GMT
Received: from hu-wcheng-lv.qualcomm.com (10.49.16.6) by
 nalasex01b.na.qualcomm.com (10.47.209.197) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Tue, 24 Sep 2024 18:00:15 -0700
From: Wesley Cheng <quic_wcheng@quicinc.com>
To: <srinivas.kandagatla@linaro.org>, <mathias.nyman@intel.com>,
        <perex@perex.cz>, <conor+dt@kernel.org>, <dmitry.torokhov@gmail.com>,
        <corbet@lwn.net>, <broonie@kernel.org>, <lgirdwood@gmail.com>,
        <tiwai@suse.com>, <krzk+dt@kernel.org>,
        <pierre-louis.bossart@linux.intel.com>, <Thinh.Nguyen@synopsys.com>,
        <bgoswami@quicinc.com>, <robh@kernel.org>,
        <gregkh@linuxfoundation.org>
CC: <linux-kernel@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-sound@vger.kernel.org>, <linux-input@vger.kernel.org>,
        <linux-usb@vger.kernel.org>, <linux-arm-msm@vger.kernel.org>,
        <linux-doc@vger.kernel.org>, <alsa-devel@alsa-project.org>,
        Wesley Cheng
	<quic_wcheng@quicinc.com>
Subject: [PATCH v28 17/32] ASoC: usb: Fetch ASoC card and pcm device information
Date: Tue, 24 Sep 2024 17:59:45 -0700
Message-ID: <20240925010000.2231406-18-quic_wcheng@quicinc.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240925010000.2231406-1-quic_wcheng@quicinc.com>
References: <20240925010000.2231406-1-quic_wcheng@quicinc.com>
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
X-Proofpoint-GUID: LL17U9lwXDXeRxCQibF7T9wAosqz_x4x
X-Proofpoint-ORIG-GUID: LL17U9lwXDXeRxCQibF7T9wAosqz_x4x
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 clxscore=1015 bulkscore=0 mlxlogscore=999 mlxscore=0 phishscore=0
 suspectscore=0 impostorscore=0 spamscore=0 malwarescore=0
 priorityscore=1501 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.19.0-2408220000 definitions=main-2409250005

USB SND needs to know how the USB offload path is being routed.  This would
allow for applications to open the corresponding sound card and pcm device
when it wants to take the audio offload path.  This callback should return
the mapped indexes based on the USB SND device information.

Reviewed-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Signed-off-by: Wesley Cheng <quic_wcheng@quicinc.com>
---
 include/sound/soc-usb.h | 16 ++++++++++++++++
 sound/soc/soc-usb.c     | 34 ++++++++++++++++++++++++++++++++++
 2 files changed, 50 insertions(+)

diff --git a/include/sound/soc-usb.h b/include/sound/soc-usb.h
index b32af08030ae..4c6af57291d8 100644
--- a/include/sound/soc-usb.h
+++ b/include/sound/soc-usb.h
@@ -36,6 +36,11 @@ struct snd_soc_usb_device {
  * @list - list head for SND SOC struct list
  * @component - reference to ASoC component
  * @connection_status_cb - callback to notify connection events
+ * @update_offload_route_info - callback to fetch mapped ASoC card and pcm
+ *				device pair.  This is unrelated to the concept
+ *				of DAPM route.  The "route" argument carries
+ *				an array used for a kcontrol output and should
+ *				contain two integers, card and pcm device index
  * @priv_data - driver data
  **/
 struct snd_soc_usb {
@@ -44,6 +49,9 @@ struct snd_soc_usb {
 	int (*connection_status_cb)(struct snd_soc_usb *usb,
 				    struct snd_soc_usb_device *sdev,
 				    bool connected);
+	int (*update_offload_route_info)(struct snd_soc_component *component,
+					 int card, int pcm, int direction,
+					 long *route);
 	void *priv_data;
 };
 
@@ -59,6 +67,8 @@ void *snd_soc_usb_find_priv_data(struct device *usbdev);
 int snd_soc_usb_setup_offload_jack(struct snd_soc_component *component,
 				   struct snd_soc_jack *jack);
 int snd_soc_usb_disable_offload_jack(struct snd_soc_component *component);
+int snd_soc_usb_update_offload_route(struct device *dev, int card, int pcm,
+				     int direction, long *route);
 
 struct snd_soc_usb *snd_soc_usb_allocate_port(struct snd_soc_component *component,
 					      void *data);
@@ -101,6 +111,12 @@ static inline int snd_soc_usb_disable_offload_jack(struct snd_soc_component *com
 	return 0;
 }
 
+static int snd_soc_usb_update_offload_route(struct device *dev, int card, int pcm,
+					    int direction, long *route)
+{
+	return -ENODEV;
+}
+
 static inline struct snd_soc_usb *
 snd_soc_usb_allocate_port(struct snd_soc_component *component, void *data)
 {
diff --git a/sound/soc/soc-usb.c b/sound/soc/soc-usb.c
index 70d8f854c017..f88ccf90df32 100644
--- a/sound/soc/soc-usb.c
+++ b/sound/soc/soc-usb.c
@@ -118,6 +118,40 @@ int snd_soc_usb_disable_offload_jack(struct snd_soc_component *component)
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
+ * specified.  The "route" argument should be an array of integers being
+ * used for a kcontrol output.  The first element should have the selected
+ * card index, and the second element should have the selected pcm device
+ * index.
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
  * @usbdev: device reference

