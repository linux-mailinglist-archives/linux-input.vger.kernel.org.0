Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D8C4024E329
	for <lists+linux-input@lfdr.de>; Sat, 22 Aug 2020 00:20:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727056AbgHUWUX (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Fri, 21 Aug 2020 18:20:23 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60988 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726961AbgHUWUD (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Fri, 21 Aug 2020 18:20:03 -0400
Received: from mail-ej1-x643.google.com (mail-ej1-x643.google.com [IPv6:2a00:1450:4864:20::643])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 02FCEC061755;
        Fri, 21 Aug 2020 15:20:03 -0700 (PDT)
Received: by mail-ej1-x643.google.com with SMTP id t10so4288874ejs.8;
        Fri, 21 Aug 2020 15:20:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=zMthiZT2NeBo4z+Tre4A12a08qtWv+UHANpqxUG9nY4=;
        b=FVrhKSq2vzzQBlap53idLCXY1+LLrqniKthxSbVsQO2qqC9UiZmI8RMx4aA22EIm9+
         y0TSQ3XykSsMZ+iHBM3ISrPPatqdMoZfzU+Mc2PQ9mEMPTWbliK9Yvi7caOZhIIkbI58
         L9Gqy4pCP/fQhRNzWd/uPvGQjcTYfMI3vEU5hC+/KVVRyeeYYTJAVP5/PK/FjQlsLykA
         GDe+FxaHCbekfBoeifEUav6DPhZoIG0UbGQShuMDntzKepslAgYGPazjmH22jkHhPFx6
         11Ubpo8CgpvixPQkEWDTKWGwOohTs/yugZwPPwwwuWjmCTGjj3hJqEEIzZ7bp1/yW1do
         kN8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=zMthiZT2NeBo4z+Tre4A12a08qtWv+UHANpqxUG9nY4=;
        b=HIjWSsVdktRyWiXN/p5T87EXw1UD9T68fiv9ATuL8ZeCbogUvEBO4lmWJ4LS8y/nk7
         cWj90rZ1UxKxa1lQq1dY5ZdF2CZsp/Th5c5tQgk+Dsng7HpUKvKaIfCvFAf3bXxoLT44
         Qz9Bewsn/J4VEaxxvBss88OmK/NySvvyMNCAT83j07MEXX1N5Npv07Zb5mBQ3xs6LnQx
         EmNthI7DIsrF8HOQzFSdQah2mg/CtzIpvFT58Kfcqdsdv6JoX/B5tBH0KzTnCcsrAgKr
         hmAbt9lsdim+rH87LQSi1NUi/EFIaqUviMF+U0MeNRirDDB/UOh6okhVWVTC5ExWdV3E
         +qjw==
X-Gm-Message-State: AOAM530ettwlNKGzdLzXXT2ozsZpvtl2ORO1vpQ43Li3ZpY/btMmkwgR
        TnbHLfnrwmhqj41VFK4qfWs=
X-Google-Smtp-Source: ABdhPJxoHXPxbNKgYO7m5sDpnoXzzxCkZZhZWA63r59Bljf1m1t5BugntxptHaMQOfRlEPaCYRkcLA==
X-Received: by 2002:a17:906:9609:: with SMTP id s9mr4987849ejx.232.1598048401628;
        Fri, 21 Aug 2020 15:20:01 -0700 (PDT)
Received: from localhost.localdomain ([188.24.159.61])
        by smtp.gmail.com with ESMTPSA id p23sm1780147edm.31.2020.08.21.15.20.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Aug 2020 15:20:01 -0700 (PDT)
From:   Cristian Ciocaltea <cristian.ciocaltea@gmail.com>
To:     Lee Jones <lee.jones@linaro.org>, Rob Herring <robh+dt@kernel.org>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Sebastian Reichel <sre@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Mark Brown <broonie@kernel.org>
Cc:     Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
        =?UTF-8?q?Andreas=20F=C3=A4rber?= <afaerber@suse.de>,
        linux-actions@lists.infradead.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-input@vger.kernel.org,
        linux-pm@vger.kernel.org
Subject: [PATCH v2 5/6] input: atc260x: Add onkey driver for ATC260x PMICs
Date:   Sat, 22 Aug 2020 01:19:51 +0300
Message-Id: <aec6ea5cfc9bf820cb4bb4a92297d2eecf6d285d.1598043782.git.cristian.ciocaltea@gmail.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <cover.1598043782.git.cristian.ciocaltea@gmail.com>
References: <cover.1598043782.git.cristian.ciocaltea@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

The Actions Semi ATC260x PMICs are able to manage an onkey button.
This driver exposes the ATC260x onkey as an input device. It can also
be configured to force a system reset on a long key-press with an
adjustable duration.

The currently supported chip variants are ATC2603C and ATC2609A.

Signed-off-by: Cristian Ciocaltea <cristian.ciocaltea@gmail.com>
---
 drivers/input/misc/Kconfig         |  11 ++
 drivers/input/misc/Makefile        |   2 +-
 drivers/input/misc/atc260x-onkey.c | 304 +++++++++++++++++++++++++++++
 3 files changed, 316 insertions(+), 1 deletion(-)
 create mode 100644 drivers/input/misc/atc260x-onkey.c

diff --git a/drivers/input/misc/Kconfig b/drivers/input/misc/Kconfig
index 362e8a01980c..9e297ebdea57 100644
--- a/drivers/input/misc/Kconfig
+++ b/drivers/input/misc/Kconfig
@@ -83,6 +83,17 @@ config INPUT_ARIZONA_HAPTICS
 	  To compile this driver as a module, choose M here: the
 	  module will be called arizona-haptics.
 
+config INPUT_ATC260X_ONKEY
+	tristate "Actions Semi ATC260x PMIC ONKEY"
+	depends on MFD_ATC260X
+	help
+	  Support the ONKEY of ATC260x PMICs as an input device reporting
+	  power button status. ONKEY can be used to wakeup from low power
+	  modes and force a reset on long press.
+
+	  To compile this driver as a module, choose M here: the
+	  module will be called atc260x-onkey.
+
 config INPUT_ATMEL_CAPTOUCH
 	tristate "Atmel Capacitive Touch Button Driver"
 	depends on OF || COMPILE_TEST
diff --git a/drivers/input/misc/Makefile b/drivers/input/misc/Makefile
index a48e5f2d859d..7f854c6ecefa 100644
--- a/drivers/input/misc/Makefile
+++ b/drivers/input/misc/Makefile
@@ -16,6 +16,7 @@ obj-$(CONFIG_INPUT_ADXL34X_I2C)		+= adxl34x-i2c.o
 obj-$(CONFIG_INPUT_ADXL34X_SPI)		+= adxl34x-spi.o
 obj-$(CONFIG_INPUT_APANEL)		+= apanel.o
 obj-$(CONFIG_INPUT_ARIZONA_HAPTICS)	+= arizona-haptics.o
+obj-$(CONFIG_INPUT_ATC260X_ONKEY)	+= atc260x-onkey.o
 obj-$(CONFIG_INPUT_ATI_REMOTE2)		+= ati_remote2.o
 obj-$(CONFIG_INPUT_ATLAS_BTNS)		+= atlas_btns.o
 obj-$(CONFIG_INPUT_ATMEL_CAPTOUCH)	+= atmel_captouch.o
@@ -84,4 +85,3 @@ obj-$(CONFIG_INPUT_WM831X_ON)		+= wm831x-on.o
 obj-$(CONFIG_INPUT_XEN_KBDDEV_FRONTEND)	+= xen-kbdfront.o
 obj-$(CONFIG_INPUT_YEALINK)		+= yealink.o
 obj-$(CONFIG_INPUT_IDEAPAD_SLIDEBAR)	+= ideapad_slidebar.o
-
diff --git a/drivers/input/misc/atc260x-onkey.c b/drivers/input/misc/atc260x-onkey.c
new file mode 100644
index 000000000000..7caec7d6f9ac
--- /dev/null
+++ b/drivers/input/misc/atc260x-onkey.c
@@ -0,0 +1,304 @@
+// SPDX-License-Identifier: GPL-2.0+
+/*
+ * Onkey driver for Actions Semi ATC260x PMICs.
+ *
+ * Copyright (c) 2020 Cristian Ciocaltea <cristian.ciocaltea@gmail.com>
+ */
+
+#include <linux/bitfield.h>
+#include <linux/input.h>
+#include <linux/interrupt.h>
+#include <linux/mfd/atc260x/core.h>
+#include <linux/module.h>
+#include <linux/of.h>
+#include <linux/platform_device.h>
+#include <linux/regmap.h>
+
+/* <2s for short press, >2s for long press */
+#define KEY_PRESS_TIME_SEC	2
+
+/* Driver internals */
+enum atc260x_onkey_reset_status {
+	KEY_RESET_HW_DEFAULT,
+	KEY_RESET_DISABLED,
+	KEY_RESET_USER_SEL,
+};
+
+struct atc260x_onkey_params {
+	u32 reg_int_ctl;
+	u32 kdwn_state_bm;
+	u32 long_int_pnd_bm;
+	u32 short_int_pnd_bm;
+	u32 kdwn_int_pnd_bm;
+	u32 press_int_en_bm;
+	u32 kdwn_int_en_bm;
+	u32 press_time_bm;
+	u32 reset_en_bm;
+	u32 reset_time_bm;
+};
+
+struct atc260x_onkey {
+	struct atc260x *atc260x;
+	const struct atc260x_onkey_params *params;
+	struct input_dev *input_dev;
+	struct delayed_work work;
+};
+
+static const struct atc260x_onkey_params atc2603c_onkey_params = {
+	.reg_int_ctl		= ATC2603C_PMU_SYS_CTL2,
+	.long_int_pnd_bm	= ATC2603C_PMU_SYS_CTL2_ONOFF_LONG_PRESS,
+	.short_int_pnd_bm	= ATC2603C_PMU_SYS_CTL2_ONOFF_SHORT_PRESS,
+	.kdwn_int_pnd_bm	= ATC2603C_PMU_SYS_CTL2_ONOFF_PRESS_PD,
+	.press_int_en_bm	= ATC2603C_PMU_SYS_CTL2_ONOFF_INT_EN,
+	.kdwn_int_en_bm		= ATC2603C_PMU_SYS_CTL2_ONOFF_PRESS_INT_EN,
+	.kdwn_state_bm		= ATC2603C_PMU_SYS_CTL2_ONOFF_PRESS,
+	.press_time_bm		= ATC2603C_PMU_SYS_CTL2_ONOFF_PRESS_TIME,
+	.reset_en_bm		= ATC2603C_PMU_SYS_CTL2_ONOFF_PRESS_RESET_EN,
+	.reset_time_bm		= ATC2603C_PMU_SYS_CTL2_ONOFF_RESET_TIME_SEL,
+};
+
+static const struct atc260x_onkey_params atc2609a_onkey_params = {
+	.reg_int_ctl		= ATC2609A_PMU_SYS_CTL2,
+	.long_int_pnd_bm	= ATC2609A_PMU_SYS_CTL2_ONOFF_LONG_PRESS,
+	.short_int_pnd_bm	= ATC2609A_PMU_SYS_CTL2_ONOFF_SHORT_PRESS,
+	.kdwn_int_pnd_bm	= ATC2609A_PMU_SYS_CTL2_ONOFF_PRESS_PD,
+	.press_int_en_bm	= ATC2609A_PMU_SYS_CTL2_ONOFF_LSP_INT_EN,
+	.kdwn_int_en_bm		= ATC2609A_PMU_SYS_CTL2_ONOFF_PRESS_INT_EN,
+	.kdwn_state_bm		= ATC2609A_PMU_SYS_CTL2_ONOFF_PRESS,
+	.press_time_bm		= ATC2609A_PMU_SYS_CTL2_ONOFF_PRESS_TIME,
+	.reset_en_bm		= ATC2609A_PMU_SYS_CTL2_ONOFF_RESET_EN,
+	.reset_time_bm		= ATC2609A_PMU_SYS_CTL2_ONOFF_RESET_TIME_SEL,
+};
+
+static int atc2603x_onkey_hw_init(struct atc260x_onkey *onkey,
+				  enum atc260x_onkey_reset_status reset_status,
+				  u32 reset_time, u32 press_time)
+{
+	u32 reg_bm, reg_val;
+
+	reg_bm = onkey->params->long_int_pnd_bm |
+		 onkey->params->short_int_pnd_bm |
+		 onkey->params->kdwn_int_pnd_bm |
+		 onkey->params->press_int_en_bm |
+		 onkey->params->kdwn_int_en_bm;
+
+	reg_val = reg_bm | press_time;
+	reg_bm |= onkey->params->press_time_bm;
+
+	if (reset_status == KEY_RESET_DISABLED) {
+		reg_bm |= onkey->params->reset_en_bm;
+	} else if (reset_status == KEY_RESET_USER_SEL) {
+		reg_bm |= onkey->params->reset_en_bm |
+			  onkey->params->reset_time_bm;
+		reg_val |= onkey->params->reset_en_bm | reset_time;
+	}
+
+	return regmap_update_bits(onkey->atc260x->regmap,
+				  onkey->params->reg_int_ctl, reg_bm, reg_val);
+}
+
+static void atc260x_onkey_query(struct atc260x_onkey *onkey)
+{
+	u32 reg_bits;
+	int ret, key_down;
+
+	ret = regmap_read(onkey->atc260x->regmap,
+			  onkey->params->reg_int_ctl, &key_down);
+	if (ret) {
+		key_down = 1;
+		dev_err(onkey->atc260x->dev,
+			"Failed to read onkey status: %d\n", ret);
+	} else {
+		key_down &= onkey->params->kdwn_state_bm;
+	}
+
+	/*
+	 * The hardware generates interrupt only when the onkey pin is
+	 * asserted. Hence, the deassertion of the pin is simulated through
+	 * work queue.
+	 */
+	if (key_down) {
+		schedule_delayed_work(&onkey->work, msecs_to_jiffies(200));
+		return;
+	}
+
+	/*
+	 * The key-down status bit is cleared when the On/Off button
+	 * is released.
+	 */
+	input_report_key(onkey->input_dev, KEY_POWER, 0);
+	input_sync(onkey->input_dev);
+
+	reg_bits = onkey->params->long_int_pnd_bm |
+		   onkey->params->short_int_pnd_bm |
+		   onkey->params->kdwn_int_pnd_bm |
+		   onkey->params->press_int_en_bm |
+		   onkey->params->kdwn_int_en_bm;
+
+	/* Clear key press pending events and enable key press interrupts. */
+	regmap_update_bits(onkey->atc260x->regmap, onkey->params->reg_int_ctl,
+			   reg_bits, reg_bits);
+}
+
+static void atc260x_onkey_work(struct work_struct *work)
+{
+	struct atc260x_onkey *onkey = container_of(work, struct atc260x_onkey,
+						   work.work);
+	atc260x_onkey_query(onkey);
+}
+
+static irqreturn_t atc260x_onkey_irq(int irq, void *data)
+{
+	struct atc260x_onkey *onkey = data;
+	int ret;
+
+	/* Disable key press interrupts. */
+	ret = regmap_update_bits(onkey->atc260x->regmap,
+				 onkey->params->reg_int_ctl,
+				 onkey->params->press_int_en_bm |
+				 onkey->params->kdwn_int_en_bm, 0);
+	if (ret)
+		dev_err(onkey->atc260x->dev,
+			"Failed to disable interrupts: %d\n", ret);
+
+	input_report_key(onkey->input_dev, KEY_POWER, 1);
+	input_sync(onkey->input_dev);
+
+	atc260x_onkey_query(onkey);
+
+	return IRQ_HANDLED;
+}
+
+static int atc260x_onkey_probe(struct platform_device *pdev)
+{
+	struct atc260x *atc260x = dev_get_drvdata(pdev->dev.parent);
+	struct atc260x_onkey *onkey;
+	struct input_dev *input_dev;
+	enum atc260x_onkey_reset_status reset_status;
+	u32 press_time = KEY_PRESS_TIME_SEC, reset_time = 0;
+	int val, irq, ret;
+
+	if (!pdev->dev.of_node)
+		return -ENXIO;
+
+	onkey = devm_kzalloc(&pdev->dev, sizeof(*onkey), GFP_KERNEL);
+	if (!onkey)
+		return -ENOMEM;
+
+	ret = device_property_read_u32(&pdev->dev,
+				       "actions,reset-time-sec", &val);
+	if (ret) {
+		reset_status = KEY_RESET_HW_DEFAULT;
+	} else if (val) {
+		if (val < 6 || val > 12) {
+			dev_err(&pdev->dev, "actions,reset-time-sec out of range\n");
+			return -EINVAL;
+		}
+
+		reset_status = KEY_RESET_USER_SEL;
+		reset_time = (val - 6) / 2;
+	} else {
+		reset_status = KEY_RESET_DISABLED;
+		dev_info(&pdev->dev, "Disabled reset on long-press\n");
+	}
+
+	switch (atc260x->ic_type) {
+	case ATC2603C:
+		onkey->params = &atc2603c_onkey_params;
+		press_time = FIELD_PREP(ATC2603C_PMU_SYS_CTL2_ONOFF_PRESS_TIME,
+					press_time);
+		reset_time = FIELD_PREP(ATC2603C_PMU_SYS_CTL2_ONOFF_RESET_TIME_SEL,
+					reset_time);
+		break;
+	case ATC2609A:
+		onkey->params = &atc2609a_onkey_params;
+		press_time = FIELD_PREP(ATC2609A_PMU_SYS_CTL2_ONOFF_PRESS_TIME,
+					press_time);
+		reset_time = FIELD_PREP(ATC2609A_PMU_SYS_CTL2_ONOFF_RESET_TIME_SEL,
+					reset_time);
+		break;
+	default:
+		dev_err(&pdev->dev,
+			"OnKey not supported for ATC260x PMIC type: %u\n",
+			atc260x->ic_type);
+		return -EINVAL;
+	}
+
+	input_dev = devm_input_allocate_device(&pdev->dev);
+	if (!input_dev) {
+		dev_err(&pdev->dev, "Failed to allocate input device\n");
+		return -ENOMEM;
+	}
+
+	onkey->input_dev = input_dev;
+	onkey->atc260x = atc260x;
+
+	input_dev->name = "atc260x-onkey";
+	input_dev->phys = "atc260x-onkey/input0";
+	input_dev->evbit[0] = BIT_MASK(EV_KEY);
+	input_set_capability(input_dev, EV_KEY, KEY_POWER);
+
+	INIT_DELAYED_WORK(&onkey->work, atc260x_onkey_work);
+
+	irq = platform_get_irq(pdev, 0);
+	if (irq < 0)
+		return irq;
+
+	ret = devm_request_threaded_irq(&pdev->dev, irq, NULL,
+					atc260x_onkey_irq,
+					IRQF_TRIGGER_HIGH | IRQF_ONESHOT,
+					dev_name(&pdev->dev), onkey);
+	if (ret) {
+		dev_err(&pdev->dev,
+			"Failed to register IRQ %d: %d\n", irq, ret);
+		return ret;
+	}
+
+	ret = input_register_device(input_dev);
+	if (ret) {
+		dev_err(&pdev->dev,
+			"Failed to register input device: %d\n", ret);
+		return ret;
+	}
+
+	ret = atc2603x_onkey_hw_init(onkey, reset_status,
+				     reset_time, press_time);
+	if (ret)
+		return ret;
+
+	platform_set_drvdata(pdev, onkey);
+	device_init_wakeup(&pdev->dev, true);
+
+	return 0;
+}
+
+static int atc260x_onkey_remove(struct platform_device *pdev)
+{
+	struct atc260x_onkey *onkey = platform_get_drvdata(pdev);
+
+	cancel_delayed_work_sync(&onkey->work);
+
+	return 0;
+}
+
+static const struct of_device_id atc260x_onkey_of_match[] = {
+	{ .compatible = "actions,atc2603c-onkey" },
+	{ .compatible = "actions,atc2609a-onkey" },
+	{ /* sentinel */ }
+};
+MODULE_DEVICE_TABLE(of, atc260x_onkey_of_match);
+
+static struct platform_driver atc260x_onkey_driver = {
+	.probe	= atc260x_onkey_probe,
+	.remove	= atc260x_onkey_remove,
+	.driver	= {
+		.name = "atc260x-onkey",
+		.of_match_table = of_match_ptr(atc260x_onkey_of_match),
+	},
+};
+
+module_platform_driver(atc260x_onkey_driver);
+
+MODULE_DESCRIPTION("Onkey driver for ATC260x PMICs");
+MODULE_AUTHOR("Cristian Ciocaltea <cristian.ciocaltea@gmail.com>");
+MODULE_LICENSE("GPL");
-- 
2.28.0

