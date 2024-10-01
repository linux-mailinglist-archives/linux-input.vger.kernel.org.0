Return-Path: <linux-input+bounces-6950-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id AD1C198BE04
	for <lists+linux-input@lfdr.de>; Tue,  1 Oct 2024 15:38:15 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 3976E1F22D09
	for <lists+linux-input@lfdr.de>; Tue,  1 Oct 2024 13:38:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EF6E31C579F;
	Tue,  1 Oct 2024 13:37:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=analog.com header.i=@analog.com header.b="M/NdVjIf"
X-Original-To: linux-input@vger.kernel.org
Received: from mx0a-00128a01.pphosted.com (mx0a-00128a01.pphosted.com [148.163.135.77])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4EE751EA87;
	Tue,  1 Oct 2024 13:37:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.163.135.77
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727789878; cv=none; b=dNwd3fk2CZE5tPKPGUyyJun2//GMq0eBkzadzA0Nbf4lOvK0spkIrdp3CwheKNl1ryIaj4k7gV+JeqDMudnXAUbbMT+HPeeSqUEzc04bzIzjlXxs0SNwo1eyUAx4axc6UaT8OWm+EjW+9NViTHWqT2vd8K4vwPq6+VNDZdXqdvY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727789878; c=relaxed/simple;
	bh=8wBD6AiOgpYGPYf5ldLU0j+ExTxtFnOq99IFheZEfPk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:References:
	 In-Reply-To:To:CC; b=AyEw4AV0jQM6IuFkrwZcFhcDcLzNPV0rNUtjM+QbOkVbjxOdP5cWx9ORrDtZeOu5qcYrX40hbW8vf7+a1dCIyEHUH4KNf6X1sZHd5ZfzCgvIpVcNECfpKvlRT2EMC4EGu1uAqPkgqhECucPuK9e17sAg5zfWlmVvh0hzdb+XRU4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=analog.com; spf=pass smtp.mailfrom=analog.com; dkim=pass (2048-bit key) header.d=analog.com header.i=@analog.com header.b=M/NdVjIf; arc=none smtp.client-ip=148.163.135.77
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=analog.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=analog.com
Received: from pps.filterd (m0167088.ppops.net [127.0.0.1])
	by mx0a-00128a01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 491AKELN017084;
	Tue, 1 Oct 2024 09:37:50 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=analog.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=DKIM; bh=GLQmP
	U5cYlKLblHvHv0GaI3CGDJgz85L7jT/ZLbvttU=; b=M/NdVjIfv43XRzsnMLPUF
	kCXg7r4P8v7YjY8ishMrCrXVA4s8Fzzxmwm1py+MHEZNBDX7dXtWDIVHTSLAfkLG
	h+QMZ9cI57sf6ackcQJI5p8A8Cp6NJ0h7ZOLRdAsBATbsv4Cj3vOf5bjiek9Fy2b
	oHdPbpiE20o97SgL8AvHzvi9ME5D/fbQGKfrAYV24JdUZPK8jvzGJ9iJqxhmMbKp
	81ZdZjpMjrk3QOdW597Y3Owj7C/sLcFCy1FihdnaDWTfWG2NDikUkCSGKIyfuXDC
	IjsJMhyZK95tvVwdwVLp0wvqggvRy2fSWAe9CKWEeYd9HEQC4C3Vc+34M+LCXA2x
	g==
Received: from nwd2mta4.analog.com ([137.71.173.58])
	by mx0a-00128a01.pphosted.com (PPS) with ESMTPS id 41xbn4d9ke-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 01 Oct 2024 09:37:50 -0400 (EDT)
