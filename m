Return-Path: <linux-input+bounces-4091-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 77D7D8FBE84
	for <lists+linux-input@lfdr.de>; Wed,  5 Jun 2024 00:10:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 9AC8B1C216C0
	for <lists+linux-input@lfdr.de>; Tue,  4 Jun 2024 22:10:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E0D8A143870;
	Tue,  4 Jun 2024 22:10:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="KsvESmwI"
X-Original-To: linux-input@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B979143733;
	Tue,  4 Jun 2024 22:10:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717539035; cv=none; b=LEKNJY900uSnza/w7joLRmrhxKsuRDB6+yyleGJ+M6AF/hjZDVDOKH9IHz1Nefb8OBvWklPgL6h7Gee1EdFiP5IzMvJZ8UlY2v1LiHlAn91JyaUCVnhbRBmJYFbd16MT5B0FqqQhdNmxewTJQHLQKVCBKvpTQ1dihX5YeZWPJUo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717539035; c=relaxed/simple;
	bh=mLB3h1YoNShKgL6/n19kQZBGOmh++ChCVCzs0gg+bfI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:To:CC; b=uylqep4iGWxIWZ7HdyqoR0Fq64bqJFBy+S13djdfAwU8pmhIrLB3rggL0FC09nukJJdSJhDx+AvUm8+Yhjyv+EStU04dClnA94E31LuUTpQxwM9mhuhMrGUW4Z0QsCuGWcs3Qsd9XJXYb8SIItsi8fUvkqocXQksVTJJWj6woYQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=KsvESmwI; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 454HIX2X005515;
	Tue, 4 Jun 2024 22:10:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=kpu9Cpy8/SMsuqRu+4YSSz
	Nb46LBjpFcyRAPa8NYrAo=; b=KsvESmwI4WhGhVNXBPxUQ4MgEwz8f0OTl84uja
	qNHOc/w6+VO5qsySK/UlWtV3nWBJqOUyqiEHk2NjLxz8zg5aQb3f3vYc/4064Mov
	brFt1sjhtNRVh9j62mPLbI1DCrEa7ZT3FiSTYPDUgSBkcnuXZFhMcQGd9Bhw9zfr
	3vpxutISJJz/2n8QmWbgnTtiQGWx3L4w5beCjYSOu+WkKWn8RJVtwZtpubKnTBu8
	M7I7kpmY8kjP5/a7ycdE1h4OK+JKerrdIpyl0HugZjy0vdZM2PAodAg0dwKqvvyw
	wmEm6OTjJqkUjQ/wX9ZRksGmwKSc49N8e6TJg5i7OHf0mR7w==
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3yj76wgjqb-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 04 Jun 2024 22:10:26 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA01.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 454MAPvY011833
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 4 Jun 2024 22:10:25 GMT
Received: from [169.254.0.1] (10.49.16.6) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Tue, 4 Jun 2024
 15:10:24 -0700
From: Jeff Johnson <quic_jjohnson@quicinc.com>
Date: Tue, 4 Jun 2024 15:10:23 -0700
Subject: [PATCH] HID: add missing MODULE_DESCRIPTION() macros
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20240604-md-hid-misc-v1-1-4f9560796f3c@quicinc.com>
X-B4-Tracking: v=1; b=H4sIAM+QX2YC/x3MQQrCMBBG4auUWTuQllrFq4iLSfLXDJgomSqF0
 rsbXX6L9zYyVIXRpduo4qOmz9LQHzoKScodrLGZBjeMbnIj58hJI2e1wMf+dMY8wQuEWvGqmHX
 93663Zi8G9lVKSL/HQ8t75Sy2oNK+fwGVTahafAAAAA==
To: Jiri Kosina <jikos@kernel.org>, Benjamin Tissoires <bentiss@kernel.org>
CC: <linux-input@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <kernel-janitors@vger.kernel.org>,
        Jeff Johnson <quic_jjohnson@quicinc.com>
X-Mailer: b4 0.13.0
X-ClientProxiedBy: nalasex01a.na.qualcomm.com (10.47.209.196) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: fxhxgA4cTiiE2opk1Hrygmb9ECAoJfhN
X-Proofpoint-ORIG-GUID: fxhxgA4cTiiE2opk1Hrygmb9ECAoJfhN
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-06-04_11,2024-06-04_02,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 bulkscore=0 mlxscore=0 suspectscore=0 mlxlogscore=999 clxscore=1015
 adultscore=0 impostorscore=0 malwarescore=0 priorityscore=1501
 phishscore=0 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2405170001 definitions=main-2406040179

