Return-Path: <linux-input+bounces-10955-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 41DF1A6825D
	for <lists+linux-input@lfdr.de>; Wed, 19 Mar 2025 01:58:58 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 1834F3A1C9B
	for <lists+linux-input@lfdr.de>; Wed, 19 Mar 2025 00:57:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 09D2B20A5E1;
	Wed, 19 Mar 2025 00:52:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="gxq4reev"
X-Original-To: linux-input@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 89AC31DF267;
	Wed, 19 Mar 2025 00:52:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742345543; cv=none; b=rP4IwuwCWiVkyjFLnqCRAwlTH75QVw9Sq8KDvEnZ5YJYAdNZQrCmsFVkjKAdmquMuh4onYU3cw8XOQbxhUzWAwNb20B7/L1fshRF5WGm/Lj7G7pSSQ+/M6YUmUprmygLSlm3ozFhmQO2ASQ9V/TN5P0QllEgyA5bLEk0qc5CgNo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742345543; c=relaxed/simple;
	bh=VUbXfBf3Ew2ILsucWRcnHdy59nP3gbLHR/IwvAejbB4=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=dQpxpaBfBn2P3Mt2YMrRukM5YzdXy4ssFSqUdcmcizFDJzlnX6Kd8ajGG0csPW/OroEE+ONhvQqF62lNPv/2kRVIUudcgrlkwb3ka+Ju1oZ4Rhbc34lPuw/q/ejuv8aVzgXJIO9+coFm7sHOn8jTVScu9wZoMUQSCjHiFeY5H2w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=gxq4reev; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 52IHqlXb009775;
	Wed, 19 Mar 2025 00:52:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	U8y4vsatMXF9+1wsFliMKPPLI63fhkzK6gBiYcsRYsY=; b=gxq4reevpUwQH1Nj
	geo7Z6Q8WBGHfC0IpR9HHIANUi/uNkWirP6MyLXhTXbWdIopEsfLAF0PI7K3oFhn
	kz1j8EvwX68OJ/lVDufhxT7nPTLGlnLiG46O0FfpvpUmMPw9LRo1hPtObrwD5Viq
	7ZIfHSvDxSfRnX8mwNTUXYHawllIwZ+1VDKUgyEhlkijtIwSPtSX9iHfSi+FQh9x
	UNn8kMZ5jXorqEGSiqSzYhcXnvg05czhMdW6wqlmJQeBsG7sRngsnoF8KUGU2Qmz
	7lFEic6j+4iiGoF4r1rUq8lmaKv3u7FIA2eTBEyhSRFfgLWaBveeGq7l2v4vzkIw
	VGt7Hw==
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45d1sy1x8x-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 19 Mar 2025 00:52:00 +0000 (GMT)
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com [10.47.209.197])
	by NALASPPMTA04.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 52J0pxMK023946
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 19 Mar 2025 00:51:59 GMT
Received: from hu-wcheng-lv.qualcomm.com (10.49.16.6) by
 nalasex01b.na.qualcomm.com (10.47.209.197) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Tue, 18 Mar 2025 17:51:59 -0700
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
Subject: [PATCH v36 30/31] ALSA: usb-audio: qcom: Add USB offload route kcontrol
Date: Tue, 18 Mar 2025 17:51:40 -0700
Message-ID: <20250319005141.312805-31-quic_wcheng@quicinc.com>
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
X-Proofpoint-GUID: 5h_m2ASel_pYrEh__2KQxEPAmmYh4ed2
X-Proofpoint-ORIG-GUID: 5h_m2ASel_pYrEh__2KQxEPAmmYh4ed2
X-Authority-Analysis: v=2.4 cv=XKcwSRhE c=1 sm=1 tr=0 ts=67da1531 cx=c_pps a=ouPCqIW2jiPt+lZRy3xVPw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17 a=3H110R4YSZwA:10 a=Vs1iUdzkB0EA:10 a=COk6AnOGAAAA:8 a=Smv1N9RPwzzuotDnthYA:9 a=RVmHIydaz68A:10
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1093,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-18_10,2025-03-17_03,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 mlxlogscore=999 priorityscore=1501 clxscore=1015 phishscore=0
 impostorscore=0 adultscore=0 mlxscore=0 malwarescore=0 suspectscore=0
 spamscore=0 bulkscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2503190003

