Return-Path: <linux-input+bounces-10950-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2897FA68238
	for <lists+linux-input@lfdr.de>; Wed, 19 Mar 2025 01:57:59 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 66865426CD2
	for <lists+linux-input@lfdr.de>; Wed, 19 Mar 2025 00:56:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CFF6E1EF378;
	Wed, 19 Mar 2025 00:52:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="ZQ1taiFq"
X-Original-To: linux-input@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 48BDC1D88D7;
	Wed, 19 Mar 2025 00:52:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742345542; cv=none; b=W6B4EiHB1tmm7CmBE+7stITv9URX0L1clTx74hbw3F7DpKJixlySO+Gtjq2Ti1RMRsi9QkKeM6UPVBJ/JF4DXHzcUlmgSqW6ylIuOInVQHevESw78rynI9V1j94g/XorGXZs7Vc8imhxVMpHwxQFNyt3Ulo5N3jAV7voxXdKbZU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742345542; c=relaxed/simple;
	bh=Q2L1I6iK7YTOa5bY3EDQkwKaS08GfozKSfSy79jH0y0=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=WZiTAg90XD312yoEdjXvhYrEpcIuoq5OJI/Z6GP2xttVo4hffuTX6dkLItGV0wWWa3T0QO1B7hb/w3UnJweTSefrZ31uqkPW9EyEJCILkaUO8fKfZn5gzrPQkODqeqhgxMWxWLddxJI9oxuRHMTJiwh658waqY+M3xYkQW/8zQM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=ZQ1taiFq; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 52IKYJoo023932;
	Wed, 19 Mar 2025 00:51:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	urxZLdtpB4bVF6l5A9aDHfrtDSmQQC9rekGWIrKpX9g=; b=ZQ1taiFq7Qvli/rF
	KMZoJQMDCUMd2IJeZhp6Hi5HVCSDqodNhZwMO8FOQaww9fDONQtavc8kjYXVnS5x
	aPrx98VvHs1PiAv0qCcU9OqpiS1P+lZ9VDLHD9YT4f7N3uG/1Jw4dqiQ4Hl3TxHK
	zdgfJmC01P4kUXWr0p1x3d/W0HJ5lGqGH8px+125vtV9hLGYPfbijSvX6nLQS/wU
	jX/HjkLf9DixEl2f933gSQfzWuzfT+/8//XdKu2C9gQX+aSMKrwB4WGpu36pip3O
	ebCNbLBsGYQ9txHKGbfUW7b7ApeXoJgnajsmh+mk5cr/DDVqSNEeqIoKBhmGkR9z
	mbuAUg==
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45exwx3hrm-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 19 Mar 2025 00:51:59 +0000 (GMT)
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com [10.47.209.197])
	by NALASPPMTA04.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 52J0pwug023943
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 19 Mar 2025 00:51:58 GMT
Received: from hu-wcheng-lv.qualcomm.com (10.49.16.6) by
 nalasex01b.na.qualcomm.com (10.47.209.197) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Tue, 18 Mar 2025 17:51:58 -0700
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
Subject: [PATCH v36 25/31] ASoC: qcom: qdsp6: Add headphone jack for offload connection status
Date: Tue, 18 Mar 2025 17:51:35 -0700
Message-ID: <20250319005141.312805-26-quic_wcheng@quicinc.com>
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
X-Proofpoint-ORIG-GUID: JQPGLGkZAr6R9vhyDmIp00THKe_e8u3n
X-Authority-Analysis: v=2.4 cv=INICChvG c=1 sm=1 tr=0 ts=67da152f cx=c_pps a=ouPCqIW2jiPt+lZRy3xVPw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17 a=3H110R4YSZwA:10 a=Vs1iUdzkB0EA:10 a=COk6AnOGAAAA:8 a=OTcUsbfgZZPj2p5z4CcA:9 a=RVmHIydaz68A:10
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: JQPGLGkZAr6R9vhyDmIp00THKe_e8u3n
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1093,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-18_10,2025-03-17_03,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0 adultscore=0
 priorityscore=1501 lowpriorityscore=0 malwarescore=0 clxscore=1015
 mlxlogscore=999 impostorscore=0 phishscore=0 mlxscore=0 spamscore=0
 bulkscore=0 classifier=spam authscore=0 authtc=n/a authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2503190003

The headphone jack framework has a well defined infrastructure for
notifying userspace entities through input devices.  Expose a jack device
that carries information about if an offload capable device is connected.
Applications can further identify specific offloading information through
other SND kcontrols.