make allmodconfig && make W=1 C=1 reports:
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/hid/hid.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/hid/hid-a4tech.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/hid/hid-apple.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/hid/hid-aureal.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/hid/hid-belkin.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/hid/hid-betopff.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/hid/hid-bigbenff.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/hid/hid-cherry.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/hid/hid-chicony.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/hid/hid-cypress.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/hid/hid-dr.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/hid/hid-emsff.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/hid/hid-elecom.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/hid/hid-elo.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/hid/hid-evision.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/hid/hid-ezkey.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/hid/hid-vivaldi-common.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/hid/hid-google-hammer.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/hid/hid-google-stadiaff.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/hid/hid-gyration.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/hid/hid-holtek-kbd.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/hid/hid-holtek-mouse.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/hid/hid-ite.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/hid/hid-kensington.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/hid/hid-keytouch.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/hid/hid-kye.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/hid/hid-lcpower.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/hid/hid-lenovo.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/hid/hid-logitech.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/hid/hid-magicmouse.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/hid/hid-maltron.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/hid/hid-mf.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/hid/hid-megaworld.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/hid/hid-microsoft.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/hid/hid-monterey.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/hid/hid-ntrig.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/hid/hid-ortek.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/hid/hid-prodikeys.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/hid/hid-pl.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/hid/hid-petalynx.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/hid/hid-primax.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/hid/hid-razer.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/hid/hid-redragon.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/hid/hid-retrode.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/hid/hid-saitek.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/hid/hid-samsung.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/hid/hid-semitek.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/hid/hid-sjoy.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/hid/hid-sony.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/hid/hid-speedlink.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/hid/hid-steam.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/hid/hid-steelseries.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/hid/hid-sunplus.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/hid/hid-gaff.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/hid/hid-tmff.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/hid/hid-tivo.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/hid/hid-topseed.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/hid/hid-twinhan.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/hid/hid-uclogic.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/hid/hid-xinmo.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/hid/hid-zpff.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/hid/hid-zydacron.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/hid/hid-viewsonic.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/hid/hid-waltop.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/hid/hid-winwing.o

Add the missing invocations of the MODULE_DESCRIPTION() macro.

Note: All HID drivers that had explicit entries in the MAINTAINERS
file were fixed individually. This patch fixes all remaining HID
drivers that fall under the generic "HID CORE LAYER" entry in the
MAINTAINERS file.  Almost all descriptions were taken from the header
comment in each file.

Signed-off-by: Jeff Johnson <quic_jjohnson@quicinc.com>
---
Let me know if there are any individual files you wish to be
segregated into separate patches.
---
 drivers/hid/hid-a4tech.c          | 1 +
 drivers/hid/hid-apple.c           | 1 +
 drivers/hid/hid-aureal.c          | 1 +
 drivers/hid/hid-belkin.c          | 1 +
 drivers/hid/hid-betopff.c         | 1 +
 drivers/hid/hid-bigbenff.c        | 1 +
 drivers/hid/hid-cherry.c          | 1 +
 drivers/hid/hid-chicony.c         | 1 +
 drivers/hid/hid-core.c            | 1 +
 drivers/hid/hid-cypress.c         | 1 +
 drivers/hid/hid-dr.c              | 1 +
 drivers/hid/hid-elecom.c          | 1 +
 drivers/hid/hid-elo.c             | 1 +
 drivers/hid/hid-emsff.c           | 1 +
 drivers/hid/hid-evision.c         | 1 +
 drivers/hid/hid-ezkey.c           | 1 +
 drivers/hid/hid-gaff.c            | 1 +
 drivers/hid/hid-google-hammer.c   | 1 +
 drivers/hid/hid-google-stadiaff.c | 1 +
 drivers/hid/hid-gyration.c        | 1 +
 drivers/hid/hid-holtek-kbd.c      | 1 +
 drivers/hid/hid-lg.c              | 1 +
 drivers/hid/hid-magicmouse.c      | 1 +
 drivers/hid/hid-maltron.c         | 1 +
 drivers/hid/hid-megaworld.c       | 1 +
 drivers/hid/hid-mf.c              | 1 +
 drivers/hid/hid-microsoft.c       | 1 +
 drivers/hid/hid-monterey.c        | 1 +
 drivers/hid/hid-ntrig.c           | 1 +
 drivers/hid/hid-ortek.c           | 1 +
 drivers/hid/hid-petalynx.c        | 1 +
 drivers/hid/hid-pl.c              | 1 +
 drivers/hid/hid-primax.c          | 1 +
 drivers/hid/hid-prodikeys.c       | 1 +
 drivers/hid/hid-razer.c           | 1 +
 drivers/hid/hid-redragon.c        | 1 +
 drivers/hid/hid-retrode.c         | 1 +
 drivers/hid/hid-saitek.c          | 1 +
 drivers/hid/hid-samsung.c         | 1 +
 drivers/hid/hid-semitek.c         | 1 +
 drivers/hid/hid-sjoy.c            | 1 +
 drivers/hid/hid-sony.c            | 1 +
 drivers/hid/hid-speedlink.c       | 1 +
 drivers/hid/hid-steam.c           | 1 +
 drivers/hid/hid-steelseries.c     | 1 +
 drivers/hid/hid-sunplus.c         | 1 +
 drivers/hid/hid-tivo.c            | 1 +
 drivers/hid/hid-tmff.c            | 1 +
 drivers/hid/hid-topseed.c         | 1 +
 drivers/hid/hid-twinhan.c         | 1 +
 drivers/hid/hid-uclogic-core.c    | 1 +
 drivers/hid/hid-viewsonic.c       | 1 +
 drivers/hid/hid-vivaldi-common.c  | 1 +
 drivers/hid/hid-waltop.c          | 1 +
 drivers/hid/hid-xinmo.c           | 1 +
 drivers/hid/hid-zpff.c            | 1 +
 drivers/hid/hid-zydacron.c        | 1 +
 57 files changed, 57 insertions(+)

