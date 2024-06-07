Return-Path: <linux-input+bounces-4191-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 157B48FFB37
	for <lists+linux-input@lfdr.de>; Fri,  7 Jun 2024 07:10:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 64BDEB22983
	for <lists+linux-input@lfdr.de>; Fri,  7 Jun 2024 05:10:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A44111B7F4;
	Fri,  7 Jun 2024 05:09:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="HJd+780j"
X-Original-To: linux-input@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A092512B73;
	Fri,  7 Jun 2024 05:09:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717736998; cv=none; b=gwbfwXAqa7tGEfxf3Xhwqvs6hoUIXr6f8fJWGsBjv3Osyv7e7PVTuQRp6G+Zq5ZzxNwFcuxkj0Iwe9XzJVR77M8RL2hgoQu1ieHy5cvjuAabE9yw9yR/4hgtEYCTuO/msiB1KYviOaz3ZyEnZm9BfRhzrTk491ZleVf4iTh0khw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717736998; c=relaxed/simple;
	bh=I68PU4TyRuxcHLDI+LQs32poGcRbZjagQgPKpe0EldA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:To:CC; b=M4WNKLz+M/KGTvFb3h9rTvmTUAzF073+lVgSk8L+dV7wx8ult4bGDPlzHIARL04j0M6JyZ2/QSguBWsZRIuusiFxkJpG97DPKq75EdbCJZfgJ8ih7p/dIg7+E8Sp4WGKt7KUvY2i20XbattOSLArkbzkVccpLe1CzynYgx6pE4Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=HJd+780j; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 456Lw4e4026777;
	Fri, 7 Jun 2024 05:09:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=F3MiSc6DPntNUshZMa7Rrk
	8dxC9hBlarQDVZ+/pxL/8=; b=HJd+780jEBTg0JsYmD2/snqfPlxcFcEat9Nj97
	blaBydHzKtXq7qLB+mfGGwbfB3oCzomIeNiqNtBqA/YK3KQQICCaJh5s/BX328yw
	c4V3NDsXYwQ8XsEqRGOwEp+H1mqh3l5TUGZmwFoN0/fpn3NLF3ySZY/bdYhGs7x3
	yvBGEzRoTIsJ6M2VT3cCQbxFO+0ubHEOpz0MYCqZRgD/FEkTSN5kqmDbHqYpJTJc
	8YFOa9wbW4k4cnwVqzda3szaRS0MfjOupWx9qXwsdKUVwJosfgbiHJJvh5RsM9Fb
	CGct1+6DJU8mXwd8KdBj8mtn9elJlgLW4qns5fhnms7oRrOQ==
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3yjq2tmsbm-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 07 Jun 2024 05:09:53 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA03.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 45759r4W031204
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 7 Jun 2024 05:09:53 GMT
Received: from [169.254.0.1] (10.49.16.6) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Thu, 6 Jun 2024
 22:09:52 -0700
From: Jeff Johnson <quic_jjohnson@quicinc.com>
Date: Thu, 6 Jun 2024 22:09:49 -0700
Subject: [PATCH] HID: add missing MODULE_DESCRIPTION() macros
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20240606-md-drivers-hid-v1-1-d6a5120b94cb@quicinc.com>
X-B4-Tracking: v=1; b=H4sIAByWYmYC/x3MwQqDMAyA4VeRnBfoihO7Vxk71CbawOxGsokgv
 vuqx+/w/xsYq7DBvdlAeRGTd6m4XhpIOZaJUagavPOt61yHMyGpLKyGWQhbz2EMqb8lClCjj/I
 o6zl8PKuHaIyDxpLysXlJ+a04R/uywr7/AaCec9l/AAAA
To: Jiri Kosina <jikos@kernel.org>, Benjamin Tissoires <bentiss@kernel.org>
CC: <linux-input@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <kernel-janitors@vger.kernel.org>,
        Jeff Johnson <quic_jjohnson@quicinc.com>
X-Mailer: b4 0.13.0
X-ClientProxiedBy: nalasex01a.na.qualcomm.com (10.47.209.196) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: qGQwQ9ubdljdUf31aWJW4KlhlJ8YhrkS
X-Proofpoint-ORIG-GUID: qGQwQ9ubdljdUf31aWJW4KlhlJ8YhrkS
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-06-06_20,2024-06-06_02,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 bulkscore=0 impostorscore=0 clxscore=1015 spamscore=0 malwarescore=0
 mlxlogscore=999 mlxscore=0 adultscore=0 lowpriorityscore=0 suspectscore=0
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2405170001 definitions=main-2406070035

make allmodconfig && make W=1 C=1 reports:
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/hid/hid-holtek-mouse.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/hid/hid-ite.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/hid/hid-kensington.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/hid/hid-keytouch.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/hid/hid-kye.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/hid/hid-lcpower.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/hid/hid-lenovo.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/hid/hid-winwing.o

Add the missing invocations of the MODULE_DESCRIPTION() macro.

