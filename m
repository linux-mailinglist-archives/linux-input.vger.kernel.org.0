Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 613A0554771
	for <lists+linux-input@lfdr.de>; Wed, 22 Jun 2022 14:12:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236595AbiFVKCF (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 22 Jun 2022 06:02:05 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53396 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236396AbiFVKCE (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Wed, 22 Jun 2022 06:02:04 -0400
Received: from mail-pj1-x1036.google.com (mail-pj1-x1036.google.com [IPv6:2607:f8b0:4864:20::1036])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6F7A83A18D;
        Wed, 22 Jun 2022 03:02:03 -0700 (PDT)
Received: by mail-pj1-x1036.google.com with SMTP id cv13so12853244pjb.4;
        Wed, 22 Jun 2022 03:02:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=CZhPkEbUp/BupPkkWIAvznS6NG9uXOGy1Q4dg4cOV3g=;
        b=C8jHmBld8AbE93Qsm3w1Z17s+n1EElgFwQAI1VNp4yB0fOyHODUrp4bnbgqujvQbnP
         2aZZrxORX3VR9WAT6xR4fsEjgz/gaH2bMhhZq2hNEDOD+GCgTE+RwQo+2mxl5pVa/9J7
         0sr2NguNd4Z2OZ3dqnGrcfxG95KvdV5rgjfBaHYQL5Opb161DEH6N/TO7m+cQ+zTtdND
         CS/9yRsEna5NkbLF+XdI9b+ZTtrx65DS8A6bJccujNCEsVDs8B0E8bHdnLlBINg27F3K
         gqMEfgqNTEePH6dzTgzAGGQuzPOGht3NMuzHNA7SHO0mnJO6WdBgJ/296FNokahOBGb8
         U/cQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=CZhPkEbUp/BupPkkWIAvznS6NG9uXOGy1Q4dg4cOV3g=;
        b=6RJvE88qoUwazNs/5HheDaNS9j+j5uXQhFskugSSeG/fzXAf7qtmj2e1nx+gYO/KIT
         giBN/U0G3Pk9V8WWMXiEDM4yvE5IzxVevBQvLVnukCQbAF2rYPn2KjVrngGbndM13Xbv
         /6z9Zl7pBmIdioKA+i+Dqg7pVxPEtN01U4TdBJ7EJzGaWfKO0fmsD4LyWSI/gYiafwzY
         lKsB55W6d34pY+vcyR/wWVi9Esmgx5NL/HRoLqF3h37zb0ddlHsi96xV9dgNP/HVSf6H
         BaXE5iiv11NI4SU+xX3NculzlIWJ1D+KZFPGQiKh7QV49e9oJv1Qs7hBxvg4TK1u5qlN
         6gnA==
X-Gm-Message-State: AJIora+mXQ2vSDAMlooRfOGFvP9f6ck5aJdQYSPkIDikU2r8sPdTDDoc
        kfN5loVrynDS8QYbHRYe2cM=
X-Google-Smtp-Source: AGRyM1sMqXVYaMOlcIhG5kinoDmWRGSKMG6mMgWfPEMCmJx4UJIHt8hpi4N8kc7NksHFAz0dISinoQ==
X-Received: by 2002:a17:90a:d0c5:b0:1ec:747b:7c3 with SMTP id y5-20020a17090ad0c500b001ec747b07c3mr2973267pjw.68.1655892122827;
        Wed, 22 Jun 2022 03:02:02 -0700 (PDT)
Received: from localhost.localdomain ([2402:7500:486:d40b:4089:31a8:340d:2f29])
        by smtp.gmail.com with ESMTPSA id w9-20020a639349000000b003fc5fd21752sm12790433pgm.50.2022.06.22.03.01.59
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 22 Jun 2022 03:02:02 -0700 (PDT)
From:   cy_huang <u0084500@gmail.com>
To:     robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
        lee.jones@linaro.org, broonie@kernel.org, dmitry.torokhov@gmail.com
Cc:     lgirdwood@gmail.com, cy_huang@richtek.com,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-input@vger.kernel.org
Subject: [PATCH v2 3/4] regulator: rt5120: Add PMIC regulator support
Date:   Wed, 22 Jun 2022 18:01:43 +0800
Message-Id: <1655892104-10874-4-git-send-email-u0084500@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1655892104-10874-1-git-send-email-u0084500@gmail.com>
References: <1655892104-10874-1-git-send-email-u0084500@gmail.com>
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,
        FREEMAIL_FROM,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

From: ChiYuan Huang <cy_huang@richtek.com>

Add RT5120 PMIC regulator support.

It integrates 4 buck convertes, 1 LDO voltage regulator, 1 external
enable signal to control the external power source.

Signed-off-by: ChiYuan Huang <cy_huang@richtek.com>
---
Since v2:
- Add 'unevaluatedProperties: false' for regulator buck1~4/ldo/exten.
- Fix indention and remove status for powerkey.
- Refine powerkey description for more HW details.

---
 drivers/regulator/Kconfig            |  10 +
 drivers/regulator/Makefile           |   1 +
 drivers/regulator/rt5120-regulator.c | 420 +++++++++++++++++++++++++++++++++++
 3 files changed, 431 insertions(+)
 create mode 100644 drivers/regulator/rt5120-regulator.c

diff --git a/drivers/regulator/Kconfig b/drivers/regulator/Kconfig
index cbe0f96..d777f71 100644
--- a/drivers/regulator/Kconfig
+++ b/drivers/regulator/Kconfig
@@ -1047,6 +1047,16 @@ config REGULATOR_RT5033
 	  RT5033 PMIC. The device supports multiple regulators like
 	  current source, LDO and Buck.
 
+config REGULATOR_RT5120
+	tristate "Richtek RT5120 PMIC Regulators"
+	depends on MFD_RT5120
+	help
+	  This adds support for voltage regulator in Richtek RT5120 PMIC.
+	  It integrates 4 channels buck controller, 1 channel LDO, 1 EXTEN
+	  to control external power source. Only BUCK1 is adjustable from
+	  600mV to 1395mV, per step 6.250mV. The others are all fixed voltage
+	  by external hardware circuit.
+
 config REGULATOR_RT5190A
 	tristate "Richtek RT5190A PMIC"
 	depends on I2C
diff --git a/drivers/regulator/Makefile b/drivers/regulator/Makefile
index 8d3ee8b6..b74ca8f 100644
--- a/drivers/regulator/Makefile
+++ b/drivers/regulator/Makefile
@@ -126,6 +126,7 @@ obj-$(CONFIG_REGULATOR_ROHM)	+= rohm-regulator.o
 obj-$(CONFIG_REGULATOR_RT4801)	+= rt4801-regulator.o
 obj-$(CONFIG_REGULATOR_RT4831)	+= rt4831-regulator.o
 obj-$(CONFIG_REGULATOR_RT5033)	+= rt5033-regulator.o
+obj-$(CONFIG_REGULATOR_RT5120)	+= rt5120-regulator.o
 obj-$(CONFIG_REGULATOR_RT5190A) += rt5190a-regulator.o
 obj-$(CONFIG_REGULATOR_RT5759)	+= rt5759-regulator.o
 obj-$(CONFIG_REGULATOR_RT6160)	+= rt6160-regulator.o
diff --git a/drivers/regulator/rt5120-regulator.c b/drivers/regulator/rt5120-regulator.c
new file mode 100644
index 00000000..8173ede
--- /dev/null
+++ b/drivers/regulator/rt5120-regulator.c
@@ -0,0 +1,420 @@
+// SPDX-License-Identifier: GPL-2.0+
+
+#include <linux/bits.h>
+#include <linux/kernel.h>
+#include <linux/module.h>
+#include <linux/of.h>
+#include <linux/platform_device.h>
+#include <linux/regmap.h>
+#include <linux/regulator/driver.h>
+#include <linux/regulator/machine.h>
+#include <linux/regulator/of_regulator.h>
+
+#define RT5120_REG_PGSTAT	0x03
+#define RT5120_REG_CH1VID	0x06
+#define RT5120_REG_CH1SLPVID	0x07
+#define RT5120_REG_ENABLE	0x08
+#define RT5120_REG_MODECTL	0x09
+#define RT5120_REG_UVOVPROT	0x0A
+#define RT5120_REG_SLPCTL	0x0C
+#define RT5120_REG_INTSTAT	0x1E
+#define RT5120_REG_DISCHG	0x1F
+
+#define RT5120_OUTPG_MASK(rid)	BIT(rid + 1)
+#define RT5120_OUTUV_MASK(rid)	BIT(rid + 9)
+#define RT5120_OUTOV_MASK(rid)	BIT(rid + 16)
+#define RT5120_CH1VID_MASK	GENMASK(6, 0)
+#define RT5120_RIDEN_MASK(rid)	BIT(rid + 1)
+#define RT5120_RADEN_MASK(rid)	BIT(rid)
+#define RT5120_FPWM_MASK(rid)	BIT(rid + 1)
+#define RT5120_UVHICCUP_MASK	BIT(1)
+#define RT5120_OVHICCUP_MASK	BIT(0)
+#define RT5120_HOTDIE_MASK	BIT(1)
+
+#define RT5120_BUCK1_MINUV	600000
+#define RT5120_BUCK1_MAXUV	1393750
+#define RT5120_BUCK1_STEPUV	6250
+#define RT5120_BUCK1_NUM_VOLT	0x80
+
+#define RT5120_AUTO_MODE	0
+#define RT5120_FPWM_MODE	1
+
+enum {
+	RT5120_REGULATOR_BUCK1 = 0,
+	RT5120_REGULATOR_BUCK2,
+	RT5120_REGULATOR_BUCK3,
+	RT5120_REGULATOR_BUCK4,
+	RT5120_REGULATOR_LDO,
+	RT5120_REGULATOR_EXTEN,
+	RT5120_MAX_REGULATOR
+};
+
+struct rt5120_priv {
+	struct device *dev;
+	struct regmap *regmap;
+	struct regulator_desc rdesc[RT5120_MAX_REGULATOR];
+};
+
+static int rt5120_buck_set_mode(struct regulator_dev *rdev, unsigned int mode)
+{
+	struct regmap *regmap = rdev_get_regmap(rdev);
+	int rid = rdev_get_id(rdev);
+	unsigned int mask = RT5120_FPWM_MASK(rid), val;
+
+	switch (mode) {
+	case REGULATOR_MODE_NORMAL:
+		val = 0;
+		break;
+	case REGULATOR_MODE_FAST:
+		val = RT5120_FPWM_MASK(rid);
+		break;
+	default:
+		return -EINVAL;
+	}
+
+	return regmap_update_bits(regmap, RT5120_REG_MODECTL, mask, val);
+}
+
+static unsigned int rt5120_buck_get_mode(struct regulator_dev *rdev)
+{
+	struct regmap *regmap = rdev_get_regmap(rdev);
+	int ret, rid = rdev_get_id(rdev);
+	unsigned int val;
+
+	ret = regmap_read(regmap, RT5120_REG_MODECTL, &val);
+	if (ret)
+		return REGULATOR_MODE_INVALID;
+
+	if (val & RT5120_FPWM_MASK(rid))
+		return REGULATOR_MODE_FAST;
+
+	return REGULATOR_MODE_NORMAL;
+}
+
+static int rt5120_regulator_get_error_flags(struct regulator_dev *rdev,
+					    unsigned int *flags)
+{
+	struct regmap *regmap = rdev_get_regmap(rdev);
+	unsigned int stat, hd_stat, cur_flags = 0;
+	int rid = rdev_get_id(rdev), ret;
+
+	/*
+	 * reg 0x03/0x04/0x05 to indicate PG/UV/OV
+	 * use block read to descrease I/O xfer time
+	 */
+	ret = regmap_raw_read(regmap, RT5120_REG_PGSTAT, &stat, 3);
+	if (ret)
+		return ret;
+
+	ret = regmap_read(regmap, RT5120_REG_INTSTAT, &hd_stat);
+	if (ret)
+		return ret;
+
+	if (!(stat & RT5120_OUTPG_MASK(rid))) {
+		if (stat & RT5120_OUTUV_MASK(rid))
+			cur_flags |= REGULATOR_ERROR_UNDER_VOLTAGE;
+
+		if (stat & RT5120_OUTOV_MASK(rid))
+			cur_flags |= REGULATOR_ERROR_REGULATION_OUT;
+	}
+
+	if (hd_stat & RT5120_HOTDIE_MASK)
+		cur_flags |= REGULATOR_ERROR_OVER_TEMP;
+
+	*flags = cur_flags;
+	return 0;
+}
+
+static int rt5120_buck1_set_suspend_voltage(struct regulator_dev *rdev, int uV)
+{
+	struct regmap *regmap = rdev_get_regmap(rdev);
+	int sel;
+
+	if (uV < RT5120_BUCK1_MINUV || uV > RT5120_BUCK1_MAXUV)
+		return -EINVAL;
+
+	sel = (uV - RT5120_BUCK1_MINUV) / RT5120_BUCK1_STEPUV;
+	return regmap_write(regmap, RT5120_REG_CH1SLPVID, sel);
+}
+
+static int rt5120_regulator_set_suspend_enable(struct regulator_dev *rdev)
+{
+	struct regmap *regmap = rdev_get_regmap(rdev);
+	int rid = rdev_get_id(rdev);
+	unsigned int mask = RT5120_RIDEN_MASK(rid);
+
+	return regmap_update_bits(regmap, RT5120_REG_SLPCTL, mask, mask);
+}
+
+static int rt5120_regulator_set_suspend_disable(struct regulator_dev *rdev)
+{
+	struct regmap *regmap = rdev_get_regmap(rdev);
+	int rid = rdev_get_id(rdev);
+	unsigned int mask = RT5120_RIDEN_MASK(rid);
+
+	return regmap_update_bits(regmap, RT5120_REG_SLPCTL, mask, 0);
+}
+
+static const struct regulator_ops rt5120_buck1_ops = {
+	.enable = regulator_enable_regmap,
+	.disable = regulator_disable_regmap,
+	.is_enabled = regulator_is_enabled_regmap,
+	.list_voltage = regulator_list_voltage_linear,
+	.set_voltage_sel = regulator_set_voltage_sel_regmap,
+	.get_voltage_sel = regulator_get_voltage_sel_regmap,
+	.set_active_discharge = regulator_set_active_discharge_regmap,
+	.set_mode = rt5120_buck_set_mode,
+	.get_mode = rt5120_buck_get_mode,
+	.get_error_flags = rt5120_regulator_get_error_flags,
+	.set_suspend_voltage = rt5120_buck1_set_suspend_voltage,
+	.set_suspend_enable = rt5120_regulator_set_suspend_enable,
+	.set_suspend_disable = rt5120_regulator_set_suspend_disable,
+};
+
+static const struct regulator_ops rt5120_buck234_ops = {
+	.enable = regulator_enable_regmap,
+	.disable = regulator_disable_regmap,
+	.is_enabled = regulator_is_enabled_regmap,
+	.set_active_discharge = regulator_set_active_discharge_regmap,
+	.set_mode = rt5120_buck_set_mode,
+	.get_mode = rt5120_buck_get_mode,
+	.get_error_flags = rt5120_regulator_get_error_flags,
+	.set_suspend_enable = rt5120_regulator_set_suspend_enable,
+	.set_suspend_disable = rt5120_regulator_set_suspend_disable,
+};
+
+static const struct regulator_ops rt5120_ldo_ops = {
+	.enable = regulator_enable_regmap,
+	.disable = regulator_disable_regmap,
+	.is_enabled = regulator_is_enabled_regmap,
+	.set_active_discharge = regulator_set_active_discharge_regmap,
+	.get_error_flags = rt5120_regulator_get_error_flags,
+	.set_suspend_enable = rt5120_regulator_set_suspend_enable,
+	.set_suspend_disable = rt5120_regulator_set_suspend_disable,
+};
+
+static const struct regulator_ops rt5120_exten_ops = {
+	.enable = regulator_enable_regmap,
+	.disable = regulator_disable_regmap,
+	.is_enabled = regulator_is_enabled_regmap,
+	.set_suspend_enable = rt5120_regulator_set_suspend_enable,
+	.set_suspend_disable = rt5120_regulator_set_suspend_disable,
+};
+
+static unsigned int rt5120_buck_of_map_mode(unsigned int mode)
+{
+	switch (mode) {
+	case RT5120_AUTO_MODE:
+		return REGULATOR_MODE_NORMAL;
+	case RT5120_FPWM_MODE:
+		return REGULATOR_MODE_FAST;
+	default:
+		return REGULATOR_MODE_INVALID;
+	}
+}
+
+static void rt5120_fillin_regulator_desc(struct regulator_desc *desc, int rid)
+{
+	static const char * const name[] = {
+		"buck1", "buck2", "buck3", "buck4", "ldo", "exten" };
+	static const char * const sname[] = {
+		"vin1", "vin2", "vin3", "vin4", "vinldo", NULL };
+
+	/* Common regulator property */
+	desc->name = name[rid];
+	desc->supply_name = sname[rid];
+	desc->owner = THIS_MODULE;
+	desc->type = REGULATOR_VOLTAGE;
+	desc->id = rid;
+	desc->enable_reg = RT5120_REG_ENABLE;
+	desc->enable_mask = RT5120_RIDEN_MASK(rid);
+	desc->active_discharge_reg = RT5120_REG_DISCHG;
+	desc->active_discharge_mask = RT5120_RADEN_MASK(rid);
+	desc->active_discharge_on = RT5120_RADEN_MASK(rid);
+	/* Config n_voltages to 1 for all*/
+	desc->n_voltages = 1;
+
+	/* Only buck support mode change */
+	if (rid >= RT5120_REGULATOR_BUCK1 && rid <= RT5120_REGULATOR_BUCK4)
+		desc->of_map_mode = rt5120_buck_of_map_mode;
+
+	/* RID specific property init */
+	switch (rid) {
+	case RT5120_REGULATOR_BUCK1:
+		/* Only buck1 support voltage change by I2C */
+		desc->n_voltages = RT5120_BUCK1_NUM_VOLT;
+		desc->min_uV = RT5120_BUCK1_MINUV;
+		desc->uV_step = RT5120_BUCK1_STEPUV;
+		desc->vsel_reg = RT5120_REG_CH1VID,
+		desc->vsel_mask = RT5120_CH1VID_MASK,
+		desc->ops = &rt5120_buck1_ops;
+		break;
+	case RT5120_REGULATOR_BUCK2 ... RT5120_REGULATOR_BUCK4:
+		desc->ops = &rt5120_buck234_ops;
+		break;
+	case RT5120_REGULATOR_LDO:
+		desc->ops = &rt5120_ldo_ops;
+		break;
+	default:
+		desc->ops = &rt5120_exten_ops;
+	}
+}
+
+static int rt5120_of_parse_cb(struct rt5120_priv *priv, int rid,
+			      struct of_regulator_match *match)
+{
+	struct regulator_desc *desc = priv->rdesc + rid;
+	struct regulator_init_data *init_data = match->init_data;
+
+	if (!init_data || rid == RT5120_REGULATOR_BUCK1)
+		return 0;
+
+	if (init_data->constraints.min_uV != init_data->constraints.max_uV) {
+		dev_err(priv->dev, "Variable voltage for fixed regulator\n");
+		return -EINVAL;
+	}
+
+	desc->fixed_uV = init_data->constraints.min_uV;
+	return 0;
+}
+
+static struct of_regulator_match rt5120_regu_match[RT5120_MAX_REGULATOR] = {
+	[RT5120_REGULATOR_BUCK1] = { .name = "buck1", },
+	[RT5120_REGULATOR_BUCK2] = { .name = "buck2", },
+	[RT5120_REGULATOR_BUCK3] = { .name = "buck3", },
+	[RT5120_REGULATOR_BUCK4] = { .name = "buck4", },
+	[RT5120_REGULATOR_LDO] = { .name = "ldo", },
+	[RT5120_REGULATOR_EXTEN] = { .name = "exten", }
+};
+
+static int rt5120_parse_regulator_dt_data(struct rt5120_priv *priv)
+{
+	struct device *dev = priv->dev->parent;
+	struct device_node *reg_node;
+	int i, ret;
+
+	for (i = 0; i < RT5120_MAX_REGULATOR; i++) {
+		rt5120_fillin_regulator_desc(priv->rdesc + i, i);
+
+		rt5120_regu_match[i].desc = priv->rdesc + i;
+	}
+
+	reg_node = of_get_child_by_name(dev->of_node, "regulators");
+	if (!reg_node) {
+		dev_err(priv->dev, "Couldn't find 'regulators' node\n");
+		return -ENODEV;
+	}
+
+	ret = of_regulator_match(priv->dev, reg_node, rt5120_regu_match,
+				 ARRAY_SIZE(rt5120_regu_match));
+
+	of_node_put(reg_node);
+
+	if (ret < 0) {
+		dev_err(priv->dev,
+			"Error parsing regulator init data (%d)\n", ret);
+		return ret;
+	}
+
+	for (i = 0; i < RT5120_MAX_REGULATOR; i++) {
+		ret = rt5120_of_parse_cb(priv, i, rt5120_regu_match + i);
+		if (ret) {
+			dev_err(priv->dev, "Failed in [%d] of_passe_cb\n", i);
+			return ret;
+		}
+	}
+
+	return 0;
+}
+
+static int rt5120_device_property_init(struct rt5120_priv *priv)
+{
+	struct device *dev = priv->dev->parent;
+	struct device_node *np = dev->of_node;
+	bool prot_enable;
+	unsigned int prot_enable_val = 0;
+
+	/* Assign UV/OV HW protection behavior */
+	prot_enable = of_property_read_bool(np,
+					    "richtek,enable-undervolt-hiccup");
+	if (prot_enable)
+		prot_enable_val |= RT5120_UVHICCUP_MASK;
+
+	prot_enable = of_property_read_bool(np,
+					    "richtek,enable-overvolt-hiccup");
+	if (prot_enable)
+		prot_enable_val |= RT5120_OVHICCUP_MASK;
+
+	return regmap_update_bits(priv->regmap, RT5120_REG_UVOVPROT,
+				  RT5120_UVHICCUP_MASK | RT5120_OVHICCUP_MASK,
+				  prot_enable_val);
+}
+
+static int rt5120_regulator_probe(struct platform_device *pdev)
+{
+	struct rt5120_priv *priv;
+	struct regulator_dev *rdev;
+	struct regulator_config config = {};
+	int i, ret;
+
+	priv = devm_kzalloc(&pdev->dev, sizeof(*priv), GFP_KERNEL);
+	if (!priv)
+		return -ENOMEM;
+
+	priv->dev = &pdev->dev;
+
+	priv->regmap = dev_get_regmap(pdev->dev.parent, NULL);
+	if (!priv->regmap) {
+		dev_err(&pdev->dev, "Failed to init regmap\n");
+		return -ENODEV;
+	}
+
+	ret = rt5120_device_property_init(priv);
+	if (ret) {
+		dev_err(&pdev->dev, "Failed to do property init\n");
+		return ret;
+	}
+
+	ret = rt5120_parse_regulator_dt_data(priv);
+	if (ret) {
+		dev_err(&pdev->dev, "Failed to parse dt data\n");
+		return ret;
+	}
+
+	config.dev = &pdev->dev;
+	config.regmap = priv->regmap;
+
+	for (i = 0; i < RT5120_MAX_REGULATOR; i++) {
+		config.of_node = rt5120_regu_match[i].of_node;
+		config.init_data = rt5120_regu_match[i].init_data;
+
+		rdev = devm_regulator_register(&pdev->dev, priv->rdesc + i,
+					       &config);
+		if (IS_ERR(rdev)) {
+			dev_err(&pdev->dev,
+				"Failed to register regulator [%d]\n", i);
+			return PTR_ERR(rdev);
+		}
+	}
+
+	return 0;
+}
+
+static const struct platform_device_id rt5120_regulator_dev_table[] = {
+	{ "rt5120-regulator", 0 },
+	{}
+};
+MODULE_DEVICE_TABLE(platform, rt5120_regulator_dev_table);
+
+static struct platform_driver rt5120_regulator_driver = {
+	.driver = {
+		.name = "rt5120-regulator",
+	},
+	.id_table = rt5120_regulator_dev_table,
+	.probe = rt5120_regulator_probe,
+};
+module_platform_driver(rt5120_regulator_driver);
+
+MODULE_AUTHOR("ChiYuan Huang <cy_huang@richtek.com>");
+MODULE_DESCRIPTION("Richtek RT5120 regulator driver");
+MODULE_LICENSE("GPL v2");
-- 
2.7.4