diff --git a/drivers/hid/hid-a4tech.c b/drivers/hid/hid-a4tech.c
index 2cbc32dda7f7..54bfaf61182b 100644
--- a/drivers/hid/hid-a4tech.c
+++ b/drivers/hid/hid-a4tech.c
@@ -163,4 +163,5 @@ static struct hid_driver a4_driver = {
 };
 module_hid_driver(a4_driver);
 
+MODULE_DESCRIPTION("HID driver for some a4tech \"special\" devices");
 MODULE_LICENSE("GPL");
diff --git a/drivers/hid/hid-apple.c b/drivers/hid/hid-apple.c
index bd022e004356..37280f558157 100644
--- a/drivers/hid/hid-apple.c
+++ b/drivers/hid/hid-apple.c
@@ -1091,4 +1091,5 @@ static struct hid_driver apple_driver = {
 };
 module_hid_driver(apple_driver);
 
+MODULE_DESCRIPTION("Apple USB HID quirks support for Linux");
 MODULE_LICENSE("GPL");
diff --git a/drivers/hid/hid-aureal.c b/drivers/hid/hid-aureal.c
index ac8946f80e22..cf1a562d8523 100644
--- a/drivers/hid/hid-aureal.c
+++ b/drivers/hid/hid-aureal.c
@@ -41,4 +41,5 @@ static struct hid_driver aureal_driver = {
 };
 module_hid_driver(aureal_driver);
 
+MODULE_DESCRIPTION("HID driver for Aureal Cy se W-01RN USB_V3.1 devices");
 MODULE_LICENSE("GPL");
diff --git a/drivers/hid/hid-belkin.c b/drivers/hid/hid-belkin.c
index fc0b3bb383cc..75aaed35ee9f 100644
--- a/drivers/hid/hid-belkin.c
+++ b/drivers/hid/hid-belkin.c
@@ -85,4 +85,5 @@ static struct hid_driver belkin_driver = {
 };
 module_hid_driver(belkin_driver);
 
+MODULE_DESCRIPTION("HID driver for some belkin \"special\" devices");
 MODULE_LICENSE("GPL");
diff --git a/drivers/hid/hid-betopff.c b/drivers/hid/hid-betopff.c
index 25ed7b9a917e..a6d5f030d023 100644
--- a/drivers/hid/hid-betopff.c
+++ b/drivers/hid/hid-betopff.c
@@ -162,4 +162,5 @@ static struct hid_driver betop_driver = {
 };
 module_hid_driver(betop_driver);
 
+MODULE_DESCRIPTION("Force feedback support for Betop based devices");
 MODULE_LICENSE("GPL");
diff --git a/drivers/hid/hid-bigbenff.c b/drivers/hid/hid-bigbenff.c
index a02cb517b4c4..be17af3d9c0c 100644
--- a/drivers/hid/hid-bigbenff.c
+++ b/drivers/hid/hid-bigbenff.c
@@ -490,4 +490,5 @@ static struct hid_driver bigben_driver = {
 };
 module_hid_driver(bigben_driver);
 
+MODULE_DESCRIPTION("LED & force feedback support for BigBen Interactive");
 MODULE_LICENSE("GPL");
diff --git a/drivers/hid/hid-cherry.c b/drivers/hid/hid-cherry.c
index 6a71187b5cf6..549c73b05b8d 100644
--- a/drivers/hid/hid-cherry.c
+++ b/drivers/hid/hid-cherry.c
@@ -68,4 +68,5 @@ static struct hid_driver ch_driver = {
 };
 module_hid_driver(ch_driver);
 
+MODULE_DESCRIPTION("HID driver for some cherry \"special\" devices");
 MODULE_LICENSE("GPL");
diff --git a/drivers/hid/hid-chicony.c b/drivers/hid/hid-chicony.c
index f04d2aa23efe..99954c6b3242 100644
--- a/drivers/hid/hid-chicony.c
+++ b/drivers/hid/hid-chicony.c
@@ -152,4 +152,5 @@ static struct hid_driver ch_driver = {
 };
 module_hid_driver(ch_driver);
 
+MODULE_DESCRIPTION("HID driver for some chicony \"special\" devices");
 MODULE_LICENSE("GPL");
diff --git a/drivers/hid/hid-core.c b/drivers/hid/hid-core.c
index b1fa0378e8f4..3ef169a6c903 100644
--- a/drivers/hid/hid-core.c
+++ b/drivers/hid/hid-core.c
@@ -3025,4 +3025,5 @@ module_exit(hid_exit);
 MODULE_AUTHOR("Andreas Gal");
 MODULE_AUTHOR("Vojtech Pavlik");
 MODULE_AUTHOR("Jiri Kosina");
+MODULE_DESCRIPTION("HID support for Linux");
 MODULE_LICENSE("GPL");
diff --git a/drivers/hid/hid-cypress.c b/drivers/hid/hid-cypress.c
index b88f889b3932..b952b235e70a 100644
--- a/drivers/hid/hid-cypress.c
+++ b/drivers/hid/hid-cypress.c
@@ -176,4 +176,5 @@ static struct hid_driver cp_driver = {
 };
 module_hid_driver(cp_driver);
 