In order to allow userspace/applications know about USB offloading status,
expose a sound kcontrol that fetches information about which sound card
and PCM index the USB device is mapped to for supporting offloading.  In
the USB audio offloading framework, the ASoC BE DAI link is the entity
responsible for registering to the SOC USB layer.

It is expected for the USB SND offloading driver to add the kcontrol to the
sound card associated with the USB audio device.  An example output would
look like:

tinymix -D 1 get 'USB Offload Playback Route PCM#0'
-1, -1 (range -1->255)

This example signifies that there is no mapped ASoC path available for the
USB SND device.

tinymix -D 1 get 'USB Offload Playback Route PCM#0'
0, 0 (range -1->255)

This example signifies that the offload path is available over ASoC sound
card index#0 and PCM device#0.

The USB offload kcontrol will be added in addition to the existing
kcontrols identified by the USB SND mixer.  The kcontrols used to modify
the USB audio device specific parameters are still valid and expected to be
used.  These parameters are not mirrored to the ASoC subsystem.

Signed-off-by: Wesley Cheng <quic_wcheng@quicinc.com>
---
 sound/usb/Kconfig                  |  10 ++
 sound/usb/qcom/Makefile            |   4 +
 sound/usb/qcom/mixer_usb_offload.c | 158 +++++++++++++++++++++++++++++
 sound/usb/qcom/mixer_usb_offload.h |  17 ++++
 sound/usb/qcom/qc_audio_offload.c  |   2 +
 5 files changed, 191 insertions(+)
 create mode 100644 sound/usb/qcom/mixer_usb_offload.c
 create mode 100644 sound/usb/qcom/mixer_usb_offload.h

diff --git a/sound/usb/Kconfig b/sound/usb/Kconfig
index 6daa551738da..7d8833945711 100644
--- a/sound/usb/Kconfig
+++ b/sound/usb/Kconfig
@@ -176,9 +176,19 @@ config SND_BCD2000
 	  To compile this driver as a module, choose M here: the module
 	  will be called snd-bcd2000.
 
+config SND_USB_QC_OFFLOAD_MIXER
+	tristate "Qualcomm USB Audio Offload mixer control"
+	help
+	 Say Y to enable the Qualcomm USB audio offloading mixer controls.
+	 This exposes an USB offload capable kcontrol to signal to
+	 applications about which platform sound card can support USB
+	 audio offload.  The returning values specify the mapped ASoC card
+	 and PCM device the USB audio device is associated to.
+
 config SND_USB_AUDIO_QMI
 	tristate "Qualcomm Audio Offload driver"
 	depends on QCOM_QMI_HELPERS && SND_USB_AUDIO && USB_XHCI_SIDEBAND && SND_SOC_USB
+	select SND_USB_OFFLOAD_MIXER
 	help
 	  Say Y here to enable the Qualcomm USB audio offloading feature.
 
diff --git a/sound/usb/qcom/Makefile b/sound/usb/qcom/Makefile
index 1eb51160e2e5..1efe1b90be7a 100644
--- a/sound/usb/qcom/Makefile
+++ b/sound/usb/qcom/Makefile
@@ -1,2 +1,6 @@
 snd-usb-audio-qmi-y := usb_audio_qmi_v01.o qc_audio_offload.o
 obj-$(CONFIG_SND_USB_AUDIO_QMI) += snd-usb-audio-qmi.o
