Return-Path: <linux-input+bounces-6580-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id A549697B0C7
	for <lists+linux-input@lfdr.de>; Tue, 17 Sep 2024 15:30:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id D519B1F23A3C
	for <lists+linux-input@lfdr.de>; Tue, 17 Sep 2024 13:30:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 18C2817A58C;
	Tue, 17 Sep 2024 13:30:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=swemel.ru header.i=@swemel.ru header.b="da8v1Mu6"
X-Original-To: linux-input@vger.kernel.org
Received: from mx.swemel.ru (mx.swemel.ru [95.143.211.150])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B35617AE0B;
	Tue, 17 Sep 2024 13:30:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.143.211.150
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726579814; cv=none; b=LqQKStq5FqxYoidIy2ZGDOvbP3bfHPnPD2+VH/HV6XJYhrZ7phNE2CTbZsUAZHZ/a5UX3Scntybyjciwif1M7AurV/nboDqkV6GX9Kkpy9z0WWrnMd1jDd26CSEChmayxN06AMElfPDEYKQeW7TKvVEyriF8kd+PnrgUHL7st8U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726579814; c=relaxed/simple;
	bh=SQDmDA9UUjauEosQM0WXgInG6wNF4geozTfO4Yw82K0=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version:Content-Type; b=o2J1Nxjdfe9Zw5MvqL1CnGYxDd0d/iYRIZ4r82nu/p3LcdJNqtEaHoeR9hOO0/H5/Ce2aymOSnWga6yFIqnHmm4jVPBhV6uxqVETMBBqoXgstlaZmR7DwZkrEd/V7pXpVpeJwUPWuO6/sbu/yGcZtS4pGwRybJ4eEkQomHJOEzQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=swemel.ru; spf=pass smtp.mailfrom=swemel.ru; dkim=pass (1024-bit key) header.d=swemel.ru header.i=@swemel.ru header.b=da8v1Mu6; arc=none smtp.client-ip=95.143.211.150
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=swemel.ru
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=swemel.ru
From: Denis Arefev <arefev@swemel.ru>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=swemel.ru; s=mail;
	t=1726579785;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=X/+KtwLEcCREHOLS0aSEyeLIOQ897EUfoUfvv/J3B6I=;
	b=da8v1Mu6HPHCDY+hay/9+fDPKdp8ZlAFEb3wm+z/9lY3XT1s0JaFxKrfuaZKsED+X/7l+g
	MxHX5GVRNwlPws9tmKu/hdf7FN8vnyrAMoum3jzxI0LQhtk9Y4vJrru7brrENp4sw2vllo
	VFIIoq68Q3zoYb7cgb0vNqR9w5LsmOs=
To: stable@vger.kernel.org,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Michael Hennerich <michael.hennerich@analog.com>,
	Andy Shevchenko <andy.shevchenko@gmail.com>,
	=?UTF-8?q?Nuno=20S=C3=A1?= <nuno.sa@analog.com>,
	linux-kernel@vger.kernel.org,
	linux-input@vger.kernel.org,
	lvc-project@linuxtesting.org
Subject: [PATCH 5.10] Input: adp5588-keys - add support for fw properties
Date: Tue, 17 Sep 2024 16:29:45 +0300
Message-Id: <20240917132945.44797-1-arefev@swemel.ru>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: Nuno Sá <nuno.sa@analog.com>

[ Upstream commit 6704a86283b7e79ff7ae36d388466428f6672962 ]

Use firmware properties (eg: OF) to get the device specific
configuration. This change just replaces the platform data since there
was no platform using it and so, it makes no sense having both.

Special note to the PULL-UP disable setting that is now supported as
part of the gpio subsystem (using 'set_config()' callback).

Signed-off-by: Nuno Sá <nuno.sa@analog.com>
Reviewed-by: Andy Shevchenko <andy.shevchenko@gmail.com>
Link: https://lore.kernel.org/r/20220829131553.690063-5-nuno.sa@analog.com
[In v5.10.226 IRQCHIP_IMMUTABLE is missing, replaced with (1 << 11)]
[In v5.10.226 GPIOCHIP_IRQ_RESOURCE_HELPERS is missing, removed, since there is initialization in gpiochip_set_irq_hooks]
[In v5.10.226 DEFINE_SIMPLE_DEV_PM_OPS is missing, replaced with static const struct dev_pm_ops]
Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
---
 drivers/input/keyboard/Kconfig        |   3 +
 drivers/input/keyboard/adp5588-keys.c | 849 ++++++++++++++++----------
 include/linux/platform_data/adp5588.h | 171 ------
 3 files changed, 532 insertions(+), 491 deletions(-)
 delete mode 100644 include/linux/platform_data/adp5588.h

diff --git a/drivers/input/keyboard/Kconfig b/drivers/input/keyboard/Kconfig
index 3f7a5ff17a9a..9a58f668cd25 100644
--- a/drivers/input/keyboard/Kconfig
+++ b/drivers/input/keyboard/Kconfig
@@ -40,6 +40,9 @@ config KEYBOARD_ADP5520
 config KEYBOARD_ADP5588
 	tristate "ADP5588/87 I2C QWERTY Keypad and IO Expander"
 	depends on I2C
+	select GPIOLIB
+	select GPIOLIB_IRQCHIP
+	select INPUT_MATRIXKMAP
 	help
 	  Say Y here if you want to use a ADP5588/87 attached to your
 	  system I2C bus.
diff --git a/drivers/input/keyboard/adp5588-keys.c b/drivers/input/keyboard/adp5588-keys.c
index 90a59b973d00..b1ce00d638a4 100644
--- a/drivers/input/keyboard/adp5588-keys.c
+++ b/drivers/input/keyboard/adp5588-keys.c
@@ -8,25 +8,163 @@
  * Copyright (C) 2008-2010 Analog Devices Inc.
  */
 
-#include <linux/module.h>
+#include <linux/bits.h>
+#include <linux/delay.h>
+#include <linux/errno.h>
+#include <linux/gpio/consumer.h>
+#include <linux/gpio/driver.h>
+#include <linux/i2c.h>
+#include <linux/input.h>
+#include <linux/input/matrix_keypad.h>
 #include <linux/interrupt.h>
 #include <linux/irq.h>
-#include <linux/workqueue.h>
-#include <linux/errno.h>
-#include <linux/pm.h>
+#include <linux/ktime.h>
+#include <linux/module.h>
+#include <linux/mod_devicetable.h>
+#include <linux/pinctrl/pinconf-generic.h>
 #include <linux/platform_device.h>
-#include <linux/input.h>
-#include <linux/i2c.h>
-#include <linux/gpio.h>
+#include <linux/pm.h>
+#include <linux/regulator/consumer.h>
 #include <linux/slab.h>
