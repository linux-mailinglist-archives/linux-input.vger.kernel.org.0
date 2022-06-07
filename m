Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3859A53F5AE
	for <lists+linux-input@lfdr.de>; Tue,  7 Jun 2022 07:53:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236826AbiFGFxB (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 7 Jun 2022 01:53:01 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58702 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230090AbiFGFw7 (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Tue, 7 Jun 2022 01:52:59 -0400
Received: from mail-pl1-x62c.google.com (mail-pl1-x62c.google.com [IPv6:2607:f8b0:4864:20::62c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A654BB7CA;
        Mon,  6 Jun 2022 22:52:58 -0700 (PDT)
Received: by mail-pl1-x62c.google.com with SMTP id n18so13949296plg.5;
        Mon, 06 Jun 2022 22:52:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=2/GoM1jfi/UIwE4ZS/NfUxugSLpF5Je+ue1UXnm4wFk=;
        b=Pmd2QBt3orXmxAP2R/HjDVpi6TbZMLNm2Hiz6k91mMD63yeHvLj5PsTjorTHgET06K
         MOt/cT2HMGUJIh1aCF8yAWODoWJxa0cbbLWcdtl0cFuKkeL2N+pM9rMuTiusFqPkQ6SK
         ///2UHP9CVYg36JjeYb9Zp5k6MiiwxrAwWooY3u3qWaG54Rk+R4++WYyVt/fFviPssho
         TYsVH8FIvP59hlGQIZeae3qlgf1StGKWqWmHCo6er1nJSy204PrfRfqbfAeWZg8UJ9dr
         RmJsV2N97DbO4vUSN/yAoiylKblAEifpqA+kFDEFughohqiiCXDZpju3fEewCGJkLgWO
         EgTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=2/GoM1jfi/UIwE4ZS/NfUxugSLpF5Je+ue1UXnm4wFk=;
        b=6CtvWHFTGAjOTdiRK+pUuyilnEuWDtR377UBUfqZN7bnDMKoAFhVz9/jcPcPjGjRUp
         PtTzzKF8yC+1hphkNZHEHyg19xr/Nu0Dg1VvFzIc+B20bikIIzw2ifgj3xKpsy45dlGf
         8CnlZvG4YjyUusMBpifL7X6hJsalVf7wvOGcjleQ3Ru0x5Ahu7LLeEIjqJV6OtXqgTVR
         C5wipWxorEhvdwywfixdvBrp/xOaufaje9GPQ/6fUBVuL7/hyvR0ZpFG+7c7U9xFKKya
         eD7PiliDeqrIUCDnU3v0nt7CnU0Pxuo8mLjfY6xssLS+zG4Ka7HP+ezmTarFI/5BCaW4
         RGtA==
X-Gm-Message-State: AOAM531SHg/w80pUDRM7KOr6HgKuJLc19aj2gElFI7OJQZYulMcLUY3n
        wefmlIY4E/PsNI1x69KVWBi7d/lbwWs=
X-Google-Smtp-Source: ABdhPJzZBhVuc5H3kpiKe0WsQ1PhN2QALZOKtXyxGCrapavTK7Vt9qOEXHVo+GrLrWtsUDuKj5Ed9w==
X-Received: by 2002:a17:902:f2ca:b0:167:8898:bad0 with SMTP id h10-20020a170902f2ca00b001678898bad0mr5578407plc.170.1654581177971;
        Mon, 06 Jun 2022 22:52:57 -0700 (PDT)
Received: from localhost.localdomain ([49.216.54.77])
        by smtp.gmail.com with ESMTPSA id z41-20020a056a001da900b0051b62689ec2sm9203520pfw.129.2022.06.06.22.52.54
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 06 Jun 2022 22:52:57 -0700 (PDT)
From:   cy_huang <u0084500@gmail.com>
To:     robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
        lee.jones@linaro.org, broonie@kernel.org, dmitry.torokhov@gmail.com
Cc:     lgirdwood@gmail.com, cy_huang@richtek.com,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-input@vger.kernel.org
Subject: [PATCH 2/4] mfd: rt5120: Add Richtek PMIC support
Date:   Tue,  7 Jun 2022 13:52:39 +0800
Message-Id: <1654581161-12349-3-git-send-email-u0084500@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1654581161-12349-1-git-send-email-u0084500@gmail.com>
References: <1654581161-12349-1-git-send-email-u0084500@gmail.com>
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

Add Richtek RT5120 PMIC I2C driver.

Signed-off-by: ChiYuan Huang <cy_huang@richtek.com>
---
 drivers/mfd/Kconfig  |  12 +++++
 drivers/mfd/Makefile |   1 +
 drivers/mfd/rt5120.c | 125 +++++++++++++++++++++++++++++++++++++++++++++++++++
 3 files changed, 138 insertions(+)
 create mode 100644 drivers/mfd/rt5120.c

diff --git a/drivers/mfd/Kconfig b/drivers/mfd/Kconfig
index 3b59456..866619c 100644
--- a/drivers/mfd/Kconfig
+++ b/drivers/mfd/Kconfig
@@ -1127,6 +1127,18 @@ config MFD_RT5033
 	  sub-devices like charger, fuel gauge, flash LED, current source,
 	  LDO and Buck.
 
+config MFD_RT5120
+	tristate "Richtek RT5120 Power Management IC"
+	depends on I2C
+	select MFD_CORE
+	select REGMAP_I2C
+	select REGMAP_IRQ
+	help
+	  The enables support for Richtek RT5120 PMIC. It includes four high
+	  efficiency buck converters and one LDO voltage regulator. The device
+	  is targeted at providing the CPU voltage, memory, I/O and peripheral
+	  power rails in home entertainment devices.
+
 config MFD_RC5T583
 	bool "Ricoh RC5T583 Power Management system device"
 	depends on I2C=y
diff --git a/drivers/mfd/Makefile b/drivers/mfd/Makefile
index 858cacf..27e8add 100644
--- a/drivers/mfd/Makefile
+++ b/drivers/mfd/Makefile
@@ -234,6 +234,7 @@ obj-$(CONFIG_MFD_HI655X_PMIC)   += hi655x-pmic.o
 obj-$(CONFIG_MFD_DLN2)		+= dln2.o
 obj-$(CONFIG_MFD_RT4831)	+= rt4831.o
 obj-$(CONFIG_MFD_RT5033)	+= rt5033.o
+obj-$(CONFIG_MFD_RT5120)	+= rt5120.o
 obj-$(CONFIG_MFD_SKY81452)	+= sky81452.o
 
 intel-soc-pmic-objs		:= intel_soc_pmic_core.o intel_soc_pmic_crc.o
diff --git a/drivers/mfd/rt5120.c b/drivers/mfd/rt5120.c
new file mode 100644
index 00000000..e7c5f3c
--- /dev/null
+++ b/drivers/mfd/rt5120.c
@@ -0,0 +1,125 @@
+// SPDX-License-Identifier: GPL-2.0+
+
+#include <linux/i2c.h>
+#include <linux/kernel.h>
+#include <linux/mfd/core.h>
+#include <linux/module.h>
+#include <linux/mod_devicetable.h>
+#include <linux/regmap.h>
+
+#define RT5120_REG_INTENABLE	0x1D
+#define RT5120_REG_INTSTAT	0x1E
+#define RT5120_REG_FZCMODE	0x44
+
+#define RT5120_INT_HOTDIE	0
+#define RT5120_INT_PWRKEY_REL	5
+#define RT5120_INT_PWRKEY_PRESS	6
+
+static const struct regmap_range rt5120_rd_yes_ranges[] = {
+	regmap_reg_range(0x03, 0x13),
+	regmap_reg_range(0x1c, 0x20),
+	regmap_reg_range(0x44, 0x44)
+};
+
+static const struct regmap_range rt5120_wr_yes_ranges[] = {
+	regmap_reg_range(0x06, 0x13),
+	regmap_reg_range(0x1c, 0x20),
+	regmap_reg_range(0x44, 0x44)
+};
+
+static const struct regmap_access_table rt5120_rd_table = {
+	.yes_ranges = rt5120_rd_yes_ranges,
+	.n_yes_ranges = ARRAY_SIZE(rt5120_rd_yes_ranges),
+};
+
+static const struct regmap_access_table rt5120_wr_table = {
+	.yes_ranges = rt5120_wr_yes_ranges,
+	.n_yes_ranges = ARRAY_SIZE(rt5120_wr_yes_ranges),
+};
+
+static const struct regmap_config rt5120_regmap_config = {
+	.reg_bits = 8,
+	.val_bits = 8,
+	.max_register = RT5120_REG_FZCMODE,
+
+	.wr_table = &rt5120_wr_table,
+	.rd_table = &rt5120_rd_table,
+};
+
+static const struct regmap_irq rt5120_irqs[] = {
+	REGMAP_IRQ_REG_LINE(RT5120_INT_HOTDIE, 8),
+	REGMAP_IRQ_REG_LINE(RT5120_INT_PWRKEY_REL, 8),
+	REGMAP_IRQ_REG_LINE(RT5120_INT_PWRKEY_PRESS, 8)
+};
+
+static const struct regmap_irq_chip rt5120_irq_chip = {
+	.name = "rt5120-pmic",
+	.status_base = RT5120_REG_INTSTAT,
+	.mask_base = RT5120_REG_INTENABLE,
+	.ack_base = RT5120_REG_INTSTAT,
+	.mask_invert = true,
+	.use_ack = true,
+	.num_regs = 1,
+	.irqs = rt5120_irqs,
+	.num_irqs = ARRAY_SIZE(rt5120_irqs),
+};
+
+static const struct resource rt5120_regulator_resources[] = {
+	DEFINE_RES_IRQ(RT5120_INT_HOTDIE)
+};
+
+static const struct resource rt5120_pwrkey_resources[] = {
+	DEFINE_RES_IRQ_NAMED(RT5120_INT_PWRKEY_PRESS, "pwrkey-press"),
+	DEFINE_RES_IRQ_NAMED(RT5120_INT_PWRKEY_REL, "pwrkey-release")
+};
+
+static const struct mfd_cell rt5120_devs[] = {
+	MFD_CELL_RES("rt5120-regulator", rt5120_regulator_resources),
+	MFD_CELL_OF("rt5120-pwrkey", rt5120_pwrkey_resources, NULL, 0, 0,
+		    "richtek,rt5120-pwrkey")
+};
+
+static int rt5120_probe(struct i2c_client *i2c)
+{
+	struct regmap *regmap;
+	struct regmap_irq_chip_data *irq_data;
+	int ret;
+
+	regmap = devm_regmap_init_i2c(i2c, &rt5120_regmap_config);
+	if (IS_ERR(regmap)) {
+		ret = PTR_ERR(regmap);
+		dev_err(&i2c->dev, "Failed to init regmap (%d)\n", ret);
+		return ret;
+	}
+
+	ret = devm_regmap_add_irq_chip(&i2c->dev, regmap, i2c->irq,
+				       IRQF_ONESHOT, 0, &rt5120_irq_chip,
+				       &irq_data);
+	if (ret) {
+		dev_err(&i2c->dev, "Failed to add irq chip (%d)\n", ret);
+		return ret;
+	}
+
+	return devm_mfd_add_devices(&i2c->dev, PLATFORM_DEVID_AUTO, rt5120_devs,
+				    ARRAY_SIZE(rt5120_devs), NULL, 0,
+				    regmap_irq_get_domain(irq_data));
+}
+
+static const struct of_device_id rt5120_device_match_table[] = {
+	{ .compatible = "richtek,rt5120", },
+	{}
+};
+MODULE_DEVICE_TABLE(of, rt5120_device_match_table);
+
+static struct i2c_driver rt5120_driver = {
+	.driver = {
+		.name = "rt5120",
+		.of_match_table = rt5120_device_match_table,
+	},
+	.probe_new = rt5120_probe,
+};
+module_i2c_driver(rt5120_driver);
+
+MODULE_AUTHOR("ChiYuan Huang <cy_huang@richtek.com>");
+MODULE_DESCRIPTION("Richtek RT5120 I2C driver");
+MODULE_LICENSE("GPL v2");
-- 
2.7.4

