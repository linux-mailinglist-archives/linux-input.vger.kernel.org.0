Return-Path: <linux-input+bounces-6957-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 96D5D98BE11
	for <lists+linux-input@lfdr.de>; Tue,  1 Oct 2024 15:38:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id BB8E51C2149D
	for <lists+linux-input@lfdr.de>; Tue,  1 Oct 2024 13:38:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2F6CF1C6898;
	Tue,  1 Oct 2024 13:38:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=analog.com header.i=@analog.com header.b="T6NDV5zV"
X-Original-To: linux-input@vger.kernel.org
Received: from mx0a-00128a01.pphosted.com (mx0a-00128a01.pphosted.com [148.163.135.77])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D4C71C6883;
	Tue,  1 Oct 2024 13:38:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.163.135.77
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727789883; cv=none; b=TNT3Xp6pKkzYZpVPXXGGnlTFJI2jpBNmfRfq8XNO5flDIgsiTrauy2lISXi8WglkSKw5HR4JilUhrFG1Pd0CEpw+/930zYF3SWHnW6rBiBEpiZ0eyaFc1ZdyTYq7dcqDHXP1kAIkAGwnDKUPW3Yav47zr7HxKgBy9YvqSQmdQgc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727789883; c=relaxed/simple;
	bh=6N7bOwqUoDVqs9Xb1Zn+oGh+IAfTyaS4Pl3ehfwzzDs=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:References:
	 In-Reply-To:To:CC; b=bq8QiPytw6f+gEYEk+Dh3ENRTuToOn4veQqUOdYGw1H8YR0HTGBgeNrtuh1cYyun9pxX1S/vcoTBJgZ1AbCYMKneHl9BxoHon2HfpVEBWa63B5dhF+In4fCSNZo2N2b1ecq6Vxr28C2e9ZjEJS8iWQbSxOdogi25j6PM1qgvAkk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=analog.com; spf=pass smtp.mailfrom=analog.com; dkim=pass (2048-bit key) header.d=analog.com header.i=@analog.com header.b=T6NDV5zV; arc=none smtp.client-ip=148.163.135.77
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=analog.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=analog.com
Received: from pps.filterd (m0167088.ppops.net [127.0.0.1])
	by mx0a-00128a01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 491DI8ho000862;
	Tue, 1 Oct 2024 09:37:54 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=analog.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=DKIM; bh=Kf/S+
	rFHk/GMuoyOCW/rQMukvBPgyAox29mKFipUoLo=; b=T6NDV5zVI3xDnqLJ2XQCK
	7JoHzaNKv6rhxk31JOY47KBr/WDPqVbEtqNCoDIJtnXBsgWuCvSHAlV4s7XIrQGR
	FBaDvORqDZo3KizKCeFnsRWiCNER9ZhDnFWZFY0PCZBaki7OJJjf0IIU/fo6doTY
	HCd6ZFWml3vSiKDtYH5/8VFjl6ZnFAEVMbKN1w0zfUaAIsal6PronfwlLlZdXfhm
	iXk78Qaym0/N+p/hZ5v8/qOSgptzM6z/1OrbGtyAhwWhFabz3f6QKz9a2fLs3FlU
	rRgOn6yqYSDBin2T/qLz/+1f+a1xJyawysJ7oreYDTqtvtHL3F/nn86h86d2af+6
	A==
Received: from nwd2mta4.analog.com ([137.71.173.58])
	by mx0a-00128a01.pphosted.com (PPS) with ESMTPS id 41xbn4d9ks-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 01 Oct 2024 09:37:54 -0400 (EDT)
