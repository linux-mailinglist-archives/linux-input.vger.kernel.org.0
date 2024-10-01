Return-Path: <linux-input+bounces-6959-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 91F5E98BE17
	for <lists+linux-input@lfdr.de>; Tue,  1 Oct 2024 15:38:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id E3D17B210F2
	for <lists+linux-input@lfdr.de>; Tue,  1 Oct 2024 13:38:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 042FB1C68A7;
	Tue,  1 Oct 2024 13:38:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=analog.com header.i=@analog.com header.b="n3bAScr1"
X-Original-To: linux-input@vger.kernel.org
Received: from mx0b-00128a01.pphosted.com (mx0a-00128a01.pphosted.com [148.163.135.77])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 06E271C6896;
	Tue,  1 Oct 2024 13:38:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.163.135.77
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727789884; cv=none; b=E2tl7eQ1lGiksi7BD+0q56AzWSZLyMPHZzh25lDf/eLZAB+Uo8XIuTXetvsmOdTHq8Dx7ADS57bKNWYMVB/WMVSDumNxCqxHsQharHNZIW3wh8cmpSLHMdWCJ1PPjFbNAq0PsEWlc3F8d4TBmzs3Omv90wDbWEMNpw4B3+abYGM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727789884; c=relaxed/simple;
	bh=rizNBtJ486XJJnqaFfOca2mOPb5guOouBTvguuqJnC8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:References:
	 In-Reply-To:To:CC; b=pztapXC5r60F28vvhfEygGZrV1aVWo9PtUOzSXvrKhQM3tJ1rgualcCXz9SwO1bY5UVXkHkzyfCJMgu7NNX3vYZYUiVlvHL81kHbRVa9Vg/H3XouBi1HC4GEY6i/jZeposKcMYvrz3Sg2hTG0dLTOnJ/cYVt498151qJfjfhzjQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=analog.com; spf=pass smtp.mailfrom=analog.com; dkim=pass (2048-bit key) header.d=analog.com header.i=@analog.com header.b=n3bAScr1; arc=none smtp.client-ip=148.163.135.77
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=analog.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=analog.com
Received: from pps.filterd (m0375855.ppops.net [127.0.0.1])
	by mx0b-00128a01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 491C26Pm017045;
	Tue, 1 Oct 2024 09:37:55 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=analog.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=DKIM; bh=l/tgV
	fN1uOkxivldFleBQjw28YA13m/bHfkJoPKEVIQ=; b=n3bAScr1pocNiUs807k/m
	77Vn4WHSP37eomAG4MEnheskt4xDXH9Eim6qkGSGcb+YxWJG7Y9haXtG77WYVN2h
	IhhQdWMxquI2mulD5jGp+3vE4tpq5oL2+/S4qF+vytLTgpUoUB16bYnO4Y7Nu9tP
	iP5WjTY3c/ZrpoLdS6cTMZzbTW0n7WW0UEBAGWqqOZXm6UlbnYhWjfqVqnSBY7kq
	/HW3f/SwlNLqY+/uuIYHKRQJy6klYTRLyLLgYXFxuSqSPh5voT9folULPTG3r5hI
	tYpflvv6ycF8Xs+TPRo9mxcvrMQM+1nRyFZgVtal+LT8faeRxjgVrcGQ5fsY2CoJ
	w==
Received: from nwd2mta4.analog.com ([137.71.173.58])
	by mx0b-00128a01.pphosted.com (PPS) with ESMTPS id 420c0dshr5-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 01 Oct 2024 09:37:55 -0400 (EDT)