+#include <linux/timekeeping.h>
+
+#define DEV_ID 0x00		/* Device ID */
+#define CFG 0x01		/* Configuration Register1 */
+#define INT_STAT 0x02		/* Interrupt Status Register */
+#define KEY_LCK_EC_STAT 0x03	/* Key Lock and Event Counter Register */
+#define KEY_EVENTA 0x04		/* Key Event Register A */
+#define KEY_EVENTB 0x05		/* Key Event Register B */
+#define KEY_EVENTC 0x06		/* Key Event Register C */
+#define KEY_EVENTD 0x07		/* Key Event Register D */
+#define KEY_EVENTE 0x08		/* Key Event Register E */
+#define KEY_EVENTF 0x09		/* Key Event Register F */
+#define KEY_EVENTG 0x0A		/* Key Event Register G */
+#define KEY_EVENTH 0x0B		/* Key Event Register H */
+#define KEY_EVENTI 0x0C		/* Key Event Register I */
+#define KEY_EVENTJ 0x0D		/* Key Event Register J */
+#define KP_LCK_TMR 0x0E		/* Keypad Lock1 to Lock2 Timer */
+#define UNLOCK1 0x0F		/* Unlock Key1 */
+#define UNLOCK2 0x10		/* Unlock Key2 */
+#define GPIO_INT_STAT1 0x11	/* GPIO Interrupt Status */
+#define GPIO_INT_STAT2 0x12	/* GPIO Interrupt Status */
+#define GPIO_INT_STAT3 0x13	/* GPIO Interrupt Status */
+#define GPIO_DAT_STAT1 0x14	/* GPIO Data Status, Read twice to clear */
+#define GPIO_DAT_STAT2 0x15	/* GPIO Data Status, Read twice to clear */
+#define GPIO_DAT_STAT3 0x16	/* GPIO Data Status, Read twice to clear */
+#define GPIO_DAT_OUT1 0x17	/* GPIO DATA OUT */
+#define GPIO_DAT_OUT2 0x18	/* GPIO DATA OUT */
+#define GPIO_DAT_OUT3 0x19	/* GPIO DATA OUT */
+#define GPIO_INT_EN1 0x1A	/* GPIO Interrupt Enable */
+#define GPIO_INT_EN2 0x1B	/* GPIO Interrupt Enable */
+#define GPIO_INT_EN3 0x1C	/* GPIO Interrupt Enable */
+#define KP_GPIO1 0x1D		/* Keypad or GPIO Selection */
+#define KP_GPIO2 0x1E		/* Keypad or GPIO Selection */
+#define KP_GPIO3 0x1F		/* Keypad or GPIO Selection */
+#define GPI_EM1 0x20		/* GPI Event Mode 1 */
+#define GPI_EM2 0x21		/* GPI Event Mode 2 */
+#define GPI_EM3 0x22		/* GPI Event Mode 3 */
+#define GPIO_DIR1 0x23		/* GPIO Data Direction */
+#define GPIO_DIR2 0x24		/* GPIO Data Direction */
+#define GPIO_DIR3 0x25		/* GPIO Data Direction */
+#define GPIO_INT_LVL1 0x26	/* GPIO Edge/Level Detect */
+#define GPIO_INT_LVL2 0x27	/* GPIO Edge/Level Detect */
+#define GPIO_INT_LVL3 0x28	/* GPIO Edge/Level Detect */
+#define DEBOUNCE_DIS1 0x29	/* Debounce Disable */
+#define DEBOUNCE_DIS2 0x2A	/* Debounce Disable */
+#define DEBOUNCE_DIS3 0x2B	/* Debounce Disable */
+#define GPIO_PULL1 0x2C		/* GPIO Pull Disable */
+#define GPIO_PULL2 0x2D		/* GPIO Pull Disable */
+#define GPIO_PULL3 0x2E		/* GPIO Pull Disable */
+#define CMP_CFG_STAT 0x30	/* Comparator Configuration and Status Register */
+#define CMP_CONFG_SENS1 0x31	/* Sensor1 Comparator Configuration Register */
+#define CMP_CONFG_SENS2 0x32	/* L2 Light Sensor Reference Level, Output Falling for Sensor 1 */
+#define CMP1_LVL2_TRIP 0x33	/* L2 Light Sensor Hysteresis (Active when Output Rising) for Sensor 1 */
+#define CMP1_LVL2_HYS 0x34	/* L3 Light Sensor Reference Level, Output Falling For Sensor 1 */
+#define CMP1_LVL3_TRIP 0x35	/* L3 Light Sensor Hysteresis (Active when Output Rising) For Sensor 1 */
+#define CMP1_LVL3_HYS 0x36	/* Sensor 2 Comparator Configuration Register */
+#define CMP2_LVL2_TRIP 0x37	/* L2 Light Sensor Reference Level, Output Falling for Sensor 2 */
+#define CMP2_LVL2_HYS 0x38	/* L2 Light Sensor Hysteresis (Active when Output Rising) for Sensor 2 */
+#define CMP2_LVL3_TRIP 0x39	/* L3 Light Sensor Reference Level, Output Falling For Sensor 2 */
+#define CMP2_LVL3_HYS 0x3A	/* L3 Light Sensor Hysteresis (Active when Output Rising) For Sensor 2 */
+#define CMP1_ADC_DAT_R1 0x3B	/* Comparator 1 ADC data Register1 */
+#define CMP1_ADC_DAT_R2 0x3C	/* Comparator 1 ADC data Register2 */
+#define CMP2_ADC_DAT_R1 0x3D	/* Comparator 2 ADC data Register1 */
+#define CMP2_ADC_DAT_R2 0x3E	/* Comparator 2 ADC data Register2 */
+
+#define ADP5588_DEVICE_ID_MASK	0xF
+
+ /* Configuration Register1 */
+#define ADP5588_AUTO_INC	BIT(7)
+#define ADP5588_GPIEM_CFG	BIT(6)
+#define ADP5588_OVR_FLOW_M	BIT(5)
+#define ADP5588_INT_CFG		BIT(4)
+#define ADP5588_OVR_FLOW_IEN	BIT(3)
+#define ADP5588_K_LCK_IM	BIT(2)
+#define ADP5588_GPI_IEN		BIT(1)
+#define ADP5588_KE_IEN		BIT(0)
+
+/* Interrupt Status Register */
+#define ADP5588_CMP2_INT	BIT(5)
+#define ADP5588_CMP1_INT	BIT(4)
+#define ADP5588_OVR_FLOW_INT	BIT(3)
+#define ADP5588_K_LCK_INT	BIT(2)
+#define ADP5588_GPI_INT		BIT(1)
+#define ADP5588_KE_INT		BIT(0)
+
+/* Key Lock and Event Counter Register */
+#define ADP5588_K_LCK_EN	BIT(6)
+#define ADP5588_LCK21		0x30
+#define ADP5588_KEC		GENMASK(3, 0)
+
+#define ADP5588_MAXGPIO		18
+#define ADP5588_BANK(offs)	((offs) >> 3)
+#define ADP5588_BIT(offs)	(1u << ((offs) & 0x7))
+
+/* Put one of these structures in i2c_board_info platform_data */
 
-#include <linux/platform_data/adp5588.h>
+/*
+ * 128 so it fits matrix-keymap maximum number of keys when the full
+ * 10cols * 8rows are used.
+ */
+#define ADP5588_KEYMAPSIZE 128
+
+#define GPI_PIN_ROW0 97
+#define GPI_PIN_ROW1 98
+#define GPI_PIN_ROW2 99
+#define GPI_PIN_ROW3 100
+#define GPI_PIN_ROW4 101
+#define GPI_PIN_ROW5 102
+#define GPI_PIN_ROW6 103
+#define GPI_PIN_ROW7 104
+#define GPI_PIN_COL0 105
+#define GPI_PIN_COL1 106
+#define GPI_PIN_COL2 107
+#define GPI_PIN_COL3 108
+#define GPI_PIN_COL4 109
+#define GPI_PIN_COL5 110
+#define GPI_PIN_COL6 111
+#define GPI_PIN_COL7 112
+#define GPI_PIN_COL8 113
+#define GPI_PIN_COL9 114
+
+#define GPI_PIN_ROW_BASE GPI_PIN_ROW0
+#define GPI_PIN_ROW_END GPI_PIN_ROW7
+#define GPI_PIN_COL_BASE GPI_PIN_COL0
+#define GPI_PIN_COL_END GPI_PIN_COL9
+
+#define GPI_PIN_BASE GPI_PIN_ROW_BASE
+#define GPI_PIN_END GPI_PIN_COL_END
+
+#define ADP5588_ROWS_MAX (GPI_PIN_ROW7 - GPI_PIN_ROW0 + 1)
+#define ADP5588_COLS_MAX (GPI_PIN_COL9 - GPI_PIN_COL0 + 1)
+
+#define ADP5588_GPIMAPSIZE_MAX (GPI_PIN_END - GPI_PIN_BASE + 1)
 
 /* Key Event Register xy */
-#define KEY_EV_PRESSED		(1 << 7)
-#define KEY_EV_MASK		(0x7F)
+#define KEY_EV_PRESSED		BIT(7)
+#define KEY_EV_MASK		GENMASK(6, 0)
 
