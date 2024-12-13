Return-Path: <linux-input+bounces-8556-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id C9A269F1AA6
	for <lists+linux-input@lfdr.de>; Sat, 14 Dec 2024 00:58:22 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 3ED2D188DFF5
	for <lists+linux-input@lfdr.de>; Fri, 13 Dec 2024 23:58:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E7F641F668A;
	Fri, 13 Dec 2024 23:54:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="poAbWf/t"
X-Original-To: linux-input@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A9F6B1F4288;
	Fri, 13 Dec 2024 23:54:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734134080; cv=none; b=kmXo6ZhIwZmp1v1qxVpUeDs+55+Yu7Ddi7aGTOqwmZ2OdIdA95DripoeH95EPqnNrZHjhewha3V6sklLv6On73/a6WbLXtrwaVdUal2prsOc4ueTllrT1ttC4YXSLdNnhYNxvAjG6INusd2uV9qgMHif2IqTPLjDjTGS4sbR9nA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734134080; c=relaxed/simple;
	bh=FdcNret76wwuxs2K4Ssm9WRLfZvc8OI4p79sJ4/bjj0=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=XYCUFM1ecygMYBGU1SfnCDYXBJPPpfQsTPT05VOKFI5LrHDZU7RL3N6arlfaAA2I9uwQKjWAqXuR0czJM4LST2IeWXdbTHRdbyWZK4Aaq75Sh6aAxE7gOuiDMurIuInHCaU0sCR2diuZ0i+2ISXRS7I/VMtJJjntzaG9b8KiWww=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=poAbWf/t; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4BDBTqqx001422;
	Fri, 13 Dec 2024 23:54:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	5vkWtM2vRo+e/JMzMahFKMWez35ZrsbEXT1RxAlT0mM=; b=poAbWf/tvsPAYJCT
	4BfbSj/yYF+D7ryNXczPKMs/7xWDM25tV1Hh+UwvJiTy15Aex6jIct8aWogsXalj
	l12Mxw9ABLpngh+pZb9p2825E1qwZPmCLkdopfEhIkXmLJD9ZK15m3Vnt/yA7IjP
	apciIshIicbx8sXOy15fbZVXkBT1fWiCZSre9slFQgFxetCs172ynN6UTG4aRdCe
	kuMViqLM6cBqc+97HtQtO3dDTT7l/pBrSDE4fFzlccPtO1wjqBHSczxc2+lhojtT
	IYElaIqyhIUio9WjfTlg5Zh83jy/z7+m7WgliCV5RfsdTVmdGPg4Z0w/zLoZonJ2
	xpn4Vg==
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 43gm3s1kw3-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 13 Dec 2024 23:54:23 +0000 (GMT)
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com [10.47.209.197])
	by NALASPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 4BDNsNnP007270
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 13 Dec 2024 23:54:23 GMT
Received: from hu-wcheng-lv.qualcomm.com (10.49.16.6) by
 nalasex01b.na.qualcomm.com (10.47.209.197) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Fri, 13 Dec 2024 15:54:22 -0800
From: Wesley Cheng <quic_wcheng@quicinc.com>
To: <srinivas.kandagatla@linaro.org>, <mathias.nyman@intel.com>,
        <perex@perex.cz>, <conor+dt@kernel.org>, <dmitry.torokhov@gmail.com>,
        <corbet@lwn.net>, <broonie@kernel.org>, <lgirdwood@gmail.com>,
        <tiwai@suse.com>, <krzk+dt@kernel.org>,
        <pierre-louis.bossart@linux.dev>, <Thinh.Nguyen@synopsys.com>,
        <robh@kernel.org>, <gregkh@linuxfoundation.org>
CC: <linux-kernel@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-sound@vger.kernel.org>, <linux-input@vger.kernel.org>,
        <linux-usb@vger.kernel.org>, <linux-arm-msm@vger.kernel.org>,
        <linux-doc@vger.kernel.org>, Wesley Cheng <quic_wcheng@quicinc.com>
Subject: [PATCH v31 32/32] ALSA: usb-audio: qcom: Notify USB audio devices on USB offload probing
Date: Fri, 13 Dec 2024 15:54:03 -0800
Message-ID: <20241213235403.4109199-33-quic_wcheng@quicinc.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241213235403.4109199-1-quic_wcheng@quicinc.com>
References: <20241213235403.4109199-1-quic_wcheng@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: nalasex01a.na.qualcomm.com (10.47.209.196) To
 nalasex01b.na.qualcomm.com (10.47.209.197)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: gUunsEwxa5aeU-V8Qg6v5xBssH_yJDXR
X-Proofpoint-GUID: gUunsEwxa5aeU-V8Qg6v5xBssH_yJDXR
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 adultscore=0 impostorscore=0 phishscore=0 mlxscore=0 bulkscore=0
 spamscore=0 clxscore=1015 suspectscore=0 priorityscore=1501 malwarescore=0
 mlxlogscore=999 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2412130170

If the vendor USB offload class driver is not ready/initialized before USB
SND discovers attached devices, utilize snd_usb_rediscover_devices() to
find all currently attached devices, so that the ASoC entities are notified
on available USB audio devices.

Signed-off-by: Wesley Cheng <quic_wcheng@quicinc.com>
---
 sound/usb/qcom/qc_audio_offload.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/sound/usb/qcom/qc_audio_offload.c b/sound/usb/qcom/qc_audio_offload.c
index 285f05a5e16b..7dd7e51109df 100644
--- a/sound/usb/qcom/qc_audio_offload.c
+++ b/sound/usb/qcom/qc_audio_offload.c
@@ -1972,6 +1972,8 @@ static int __init qc_usb_audio_offload_init(void)
 	if (ret < 0)
 		goto release_qmi;
 
+	snd_usb_rediscover_devices();
+
 	return 0;
 
 release_qmi:

