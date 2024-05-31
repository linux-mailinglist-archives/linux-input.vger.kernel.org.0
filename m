Return-Path: <linux-input+bounces-3991-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 70CCB8D6880
	for <lists+linux-input@lfdr.de>; Fri, 31 May 2024 19:53:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id DC9A41F267C2
	for <lists+linux-input@lfdr.de>; Fri, 31 May 2024 17:53:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 16CCD17CA03;
	Fri, 31 May 2024 17:53:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mff.cuni.cz header.i=@mff.cuni.cz header.b="b/Q2i9+x"
X-Original-To: linux-input@vger.kernel.org
Received: from smtp1.ms.mff.cuni.cz (smtp-in1.ms.mff.cuni.cz [195.113.20.234])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B6ED717C21B;
	Fri, 31 May 2024 17:53:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.113.20.234
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717177988; cv=none; b=VKpUYYqzzVQ/eChG6drYn4LjgwXQlFeKu82wUlhspyLakxivc6t+8u9t8Sd7oKtAUZ1f7Qbo29/B9lqg2fkSrsfnj0gnekoJn6isDgqpYv7sj0j00qnHP2kRydkmSAaeSMQHrRF2q/0uPEFn/TMmEtIWzYgOMZmQX8P2ioY3qGw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717177988; c=relaxed/simple;
	bh=8pLla7YHQJEFC3T2V5+O/bW1GmULGrCyPJAloYr4K/A=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=EUlp8pik5GZpWQE9rQD+XVr3Ntc4idZRgsb2q4xSug8MbkaDdS8A7mM7DXGnicULQT2uOxK4mEuqJrSb4w+VBBAeMpWsk6rgk1TM9QHgKyBoTba7yZjoy+chL8ljImPeZdTzo/P/thv6ulg5a3wmSJW2//lkZ9WpYOb4vZxLXE8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=matfyz.cz; spf=pass smtp.mailfrom=matfyz.cz; dkim=pass (2048-bit key) header.d=mff.cuni.cz header.i=@mff.cuni.cz header.b=b/Q2i9+x; arc=none smtp.client-ip=195.113.20.234
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=matfyz.cz
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=matfyz.cz
X-SubmittedBy: id balejk@matfyz.cz subject /postalCode=110+2000/O=Univerzita+20Karlova/street=Ovocn+5CxC3+5CxBD+20trh+20560/5/ST=Praha,+20Hlavn+5CxC3+5CxAD+20m+5CxC4+5Cx9Bsto/C=CZ/CN=Karel+20Balej/emailAddress=balejk@matfyz.cz
	serial F5FD910E8FE2121B897F7E55B84E351D
	issued by /C=NL/O=GEANT+20Vereniging/CN=GEANT+20Personal+20CA+204
	auth type TLS.CUNI
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mff.cuni.cz;
	s=submission; t=1717177967; x=1718477967;
	bh=UAb1Nmiz4/Jw3gVlVHE7/eFlMym+Qf7ze7lCvipdmrQ=; h=From;
	b=b/Q2i9+xA6SE5tVT0mVcCixprYcGCgbhrtJHyid+QgQ6VtXEo/Arr0bvwGtn7e2dT
	 XK75LnYCueITT5azDyZsMLccnOz4pYumLkoz05fC1QISOlpZwrYtluSGymgTmBYnJx
	 jHcS4noQscwWHg9WGE83KE+DpMMYQQXZH3P63ovgqmF/SkSJ9kVzVBdELzanVlNW9n
	 j3ogM8fV+Asnt/C/VErHSQOJzBe1Gh/dzjsdqk0RYtKqj2/4/tYF8sA3DRWIoyMtaT
	 2VvHQw8oBMzOwpAjl6KV0i2Dp40+8Krt0zeHAAei3plHRwXpThRPynoX5Uo+UVP9sA
	 Mwv4Z7X10+YRg==