-#define KP_SEL(x)		(0xFFFF >> (16 - x))	/* 2^x-1 */
+#define KP_SEL(x)		(BIT(x) - 1)	/* 2^x-1 */
 
 #define KEYP_MAX_EVENT		10
 
@@ -36,23 +174,29 @@
  * asserted.
  */
 #define WA_DELAYED_READOUT_REVID(rev)		((rev) < 4)
+#define WA_DELAYED_READOUT_TIME			25
+
+#define ADP5588_INVALID_HWIRQ	(~0UL)
 
 struct adp5588_kpad {
 	struct i2c_client *client;
 	struct input_dev *input;
-	struct delayed_work work;
+	ktime_t irq_time;
 	unsigned long delay;
+	u32 row_shift;
+	u32 rows;
+	u32 cols;
+	u32 unlock_keys[2];
+	int nkeys_unlock;
 	unsigned short keycode[ADP5588_KEYMAPSIZE];
-	const struct adp5588_gpi_map *gpimap;
-	unsigned short gpimapsize;
-#ifdef CONFIG_GPIOLIB
 	unsigned char gpiomap[ADP5588_MAXGPIO];
-	bool export_gpio;
 	struct gpio_chip gc;
 	struct mutex gpio_lock;	/* Protect cached dir, dat_out */
 	u8 dat_out[3];
 	u8 dir[3];
-#endif
+	u8 int_en[3];
+	u8 irq_mask[3];
+	u8 pull_dis[3];
 };
 
 static int adp5588_read(struct i2c_client *client, u8 reg)
@@ -70,8 +214,7 @@ static int adp5588_write(struct i2c_client *client, u8 reg, u8 val)
 	return i2c_smbus_write_byte_data(client, reg, val);
 }
 
-#ifdef CONFIG_GPIOLIB
-static int adp5588_gpio_get_value(struct gpio_chip *chip, unsigned off)
+static int adp5588_gpio_get_value(struct gpio_chip *chip, unsigned int off)
 {
 	struct adp5588_kpad *kpad = gpiochip_get_data(chip);
 	unsigned int bank = ADP5588_BANK(kpad->gpiomap[off]);
@@ -91,7 +234,7 @@ static int adp5588_gpio_get_value(struct gpio_chip *chip, unsigned off)
 }
 
 static void adp5588_gpio_set_value(struct gpio_chip *chip,
-				   unsigned off, int val)
+				   unsigned int off, int val)
 {
 	struct adp5588_kpad *kpad = gpiochip_get_data(chip);
 	unsigned int bank = ADP5588_BANK(kpad->gpiomap[off]);
@@ -104,13 +247,47 @@ static void adp5588_gpio_set_value(struct gpio_chip *chip,
 	else
 		kpad->dat_out[bank] &= ~bit;
 
-	adp5588_write(kpad->client, GPIO_DAT_OUT1 + bank,
-			   kpad->dat_out[bank]);
+	adp5588_write(kpad->client, GPIO_DAT_OUT1 + bank, kpad->dat_out[bank]);
+
+	mutex_unlock(&kpad->gpio_lock);
+}
+
+static int adp5588_gpio_set_config(struct gpio_chip *chip,  unsigned int off,
+				   unsigned long config)
+{
+	struct adp5588_kpad *kpad = gpiochip_get_data(chip);
+	unsigned int bank = ADP5588_BANK(kpad->gpiomap[off]);
+	unsigned int bit = ADP5588_BIT(kpad->gpiomap[off]);
+	bool pull_disable;
+	int ret;
+
+	switch (pinconf_to_config_param(config)) {
+	case PIN_CONFIG_BIAS_PULL_UP:
+		pull_disable = false;
+		break;
+	case PIN_CONFIG_BIAS_DISABLE:
+		pull_disable = true;
+		break;
+	default:
+		return -EOPNOTSUPP;
+	}
+
+	mutex_lock(&kpad->gpio_lock);
+
+	if (pull_disable)
+		kpad->pull_dis[bank] |= bit;
+	else
+		kpad->pull_dis[bank] &= bit;
+
+	ret = adp5588_write(kpad->client, GPIO_PULL1 + bank,
+			    kpad->pull_dis[bank]);
 
 	mutex_unlock(&kpad->gpio_lock);
+
+	return ret;
 }
 
-static int adp5588_gpio_direction_input(struct gpio_chip *chip, unsigned off)
+static int adp5588_gpio_direction_input(struct gpio_chip *chip, unsigned int off)
 {
 	struct adp5588_kpad *kpad = gpiochip_get_data(chip);
 	unsigned int bank = ADP5588_BANK(kpad->gpiomap[off]);
@@ -128,7 +305,7 @@ static int adp5588_gpio_direction_input(struct gpio_chip *chip, unsigned off)
 }
 
 static int adp5588_gpio_direction_output(struct gpio_chip *chip,
-					 unsigned off, int val)
+					 unsigned int off, int val)
 {
 	struct adp5588_kpad *kpad = gpiochip_get_data(chip);
 	unsigned int bank = ADP5588_BANK(kpad->gpiomap[off]);
@@ -145,17 +322,19 @@ static int adp5588_gpio_direction_output(struct gpio_chip *chip,
 		kpad->dat_out[bank] &= ~bit;
 
 	ret = adp5588_write(kpad->client, GPIO_DAT_OUT1 + bank,
-				 kpad->dat_out[bank]);
-	ret |= adp5588_write(kpad->client, GPIO_DIR1 + bank,
-				 kpad->dir[bank]);
+			    kpad->dat_out[bank]);
+	if (ret)
+		goto out_unlock;
 
+	ret = adp5588_write(kpad->client, GPIO_DIR1 + bank, kpad->dir[bank]);
+
+out_unlock:
 	mutex_unlock(&kpad->gpio_lock);
 
 	return ret;
 }
 
