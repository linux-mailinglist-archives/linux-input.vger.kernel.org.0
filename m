Return-Path: <linux-input+bounces-7338-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D00E999740
	for <lists+linux-input@lfdr.de>; Fri, 11 Oct 2024 02:19:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 4E92D1C22DB0
	for <lists+linux-input@lfdr.de>; Fri, 11 Oct 2024 00:19:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AF3DC1EBFE6;
	Fri, 11 Oct 2024 00:07:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="KoQ3YuUv"
X-Original-To: linux-input@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A52291D1F7A;
	Fri, 11 Oct 2024 00:07:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728605268; cv=none; b=aKpCKR8BNcugyq6RURCHOMGAve79jua1QRYKMw9TgqKG12sV07l9+P91ssMYCY6RYTGsyycrFjb2Ofaxf3QpyWlub07WaNARJHwvgGn9ws3oyNgFknpn6rt8/j2V+VknjHCSmTJB9rwgV4klzQX0M6PckcNmKN+PjcRa7lLTDCY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728605268; c=relaxed/simple;
	bh=FiFxYrrPO0f4AZFgLNMhwElfx+Sn2apeIdL47dNx34U=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=qlPYVkP+yG+Ujzp8oetBdjq8N27TtzhhemCtu/4po1gjlWYf7RTXp3vQqGmGc2y6Eze2nli8FwpcoWWHSKrtnwzS4xUBCwNc7Aun5kdRcSqaAbuKY00LA8VADVXgPOmf8A8BMU9sU+yfYFBzU1AidYq82yhjpta6xqusmzWkS3Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=KoQ3YuUv; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 49AJjQdx000324;
	Fri, 11 Oct 2024 00:07:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	4SJdymAG2H1VKUMjaN5IwJUm/vorM6te+0pqk5xcZUQ=; b=KoQ3YuUvKN67Sge3
	GR1FXPnvD/cWD6NpbbXBBL3Uyk2+Ff3ahTxpwksdY+uLB9XLhSieshtAZplmcGzF
	6Pegn0ImquOe3anmY5NKCgEfQKW7OxoTk4o7TlYsxGxrncAb4nDnAqrYmtjq5z19
	735jkzoZq5sZv7ZbyJUFoMkI3yDJyCa+A40gQYsDRxq4BZnwdvbWmfXAHzoTfDcl
	oXFGXb17PyH6M8qfqMHMeSGzugeaH9C6ZmIUIyfB4kxqHR78mND+h/8ATaOv9flf
	snJh5LE1C8Hy8c4T6Ib6O5oudB50IHfdLQIQDKutY7J4r7Awu2xMa/PBDDgGIMiy
	2VWNWQ==
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 426nc2gep7-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 11 Oct 2024 00:07:12 +0000 (GMT)
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com [10.47.209.197])
	by NALASPPMTA04.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 49B07Bft003392
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 11 Oct 2024 00:07:11 GMT
Received: from hu-wcheng-lv.qualcomm.com (10.49.16.6) by
 nalasex01b.na.qualcomm.com (10.47.209.197) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Thu, 10 Oct 2024 17:07:10 -0700
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
Subject: [PATCH v28 15/32] ASoC: usb: Add PCM format check API for USB backend
Date: Thu, 10 Oct 2024 17:06:15 -0700
Message-ID: <20241011000650.2585600-31-quic_wcheng@quicinc.com>
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
X-Proofpoint-ORIG-GUID: G5ZINUImSa5a2AqJ5W1DIaT70QFHB3M5
X-Proofpoint-GUID: G5ZINUImSa5a2AqJ5W1DIaT70QFHB3M5
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0 adultscore=0
 priorityscore=1501 bulkscore=0 mlxlogscore=999 lowpriorityscore=0
 malwarescore=0 clxscore=1015 suspectscore=0 impostorscore=0 mlxscore=0
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2409260000 definitions=main-2410100159

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

