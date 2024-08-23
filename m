Return-Path: <linux-input+bounces-5797-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 2039A95D71E
	for <lists+linux-input@lfdr.de>; Fri, 23 Aug 2024 22:09:40 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 984BB1F247AA
	for <lists+linux-input@lfdr.de>; Fri, 23 Aug 2024 20:09:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 517581A2C2D;
	Fri, 23 Aug 2024 20:02:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="JYM24jf+"
X-Original-To: linux-input@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE0C619AA56;
	Fri, 23 Aug 2024 20:02:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724443323; cv=none; b=aTgUyW6kZeDyg+E8UrCOv7vgjqhgaDWPu1EKDJfsZgVTN/6sdnmcuUV71iePpS6hngdzpWKpHlqImEZclH7Oubb7ioA6dcYdJmmyiV8pdnaSTvcfzZiJA+3IO4ttjkqWNGHF5xBtC4kle2N8941bRIxDlExHxpn2lfqxtYkLvfA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724443323; c=relaxed/simple;
	bh=zMmhNpjLh4rfZ/YFjo0xEXjg+PxQzCwuPXGdjxR+Fkg=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=gxRcHv0tVhQrJpeZX9+oduuCowxT0aZGvX9tGcg6tx6j6GsRX11egSOMdNJnJXoWCAeV0JPwuqHy0hFKU4zu1vT7lqaoIdZ9iz8R4kltEPF8KTkW3puFsv3eoo50pPMVYflK2pI/LkoHAut1r01glUAOZdSHIgTaDYzhezkJ6sc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=JYM24jf+; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 47NAm5Lo026184;
	Fri, 23 Aug 2024 20:01:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=1Nf3xEcEEV2fS0OlpWhRtiSC
	qmN62g6JSqKx/uhd1FA=; b=JYM24jf+o8vABVwuBxN4gbEGEdzvfXb3c7c6uBhc
	lKtez294lwi71fmjXhiH3aCKXVLIBR6KO9ffNEgf6NtRVYpCuQxGJtAL9Cj9F3sX
	4Ba3FjGO31k1nRPwwXyPblVIj4mxfYMLLm/zoYsJ/PBak3HjZxSyF1IVF4K3442C
	quBLYD3Hx3DoEOb+XMdQnUIw06emn56OErjJ+Gq34/7VO4bkjT0kf0+nrwgiwQ8i
	2cUX/NGd6kVoF/poCQpQYzuu/5HEjhQU8DNH5i+vFr2anVaguRdtA2fh5SiDjXrL
	SH4c9RS8xy+8O7AW6rp6BO674KgpWKckp7NbHWvgMx+mSg==
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 416s0619ku-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 23 Aug 2024 20:01:18 +0000 (GMT)
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com [10.47.209.197])
	by NALASPPMTA05.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 47NK1HUB001772
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 23 Aug 2024 20:01:17 GMT
Received: from hu-wcheng-lv.qualcomm.com (10.49.16.6) by
 nalasex01b.na.qualcomm.com (10.47.209.197) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Fri, 23 Aug 2024 13:01:16 -0700
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
Subject: [PATCH v25 13/33] ASoC: usb: Add PCM format check API for USB backend
Date: Fri, 23 Aug 2024 13:00:41 -0700
Message-ID: <20240823200101.26755-14-quic_wcheng@quicinc.com>
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
X-Proofpoint-GUID: 2GbYSoKGcNjmcpHC9N1ngHjLk5pyrX0S
X-Proofpoint-ORIG-GUID: 2GbYSoKGcNjmcpHC9N1ngHjLk5pyrX0S
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-08-23_16,2024-08-23_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0 adultscore=0
 suspectscore=0 malwarescore=0 mlxscore=0 spamscore=0 clxscore=1015
 mlxlogscore=999 lowpriorityscore=0 phishscore=0 priorityscore=1501
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2407110000 definitions=main-2408230147

Introduce a helper to check if a particular PCM format is supported by the
USB audio device connected.  If the USB audio device does not have an
audio profile which can support the requested format, then notify the USB
backend.

Signed-off-by: Wesley Cheng <quic_wcheng@quicinc.com>
---
 include/sound/soc-usb.h | 10 ++++++++++
 sound/soc/soc-usb.c     | 25 +++++++++++++++++++++++++
 2 files changed, 35 insertions(+)

diff --git a/include/sound/soc-usb.h b/include/sound/soc-usb.h
index a5a9dd69fcec..ef667b3672bf 100644
--- a/include/sound/soc-usb.h
+++ b/include/sound/soc-usb.h
@@ -45,6 +45,9 @@ struct snd_soc_usb {
 };
 
 #if IS_ENABLED(CONFIG_SND_SOC_USB)
+int snd_soc_usb_find_supported_format(int card_idx,
+				struct snd_pcm_hw_params *params, int direction);
+
 int snd_soc_usb_connect(struct device *usbdev, struct snd_soc_usb_device *sdev);
 int snd_soc_usb_disconnect(struct device *usbdev, struct snd_soc_usb_device *sdev);
 void *snd_soc_usb_find_priv_data(struct device *dev);
@@ -55,6 +58,13 @@ void snd_soc_usb_free_port(struct snd_soc_usb *usb);
 void snd_soc_usb_add_port(struct snd_soc_usb *usb);
 void snd_soc_usb_remove_port(struct snd_soc_usb *usb);
 #else
+static inline int snd_soc_usb_find_supported_format(int card_idx,
+					  struct snd_pcm_hw_params *params,
+					  int direction)
+{
+	return -EINVAL;
+}
+
 static inline int snd_soc_usb_connect(struct device *usbdev,
 					struct snd_soc_usb_device *sdev)
 {
diff --git a/sound/soc/soc-usb.c b/sound/soc/soc-usb.c
index 794e00857a7e..c5646daa7cda 100644
--- a/sound/soc/soc-usb.c
+++ b/sound/soc/soc-usb.c
@@ -74,6 +74,31 @@ void *snd_soc_usb_find_priv_data(struct device *dev)
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
+				struct snd_pcm_hw_params *params, int direction)
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