-static int adp5588_build_gpiomap(struct adp5588_kpad *kpad,
-				const struct adp5588_kpad_platform_data *pdata)
+static int adp5588_build_gpiomap(struct adp5588_kpad *kpad)
 {
 	bool pin_used[ADP5588_MAXGPIO];
 	int n_unused = 0;
@@ -163,15 +342,12 @@ static int adp5588_build_gpiomap(struct adp5588_kpad *kpad,
 
 	memset(pin_used, 0, sizeof(pin_used));
 
-	for (i = 0; i < pdata->rows; i++)
+	for (i = 0; i < kpad->rows; i++)
 		pin_used[i] = true;
 
-	for (i = 0; i < pdata->cols; i++)
+	for (i = 0; i < kpad->cols; i++)
 		pin_used[i + GPI_PIN_COL_BASE - GPI_PIN_BASE] = true;
 
-	for (i = 0; i < kpad->gpimapsize; i++)
-		pin_used[kpad->gpimap[i].pin - GPI_PIN_BASE] = true;
-
 	for (i = 0; i < ADP5588_MAXGPIO; i++)
 		if (!pin_used[i])
 			kpad->gpiomap[n_unused++] = i;
@@ -179,40 +355,106 @@ static int adp5588_build_gpiomap(struct adp5588_kpad *kpad,
 	return n_unused;
 }
 
+static void adp5588_irq_bus_lock(struct irq_data *d)
+{
+	struct gpio_chip *gc = irq_data_get_irq_chip_data(d);
+	struct adp5588_kpad *kpad = gpiochip_get_data(gc);
+
+	mutex_lock(&kpad->gpio_lock);
+}
+
+static void adp5588_irq_bus_sync_unlock(struct irq_data *d)
+{
+	struct gpio_chip *gc = irq_data_get_irq_chip_data(d);
+	struct adp5588_kpad *kpad = gpiochip_get_data(gc);
+	int i;
+
+	for (i = 0; i <= ADP5588_BANK(ADP5588_MAXGPIO); i++) {
+		if (kpad->int_en[i] ^ kpad->irq_mask[i]) {
+			kpad->int_en[i] = kpad->irq_mask[i];
+			adp5588_write(kpad->client, GPI_EM1 + i, kpad->int_en[i]);
+		}
+	}
+
+	mutex_unlock(&kpad->gpio_lock);
+}
+
+static void adp5588_irq_mask(struct irq_data *d)
+{
+	struct gpio_chip *gc = irq_data_get_irq_chip_data(d);
+	struct adp5588_kpad *kpad = gpiochip_get_data(gc);
+	irq_hw_number_t hwirq = irqd_to_hwirq(d);
+	unsigned long real_irq = kpad->gpiomap[hwirq];
+
+	kpad->irq_mask[ADP5588_BANK(real_irq)] &= ~ADP5588_BIT(real_irq);
+	gpiochip_disable_irq(gc, hwirq);
+}
+
+static void adp5588_irq_unmask(struct irq_data *d)
+{
+	struct gpio_chip *gc = irq_data_get_irq_chip_data(d);
+	struct adp5588_kpad *kpad = gpiochip_get_data(gc);
+	irq_hw_number_t hwirq = irqd_to_hwirq(d);
+	unsigned long real_irq = kpad->gpiomap[hwirq];
+
+	gpiochip_enable_irq(gc, hwirq);
+	kpad->irq_mask[ADP5588_BANK(real_irq)] |= ADP5588_BIT(real_irq);
+}
+
+static int adp5588_irq_set_type(struct irq_data *d, unsigned int type)
+{
+	if (!(type & IRQ_TYPE_EDGE_BOTH))
+		return -EINVAL;
+
+	irq_set_handler_locked(d, handle_edge_irq);
+
+	return 0;
+}
+
+static const struct irq_chip adp5588_irq_chip = {
+	.name = "adp5588",
+	.irq_mask = adp5588_irq_mask,
+	.irq_unmask = adp5588_irq_unmask,
+	.irq_bus_lock = adp5588_irq_bus_lock,
+	.irq_bus_sync_unlock = adp5588_irq_bus_sync_unlock,
+	.irq_set_type = adp5588_irq_set_type,
+	.flags = IRQCHIP_SKIP_SET_WAKE | (1 << 11),
+};
+
 static int adp5588_gpio_add(struct adp5588_kpad *kpad)
 {
 	struct device *dev = &kpad->client->dev;
-	const struct adp5588_kpad_platform_data *pdata = dev_get_platdata(dev);
-	const struct adp5588_gpio_platform_data *gpio_data = pdata->gpio_data;
+	struct gpio_irq_chip *girq;
 	int i, error;
 
-	if (!gpio_data)
-		return 0;
-
-	kpad->gc.ngpio = adp5588_build_gpiomap(kpad, pdata);
+	kpad->gc.ngpio = adp5588_build_gpiomap(kpad);
 	if (kpad->gc.ngpio == 0) {
 		dev_info(dev, "No unused gpios left to export\n");
 		return 0;
 	}
 
-	kpad->export_gpio = true;
-
+	kpad->gc.parent = &kpad->client->dev;
 	kpad->gc.direction_input = adp5588_gpio_direction_input;
 	kpad->gc.direction_output = adp5588_gpio_direction_output;
 	kpad->gc.get = adp5588_gpio_get_value;
 	kpad->gc.set = adp5588_gpio_set_value;
+	kpad->gc.set_config = adp5588_gpio_set_config;
 	kpad->gc.can_sleep = 1;
 
-	kpad->gc.base = gpio_data->gpio_start;
+	kpad->gc.base = -1;
 	kpad->gc.label = kpad->client->name;
 	kpad->gc.owner = THIS_MODULE;
-	kpad->gc.names = gpio_data->names;
+
+	girq = &kpad->gc.irq;
+	girq->chip = (struct irq_chip *)&adp5588_irq_chip;
+	girq->handler = handle_bad_irq;
+	girq->threaded = true;
 
 	mutex_init(&kpad->gpio_lock);
 
-	error = gpiochip_add_data(&kpad->gc, kpad);
+	error = devm_gpiochip_add_data(dev, &kpad->gc, kpad);
 	if (error) {
-		dev_err(dev, "gpiochip_add failed, err: %d\n", error);
+		dev_err(dev, "gpiochip_add failed: %d\n", error);
 		return error;
 	}
 
@@ -220,82 +462,121 @@ static int adp5588_gpio_add(struct adp5588_kpad *kpad)
 		kpad->dat_out[i] = adp5588_read(kpad->client,
 						GPIO_DAT_OUT1 + i);
 		kpad->dir[i] = adp5588_read(kpad->client, GPIO_DIR1 + i);
-	}
-
-	if (gpio_data->setup) {
-		error = gpio_data->setup(kpad->client,
-					 kpad->gc.base, kpad->gc.ngpio,
-					 gpio_data->context);
-		if (error)
-			dev_warn(dev, "setup failed, %d\n", error);
+		kpad->pull_dis[i] = adp5588_read(kpad->client, GPIO_PULL1 + i);
 	}
 
 	return 0;
 }
 
-static void adp5588_gpio_remove(struct adp5588_kpad *kpad)
+static unsigned long adp5588_gpiomap_get_hwirq(struct device *dev,
+					       const u8 *map, unsigned int gpio,
+					       unsigned int ngpios)
 {
-	struct device *dev = &kpad->client->dev;
-	const struct adp5588_kpad_platform_data *pdata = dev_get_platdata(dev);
-	const struct adp5588_gpio_platform_data *gpio_data = pdata->gpio_data;
-	int error;
+	unsigned int hwirq;
 
-	if (!kpad->export_gpio)
-		return;
+	for (hwirq = 0; hwirq < ngpios; hwirq++)
+		if (map[hwirq] == gpio)
+			return hwirq;
 
-	if (gpio_data->teardown) {
-		error = gpio_data->teardown(kpad->client,
-					    kpad->gc.base, kpad->gc.ngpio,
-					    gpio_data->context);
-		if (error)
-			dev_warn(dev, "teardown failed %d\n", error);
-	}
+	/* should never happen */
+	dev_warn_ratelimited(dev, "could not find the hwirq for gpio(%u)\n", gpio);
 
-	gpiochip_remove(&kpad->gc);
-}
-#else
-static inline int adp5588_gpio_add(struct adp5588_kpad *kpad)
-{
-	return 0;
+	return ADP5588_INVALID_HWIRQ;
 }
 
-static inline void adp5588_gpio_remove(struct adp5588_kpad *kpad)
+static void adp5588_gpio_irq_handle(struct adp5588_kpad *kpad, int key_val,
+				    int key_press)
 {
+	unsigned int irq, gpio = key_val - GPI_PIN_BASE, irq_type;
+	struct i2c_client *client = kpad->client;
+	struct irq_data *irqd;
+	unsigned long hwirq;
+
+	hwirq = adp5588_gpiomap_get_hwirq(&client->dev, kpad->gpiomap,
+					  gpio, kpad->gc.ngpio);
+	if (hwirq == ADP5588_INVALID_HWIRQ) {
+		dev_err(&client->dev, "Could not get hwirq for key(%u)\n", key_val);
+		return;
+	}
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
-#endif
 
 static void adp5588_report_events(struct adp5588_kpad *kpad, int ev_cnt)
 {
-	int i, j;
+	int i;
 
 	for (i = 0; i < ev_cnt; i++) {
-		int key = adp5588_read(kpad->client, Key_EVENTA + i);
+		int key = adp5588_read(kpad->client, KEY_EVENTA + i);
 		int key_val = key & KEY_EV_MASK;
+		int key_press = key & KEY_EV_PRESSED;
 
 		if (key_val >= GPI_PIN_BASE && key_val <= GPI_PIN_END) {
-			for (j = 0; j < kpad->gpimapsize; j++) {
-				if (key_val == kpad->gpimap[j].pin) {
-					input_report_switch(kpad->input,
-							kpad->gpimap[j].sw_evt,
-							key & KEY_EV_PRESSED);
-					break;
-				}
-			}
+			/* gpio line used as IRQ source */
+			adp5588_gpio_irq_handle(kpad, key_val, key_press);
 		} else {
+			int row = (key_val - 1) / ADP5588_COLS_MAX;
+			int col =  (key_val - 1) % ADP5588_COLS_MAX;
+			int code = MATRIX_SCAN_CODE(row, col, kpad->row_shift);
+
+			dev_dbg_ratelimited(&kpad->client->dev,
+					    "report key(%d) r(%d) c(%d) code(%d)\n",
+					    key_val, row, col, kpad->keycode[code]);
+
 			input_report_key(kpad->input,
-					 kpad->keycode[key_val - 1],
-					 key & KEY_EV_PRESSED);
+					 kpad->keycode[code], key_press);
 		}
 	}
 }
 
-static void adp5588_work(struct work_struct *work)
+static irqreturn_t adp5588_hard_irq(int irq, void *handle)
+{
+	struct adp5588_kpad *kpad = handle;
+
+	kpad->irq_time = ktime_get();
+
+	return IRQ_WAKE_THREAD;
+}
+
+static irqreturn_t adp5588_thread_irq(int irq, void *handle)
 {
-	struct adp5588_kpad *kpad = container_of(work,
-						struct adp5588_kpad, work.work);
+	struct adp5588_kpad *kpad = handle;
 	struct i2c_client *client = kpad->client;
+	ktime_t target_time, now;
+	unsigned long delay;
 	int status, ev_cnt;
 
+	/*
+	 * Readout needs to wait for at least 25ms after the notification
+	 * for REVID < 4.
+	 */
+	if (kpad->delay) {
+		target_time = ktime_add_ms(kpad->irq_time, kpad->delay);
+		now = ktime_get();
+		if (ktime_before(now, target_time)) {
+			delay = ktime_to_us(ktime_sub(target_time, now));
+			usleep_range(delay, delay + 1000);
+		}
+	}
+
 	status = adp5588_read(client, INT_STAT);
 
 	if (status & ADP5588_OVR_FLOW_INT)	/* Unlikely and should never happen */
@@ -308,218 +589,199 @@ static void adp5588_work(struct work_struct *work)
 			input_sync(kpad->input);
 		}
 	}
