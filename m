Return-Path: <linux-input+bounces-7310-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A77399968F
	for <lists+linux-input@lfdr.de>; Fri, 11 Oct 2024 02:13:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id E7B0FB2461A
	for <lists+linux-input@lfdr.de>; Fri, 11 Oct 2024 00:13:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5BAF219FA9D;
	Fri, 11 Oct 2024 00:07:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="gj+voW+r"
X-Original-To: linux-input@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 16AC619597F;
	Fri, 11 Oct 2024 00:07:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728605258; cv=none; b=iiGeav0Oy43aJbiAkco5WIkf44XC7Rk11xuyy040/PRPKd6ItXQjdgdAmpKJQxcL099Li2WX1PPkdCO7ooCYU1gHes3V9090RWbTfqiCsdw83GA10/LwxapMO54j2AkkGShUY/ih8eUPF3BfVY4yz/b6z7MleVmb5VNCC/usdr4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728605258; c=relaxed/simple;
	bh=29VWA0DxT8hK6fkCwQrxvdJBmifY1Kc1/JCR3kgrfD8=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=nBNjIAzSUssC3c1TDTOYMKQn7nwGPOZDSZWo2/l8dgy6+8TYQX2mxHVs46wPffvnz6oNXkF3Ef+SkTbm+VGTo7hCVKXWUrkaRrRkF0js2IwU5pkUjwLmFVOSqyQz5tCR5FlyfrfHEEMmJM4cw7EELiSbon6sY4Oglaq6diOXpSo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=gj+voW+r; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 49ABuv92009168;
	Fri, 11 Oct 2024 00:07:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	s/OTeliDf1Ah9/XP4Pomi7vIYaEPF2MJpZ2JrUJEjg8=; b=gj+voW+r08KwxkIC
	ZJFADwP7AwcCPpcgxGH0nYN9tIS3HomWl01OUw4Fjo/dfmXpUeFV0ZNc4ytJWw1+
	eyOFim/h3UGPz7LrjaQlFhurLkFQxhtB+yAX9HfOD6tHzq0F3Jpa/lgSFgzbSLnV
	7dps6LF8Tmimjlu1sQDL6LCttUFIdrXC3Ol5tP8QedVOK7a/kM/HuFSBsu99Y/X5
	cZjUVfFjiYELABvPNdb2Oe+8pUbpMALiHXGByuM8RfblL6fln++6m84x8yYI0QP5
	IRyNTeMRqgMZilenrfQj9G7aKv5CUPlCYX6V3ZKDYwXPOpZnEQlbw0D8YwXn0z22
	JC3WHg==
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 425tn150w1-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 11 Oct 2024 00:07:09 +0000 (GMT)
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com [10.47.209.197])
	by NALASPPMTA03.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 49B079SI009245
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 11 Oct 2024 00:07:09 GMT
Received: from hu-wcheng-lv.qualcomm.com (10.49.16.6) by
 nalasex01b.na.qualcomm.com (10.47.209.197) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Thu, 10 Oct 2024 17:07:08 -0700
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
Subject: [PATCH v28 12/33] ALSA: usb-audio: Check for support for requested audio format
Date: Thu, 10 Oct 2024 17:06:08 -0700
Message-ID: <20241011000650.2585600-24-quic_wcheng@quicinc.com>
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
X-Proofpoint-ORIG-GUID: Z1e5i6km9UarNA2b2XY_TIjkZW_bGGou
X-Proofpoint-GUID: Z1e5i6km9UarNA2b2XY_TIjkZW_bGGou
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 bulkscore=0
 suspectscore=0 priorityscore=1501 mlxlogscore=999 impostorscore=0
 spamscore=0 lowpriorityscore=0 phishscore=0 clxscore=1015 malwarescore=0
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2409260000 definitions=main-2410100159

Allow for checks on a specific USB audio device to see if a requested PCM
format is supported.  This is needed for support when playback is
initiated by the ASoC USB backend path.

Reviewed-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Signed-off-by: Wesley Cheng <quic_wcheng@quicinc.com>
---
 sound/usb/card.c | 32 ++++++++++++++++++++++++++++++++
 sound/usb/card.h |  3 +++
 2 files changed, 35 insertions(+)

diff --git a/sound/usb/card.c b/sound/usb/card.c
index c6d9d8d548b4..1f9dfcd8f336 100644
--- a/sound/usb/card.c
+++ b/sound/usb/card.c
@@ -119,6 +119,38 @@ static DEFINE_MUTEX(register_mutex);
 static struct snd_usb_audio *usb_chip[SNDRV_CARDS];
 static struct usb_driver usb_audio_driver;
 
+/*
+ * Checks to see if requested audio profile, i.e sample rate, # of
+ * channels, etc... is supported by the substream associated to the
+ * USB audio device.
+ */
+struct snd_usb_stream *
+snd_usb_find_suppported_substream(int card_idx, struct snd_pcm_hw_params *params,
+				  int direction)
+{
+	struct snd_usb_audio *chip;
+	struct snd_usb_substream *subs;
+	struct snd_usb_stream *as;
+
+	/*
+	 * Register mutex is held when populating and clearing usb_chip
+	 * array.
+	 */
+	guard(mutex)(&register_mutex);
+	chip = usb_chip[card_idx];
+
+	if (chip && enable[card_idx]) {
+		list_for_each_entry(as, &chip->pcm_list, list) {
+			subs = &as->substream[direction];
+			if (snd_usb_find_substream_format(subs, params))
+				return as;
+		}
+	}
+
+	return NULL;
+}
+EXPORT_SYMBOL_GPL(snd_usb_find_suppported_substream);
+
 /*
  * disconnect streams
  * called from usb_audio_disconnect()
diff --git a/sound/usb/card.h b/sound/usb/card.h
index 6ec95b2edf86..4f4f3f39b7fa 100644
--- a/sound/usb/card.h
+++ b/sound/usb/card.h
@@ -207,4 +207,7 @@ struct snd_usb_stream {
 	struct list_head list;
 };
 
+struct snd_usb_stream *
+snd_usb_find_suppported_substream(int card_idx, struct snd_pcm_hw_params *params,
+				  int direction);
 #endif /* __USBAUDIO_CARD_H */

