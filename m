Return-Path: <linux-input+bounces-6947-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 01AD698BDFF
	for <lists+linux-input@lfdr.de>; Tue,  1 Oct 2024 15:38:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A0E57282D69
	for <lists+linux-input@lfdr.de>; Tue,  1 Oct 2024 13:38:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4A4891C5784;
	Tue,  1 Oct 2024 13:37:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=analog.com header.i=@analog.com header.b="R2bfI9vo"
X-Original-To: linux-input@vger.kernel.org
Received: from mx0b-00128a01.pphosted.com (mx0a-00128a01.pphosted.com [148.163.135.77])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A9CE1C461F;
	Tue,  1 Oct 2024 13:37:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.163.135.77
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727789877; cv=none; b=s/lh7a01kDxGu42im+fi2XB+8Awr+1KO5/RQeEJqbb1NsOPbVwFxmiNwg5g6oezNfs0RdDMOENWGKRLs9b9RijEnA+w6jetf7EKl1GDBSWEHfxfpn9GeAaaIIwkYd+SsrYm8wRJ2EJtzcqM6ScD2+Wm9nvj6unDxowE0GMJh5Gs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727789877; c=relaxed/simple;
	bh=iwtY1YNCuGXIRZTIYCjnenDHYvUdbPkieQ6Vu3G5Gx0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:References:
	 In-Reply-To:To:CC; b=tLcx/clwdQ4VacIKpK8I6v2vN1fMLMQm4/iQ2Gx7q2auJwVITNhePE+kYA5saAZIFgoTCiCcLkmntQ13bl75/wYGHOnMxhOdUJxUDhCsUiO4StS7uTRwC6rmRB8MuShHAL1wTfOyi3ONYKgpBYySKd3YnrZVk2RmaL8GLGFvVSI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=analog.com; spf=pass smtp.mailfrom=analog.com; dkim=pass (2048-bit key) header.d=analog.com header.i=@analog.com header.b=R2bfI9vo; arc=none smtp.client-ip=148.163.135.77
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=analog.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=analog.com
Received: from pps.filterd (m0375855.ppops.net [127.0.0.1])
	by mx0b-00128a01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 491C3bSI017051;
	Tue, 1 Oct 2024 09:37:47 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=analog.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=DKIM; bh=kjpQU
	SrlQGOo6qLsiOr+Ay7N2OSaRXRFAdvCgIHomhE=; b=R2bfI9voA0K5GpFBIEWw8
	Xr3mkz1otFwL34x/zDMKqgDHfIBeoZz7YbsTO/aRD4vmqVUtX/Qs7z1r7SXRltM0
	ECrkBZ1Nu8fVoFDW7RIMXVaxhNXNfp0kss+JKOF1+j8UudRJ6lbfi0lRlpvHro7d
	6bK/TmQamrXNEmLWLqBGdbmxWh3kiw146I7Df++7uZy0CbThxE6PVurdOY3iOqQB
	GgIBZTbrtkoWQAs6bK61OhorqnYXSnzjvlLY7l/5TcnEV9Ww2L96fNEfSeFrMUGM
	O1c9ZdmVtT7PSAj3twYZ+Rd/kNQ5E/ZkTNgLIb3ey+txv3J2ELMQsb5fmVbm+rOk
	Q==
Received: from nwd2mta4.analog.com ([137.71.173.58])
	by mx0b-00128a01.pphosted.com (PPS) with ESMTPS id 420c0dshq7-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 01 Oct 2024 09:37:47 -0400 (EDT)