Received: from ASHBMBX8.ad.analog.com (ASHBMBX8.ad.analog.com [10.64.17.5])
	by nwd2mta4.analog.com (8.14.7/8.14.7) with ESMTP id 491DbroP054574
	(version=TLSv1/SSLv3 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
	Tue, 1 Oct 2024 09:37:53 -0400
Received: from ASHBMBX8.ad.analog.com (10.64.17.5) by ASHBMBX8.ad.analog.com
 (10.64.17.5) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.14; Tue, 1 Oct 2024
 09:37:53 -0400
Received: from zeus.spd.analog.com (10.66.68.11) by ashbmbx8.ad.analog.com
 (10.64.17.5) with Microsoft SMTP Server id 15.2.986.14 via Frontend
 Transport; Tue, 1 Oct 2024 09:37:53 -0400
Received: from [127.0.0.1] ([10.44.3.60])
	by zeus.spd.analog.com (8.15.1/8.15.1) with ESMTP id 491DbTeV022143;
	Tue, 1 Oct 2024 09:37:50 -0400
From: Nuno Sa <nuno.sa@analog.com>
Date: Tue, 1 Oct 2024 15:41:43 +0200
Subject: [PATCH 12/13] Input: adp5589-keys: make use of dev_err_probe()
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20241001-b4-dev-adp5589-fw-conversion-v1-12-fca0149dfc47@analog.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1727790102; l=13456;
 i=nuno.sa@analog.com; s=20231116; h=from:subject:message-id;
 bh=6N7bOwqUoDVqs9Xb1Zn+oGh+IAfTyaS4Pl3ehfwzzDs=;
 b=oV7IY19bN21gVuaCTT2pv1869QHq02ejZ/IhvTIR+lyerV+nd+s4sTmbdDS7FABtcAWIA8PVJ
 YCX/L46XNX+BXhS7l5cRi6nAeno5qx+/k+j0bPQMVhEHwuBdcksT7UL
X-Developer-Key: i=nuno.sa@analog.com; a=ed25519;
 pk=3NQwYA013OUYZsmDFBf8rmyyr5iQlxV/9H4/Df83o1E=
X-ADIRuleOP-NewSCL: Rule Triggered
X-Proofpoint-ORIG-GUID: wQhj9IjCLz83PalquU2rMRsGFqR5xu2F
X-Proofpoint-GUID: wQhj9IjCLz83PalquU2rMRsGFqR5xu2F
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0 clxscore=1015
 spamscore=0 lowpriorityscore=0 bulkscore=0 mlxscore=0 adultscore=0
 priorityscore=1501 mlxlogscore=999 impostorscore=0 malwarescore=0
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2408220000 definitions=main-2410010087

Simplify the probe error path by using dev_err_probe().

Signed-off-by: Nuno Sa <nuno.sa@analog.com>
---
 drivers/input/keyboard/adp5589-keys.c | 226 ++++++++++++++--------------------
 1 file changed, 94 insertions(+), 132 deletions(-)

diff --git a/drivers/input/keyboard/adp5589-keys.c b/drivers/input/keyboard/adp5589-keys.c
index 8cbc2c861ffc2854b5621e515712ae107f46a73f..a3d51e36132b73ef07715f256b82e428c81bd6f6 100644
--- a/drivers/input/keyboard/adp5589-keys.c
+++ b/drivers/input/keyboard/adp5589-keys.c
@@ -676,10 +676,9 @@ static int adp5589_gpio_add(struct adp5589_kpad *kpad)
 	kpad->gc.owner = THIS_MODULE;
 
 	if (device_property_present(dev, "interrupt-controller")) {
-		if (!kpad->client->irq) {
-			dev_err(dev, "Unable to serve as interrupt controller without IRQ\n");
-			return -EINVAL;
-		}
+		if (!kpad->client->irq)
+			return dev_err_probe(dev, -EINVAL,
+					     "Unable to serve as interrupt controller without IRQ\n");
 
 		girq = &kpad->gc.irq;
 		gpio_irq_chip_set_chip(girq, &adp5589_irq_chip);
@@ -935,10 +934,8 @@ static int adp5589_setup(struct adp5589_kpad *kpad)
 
 	ret = adp5589_write(client, reg(ADP5589_INT_EN),
 			    OVRFLOW_IEN | GPI_IEN | EVENT_IEN);
-	if (ret) {
-		dev_err(&client->dev, "Write Error\n");
-		return ret;
-	}
+	if (ret)
+		return dev_err_probe(&client->dev, ret, "Write Error\n");
 
 	return 0;
 }
@@ -951,20 +948,15 @@ static int adp5589_validate_key(struct adp5589_kpad *kpad, u32 key, bool is_gpi)
 	if (is_gpi) {
 		u32 gpi = key - kpad->info->gpi_pin_base;
 
-		if (gpi == 5 && !kpad->info->support_row5) {
-			dev_err(&client->dev,
-				"Invalid unlock/reset GPI(%u) not supported\n",
-				gpi);
-			return -EINVAL;
-		}
+		if (gpi == 5 && !kpad->info->support_row5)
+			return dev_err_probe(&client->dev, -EINVAL,
+					     "Invalid unlock/reset GPI(%u) not supported\n", gpi);
 
 		/* check if it's being used in the keypad */
-		if (BIT(gpi) & kpad->keypad_en_mask) {
-			dev_err(&client->dev,
-				"Invalid unlock/reset GPI(%u) being used in the keypad(%x)\n",
-				gpi, kpad->keypad_en_mask);
-			return -EINVAL;
-		}
+		if (BIT(gpi) & kpad->keypad_en_mask)
+			return dev_err_probe(&client->dev, -EINVAL,
+					     "Invalid unlock/reset GPI(%u) being used in the keypad(%x)\n",
+					     gpi, kpad->keypad_en_mask);
 
 		return 0;
 	}
@@ -977,10 +969,9 @@ static int adp5589_validate_key(struct adp5589_kpad *kpad, u32 key, bool is_gpi)
 	    BIT(col) << kpad->info->col_shift & kpad->keypad_en_mask)
 		return 0;
 
