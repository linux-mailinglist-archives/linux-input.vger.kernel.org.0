Return-Path: <linux-input+bounces-5982-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E589964FCA
	for <lists+linux-input@lfdr.de>; Thu, 29 Aug 2024 21:47:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C0203283BE4
	for <lists+linux-input@lfdr.de>; Thu, 29 Aug 2024 19:47:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 16F021C32F2;
	Thu, 29 Aug 2024 19:41:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="mibXr3wl"
X-Original-To: linux-input@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 843A31BFE15;
	Thu, 29 Aug 2024 19:41:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724960516; cv=none; b=jumwTAWWqoNQqW7SE6R1eFRaC8Ntz8eOdsZuc0goH34TsjOsYHtqXITgx49tWXUi08fFQDRMFUbDsiAmV5ODliGJPswlp52pleKezq3korlcq4wn6ITclXhfFgjzxpIOXaQfLKFfBQJIoLv8h1syUVAg8rGp0RguNvvXF6FFphQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724960516; c=relaxed/simple;
	bh=FZjE2gUloHj8njn0JrR2fz/gzGmteYXNo6yXqq1j27A=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=YqYYSTO3KM6y2MZzYf10mhZLLVaB1TFvtylkWeNyKV7DPhpEweXI0vBNka0Yt5epkJBOKCYkcKTcIRVO1gfSUdmwzmFpxOetEAlLJxynrLAt66hgRoNs+ZQlps3X5OBXKyAnZWim9utRLAzm3vcwNBE11RBln5xf2oD/U5dBVBg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=mibXr3wl; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 47TGmBF7020027;
	Thu, 29 Aug 2024 19:41:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	5POo0tVmuOvEWbn1//CBCuXj/ZY2Vx2fzujV61SjVI0=; b=mibXr3wl2GAjctkR
	X+SyndIu/Nf2KdTgXVpjG+SAP1bseiXf4Ox67asP9ZyLAzx7kukuxJu7HhwA/MKP
	GC/14hFvP8W2i06uC3PWqgLX0WhGQFKx/cK9wB6OnuaT5S3DPqlBtxpkG/6pmgSk
	nVEBiJEEA1AQNtFHu2hKlVzSzscDTaBl9WC0s6J8vogdX7C1+FrH//0elk/W7/om
	0IdgQbrMTXuieu5fKgvh00cVSMpnjWpLu47aDU4/Z5vZFfRO1z/4bb2fabP7aok6
	gu6MhRGjABqkmg13RJghP6toDreVxI/nCsFxkSB8gGwC4teLYkRVVdVMp9gvcXwR
	pLKNDQ==
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 419putph50-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 29 Aug 2024 19:41:32 +0000 (GMT)
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com [10.47.209.197])
	by NALASPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 47TJfViQ019334
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 29 Aug 2024 19:41:31 GMT
Received: from hu-wcheng-lv.qualcomm.com (10.49.16.6) by
 nalasex01b.na.qualcomm.com (10.47.209.197) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Thu, 29 Aug 2024 12:41:31 -0700
From: Wesley Cheng <quic_wcheng@quicinc.com>
To: <srinivas.kandagatla@linaro.org>, <mathias.nyman@intel.com>,
        <perex@perex.cz>, <conor+dt@kernel.org>, <dmitry.torokhov@gmail.com>,
        <corbet@lwn.net>, <broonie@kernel.org>, <lgirdwood@gmail.com>,
        <tiwai@suse.com>, <krzk+dt@kernel.org>, <Thinh.Nguyen@synopsys.com>,
        <bgoswami@quicinc.com>, <robh@kernel.org>,
        <gregkh@linuxfoundation.org>
CC: <linux-kernel@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-sound@vger.kernel.org>, <linux-input@vger.kernel.org>,
        <linux-usb@vger.kernel.org>, <linux-arm-msm@vger.kernel.org>,
        <linux-doc@vger.kernel.org>, <alsa-devel@alsa-project.org>,
        Wesley Cheng
	<quic_wcheng@quicinc.com>
Subject: [PATCH v26 25/33] ALSA: usb-audio: Save UAC sample size information
Date: Thu, 29 Aug 2024 12:40:57 -0700
Message-ID: <20240829194105.1504814-26-quic_wcheng@quicinc.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240829194105.1504814-1-quic_wcheng@quicinc.com>
References: <20240829194105.1504814-1-quic_wcheng@quicinc.com>
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
X-Proofpoint-GUID: 3yEKFe8GdOf9R_P35uPQHiu05qS2Tl9M
X-Proofpoint-ORIG-GUID: 3yEKFe8GdOf9R_P35uPQHiu05qS2Tl9M
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-08-29_06,2024-08-29_02,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015
 lowpriorityscore=0 mlxscore=0 phishscore=0 adultscore=0 priorityscore=1501
 impostorscore=0 malwarescore=0 suspectscore=0 spamscore=0 bulkscore=0
 mlxlogscore=999 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2407110000 definitions=main-2408290138

Within the UAC descriptor, there is information describing the size of a
sample (bSubframeSize/bSubslotSize) and the number of relevant bits
(bBitResolution).  Currently, fmt_bits carries only the bit resolution,
however, some offloading entities may also require the overall size of the
sample.  Save this information in a separate parameter, as depending on the
UAC format type, the sample size can not easily be decoded from other
existing parameters.

Signed-off-by: Wesley Cheng <quic_wcheng@quicinc.com>
---
 sound/usb/card.h   | 1 +
 sound/usb/format.c | 1 +
 2 files changed, 2 insertions(+)

diff --git a/sound/usb/card.h b/sound/usb/card.h
index 23d9e6fc69e7..15cda1730076 100644
--- a/sound/usb/card.h
+++ b/sound/usb/card.h
@@ -15,6 +15,7 @@ struct audioformat {
 	unsigned int channels;		/* # channels */
 	unsigned int fmt_type;		/* USB audio format type (1-3) */
 	unsigned int fmt_bits;		/* number of significant bits */
+	unsigned int fmt_sz;		/* overall audio sub frame/slot size */
 	unsigned int frame_size;	/* samples per frame for non-audio */
 	unsigned char iface;		/* interface number */
 	unsigned char altsetting;	/* corresponding alternate setting */
diff --git a/sound/usb/format.c b/sound/usb/format.c
index 3b45d0ee7693..5fde543536a8 100644
--- a/sound/usb/format.c
+++ b/sound/usb/format.c
@@ -80,6 +80,7 @@ static u64 parse_audio_format_i_type(struct snd_usb_audio *chip,
 	}
 
 	fp->fmt_bits = sample_width;
+	fp->fmt_sz = sample_bytes;
 
 	if ((pcm_formats == 0) &&
 	    (format == 0 || format == (1 << UAC_FORMAT_TYPE_I_UNDEFINED))) {