Received: from localhost (internet5.mraknet.com [185.200.108.250])
	(authenticated)
	by smtp1.ms.mff.cuni.cz (8.16.1/8.16.1) with ESMTPS id 44VHqkIU001115
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=OK);
	Fri, 31 May 2024 19:52:47 +0200 (CEST)
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
Subject: [PATCH v7 2/5] mfd: add driver for Marvell 88PM886 PMIC
Date: Fri, 31 May 2024 19:34:57 +0200
Message-ID: <20240531175109.15599-3-balejk@matfyz.cz>
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

Marvell 88PM886 is a PMIC which provides various functions such as
onkey, battery, charger and regulators. It is found for instance in the
samsung,coreprimevelte smartphone with which this was tested. Implement
basic support to allow for the use of regulators and onkey.

Signed-off-by: Karel Balej <balejk@matfyz.cz>
---

Notes:
    v6:
    - Address Lee's comments:
      - Don't break long line in the power off handler.
      - Set PLATFORM_DEVID_NONE. This should be safe with respect to
        collisions since there are no known devices with more than one of
        these PMICs, plus given their general purpose nature it is unlikely
        that there would ever be. Also include the corresponding header.
      - Move all defines to the header.
    - Give the base page's maximum register its real name.
    - Set irq_base to 0.
    v5:
    - Address Mark's feedback:
      - Move regmap config back out of the header and rename it. Also lower
        its maximum register based on what's actually used in the downstream
        code.
    RFC v4:
    - Use MFD_CELL_* macros.
    - Address Lee's feedback:
      - Do not define regmap_config.val_bits and .reg_bits.
      - Drop everything regulator related except mfd_cell (regmap
        initialization, IDs enum etc.). Drop pm886_initialize_subregmaps.
      - Do not store regmap pointers as an array as there is now only one
        regmap. Also drop the corresponding enum.
      - Move regmap_config to the header as it is needed in the regulators
        driver.
      - pm886_chip.whoami -> chip_id
      - Reword chip ID mismatch error message and print the ID as
        hexadecimal.
      - Fix includes in include/linux/88pm886.h.
      - Drop the pm886_irq_number enum and define the (for the moment) only
        IRQ explicitly.
    - Have only one MFD cell for all regulators as they are now registered
      all at once in the regulators driver.
    - Reword commit message.
    - Make device table static and remove comma after the sentinel to signal
      that nothing should come after it.
    RFC v3:
    - Drop onkey cell .of_compatible.
    - Rename LDO page offset and regmap to REGULATORS.
    RFC v2:
    - Remove some abstraction.
    - Sort includes alphabetically and add linux/of.h.
    - Depend on OF, remove of_match_ptr and add MODULE_DEVICE_TABLE.
    - Use more temporaries and break long lines.
    - Do not initialize ret in probe.
    - Use the wakeup-source DT property.
    - Rename ret to err.
    - Address Lee's comments:
      - Drop patched in presets for base regmap and related defines.
      - Use full sentences in comments.
      - Remove IRQ comment.
      - Define regmap_config member values.
      - Rename data to sys_off_data.
      - Add _PMIC suffix to Kconfig.
      - Use dev_err_probe.
      - Do not store irq_data.
      - s/WHOAMI/CHIP_ID
      - Drop LINUX part of include guard name.
      - Merge in the regulator series modifications in order to have more
        devices and modify the commit message accordingly. Changes with
        respect to the original regulator series patches:
        - ret -> err
        - Add temporary for dev in pm88x_initialize_subregmaps.
        - Drop of_compatible for the regulators.
        - Do not duplicate LDO regmap for bucks.
    - Rewrite commit message.

Friday late afternoon counts as a weekend too...

 drivers/mfd/88pm886.c       | 148 ++++++++++++++++++++++++++++++++++++
 drivers/mfd/Kconfig         |  12 +++
 drivers/mfd/Makefile        |   1 +
 include/linux/mfd/88pm886.h |  69 +++++++++++++++++
 4 files changed, 230 insertions(+)
 create mode 100644 drivers/mfd/88pm886.c
 create mode 100644 include/linux/mfd/88pm886.h

