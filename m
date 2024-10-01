Return-Path: <linux-input+bounces-6952-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 154EE98BE09
	for <lists+linux-input@lfdr.de>; Tue,  1 Oct 2024 15:38:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id B0860283A9A
	for <lists+linux-input@lfdr.de>; Tue,  1 Oct 2024 13:38:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1B0E51C57B7;
	Tue,  1 Oct 2024 13:38:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=analog.com header.i=@analog.com header.b="WxCh0JSX"
X-Original-To: linux-input@vger.kernel.org
Received: from mx0b-00128a01.pphosted.com (mx0a-00128a01.pphosted.com [148.163.135.77])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 18AE13D7A;
	Tue,  1 Oct 2024 13:37:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.163.135.77
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727789880; cv=none; b=fE31MvNLjckrd9fT5TF+Tb26KyHBk4z4B0XoPf6ycstTWbV26m6mX6G7EEBFm2aUHPhsmzdN67VZJKJuX+Vs0swvTLo9WSjpaFkqvDSyMCqIpHHZaUqXhZ/I/nqqSBX5wGKMAychR261o6+K2xM6avsASpdlOARzQhpCr02rCWw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727789880; c=relaxed/simple;
	bh=FYW2VZ8tOzZ8og6jW1LKSq+92i2u5QzNq3x7C28J0Cw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:References:
	 In-Reply-To:To:CC; b=LILjRUEx1/YKIfZ2UjyGcymCubG5JV+NYOTIb4J3vumy5+kY0LT1KsyPalRIedvFn3okv5TkoE3tn3wzsVZt8yJNOA3ISrqn7tQF6egkHTiS4/CVHHzYxzdeXj4HUxDz4e9zTi99ppEYRM7ssPTZ44k8GIaHVt5iKl789iv9Xi0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=analog.com; spf=pass smtp.mailfrom=analog.com; dkim=pass (2048-bit key) header.d=analog.com header.i=@analog.com header.b=WxCh0JSX; arc=none smtp.client-ip=148.163.135.77
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=analog.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=analog.com
Received: from pps.filterd (m0375855.ppops.net [127.0.0.1])
	by mx0b-00128a01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 491BrqTK017109;
	Tue, 1 Oct 2024 09:37:44 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=analog.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=DKIM; bh=wL/WC
	rvzO9RlUSy1K0T8S9A1E2ze10sPBfgd1EItZ94=; b=WxCh0JSXS7l+C463LR2SH
	Pi90J6PhEqLoQKNKHwmYdNUgSJ6/TyEG5AzsCVA2VXMLjx8kPRGxQBHhROM72PxI
	PDFHHBXdbbv9wg34WqhIo/9WF0viZcNLebm/bxMI0D4heK2Bswrt7Z/OftMslbW5
	qIH+CS11K2Po+DA4huNyDB9z1NeyMGnYYPrYhgdxL1harpXLiGiB81Bw0d4jvOz/
	Dqi8r6CP3rVLPRpNdeVmETisKBMhltGB8P4TcmNnTbkuC1nkfBLZKhQ0bM8kI3BX
	ktHMDy+tyTZSv2vnDkRpLP8I6Dpor+HUlZeO95C1YnRrjA75M6chUod0oh/acWTB
	Q==
Received: from nwd2mta4.analog.com ([137.71.173.58])
	by mx0b-00128a01.pphosted.com (PPS) with ESMTPS id 420c0dshq0-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 01 Oct 2024 09:37:44 -0400 (EDT)
