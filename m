Return-Path: <linux-input+bounces-4080-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id EAAD38FB57F
	for <lists+linux-input@lfdr.de>; Tue,  4 Jun 2024 16:36:57 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 4352FB28F3B
	for <lists+linux-input@lfdr.de>; Tue,  4 Jun 2024 14:36:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E35A8146A97;
	Tue,  4 Jun 2024 14:33:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="c3eJ8Wc2"
X-Original-To: linux-input@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0AAEF146A8C;
	Tue,  4 Jun 2024 14:33:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717511605; cv=none; b=ceJyTQkJKVfUgPiPS+WSq+UTN1opSNXVdx4Zu20pnENiKO/P6NG60i6UkRlvbv2Vq9v3K+Fr7muEqrGE5u+2TS4j9gBR4N6oxmXOnIkqPZ5JD7KGn00p7H7X/BFo7GXaWMuW9kCFJaHk7u4AggkicAYmxj9H0OnZh5adqY5Rs3M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717511605; c=relaxed/simple;
	bh=IejdTZ7QImNHuKyVqpJOqRpSxAfyBm1xYYnFYBAeHN4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:To:CC; b=nXA2yB2YgGH3U5i2JiM6ysQeGctwzmfctF8T1kpeO8/Qdn6CqEVfITknCrhHIn1wXLDI2MeJ+LCLMnXVbPXQHHUjAOsDTsoD89cgZYfO4LMM/+7T25JyB6cRXfHg6ejmRaPQu2T/SzIiRobk2wrGhgI739z4kOXGsnhub9535Io=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=c3eJ8Wc2; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 454C8Alr007410;
	Tue, 4 Jun 2024 14:33:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=Sv0S6rLXcOFChy33McuSZ0
	G1mzudvJAnkcoO6e8gceg=; b=c3eJ8Wc2hd6XdrSKvkOoEOjGnFW8T1LP/tHvc7
	D/Pd06QNXqopnyICE7ogyKricmczbjx8hvTcpg943H+NwkI9NtCt1x4zYYypWnLv
	1+RnQtD6wwwDcoVZhTzBa+JA9PP+qkyvU0DrjaFhXR1FvnNzX/bUQ9tGD+AJGboS
	wpNE6zet29frVJOKPZJbDuREdQtJdFMFNVKcSrXAGE/wj0xa0o1Czme6qbv0/wk0
	s/jRFjGdjcrAFP32kmHPQBngWJwcjS2e3a4pmSeFBFTatJbvTi5mryiNjASBTMA0
	3K04o0G/cTE+S5LTV70uadjS+RA8ry9x7SWejoRMbFWNH3bQ==
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3yfw4d7711-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 04 Jun 2024 14:33:18 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA03.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 454EX7iK016477
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 4 Jun 2024 14:33:07 GMT
Received: from [169.254.0.1] (10.49.16.6) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Tue, 4 Jun 2024
 07:33:07 -0700
From: Jeff Johnson <quic_jjohnson@quicinc.com>
Date: Tue, 4 Jun 2024 07:33:01 -0700
Subject: [PATCH] HID: lg-g15: add missing MODULE_DESCRIPTION() macro
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20240604-md-hid-lg-g15-v1-1-265b094db089@quicinc.com>
X-B4-Tracking: v=1; b=H4sIAJwlX2YC/x3MwQrCMAyA4VcZORtoS+3BVxEP6RrbwFYlURmMv
 bvV43f4/x2MVdjgMu2g/BGTRx/wpwnmRr0yShmG4EJ0yUVcCzYpuFSs/owcybuUyYeUYTRP5bt
 s/9/1NpzJGLNSn9vvskh/b7iSvVjhOL7uA4CJfgAAAA==
To: Hans de Goede <hdegoede@redhat.com>, Jiri Kosina <jikos@kernel.org>,
        Benjamin Tissoires <bentiss@kernel.org>
CC: <linux-input@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <kernel-janitors@vger.kernel.org>,
        Jeff Johnson <quic_jjohnson@quicinc.com>
X-Mailer: b4 0.13.0
X-ClientProxiedBy: nalasex01b.na.qualcomm.com (10.47.209.197) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: fn14VJzAvwWrwWmvuktsTjQDzmPkRoiG
X-Proofpoint-GUID: fn14VJzAvwWrwWmvuktsTjQDzmPkRoiG
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-06-04_09,2024-06-04_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 malwarescore=0 mlxscore=0 adultscore=0 impostorscore=0 bulkscore=0
 spamscore=0 phishscore=0 clxscore=1015 mlxlogscore=999 suspectscore=0
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2405170001 definitions=main-2406040116

make allmodconfig && make W=1 C=1 reports:
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/hid/hid-lg-g15.o

Add the missing invocation of the MODULE_DESCRIPTION() macro.

Signed-off-by: Jeff Johnson <quic_jjohnson@quicinc.com>
---
 drivers/hid/hid-lg-g15.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/hid/hid-lg-g15.c b/drivers/hid/hid-lg-g15.c
index acbec1dcf196..53e7b90f9cc3 100644
--- a/drivers/hid/hid-lg-g15.c
+++ b/drivers/hid/hid-lg-g15.c
@@ -954,4 +954,5 @@ static struct hid_driver lg_g15_driver = {
 module_hid_driver(lg_g15_driver);
 
 MODULE_AUTHOR("Hans de Goede <hdegoede@redhat.com>");
+MODULE_DESCRIPTION("HID driver for gaming keys on Logitech gaming keyboards");
 MODULE_LICENSE("GPL");

---
base-commit: a693b9c95abd4947c2d06e05733de5d470ab6586
change-id: 20240604-md-hid-lg-g15-e4a106ba126b