diff --git a/drivers/mfd/88pm886.c b/drivers/mfd/88pm886.c
new file mode 100644
index 000000000000..dbe9efc027d2
--- /dev/null
+++ b/drivers/mfd/88pm886.c
@@ -0,0 +1,148 @@
+// SPDX-License-Identifier: GPL-2.0-only
+#include <linux/i2c.h>
+#include <linux/mfd/core.h>
+#include <linux/module.h>
+#include <linux/notifier.h>
+#include <linux/of.h>
+#include <linux/platform_device.h>
+#include <linux/reboot.h>
+#include <linux/regmap.h>
+
+#include <linux/mfd/88pm886.h>
+
+static const struct regmap_config pm886_regmap_config = {
+	.reg_bits = 8,
+	.val_bits = 8,
+	.max_register = PM886_REG_RTC_SPARE6,
+};
+
+static struct regmap_irq pm886_regmap_irqs[] = {
+	REGMAP_IRQ_REG(PM886_IRQ_ONKEY, 0, PM886_INT_ENA1_ONKEY),
+};
+
+static struct regmap_irq_chip pm886_regmap_irq_chip = {
+	.name = "88pm886",
+	.irqs = pm886_regmap_irqs,
+	.num_irqs = ARRAY_SIZE(pm886_regmap_irqs),
+	.num_regs = 4,
+	.status_base = PM886_REG_INT_STATUS1,
+	.ack_base = PM886_REG_INT_STATUS1,
+	.unmask_base = PM886_REG_INT_ENA_1,
+};
+
+static struct resource pm886_onkey_resources[] = {
+	DEFINE_RES_IRQ_NAMED(PM886_IRQ_ONKEY, "88pm886-onkey"),
+};
+
+static struct mfd_cell pm886_devs[] = {
+	MFD_CELL_RES("88pm886-onkey", pm886_onkey_resources),
+	MFD_CELL_NAME("88pm886-regulator"),
+};
+
+static int pm886_power_off_handler(struct sys_off_data *sys_off_data)
+{
+	struct pm886_chip *chip = sys_off_data->cb_data;
+	struct regmap *regmap = chip->regmap;
+	struct device *dev = &chip->client->dev;
+	int err;
+
+	err = regmap_update_bits(regmap, PM886_REG_MISC_CONFIG1, PM886_SW_PDOWN, PM886_SW_PDOWN);
+	if (err) {
+		dev_err(dev, "Failed to power off the device: %d\n", err);
+		return NOTIFY_BAD;
+	}
+	return NOTIFY_DONE;
+}
+
+static int pm886_setup_irq(struct pm886_chip *chip,
+		struct regmap_irq_chip_data **irq_data)
+{
+	struct regmap *regmap = chip->regmap;
+	struct device *dev = &chip->client->dev;
+	int err;
+
+	/* Set interrupt clearing mode to clear on write. */
+	err = regmap_update_bits(regmap, PM886_REG_MISC_CONFIG2,
+			PM886_INT_INV | PM886_INT_CLEAR | PM886_INT_MASK_MODE,
+			PM886_INT_WC);
+	if (err) {
+		dev_err(dev, "Failed to set interrupt clearing mode: %d\n", err);
+		return err;
+	}
+
+	err = devm_regmap_add_irq_chip(dev, regmap, chip->client->irq,
+					IRQF_ONESHOT, 0, &pm886_regmap_irq_chip,
+					irq_data);
+	if (err) {
+		dev_err(dev, "Failed to request IRQ: %d\n", err);
+		return err;
+	}
+
+	return 0;
+}
+
+static int pm886_probe(struct i2c_client *client)
+{
+	struct regmap_irq_chip_data *irq_data;
+	struct device *dev = &client->dev;
+	struct pm886_chip *chip;
+	struct regmap *regmap;
+	unsigned int chip_id;
+	int err;
+
+	chip = devm_kzalloc(dev, sizeof(*chip), GFP_KERNEL);
+	if (!chip)
+		return -ENOMEM;
+
+	chip->client = client;
+	chip->chip_id = (uintptr_t)device_get_match_data(dev);
+	i2c_set_clientdata(client, chip);
+
+	regmap = devm_regmap_init_i2c(client, &pm886_regmap_config);
+	if (IS_ERR(regmap))
+		return dev_err_probe(dev, PTR_ERR(regmap), "Failed to initialize regmap\n");
+	chip->regmap = regmap;
+
+	err = regmap_read(regmap, PM886_REG_ID, &chip_id);
+	if (err)
+		return dev_err_probe(dev, err, "Failed to read chip ID\n");
+
+	if (chip->chip_id != chip_id)
+		return dev_err_probe(dev, -EINVAL, "Unsupported chip: 0x%x\n", chip_id);
+
+	err = pm886_setup_irq(chip, &irq_data);
+	if (err)
+		return err;
+
+	err = devm_mfd_add_devices(dev, PLATFORM_DEVID_NONE, pm886_devs, ARRAY_SIZE(pm886_devs),
+				NULL, 0, regmap_irq_get_domain(irq_data));
+	if (err)
+		return dev_err_probe(dev, err, "Failed to add devices\n");
+
+	err = devm_register_power_off_handler(dev, pm886_power_off_handler, chip);
+	if (err)
+		return dev_err_probe(dev, err, "Failed to register power off handler\n");
+
+	device_init_wakeup(dev, device_property_read_bool(dev, "wakeup-source"));
+
+	return 0;
+}
+
+static const struct of_device_id pm886_of_match[] = {
+	{ .compatible = "marvell,88pm886-a1", .data = (void *)PM886_A1_CHIP_ID },
+	{ }
+};
+MODULE_DEVICE_TABLE(of, pm886_of_match);
+
+static struct i2c_driver pm886_i2c_driver = {
+	.driver = {
+		.name = "88pm886",
+		.of_match_table = pm886_of_match,
+	},
+	.probe = pm886_probe,
+};
+module_i2c_driver(pm886_i2c_driver);
+
+MODULE_DESCRIPTION("Marvell 88PM886 PMIC driver");
+MODULE_AUTHOR("Karel Balej <balejk@matfyz.cz>");
+MODULE_LICENSE("GPL");
diff --git a/drivers/mfd/Kconfig b/drivers/mfd/Kconfig
index 266b4f54af60..96c0019b14c1 100644
--- a/drivers/mfd/Kconfig
+++ b/drivers/mfd/Kconfig
@@ -794,6 +794,18 @@ config MFD_88PM860X
 	  select individual components like voltage regulators, RTC and
 	  battery-charger under the corresponding menus.
 
