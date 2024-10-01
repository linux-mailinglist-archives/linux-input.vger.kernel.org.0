Return-Path: <linux-input+bounces-6951-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8FC4098BE07
	for <lists+linux-input@lfdr.de>; Tue,  1 Oct 2024 15:38:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id A88941C21739
	for <lists+linux-input@lfdr.de>; Tue,  1 Oct 2024 13:38:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0FE2C1C57A5;
	Tue,  1 Oct 2024 13:37:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=analog.com header.i=@analog.com header.b="o8HWOamQ"
X-Original-To: linux-input@vger.kernel.org
Received: from mx0a-00128a01.pphosted.com (mx0a-00128a01.pphosted.com [148.163.135.77])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6BB111C5791;
	Tue,  1 Oct 2024 13:37:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.163.135.77
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727789879; cv=none; b=gxj/4yAWVO8ExSxaGf9z5/3sSEBFSZaHIacyvkgBglsmm4VWuV4YSUK1QmLsrfQHCYRh8ZFRupfVb6jTq+BRoL2/Y6R4N0gJrNmkyp/3PhqjBZCtoP3xMl6jboHcmorXlhi7z5nqTsdeI3GS/v2Qi033emd9W2RuaE0NJ1c/tWo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727789879; c=relaxed/simple;
	bh=GnUHsW6XiN6X7tlWepNhHUYDeNlJ1S2G9twU4HJGvdY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:References:
	 In-Reply-To:To:CC; b=RuprGAWK12eZWFoKnJtBhcHc1dF/JzkmlhlSdKVWswk06AAvF88g8Lh9qE51DNOTpCEe1yOEO7MfNKzwFiXGtQDwyTLQoRp14LaM7bs45wz0mz7khWs3zb+J4GcEr86q8G9p4YraFzJOGIXRBSSL6tMXNK6vTNonGAM+GnjBaFI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=analog.com; spf=pass smtp.mailfrom=analog.com; dkim=pass (2048-bit key) header.d=analog.com header.i=@analog.com header.b=o8HWOamQ; arc=none smtp.client-ip=148.163.135.77
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=analog.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=analog.com
Received: from pps.filterd (m0167089.ppops.net [127.0.0.1])
	by mx0a-00128a01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 491A1fb7030443;
	Tue, 1 Oct 2024 09:37:51 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=analog.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=DKIM; bh=61wX/
	1LJBl66gu5NJM/UW2Twjex0bNqJhhPYmWVvCJk=; b=o8HWOamQTEm7jHIRXRzld
	hOsWaFe8RameawCNaJZRCWj4kwTD2EmWi2g9+3H2XcVTT3hFnjP7AE2x/NIizzXp
	HvKEwsbBxKxYx4qBTZM3MnkOIZtMELJs8OzVyEaw43Ooz/c+7y8Cl14hy9tczvgp
	bTBO9ZmqWzgHKXpVHSMVKkwfocYnNIfTZ6rlkmvnWU3nOtHjof4bN4TuoxYWtLaF
	WmuPRu1QbPGlZw0ncNwG7EOQI3jMS7mbvnSKVVcAwOdMSn9uIGpmdnwuk+vCMdZD
	jfCM+ZN9VhQaTq9eAwANMjdRe143oB1yTP8HPizdLCSRNLIJXMLWvpz+nLALa15U
	Q==
Received: from nwd2mta4.analog.com ([137.71.173.58])
	by mx0a-00128a01.pphosted.com (PPS) with ESMTPS id 41yp2rxtsa-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 01 Oct 2024 09:37:50 -0400 (EDT)
