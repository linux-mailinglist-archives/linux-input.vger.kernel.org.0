Return-Path: <linux-input+bounces-4138-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id EA6E38FD038
	for <lists+linux-input@lfdr.de>; Wed,  5 Jun 2024 15:56:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 6EA0C29CC11
	for <lists+linux-input@lfdr.de>; Wed,  5 Jun 2024 13:56:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CE20518FC7D;
	Wed,  5 Jun 2024 13:53:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b="OlnJq670"
X-Original-To: linux-input@vger.kernel.org
Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com [67.231.152.168])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA0C623D7;
	Wed,  5 Jun 2024 13:53:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=67.231.152.168
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717595622; cv=none; b=QTjUANCB6/svog0z3rNKrzCRMpz+bdllKyEVyqaWvNF333tntLI6mgKyJdAZpuIrRKbXFfv3HkF8mfo6bN5uw2DfEvVq8T7Rhz978EYABh34cFU1Wm66sE8wMOTsCPgFFlE3dUt0T6Hpz2B7q9bTg+BY37+HFkVOIBqzA5H+e4U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717595622; c=relaxed/simple;
	bh=LKJ7VXE54FqB/qglpGmQAblLvtb5OVnPam+GE61ApjI=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=ibKniBg6e4AQxAREvLVFwmMvaT/NxrxnhxOAPscelDABer+uNOJ4/SHQToeNwkIoyurxFQqOFEVewHYtJTpCEcWiVd+MmQOgseVwDJedGf2SOFWeutXmP3MvHwZkqLRvlq6p0chnWKNyoEh3ZzWVy5ft6eoTP3daReRWcDwGUmE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com; spf=pass smtp.mailfrom=opensource.cirrus.com; dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b=OlnJq670; arc=none smtp.client-ip=67.231.152.168
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
	by mx0b-001ae601.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4555KehI005669;
	Wed, 5 Jun 2024 08:53:19 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	PODMain02222019; bh=UJfdGTXpPwbxVy8lb39M/ipM9VuycVCO6sw7OZgoiSs=; b=
	OlnJq670632PtZa7zn615I8I8ncMZN6cXxKuwTQw2wXzwSsb4gC+I9iqDdmIsc0d
	R8ObxFUtyiDylqDjsBaQJtR/QWk4lZ1xnIeswVPBPtmCyGRK0hv7Et7xwQUwoiqe
	m7vkM375fKOOA/imt10YENqrbk7prB9wntJLeXtOcuSiLZE0JnfFZuUHLnsKzEn4
	88s5W7UDwWd7EqtnTfW+Uih0TTT/E0Xf++cHiBYuvzeG4xhUEIKRflKCxxVS3sdY
	kARvgpkW9Mgm3ISQowG5fLUzg9tJgvIFHM4X/x2cuaze8X5vbt1ckPxrGtWRQAzR
	ojQMvmdXI2ibCeqZ68rMPQ==
Received: from ediex02.ad.cirrus.com ([84.19.233.68])
	by mx0b-001ae601.pphosted.com (PPS) with ESMTPS id 3yg02hm0m0-3
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 05 Jun 2024 08:53:19 -0500 (CDT)
Received: from ediex02.ad.cirrus.com (198.61.84.81) by ediex02.ad.cirrus.com
 (198.61.84.81) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Wed, 5 Jun 2024
 14:53:06 +0100
Received: from ediswmail9.ad.cirrus.com (198.61.86.93) by
 anon-ediex02.ad.cirrus.com (198.61.84.81) with Microsoft SMTP Server id
 15.2.1544.9 via Frontend Transport; Wed, 5 Jun 2024 14:53:06 +0100
Received: from aus-sw-rshr002.ad.cirrus.com (aus-sw-rshr002.ad.cirrus.com [141.131.145.42])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTP id 3AF78820249;
	Wed,  5 Jun 2024 13:53:04 +0000 (UTC)
From: James Ogletree <jogletre@opensource.cirrus.com>
To: <dmitry.torokhov@gmail.com>, <robh+dt@kernel.org>,
        <krzysztof.kozlowski+dt@linaro.org>, <conor+dt@kernel.org>,
        <lee@kernel.org>, <broonie@kernel.org>, <jeff@labundy.com>
CC: <patches@opensource.cirrus.com>, <linux-sound@vger.kernel.org>,
        <linux-input@vger.kernel.org>, <devicetree@vger.kernel.org>,
        James Ogletree
	<jogletre@opensource.cirrus.com>
Subject: [PATCH v11 3/5] mfd: cs40l50: Add support for CS40L50 core driver
Date: Wed, 5 Jun 2024 13:52:47 +0000
Message-ID: <20240605135249.361082-4-jogletre@opensource.cirrus.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240605135249.361082-1-jogletre@opensource.cirrus.com>
References: <20240605135249.361082-1-jogletre@opensource.cirrus.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-GUID: osdUh-Rt8VCeV-HbxH58c8azjnAzyj-J
X-Proofpoint-ORIG-GUID: osdUh-Rt8VCeV-HbxH58c8azjnAzyj-J
X-Proofpoint-Spam-Reason: safe

Introduce support for Cirrus Logic Device CS40L50: a
haptic driver with waveform memory, integrated DSP,
and closed-loop algorithms.

The MFD component registers and initializes the device.

Signed-off-by: James Ogletree <jogletre@opensource.cirrus.com>
---
 MAINTAINERS                 |   2 +
 drivers/mfd/Kconfig         |  30 ++
 drivers/mfd/Makefile        |   4 +
 drivers/mfd/cs40l50-core.c  | 570 ++++++++++++++++++++++++++++++++++++
 drivers/mfd/cs40l50-i2c.c   |  68 +++++
 drivers/mfd/cs40l50-spi.c   |  68 +++++
 include/linux/mfd/cs40l50.h | 137 +++++++++
 7 files changed, 879 insertions(+)
 create mode 100644 drivers/mfd/cs40l50-core.c
 create mode 100644 drivers/mfd/cs40l50-i2c.c
 create mode 100644 drivers/mfd/cs40l50-spi.c
 create mode 100644 include/linux/mfd/cs40l50.h

