Return-Path: <linux-input+bounces-6956-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E240398BE13
	for <lists+linux-input@lfdr.de>; Tue,  1 Oct 2024 15:38:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 286E2B20FA9
	for <lists+linux-input@lfdr.de>; Tue,  1 Oct 2024 13:38:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BF6331C4606;
	Tue,  1 Oct 2024 13:38:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=analog.com header.i=@analog.com header.b="bo8Xtj6K"
X-Original-To: linux-input@vger.kernel.org
Received: from mx0b-00128a01.pphosted.com (mx0a-00128a01.pphosted.com [148.163.135.77])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D46A1C57BF;
	Tue,  1 Oct 2024 13:38:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.163.135.77
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727789882; cv=none; b=SohdpU/aF4LpcoaHifwGM+pyDFNPo2JwI/zOB3cq3RF2fomcl8vMv8JHO01p7SC5rC/p1LJJcquuXFtCaM8cYixvGIZyjtNFFcNvCdvQ9Y9AXdChJLbkXG4Mbu3UViNVESLzz7TNU1pJ+wQfYQsSO70VyVRYwXHMKBFgUW62if0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727789882; c=relaxed/simple;
	bh=ZKHU50FEl5GHIlR9Vg5u4Wb0LQ6++Y8kJtxCReQ3jLE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:References:
	 In-Reply-To:To:CC; b=c+dcktS7Ir4f6IJ6zH9Ch+2+dPLAA/uq6RZ2rVrZW6nLP37hZmhflHjjQvkE6CLjJRsgxUdW8xwGii0DNlsjFsKoo3WUfTmzkwGAq/t1506RMzA1n2AnU+JGDZ0/iMfRjCmG4g+yoZeKJSe1CoQl+NlpLNBpzMFsakq/6Aetl4E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=analog.com; spf=pass smtp.mailfrom=analog.com; dkim=pass (2048-bit key) header.d=analog.com header.i=@analog.com header.b=bo8Xtj6K; arc=none smtp.client-ip=148.163.135.77
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=analog.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=analog.com
Received: from pps.filterd (m0375855.ppops.net [127.0.0.1])
	by mx0b-00128a01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 491C0vIv017046;
	Tue, 1 Oct 2024 09:37:54 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=analog.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=DKIM; bh=f3OGM
	0XzoPIiZ2xoSaTAIB56PUqc7VXbuvR5s3mr2Kk=; b=bo8Xtj6K1HXPDEHulbECY
	c8BoVFL8pf1dzQihrIDmz1i7tKmApWb+lrSHFBirzMHnYu2wnfHiElVfYr8WqNTa
	aLzJdhpd/bfArX5rVHHdBZuMz7YnJKY0E0YAqYHDy0MQ+8Hv+gcMBzo1n+v1eQvi
	QvwKFXmzn0sNRKR7dnoP7z0VpDeyw0YuSsVEVSOhGG0ysw17+O0EmhYSz15KlNoF
	bvPs/ptoyxiOTPUmUH/v8r3OoU16XmGJPCimgKT2euvLgh1v6CSfmubhxEDKuA2A
	1rt4rCXa2xugOxjruplrTE8Dg9zQFPUl42VPTOB85ZtumzWNB/5ImfU+zVaMpv5N
	Q==
Received: from nwd2mta4.analog.com ([137.71.173.58])
	by mx0b-00128a01.pphosted.com (PPS) with ESMTPS id 420c0dshr1-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 01 Oct 2024 09:37:54 -0400 (EDT)