Received: from ASHBMBX9.ad.analog.com (ASHBMBX9.ad.analog.com [10.64.17.10])
	by nwd2mta4.analog.com (8.14.7/8.14.7) with ESMTP id 491DbkG3054550
	(version=TLSv1/SSLv3 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
	Tue, 1 Oct 2024 09:37:46 -0400
Received: from ASHBCASHYB4.ad.analog.com (10.64.17.132) by
 ASHBMBX9.ad.analog.com (10.64.17.10) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.14; Tue, 1 Oct 2024 09:37:46 -0400
Received: from ASHBMBX9.ad.analog.com (10.64.17.10) by
 ASHBCASHYB4.ad.analog.com (10.64.17.132) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.14; Tue, 1 Oct 2024 09:37:45 -0400
Received: from zeus.spd.analog.com (10.66.68.11) by ashbmbx9.ad.analog.com
 (10.64.17.10) with Microsoft SMTP Server id 15.2.986.14 via Frontend
 Transport; Tue, 1 Oct 2024 09:37:45 -0400
Received: from [127.0.0.1] ([10.44.3.60])
	by zeus.spd.analog.com (8.15.1/8.15.1) with ESMTP id 491DbTeN022143;
	Tue, 1 Oct 2024 09:37:40 -0400
From: Nuno Sa <nuno.sa@analog.com>
Date: Tue, 1 Oct 2024 15:41:35 +0200
Subject: [PATCH 04/13] Input: adp5589-keys: support gpi key events as 'gpio
 keys'
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20241001-b4-dev-adp5589-fw-conversion-v1-4-fca0149dfc47@analog.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1727790102; l=14126;
 i=nuno.sa@analog.com; s=20231116; h=from:subject:message-id;
 bh=iwtY1YNCuGXIRZTIYCjnenDHYvUdbPkieQ6Vu3G5Gx0=;
 b=UcR+bwWOnQEwQYhMv6GbYgRPMCUyL749Kuc4R35hYt18tnbnr6bxfNjYa0K8K0SdjXdy369qB
 TQYTaNDpSc5CFYOE3UXxJxUtGu/K8i1m2og3LLi7XznbgrBRPr2DOUP
X-Developer-Key: i=nuno.sa@analog.com; a=ed25519;
 pk=3NQwYA013OUYZsmDFBf8rmyyr5iQlxV/9H4/Df83o1E=
X-ADIRuleOP-NewSCL: Rule Triggered
X-Proofpoint-GUID: iUaViRoaTKwhvP7RM1pTVTFeMfKEBBhd
X-Proofpoint-ORIG-GUID: iUaViRoaTKwhvP7RM1pTVTFeMfKEBBhd
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 spamscore=0 malwarescore=0
 bulkscore=0 impostorscore=0 mlxscore=0 priorityscore=1501
 lowpriorityscore=0 adultscore=0 clxscore=1015 suspectscore=0 phishscore=0
 mlxlogscore=987 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2408220000 definitions=main-2410010087

This change replaces the support for GPIs as key event generators.
Instead of reporting the events directly, we add a gpio based irqchip
so that these events can be consumed by keys defined in the gpio-keys
driver (as it's goal is indeed for keys on GPIOs capable of generating
interrupts).

The basic idea is that all the pins that are not being used as part of
the keymap matrix (or by the reset block) can be possibly requested as
GPIOs by gpio-keys (it's also fine to use these pins as plain interrupts
though that's not really the point).

While at it, always select GPIOLIB so that we don't need to use #ifdef
guards.

Signed-off-by: Nuno Sa <nuno.sa@analog.com>
---
 drivers/input/keyboard/Kconfig        |   2 +
 drivers/input/keyboard/adp5589-keys.c | 260 +++++++++++++++++-----------------
 include/linux/input/adp5589.h         |   2 -
 3 files changed, 133 insertions(+), 131 deletions(-)

diff --git a/drivers/input/keyboard/Kconfig b/drivers/input/keyboard/Kconfig
index a5015d6f8bedd6a2ae6e42eb28d20a0a109b4ddf..33ab9a178983b836a2724f870ebb9718b44da18a 100644
--- a/drivers/input/keyboard/Kconfig
+++ b/drivers/input/keyboard/Kconfig
@@ -53,6 +53,8 @@ config KEYBOARD_ADP5588
 config KEYBOARD_ADP5589
 	tristate "ADP5585/ADP5589 I2C QWERTY Keypad and IO Expander"
 	depends on I2C
+	select GPIOLIB
+	select GPIOLIB_IRQCHIP
 	help
 	  Say Y here if you want to use a ADP5585/ADP5589 attached to your
 	  system I2C bus.
diff --git a/drivers/input/keyboard/adp5589-keys.c b/drivers/input/keyboard/adp5589-keys.c
index eaa5440d4f9e14352409dd880cd254354612bf3e..f107ed08fc787d31c09a5177395085548a6fadd7 100644
--- a/drivers/input/keyboard/adp5589-keys.c
+++ b/drivers/input/keyboard/adp5589-keys.c
@@ -242,13 +242,13 @@ struct adp5589_kpad {
 	const struct adp5589_gpi_map *gpimap;
 	unsigned short gpimapsize;
 	unsigned extend_cfg;
-#ifdef CONFIG_GPIOLIB
 	unsigned char gpiomap[ADP5589_MAXGPIO];
 	struct gpio_chip gc;
 	struct mutex gpio_lock;	/* Protect cached dir, dat_out */
 	u8 dat_out[3];
 	u8 dir[3];
-#endif
+	u8 int_en[3];
+	u8 irq_mask[3];
 };
 
 /*
@@ -389,7 +389,6 @@ static int adp5589_write(struct i2c_client *client, u8 reg, u8 val)
 	return i2c_smbus_write_byte_data(client, reg, val);
 }
 
-#ifdef CONFIG_GPIOLIB
 static int adp5589_gpio_get_value(struct gpio_chip *chip, unsigned off)
 {
 	struct adp5589_kpad *kpad = gpiochip_get_data(chip);
@@ -488,9 +487,6 @@ static int adp5589_build_gpiomap(struct adp5589_kpad *kpad,
 		if (pdata->keypad_en_mask & BIT(i))
 			pin_used[i] = true;
 
-	for (i = 0; i < kpad->gpimapsize; i++)
-		pin_used[kpad->gpimap[i].pin - kpad->info->var->gpi_pin_base] = true;
-
 	if (kpad->extend_cfg & R4_EXTEND_CFG)
 		pin_used[4] = true;
 
@@ -507,11 +503,84 @@ static int adp5589_build_gpiomap(struct adp5589_kpad *kpad,
 	return n_unused;
 }
 
+static void adp5589_irq_bus_lock(struct irq_data *d)
+{
+	struct gpio_chip *gc = irq_data_get_irq_chip_data(d);
+	struct adp5589_kpad *kpad = gpiochip_get_data(gc);
+
+	mutex_lock(&kpad->gpio_lock);
+}
+
+static void adp5589_irq_bus_sync_unlock(struct irq_data *d)
+{
+	struct gpio_chip *gc = irq_data_get_irq_chip_data(d);
+	struct adp5589_kpad *kpad = gpiochip_get_data(gc);
+	const struct adp_constants *var = kpad->info->var;
+	int i;
+
+	for (i = 0; i <= kpad->info->var->bank(kpad->info->var->maxgpio); i++) {
+		if (kpad->int_en[i] ^ kpad->irq_mask[i]) {
+			kpad->int_en[i] = kpad->irq_mask[i];
+			adp5589_write(kpad->client,
+				      var->reg(ADP5589_GPI_EVENT_EN_A) + i,
+				      kpad->int_en[i]);
+		}
+	}
+
+	mutex_unlock(&kpad->gpio_lock);
+}
+
+static void adp5589_irq_mask(struct irq_data *d)
+{
+	struct gpio_chip *gc = irq_data_get_irq_chip_data(d);
+	struct adp5589_kpad *kpad = gpiochip_get_data(gc);
+	irq_hw_number_t hwirq = irqd_to_hwirq(d);
+	unsigned long real_irq = kpad->gpiomap[hwirq];
+	unsigned int bank = kpad->info->var->bank(real_irq);
+
+	kpad->irq_mask[bank] &= ~kpad->info->var->bit(real_irq);
+	gpiochip_disable_irq(gc, hwirq);
+}
+
+static void adp5589_irq_unmask(struct irq_data *d)
+{
+	struct gpio_chip *gc = irq_data_get_irq_chip_data(d);
+	struct adp5589_kpad *kpad = gpiochip_get_data(gc);
+	irq_hw_number_t hwirq = irqd_to_hwirq(d);
+	unsigned long real_irq = kpad->gpiomap[hwirq];
+	unsigned int bank = kpad->info->var->bank(real_irq);
+
+	gpiochip_enable_irq(gc, hwirq);
+	kpad->irq_mask[bank] |= kpad->info->var->bit(real_irq);
+}
+
+static int adp5589_irq_set_type(struct irq_data *d, unsigned int type)
+{
+	if (!(type & IRQ_TYPE_EDGE_BOTH))
+		return -EINVAL;
+
+	irq_set_handler_locked(d, handle_edge_irq);
+
+	return 0;
+}
+
+static const struct irq_chip adp5589_irq_chip = {
+	.name = "adp5589",
+	.irq_mask = adp5589_irq_mask,
+	.irq_unmask = adp5589_irq_unmask,
+	.irq_bus_lock = adp5589_irq_bus_lock,
+	.irq_bus_sync_unlock = adp5589_irq_bus_sync_unlock,
+	.irq_set_type = adp5589_irq_set_type,
+	.flags = IRQCHIP_SKIP_SET_WAKE | IRQCHIP_IMMUTABLE,
+	GPIOCHIP_IRQ_RESOURCE_HELPERS,
+};
+
 static int adp5589_gpio_add(struct adp5589_kpad *kpad)
 {
 	struct device *dev = &kpad->client->dev;
 	const struct adp5589_kpad_platform_data *pdata = dev_get_platdata(dev);
 	const struct adp5589_gpio_platform_data *gpio_data = pdata->gpio_data;
+	struct gpio_irq_chip *girq;
 	int i, error;
 
 	if (!gpio_data)
@@ -534,6 +603,11 @@ static int adp5589_gpio_add(struct adp5589_kpad *kpad)
 	kpad->gc.label = kpad->client->name;
 	kpad->gc.owner = THIS_MODULE;
 
+	girq = &kpad->gc.irq;
+	gpio_irq_chip_set_chip(girq, &adp5589_irq_chip);
+	girq->handler = handle_bad_irq;
+	girq->threaded = true;
+
 	mutex_init(&kpad->gpio_lock);
 
 	error = devm_gpiochip_add_data(dev, &kpad->gc, kpad);
@@ -549,26 +623,57 @@ static int adp5589_gpio_add(struct adp5589_kpad *kpad)
 
 	return 0;
 }
-#else
-static inline int adp5589_gpio_add(struct adp5589_kpad *kpad)
+
+static unsigned long adp5589_gpiomap_get_hwirq(struct device *dev,
+					       const u8 *map, unsigned int gpio,
+					       unsigned int ngpios)
 {
-	return 0;
+	unsigned int hwirq;
+
+	for (hwirq = 0; hwirq < ngpios; hwirq++)
+		if (map[hwirq] == gpio)
+			return hwirq;
+
+	/* should never happen */
+	dev_warn_ratelimited(dev, "could not find the hwirq for gpio(%u)\n", gpio);
+
+	return INVALID_HWIRQ;
 }
-#endif
 
-static void adp5589_report_switches(struct adp5589_kpad *kpad,
-				    int key, int key_val)
+static void adp5589_gpio_irq_handle(struct adp5589_kpad *kpad, int key_val,
+				    int key_press)
 {
-	int i;
+	unsigned int irq, gpio = key_val - kpad->info->var->gpi_pin_base, irq_type;
+	struct i2c_client *client = kpad->client;
+	struct irq_data *irqd;
+	unsigned long hwirq;
 
-	for (i = 0; i < kpad->gpimapsize; i++) {
-		if (key_val == kpad->gpimap[i].pin) {
-			input_report_switch(kpad->input,
-					    kpad->gpimap[i].sw_evt,
-					    key & KEY_EV_PRESSED);
-			break;
-		}
+	hwirq = adp5589_gpiomap_get_hwirq(&client->dev, kpad->gpiomap,
+					  gpio, kpad->gc.ngpio);
+	if (hwirq == INVALID_HWIRQ) {
+		dev_err(&client->dev, "Could not get hwirq for key(%u)\n", key_val);
+		return;
 	}
+
+	irq = irq_find_mapping(kpad->gc.irq.domain, hwirq);
+	if (!irq)
+		return;
+
+	irqd = irq_get_irq_data(irq);
+	if (!irqd) {
+		dev_err(&client->dev, "Could not get irq(%u) data\n", irq);
+		return;
+	}
+
+	irq_type = irqd_get_trigger_type(irqd);
+
+	/*
+	 * Default is active low which means key_press is asserted on
+	 * the falling edge.
+	 */
+	if ((irq_type & IRQ_TYPE_EDGE_RISING && !key_press) ||
+	    (irq_type & IRQ_TYPE_EDGE_FALLING && key_press))
+		handle_nested_irq(irq);
 }
 
 static void adp5589_report_events(struct adp5589_kpad *kpad, int ev_cnt)
@@ -578,15 +683,15 @@ static void adp5589_report_events(struct adp5589_kpad *kpad, int ev_cnt)
 	for (i = 0; i < ev_cnt; i++) {
 		int key = adp5589_read(kpad->client, ADP5589_5_FIFO_1 + i);
 		int key_val = key & KEY_EV_MASK;
+		int key_press = key & KEY_EV_PRESSED;
 
 		if (key_val >= kpad->info->var->gpi_pin_base &&
-		    key_val <= kpad->info->var->gpi_pin_end) {
-			adp5589_report_switches(kpad, key, key_val);
-		} else {
+		    key_val <= kpad->info->var->gpi_pin_end)
+			/* gpio line used as IRQ source */
+			adp5589_gpio_irq_handle(kpad, key_val, key_press);
+		else
 			input_report_key(kpad->input,
-					 kpad->keycode[key_val - 1],
-					 key & KEY_EV_PRESSED);
-		}
+					 kpad->keycode[key_val - 1], key_press);
 	}
 }
 
