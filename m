Return-Path: <linux-input+bounces-7344-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 54F35999776
	for <lists+linux-input@lfdr.de>; Fri, 11 Oct 2024 02:22:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 12D3D28551A
	for <lists+linux-input@lfdr.de>; Fri, 11 Oct 2024 00:22:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5DF501F8F00;
	Fri, 11 Oct 2024 00:07:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="OiJqUPzQ"
X-Original-To: linux-input@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE0601E4106;
	Fri, 11 Oct 2024 00:07:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728605272; cv=none; b=EijZlPKfoNqbT8rOslR90KtRR4h+YRkEwu2HQ5151799PbWrYGDdnm3cngtk4rTeHRRVzhlTU6LLt5w3HAEGBHdIFSiymxEa9aXdg2QqD3Kn29IBBVWwuGDHYOn/T5N8iG8CMXggfJ+jDtnqyAYEwI4jDLjDCMfQKwRXHVbCdlc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728605272; c=relaxed/simple;
	bh=2TQXo2YMYhg/mBJxKuqafaOEZef1g+SCKODQN1pqdkU=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=I9iYv3nqXVUEVJ5vAj5TLIIuawCesqZr0kPl2Nn+LIQEQNffp8EJD+qLWkcndTjBEgw4cGI3xZdeAqgi4fE58g6EuJtzc8DK/m3E0gNDuJ511LrncQibrndvcsYTEXxvgSgT640ooc3AKNAuhlFX5GIEzeF1cA4R2hCMZTzVCi8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=OiJqUPzQ; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 49AEeILK006976;
	Fri, 11 Oct 2024 00:07:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	/ZM8SPXr7udKkYr/SDUmnoP1IOgbHf5SfkdSPWJ27XA=; b=OiJqUPzQ+iax4MhJ
	AH/v/M0ikxiH7Bmx1BoedAG8dpCCCQFQSsRj3mvcElH+DyxphOuQWRforVxSV1VO
	PpeZlo0/srppjTjuNQJHuJP5rhfBG6ebBs/ziSSb/0mO/Sb6KGT3MZbaIPIpPxmT
	lN1hG/my0TlqRsze5Y4rusxD3WbfsuP0PVCHG+WJt3Jilf22k4B/qnZPzgHpk2O1
	6G0tqAHIHPQCBtMSwf3F8Nb7xr9nonXe5kTSV+Zmgs8eLi3Zi2tuRGjwN8Z8P0eT
	Fzwaor2WSFuIcGzInt9Y6UPDV1o1sYUerbdng9eqIELHxafrtIKmc3HoOUW31x/j
	xVIAfQ==
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 426gw2h8ae-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 11 Oct 2024 00:07:15 +0000 (GMT)
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com [10.47.209.197])
	by NALASPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 49B07DLa016379
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 11 Oct 2024 00:07:13 GMT
Received: from hu-wcheng-lv.qualcomm.com (10.49.16.6) by
 nalasex01b.na.qualcomm.com (10.47.209.197) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Thu, 10 Oct 2024 17:07:13 -0700
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
	<quic_wcheng@quicinc.com>,
        Krzysztof Kozlowski
	<krzysztof.kozlowski@linaro.org>
Subject: [PATCH v28 20/33] ASoC: dt-bindings: qcom,q6dsp-lpass-ports: Add USB_RX port
Date: Thu, 10 Oct 2024 17:06:24 -0700
Message-ID: <20241011000650.2585600-40-quic_wcheng@quicinc.com>
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
X-Proofpoint-GUID: BsR_kfq3cD8zjvJ3Pt6ZycPGVowQEV4I
X-Proofpoint-ORIG-GUID: BsR_kfq3cD8zjvJ3Pt6ZycPGVowQEV4I
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 suspectscore=0
 mlxlogscore=957 bulkscore=0 malwarescore=0 lowpriorityscore=0
 impostorscore=0 adultscore=0 phishscore=0 priorityscore=1501 clxscore=1015
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2409260000 definitions=main-2410100159

Q6DSP supports handling of USB playback audio data if USB audio offloading
is enabled.  Add a new definition for the USB_RX AFE port, which is
referenced when the AFE port is started.

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Signed-off-by: Wesley Cheng <quic_wcheng@quicinc.com>
---
 include/dt-bindings/sound/qcom,q6dsp-lpass-ports.h | 1 +
 1 file changed, 1 insertion(+)

diff --git a/include/dt-bindings/sound/qcom,q6dsp-lpass-ports.h b/include/dt-bindings/sound/qcom,q6dsp-lpass-ports.h
index 39f203256c4f..6d1ce7f5da51 100644
--- a/include/dt-bindings/sound/qcom,q6dsp-lpass-ports.h
+++ b/include/dt-bindings/sound/qcom,q6dsp-lpass-ports.h
@@ -139,6 +139,7 @@
 #define DISPLAY_PORT_RX_5	133
 #define DISPLAY_PORT_RX_6	134
 #define DISPLAY_PORT_RX_7	135
+#define USB_RX			136
 
 #define LPASS_CLK_ID_PRI_MI2S_IBIT	1
 #define LPASS_CLK_ID_PRI_MI2S_EBIT	2

