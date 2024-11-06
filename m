Return-Path: <linux-input+bounces-7929-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 172369BF72D
	for <lists+linux-input@lfdr.de>; Wed,  6 Nov 2024 20:41:31 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id CA5C1284483
	for <lists+linux-input@lfdr.de>; Wed,  6 Nov 2024 19:41:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BB636213EC0;
	Wed,  6 Nov 2024 19:34:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="UKMhTHaM"
X-Original-To: linux-input@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 62B3E212178;
	Wed,  6 Nov 2024 19:34:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730921699; cv=none; b=EvM9ohk6zmE0QmWXR7Ft5NUQ0r1ekJicoarXLAw5qooRGU4Eip7FY1YHqJ25S8YX9j1NCDZhInBwtEAGBGapF7pNRrll8IDISpmrhTLGtCdgQiTMbz0/UKXOeBpsS5ryKN7AAZ+BXiKlcYFo3lgWT1X+anmTLpAfdeAOf+H6nq0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730921699; c=relaxed/simple;
	bh=5KJ7+nlo+guZwES5cAPb8FiXJM3/tZyf/+ePj0k54QI=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=jCL3/uK1qgG+MWUf6FwpQkcKt8OxC3n31wd0ei45qo8O9/RJd+CyZMh8NPnte0A2CBxf+Hgidw9JrCNo6XZfHuUO2vlbWiXN7y5DREXRGMECkqMdqTrtZJ/auhdqG+x0kwcv0bco/5xR+mHeEAz0RBSwtrVpo/4qHzGk4SZ6WPQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=UKMhTHaM; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4A6G9Dmu028492;
	Wed, 6 Nov 2024 19:34:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	s1yCIbobXIwRRl19rlXryQgqvNgUhDI2Hp1deBw+rA8=; b=UKMhTHaMf13sBP20
	rxVSwmixdgiGEON+pi7WlyWpf7B9xr2aZPCGdJA/+aU60yZ1eip4D7ywTReJXBcf
	pjtv1MsxRn3h9Y4Ogui6st2nrC8iAlEfHskmd8VrKw1ONQ5Gd8STv8NisLTN/ko2
	vo6yWV9cfEMfeX/y3mkW6oG6G+MXWXmcrzjN9oJ2faPfDaYCV7ASPPu3AwN8KBRQ
	j0RUWfNl/WYiLv8QPnZAXxl1oK8wce+1Rwr128kezFvr5pnVWn67JxWlCsK+RWEL
	UhMUM/ZUcZuYw5EC7W4rDzgnDM5Pr7kHcYW9BgE7xE6fUkM846LxViHHl2vYtE5D
	W+ejog==
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 42r3c1a2f2-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 06 Nov 2024 19:34:33 +0000 (GMT)
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com [10.47.209.197])
	by NALASPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 4A6JYWCY008651
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 6 Nov 2024 19:34:32 GMT
Received: from hu-wcheng-lv.qualcomm.com (10.49.16.6) by
 nalasex01b.na.qualcomm.com (10.47.209.197) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Wed, 6 Nov 2024 11:34:31 -0800
From: Wesley Cheng <quic_wcheng@quicinc.com>
To: <srinivas.kandagatla@linaro.org>, <mathias.nyman@intel.com>,
        <perex@perex.cz>, <conor+dt@kernel.org>, <dmitry.torokhov@gmail.com>,
        <corbet@lwn.net>, <broonie@kernel.org>, <lgirdwood@gmail.com>,
        <krzk+dt@kernel.org>, <pierre-louis.bossart@linux.intel.com>,
        <Thinh.Nguyen@synopsys.com>, <tiwai@suse.com>, <robh@kernel.org>,
        <gregkh@linuxfoundation.org>
CC: <linux-kernel@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-sound@vger.kernel.org>, <linux-usb@vger.kernel.org>,
        <linux-input@vger.kernel.org>, <linux-arm-msm@vger.kernel.org>,
        <linux-doc@vger.kernel.org>, Wesley Cheng <quic_wcheng@quicinc.com>
Subject: [PATCH v30 11/30] ALSA: usb-audio: Prevent starting of audio stream if in use
Date: Wed, 6 Nov 2024 11:33:54 -0800
Message-ID: <20241106193413.1730413-12-quic_wcheng@quicinc.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241106193413.1730413-1-quic_wcheng@quicinc.com>
References: <20241106193413.1730413-1-quic_wcheng@quicinc.com>
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
X-Proofpoint-GUID: hoIoU7E59B_GwymijPJyAwXT51mc3lBx
X-Proofpoint-ORIG-GUID: hoIoU7E59B_GwymijPJyAwXT51mc3lBx
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 suspectscore=0
 lowpriorityscore=0 impostorscore=0 mlxlogscore=999 clxscore=1015
 spamscore=0 phishscore=0 priorityscore=1501 adultscore=0 malwarescore=0
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2409260000 definitions=main-2411060149

