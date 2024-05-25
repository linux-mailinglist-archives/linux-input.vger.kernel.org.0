Return-Path: <linux-input+bounces-3831-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D3D78CEFBE
	for <lists+linux-input@lfdr.de>; Sat, 25 May 2024 17:18:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 0363D2815E0
	for <lists+linux-input@lfdr.de>; Sat, 25 May 2024 15:18:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CF66876919;
	Sat, 25 May 2024 15:18:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="bljyZmQm"
X-Original-To: linux-input@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D96051429E;
	Sat, 25 May 2024 15:18:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716650299; cv=none; b=tTZp3QCgmxoNb7K1pD7Y6+mmx2H8aECtI2LwWuX9zyYZRCWLiiSgLSL8HhvG64tts7tIfW9PACW8k6rt+EDOBNPgUwdX6TqEmjPP5tFebLzSqGNS9A9FB+yFcPfxnXGwTvGNaP4w3cs1N/1bToiOdprEILudYjSisRIsToojW/k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716650299; c=relaxed/simple;
	bh=uYyjQpwuAsqST4PdCfnRny9D/oqZIPJqCP6LKqZfpu4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:References:
	 In-Reply-To:To:CC; b=u7g4eVoN8vt4VkQRAXQ3qa2J49E2rUmt+C7P6E0XIHcJhwQLlu1LZrNYGRrenbV0VZCof759ZZ+1cnDKglw/lti3Fhex6mJIuTMU5WlHhketqsL184odK7xuX8NEDDi4bmdpFcIsiNt3BF0Kh7PCXM0qrh5PbpR2GxztESqcIIk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=bljyZmQm; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 44PEn2aS029758;
	Sat, 25 May 2024 15:18:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	kWxwrHzrNmHRu9CjzEFq5irGOrLeDI9R9PPHAPyvdn8=; b=bljyZmQmwEDrFxkX
	cNxxIn4KrxFLw7A9ekGX6qjurdTX/zQ8UTXl1KRHsGPbp+m9adyI2gnu9lC4lfOT
	69XoXgWaZdoccM6Sj5/AYKKRAZU1aqXgpdubvbtkySx6bjtwYnGWrrq/Py0Ws1o0
	OW8od68p9DVtF+R/9/rkCO8lZXC7cejBd6NlwCGselQsEQYdfeBLsz9Geics7dP1
	Ttxs3K4oTZdO5WVqgWp4tylSZVrkFVLT7vz3OUymoxEJgkDVw3Ya5A5MccnNWisw
	pmD8DFIxEwmYVLi0SvYsWQyoXIXAkikZMpmT4HWBE/1+LANMFMJ09/QqXPEZo6tR
	tZekjw==
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3yba0x0gbj-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sat, 25 May 2024 15:18:01 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA03.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 44PFHxUj029782
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sat, 25 May 2024 15:17:59 GMT
Received: from [169.254.0.1] (10.49.16.6) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Sat, 25 May
 2024 08:17:59 -0700
From: Jeff Johnson <quic_jjohnson@quicinc.com>
Date: Sat, 25 May 2024 08:17:42 -0700
Subject: [PATCH 2/2] HID: intel-ish-hid: add MODULE_DESCRIPTION()
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20240525-kd-ishtp_wait_resume-v1-2-fec87a6f7916@quicinc.com>
References: <20240525-kd-ishtp_wait_resume-v1-0-fec87a6f7916@quicinc.com>
In-Reply-To: <20240525-kd-ishtp_wait_resume-v1-0-fec87a6f7916@quicinc.com>
To: Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>,
        Jiri Kosina
	<jikos@kernel.org>,
        Benjamin Tissoires <bentiss@kernel.org>
CC: <linux-input@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <kernel-janitors@vger.kernel.org>,
        Jeff Johnson <quic_jjohnson@quicinc.com>
X-Mailer: b4 0.13.0
X-ClientProxiedBy: nalasex01c.na.qualcomm.com (10.47.97.35) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: PbvArpA2flSyrYOs6cWvwsUH3IXsng7A
X-Proofpoint-ORIG-GUID: PbvArpA2flSyrYOs6cWvwsUH3IXsng7A
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.650,FMLib:17.12.28.16
 definitions=2024-05-25_09,2024-05-24_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 spamscore=0 impostorscore=0
 mlxlogscore=904 priorityscore=1501 clxscore=1015 bulkscore=0 phishscore=0
 malwarescore=0 mlxscore=0 adultscore=0 suspectscore=0 lowpriorityscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2405170001
 definitions=main-2405250124

Fix the 'make W=1' warning:
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/hid/intel-ish-hid/intel-ishtp.o

Signed-off-by: Jeff Johnson <quic_jjohnson@quicinc.com>
---
 drivers/hid/intel-ish-hid/ishtp/bus.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/hid/intel-ish-hid/ishtp/bus.c b/drivers/hid/intel-ish-hid/ishtp/bus.c
index f3042c4b8710..cc76b295b632 100644
--- a/drivers/hid/intel-ish-hid/ishtp/bus.c
+++ b/drivers/hid/intel-ish-hid/ishtp/bus.c
@@ -932,4 +932,5 @@ static void __exit ishtp_bus_unregister(void)
 module_init(ishtp_bus_register);
 module_exit(ishtp_bus_unregister);
 
+MODULE_DESCRIPTION("ISHTP bus driver");
 MODULE_LICENSE("GPL");

-- 
2.42.0