+config MFD_88PM886_PMIC
+	bool "Marvell 88PM886 PMIC"
+	depends on I2C=y
+	depends on OF
+	select REGMAP_I2C
+	select REGMAP_IRQ
+	select MFD_CORE
+	help
+	  This enables support for Marvell 88PM886 Power Management IC.
+	  This includes the I2C driver and the core APIs _only_, you have to
+	  select individual components like onkey under the corresponding menus.
+
 config MFD_MAX14577
 	tristate "Maxim Semiconductor MAX14577/77836 MUIC + Charger Support"
 	depends on I2C
diff --git a/drivers/mfd/Makefile b/drivers/mfd/Makefile
index c66f07edcd0e..d016b7fed354 100644
--- a/drivers/mfd/Makefile
+++ b/drivers/mfd/Makefile
@@ -7,6 +7,7 @@
 obj-$(CONFIG_MFD_88PM860X)	+= 88pm860x.o
 obj-$(CONFIG_MFD_88PM800)	+= 88pm800.o 88pm80x.o
 obj-$(CONFIG_MFD_88PM805)	+= 88pm805.o 88pm80x.o
+obj-$(CONFIG_MFD_88PM886_PMIC)	+= 88pm886.o
 obj-$(CONFIG_MFD_ACT8945A)	+= act8945a.o
 obj-$(CONFIG_MFD_SM501)		+= sm501.o
 obj-$(CONFIG_ARCH_BCM2835)	+= bcm2835-pm.o
