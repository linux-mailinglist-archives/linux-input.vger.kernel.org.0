Return-Path: <linux-input+bounces-9294-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id ACC5DA145C2
	for <lists+linux-input@lfdr.de>; Fri, 17 Jan 2025 00:29:58 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id CA0DE164D65
	for <lists+linux-input@lfdr.de>; Thu, 16 Jan 2025 23:29:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7659C244F9B;
	Thu, 16 Jan 2025 23:29:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="ooLQPoYl"
X-Original-To: linux-input@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D435D236A78;
	Thu, 16 Jan 2025 23:29:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737070143; cv=none; b=nIDmKfBJAtPLooStSqX4ctUeT7qB3OFm/3XiS+UQBTvsw1w8sFlI0y0nb/5lRib28zzs6yk+m0jjqEmClC46vyUggTVGN6AYaBeQopj5RgkeZuwDm9Kv5/Z59eacucQvTYfDr6c+3p2a7gfrTzGZRxZhKQZTbB/kTHoCF/T/nbk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737070143; c=relaxed/simple;
	bh=vIqXElz3WLdaatP5kgZ1Mhqks2gFIM7XwbAmhm+0NnU=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=CyhFqapgBCbzdExImZ41TBaCr7ghtas1i7wqZ48MHTSRQHScHzoBaSheDq85PfzTrmj79gXk9cjfzaKBbfaC7FJjjkuXXoICuQ8vtKAt43CWvn+yVx5t3vvSgN3TqW1vLhF1PDvDNvCsPrbahhr7iYHa6917KZHNJR5fgufVDYs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=ooLQPoYl; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 50GKwm22028769;
	Thu, 16 Jan 2025 23:28:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	00W/w2AvmHYfLFyIEJIq5Hywn8MCnDfcMbNsFyuTHWw=; b=ooLQPoYlcd/MkaxQ
	OX47ifLvRlN74WDkx8tcrAmxBn5AIU/LXlfNVGWxpLjQi3+sldKzeNdaOJtjhMt+
	tQDaHdpRYyMuKE1HHhUlYdS+MQaba9KGkgqWsbuQkkFj32L9rEdd5Usq9cHJOIsi
	zLGUz6WLl14TIUDc0N4HZiUAO4N8DbjoN3mJahtUXzQulv4BYZI0s/g0PTRp67St
	eKjlneLKKfsWki7iu/7RwI4iPmkEo0i7xAiC11J/CPnrd0SMr7ZSB/KhzEFO7OwX
	tm6jH3U3hqFijyKDEq43KwG+fADfNZmRi7nQE7SDHUQ5T7VJNOB4ZU/R3fOML2S4
	47t4Mw==
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4479mf883k-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 16 Jan 2025 23:28:49 +0000 (GMT)
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com [10.47.209.197])
	by NALASPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 50GNSmZQ027143
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 16 Jan 2025 23:28:48 GMT
Received: from hu-wcheng-lv.qualcomm.com (10.49.16.6) by
 nalasex01b.na.qualcomm.com (10.47.209.197) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Thu, 16 Jan 2025 15:28:48 -0800
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
Subject: [PATCH v33 26/31] ASoC: qcom: qdsp6: Fetch USB offload mapped card and PCM device
Date: Thu, 16 Jan 2025 15:28:19 -0800
Message-ID: <20250116232824.3748438-27-quic_wcheng@quicinc.com>
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
X-Proofpoint-GUID: EgEWOLy5_R9NDK5xWe2e9NtZsYiqErF-
X-Proofpoint-ORIG-GUID: EgEWOLy5_R9NDK5xWe2e9NtZsYiqErF-
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-01-16_10,2025-01-16_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0 bulkscore=0
 clxscore=1015 suspectscore=0 lowpriorityscore=0 priorityscore=1501
 mlxlogscore=999 mlxscore=0 malwarescore=0 phishscore=0 spamscore=0
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2501160174

The USB SND path may need to know how the USB offload path is routed, so
that applications can open the proper sound card and PCM device.  The
implementation for the QC ASoC design has a "USB Mixer" kcontrol for each
possible FE (Q6ASM) DAI, which can be utilized to know which front end link
is enabled.

When an application/userspace queries for the mapped offload devices, the
logic will lookup the USB mixer status though the following path:

MultiMedia* <-> MM_DL* <-> USB Mixer*

The "USB Mixer" is a DAPM widget, and the q6routing entity will set the
DAPM connect status accordingly if the USB mixer is enabled.  If enabled,
the Q6USB backend link can fetch the PCM device number from the FE DAI
link (Multimedia*).  With respects to the card number, that is
straightforward, as the ASoC components have direct references to the ASoC
platform sound card.

An example output can be shown below:

Number of controls: 9
name                                    value
Capture Channel Map                     0, 0 (range 0->36)
Playback Channel Map                    0, 0 (range 0->36)
Headset Capture Switch                  On
Headset Capture Volume                  1 (range 0->4)
Sidetone Playback Switch                On
Sidetone Playback Volume                4096 (range 0->8192)
Headset Playback Switch                 On
Headset Playback Volume                 20, 20 (range 0->24)
USB Offload Playback Route PCM#0        0, 1 (range -1->255)