+MODULE_DESCRIPTION("HID driver for some cypress \"special\" devices");
 MODULE_LICENSE("GPL");
diff --git a/drivers/hid/hid-dr.c b/drivers/hid/hid-dr.c
index 947f19f8685f..c88224a96e9e 100644
--- a/drivers/hid/hid-dr.c
+++ b/drivers/hid/hid-dr.c
@@ -316,4 +316,5 @@ static struct hid_driver dr_driver = {
 };
 module_hid_driver(dr_driver);
 
+MODULE_DESCRIPTION("Force feedback support for DragonRise Inc. game controllers");
 MODULE_LICENSE("GPL");
diff --git a/drivers/hid/hid-elecom.c b/drivers/hid/hid-elecom.c
index 4fa45ee77503..5973a3bab29f 100644
--- a/drivers/hid/hid-elecom.c
+++ b/drivers/hid/hid-elecom.c
@@ -136,4 +136,5 @@ static struct hid_driver elecom_driver = {
 };
 module_hid_driver(elecom_driver);
 
+MODULE_DESCRIPTION("HID driver for ELECOM devices");
 MODULE_LICENSE("GPL");
diff --git a/drivers/hid/hid-elo.c b/drivers/hid/hid-elo.c
index 2876cb6a7dca..cf17bdd14d9c 100644
--- a/drivers/hid/hid-elo.c
+++ b/drivers/hid/hid-elo.c
@@ -313,4 +313,5 @@ static void __exit elo_driver_exit(void)
 module_exit(elo_driver_exit);
 
 MODULE_AUTHOR("Jiri Slaby <jslaby@suse.cz>");
+MODULE_DESCRIPTION("HID driver for ELO usb touchscreen 4000/4500");
 MODULE_LICENSE("GPL");
diff --git a/drivers/hid/hid-emsff.c b/drivers/hid/hid-emsff.c
index c34f2e5a049f..60bfb6a924d7 100644
--- a/drivers/hid/hid-emsff.c
+++ b/drivers/hid/hid-emsff.c
@@ -144,5 +144,6 @@ static struct hid_driver ems_driver = {
 };
 module_hid_driver(ems_driver);
 
+MODULE_DESCRIPTION("Force feedback support for EMS Trio Linker Plus II");
 MODULE_LICENSE("GPL");
 
diff --git a/drivers/hid/hid-evision.c b/drivers/hid/hid-evision.c
index ef6b4b435215..bb5997078491 100644
--- a/drivers/hid/hid-evision.c
+++ b/drivers/hid/hid-evision.c
@@ -50,4 +50,5 @@ static struct hid_driver evision_driver = {
 };
 module_hid_driver(evision_driver);
 
+MODULE_DESCRIPTION("HID driver for EVision devices");
 MODULE_LICENSE("GPL");
diff --git a/drivers/hid/hid-ezkey.c b/drivers/hid/hid-ezkey.c
index d14f91d78c96..0e28bc0b87fa 100644
--- a/drivers/hid/hid-ezkey.c
+++ b/drivers/hid/hid-ezkey.c
@@ -75,4 +75,5 @@ static struct hid_driver ez_driver = {
 };
 module_hid_driver(ez_driver);
 
+MODULE_DESCRIPTION("HID driver for some ezkey \"special\" devices");
 MODULE_LICENSE("GPL");
diff --git a/drivers/hid/hid-gaff.c b/drivers/hid/hid-gaff.c
index ecbd3995a4eb..c6db8b6cc8ee 100644
--- a/drivers/hid/hid-gaff.c
+++ b/drivers/hid/hid-gaff.c
@@ -169,4 +169,5 @@ static struct hid_driver ga_driver = {
 };
 module_hid_driver(ga_driver);
 
+MODULE_DESCRIPTION("Force feedback support for GreenAsia (Product ID 0x12) based devices");
 MODULE_LICENSE("GPL");
diff --git a/drivers/hid/hid-google-hammer.c b/drivers/hid/hid-google-hammer.c
index 25331695ae32..6e4ebc349e45 100644
--- a/drivers/hid/hid-google-hammer.c
+++ b/drivers/hid/hid-google-hammer.c
@@ -641,4 +641,5 @@ static void __exit hammer_exit(void)
 }
 module_exit(hammer_exit);
 
+MODULE_DESCRIPTION("HID driver for Google Hammer device.");
 MODULE_LICENSE("GPL");
diff --git a/drivers/hid/hid-google-stadiaff.c b/drivers/hid/hid-google-stadiaff.c
index 3731575562ab..6b38d2421d3d 100644
--- a/drivers/hid/hid-google-stadiaff.c
+++ b/drivers/hid/hid-google-stadiaff.c
@@ -155,4 +155,5 @@ static struct hid_driver stadia_driver = {
 };
 module_hid_driver(stadia_driver);
 
+MODULE_DESCRIPTION("Google Stadia controller rumble support.");
 MODULE_LICENSE("GPL");
diff --git a/drivers/hid/hid-gyration.c b/drivers/hid/hid-gyration.c
index b99a611479b3..6606b57abe83 100644
--- a/drivers/hid/hid-gyration.c
+++ b/drivers/hid/hid-gyration.c
@@ -87,4 +87,5 @@ static struct hid_driver gyration_driver = {
 };
 module_hid_driver(gyration_driver);
 