@@ -633,7 +738,6 @@ static int adp5589_setup(struct adp5589_kpad *kpad)
 	const struct adp5589_kpad_platform_data *pdata =
 		dev_get_platdata(&client->dev);
 	u8 (*reg)(u8) = kpad->info->var->reg;
-	unsigned char evt_mode1 = 0, evt_mode2 = 0, evt_mode3 = 0;
 	unsigned char pull_mask = 0;
 	int i, ret;
 
@@ -660,31 +764,6 @@ static int adp5589_setup(struct adp5589_kpad *kpad)
 	for (i = 0; i < KEYP_MAX_EVENT; i++)
 		ret |= adp5589_read(client, ADP5589_5_FIFO_1 + i);
 
-	for (i = 0; i < pdata->gpimapsize; i++) {
-		unsigned short pin = pdata->gpimap[i].pin;
-
-		if (pin <= kpad->info->var->gpi_pin_row_end) {
-			evt_mode1 |= BIT(pin - kpad->info->var->gpi_pin_row_base);
-		} else {
-			evt_mode2 |=
-			    BIT(pin - kpad->info->var->gpi_pin_col_base) & 0xFF;
-			if (!kpad->info->is_adp5585)
-				evt_mode3 |=
-				    BIT(pin - kpad->info->var->gpi_pin_col_base) >> 8;
-		}
-	}
-
-	if (pdata->gpimapsize) {
-		ret |= adp5589_write(client, reg(ADP5589_GPI_EVENT_EN_A),
-				     evt_mode1);
-		ret |= adp5589_write(client, reg(ADP5589_GPI_EVENT_EN_B),
-				     evt_mode2);
-		if (!kpad->info->is_adp5585)
-			ret |= adp5589_write(client,
-					     reg(ADP5589_GPI_EVENT_EN_C),
-					     evt_mode3);
-	}
-
 	if (pdata->pull_dis_mask & pdata->pullup_en_100k &
 		pdata->pullup_en_300k & pdata->pulldown_en_300k)
 		dev_warn(&client->dev, "Conflicting pull resistor config\n");
