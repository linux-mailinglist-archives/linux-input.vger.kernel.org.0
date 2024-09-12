Return-Path: <linux-input+bounces-6451-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C2479771A3
	for <lists+linux-input@lfdr.de>; Thu, 12 Sep 2024 21:41:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id ACD581F25005
	for <lists+linux-input@lfdr.de>; Thu, 12 Sep 2024 19:41:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4E6F61C2DC2;
	Thu, 12 Sep 2024 19:40:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="Irs78Fc0"
X-Original-To: linux-input@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0306B1BFE02;
	Thu, 12 Sep 2024 19:40:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726170019; cv=none; b=SDDWTBJEX3SjsWls3Fh/92lofk7QaIVFvaxDN8YwrrgZDkzpqDO9AD5Jd3xjFnYsvwBXvPsILc4trSnyqNHkXf6anhTjV4MwK7/uVkyySs6VOUj1szk2doTQz+pQqdSqq9a8t8oEf5sAC5p7p0tPycClLfunU9SZ+XA5u6Ml9Qw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726170019; c=relaxed/simple;
	bh=2TQXo2YMYhg/mBJxKuqafaOEZef1g+SCKODQN1pqdkU=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=T2s1EyEVjqoVZRGBLusPTXrsJoWNxKv18FwvsXa+XmadtF/bCay0dSuaJ+Ij1IAUc1UsaGr3s8di4KJFas+Ws0JGrJPAdd2FgjjdtAWMmg+vYv5tVx/a0XRC2NtkPbrDRfWSIOmzgddkyU3s/CuLYpzJEJySdodalvvgqF+lvaw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=Irs78Fc0; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 48CHscW8004485;
	Thu, 12 Sep 2024 19:39:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	/ZM8SPXr7udKkYr/SDUmnoP1IOgbHf5SfkdSPWJ27XA=; b=Irs78Fc0Fro9ql7e
	7mjT+uDWybQpd8g55WQr69miYXgZTfDZtq2WUZDnb+xOZeDwIR9i9Ligoy8/3fS6
	IJ9RvIPXuaz6dn5pIQUDDmTTFsDA/wINxo7lNXdYJ6V6fhvaNhAZwpJMiz238JOQ
	BM3dHRi3pzNd03sH6Su3QIypbbrouR5QeHd3AkYDDbLFIdfGuMPbpxMMc18BuNKb
	AvJQ/A0bLJ742SMMLQ9AlP2f1zoMxtpU2Pp8lR0eaTgWqp7zf57WkyEqyJDy9PiY
	n+9AhmMt+d5qhSlMT7B4KYQ8K7qPR596KsEsKDkciE+XNwGUOq1Xt2+qagIP3RXC
	/EwZQw==
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 41j6gn2rt5-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 12 Sep 2024 19:39:53 +0000 (GMT)
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com [10.47.209.197])
	by NALASPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 48CJdqXo004705
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 12 Sep 2024 19:39:52 GMT
Received: from hu-wcheng-lv.qualcomm.com (10.49.16.6) by
 nalasex01b.na.qualcomm.com (10.47.209.197) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Thu, 12 Sep 2024 12:39:51 -0700
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
Subject: [PATCH v27 19/32] ASoC: dt-bindings: qcom,q6dsp-lpass-ports: Add USB_RX port
Date: Thu, 12 Sep 2024 12:39:22 -0700
Message-ID: <20240912193935.1916426-20-quic_wcheng@quicinc.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240912193935.1916426-1-quic_wcheng@quicinc.com>
References: <20240912193935.1916426-1-quic_wcheng@quicinc.com>
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
X-Proofpoint-ORIG-GUID: FGlbDRaxLyjCk8vVff6AQHoP1jkNQMiu
X-Proofpoint-GUID: FGlbDRaxLyjCk8vVff6AQHoP1jkNQMiu
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 spamscore=0 adultscore=0
 clxscore=1015 phishscore=0 mlxlogscore=964 lowpriorityscore=0
 suspectscore=0 mlxscore=0 priorityscore=1501 malwarescore=0 bulkscore=0
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2408220000 definitions=main-2409120144

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