diff --git a/MAINTAINERS b/MAINTAINERS
index 862a18e3fc7b..e804f3766cba 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -4940,6 +4940,8 @@ M:	Ben Bright <ben.bright@cirrus.com>
 L:	patches@opensource.cirrus.com
 S:	Supported
 F:	Documentation/devicetree/bindings/input/cirrus,cs40l50.yaml
+F:	drivers/mfd/cs40l*
+F:	include/linux/mfd/cs40l*
 
 CIRRUS LOGIC DSP FIRMWARE DRIVER
 M:	Simon Trimmer <simont@opensource.cirrus.com>
diff --git a/drivers/mfd/Kconfig b/drivers/mfd/Kconfig
index 90ce58fd629e..6273c255f107 100644
--- a/drivers/mfd/Kconfig
+++ b/drivers/mfd/Kconfig
@@ -2241,6 +2241,36 @@ config MCP_UCB1200_TS
 
 endmenu
 
+config MFD_CS40L50_CORE
+	tristate
+	select MFD_CORE
+	select FW_CS_DSP
+	select REGMAP_IRQ
+
+config MFD_CS40L50_I2C
+	tristate "Cirrus Logic CS40L50 (I2C)"
+	select REGMAP_I2C
+	select MFD_CS40L50_CORE
+	depends on I2C
+	help
+	  Select this to support the Cirrus Logic CS40L50 Haptic
+	  Driver over I2C.
+
+	  This driver can be built as a module. If built as a module it will be
+	  called "cs40l50-i2c".
+
+config MFD_CS40L50_SPI
+	tristate "Cirrus Logic CS40L50 (SPI)"
+	select REGMAP_SPI
+	select MFD_CS40L50_CORE
+	depends on SPI
+	help
+	  Select this to support the Cirrus Logic CS40L50 Haptic
+	  Driver over SPI.
+
+	  This driver can be built as a module. If built as a module it will be
+	  called "cs40l50-spi".
+
 config MFD_VEXPRESS_SYSREG
 	tristate "Versatile Express System Registers"
 	depends on VEXPRESS_CONFIG && GPIOLIB
diff --git a/drivers/mfd/Makefile b/drivers/mfd/Makefile
index c66f07edcd0e..a8d18ba155d0 100644
--- a/drivers/mfd/Makefile
+++ b/drivers/mfd/Makefile
@@ -88,6 +88,10 @@ obj-$(CONFIG_MFD_MADERA)	+= madera.o
 obj-$(CONFIG_MFD_MADERA_I2C)	+= madera-i2c.o
 obj-$(CONFIG_MFD_MADERA_SPI)	+= madera-spi.o
 
+obj-$(CONFIG_MFD_CS40L50_CORE)	+= cs40l50-core.o
+obj-$(CONFIG_MFD_CS40L50_I2C)	+= cs40l50-i2c.o
+obj-$(CONFIG_MFD_CS40L50_SPI)	+= cs40l50-spi.o
+
 obj-$(CONFIG_TPS6105X)		+= tps6105x.o
 obj-$(CONFIG_TPS65010)		+= tps65010.o
 obj-$(CONFIG_TPS6507X)		+= tps6507x.o