Signed-off-by: Jeff Johnson <quic_jjohnson@quicinc.com>
---
 drivers/hid/hid-holtek-mouse.c | 1 +
 drivers/hid/hid-ite.c          | 1 +
 drivers/hid/hid-kensington.c   | 1 +
 drivers/hid/hid-keytouch.c     | 1 +
 drivers/hid/hid-kye.c          | 1 +
 drivers/hid/hid-lcpower.c      | 1 +
 drivers/hid/hid-lenovo.c       | 1 +
 drivers/hid/hid-winwing.c      | 1 +
 8 files changed, 8 insertions(+)

diff --git a/drivers/hid/hid-holtek-mouse.c b/drivers/hid/hid-holtek-mouse.c
index 7c907939bfae..343730c28e2d 100644
--- a/drivers/hid/hid-holtek-mouse.c
+++ b/drivers/hid/hid-holtek-mouse.c
@@ -110,4 +110,5 @@ static struct hid_driver holtek_mouse_driver = {
 };
 
 module_hid_driver(holtek_mouse_driver);
+MODULE_DESCRIPTION("HID driver for Holtek gaming mice");
 MODULE_LICENSE("GPL");
diff --git a/drivers/hid/hid-ite.c b/drivers/hid/hid-ite.c
index 75ebfcf31889..6a7281bc27c9 100644
--- a/drivers/hid/hid-ite.c
+++ b/drivers/hid/hid-ite.c
@@ -141,4 +141,5 @@ static struct hid_driver ite_driver = {
 module_hid_driver(ite_driver);
 
 MODULE_AUTHOR("Hans de Goede <hdegoede@redhat.com>");
+MODULE_DESCRIPTION("HID driver for some ITE \"special\" devices");
 MODULE_LICENSE("GPL");
diff --git a/drivers/hid/hid-kensington.c b/drivers/hid/hid-kensington.c
index b31f7f431a3f..99e79b42047c 100644
--- a/drivers/hid/hid-kensington.c
+++ b/drivers/hid/hid-kensington.c
@@ -46,4 +46,5 @@ static struct hid_driver ks_driver = {
 };
 module_hid_driver(ks_driver);
 
+MODULE_DESCRIPTION("HID driver for Kensigton Slimblade Trackball");
 MODULE_LICENSE("GPL");
diff --git a/drivers/hid/hid-keytouch.c b/drivers/hid/hid-keytouch.c
index 73bf8642dfe3..a972943baaea 100644
--- a/drivers/hid/hid-keytouch.c
+++ b/drivers/hid/hid-keytouch.c
@@ -48,5 +48,6 @@ static struct hid_driver keytouch_driver = {
 };
 module_hid_driver(keytouch_driver);
 
+MODULE_DESCRIPTION("HID driver for Keytouch devices not fully compliant with HID standard");
 MODULE_LICENSE("GPL");
 MODULE_AUTHOR("Jiri Kosina");
diff --git a/drivers/hid/hid-kye.c b/drivers/hid/hid-kye.c
index 70ceb9437332..ca2ba3da2458 100644
--- a/drivers/hid/hid-kye.c
+++ b/drivers/hid/hid-kye.c
@@ -671,4 +671,5 @@ static struct hid_driver kye_driver = {
 };
 module_hid_driver(kye_driver);
 
+MODULE_DESCRIPTION("HID driver for Kye/Genius devices not fully compliant with HID standard");
 MODULE_LICENSE("GPL");
diff --git a/drivers/hid/hid-lcpower.c b/drivers/hid/hid-lcpower.c
index 8acd3ee5ada5..58953d11ded7 100644
--- a/drivers/hid/hid-lcpower.c
+++ b/drivers/hid/hid-lcpower.c
@@ -53,4 +53,5 @@ static struct hid_driver ts_driver = {
 };
 module_hid_driver(ts_driver);
 
+MODULE_DESCRIPTION("HID driver for LC Power Model RC1000MCE");
 MODULE_LICENSE("GPL");
diff --git a/drivers/hid/hid-lenovo.c b/drivers/hid/hid-lenovo.c
index e6b2ae68b8fb..e5e72aa5260a 100644
--- a/drivers/hid/hid-lenovo.c
+++ b/drivers/hid/hid-lenovo.c
@@ -1442,4 +1442,5 @@ static struct hid_driver lenovo_driver = {
 };
 module_hid_driver(lenovo_driver);
 
+MODULE_DESCRIPTION("HID driver for IBM/Lenovo");
 MODULE_LICENSE("GPL");
diff --git a/drivers/hid/hid-winwing.c b/drivers/hid/hid-winwing.c
index 0e224d1a6466..10a5d87ccb96 100644
--- a/drivers/hid/hid-winwing.c
+++ b/drivers/hid/hid-winwing.c
@@ -223,4 +223,5 @@ static struct hid_driver winwing_driver = {
 };
 module_hid_driver(winwing_driver);
 
+MODULE_DESCRIPTION("HID driver for WinWing Orion 2 throttle");
 MODULE_LICENSE("GPL");

---
base-commit: 19ca0d8a433ff37018f9429f7e7739e9f3d3d2b4
change-id: 20240606-md-drivers-hid-42e9f9c85cd9


