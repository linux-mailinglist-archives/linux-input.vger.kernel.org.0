Return-Path: <linux-input+bounces-9308-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D92CA14605
	for <lists+linux-input@lfdr.de>; Fri, 17 Jan 2025 00:32:16 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 8C07C188C33E
	for <lists+linux-input@lfdr.de>; Thu, 16 Jan 2025 23:32:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3A8561F55E3;
	Thu, 16 Jan 2025 23:29:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="BzX0dpKo"
X-Original-To: linux-input@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD252246A27;
	Thu, 16 Jan 2025 23:29:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737070148; cv=none; b=XCir86st6alK8seodaHDX00bjt1e/+lPqg8D3bLME/8oA5GoTg8LXM3vqjclLJ/7NjtI6jmPw56zn53MHBnFxJ+IlUJAp2VuDj8m+vBO7j2zBlyg1G7Jd1GwqbiAHFz4t6mA1liXxklZ0DdId+Dsw1tSbG38QUQw3nX7nhzl93w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737070148; c=relaxed/simple;
	bh=X/Bvl1S4+JNrZMbRaJr50aupT5ChpkpNPUFwxAxdL+A=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=ETwBz+PlU7S86JgHcnrh86iRTm8wTQGc8XAfgvo9XyOWMfMnw5+zFmsgG1YX7xVPj44dSZgx4odsBHNtUNSxe9EE2k73kqTjgxJVZR+aspqXrXiMmaqLGWzEB/68aHAStnwzQQmyoT0uQNRLHGzXcGcAmWDQsn+/RZN7n9OKSns=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=BzX0dpKo; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 50GN7gEG011119;
	Thu, 16 Jan 2025 23:28:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	xByViXVdmWC7x1UA5M9loILdhYftVOahYhTDpfeOINY=; b=BzX0dpKoiixuCRA9
	FQ8KcvVzLrnCKTEETDAnDBqX4wZqd1OntvTcloJBlGuD84e8bKJwtLG5CFiO7lOQ
	0xeo6sHa+qljS34k/hYCGdu7W4bDmBQOuKP9LvmFE8MlFeSavrSSmg137GpBUQ+H
	jECwbm7PniJ3L3J0J0FL5gfN8JBUSH7nqN8AWkTvRHfDqlu1695udNwtIP5sxWvj
	IrSf4dceIDuA3v4wHGkIY9AzNiu66qx7jHSdJm/UF4H7fj55sAD0xDfqtfKzKBl6
	rbLapsiyKJihHwsssHoI66o8orBRmEQeayUTo4pAls84gUHg9fb9EXJ53p89EVwR
	fkjfQQ==
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 447bgw810t-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 16 Jan 2025 23:28:46 +0000 (GMT)
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com [10.47.209.197])
	by NALASPPMTA04.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 50GNSjdX019290
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 16 Jan 2025 23:28:45 GMT
Received: from hu-wcheng-lv.qualcomm.com (10.49.16.6) by
 nalasex01b.na.qualcomm.com (10.47.209.197) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Thu, 16 Jan 2025 15:28:45 -0800
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
Subject: [PATCH v33 15/31] ASoC: usb: Add PCM format check API for USB backend
Date: Thu, 16 Jan 2025 15:28:08 -0800
Message-ID: <20250116232824.3748438-16-quic_wcheng@quicinc.com>
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
X-Proofpoint-GUID: RIuazPzl8vqF2GlMbzsBZNF55UTFPmbT
X-Proofpoint-ORIG-GUID: RIuazPzl8vqF2GlMbzsBZNF55UTFPmbT
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-01-16_10,2025-01-16_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 adultscore=0 bulkscore=0 mlxscore=0 impostorscore=0 clxscore=1015
 lowpriorityscore=0 phishscore=0 mlxlogscore=999 malwarescore=0
 suspectscore=0 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2501160174

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
index bd4c5632bb62..b36fdf4d0853 100644
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
index 3b8e47e3f469..8f7f19c55681 100644
--- a/sound/soc/soc-usb.c
+++ b/sound/soc/soc-usb.c
@@ -71,6 +71,32 @@ void *snd_soc_usb_find_priv_data(struct device *usbdev)
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
  * snd_soc_usb_allocate_port() - allocate a SoC USB port for offloading support
  * @component: USB DPCM backend DAI component