Received: from ASHBMBX8.ad.analog.com (ASHBMBX8.ad.analog.com [10.64.17.5])
	by nwd2mta4.analog.com (8.14.7/8.14.7) with ESMTP id 491Dbr31054568
	(version=TLSv1/SSLv3 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
	Tue, 1 Oct 2024 09:37:53 -0400
Received: from ASHBMBX8.ad.analog.com (10.64.17.5) by ASHBMBX8.ad.analog.com
 (10.64.17.5) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.14; Tue, 1 Oct 2024
 09:37:52 -0400
Received: from zeus.spd.analog.com (10.66.68.11) by ashbmbx8.ad.analog.com
 (10.64.17.5) with Microsoft SMTP Server id 15.2.986.14 via Frontend
 Transport; Tue, 1 Oct 2024 09:37:52 -0400
Received: from [127.0.0.1] ([10.44.3.60])
	by zeus.spd.analog.com (8.15.1/8.15.1) with ESMTP id 491DbTeT022143;
	Tue, 1 Oct 2024 09:37:47 -0400
From: Nuno Sa <nuno.sa@analog.com>
Date: Tue, 1 Oct 2024 15:41:41 +0200
Subject: [PATCH 10/13] Input: adp5589-keys: fix coding style
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20241001-b4-dev-adp5589-fw-conversion-v1-10-fca0149dfc47@analog.com>
References: <20241001-b4-dev-adp5589-fw-conversion-v1-0-fca0149dfc47@analog.com>
In-Reply-To: <20241001-b4-dev-adp5589-fw-conversion-v1-0-fca0149dfc47@analog.com>
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Mike Frysinger
	<vapier@gentoo.org>, Dmitry Torokhov <dtor@mail.ru>,
        Rob Herring
	<robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
	<conor+dt@kernel.org>
CC: <linux-input@vger.kernel.org>, <devicetree@vger.kernel.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1727790102; l=2659;
 i=nuno.sa@analog.com; s=20231116; h=from:subject:message-id;
 bh=ZKHU50FEl5GHIlR9Vg5u4Wb0LQ6++Y8kJtxCReQ3jLE=;
 b=4nFUuh/N0jkn+xO/oN75CJNP0t2B3clOmV8Ehday7STzGJ2DCj4UEX1rZKGl7vmQWAoQ+raCJ
 PFsq+VY9py5DQ6J7zpezjvSCRz7Umil9Cx2c9rnfFl61n9VggrK3n7T
X-Developer-Key: i=nuno.sa@analog.com; a=ed25519;
 pk=3NQwYA013OUYZsmDFBf8rmyyr5iQlxV/9H4/Df83o1E=
X-ADIRuleOP-NewSCL: Rule Triggered
X-Proofpoint-GUID: DZeRT_WCUtHZdJ945umadACaHtpuZgVH
X-Proofpoint-ORIG-GUID: DZeRT_WCUtHZdJ945umadACaHtpuZgVH
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 spamscore=0 malwarescore=0
 bulkscore=0 impostorscore=0 mlxscore=0 priorityscore=1501
 lowpriorityscore=0 adultscore=0 clxscore=1015 suspectscore=0 phishscore=0
 mlxlogscore=999 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2408220000 definitions=main-2410010087

Just some code cleanup regarding coding style.

Signed-off-by: Nuno Sa <nuno.sa@analog.com>
---
 drivers/input/keyboard/adp5589-keys.c | 17 +++++++++--------
 1 file changed, 9 insertions(+), 8 deletions(-)

diff --git a/drivers/input/keyboard/adp5589-keys.c b/drivers/input/keyboard/adp5589-keys.c
index 103a290c5f9f5407253960bbc44566b115789dfc..741353bf19ca8725d6697507c1d2183a019972a4 100644
--- a/drivers/input/keyboard/adp5589-keys.c
+++ b/drivers/input/keyboard/adp5589-keys.c
@@ -244,9 +244,9 @@ struct adp_constants {
 	u8 max_col_num;
 	u8 col_shift;
 	u8 c4_extend_cfg;
-	u8 (*bank) (u8 offset);
-	u8 (*bit) (u8 offset);
-	u8 (*reg) (u8 reg);
+	u8 (*bank)(u8 offset);
+	u8 (*bit)(u8 offset);
+	u8 (*reg)(u8 reg);
 };
 
 struct adp5589_info {
@@ -274,7 +274,7 @@ struct adp5589_kpad {
 	u32 reset2_keys[2];
 	u32 nkeys_reset2;
 	unsigned short gpimapsize;
-	unsigned extend_cfg;
+	unsigned int extend_cfg;
 	unsigned char gpiomap[ADP5589_MAXGPIO];
 	struct gpio_chip gc;
 	struct mutex gpio_lock;	/* Protect cached dir, dat_out */
@@ -416,7 +416,7 @@ static int adp5589_write(struct i2c_client *client, u8 reg, u8 val)
 	return i2c_smbus_write_byte_data(client, reg, val);
 }
 
-static int adp5589_gpio_get_value(struct gpio_chip *chip, unsigned off)
+static int adp5589_gpio_get_value(struct gpio_chip *chip, unsigned int off)
 {
 	struct adp5589_kpad *kpad = gpiochip_get_data(chip);
 	unsigned int bank = kpad->info->var->bank(kpad->gpiomap[off]);
@@ -438,7 +438,7 @@ static int adp5589_gpio_get_value(struct gpio_chip *chip, unsigned off)
 }
 
 static void adp5589_gpio_set_value(struct gpio_chip *chip,
-				   unsigned off, int val)
+				   unsigned int off, int val)
 {
 	struct adp5589_kpad *kpad = gpiochip_get_data(chip);
 	unsigned int bank = kpad->info->var->bank(kpad->gpiomap[off]);
@@ -455,7 +455,8 @@ static void adp5589_gpio_set_value(struct gpio_chip *chip,
 		      bank, kpad->dat_out[bank]);
 }
 
-static int adp5589_gpio_direction_input(struct gpio_chip *chip, unsigned off)
+static int adp5589_gpio_direction_input(struct gpio_chip *chip,
+					unsigned int off)
 {
 	struct adp5589_kpad *kpad = gpiochip_get_data(chip);
 	unsigned int bank = kpad->info->var->bank(kpad->gpiomap[off]);
@@ -470,7 +471,7 @@ static int adp5589_gpio_direction_input(struct gpio_chip *chip, unsigned off)
 }
 
 static int adp5589_gpio_direction_output(struct gpio_chip *chip,
-					 unsigned off, int val)
+					 unsigned int off, int val)
 {
 	struct adp5589_kpad *kpad = gpiochip_get_data(chip);
 	unsigned int bank = kpad->info->var->bank(kpad->gpiomap[off]);

-- 
2.46.1