Received: from ASHBMBX9.ad.analog.com (ASHBMBX9.ad.analog.com [10.64.17.10])
	by nwd2mta4.analog.com (8.14.7/8.14.7) with ESMTP id 491DbsM5054577
	(version=TLSv1/SSLv3 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
	Tue, 1 Oct 2024 09:37:54 -0400
Received: from ASHBMBX9.ad.analog.com (10.64.17.10) by ASHBMBX9.ad.analog.com
 (10.64.17.10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.14; Tue, 1 Oct 2024
 09:37:54 -0400
Received: from zeus.spd.analog.com (10.66.68.11) by ashbmbx9.ad.analog.com
 (10.64.17.10) with Microsoft SMTP Server id 15.2.986.14 via Frontend
 Transport; Tue, 1 Oct 2024 09:37:54 -0400
Received: from [127.0.0.1] ([10.44.3.60])
	by zeus.spd.analog.com (8.15.1/8.15.1) with ESMTP id 491DbTeU022143;
	Tue, 1 Oct 2024 09:37:49 -0400
From: Nuno Sa <nuno.sa@analog.com>
Date: Tue, 1 Oct 2024 15:41:42 +0200
Subject: [PATCH 11/13] Input: adp5589-keys: unify adp_constants in info
 struct
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20241001-b4-dev-adp5589-fw-conversion-v1-11-fca0149dfc47@analog.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1727790102; l=19043;
 i=nuno.sa@analog.com; s=20231116; h=from:subject:message-id;
 bh=rizNBtJ486XJJnqaFfOca2mOPb5guOouBTvguuqJnC8=;
 b=53wE4vz4c3TpruI0ssS7t0Yjc00cZRHNArSGfI7rmuyuayNUHaDXl9kg3J/EPacZdaNYYToA1
 3yy/9zaVIkjCn+ubNz7X8UUJWbi/pCfWwwNBTlw7vEVf5Hsx1URBP3c
X-Developer-Key: i=nuno.sa@analog.com; a=ed25519;
 pk=3NQwYA013OUYZsmDFBf8rmyyr5iQlxV/9H4/Df83o1E=
X-ADIRuleOP-NewSCL: Rule Triggered
X-Proofpoint-GUID: IYZqlVzP9AwknF-YGFQsilwird7cGCgG
X-Proofpoint-ORIG-GUID: IYZqlVzP9AwknF-YGFQsilwird7cGCgG
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 spamscore=0 malwarescore=0
 bulkscore=0 impostorscore=0 mlxscore=0 priorityscore=1501
 lowpriorityscore=0 adultscore=0 clxscore=1015 suspectscore=0 phishscore=0
 mlxlogscore=999 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2408220000 definitions=main-2410010087

It makes no sense to have both chip_info and struct adp_constants.
Hence, let's move it all to the more common chip_info structure.

Signed-off-by: Nuno Sa <nuno.sa@analog.com>
---
 drivers/input/keyboard/adp5589-keys.c | 192 +++++++++++++++++-----------------
 1 file changed, 94 insertions(+), 98 deletions(-)

diff --git a/drivers/input/keyboard/adp5589-keys.c b/drivers/input/keyboard/adp5589-keys.c
index 741353bf19ca8725d6697507c1d2183a019972a4..8cbc2c861ffc2854b5621e515712ae107f46a73f 100644
--- a/drivers/input/keyboard/adp5589-keys.c
+++ b/drivers/input/keyboard/adp5589-keys.c
@@ -235,7 +235,9 @@
 
 #define ADP5589_MAX_UNLOCK_TIME_SEC	7
 
-struct adp_constants {
+struct adp5589_info {
+	u8 rpull_banks;
+	u8 c4_extend_cfg;
 	u8 maxgpio;
 	u8 keymapsize;
 	u8 gpi_pin_base;
@@ -243,19 +245,13 @@ struct adp_constants {
 	u8 max_row_num;
 	u8 max_col_num;
 	u8 col_shift;
-	u8 c4_extend_cfg;
+	bool support_row5;
+	bool is_adp5585;
 	u8 (*bank)(u8 offset);
 	u8 (*bit)(u8 offset);
 	u8 (*reg)(u8 reg);
 };
 
-struct adp5589_info {
-	const struct adp_constants *var;
-	u8 rpull_banks;
-	bool support_row5;
-	bool is_adp5585;
-};
-
 struct adp5589_kpad {
 	struct i2c_client *client;
 	struct input_dev *input;
@@ -309,20 +305,6 @@ static unsigned char adp5589_reg(unsigned char reg)
 	return reg;
 }
 
-static const struct adp_constants const_adp5589 = {
-	.maxgpio		= ADP5589_MAXGPIO,
-	.keymapsize		= ADP5589_KEYMAPSIZE,
-	.gpi_pin_base		= 97,
-	.gpi_pin_end		= 115,
-	.c4_extend_cfg		= 12,
-	.max_row_num		= ADP5589_MAX_ROW_NUM,
-	.max_col_num		= ADP5589_MAX_COL_NUM,
-	.col_shift		= ADP5589_COL_SHIFT,
-	.bank			= adp5589_bank,
-	.bit			= adp5589_bit,
-	.reg			= adp5589_reg,
-};
-
 /* ADP5585 */
 
 static unsigned char adp5585_bank(unsigned char offset)
@@ -384,20 +366,6 @@ static unsigned char adp5585_reg(unsigned char reg)
 	return adp5585_reg_lut[reg];
 }
 
-static const struct adp_constants const_adp5585 = {
-	.maxgpio		= ADP5585_MAXGPIO,
-	.keymapsize		= ADP5585_KEYMAPSIZE,
-	.gpi_pin_base		= 37,
-	.gpi_pin_end		= 47,
-	.c4_extend_cfg		= 10,
-	.max_row_num		= ADP5585_MAX_ROW_NUM,
-	.max_col_num		= ADP5585_MAX_COL_NUM,
-	.col_shift		= ADP5585_COL_SHIFT,
-	.bank			= adp5585_bank,
-	.bit			= adp5585_bit,
-	.reg			= adp5585_reg,
-};
-
 static int adp5589_read(struct i2c_client *client, u8 reg, u8 *val)
 {
 	int ret = i2c_smbus_read_byte_data(client, reg);
@@ -419,8 +387,8 @@ static int adp5589_write(struct i2c_client *client, u8 reg, u8 val)
 static int adp5589_gpio_get_value(struct gpio_chip *chip, unsigned int off)
 {
 	struct adp5589_kpad *kpad = gpiochip_get_data(chip);
-	unsigned int bank = kpad->info->var->bank(kpad->gpiomap[off]);
-	unsigned int bit = kpad->info->var->bit(kpad->gpiomap[off]);
+	unsigned int bank = kpad->info->bank(kpad->gpiomap[off]);
+	unsigned int bit = kpad->info->bit(kpad->gpiomap[off]);
 	int error;
 	u8 val;
 
@@ -429,7 +397,7 @@ static int adp5589_gpio_get_value(struct gpio_chip *chip, unsigned int off)
 		return !!(kpad->dat_out[bank] & bit);
 
 	error = adp5589_read(kpad->client,
-			     kpad->info->var->reg(ADP5589_GPI_STATUS_A) + bank,
+			     kpad->info->reg(ADP5589_GPI_STATUS_A) + bank,
 			     &val);
 	if (error)
 		return error;
@@ -441,8 +409,8 @@ static void adp5589_gpio_set_value(struct gpio_chip *chip,
 				   unsigned int off, int val)
 {
 	struct adp5589_kpad *kpad = gpiochip_get_data(chip);
-	unsigned int bank = kpad->info->var->bank(kpad->gpiomap[off]);
-	unsigned int bit = kpad->info->var->bit(kpad->gpiomap[off]);
+	unsigned int bank = kpad->info->bank(kpad->gpiomap[off]);
+	unsigned int bit = kpad->info->bit(kpad->gpiomap[off]);
 
 	guard(mutex)(&kpad->gpio_lock);
 
@@ -451,7 +419,7 @@ static void adp5589_gpio_set_value(struct gpio_chip *chip,
 	else
 		kpad->dat_out[bank] &= ~bit;
 
-	adp5589_write(kpad->client, kpad->info->var->reg(ADP5589_GPO_DATA_OUT_A) +
+	adp5589_write(kpad->client, kpad->info->reg(ADP5589_GPO_DATA_OUT_A) +
 		      bank, kpad->dat_out[bank]);
 }
 
@@ -459,14 +427,14 @@ static int adp5589_gpio_direction_input(struct gpio_chip *chip,
 					unsigned int off)
 {
 	struct adp5589_kpad *kpad = gpiochip_get_data(chip);
-	unsigned int bank = kpad->info->var->bank(kpad->gpiomap[off]);
-	unsigned int bit = kpad->info->var->bit(kpad->gpiomap[off]);
+	unsigned int bank = kpad->info->bank(kpad->gpiomap[off]);
+	unsigned int bit = kpad->info->bit(kpad->gpiomap[off]);
 
 	guard(mutex)(&kpad->gpio_lock);
 
 	kpad->dir[bank] &= ~bit;
 	return adp5589_write(kpad->client,
-			     kpad->info->var->reg(ADP5589_GPIO_DIRECTION_A) + bank,
+			     kpad->info->reg(ADP5589_GPIO_DIRECTION_A) + bank,
 			     kpad->dir[bank]);
 }
 
@@ -474,8 +442,8 @@ static int adp5589_gpio_direction_output(struct gpio_chip *chip,
 					 unsigned int off, int val)
 {
 	struct adp5589_kpad *kpad = gpiochip_get_data(chip);
-	unsigned int bank = kpad->info->var->bank(kpad->gpiomap[off]);
-	unsigned int bit = kpad->info->var->bit(kpad->gpiomap[off]);
+	unsigned int bank = kpad->info->bank(kpad->gpiomap[off]);
+	unsigned int bit = kpad->info->bit(kpad->gpiomap[off]);
 	int ret;
 
 	guard(mutex)(&kpad->gpio_lock);
@@ -487,13 +455,13 @@ static int adp5589_gpio_direction_output(struct gpio_chip *chip,
 	else
 		kpad->dat_out[bank] &= ~bit;
 
-	ret = adp5589_write(kpad->client, kpad->info->var->reg(ADP5589_GPO_DATA_OUT_A)
+	ret = adp5589_write(kpad->client, kpad->info->reg(ADP5589_GPO_DATA_OUT_A)
 			    + bank, kpad->dat_out[bank]);
 	if (ret)
 		return ret;
 
 	return adp5589_write(kpad->client,
-			     kpad->info->var->reg(ADP5589_GPIO_DIRECTION_A) + bank,
+			     kpad->info->reg(ADP5589_GPIO_DIRECTION_A) + bank,
 			     kpad->dir[bank]);
 }
 
@@ -525,9 +493,9 @@ static int adp5589_gpio_set_bias(struct adp5589_kpad *kpad, unsigned int pin,
 	 * between rows and columns. Hence, we detect when a pin is a column and
 	 * apply the proper offset and pin normalization.
 	 */
-	if (kpad->info->is_adp5585 && pin >= kpad->info->var->col_shift) {
-		bank = 2 + (pin - kpad->info->var->col_shift) / 4;
-		msk = adp5589_rpull_masks[(pin - kpad->info->var->col_shift) % 4];
+	if (kpad->info->is_adp5585 && pin >= kpad->info->col_shift) {
+		bank = 2 + (pin - kpad->info->col_shift) / 4;
+		msk = adp5589_rpull_masks[(pin - kpad->info->col_shift) % 4];
 	} else {
 		bank = pin / 4;
 		msk = adp5589_rpull_masks[pin % 4];
@@ -537,7 +505,7 @@ static int adp5589_gpio_set_bias(struct adp5589_kpad *kpad, unsigned int pin,
 	kpad->rpull[bank] = (kpad->rpull[bank] & ~msk) | (val & msk);
 
 	return adp5589_write(kpad->client,
-			     kpad->info->var->reg(ADP5589_RPULL_CONFIG_A) + bank,
+			     kpad->info->reg(ADP5589_RPULL_CONFIG_A) + bank,
 			     kpad->rpull[bank]);
 }
 
@@ -558,9 +526,9 @@ static int adp5589_gpio_set_config(struct gpio_chip *chip,  unsigned int off,
 	case PIN_CONFIG_BIAS_DISABLE:
 		return adp5589_gpio_set_bias(kpad, pin, cfg);
 	case PIN_CONFIG_INPUT_DEBOUNCE:
-		bank = kpad->info->var->bank(pin);
-		bit = kpad->info->var->bit(pin);
-		reg = kpad->info->var->reg(ADP5589_DEBOUNCE_DIS_A) + bank;
+		bank = kpad->info->bank(pin);
+		bit = kpad->info->bit(pin);
+		reg = kpad->info->reg(ADP5589_DEBOUNCE_DIS_A) + bank;
 
 		val = pinconf_to_config_argument(config);
 		if (val && val != 50) {
@@ -592,7 +560,7 @@ static int adp5589_build_gpiomap(struct adp5589_kpad *kpad)
 
 	memset(pin_used, false, sizeof(pin_used));
 
-	for (i = 0; i < kpad->info->var->maxgpio; i++)
+	for (i = 0; i < kpad->info->maxgpio; i++)
 		if (kpad->keypad_en_mask & BIT(i))
 			pin_used[i] = true;
 
@@ -600,12 +568,12 @@ static int adp5589_build_gpiomap(struct adp5589_kpad *kpad)
 		pin_used[4] = true;
 
 	if (kpad->extend_cfg & C4_EXTEND_CFG)
-		pin_used[kpad->info->var->c4_extend_cfg] = true;
+		pin_used[kpad->info->c4_extend_cfg] = true;
 
 	if (!kpad->info->support_row5)
 		pin_used[5] = true;
 
-	for (i = 0; i < kpad->info->var->maxgpio; i++)
+	for (i = 0; i < kpad->info->maxgpio; i++)
 		if (!pin_used[i])
 			kpad->gpiomap[n_unused++] = i;
 
@@ -624,14 +592,13 @@ static void adp5589_irq_bus_sync_unlock(struct irq_data *d)
 {
 	struct gpio_chip *gc = irq_data_get_irq_chip_data(d);
 	struct adp5589_kpad *kpad = gpiochip_get_data(gc);
-	const struct adp_constants *var = kpad->info->var;
 	int i;
 
-	for (i = 0; i <= kpad->info->var->bank(kpad->info->var->maxgpio); i++) {
+	for (i = 0; i <= kpad->info->bank(kpad->info->maxgpio); i++) {
 		if (kpad->int_en[i] ^ kpad->irq_mask[i]) {
 			kpad->int_en[i] = kpad->irq_mask[i];
 			adp5589_write(kpad->client,
-				      var->reg(ADP5589_GPI_EVENT_EN_A) + i,
+				      kpad->info->reg(ADP5589_GPI_EVENT_EN_A) + i,
 				      kpad->int_en[i]);
 		}
 	}
@@ -645,9 +612,9 @@ static void adp5589_irq_mask(struct irq_data *d)
 	struct adp5589_kpad *kpad = gpiochip_get_data(gc);
 	irq_hw_number_t hwirq = irqd_to_hwirq(d);
 	unsigned long real_irq = kpad->gpiomap[hwirq];
-	unsigned int bank = kpad->info->var->bank(real_irq);
+	unsigned int bank = kpad->info->bank(real_irq);
 
-	kpad->irq_mask[bank] &= ~kpad->info->var->bit(real_irq);
+	kpad->irq_mask[bank] &= ~kpad->info->bit(real_irq);
 	gpiochip_disable_irq(gc, hwirq);
 }
 
@@ -657,10 +624,10 @@ static void adp5589_irq_unmask(struct irq_data *d)
 	struct adp5589_kpad *kpad = gpiochip_get_data(gc);
 	irq_hw_number_t hwirq = irqd_to_hwirq(d);
 	unsigned long real_irq = kpad->gpiomap[hwirq];
-	unsigned int bank = kpad->info->var->bank(real_irq);
+	unsigned int bank = kpad->info->bank(real_irq);
 
 	gpiochip_enable_irq(gc, hwirq);
-	kpad->irq_mask[bank] |= kpad->info->var->bit(real_irq);
+	kpad->irq_mask[bank] |= kpad->info->bit(real_irq);
 }
 
 static int adp5589_irq_set_type(struct irq_data *d, unsigned int type)
@@ -726,21 +693,21 @@ static int adp5589_gpio_add(struct adp5589_kpad *kpad)
 	if (error)
 		return error;
 
-	for (i = 0; i <= kpad->info->var->bank(kpad->info->var->maxgpio); i++) {
+	for (i = 0; i <= kpad->info->bank(kpad->info->maxgpio); i++) {
 		error = adp5589_read(kpad->client,
-				     kpad->info->var->reg(ADP5589_GPO_DATA_OUT_A) + i,
+				     kpad->info->reg(ADP5589_GPO_DATA_OUT_A) + i,
 				     &kpad->dat_out[i]);
 		if (error)
 			return error;
 
 		error = adp5589_read(kpad->client,
-				     kpad->info->var->reg(ADP5589_GPIO_DIRECTION_A) + i,
+				     kpad->info->reg(ADP5589_GPIO_DIRECTION_A) + i,
 				     &kpad->dir[i]);
 		if (error)
 			return error;
 
 		error = adp5589_read(kpad->client,
-				     kpad->info->var->reg(ADP5589_DEBOUNCE_DIS_A) + i,
+				     kpad->info->reg(ADP5589_DEBOUNCE_DIS_A) + i,
 				     &kpad->debounce_dis[i]);
 		if (error)
 			return error;
@@ -748,7 +715,7 @@ static int adp5589_gpio_add(struct adp5589_kpad *kpad)
 
 	for (i = 0; i < kpad->info->rpull_banks; i++) {
 		error = adp5589_read(kpad->client,
-				     kpad->info->var->reg(ADP5589_RPULL_CONFIG_A) + i,
+				     kpad->info->reg(ADP5589_RPULL_CONFIG_A) + i,
 				     &kpad->rpull[i]);
 		if (error)
 			return error;
@@ -776,7 +743,7 @@ static unsigned long adp5589_gpiomap_get_hwirq(struct device *dev,
 static void adp5589_gpio_irq_handle(struct adp5589_kpad *kpad, int key_val,
 				    int key_press)
 {
-	unsigned int irq, gpio = key_val - kpad->info->var->gpi_pin_base, irq_type;
+	unsigned int irq, gpio = key_val - kpad->info->gpi_pin_base, irq_type;
 	struct i2c_client *client = kpad->client;
 	struct irq_data *irqd;
 	unsigned long hwirq;
@@ -824,13 +791,13 @@ static void adp5589_report_events(struct adp5589_kpad *kpad, int ev_cnt)
 		key_val = key & KEY_EV_MASK;
 		key_press = key & KEY_EV_PRESSED;
 
-		if (key_val >= kpad->info->var->gpi_pin_base &&
-		    key_val <= kpad->info->var->gpi_pin_end) {
+		if (key_val >= kpad->info->gpi_pin_base &&
+		    key_val <= kpad->info->gpi_pin_end) {
 			/* gpio line used as IRQ source */
 			adp5589_gpio_irq_handle(kpad, key_val, key_press);
 		} else {
-			int row = (key_val - 1) / (kpad->info->var->max_col_num + 1);
-			int col = (key_val - 1) % (kpad->info->var->max_col_num + 1);
+			int row = (key_val - 1) / (kpad->info->max_col_num + 1);
+			int col = (key_val - 1) % (kpad->info->max_col_num + 1);
 			int code = MATRIX_SCAN_CODE(row, col, kpad->row_shift);
 
 			dev_dbg_ratelimited(&kpad->client->dev,
@@ -875,7 +842,7 @@ static irqreturn_t adp5589_irq(int irq, void *handle)
 static int adp5589_setup(struct adp5589_kpad *kpad)
 {
 	struct i2c_client *client = kpad->client;
-	u8 (*reg)(u8) = kpad->info->var->reg;
+	u8 (*reg)(u8) = kpad->info->reg;
 	int i, ret;
 	u8 dummy;
 
@@ -885,7 +852,7 @@ static int adp5589_setup(struct adp5589_kpad *kpad)
 		return ret;
 
 	ret = adp5589_write(client, reg(ADP5589_PIN_CONFIG_B),
-			    kpad->keypad_en_mask >> kpad->info->var->col_shift);
+			    kpad->keypad_en_mask >> kpad->info->col_shift);
 	if (ret)
 		return ret;
 
@@ -982,7 +949,7 @@ static int adp5589_validate_key(struct adp5589_kpad *kpad, u32 key, bool is_gpi)
 	u32 row, col;
 
 	if (is_gpi) {
-		u32 gpi = key - kpad->info->var->gpi_pin_base;
+		u32 gpi = key - kpad->info->gpi_pin_base;
 
 		if (gpi == 5 && !kpad->info->support_row5) {
 			dev_err(&client->dev,
@@ -1002,12 +969,12 @@ static int adp5589_validate_key(struct adp5589_kpad *kpad, u32 key, bool is_gpi)
 		return 0;
 	}
 
-	row = (key - 1) / (kpad->info->var->max_col_num + 1);
-	col = (key - 1) % (kpad->info->var->max_col_num + 1);
+	row = (key - 1) / (kpad->info->max_col_num + 1);
+	col = (key - 1) % (kpad->info->max_col_num + 1);
 
 	/* both the row and col must be part of the keypad */
 	if (BIT(row) & kpad->keypad_en_mask &&
-	    BIT(col) << kpad->info->var->col_shift & kpad->keypad_en_mask)
+	    BIT(col) << kpad->info->col_shift & kpad->keypad_en_mask)
 		return 0;
 
 	dev_err(&client->dev, "Invalid unlock/reset key(%u) not used in the keypad(%x)\n",
@@ -1045,7 +1012,7 @@ static int adp5589_parse_key_array(struct adp5589_kpad *kpad, const char *prop,
 	if (ret)
 		return ret;
 
-	max_keypad = (kpad->info->var->max_row_num + 1) * (kpad->info->var->max_col_num + 1);
+	max_keypad = (kpad->info->max_row_num + 1) * (kpad->info->max_col_num + 1);
 
 	for (key = 0; key < *n_keys; key++) {
 		/* part of the keypad... */
@@ -1059,8 +1026,8 @@ static int adp5589_parse_key_array(struct adp5589_kpad *kpad, const char *prop,
 		}
 
 		/* part of gpio-keys... */
-		if (in_range(keys[key], kpad->info->var->gpi_pin_base,
-			     kpad->info->var->maxgpio)) {
+		if (in_range(keys[key], kpad->info->gpi_pin_base,
+			     kpad->info->maxgpio)) {
 			/* is the GPI being used as part of the keypad?! */
 			ret = adp5589_validate_key(kpad, keys[key], true);
 			if (ret)
@@ -1143,7 +1110,7 @@ static int adp5589_reset_parse(struct adp5589_kpad *kpad)
 		 * Then C4 is used as reset output. Make sure it's not being used
 		 * in the keypad.
 		 */
-		if (BIT(kpad->info->var->c4_extend_cfg) & kpad->keypad_en_mask) {
+		if (BIT(kpad->info->c4_extend_cfg) & kpad->keypad_en_mask) {
 			dev_err(&client->dev, "Col4 cannot be used if reset2 is used\n");
 			return -EINVAL;
 		}
@@ -1237,9 +1204,9 @@ static int adp5589_gpio_parse(struct adp5589_kpad *kpad)
 			return -EINVAL;
 		}
 
-		if (reg >= kpad->info->var->maxgpio) {
+		if (reg >= kpad->info->maxgpio) {
 			dev_err(&client->dev, "Invalid gpio(%u > %u)\n",
-				reg, kpad->info->var->maxgpio);
+				reg, kpad->info->maxgpio);
 			return -EINVAL;
 		}
 
@@ -1263,7 +1230,7 @@ static int adp5589_gpio_parse(struct adp5589_kpad *kpad)
 		}
 
 		/* Check if the gpio is being used as reset2 */
-		if (kpad->extend_cfg & C4_EXTEND_CFG && reg == kpad->info->var->c4_extend_cfg) {
+		if (kpad->extend_cfg & C4_EXTEND_CFG && reg == kpad->info->c4_extend_cfg) {
 			dev_err(&client->dev, "Invalid gpio(%u) used as reset2\n",
 				reg);
 			return -EINVAL;
@@ -1295,13 +1262,13 @@ static int adp5589_parse_fw(struct adp5589_kpad *kpad)
 	error = device_property_read_u32(&client->dev, "adi,cols-mask",
 					 &prop_val);
 	if (!error) {
-		if (prop_val > GENMASK(kpad->info->var->max_col_num, 0)) {
+		if (prop_val > GENMASK(kpad->info->max_col_num, 0)) {
 			dev_err(&client->dev, "Invalid column mask(%x)\n",
 				prop_val);
 			return -EINVAL;
 		}
 
-		kpad->keypad_en_mask = prop_val << kpad->info->var->col_shift;
+		kpad->keypad_en_mask = prop_val << kpad->info->col_shift;
 		/*
 		 * Note that given that we get a mask (and the HW allows it), we
 		 * can have holes in our keypad (eg: row0, row1 and row7 enabled).
@@ -1315,7 +1282,7 @@ static int adp5589_parse_fw(struct adp5589_kpad *kpad)
 	error = device_property_read_u32(&client->dev, "adi,rows-mask",
 					 &prop_val);
 	if (!error) {
-		if (prop_val > GENMASK(kpad->info->var->max_row_num, 0)) {
+		if (prop_val > GENMASK(kpad->info->max_row_num, 0)) {
 			dev_err(&client->dev, "Invalid row mask(%x)\n",
 				prop_val);
 			return -EINVAL;
@@ -1441,27 +1408,56 @@ static void adp5589_clear_config(void *data)
 {
 	struct adp5589_kpad *kpad = data;
 
-	adp5589_write(kpad->client, kpad->info->var->reg(ADP5589_GENERAL_CFG),
-		      0);
+	adp5589_write(kpad->client, kpad->info->reg(ADP5589_GENERAL_CFG), 0);
 }
 
 static const struct adp5589_info adp5589_info = {
-	.var = &const_adp5589,
 	.support_row5 = true,
 	.rpull_banks = ADP5589_RPULL_CONFIG_E - ADP5589_RPULL_CONFIG_A + 1,
+	.c4_extend_cfg = 12,
+	.maxgpio = ADP5589_MAXGPIO,
+	.keymapsize = ADP5589_KEYMAPSIZE,
+	.gpi_pin_base = 97,
+	.gpi_pin_end = 115,
+	.max_row_num = ADP5589_MAX_ROW_NUM,
+	.max_col_num = ADP5589_MAX_COL_NUM,
+	.col_shift = ADP5589_COL_SHIFT,
+	.bank = adp5589_bank,
+	.bit = adp5589_bit,
+	.reg = adp5589_reg,
 };
 
 static const struct adp5589_info adp5585_info = {
-	.var = &const_adp5585,
 	.is_adp5585 = true,
 	.rpull_banks = ADP5585_RPULL_CONFIG_D - ADP5585_RPULL_CONFIG_A + 1,
+	.c4_extend_cfg = 10,
+	.maxgpio = ADP5585_MAXGPIO,
+	.keymapsize = ADP5585_KEYMAPSIZE,
+	.gpi_pin_base = 37,
+	.gpi_pin_end = 47,
+	.max_row_num = ADP5585_MAX_ROW_NUM,
+	.max_col_num = ADP5585_MAX_COL_NUM,
+	.col_shift = ADP5585_COL_SHIFT,
+	.bank = adp5585_bank,
+	.bit = adp5585_bit,
+	.reg = adp5585_reg,
 };
 
 static const struct adp5589_info adp5585_2_info = {
-	.var = &const_adp5585,
 	.is_adp5585 = true,
 	.support_row5 = true,
 	.rpull_banks = ADP5585_RPULL_CONFIG_D - ADP5585_RPULL_CONFIG_A + 1,
+	.c4_extend_cfg = 10,
+	.maxgpio = ADP5585_MAXGPIO,
+	.keymapsize = ADP5585_KEYMAPSIZE,
+	.gpi_pin_base = 37,
+	.gpi_pin_end = 47,
+	.max_row_num = ADP5585_MAX_ROW_NUM,
+	.max_col_num = ADP5585_MAX_COL_NUM,
+	.col_shift = ADP5585_COL_SHIFT,
+	.bank = adp5585_bank,
+	.bit = adp5585_bit,
+	.reg = adp5585_reg,
 };
 
 static int adp5589_probe(struct i2c_client *client)

-- 
2.46.1


