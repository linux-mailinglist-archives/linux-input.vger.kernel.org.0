Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id DBE354DA653
	for <lists+linux-input@lfdr.de>; Wed, 16 Mar 2022 00:37:45 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1344673AbiCOXi5 (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 15 Mar 2022 19:38:57 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41196 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S245117AbiCOXiz (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Tue, 15 Mar 2022 19:38:55 -0400
Received: from mail-lj1-x231.google.com (mail-lj1-x231.google.com [IPv6:2a00:1450:4864:20::231])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 45BA9574A5
        for <linux-input@vger.kernel.org>; Tue, 15 Mar 2022 16:37:41 -0700 (PDT)
Received: by mail-lj1-x231.google.com with SMTP id bn33so1002922ljb.6
        for <linux-input@vger.kernel.org>; Tue, 15 Mar 2022 16:37:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=ufNWNXL+hnkWD10DMnaNtl85CsHUW4oMweOqNJZ88TU=;
        b=Cox5x569iddMVVizgBcI8WPAksdJM7vNLEUlWvAhUSSwddX5jqahmRE0K5OPU18iQb
         WX9AxMx3W6SlGJ0qOr9hEEYZwvIDJMpJz6HVvhhGA4GyP0nVSAXOq1qGqp7RkdCX2qcC
         rA+oovIqbHcyITRdZriK0IRh+wf0/TkKrGWQbQmIzyvoVfIrHHQV6k97JhFwy/g7Xm9B
         rSRBn5AUt5aLLjHhkUPRccq0da4kc/yQJ00tZ+XCGzOUxk5bQsB7RauuBo6SQxw5kAVr
         VeL3fd725fWeAGSiguGZEqRc2uxy9C+Z3RWlVRUOVhjIwPTE14Mnedr+WlonZiW7eHMU
         eb3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=ufNWNXL+hnkWD10DMnaNtl85CsHUW4oMweOqNJZ88TU=;
        b=FbP0RDF52Iw++f+4srMtbuTlhVHwzJiejEu2j9JFm4HFkwPn0TNWQ4KiJ5NA8/PVqP
         0RrI3lo96pjEc879dPJHTM9WsT7Om3KApXC/fOfTOdD0Tpt5RJBhG2EniYYiaAfSQyV3
         4ygNBlWDM5SjF24i/kRQRlkpc3qXM8GuAtxC3KuBb6/6wp+jzHUJSpbe6FmpBsBqGLxZ
         qs1muiDlq/NwOoujEYLOnGGPjjsDYgI5dIJ1fqOBSbGE6WvmHNG0CnzTCPNGoLaIoOfa
         8Nt7OvAvs7S09ydNeSpaCPJ5GejiCiFmx8crQBEQZ7RhvuWHeaq5ZwfHpifpC7hdpYku
         V3kA==
X-Gm-Message-State: AOAM5329W5Tiyqck3knoU7TI3PLdc0X3j3yaplAH6wLpJBXvSZyTe3Od
        /BGiF2RyHyCM8FOg9iu/oqZWaLE01gTgQA==
X-Google-Smtp-Source: ABdhPJwZo9UkFkLyXUIDL9Z1AUK2h3F2pNSJXbIsJA2He5faX6H9ECedN8OxAkqTS2qCvVpJpRqY1g==
X-Received: by 2002:a2e:808b:0:b0:238:ea7c:faf8 with SMTP id i11-20020a2e808b000000b00238ea7cfaf8mr18576016ljg.513.1647387459543;
        Tue, 15 Mar 2022 16:37:39 -0700 (PDT)
Received: from localhost.localdomain (c-fdcc225c.014-348-6c756e10.bbcust.telenor.se. [92.34.204.253])
        by smtp.gmail.com with ESMTPSA id w10-20020ac2442a000000b0044835a52a08sm29543lfl.163.2022.03.15.16.37.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Mar 2022 16:37:39 -0700 (PDT)
From:   Linus Walleij <linus.walleij@linaro.org>
To:     Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        linux-input@vger.kernel.org
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        phone-devel@vger.kernel.org
Subject: [PATCH 3/3] Input: isa1200 - new driver for Immersion ISA1200
Date:   Wed, 16 Mar 2022 00:35:28 +0100
Message-Id: <20220315233528.1204930-3-linus.walleij@linaro.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220315233528.1204930-1-linus.walleij@linaro.org>
References: <20220315233528.1204930-1-linus.walleij@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

The ISA1200 is a haptic feedback unit from Immersion Corporation
using two motors for haptic feedback in mobile phones. It is
used in Samsung Galxy S Advance GT-I9070 (Janice) and Samsung
Beam GT-I8350 (Gavini).

Cc: phone-devel@vger.kernel.org
Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
 MAINTAINERS                  |   6 +
 drivers/input/misc/Kconfig   |  11 +
 drivers/input/misc/Makefile  |   1 +
 drivers/input/misc/isa1200.c | 429 +++++++++++++++++++++++++++++++++++
 4 files changed, 447 insertions(+)
 create mode 100644 drivers/input/misc/isa1200.c

diff --git a/MAINTAINERS b/MAINTAINERS
index ea3e6c914384..439bb72c9468 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -9363,6 +9363,12 @@ IMGTEC IR DECODER DRIVER
 S:	Orphan
 F:	drivers/media/rc/img-ir/
 
+IMMERSION ISA1200 HAPTIC FEEDBACK CHIP
+M:	Linus Walleij <linus.walleij@linaro.org>
+L:	linux-input@vger.kernel.org
+F:	Documentation/devicetree/bindings/input/immersion,isa1200.yaml
+F:	drivers/input/misc/isa1200.c
+
 IMON SOUNDGRAPH USB IR RECEIVER
 M:	Sean Young <sean@mess.org>
 L:	linux-media@vger.kernel.org
diff --git a/drivers/input/misc/Kconfig b/drivers/input/misc/Kconfig
index dd5227cf8696..3a0e371a6579 100644
--- a/drivers/input/misc/Kconfig
+++ b/drivers/input/misc/Kconfig
@@ -762,6 +762,17 @@ config INPUT_IQS626A
 	  To compile this driver as a module, choose M here: the
 	  module will be called iqs626a.
 
+config INPUT_ISA1200_HAPTIC
+	tristate "Immersion ISA1200 haptic feedback unit"
+	depends on I2C
+	select REGMAP_I2C
+	help
+	  Say Y to enable support for the Immersion ISA1200 haptic
+	  feedback unit.
+
+	  To compile this driver as a module, choose M here: the
+	  module will be called isa1200.
+
 config INPUT_CMA3000
 	tristate "VTI CMA3000 Tri-axis accelerometer"
 	help
diff --git a/drivers/input/misc/Makefile b/drivers/input/misc/Makefile
index b92c53a6b5ae..f6987c20e516 100644
--- a/drivers/input/misc/Makefile
+++ b/drivers/input/misc/Makefile
@@ -44,6 +44,7 @@ obj-$(CONFIG_HP_SDC_RTC)		+= hp_sdc_rtc.o
 obj-$(CONFIG_INPUT_IMS_PCU)		+= ims-pcu.o
 obj-$(CONFIG_INPUT_IQS269A)		+= iqs269a.o
 obj-$(CONFIG_INPUT_IQS626A)		+= iqs626a.o
+obj-$(CONFIG_INPUT_ISA1200_HAPTIC)	+= isa1200.o
 obj-$(CONFIG_INPUT_KEYSPAN_REMOTE)	+= keyspan_remote.o
 obj-$(CONFIG_INPUT_KXTJ9)		+= kxtj9.o
 obj-$(CONFIG_INPUT_M68K_BEEP)		+= m68kspkr.o
diff --git a/drivers/input/misc/isa1200.c b/drivers/input/misc/isa1200.c
new file mode 100644
index 000000000000..472058c32d42
--- /dev/null
+++ b/drivers/input/misc/isa1200.c
@@ -0,0 +1,429 @@
+// SPDX-License-Identifier: GPL-2.0+
+/*
+ * Immersion Corporation ISA1200 haptic feedback unit
+ * This chip controls two force-feedback motors
+ *
+ * This chip can use either an external clock or an external PWM
+ * to drive the PWM. If a clock is used, the chip will generate the
+ * PWM for the motor. If a PWM input is used, the chip will act as
+ * an amplifier for the PWM input.
+ *
+ * No datasheet exists, registers and values extracted from GPL
+ * code drops from various Samsung mobile phones:
+ *
+ * - Galaxy S Advance GT-I9070
+ * - Galaxy Beam GT-I8350
+ *
+ * Copyright (C) 2022 Linus Walleij <linus.walleij@linaro.org>
+ */
+
+#include <linux/bits.h>
+#include <linux/clk.h>
+#include <linux/delay.h>
+#include <linux/device.h>
+#include <linux/err.h>
+#include <linux/i2c.h>
+#include <linux/input.h>
+#include <linux/kernel.h>
+#include <linux/module.h>
+#include <linux/regmap.h>
+#include <linux/slab.h>
+#include <linux/gpio/consumer.h>
+#include <linux/property.h>
+
+/* System control (LDO regulator) */
+#define ISA1200_SCTRL			0x00
+
+#define ISA1200_LDO_VOLTAGE_23V		0x08
+#define ISA1200_LDO_VOLTAGE_24V		0x09
+#define ISA1200_LDO_VOLTAGE_25V		0x0A
+#define ISA1200_LDO_VOLTAGE_26V		0x0B
+#define ISA1200_LDO_VOLTAGE_27V		0x0C
+#define ISA1200_LDO_VOLTAGE_28V		0x0D
+#define ISA1200_LDO_VOLTAGE_29V		0x0E
+#define ISA1200_LDO_VOLTAGE_30V		0x0F
+#define ISA1200_LDO_VOLTAGE_31V		0x00
+#define ISA1200_LDO_VOLTAGE_32V		0x01
+#define ISA1200_LDO_VOLTAGE_33V		0x02
+#define ISA1200_LDO_VOLTAGE_34V		0x03
+#define ISA1200_LDO_VOLTAGE_35V		0x04
+#define ISA1200_LDO_VOLTAGE_36V		0x05
+#define ISA1200_LDO_VOLTAGE_37V		0x06
+#define ISA1200_LDO_VOLTAGE_38V		0x07
+
+/*
+ * The vendor source code for the GT-I9070 states that the output
+ * frequency is calculated like this:
+ *
+ *                 base clock frequency
+ * fout = -----------------------------------------
+ *        (128 - PWM_FREQ) * 2 * PLLDIV * PWM_PERIOD
+ *
+ * The base clock frequency is the clock frequency provided on the
+ * clock input to the chip, divided by the value in HCTRL0
+ *
+ * PWM_FREQ is configured in register HCTRL4, it is common to set this
+ * to 0 to get only two variables to calculate.
+ *
+ * PLLDIV is configured in register HCTRL3 (bits 7..4, so 0..15)
+ * PWM_PERIOD is configured in register HCTRL6
+ * Further the duty cycle can be configured in HCTRL5
+ */
+
+/*
+ * HCTRL0 configures clock or PWM input and selects the divider for
+ * the clock input.
+ *
+ * Code comments says that bits [1..0] gives the division factor.
+ * If the input clock is 44.8 kHz, writing 0x11 into this register
+ * sets the div_factor to 256 and the resulting frequency will be
+ * 44800/256 = 175Hz.
+ *
+ * If the PWM input mode is set the input on the clock/PWM pin is
+ * assumed to be a PWM already rather than a regular clock pulse.
+ */
+#define ISA1200_HCTRL0			0x30
+#define ISA1200_HCTRL0_PWM_GEN_ENABLE	BIT(7)
+#define ISA1200_HCTRL0_PWM_GEN_MODE	BIT(4)
+#define ISA1200_HCTRL0_PWM_INPUT_MODE	BIT(3)
+#define ISA1200_HCTRL0_DIV_512		0x00
+#define ISA1200_HCTRL0_DIV_256		0x01
+
+/*
+ * HCTRL1 configures the motor type(s)
+ * ERM = Excentric rotating mass
+ * LRA = Linear Resonant Actuator
+ *
+ * Bits [0..1] are set to 1 when using PWM input, we don't know
+ * why.
+ */
+#define ISA1200_HCTRL1			0x31
+#define ISA1200_HCTRL1_EXT_CLOCK	BIT(7) /* Else PWM in is assumed */
+#define ISA1200_HCTRL1_DAC_INVERT	BIT(6)
+#define ISA1200_HCTRL1_ERM		BIT(5) /* Else LRA is assumed */
+
+/* HCTRL2 controls software reset of the chip */
+#define ISA1200_HCTRL2			0x32
+#define ISA1200_HCTRL2_SW_RESET		BIT(0)
+
+/*
+ * HCTRL3 controls the PLL divisor
+ *
+ * Bits [0,1] are always set to 1 (we don't know what they are
+ * used for) and bit 4 and upward control the PLL divisor.
+ */
+#define ISA1200_HCTRL3			0x33
+#define ISA1200_HCTRL3_DEFAULT		0x03
+#define ISA1200_HCTRL3_PLLDIV_SHIFT	4
+
+/*
+ * HCTRL4 controls the PWM frequency
+ *
+ * Set this to 0 and ignore the duty cycle and period registers if
+ * PWM input mode is used.
+ */
+#define ISA1200_HCTRL4			0x34
+
+/* HCTRL5 controls the PWM high duty cycle */
+#define ISA1200_HCTRL5			0x35
+
+/* HCTRL6 controls the PWM period */
+#define ISA1200_HCTRL6			0x36
+
+/* The use for these registers is unknown but they exist */
+#define ISA1200_HCTRL7			0x37
+#define ISA1200_HCTRL8			0x38
+#define ISA1200_HCTRL9			0x39
+#define ISA1200_HCTRLA			0x3A
+#define ISA1200_HCTRLB			0x3B
+#define ISA1200_HCTRLC			0x3C
+#define ISA1200_HCTRLD			0x3D
+
+struct isa1200_config {
+	u8 ldo_voltage;
+	bool pwm_in;
+	bool erm;
+	u8 clkdiv;
+	u8 plldiv;
+	u8 freq;
+	u8 duty;
+	u8 period;
+};
+
+struct isa1200 {
+	const struct isa1200_config *conf;
+	struct input_dev *input;
+	struct device *dev;
+	struct regmap *map;
+	struct clk *clk;
+	struct gpio_desc *hen;
+	struct gpio_desc *len;
+	struct work_struct play_work;
+	int level;
+};
+
+static const struct regmap_config isa1200_regmap_config = {
+	.reg_bits = 8,
+	.val_bits = 8,
+	.max_register = 0x3d,
+};
+
+void isa1200_start(struct isa1200 *isa)
+{
+	const struct isa1200_config *cfg = isa->conf;
+	u8 hctrl0;
+	u8 hctrl1;
+	u8 hctrl3;
+
+	clk_prepare_enable(isa->clk);
+	gpiod_set_value(isa->hen, 1);
+	gpiod_set_value(isa->len, 1);
+
+	udelay(200);
+
+	regmap_write(isa->map, ISA1200_SCTRL, cfg->ldo_voltage);
+
+	if (!cfg->pwm_in) {
+		hctrl0 = ISA1200_HCTRL0_PWM_GEN_MODE;
+		hctrl1 = ISA1200_HCTRL1_EXT_CLOCK;
+	} else {
+		hctrl0 = ISA1200_HCTRL0_PWM_INPUT_MODE;
+		hctrl1 = 0;
+	}
+	hctrl0 |= cfg->clkdiv;
+	hctrl1 |= ISA1200_HCTRL1_DAC_INVERT;
+	if (cfg->erm)
+		hctrl1 |= ISA1200_HCTRL1_ERM;
+
+	regmap_write(isa->map, ISA1200_HCTRL0, hctrl0);
+	regmap_write(isa->map, ISA1200_HCTRL1, hctrl1);
+
+	/* Make sure to de-assert software reset */
+	regmap_write(isa->map, ISA1200_HCTRL2, 0x00);
+
+	/* PLL divisor */
+	hctrl3 = ISA1200_HCTRL3_DEFAULT;
+	hctrl3 |= (cfg->plldiv << ISA1200_HCTRL3_PLLDIV_SHIFT);
+	regmap_write(isa->map, ISA1200_HCTRL3, hctrl3);
+
+	/* Frequency */
+	regmap_write(isa->map, ISA1200_HCTRL4, cfg->freq);
+	/* Duty cycle */
+	regmap_write(isa->map, ISA1200_HCTRL5, cfg->duty);
+	/* Period */
+	regmap_write(isa->map, ISA1200_HCTRL6, cfg->period);
+
+	/* Turn on PWM generation in BIT(7) */
+	hctrl0 |= ISA1200_HCTRL0_PWM_GEN_ENABLE;
+	regmap_write(isa->map, ISA1200_HCTRL0, hctrl0);
+
+	/*
+	 * This is done in the vendor tree with the commment
+	 * "Duty 0x64 == nForce 90", and no force feedback happens
+	 * unless we do this.
+	 */
+	regmap_write(isa->map, ISA1200_HCTRL5, 0x64);
+}
+
+void isa1200_stop(struct isa1200 *isa)
+{
+	regmap_write(isa->map, ISA1200_HCTRL0, 0);
+	gpiod_set_value(isa->len, 0);
+	gpiod_set_value(isa->hen, 0);
+	clk_disable_unprepare(isa->clk);
+}
+
+static void isa1200_play_work(struct work_struct *work)
+{
+	struct isa1200 *isa =
+		container_of(work, struct isa1200, play_work);
+
+	if (isa->level)
+		isa1200_start(isa);
+	else
+		isa1200_stop(isa);
+}
+
+static int isa1200_vibrator_play_effect(struct input_dev *input, void *data,
+					struct ff_effect *effect)
+{
+	struct isa1200 *isa = input_get_drvdata(input);
+	int level;
+
+	/*
+	 * TODO: we currently only support rumble.
+	 * The ISA1200 can control two motors and some devices
+	 * also have two motors mounted.
+	 */
+	level = effect->u.rumble.strong_magnitude;
+	if (!level)
+		level = effect->u.rumble.weak_magnitude;
+
+	dev_dbg(&input->dev, "FF effect type %d level %d\n",
+		effect->type, level);
+
+	if (isa->level != level) {
+		isa->level = level;
+		schedule_work(&isa->play_work);
+	}
+
+	return 0;
+}
+
+static void isa1200_vibrator_close(struct input_dev *input)
+{
+	struct isa1200 *isa = input_get_drvdata(input);
+
+	cancel_work_sync(&isa->play_work);
+	if (isa->level)
+		isa1200_stop(isa);
+	isa->level = 0;
+}
+
+static int isa1200_probe(struct i2c_client *client)
+{
+	struct isa1200 *isa;
+	struct device *dev = &client->dev;
+	u32 val;
+	int ret;
+
+	isa = devm_kzalloc(dev, sizeof(*isa), GFP_KERNEL);
+	if (!isa)
+		return -ENOMEM;
+
+	isa->input = devm_input_allocate_device(dev);
+	if (!isa->input)
+		return -ENOMEM;
+
+	i2c_set_clientdata(client, isa);
+	isa->dev = dev;
+	isa->conf = device_get_match_data(dev);
+
+	/*
+	 * TODO: we currently only support using a clock, but the device
+	 * and the device tree bindings support feeding the chip with a
+	 * PWM instead. If you need this and can test it, implement it.
+	 */
+	isa->clk = devm_clk_get(dev, NULL);
+	if (IS_ERR(isa->clk)) {
+		ret = PTR_ERR(isa->clk);
+		return dev_err_probe(dev, ret, "failed to get clock\n");
+	}
+
+	isa->map = devm_regmap_init_i2c(client, &isa1200_regmap_config);
+	if (IS_ERR(isa->map)) {
+		ret = PTR_ERR(isa->map);
+		return dev_err_probe(dev, ret, "failed to initialize register map\n");
+	}
+
+	/* Read a register so we know that regmap and I2C transport works */
+	ret = regmap_read(isa->map, ISA1200_SCTRL, &val);
+	if (ret) {
+		dev_info(dev, "failed to read SCTRL: %d\n", ret);
+		return ret;
+	}
+
+	isa->hen = devm_gpiod_get(dev, "hen", GPIOD_OUT_LOW);
+	if (IS_ERR(isa->hen)) {
+		ret = PTR_ERR(isa->map);
+		return dev_err_probe(dev, ret, "failed to get HEN GPIO\n");
+	}
+	isa->len = devm_gpiod_get(dev, "len", GPIOD_OUT_LOW);
+	if (IS_ERR(isa->hen)) {
+		ret = PTR_ERR(isa->map);
+		return dev_err_probe(dev, ret, "failed to get LEN GPIO\n");
+	}
+
+	INIT_WORK(&isa->play_work, isa1200_play_work);
+
+	isa->input->name = "isa1200-haptic";
+	isa->input->id.bustype = BUS_HOST;
+	isa->input->dev.parent = dev;
+	isa->input->close = isa1200_vibrator_close;
+
+	input_set_drvdata(isa->input, isa);
+	/* TODO: this hardware can likely support more than rumble */
+	input_set_capability(isa->input, EV_FF, FF_RUMBLE);
+
+	ret = input_ff_create_memless(isa->input, NULL,
+				      isa1200_vibrator_play_effect);
+	if (ret)
+		return dev_err_probe(dev, ret, "couldn't create FF dev\n");
+
+	ret = input_register_device(isa->input);
+	if (ret)
+		return dev_err_probe(dev, ret, "couldn't register input dev\n");
+
+	return ret;
+}
+
+static int __maybe_unused isa1200_suspend(struct device *dev)
+{
+	struct isa1200 *isa = dev_get_drvdata(dev);
+
+	if (isa->level)
+		isa1200_stop(isa);
+
+	return 0;
+}
+
+static int __maybe_unused isa1200_resume(struct device *dev)
+{
+	struct isa1200 *isa = dev_get_drvdata(dev);
+
+	if (isa->level)
+		isa1200_start(isa);
+
+	return 0;
+}
+
+static SIMPLE_DEV_PM_OPS(isa1200_pm, isa1200_suspend, isa1200_resume);
+
+/* Configuration for Janice, Samsung Galaxy S Advance GT-I9070 */
+static const struct isa1200_config isa1200_janice = {
+	.ldo_voltage = ISA1200_LDO_VOLTAGE_30V,
+	.pwm_in = false,
+	.clkdiv = ISA1200_HCTRL0_DIV_256,
+	.plldiv = 2,
+	.freq = 0,
+	.duty = 0x3b,
+	.period = 0x77,
+};
+
+/* Configuration for Gavini, Samsung Galaxy Beam GT-I8350 */
+static const struct isa1200_config isa1200_gavini = {
+	.ldo_voltage = ISA1200_LDO_VOLTAGE_27V,
+	.pwm_in = false,
+	.clkdiv = ISA1200_HCTRL0_DIV_256,
+	.plldiv = 2,
+	.freq = 0,
+	.duty = 0x46,
+	.period = 0x8c,
+};
+
+static const struct of_device_id isa1200_of_match[] = {
+	{
+		.compatible = "immersion,isa1200-janice",
+		.data = &isa1200_janice,
+	},
+	{
+		.compatible = "immersion,isa1200-gavini",
+		.data = &isa1200_gavini,
+	},
+	{ }
+};
+MODULE_DEVICE_TABLE(of, isa1200_of_match);
+
+static struct i2c_driver isa1200_i2c_driver = {
+	.driver = {
+		.name = "isa1200",
+		.of_match_table = isa1200_of_match,
+		.pm = &isa1200_pm,
+	},
+	.probe_new = isa1200_probe,
+};
+module_i2c_driver(isa1200_i2c_driver);
+
+MODULE_AUTHOR("Linus Walleij <linus.walleij@linaro.org>");
+MODULE_DESCRIPTION("Immersion ISA1200 haptic feedback unit");
+MODULE_LICENSE("GPL");
-- 
2.35.1