@@ -792,46 +871,6 @@ static int adp5589_setup(struct adp5589_kpad *kpad)
 	return 0;
 }
 
-static void adp5589_report_switch_state(struct adp5589_kpad *kpad)
-{
-	int gpi_stat_tmp, pin_loc;
-	int i;
-	int gpi_stat1 = adp5589_read(kpad->client,
-				     kpad->info->var->reg(ADP5589_GPI_STATUS_A));
-	int gpi_stat2 = adp5589_read(kpad->client,
-				     kpad->info->var->reg(ADP5589_GPI_STATUS_B));
-	int gpi_stat3 = !kpad->info->is_adp5585 ?
-			adp5589_read(kpad->client, ADP5589_GPI_STATUS_C) : 0;
-
-	for (i = 0; i < kpad->gpimapsize; i++) {
-		unsigned short pin = kpad->gpimap[i].pin;
-
-		if (pin <= kpad->info->var->gpi_pin_row_end) {
-			gpi_stat_tmp = gpi_stat1;
-			pin_loc = pin - kpad->info->var->gpi_pin_row_base;
-		} else if ((pin - kpad->info->var->gpi_pin_col_base) < 8) {
-			gpi_stat_tmp = gpi_stat2;
-			pin_loc = pin - kpad->info->var->gpi_pin_col_base;
-		} else {
-			gpi_stat_tmp = gpi_stat3;
-			pin_loc = pin - kpad->info->var->gpi_pin_col_base - 8;
-		}
-
-		if (gpi_stat_tmp < 0) {
-			dev_err(&kpad->client->dev,
-				"Can't read GPIO_DAT_STAT switch %d, default to OFF\n",
-				pin);
-			gpi_stat_tmp = 0;
-		}
-
-		input_report_switch(kpad->input,
-				    kpad->gpimap[i].sw_evt,
-				    !(gpi_stat_tmp & BIT(pin_loc)));
-	}
-
-	input_sync(kpad->input);
-}
-
 static int adp5589_keypad_add(struct adp5589_kpad *kpad, unsigned int revid)
 {
 	struct i2c_client *client = kpad->client;
@@ -852,32 +891,6 @@ static int adp5589_keypad_add(struct adp5589_kpad *kpad, unsigned int revid)
 		return -EINVAL;
 	}
 
