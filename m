Return-Path: <linux-input+bounces-6955-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A96798BE0F
	for <lists+linux-input@lfdr.de>; Tue,  1 Oct 2024 15:38:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id F2DFC2852A1
	for <lists+linux-input@lfdr.de>; Tue,  1 Oct 2024 13:38:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6258E1C4601;
	Tue,  1 Oct 2024 13:38:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=analog.com header.i=@analog.com header.b="NsYJ4Lgm"
X-Original-To: linux-input@vger.kernel.org
Received: from mx0a-00128a01.pphosted.com (mx0a-00128a01.pphosted.com [148.163.135.77])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 975351EA87;
	Tue,  1 Oct 2024 13:37:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.163.135.77
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727789882; cv=none; b=p06a2bUjekn+jP6IyAq+GyUH5ZSn2fKeKxAb7qOoncA/UF4IvX1dR2Tv+aqv1zSWpMbWvSA6N73Q3I16jeSV/FrbZ0qAd03BLMWCHFyMm8pIj70GAwIt/SkMV9+tshJuz4NrDLwfRpah0+Kwpo+CWJIAfRELaiI2M9RM+AwEwfM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727789882; c=relaxed/simple;
	bh=Fal6Qnq9pX/yf6bUuTrpYl0EUbIylG2E5JWhwRe/gMs=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:References:
	 In-Reply-To:To:CC; b=eE/i0soQNvsjMmCo9cgsKKtrPfu2WXLwQQR2VWyHDo2QvUCVeieJYrp5CG2vuxSjAtWB6Bsj4F8wFSfjvKH8SCL7AcLRT5THYFxN7cWeJ7W1U0x1Cb+AGa0Yr0Uprf+SBkreRKn8xWg2Nxvn2ZHb2wecaXvsZ0CSscRXkO7PmvE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=analog.com; spf=pass smtp.mailfrom=analog.com; dkim=pass (2048-bit key) header.d=analog.com header.i=@analog.com header.b=NsYJ4Lgm; arc=none smtp.client-ip=148.163.135.77
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=analog.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=analog.com
Received: from pps.filterd (m0167089.ppops.net [127.0.0.1])
	by mx0a-00128a01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 491B6CXI030489;
	Tue, 1 Oct 2024 09:37:50 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=analog.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=DKIM; bh=UOwMn
	7+40yfa74YjVZ4l5EkQ8IwMsK5UEiwSz1d6jXo=; b=NsYJ4LgmU8prVkki2j87Q
	qi7Jwm1PYpFGOKybXKFmBGSGsYAtHR/aVFsMyMjyiDOUPvr0Lmiq9UfTYmMzLTx5
	oVqraXEZ1UBf75ZYe4vbHze3CIqZg5UDExyPz/iXNd0+m3DkLezg5eZtosrTyZhm
	GMeeObjlOM4ckG0wdpfA/6UC18K6cTm9w+XB9bu0TRCTFCdUo6Jt4vYPk8mfRRWq
	lB9j2BM/ObxSax7MG+t4tSafSwBgB1rMQ//C5jmykRA4Q4iiNt8PeIu7K3W069qU
	To3X+cMPxdE2xzam11FW3xV/6bsAGkRVZq5NxtQW+F99aC05hGrddunNm1Xj8KMl
	A==
Received: from nwd2mta4.analog.com ([137.71.173.58])
	by mx0a-00128a01.pphosted.com (PPS) with ESMTPS id 41yp2rxts8-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 01 Oct 2024 09:37:49 -0400 (EDT)
Received: from ASHBMBX8.ad.analog.com (ASHBMBX8.ad.analog.com [10.64.17.5])
	by nwd2mta4.analog.com (8.14.7/8.14.7) with ESMTP id 491Dbm3Y054553
	(version=TLSv1/SSLv3 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
	Tue, 1 Oct 2024 09:37:48 -0400
Received: from ASHBCASHYB4.ad.analog.com (10.64.17.132) by
 ASHBMBX8.ad.analog.com (10.64.17.5) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.14; Tue, 1 Oct 2024 09:37:48 -0400
Received: from ASHBMBX8.ad.analog.com (10.64.17.5) by
 ASHBCASHYB4.ad.analog.com (10.64.17.132) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.14; Tue, 1 Oct 2024 09:37:48 -0400
Received: from zeus.spd.analog.com (10.66.68.11) by ashbmbx8.ad.analog.com
 (10.64.17.5) with Microsoft SMTP Server id 15.2.986.14 via Frontend
 Transport; Tue, 1 Oct 2024 09:37:48 -0400
Received: from [127.0.0.1] ([10.44.3.60])
	by zeus.spd.analog.com (8.15.1/8.15.1) with ESMTP id 491DbTeP022143;
	Tue, 1 Oct 2024 09:37:43 -0400
From: Nuno Sa <nuno.sa@analog.com>
Date: Tue, 1 Oct 2024 15:41:37 +0200
Subject: [PATCH 06/13] Input: adp5589-keys: add support for fw properties
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20241001-b4-dev-adp5589-fw-conversion-v1-6-fca0149dfc47@analog.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1727790102; l=40752;
 i=nuno.sa@analog.com; s=20231116; h=from:subject:message-id;
 bh=Fal6Qnq9pX/yf6bUuTrpYl0EUbIylG2E5JWhwRe/gMs=;
 b=eLhL7+piyYHJhVqQ5kiolWaKPZ0YsyvCbdLaXFglKTOWxDY1k6vWO1VpR/vj7ENIRKXxFVnAP
 o/sF4it5/z6CpKWkaUVB7M3UVC1cqQHNq7xEPmKbVBgsqrf2AjKnGOl
X-Developer-Key: i=nuno.sa@analog.com; a=ed25519;
 pk=3NQwYA013OUYZsmDFBf8rmyyr5iQlxV/9H4/Df83o1E=
X-ADIRuleOP-NewSCL: Rule Triggered
X-Proofpoint-GUID: VR6DaRWCjh4dWbCtCUEKImUHK96zGKhS
X-Proofpoint-ORIG-GUID: VR6DaRWCjh4dWbCtCUEKImUHK96zGKhS
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0
 lowpriorityscore=0 phishscore=0 bulkscore=0 priorityscore=1501
 adultscore=0 spamscore=0 clxscore=1015 malwarescore=0 suspectscore=0
 mlxlogscore=999 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2408220000 definitions=main-2410010087

Use firmware properties (eg: OF) to get the device specific
configuration. This change just replaces the platform data since there
was no platform using it and so, it makes no sense having both.

Special note to the GPIO bias and debounce  settings that are now supported
as part of the gpio subsystem (using 'set_config()' callback).

While at it, also allow GPIO's to be usable even if no keymap is given.
Effectively this means that an interrupt is no longer mandatory. Only in
case:

1) Keymapd is being defined;
2) Or GPIs are being used as gpio-keys and the interrupt-controller is
   present.