+MODULE_DESCRIPTION("HID driver for some gyration \"special\" devices");
 MODULE_LICENSE("GPL");
diff --git a/drivers/hid/hid-holtek-kbd.c b/drivers/hid/hid-holtek-kbd.c
index b346d68a06f5..1f014ac54e14 100644
--- a/drivers/hid/hid-holtek-kbd.c
+++ b/drivers/hid/hid-holtek-kbd.c
@@ -180,4 +180,5 @@ static struct hid_driver holtek_kbd_driver = {
 };
 module_hid_driver(holtek_kbd_driver);
 
+MODULE_DESCRIPTION("HID driver for Holtek keyboard");
 MODULE_LICENSE("GPL");
diff --git a/drivers/hid/hid-lg.c b/drivers/hid/hid-lg.c
index fb3f7258009c..cfe2f4f6e93f 100644
--- a/drivers/hid/hid-lg.c
+++ b/drivers/hid/hid-lg.c
@@ -942,4 +942,5 @@ module_param_named(lg4ff_no_autoswitch, lg4ff_no_autoswitch, int, S_IRUGO);
 MODULE_PARM_DESC(lg4ff_no_autoswitch, "Do not switch multimode wheels to their native mode automatically");
 #endif
 
+MODULE_DESCRIPTION("HID driver for some logitech \"special\" devices");
 MODULE_LICENSE("GPL");
diff --git a/drivers/hid/hid-magicmouse.c b/drivers/hid/hid-magicmouse.c
index a46ff4e8b99f..2eb285b97fc0 100644
--- a/drivers/hid/hid-magicmouse.c
+++ b/drivers/hid/hid-magicmouse.c
@@ -968,4 +968,5 @@ static struct hid_driver magicmouse_driver = {
 };
 module_hid_driver(magicmouse_driver);
 
+MODULE_DESCRIPTION("Apple \"Magic\" Wireless Mouse driver");
 MODULE_LICENSE("GPL");
diff --git a/drivers/hid/hid-maltron.c b/drivers/hid/hid-maltron.c
index dcd6db6a646e..caba0def938c 100644
--- a/drivers/hid/hid-maltron.c
+++ b/drivers/hid/hid-maltron.c
@@ -162,4 +162,5 @@ static struct hid_driver maltron_driver = {
 };
 module_hid_driver(maltron_driver);
 
+MODULE_DESCRIPTION("HID driver for Maltron L90");
 MODULE_LICENSE("GPL");
diff --git a/drivers/hid/hid-megaworld.c b/drivers/hid/hid-megaworld.c
index 599657863cb9..0476d7d16e7f 100644
--- a/drivers/hid/hid-megaworld.c
+++ b/drivers/hid/hid-megaworld.c
@@ -122,4 +122,5 @@ static struct hid_driver mwctrl_driver = {
 };
 module_hid_driver(mwctrl_driver);
 
+MODULE_DESCRIPTION("Vibration support for Mega World controllers");
 MODULE_LICENSE("GPL");
diff --git a/drivers/hid/hid-mf.c b/drivers/hid/hid-mf.c
index 92d7ecd41a78..49a4052a1496 100644
--- a/drivers/hid/hid-mf.c
+++ b/drivers/hid/hid-mf.c
@@ -166,4 +166,5 @@ static struct hid_driver mf_driver = {
 };
 module_hid_driver(mf_driver);
 
+MODULE_DESCRIPTION("Force feedback support for Mayflash game controller adapters.");
 MODULE_LICENSE("GPL");
diff --git a/drivers/hid/hid-microsoft.c b/drivers/hid/hid-microsoft.c
index 9345e2bfd56e..4cf0fcddb379 100644
--- a/drivers/hid/hid-microsoft.c
+++ b/drivers/hid/hid-microsoft.c
@@ -475,4 +475,5 @@ static struct hid_driver ms_driver = {
 };
 module_hid_driver(ms_driver);
 
+MODULE_DESCRIPTION("HID driver for some microsoft \"special\" devices");
 MODULE_LICENSE("GPL");
diff --git a/drivers/hid/hid-monterey.c b/drivers/hid/hid-monterey.c
index c63f9f1e61b8..989681f73d77 100644
--- a/drivers/hid/hid-monterey.c
+++ b/drivers/hid/hid-monterey.c
@@ -62,4 +62,5 @@ static struct hid_driver mr_driver = {
 };
 module_hid_driver(mr_driver);
 
+MODULE_DESCRIPTION("HID driver for some monterey \"special\" devices");
 MODULE_LICENSE("GPL");
diff --git a/drivers/hid/hid-ntrig.c b/drivers/hid/hid-ntrig.c
index b5d26f03fe6b..2738ce947434 100644
--- a/drivers/hid/hid-ntrig.c
+++ b/drivers/hid/hid-ntrig.c
@@ -1029,4 +1029,5 @@ static struct hid_driver ntrig_driver = {
 };
 module_hid_driver(ntrig_driver);
 
+MODULE_DESCRIPTION("HID driver for N-Trig touchscreens");
 MODULE_LICENSE("GPL");
