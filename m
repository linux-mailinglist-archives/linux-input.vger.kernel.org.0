Return-Path: <linux-input+bounces-3995-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 448978D6890
	for <lists+linux-input@lfdr.de>; Fri, 31 May 2024 19:54:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id AFA4E1F23C1F
	for <lists+linux-input@lfdr.de>; Fri, 31 May 2024 17:54:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6C52F17F4F2;
	Fri, 31 May 2024 17:53:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mff.cuni.cz header.i=@mff.cuni.cz header.b="LxMxlqBR"
X-Original-To: linux-input@vger.kernel.org
Received: from smtp1.ms.mff.cuni.cz (smtp-in1.ms.mff.cuni.cz [195.113.20.234])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0EEF717CA08;
	Fri, 31 May 2024 17:53:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.113.20.234
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717178002; cv=none; b=ANpguBjywy760E36VXxwlYo81xkuoqLYVERegta4YqAmUtK1sVdWcfn8TvHoOH22m1Zgqqb1Sbcx0n3ovTnh9UcfmWPLO3E5wE7w4OoXf3229Fi7H0tkS84D4LadewNo401MXQCONC4XQKQ733YMcJY/Oi4IjH9ttd3vAl0pKYw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717178002; c=relaxed/simple;
	bh=Fz/luoDCaNe57dbiSN53inTUMVbsQDubV18EgGyJvyQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=tiFJ1bO1FglPLxCHAmy2Bfr+1EnNndOAcrRX6hglPHHMLweD+3mI3OSAXRisJJ9+P5MihELw8KAiea8OV2kZIWGkwn6ONsYxV+ifYDebJUmQcaPoLpEUiySb98SS1jExOOCf+BfjzFfG8w77/yQVU3Fq9QnyT0zocFQC6DzhF9A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=matfyz.cz; spf=pass smtp.mailfrom=matfyz.cz; dkim=pass (2048-bit key) header.d=mff.cuni.cz header.i=@mff.cuni.cz header.b=LxMxlqBR; arc=none smtp.client-ip=195.113.20.234
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=matfyz.cz
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=matfyz.cz
X-SubmittedBy: id balejk@matfyz.cz subject /postalCode=110+2000/O=Univerzita+20Karlova/street=Ovocn+5CxC3+5CxBD+20trh+20560/5/ST=Praha,+20Hlavn+5CxC3+5CxAD+20m+5CxC4+5Cx9Bsto/C=CZ/CN=Karel+20Balej/emailAddress=balejk@matfyz.cz
	serial F5FD910E8FE2121B897F7E55B84E351D
	issued by /C=NL/O=GEANT+20Vereniging/CN=GEANT+20Personal+20CA+204
	auth type TLS.CUNI
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mff.cuni.cz;
	s=submission; t=1717177972; x=1718477972;
	bh=Rlgb30c6vAqe3o2O7IruRE44W3TXjftAgwd+fLQMQaA=; h=From;
	b=LxMxlqBRGvS9jlz3SmkCNXidDtO0VFAF7wjWR+Cwf7snCe7BQkOHokSZYy3rz20I6
	 pu0FqN1WL45PKXkcK6qtpPNEQrExro+lu9+XxJJ5Fueaf8I1isM6eJ8w3MMyIO/SC6
	 EpJa61RwPKORHihCKl2dM4OdEfgBIfywHT6cwkf3y3qLQdlPLww+dBTGrBrqfKduVC
	 xsEWEyRxakvmbievA5VDNkhy4WaV363Qy1QcapR6KUC+WlyTLOn+ZS3B5vT93TskJW
	 jbLITR3ErWZhA3fBZEnkuch8A2rkEk7ZIEU96pg1c/iHhfMvM01D1zGKTe/JAXfOYY
	 /aW6Dz08FGs6A==
Received: from localhost (internet5.mraknet.com [185.200.108.250])
	(authenticated)
	by smtp1.ms.mff.cuni.cz (8.16.1/8.16.1) with ESMTPS id 44VHqoq8001118
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=OK);
	Fri, 31 May 2024 19:52:52 +0200 (CEST)
	(envelope-from balejk@matfyz.cz)
From: Karel Balej <balejk@matfyz.cz>
To: Lee Jones <lee@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-input@vger.kernel.org
Cc: =?UTF-8?q?Duje=20Mihanovi=C4=87?= <duje.mihanovic@skole.hr>,
        ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
        balejk@matfyz.cz