Received: from ASHBMBX8.ad.analog.com (ASHBMBX8.ad.analog.com [10.64.17.5])
	by nwd2mta4.analog.com (8.14.7/8.14.7) with ESMTP id 491Dbm5g054556
	(version=TLSv1/SSLv3 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
	Tue, 1 Oct 2024 09:37:48 -0400
Received: from ASHBCASHYB5.ad.analog.com (10.64.17.133) by
 ASHBMBX8.ad.analog.com (10.64.17.5) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.14; Tue, 1 Oct 2024 09:37:48 -0400
Received: from ASHBMBX8.ad.analog.com (10.64.17.5) by
 ASHBCASHYB5.ad.analog.com (10.64.17.133) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.14; Tue, 1 Oct 2024 09:37:48 -0400
Received: from zeus.spd.analog.com (10.66.68.11) by ashbmbx8.ad.analog.com
 (10.64.17.5) with Microsoft SMTP Server id 15.2.986.14 via Frontend
 Transport; Tue, 1 Oct 2024 09:37:48 -0400
Received: from [127.0.0.1] ([10.44.3.60])
	by zeus.spd.analog.com (8.15.1/8.15.1) with ESMTP id 491DbTeR022143;
	Tue, 1 Oct 2024 09:37:45 -0400
From: Nuno Sa <nuno.sa@analog.com>
Date: Tue, 1 Oct 2024 15:41:39 +0200
Subject: [PATCH 08/13] Input: adp5589-keys: bail out on returned error
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20241001-b4-dev-adp5589-fw-conversion-v1-8-fca0149dfc47@analog.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1727790102; l=6530;
 i=nuno.sa@analog.com; s=20231116; h=from:subject:message-id;
 bh=8wBD6AiOgpYGPYf5ldLU0j+ExTxtFnOq99IFheZEfPk=;
 b=aJXuMY7rQShBK+wYHg8D6bocYhVfRkedpsQt87sTbxNBdktCA8vsxPIpLn397YtV1b1Il1BHu
 NeKPNINVAYNAjDnjhsVSck2Kq/ELPrJaEiUar7L8TtmwUAGhIh6MNkw
X-Developer-Key: i=nuno.sa@analog.com; a=ed25519;
 pk=3NQwYA013OUYZsmDFBf8rmyyr5iQlxV/9H4/Df83o1E=
X-ADIRuleOP-NewSCL: Rule Triggered
X-Proofpoint-ORIG-GUID: MkiwLcoBwVEXXI9ScsmWt8NJbK7OCDL5
X-Proofpoint-GUID: MkiwLcoBwVEXXI9ScsmWt8NJbK7OCDL5
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0 clxscore=1015
 spamscore=0 lowpriorityscore=0 bulkscore=0 mlxscore=0 adultscore=0
 priorityscore=1501 mlxlogscore=999 impostorscore=0 malwarescore=0
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2408220000 definitions=main-2410010087

Don't continue in code paths after some error is found. It makes no
sense to do any other device configuration if a previous one failed.

Signed-off-by: Nuno Sa <nuno.sa@analog.com>
---
 drivers/input/keyboard/adp5589-keys.c | 109 +++++++++++++++++++++++-----------
 1 file changed, 75 insertions(+), 34 deletions(-)

diff --git a/drivers/input/keyboard/adp5589-keys.c b/drivers/input/keyboard/adp5589-keys.c
index 19ebcb71fd5c7fcba6c7979ba9495179dd393808..622ff442b378768aca7c1da81f7cc38516c7806c 100644
--- a/drivers/input/keyboard/adp5589-keys.c
+++ b/drivers/input/keyboard/adp5589-keys.c
@@ -422,10 +422,12 @@ static int adp5589_gpio_get_value(struct gpio_chip *chip, unsigned off)
 
 	guard(mutex)(&kpad->gpio_lock);
 	if (kpad->dir[bank] & bit)
-		val = kpad->dat_out[bank];
-	else
-		val = adp5589_read(kpad->client,
-				   kpad->info->var->reg(ADP5589_GPI_STATUS_A) + bank);
+		return !!(kpad->dat_out[bank] & bit);
+
+	val = adp5589_read(kpad->client,
+			   kpad->info->var->reg(ADP5589_GPI_STATUS_A) + bank);
+	if (val < 0)
+		return val;
 
 	return !!(val & bit);
 }