Signed-off-by: Nuno Sa <nuno.sa@analog.com>
---
 MAINTAINERS                           |   1 -
 drivers/input/keyboard/Kconfig        |   1 +
 drivers/input/keyboard/adp5589-keys.c | 858 ++++++++++++++++++++++++++--------
 include/linux/input/adp5589.h         | 178 -------
 4 files changed, 656 insertions(+), 382 deletions(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index 120a1867b8f716ae11bffedab94a938c25888457..70170272a342c4191756615e1062d1b6b39f9767 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -552,7 +552,6 @@ S:	Supported
 W:	https://ez.analog.com/linux-software-drivers
 F:	Documentation/devicetree/bindings/input/adi,adp5589.yaml
 F:	drivers/input/keyboard/adp5589-keys.c
-F:	include/linux/input/adp5589.h
 
 ADP8860 BACKLIGHT DRIVER (ADP8860/ADP8861/ADP8863)
 M:	Michael Hennerich <michael.hennerich@analog.com>
diff --git a/drivers/input/keyboard/Kconfig b/drivers/input/keyboard/Kconfig
index 33ab9a178983b836a2724f870ebb9718b44da18a..9d03118a933c8d88002d63c576427afa5cd499ca 100644
--- a/drivers/input/keyboard/Kconfig
+++ b/drivers/input/keyboard/Kconfig
@@ -55,6 +55,7 @@ config KEYBOARD_ADP5589
 	depends on I2C
 	select GPIOLIB
 	select GPIOLIB_IRQCHIP
+	select INPUT_MATRIXKMAP
 	help
 	  Say Y here if you want to use a ADP5585/ADP5589 attached to your
 	  system I2C bus.
diff --git a/drivers/input/keyboard/adp5589-keys.c b/drivers/input/keyboard/adp5589-keys.c
index f107ed08fc787d31c09a5177395085548a6fadd7..d2c99f5cfee6a6b8adf4e3841fc235588632017b 100644
--- a/drivers/input/keyboard/adp5589-keys.c
+++ b/drivers/input/keyboard/adp5589-keys.c
@@ -7,21 +7,42 @@
  * Copyright (C) 2010-2011 Analog Devices Inc.
  */
 
+#include <linux/bitfield.h>
 #include <linux/bitops.h>
+#include <linux/bits.h>
+#include <linux/minmax.h>
 #include <linux/module.h>
+#include <linux/mod_devicetable.h>
 #include <linux/interrupt.h>
 #include <linux/irq.h>
 #include <linux/workqueue.h>
 #include <linux/errno.h>
 #include <linux/pm.h>
 #include <linux/pm_wakeirq.h>
-#include <linux/platform_device.h>
+#include <linux/property.h>
 #include <linux/input.h>
+#include <linux/input/matrix_keypad.h>
 #include <linux/i2c.h>
 #include <linux/gpio/driver.h>
 #include <linux/slab.h>
+#include <linux/units.h>
 
-#include <linux/input/adp5589.h>
+/*
+ * ADP5589 specific GPI and Keymap defines
+ */
+#define ADP5589_KEYMAPSIZE		88
+
+#define ADP5589_COL_SHIFT		8
+#define ADP5589_MAX_ROW_NUM		7
+#define ADP5589_MAX_COL_NUM		10
+/*
+ * ADP5585 specific GPI and Keymap defines
+ */
+#define ADP5585_KEYMAPSIZE		30
+
+#define ADP5585_COL_SHIFT		6
+#define ADP5585_MAX_ROW_NUM		5
+#define ADP5585_MAX_COL_NUM		4
 
 /* ADP5589/ADP5585 Common Registers */
 #define ADP5589_5_ID			0x00
@@ -188,6 +209,12 @@
 #define C4_EXTEND_CFG	BIT(6)		/* RESET2 */
 #define R4_EXTEND_CFG	BIT(5)		/* RESET1 */
 
+#define RESET1_POL		BIT(7)
+#define RESET2_POL		BIT(6)
+#define RST_PASSTHRU_EN		BIT(5)
+#define RESET_TRIGGER_TIME	GENMASK(4, 2)
+#define RESET_PULSE_WIDTH	GENMASK(1, 0)
+
 /* LOCK_CFG */
 #define LOCK_EN		BIT(0)
 
@@ -202,25 +229,18 @@
 #define ADP5589_MAXGPIO		19
 #define ADP5585_MAXGPIO		11 /* 10 on the ADP5585-01, 11 on ADP5585-02 */
 
-enum {
-	ADP5589,
-	ADP5585_01,
-	ADP5585_02
-};
+/* As needed for the matrix parsing code */
+#define ADP5589_MAX_KEYMAPSIZE	123
+
+#define ADP5589_MAX_UNLOCK_TIME_SEC	7
 
 struct adp_constants {
 	u8 maxgpio;
 	u8 keymapsize;
-	u8 gpi_pin_row_base;
-	u8 gpi_pin_row_end;
-	u8 gpi_pin_col_base;
 	u8 gpi_pin_base;
 	u8 gpi_pin_end;
-	u8 gpimapsize_max;
 	u8 max_row_num;
 	u8 max_col_num;
-	u8 row_mask;
-	u8 col_mask;
 	u8 col_shift;
 	u8 c4_extend_cfg;
 	u8 (*bank) (u8 offset);
@@ -230,6 +250,7 @@ struct adp_constants {
 
 struct adp5589_info {
 	const struct adp_constants *var;
+	u8 rpull_banks;
 	bool support_row5;
 	bool is_adp5585;
 };
@@ -238,13 +259,27 @@ struct adp5589_kpad {
 	struct i2c_client *client;
 	struct input_dev *input;
 	const struct adp5589_info *info;
-	unsigned short keycode[ADP5589_KEYMAPSIZE];
+	unsigned short keycode[ADP5589_MAX_KEYMAPSIZE];
 	const struct adp5589_gpi_map *gpimap;
+	unsigned long pull_up_100k_map;
+	u32 keypad_en_mask;
+	u32 key_poll_time;
+	u32 row_shift;
+	u32 unlock_time;
+	u32 unlock_keys[2];
+	u32 nkeys_unlock;
+	u32 reset1_keys[3];
+	u32 nkeys_reset1;
+	u32 reset2_keys[2];
+	u32 nkeys_reset2;
 	unsigned short gpimapsize;
 	unsigned extend_cfg;
 	unsigned char gpiomap[ADP5589_MAXGPIO];
 	struct gpio_chip gc;
 	struct mutex gpio_lock;	/* Protect cached dir, dat_out */
+	u8 reset_cfg;
+	u8 rpull[5];
+	u8 debounce_dis[3];
 	u8 dat_out[3];
 	u8 dir[3];
 	u8 int_en[3];
@@ -276,17 +311,11 @@ static unsigned char adp5589_reg(unsigned char reg)
 static const struct adp_constants const_adp5589 = {
 	.maxgpio		= ADP5589_MAXGPIO,
 	.keymapsize		= ADP5589_KEYMAPSIZE,
-	.gpi_pin_row_base	= ADP5589_GPI_PIN_ROW_BASE,
-	.gpi_pin_row_end	= ADP5589_GPI_PIN_ROW_END,
-	.gpi_pin_col_base	= ADP5589_GPI_PIN_COL_BASE,
-	.gpi_pin_base		= ADP5589_GPI_PIN_BASE,
-	.gpi_pin_end		= ADP5589_GPI_PIN_END,
-	.gpimapsize_max		= ADP5589_GPIMAPSIZE_MAX,
+	.gpi_pin_base		= 97,
+	.gpi_pin_end		= 115,
 	.c4_extend_cfg		= 12,
 	.max_row_num		= ADP5589_MAX_ROW_NUM,
 	.max_col_num		= ADP5589_MAX_COL_NUM,
-	.row_mask		= ADP5589_ROW_MASK,
-	.col_mask		= ADP5589_COL_MASK,
 	.col_shift		= ADP5589_COL_SHIFT,
 	.bank			= adp5589_bank,
 	.bit			= adp5589_bit,
@@ -357,17 +386,11 @@ static unsigned char adp5585_reg(unsigned char reg)
 static const struct adp_constants const_adp5585 = {
 	.maxgpio		= ADP5585_MAXGPIO,
 	.keymapsize		= ADP5585_KEYMAPSIZE,
-	.gpi_pin_row_base	= ADP5585_GPI_PIN_ROW_BASE,
-	.gpi_pin_row_end	= ADP5585_GPI_PIN_ROW_END,
-	.gpi_pin_col_base	= ADP5585_GPI_PIN_COL_BASE,
-	.gpi_pin_base		= ADP5585_GPI_PIN_BASE,
-	.gpi_pin_end		= ADP5585_GPI_PIN_END,
-	.gpimapsize_max		= ADP5585_GPIMAPSIZE_MAX,
+	.gpi_pin_base		= 37,
+	.gpi_pin_end		= 47,
 	.c4_extend_cfg		= 10,
 	.max_row_num		= ADP5585_MAX_ROW_NUM,
 	.max_col_num		= ADP5585_MAX_COL_NUM,
-	.row_mask		= ADP5585_ROW_MASK,
-	.col_mask		= ADP5585_COL_MASK,
 	.col_shift		= ADP5585_COL_SHIFT,
 	.bank			= adp5585_bank,
 	.bit			= adp5585_bit,
@@ -474,8 +497,99 @@ static int adp5589_gpio_direction_output(struct gpio_chip *chip,
 	return ret;
 }
 
-static int adp5589_build_gpiomap(struct adp5589_kpad *kpad,
-				const struct adp5589_kpad_platform_data *pdata)
+static const u8 adp5589_rpull_masks[] = {
+	GENMASK(1, 0),
+	GENMASK(3, 2),
+	GENMASK(5, 4),
+	GENMASK(7, 6)
+};
+
+static int adp5589_gpio_set_bias(struct adp5589_kpad *kpad, unsigned int pin,
+				 enum pin_config_param cfg)
+{
+	unsigned int bank, msk;
+	int error;
+	u8 val;
+
+	mutex_lock(&kpad->gpio_lock);
+
+	if (cfg == PIN_CONFIG_BIAS_PULL_UP)
+		val = test_bit(pin, &kpad->pull_up_100k_map) ? 2 : 0;
+	else if (cfg == PIN_CONFIG_BIAS_PULL_DOWN)
+		val = 1;
+	else
+		val = 3;
+
+	/*
+	 * For the BIAS configs, we have 4 pins per register. We need to take
+	 * care for the adp5585 variant where we have a hole in the registers
+	 * between rows and columns. Hence, we detect when a pin is a column and
+	 * apply the proper offset and pin normalization.
+	 */
+	if (kpad->info->is_adp5585 && pin >= kpad->info->var->col_shift) {
+		bank = 2 + (pin - kpad->info->var->col_shift) / 4;
+		msk = adp5589_rpull_masks[(pin - kpad->info->var->col_shift) % 4];
+	} else {
+		bank = pin / 4;
+		msk = adp5589_rpull_masks[pin % 4];
+	}
+
+	val <<= __bf_shf(msk);
+	kpad->rpull[bank] = (kpad->rpull[bank] & ~msk) | (val & msk);
+
+	error = adp5589_write(kpad->client,
+			      kpad->info->var->reg(ADP5589_RPULL_CONFIG_A) + bank,
+			      kpad->rpull[bank]);
+
+	mutex_unlock(&kpad->gpio_lock);
+
+	return error;
+}
+
+static int adp5589_gpio_set_config(struct gpio_chip *chip,  unsigned int off,
+				   unsigned long config)
+{
+	struct adp5589_kpad *kpad = gpiochip_get_data(chip);
+	unsigned int bank, bit, reg, pin = kpad->gpiomap[off];
+	unsigned int cfg = pinconf_to_config_param(config);
+	unsigned int val;
+	int error;
+
+	switch (cfg) {
+	case PIN_CONFIG_BIAS_PULL_UP:
+		fallthrough;
+	case PIN_CONFIG_BIAS_PULL_DOWN:
+		fallthrough;
+	case PIN_CONFIG_BIAS_DISABLE:
+		return adp5589_gpio_set_bias(kpad, pin, cfg);
+	case PIN_CONFIG_INPUT_DEBOUNCE:
+		bank = kpad->info->var->bank(pin);
+		bit = kpad->info->var->bit(pin);
+		reg = kpad->info->var->reg(ADP5589_DEBOUNCE_DIS_A) + bank;
+
+		val = pinconf_to_config_argument(config);
+		if (val && val != 50) {
+			dev_err(&kpad->client->dev, "Debounce needs to be 50us(%u)\n",
+				val);
+			return -EINVAL;
+		}
+
+		mutex_lock(&kpad->gpio_lock);
+		if (!val)
+			kpad->debounce_dis[bank] |= bit;
+		else
+			kpad->debounce_dis[bank] &= bit;
+
+		error = adp5589_write(kpad->client, reg,
+				      kpad->debounce_dis[bank]);
+		mutex_unlock(&kpad->gpio_lock);
+		return error;
+	default:
+		return -EOPNOTSUPP;
+	}
+}
+
+static int adp5589_build_gpiomap(struct adp5589_kpad *kpad)
 {
 	bool pin_used[ADP5589_MAXGPIO];
 	int n_unused = 0;
@@ -484,7 +598,7 @@ static int adp5589_build_gpiomap(struct adp5589_kpad *kpad,
 	memset(pin_used, false, sizeof(pin_used));
 
 	for (i = 0; i < kpad->info->var->maxgpio; i++)
-		if (pdata->keypad_en_mask & BIT(i))
+		if (kpad->keypad_en_mask & BIT(i))
 			pin_used[i] = true;
 
 	if (kpad->extend_cfg & R4_EXTEND_CFG)
@@ -578,16 +692,11 @@ static const struct irq_chip adp5589_irq_chip = {
 static int adp5589_gpio_add(struct adp5589_kpad *kpad)
 {
 	struct device *dev = &kpad->client->dev;
-	const struct adp5589_kpad_platform_data *pdata = dev_get_platdata(dev);
-	const struct adp5589_gpio_platform_data *gpio_data = pdata->gpio_data;
 	struct gpio_irq_chip *girq;
 	int i, error;
 
-	if (!gpio_data)
-		return 0;
-
 	kpad->gc.parent = dev;
-	kpad->gc.ngpio = adp5589_build_gpiomap(kpad, pdata);
+	kpad->gc.ngpio = adp5589_build_gpiomap(kpad);
 	if (kpad->gc.ngpio == 0) {
 		dev_info(dev, "No unused gpios left to export\n");
 		return 0;
@@ -597,16 +706,24 @@ static int adp5589_gpio_add(struct adp5589_kpad *kpad)
 	kpad->gc.direction_output = adp5589_gpio_direction_output;
 	kpad->gc.get = adp5589_gpio_get_value;
 	kpad->gc.set = adp5589_gpio_set_value;
+	kpad->gc.set_config = adp5589_gpio_set_config;
 	kpad->gc.can_sleep = 1;
 
-	kpad->gc.base = gpio_data->gpio_start;
+	kpad->gc.base = -1;
 	kpad->gc.label = kpad->client->name;
 	kpad->gc.owner = THIS_MODULE;
 
-	girq = &kpad->gc.irq;
-	gpio_irq_chip_set_chip(girq, &adp5589_irq_chip);
-	girq->handler = handle_bad_irq;
-	girq->threaded = true;
+	if (device_property_present(dev, "interrupt-controller")) {
+		if (!kpad->client->irq) {
+			dev_err(dev, "Unable to serve as interrupt controller without IRQ\n");
+			return -EINVAL;
+		}
+
+		girq = &kpad->gc.irq;
+		gpio_irq_chip_set_chip(girq, &adp5589_irq_chip);
+		girq->handler = handle_bad_irq;
+		girq->threaded = true;
+	}
 
 	mutex_init(&kpad->gpio_lock);
 
@@ -619,8 +736,15 @@ static int adp5589_gpio_add(struct adp5589_kpad *kpad)
 						kpad->info->var->reg(ADP5589_GPO_DATA_OUT_A) + i);
 		kpad->dir[i] = adp5589_read(kpad->client,
 					    kpad->info->var->reg(ADP5589_GPIO_DIRECTION_A) + i);
+		kpad->debounce_dis[i] = adp5589_read(kpad->client,
+						     kpad->info->var->reg(ADP5589_DEBOUNCE_DIS_A)
+						     + i);
 	}
 
+	for (i = 0; i < kpad->info->rpull_banks; i++)
+		kpad->rpull[i] = adp5589_read(kpad->client,
+					      kpad->info->var->reg(ADP5589_RPULL_CONFIG_A) + i);
+
 	return 0;
 }
 
@@ -686,12 +810,21 @@ static void adp5589_report_events(struct adp5589_kpad *kpad, int ev_cnt)
 		int key_press = key & KEY_EV_PRESSED;
 
 		if (key_val >= kpad->info->var->gpi_pin_base &&
-		    key_val <= kpad->info->var->gpi_pin_end)
+		    key_val <= kpad->info->var->gpi_pin_end) {
 			/* gpio line used as IRQ source */
 			adp5589_gpio_irq_handle(kpad, key_val, key_press);
-		else
+		} else {
+			int row = (key_val - 1) / (kpad->info->var->max_col_num + 1);
+			int col = (key_val - 1) % (kpad->info->var->max_col_num + 1);
+			int code = MATRIX_SCAN_CODE(row, col, kpad->row_shift);
+
+			dev_dbg_ratelimited(&kpad->client->dev,
+					    "report key(%d) r(%d) c(%d) code(%d)\n",
+					    key_val, row, col, kpad->keycode[code]);
+
 			input_report_key(kpad->input,
-					 kpad->keycode[key_val - 1], key_press);
+					 kpad->keycode[code], key_press);
+		}
 	}
 }
 
@@ -719,139 +852,72 @@ static irqreturn_t adp5589_irq(int irq, void *handle)
 	return IRQ_HANDLED;
 }
 
-static int adp5589_get_evcode(struct adp5589_kpad *kpad, unsigned short key)
-{
-	int i;
-
-	for (i = 0; i < kpad->info->var->keymapsize; i++)
-		if (key == kpad->keycode[i])
-			return (i + 1) | KEY_EV_PRESSED;
-
-	dev_err(&kpad->client->dev, "RESET/UNLOCK key not in keycode map\n");
-
-	return -EINVAL;
-}
-
 static int adp5589_setup(struct adp5589_kpad *kpad)
 {
 	struct i2c_client *client = kpad->client;
-	const struct adp5589_kpad_platform_data *pdata =
-		dev_get_platdata(&client->dev);
 	u8 (*reg)(u8) = kpad->info->var->reg;
-	unsigned char pull_mask = 0;
 	int i, ret;
 
 	ret = adp5589_write(client, reg(ADP5589_PIN_CONFIG_A),
-			    pdata->keypad_en_mask & kpad->info->var->row_mask);
+			    kpad->keypad_en_mask);
 	ret |= adp5589_write(client, reg(ADP5589_PIN_CONFIG_B),
-			     (pdata->keypad_en_mask >> kpad->info->var->col_shift) &
-			     kpad->info->var->col_mask);
+			     kpad->keypad_en_mask >> kpad->info->var->col_shift);
 
 	if (!kpad->info->is_adp5585)
 		ret |= adp5589_write(client, ADP5589_PIN_CONFIG_C,
-				     (pdata->keypad_en_mask >> 16) & 0xFF);
+				     kpad->keypad_en_mask >> 16);
 
-	if (!kpad->info->is_adp5585 && pdata->en_keylock) {
-		ret |= adp5589_write(client, ADP5589_UNLOCK1,
-				     pdata->unlock_key1);
-		ret |= adp5589_write(client, ADP5589_UNLOCK2,
-				     pdata->unlock_key2);
-		ret |= adp5589_write(client, ADP5589_UNLOCK_TIMERS,
-				     pdata->unlock_timer & LTIME_MASK);
-		ret |= adp5589_write(client, ADP5589_LOCK_CFG, LOCK_EN);
+	/* unlock keys */
+	for (i = 0; i < kpad->nkeys_unlock; i++) {
+		ret = adp5589_write(client, ADP5589_UNLOCK1 + i,
+				    kpad->unlock_keys[i] | KEY_EV_PRESSED);
+		if (ret)
+			return ret;
+	}
+
+	if (kpad->nkeys_unlock) {
+		ret = adp5589_write(client, ADP5589_UNLOCK_TIMERS,
+				    kpad->unlock_time);
+		if (ret)
+			return ret;
+
+		ret = adp5589_write(client, ADP5589_LOCK_CFG, LOCK_EN);
+		if (ret)
+			return ret;
 	}
 
 	for (i = 0; i < KEYP_MAX_EVENT; i++)
 		ret |= adp5589_read(client, ADP5589_5_FIFO_1 + i);
 
-	if (pdata->pull_dis_mask & pdata->pullup_en_100k &
-		pdata->pullup_en_300k & pdata->pulldown_en_300k)
-		dev_warn(&client->dev, "Conflicting pull resistor config\n");
-
-	for (i = 0; i <= kpad->info->var->max_row_num; i++) {
-		unsigned int val = 0, bit = BIT(i);
-		if (pdata->pullup_en_300k & bit)
-			val = 0;
-		else if (pdata->pulldown_en_300k & bit)
-			val = 1;
-		else if (pdata->pullup_en_100k & bit)
-			val = 2;
-		else if (pdata->pull_dis_mask & bit)
-			val = 3;
-
-		pull_mask |= val << (2 * (i & 0x3));
-
-		if (i % 4 == 3 || i == kpad->info->var->max_row_num) {
-			ret |= adp5589_write(client, reg(ADP5585_RPULL_CONFIG_A)
-					     + (i >> 2), pull_mask);
-			pull_mask = 0;
-		}
+	/* reset keys */
+	for (i = 0; i < kpad->nkeys_reset1; i++) {
+		ret = adp5589_write(client, reg(ADP5589_RESET1_EVENT_A + i),
+				    kpad->reset1_keys[i] | KEY_EV_PRESSED);
+		if (ret)
+			return ret;
 	}
 
-	for (i = 0; i <= kpad->info->var->max_col_num; i++) {
-		unsigned int val = 0, bit = BIT(i + kpad->info->var->col_shift);
-		if (pdata->pullup_en_300k & bit)
-			val = 0;
-		else if (pdata->pulldown_en_300k & bit)
-			val = 1;
-		else if (pdata->pullup_en_100k & bit)
-			val = 2;
-		else if (pdata->pull_dis_mask & bit)
-			val = 3;
-
-		pull_mask |= val << (2 * (i & 0x3));
-
-		if (i % 4 == 3 || i == kpad->info->var->max_col_num) {
-			ret |= adp5589_write(client,
-					     reg(ADP5585_RPULL_CONFIG_C) +
-					     (i >> 2), pull_mask);
-			pull_mask = 0;
-		}
-	}
-
-	if (pdata->reset1_key_1 && pdata->reset1_key_2 && pdata->reset1_key_3) {
-		ret |= adp5589_write(client, reg(ADP5589_RESET1_EVENT_A),
-				     adp5589_get_evcode(kpad,
-							pdata->reset1_key_1));
-		ret |= adp5589_write(client, reg(ADP5589_RESET1_EVENT_B),
-				     adp5589_get_evcode(kpad,
-							pdata->reset1_key_2));
-		ret |= adp5589_write(client, reg(ADP5589_RESET1_EVENT_C),
-				     adp5589_get_evcode(kpad,
-							pdata->reset1_key_3));
-		kpad->extend_cfg |= R4_EXTEND_CFG;
-	}
-
-	if (pdata->reset2_key_1 && pdata->reset2_key_2) {
-		ret |= adp5589_write(client, reg(ADP5589_RESET2_EVENT_A),
-				     adp5589_get_evcode(kpad,
-							pdata->reset2_key_1));
-		ret |= adp5589_write(client, reg(ADP5589_RESET2_EVENT_B),
-				     adp5589_get_evcode(kpad,
-							pdata->reset2_key_2));
-		kpad->extend_cfg |= C4_EXTEND_CFG;
+	for (i = 0; i < kpad->nkeys_reset2; i++) {
+		ret = adp5589_write(client, reg(ADP5589_RESET2_EVENT_A + i),
+				    kpad->reset2_keys[i] | KEY_EV_PRESSED);
+		if (ret)
+			return ret;
 	}
 
 	if (kpad->extend_cfg) {
-		ret |= adp5589_write(client, reg(ADP5589_RESET_CFG),
-				     pdata->reset_cfg);
-		ret |= adp5589_write(client, reg(ADP5589_PIN_CONFIG_D),
-				     kpad->extend_cfg);
+		ret = adp5589_write(client, reg(ADP5589_RESET_CFG),
+				    kpad->reset_cfg);
+		if (ret)
+			return ret;
+
+		ret = adp5589_write(client, reg(ADP5589_PIN_CONFIG_D),
+				    kpad->extend_cfg);
+		if (ret)
+			return ret;
 	}
 
-	ret |= adp5589_write(client, reg(ADP5589_DEBOUNCE_DIS_A),
-			    pdata->debounce_dis_mask & kpad->info->var->row_mask);
-
-	ret |= adp5589_write(client, reg(ADP5589_DEBOUNCE_DIS_B),
-			     (pdata->debounce_dis_mask >> kpad->info->var->col_shift)
-			     & kpad->info->var->col_mask);
-
-	if (!kpad->info->is_adp5585)
-		ret |= adp5589_write(client, reg(ADP5589_DEBOUNCE_DIS_C),
-				     (pdata->debounce_dis_mask >> 16) & 0xFF);
-
 	ret |= adp5589_write(client, reg(ADP5589_POLL_PTIME_CFG),
-			     pdata->scan_cycle_time & PTIME_MASK);
+			     kpad->key_poll_time);
 	ret |= adp5589_write(client, ADP5589_5_INT_STATUS,
 			     (kpad->info->is_adp5585 ? 0 : LOGIC2_INT) |
 			     LOGIC1_INT | OVRFLOW_INT |
@@ -871,31 +937,425 @@ static int adp5589_setup(struct adp5589_kpad *kpad)
 	return 0;
 }
 
+static int adp5589_validate_key(struct adp5589_kpad *kpad, u32 key, bool is_gpi)
+{
+	struct i2c_client *client = kpad->client;
+	u32 row, col;
+
+	if (is_gpi) {
+		u32 gpi = key - kpad->info->var->gpi_pin_base;
+
+		if (gpi == 5 && !kpad->info->support_row5) {
+			dev_err(&client->dev,
+				"Invalid unlock/reset GPI(%u) not supported\n",
+				gpi);
+			return -EINVAL;
+		}
+
+		/* check if it's being used in the keypad */
+		if (BIT(gpi) & kpad->keypad_en_mask) {
+			dev_err(&client->dev,
+				"Invalid unlock/reset GPI(%u) being used in the keypad(%x)\n",
+				gpi, kpad->keypad_en_mask);
+			return -EINVAL;
+		}
+
+		return 0;
+	}
+
+	row = (key - 1) / (kpad->info->var->max_col_num + 1);
+	col = (key - 1) % (kpad->info->var->max_col_num + 1);
+
+	/* both the row and col must be part of the keypad */
+	if (BIT(row) & kpad->keypad_en_mask &&
+	    BIT(col) << kpad->info->var->col_shift & kpad->keypad_en_mask)
+		return 0;
+
+	dev_err(&client->dev, "Invalid unlock/reset key(%u) not used in the keypad(%x)\n",
+		key, kpad->keypad_en_mask);
+
+	return -EINVAL;
+}
+
+static int adp5589_parse_key_array(struct adp5589_kpad *kpad, const char *prop,
+				   u32 *keys, u32 *n_keys, u32 max_keys,
+				   bool reset_key)
+{
+	struct i2c_client *client = kpad->client;
+	unsigned int key, max_keypad;
+	int ret;
+
+	ret = device_property_count_u32(&client->dev, prop);
+	if (ret < 0)
+		return 0;
+
+	*n_keys = ret;
+
+	if (kpad->info->is_adp5585 && !reset_key) {
+		dev_err(&client->dev, "Unlock keys not supported for adp5585\n");
+		return -EOPNOTSUPP;
+	}
+
+	if (*n_keys  > max_keys) {
+		dev_err(&client->dev, "Invalid number of keys(%u > %u) for %s\n",
+			*n_keys, max_keys, prop);
+		return -EINVAL;
+	}
+
+	ret = device_property_read_u32_array(&client->dev, prop, keys, *n_keys);
+	if (ret)
+		return ret;
+
+	max_keypad = (kpad->info->var->max_row_num + 1) * (kpad->info->var->max_col_num + 1);
+
+	for (key = 0; key < *n_keys; key++) {
+		/* part of the keypad... */
+		if (in_range(keys[key], 1, max_keypad)) {
+			/* is it part of the keypad?! */
+			ret = adp5589_validate_key(kpad, keys[key], false);
+			if (ret)
+				return ret;
+
+			continue;
+		}
+
+		/* part of gpio-keys... */
+		if (in_range(keys[key], kpad->info->var->gpi_pin_base,
+			     kpad->info->var->maxgpio)) {
+			/* is the GPI being used as part of the keypad?! */
+			ret = adp5589_validate_key(kpad, keys[key], true);
+			if (ret)
+				return ret;
+
+			continue;
+		}
+
+		/* wildcard unlock event... */
+		if (!reset_key && keys[key] == 127)
+			continue;
+
+		dev_err(&client->dev, "Invalid key(%u) for %s\n", keys[key],
+			prop);
+
+		return -EINVAL;
+	}
+
+	return 0;
+}
+
+static int adp5589_unlock_parse(struct adp5589_kpad *kpad)
+{
+	struct i2c_client *client = kpad->client;
+	int error;
+
+	error = adp5589_parse_key_array(kpad, "adi,unlock-keys",
+					kpad->unlock_keys, &kpad->nkeys_unlock,
+					ARRAY_SIZE(kpad->unlock_keys), false);
+	if (error)
+		return error;
+	if (!kpad->nkeys_unlock)
+		/* no unlock keys */
+		return 0;
+
+	error = device_property_read_u32(&client->dev, "adi,unlock-trigger-sec",
+					 &kpad->unlock_time);
+	if (!error) {
+		if (kpad->unlock_time > ADP5589_MAX_UNLOCK_TIME_SEC) {
+			dev_err(&client->dev, "Invalid unlock time(%u > %d)\n",
+				kpad->unlock_time, ADP5589_MAX_UNLOCK_TIME_SEC);
+			return -EINVAL;
+		}
+	}
+
+	return 0;
+}
+
+static int adp5589_reset_parse(struct adp5589_kpad *kpad)
+{
+	struct i2c_client *client = kpad->client;
+	u32 prop_val;
+	int error;
+
+	error = adp5589_parse_key_array(kpad, "adi,reset1-keys",
+					kpad->reset1_keys, &kpad->nkeys_reset1,
+					ARRAY_SIZE(kpad->reset1_keys), true);
+	if (error)
+		return error;
+	if (kpad->nkeys_reset1 > 0) {
+		/*
+		 * Then R4 is used as reset output. Make sure it's not being used
+		 * in the keypad.
+		 */
+		if (BIT(4) & kpad->keypad_en_mask) {
+			dev_err(&client->dev, "Row4 cannot be used if reset1 is used\n");
+			return -EINVAL;
+		}
+
+		kpad->extend_cfg = R4_EXTEND_CFG;
+	}
+
+	error = adp5589_parse_key_array(kpad, "adi,reset2-keys",
+					kpad->reset2_keys, &kpad->nkeys_reset2,
+					ARRAY_SIZE(kpad->reset2_keys), true);
+	if (error)
+		return error;
+	if (kpad->nkeys_reset2 > 0) {
+		/*
+		 * Then C4 is used as reset output. Make sure it's not being used
+		 * in the keypad.
+		 */
+		if (BIT(kpad->info->var->c4_extend_cfg) & kpad->keypad_en_mask) {
+			dev_err(&client->dev, "Col4 cannot be used if reset2 is used\n");
+			return -EINVAL;
+		}
+
+		kpad->extend_cfg |= C4_EXTEND_CFG;
+	}
+
+	if (!kpad->nkeys_reset2 && !kpad->nkeys_reset1)
+		return 0;
+
+	if (device_property_read_bool(&client->dev, "adi,reset1-active-high"))
+		kpad->reset_cfg |= FIELD_PREP(RESET1_POL, 1);
+
+	if (device_property_read_bool(&client->dev, "adi,reset2-active-high"))
+		kpad->reset_cfg |= FIELD_PREP(RESET2_POL, 1);
+
+	if (device_property_read_bool(&client->dev, "adi,rst-passtrough-enable"))
+		kpad->reset_cfg |= FIELD_PREP(RST_PASSTHRU_EN, 1);
+
+	error = device_property_read_u32(&client->dev, "adi,reset-trigger-ms",
+					 &prop_val);
+	if (!error) {
+		switch (prop_val) {
+		case 0:
+			kpad->reset_cfg |= FIELD_PREP(RESET_TRIGGER_TIME, 0);
+			break;
+		case 1000:
+			kpad->reset_cfg |= FIELD_PREP(RESET_TRIGGER_TIME, 1);
+			break;
+		case 1500:
+			kpad->reset_cfg |= FIELD_PREP(RESET_TRIGGER_TIME, 2);
+			break;
+		case 2000:
+			kpad->reset_cfg |= FIELD_PREP(RESET_TRIGGER_TIME, 3);
+			break;
+		case 2500:
+			kpad->reset_cfg |= FIELD_PREP(RESET_TRIGGER_TIME, 4);
+			break;
+		case 3000:
+			kpad->reset_cfg |= FIELD_PREP(RESET_TRIGGER_TIME, 5);
+			break;
+		case 3500:
+			kpad->reset_cfg |= FIELD_PREP(RESET_TRIGGER_TIME, 6);
+			break;
+		case 4000:
+			kpad->reset_cfg |= FIELD_PREP(RESET_TRIGGER_TIME, 7);
+			break;
+		default:
+			dev_err(&client->dev, "Invalid value(%u) for adi,reset-trigger-ms\n",
+				prop_val);
+			return -EINVAL;
+		}
+	}
+
+	error = device_property_read_u32(&client->dev,
+					 "adi,reset-pulse-width-us", &prop_val);
+	if (!error) {
+		switch (prop_val) {
+		case 500:
+			kpad->reset_cfg |= FIELD_PREP(RESET_PULSE_WIDTH, 0);
+			break;
+		case 1000:
+			kpad->reset_cfg |= FIELD_PREP(RESET_PULSE_WIDTH, 1);
+			break;
+		case 2000:
+			kpad->reset_cfg |= FIELD_PREP(RESET_PULSE_WIDTH, 2);
+			break;
+		case 10000:
+			kpad->reset_cfg |= FIELD_PREP(RESET_PULSE_WIDTH, 3);
+			break;
+		default:
+			dev_err(&client->dev, "Invalid value(%u) for adi,reset-pulse-width-us\n",
+				prop_val);
+			return -EINVAL;
+		}
+	}
+
+	return 0;
+}
+
+static int adp5589_gpio_parse(struct adp5589_kpad *kpad)
+{
+	struct i2c_client *client = kpad->client;
+	u32 reg, pullup;
+	int error;
+
+	device_for_each_child_node_scoped(&client->dev, child) {
+		error = fwnode_property_read_u32(child, "reg", &reg);
+		if (error) {
+			dev_err(&client->dev, "Failed to get reg property\n");
+			return -EINVAL;
+		}
+
+		if (reg >= kpad->info->var->maxgpio) {
+			dev_err(&client->dev, "Invalid gpio(%u > %u)\n",
+				reg, kpad->info->var->maxgpio);
+			return -EINVAL;
+		}
+
+		if (BIT(reg) & kpad->keypad_en_mask) {
+			dev_err(&client->dev, "Invalid gpio(%u) used in keypad\n",
+				reg);
+			return -EINVAL;
+		}
+
+		if (reg == 5 && !kpad->info->support_row5) {
+			dev_err(&client->dev, "Invalid gpio(%u) not supported\n",
+				reg);
+			return -EINVAL;
+		}
+
+		/* Check if it's gpio4 and R4 is being used as reset */
+		if (kpad->extend_cfg & R4_EXTEND_CFG && reg == 4) {
+			dev_err(&client->dev, "Invalid gpio(%u) used as reset1\n",
+				reg);
+			return -EINVAL;
+		}
+
+		/* Check if the gpio is being used as reset2 */
+		if (kpad->extend_cfg & C4_EXTEND_CFG && reg == kpad->info->var->c4_extend_cfg) {
+			dev_err(&client->dev, "Invalid gpio(%u) used as reset2\n",
+				reg);
+			return -EINVAL;
+		}
+
+		error = fwnode_property_read_u32(child, "adi,pull-up-ohms",
+						 &pullup);
+		if (!error) {
+			if (pullup != 100 * KILO && pullup != 300 * KILO) {
+				dev_err(&client->dev, "Invalid pullup resistor val(%u)",
+					pullup);
+				return -EINVAL;
+			}
+
+			if (pullup == 100 * KILO)
+				__set_bit(reg, &kpad->pull_up_100k_map);
+		}
+	}
+
+	return 0;
+}
+
+static int adp5589_parse_fw(struct adp5589_kpad *kpad)
+{
+	struct i2c_client *client = kpad->client;
+	u32 cols = 0, rows = 0, prop_val;
+	int error;
+
+	error = device_property_read_u32(&client->dev, "adi,cols-mask",
+					 &prop_val);
+	if (!error) {
+		if (prop_val > GENMASK(kpad->info->var->max_col_num, 0)) {
+			dev_err(&client->dev, "Invalid column mask(%x)\n",
+				prop_val);
+			return -EINVAL;
+		}
+
+		kpad->keypad_en_mask = prop_val << kpad->info->var->col_shift;
+		/*
+		 * Note that given that we get a mask (and the HW allows it), we
+		 * can have holes in our keypad (eg: row0, row1 and row7 enabled).
+		 * However, for the matrix parsing functions we need to pass the
+		 * number of rows/cols as the maximum row/col used plus 1. This
+		 * pretty much means we will also have holes in our SW keypad.
+		 */
+		cols = fls(prop_val);
+	}
+
+	error = device_property_read_u32(&client->dev, "adi,rows-mask",
+					 &prop_val);
+	if (!error) {
+		if (prop_val > GENMASK(kpad->info->var->max_row_num, 0)) {
+			dev_err(&client->dev, "Invalid row mask(%x)\n",
+				prop_val);
+			return -EINVAL;
+		}
+
+		if (prop_val & BIT(5) && !kpad->info->support_row5) {
+			dev_err(&client->dev, "Row5 not supported!\n");
+			return -EINVAL;
+		}
+
+		kpad->keypad_en_mask |= prop_val;
+		rows = fls(prop_val);
+	}
+
+	if (cols && !rows) {
+		dev_err(&client->dev, "Cannot have columns with no rows!\n");
+		return -EINVAL;
+	}
+
+	if (rows && !cols) {
+		dev_err(&client->dev, "Cannot have rows with no columns!\n");
+		return -EINVAL;
+	}
+
+	if (rows && cols) {
+		if (!client->irq) {
+			dev_err(&client->dev,
+				"Keymaps won't work without interrupts\n");
+			return -EINVAL;
+		}
+
+		error = matrix_keypad_build_keymap(NULL, NULL, rows, cols,
+						   kpad->keycode, kpad->input);
+		if (error)
+			return error;
+
+		kpad->row_shift = get_count_order(cols);
+	}
+
+	if (device_property_present(&client->dev, "autorepeat"))
+		__set_bit(EV_REP, kpad->input->evbit);
+
+	error = device_property_read_u32(&client->dev, "adi,key-poll-ms",
+					 &prop_val);
+	if (!error) {
+		switch (prop_val) {
+		case 10:
+			fallthrough;
+		case 20:
+			fallthrough;
+		case 30:
+			fallthrough;
+		case 40:
+			kpad->key_poll_time = prop_val / 10 - 1;
+			break;
+		default:
+			dev_err(&client->dev, "Invalid value(%u) for adi,key-poll-ms\n",
+				prop_val);
+			return -EINVAL;
+		}
+	}
+
+	error = adp5589_unlock_parse(kpad);
+	if (error)
+		return error;
+
+	error = adp5589_reset_parse(kpad);
+	if (error)
+		return error;
+
+	return adp5589_gpio_parse(kpad);
+}
+
 static int adp5589_keypad_add(struct adp5589_kpad *kpad, unsigned int revid)
 {
 	struct i2c_client *client = kpad->client;
-	const struct adp5589_kpad_platform_data *pdata =
-		dev_get_platdata(&client->dev);
 	struct input_dev *input;
-	unsigned int i;
 	int error;
 
-	if (!((pdata->keypad_en_mask & kpad->info->var->row_mask) &&
-	      (pdata->keypad_en_mask >> kpad->info->var->col_shift)) || !pdata->keymap) {
-		dev_err(&client->dev, "no rows, cols or keymap from pdata\n");
-		return -EINVAL;
-	}
-
-	if (pdata->keymapsize != kpad->info->var->keymapsize) {
-		dev_err(&client->dev, "invalid keymapsize\n");
-		return -EINVAL;
-	}
-
-	if (!client->irq) {
-		dev_err(&client->dev, "no IRQ?\n");
-		return -EINVAL;
-	}
-
 	input = devm_input_allocate_device(&client->dev);
 	if (!input)
 		return -ENOMEM;
@@ -913,23 +1373,9 @@ static int adp5589_keypad_add(struct adp5589_kpad *kpad, unsigned int revid)
 	input->id.product = 0x0001;
 	input->id.version = revid;
 
-	input->keycodesize = sizeof(kpad->keycode[0]);
-	input->keycodemax = pdata->keymapsize;
-	input->keycode = kpad->keycode;
-
-	memcpy(kpad->keycode, pdata->keymap,
-	       pdata->keymapsize * input->keycodesize);
-
-	/* setup input device */
-	__set_bit(EV_KEY, input->evbit);
-
-	if (pdata->repeat)
-		__set_bit(EV_REP, input->evbit);
-
-	for (i = 0; i < input->keycodemax; i++)
-		if (kpad->keycode[i] <= KEY_MAX)
-			__set_bit(kpad->keycode[i], input->keybit);
-	__clear_bit(KEY_RESERVED, input->keybit);
+	error = adp5589_parse_fw(kpad);
+	if (error)
+		return error;
 
 	error = input_register_device(input);
 	if (error) {
@@ -937,6 +1383,9 @@ static int adp5589_keypad_add(struct adp5589_kpad *kpad, unsigned int revid)
 		return error;
 	}
 
+	if (!client->irq)
+		return 0;
+
 	error = devm_request_threaded_irq(&client->dev, client->irq,
 					  NULL, adp5589_irq,
 					  IRQF_TRIGGER_FALLING | IRQF_ONESHOT,
@@ -960,24 +1409,25 @@ static void adp5589_clear_config(void *data)
 static const struct adp5589_info adp5589_info = {
 	.var = &const_adp5589,
 	.support_row5 = true,
+	.rpull_banks = ADP5589_RPULL_CONFIG_E - ADP5589_RPULL_CONFIG_A + 1,
 };
 
 static const struct adp5589_info adp5585_info = {
 	.var = &const_adp5585,
 	.is_adp5585 = true,
+	.rpull_banks = ADP5585_RPULL_CONFIG_D - ADP5585_RPULL_CONFIG_A + 1,
 };
 
 static const struct adp5589_info adp5585_2_info = {
 	.var = &const_adp5585,
 	.is_adp5585 = true,
 	.support_row5 = true,
+	.rpull_banks = ADP5585_RPULL_CONFIG_D - ADP5585_RPULL_CONFIG_A + 1,
 };
 
 static int adp5589_probe(struct i2c_client *client)
 {
 	struct adp5589_kpad *kpad;
-	const struct adp5589_kpad_platform_data *pdata =
-		dev_get_platdata(&client->dev);
 	unsigned int revid;
 	int error, ret;
 
@@ -987,11 +1437,6 @@ static int adp5589_probe(struct i2c_client *client)
 		return -EIO;
 	}
 
-	if (!pdata) {
-		dev_err(&client->dev, "no platform data?\n");
-		return -EINVAL;
-	}
-
 	kpad = devm_kzalloc(&client->dev, sizeof(*kpad), GFP_KERNEL);
 	if (!kpad)
 		return -ENOMEM;
@@ -1013,11 +1458,9 @@ static int adp5589_probe(struct i2c_client *client)
 
 	revid = (u8) ret & ADP5589_5_DEVICE_ID_MASK;
 
-	if (pdata->keymapsize) {
-		error = adp5589_keypad_add(kpad, revid);
-		if (error)
-			return error;
-	}
+	error = adp5589_keypad_add(kpad, revid);
+	if (error)
+		return error;
 
 	error = adp5589_setup(kpad);
 	if (error)
@@ -1064,10 +1507,19 @@ static const struct i2c_device_id adp5589_id[] = {
 
 MODULE_DEVICE_TABLE(i2c, adp5589_id);
 
+static const struct of_device_id adp5589_of_id[] = {
+	{ .compatible = "adi,adp5589", .data = &adp5589_info},
+	{ .compatible = "adi,adp5585", .data = &adp5585_info},
+	{ .compatible = "adi,adp5585-2", .data = &adp5585_2_info},
+	{}
+};
+MODULE_DEVICE_TABLE(of, adp5589_of_id);
+
 static struct i2c_driver adp5589_driver = {
 	.driver = {
 		.name = KBUILD_MODNAME,
 		.pm = pm_sleep_ptr(&adp5589_dev_pm_ops),
+		.of_match_table = adp5589_of_id,
 	},
 	.probe = adp5589_probe,
 	.id_table = adp5589_id,
diff --git a/include/linux/input/adp5589.h b/include/linux/input/adp5589.h
deleted file mode 100644
index 6185fc1ba30869c014b2d3e49e21d46b464cba6a..0000000000000000000000000000000000000000
--- a/include/linux/input/adp5589.h
+++ /dev/null
@@ -1,178 +0,0 @@
-/* SPDX-License-Identifier: GPL-2.0-only */
-/*
- * Analog Devices ADP5589/ADP5585 I/O Expander and QWERTY Keypad Controller
- *
- * Copyright 2010-2011 Analog Devices Inc.
- */
-
-#ifndef _ADP5589_H
-#define _ADP5589_H
-
-/*
- * ADP5589 specific GPI and Keymap defines
- */
-
-#define ADP5589_KEYMAPSIZE	88
-
-#define ADP5589_GPI_PIN_ROW0 97
-#define ADP5589_GPI_PIN_ROW1 98
-#define ADP5589_GPI_PIN_ROW2 99
-#define ADP5589_GPI_PIN_ROW3 100
-#define ADP5589_GPI_PIN_ROW4 101
-#define ADP5589_GPI_PIN_ROW5 102
-#define ADP5589_GPI_PIN_ROW6 103
-#define ADP5589_GPI_PIN_ROW7 104
-#define ADP5589_GPI_PIN_COL0 105
-#define ADP5589_GPI_PIN_COL1 106
-#define ADP5589_GPI_PIN_COL2 107
-#define ADP5589_GPI_PIN_COL3 108
-#define ADP5589_GPI_PIN_COL4 109
-#define ADP5589_GPI_PIN_COL5 110
-#define ADP5589_GPI_PIN_COL6 111
-#define ADP5589_GPI_PIN_COL7 112
-#define ADP5589_GPI_PIN_COL8 113
-#define ADP5589_GPI_PIN_COL9 114
-#define ADP5589_GPI_PIN_COL10 115
-#define GPI_LOGIC1 116
-#define GPI_LOGIC2 117
-
-#define ADP5589_GPI_PIN_ROW_BASE ADP5589_GPI_PIN_ROW0
-#define ADP5589_GPI_PIN_ROW_END ADP5589_GPI_PIN_ROW7
-#define ADP5589_GPI_PIN_COL_BASE ADP5589_GPI_PIN_COL0
-#define ADP5589_GPI_PIN_COL_END ADP5589_GPI_PIN_COL10
-
-#define ADP5589_GPI_PIN_BASE ADP5589_GPI_PIN_ROW_BASE
-#define ADP5589_GPI_PIN_END ADP5589_GPI_PIN_COL_END
-
-#define ADP5589_GPIMAPSIZE_MAX (ADP5589_GPI_PIN_END - ADP5589_GPI_PIN_BASE + 1)
-
-/*
- * ADP5585 specific GPI and Keymap defines
- */
-
-#define ADP5585_KEYMAPSIZE	30
-
-#define ADP5585_GPI_PIN_ROW0 37
-#define ADP5585_GPI_PIN_ROW1 38
-#define ADP5585_GPI_PIN_ROW2 39
-#define ADP5585_GPI_PIN_ROW3 40
-#define ADP5585_GPI_PIN_ROW4 41
-#define ADP5585_GPI_PIN_ROW5 42
-#define ADP5585_GPI_PIN_COL0 43
-#define ADP5585_GPI_PIN_COL1 44
-#define ADP5585_GPI_PIN_COL2 45
-#define ADP5585_GPI_PIN_COL3 46
-#define ADP5585_GPI_PIN_COL4 47
-#define GPI_LOGIC 48
-
-#define ADP5585_GPI_PIN_ROW_BASE ADP5585_GPI_PIN_ROW0
-#define ADP5585_GPI_PIN_ROW_END ADP5585_GPI_PIN_ROW5
-#define ADP5585_GPI_PIN_COL_BASE ADP5585_GPI_PIN_COL0
-#define ADP5585_GPI_PIN_COL_END ADP5585_GPI_PIN_COL4
-
-#define ADP5585_GPI_PIN_BASE ADP5585_GPI_PIN_ROW_BASE
-#define ADP5585_GPI_PIN_END ADP5585_GPI_PIN_COL_END
-
-#define ADP5585_GPIMAPSIZE_MAX (ADP5585_GPI_PIN_END - ADP5585_GPI_PIN_BASE + 1)
-
-struct adp5589_gpi_map {
-	unsigned short pin;
-	unsigned short sw_evt;
-};
-
-/* scan_cycle_time */
-#define ADP5589_SCAN_CYCLE_10ms		0
-#define ADP5589_SCAN_CYCLE_20ms		1
-#define ADP5589_SCAN_CYCLE_30ms		2
-#define ADP5589_SCAN_CYCLE_40ms		3
-
-/* RESET_CFG */
-#define RESET_PULSE_WIDTH_500us		0
-#define RESET_PULSE_WIDTH_1ms		1
-#define RESET_PULSE_WIDTH_2ms		2
-#define RESET_PULSE_WIDTH_10ms		3
-
-#define RESET_TRIG_TIME_0ms		(0 << 2)
-#define RESET_TRIG_TIME_1000ms		(1 << 2)
-#define RESET_TRIG_TIME_1500ms		(2 << 2)
-#define RESET_TRIG_TIME_2000ms		(3 << 2)
-#define RESET_TRIG_TIME_2500ms		(4 << 2)
-#define RESET_TRIG_TIME_3000ms		(5 << 2)
-#define RESET_TRIG_TIME_3500ms		(6 << 2)
-#define RESET_TRIG_TIME_4000ms		(7 << 2)
-
-#define RESET_PASSTHRU_EN		(1 << 5)
-#define RESET1_POL_HIGH			(1 << 6)
-#define RESET1_POL_LOW			(0 << 6)
-#define RESET2_POL_HIGH			(1 << 7)
-#define RESET2_POL_LOW			(0 << 7)
-
-/* ADP5589 Mask Bits:
- * C C C C C C C C C C C | R R R R R R R R
- * 1 9 8 7 6 5 4 3 2 1 0 | 7 6 5 4 3 2 1 0
- * 0
- * ---------------- BIT ------------------
- * 1 1 1 1 1 1 1 1 1 0 0 | 0 0 0 0 0 0 0 0
- * 8 7 6 5 4 3 2 1 0 9 8 | 7 6 5 4 3 2 1 0
- */
-
-#define ADP_ROW(x)	(1 << (x))
-#define ADP_COL(x)	(1 << (x + 8))
-#define ADP5589_ROW_MASK		0xFF
-#define ADP5589_COL_MASK		0xFF
-#define ADP5589_COL_SHIFT		8
-#define ADP5589_MAX_ROW_NUM		7
-#define ADP5589_MAX_COL_NUM		10
-
-/* ADP5585 Mask Bits:
- * C C C C C | R R R R R R
- * 4 3 2 1 0 | 5 4 3 2 1 0
- *
- * ---- BIT -- -----------
- * 1 0 0 0 0 | 0 0 0 0 0 0
- * 0 9 8 7 6 | 5 4 3 2 1 0
- */
-
-#define ADP5585_ROW_MASK		0x3F
-#define ADP5585_COL_MASK		0x1F
-#define ADP5585_ROW_SHIFT		0
-#define ADP5585_COL_SHIFT		6
-#define ADP5585_MAX_ROW_NUM		5
-#define ADP5585_MAX_COL_NUM		4
-
-#define ADP5585_ROW(x)	(1 << ((x) & ADP5585_ROW_MASK))
-#define ADP5585_COL(x)	(1 << (((x) & ADP5585_COL_MASK) + ADP5585_COL_SHIFT))
-
-/* Put one of these structures in i2c_board_info platform_data */
-
-struct adp5589_kpad_platform_data {
-	unsigned keypad_en_mask;	/* Keypad (Rows/Columns) enable mask */
-	const unsigned short *keymap;	/* Pointer to keymap */
-	unsigned short keymapsize;	/* Keymap size */
-	bool repeat;			/* Enable key repeat */
-	bool en_keylock;		/* Enable key lock feature (ADP5589 only)*/
-	unsigned char unlock_key1;	/* Unlock Key 1 (ADP5589 only) */
-	unsigned char unlock_key2;	/* Unlock Key 2 (ADP5589 only) */
-	unsigned char unlock_timer;	/* Time in seconds [0..7] between the two unlock keys 0=disable (ADP5589 only) */
-	unsigned char scan_cycle_time;	/* Time between consecutive scan cycles */
-	unsigned char reset_cfg;	/* Reset config */
-	unsigned short reset1_key_1;	/* Reset Key 1 */
-	unsigned short reset1_key_2;	/* Reset Key 2 */
-	unsigned short reset1_key_3;	/* Reset Key 3 */
-	unsigned short reset2_key_1;	/* Reset Key 1 */
-	unsigned short reset2_key_2;	/* Reset Key 2 */
-	unsigned debounce_dis_mask;	/* Disable debounce mask */
-	unsigned pull_dis_mask;		/* Disable all pull resistors mask */
-	unsigned pullup_en_100k;	/* Pull-Up 100k Enable Mask */
-	unsigned pullup_en_300k;	/* Pull-Up 300k Enable Mask */
-	unsigned pulldown_en_300k;	/* Pull-Down 300k Enable Mask */
-	const struct adp5589_gpio_platform_data *gpio_data;
-};
-
-struct i2c_client; /* forward declaration */
-
-struct adp5589_gpio_platform_data {
-	int	gpio_start;	/* GPIO Chip base # */
-};
-
-#endif

-- 
2.46.1