Subject: [PATCH v7 3/5] regulator: add regulators driver for Marvell 88PM886 PMIC
Date: Fri, 31 May 2024 19:34:58 +0200
Message-ID: <20240531175109.15599-4-balejk@matfyz.cz>
X-Mailer: git-send-email 2.45.1
In-Reply-To: <20240531175109.15599-1-balejk@matfyz.cz>
References: <20240531175109.15599-1-balejk@matfyz.cz>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Support the LDO and buck regulators of the Marvell 88PM886 PMIC.

Signed-off-by: Karel Balej <balejk@matfyz.cz>
---

Notes:
    v7:
    - Address Mark's feedback:
      - Drop get_current_limit op, max_uA values and thus unneeded struct
        pm886_regulator and adapt the code accordingly.
    v6:
    - Remove all definitions (now present in the header).
    v5:
    - Add remaining regulators.
    - Clean up includes.
    - Address Mark's feedback:
      - Use dedicated regmap config.
    RFC v4:
    - Initialize regulators regmap in the regulators driver.
    - Register all regulators at once.
    - Drop regulator IDs.
    - Add missing '\n' to dev_err_probe message.
    - Fix includes.
    - Add ID table.
    RFC v3:
    - Do not have a variable for each regulator -- define them all in the
      pm886_regulators array.
    - Use new regulators regmap index name.
    - Use dev_err_probe.
    RFC v2:
    - Drop of_compatible and related code.
    - Drop unused include.
    - Remove some abstraction: use only one regmap for all regulators and
      only mention 88PM886 in Kconfig description.
    - Reword commit message.

 drivers/regulator/88pm886-regulator.c | 392 ++++++++++++++++++++++++++
 drivers/regulator/Kconfig             |   6 +
 drivers/regulator/Makefile            |   1 +
 3 files changed, 399 insertions(+)
 create mode 100644 drivers/regulator/88pm886-regulator.c

