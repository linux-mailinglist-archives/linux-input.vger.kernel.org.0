Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2E6CA2D0020
	for <lists+linux-input@lfdr.de>; Sun,  6 Dec 2020 02:28:14 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726524AbgLFB2A (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Sat, 5 Dec 2020 20:28:00 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49720 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725920AbgLFB2A (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Sat, 5 Dec 2020 20:28:00 -0500
Received: from mail-ej1-x642.google.com (mail-ej1-x642.google.com [IPv6:2a00:1450:4864:20::642])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3FF36C061A51;
        Sat,  5 Dec 2020 17:27:19 -0800 (PST)
Received: by mail-ej1-x642.google.com with SMTP id jx16so14259319ejb.10;
        Sat, 05 Dec 2020 17:27:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=TsVKFsOeLdK2j1YtPacILbkAMjBSkNql8cYyZO9ql44=;
        b=mmSH6522AWrHY9OgkfXiFC0Pf61NdGBBh8RzL9TxUqvin24TSBTg3CfVhGjl+0gApj
         93hr3Y04+8LXzJgJLhAc8BHv5I0t4hyDjq0y6tmRWeYrTkhPFPTrFt2fgXeFuxUp3Oik
         2i8AfvKk5vvbu5B8Rh0VBZXgHrZ4GkMX3FUdtjgdPRsUH+BdWVvbPhm9wVf3Fj3FnW3v
         Tzv9TkvP3If/CnGIA7eVVaamcz0AWVmkCUICI1zWKKC7gQMKNYT5hDWqNtx4st9ksHqe
         05sbMagwRqP6cBO/beoePZ4dPKGcKCpRwclMWU/SutujTjhJfl8LK6Q50OBi5pa6GYgJ
         ylHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=TsVKFsOeLdK2j1YtPacILbkAMjBSkNql8cYyZO9ql44=;
        b=AAnZZX9p663KSO0mAH0T5OQIj/P1Xz52WglPnMCS/gm20b4PoS5aQUSfU6VMoe4aw/
         YjT2XsSGbt79nKntt5ZzBSKP/yHppbntQUJNJIbZAKcmFqpqVuTTnTGTPMw2ch2s3eio
         yMUtHUMI0LfC17Be+SZ4uqB1ne9stMgX1QbduEExU0BesjJHcyOcPjXMCOAc8PhGRl8t
         QwY+kcVq202DQ2ZVQ62tgFBjoR/TymHm5oyfVk+/panfCxBQasfXi49ah4RfmVkx1UOF
         u7oNQcEZ/3MqoXw+bLUN21q6SZBcnGlcwD0QqeZSMchDtnC6lYabGfSYfRb7QhcDE2QK
         f4JQ==
X-Gm-Message-State: AOAM533eN0ZCEZ6bIazNNqkQIQYiYofzhO+Zn6Qh3v/fjUSpteyLod8c
        LTXzq93fov5kaH5V1AfpbNE=
X-Google-Smtp-Source: ABdhPJwFSu5WrcdnRwqiqYucrE8xh4b0lZ3/Bfo23Ahi2uvE4rwGthHZ5exbna0vUJJv0Hivuej3Gw==
X-Received: by 2002:a17:907:20cc:: with SMTP id qq12mr14082021ejb.316.1607218037949;
        Sat, 05 Dec 2020 17:27:17 -0800 (PST)
Received: from localhost.localdomain ([188.24.159.61])
        by smtp.gmail.com with ESMTPSA id a10sm6157023ejk.92.2020.12.05.17.27.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 05 Dec 2020 17:27:17 -0800 (PST)
From:   Cristian Ciocaltea <cristian.ciocaltea@gmail.com>
To:     Lee Jones <lee.jones@linaro.org>, Rob Herring <robh+dt@kernel.org>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Sebastian Reichel <sre@kernel.org>,
        Mark Brown <broonie@kernel.org>,
        Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
        Liam Girdwood <lgirdwood@gmail.com>,
        =?UTF-8?q?Andreas=20F=C3=A4rber?= <afaerber@suse.de>
Cc:     linux-actions@lists.infradead.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-input@vger.kernel.org,
        linux-pm@vger.kernel.org
Subject: [PATCH v3 4/7] regulator: Add regulator driver for ATC260x PMICs
Date:   Sun,  6 Dec 2020 03:27:04 +0200
Message-Id: <f001986493a51fe591cb09a544770651bf589d35.1607216141.git.cristian.ciocaltea@gmail.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <cover.1607216141.git.cristian.ciocaltea@gmail.com>
References: <cover.1607216141.git.cristian.ciocaltea@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Add support for the DC-DC converters and LDO regulators found in
the ATC2603C and ATC2609A chip variants of the Actions Semi ATC260x
family of PMICs.

Co-developed-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Signed-off-by: Cristian Ciocaltea <cristian.ciocaltea@gmail.com>
---
Changes in v3:
 - Dropped 'last_dcdc_reg_id' from 'atc260x_regulator_data' and, instead,
   provided separate ops for DCDCs and LDOs, as recommended by Mark
 - Removed the unnecessary compatibles, per Mark's review
 - Added 'Co-developed-by' tag in commit message and dropped [cristian: ...] line

 drivers/regulator/Kconfig             |   8 +
 drivers/regulator/Makefile            |   1 +
 drivers/regulator/atc260x-regulator.c | 524 ++++++++++++++++++++++++++
 3 files changed, 533 insertions(+)
 create mode 100644 drivers/regulator/atc260x-regulator.c

diff --git a/drivers/regulator/Kconfig b/drivers/regulator/Kconfig
index 020a00d6696b..50505de6be70 100644
--- a/drivers/regulator/Kconfig
+++ b/drivers/regulator/Kconfig
@@ -170,6 +170,14 @@ config REGULATOR_AS3722
 	  AS3722 PMIC. This will enable support for all the software
 	  controllable DCDC/LDO regulators.
 
+config REGULATOR_ATC260X
+	tristate "Actions Semi ATC260x PMIC Regulators"
+	depends on MFD_ATC260X
+	help
+	  This driver provides support for the voltage regulators on the
+	  ATC260x PMICs. This will enable support for all the software
+	  controllable DCDC/LDO regulators.
+
 config REGULATOR_AXP20X
 	tristate "X-POWERS AXP20X PMIC Regulators"
 	depends on MFD_AXP20X
diff --git a/drivers/regulator/Makefile b/drivers/regulator/Makefile
index 6ebae516258e..673ff5895aae 100644
--- a/drivers/regulator/Makefile
+++ b/drivers/regulator/Makefile
@@ -26,6 +26,7 @@ obj-$(CONFIG_REGULATOR_ARIZONA_LDO1) += arizona-ldo1.o
 obj-$(CONFIG_REGULATOR_ARIZONA_MICSUPP) += arizona-micsupp.o
 obj-$(CONFIG_REGULATOR_AS3711) += as3711-regulator.o
 obj-$(CONFIG_REGULATOR_AS3722) += as3722-regulator.o
+obj-$(CONFIG_REGULATOR_ATC260X) += atc260x-regulator.o
 obj-$(CONFIG_REGULATOR_AXP20X) += axp20x-regulator.o
 obj-$(CONFIG_REGULATOR_BCM590XX) += bcm590xx-regulator.o
 obj-$(CONFIG_REGULATOR_BD70528) += bd70528-regulator.o
diff --git a/drivers/regulator/atc260x-regulator.c b/drivers/regulator/atc260x-regulator.c
new file mode 100644
index 000000000000..8bdfc8643886
--- /dev/null
+++ b/drivers/regulator/atc260x-regulator.c
@@ -0,0 +1,524 @@
+// SPDX-License-Identifier: GPL-2.0+
+//
+// Regulator driver for ATC260x PMICs
+//
+// Copyright (C) 2019 Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
+// Copyright (C) 2020 Cristian Ciocaltea <cristian.ciocaltea@gmail.com>
+
+#include <linux/mfd/atc260x/core.h>
+#include <linux/module.h>
+#include <linux/of_device.h>
+#include <linux/regmap.h>
+#include <linux/regulator/driver.h>
+
+struct atc260x_regulator_data {
+	int voltage_time_dcdc;
+	int voltage_time_ldo;
+};
+
+static const struct linear_range atc2603c_dcdc_voltage_ranges[] = {
+	REGULATOR_LINEAR_RANGE(1300000, 0, 13, 50000),
+	REGULATOR_LINEAR_RANGE(1950000, 14, 15, 100000),
+};
+
+static const struct linear_range atc2609a_dcdc_voltage_ranges[] = {
+	REGULATOR_LINEAR_RANGE(600000, 0, 127, 6250),
+	REGULATOR_LINEAR_RANGE(1400000, 128, 232, 25000),
+};
+
+static const struct linear_range atc2609a_ldo_voltage_ranges0[] = {
+	REGULATOR_LINEAR_RANGE(700000, 0, 15, 100000),
+	REGULATOR_LINEAR_RANGE(2100000, 16, 28, 100000),
+};
+
+static const struct linear_range atc2609a_ldo_voltage_ranges1[] = {
+	REGULATOR_LINEAR_RANGE(850000, 0, 15, 100000),
+	REGULATOR_LINEAR_RANGE(2100000, 16, 27, 100000),
+};
+
+static const unsigned int atc260x_ldo_voltage_range_sel[] = {
+	0x0, 0x1,
+};
+
+static int atc260x_dcdc_set_voltage_time_sel(struct regulator_dev *rdev,
+					     unsigned int old_selector,
+					     unsigned int new_selector)
+{
+	struct atc260x_regulator_data *data = rdev_get_drvdata(rdev);
+
+	if (new_selector > old_selector)
+		return data->voltage_time_dcdc;
+
+	return 0;
+}
+
+static int atc260x_ldo_set_voltage_time_sel(struct regulator_dev *rdev,
+					    unsigned int old_selector,
+					    unsigned int new_selector)
+{
+	struct atc260x_regulator_data *data = rdev_get_drvdata(rdev);
+
+	if (new_selector > old_selector)
+		return data->voltage_time_ldo;
+
+	return 0;
+}
+
+static const struct regulator_ops atc260x_dcdc_ops = {
+	.enable	= regulator_enable_regmap,
+	.disable = regulator_disable_regmap,
+	.is_enabled = regulator_is_enabled_regmap,
+	.list_voltage = regulator_list_voltage_linear,
+	.set_voltage_sel = regulator_set_voltage_sel_regmap,
+	.get_voltage_sel = regulator_get_voltage_sel_regmap,
+	.set_voltage_time_sel = atc260x_dcdc_set_voltage_time_sel,
+};
+
+static const struct regulator_ops atc260x_ldo_ops = {
+	.enable	= regulator_enable_regmap,
+	.disable = regulator_disable_regmap,
+	.is_enabled = regulator_is_enabled_regmap,
+	.list_voltage = regulator_list_voltage_linear,
+	.set_voltage_sel = regulator_set_voltage_sel_regmap,
+	.get_voltage_sel = regulator_get_voltage_sel_regmap,
+	.set_voltage_time_sel = atc260x_ldo_set_voltage_time_sel,
+};
+
+static const struct regulator_ops atc260x_ldo_bypass_ops = {
+	.enable	= regulator_enable_regmap,
+	.disable = regulator_disable_regmap,
+	.is_enabled = regulator_is_enabled_regmap,
+	.list_voltage = regulator_list_voltage_linear,
+	.set_voltage_sel = regulator_set_voltage_sel_regmap,
+	.get_voltage_sel = regulator_get_voltage_sel_regmap,
+	.set_voltage_time_sel = atc260x_ldo_set_voltage_time_sel,
+	.set_bypass = regulator_set_bypass_regmap,
+	.get_bypass = regulator_get_bypass_regmap,
+};
+
+static const struct regulator_ops atc260x_ldo_bypass_discharge_ops = {
+	.enable	= regulator_enable_regmap,
+	.disable = regulator_disable_regmap,
+	.is_enabled = regulator_is_enabled_regmap,
+	.list_voltage = regulator_list_voltage_linear,
+	.set_voltage_sel = regulator_set_voltage_sel_regmap,
+	.get_voltage_sel = regulator_get_voltage_sel_regmap,
+	.set_voltage_time_sel = atc260x_ldo_set_voltage_time_sel,
+	.set_bypass = regulator_set_bypass_regmap,
+	.get_bypass = regulator_get_bypass_regmap,
+	.set_active_discharge = regulator_set_active_discharge_regmap,
+};
+
+static const struct regulator_ops atc260x_dcdc_range_ops = {
+	.enable	= regulator_enable_regmap,
+	.disable = regulator_disable_regmap,
+	.is_enabled = regulator_is_enabled_regmap,
+	.list_voltage = regulator_list_voltage_linear_range,
+	.set_voltage_sel = regulator_set_voltage_sel_regmap,
+	.get_voltage_sel = regulator_get_voltage_sel_regmap,
+	.set_voltage_time_sel = atc260x_dcdc_set_voltage_time_sel,
+};
+
+static const struct regulator_ops atc260x_ldo_range_pick_ops = {
+	.enable	= regulator_enable_regmap,
+	.disable = regulator_disable_regmap,
+	.is_enabled = regulator_is_enabled_regmap,
+	.list_voltage = regulator_list_voltage_pickable_linear_range,
+	.set_voltage_sel = regulator_set_voltage_sel_pickable_regmap,
+	.get_voltage_sel = regulator_get_voltage_sel_pickable_regmap,
+	.set_voltage_time_sel = atc260x_ldo_set_voltage_time_sel,
+};
+
+static const struct regulator_ops atc260x_dcdc_fixed_ops = {
+	.list_voltage = regulator_list_voltage_linear,
+	.set_voltage_sel = regulator_set_voltage_sel_regmap,
+	.get_voltage_sel = regulator_get_voltage_sel_regmap,
+	.set_voltage_time_sel = atc260x_dcdc_set_voltage_time_sel,
+};
+
+static const struct regulator_ops atc260x_ldo_fixed_ops = {
+	.list_voltage = regulator_list_voltage_linear,
+	.set_voltage_sel = regulator_set_voltage_sel_regmap,
+	.get_voltage_sel = regulator_get_voltage_sel_regmap,
+	.set_voltage_time_sel = atc260x_ldo_set_voltage_time_sel,
+};
+
+/*
+ * ATC2603C notes:
+ * - LDO8 is not documented in datasheet (v2.4), but supported
+ *   in the vendor's driver implementation (xapp-le-kernel).
+ * - LDO12 mentioned in datasheet is not programmable, hence not
+ *   handled in this driver.
+ */
+enum atc2603c_reg_ids {
+	ATC2603C_ID_DCDC1,
+	ATC2603C_ID_DCDC2,
+	ATC2603C_ID_DCDC3,
+	ATC2603C_ID_LDO1,
+	ATC2603C_ID_LDO2,
+	ATC2603C_ID_LDO3,
+	ATC2603C_ID_LDO5,
+	ATC2603C_ID_LDO6,
+	ATC2603C_ID_LDO7,
+	ATC2603C_ID_LDO8,
+	ATC2603C_ID_LDO11,
+	ATC2603C_ID_SWITCHLDO1,
+	ATC2603C_ID_MAX,
+};
+
+#define atc2603c_reg_desc_dcdc(num, min, step, n_volt, vsel_h, vsel_l) { \
+	.name = "DCDC"#num, \
+	.supply_name = "dcdc"#num, \
+	.of_match = of_match_ptr("dcdc"#num), \
+	.regulators_node = of_match_ptr("regulators"), \
+	.id = ATC2603C_ID_DCDC##num, \
+	.ops = &atc260x_dcdc_ops, \
+	.type = REGULATOR_VOLTAGE, \
+	.min_uV = min, \
+	.uV_step = step, \
+	.n_voltages = n_volt, \
+	.vsel_reg = ATC2603C_PMU_DC##num##_CTL0, \
+	.vsel_mask = GENMASK(vsel_h, vsel_l), \
+	.enable_reg = ATC2603C_PMU_DC##num##_CTL0, \
+	.enable_mask = BIT(15), \
+	.enable_time = 800, \
+	.owner = THIS_MODULE, \
+}
+
+#define atc2603c_reg_desc_dcdc_range(num, vsel_h, vsel_l) { \
+	.name = "DCDC"#num, \
+	.supply_name = "dcdc"#num, \
+	.of_match = of_match_ptr("dcdc"#num), \
+	.regulators_node = of_match_ptr("regulators"), \
+	.id = ATC2603C_ID_DCDC##num, \
+	.ops = &atc260x_dcdc_range_ops, \
+	.type = REGULATOR_VOLTAGE, \
+	.n_voltages = 16, \
+	.linear_ranges = atc2603c_dcdc_voltage_ranges, \
+	.n_linear_ranges = ARRAY_SIZE(atc2603c_dcdc_voltage_ranges), \
+	.vsel_reg = ATC2603C_PMU_DC##num##_CTL0, \
+	.vsel_mask = GENMASK(vsel_h, vsel_l), \
+	.enable_reg = ATC2603C_PMU_DC##num##_CTL0, \
+	.enable_mask = BIT(15), \
+	.enable_time = 800, \
+	.owner = THIS_MODULE, \
+}
+
+#define atc2603c_reg_desc_dcdc_fixed(num, min, step, n_volt, vsel_h, vsel_l) { \
+	.name = "DCDC"#num, \
+	.supply_name = "dcdc"#num, \
+	.of_match = of_match_ptr("dcdc"#num), \
+	.regulators_node = of_match_ptr("regulators"), \
+	.id = ATC2603C_ID_DCDC##num, \
+	.ops = &atc260x_dcdc_fixed_ops, \
+	.type = REGULATOR_VOLTAGE, \
+	.min_uV = min, \
+	.uV_step = step, \
+	.n_voltages = n_volt, \
+	.vsel_reg = ATC2603C_PMU_DC##num##_CTL0, \
+	.vsel_mask = GENMASK(vsel_h, vsel_l), \
+	.enable_time = 800, \
+	.owner = THIS_MODULE, \
+}
+
+#define atc2603c_reg_desc_ldo(num, min, step, n_volt, vsel_h, vsel_l) { \
+	.name = "LDO"#num, \
+	.supply_name = "ldo"#num, \
+	.of_match = of_match_ptr("ldo"#num), \
+	.regulators_node = of_match_ptr("regulators"), \
+	.id = ATC2603C_ID_LDO##num, \
+	.ops = &atc260x_ldo_ops, \
+	.type = REGULATOR_VOLTAGE, \
+	.min_uV = min, \
+	.uV_step = step, \
+	.n_voltages = n_volt, \
+	.vsel_reg = ATC2603C_PMU_LDO##num##_CTL, \
+	.vsel_mask = GENMASK(vsel_h, vsel_l), \
+	.enable_reg = ATC2603C_PMU_LDO##num##_CTL, \
+	.enable_mask = BIT(0), \
+	.enable_time = 2000, \
+	.owner = THIS_MODULE, \
+}
+
+#define atc2603c_reg_desc_ldo_fixed(num, min, step, n_volt, vsel_h, vsel_l) { \
+	.name = "LDO"#num, \
+	.supply_name = "ldo"#num, \
+	.of_match = of_match_ptr("ldo"#num), \
+	.regulators_node = of_match_ptr("regulators"), \
+	.id = ATC2603C_ID_LDO##num, \
+	.ops = &atc260x_ldo_fixed_ops, \
+	.type = REGULATOR_VOLTAGE, \
+	.min_uV = min, \
+	.uV_step = step, \
+	.n_voltages = n_volt, \
+	.vsel_reg = ATC2603C_PMU_LDO##num##_CTL, \
+	.vsel_mask = GENMASK(vsel_h, vsel_l), \
+	.enable_time = 2000, \
+	.owner = THIS_MODULE, \
+}
+
+#define atc2603c_reg_desc_ldo_switch(num, min, step, n_volt, vsel_h, vsel_l) { \
+	.name = "SWITCHLDO"#num, \
+	.supply_name = "switchldo"#num, \
+	.of_match = of_match_ptr("switchldo"#num), \
+	.regulators_node = of_match_ptr("regulators"), \
+	.id = ATC2603C_ID_SWITCHLDO##num, \
+	.ops = &atc260x_ldo_bypass_discharge_ops, \
+	.type = REGULATOR_VOLTAGE, \
+	.min_uV = min, \
+	.uV_step = step, \
+	.n_voltages = n_volt, \
+	.vsel_reg = ATC2603C_PMU_SWITCH_CTL, \
+	.vsel_mask = GENMASK(vsel_h, vsel_l), \
+	.enable_reg = ATC2603C_PMU_SWITCH_CTL, \
+	.enable_mask = BIT(15), \
+	.enable_is_inverted = true, \
+	.enable_time = 2000, \
+	.bypass_reg = ATC2603C_PMU_SWITCH_CTL, \
+	.bypass_mask = BIT(5), \
+	.active_discharge_reg = ATC2603C_PMU_SWITCH_CTL, \
+	.active_discharge_mask = BIT(1), \
+	.owner = THIS_MODULE, \
+}
+
+static const struct regulator_desc atc2603c_reg[] = {
+	atc2603c_reg_desc_dcdc_fixed(1, 700000, 25000, 29, 11, 7),
+	atc2603c_reg_desc_dcdc_range(2, 12, 8),
+	atc2603c_reg_desc_dcdc_fixed(3, 2600000, 100000, 8, 11, 9),
+	atc2603c_reg_desc_ldo_fixed(1, 2600000, 100000, 8, 15, 13),
+	atc2603c_reg_desc_ldo_fixed(2, 2600000, 100000, 8, 15, 13),
+	atc2603c_reg_desc_ldo_fixed(3, 1500000, 100000, 6, 15, 13),
+	atc2603c_reg_desc_ldo(5, 2600000, 100000, 8, 15, 13),
+	atc2603c_reg_desc_ldo_fixed(6, 700000, 25000, 29, 15, 11),
+	atc2603c_reg_desc_ldo(7, 1500000, 100000, 6, 15, 13),
+	atc2603c_reg_desc_ldo(8, 2300000, 100000, 11, 15, 12),
+	atc2603c_reg_desc_ldo_fixed(11, 2600000, 100000, 8, 15, 13),
+	atc2603c_reg_desc_ldo_switch(1, 3000000, 100000, 4, 4, 3),
+};
+
+static const struct regulator_desc atc2603c_reg_dcdc2_ver_b =
+	atc2603c_reg_desc_dcdc(2, 1000000, 50000, 18, 12, 8);
+
+enum atc2609a_reg_ids {
+	ATC2609A_ID_DCDC0,
+	ATC2609A_ID_DCDC1,
+	ATC2609A_ID_DCDC2,
+	ATC2609A_ID_DCDC3,
+	ATC2609A_ID_DCDC4,
+	ATC2609A_ID_LDO0,
+	ATC2609A_ID_LDO1,
+	ATC2609A_ID_LDO2,
+	ATC2609A_ID_LDO3,
+	ATC2609A_ID_LDO4,
+	ATC2609A_ID_LDO5,
+	ATC2609A_ID_LDO6,
+	ATC2609A_ID_LDO7,
+	ATC2609A_ID_LDO8,
+	ATC2609A_ID_LDO9,
+	ATC2609A_ID_MAX,
+};
+
+#define atc2609a_reg_desc_dcdc(num, en_bit) { \
+	.name = "DCDC"#num, \
+	.supply_name = "dcdc"#num, \
+	.of_match = of_match_ptr("dcdc"#num), \
+	.regulators_node = of_match_ptr("regulators"), \
+	.id = ATC2609A_ID_DCDC##num, \
+	.ops = &atc260x_dcdc_ops, \
+	.type = REGULATOR_VOLTAGE, \
+	.min_uV = 600000, \
+	.uV_step = 6250, \
+	.n_voltages = 256, \
+	.vsel_reg = ATC2609A_PMU_DC##num##_CTL0, \
+	.vsel_mask = GENMASK(15, 8), \
+	.enable_reg = ATC2609A_PMU_DC_OSC, \
+	.enable_mask = BIT(en_bit), \
+	.enable_time = 800, \
+	.owner = THIS_MODULE, \
+}
+
+#define atc2609a_reg_desc_dcdc_range(num, en_bit) { \
+	.name = "DCDC"#num, \
+	.supply_name = "dcdc"#num, \
+	.of_match = of_match_ptr("dcdc"#num), \
+	.regulators_node = of_match_ptr("regulators"), \
+	.id = ATC2609A_ID_DCDC##num, \
+	.ops = &atc260x_dcdc_range_ops, \
+	.type = REGULATOR_VOLTAGE, \
+	.n_voltages = 233, \
+	.linear_ranges = atc2609a_dcdc_voltage_ranges, \
+	.n_linear_ranges = ARRAY_SIZE(atc2609a_dcdc_voltage_ranges), \
+	.vsel_reg = ATC2609A_PMU_DC##num##_CTL0, \
+	.vsel_mask = GENMASK(15, 8), \
+	.enable_reg = ATC2609A_PMU_DC_OSC, \
+	.enable_mask = BIT(en_bit), \
+	.enable_time = 800, \
+	.owner = THIS_MODULE, \
+}
+
+#define atc2609a_reg_desc_ldo(num) { \
+	.name = "LDO"#num, \
+	.supply_name = "ldo"#num, \
+	.of_match = of_match_ptr("ldo"#num), \
+	.regulators_node = of_match_ptr("regulators"), \
+	.id = ATC2609A_ID_LDO##num, \
+	.ops = &atc260x_ldo_ops, \
+	.type = REGULATOR_VOLTAGE, \
+	.min_uV = 700000, \
+	.uV_step = 100000, \
+	.n_voltages = 16, \
+	.vsel_reg = ATC2609A_PMU_LDO##num##_CTL0, \
+	.vsel_mask = GENMASK(4, 1), \
+	.enable_reg = ATC2609A_PMU_LDO##num##_CTL0, \
+	.enable_mask = BIT(0), \
+	.enable_time = 2000, \
+	.owner = THIS_MODULE, \
+}
+
+#define atc2609a_reg_desc_ldo_bypass(num) { \
+	.name = "LDO"#num, \
+	.supply_name = "ldo"#num, \
+	.of_match = of_match_ptr("ldo"#num), \
+	.regulators_node = of_match_ptr("regulators"), \
+	.id = ATC2609A_ID_LDO##num, \
+	.ops = &atc260x_ldo_bypass_ops, \
+	.type = REGULATOR_VOLTAGE, \
+	.min_uV = 2300000, \
+	.uV_step = 100000, \
+	.n_voltages = 12, \
+	.vsel_reg = ATC2609A_PMU_LDO##num##_CTL0, \
+	.vsel_mask = GENMASK(5, 2), \
+	.enable_reg = ATC2609A_PMU_LDO##num##_CTL0, \
+	.enable_mask = BIT(0), \
+	.enable_time = 2000, \
+	.bypass_reg = ATC2609A_PMU_LDO##num##_CTL0, \
+	.bypass_mask = BIT(1), \
+	.owner = THIS_MODULE, \
+}
+
+#define atc2609a_reg_desc_ldo_range_pick(num, n_range) { \
+	.name = "LDO"#num, \
+	.supply_name = "ldo"#num, \
+	.of_match = of_match_ptr("ldo"#num), \
+	.regulators_node = of_match_ptr("regulators"), \
+	.id = ATC2609A_ID_LDO##num, \
+	.ops = &atc260x_ldo_range_pick_ops, \
+	.type = REGULATOR_VOLTAGE, \
+	.linear_ranges = atc2609a_ldo_voltage_ranges##n_range, \
+	.n_linear_ranges = ARRAY_SIZE(atc2609a_ldo_voltage_ranges##n_range), \
+	.vsel_reg = ATC2609A_PMU_LDO##num##_CTL0, \
+	.vsel_mask = GENMASK(4, 1), \
+	.vsel_range_reg = ATC2609A_PMU_LDO##num##_CTL0, \
+	.vsel_range_mask = BIT(5), \
+	.linear_range_selectors = atc260x_ldo_voltage_range_sel, \
+	.enable_reg = ATC2609A_PMU_LDO##num##_CTL0, \
+	.enable_mask = BIT(0), \
+	.enable_time = 2000, \
+	.owner = THIS_MODULE, \
+}
+
+#define atc2609a_reg_desc_ldo_fixed(num) { \
+	.name = "LDO"#num, \
+	.supply_name = "ldo"#num, \
+	.of_match = of_match_ptr("ldo"#num), \
+	.regulators_node = of_match_ptr("regulators"), \
+	.id = ATC2609A_ID_LDO##num, \
+	.ops = &atc260x_ldo_fixed_ops, \
+	.type = REGULATOR_VOLTAGE, \
+	.min_uV = 2600000, \
+	.uV_step = 100000, \
+	.n_voltages = 8, \
+	.vsel_reg = ATC2609A_PMU_LDO##num##_CTL, \
+	.vsel_mask = GENMASK(15, 13), \
+	.enable_time = 2000, \
+	.owner = THIS_MODULE, \
+}
+
+static const struct regulator_desc atc2609a_reg[] = {
+	atc2609a_reg_desc_dcdc(0, 4),
+	atc2609a_reg_desc_dcdc(1, 5),
+	atc2609a_reg_desc_dcdc(2, 6),
+	atc2609a_reg_desc_dcdc_range(3, 7),
+	atc2609a_reg_desc_dcdc(4, 8),
+	atc2609a_reg_desc_ldo_bypass(0),
+	atc2609a_reg_desc_ldo_bypass(1),
+	atc2609a_reg_desc_ldo_bypass(2),
+	atc2609a_reg_desc_ldo_range_pick(3, 0),
+	atc2609a_reg_desc_ldo_range_pick(4, 0),
+	atc2609a_reg_desc_ldo(5),
+	atc2609a_reg_desc_ldo_range_pick(6, 1),
+	atc2609a_reg_desc_ldo_range_pick(7, 0),
+	atc2609a_reg_desc_ldo_range_pick(8, 0),
+	atc2609a_reg_desc_ldo_fixed(9),
+};
+
+static int atc260x_regulator_probe(struct platform_device *pdev)
+{
+	struct atc260x *atc260x = dev_get_drvdata(pdev->dev.parent);
+	struct device *dev = atc260x->dev;
+	struct atc260x_regulator_data *atc260x_data;
+	struct regulator_config config = {};
+	struct regulator_dev *atc260x_rdev;
+	const struct regulator_desc *regulators;
+	bool atc2603c_ver_b = false;
+	int i, nregulators;
+
+	atc260x_data = devm_kzalloc(&pdev->dev, sizeof(*atc260x_data), GFP_KERNEL);
+	if (!atc260x_data)
+		return -ENOMEM;
+
+	atc260x_data->voltage_time_dcdc = 350;
+	atc260x_data->voltage_time_ldo = 800;
+
+	switch (atc260x->ic_type) {
+	case ATC2603C:
+		regulators = atc2603c_reg;
+		nregulators = ATC2603C_ID_MAX;
+		atc2603c_ver_b = atc260x->ic_ver == ATC260X_B;
+		break;
+	case ATC2609A:
+		atc260x_data->voltage_time_dcdc = 250;
+		regulators = atc2609a_reg;
+		nregulators = ATC2609A_ID_MAX;
+		break;
+	default:
+		dev_err(dev, "unsupported ATC260X ID %d\n", atc260x->ic_type);
+		return -EINVAL;
+	}
+
+	config.dev = dev;
+	config.regmap = atc260x->regmap;
+	config.driver_data = atc260x_data;
+
+	/* Instantiate the regulators */
+	for (i = 0; i < nregulators; i++) {
+		if (atc2603c_ver_b && regulators[i].id == ATC2603C_ID_DCDC2)
+			atc260x_rdev = devm_regulator_register(&pdev->dev,
+							       &atc2603c_reg_dcdc2_ver_b,
+							       &config);
+		else
+			atc260x_rdev = devm_regulator_register(&pdev->dev,
+							       &regulators[i],
+							       &config);
+		if (IS_ERR(atc260x_rdev)) {
+			dev_err(dev, "failed to register regulator: %d\n", i);
+			return PTR_ERR(atc260x_rdev);
+		}
+	}
+
+	return 0;
+}
+
+static struct platform_driver atc260x_regulator_driver = {
+	.probe = atc260x_regulator_probe,
+	.driver = {
+		.name = "atc260x-regulator",
+	},
+};
+
+module_platform_driver(atc260x_regulator_driver);
+
+MODULE_DESCRIPTION("Regulator driver for ATC260x PMICs");
+MODULE_AUTHOR("Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>");
+MODULE_AUTHOR("Cristian Ciocaltea <cristian.ciocaltea@gmail.com>");
+MODULE_LICENSE("GPL");
-- 
2.29.2

