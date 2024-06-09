Return-Path: <linux-input+bounces-4270-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id A507990180D
	for <lists+linux-input@lfdr.de>; Sun,  9 Jun 2024 22:03:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 042A9B20DCB
	for <lists+linux-input@lfdr.de>; Sun,  9 Jun 2024 20:03:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E634E1DDCE;
	Sun,  9 Jun 2024 20:03:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="aT8yDBul"
X-Original-To: linux-input@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 190054D8AA;
	Sun,  9 Jun 2024 20:03:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717963417; cv=none; b=PLrpJXWgvRW57Svn0zLQNBsEeYblDaLMf62YRmVPXL0zPbH1tnxKCpKF7OC3hclA+glXJzTjWfnbm/w9/1olavUc2v5V4MoLjCr9wySgeFI7iFQs55C1yb8P9X52CfpURD6+39A7qTq5R6oW9enIul80a6MB57g5OZTxjlkhr40=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717963417; c=relaxed/simple;
	bh=twnsg9bhBitdSy1JcCEV/bz7XV7JxHzCUyv/HsnsO/k=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:To:CC; b=jtjKQnpniQ2DNh4q/qaPd0gV5XWZ47+SAcvHosVF//dbZqGyK+c/GP4qrmQ4u+CJn93q0LGm2kRXEZMMQA/NmWFEgxPVM4+zQESgONbf+XnCkcMv85OSpODY3pVmsDR7qWmK+lBKtW0zCpqDq8VCga9A2c4nvdM2SxhxRSdFmfU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=aT8yDBul; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 459JE7I3022942;
	Sun, 9 Jun 2024 20:03:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=r5w4+o1VCtp2zxKxfuee6l
	TzhE4tSQR1uWS+Oy/psRQ=; b=aT8yDBulhxjYsIjxt3/FCNhJDCd8ad/R7fkdUr
	YAaOpRjFQJgSs453jn/TQ9JUX7dlzcGnkb6smLRVkV34aq7LT7dwf8DVQQciI1N3
	e4ie7tcRlk5AM+UgsRCVnrMzbYeB9ljbxyqwYMqQik2bfsEU1VOosyVKf6zmXZ4r
	zNUgmyiH15c05gHuGnkpnc5GAP+PGuNBY3bKSL4P4LhhmW0kmrtdq/axoliSyWAR
	KDfQ5NeWJrVODPMdVAcm6zdyA+qfSu2HG6NkTQ982sFMRENOQZWwbUmlCaEgFMVM
	MSNbDS4hwSPHtPw+tLnxQcAEwe+w1tZfviVCRNckuQeazDxw==
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3yme8rtcw1-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sun, 09 Jun 2024 20:03:33 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA03.qualcomm.com (8.17.1.19/8.17.1.19) with ESMTPS id 459K3W5w026319
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sun, 9 Jun 2024 20:03:32 GMT
Received: from [169.254.0.1] (10.49.16.6) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Sun, 9 Jun 2024
 13:03:31 -0700
From: Jeff Johnson <quic_jjohnson@quicinc.com>
Date: Sun, 9 Jun 2024 13:03:30 -0700
Subject: [PATCH] Input: add missing MODULE_DESCRIPTION() macros
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20240609-md-drivers-input-v1-1-a2f394e0f9d8@quicinc.com>
X-B4-Tracking: v=1; b=H4sIAJEKZmYC/x3MQQrCQAxA0auUrA2MU7HUq4iLzEy0ARtL0pZC6
 d0dXb7F/zs4m7DDrdnBeBWXj1acTw3kgfTFKKUaYoiXcA09jgWLycrmKDotMyZm6ro+50gt1Gw
 yfsr2X94f1YmcMRlpHn6jt+iy4Ug+s8FxfAHeGgYKgQAAAA==
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Linus Walleij
	<linus.walleij@linaro.org>
CC: <linux-input@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <kernel-janitors@vger.kernel.org>,
        Jeff Johnson <quic_jjohnson@quicinc.com>
X-Mailer: b4 0.13.0
X-ClientProxiedBy: nalasex01b.na.qualcomm.com (10.47.209.197) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: ooB0b9bYHP_S9iNm0VvZexN6QbRwOUJ7
X-Proofpoint-GUID: ooB0b9bYHP_S9iNm0VvZexN6QbRwOUJ7
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-06-09_15,2024-06-06_02,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1011 adultscore=0
 suspectscore=0 bulkscore=0 phishscore=0 spamscore=0 lowpriorityscore=0
 priorityscore=1501 mlxlogscore=999 impostorscore=0 mlxscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2405170001 definitions=main-2406090157

On x86, make allmodconfig && make W=1 C=1 reports:
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/input/touchscreen/cyttsp_i2c_common.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/input/misc/soc_button_array.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/input/matrix-keymap.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/input/vivaldi-fmap.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/input/tests/input_test.o

