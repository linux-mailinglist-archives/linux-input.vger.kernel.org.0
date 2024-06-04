Return-Path: <linux-input+bounces-4083-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 066B38FB780
	for <lists+linux-input@lfdr.de>; Tue,  4 Jun 2024 17:34:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 370831C22C6F
	for <lists+linux-input@lfdr.de>; Tue,  4 Jun 2024 15:34:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 59AC1145FF7;
	Tue,  4 Jun 2024 15:34:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="h8X6ElKR"
X-Original-To: linux-input@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B99E1BE4A;
	Tue,  4 Jun 2024 15:34:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717515259; cv=none; b=I3WeciKRnFTHm38vAJpWXkaKSEc0Z1I46QuOef05jPBMxSI7ssPL5l/EpxxXl+O9LpVQvnc+njzimmF1KcvrSoeTcXQfu6k4y1R102uytns/jm6ZrxHHKUSqsIIuFEvR7z5oFoQQAzhlr7PHfwlGKPGbjT3AMqjOw8IVTJrQpNk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717515259; c=relaxed/simple;
	bh=+V2Pn7pZqMh8/15HP9GBw/WSyruGjuKvEPeJTGM1Qrk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:To:CC; b=BhgvGk8VJfjDF9ydbUjdiujZ1Pt+HKbItq2ugst1Nd69q6M9sb7VBgVA6gzkuLOO0j895VHDxgx+cpmBdUcCtU5vZLSW2uTSM4JDRHDNnl7q9Ya4KqlQ0ZvvuLZ+j49YetoArK/XtpYBo4BwFXzVrEQWEcVtIMcEMob8i+cGPUw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=h8X6ElKR; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 454Bn9IS028037;
	Tue, 4 Jun 2024 15:34:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=Effa3JSW/rkRtXNKhXRn8A
	jiK3ARC0OBNKnBpuVerlU=; b=h8X6ElKRZzkNSYszdtSSn8TPvTMgPt0WyUSF5r
	7mywUMAcbMxoLhUaOkYTZkcbwo/N3NRMlokOi7v9DD69VfmGFZh0ouIyN9Uwibuq
	HtQXj/+E7TT3S+GAlaD+fjkdefB+DDziGqSHNReOfVDzJGodM92yOKv5yzagLNca
	rmAl0vxkPna7NU2lglWXnmzZBjtqemzQHfkyMPAMg/guW2MJXsYzy2GQ+usuda4K
	c0czTdWz5p690uXsEeHDDfe5Gw0dJyZn7i3LudPhlaEvsNdRRRmP+qjfHTlt4Tfj
	GWh2l8H5OyXMb8TsJdH7yB5gEFEqk1sJSS6OXLwT3s3qn+wQ==
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3yfw3r7frf-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 04 Jun 2024 15:34:07 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA05.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 454FY3FD029015
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 4 Jun 2024 15:34:03 GMT
Received: from [169.254.0.1] (10.49.16.6) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Tue, 4 Jun 2024
 08:34:03 -0700
From: Jeff Johnson <quic_jjohnson@quicinc.com>
Date: Tue, 4 Jun 2024 08:34:01 -0700
Subject: [PATCH] HID: logitech-dj: add missing MODULE_DESCRIPTION() macro
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20240604-md-hid-logitech-dj-v1-1-560f6b3cb54b@quicinc.com>
X-B4-Tracking: v=1; b=H4sIAOgzX2YC/x3MwQqDMAyA4VeRnBfoSnWwVxk7xDTaDK0jdUMQ3
 91ux+/w/zsUMZUC92YHk68WXXLF9dIAJ8qjoMZq8M4H17mAc8SkEadl1FU4YXyhbx0F7miQG0M
 N3yaDbv/p41ndUxHsjTKn32rS/NlwprKKwXGcs+Su2oMAAAA=
To: =?utf-8?q?Filipe_La=C3=ADns?= <lains@riseup.net>,
        Jiri Kosina
	<jikos@kernel.org>,
        Benjamin Tissoires <bentiss@kernel.org>
CC: <linux-input@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <kernel-janitors@vger.kernel.org>,
        Jeff Johnson <quic_jjohnson@quicinc.com>
X-Mailer: b4 0.13.0
X-ClientProxiedBy: nalasex01b.na.qualcomm.com (10.47.209.197) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: vDOhkPgPTno2Pu_HqXlacfNSpbtmvmXX
X-Proofpoint-GUID: vDOhkPgPTno2Pu_HqXlacfNSpbtmvmXX
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-06-04_09,2024-06-04_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0 impostorscore=0
 lowpriorityscore=0 suspectscore=0 adultscore=0 spamscore=0 mlxscore=0
 clxscore=1015 priorityscore=1501 malwarescore=0 mlxlogscore=999
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2405170001 definitions=main-2406040124

make allmodconfig && make W=1 C=1 reports:
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/hid/hid-logitech-dj.o

Add the missing invocation of the MODULE_DESCRIPTION() macro.

Signed-off-by: Jeff Johnson <quic_jjohnson@quicinc.com>
---
 drivers/hid/hid-logitech-dj.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/hid/hid-logitech-dj.c b/drivers/hid/hid-logitech-dj.c
index 3c3c497b6b91..dfa4e3d1a3b3 100644
--- a/drivers/hid/hid-logitech-dj.c
+++ b/drivers/hid/hid-logitech-dj.c
@@ -2045,6 +2045,7 @@ static struct hid_driver logi_djreceiver_driver = {
 
 module_hid_driver(logi_djreceiver_driver);
 
+MODULE_DESCRIPTION("HID driver for Logitech receivers");
 MODULE_LICENSE("GPL");
 MODULE_AUTHOR("Logitech");
 MODULE_AUTHOR("Nestor Lopez Casado");

---
base-commit: a693b9c95abd4947c2d06e05733de5d470ab6586
change-id: 20240604-md-hid-logitech-dj-250a4c6afe7c


