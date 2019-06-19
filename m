Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A78754BB40
	for <lists+linux-input@lfdr.de>; Wed, 19 Jun 2019 16:20:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730802AbfFSOUq (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 19 Jun 2019 10:20:46 -0400
Received: from mail-wr1-f67.google.com ([209.85.221.67]:45564 "EHLO
        mail-wr1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730764AbfFSOU0 (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Wed, 19 Jun 2019 10:20:26 -0400
Received: by mail-wr1-f67.google.com with SMTP id f9so3561509wre.12
        for <linux-input@vger.kernel.org>; Wed, 19 Jun 2019 07:20:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=N9NjwXomNBSaAXYBIwC3Ue7C0ZOh21V2w/tjCb4T0w8=;
        b=Sf+INa1BInGhF/g4HtyXtXgnz59hLc97TrdXHCMlCqZ3OLnx+tFRVoXzV7o70ke7j0
         vvRRaI7qe/NT+rvlejZq1nkGngPAnH9FYFQDCdl8HlhT/WJyEPpBFJlri4CcZJNJtbj+
         gj/OPvh2dRLsLnwhlRg2fwP8wmATOUoJkAwasYft5btMuGHH8ASKoUGnFHkNlPfsaseL
         zDZFlc9ZvV1aosU5rIV2HcSEipXlt6muYKUQbwWS+JD9pRpn3uTvbXu9GfNpQDbgqdzU
         Y4tyQNAq+yy0xdH7XuoE55uBWolsOCGHI2Q5Obqr56NVfxPs++/IVnlh4ex1vZM+KCZW
         KStw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=N9NjwXomNBSaAXYBIwC3Ue7C0ZOh21V2w/tjCb4T0w8=;
        b=EojJV1PyfvQB4FrPJN5K0ueBewk4NNO02OnBclN7BX5hVZIZ7XhsAicuFa8ECRhvjT
         qrEKkAGJXxMy2BBKSKQ9g/jVuramLt7cxEu/V8ZjprX4COkriwClKcke2rVSR9PVSyOA
         1sXh05wXSN9f4KqpaagG9ByU1OjwP7C8iaMcjqUpbjeLNrieSlHTkMoUjlr94T6Wa3M8
         T1G6r5nuBHyyGZ2Gy/NfdvWYj+Vk1zjDSn6Cbm2KjZ3CeJcVRzbl/xd49dnaigtD7kcC
         k6rJN3OjY9Hn5CMg4+s3bFhjejrqu/l9uaTQVMLOozG06TkgvqWOrzq3JcSe3k6OOPoj
         SNuw==
X-Gm-Message-State: APjAAAUreBddMJkPIMMhdF6oEDadKH52D0DLPglja60Uwi7MnCP8oQYK
        5aTxpSyS+q8tWIl9Sad9hfPU9w==
X-Google-Smtp-Source: APXvYqyHKJvo1NXaiGgKmDqlA7/IhXuDePkmWN9mAFRVYfCqGOTVB4gApCkbX1H6ywUcB0ElaIZ9ew==
X-Received: by 2002:adf:eb89:: with SMTP id t9mr30000786wrn.120.1560954023476;
        Wed, 19 Jun 2019 07:20:23 -0700 (PDT)
Received: from localhost.localdomain (amontpellier-652-1-281-69.w109-210.abo.wanadoo.fr. [109.210.96.69])
        by smtp.gmail.com with ESMTPSA id o20sm24209979wrh.8.2019.06.19.07.20.22
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Wed, 19 Jun 2019 07:20:23 -0700 (PDT)
From:   Fabien Parent <fparent@baylibre.com>
To:     robh+dt@kernel.org, mark.rutland@arm.com, matthias.bgg@gmail.com,
        lee.jones@linaro.org, lgirdwood@gmail.com, broonie@kernel.org
Cc:     dmitry.torokhov@gmail.com, linux-input@vger.kernel.org,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org,
        Fabien Parent <fparent@baylibre.com>
Subject: [PATCH v4 5/7] regulator: mt6392: Add support for MT6392 regulator
Date:   Wed, 19 Jun 2019 16:20:11 +0200
Message-Id: <20190619142013.20913-6-fparent@baylibre.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190619142013.20913-1-fparent@baylibre.com>
References: <20190619142013.20913-1-fparent@baylibre.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

The MT6392 is a regulator found on boards based on the MediaTek
MT8167, MT8516, and probably other SoCs. It is a so called PMIC and
connectcts as a slave to a SoC using SPI, wrapped inside PWRAP.

Signed-off-by: Fabien Parent <fparent@baylibre.com>
---

V4:
	* No change

V3:
	* fix regulator's of_match following the renaming of the of nodes.

V2:
	* no changes

---
 drivers/regulator/Kconfig                  |   9 +
 drivers/regulator/Makefile                 |   1 +
 drivers/regulator/mt6392-regulator.c       | 490 +++++++++++++++++++++
 include/linux/regulator/mt6392-regulator.h |  40 ++
 4 files changed, 540 insertions(+)
 create mode 100644 drivers/regulator/mt6392-regulator.c
 create mode 100644 include/linux/regulator/mt6392-regulator.h

diff --git a/drivers/regulator/Kconfig b/drivers/regulator/Kconfig
index 8553bdf87c1d..6f6865b95c36 100644
--- a/drivers/regulator/Kconfig
+++ b/drivers/regulator/Kconfig
@@ -626,6 +626,15 @@ config REGULATOR_MT6380
 	  This driver supports the control of different power rails of device
 	  through regulator interface.
 
+config REGULATOR_MT6392
+	tristate "MediaTek MT6392 PMIC"
+	depends on MFD_MT6397
+	help
+	  Say y here to select this option to enable the power regulator of
+	  MediaTek MT6392 PMIC.
+	  This driver supports the control of different power rails of device
+	  through regulator interface.
+
 config REGULATOR_MT6397
 	tristate "MediaTek MT6397 PMIC"
 	depends on MFD_MT6397
diff --git a/drivers/regulator/Makefile b/drivers/regulator/Makefile
index 93f53840e8f1..fc67a215479d 100644
--- a/drivers/regulator/Makefile
+++ b/drivers/regulator/Makefile
@@ -80,6 +80,7 @@ obj-$(CONFIG_REGULATOR_MCP16502) += mcp16502.o
 obj-$(CONFIG_REGULATOR_MT6311) += mt6311-regulator.o
 obj-$(CONFIG_REGULATOR_MT6323)	+= mt6323-regulator.o
 obj-$(CONFIG_REGULATOR_MT6380)	+= mt6380-regulator.o
+obj-$(CONFIG_REGULATOR_MT6392)	+= mt6392-regulator.o
 obj-$(CONFIG_REGULATOR_MT6397)	+= mt6397-regulator.o
 obj-$(CONFIG_REGULATOR_QCOM_RPM) += qcom_rpm-regulator.o
 obj-$(CONFIG_REGULATOR_QCOM_RPMH) += qcom-rpmh-regulator.o
diff --git a/drivers/regulator/mt6392-regulator.c b/drivers/regulator/mt6392-regulator.c
new file mode 100644
index 000000000000..2b7dcf3c72e8
--- /dev/null
+++ b/drivers/regulator/mt6392-regulator.c
@@ -0,0 +1,490 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Copyright (c) 2019 MediaTek Inc.
+ * Author: Chen Zhong <chen.zhong@mediatek.com>
+ */
+
+#include <linux/module.h>
+#include <linux/of.h>
+#include <linux/platform_device.h>
+#include <linux/regmap.h>
+#include <linux/mfd/mt6397/core.h>
+#include <linux/mfd/mt6392/registers.h>
+#include <linux/regulator/driver.h>
+#include <linux/regulator/machine.h>
+#include <linux/regulator/mt6392-regulator.h>
+#include <linux/regulator/of_regulator.h>
+
+#define MT6392_BUCK_MODE_AUTO	0
+#define MT6392_BUCK_MODE_FORCE_PWM	1
+#define MT6392_LDO_MODE_NORMAL	0
+#define MT6392_LDO_MODE_LP	1
+
+/*
+ * MT6392 regulators' information
+ *
+ * @desc: standard fields of regulator description.
+ * @qi: Mask for query enable signal status of regulators
+ * @vselon_reg: Register sections for hardware control mode of bucks
+ * @vselctrl_reg: Register for controlling the buck control mode.
+ * @vselctrl_mask: Mask for query buck's voltage control mode.
+ */
+struct mt6392_regulator_info {
+	struct regulator_desc desc;
+	u32 qi;
+	u32 vselon_reg;
+	u32 vselctrl_reg;
+	u32 vselctrl_mask;
+	u32 modeset_reg;
+	u32 modeset_mask;
+};
+
+#define MT6392_BUCK(match, vreg, min, max, step, volt_ranges, enreg,	\
+		vosel, vosel_mask, voselon, vosel_ctrl,			\
+		_modeset_reg, _modeset_mask)				\
+[MT6392_ID_##vreg] = {							\
+	.desc = {							\
+		.name = #vreg,						\
+		.of_match = of_match_ptr(match),			\
+		.ops = &mt6392_volt_range_ops,				\
+		.type = REGULATOR_VOLTAGE,				\
+		.id = MT6392_ID_##vreg,					\
+		.owner = THIS_MODULE,					\
+		.n_voltages = (max - min)/step + 1,			\
+		.linear_ranges = volt_ranges,				\
+		.n_linear_ranges = ARRAY_SIZE(volt_ranges),		\
+		.vsel_reg = vosel,					\
+		.vsel_mask = vosel_mask,				\
+		.enable_reg = enreg,					\
+		.enable_mask = BIT(0),					\
+	},								\
+	.qi = BIT(13),							\
+	.vselon_reg = voselon,						\
+	.vselctrl_reg = vosel_ctrl,					\
+	.vselctrl_mask = BIT(1),					\
+	.modeset_reg = _modeset_reg,					\
+	.modeset_mask = _modeset_mask,					\
+}
+
+#define MT6392_LDO(match, vreg, ldo_volt_table, enreg, enbit, vosel,	\
+		vosel_mask, _modeset_reg, _modeset_mask)		\
+[MT6392_ID_##vreg] = {							\
+	.desc = {							\
+		.name = #vreg,						\
+		.of_match = of_match_ptr(match),			\
+		.ops = &mt6392_volt_table_ops,				\
+		.type = REGULATOR_VOLTAGE,				\
+		.id = MT6392_ID_##vreg,					\
+		.owner = THIS_MODULE,					\
+		.n_voltages = ARRAY_SIZE(ldo_volt_table),		\
+		.volt_table = ldo_volt_table,				\
+		.vsel_reg = vosel,					\
+		.vsel_mask = vosel_mask,				\
+		.enable_reg = enreg,					\
+		.enable_mask = BIT(enbit),				\
+	},								\
+	.qi = BIT(15),							\
+	.modeset_reg = _modeset_reg,					\
+	.modeset_mask = _modeset_mask,					\
+}
+
+#define MT6392_REG_FIXED(match, vreg, enreg, enbit, volt,		\
+		_modeset_reg, _modeset_mask)				\
+[MT6392_ID_##vreg] = {							\
+	.desc = {							\
+		.name = #vreg,						\
+		.of_match = of_match_ptr(match),			\
+		.ops = &mt6392_volt_fixed_ops,				\
+		.type = REGULATOR_VOLTAGE,				\
+		.id = MT6392_ID_##vreg,					\
+		.owner = THIS_MODULE,					\
+		.n_voltages = 1,					\
+		.enable_reg = enreg,					\
+		.enable_mask = BIT(enbit),				\
+		.min_uV = volt,						\
+	},								\
+	.qi = BIT(15),							\
+	.modeset_reg = _modeset_reg,					\
+	.modeset_mask = _modeset_mask,					\
+}
+
+static const struct regulator_linear_range buck_volt_range1[] = {
+	REGULATOR_LINEAR_RANGE(700000, 0, 0x7f, 6250),
+};
+
+static const struct regulator_linear_range buck_volt_range2[] = {
+	REGULATOR_LINEAR_RANGE(1400000, 0, 0x7f, 12500),
+};
+
+static const u32 ldo_volt_table1[] = {
+	1800000, 1900000, 2000000, 2200000,
+};
+
+static const u32 ldo_volt_table2[] = {
+	3300000, 3400000, 3500000, 3600000,
+};
+
+static const u32 ldo_volt_table3[] = {
+	1800000, 3300000,
+};
+
+static const u32 ldo_volt_table4[] = {
+	3000000, 3300000,
+};
+
+static const u32 ldo_volt_table5[] = {
+	1200000, 1300000, 1500000, 1800000, 2000000, 2800000, 3000000, 3300000,
+};
+
+static const u32 ldo_volt_table6[] = {
+	1240000, 1390000,
+};
+
+static const u32 ldo_volt_table7[] = {
+	1200000, 1300000, 1500000, 1800000,
+};
+
+static const u32 ldo_volt_table8[] = {
+	1800000, 2000000,
+};
+
+static int mt6392_get_status(struct regulator_dev *rdev)
+{
+	int ret;
+	u32 regval;
+	struct mt6392_regulator_info *info = rdev_get_drvdata(rdev);
+
+	ret = regmap_read(rdev->regmap, info->desc.enable_reg, &regval);
+	if (ret != 0) {
+		dev_err(&rdev->dev, "Failed to get enable reg: %d\n", ret);
+		return ret;
+	}
+
+	return (regval & info->qi) ? REGULATOR_STATUS_ON : REGULATOR_STATUS_OFF;
+}
+
+static int mt6392_buck_set_mode(struct regulator_dev *rdev, unsigned int mode)
+{
+	int ret, val = 0;
+	struct mt6392_regulator_info *info = rdev_get_drvdata(rdev);
+	u32 reg_value;
+
+	if (!info->modeset_mask) {
+		dev_err(&rdev->dev, "regulator %s doesn't support set_mode\n",
+			info->desc.name);
+		return -EINVAL;
+	}
+
+	switch (mode) {
+	case REGULATOR_MODE_FAST:
+		val = MT6392_BUCK_MODE_FORCE_PWM;
+		break;
+	case REGULATOR_MODE_NORMAL:
+		val = MT6392_BUCK_MODE_AUTO;
+		break;
+	default:
+		return -EINVAL;
+	}
+
+	val <<= ffs(info->modeset_mask) - 1;
+
+	ret = regmap_update_bits(rdev->regmap, info->modeset_reg,
+				  info->modeset_mask, val);
+
+	if (regmap_read(rdev->regmap, info->modeset_reg, &reg_value) < 0) {
+		dev_err(&rdev->dev, "Failed to read register value\n");
+		return -EIO;
+	}
+
+	return ret;
+}
+
+static unsigned int mt6392_buck_get_mode(struct regulator_dev *rdev)
+{
+	unsigned int val;
+	unsigned int mode;
+	int ret;
+	struct mt6392_regulator_info *info = rdev_get_drvdata(rdev);
+
+	if (!info->modeset_mask) {
+		dev_err(&rdev->dev, "regulator %s doesn't support get_mode\n",
+			info->desc.name);
+		return -EINVAL;
+	}
+
+	ret = regmap_read(rdev->regmap, info->modeset_reg, &val);
+	if (ret < 0)
+		return ret;
+
+	val &= info->modeset_mask;
+	val >>= ffs(info->modeset_mask) - 1;
+
+	if (val & 0x1)
+		mode = REGULATOR_MODE_FAST;
+	else
+		mode = REGULATOR_MODE_NORMAL;
+
+	return mode;
+}
+
+static int mt6392_ldo_set_mode(struct regulator_dev *rdev, unsigned int mode)
+{
+	int ret, val = 0;
+	struct mt6392_regulator_info *info = rdev_get_drvdata(rdev);
+
+	if (!info->modeset_mask) {
+		dev_err(&rdev->dev, "regulator %s doesn't support set_mode\n",
+			info->desc.name);
+		return -EINVAL;
+	}
+
+	switch (mode) {
+	case REGULATOR_MODE_STANDBY:
+		val = MT6392_LDO_MODE_LP;
+		break;
+	case REGULATOR_MODE_NORMAL:
+		val = MT6392_LDO_MODE_NORMAL;
+		break;
+	default:
+		return -EINVAL;
+	}
+
+	val <<= ffs(info->modeset_mask) - 1;
+
+	ret = regmap_update_bits(rdev->regmap, info->modeset_reg,
+				  info->modeset_mask, val);
+
+	return ret;
+}
+
+static unsigned int mt6392_ldo_get_mode(struct regulator_dev *rdev)
+{
+	unsigned int val;
+	unsigned int mode;
+	int ret;
+	struct mt6392_regulator_info *info = rdev_get_drvdata(rdev);
+
+	if (!info->modeset_mask) {
+		dev_err(&rdev->dev, "regulator %s doesn't support get_mode\n",
+			info->desc.name);
+		return -EINVAL;
+	}
+
+	ret = regmap_read(rdev->regmap, info->modeset_reg, &val);
+	if (ret < 0)
+		return ret;
+
+	val &= info->modeset_mask;
+	val >>= ffs(info->modeset_mask) - 1;
+
+	if (val & 0x1)
+		mode = REGULATOR_MODE_STANDBY;
+	else
+		mode = REGULATOR_MODE_NORMAL;
+
+	return mode;
+}
+
+static const struct regulator_ops mt6392_volt_range_ops = {
+	.list_voltage = regulator_list_voltage_linear_range,
+	.map_voltage = regulator_map_voltage_linear_range,
+	.set_voltage_sel = regulator_set_voltage_sel_regmap,
+	.get_voltage_sel = regulator_get_voltage_sel_regmap,
+	.set_voltage_time_sel = regulator_set_voltage_time_sel,
+	.enable = regulator_enable_regmap,
+	.disable = regulator_disable_regmap,
+	.is_enabled = regulator_is_enabled_regmap,
+	.get_status = mt6392_get_status,
+	.set_mode = mt6392_buck_set_mode,
+	.get_mode = mt6392_buck_get_mode,
+};
+
+static const struct regulator_ops mt6392_volt_table_ops = {
+	.list_voltage = regulator_list_voltage_table,
+	.map_voltage = regulator_map_voltage_iterate,
+	.set_voltage_sel = regulator_set_voltage_sel_regmap,
+	.get_voltage_sel = regulator_get_voltage_sel_regmap,
+	.set_voltage_time_sel = regulator_set_voltage_time_sel,
+	.enable = regulator_enable_regmap,
+	.disable = regulator_disable_regmap,
+	.is_enabled = regulator_is_enabled_regmap,
+	.get_status = mt6392_get_status,
+	.set_mode = mt6392_ldo_set_mode,
+	.get_mode = mt6392_ldo_get_mode,
+};
+
+static const struct regulator_ops mt6392_volt_fixed_ops = {
+	.list_voltage = regulator_list_voltage_linear,
+	.enable = regulator_enable_regmap,
+	.disable = regulator_disable_regmap,
+	.is_enabled = regulator_is_enabled_regmap,
+	.get_status = mt6392_get_status,
+	.set_mode = mt6392_ldo_set_mode,
+	.get_mode = mt6392_ldo_get_mode,
+};
+
+/* The array is indexed by id(MT6392_ID_XXX) */
+static struct mt6392_regulator_info mt6392_regulators[] = {
+	MT6392_BUCK("buck-vproc", VPROC, 700000, 1493750, 6250,
+		buck_volt_range1, MT6392_VPROC_CON7, MT6392_VPROC_CON9, 0x7f,
+		MT6392_VPROC_CON10, MT6392_VPROC_CON5, MT6392_VPROC_CON2,
+		0x100),
+	MT6392_BUCK("buck-vsys", VSYS, 1400000, 2987500, 12500,
+		buck_volt_range2, MT6392_VSYS_CON7, MT6392_VSYS_CON9, 0x7f,
+		MT6392_VSYS_CON10, MT6392_VSYS_CON5, MT6392_VSYS_CON2, 0x100),
+	MT6392_BUCK("buck-vcore", VCORE, 700000, 1493750, 6250,
+		buck_volt_range1, MT6392_VCORE_CON7, MT6392_VCORE_CON9, 0x7f,
+		MT6392_VCORE_CON10, MT6392_VCORE_CON5, MT6392_VCORE_CON2,
+		0x100),
+	MT6392_REG_FIXED("ldo-vxo22", VXO22, MT6392_ANALDO_CON1, 10, 2200000,
+		MT6392_ANALDO_CON1, 0x2),
+	MT6392_LDO("ldo-vaud22", VAUD22, ldo_volt_table1,
+		MT6392_ANALDO_CON2, 14, MT6392_ANALDO_CON8, 0x60,
+		MT6392_ANALDO_CON2, 0x2),
+	MT6392_REG_FIXED("ldo-vcama", VCAMA, MT6392_ANALDO_CON4, 15, 2800000,
+		-1, 0),
+	MT6392_REG_FIXED("ldo-vaud28", VAUD28, MT6392_ANALDO_CON23, 14, 2800000,
+		MT6392_ANALDO_CON23, 0x2),
+	MT6392_REG_FIXED("ldo-vadc18", VADC18, MT6392_ANALDO_CON25, 14, 1800000,
+		MT6392_ANALDO_CON25, 0x2),
+	MT6392_LDO("ldo-vcn35", VCN35, ldo_volt_table2,
+		MT6392_ANALDO_CON21, 12, MT6392_ANALDO_CON16, 0xC,
+		MT6392_ANALDO_CON21, 0x2),
+	MT6392_REG_FIXED("ldo-vio28", VIO28, MT6392_DIGLDO_CON0, 14, 2800000,
+		MT6392_DIGLDO_CON0, 0x2),
+	MT6392_REG_FIXED("ldo-vusb", VUSB, MT6392_DIGLDO_CON2, 14, 3300000,
+		MT6392_DIGLDO_CON2, 0x2),
+	MT6392_LDO("ldo-vmc", VMC, ldo_volt_table3,
+		MT6392_DIGLDO_CON3, 12, MT6392_DIGLDO_CON24, 0x10,
+		MT6392_DIGLDO_CON3, 0x2),
+	MT6392_LDO("ldo-vmch", VMCH, ldo_volt_table4,
+		MT6392_DIGLDO_CON5, 14, MT6392_DIGLDO_CON26, 0x80,
+		MT6392_DIGLDO_CON5, 0x2),
+	MT6392_LDO("ldo-vemc3v3", VEMC3V3, ldo_volt_table4,
+		MT6392_DIGLDO_CON6, 14, MT6392_DIGLDO_CON27, 0x80,
+		MT6392_DIGLDO_CON6, 0x2),
+	MT6392_LDO("ldo-vgp1", VGP1, ldo_volt_table5,
+		MT6392_DIGLDO_CON7, 15, MT6392_DIGLDO_CON28, 0xE0,
+		MT6392_DIGLDO_CON7, 0x2),
+	MT6392_LDO("ldo-vgp2", VGP2, ldo_volt_table5,
+		MT6392_DIGLDO_CON8, 15, MT6392_DIGLDO_CON29, 0xE0,
+		MT6392_DIGLDO_CON8, 0x2),
+	MT6392_REG_FIXED("ldo-vcn18", VCN18, MT6392_DIGLDO_CON11, 14, 1800000,
+		MT6392_DIGLDO_CON11, 0x2),
+	MT6392_LDO("ldo-vcamaf", VCAMAF, ldo_volt_table5,
+		MT6392_DIGLDO_CON31, 15, MT6392_DIGLDO_CON32, 0xE0,
+		MT6392_DIGLDO_CON31, 0x2),
+	MT6392_LDO("ldo-vm", VM, ldo_volt_table6,
+		MT6392_DIGLDO_CON47, 14, MT6392_DIGLDO_CON48, 0x30,
+		MT6392_DIGLDO_CON47, 0x2),
+	MT6392_REG_FIXED("ldo-vio18", VIO18, MT6392_DIGLDO_CON49, 14, 1800000,
+		MT6392_DIGLDO_CON49, 0x2),
+	MT6392_LDO("ldo-vcamd", VCAMD, ldo_volt_table7,
+		MT6392_DIGLDO_CON51, 14, MT6392_DIGLDO_CON52, 0x60,
+		MT6392_DIGLDO_CON51, 0x2),
+	MT6392_REG_FIXED("ldo-vcamio", VCAMIO, MT6392_DIGLDO_CON53, 14, 1800000,
+		MT6392_DIGLDO_CON53, 0x2),
+	MT6392_REG_FIXED("ldo-vm25", VM25, MT6392_DIGLDO_CON55, 14, 2500000,
+		MT6392_DIGLDO_CON55, 0x2),
+	MT6392_LDO("ldo-vefuse", VEFUSE, ldo_volt_table8,
+		MT6392_DIGLDO_CON57, 14, MT6392_DIGLDO_CON58, 0x10,
+		MT6392_DIGLDO_CON57, 0x2),
+};
+
+static int mt6392_set_buck_vosel_reg(struct platform_device *pdev)
+{
+	struct mt6397_chip *mt6392 = dev_get_drvdata(pdev->dev.parent);
+	int i;
+	u32 regval;
+
+	for (i = 0; i < MT6392_MAX_REGULATOR; i++) {
+		if (mt6392_regulators[i].vselctrl_reg) {
+			if (regmap_read(mt6392->regmap,
+				mt6392_regulators[i].vselctrl_reg,
+				&regval) < 0) {
+				dev_err(&pdev->dev,
+					"Failed to read buck ctrl\n");
+				return -EIO;
+			}
+
+			if (regval & mt6392_regulators[i].vselctrl_mask) {
+				mt6392_regulators[i].desc.vsel_reg =
+				mt6392_regulators[i].vselon_reg;
+			}
+		}
+	}
+
+	return 0;
+}
+
+static int mt6392_regulator_probe(struct platform_device *pdev)
+{
+	struct mt6397_chip *mt6392 = dev_get_drvdata(pdev->dev.parent);
+	struct regulator_config config = {};
+	struct regulator_dev *rdev;
+	struct regulation_constraints *c;
+	int i;
+	u32 reg_value;
+
+	/* Query buck controller to select activated voltage register part */
+	if (mt6392_set_buck_vosel_reg(pdev))
+		return -EIO;
+
+	/* Read PMIC chip revision to update constraints and voltage table */
+	if (regmap_read(mt6392->regmap, MT6392_CID, &reg_value) < 0) {
+		dev_err(&pdev->dev, "Failed to read Chip ID\n");
+		return -EIO;
+	}
+
+	dev_info(&pdev->dev, "Chip ID = 0x%x\n", reg_value);
+
+	for (i = 0; i < MT6392_MAX_REGULATOR; i++) {
+		config.dev = &pdev->dev;
+		config.driver_data = &mt6392_regulators[i];
+		config.regmap = mt6392->regmap;
+		rdev = devm_regulator_register(&pdev->dev,
+				&mt6392_regulators[i].desc, &config);
+		if (IS_ERR(rdev)) {
+			dev_err(&pdev->dev, "failed to register %s\n",
+				mt6392_regulators[i].desc.name);
+			return PTR_ERR(rdev);
+		}
+
+		/* Constrain board-specific capabilities according to what
+		 * this driver and the chip itself can actually do.
+		 */
+		c = rdev->constraints;
+		c->valid_modes_mask |= REGULATOR_MODE_NORMAL|
+			REGULATOR_MODE_STANDBY | REGULATOR_MODE_FAST;
+		c->valid_ops_mask |= REGULATOR_CHANGE_MODE;
+
+	}
+	return 0;
+}
+
+static const struct platform_device_id mt6392_platform_ids[] = {
+	{"mt6392-regulator", 0},
+	{ /* sentinel */ },
+};
+MODULE_DEVICE_TABLE(platform, mt6392_platform_ids);
+
+static const struct of_device_id mt6392_of_match[] = {
+	{ .compatible = "mediatek,mt6392-regulator", },
+	{ /* sentinel */ },
+};
+MODULE_DEVICE_TABLE(of, mt6392_of_match);
+
+static struct platform_driver mt6392_regulator_driver = {
+	.driver = {
+		.name = "mt6392-regulator",
+		.of_match_table = of_match_ptr(mt6392_of_match),
+	},
+	.probe = mt6392_regulator_probe,
+	.id_table = mt6392_platform_ids,
+};
+
+module_platform_driver(mt6392_regulator_driver);
+
+MODULE_AUTHOR("Chen Zhong <chen.zhong@mediatek.com>");
+MODULE_DESCRIPTION("Regulator Driver for MediaTek MT6392 PMIC");
+MODULE_LICENSE("GPL v2");
diff --git a/include/linux/regulator/mt6392-regulator.h b/include/linux/regulator/mt6392-regulator.h
new file mode 100644
index 000000000000..dfcbcacb5ad4
--- /dev/null
+++ b/include/linux/regulator/mt6392-regulator.h
@@ -0,0 +1,40 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/*
+ * Copyright (c) 2019 MediaTek Inc.
+ * Author: Chen Zhong <chen.zhong@mediatek.com>
+ */
+
+#ifndef __LINUX_REGULATOR_MT6392_H
+#define __LINUX_REGULATOR_MT6392_H
+
+enum {
+	MT6392_ID_VPROC = 0,
+	MT6392_ID_VSYS,
+	MT6392_ID_VCORE,
+	MT6392_ID_VXO22,
+	MT6392_ID_VAUD22,
+	MT6392_ID_VCAMA,
+	MT6392_ID_VAUD28,
+	MT6392_ID_VADC18,
+	MT6392_ID_VCN35,
+	MT6392_ID_VIO28,
+	MT6392_ID_VUSB = 10,
+	MT6392_ID_VMC,
+	MT6392_ID_VMCH,
+	MT6392_ID_VEMC3V3,
+	MT6392_ID_VGP1,
+	MT6392_ID_VGP2,
+	MT6392_ID_VCN18,
+	MT6392_ID_VCAMAF,
+	MT6392_ID_VM,
+	MT6392_ID_VIO18,
+	MT6392_ID_VCAMD,
+	MT6392_ID_VCAMIO,
+	MT6392_ID_VM25,
+	MT6392_ID_VEFUSE,
+	MT6392_ID_RG_MAX,
+};
+
+#define MT6392_MAX_REGULATOR	MT6392_ID_RG_MAX
+
+#endif /* __LINUX_REGULATOR_MT6392_H */
-- 
2.20.1