Add the missing invocation of the MODULE_DESCRIPTION() macro to all
files which have a MODULE_LICENSE().

This includes drivers/input/misc/sgi_btns.c which, although it did not
produce a warning with the x86 allmodconfig configuration, may cause
this warning with other configurations when either CONFIG_SGI_IP22 or
CONFIG_SGI_IP32 is enabled.

Signed-off-by: Jeff Johnson <quic_jjohnson@quicinc.com>
---
 drivers/input/matrix-keymap.c                 | 1 +
 drivers/input/misc/sgi_btns.c                 | 1 +
 drivers/input/misc/soc_button_array.c         | 1 +
 drivers/input/tests/input_test.c              | 1 +
 drivers/input/touchscreen/cyttsp_i2c_common.c | 1 +
 drivers/input/vivaldi-fmap.c                  | 1 +
 6 files changed, 6 insertions(+)

diff --git a/drivers/input/matrix-keymap.c b/drivers/input/matrix-keymap.c
index 4fa53423f56c..5d93043bad8e 100644
--- a/drivers/input/matrix-keymap.c
+++ b/drivers/input/matrix-keymap.c
@@ -199,4 +199,5 @@ int matrix_keypad_build_keymap(const struct matrix_keymap_data *keymap_data,
 }
 EXPORT_SYMBOL(matrix_keypad_build_keymap);
 
+MODULE_DESCRIPTION("Helpers for matrix keyboard bindings");
 MODULE_LICENSE("GPL");
diff --git a/drivers/input/misc/sgi_btns.c b/drivers/input/misc/sgi_btns.c
index 0657d785b3cc..39c2882b8e1a 100644
--- a/drivers/input/misc/sgi_btns.c
+++ b/drivers/input/misc/sgi_btns.c
@@ -128,4 +128,5 @@ static struct platform_driver sgi_buttons_driver = {
 };
 module_platform_driver(sgi_buttons_driver);
 
+MODULE_DESCRIPTION("SGI Indy/O2 volume button interface driver");
 MODULE_LICENSE("GPL");
diff --git a/drivers/input/misc/soc_button_array.c b/drivers/input/misc/soc_button_array.c
index f6d060377d18..5c5d407fe965 100644
--- a/drivers/input/misc/soc_button_array.c
+++ b/drivers/input/misc/soc_button_array.c
@@ -620,4 +620,5 @@ static struct platform_driver soc_button_driver = {
 };
 module_platform_driver(soc_button_driver);
 
+MODULE_DESCRIPTION("Windows-compatible SoC Button Array driver");
 MODULE_LICENSE("GPL");
diff --git a/drivers/input/tests/input_test.c b/drivers/input/tests/input_test.c
index 2fa5b725ae0a..e11cf4bbead9 100644
--- a/drivers/input/tests/input_test.c
+++ b/drivers/input/tests/input_test.c
@@ -179,4 +179,5 @@ static struct kunit_suite input_test_suite = {
 kunit_test_suite(input_test_suite);
 
 MODULE_AUTHOR("Javier Martinez Canillas <javierm@redhat.com>");
+MODULE_DESCRIPTION("KUnit test for the input core");
 MODULE_LICENSE("GPL");
diff --git a/drivers/input/touchscreen/cyttsp_i2c_common.c b/drivers/input/touchscreen/cyttsp_i2c_common.c
index 1f0b6d6f48e2..7e752fb9fad7 100644
--- a/drivers/input/touchscreen/cyttsp_i2c_common.c
+++ b/drivers/input/touchscreen/cyttsp_i2c_common.c
@@ -81,5 +81,6 @@ int cyttsp_i2c_write_block_data(struct device *dev, u8 *xfer_buf,
 EXPORT_SYMBOL_GPL(cyttsp_i2c_write_block_data);
 
 
+MODULE_DESCRIPTION("Cypress TrueTouch(TM) Standard Product (TTSP) I2C touchscreen driver");
 MODULE_LICENSE("GPL");
 MODULE_AUTHOR("Cypress");
diff --git a/drivers/input/vivaldi-fmap.c b/drivers/input/vivaldi-fmap.c
index 0d29ec014e2f..978949eba9eb 100644
--- a/drivers/input/vivaldi-fmap.c
+++ b/drivers/input/vivaldi-fmap.c
@@ -36,4 +36,5 @@ ssize_t vivaldi_function_row_physmap_show(const struct vivaldi_data *data,
 }
 EXPORT_SYMBOL_GPL(vivaldi_function_row_physmap_show);
 
+MODULE_DESCRIPTION("Helpers for ChromeOS Vivaldi keyboard function row mapping");
 MODULE_LICENSE("GPL");

---
base-commit: 19ca0d8a433ff37018f9429f7e7739e9f3d3d2b4
change-id: 20240609-md-drivers-input-beea779cc2a3