-	if (!pdata->gpimap && pdata->gpimapsize) {
-		dev_err(&client->dev, "invalid gpimap from pdata\n");
-		return -EINVAL;
-	}
-
-	if (pdata->gpimapsize > kpad->info->var->gpimapsize_max) {
-		dev_err(&client->dev, "invalid gpimapsize\n");
-		return -EINVAL;
-	}
-
-	for (i = 0; i < pdata->gpimapsize; i++) {
-		unsigned short pin = pdata->gpimap[i].pin;
-
-		if (pin < kpad->info->var->gpi_pin_base ||
-		    pin > kpad->info->var->gpi_pin_end) {
-			dev_err(&client->dev, "invalid gpi pin data\n");
-			return -EINVAL;
-		}
-
-		if (BIT(pin - kpad->info->var->gpi_pin_row_base) &
-				pdata->keypad_en_mask) {
-			dev_err(&client->dev, "invalid gpi row/col data\n");
-			return -EINVAL;
-		}
-	}
-
 	if (!client->irq) {
 		dev_err(&client->dev, "no IRQ?\n");
 		return -EINVAL;
@@ -907,9 +920,6 @@ static int adp5589_keypad_add(struct adp5589_kpad *kpad, unsigned int revid)
 	memcpy(kpad->keycode, pdata->keymap,
 	       pdata->keymapsize * input->keycodesize);
 
-	kpad->gpimap = pdata->gpimap;
-	kpad->gpimapsize = pdata->gpimapsize;
-
 	/* setup input device */
 	__set_bit(EV_KEY, input->evbit);
 
@@ -921,11 +931,6 @@ static int adp5589_keypad_add(struct adp5589_kpad *kpad, unsigned int revid)
 			__set_bit(kpad->keycode[i], input->keybit);
 	__clear_bit(KEY_RESERVED, input->keybit);
 
-	if (kpad->gpimapsize)
-		__set_bit(EV_SW, input->evbit);
-	for (i = 0; i < kpad->gpimapsize; i++)
-		__set_bit(kpad->gpimap[i].sw_evt, input->swbit);
-
 	error = input_register_device(input);
 	if (error) {
 		dev_err(&client->dev, "unable to register input device\n");
@@ -1018,9 +1023,6 @@ static int adp5589_probe(struct i2c_client *client)
 	if (error)
 		return error;
 
-	if (kpad->gpimapsize)
-		adp5589_report_switch_state(kpad);
-
 	error = adp5589_gpio_add(kpad);
 	if (error)
 		return error;
diff --git a/include/linux/input/adp5589.h b/include/linux/input/adp5589.h
index 0e4742c8c81e3c2e1e78b3e3aeb6e6a07cc83215..6185fc1ba30869c014b2d3e49e21d46b464cba6a 100644
--- a/include/linux/input/adp5589.h
+++ b/include/linux/input/adp5589.h
@@ -166,8 +166,6 @@ struct adp5589_kpad_platform_data {
 	unsigned pullup_en_100k;	/* Pull-Up 100k Enable Mask */
 	unsigned pullup_en_300k;	/* Pull-Up 300k Enable Mask */
 	unsigned pulldown_en_300k;	/* Pull-Down 300k Enable Mask */
-	const struct adp5589_gpi_map *gpimap;
-	unsigned short gpimapsize;
 	const struct adp5589_gpio_platform_data *gpio_data;
 };
 

-- 
2.46.1