-	adp5588_write(client, INT_STAT, status); /* Status is W1C */
-}
-
-static irqreturn_t adp5588_irq(int irq, void *handle)
-{
-	struct adp5588_kpad *kpad = handle;
-
-	/*
-	 * use keventd context to read the event fifo registers
-	 * Schedule readout at least 25ms after notification for
-	 * REVID < 4
-	 */
 
-	schedule_delayed_work(&kpad->work, kpad->delay);
+	adp5588_write(client, INT_STAT, status); /* Status is W1C */
 
 	return IRQ_HANDLED;
 }
 
-static int adp5588_setup(struct i2c_client *client)
+static int adp5588_setup(struct adp5588_kpad *kpad)
 {
-	const struct adp5588_kpad_platform_data *pdata =
-			dev_get_platdata(&client->dev);
-	const struct adp5588_gpio_platform_data *gpio_data = pdata->gpio_data;
+	struct i2c_client *client = kpad->client;
 	int i, ret;
-	unsigned char evt_mode1 = 0, evt_mode2 = 0, evt_mode3 = 0;
 
-	ret = adp5588_write(client, KP_GPIO1, KP_SEL(pdata->rows));
-	ret |= adp5588_write(client, KP_GPIO2, KP_SEL(pdata->cols) & 0xFF);
-	ret |= adp5588_write(client, KP_GPIO3, KP_SEL(pdata->cols) >> 8);
-
-	if (pdata->en_keylock) {
-		ret |= adp5588_write(client, UNLOCK1, pdata->unlock_key1);
-		ret |= adp5588_write(client, UNLOCK2, pdata->unlock_key2);
-		ret |= adp5588_write(client, KEY_LCK_EC_STAT, ADP5588_K_LCK_EN);
-	}
+	ret = adp5588_write(client, KP_GPIO1, KP_SEL(kpad->rows));
+	if (ret)
+		return ret;
 
-	for (i = 0; i < KEYP_MAX_EVENT; i++)
-		ret |= adp5588_read(client, Key_EVENTA);
+	ret = adp5588_write(client, KP_GPIO2, KP_SEL(kpad->cols) & 0xFF);
+	if (ret)
+		return ret;
 
-	for (i = 0; i < pdata->gpimapsize; i++) {
-		unsigned short pin = pdata->gpimap[i].pin;
+	ret = adp5588_write(client, KP_GPIO3, KP_SEL(kpad->cols) >> 8);
+	if (ret)
+		return ret;
 
-		if (pin <= GPI_PIN_ROW_END) {
-			evt_mode1 |= (1 << (pin - GPI_PIN_ROW_BASE));
-		} else {
-			evt_mode2 |= ((1 << (pin - GPI_PIN_COL_BASE)) & 0xFF);
-			evt_mode3 |= ((1 << (pin - GPI_PIN_COL_BASE)) >> 8);
-		}
+	for (i = 0; i < kpad->nkeys_unlock; i++) {
+		ret = adp5588_write(client, UNLOCK1 + i, kpad->unlock_keys[i]);
+		if (ret)
+			return ret;
 	}
 
-	if (pdata->gpimapsize) {
-		ret |= adp5588_write(client, GPI_EM1, evt_mode1);
-		ret |= adp5588_write(client, GPI_EM2, evt_mode2);
-		ret |= adp5588_write(client, GPI_EM3, evt_mode3);
+	if (kpad->nkeys_unlock) {
+		ret = adp5588_write(client, KEY_LCK_EC_STAT, ADP5588_K_LCK_EN);
+		if (ret)
+			return ret;
 	}
 
-	if (gpio_data) {
-		for (i = 0; i <= ADP5588_BANK(ADP5588_MAXGPIO); i++) {
-			int pull_mask = gpio_data->pullup_dis_mask;
-
-			ret |= adp5588_write(client, GPIO_PULL1 + i,
-				(pull_mask >> (8 * i)) & 0xFF);
-		}
+	for (i = 0; i < KEYP_MAX_EVENT; i++) {
+		ret = adp5588_read(client, KEY_EVENTA);
+		if (ret)
+			return ret;
 	}
 
-	ret |= adp5588_write(client, INT_STAT,
-				ADP5588_CMP2_INT | ADP5588_CMP1_INT |
-				ADP5588_OVR_FLOW_INT | ADP5588_K_LCK_INT |
-				ADP5588_GPI_INT | ADP5588_KE_INT); /* Status is W1C */
+	ret = adp5588_write(client, INT_STAT,
+			    ADP5588_CMP2_INT | ADP5588_CMP1_INT |
+			    ADP5588_OVR_FLOW_INT | ADP5588_K_LCK_INT |
+			    ADP5588_GPI_INT | ADP5588_KE_INT); /* Status is W1C */
+	if (ret)
+		return ret;
 
-	ret |= adp5588_write(client, CFG, ADP5588_INT_CFG |
-					  ADP5588_OVR_FLOW_IEN |
-					  ADP5588_KE_IEN);
+	return adp5588_write(client, CFG, ADP5588_INT_CFG |
+			     ADP5588_OVR_FLOW_IEN | ADP5588_KE_IEN);
+}
+
+static int adp5588_fw_parse(struct adp5588_kpad *kpad)
+{
+	struct i2c_client *client = kpad->client;
+	int ret, i;
 
-	if (ret < 0) {
-		dev_err(&client->dev, "Write Error\n");
+	ret = matrix_keypad_parse_properties(&client->dev, &kpad->rows,
+					     &kpad->cols);
+	if (ret)
 		return ret;
+
+	if (kpad->rows > ADP5588_ROWS_MAX || kpad->cols > ADP5588_COLS_MAX) {
+		dev_err(&client->dev, "Invalid nr of rows(%u) or cols(%u)\n",
+			kpad->rows, kpad->cols);
+		return -EINVAL;
 	}
 
-	return 0;
-}
+	ret = matrix_keypad_build_keymap(NULL, NULL, kpad->rows, kpad->cols,
+					 kpad->keycode, kpad->input);
+	if (ret)
+		return ret;
 
-static void adp5588_report_switch_state(struct adp5588_kpad *kpad)
-{
-	int gpi_stat1 = adp5588_read(kpad->client, GPIO_DAT_STAT1);
-	int gpi_stat2 = adp5588_read(kpad->client, GPIO_DAT_STAT2);
-	int gpi_stat3 = adp5588_read(kpad->client, GPIO_DAT_STAT3);
-	int gpi_stat_tmp, pin_loc;
-	int i;
+	kpad->row_shift = get_count_order(kpad->cols);
 
-	for (i = 0; i < kpad->gpimapsize; i++) {
-		unsigned short pin = kpad->gpimap[i].pin;
+	if (device_property_read_bool(&client->dev, "autorepeat"))
+		__set_bit(EV_REP, kpad->input->evbit);
 
-		if (pin <= GPI_PIN_ROW_END) {
-			gpi_stat_tmp = gpi_stat1;
-			pin_loc = pin - GPI_PIN_ROW_BASE;
-		} else if ((pin - GPI_PIN_COL_BASE) < 8) {
-			gpi_stat_tmp = gpi_stat2;
-			pin_loc = pin - GPI_PIN_COL_BASE;
-		} else {
-			gpi_stat_tmp = gpi_stat3;
-			pin_loc = pin - GPI_PIN_COL_BASE - 8;
-		}
+	kpad->nkeys_unlock = device_property_count_u32(&client->dev,
+						       "adi,unlock-keys");
+	if (kpad->nkeys_unlock <= 0) {
+		/* so that we don't end up enabling key lock */
+		kpad->nkeys_unlock = 0;
+		return 0;
+	}
+
+	if (kpad->nkeys_unlock > ARRAY_SIZE(kpad->unlock_keys)) {
+		dev_err(&client->dev, "number of unlock keys(%d) > (%zu)\n",
+			kpad->nkeys_unlock, ARRAY_SIZE(kpad->unlock_keys));
+		return -EINVAL;
+	}
 
-		if (gpi_stat_tmp < 0) {
-			dev_err(&kpad->client->dev,
-				"Can't read GPIO_DAT_STAT switch %d default to OFF\n",
-				pin);
-			gpi_stat_tmp = 0;
+	ret = device_property_read_u32_array(&client->dev, "adi,unlock-keys",
+					     kpad->unlock_keys,
+					     kpad->nkeys_unlock);
+	if (ret)
+		return ret;
+
+	for (i = 0; i < kpad->nkeys_unlock; i++) {
+		/*
+		 * Even though it should be possible (as stated in the datasheet)
+		 * to use GPIs (which are part of the keys event) as unlock keys,
+		 * it was not working at all and was leading to overflow events
+		 * at some point. Hence, for now, let's just allow keys which are
+		 * part of keypad matrix to be used and if a reliable way of
+		 * using GPIs is found, this condition can be removed/lightened.
+		 */
+		if (kpad->unlock_keys[i] >= kpad->cols * kpad->rows) {
+			dev_err(&client->dev, "Invalid unlock key(%d)\n",
+				kpad->unlock_keys[i]);
+			return -EINVAL;
 		}
 
-		input_report_switch(kpad->input,
-				    kpad->gpimap[i].sw_evt,
-				    !(gpi_stat_tmp & (1 << pin_loc)));
+		/*
+		 * Firmware properties keys start from 0 but on the device they
+		 * start from 1.
+		 */
+		kpad->unlock_keys[i] += 1;
 	}
 
-	input_sync(kpad->input);
+	return 0;
 }
 
+static void adp5588_disable_regulator(void *reg)
+{
+	regulator_disable(reg);
+}
 
 static int adp5588_probe(struct i2c_client *client,
 			 const struct i2c_device_id *id)
 {
 	struct adp5588_kpad *kpad;
-	const struct adp5588_kpad_platform_data *pdata =
-			dev_get_platdata(&client->dev);
 	struct input_dev *input;
+	struct gpio_desc *gpio;
+	struct regulator *vcc;
 	unsigned int revid;
-	int ret, i;
+	int ret;
 	int error;
 
 	if (!i2c_check_functionality(client->adapter,
-					I2C_FUNC_SMBUS_BYTE_DATA)) {
+				     I2C_FUNC_SMBUS_BYTE_DATA)) {
 		dev_err(&client->dev, "SMBUS Byte Data not Supported\n");
 		return -EIO;
 	}
 
-	if (!pdata) {
-		dev_err(&client->dev, "no platform data?\n");
-		return -EINVAL;
-	}
-
-	if (!pdata->rows || !pdata->cols || !pdata->keymap) {
-		dev_err(&client->dev, "no rows, cols or keymap from pdata\n");
-		return -EINVAL;
-	}
+	kpad = devm_kzalloc(&client->dev, sizeof(*kpad), GFP_KERNEL);
+	if (!kpad)
+		return -ENOMEM;
 
-	if (pdata->keymapsize != ADP5588_KEYMAPSIZE) {
-		dev_err(&client->dev, "invalid keymapsize\n");
-		return -EINVAL;
-	}
+	input = devm_input_allocate_device(&client->dev);
+	if (!input)
+		return -ENOMEM;
 
-	if (!pdata->gpimap && pdata->gpimapsize) {
-		dev_err(&client->dev, "invalid gpimap from pdata\n");
-		return -EINVAL;
-	}
+	kpad->client = client;
+	kpad->input = input;
 
-	if (pdata->gpimapsize > ADP5588_GPIMAPSIZE_MAX) {
-		dev_err(&client->dev, "invalid gpimapsize\n");
-		return -EINVAL;
-	}
+	error = adp5588_fw_parse(kpad);
+	if (error)
+		return error;
 
-	for (i = 0; i < pdata->gpimapsize; i++) {
-		unsigned short pin = pdata->gpimap[i].pin;
+	vcc = devm_regulator_get(&client->dev, "vcc");
+	if (IS_ERR(vcc))
+		return PTR_ERR(vcc);
 
-		if (pin < GPI_PIN_BASE || pin > GPI_PIN_END) {
-			dev_err(&client->dev, "invalid gpi pin data\n");
-			return -EINVAL;
-		}
+	error = regulator_enable(vcc);
+	if (error)
+		return error;
 
-		if (pin <= GPI_PIN_ROW_END) {
-			if (pin - GPI_PIN_ROW_BASE + 1 <= pdata->rows) {
-				dev_err(&client->dev, "invalid gpi row data\n");
-				return -EINVAL;
-			}
-		} else {
-			if (pin - GPI_PIN_COL_BASE + 1 <= pdata->cols) {
-				dev_err(&client->dev, "invalid gpi col data\n");
-				return -EINVAL;
-			}
-		}
-	}
+	error = devm_add_action_or_reset(&client->dev,
+					 adp5588_disable_regulator, vcc);
+	if (error)
+		return error;
 
-	if (!client->irq) {
-		dev_err(&client->dev, "no IRQ?\n");
-		return -EINVAL;
-	}
+	gpio = devm_gpiod_get_optional(&client->dev, "reset", GPIOD_OUT_HIGH);
+	if (IS_ERR(gpio))
+		return PTR_ERR(gpio);
 
-	kpad = kzalloc(sizeof(*kpad), GFP_KERNEL);
-	input = input_allocate_device();
-	if (!kpad || !input) {
-		error = -ENOMEM;
-		goto err_free_mem;
+	if (gpio) {
+		fsleep(30);
+		gpiod_set_value_cansleep(gpio, 0);
+		fsleep(60);
 	}
 
-	kpad->client = client;
-	kpad->input = input;
-	INIT_DELAYED_WORK(&kpad->work, adp5588_work);
-
 	ret = adp5588_read(client, DEV_ID);
-	if (ret < 0) {
-		error = ret;
-		goto err_free_mem;
-	}
+	if (ret < 0)
+		return ret;
 
-	revid = (u8) ret & ADP5588_DEVICE_ID_MASK;
+	revid = ret & ADP5588_DEVICE_ID_MASK;
 	if (WA_DELAYED_READOUT_REVID(revid))
-		kpad->delay = msecs_to_jiffies(30);
+		kpad->delay = msecs_to_jiffies(WA_DELAYED_READOUT_TIME);
 
 	input->name = client->name;
 	input->phys = "adp5588-keys/input0";
-	input->dev.parent = &client->dev;
 
 	input_set_drvdata(input, kpad);
 
@@ -528,112 +790,54 @@ static int adp5588_probe(struct i2c_client *client,
 	input->id.product = 0x0001;
 	input->id.version = revid;
 
-	input->keycodesize = sizeof(kpad->keycode[0]);
-	input->keycodemax = pdata->keymapsize;
-	input->keycode = kpad->keycode;
-
-	memcpy(kpad->keycode, pdata->keymap,
-		pdata->keymapsize * input->keycodesize);
-
-	kpad->gpimap = pdata->gpimap;
-	kpad->gpimapsize = pdata->gpimapsize;
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
-
-	if (kpad->gpimapsize)
-		__set_bit(EV_SW, input->evbit);
-	for (i = 0; i < kpad->gpimapsize; i++)
-		__set_bit(kpad->gpimap[i].sw_evt, input->swbit);
-
 	error = input_register_device(input);
 	if (error) {
-		dev_err(&client->dev, "unable to register input device\n");
-		goto err_free_mem;
-	}
-
-	error = request_irq(client->irq, adp5588_irq,
-			    IRQF_TRIGGER_FALLING,
-			    client->dev.driver->name, kpad);
-	if (error) {
-		dev_err(&client->dev, "irq %d busy?\n", client->irq);
-		goto err_unreg_dev;
+		dev_err(&client->dev, "unable to register input device: %d\n",
+			error);
+		return error;
 	}
 
-	error = adp5588_setup(client);
+	error = adp5588_setup(kpad);
 	if (error)
-		goto err_free_irq;
-
-	if (kpad->gpimapsize)
-		adp5588_report_switch_state(kpad);
+		return error;
 
 	error = adp5588_gpio_add(kpad);
 	if (error)
-		goto err_free_irq;
+		return error;
 
-	device_init_wakeup(&client->dev, 1);
-	i2c_set_clientdata(client, kpad);
+	error = devm_request_threaded_irq(&client->dev, client->irq,
+					  adp5588_hard_irq, adp5588_thread_irq,
+					  IRQF_TRIGGER_FALLING | IRQF_ONESHOT,
+					  client->dev.driver->name, kpad);
+	if (error) {
+		dev_err(&client->dev, "failed to request irq %d: %d\n",
+			client->irq, error);
+		return error;
+	}
 
 	dev_info(&client->dev, "Rev.%d keypad, irq %d\n", revid, client->irq);
 	return 0;
-
- err_free_irq:
-	free_irq(client->irq, kpad);
-	cancel_delayed_work_sync(&kpad->work);
- err_unreg_dev:
-	input_unregister_device(input);
-	input = NULL;
- err_free_mem:
-	input_free_device(input);
-	kfree(kpad);
-
-	return error;
 }
 
 static int adp5588_remove(struct i2c_client *client)
 {
-	struct adp5588_kpad *kpad = i2c_get_clientdata(client);
-
 	adp5588_write(client, CFG, 0);
-	free_irq(client->irq, kpad);
-	cancel_delayed_work_sync(&kpad->work);
-	input_unregister_device(kpad->input);
-	adp5588_gpio_remove(kpad);
-	kfree(kpad);
-
+	/* all resources will be freed by devm */
 	return 0;
 }
 
-#ifdef CONFIG_PM
 static int adp5588_suspend(struct device *dev)
 {
-	struct adp5588_kpad *kpad = dev_get_drvdata(dev);
-	struct i2c_client *client = kpad->client;
+	struct i2c_client *client = to_i2c_client(dev);
 
 	disable_irq(client->irq);
-	cancel_delayed_work_sync(&kpad->work);
-
-	if (device_may_wakeup(&client->dev))
-		enable_irq_wake(client->irq);
 
 	return 0;
 }
 
 static int adp5588_resume(struct device *dev)
 {
-	struct adp5588_kpad *kpad = dev_get_drvdata(dev);
-	struct i2c_client *client = kpad->client;
-
-	if (device_may_wakeup(&client->dev))
-		disable_irq_wake(client->irq);
+	struct i2c_client *client = to_i2c_client(dev);
 
 	enable_irq(client->irq);
 
@@ -644,7 +848,6 @@ static const struct dev_pm_ops adp5588_dev_pm_ops = {
 	.suspend = adp5588_suspend,
 	.resume  = adp5588_resume,
 };
-#endif
 
 static const struct i2c_device_id adp5588_id[] = {
 	{ "adp5588-keys", 0 },
@@ -653,12 +856,18 @@ static const struct i2c_device_id adp5588_id[] = {
 };
 MODULE_DEVICE_TABLE(i2c, adp5588_id);
 
+static const struct of_device_id adp5588_of_match[] = {
+	{ .compatible = "adi,adp5588" },
+	{ .compatible = "adi,adp5587" },
+	{}
+};
+MODULE_DEVICE_TABLE(of, adp5588_of_match);
+
 static struct i2c_driver adp5588_driver = {
 	.driver = {
 		.name = KBUILD_MODNAME,
-#ifdef CONFIG_PM
+		.of_match_table = adp5588_of_match,
 		.pm   = &adp5588_dev_pm_ops,
-#endif
 	},
 	.probe    = adp5588_probe,
 	.remove   = adp5588_remove,
diff --git a/include/linux/platform_data/adp5588.h b/include/linux/platform_data/adp5588.h
deleted file mode 100644
index 6d3f7d911a92..000000000000
--- a/include/linux/platform_data/adp5588.h
+++ /dev/null
@@ -1,171 +0,0 @@
-/* SPDX-License-Identifier: GPL-2.0-or-later */
-/*
- * Analog Devices ADP5588 I/O Expander and QWERTY Keypad Controller
- *
- * Copyright 2009-2010 Analog Devices Inc.
- */
-
-#ifndef _ADP5588_H
-#define _ADP5588_H
-
-#define DEV_ID 0x00		/* Device ID */
-#define CFG 0x01		/* Configuration Register1 */
-#define INT_STAT 0x02		/* Interrupt Status Register */
-#define KEY_LCK_EC_STAT 0x03	/* Key Lock and Event Counter Register */
-#define Key_EVENTA 0x04		/* Key Event Register A */
-#define Key_EVENTB 0x05		/* Key Event Register B */
-#define Key_EVENTC 0x06		/* Key Event Register C */
-#define Key_EVENTD 0x07		/* Key Event Register D */
-#define Key_EVENTE 0x08		/* Key Event Register E */
-#define Key_EVENTF 0x09		/* Key Event Register F */
-#define Key_EVENTG 0x0A		/* Key Event Register G */
-#define Key_EVENTH 0x0B		/* Key Event Register H */
-#define Key_EVENTI 0x0C		/* Key Event Register I */
-#define Key_EVENTJ 0x0D		/* Key Event Register J */
-#define KP_LCK_TMR 0x0E		/* Keypad Lock1 to Lock2 Timer */
-#define UNLOCK1 0x0F		/* Unlock Key1 */
-#define UNLOCK2 0x10		/* Unlock Key2 */
-#define GPIO_INT_STAT1 0x11	/* GPIO Interrupt Status */
-#define GPIO_INT_STAT2 0x12	/* GPIO Interrupt Status */
-#define GPIO_INT_STAT3 0x13	/* GPIO Interrupt Status */
-#define GPIO_DAT_STAT1 0x14	/* GPIO Data Status, Read twice to clear */
-#define GPIO_DAT_STAT2 0x15	/* GPIO Data Status, Read twice to clear */
-#define GPIO_DAT_STAT3 0x16	/* GPIO Data Status, Read twice to clear */
-#define GPIO_DAT_OUT1 0x17	/* GPIO DATA OUT */
-#define GPIO_DAT_OUT2 0x18	/* GPIO DATA OUT */
-#define GPIO_DAT_OUT3 0x19	/* GPIO DATA OUT */
-#define GPIO_INT_EN1 0x1A	/* GPIO Interrupt Enable */
-#define GPIO_INT_EN2 0x1B	/* GPIO Interrupt Enable */
-#define GPIO_INT_EN3 0x1C	/* GPIO Interrupt Enable */
-#define KP_GPIO1 0x1D		/* Keypad or GPIO Selection */
-#define KP_GPIO2 0x1E		/* Keypad or GPIO Selection */
-#define KP_GPIO3 0x1F		/* Keypad or GPIO Selection */
-#define GPI_EM1 0x20		/* GPI Event Mode 1 */
-#define GPI_EM2 0x21		/* GPI Event Mode 2 */
-#define GPI_EM3 0x22		/* GPI Event Mode 3 */
-#define GPIO_DIR1 0x23		/* GPIO Data Direction */
-#define GPIO_DIR2 0x24		/* GPIO Data Direction */
-#define GPIO_DIR3 0x25		/* GPIO Data Direction */
-#define GPIO_INT_LVL1 0x26	/* GPIO Edge/Level Detect */
-#define GPIO_INT_LVL2 0x27	/* GPIO Edge/Level Detect */
-#define GPIO_INT_LVL3 0x28	/* GPIO Edge/Level Detect */
-#define Debounce_DIS1 0x29	/* Debounce Disable */
-#define Debounce_DIS2 0x2A	/* Debounce Disable */
-#define Debounce_DIS3 0x2B	/* Debounce Disable */
-#define GPIO_PULL1 0x2C		/* GPIO Pull Disable */
-#define GPIO_PULL2 0x2D		/* GPIO Pull Disable */
-#define GPIO_PULL3 0x2E		/* GPIO Pull Disable */
-#define CMP_CFG_STAT 0x30	/* Comparator Configuration and Status Register */
-#define CMP_CONFG_SENS1 0x31	/* Sensor1 Comparator Configuration Register */
-#define CMP_CONFG_SENS2 0x32	/* L2 Light Sensor Reference Level, Output Falling for Sensor 1 */
-#define CMP1_LVL2_TRIP 0x33	/* L2 Light Sensor Hysteresis (Active when Output Rising) for Sensor 1 */
-#define CMP1_LVL2_HYS 0x34	/* L3 Light Sensor Reference Level, Output Falling For Sensor 1 */
-#define CMP1_LVL3_TRIP 0x35	/* L3 Light Sensor Hysteresis (Active when Output Rising) For Sensor 1 */
-#define CMP1_LVL3_HYS 0x36	/* Sensor 2 Comparator Configuration Register */
-#define CMP2_LVL2_TRIP 0x37	/* L2 Light Sensor Reference Level, Output Falling for Sensor 2 */
-#define CMP2_LVL2_HYS 0x38	/* L2 Light Sensor Hysteresis (Active when Output Rising) for Sensor 2 */
-#define CMP2_LVL3_TRIP 0x39	/* L3 Light Sensor Reference Level, Output Falling For Sensor 2 */
-#define CMP2_LVL3_HYS 0x3A	/* L3 Light Sensor Hysteresis (Active when Output Rising) For Sensor 2 */
-#define CMP1_ADC_DAT_R1 0x3B	/* Comparator 1 ADC data Register1 */
-#define CMP1_ADC_DAT_R2 0x3C	/* Comparator 1 ADC data Register2 */
-#define CMP2_ADC_DAT_R1 0x3D	/* Comparator 2 ADC data Register1 */
-#define CMP2_ADC_DAT_R2 0x3E	/* Comparator 2 ADC data Register2 */
-
-#define ADP5588_DEVICE_ID_MASK	0xF
-
- /* Configuration Register1 */
-#define ADP5588_AUTO_INC	(1 << 7)
-#define ADP5588_GPIEM_CFG	(1 << 6)
-#define ADP5588_OVR_FLOW_M	(1 << 5)
-#define ADP5588_INT_CFG		(1 << 4)
-#define ADP5588_OVR_FLOW_IEN	(1 << 3)
-#define ADP5588_K_LCK_IM	(1 << 2)
-#define ADP5588_GPI_IEN		(1 << 1)
-#define ADP5588_KE_IEN		(1 << 0)
-
-/* Interrupt Status Register */
-#define ADP5588_CMP2_INT	(1 << 5)
-#define ADP5588_CMP1_INT	(1 << 4)
-#define ADP5588_OVR_FLOW_INT	(1 << 3)
-#define ADP5588_K_LCK_INT	(1 << 2)
-#define ADP5588_GPI_INT		(1 << 1)
-#define ADP5588_KE_INT		(1 << 0)
-
-/* Key Lock and Event Counter Register */
-#define ADP5588_K_LCK_EN	(1 << 6)
-#define ADP5588_LCK21		0x30
-#define ADP5588_KEC		0xF
-
-#define ADP5588_MAXGPIO		18
-#define ADP5588_BANK(offs)	((offs) >> 3)
-#define ADP5588_BIT(offs)	(1u << ((offs) & 0x7))
-
-/* Put one of these structures in i2c_board_info platform_data */
-
-#define ADP5588_KEYMAPSIZE	80
-
-#define GPI_PIN_ROW0 97
-#define GPI_PIN_ROW1 98
-#define GPI_PIN_ROW2 99
-#define GPI_PIN_ROW3 100
-#define GPI_PIN_ROW4 101
-#define GPI_PIN_ROW5 102
-#define GPI_PIN_ROW6 103
-#define GPI_PIN_ROW7 104
-#define GPI_PIN_COL0 105
-#define GPI_PIN_COL1 106
-#define GPI_PIN_COL2 107
-#define GPI_PIN_COL3 108
-#define GPI_PIN_COL4 109
-#define GPI_PIN_COL5 110
-#define GPI_PIN_COL6 111
-#define GPI_PIN_COL7 112
-#define GPI_PIN_COL8 113
-#define GPI_PIN_COL9 114
-
-#define GPI_PIN_ROW_BASE GPI_PIN_ROW0
-#define GPI_PIN_ROW_END GPI_PIN_ROW7
-#define GPI_PIN_COL_BASE GPI_PIN_COL0
-#define GPI_PIN_COL_END GPI_PIN_COL9
-
-#define GPI_PIN_BASE GPI_PIN_ROW_BASE
-#define GPI_PIN_END GPI_PIN_COL_END
-
-#define ADP5588_GPIMAPSIZE_MAX (GPI_PIN_END - GPI_PIN_BASE + 1)
-
-struct adp5588_gpi_map {
-	unsigned short pin;
-	unsigned short sw_evt;
-};
-
-struct adp5588_kpad_platform_data {
-	int rows;			/* Number of rows */
-	int cols;			/* Number of columns */
-	const unsigned short *keymap;	/* Pointer to keymap */
-	unsigned short keymapsize;	/* Keymap size */
-	unsigned repeat:1;		/* Enable key repeat */
-	unsigned en_keylock:1;		/* Enable Key Lock feature */
-	unsigned short unlock_key1;	/* Unlock Key 1 */
-	unsigned short unlock_key2;	/* Unlock Key 2 */
-	const struct adp5588_gpi_map *gpimap;
-	unsigned short gpimapsize;
-	const struct adp5588_gpio_platform_data *gpio_data;
-};
-
-struct i2c_client; /* forward declaration */
-
-struct adp5588_gpio_platform_data {
-	int gpio_start;		/* GPIO Chip base # */
-	const char *const *names;
-	unsigned irq_base;	/* interrupt base # */
-	unsigned pullup_dis_mask; /* Pull-Up Disable Mask */
-	int	(*setup)(struct i2c_client *client,
-				unsigned gpio, unsigned ngpio,
-				void *context);
-	int	(*teardown)(struct i2c_client *client,
-				unsigned gpio, unsigned ngpio,
-				void *context);
-	void	*context;
-};
-
-#endif
-- 
2.25.1