Received: from ASHBMBX9.ad.analog.com (ASHBMBX9.ad.analog.com [10.64.17.10])
	by nwd2mta4.analog.com (8.14.7/8.14.7) with ESMTP id 491Dbn4I054559
	(version=TLSv1/SSLv3 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
	Tue, 1 Oct 2024 09:37:49 -0400
Received: from ASHBMBX9.ad.analog.com (10.64.17.10) by ASHBMBX9.ad.analog.com
 (10.64.17.10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.14; Tue, 1 Oct 2024
 09:37:49 -0400
Received: from zeus.spd.analog.com (10.66.68.11) by ashbmbx9.ad.analog.com
 (10.64.17.10) with Microsoft SMTP Server id 15.2.986.14 via Frontend
 Transport; Tue, 1 Oct 2024 09:37:49 -0400
Received: from [127.0.0.1] ([10.44.3.60])
	by zeus.spd.analog.com (8.15.1/8.15.1) with ESMTP id 491DbTeQ022143;
	Tue, 1 Oct 2024 09:37:44 -0400
From: Nuno Sa <nuno.sa@analog.com>
Date: Tue, 1 Oct 2024 15:41:38 +0200
Subject: [PATCH 07/13] Input: adp5589-keys: add guard() notation
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20241001-b4-dev-adp5589-fw-conversion-v1-7-fca0149dfc47@analog.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1727790102; l=4800;
 i=nuno.sa@analog.com; s=20231116; h=from:subject:message-id;
 bh=GnUHsW6XiN6X7tlWepNhHUYDeNlJ1S2G9twU4HJGvdY=;
 b=GDr/48vOBbwBDlhMgV0lEmtodlZHpQXhfM37HrI0V7nJCn73kh2wxkXPB8vuQmF78j0erWLDA
 c+NUDMsYCU9DXJnfsqzDKW38m3mMC58RtVlA5AB13bdGZ7sjy5UCggo
X-Developer-Key: i=nuno.sa@analog.com; a=ed25519;
 pk=3NQwYA013OUYZsmDFBf8rmyyr5iQlxV/9H4/Df83o1E=
X-ADIRuleOP-NewSCL: Rule Triggered
X-Proofpoint-GUID: nyQw2H0DaI4OYRM6vfUVYjWLh-nSOynr
X-Proofpoint-ORIG-GUID: nyQw2H0DaI4OYRM6vfUVYjWLh-nSOynr
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0
 lowpriorityscore=0 phishscore=0 bulkscore=0 priorityscore=1501
 adultscore=0 spamscore=0 clxscore=1015 malwarescore=0 suspectscore=0
 mlxlogscore=945 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2408220000 definitions=main-2410010087

Using the cleanup.h APi makes the code path easier and less prone to
mistakes.

Signed-off-by: Nuno Sa <nuno.sa@analog.com>
---
 drivers/input/keyboard/adp5589-keys.c | 54 +++++++++++++----------------------
 1 file changed, 20 insertions(+), 34 deletions(-)

diff --git a/drivers/input/keyboard/adp5589-keys.c b/drivers/input/keyboard/adp5589-keys.c
index d2c99f5cfee6a6b8adf4e3841fc235588632017b..19ebcb71fd5c7fcba6c7979ba9495179dd393808 100644
--- a/drivers/input/keyboard/adp5589-keys.c
+++ b/drivers/input/keyboard/adp5589-keys.c
@@ -8,6 +8,7 @@
  */
 
 #include <linux/bitfield.h>
+#include <linux/cleanup.h>
 #include <linux/bitops.h>
 #include <linux/bits.h>
 #include <linux/minmax.h>
@@ -419,13 +420,12 @@ static int adp5589_gpio_get_value(struct gpio_chip *chip, unsigned off)
 	unsigned int bit = kpad->info->var->bit(kpad->gpiomap[off]);
 	int val;
 
-	mutex_lock(&kpad->gpio_lock);
+	guard(mutex)(&kpad->gpio_lock);
 	if (kpad->dir[bank] & bit)
 		val = kpad->dat_out[bank];
 	else
 		val = adp5589_read(kpad->client,
 				   kpad->info->var->reg(ADP5589_GPI_STATUS_A) + bank);
-	mutex_unlock(&kpad->gpio_lock);
 
 	return !!(val & bit);
 }
@@ -437,7 +437,7 @@ static void adp5589_gpio_set_value(struct gpio_chip *chip,
 	unsigned int bank = kpad->info->var->bank(kpad->gpiomap[off]);
 	unsigned int bit = kpad->info->var->bit(kpad->gpiomap[off]);
 
-	mutex_lock(&kpad->gpio_lock);
+	guard(mutex)(&kpad->gpio_lock);
 
 	if (val)
 		kpad->dat_out[bank] |= bit;
@@ -446,8 +446,6 @@ static void adp5589_gpio_set_value(struct gpio_chip *chip,
 
 	adp5589_write(kpad->client, kpad->info->var->reg(ADP5589_GPO_DATA_OUT_A) +
 		      bank, kpad->dat_out[bank]);
-
-	mutex_unlock(&kpad->gpio_lock);
 }
 
 static int adp5589_gpio_direction_input(struct gpio_chip *chip, unsigned off)
@@ -455,18 +453,13 @@ static int adp5589_gpio_direction_input(struct gpio_chip *chip, unsigned off)
 	struct adp5589_kpad *kpad = gpiochip_get_data(chip);
 	unsigned int bank = kpad->info->var->bank(kpad->gpiomap[off]);
 	unsigned int bit = kpad->info->var->bit(kpad->gpiomap[off]);
-	int ret;
 
-	mutex_lock(&kpad->gpio_lock);
+	guard(mutex)(&kpad->gpio_lock);
 
 	kpad->dir[bank] &= ~bit;
-	ret = adp5589_write(kpad->client,
-			    kpad->info->var->reg(ADP5589_GPIO_DIRECTION_A) + bank,
-			    kpad->dir[bank]);
-
-	mutex_unlock(&kpad->gpio_lock);
-
-	return ret;
+	return adp5589_write(kpad->client,
+			     kpad->info->var->reg(ADP5589_GPIO_DIRECTION_A) + bank,
+			     kpad->dir[bank]);
 }
 
 static int adp5589_gpio_direction_output(struct gpio_chip *chip,
@@ -477,7 +470,7 @@ static int adp5589_gpio_direction_output(struct gpio_chip *chip,
 	unsigned int bit = kpad->info->var->bit(kpad->gpiomap[off]);
 	int ret;
 
-	mutex_lock(&kpad->gpio_lock);
+	guard(mutex)(&kpad->gpio_lock);
 
 	kpad->dir[bank] |= bit;
 
@@ -492,8 +485,6 @@ static int adp5589_gpio_direction_output(struct gpio_chip *chip,
 			     kpad->info->var->reg(ADP5589_GPIO_DIRECTION_A) + bank,
 			     kpad->dir[bank]);
 
-	mutex_unlock(&kpad->gpio_lock);
-
 	return ret;
 }
 
@@ -508,10 +499,9 @@ static int adp5589_gpio_set_bias(struct adp5589_kpad *kpad, unsigned int pin,
 				 enum pin_config_param cfg)
 {
 	unsigned int bank, msk;
-	int error;
 	u8 val;
 
-	mutex_lock(&kpad->gpio_lock);
+	guard(mutex)(&kpad->gpio_lock);
 
 	if (cfg == PIN_CONFIG_BIAS_PULL_UP)
 		val = test_bit(pin, &kpad->pull_up_100k_map) ? 2 : 0;
@@ -537,13 +527,9 @@ static int adp5589_gpio_set_bias(struct adp5589_kpad *kpad, unsigned int pin,
 	val <<= __bf_shf(msk);
 	kpad->rpull[bank] = (kpad->rpull[bank] & ~msk) | (val & msk);
 
-	error = adp5589_write(kpad->client,
-			      kpad->info->var->reg(ADP5589_RPULL_CONFIG_A) + bank,
-			      kpad->rpull[bank]);
-
-	mutex_unlock(&kpad->gpio_lock);
-
-	return error;
+	return adp5589_write(kpad->client,
+			     kpad->info->var->reg(ADP5589_RPULL_CONFIG_A) + bank,
+			     kpad->rpull[bank]);
 }
 
 static int adp5589_gpio_set_config(struct gpio_chip *chip,  unsigned int off,
@@ -574,15 +560,15 @@ static int adp5589_gpio_set_config(struct gpio_chip *chip,  unsigned int off,
 			return -EINVAL;
 		}
 
-		mutex_lock(&kpad->gpio_lock);
-		if (!val)
-			kpad->debounce_dis[bank] |= bit;
-		else
-			kpad->debounce_dis[bank] &= bit;
+		scoped_guard(mutex, &kpad->gpio_lock) {
+			if (!val)
+				kpad->debounce_dis[bank] |= bit;
+			else
+				kpad->debounce_dis[bank] &= bit;
 
-		error = adp5589_write(kpad->client, reg,
-				      kpad->debounce_dis[bank]);
-		mutex_unlock(&kpad->gpio_lock);
+			error = adp5589_write(kpad->client, reg,
+					      kpad->debounce_dis[bank]);
+		}
 		return error;
 	default:
 		return -EOPNOTSUPP;

-- 
2.46.1


