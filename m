Return-Path: <linux-input+bounces-5794-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id B719D95D6EE
	for <lists+linux-input@lfdr.de>; Fri, 23 Aug 2024 22:07:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id DBEBC1C217C9
	for <lists+linux-input@lfdr.de>; Fri, 23 Aug 2024 20:07:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AFA2B19EED8;
	Fri, 23 Aug 2024 20:01:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="K0H7oZVw"
X-Original-To: linux-input@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F1708199242;
	Fri, 23 Aug 2024 20:01:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724443319; cv=none; b=m8/pTNO4E/EeGUsaX6pVBZIAFfi9IalCu9MAb1Zl5h+plOew7qjUfjtyWOnt+CIPO5O8mjBlqkULcdPGbIrppd27BmwYq1Jb45Qq1WnCkwKxtOycMUcnsEpY/VJEJZe5XJXaduySmOwQ+W2+sJmxKfgZI/qbtVXjUV2KwG2XHpk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724443319; c=relaxed/simple;
	bh=n2DyRnNyc5mCGgF8JAzqXWKP1lkJwGtAb78WQ77UT9g=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=oalEdRlOtTtxiWiY4Ou4RLanlipNRtya54+Vzlhe+v4Uk+uf9/tGJJXsqtiLgPoj+r9mgWMgGxkGnLBS1ppfzqC0cNe9v8kkDhGm1OMIAOZu70BvlZLf6J9wTy8O0LssmF96rWOzn+/EH498Rmku9qbca2BGKoXdRjJOEWICeCw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=K0H7oZVw; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 47NDke1s013335;
	Fri, 23 Aug 2024 20:01:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=HFbP5V8SWNIUtD/aMRKOpLW1
	1MfNNQanuECvxzKxjXY=; b=K0H7oZVwEM/k7pgUcGQkJj1SctDO04sF9j9gcuUq
	/VZzvUULh9xw5gM0Djmbdnyot14gRB0jN8ahRZl1ivNfOTWj2S30GouRdb3wI2Xo
	LxFEbP4qMQRtFzcf2G2TIeJi2/gPhFFSxZtI4wehJ8W2zaCZKPcTDiwwAt49V6Tl
	q8v9ImgXaxf/nuNgoEFgmWdn3RtHkvoohGekJ8RpjHd4fhD5eG2dcSMGoE9Cv+5j
	AGcd4UIXmFZ/OIhV5WuookfPO6U90Kpj6briudPp4yn0bDNpU8z0ReZfIKLHp2Ws
	pBgrMLHagyBNKk1b91m/Zkwmd2/bgT1PmgKmLFaUGgOLlw==
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 416ukyguev-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 23 Aug 2024 20:01:20 +0000 (GMT)
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com [10.47.209.197])
	by NALASPPMTA05.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 47NK1KhT001791
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 23 Aug 2024 20:01:20 GMT
Received: from hu-wcheng-lv.qualcomm.com (10.49.16.6) by
 nalasex01b.na.qualcomm.com (10.47.209.197) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Fri, 23 Aug 2024 13:01:19 -0700
From: Wesley Cheng <quic_wcheng@quicinc.com>
To: <srinivas.kandagatla@linaro.org>, <mathias.nyman@intel.com>,
        <perex@perex.cz>, <conor+dt@kernel.org>, <dmitry.torokhov@gmail.com>,
        <corbet@lwn.net>, <broonie@kernel.org>, <lgirdwood@gmail.com>,
        <tiwai@suse.com>, <krzk+dt@kernel.org>, <Thinh.Nguyen@synopsys.com>,
        <bgoswami@quicinc.com>, <robh@kernel.org>,
        <gregkh@linuxfoundation.org>
CC: <linux-kernel@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-sound@vger.kernel.org>, <linux-usb@vger.kernel.org>,
        <linux-input@vger.kernel.org>, <linux-arm-msm@vger.kernel.org>,
        <linux-doc@vger.kernel.org>, <alsa-devel@alsa-project.org>,
        Wesley Cheng
	<quic_wcheng@quicinc.com>
Subject: [PATCH v25 23/33] ASoC: qcom: qdsp6: Fetch USB offload mapped card and PCM device
Date: Fri, 23 Aug 2024 13:00:51 -0700
Message-ID: <20240823200101.26755-24-quic_wcheng@quicinc.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20240823200101.26755-1-quic_wcheng@quicinc.com>
References: <20240823200101.26755-1-quic_wcheng@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain
X-ClientProxiedBy: nalasex01a.na.qualcomm.com (10.47.209.196) To
 nalasex01b.na.qualcomm.com (10.47.209.197)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: HJsWb9PRdnuf-OWcsKOqRpIihsen4dMs
X-Proofpoint-GUID: HJsWb9PRdnuf-OWcsKOqRpIihsen4dMs
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-08-23_16,2024-08-23_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015 spamscore=0
 lowpriorityscore=0 bulkscore=0 mlxlogscore=999 malwarescore=0
 suspectscore=0 mlxscore=0 impostorscore=0 priorityscore=1501 adultscore=0
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2407110000 definitions=main-2408230147

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
straightfoward, as the ASoC components have direct references to the ASoC
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
 sound/soc/qcom/qdsp6/q6usb.c | 105 +++++++++++++++++++++++++++++++++++
 1 file changed, 105 insertions(+)

diff --git a/sound/soc/qcom/qdsp6/q6usb.c b/sound/soc/qcom/qdsp6/q6usb.c
index 40d8255cf8a3..c440beb75ce0 100644
--- a/sound/soc/qcom/qdsp6/q6usb.c
+++ b/sound/soc/qcom/qdsp6/q6usb.c
@@ -130,6 +130,110 @@ static int q6usb_audio_ports_of_xlate_dai_name(struct snd_soc_component *compone
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
+			return rtd->num;
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
+
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
+				      int pcm, int direction, long *route)
+{
+	struct q6usb_port_data *data = dev_get_drvdata(component->dev);
+	struct snd_soc_usb_device *sdev;
+	int ret = 0;
+	int cidx = -1;
+	int pidx = -1;
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
+	if ((card == sdev->card_idx) &&
+		(pcm == sdev->ppcm_idx[sdev->num_playback - 1])) {
+		cidx = component->card->snd_card->number;
+		pidx = q6usb_get_pcm_id(component);
+	}
+
+	if (cidx < 0 || pidx < 0) {
+		cidx = -1;
+		pidx = -1;
+	}
+
+out:
+	route[0] = cidx;
+	route[1] = pidx;
+
+	mutex_unlock(&data->mutex);
+
+	return ret;
+}
+
 static int q6usb_alsa_connection_cb(struct snd_soc_usb *usb,
 			struct snd_soc_usb_device *sdev, bool connected)
 {
@@ -199,6 +303,7 @@ static int q6usb_component_probe(struct snd_soc_component *component)
 		return -ENOMEM;
 
 	usb->connection_status_cb = q6usb_alsa_connection_cb;
+	usb->update_offload_route_info = q6usb_update_offload_route;
 
 	snd_soc_usb_add_port(usb);
 	data->usb = usb;