With USB audio offloading, an audio session is started from the ASoC
platform sound card and PCM devices.  Likewise, the USB SND path is still
readily available for use, in case the non-offload path is desired.  In
order to prevent the two entities from attempting to use the USB bus,
introduce a flag that determines when either paths are in use.

If a PCM device is already in use, the check will return an error to
userspace notifying that the stream is currently busy.  This ensures that
only one path is using the USB substream.

Reviewed-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Signed-off-by: Wesley Cheng <quic_wcheng@quicinc.com>
---
 sound/usb/card.h |  1 +
 sound/usb/pcm.c  | 29 ++++++++++++++++++++++++++---
 2 files changed, 27 insertions(+), 3 deletions(-)

diff --git a/sound/usb/card.h b/sound/usb/card.h
index b65163c60176..cdafc9e9cecd 100644
--- a/sound/usb/card.h
+++ b/sound/usb/card.h
@@ -165,6 +165,7 @@ struct snd_usb_substream {
 	unsigned int pkt_offset_adj;	/* Bytes to drop from beginning of packets (for non-compliant devices) */
 	unsigned int stream_offset_adj;	/* Bytes to drop from beginning of stream (for non-compliant devices) */
 
+	unsigned int opened:1;		/* pcm device opened */
 	unsigned int running: 1;	/* running status */
 	unsigned int period_elapsed_pending;	/* delay period handling */
 
diff --git a/sound/usb/pcm.c b/sound/usb/pcm.c
index 18467da6fd9e..b24ee38fad72 100644
--- a/sound/usb/pcm.c
+++ b/sound/usb/pcm.c
@@ -1241,8 +1241,17 @@ static int snd_usb_pcm_open(struct snd_pcm_substream *substream)
 	struct snd_usb_stream *as = snd_pcm_substream_chip(substream);
 	struct snd_pcm_runtime *runtime = substream->runtime;
 	struct snd_usb_substream *subs = &as->substream[direction];
+	struct snd_usb_audio *chip = subs->stream->chip;
 	int ret;
 
+	mutex_lock(&chip->mutex);
+	if (subs->opened) {
+		mutex_unlock(&chip->mutex);
+		return -EBUSY;
+	}
+	subs->opened = 1;
+	mutex_unlock(&chip->mutex);
+
 	runtime->hw = snd_usb_hardware;
 	/* need an explicit sync to catch applptr update in low-latency mode */
 	if (direction == SNDRV_PCM_STREAM_PLAYBACK &&
@@ -1259,13 +1268,23 @@ static int snd_usb_pcm_open(struct snd_pcm_substream *substream)
 
 	ret = setup_hw_info(runtime, subs);
 	if (ret < 0)
-		return ret;
+		goto err_open;
 	ret = snd_usb_autoresume(subs->stream->chip);
 	if (ret < 0)
-		return ret;
+		goto err_open;
 	ret = snd_media_stream_init(subs, as->pcm, direction);
 	if (ret < 0)
-		snd_usb_autosuspend(subs->stream->chip);
+		goto err_resume;
+
+	return 0;
+
+err_resume:
+	snd_usb_autosuspend(subs->stream->chip);
+err_open:
+	mutex_lock(&chip->mutex);
+	subs->opened = 0;
+	mutex_unlock(&chip->mutex);
+
 	return ret;
 }
 
@@ -1274,6 +1293,7 @@ static int snd_usb_pcm_close(struct snd_pcm_substream *substream)
 	int direction = substream->stream;
 	struct snd_usb_stream *as = snd_pcm_substream_chip(substream);
 	struct snd_usb_substream *subs = &as->substream[direction];
+	struct snd_usb_audio *chip = subs->stream->chip;
 	int ret;
 
 	snd_media_stop_pipeline(subs);
@@ -1287,6 +1307,9 @@ static int snd_usb_pcm_close(struct snd_pcm_substream *substream)
 
 	subs->pcm_substream = NULL;
 	snd_usb_autosuspend(subs->stream->chip);
+	mutex_lock(&chip->mutex);
+	subs->opened = 0;
+	mutex_unlock(&chip->mutex);
 
 	return 0;
 }