diff --git a/include/linux/mfd/88pm886.h b/include/linux/mfd/88pm886.h
new file mode 100644
index 000000000000..133aa302e492
--- /dev/null
+++ b/include/linux/mfd/88pm886.h
@@ -0,0 +1,69 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+#ifndef __MFD_88PM886_H
+#define __MFD_88PM886_H
+
+#include <linux/i2c.h>
+#include <linux/regmap.h>
+
+#define PM886_A1_CHIP_ID		0xa1
+
+#define PM886_IRQ_ONKEY			0
+
+#define PM886_PAGE_OFFSET_REGULATORS	1
+
+#define PM886_REG_ID			0x00
+
+#define PM886_REG_STATUS1		0x01
+#define PM886_ONKEY_STS1		BIT(0)
+
+#define PM886_REG_INT_STATUS1		0x05
+
+#define PM886_REG_INT_ENA_1		0x0a
+#define PM886_INT_ENA1_ONKEY		BIT(0)
+
+#define PM886_REG_MISC_CONFIG1		0x14
+#define PM886_SW_PDOWN			BIT(5)
+
+#define PM886_REG_MISC_CONFIG2		0x15
+#define PM886_INT_INV			BIT(0)
+#define PM886_INT_CLEAR			BIT(1)
+#define PM886_INT_RC			0x00
+#define PM886_INT_WC			BIT(1)
+#define PM886_INT_MASK_MODE		BIT(2)
+
+#define PM886_REG_RTC_SPARE6		0xef
+
+#define PM886_REG_BUCK_EN		0x08
+#define PM886_REG_LDO_EN1		0x09
+#define PM886_REG_LDO_EN2		0x0a
+#define PM886_REG_LDO1_VOUT		0x20
+#define PM886_REG_LDO2_VOUT		0x26
+#define PM886_REG_LDO3_VOUT		0x2c
+#define PM886_REG_LDO4_VOUT		0x32
+#define PM886_REG_LDO5_VOUT		0x38
+#define PM886_REG_LDO6_VOUT		0x3e
+#define PM886_REG_LDO7_VOUT		0x44
+#define PM886_REG_LDO8_VOUT		0x4a
+#define PM886_REG_LDO9_VOUT		0x50
+#define PM886_REG_LDO10_VOUT		0x56
+#define PM886_REG_LDO11_VOUT		0x5c
+#define PM886_REG_LDO12_VOUT		0x62
+#define PM886_REG_LDO13_VOUT		0x68
+#define PM886_REG_LDO14_VOUT		0x6e
+#define PM886_REG_LDO15_VOUT		0x74
+#define PM886_REG_LDO16_VOUT		0x7a
+#define PM886_REG_BUCK1_VOUT		0xa5
+#define PM886_REG_BUCK2_VOUT		0xb3
+#define PM886_REG_BUCK3_VOUT		0xc1
+#define PM886_REG_BUCK4_VOUT		0xcf
+#define PM886_REG_BUCK5_VOUT		0xdd
+
+#define PM886_LDO_VSEL_MASK		0x0f
+#define PM886_BUCK_VSEL_MASK		0x7f
+
+struct pm886_chip {
+	struct i2c_client *client;
+	unsigned int chip_id;
+	struct regmap *regmap;
+};
+#endif /* __MFD_88PM886_H */
-- 
2.45.1