The "USB Offload Playback Route PCM#*" kcontrol will signify the
corresponding card and pcm device it is offload to. (card#0 pcm - device#1)
If the USB SND device supports multiple audio interfaces, then it will
contain several PCM streams, hence in those situations, it is expected
that there will be multiple playback route kcontrols created.

Signed-off-by: Wesley Cheng <quic_wcheng@quicinc.com>
---
 sound/soc/qcom/qdsp6/q6usb.c | 98 ++++++++++++++++++++++++++++++++++++
 1 file changed, 98 insertions(+)

diff --git a/sound/soc/qcom/qdsp6/q6usb.c b/sound/soc/qcom/qdsp6/q6usb.c
index d3698dcecca0..f77c8fe45d18 100644
--- a/sound/soc/qcom/qdsp6/q6usb.c
+++ b/sound/soc/qcom/qdsp6/q6usb.c
@@ -132,6 +132,103 @@ static int q6usb_audio_ports_of_xlate_dai_name(struct snd_soc_component *compone
 	return ret;
 }
 
+static int q6usb_get_pcm_id_from_widget(struct snd_soc_dapm_widget *w)
+{
+	struct snd_soc_pcm_runtime *rtd;
+	struct snd_soc_dai *dai;
+
+	for_each_card_rtds(w->dapm->card, rtd) {
+		dai = snd_soc_rtd_to_cpu(rtd, 0);
+		/*
+		 * Only look for playback widget. RTD number carries the assigned
+		 * PCM index.
+		 */
+		if (dai->stream[0].widget == w)
+			return rtd->id;
+	}
+
+	return -1;
+}
+
+static int q6usb_usb_mixer_enabled(struct snd_soc_dapm_widget *w)
+{
+	struct snd_soc_dapm_path *p;
+
+	/* Checks to ensure USB path is enabled/connected */
+	snd_soc_dapm_widget_for_each_sink_path(w, p)
+		if (!strcmp(p->sink->name, "USB Mixer") && p->connect)
+			return 1;
+
+	return 0;
+}
+
+static int q6usb_get_pcm_id(struct snd_soc_component *component)
+{
+	struct snd_soc_dapm_widget *w;
+	struct snd_soc_dapm_path *p;
+	int pidx;
+
+	/*
+	 * Traverse widgets to find corresponding FE widget.  The DAI links are
+	 * built like the following:
+	 *    MultiMedia* <-> MM_DL* <-> USB Mixer*
+	 */
+	for_each_card_widgets(component->card, w) {
+		if (!strncmp(w->name, "MultiMedia", 10)) {
+			/*
+			 * Look up all paths associated with the FE widget to see if
+			 * the USB BE is enabled.  The sink widget is responsible to
+			 * link with the USB mixers.
+			 */
+			snd_soc_dapm_widget_for_each_sink_path(w, p) {
+				if (q6usb_usb_mixer_enabled(p->sink)) {
+					pidx = q6usb_get_pcm_id_from_widget(w);
+					return pidx;
+				}
+			}
+		}
+	}
+
+	return -1;
+}
+
+static int q6usb_update_offload_route(struct snd_soc_component *component, int card,
+				      int pcm, int direction, enum snd_soc_usb_kctl path,
+				      long *route)
+{
+	struct q6usb_port_data *data = dev_get_drvdata(component->dev);
+	struct snd_soc_usb_device *sdev;
+	int ret = 0;
+	int idx = -1;
+
+	mutex_lock(&data->mutex);
+
+	if (list_empty(&data->devices) ||
+	    direction == SNDRV_PCM_STREAM_CAPTURE) {
+		ret = -ENODEV;
+		goto out;
+	}
+
+	sdev = list_last_entry(&data->devices, struct snd_soc_usb_device, list);
+
+	/*
+	 * Will always look for last PCM device discovered/probed as the
+	 * active offload index.
+	 */
+	if (card == sdev->card_idx &&
+	    pcm == sdev->ppcm_idx[sdev->num_playback - 1]) {
+		idx = path == SND_SOC_USB_KCTL_CARD_ROUTE ?
+				component->card->snd_card->number :
+				q6usb_get_pcm_id(component);
+	}
+
+out:
+	route[0] = idx;
+	mutex_unlock(&data->mutex);
+
+	return ret;
+}
+
 static int q6usb_alsa_connection_cb(struct snd_soc_usb *usb,
 				    struct snd_soc_usb_device *sdev, bool connected)
 {
@@ -202,6 +299,7 @@ static int q6usb_component_probe(struct snd_soc_component *component)
 		return -ENOMEM;
 
 	usb->connection_status_cb = q6usb_alsa_connection_cb;
+	usb->update_offload_route_info = q6usb_update_offload_route;
 
 	snd_soc_usb_add_port(usb);
 	data->usb = usb;