Received: from ASHBMBX9.ad.analog.com (ASHBMBX9.ad.analog.com [10.64.17.10])
	by nwd2mta4.analog.com (8.14.7/8.14.7) with ESMTP id 491DbgCj054541
	(version=TLSv1/SSLv3 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
	Tue, 1 Oct 2024 09:37:42 -0400
Received: from ASHBCASHYB5.ad.analog.com (10.64.17.133) by
 ASHBMBX9.ad.analog.com (10.64.17.10) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.14; Tue, 1 Oct 2024 09:37:42 -0400
Received: from ASHBMBX9.ad.analog.com (10.64.17.10) by
 ASHBCASHYB5.ad.analog.com (10.64.17.133) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.14; Tue, 1 Oct 2024 09:37:42 -0400
Received: from zeus.spd.analog.com (10.66.68.11) by ashbmbx9.ad.analog.com
 (10.64.17.10) with Microsoft SMTP Server id 15.2.986.14 via Frontend
 Transport; Tue, 1 Oct 2024 09:37:42 -0400
Received: from [127.0.0.1] ([10.44.3.60])
	by zeus.spd.analog.com (8.15.1/8.15.1) with ESMTP id 491DbTeM022143;
	Tue, 1 Oct 2024 09:37:39 -0400
From: Nuno Sa <nuno.sa@analog.com>
Date: Tue, 1 Oct 2024 15:41:34 +0200
Subject: [PATCH 03/13] Input: adp5589-keys: add chip_info structure
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20241001-b4-dev-adp5589-fw-conversion-v1-3-fca0149dfc47@analog.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1727790102; l=17184;
 i=nuno.sa@analog.com; s=20231116; h=from:subject:message-id;
 bh=FYW2VZ8tOzZ8og6jW1LKSq+92i2u5QzNq3x7C28J0Cw=;
 b=z97WGzr6oLs3NqbA6jmxEDnwElz0a20fpL1L6UrsivMufDO4zQNG75oJxzu8v4SJGyLV23wXO
 pM2HQQ1PDW5AequPxZBjRZ3q++UMPykyAnWoAKaRIgSDt8wll2Ym5Oe
X-Developer-Key: i=nuno.sa@analog.com; a=ed25519;
 pk=3NQwYA013OUYZsmDFBf8rmyyr5iQlxV/9H4/Df83o1E=
X-ADIRuleOP-NewSCL: Rule Triggered
X-Proofpoint-GUID: iyv08UGvYIsbiQQLPsNulQZRx-WGht9u
X-Proofpoint-ORIG-GUID: iyv08UGvYIsbiQQLPsNulQZRx-WGht9u
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 spamscore=0 malwarescore=0
 bulkscore=0 impostorscore=0 mlxscore=0 priorityscore=1501
 lowpriorityscore=0 adultscore=0 clxscore=1015 suspectscore=0 phishscore=0
 mlxlogscore=999 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2408220000 definitions=main-2410010087

Add a more natural chip_info structure and add it to the i2c id table
driver data so that we do not need an enum a switch() to get the
specific bits of each device.

Signed-off-by: Nuno Sa <nuno.sa@analog.com>
---
 drivers/input/keyboard/adp5589-keys.c | 181 ++++++++++++++++++----------------
 1 file changed, 95 insertions(+), 86 deletions(-)

diff --git a/drivers/input/keyboard/adp5589-keys.c b/drivers/input/keyboard/adp5589-keys.c
index 922d3ab998f3a5dfbaf277f10eb19e5cd1b35415..eaa5440d4f9e14352409dd880cd254354612bf3e 100644
--- a/drivers/input/keyboard/adp5589-keys.c
+++ b/drivers/input/keyboard/adp5589-keys.c
@@ -228,16 +228,20 @@ struct adp_constants {
 	u8 (*reg) (u8 reg);
 };
 
+struct adp5589_info {
+	const struct adp_constants *var;
+	bool support_row5;
+	bool is_adp5585;
+};
+
 struct adp5589_kpad {
 	struct i2c_client *client;
 	struct input_dev *input;
-	const struct adp_constants *var;
+	const struct adp5589_info *info;
 	unsigned short keycode[ADP5589_KEYMAPSIZE];
 	const struct adp5589_gpi_map *gpimap;
 	unsigned short gpimapsize;
 	unsigned extend_cfg;
-	bool is_adp5585;
-	bool support_row5;
 #ifdef CONFIG_GPIOLIB
 	unsigned char gpiomap[ADP5589_MAXGPIO];
 	struct gpio_chip gc;
@@ -389,8 +393,8 @@ static int adp5589_write(struct i2c_client *client, u8 reg, u8 val)
 static int adp5589_gpio_get_value(struct gpio_chip *chip, unsigned off)
 {
 	struct adp5589_kpad *kpad = gpiochip_get_data(chip);
-	unsigned int bank = kpad->var->bank(kpad->gpiomap[off]);
-	unsigned int bit = kpad->var->bit(kpad->gpiomap[off]);
+	unsigned int bank = kpad->info->var->bank(kpad->gpiomap[off]);
+	unsigned int bit = kpad->info->var->bit(kpad->gpiomap[off]);
 	int val;
 
 	mutex_lock(&kpad->gpio_lock);
@@ -398,7 +402,7 @@ static int adp5589_gpio_get_value(struct gpio_chip *chip, unsigned off)
 		val = kpad->dat_out[bank];
 	else
 		val = adp5589_read(kpad->client,
-				   kpad->var->reg(ADP5589_GPI_STATUS_A) + bank);
+				   kpad->info->var->reg(ADP5589_GPI_STATUS_A) + bank);
 	mutex_unlock(&kpad->gpio_lock);
 
 	return !!(val & bit);
@@ -408,8 +412,8 @@ static void adp5589_gpio_set_value(struct gpio_chip *chip,
 				   unsigned off, int val)
 {
 	struct adp5589_kpad *kpad = gpiochip_get_data(chip);
-	unsigned int bank = kpad->var->bank(kpad->gpiomap[off]);
-	unsigned int bit = kpad->var->bit(kpad->gpiomap[off]);
+	unsigned int bank = kpad->info->var->bank(kpad->gpiomap[off]);
+	unsigned int bit = kpad->info->var->bit(kpad->gpiomap[off]);
 
 	mutex_lock(&kpad->gpio_lock);
 
@@ -418,7 +422,7 @@ static void adp5589_gpio_set_value(struct gpio_chip *chip,
 	else
 		kpad->dat_out[bank] &= ~bit;
 
-	adp5589_write(kpad->client, kpad->var->reg(ADP5589_GPO_DATA_OUT_A) +
+	adp5589_write(kpad->client, kpad->info->var->reg(ADP5589_GPO_DATA_OUT_A) +
 		      bank, kpad->dat_out[bank]);
 
 	mutex_unlock(&kpad->gpio_lock);
@@ -427,15 +431,15 @@ static void adp5589_gpio_set_value(struct gpio_chip *chip,
 static int adp5589_gpio_direction_input(struct gpio_chip *chip, unsigned off)
 {
 	struct adp5589_kpad *kpad = gpiochip_get_data(chip);
-	unsigned int bank = kpad->var->bank(kpad->gpiomap[off]);
-	unsigned int bit = kpad->var->bit(kpad->gpiomap[off]);
+	unsigned int bank = kpad->info->var->bank(kpad->gpiomap[off]);
+	unsigned int bit = kpad->info->var->bit(kpad->gpiomap[off]);
 	int ret;
 
 	mutex_lock(&kpad->gpio_lock);
 
 	kpad->dir[bank] &= ~bit;
 	ret = adp5589_write(kpad->client,
-			    kpad->var->reg(ADP5589_GPIO_DIRECTION_A) + bank,
+			    kpad->info->var->reg(ADP5589_GPIO_DIRECTION_A) + bank,
 			    kpad->dir[bank]);
 
 	mutex_unlock(&kpad->gpio_lock);
@@ -447,8 +451,8 @@ static int adp5589_gpio_direction_output(struct gpio_chip *chip,
 					 unsigned off, int val)
 {
 	struct adp5589_kpad *kpad = gpiochip_get_data(chip);
-	unsigned int bank = kpad->var->bank(kpad->gpiomap[off]);
-	unsigned int bit = kpad->var->bit(kpad->gpiomap[off]);
+	unsigned int bank = kpad->info->var->bank(kpad->gpiomap[off]);
+	unsigned int bit = kpad->info->var->bit(kpad->gpiomap[off]);
 	int ret;
 
 	mutex_lock(&kpad->gpio_lock);
@@ -460,10 +464,10 @@ static int adp5589_gpio_direction_output(struct gpio_chip *chip,
 	else
 		kpad->dat_out[bank] &= ~bit;
 
-	ret = adp5589_write(kpad->client, kpad->var->reg(ADP5589_GPO_DATA_OUT_A)
+	ret = adp5589_write(kpad->client, kpad->info->var->reg(ADP5589_GPO_DATA_OUT_A)
 			    + bank, kpad->dat_out[bank]);
 	ret |= adp5589_write(kpad->client,
-			     kpad->var->reg(ADP5589_GPIO_DIRECTION_A) + bank,
+			     kpad->info->var->reg(ADP5589_GPIO_DIRECTION_A) + bank,
 			     kpad->dir[bank]);
 
 	mutex_unlock(&kpad->gpio_lock);
@@ -480,23 +484,23 @@ static int adp5589_build_gpiomap(struct adp5589_kpad *kpad,
 
 	memset(pin_used, false, sizeof(pin_used));
 
-	for (i = 0; i < kpad->var->maxgpio; i++)
+	for (i = 0; i < kpad->info->var->maxgpio; i++)
 		if (pdata->keypad_en_mask & BIT(i))
 			pin_used[i] = true;
 
 	for (i = 0; i < kpad->gpimapsize; i++)
-		pin_used[kpad->gpimap[i].pin - kpad->var->gpi_pin_base] = true;
+		pin_used[kpad->gpimap[i].pin - kpad->info->var->gpi_pin_base] = true;
 
 	if (kpad->extend_cfg & R4_EXTEND_CFG)
 		pin_used[4] = true;
 
 	if (kpad->extend_cfg & C4_EXTEND_CFG)
-		pin_used[kpad->var->c4_extend_cfg] = true;
+		pin_used[kpad->info->var->c4_extend_cfg] = true;
 
-	if (!kpad->support_row5)
+	if (!kpad->info->support_row5)
 		pin_used[5] = true;
 
-	for (i = 0; i < kpad->var->maxgpio; i++)
+	for (i = 0; i < kpad->info->var->maxgpio; i++)
 		if (!pin_used[i])
 			kpad->gpiomap[n_unused++] = i;
 
@@ -536,11 +540,11 @@ static int adp5589_gpio_add(struct adp5589_kpad *kpad)
 	if (error)
 		return error;
 
-	for (i = 0; i <= kpad->var->bank(kpad->var->maxgpio); i++) {
-		kpad->dat_out[i] = adp5589_read(kpad->client, kpad->var->reg(
-						ADP5589_GPO_DATA_OUT_A) + i);
-		kpad->dir[i] = adp5589_read(kpad->client, kpad->var->reg(
-					    ADP5589_GPIO_DIRECTION_A) + i);
+	for (i = 0; i <= kpad->info->var->bank(kpad->info->var->maxgpio); i++) {
+		kpad->dat_out[i] = adp5589_read(kpad->client,
+						kpad->info->var->reg(ADP5589_GPO_DATA_OUT_A) + i);
+		kpad->dir[i] = adp5589_read(kpad->client,
+					    kpad->info->var->reg(ADP5589_GPIO_DIRECTION_A) + i);
 	}
 
 	return 0;
@@ -575,8 +579,8 @@ static void adp5589_report_events(struct adp5589_kpad *kpad, int ev_cnt)
 		int key = adp5589_read(kpad->client, ADP5589_5_FIFO_1 + i);
 		int key_val = key & KEY_EV_MASK;
 
-		if (key_val >= kpad->var->gpi_pin_base &&
-		    key_val <= kpad->var->gpi_pin_end) {
+		if (key_val >= kpad->info->var->gpi_pin_base &&
+		    key_val <= kpad->info->var->gpi_pin_end) {
 			adp5589_report_switches(kpad, key, key_val);
 		} else {
 			input_report_key(kpad->input,
@@ -614,7 +618,7 @@ static int adp5589_get_evcode(struct adp5589_kpad *kpad, unsigned short key)
 {
 	int i;
 
-	for (i = 0; i < kpad->var->keymapsize; i++)
+	for (i = 0; i < kpad->info->var->keymapsize; i++)
 		if (key == kpad->keycode[i])
 			return (i + 1) | KEY_EV_PRESSED;
 
@@ -628,22 +632,22 @@ static int adp5589_setup(struct adp5589_kpad *kpad)
 	struct i2c_client *client = kpad->client;
 	const struct adp5589_kpad_platform_data *pdata =
 		dev_get_platdata(&client->dev);
-	u8 (*reg) (u8) = kpad->var->reg;
+	u8 (*reg)(u8) = kpad->info->var->reg;
 	unsigned char evt_mode1 = 0, evt_mode2 = 0, evt_mode3 = 0;
 	unsigned char pull_mask = 0;
 	int i, ret;
 
 	ret = adp5589_write(client, reg(ADP5589_PIN_CONFIG_A),
-			    pdata->keypad_en_mask & kpad->var->row_mask);
+			    pdata->keypad_en_mask & kpad->info->var->row_mask);
 	ret |= adp5589_write(client, reg(ADP5589_PIN_CONFIG_B),
-			     (pdata->keypad_en_mask >> kpad->var->col_shift) &
-			     kpad->var->col_mask);
+			     (pdata->keypad_en_mask >> kpad->info->var->col_shift) &
+			     kpad->info->var->col_mask);
 
-	if (!kpad->is_adp5585)
+	if (!kpad->info->is_adp5585)
 		ret |= adp5589_write(client, ADP5589_PIN_CONFIG_C,
 				     (pdata->keypad_en_mask >> 16) & 0xFF);
 
-	if (!kpad->is_adp5585 && pdata->en_keylock) {
+	if (!kpad->info->is_adp5585 && pdata->en_keylock) {
 		ret |= adp5589_write(client, ADP5589_UNLOCK1,
 				     pdata->unlock_key1);
 		ret |= adp5589_write(client, ADP5589_UNLOCK2,
@@ -659,14 +663,14 @@ static int adp5589_setup(struct adp5589_kpad *kpad)
 	for (i = 0; i < pdata->gpimapsize; i++) {
 		unsigned short pin = pdata->gpimap[i].pin;
 
-		if (pin <= kpad->var->gpi_pin_row_end) {
-			evt_mode1 |= BIT(pin - kpad->var->gpi_pin_row_base);
+		if (pin <= kpad->info->var->gpi_pin_row_end) {
+			evt_mode1 |= BIT(pin - kpad->info->var->gpi_pin_row_base);
 		} else {
 			evt_mode2 |=
-			    BIT(pin - kpad->var->gpi_pin_col_base) & 0xFF;
-			if (!kpad->is_adp5585)
+			    BIT(pin - kpad->info->var->gpi_pin_col_base) & 0xFF;
+			if (!kpad->info->is_adp5585)
 				evt_mode3 |=
-				    BIT(pin - kpad->var->gpi_pin_col_base) >> 8;
+				    BIT(pin - kpad->info->var->gpi_pin_col_base) >> 8;
 		}
 	}
 
@@ -675,7 +679,7 @@ static int adp5589_setup(struct adp5589_kpad *kpad)
 				     evt_mode1);
 		ret |= adp5589_write(client, reg(ADP5589_GPI_EVENT_EN_B),
 				     evt_mode2);
-		if (!kpad->is_adp5585)
+		if (!kpad->info->is_adp5585)
 			ret |= adp5589_write(client,
 					     reg(ADP5589_GPI_EVENT_EN_C),
 					     evt_mode3);
@@ -685,7 +689,7 @@ static int adp5589_setup(struct adp5589_kpad *kpad)
 		pdata->pullup_en_300k & pdata->pulldown_en_300k)
 		dev_warn(&client->dev, "Conflicting pull resistor config\n");
 
-	for (i = 0; i <= kpad->var->max_row_num; i++) {
+	for (i = 0; i <= kpad->info->var->max_row_num; i++) {
 		unsigned int val = 0, bit = BIT(i);
 		if (pdata->pullup_en_300k & bit)
 			val = 0;
@@ -698,15 +702,15 @@ static int adp5589_setup(struct adp5589_kpad *kpad)
 
 		pull_mask |= val << (2 * (i & 0x3));
 
-		if (i % 4 == 3 || i == kpad->var->max_row_num) {
+		if (i % 4 == 3 || i == kpad->info->var->max_row_num) {
 			ret |= adp5589_write(client, reg(ADP5585_RPULL_CONFIG_A)
 					     + (i >> 2), pull_mask);
 			pull_mask = 0;
 		}
 	}
 
-	for (i = 0; i <= kpad->var->max_col_num; i++) {
-		unsigned int val = 0, bit = BIT(i + kpad->var->col_shift);
+	for (i = 0; i <= kpad->info->var->max_col_num; i++) {
+		unsigned int val = 0, bit = BIT(i + kpad->info->var->col_shift);
 		if (pdata->pullup_en_300k & bit)
 			val = 0;
 		else if (pdata->pulldown_en_300k & bit)
@@ -718,7 +722,7 @@ static int adp5589_setup(struct adp5589_kpad *kpad)
 
 		pull_mask |= val << (2 * (i & 0x3));
 
-		if (i % 4 == 3 || i == kpad->var->max_col_num) {
+		if (i % 4 == 3 || i == kpad->info->var->max_col_num) {
 			ret |= adp5589_write(client,
 					     reg(ADP5585_RPULL_CONFIG_C) +
 					     (i >> 2), pull_mask);
@@ -757,22 +761,22 @@ static int adp5589_setup(struct adp5589_kpad *kpad)
 	}
 
 	ret |= adp5589_write(client, reg(ADP5589_DEBOUNCE_DIS_A),
-			    pdata->debounce_dis_mask & kpad->var->row_mask);
+			    pdata->debounce_dis_mask & kpad->info->var->row_mask);
 
 	ret |= adp5589_write(client, reg(ADP5589_DEBOUNCE_DIS_B),
-			     (pdata->debounce_dis_mask >> kpad->var->col_shift)
-			     & kpad->var->col_mask);
+			     (pdata->debounce_dis_mask >> kpad->info->var->col_shift)
+			     & kpad->info->var->col_mask);
 
-	if (!kpad->is_adp5585)
+	if (!kpad->info->is_adp5585)
 		ret |= adp5589_write(client, reg(ADP5589_DEBOUNCE_DIS_C),
 				     (pdata->debounce_dis_mask >> 16) & 0xFF);
 
 	ret |= adp5589_write(client, reg(ADP5589_POLL_PTIME_CFG),
 			     pdata->scan_cycle_time & PTIME_MASK);
 	ret |= adp5589_write(client, ADP5589_5_INT_STATUS,
-			     (kpad->is_adp5585 ? 0 : LOGIC2_INT) |
+			     (kpad->info->is_adp5585 ? 0 : LOGIC2_INT) |
 			     LOGIC1_INT | OVRFLOW_INT |
-			     (kpad->is_adp5585 ? 0 : LOCK_INT) |
+			     (kpad->info->is_adp5585 ? 0 : LOCK_INT) |
 			     GPI_INT | EVENT_INT);	/* Status is W1C */
 
 	ret |= adp5589_write(client, reg(ADP5589_GENERAL_CFG),
@@ -793,24 +797,24 @@ static void adp5589_report_switch_state(struct adp5589_kpad *kpad)
 	int gpi_stat_tmp, pin_loc;
 	int i;
 	int gpi_stat1 = adp5589_read(kpad->client,
-				     kpad->var->reg(ADP5589_GPI_STATUS_A));
+				     kpad->info->var->reg(ADP5589_GPI_STATUS_A));
 	int gpi_stat2 = adp5589_read(kpad->client,
-				     kpad->var->reg(ADP5589_GPI_STATUS_B));
-	int gpi_stat3 = !kpad->is_adp5585 ?
+				     kpad->info->var->reg(ADP5589_GPI_STATUS_B));
+	int gpi_stat3 = !kpad->info->is_adp5585 ?
 			adp5589_read(kpad->client, ADP5589_GPI_STATUS_C) : 0;
 
 	for (i = 0; i < kpad->gpimapsize; i++) {
 		unsigned short pin = kpad->gpimap[i].pin;
 
-		if (pin <= kpad->var->gpi_pin_row_end) {
+		if (pin <= kpad->info->var->gpi_pin_row_end) {
 			gpi_stat_tmp = gpi_stat1;
-			pin_loc = pin - kpad->var->gpi_pin_row_base;
-		} else if ((pin - kpad->var->gpi_pin_col_base) < 8) {
+			pin_loc = pin - kpad->info->var->gpi_pin_row_base;
+		} else if ((pin - kpad->info->var->gpi_pin_col_base) < 8) {
 			gpi_stat_tmp = gpi_stat2;
-			pin_loc = pin - kpad->var->gpi_pin_col_base;
+			pin_loc = pin - kpad->info->var->gpi_pin_col_base;
 		} else {
 			gpi_stat_tmp = gpi_stat3;
-			pin_loc = pin - kpad->var->gpi_pin_col_base - 8;
+			pin_loc = pin - kpad->info->var->gpi_pin_col_base - 8;
 		}
 
 		if (gpi_stat_tmp < 0) {
@@ -837,14 +841,13 @@ static int adp5589_keypad_add(struct adp5589_kpad *kpad, unsigned int revid)
 	unsigned int i;
 	int error;
 
-	if (!((pdata->keypad_en_mask & kpad->var->row_mask) &&
-			(pdata->keypad_en_mask >> kpad->var->col_shift)) ||
-			!pdata->keymap) {
+	if (!((pdata->keypad_en_mask & kpad->info->var->row_mask) &&
+	      (pdata->keypad_en_mask >> kpad->info->var->col_shift)) || !pdata->keymap) {
 		dev_err(&client->dev, "no rows, cols or keymap from pdata\n");
 		return -EINVAL;
 	}
 
-	if (pdata->keymapsize != kpad->var->keymapsize) {
+	if (pdata->keymapsize != kpad->info->var->keymapsize) {
 		dev_err(&client->dev, "invalid keymapsize\n");
 		return -EINVAL;
 	}
@@ -854,7 +857,7 @@ static int adp5589_keypad_add(struct adp5589_kpad *kpad, unsigned int revid)
 		return -EINVAL;
 	}
 
-	if (pdata->gpimapsize > kpad->var->gpimapsize_max) {
+	if (pdata->gpimapsize > kpad->info->var->gpimapsize_max) {
 		dev_err(&client->dev, "invalid gpimapsize\n");
 		return -EINVAL;
 	}
@@ -862,13 +865,13 @@ static int adp5589_keypad_add(struct adp5589_kpad *kpad, unsigned int revid)
 	for (i = 0; i < pdata->gpimapsize; i++) {
 		unsigned short pin = pdata->gpimap[i].pin;
 
-		if (pin < kpad->var->gpi_pin_base ||
-				pin > kpad->var->gpi_pin_end) {
+		if (pin < kpad->info->var->gpi_pin_base ||
+		    pin > kpad->info->var->gpi_pin_end) {
 			dev_err(&client->dev, "invalid gpi pin data\n");
 			return -EINVAL;
 		}
 
-		if (BIT(pin - kpad->var->gpi_pin_row_base) &
+		if (BIT(pin - kpad->info->var->gpi_pin_row_base) &
 				pdata->keypad_en_mask) {
 			dev_err(&client->dev, "invalid gpi row/col data\n");
 			return -EINVAL;
@@ -945,12 +948,28 @@ static void adp5589_clear_config(void *data)
 {
 	struct adp5589_kpad *kpad = data;
 
-	adp5589_write(kpad->client, kpad->var->reg(ADP5589_GENERAL_CFG), 0);
+	adp5589_write(kpad->client, kpad->info->var->reg(ADP5589_GENERAL_CFG),
+		      0);
 }
 
+static const struct adp5589_info adp5589_info = {
+	.var = &const_adp5589,
+	.support_row5 = true,
+};
+
+static const struct adp5589_info adp5585_info = {
+	.var = &const_adp5585,
+	.is_adp5585 = true,
+};
+
+static const struct adp5589_info adp5585_2_info = {
+	.var = &const_adp5585,
+	.is_adp5585 = true,
+	.support_row5 = true,
+};
+
 static int adp5589_probe(struct i2c_client *client)
 {
-	const struct i2c_device_id *id = i2c_client_get_device_id(client);
 	struct adp5589_kpad *kpad;
 	const struct adp5589_kpad_platform_data *pdata =
 		dev_get_platdata(&client->dev);
@@ -974,19 +993,9 @@ static int adp5589_probe(struct i2c_client *client)
 
 	kpad->client = client;
 
-	switch (id->driver_data) {
-	case ADP5585_02:
-		kpad->support_row5 = true;
-		fallthrough;
-	case ADP5585_01:
-		kpad->is_adp5585 = true;
-		kpad->var = &const_adp5585;
-		break;
-	case ADP5589:
-		kpad->support_row5 = true;
-		kpad->var = &const_adp5589;
-		break;
-	}
+	kpad->info = i2c_get_match_data(client);
+	if (!kpad->info)
+		return -ENODEV;
 
 	error = devm_add_action_or_reset(&client->dev, adp5589_clear_config,
 					 kpad);
@@ -1045,9 +1054,9 @@ static int adp5589_resume(struct device *dev)
 static DEFINE_SIMPLE_DEV_PM_OPS(adp5589_dev_pm_ops, adp5589_suspend, adp5589_resume);
 
 static const struct i2c_device_id adp5589_id[] = {
-	{"adp5589-keys", ADP5589},
-	{"adp5585-keys", ADP5585_01},
-	{"adp5585-02-keys", ADP5585_02}, /* Adds ROW5 to ADP5585 */
+	{"adp5589-keys", (kernel_ulong_t)&adp5589_info},
+	{"adp5585-keys", (kernel_ulong_t)&adp5585_info},
+	{"adp5585-02-keys", (kernel_ulong_t)&adp5585_2_info}, /* Adds ROW5 to ADP5585 */
 	{}
 };
 

-- 
2.46.1