-	dev_err(&client->dev, "Invalid unlock/reset key(%u) not used in the keypad(%x)\n",
-		key, kpad->keypad_en_mask);
-
-	return -EINVAL;
+	return dev_err_probe(&client->dev, -EINVAL,
+			     "Invalid unlock/reset key(%u) not used in the keypad(%x)\n",
+			     key, kpad->keypad_en_mask);
 }
 
 static int adp5589_parse_key_array(struct adp5589_kpad *kpad, const char *prop,
@@ -997,16 +988,14 @@ static int adp5589_parse_key_array(struct adp5589_kpad *kpad, const char *prop,
 
 	*n_keys = ret;
 
-	if (kpad->info->is_adp5585 && !reset_key) {
-		dev_err(&client->dev, "Unlock keys not supported for adp5585\n");
-		return -EOPNOTSUPP;
-	}
+	if (kpad->info->is_adp5585 && !reset_key)
+		return dev_err_probe(&client->dev, -EOPNOTSUPP,
+				     "Unlock keys not supported for adp5585\n");
 
-	if (*n_keys  > max_keys) {
-		dev_err(&client->dev, "Invalid number of keys(%u > %u) for %s\n",
-			*n_keys, max_keys, prop);
-		return -EINVAL;
-	}
+	if (*n_keys  > max_keys)
+		return dev_err_probe(&client->dev, -EINVAL,
+				     "Invalid number of keys(%u > %u) for %s\n",
+				     *n_keys, max_keys, prop);
 
 	ret = device_property_read_u32_array(&client->dev, prop, keys, *n_keys);
 	if (ret)
@@ -1040,10 +1029,8 @@ static int adp5589_parse_key_array(struct adp5589_kpad *kpad, const char *prop,
 		if (!reset_key && keys[key] == 127)
 			continue;
 
-		dev_err(&client->dev, "Invalid key(%u) for %s\n", keys[key],
-			prop);
-
-		return -EINVAL;
+		return dev_err_probe(&client->dev, -EINVAL,
+				     "Invalid key(%u) for %s\n", keys[key], prop);
 	}
 
 	return 0;
@@ -1066,11 +1053,10 @@ static int adp5589_unlock_parse(struct adp5589_kpad *kpad)
 	error = device_property_read_u32(&client->dev, "adi,unlock-trigger-sec",
 					 &kpad->unlock_time);
 	if (!error) {
-		if (kpad->unlock_time > ADP5589_MAX_UNLOCK_TIME_SEC) {
-			dev_err(&client->dev, "Invalid unlock time(%u > %d)\n",
-				kpad->unlock_time, ADP5589_MAX_UNLOCK_TIME_SEC);
-			return -EINVAL;
-		}
+		if (kpad->unlock_time > ADP5589_MAX_UNLOCK_TIME_SEC)
+			return dev_err_probe(&client->dev, -EINVAL,
+					     "Invalid unlock time(%u > %d)\n",
+					     kpad->unlock_time, ADP5589_MAX_UNLOCK_TIME_SEC);
 	}
 
 	return 0;
@@ -1092,10 +1078,9 @@ static int adp5589_reset_parse(struct adp5589_kpad *kpad)
 		 * Then R4 is used as reset output. Make sure it's not being used
 		 * in the keypad.
 		 */
-		if (BIT(4) & kpad->keypad_en_mask) {
-			dev_err(&client->dev, "Row4 cannot be used if reset1 is used\n");
-			return -EINVAL;
-		}
+		if (BIT(4) & kpad->keypad_en_mask)
+			return dev_err_probe(&client->dev, -EINVAL,
+					     "Row4 cannot be used if reset1 is used\n");
 
 		kpad->extend_cfg = R4_EXTEND_CFG;
 	}
@@ -1110,10 +1095,9 @@ static int adp5589_reset_parse(struct adp5589_kpad *kpad)
 		 * Then C4 is used as reset output. Make sure it's not being used
 		 * in the keypad.
 		 */
-		if (BIT(kpad->info->c4_extend_cfg) & kpad->keypad_en_mask) {
-			dev_err(&client->dev, "Col4 cannot be used if reset2 is used\n");
-			return -EINVAL;
-		}
+		if (BIT(kpad->info->c4_extend_cfg) & kpad->keypad_en_mask)
+			return dev_err_probe(&client->dev, -EINVAL,
+					     "Col4 cannot be used if reset2 is used\n");
 
 		kpad->extend_cfg |= C4_EXTEND_CFG;
 	}