diff --git a/drivers/mfd/cs40l50-core.c b/drivers/mfd/cs40l50-core.c
new file mode 100644
index 000000000000..26e7a769eb14
--- /dev/null
+++ b/drivers/mfd/cs40l50-core.c
@@ -0,0 +1,570 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * CS40L50 Advanced Haptic Driver with waveform memory,
+ * integrated DSP, and closed-loop algorithms
+ *
+ * Copyright 2024 Cirrus Logic, Inc.
+ *
+ * Author: James Ogletree <james.ogletree@cirrus.com>
+ */
+
+#include <linux/firmware/cirrus/cs_dsp.h>
+#include <linux/firmware/cirrus/wmfw.h>
+#include <linux/mfd/core.h>
+#include <linux/mfd/cs40l50.h>
+#include <linux/pm_runtime.h>
+#include <linux/regulator/consumer.h>
+
+static const struct mfd_cell cs40l50_devs[] = {
+	{ .name = "cs40l50-codec", },
+	{ .name = "cs40l50-vibra", },
+};
+
+const struct regmap_config cs40l50_regmap = {
+	.reg_bits =		32,
+	.reg_stride =		4,
+	.val_bits =		32,
+	.reg_format_endian =	REGMAP_ENDIAN_BIG,
+	.val_format_endian =	REGMAP_ENDIAN_BIG,
+};
+EXPORT_SYMBOL_GPL(cs40l50_regmap);
+
+static const char * const cs40l50_supplies[] = {
+	"vdd-io",
+};
+
+static const struct regmap_irq cs40l50_reg_irqs[] = {
+	REGMAP_IRQ_REG(CS40L50_DSP_QUEUE_IRQ, CS40L50_IRQ1_INT_2_OFFSET,
+		       CS40L50_DSP_QUEUE_MASK),
+	REGMAP_IRQ_REG(CS40L50_AMP_SHORT_IRQ, CS40L50_IRQ1_INT_1_OFFSET,
+		       CS40L50_AMP_SHORT_MASK),
+	REGMAP_IRQ_REG(CS40L50_TEMP_ERR_IRQ, CS40L50_IRQ1_INT_8_OFFSET,
+		       CS40L50_TEMP_ERR_MASK),
+	REGMAP_IRQ_REG(CS40L50_BST_UVP_IRQ, CS40L50_IRQ1_INT_9_OFFSET,
+		       CS40L50_BST_UVP_MASK),
+	REGMAP_IRQ_REG(CS40L50_BST_SHORT_IRQ, CS40L50_IRQ1_INT_9_OFFSET,
+		       CS40L50_BST_SHORT_MASK),
+	REGMAP_IRQ_REG(CS40L50_BST_ILIMIT_IRQ, CS40L50_IRQ1_INT_9_OFFSET,
+		       CS40L50_BST_ILIMIT_MASK),
+	REGMAP_IRQ_REG(CS40L50_UVLO_VDDBATT_IRQ, CS40L50_IRQ1_INT_10_OFFSET,
+		       CS40L50_UVLO_VDDBATT_MASK),
+	REGMAP_IRQ_REG(CS40L50_GLOBAL_ERROR_IRQ, CS40L50_IRQ1_INT_18_OFFSET,
+		       CS40L50_GLOBAL_ERROR_MASK),
+};
+
+static struct regmap_irq_chip cs40l50_irq_chip = {
+	.name =		"cs40l50",
+	.status_base =	CS40L50_IRQ1_INT_1,
+	.mask_base =	CS40L50_IRQ1_MASK_1,
+	.ack_base =	CS40L50_IRQ1_INT_1,
+	.num_regs =	22,
+	.irqs =		cs40l50_reg_irqs,
+	.num_irqs =	ARRAY_SIZE(cs40l50_reg_irqs),
+	.runtime_pm =	true,
+};
+
+int cs40l50_dsp_write(struct device *dev, struct regmap *regmap, u32 val)
+{
+	int i, ret;
+	u32 ack;
+
+	/* Device NAKs if hibernating, so optionally retry */
+	for (i = 0; i < CS40L50_DSP_TIMEOUT_COUNT; i++) {
+		ret = regmap_write(regmap, CS40L50_DSP_QUEUE, val);
+		if (!ret)
+			break;
+
+		usleep_range(CS40L50_DSP_POLL_US, CS40L50_DSP_POLL_US + 100);
+	}
+
+	/* If the write never took place, no need to check for the ACK */
+	if (i == CS40L50_DSP_TIMEOUT_COUNT) {
+		dev_err(dev, "Timed out writing %#X to DSP: %d\n", val, ret);
+		return ret;
+	}
+
+	ret = regmap_read_poll_timeout(regmap, CS40L50_DSP_QUEUE, ack, !ack,
+				       CS40L50_DSP_POLL_US,
+				       CS40L50_DSP_POLL_US * CS40L50_DSP_TIMEOUT_COUNT);
+	if (ret)
+		dev_err(dev, "DSP failed to ACK %#X: %d\n", val, ret);
+
+	return ret;
+}
+EXPORT_SYMBOL_GPL(cs40l50_dsp_write);
+
+static const struct cs_dsp_region cs40l50_dsp_regions[] = {
+	{ .type = WMFW_HALO_PM_PACKED, .base = CS40L50_PMEM_0 },
+	{ .type = WMFW_HALO_XM_PACKED, .base = CS40L50_XMEM_PACKED_0 },
+	{ .type = WMFW_HALO_YM_PACKED, .base = CS40L50_YMEM_PACKED_0 },
+	{ .type = WMFW_ADSP2_XM, .base = CS40L50_XMEM_UNPACKED24_0 },
+	{ .type = WMFW_ADSP2_YM, .base = CS40L50_YMEM_UNPACKED24_0 },
+};
+
+static const struct reg_sequence cs40l50_internal_vamp_config[] = {
+	{ CS40L50_BST_LPMODE_SEL, CS40L50_DCM_LOW_POWER },
+	{ CS40L50_BLOCK_ENABLES2, CS40L50_OVERTEMP_WARN },
+};
+
+static const struct reg_sequence cs40l50_irq_mask_override[] = {
+	{ CS40L50_IRQ1_MASK_2, CS40L50_IRQ_MASK_2_OVERRIDE },
+	{ CS40L50_IRQ1_MASK_20, CS40L50_IRQ_MASK_20_OVERRIDE },
+};
+
+static int cs40l50_wseq_init(struct cs40l50 *cs40l50)
+{
+	struct cs_dsp *dsp = &cs40l50->dsp;
+
+	cs40l50->wseqs[CS40L50_STANDBY].ctl = cs_dsp_get_ctl(dsp, "STANDBY_SEQUENCE",
+							     WMFW_ADSP2_XM,
+							     CS40L50_PM_ALGO);
+	if (!cs40l50->wseqs[CS40L50_STANDBY].ctl) {
+		dev_err(cs40l50->dev, "Control not found for standby sequence\n");
+		return -ENOENT;
+	}
+
+	cs40l50->wseqs[CS40L50_ACTIVE].ctl = cs_dsp_get_ctl(dsp, "ACTIVE_SEQUENCE",
+							    WMFW_ADSP2_XM,
+							    CS40L50_PM_ALGO);
+	if (!cs40l50->wseqs[CS40L50_ACTIVE].ctl) {
+		dev_err(cs40l50->dev, "Control not found for active sequence\n");
+		return -ENOENT;
+	}
+
+	cs40l50->wseqs[CS40L50_PWR_ON].ctl = cs_dsp_get_ctl(dsp, "PM_PWR_ON_SEQ",
+							    WMFW_ADSP2_XM,
+							    CS40L50_PM_ALGO);
+	if (!cs40l50->wseqs[CS40L50_PWR_ON].ctl) {
+		dev_err(cs40l50->dev, "Control not found for power-on sequence\n");
+		return -ENOENT;
+	}
+
+	return cs_dsp_wseq_init(&cs40l50->dsp, cs40l50->wseqs, ARRAY_SIZE(cs40l50->wseqs));
+}
+
+static int cs40l50_dsp_config(struct cs40l50 *cs40l50)
+{
+	int ret;
+
+	/* Configure internal V_AMP supply */
+	ret = regmap_multi_reg_write(cs40l50->regmap, cs40l50_internal_vamp_config,
+				     ARRAY_SIZE(cs40l50_internal_vamp_config));
+	if (ret)
+		return ret;
+
+	ret = cs_dsp_wseq_multi_write(&cs40l50->dsp, &cs40l50->wseqs[CS40L50_PWR_ON],
+				      cs40l50_internal_vamp_config, CS_DSP_WSEQ_FULL,
+				      ARRAY_SIZE(cs40l50_internal_vamp_config), false);
+	if (ret)
+		return ret;
+
+	/* Override firmware defaults for IRQ masks */
+	ret = regmap_multi_reg_write(cs40l50->regmap, cs40l50_irq_mask_override,
+				     ARRAY_SIZE(cs40l50_irq_mask_override));
+	if (ret)
+		return ret;
+
+	return cs_dsp_wseq_multi_write(&cs40l50->dsp, &cs40l50->wseqs[CS40L50_PWR_ON],
+				       cs40l50_irq_mask_override, CS_DSP_WSEQ_FULL,
+				       ARRAY_SIZE(cs40l50_irq_mask_override), false);
+}
+
+static int cs40l50_dsp_post_run(struct cs_dsp *dsp)
+{
+	struct cs40l50 *cs40l50 = container_of(dsp, struct cs40l50, dsp);
+	int ret;
+
+	ret = cs40l50_wseq_init(cs40l50);
+	if (ret)
+		return ret;
+
+	ret = cs40l50_dsp_config(cs40l50);
+	if (ret) {
+		dev_err(cs40l50->dev, "Failed to configure DSP: %d\n", ret);
+		return ret;
+	}
+
+	ret = devm_mfd_add_devices(cs40l50->dev, PLATFORM_DEVID_NONE, cs40l50_devs,
+				   ARRAY_SIZE(cs40l50_devs), NULL, 0, NULL);
+	if (ret)
+		dev_err(cs40l50->dev, "Failed to add child devices: %d\n", ret);
+
+	return ret;
+}
+
+static const struct cs_dsp_client_ops client_ops = {
+	.post_run = cs40l50_dsp_post_run,
+};
+
+static void cs40l50_dsp_remove(void *data)
+{
+	cs_dsp_remove(data);
+}
+
+static int cs40l50_dsp_init(struct cs40l50 *cs40l50)
+{
+	int ret;
+
+	cs40l50->dsp.num = 1;
+	cs40l50->dsp.type = WMFW_HALO;
+	cs40l50->dsp.dev = cs40l50->dev;
+	cs40l50->dsp.regmap = cs40l50->regmap;
+	cs40l50->dsp.base = CS40L50_CORE_BASE;
+	cs40l50->dsp.base_sysinfo = CS40L50_SYS_INFO_ID;
+	cs40l50->dsp.mem = cs40l50_dsp_regions;
+	cs40l50->dsp.num_mems = ARRAY_SIZE(cs40l50_dsp_regions);
+	cs40l50->dsp.no_core_startstop = true;
+	cs40l50->dsp.client_ops = &client_ops;
+
+	ret = cs_dsp_halo_init(&cs40l50->dsp);
+	if (ret)
+		return ret;
+
+	return devm_add_action_or_reset(cs40l50->dev, cs40l50_dsp_remove,
+					&cs40l50->dsp);
+}
+
+static int cs40l50_reset_dsp(struct cs40l50 *cs40l50)
+{
+	int ret;
+
+	mutex_lock(&cs40l50->lock);
+
+	if (cs40l50->dsp.running)
+		cs_dsp_stop(&cs40l50->dsp);
+
+	if (cs40l50->dsp.booted)
+		cs_dsp_power_down(&cs40l50->dsp);
+
+	ret = cs40l50_dsp_write(cs40l50->dev, cs40l50->regmap, CS40L50_SHUTDOWN);
+	if (ret)
+		goto err_mutex;
+
+	ret = cs_dsp_power_up(&cs40l50->dsp, cs40l50->fw, "cs40l50.wmfw",
+			      cs40l50->bin, "cs40l50.bin", "cs40l50");
+	if (ret)
+		goto err_mutex;
+
+	ret = cs40l50_dsp_write(cs40l50->dev, cs40l50->regmap, CS40L50_SYSTEM_RESET);
+	if (ret)
+		goto err_mutex;
+
+	ret = cs40l50_dsp_write(cs40l50->dev, cs40l50->regmap, CS40L50_PREVENT_HIBER);
+	if (ret)
+		goto err_mutex;
+
+	ret = cs_dsp_run(&cs40l50->dsp);
+err_mutex:
+	mutex_unlock(&cs40l50->lock);
+
+	return ret;
+}
+
+static void cs40l50_dsp_power_down(void *data)
+{
+	cs_dsp_power_down(data);
+}
+
+static void cs40l50_dsp_stop(void *data)
+{
+	cs_dsp_stop(data);
+}
+
+static void cs40l50_dsp_bringup(const struct firmware *bin, void *context)
+{
+	struct cs40l50 *cs40l50 = context;
+	u32 nwaves;
+	int ret;
+
+	/* Wavetable is optional; bringup DSP regardless */
+	cs40l50->bin = bin;
+
+	ret = cs40l50_reset_dsp(cs40l50);
+	if (ret) {
+		dev_err(cs40l50->dev, "Failed to reset DSP: %d\n", ret);
+		goto err_fw;
+	}
+
+	ret = regmap_read(cs40l50->regmap, CS40L50_NUM_WAVES, &nwaves);
+	if (ret)
+		goto err_fw;
+
+	dev_info(cs40l50->dev, "%u RAM effects loaded\n", nwaves);
+
+	/* Add teardown actions for first-time bringup */
+	ret = devm_add_action_or_reset(cs40l50->dev, cs40l50_dsp_power_down,
+				       &cs40l50->dsp);
+	if (ret) {
+		dev_err(cs40l50->dev, "Failed to add power down action: %d\n", ret);
+		goto err_fw;
+	}
+
+	ret = devm_add_action_or_reset(cs40l50->dev, cs40l50_dsp_stop, &cs40l50->dsp);
+	if (ret)
+		dev_err(cs40l50->dev, "Failed to add stop action: %d\n", ret);
+err_fw:
+	release_firmware(cs40l50->bin);
+	release_firmware(cs40l50->fw);
+}
+
+static void cs40l50_request_firmware(const struct firmware *fw, void *context)
+{
+	struct cs40l50 *cs40l50 = context;
+	int ret;
+
+	if (!fw) {
+		dev_err(cs40l50->dev, "No firmware file found\n");
+		return;
+	}
+
+	cs40l50->fw = fw;
+
+	ret = request_firmware_nowait(THIS_MODULE, FW_ACTION_UEVENT, CS40L50_WT,
+				      cs40l50->dev, GFP_KERNEL, cs40l50,
+				      cs40l50_dsp_bringup);
+	if (ret) {
+		dev_err(cs40l50->dev, "Failed to request %s: %d\n", CS40L50_WT, ret);
+		release_firmware(cs40l50->fw);
+	}
+}
+
+struct cs40l50_irq {
+	const char *name;
+	int virq;
+};
+
+static struct cs40l50_irq cs40l50_irqs[] = {
+	{ "DSP", },
+	{ "Global", },
+	{ "Boost UVLO", },
+	{ "Boost current limit", },
+	{ "Boost short", },
+	{ "Boost undervolt", },
+	{ "Overtemp", },
+	{ "Amp short", },
+};
+
+static const struct reg_sequence cs40l50_err_rls[] = {
+	{ CS40L50_ERR_RLS, CS40L50_GLOBAL_ERR_RLS_SET },
+	{ CS40L50_ERR_RLS, CS40L50_GLOBAL_ERR_RLS_CLEAR },
+};
+
+static irqreturn_t cs40l50_hw_err(int irq, void *data)
+{
+	struct cs40l50 *cs40l50 = data;
+	int ret = 0, i;
+
+	mutex_lock(&cs40l50->lock);
+
+	/* Log hardware interrupt and execute error release sequence */
+	for (i = 1; i < ARRAY_SIZE(cs40l50_irqs); i++) {
+		if (cs40l50_irqs[i].virq == irq) {
+			dev_err(cs40l50->dev, "%s error\n", cs40l50_irqs[i].name);
+			ret = regmap_multi_reg_write(cs40l50->regmap, cs40l50_err_rls,
+						     ARRAY_SIZE(cs40l50_err_rls));
+			break;
+		}
+	}
+
+	mutex_unlock(&cs40l50->lock);
+	return IRQ_RETVAL(!ret);
+}
+
+static irqreturn_t cs40l50_dsp_queue(int irq, void *data)
+{
+	struct cs40l50 *cs40l50 = data;
+	u32 rd_ptr, val, wt_ptr;
+	int ret = 0;
+
+	mutex_lock(&cs40l50->lock);
+
+	/* Read from DSP queue, log, and update read pointer */
+	while (!ret) {
+		ret = regmap_read(cs40l50->regmap, CS40L50_DSP_QUEUE_WT, &wt_ptr);
+		if (ret)
+			break;
+
+		ret = regmap_read(cs40l50->regmap, CS40L50_DSP_QUEUE_RD, &rd_ptr);
+		if (ret)
+			break;
+
+		/* Check if queue is empty */
+		if (wt_ptr == rd_ptr)
+			break;
+
+		ret = regmap_read(cs40l50->regmap, rd_ptr, &val);
+		if (ret)
+			break;
+
+		dev_dbg(cs40l50->dev, "DSP payload: %#X", val);
+
+		rd_ptr += sizeof(u32);
+
+		if (rd_ptr > CS40L50_DSP_QUEUE_END)
+			rd_ptr = CS40L50_DSP_QUEUE_BASE;
+
+		ret = regmap_write(cs40l50->regmap, CS40L50_DSP_QUEUE_RD, rd_ptr);
+	}
+
+	mutex_unlock(&cs40l50->lock);
+
+	return IRQ_RETVAL(!ret);
+}
+
+static int cs40l50_irq_init(struct cs40l50 *cs40l50)
+{
+	int ret, i, virq;
+
+	ret = devm_regmap_add_irq_chip(cs40l50->dev, cs40l50->regmap, cs40l50->irq,
+				       IRQF_ONESHOT | IRQF_SHARED, 0,
+				       &cs40l50_irq_chip, &cs40l50->irq_data);
+	if (ret) {
+		dev_err(cs40l50->dev, "Failed adding IRQ chip\n");
+		return ret;
+	}
+
+	for (i = 0; i < ARRAY_SIZE(cs40l50_irqs); i++) {
+		virq = regmap_irq_get_virq(cs40l50->irq_data, i);
+		if (virq < 0) {
+			dev_err(cs40l50->dev, "Failed getting virq for %s\n",
+				cs40l50_irqs[i].name);
+			return virq;
+		}
+
+		cs40l50_irqs[i].virq = virq;
+
+		/* Handle DSP and hardware interrupts separately */
+		ret = devm_request_threaded_irq(cs40l50->dev, virq, NULL,
+						i ? cs40l50_hw_err : cs40l50_dsp_queue,
+						IRQF_ONESHOT | IRQF_SHARED,
+						cs40l50_irqs[i].name, cs40l50);
+		if (ret) {
+			return dev_err_probe(cs40l50->dev, ret,
+					     "Failed requesting %s IRQ\n",
+					     cs40l50_irqs[i].name);
+		}
+	}
+
+	return 0;
+}
+
+static int cs40l50_get_model(struct cs40l50 *cs40l50)
+{
+	int ret;
+
+	ret = regmap_read(cs40l50->regmap, CS40L50_DEVID, &cs40l50->devid);
+	if (ret)
+		return ret;
+
+	if (cs40l50->devid != CS40L50_DEVID_A)
+		return -EINVAL;
+
+	ret = regmap_read(cs40l50->regmap, CS40L50_REVID, &cs40l50->revid);
+	if (ret)
+		return ret;
+
+	if (cs40l50->revid < CS40L50_REVID_B0)
+		return -EINVAL;
+
+	dev_dbg(cs40l50->dev, "Cirrus Logic CS40L50 rev. %02X\n", cs40l50->revid);
+
+	return 0;
+}
+
+static int cs40l50_pm_runtime_setup(struct device *dev)
+{
+	int ret;
+
+	pm_runtime_set_autosuspend_delay(dev, CS40L50_AUTOSUSPEND_MS);
+	pm_runtime_use_autosuspend(dev);
+	pm_runtime_get_noresume(dev);
+	ret = pm_runtime_set_active(dev);
+	if (ret)
+		return ret;
+
+	return devm_pm_runtime_enable(dev);
+}
+
+int cs40l50_probe(struct cs40l50 *cs40l50)
+{
+	struct device *dev = cs40l50->dev;
+	int ret;
+
+	mutex_init(&cs40l50->lock);
+
+	cs40l50->reset_gpio = devm_gpiod_get_optional(dev, "reset", GPIOD_OUT_HIGH);
+	if (IS_ERR(cs40l50->reset_gpio))
+		return dev_err_probe(dev, PTR_ERR(cs40l50->reset_gpio),
+				     "Failed getting reset GPIO\n");
+
+	ret = devm_regulator_bulk_get_enable(dev, ARRAY_SIZE(cs40l50_supplies),
+					     cs40l50_supplies);
+	if (ret)
+		return dev_err_probe(dev, ret, "Failed getting supplies\n");
+
+	/* Ensure minimum reset pulse width */
+	usleep_range(CS40L50_RESET_PULSE_US, CS40L50_RESET_PULSE_US + 100);
+
+	gpiod_set_value_cansleep(cs40l50->reset_gpio, 0);
+
+	/* Wait for control port to be ready */
+	usleep_range(CS40L50_CP_READY_US, CS40L50_CP_READY_US + 100);
+
+	ret = cs40l50_get_model(cs40l50);
+	if (ret)
+		return dev_err_probe(dev, ret, "Failed to get part number\n");
+
+	ret = cs40l50_dsp_init(cs40l50);
+	if (ret)
+		return dev_err_probe(dev, ret, "Failed to initialize DSP\n");
+
+	ret = cs40l50_pm_runtime_setup(dev);
+	if (ret)
+		return dev_err_probe(dev, ret, "Failed to initialize runtime PM\n");
+
+	ret = cs40l50_irq_init(cs40l50);
+	if (ret)
+		return ret;
+
+	ret = request_firmware_nowait(THIS_MODULE, FW_ACTION_UEVENT, CS40L50_FW,
+				      dev, GFP_KERNEL, cs40l50, cs40l50_request_firmware);
+	if (ret)
+		return dev_err_probe(dev, ret, "Failed to request %s\n", CS40L50_FW);
+
+	pm_runtime_mark_last_busy(dev);
+	pm_runtime_put_autosuspend(dev);
+
+	return 0;
+}
+EXPORT_SYMBOL_GPL(cs40l50_probe);
+
+int cs40l50_remove(struct cs40l50 *cs40l50)
+{
+	gpiod_set_value_cansleep(cs40l50->reset_gpio, 1);
+
+	return 0;
+}
+EXPORT_SYMBOL_GPL(cs40l50_remove);
+
+static int cs40l50_runtime_suspend(struct device *dev)
+{
+	struct cs40l50 *cs40l50 = dev_get_drvdata(dev);
+
+	return regmap_write(cs40l50->regmap, CS40L50_DSP_QUEUE, CS40L50_ALLOW_HIBER);
+}
+
+static int cs40l50_runtime_resume(struct device *dev)
+{
+	struct cs40l50 *cs40l50 = dev_get_drvdata(dev);
+
+	return cs40l50_dsp_write(dev, cs40l50->regmap, CS40L50_PREVENT_HIBER);
+}
+
+EXPORT_GPL_DEV_PM_OPS(cs40l50_pm_ops) = {
+	RUNTIME_PM_OPS(cs40l50_runtime_suspend, cs40l50_runtime_resume, NULL)
+};
+
+MODULE_DESCRIPTION("CS40L50 Advanced Haptic Driver");
+MODULE_AUTHOR("James Ogletree, Cirrus Logic Inc. <james.ogletree@cirrus.com>");
+MODULE_LICENSE("GPL");
+MODULE_IMPORT_NS(FW_CS_DSP);
diff --git a/drivers/mfd/cs40l50-i2c.c b/drivers/mfd/cs40l50-i2c.c
new file mode 100644
index 000000000000..639be743d956
--- /dev/null
+++ b/drivers/mfd/cs40l50-i2c.c
@@ -0,0 +1,68 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * CS40L50 Advanced Haptic Driver with waveform memory,
+ * integrated DSP, and closed-loop algorithms
+ *
+ * Copyright 2024 Cirrus Logic, Inc.
+ *
+ * Author: James Ogletree <james.ogletree@cirrus.com>
+ */
+
+#include <linux/i2c.h>
+#include <linux/mfd/cs40l50.h>
+
+static int cs40l50_i2c_probe(struct i2c_client *i2c)
+{
+	struct cs40l50 *cs40l50;
+
+	cs40l50 = devm_kzalloc(&i2c->dev, sizeof(*cs40l50), GFP_KERNEL);
+	if (!cs40l50)
+		return -ENOMEM;
+
+	i2c_set_clientdata(i2c, cs40l50);
+
+	cs40l50->dev = &i2c->dev;
+	cs40l50->irq = i2c->irq;
+
+	cs40l50->regmap = devm_regmap_init_i2c(i2c, &cs40l50_regmap);
+	if (IS_ERR(cs40l50->regmap))
+		return dev_err_probe(cs40l50->dev, PTR_ERR(cs40l50->regmap),
+				     "Failed to initialize register map\n");
+
+	return cs40l50_probe(cs40l50);
+}
+
+static void cs40l50_i2c_remove(struct i2c_client *i2c)
+{
+	struct cs40l50 *cs40l50 = i2c_get_clientdata(i2c);
+
+	cs40l50_remove(cs40l50);
+}
+
+static const struct i2c_device_id cs40l50_id_i2c[] = {
+	{ "cs40l50" },
+	{}
+};
+MODULE_DEVICE_TABLE(i2c, cs40l50_id_i2c);
+
+static const struct of_device_id cs40l50_of_match[] = {
+	{ .compatible = "cirrus,cs40l50" },
+	{}
+};
+MODULE_DEVICE_TABLE(of, cs40l50_of_match);
+
+static struct i2c_driver cs40l50_i2c_driver = {
+	.driver = {
+		.name = "cs40l50",
+		.of_match_table = cs40l50_of_match,
+		.pm = pm_ptr(&cs40l50_pm_ops),
+	},
+	.id_table = cs40l50_id_i2c,
+	.probe = cs40l50_i2c_probe,
+	.remove = cs40l50_i2c_remove,
+};
+module_i2c_driver(cs40l50_i2c_driver);
+
+MODULE_DESCRIPTION("CS40L50 I2C Driver");
+MODULE_AUTHOR("James Ogletree, Cirrus Logic Inc. <james.ogletree@cirrus.com>");
+MODULE_LICENSE("GPL");
diff --git a/drivers/mfd/cs40l50-spi.c b/drivers/mfd/cs40l50-spi.c
new file mode 100644
index 000000000000..53526b595a0d
--- /dev/null
+++ b/drivers/mfd/cs40l50-spi.c
@@ -0,0 +1,68 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * CS40L50 Advanced Haptic Driver with waveform memory,
+ * integrated DSP, and closed-loop algorithms
+ *
+ * Copyright 2024 Cirrus Logic, Inc.
+ *
+ * Author: James Ogletree <james.ogletree@cirrus.com>
+ */
+
+#include <linux/mfd/cs40l50.h>
+#include <linux/spi/spi.h>
+
+static int cs40l50_spi_probe(struct spi_device *spi)
+{
+	struct cs40l50 *cs40l50;
+
+	cs40l50 = devm_kzalloc(&spi->dev, sizeof(*cs40l50), GFP_KERNEL);
+	if (!cs40l50)
+		return -ENOMEM;
+
+	spi_set_drvdata(spi, cs40l50);
+
+	cs40l50->dev = &spi->dev;
+	cs40l50->irq = spi->irq;
+
+	cs40l50->regmap = devm_regmap_init_spi(spi, &cs40l50_regmap);
+	if (IS_ERR(cs40l50->regmap))
+		return dev_err_probe(cs40l50->dev, PTR_ERR(cs40l50->regmap),
+				     "Failed to initialize register map\n");
+
+	return cs40l50_probe(cs40l50);
+}
+
+static void cs40l50_spi_remove(struct spi_device *spi)
+{
+	struct cs40l50 *cs40l50 = spi_get_drvdata(spi);
+
+	cs40l50_remove(cs40l50);
+}
+
+static const struct spi_device_id cs40l50_id_spi[] = {
+	{ "cs40l50" },
+	{}
+};
+MODULE_DEVICE_TABLE(spi, cs40l50_id_spi);
+
+static const struct of_device_id cs40l50_of_match[] = {
+	{ .compatible = "cirrus,cs40l50" },
+	{}
+};
+MODULE_DEVICE_TABLE(of, cs40l50_of_match);
+
+static struct spi_driver cs40l50_spi_driver = {
+	.driver = {
+		.name = "cs40l50",
+		.of_match_table = cs40l50_of_match,
+		.pm = pm_ptr(&cs40l50_pm_ops),
+	},
+	.id_table = cs40l50_id_spi,
+	.probe = cs40l50_spi_probe,
+	.remove = cs40l50_spi_remove,
+};
+module_spi_driver(cs40l50_spi_driver);
+
+MODULE_DESCRIPTION("CS40L50 SPI Driver");
+MODULE_AUTHOR("James Ogletree, Cirrus Logic Inc. <james.ogletree@cirrus.com>");
+MODULE_LICENSE("GPL");
diff --git a/include/linux/mfd/cs40l50.h b/include/linux/mfd/cs40l50.h
new file mode 100644
index 000000000000..e5dc49860944
--- /dev/null
+++ b/include/linux/mfd/cs40l50.h
@@ -0,0 +1,137 @@
+/* SPDX-License-Identifier: GPL-2.0
+ *
+ * CS40L50 Advanced Haptic Driver with waveform memory,
+ * integrated DSP, and closed-loop algorithms
+ *
+ * Copyright 2024 Cirrus Logic, Inc.
+ *
+ * Author: James Ogletree <james.ogletree@cirrus.com>
+ */
+
+#ifndef __MFD_CS40L50_H__
+#define __MFD_CS40L50_H__
+
+#include <linux/firmware/cirrus/cs_dsp.h>
+#include <linux/gpio/consumer.h>
+#include <linux/pm.h>
+#include <linux/regmap.h>
+
+/* Power Supply Configuration */
+#define CS40L50_BLOCK_ENABLES2		0x201C
+#define CS40L50_ERR_RLS			0x2034
+#define CS40L50_BST_LPMODE_SEL		0x3810
+#define CS40L50_DCM_LOW_POWER		0x1
+#define CS40L50_OVERTEMP_WARN		0x4000010
+
+/* Interrupts */
+#define CS40L50_IRQ1_INT_1		0xE010
+#define CS40L50_IRQ1_BASE		CS40L50_IRQ1_INT_1
+#define CS40L50_IRQ1_INT_2		0xE014
+#define CS40L50_IRQ1_INT_8		0xE02C
+#define CS40L50_IRQ1_INT_9		0xE030
+#define CS40L50_IRQ1_INT_10		0xE034
+#define CS40L50_IRQ1_INT_18		0xE054
+#define CS40L50_IRQ1_MASK_1		0xE090
+#define CS40L50_IRQ1_MASK_2		0xE094
+#define CS40L50_IRQ1_MASK_20		0xE0DC
+#define CS40L50_IRQ1_INT_1_OFFSET	(CS40L50_IRQ1_INT_1 - CS40L50_IRQ1_BASE)
+#define CS40L50_IRQ1_INT_2_OFFSET	(CS40L50_IRQ1_INT_2 - CS40L50_IRQ1_BASE)
+#define CS40L50_IRQ1_INT_8_OFFSET	(CS40L50_IRQ1_INT_8 - CS40L50_IRQ1_BASE)
+#define CS40L50_IRQ1_INT_9_OFFSET	(CS40L50_IRQ1_INT_9 - CS40L50_IRQ1_BASE)
+#define CS40L50_IRQ1_INT_10_OFFSET	(CS40L50_IRQ1_INT_10 - CS40L50_IRQ1_BASE)
+#define CS40L50_IRQ1_INT_18_OFFSET	(CS40L50_IRQ1_INT_18 - CS40L50_IRQ1_BASE)
+#define CS40L50_IRQ_MASK_2_OVERRIDE	0xFFDF7FFF
+#define CS40L50_IRQ_MASK_20_OVERRIDE	0x15C01000
+#define CS40L50_AMP_SHORT_MASK		BIT(31)
+#define CS40L50_DSP_QUEUE_MASK		BIT(21)
+#define CS40L50_TEMP_ERR_MASK		BIT(31)
+#define CS40L50_BST_UVP_MASK		BIT(6)
+#define CS40L50_BST_SHORT_MASK		BIT(7)
+#define CS40L50_BST_ILIMIT_MASK		BIT(18)
+#define CS40L50_UVLO_VDDBATT_MASK	BIT(16)
+#define CS40L50_GLOBAL_ERROR_MASK	BIT(15)
+
+enum cs40l50_irq_list {
+	CS40L50_DSP_QUEUE_IRQ,
+	CS40L50_GLOBAL_ERROR_IRQ,
+	CS40L50_UVLO_VDDBATT_IRQ,
+	CS40L50_BST_ILIMIT_IRQ,
+	CS40L50_BST_SHORT_IRQ,
+	CS40L50_BST_UVP_IRQ,
+	CS40L50_TEMP_ERR_IRQ,
+	CS40L50_AMP_SHORT_IRQ,
+};
+
+/* DSP */
+#define CS40L50_XMEM_PACKED_0		0x2000000
+#define CS40L50_XMEM_UNPACKED24_0	0x2800000
+#define CS40L50_SYS_INFO_ID		0x25E0000
+#define CS40L50_DSP_QUEUE_WT		0x28042C8
+#define CS40L50_DSP_QUEUE_RD		0x28042CC
+#define CS40L50_NUM_WAVES		0x2805C18
+#define CS40L50_CORE_BASE		0x2B80000
+#define CS40L50_YMEM_PACKED_0		0x2C00000
+#define CS40L50_YMEM_UNPACKED24_0	0x3400000
+#define CS40L50_PMEM_0			0x3800000
+#define CS40L50_DSP_POLL_US		1000
+#define CS40L50_DSP_TIMEOUT_COUNT	100
+#define CS40L50_RESET_PULSE_US		2200
+#define CS40L50_CP_READY_US		3100
+#define CS40L50_AUTOSUSPEND_MS		2000
+#define CS40L50_PM_ALGO			0x9F206
+#define CS40L50_GLOBAL_ERR_RLS_SET	BIT(11)
+#define CS40L50_GLOBAL_ERR_RLS_CLEAR	0
+
+enum cs40l50_wseqs {
+	CS40L50_PWR_ON,
+	CS40L50_STANDBY,
+	CS40L50_ACTIVE,
+	CS40L50_NUM_WSEQS,
+};
+
+/* DSP Queue */
+#define CS40L50_DSP_QUEUE_BASE		0x11004
+#define CS40L50_DSP_QUEUE_END		0x1101C
+#define CS40L50_DSP_QUEUE		0x11020
+#define CS40L50_PREVENT_HIBER		0x2000003
+#define CS40L50_ALLOW_HIBER		0x2000004
+#define CS40L50_SHUTDOWN		0x2000005
+#define CS40L50_SYSTEM_RESET		0x2000007
+#define CS40L50_START_I2S		0x3000002
+#define CS40L50_OWT_PUSH		0x3000008
+#define CS40L50_STOP_PLAYBACK		0x5000000
+#define CS40L50_OWT_DELETE		0xD000000
+
+/* Firmware files */
+#define CS40L50_FW			"cs40l50.wmfw"
+#define CS40L50_WT			"cs40l50.bin"
+
+/* Device */
+#define CS40L50_DEVID			0x0
+#define CS40L50_REVID			0x4
+#define CS40L50_DEVID_A			0x40A50
+#define CS40L50_REVID_B0		0xB0
+
+struct cs40l50 {
+	struct device *dev;
+	struct regmap *regmap;
+	struct mutex lock;
+	struct cs_dsp dsp;
+	struct gpio_desc *reset_gpio;
+	struct regmap_irq_chip_data *irq_data;
+	const struct firmware *fw;
+	const struct firmware *bin;
+	struct cs_dsp_wseq wseqs[CS40L50_NUM_WSEQS];
+	int irq;
+	u32 devid;
+	u32 revid;
+};
+
+int cs40l50_dsp_write(struct device *dev, struct regmap *regmap, u32 val);
+int cs40l50_probe(struct cs40l50 *cs40l50);
+int cs40l50_remove(struct cs40l50 *cs40l50);
+
+extern const struct regmap_config cs40l50_regmap;
+extern const struct dev_pm_ops cs40l50_pm_ops;
+
+#endif /* __MFD_CS40L50_H__ */
-- 
2.34.1