@@ -481,11 +483,12 @@ static int adp5589_gpio_direction_output(struct gpio_chip *chip,
 
 	ret = adp5589_write(kpad->client, kpad->info->var->reg(ADP5589_GPO_DATA_OUT_A)
 			    + bank, kpad->dat_out[bank]);
-	ret |= adp5589_write(kpad->client,
+	if (ret)
+		return ret;
+
+	return adp5589_write(kpad->client,
 			     kpad->info->var->reg(ADP5589_GPIO_DIRECTION_A) + bank,
 			     kpad->dir[bank]);
-
-	return ret;
 }
 
 static const u8 adp5589_rpull_masks[] = {
@@ -720,16 +723,27 @@ static int adp5589_gpio_add(struct adp5589_kpad *kpad)
 	for (i = 0; i <= kpad->info->var->bank(kpad->info->var->maxgpio); i++) {
 		kpad->dat_out[i] = adp5589_read(kpad->client,
 						kpad->info->var->reg(ADP5589_GPO_DATA_OUT_A) + i);
+		if (kpad->dat_out[i] < 0)
+			return kpad->dat_out[i];
+
 		kpad->dir[i] = adp5589_read(kpad->client,
 					    kpad->info->var->reg(ADP5589_GPIO_DIRECTION_A) + i);
+		if (kpad->dir[i] < 0)
+			return kpad->dir[i];
+
 		kpad->debounce_dis[i] = adp5589_read(kpad->client,
 						     kpad->info->var->reg(ADP5589_DEBOUNCE_DIS_A)
 						     + i);
+		if (kpad->debounce_dis[i] < 0)
+			return kpad->debounce_dis[i];
 	}
 
-	for (i = 0; i < kpad->info->rpull_banks; i++)
+	for (i = 0; i < kpad->info->rpull_banks; i++) {
 		kpad->rpull[i] = adp5589_read(kpad->client,
 					      kpad->info->var->reg(ADP5589_RPULL_CONFIG_A) + i);
+		if (kpad->rpull[i] < 0)
+			return kpad->rpull[i];
+	}
 
 	return 0;
 }
@@ -791,9 +805,14 @@ static void adp5589_report_events(struct adp5589_kpad *kpad, int ev_cnt)
 	int i;
 
 	for (i = 0; i < ev_cnt; i++) {
-		int key = adp5589_read(kpad->client, ADP5589_5_FIFO_1 + i);
-		int key_val = key & KEY_EV_MASK;
-		int key_press = key & KEY_EV_PRESSED;
+		int key, key_val, key_press;
+
+		key = adp5589_read(kpad->client, ADP5589_5_FIFO_1 + i);
+		if (key < 0)
+			return;
+
+		key_val = key & KEY_EV_MASK;
+		key_press = key & KEY_EV_PRESSED;
 
 		if (key_val >= kpad->info->var->gpi_pin_base &&
 		    key_val <= kpad->info->var->gpi_pin_end) {
@@ -821,18 +840,22 @@ static irqreturn_t adp5589_irq(int irq, void *handle)
 	int status, ev_cnt;
 
 	status = adp5589_read(client, ADP5589_5_INT_STATUS);
+	if (status < 0)
+		return IRQ_HANDLED;
 
 	if (status & OVRFLOW_INT)	/* Unlikely and should never happen */
 		dev_err(&client->dev, "Event Overflow Error\n");
 
 	if (status & EVENT_INT) {
 		ev_cnt = adp5589_read(client, ADP5589_5_STATUS) & KEC;
-		if (ev_cnt) {
-			adp5589_report_events(kpad, ev_cnt);
-			input_sync(kpad->input);
-		}
+		if (ev_cnt <= 0)
+			goto out_irq;
+
+		adp5589_report_events(kpad, ev_cnt);
+		input_sync(kpad->input);
 	}
 
+out_irq:
 	adp5589_write(client, ADP5589_5_INT_STATUS, status); /* Status is W1C */
 
 	return IRQ_HANDLED;
@@ -846,12 +869,20 @@ static int adp5589_setup(struct adp5589_kpad *kpad)
 
 	ret = adp5589_write(client, reg(ADP5589_PIN_CONFIG_A),
 			    kpad->keypad_en_mask);
-	ret |= adp5589_write(client, reg(ADP5589_PIN_CONFIG_B),
-			     kpad->keypad_en_mask >> kpad->info->var->col_shift);
+	if (ret)
+		return ret;
 
-	if (!kpad->info->is_adp5585)
-		ret |= adp5589_write(client, ADP5589_PIN_CONFIG_C,
-				     kpad->keypad_en_mask >> 16);
+	ret = adp5589_write(client, reg(ADP5589_PIN_CONFIG_B),
+			    kpad->keypad_en_mask >> kpad->info->var->col_shift);
+	if (ret)
+		return ret;
+
+	if (!kpad->info->is_adp5585) {
+		ret = adp5589_write(client, ADP5589_PIN_CONFIG_C,
+				    kpad->keypad_en_mask >> 16);
+		if (ret)
+			return ret;
+	}
 
 	/* unlock keys */
 	for (i = 0; i < kpad->nkeys_unlock; i++) {
@@ -872,8 +903,11 @@ static int adp5589_setup(struct adp5589_kpad *kpad)
 			return ret;
 	}
 
-	for (i = 0; i < KEYP_MAX_EVENT; i++)
-		ret |= adp5589_read(client, ADP5589_5_FIFO_1 + i);
+	for (i = 0; i < KEYP_MAX_EVENT; i++) {
+		ret = adp5589_read(client, ADP5589_5_FIFO_1 + i);
+		if (ret < 0)
+			return ret;
+	}
 
 	/* reset keys */
 	for (i = 0; i < kpad->nkeys_reset1; i++) {
@@ -902,20 +936,27 @@ static int adp5589_setup(struct adp5589_kpad *kpad)
 			return ret;
 	}
 
-	ret |= adp5589_write(client, reg(ADP5589_POLL_PTIME_CFG),
-			     kpad->key_poll_time);
-	ret |= adp5589_write(client, ADP5589_5_INT_STATUS,
-			     (kpad->info->is_adp5585 ? 0 : LOGIC2_INT) |
-			     LOGIC1_INT | OVRFLOW_INT |
-			     (kpad->info->is_adp5585 ? 0 : LOCK_INT) |
-			     GPI_INT | EVENT_INT);	/* Status is W1C */
+	ret = adp5589_write(client, reg(ADP5589_POLL_PTIME_CFG),
+			    kpad->key_poll_time);
+	if (ret)
+		return ret;
 
-	ret |= adp5589_write(client, reg(ADP5589_GENERAL_CFG),
-			     INT_CFG | OSC_EN | CORE_CLK(3));
-	ret |= adp5589_write(client, reg(ADP5589_INT_EN),
-			     OVRFLOW_IEN | GPI_IEN | EVENT_IEN);
+	ret = adp5589_write(client, ADP5589_5_INT_STATUS,
+			    (kpad->info->is_adp5585 ? 0 : LOGIC2_INT) |
+			    LOGIC1_INT | OVRFLOW_INT |
+			    (kpad->info->is_adp5585 ? 0 : LOCK_INT) |
+			    GPI_INT | EVENT_INT);	/* Status is W1C */
+	if (ret)
+		return ret;
 
-	if (ret < 0) {
+	ret = adp5589_write(client, reg(ADP5589_GENERAL_CFG),
+			    INT_CFG | OSC_EN | CORE_CLK(3));
+	if (ret)
+		return ret;
+
+	ret = adp5589_write(client, reg(ADP5589_INT_EN),
+			    OVRFLOW_IEN | GPI_IEN | EVENT_IEN);
+	if (ret) {
 		dev_err(&client->dev, "Write Error\n");
 		return ret;
 	}

-- 
2.46.1