@@ -1159,9 +1143,9 @@ static int adp5589_reset_parse(struct adp5589_kpad *kpad)
 			kpad->reset_cfg |= FIELD_PREP(RESET_TRIGGER_TIME, 7);
 			break;
 		default:
-			dev_err(&client->dev, "Invalid value(%u) for adi,reset-trigger-ms\n",
-				prop_val);
-			return -EINVAL;
+			return dev_err_probe(&client->dev, -EINVAL,
+					     "Invalid value(%u) for adi,reset-trigger-ms\n",
+					     prop_val);
 		}
 	}
 
@@ -1182,9 +1166,9 @@ static int adp5589_reset_parse(struct adp5589_kpad *kpad)
 			kpad->reset_cfg |= FIELD_PREP(RESET_PULSE_WIDTH, 3);
 			break;
 		default:
-			dev_err(&client->dev, "Invalid value(%u) for adi,reset-pulse-width-us\n",
-				prop_val);
-			return -EINVAL;
+			return dev_err_probe(&client->dev, -EINVAL,
+					     "Invalid value(%u) for adi,reset-pulse-width-us\n",
+					     prop_val);
 		}
 	}
 
@@ -1199,51 +1183,41 @@ static int adp5589_gpio_parse(struct adp5589_kpad *kpad)
 
 	device_for_each_child_node_scoped(&client->dev, child) {
 		error = fwnode_property_read_u32(child, "reg", &reg);
-		if (error) {
-			dev_err(&client->dev, "Failed to get reg property\n");
-			return -EINVAL;
-		}
+		if (error)
+			return dev_err_probe(&client->dev, -EINVAL,
+					     "Failed to get reg property\n");
 
-		if (reg >= kpad->info->maxgpio) {
-			dev_err(&client->dev, "Invalid gpio(%u > %u)\n",
-				reg, kpad->info->maxgpio);
-			return -EINVAL;
-		}
+		if (reg >= kpad->info->maxgpio)
+			return dev_err_probe(&client->dev, -EINVAL,
+					     "Invalid gpio(%u > %u)\n",
+					     reg, kpad->info->maxgpio);
 
-		if (BIT(reg) & kpad->keypad_en_mask) {
-			dev_err(&client->dev, "Invalid gpio(%u) used in keypad\n",
-				reg);
-			return -EINVAL;
-		}
+		if (BIT(reg) & kpad->keypad_en_mask)
+			return dev_err_probe(&client->dev, -EINVAL,
+					     "Invalid gpio(%u) used in keypad\n", reg);
 
-		if (reg == 5 && !kpad->info->support_row5) {
-			dev_err(&client->dev, "Invalid gpio(%u) not supported\n",
-				reg);
-			return -EINVAL;
-		}
+		if (reg == 5 && !kpad->info->support_row5)
+			return dev_err_probe(&client->dev, -EINVAL,
+					     "Invalid gpio(%u) not supported\n",
+					     reg);
 
 		/* Check if it's gpio4 and R4 is being used as reset */
-		if (kpad->extend_cfg & R4_EXTEND_CFG && reg == 4) {
-			dev_err(&client->dev, "Invalid gpio(%u) used as reset1\n",
-				reg);
-			return -EINVAL;
-		}
+		if (kpad->extend_cfg & R4_EXTEND_CFG && reg == 4)
+			return dev_err_probe(&client->dev, -EINVAL,
+					     "Invalid gpio(%u) used as reset1\n", reg);
 
 		/* Check if the gpio is being used as reset2 */
-		if (kpad->extend_cfg & C4_EXTEND_CFG && reg == kpad->info->c4_extend_cfg) {
-			dev_err(&client->dev, "Invalid gpio(%u) used as reset2\n",
-				reg);
-			return -EINVAL;
-		}
+		if (kpad->extend_cfg & C4_EXTEND_CFG && reg == kpad->info->c4_extend_cfg)
+			return dev_err_probe(&client->dev, -EINVAL,
+					     "Invalid gpio(%u) used as reset2\n", reg);
 
 		error = fwnode_property_read_u32(child, "adi,pull-up-ohms",
 						 &pullup);
 		if (!error) {
-			if (pullup != 100 * KILO && pullup != 300 * KILO) {
-				dev_err(&client->dev, "Invalid pullup resistor val(%u)",
-					pullup);
-				return -EINVAL;
-			}
+			if (pullup != 100 * KILO && pullup != 300 * KILO)
+				return dev_err_probe(&client->dev, -EINVAL,
+						     "Invalid pullup resistor val(%u)",
+						     pullup);
 
 			if (pullup == 100 * KILO)
 				__set_bit(reg, &kpad->pull_up_100k_map);
@@ -1262,11 +1236,9 @@ static int adp5589_parse_fw(struct adp5589_kpad *kpad)
 	error = device_property_read_u32(&client->dev, "adi,cols-mask",
 					 &prop_val);
 	if (!error) {
-		if (prop_val > GENMASK(kpad->info->max_col_num, 0)) {
-			dev_err(&client->dev, "Invalid column mask(%x)\n",
-				prop_val);
-			return -EINVAL;
-		}
+		if (prop_val > GENMASK(kpad->info->max_col_num, 0))
+			return dev_err_probe(&client->dev, -EINVAL,
+					     "Invalid column mask(%x)\n", prop_val);
 
 		kpad->keypad_en_mask = prop_val << kpad->info->col_shift;
 		/*
@@ -1282,37 +1254,30 @@ static int adp5589_parse_fw(struct adp5589_kpad *kpad)
 	error = device_property_read_u32(&client->dev, "adi,rows-mask",
 					 &prop_val);
 	if (!error) {
-		if (prop_val > GENMASK(kpad->info->max_row_num, 0)) {
-			dev_err(&client->dev, "Invalid row mask(%x)\n",
-				prop_val);
-			return -EINVAL;
-		}
+		if (prop_val > GENMASK(kpad->info->max_row_num, 0))
+			return dev_err_probe(&client->dev, -EINVAL,
+					     "Invalid row mask(%x)\n", prop_val);
 
-		if (prop_val & BIT(5) && !kpad->info->support_row5) {
-			dev_err(&client->dev, "Row5 not supported!\n");
-			return -EINVAL;
-		}
+		if (prop_val & BIT(5) && !kpad->info->support_row5)
+			return dev_err_probe(&client->dev, -EINVAL,
+					     "Row5 not supported!\n");
 
 		kpad->keypad_en_mask |= prop_val;
 		rows = fls(prop_val);
 	}
 
-	if (cols && !rows) {
-		dev_err(&client->dev, "Cannot have columns with no rows!\n");
-		return -EINVAL;
-	}
+	if (cols && !rows)
+		return dev_err_probe(&client->dev, -EINVAL,
+				     "Cannot have columns with no rows!\n");
 
-	if (rows && !cols) {
-		dev_err(&client->dev, "Cannot have rows with no columns!\n");
-		return -EINVAL;
-	}
+	if (rows && !cols)
+		dev_err_probe(&client->dev, -EINVAL,
+			      "Cannot have rows with no columns!\n");
 
 	if (rows && cols) {
-		if (!client->irq) {
-			dev_err(&client->dev,
-				"Keymaps won't work without interrupts\n");
-			return -EINVAL;
-		}
+		if (!client->irq)
+			return dev_err_probe(&client->dev, -EINVAL,
+					     "Keymaps won't work without interrupts\n");
 
 		error = matrix_keypad_build_keymap(NULL, NULL, rows, cols,
 						   kpad->keycode, kpad->input);
@@ -1339,9 +1304,9 @@ static int adp5589_parse_fw(struct adp5589_kpad *kpad)
 			kpad->key_poll_time = prop_val / 10 - 1;
 			break;
 		default:
-			dev_err(&client->dev, "Invalid value(%u) for adi,key-poll-ms\n",
-				prop_val);
-			return -EINVAL;
+			return dev_err_probe(&client->dev, -EINVAL,
+					     "Invalid value(%u) for adi,key-poll-ms\n",
+					     prop_val);
 		}
 	}
 
@@ -1384,10 +1349,9 @@ static int adp5589_keypad_add(struct adp5589_kpad *kpad, unsigned int revid)
 		return error;
 
 	error = input_register_device(input);
-	if (error) {
-		dev_err(&client->dev, "unable to register input device\n");
-		return error;
-	}
+	if (error)
+		return dev_err_probe(&client->dev, error,
+				     "unable to register input device\n");
 
 	if (!client->irq)
 		return 0;
@@ -1396,10 +1360,9 @@ static int adp5589_keypad_add(struct adp5589_kpad *kpad, unsigned int revid)
 					  NULL, adp5589_irq,
 					  IRQF_TRIGGER_FALLING | IRQF_ONESHOT,
 					  client->dev.driver->name, kpad);
-	if (error) {
-		dev_err(&client->dev, "unable to request irq %d\n", client->irq);
-		return error;
-	}
+	if (error)
+		return dev_err_probe(&client->dev, error,
+				     "unable to request irq %d\n", client->irq);
 
 	return 0;
 }
@@ -1468,10 +1431,9 @@ static int adp5589_probe(struct i2c_client *client)
 	u8 id;
 
 	if (!i2c_check_functionality(client->adapter,
-				     I2C_FUNC_SMBUS_BYTE_DATA)) {
-		dev_err(&client->dev, "SMBUS Byte Data not Supported\n");
-		return -EIO;
-	}
+				     I2C_FUNC_SMBUS_BYTE_DATA))
+		return dev_err_probe(&client->dev, -EIO,
+				     "SMBUS Byte Data not Supported\n");
 
 	kpad = devm_kzalloc(&client->dev, sizeof(*kpad), GFP_KERNEL);
 	if (!kpad)

-- 
2.46.1