diff --git a/drivers/hid/hid-ortek.c b/drivers/hid/hid-ortek.c
index 9a4770d79c64..99e3b06a8331 100644
--- a/drivers/hid/hid-ortek.c
+++ b/drivers/hid/hid-ortek.c
@@ -51,4 +51,5 @@ static struct hid_driver ortek_driver = {
 };
 module_hid_driver(ortek_driver);
 
+MODULE_DESCRIPTION("HID driver for Ortek PKB-1700/WKB-2000/Skycable wireless keyboard and mouse trackpad");
 MODULE_LICENSE("GPL");
diff --git a/drivers/hid/hid-petalynx.c b/drivers/hid/hid-petalynx.c
index ea0af9f7ad90..5e47634bb07d 100644
--- a/drivers/hid/hid-petalynx.c
+++ b/drivers/hid/hid-petalynx.c
@@ -102,4 +102,5 @@ static struct hid_driver pl_driver = {
 };
 module_hid_driver(pl_driver);
 
+MODULE_DESCRIPTION("HID driver for some petalynx \"special\" devices");
 MODULE_LICENSE("GPL");
diff --git a/drivers/hid/hid-pl.c b/drivers/hid/hid-pl.c
index 93fb07ec3180..3c8827081dea 100644
--- a/drivers/hid/hid-pl.c
+++ b/drivers/hid/hid-pl.c
@@ -219,4 +219,5 @@ static struct hid_driver pl_driver = {
 };
 module_hid_driver(pl_driver);
 
+MODULE_DESCRIPTION("Force feedback support for PantherLord/GreenAsia based devices");
 MODULE_LICENSE("GPL");