Signed-off-by: Wesley Cheng <quic_wcheng@quicinc.com>
---
 sound/soc/qcom/Kconfig             |  5 +++
 sound/soc/qcom/Makefile            |  2 ++
 sound/soc/qcom/qdsp6/q6usb.c       | 41 ++++++++++++++++++++++
 sound/soc/qcom/sm8250.c            | 24 ++++++++++++-
 sound/soc/qcom/usb_offload_utils.c | 56 ++++++++++++++++++++++++++++++
 sound/soc/qcom/usb_offload_utils.h | 30 ++++++++++++++++
 6 files changed, 157 insertions(+), 1 deletion(-)
 create mode 100644 sound/soc/qcom/usb_offload_utils.c
 create mode 100644 sound/soc/qcom/usb_offload_utils.h

diff --git a/sound/soc/qcom/Kconfig b/sound/soc/qcom/Kconfig
index 77c21fc4fc1b..6bedac2effc9 100644
--- a/sound/soc/qcom/Kconfig
+++ b/sound/soc/qcom/Kconfig
@@ -118,9 +118,14 @@ config SND_SOC_QDSP6_PRM
 	tristate
 	select SND_SOC_QDSP6_PRM_LPASS_CLOCKS
 
+config SND_SOC_QCOM_OFFLOAD_UTILS
+	tristate
+
 config SND_SOC_QDSP6_USB
     tristate "SoC ALSA USB offloading backing for QDSP6"
     depends on SND_SOC_USB
+    select SND_SOC_QCOM_OFFLOAD_UTILS
+
     help
       Adds support for USB offloading for QDSP6 ASoC
       based platform sound cards.  This will enable the
diff --git a/sound/soc/qcom/Makefile b/sound/soc/qcom/Makefile
index 16db7b53ddac..985ce2ae286b 100644
--- a/sound/soc/qcom/Makefile
+++ b/sound/soc/qcom/Makefile
@@ -30,6 +30,7 @@ snd-soc-sc8280xp-y := sc8280xp.o
 snd-soc-qcom-common-y := common.o
 snd-soc-qcom-sdw-y := sdw.o
 snd-soc-x1e80100-y := x1e80100.o
+snd-soc-qcom-offload-utils-objs := usb_offload_utils.o
 
 obj-$(CONFIG_SND_SOC_STORM) += snd-soc-storm.o
 obj-$(CONFIG_SND_SOC_APQ8016_SBC) += snd-soc-apq8016-sbc.o
@@ -42,6 +43,7 @@ obj-$(CONFIG_SND_SOC_SM8250) += snd-soc-sm8250.o
 obj-$(CONFIG_SND_SOC_QCOM_COMMON) += snd-soc-qcom-common.o
 obj-$(CONFIG_SND_SOC_QCOM_SDW) += snd-soc-qcom-sdw.o
 obj-$(CONFIG_SND_SOC_X1E80100) += snd-soc-x1e80100.o
+obj-$(CONFIG_SND_SOC_QCOM_OFFLOAD_UTILS) += snd-soc-qcom-offload-utils.o
 
 #DSP lib
 obj-$(CONFIG_SND_SOC_QDSP6) += qdsp6/
diff --git a/sound/soc/qcom/qdsp6/q6usb.c b/sound/soc/qcom/qdsp6/q6usb.c
index d57bdc722897..d3698dcecca0 100644
--- a/sound/soc/qcom/qdsp6/q6usb.c
+++ b/sound/soc/qcom/qdsp6/q6usb.c
@@ -14,6 +14,7 @@
 #include <linux/slab.h>
 
 #include <sound/asound.h>
+#include <sound/jack.h>
 #include <sound/pcm.h>
 #include <sound/pcm_params.h>
 #include <sound/q6usboffload.h>
