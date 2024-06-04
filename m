Return-Path: <linux-input+bounces-4078-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id E9A538FB516
	for <lists+linux-input@lfdr.de>; Tue,  4 Jun 2024 16:21:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 889041F27C8E
	for <lists+linux-input@lfdr.de>; Tue,  4 Jun 2024 14:21:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8065712B145;
	Tue,  4 Jun 2024 14:20:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="pHlLmqBa"
X-Original-To: linux-input@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E67B754903;
	Tue,  4 Jun 2024 14:20:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717510856; cv=none; b=s0lAVfUDI5JGeE5TNQNRziHWw3L+WDl6HueJYYYLYFDgT8yyDvtEjHBAwLVRTf/y3ExoiGz6/4HS7na4sCUzcZUR23BqLJjv/R9IbqbewNOOywerxlUQMbVqU0ZYeoB4XbX5fBrx7jE5rg9tbzizqIdtmpgH6O7Ps4qsUaxUuoU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717510856; c=relaxed/simple;
	bh=bIOHR/btpct5Q2UC4EFEu5+yUn5Es6SR84QLRAuu0nc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:To:CC; b=jjtxjtJjnQBHpO7zB75IRCXzCjiVKF73LbudnIthIfdND1Tps0evrYKyHlZm+TZHwI2WM59ULmaZkGqMpxWsX1TkpmvJ65Id4onFbcksfYv0aj0oVZDSTmiJXWsQuhAoSePi7E1dR4vInPiCISSAtW+xyctjuQdm6JTdAhUf6p0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=pHlLmqBa; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 454D90Lo031534;
	Tue, 4 Jun 2024 14:20:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=vrAfWtgxQuLdUkSCcMaxbA
	DDZKLTIx/U9+nlzEtGl1s=; b=pHlLmqBae1Vp/nQNV+RjCBi2CzXQr3PSphvQnj
	XqIur6rS2Skp3UN/i/H4+c6P3Pqq5+YeC7kQLeWHyKHLz6od5SgRuWzUxLqqrqnT
	AbDwwuLSG/dEc/B4Ybb5Q79OamuwXKCswFuZXZAWxDWHGgcgbb8EsUFdyCJ20L/P
	WQtjnd67ewi8vWCfwDNhgTVKdcfE02Gr1asRvEq/tiX4y9H+oPhrSVlN/+XfoZLa
	mLV+MrPHnfr5S1R6B54tOCxehRGnDSd0Lf/6MT/Rt1wE8gblcl9LushtrTg1/kp5
	f+sdvONonuHfl+oDGiAbAPwKCNye+rvmA9NkJd9ZeEFUQhYQ==
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3yfw4beykj-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 04 Jun 2024 14:20:50 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA03.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 454EKnRN032104
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 4 Jun 2024 14:20:49 GMT
Received: from [169.254.0.1] (10.49.16.6) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Tue, 4 Jun 2024
 07:20:48 -0700
From: Jeff Johnson <quic_jjohnson@quicinc.com>
Date: Tue, 4 Jun 2024 07:20:47 -0700
Subject: [PATCH] HID: letsketch: add missing MODULE_DESCRIPTION() macro
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20240604-md-hid-letsketch-v1-1-ff38ae7b4cb0@quicinc.com>
X-B4-Tracking: v=1; b=H4sIAL4iX2YC/x3MwQ6CMAyA4VchPdtkTsToqxgPZSuuEaZppyEhv
 DvD43f4/wWMVdjg1iyg/BOTd644HhoIifKTUWI1eOdb17kWp4hJIo5c7MUlJDyfvOvIDUSXK9T
 sozzI/F/eH9U9GWOvlEPaR6Pk74wTWWGFdd0A0lmm8oEAAAA=
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
X-Proofpoint-ORIG-GUID: lhu3zGEf2zxiu32zFXEf1vwXzScnxSYl
X-Proofpoint-GUID: lhu3zGEf2zxiu32zFXEf1vwXzScnxSYl
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-06-04_05,2024-06-04_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1011 suspectscore=0
 phishscore=0 malwarescore=0 priorityscore=1501 mlxscore=0 impostorscore=0
 bulkscore=0 lowpriorityscore=0 spamscore=0 mlxlogscore=999 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2405170001
 definitions=main-2406040114

make allmodconfig && make W=1 C=1 reports:
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/hid/hid-letsketch.o

Add the missing invocation of the MODULE_DESCRIPTION() macro.

Signed-off-by: Jeff Johnson <quic_jjohnson@quicinc.com>
---
 drivers/hid/hid-letsketch.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/hid/hid-letsketch.c b/drivers/hid/hid-letsketch.c
index 97f047f18136..229820fda960 100644
--- a/drivers/hid/hid-letsketch.c
+++ b/drivers/hid/hid-letsketch.c
@@ -319,4 +319,5 @@ static struct hid_driver letsketch_driver = {
 module_hid_driver(letsketch_driver);
 
 MODULE_AUTHOR("Hans de Goede <hdegoede@redhat.com>");
+MODULE_DESCRIPTION("Driver for the LetSketch / VSON WP9620N drawing tablet");
 MODULE_LICENSE("GPL");

---
base-commit: a693b9c95abd4947c2d06e05733de5d470ab6586
change-id: 20240604-md-hid-letsketch-53206a0faa79