diff --git a/drivers/hid/hid-primax.c b/drivers/hid/hid-primax.c
index 1e6413d07cae..e44d79dff8de 100644
--- a/drivers/hid/hid-primax.c
+++ b/drivers/hid/hid-primax.c
@@ -70,4 +70,5 @@ static struct hid_driver px_driver = {
 module_hid_driver(px_driver);
 
 MODULE_AUTHOR("Terry Lambert <tlambert@google.com>");
+MODULE_DESCRIPTION("HID driver for primax and similar keyboards with in-band modifiers");
 MODULE_LICENSE("GPL");
diff --git a/drivers/hid/hid-prodikeys.c b/drivers/hid/hid-prodikeys.c
index a593ed62c969..757361593e52 100644
--- a/drivers/hid/hid-prodikeys.c
+++ b/drivers/hid/hid-prodikeys.c
@@ -862,4 +862,5 @@ static struct hid_driver pk_driver = {
 };
 module_hid_driver(pk_driver);
 
+MODULE_DESCRIPTION("HID driver for the Prodikeys PC-MIDI Keyboard");
 MODULE_LICENSE("GPL");
diff --git a/drivers/hid/hid-razer.c b/drivers/hid/hid-razer.c
index 740df148b0ef..7f48258c61f7 100644
--- a/drivers/hid/hid-razer.c
+++ b/drivers/hid/hid-razer.c
@@ -122,4 +122,5 @@ static struct hid_driver razer_driver = {
 module_hid_driver(razer_driver);
 
 MODULE_AUTHOR("Jelle van der Waa <jvanderwaa@redhat.com>");
+MODULE_DESCRIPTION("HID driver for gaming keys on Razer Blackwidow gaming keyboards");
 MODULE_LICENSE("GPL");
diff --git a/drivers/hid/hid-redragon.c b/drivers/hid/hid-redragon.c
index 73c9d4c4fa34..07d803513f27 100644
--- a/drivers/hid/hid-redragon.c
+++ b/drivers/hid/hid-redragon.c
@@ -59,4 +59,5 @@ static struct hid_driver redragon_driver = {
 
 module_hid_driver(redragon_driver);
 
+MODULE_DESCRIPTION("HID driver for Redragon keyboards");
 MODULE_LICENSE("GPL");
diff --git a/drivers/hid/hid-retrode.c b/drivers/hid/hid-retrode.c
index 6a08e25aa296..7997627fdccc 100644
--- a/drivers/hid/hid-retrode.c
+++ b/drivers/hid/hid-retrode.c
@@ -94,4 +94,5 @@ static struct hid_driver retrode_driver = {
 
 module_hid_driver(retrode_driver);
 
+MODULE_DESCRIPTION("HID driver for Retrode 2 controller adapter and plug-in extensions");
 MODULE_LICENSE("GPL");
diff --git a/drivers/hid/hid-saitek.c b/drivers/hid/hid-saitek.c
index b84e975977c4..85ac8def368f 100644
--- a/drivers/hid/hid-saitek.c
+++ b/drivers/hid/hid-saitek.c
@@ -204,4 +204,5 @@ static struct hid_driver saitek_driver = {
 };
 module_hid_driver(saitek_driver);
 
+MODULE_DESCRIPTION("HID driver for Saitek devices.");
 MODULE_LICENSE("GPL");
diff --git a/drivers/hid/hid-samsung.c b/drivers/hid/hid-samsung.c
index 08fb25b8459a..d4e27142245c 100644
--- a/drivers/hid/hid-samsung.c
+++ b/drivers/hid/hid-samsung.c
@@ -561,4 +561,5 @@ static struct hid_driver samsung_driver = {
 };
 module_hid_driver(samsung_driver);
 
+MODULE_DESCRIPTION("HID driver for some samsung \"special\" devices");
 MODULE_LICENSE("GPL");
diff --git a/drivers/hid/hid-semitek.c b/drivers/hid/hid-semitek.c
index ba6607d5e051..710766f6839d 100644
--- a/drivers/hid/hid-semitek.c
+++ b/drivers/hid/hid-semitek.c
@@ -37,4 +37,5 @@ static struct hid_driver semitek_driver = {
 };
 module_hid_driver(semitek_driver);
 
+MODULE_DESCRIPTION("HID driver for Semitek keyboards");
 MODULE_LICENSE("GPL");
diff --git a/drivers/hid/hid-sjoy.c b/drivers/hid/hid-sjoy.c
index 49971be7c3ff..d3a777f52a3f 100644
--- a/drivers/hid/hid-sjoy.c
+++ b/drivers/hid/hid-sjoy.c
@@ -168,6 +168,7 @@ static struct hid_driver sjoy_driver = {
 };
 module_hid_driver(sjoy_driver);
 
+MODULE_DESCRIPTION("Force feedback support for SmartJoy PLUS PS2->USB adapter");
 MODULE_LICENSE("GPL");
 MODULE_AUTHOR("Jussi Kivilinna");
 
diff --git a/drivers/hid/hid-sony.c b/drivers/hid/hid-sony.c
index 5a07a91a89ae..eac75f98f08a 100644
--- a/drivers/hid/hid-sony.c
+++ b/drivers/hid/hid-sony.c
@@ -2308,4 +2308,5 @@ static void __exit sony_exit(void)
 module_init(sony_init);
 module_exit(sony_exit);
 
+MODULE_DESCRIPTION("HID driver for Sony / PS2 / PS3 / PS4 BD devices");
 MODULE_LICENSE("GPL");
diff --git a/drivers/hid/hid-speedlink.c b/drivers/hid/hid-speedlink.c
index 9e75f1aae0ca..22ee078c42c6 100644
--- a/drivers/hid/hid-speedlink.c
+++ b/drivers/hid/hid-speedlink.c
@@ -75,4 +75,5 @@ static struct hid_driver speedlink_driver = {
 };
 module_hid_driver(speedlink_driver);
 
+MODULE_DESCRIPTION("HID driver for Speedlink Vicious and Divine Cezanne (USB mouse)");
 MODULE_LICENSE("GPL");
diff --git a/drivers/hid/hid-steam.c b/drivers/hid/hid-steam.c
index f166188c21ec..bfba204fc45e 100644
--- a/drivers/hid/hid-steam.c
+++ b/drivers/hid/hid-steam.c
@@ -45,6 +45,7 @@
 #include <linux/power_supply.h>
 #include "hid-ids.h"
 
+MODULE_DESCRIPTION("HID driver for Valve Steam Controller");
 MODULE_LICENSE("GPL");
 MODULE_AUTHOR("Rodrigo Rivas Costa <rodrigorivascosta@gmail.com>");
 
diff --git a/drivers/hid/hid-steelseries.c b/drivers/hid/hid-steelseries.c
index b3edadf42d6d..2154e14f55f1 100644
--- a/drivers/hid/hid-steelseries.c
+++ b/drivers/hid/hid-steelseries.c
@@ -662,6 +662,7 @@ static struct hid_driver steelseries_driver = {
 };
 
 module_hid_driver(steelseries_driver);
+MODULE_DESCRIPTION("HID driver for Steelseries devices");
 MODULE_LICENSE("GPL");
 MODULE_AUTHOR("Bastien Nocera <hadess@hadess.net>");
 MODULE_AUTHOR("Simon Wood <simon@mungewell.org>");
diff --git a/drivers/hid/hid-sunplus.c b/drivers/hid/hid-sunplus.c
index aa2855c2ed4e..f32e60d4420f 100644
--- a/drivers/hid/hid-sunplus.c
+++ b/drivers/hid/hid-sunplus.c
@@ -62,4 +62,5 @@ static struct hid_driver sp_driver = {
 };
 module_hid_driver(sp_driver);
 
+MODULE_DESCRIPTION("HID driver for some sunplus \"special\" devices");
 MODULE_LICENSE("GPL");
diff --git a/drivers/hid/hid-tivo.c b/drivers/hid/hid-tivo.c
index 68eb08b63945..827bf67abeb9 100644
--- a/drivers/hid/hid-tivo.c
+++ b/drivers/hid/hid-tivo.c
@@ -73,5 +73,6 @@ static struct hid_driver tivo_driver = {
 };
 module_hid_driver(tivo_driver);
 
+MODULE_DESCRIPTION("HID driver for TiVo Slide Bluetooth remote");
 MODULE_LICENSE("GPL");
 MODULE_AUTHOR("Jarod Wilson <jarod@redhat.com>");
diff --git a/drivers/hid/hid-tmff.c b/drivers/hid/hid-tmff.c
index 4040cd98dafe..fcd859aa3a8c 100644
--- a/drivers/hid/hid-tmff.c
+++ b/drivers/hid/hid-tmff.c
@@ -265,4 +265,5 @@ static struct hid_driver tm_driver = {
 };
 module_hid_driver(tm_driver);
 
+MODULE_DESCRIPTION("Force feedback support for various HID compliant devices by ThrustMaster");
 MODULE_LICENSE("GPL");
diff --git a/drivers/hid/hid-topseed.c b/drivers/hid/hid-topseed.c
index 2125327b8de1..645e36cd83a6 100644
--- a/drivers/hid/hid-topseed.c
+++ b/drivers/hid/hid-topseed.c
@@ -78,4 +78,5 @@ static struct hid_driver ts_driver = {
 };
 module_hid_driver(ts_driver);
 
+MODULE_DESCRIPTION("HID driver for TopSeed Cyberlink remote");
 MODULE_LICENSE("GPL");
diff --git a/drivers/hid/hid-twinhan.c b/drivers/hid/hid-twinhan.c
index 14af794146c0..0ef5194085b2 100644
--- a/drivers/hid/hid-twinhan.c
+++ b/drivers/hid/hid-twinhan.c
@@ -131,4 +131,5 @@ static struct hid_driver twinhan_driver = {
 };
 module_hid_driver(twinhan_driver);
 
+MODULE_DESCRIPTION("HID driver for TwinHan IR remote control");
 MODULE_LICENSE("GPL");
diff --git a/drivers/hid/hid-uclogic-core.c b/drivers/hid/hid-uclogic-core.c
index ad74cbc9a0aa..02520824ce77 100644
--- a/drivers/hid/hid-uclogic-core.c
+++ b/drivers/hid/hid-uclogic-core.c
@@ -567,6 +567,7 @@ module_hid_driver(uclogic_driver);
 
 MODULE_AUTHOR("Martin Rusko");
 MODULE_AUTHOR("Nikolai Kondrashov");
+MODULE_DESCRIPTION("HID driver for UC-Logic devices not fully compliant with HID standard");
 MODULE_LICENSE("GPL");
 
 #ifdef CONFIG_HID_KUNIT_TEST
diff --git a/drivers/hid/hid-viewsonic.c b/drivers/hid/hid-viewsonic.c
index 8024b1d370e2..668c2adb77b6 100644
--- a/drivers/hid/hid-viewsonic.c
+++ b/drivers/hid/hid-viewsonic.c
@@ -102,4 +102,5 @@ static struct hid_driver viewsonic_driver = {
 };
 module_hid_driver(viewsonic_driver);
 
+MODULE_DESCRIPTION("HID driver for ViewSonic devices not fully compliant with HID standard");
 MODULE_LICENSE("GPL");
diff --git a/drivers/hid/hid-vivaldi-common.c b/drivers/hid/hid-vivaldi-common.c
index b0af2be94895..bf734055d4b6 100644
--- a/drivers/hid/hid-vivaldi-common.c
+++ b/drivers/hid/hid-vivaldi-common.c
@@ -138,4 +138,5 @@ const struct attribute_group *vivaldi_attribute_groups[] = {
 };
 EXPORT_SYMBOL_GPL(vivaldi_attribute_groups);
 
+MODULE_DESCRIPTION("Helpers for ChromeOS HID Vivaldi keyboards");
 MODULE_LICENSE("GPL");
diff --git a/drivers/hid/hid-waltop.c b/drivers/hid/hid-waltop.c
index bc355b1a5b30..1e590c61eef5 100644
--- a/drivers/hid/hid-waltop.c
+++ b/drivers/hid/hid-waltop.c
@@ -742,4 +742,5 @@ static struct hid_driver waltop_driver = {
 };
 module_hid_driver(waltop_driver);
 
+MODULE_DESCRIPTION("HID driver for Waltop devices not fully compliant with HID standard");
 MODULE_LICENSE("GPL");
diff --git a/drivers/hid/hid-xinmo.c b/drivers/hid/hid-xinmo.c
index 5c2860a9d8c9..66b8bfb6e647 100644
--- a/drivers/hid/hid-xinmo.c
+++ b/drivers/hid/hid-xinmo.c
@@ -56,4 +56,5 @@ static struct hid_driver xinmo_driver = {
 };
 
 module_hid_driver(xinmo_driver);
+MODULE_DESCRIPTION("HID driver for Xin-Mo devices");
 MODULE_LICENSE("GPL");
diff --git a/drivers/hid/hid-zpff.c b/drivers/hid/hid-zpff.c
index 3abaca045869..aacf7f137b18 100644
--- a/drivers/hid/hid-zpff.c
+++ b/drivers/hid/hid-zpff.c
@@ -138,4 +138,5 @@ static struct hid_driver zp_driver = {
 };
 module_hid_driver(zp_driver);
 
+MODULE_DESCRIPTION("Force feedback support for Zeroplus based devices");
 MODULE_LICENSE("GPL");
diff --git a/drivers/hid/hid-zydacron.c b/drivers/hid/hid-zydacron.c
index 0d003caee113..998a3db19c1f 100644
--- a/drivers/hid/hid-zydacron.c
+++ b/drivers/hid/hid-zydacron.c
@@ -205,4 +205,5 @@ static struct hid_driver zc_driver = {
 };
 module_hid_driver(zc_driver);
 
+MODULE_DESCRIPTION("HID driver for zydacron remote control");
 MODULE_LICENSE("GPL");

---
base-commit: a693b9c95abd4947c2d06e05733de5d470ab6586
change-id: 20240604-md-hid-misc-5178ef6ebaea


