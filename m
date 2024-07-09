Return-Path: <linux-input+bounces-4938-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id AEBE592C566
	for <lists+linux-input@lfdr.de>; Tue,  9 Jul 2024 23:39:21 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id D0C671C22172
	for <lists+linux-input@lfdr.de>; Tue,  9 Jul 2024 21:39:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A556F182A5B;
	Tue,  9 Jul 2024 21:39:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="DBQHNLnE"
X-Original-To: linux-input@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E1F851B86D4;
	Tue,  9 Jul 2024 21:39:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720561157; cv=none; b=RLDKOuB2IyI6OOibFE1QhW1wf2uKKC1vbXGk/gQVKd7Fpz/gXKUDcfduyBldFksNmMvfJp/qTSSLQXz4naXfxQtSY9a7StHA+MRbfHlcVwqnpsab0guouC7aKl3z3caPgudxsSbQbxfouCT50mhTtdCyRDmTYGgAd3TRkpwqSm8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720561157; c=relaxed/simple;
	bh=WZWpVyL4Q31YjCEAsVMQum2Kj3vgJUWtsN03WXQ7TEU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:To:CC; b=fsrBXUJYDZNEq0fuKxonJx3NZ9Jpri28xbwWI0JiCl/CKmuPKcvJD08LiRlAIyeqJxgr2l/ieOp1YvFrAacKPFpXl7YO5uDysKWwlRCn+iPRacPXIEB5FprRTnSyBfxzI5c12oe+uUVHdPdg/qrRc386ws8MS8ko+Swqpcn2Gc4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=DBQHNLnE; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 469C52lt022355;
	Tue, 9 Jul 2024 21:39:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=LkB9PcxF9dzYIW9CbAPD9v
	LoZWxLrUJKbs0fhmfqolE=; b=DBQHNLnEwtun3B15wj14/mqlZ4zzPl0sdKU6Fz
	XAgLxwtHJYDSBdBfAhHB05BsJb1zWqOVKz4rnAodsjW8x1z0Kx+CfBDfTmA8G7Gt
	rDo5fbJn/kgwLxeEKc/O7G6gClEpM0jn0TIlQpRwn7t+GZ0JvwZ/+LeJSfwF1IAW
	Q2ctYBrzQKmJGAu9uNCPoZ2dLNM9lifRhBgRcVhf/D40nt/kxTLbyAF7QNGNTdnx
	Yh9LH683224sauj6iHzwJFlZgXqKyRXM7NohYD/zTk+7b4rSEpeNABGLTUh4eKFw
	szCVk3SItN0MxsYBWK8pSk10P0BNJPYRUH7sVVRxKf0nwh5w==
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 406wmmqsm3-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 09 Jul 2024 21:39:13 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA03.qualcomm.com (8.17.1.19/8.17.1.19) with ESMTPS id 469LdCdl014218
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 9 Jul 2024 21:39:12 GMT
Received: from [169.254.0.1] (10.49.16.6) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Tue, 9 Jul 2024
 14:39:12 -0700
From: Jeff Johnson <quic_jjohnson@quicinc.com>
Date: Tue, 9 Jul 2024 14:39:11 -0700
Subject: [PATCH v2] HID: add more missing MODULE_DESCRIPTION() macros
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20240709-md-drivers-hid-v2-1-67faf2f2ec90@quicinc.com>
X-B4-Tracking: v=1; b=H4sIAP6tjWYC/3WNQQ6CMBBFr2K6dkxpgFhX3sOwaKeDnUSKttBgC
 He3sHf5kv/fW0WiyJTE7bSKSJkTj6GAOp8EehOeBOwKCyVVLVvZwuDARc4UE3h2UCvSvcZrg06
 LcnpH6nk5hI+usDWJwEYT0O+aF4d5gcGkieI+95ymMX6PfK72099SrqAC15qmUtLqGu39MzNyw
 AuOg+i2bfsBh5bAQs0AAAA=
To: Jiri Kosina <jikos@kernel.org>, Benjamin Tissoires <bentiss@kernel.org>
CC: <linux-input@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        "Jeff
 Johnson" <quic_jjohnson@quicinc.com>
X-Mailer: b4 0.14.0
X-ClientProxiedBy: nalasex01c.na.qualcomm.com (10.47.97.35) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: VNKdgW3DsS60Jf5h32U88EDnPxKcLwEB
X-Proofpoint-ORIG-GUID: VNKdgW3DsS60Jf5h32U88EDnPxKcLwEB
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-07-09_10,2024-07-09_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1011
 priorityscore=1501 lowpriorityscore=0 spamscore=0 bulkscore=0 adultscore=0
 impostorscore=0 suspectscore=0 malwarescore=0 mlxscore=0 mlxlogscore=999
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2406140001 definitions=main-2407090147

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
The missing MODULE_DESCRIPTION() macros in drivers/hid were supposed
to be fixed by:
https://lore.kernel.org/all/20240604-md-hid-misc-v1-1-4f9560796f3c@quicinc.com/

I somehow failed to include some of the fixes, and I subsequently
sent:
https://lore.kernel.org/all/20240606-md-drivers-hid-v1-1-d6a5120b94cb@quicinc.com/

But then I confused myself and thought that second patch wasn't needed:
https://lore.kernel.org/all/c777aad9-3b0a-43d3-9e6b-1e1807df61a8@quicinc.com/

But then realized it was actually needed:
https://lore.kernel.org/all/50c97718-b304-4eb5-9bb0-53ff32ccf185@quicinc.com/

Since it hasn't landed in linux-next, posting a renamed version so
that it can hopefully be picked up in time for the 6.11 merge window.
---
Changes in v2:
- Modified the subject to differentiate it from the original patch
- Link to v1: https://lore.kernel.org/r/20240606-md-drivers-hid-v1-1-d6a5120b94cb@quicinc.com
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
base-commit: 34afb82a3c67f869267a26f593b6f8fc6bf35905
change-id: 20240606-md-drivers-hid-42e9f9c85cd9