@@ -30,6 +31,7 @@
 struct q6usb_port_data {
 	struct q6afe_usb_cfg usb_cfg;
 	struct snd_soc_usb *usb;
+	struct snd_soc_jack *hs_jack;
 	struct q6usb_offload priv;
 
 	/* Protects against operations between SOC USB and ASoC */
@@ -142,16 +144,54 @@ static int q6usb_alsa_connection_cb(struct snd_soc_usb *usb,
 
 	mutex_lock(&data->mutex);
 	if (connected) {
+		if (data->hs_jack)
+			snd_jack_report(data->hs_jack->jack, SND_JACK_USB);
+
 		/* Selects the latest USB headset plugged in for offloading */
 		list_add_tail(&sdev->list, &data->devices);
 	} else {
 		list_del(&sdev->list);
+
+		if (data->hs_jack)
+			snd_jack_report(data->hs_jack->jack, 0);
 	}
 	mutex_unlock(&data->mutex);
 
 	return 0;
 }
 
+static void q6usb_component_disable_jack(struct q6usb_port_data *data)
+{
+	/* Offload jack has already been disabled */
+	if (!data->hs_jack)
+		return;
+
+	snd_jack_report(data->hs_jack->jack, 0);
+	data->hs_jack = NULL;
+}
+
+static void q6usb_component_enable_jack(struct q6usb_port_data *data,
+					struct snd_soc_jack *jack)
+{
+	snd_jack_report(jack->jack, !list_empty(&data->devices) ? SND_JACK_USB : 0);
+	data->hs_jack = jack;
+}
+
+static int q6usb_component_set_jack(struct snd_soc_component *component,
+				    struct snd_soc_jack *jack, void *priv)
+{
+	struct q6usb_port_data *data = dev_get_drvdata(component->dev);
+
+	mutex_lock(&data->mutex);
+	if (jack)
+		q6usb_component_enable_jack(data, jack);
+	else
+		q6usb_component_disable_jack(data);
+	mutex_unlock(&data->mutex);
+
+	return 0;
+}
+
 static int q6usb_component_probe(struct snd_soc_component *component)
 {
 	struct q6usb_port_data *data = dev_get_drvdata(component->dev);
@@ -179,6 +219,7 @@ static void q6usb_component_remove(struct snd_soc_component *component)
 
 static const struct snd_soc_component_driver q6usb_dai_component = {
 	.probe = q6usb_component_probe,
+	.set_jack = q6usb_component_set_jack,
 	.remove = q6usb_component_remove,
 	.name = "q6usb-dai-component",
 	.dapm_widgets = q6usb_dai_widgets,
diff --git a/sound/soc/qcom/sm8250.c b/sound/soc/qcom/sm8250.c
index 45e0c33fc3f3..774e3aa3d1a4 100644
--- a/sound/soc/qcom/sm8250.c
+++ b/sound/soc/qcom/sm8250.c
@@ -12,6 +12,7 @@
 #include <linux/input-event-codes.h>
 #include "qdsp6/q6afe.h"
 #include "common.h"
+#include "usb_offload_utils.h"
 #include "sdw.h"
 
 #define DRIVER_NAME		"sm8250"
@@ -22,14 +23,34 @@ struct sm8250_snd_data {
 	struct snd_soc_card *card;
 	struct sdw_stream_runtime *sruntime[AFE_PORT_MAX];
 	struct snd_soc_jack jack;
+	struct snd_soc_jack usb_offload_jack;
+	bool usb_offload_jack_setup;
 	bool jack_setup;
 };
 
 static int sm8250_snd_init(struct snd_soc_pcm_runtime *rtd)
 {
 	struct sm8250_snd_data *data = snd_soc_card_get_drvdata(rtd->card);
+	struct snd_soc_dai *cpu_dai = snd_soc_rtd_to_cpu(rtd, 0);
+	int ret;
+
+	if (cpu_dai->id == USB_RX)
+		ret = qcom_snd_usb_offload_jack_setup(rtd, &data->usb_offload_jack,
+						      &data->usb_offload_jack_setup);
+	else
+		ret = qcom_snd_wcd_jack_setup(rtd, &data->jack, &data->jack_setup);
+	return ret;
+}
+
+static void sm8250_snd_exit(struct snd_soc_pcm_runtime *rtd)
+{
+	struct sm8250_snd_data *data = snd_soc_card_get_drvdata(rtd->card);
+	struct snd_soc_dai *cpu_dai = snd_soc_rtd_to_cpu(rtd, 0);
+
+	if (cpu_dai->id == USB_RX)
+		qcom_snd_usb_offload_jack_remove(rtd,
+						 &data->usb_offload_jack_setup);
 
-	return qcom_snd_wcd_jack_setup(rtd, &data->jack, &data->jack_setup);
 }
 
 static int sm8250_be_hw_params_fixup(struct snd_soc_pcm_runtime *rtd,
@@ -145,6 +166,7 @@ static void sm8250_add_be_ops(struct snd_soc_card *card)
 	for_each_card_prelinks(card, i, link) {
 		if (link->no_pcm == 1) {
 			link->init = sm8250_snd_init;
+			link->exit = sm8250_snd_exit;
 			link->be_hw_params_fixup = sm8250_be_hw_params_fixup;
 			link->ops = &sm8250_be_ops;
 		}
diff --git a/sound/soc/qcom/usb_offload_utils.c b/sound/soc/qcom/usb_offload_utils.c
new file mode 100644
index 000000000000..0a24b278fcdf
--- /dev/null
+++ b/sound/soc/qcom/usb_offload_utils.c
@@ -0,0 +1,56 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Copyright (c) 2022-2025 Qualcomm Innovation Center, Inc. All rights reserved.
+ */
+#include <dt-bindings/sound/qcom,q6afe.h>
+#include <linux/module.h>
+#include <sound/jack.h>
+#include <sound/soc-usb.h>
+
+#include "usb_offload_utils.h"
+
+int qcom_snd_usb_offload_jack_setup(struct snd_soc_pcm_runtime *rtd,
+				    struct snd_soc_jack *jack, bool *jack_setup)
+{
+	struct snd_soc_dai *cpu_dai = snd_soc_rtd_to_cpu(rtd, 0);
+	struct snd_soc_dai *codec_dai = snd_soc_rtd_to_codec(rtd, 0);
+	int ret = 0;
+
+	if (cpu_dai->id != USB_RX)
+		return -EINVAL;
+
+	if (!*jack_setup) {
+		ret = snd_soc_usb_setup_offload_jack(codec_dai->component, jack);
+		if (ret)
+			return ret;
+	}
+
+	*jack_setup = true;
+
+	return 0;
+}
+EXPORT_SYMBOL_GPL(qcom_snd_usb_offload_jack_setup);
+
+int qcom_snd_usb_offload_jack_remove(struct snd_soc_pcm_runtime *rtd,
+				     bool *jack_setup)
+{
+	struct snd_soc_dai *cpu_dai = snd_soc_rtd_to_cpu(rtd, 0);
+	struct snd_soc_dai *codec_dai = snd_soc_rtd_to_codec(rtd, 0);
+	int ret = 0;
+
+	if (cpu_dai->id != USB_RX)
+		return -EINVAL;
+
+	if (*jack_setup) {
+		ret = snd_soc_component_set_jack(codec_dai->component, NULL, NULL);
+		if (ret)
+			return ret;
+	}
+
+	*jack_setup = false;
+
+	return 0;
+}
+EXPORT_SYMBOL_GPL(qcom_snd_usb_offload_jack_remove);
+MODULE_DESCRIPTION("ASoC Q6 USB offload controls");
+MODULE_LICENSE("GPL");
diff --git a/sound/soc/qcom/usb_offload_utils.h b/sound/soc/qcom/usb_offload_utils.h
new file mode 100644
index 000000000000..c3f411f565b0
--- /dev/null
+++ b/sound/soc/qcom/usb_offload_utils.h
@@ -0,0 +1,30 @@
+/* SPDX-License-Identifier: GPL-2.0
+ *
+ * Copyright (c) 2022-2025 Qualcomm Innovation Center, Inc. All rights reserved.
+ */
+#ifndef __QCOM_SND_USB_OFFLOAD_UTILS_H__
+#define __QCOM_SND_USB_OFFLOAD_UTILS_H__
+
+#include <sound/soc.h>
+
+#if IS_ENABLED(CONFIG_SND_SOC_QCOM_OFFLOAD_UTILS)
+int qcom_snd_usb_offload_jack_setup(struct snd_soc_pcm_runtime *rtd,
+				    struct snd_soc_jack *jack, bool *jack_setup);
+
+int qcom_snd_usb_offload_jack_remove(struct snd_soc_pcm_runtime *rtd,
+				     bool *jack_setup);
+#else
+static inline int qcom_snd_usb_offload_jack_setup(struct snd_soc_pcm_runtime *rtd,
+						  struct snd_soc_jack *jack,
+						  bool *jack_setup)
+{
+	return -ENODEV;
+}
+
+static inline int qcom_snd_usb_offload_jack_remove(struct snd_soc_pcm_runtime *rtd,
+						   bool *jack_setup)
+{
+	return -ENODEV;
+}
+#endif /* IS_ENABLED(CONFIG_SND_SOC_QCOM_OFFLOAD_UTILS) */
+#endif /* __QCOM_SND_USB_OFFLOAD_UTILS_H__ */

