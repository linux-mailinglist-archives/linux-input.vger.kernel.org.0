Return-Path: <linux-input+bounces-7307-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C58A399967F
	for <lists+linux-input@lfdr.de>; Fri, 11 Oct 2024 02:12:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 2C1B6B242C7
	for <lists+linux-input@lfdr.de>; Fri, 11 Oct 2024 00:12:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 640A9199234;
	Fri, 11 Oct 2024 00:07:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="TTafVq1j"
X-Original-To: linux-input@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 927BC194089;
	Fri, 11 Oct 2024 00:07:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728605257; cv=none; b=X30HxrdGFbvbVu1qfIlSAKv/oZ8VBu1Hega5WkbbGjPahAIRSB8br501wBcx3bgrF7Bxsdub4ceE2gfw2OlXnFLLTD1pECIWQ4JZfGnJd688ydepKofwPh/lqQd4QxUws6q/od4qxutAl8SgdN7Zlc/4Z86iya0G9UGq44RUupo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728605257; c=relaxed/simple;
	bh=t7n8rhO3AEi7st/FJuPVX9s4BxgP3J6zupir+2XpTCw=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=n7xTLVf/3L/VHnQfMn2rK+FesH/u0akf7pVfd3AB2/4PyDhvOl4N+/MgpZdfyTBLqGB5dHgC/M7G8YXwWvOavCMEiA5Jv2nmxiKAD7Wh4R0x/E9VizXozP3BzV3DLHddV6+yHC6AXMBO2d87V9a1U3RL1NygrMdPKGLGXdfcbrY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=TTafVq1j; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 49AHLBQ7024403;
	Fri, 11 Oct 2024 00:07:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	swybFnIRHPLzluHHFQvvDyLicOhSUsPc7nkVL7emCFI=; b=TTafVq1jRYl8uQvS
	Rx1z0RXwWY+MMeyTlX5LKqLM6QE2OH9WY6BMsk8hKUUC1j4A5Kkbotjegbq+KUsb
	h84tC1xKxCaQ9GivS9S1yPR6gHtmwJmFwYh1o6Mu4AbWueoNJpCPpSet8x9CtXAm
	yqY1xFwrTy6vaEmxMwR+tiFQE5dX1kNBGHDt5YlyqdaB+cFI+48VaS+tvZ4ax3j2
	Z+aaaAhZzzTUzuLvIw0Q3j5Gs0hGybG0CVENnTSxJAS1K2PIHwDM3cc6WdJolsMz
	sXklCQAjA+IwLTkFbpP5+EU52I6+KbEZxS4XxyUlgM3r5iN8X4rg47UNMxL/XwiG
	aaMTtw==
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 426adhjdnx-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 11 Oct 2024 00:07:13 +0000 (GMT)
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com [10.47.209.197])
	by NALASPPMTA05.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 49B07C8u015320
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 11 Oct 2024 00:07:12 GMT
Received: from hu-wcheng-lv.qualcomm.com (10.49.16.6) by
 nalasex01b.na.qualcomm.com (10.47.209.197) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Thu, 10 Oct 2024 17:07:12 -0700
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
Date: Thu, 10 Oct 2024 17:06:19 -0700
Message-ID: <20241011000650.2585600-35-quic_wcheng@quicinc.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241011000650.2585600-1-quic_wcheng@quicinc.com>
References: <20241011000650.2585600-1-quic_wcheng@quicinc.com>
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
X-Proofpoint-GUID: 4SLCCg8hUpH4QgYhx696zIWz2XYe_nBT
X-Proofpoint-ORIG-GUID: 4SLCCg8hUpH4QgYhx696zIWz2XYe_nBT
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0
 mlxlogscore=999 clxscore=1015 mlxscore=0 impostorscore=0 phishscore=0
 bulkscore=0 lowpriorityscore=0 adultscore=0 suspectscore=0
 priorityscore=1501 spamscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.19.0-2409260000 definitions=main-2410100159

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

