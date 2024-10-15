Return-Path: <linux-input+bounces-7472-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A660299FA0A
	for <lists+linux-input@lfdr.de>; Tue, 15 Oct 2024 23:40:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 672F528446F
	for <lists+linux-input@lfdr.de>; Tue, 15 Oct 2024 21:40:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4027321D635;
	Tue, 15 Oct 2024 21:30:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="AUXoPUxu"
X-Original-To: linux-input@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E72A21B929;
	Tue, 15 Oct 2024 21:30:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729027817; cv=none; b=pTPbwHq818Ch6P+gOCG3kVgrF6rA10DftJbQUPyUdFwS3i9+I3kHy8GgA2s+V5M9CEp8uMekohFNbUWNwh5sWKnymPuAVOTrvL+0/N2FKzjKMTHFeFJp7F+mrc0xzQmcMfY8ryukiMpKW5164j2HfNbpflxMnZYi5rxIun2wgpU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729027817; c=relaxed/simple;
	bh=FiFxYrrPO0f4AZFgLNMhwElfx+Sn2apeIdL47dNx34U=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=te+bHBQ9fTxQ39VB3jow3han288BjMNX1N+dP0kbA3UEAkEIF8KDjPIA76lAO4jJ/B3y5B30zRd9Ut1dcOM6HJ4TlZnYfbG+eeEVtCypNUcZ7aomVVqY0sKum1EmOQ9RtZDl/70eN7izk1aKhE6z10koVRZd60zpLNCHM9wmuds=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=AUXoPUxu; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 49FF0Fjv021593;
	Tue, 15 Oct 2024 21:29:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	4SJdymAG2H1VKUMjaN5IwJUm/vorM6te+0pqk5xcZUQ=; b=AUXoPUxuJLrXD6gC
	0Soxm/PL+6BLiwDBHBaDonTW3tZs6i3af09tEJJeE6ZXFw6Ca9AsP1aa2zQ68oyV
	zwaNLAxV9+GELF7ymtN1jyh7rLyHzr2fYuzoc1axeqUTJjQm0tELu7Fv6Q7z6xSr
	G5DVjFfcSqvqupn4Pxjwf/Vk1eEiSjP2mG+cIzcmYkAzykdE3tYowBM26Spv1Aww
	zA6w0jZH6vycMuAlT4vNDSMWv9LLr60Oun9qLdXaJb9/cvTBCOw5DYTEiEP06/V6
	1sOslzK5OqdTtlnYMVZlHqnjosaFUWOqJB48RJX4RFEeedslpKOXjzYljrLcbVvr
	a9m5DQ==
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 429jrfah4b-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 15 Oct 2024 21:29:32 +0000 (GMT)
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com [10.47.209.197])
	by NALASPPMTA05.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 49FLTVHc026428
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
Subject: [PATCH v29 16/33] ASoC: usb: Add PCM format check API for USB backend
Date: Tue, 15 Oct 2024 14:28:58 -0700
Message-ID: <20241015212915.1206789-17-quic_wcheng@quicinc.com>
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
X-Proofpoint-GUID: Y7IiqsPLcIwRawGzLoE3nioZZqXv0wlc
X-Proofpoint-ORIG-GUID: Y7IiqsPLcIwRawGzLoE3nioZZqXv0wlc
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0 mlxscore=0
 spamscore=0 malwarescore=0 suspectscore=0 phishscore=0 impostorscore=0
 clxscore=1015 mlxlogscore=999 priorityscore=1501 adultscore=0
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2409260000 definitions=main-2410150143

Introduce a helper to check if a particular PCM format is supported by the
USB audio device connected.  If the USB audio device does not have an
audio profile which can support the requested format, then notify the USB
backend.

Reviewed-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Signed-off-by: Wesley Cheng <quic_wcheng@quicinc.com>
---
 include/sound/soc-usb.h | 11 +++++++++++
 sound/soc/soc-usb.c     | 26 ++++++++++++++++++++++++++
 2 files changed, 37 insertions(+)

diff --git a/include/sound/soc-usb.h b/include/sound/soc-usb.h
index 34240321bbca..db9ff0b4191d 100644
--- a/include/sound/soc-usb.h
+++ b/include/sound/soc-usb.h
@@ -48,6 +48,10 @@ struct snd_soc_usb {
 };
 
 #if IS_ENABLED(CONFIG_SND_SOC_USB)
+int snd_soc_usb_find_supported_format(int card_idx,
+				      struct snd_pcm_hw_params *params,
+				      int direction);
+
 int snd_soc_usb_connect(struct device *usbdev, struct snd_soc_usb_device *sdev);
 int snd_soc_usb_disconnect(struct device *usbdev, struct snd_soc_usb_device *sdev);
 void *snd_soc_usb_find_priv_data(struct device *usbdev);
@@ -58,6 +62,13 @@ void snd_soc_usb_free_port(struct snd_soc_usb *usb);
 void snd_soc_usb_add_port(struct snd_soc_usb *usb);
 void snd_soc_usb_remove_port(struct snd_soc_usb *usb);
 #else
+static inline int
+snd_soc_usb_find_supported_format(int card_idx, struct snd_pcm_hw_params *params,
+				  int direction)
+{
+	return -EINVAL;
+}
+
 static inline int snd_soc_usb_connect(struct device *usbdev,
 				      struct snd_soc_usb_device *sdev)
 {
diff --git a/sound/soc/soc-usb.c b/sound/soc/soc-usb.c
index bd2d68164206..c63033468e4a 100644
--- a/sound/soc/soc-usb.c
+++ b/sound/soc/soc-usb.c
@@ -73,6 +73,32 @@ void *snd_soc_usb_find_priv_data(struct device *usbdev)
 }
 EXPORT_SYMBOL_GPL(snd_soc_usb_find_priv_data);
 
+/**
+ * snd_soc_usb_find_supported_format() - Check if audio format is supported
+ * @card_idx: USB sound chip array index
+ * @params: PCM parameters
+ * @direction: capture or playback
+ *
+ * Ensure that a requested audio profile from the ASoC side is able to be
+ * supported by the USB device.
+ *
+ * Return 0 on success, negative on error.
+ *
+ */
+int snd_soc_usb_find_supported_format(int card_idx,
+				      struct snd_pcm_hw_params *params,
+				      int direction)
+{
+	struct snd_usb_stream *as;
+
+	as = snd_usb_find_suppported_substream(card_idx, params, direction);
+	if (!as)
+		return -EOPNOTSUPP;
+
+	return 0;
+}
+EXPORT_SYMBOL_GPL(snd_soc_usb_find_supported_format);
+
 /**
  * snd_soc_usb_allocate_port() - allocate a SOC USB port for offloading support
  * @component: USB DPCM backend DAI component