diff --git a/drivers/regulator/88pm886-regulator.c b/drivers/regulator/88pm886-regulator.c
new file mode 100644
index 000000000000..a38bd4f312b7
--- /dev/null
+++ b/drivers/regulator/88pm886-regulator.c
@@ -0,0 +1,392 @@
+// SPDX-License-Identifier: GPL-2.0-only
+#include <linux/i2c.h>
+#include <linux/module.h>
+#include <linux/platform_device.h>
+#include <linux/regmap.h>
+#include <linux/regulator/driver.h>
+
+#include <linux/mfd/88pm886.h>
+
+static const struct regmap_config pm886_regulator_regmap_config = {
+	.reg_bits = 8,
+	.val_bits = 8,
+	.max_register = PM886_REG_BUCK5_VOUT,
+};
+
+static const struct regulator_ops pm886_ldo_ops = {
+	.list_voltage = regulator_list_voltage_table,
+	.map_voltage = regulator_map_voltage_iterate,
+	.set_voltage_sel = regulator_set_voltage_sel_regmap,
+	.get_voltage_sel = regulator_get_voltage_sel_regmap,
+	.enable = regulator_enable_regmap,
+	.disable = regulator_disable_regmap,
+	.is_enabled = regulator_is_enabled_regmap,
+};
+
+static const struct regulator_ops pm886_buck_ops = {
+	.list_voltage = regulator_list_voltage_linear_range,
+	.map_voltage = regulator_map_voltage_linear_range,
+	.set_voltage_sel = regulator_set_voltage_sel_regmap,
+	.get_voltage_sel = regulator_get_voltage_sel_regmap,
+	.enable = regulator_enable_regmap,
+	.disable = regulator_disable_regmap,
+	.is_enabled = regulator_is_enabled_regmap,
+};
+
+static const unsigned int pm886_ldo_volt_table1[] = {
+	1700000, 1800000, 1900000, 2500000, 2800000, 2900000, 3100000, 3300000,
+};
+
+static const unsigned int pm886_ldo_volt_table2[] = {
+	1200000, 1250000, 1700000, 1800000, 1850000, 1900000, 2500000, 2600000,
+	2700000, 2750000, 2800000, 2850000, 2900000, 3000000, 3100000, 3300000,
+};
+
+static const unsigned int pm886_ldo_volt_table3[] = {
+	1700000, 1800000, 1900000, 2000000, 2100000, 2500000, 2700000, 2800000,
+};
+
+static const struct linear_range pm886_buck_volt_ranges1[] = {
+	REGULATOR_LINEAR_RANGE(600000, 0, 79, 12500),
+	REGULATOR_LINEAR_RANGE(1600000, 80, 84, 50000),
+};
+
+static const struct linear_range pm886_buck_volt_ranges2[] = {
+	REGULATOR_LINEAR_RANGE(600000, 0, 79, 12500),
+	REGULATOR_LINEAR_RANGE(1600000, 80, 114, 50000),
+};
+
+static struct regulator_desc pm886_regulators[] = {
+	{
+		.name = "LDO1",
+		.regulators_node = "regulators",
+		.of_match = "ldo1",
+		.ops = &pm886_ldo_ops,
+		.type = REGULATOR_VOLTAGE,
+		.enable_reg = PM886_REG_LDO_EN1,
+		.enable_mask = BIT(0),
+		.volt_table = pm886_ldo_volt_table1,
+		.n_voltages = ARRAY_SIZE(pm886_ldo_volt_table1),
+		.vsel_reg = PM886_REG_LDO1_VOUT,
+		.vsel_mask = PM886_LDO_VSEL_MASK,
+	},
+	{
+		.name = "LDO2",
+		.regulators_node = "regulators",
+		.of_match = "ldo2",
+		.ops = &pm886_ldo_ops,
+		.type = REGULATOR_VOLTAGE,
+		.enable_reg = PM886_REG_LDO_EN1,
+		.enable_mask = BIT(1),
+		.volt_table = pm886_ldo_volt_table1,
+		.n_voltages = ARRAY_SIZE(pm886_ldo_volt_table1),
+		.vsel_reg = PM886_REG_LDO2_VOUT,
+		.vsel_mask = PM886_LDO_VSEL_MASK,
+	},
+	{
+		.name = "LDO3",
+		.regulators_node = "regulators",
+		.of_match = "ldo3",
+		.ops = &pm886_ldo_ops,
+		.type = REGULATOR_VOLTAGE,
+		.enable_reg = PM886_REG_LDO_EN1,
+		.enable_mask = BIT(2),
+		.volt_table = pm886_ldo_volt_table1,
+		.n_voltages = ARRAY_SIZE(pm886_ldo_volt_table1),
+		.vsel_reg = PM886_REG_LDO3_VOUT,
+		.vsel_mask = PM886_LDO_VSEL_MASK,
+	},
+	{
+		.name = "LDO4",
+		.regulators_node = "regulators",
+		.of_match = "ldo4",
+		.ops = &pm886_ldo_ops,
+		.type = REGULATOR_VOLTAGE,
+		.enable_reg = PM886_REG_LDO_EN1,
+		.enable_mask = BIT(3),
+		.volt_table = pm886_ldo_volt_table2,
+		.n_voltages = ARRAY_SIZE(pm886_ldo_volt_table2),
+		.vsel_reg = PM886_REG_LDO4_VOUT,
+		.vsel_mask = PM886_LDO_VSEL_MASK,
+	},
+	{
+		.name = "LDO5",
+		.regulators_node = "regulators",
+		.of_match = "ldo5",
+		.ops = &pm886_ldo_ops,
+		.type = REGULATOR_VOLTAGE,
+		.enable_reg = PM886_REG_LDO_EN1,
+		.enable_mask = BIT(4),
+		.volt_table = pm886_ldo_volt_table2,
+		.n_voltages = ARRAY_SIZE(pm886_ldo_volt_table2),
+		.vsel_reg = PM886_REG_LDO5_VOUT,
+		.vsel_mask = PM886_LDO_VSEL_MASK,
+	},
+	{
+		.name = "LDO6",
+		.regulators_node = "regulators",
+		.of_match = "ldo6",
+		.ops = &pm886_ldo_ops,
+		.type = REGULATOR_VOLTAGE,
+		.enable_reg = PM886_REG_LDO_EN1,
+		.enable_mask = BIT(5),
+		.volt_table = pm886_ldo_volt_table2,
+		.n_voltages = ARRAY_SIZE(pm886_ldo_volt_table2),
+		.vsel_reg = PM886_REG_LDO6_VOUT,
+		.vsel_mask = PM886_LDO_VSEL_MASK,
+	},
+	{
+		.name = "LDO7",
+		.regulators_node = "regulators",
+		.of_match = "ldo7",
+		.ops = &pm886_ldo_ops,
+		.type = REGULATOR_VOLTAGE,
+		.enable_reg = PM886_REG_LDO_EN1,
+		.enable_mask = BIT(6),
+		.volt_table = pm886_ldo_volt_table2,
+		.n_voltages = ARRAY_SIZE(pm886_ldo_volt_table2),
+		.vsel_reg = PM886_REG_LDO7_VOUT,
+		.vsel_mask = PM886_LDO_VSEL_MASK,
+	},
+	{
+		.name = "LDO8",
+		.regulators_node = "regulators",
+		.of_match = "ldo8",
+		.ops = &pm886_ldo_ops,
+		.type = REGULATOR_VOLTAGE,
+		.enable_reg = PM886_REG_LDO_EN1,
+		.enable_mask = BIT(7),
+		.volt_table = pm886_ldo_volt_table2,
+		.n_voltages = ARRAY_SIZE(pm886_ldo_volt_table2),
+		.vsel_reg = PM886_REG_LDO8_VOUT,
+		.vsel_mask = PM886_LDO_VSEL_MASK,
+	},
+	{
+		.name = "LDO9",
+		.regulators_node = "regulators",
+		.of_match = "ldo9",
+		.ops = &pm886_ldo_ops,
+		.type = REGULATOR_VOLTAGE,
+		.enable_reg = PM886_REG_LDO_EN2,
+		.enable_mask = BIT(0),
+		.volt_table = pm886_ldo_volt_table2,
+		.n_voltages = ARRAY_SIZE(pm886_ldo_volt_table2),
+		.vsel_reg = PM886_REG_LDO9_VOUT,
+		.vsel_mask = PM886_LDO_VSEL_MASK,
+	},
+	{
+		.name = "LDO10",
+		.regulators_node = "regulators",
+		.of_match = "ldo10",
+		.ops = &pm886_ldo_ops,
+		.type = REGULATOR_VOLTAGE,
+		.enable_reg = PM886_REG_LDO_EN2,
+		.enable_mask = BIT(1),
+		.volt_table = pm886_ldo_volt_table2,
+		.n_voltages = ARRAY_SIZE(pm886_ldo_volt_table2),
+		.vsel_reg = PM886_REG_LDO10_VOUT,
+		.vsel_mask = PM886_LDO_VSEL_MASK,
+	},
+	{
+		.name = "LDO11",
+		.regulators_node = "regulators",
+		.of_match = "ldo11",
+		.ops = &pm886_ldo_ops,
+		.type = REGULATOR_VOLTAGE,
+		.enable_reg = PM886_REG_LDO_EN2,
+		.enable_mask = BIT(2),
+		.volt_table = pm886_ldo_volt_table2,
+		.n_voltages = ARRAY_SIZE(pm886_ldo_volt_table2),
+		.vsel_reg = PM886_REG_LDO11_VOUT,
+		.vsel_mask = PM886_LDO_VSEL_MASK,
+	},
+	{
+		.name = "LDO12",
+		.regulators_node = "regulators",
+		.of_match = "ldo12",
+		.ops = &pm886_ldo_ops,
+		.type = REGULATOR_VOLTAGE,
+		.enable_reg = PM886_REG_LDO_EN2,
+		.enable_mask = BIT(3),
+		.volt_table = pm886_ldo_volt_table2,
+		.n_voltages = ARRAY_SIZE(pm886_ldo_volt_table2),
+		.vsel_reg = PM886_REG_LDO12_VOUT,
+		.vsel_mask = PM886_LDO_VSEL_MASK,
+	},
+	{
+		.name = "LDO13",
+		.regulators_node = "regulators",
+		.of_match = "ldo13",
+		.ops = &pm886_ldo_ops,
+		.type = REGULATOR_VOLTAGE,
+		.enable_reg = PM886_REG_LDO_EN2,
+		.enable_mask = BIT(4),
+		.volt_table = pm886_ldo_volt_table2,
+		.n_voltages = ARRAY_SIZE(pm886_ldo_volt_table2),
+		.vsel_reg = PM886_REG_LDO13_VOUT,
+		.vsel_mask = PM886_LDO_VSEL_MASK,
+	},
+	{
+		.name = "LDO14",
+		.regulators_node = "regulators",
+		.of_match = "ldo14",
+		.ops = &pm886_ldo_ops,
+		.type = REGULATOR_VOLTAGE,
+		.enable_reg = PM886_REG_LDO_EN2,
+		.enable_mask = BIT(5),
+		.volt_table = pm886_ldo_volt_table2,
+		.n_voltages = ARRAY_SIZE(pm886_ldo_volt_table2),
+		.vsel_reg = PM886_REG_LDO14_VOUT,
+		.vsel_mask = PM886_LDO_VSEL_MASK,
+	},
+	{
+		.name = "LDO15",
+		.regulators_node = "regulators",
+		.of_match = "ldo15",
+		.ops = &pm886_ldo_ops,
+		.type = REGULATOR_VOLTAGE,
+		.enable_reg = PM886_REG_LDO_EN2,
+		.enable_mask = BIT(6),
+		.volt_table = pm886_ldo_volt_table2,
+		.n_voltages = ARRAY_SIZE(pm886_ldo_volt_table2),
+		.vsel_reg = PM886_REG_LDO15_VOUT,
+		.vsel_mask = PM886_LDO_VSEL_MASK,
+	},
+	{
+		.name = "LDO16",
+		.regulators_node = "regulators",
+		.of_match = "ldo16",
+		.ops = &pm886_ldo_ops,
+		.type = REGULATOR_VOLTAGE,
+		.enable_reg = PM886_REG_LDO_EN2,
+		.enable_mask = BIT(7),
+		.volt_table = pm886_ldo_volt_table3,
+		.n_voltages = ARRAY_SIZE(pm886_ldo_volt_table3),
+		.vsel_reg = PM886_REG_LDO16_VOUT,
+		.vsel_mask = PM886_LDO_VSEL_MASK,
+	},
+	{
+		.name = "buck1",
+		.regulators_node = "regulators",
+		.of_match = "buck1",
+		.ops = &pm886_buck_ops,
+		.type = REGULATOR_VOLTAGE,
+		.n_voltages = 85,
+		.linear_ranges = pm886_buck_volt_ranges1,
+		.n_linear_ranges = ARRAY_SIZE(pm886_buck_volt_ranges1),
+		.vsel_reg = PM886_REG_BUCK1_VOUT,
+		.vsel_mask = PM886_BUCK_VSEL_MASK,
+		.enable_reg = PM886_REG_BUCK_EN,
+		.enable_mask = BIT(0),
+	},
+	{
+		.name = "buck2",
+		.regulators_node = "regulators",
+		.of_match = "buck2",
+		.ops = &pm886_buck_ops,
+		.type = REGULATOR_VOLTAGE,
+		.n_voltages = 115,
+		.linear_ranges = pm886_buck_volt_ranges2,
+		.n_linear_ranges = ARRAY_SIZE(pm886_buck_volt_ranges2),
+		.vsel_reg = PM886_REG_BUCK2_VOUT,
+		.vsel_mask = PM886_BUCK_VSEL_MASK,
+		.enable_reg = PM886_REG_BUCK_EN,
+		.enable_mask = BIT(1),
+	},
+	{
+		.name = "buck3",
+		.regulators_node = "regulators",
+		.of_match = "buck3",
+		.ops = &pm886_buck_ops,
+		.type = REGULATOR_VOLTAGE,
+		.n_voltages = 115,
+		.linear_ranges = pm886_buck_volt_ranges2,
+		.n_linear_ranges = ARRAY_SIZE(pm886_buck_volt_ranges2),
+		.vsel_reg = PM886_REG_BUCK3_VOUT,
+		.vsel_mask = PM886_BUCK_VSEL_MASK,
+		.enable_reg = PM886_REG_BUCK_EN,
+		.enable_mask = BIT(2),
+	},
+	{
+		.name = "buck4",
+		.regulators_node = "regulators",
+		.of_match = "buck4",
+		.ops = &pm886_buck_ops,
+		.type = REGULATOR_VOLTAGE,
+		.n_voltages = 115,
+		.linear_ranges = pm886_buck_volt_ranges2,
+		.n_linear_ranges = ARRAY_SIZE(pm886_buck_volt_ranges2),
+		.vsel_reg = PM886_REG_BUCK4_VOUT,
+		.vsel_mask = PM886_BUCK_VSEL_MASK,
+		.enable_reg = PM886_REG_BUCK_EN,
+		.enable_mask = BIT(3),
+	},
+	{
+		.name = "buck5",
+		.regulators_node = "regulators",
+		.of_match = "buck5",
+		.ops = &pm886_buck_ops,
+		.type = REGULATOR_VOLTAGE,
+		.n_voltages = 115,
+		.linear_ranges = pm886_buck_volt_ranges2,
+		.n_linear_ranges = ARRAY_SIZE(pm886_buck_volt_ranges2),
+		.vsel_reg = PM886_REG_BUCK5_VOUT,
+		.vsel_mask = PM886_BUCK_VSEL_MASK,
+		.enable_reg = PM886_REG_BUCK_EN,
+		.enable_mask = BIT(4),
+	},
+};
+
+static int pm886_regulator_probe(struct platform_device *pdev)
+{
+	struct pm886_chip *chip = dev_get_drvdata(pdev->dev.parent);
+	struct regulator_config rcfg = { };
+	struct device *dev = &pdev->dev;
+	struct regulator_desc *rdesc;
+	struct regulator_dev *rdev;
+	struct i2c_client *page;
+	struct regmap *regmap;
+
+	page = devm_i2c_new_dummy_device(dev, chip->client->adapter,
+			chip->client->addr + PM886_PAGE_OFFSET_REGULATORS);
+	if (IS_ERR(page))
+		return dev_err_probe(dev, PTR_ERR(page),
+				"Failed to initialize regulators client\n");
+
+	regmap = devm_regmap_init_i2c(page, &pm886_regulator_regmap_config);
+	if (IS_ERR(regmap))
+		return dev_err_probe(dev, PTR_ERR(regmap),
+				"Failed to initialize regulators regmap\n");
+	rcfg.regmap = regmap;
+
+	rcfg.dev = dev->parent;
+
+	for (int i = 0; i < ARRAY_SIZE(pm886_regulators); i++) {
+		rdesc = &pm886_regulators[i];
+		rdev = devm_regulator_register(dev, rdesc, &rcfg);
+		if (IS_ERR(rdev))
+			return dev_err_probe(dev, PTR_ERR(rdev),
+					"Failed to register %s\n", rdesc->name);
+	}
+
+	return 0;
+}
+
+static const struct platform_device_id pm886_regulator_id_table[] = {
+	{ "88pm886-regulator", },
+	{ }
+};
+MODULE_DEVICE_TABLE(platform, pm886_regulator_id_table);
+
+static struct platform_driver pm886_regulator_driver = {
+	.driver = {
+		.name = "88pm886-regulator",
+	},
+	.probe = pm886_regulator_probe,
+	.id_table = pm886_regulator_id_table,
+};
+module_platform_driver(pm886_regulator_driver);
+
+MODULE_DESCRIPTION("Marvell 88PM886 PMIC regulator driver");
+MODULE_AUTHOR("Karel Balej <balejk@matfyz.cz>");
+MODULE_LICENSE("GPL");
diff --git a/drivers/regulator/Kconfig b/drivers/regulator/Kconfig
index d333be2bea3b..ea6f17d451eb 100644
--- a/drivers/regulator/Kconfig
+++ b/drivers/regulator/Kconfig
@@ -91,6 +91,12 @@ config REGULATOR_88PM8607
 	help
 	  This driver supports 88PM8607 voltage regulator chips.
 