+
+ifneq ($(CONFIG_SND_USB_QC_OFFLOAD_MIXER),)
+snd-usb-audio-qmi-y += mixer_usb_offload.o
+endif
diff --git a/sound/usb/qcom/mixer_usb_offload.c b/sound/usb/qcom/mixer_usb_offload.c
new file mode 100644
index 000000000000..574949a8643b
--- /dev/null
+++ b/sound/usb/qcom/mixer_usb_offload.c
@@ -0,0 +1,158 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Copyright (c) 2022-2025 Qualcomm Innovation Center, Inc. All rights reserved.
+ */
+
+#include <linux/usb.h>
+
+#include <sound/core.h>
+#include <sound/control.h>
+#include <sound/soc-usb.h>
+
+#include "../usbaudio.h"
+#include "../card.h"
+#include "../helper.h"
+#include "../mixer.h"
+
+#include "mixer_usb_offload.h"
+
+#define PCM_IDX(n)  ((n) & 0xffff)
+#define CARD_IDX(n) ((n) >> 16)
+
+static int
+snd_usb_offload_card_route_get(struct snd_kcontrol *kcontrol,
+			       struct snd_ctl_elem_value *ucontrol)
+{
+	struct device *sysdev = snd_kcontrol_chip(kcontrol);
+	int ret;
+
+	ret = snd_soc_usb_update_offload_route(sysdev,
+					       CARD_IDX(kcontrol->private_value),
+					       PCM_IDX(kcontrol->private_value),
+					       SNDRV_PCM_STREAM_PLAYBACK,
+					       SND_SOC_USB_KCTL_CARD_ROUTE,
+					       ucontrol->value.integer.value);
+	if (ret < 0) {
+		ucontrol->value.integer.value[0] = -1;
+		ucontrol->value.integer.value[1] = -1;
+	}
+
+	return 0;
+}
+
+static int snd_usb_offload_card_route_info(struct snd_kcontrol *kcontrol,
+					   struct snd_ctl_elem_info *uinfo)
+{
+	uinfo->type = SNDRV_CTL_ELEM_TYPE_INTEGER;
+	uinfo->count = 1;
+	uinfo->value.integer.min = -1;
+	uinfo->value.integer.max = SNDRV_CARDS;
+
+	return 0;
+}
+
+static struct snd_kcontrol_new snd_usb_offload_mapped_card_ctl = {
+	.iface = SNDRV_CTL_ELEM_IFACE_CARD,
+	.access = SNDRV_CTL_ELEM_ACCESS_READ,
+	.info = snd_usb_offload_card_route_info,
+	.get = snd_usb_offload_card_route_get,
+};
+
+static int
+snd_usb_offload_pcm_route_get(struct snd_kcontrol *kcontrol,
+			      struct snd_ctl_elem_value *ucontrol)
+{
+	struct device *sysdev = snd_kcontrol_chip(kcontrol);
+	int ret;
+
+	ret = snd_soc_usb_update_offload_route(sysdev,
+					       CARD_IDX(kcontrol->private_value),
+					       PCM_IDX(kcontrol->private_value),
+					       SNDRV_PCM_STREAM_PLAYBACK,
+					       SND_SOC_USB_KCTL_PCM_ROUTE,
+					       ucontrol->value.integer.value);
+	if (ret < 0) {
+		ucontrol->value.integer.value[0] = -1;
+		ucontrol->value.integer.value[1] = -1;
+	}
+
+	return 0;
+}
+
+static int snd_usb_offload_pcm_route_info(struct snd_kcontrol *kcontrol,
+					  struct snd_ctl_elem_info *uinfo)
+{
+	uinfo->type = SNDRV_CTL_ELEM_TYPE_INTEGER;
+	uinfo->count = 1;
+	uinfo->value.integer.min = -1;
+	/* Arbitrary max value, as there is no 'limit' on number of PCM devices */
+	uinfo->value.integer.max = 0xff;
+
+	return 0;
+}
+
+static struct snd_kcontrol_new snd_usb_offload_mapped_pcm_ctl = {
+	.iface = SNDRV_CTL_ELEM_IFACE_CARD,
+	.access = SNDRV_CTL_ELEM_ACCESS_READ,
+	.info = snd_usb_offload_pcm_route_info,
+	.get = snd_usb_offload_pcm_route_get,
+};
+
+/**
+ * snd_usb_offload_create_ctl() - Add USB offload bounded mixer
+ * @chip: USB SND chip device
+ *
+ * Creates a sound control for a USB audio device, so that applications can
+ * query for if there is an available USB audio offload path, and which
+ * card is managing it.
+ */
+int snd_usb_offload_create_ctl(struct snd_usb_audio *chip)
+{
+	struct usb_device *udev = chip->dev;
+	struct snd_kcontrol_new *chip_kctl;
+	struct snd_usb_substream *subs;
+	struct snd_usb_stream *as;
+	char ctl_name[48];
+	int ret;
+
+	list_for_each_entry(as, &chip->pcm_list, list) {
+		subs = &as->substream[SNDRV_PCM_STREAM_PLAYBACK];
+		if (!subs->ep_num || as->pcm_index > 0xff)
+			continue;
+
+		chip_kctl = &snd_usb_offload_mapped_card_ctl;
+		chip_kctl->count = 1;
+		/*
+		 * Store the associated USB SND card number and PCM index for
+		 * the kctl.
+		 */
+		chip_kctl->private_value = as->pcm_index |
+					  chip->card->number << 16;
+		sprintf(ctl_name, "USB Offload Playback Card Route PCM#%d",
+			as->pcm_index);
+		chip_kctl->name = ctl_name;
+		ret = snd_ctl_add(chip->card, snd_ctl_new1(chip_kctl,
+							   udev->bus->sysdev));
+		if (ret < 0)
+			break;
+
+		chip_kctl = &snd_usb_offload_mapped_pcm_ctl;
+		chip_kctl->count = 1;
+		/*
+		 * Store the associated USB SND card number and PCM index for
+		 * the kctl.
+		 */
+		chip_kctl->private_value = as->pcm_index |
+					  chip->card->number << 16;
+		sprintf(ctl_name, "USB Offload Playback PCM Route PCM#%d",
+			as->pcm_index);
+		chip_kctl->name = ctl_name;
+		ret = snd_ctl_add(chip->card, snd_ctl_new1(chip_kctl,
+							   udev->bus->sysdev));
+		if (ret < 0)
+			break;
+	}
+
+	return ret;
+}
+EXPORT_SYMBOL_GPL(snd_usb_offload_create_ctl);
diff --git a/sound/usb/qcom/mixer_usb_offload.h b/sound/usb/qcom/mixer_usb_offload.h
new file mode 100644
index 000000000000..9ab137105af3
--- /dev/null
+++ b/sound/usb/qcom/mixer_usb_offload.h
@@ -0,0 +1,17 @@
+/* SPDX-License-Identifier: GPL-2.0
+ *
+ * Copyright (c) 2022-2025 Qualcomm Innovation Center, Inc. All rights reserved.
+ */
+
+#ifndef __USB_OFFLOAD_MIXER_H
+#define __USB_OFFLOAD_MIXER_H
+
+#if IS_ENABLED(CONFIG_SND_USB_QC_OFFLOAD_MIXER)
+int snd_usb_offload_create_ctl(struct snd_usb_audio *chip);
+#else
+static inline int snd_usb_offload_create_ctl(struct snd_usb_audio *chip)
+{
+	return 0;
+}
+#endif
+#endif /* __USB_OFFLOAD_MIXER_H */
diff --git a/sound/usb/qcom/qc_audio_offload.c b/sound/usb/qcom/qc_audio_offload.c
index 370890f64355..31624753284e 100644
--- a/sound/usb/qcom/qc_audio_offload.c
+++ b/sound/usb/qcom/qc_audio_offload.c
@@ -37,6 +37,7 @@
 #include "../pcm.h"
 #include "../power.h"
 
+#include "mixer_usb_offload.h"
 #include "usb_audio_qmi_v01.h"
 
 /* Stream disable request timeout during USB device disconnect */
@@ -1807,6 +1808,7 @@ static void qc_usb_audio_offload_probe(struct snd_usb_audio *chip)
 		sdev->card_idx = chip->card->number;
 		sdev->chip_idx = chip->index;
 
+		snd_usb_offload_create_ctl(chip);
 		snd_soc_usb_connect(usb_get_usb_backend(udev), sdev);
 	}
 

