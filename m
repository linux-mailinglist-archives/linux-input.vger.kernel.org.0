Return-Path: <linux-input+bounces-9453-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id CCD2BA186EF
	for <lists+linux-input@lfdr.de>; Tue, 21 Jan 2025 22:11:51 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 405053A2E6E
	for <lists+linux-input@lfdr.de>; Tue, 21 Jan 2025 21:10:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D9112204694;
	Tue, 21 Jan 2025 21:05:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="GKIS23zp"
X-Original-To: linux-input@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B89CD202F68;
	Tue, 21 Jan 2025 21:05:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737493555; cv=none; b=BIiHhSsjTCLxe2UiB6wZLxer2I0AilxhzH26kC2jDnQfXV36JQSeWTke2m/HxBHYD8hE9QaoSy0KFQToa+rQJVl7uTd1AvjI0zcGHJ+IwrV0PmpV3dfA5MftU1Xi4MBGa5j+2pgR8tNChnZOVkgdrgV6DJtDauppO3gEv4wrzBU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737493555; c=relaxed/simple;
	bh=lH6pajAyODmY/7seq1vw42FSufEXp3D1uilBoZTCkh8=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=ZVKxdhIgrGerUy2J4222YV8kLXBw09rI/0M5vP2vHG6noyFR/XxyzJVa2ZewvvnD1E9prKmCYwsHRGFq3G1HiwaCyuygttUSU+wrAGKLszJB1fdfhdPQSDYAhoIiLW5C3oW+FuqxhUSykwPsAPrKVR2opTLksFA+JTNQO5lohjY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=GKIS23zp; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 50LERX7V010170;
	Tue, 21 Jan 2025 21:05:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ki29lRSXvVePRr3/SBVRt9DzNF8VTubZk2D+F/mX5Zk=; b=GKIS23zp28nsHLIj
	9EycQn//5qf4/wK8YNxz90JBoKZB4P12GdriRltsdxdpUa+1DOj3s+t0nDAOrLDS
	VrfILNk9sEZofPaQmUzWf5me7/+h4oUoyF0p4idjqQmZzybL9xc3myac+oBPFr5z
	/4CAdBnvJgCCJpeqIvprruAL6dYJmBi9P1W/Pk1cce3cyYCoFgIuM8Km6ym/a4eM
	OmkfrmUzQKSP4Zpv2tqtR/Li4o/qqXqarzbn8B4f/VzCTuN9MT/kRHLiPw1Q++h0
	rgrBcOmnamtm9NKC+yvmIpBYeqw1xiuoG/cKqXGcnmA6bRtKCaoN/RPxNecwAJm8
	RyASDg==
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 44adc48xyf-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 21 Jan 2025 21:05:36 +0000 (GMT)
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com [10.47.209.197])
	by NALASPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 50LL5ZZZ029481
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 21 Jan 2025 21:05:35 GMT
Received: from hu-wcheng-lv.qualcomm.com (10.49.16.6) by
 nalasex01b.na.qualcomm.com (10.47.209.197) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Tue, 21 Jan 2025 13:05:35 -0800
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
Subject: [PATCH v34 23/31] ASoC: qcom: qdsp6: q6afe: Increase APR timeout
Date: Tue, 21 Jan 2025 13:05:10 -0800
Message-ID: <20250121210518.2436771-24-quic_wcheng@quicinc.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250121210518.2436771-1-quic_wcheng@quicinc.com>
References: <20250121210518.2436771-1-quic_wcheng@quicinc.com>
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
X-Proofpoint-GUID: 4jruUR4CFG2HCQSL_mRj7aYEao8boT1S
X-Proofpoint-ORIG-GUID: 4jruUR4CFG2HCQSL_mRj7aYEao8boT1S
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-01-21_08,2025-01-21_03,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0
 priorityscore=1501 lowpriorityscore=0 spamscore=0 impostorscore=0
 suspectscore=0 adultscore=0 mlxscore=0 phishscore=0 malwarescore=0
 clxscore=1015 mlxlogscore=944 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.19.0-2411120000 definitions=main-2501210167

For USB offloading situations, the AFE port start command will result in a
QMI handshake between the Q6DSP and the main processor.  Depending on if
the USB bus is suspended, this routine would require more time to complete,
as resuming the USB bus has some overhead associated with it.  Increase the
timeout to 3s to allow for sufficient time for the USB QMI stream enable
handshake to complete.

Reviewed-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Reviewed-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Signed-off-by: Wesley Cheng <quic_wcheng@quicinc.com>
---
 sound/soc/qcom/qdsp6/q6afe.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/qcom/qdsp6/q6afe.c b/sound/soc/qcom/qdsp6/q6afe.c
index 3ee6ff8a6bc3..b5b2af2ce50c 100644
--- a/sound/soc/qcom/qdsp6/q6afe.c
+++ b/sound/soc/qcom/qdsp6/q6afe.c
@@ -366,7 +366,7 @@
 #define AFE_API_VERSION_SLOT_MAPPING_CONFIG	1
 #define AFE_API_VERSION_CODEC_DMA_CONFIG	1
 
-#define TIMEOUT_MS 1000
+#define TIMEOUT_MS 3000
 #define AFE_CMD_RESP_AVAIL	0
 #define AFE_CMD_RESP_NONE	1
 #define AFE_CLK_TOKEN		1024

