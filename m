Return-Path: <linux-input+bounces-7439-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3CDF099F91E
	for <lists+linux-input@lfdr.de>; Tue, 15 Oct 2024 23:29:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 5F4481C2369F
	for <lists+linux-input@lfdr.de>; Tue, 15 Oct 2024 21:29:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 574BC1FBF69;
	Tue, 15 Oct 2024 21:29:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="gxpcsCFM"
X-Original-To: linux-input@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BEB7C1F80BC;
	Tue, 15 Oct 2024 21:29:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729027793; cv=none; b=foW+9K9jCUsXL0dlDZXW86/E1tCrL1NjdK5S8g8KQcApsAi5BdMau7L8P6+Qirx1B6vD3n9dqODAilkjc4PteG1Pnjz8VuidpNydk21TbExVgpUfc0TIplIunOfHHskhGlPrlxSZ7k/vhtNW9voTovlBnuGrRRZLjvhDBMSOm9Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729027793; c=relaxed/simple;
	bh=IkMCCmmayPEOkLVBZv1cFnxPTwhINuoT5uWbQVxY0J8=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=kkaVOPMB3kwOw9l235+382RK+nNxiPn3WvMRF0IauTr2SxoqHUwSwHwcQE16xrjYpIAan5j/gFrNUG2OAJ+5wSCc+ZknHZTlgxQMnn3PR4NqCWpdr/BASeaVSLmJUKKoG3d58r/iJzFeZApl470Xs4fIdXtL7V81tfS4CwGysmM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=gxpcsCFM; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 49FG28Of029359;
	Tue, 15 Oct 2024 21:29:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	8f3ltJ7kTNBqD63IJWPrINYxMdkP2wD5fAwRcNzFY10=; b=gxpcsCFMnNhLb5Fu
	bc1xiBhKCYs/2eGhzcx6EnYoD3P/vp5UMYNnteVu4md9uQnX7RVRo5KtJaK7/jKt
	BgwG6l4VruL0Z9XrOT62dfH6VNIlc0tPF286qu0r2jh9Bh5p0zRUV+/hzH+pR68G
	w5a1jRf/AcYspkVU73Zj1l5LczLdfLbGol3p63V6iI1jQSZMq+W9shaXvBA8jk8c
	TsNNgVkEiuIgViPREjkQzY1/KGlnOF0o8XLOjoCh3ozEqmM+rq135pZ1+0QHFkq1
	EzbTHVHsQMWaXAZh/8/os9u45fQt+g3Lxz7iuw1ISp4sT3IvxirD+0GVDWVuvXHs
	N/Pi9g==
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 429k7w2f2s-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 15 Oct 2024 21:29:32 +0000 (GMT)
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com [10.47.209.197])
	by NALASPPMTA05.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 49FLTVbv026432
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 15 Oct 2024 21:29:31 GMT
Received: from hu-wcheng-lv.qualcomm.com (10.49.16.6) by
 nalasex01b.na.qualcomm.com (10.47.209.197) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Tue, 15 Oct 2024 14:29:31 -0700
From: Wesley Cheng <quic_wcheng@quicinc.com>
To: <srinivas.kandagatla@linaro.org>, <mathias.nyman@intel.com>,
        <perex@perex.cz>, <conor+dt@kernel.org>, <dmitry.torokhov@gmail.com>,
        <corbet@lwn.net>, <lgirdwood@gmail.com>, <tiwai@suse.com>,
        <krzk+dt@kernel.org>, <pierre-louis.bossart@linux.intel.com>,
        <Thinh.Nguyen@synopsys.com>, <broonie@kernel.org>,
        <bgoswami@quicinc.com>, <robh@kernel.org>,
        <gregkh@linuxfoundation.org>
CC: <linux-kernel@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-sound@vger.kernel.org>, <linux-input@vger.kernel.org>,
        <linux-usb@vger.kernel.org>, <linux-arm-msm@vger.kernel.org>,
        <linux-doc@vger.kernel.org>, <alsa-devel@alsa-project.org>,
        Wesley Cheng
	<quic_wcheng@quicinc.com>
Subject: [PATCH v29 17/33] ASoC: usb: Create SOC USB SND jack kcontrol
Date: Tue, 15 Oct 2024 14:28:59 -0700
Message-ID: <20241015212915.1206789-18-quic_wcheng@quicinc.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241015212915.1206789-1-quic_wcheng@quicinc.com>
References: <20241015212915.1206789-1-quic_wcheng@quicinc.com>
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
X-Proofpoint-GUID: WfLjWExwsBDrJ8TW2mxbWb_F5QS-4buu
X-Proofpoint-ORIG-GUID: WfLjWExwsBDrJ8TW2mxbWb_F5QS-4buu
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 spamscore=0 mlxscore=0
 clxscore=1015 priorityscore=1501 phishscore=0 adultscore=0
 lowpriorityscore=0 impostorscore=0 suspectscore=0 bulkscore=0
 malwarescore=0 mlxlogscore=963 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.19.0-2409260000 definitions=main-2410150143

Expose API for creation of a jack control for notifying of available
devices that are plugged in/discovered, and that support offloading.  This
allows for control names to be standardized across implementations of USB
audio offloading.

Reviewed-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Signed-off-by: Wesley Cheng <quic_wcheng@quicinc.com>
---
 include/sound/soc-usb.h | 23 +++++++++++
 sound/soc/soc-usb.c     | 89 +++++++++++++++++++++++++++++++++++++++++
 2 files changed, 112 insertions(+)