+config REGULATOR_88PM886
+	tristate "Marvell 88PM886 voltage regulators"
+	depends on MFD_88PM886_PMIC
+	help
+	  This driver implements support for Marvell 88PM886 voltage regulators.
+
 config REGULATOR_ACT8865
 	tristate "Active-semi act8865 voltage regulator"
 	depends on I2C
diff --git a/drivers/regulator/Makefile b/drivers/regulator/Makefile
index ba15fa5f30ad..0cce5517c85d 100644
--- a/drivers/regulator/Makefile
+++ b/drivers/regulator/Makefile
@@ -14,6 +14,7 @@ obj-$(CONFIG_REGULATOR_USERSPACE_CONSUMER) += userspace-consumer.o
 obj-$(CONFIG_REGULATOR_88PG86X) += 88pg86x.o
 obj-$(CONFIG_REGULATOR_88PM800) += 88pm800-regulator.o
 obj-$(CONFIG_REGULATOR_88PM8607) += 88pm8607.o
+obj-$(CONFIG_REGULATOR_88PM886) += 88pm886-regulator.o
 obj-$(CONFIG_REGULATOR_CROS_EC) += cros-ec-regulator.o
 obj-$(CONFIG_REGULATOR_CPCAP) += cpcap-regulator.o
 obj-$(CONFIG_REGULATOR_AAT2870) += aat2870-regulator.o
-- 
2.45.1


