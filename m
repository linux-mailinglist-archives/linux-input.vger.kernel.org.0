Return-Path: <linux-input+bounces-9050-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 53F26A04F5F
	for <lists+linux-input@lfdr.de>; Wed,  8 Jan 2025 02:27:15 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id E44BB161FE4
	for <lists+linux-input@lfdr.de>; Wed,  8 Jan 2025 01:26:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 235261B4234;
	Wed,  8 Jan 2025 01:22:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="LHLr6Mph"
X-Original-To: linux-input@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A06D19F13B;
	Wed,  8 Jan 2025 01:22:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736299372; cv=none; b=rz6H7xWYKX1DGOd0/iAkNN+B9pFcQLgGFIMAc507iUDsh2gowgHF/TJ4IeW9oXaf2LFnJWq0YQupZnvrtoXqZvzYcwN6NSyeZsGxB42pvzAvB1D0gIbuMCQuNolgikkrWl19M5VtJsFa3Xz6WcvTI1kAUo8svgu9tm3WqquJNmM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736299372; c=relaxed/simple;
	bh=3pchN+pfse7OhFbYOp4jOrcitCkUW+5Lr2GZQhfxYuM=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=eJX8Dnab4DEemQN3HO+NSmSsBWA0R8/fVox50ywC3E6B7PvTW5xtT2WAyMQnPCp6bk25jba7vK1IYjVQAfFCAHvdGK7gM/bHCq8JhTfppLlKosHHuuZzMCKuPQtoPoXzJuAK0fg9+4Yb1l+f5K+IJ+UR5hNyg++f83BCE5/capk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=LHLr6Mph; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 507K5rnj020158;
	Wed, 8 Jan 2025 01:22:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	i868WUIYLjxpdksSfKv0qa/3/lqtD6DrNqSKKBxBDys=; b=LHLr6MphyDMZ3NYu
	JUc0E7qGNeyGHdz5xjRJVEQhvv0OwfAs2k/TlpM1vBZ3qL8EQPdeMwpkI/PwO6TO
	VoK3HhNURCWsPxdfpi6soslaxKJDtTheo4wCDd8tFgBQVTStuROmfumB+Uwq2gQN
	2z+rL8GenL9IWt/YQqjWH+FVm30BZ1Ni8ZZBHAtk/QEJwQpSbHjMbp3En9lKEgIy
	/KO9TNavwqXVR/lgCTZUVsmnEnvqyu/QEf/XcwK/wX1N8pQKntic10IFsuy/UiDc
	ToJskZY5oDK8rpHeNfSMTyVB7l439RohAxj8E9cnozfB81/RjJyA8FNDZ78dXyje
	2utCSA==
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 441b0k0hgy-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 08 Jan 2025 01:22:34 +0000 (GMT)
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com [10.47.209.197])
	by NALASPPMTA03.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 5081MX8t023647
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 8 Jan 2025 01:22:33 GMT
Received: from hu-wcheng-lv.qualcomm.com (10.49.16.6) by
 nalasex01b.na.qualcomm.com (10.47.209.197) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Tue, 7 Jan 2025 17:22:32 -0800
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
Subject: [PATCH v32 31/32] ALSA: usb-audio: qcom: Add USB offload route kcontrol
Date: Tue, 7 Jan 2025 17:22:12 -0800
Message-ID: <20250108012213.1659364-32-quic_wcheng@quicinc.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250108012213.1659364-1-quic_wcheng@quicinc.com>
References: <20250108012213.1659364-1-quic_wcheng@quicinc.com>
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
X-Proofpoint-ORIG-GUID: 4EANp0DGF-ISR0rLHUym2psFmLsdZZKJ
X-Proofpoint-GUID: 4EANp0DGF-ISR0rLHUym2psFmLsdZZKJ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 adultscore=0
 mlxlogscore=999 impostorscore=0 priorityscore=1501 suspectscore=0
 malwarescore=0 spamscore=0 clxscore=1015 phishscore=0 lowpriorityscore=0
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2501080007

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
index 000000000000..2696eb145ef5
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
+			  struct snd_ctl_elem_value *ucontrol)
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
+				      struct snd_ctl_elem_info *uinfo)
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
+			  struct snd_ctl_elem_value *ucontrol)
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
+				      struct snd_ctl_elem_info *uinfo)
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
+ * @chip - USB SND chip device
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
+	char ctl_name[34];
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
+				  udev->bus->sysdev));
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
+				  udev->bus->sysdev));
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
index 29302446e9da..81f75ca34e4d 100644
--- a/sound/usb/qcom/qc_audio_offload.c
+++ b/sound/usb/qcom/qc_audio_offload.c
@@ -37,6 +37,7 @@
 #include "../pcm.h"
 #include "../power.h"
 
+#include "mixer_usb_offload.h"
 #include "usb_audio_qmi_v01.h"
 
 /* Stream disable request timeout during USB device disconnect */
@@ -1813,6 +1814,7 @@ static void qc_usb_audio_offload_probe(struct snd_usb_audio *chip)
 		sdev->card_idx = chip->card->number;
 		sdev->chip_idx = chip->index;
 
+		snd_usb_offload_create_ctl(chip);
 		snd_soc_usb_connect(usb_get_usb_backend(udev), sdev);
 	}
 