diff --git a/include/sound/soc-usb.h b/include/sound/soc-usb.h
index db9ff0b4191d..587ea07a8cf5 100644
--- a/include/sound/soc-usb.h
+++ b/include/sound/soc-usb.h
@@ -56,6 +56,12 @@ int snd_soc_usb_connect(struct device *usbdev, struct snd_soc_usb_device *sdev);
 int snd_soc_usb_disconnect(struct device *usbdev, struct snd_soc_usb_device *sdev);
 void *snd_soc_usb_find_priv_data(struct device *usbdev);
 
+int snd_soc_usb_setup_offload_jack(struct snd_soc_component *component,
+				   struct snd_soc_jack *jack);
+int snd_soc_usb_disable_offload_jack(struct snd_soc_component *component);
+int snd_soc_usb_enable_offload_jack(struct snd_soc_component *component,
+				    struct snd_soc_jack *jack);
+
 struct snd_soc_usb *snd_soc_usb_allocate_port(struct snd_soc_component *component,
 					      void *data);
 void snd_soc_usb_free_port(struct snd_soc_usb *usb);
@@ -86,6 +92,23 @@ static inline void *snd_soc_usb_find_priv_data(struct device *usbdev)
 	return NULL;
 }
 
+static inline int snd_soc_usb_setup_offload_jack(struct snd_soc_component *component,
+						 struct snd_soc_jack *jack)
+{
+	return 0;
+}
+
+static inline int snd_soc_usb_disable_offload_jack(struct snd_soc_component *component)
+{
+	return 0;
+}
+
+static inline int snd_soc_usb_enable_offload_jack(struct snd_soc_component *component,
+						  struct snd_soc_jack *jack)
+{
+	return 0;
+}
+
 static inline struct snd_soc_usb *
 snd_soc_usb_allocate_port(struct snd_soc_component *component, void *data)
 {
diff --git a/sound/soc/soc-usb.c b/sound/soc/soc-usb.c
index c63033468e4a..ab914878e101 100644
--- a/sound/soc/soc-usb.c
+++ b/sound/soc/soc-usb.c
@@ -4,7 +4,10 @@
  */
 #include <linux/of.h>
 #include <linux/usb.h>
+
+#include <sound/jack.h>
 #include <sound/soc-usb.h>
+
 #include "../usb/card.h"
 
 static DEFINE_MUTEX(ctx_mutex);
@@ -56,6 +59,92 @@ static struct snd_soc_usb *snd_soc_find_usb_ctx(struct device *dev)
 	return ctx ? ctx : NULL;
 }
 
+/* SOC USB sound kcontrols */
+/**
+ * snd_soc_usb_setup_offload_jack() - Create USB offloading jack
+ * @component: USB DPCM backend DAI component
+ * @jack: jack structure to create
+ *
+ * Creates a jack device for notifying userspace of the availability
+ * of an offload capable device.
+ *
+ * Returns 0 on success, negative on error.
+ *
+ */
+int snd_soc_usb_setup_offload_jack(struct snd_soc_component *component,
+				   struct snd_soc_jack *jack)
+{
+	int ret;
+
+	ret = snd_soc_card_jack_new(component->card, "USB Offload Jack",
+				    SND_JACK_USB, jack);
+	if (ret < 0) {
+		dev_err(component->card->dev, "Unable to add USB offload jack: %d\n",
+			ret);
+		return ret;
+	}
+
+	ret = snd_soc_component_set_jack(component, jack, NULL);
+	if (ret) {
+		dev_err(component->card->dev, "Failed to set jack: %d\n", ret);
+		return ret;
+	}
+
+	return 0;
+}
+EXPORT_SYMBOL_GPL(snd_soc_usb_setup_offload_jack);
+
+/**
+ * snd_soc_usb_disable_offload_jack() - Disables USB offloading jack
+ * @component: USB DPCM backend DAI component
+ *
+ * Disables the offload jack device, so that further connection events
+ * won't be notified.
+ *
+ * Returns 0 on success, negative on error.
+ *
+ */
+int snd_soc_usb_disable_offload_jack(struct snd_soc_component *component)
+{
+	int ret;
+
+	ret = snd_soc_component_set_jack(component, NULL, NULL);
+	if (ret) {
+		dev_err(component->card->dev, "Failed to disable jack: %d\n", ret);
+		return ret;
+	}
+
+	return 0;
+}
+EXPORT_SYMBOL_GPL(snd_soc_usb_disable_offload_jack);
+
+/**
+ * snd_soc_usb_enable_offload_jack() - Enables USB offloading jack
+ * @component: USB DPCM backend DAI component
+ * @jack: offload jack to enable
+ *
+ * Enables the offload jack device, so that further connection events
+ * will be notified.  This is the complement to
+ * snd_soc_usb_disable_offload_jack().
+ *
+ * Returns 0 on success, negative on error.
+ *
+ */
+int snd_soc_usb_enable_offload_jack(struct snd_soc_component *component,
+				    struct snd_soc_jack *jack)
+{
+	int ret;
+
+	ret = snd_soc_component_set_jack(component, jack, NULL);
+	if (ret) {
+		dev_err(component->card->dev, "Failed to enable jack: %d\n", ret);
+		return ret;
+	}
+
+	return 0;
+}
+EXPORT_SYMBOL_GPL(snd_soc_usb_enable_offload_jack);
+
 /**
  * snd_soc_usb_find_priv_data() - Retrieve private data stored
  * @usbdev: device reference

