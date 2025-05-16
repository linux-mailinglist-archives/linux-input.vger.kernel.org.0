Return-Path: <linux-input+bounces-12399-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6BC08ABA350
	for <lists+linux-input@lfdr.de>; Fri, 16 May 2025 20:58:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 001FC50718B
	for <lists+linux-input@lfdr.de>; Fri, 16 May 2025 18:58:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1DCCD278743;
	Fri, 16 May 2025 18:58:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=savoirfairelinux.com header.i=@savoirfairelinux.com header.b="O+8vfCe+"
X-Original-To: linux-input@vger.kernel.org
Received: from mail.savoirfairelinux.com (mail.savoirfairelinux.com [208.88.110.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB1C627C862;
	Fri, 16 May 2025 18:58:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=208.88.110.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747421925; cv=none; b=reKrHLBwM3wG2IWhJiYmfNDAxsTBNatnH4kGLwO7MlNSvLXKFN8iRZBlM5iZVbYYUJ9W7BBV7MGDdDUgNhHtf1gHxMX4OSHyOEZgmh0i53Iru2cDp48p58xOUTDPXCe1tE3uiA3oKLg1pl9sIC9KHF4FcX2e7h33czp8LPwfo1c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747421925; c=relaxed/simple;
	bh=ZqnjDkltiuxaJn8UPSQwpYUw5lN6C1vgqVTkncotVVU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Q0EyOa84TojoKdhPZx/KGUiwK7xz5sGG0R6C4O/HwqjuQS0aqSGVSiNRV+JF5Ee82MNEA2STFeDCcG9pwe0ChbRa1o3S3GYy8Qd5x+3+OTYbsICZCaVimXLIKwM+1IsrQ3kKgaTNE54MSfz9KnEBjP2flJU9pDI8kWvM0qaJSjw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=savoirfairelinux.com; spf=pass smtp.mailfrom=savoirfairelinux.com; dkim=pass (2048-bit key) header.d=savoirfairelinux.com header.i=@savoirfairelinux.com header.b=O+8vfCe+; arc=none smtp.client-ip=208.88.110.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=savoirfairelinux.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=savoirfairelinux.com
Received: from localhost (localhost [127.0.0.1])
	by mail.savoirfairelinux.com (Postfix) with ESMTP id 0E9199C8F98;
	Fri, 16 May 2025 14:58:41 -0400 (EDT)
Received: from mail.savoirfairelinux.com ([127.0.0.1])
 by localhost (mail.savoirfairelinux.com [127.0.0.1]) (amavis, port 10032)
 with ESMTP id vcpDFetGGzSz; Fri, 16 May 2025 14:58:39 -0400 (EDT)
Received: from localhost (localhost [127.0.0.1])
	by mail.savoirfairelinux.com (Postfix) with ESMTP id A42889C906E;
	Fri, 16 May 2025 14:58:39 -0400 (EDT)
DKIM-Filter: OpenDKIM Filter v2.10.3 mail.savoirfairelinux.com A42889C906E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=savoirfairelinux.com; s=DFC430D2-D198-11EC-948E-34200CB392D2;
	t=1747421919; bh=ELnZI3rb/dEWeIpOY64yxy8830zYxJ3C0P9+ns8lwek=;
	h=Date:From:To:Message-ID:MIME-Version;
	b=O+8vfCe+qHTS0foF/rh8Xe6p0qGyVHdVsS7LbFIY7oNUGz9xr2tLgcldEphSun1D3
	 CFAR196UDmrTtf8+aOOyXWBIkOMLeuwQyR2eoLyvRw/eO9K0LVOs2Z7oQtuJnL7f0o
	 e4x0YpAJj/s1hyZNCQ7bm2vDFVUFVifw5JDzgzTCfJH7MCB47vm1t4zGDNhU+OXOfH
	 gpKY9G6UdewTm7okPxKMoi48P//ufxVmSb0gz/ZqJH4+jxdjGmMOujYoBeb5K8SMIl
	 VRx+7kqyb1YeoaukuWzR/8IvJjH24Q1wqnotHMG8UuUFj3ZFOTvZIoHPuXQ0WFmJSM
	 EfhH0+RoL3rOA==
X-Virus-Scanned: amavis at mail.savoirfairelinux.com
Received: from mail.savoirfairelinux.com ([127.0.0.1])
 by localhost (mail.savoirfairelinux.com [127.0.0.1]) (amavis, port 10026)
 with ESMTP id lrTPNdN4K9bB; Fri, 16 May 2025 14:58:39 -0400 (EDT)
Received: from fedora (unknown [192.168.51.254])
	by mail.savoirfairelinux.com (Postfix) with ESMTPSA id 51A8B9C8F98;
	Fri, 16 May 2025 14:58:39 -0400 (EDT)
Date: Fri, 16 May 2025 14:58:38 -0400
From: Samuel Kayode <samuel.kayode@savoirfairelinux.com>
To: Lee Jones <lee@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Sebastian Reichel <sre@kernel.org>, Robin Gong <yibin.gong@nxp.com>
Cc: linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org,
	linux-imx@nxp.com, linux-input@vger.kernel.org,
	Abel Vesa <abelvesa@linux.com>, Abel Vesa <abel.vesa@nxp.com>,
	Robin Gong <b38343@freescale.com>,
	Enric Balletbo Serra <eballetbo@gmail.com>
Subject: [PATCH v2 8/9] power: supply: pf1550: add battery charger support
Message-ID: <4f51191483189a69072fe08c5609048fa14b39b1.1747409892.git.samuel.kayode@savoirfairelinux.com>
References: <cover.1747409892.git.samuel.kayode@savoirfairelinux.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1747409892.git.samuel.kayode@savoirfairelinux.com>

Add support for the battery charger for pf1550 PMIC.

Signed-off-by: Samuel Kayode <samuel.kayode@savoirfairelinux.com>
---
 drivers/power/supply/Kconfig          |   6 +
 drivers/power/supply/Makefile         |   1 +
 drivers/power/supply/pf1550_charger.c | 656 ++++++++++++++++++++++++++
 3 files changed, 663 insertions(+)
 create mode 100644 drivers/power/supply/pf1550_charger.c

diff --git a/drivers/power/supply/Kconfig b/drivers/power/supply/Kconfig
index 79ddb006e2da..5a2b694561b9 100644
--- a/drivers/power/supply/Kconfig
+++ b/drivers/power/supply/Kconfig
@@ -471,6 +471,12 @@ config CHARGER_88PM860X
 	help
 	  Say Y here to enable charger for Marvell 88PM860x chip.
 
+config CHARGER_PF1550
+	tristate "Freescale PF1550 battery charger driver"
+	depends on MFD_PF1550
+	help
+	 Say Y to enable support for the Freescale PF1550 battery charger.
+
 config BATTERY_RX51
 	tristate "Nokia RX-51 (N900) battery driver"
 	depends on TWL4030_MADC
diff --git a/drivers/power/supply/Makefile b/drivers/power/supply/Makefile
index 4f5f8e3507f8..e7dd9fb41d4e 100644
--- a/drivers/power/supply/Makefile
+++ b/drivers/power/supply/Makefile
@@ -64,6 +64,7 @@ obj-$(CONFIG_CHARGER_RT9467)	+= rt9467-charger.o
 obj-$(CONFIG_CHARGER_RT9471)	+= rt9471.o
 obj-$(CONFIG_BATTERY_TWL4030_MADC)	+= twl4030_madc_battery.o
 obj-$(CONFIG_CHARGER_88PM860X)	+= 88pm860x_charger.o
+obj-$(CONFIG_CHARGER_PF1550)	+= pf1550_charger.o
 obj-$(CONFIG_BATTERY_RX51)	+= rx51_battery.o
 obj-$(CONFIG_AB8500_BM)		+= ab8500_bmdata.o ab8500_charger.o ab8500_fg.o ab8500_btemp.o ab8500_chargalg.o
 obj-$(CONFIG_CHARGER_CPCAP)	+= cpcap-charger.o
diff --git a/drivers/power/supply/pf1550_charger.c b/drivers/power/supply/pf1550_charger.c
new file mode 100644
index 000000000000..48fd9a07bb47
--- /dev/null
+++ b/drivers/power/supply/pf1550_charger.c
@@ -0,0 +1,656 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * pf1550_charger.c - regulator driver for the PF1550
+ *
+ * Copyright (C) 2016 Freescale Semiconductor, Inc.
+ * Robin Gong <yibin.gong@freescale.com>
+ */
+
+#include <linux/interrupt.h>
+#include <linux/module.h>
+#include <linux/platform_device.h>
+#include <linux/power_supply.h>
+#include <linux/regmap.h>
+#include <linux/mfd/pf1550.h>
+
+#define PF1550_CHARGER_NAME		"pf1550-charger"
+#define PF1550_DEFAULT_CONSTANT_VOLT	4200000
+#define PF1550_DEFAULT_MIN_SYSTEM_VOLT	3500000
+#define PF1550_DEFAULT_THERMAL_TEMP	75
+
+static const char *pf1550_charger_model		= "PF1550";
+static const char *pf1550_charger_manufacturer	= "Freescale";
+
+struct pf1550_charger {
+	struct device *dev;
+	struct pf1550_dev *pf1550;
+	struct power_supply *charger;
+	struct power_supply_desc psy_desc;
+	int irq;
+	struct delayed_work irq_work;
+	struct mutex mutex;
+
+	u32 constant_volt;
+	u32 min_system_volt;
+	u32 thermal_regulation_temp;
+};
+
+static struct pf1550_irq_info pf1550_charger_irqs[] = {
+	{ PF1550_CHARG_IRQ_BAT2SOCI,		"BAT2SOC" },
+	{ PF1550_CHARG_IRQ_BATI,		"BAT" },
+	{ PF1550_CHARG_IRQ_CHGI,		"CHG" },
+	{ PF1550_CHARG_IRQ_VBUSI,		"VBUS" },
+	{ PF1550_CHARG_IRQ_THMI,		"THM" },
+};
+
+static int pf1550_get_charger_state(struct regmap *regmap, int *val)
+{
+	int ret;
+	unsigned int data;
+
+	ret = regmap_read(regmap, PF1550_CHARG_REG_CHG_SNS, &data);
+	if (ret < 0)
+		return ret;
+
+	data &= PF1550_CHG_SNS_MASK;
+
+	switch (data) {
+	case PF1550_CHG_PRECHARGE:
+	case PF1550_CHG_CONSTANT_CURRENT:
+		*val = POWER_SUPPLY_STATUS_CHARGING;
+		break;
+	case PF1550_CHG_CONSTANT_VOL:
+		*val = POWER_SUPPLY_STATUS_CHARGING;
+		break;
+	case PF1550_CHG_EOC:
+		*val = POWER_SUPPLY_STATUS_CHARGING;
+		break;
+	case PF1550_CHG_DONE:
+		*val = POWER_SUPPLY_STATUS_FULL;
+		break;
+	case PF1550_CHG_TIMER_FAULT:
+	case PF1550_CHG_SUSPEND:
+		*val = POWER_SUPPLY_STATUS_NOT_CHARGING;
+		break;
+	case PF1550_CHG_OFF_INV:
+	case PF1550_CHG_OFF_TEMP:
+	case PF1550_CHG_LINEAR_ONLY:
+		*val = POWER_SUPPLY_STATUS_DISCHARGING;
+		break;
+	default:
+		*val = POWER_SUPPLY_STATUS_UNKNOWN;
+	}
+
+	return 0;
+}
+
+static int pf1550_get_charge_type(struct regmap *regmap, int *val)
+{
+	int ret;
+	unsigned int data;
+
+	ret = regmap_read(regmap, PF1550_CHARG_REG_CHG_SNS, &data);
+	if (ret < 0)
+		return ret;
+
+	data &= PF1550_CHG_SNS_MASK;
+
+	switch (data) {
+	case PF1550_CHG_SNS_MASK:
+		*val = POWER_SUPPLY_CHARGE_TYPE_TRICKLE;
+		break;
+	case PF1550_CHG_CONSTANT_CURRENT:
+	case PF1550_CHG_CONSTANT_VOL:
+	case PF1550_CHG_EOC:
+		*val = POWER_SUPPLY_CHARGE_TYPE_FAST;
+		break;
+	case PF1550_CHG_DONE:
+	case PF1550_CHG_TIMER_FAULT:
+	case PF1550_CHG_SUSPEND:
+	case PF1550_CHG_OFF_INV:
+	case PF1550_CHG_BAT_OVER:
+	case PF1550_CHG_OFF_TEMP:
+	case PF1550_CHG_LINEAR_ONLY:
+		*val = POWER_SUPPLY_CHARGE_TYPE_NONE;
+		break;
+	default:
+		*val = POWER_SUPPLY_CHARGE_TYPE_UNKNOWN;
+	}
+
+	return 0;
+}
+
+/*
+ * Supported health statuses:
+ *  - POWER_SUPPLY_HEALTH_DEAD
+ *  - POWER_SUPPLY_HEALTH_GOOD
+ *  - POWER_SUPPLY_HEALTH_OVERVOLTAGE
+ *  - POWER_SUPPLY_HEALTH_UNKNOWN
+ */
+static int pf1550_get_battery_health(struct regmap *regmap, int *val)
+{
+	int ret;
+	unsigned int data;
+
+	ret = regmap_read(regmap, PF1550_CHARG_REG_BATT_SNS, &data);
+	if (ret < 0)
+		return ret;
+
+	data &= PF1550_BAT_SNS_MASK;
+
+	switch (data) {
+	case PF1550_BAT_NO_DETECT:
+		*val = POWER_SUPPLY_HEALTH_DEAD;
+		break;
+	case PF1550_BAT_NO_VBUS:
+	case PF1550_BAT_LOW_THAN_PRECHARG:
+	case PF1550_BAT_CHARG_FAIL:
+	case PF1550_BAT_HIGH_THAN_PRECHARG:
+		*val = POWER_SUPPLY_HEALTH_GOOD;
+		break;
+	case PF1550_BAT_OVER_VOL:
+		*val = POWER_SUPPLY_HEALTH_OVERVOLTAGE;
+		break;
+	default:
+		*val = POWER_SUPPLY_HEALTH_UNKNOWN;
+		break;
+	}
+
+	return 0;
+}
+
+static int pf1550_get_present(struct regmap *regmap, int *val)
+{
+	unsigned int data;
+	int ret;
+
+	ret = regmap_read(regmap, PF1550_CHARG_REG_BATT_SNS, &data);
+	if (ret < 0)
+		return ret;
+
+	data &= PF1550_BAT_SNS_MASK;
+	*val = (data == PF1550_BAT_NO_DETECT) ? 0 : 1;
+
+	return 0;
+}
+
+static int pf1550_get_online(struct regmap *regmap, int *val)
+{
+	unsigned int data;
+	int ret;
+
+	ret = regmap_read(regmap, PF1550_CHARG_REG_VBUS_SNS, &data);
+	if (ret < 0)
+		return ret;
+
+	*val = (data & PF1550_VBUS_VALID) ? 1 : 0;
+
+	return 0;
+}
+
+static void pf1550_chg_bat_isr(struct pf1550_charger *chg)
+{
+	unsigned int data;
+
+	if (regmap_read(chg->pf1550->regmap, PF1550_CHARG_REG_BATT_SNS, &data)) {
+		dev_err(chg->dev, "Read BATT_SNS error.\n");
+		return;
+	}
+
+	switch (data & PF1550_BAT_SNS_MASK) {
+	case PF1550_BAT_NO_VBUS:
+		dev_dbg(chg->dev, "No valid VBUS input.\n");
+		break;
+	case PF1550_BAT_LOW_THAN_PRECHARG:
+		dev_dbg(chg->dev, "VBAT < VPRECHG.LB.\n");
+		break;
+	case PF1550_BAT_CHARG_FAIL:
+		dev_dbg(chg->dev, "Battery charging failed.\n");
+		break;
+	case PF1550_BAT_HIGH_THAN_PRECHARG:
+		dev_dbg(chg->dev, "VBAT > VPRECHG.LB.\n");
+		break;
+	case PF1550_BAT_OVER_VOL:
+		dev_dbg(chg->dev, "VBAT > VBATOV.\n");
+		break;
+	case PF1550_BAT_NO_DETECT:
+		dev_dbg(chg->dev, "Battery not detected.\n");
+		break;
+	default:
+		dev_err(chg->dev, "Unknown value read:%x\n",
+			data & PF1550_CHG_SNS_MASK);
+	}
+}
+
+static void pf1550_chg_chg_isr(struct pf1550_charger *chg)
+{
+	unsigned int data;
+
+	if (regmap_read(chg->pf1550->regmap, PF1550_CHARG_REG_CHG_SNS, &data)) {
+		dev_err(chg->dev, "Read CHG_SNS error.\n");
+		return;
+	}
+
+	switch (data & PF1550_CHG_SNS_MASK) {
+	case PF1550_CHG_PRECHARGE:
+		dev_dbg(chg->dev, "In pre-charger mode.\n");
+		break;
+	case PF1550_CHG_CONSTANT_CURRENT:
+		dev_dbg(chg->dev, "In fast-charge constant current mode.\n");
+		break;
+	case PF1550_CHG_CONSTANT_VOL:
+		dev_dbg(chg->dev, "In fast-charge constant voltage mode.\n");
+		break;
+	case PF1550_CHG_EOC:
+		dev_dbg(chg->dev, "In EOC mode.\n");
+		break;
+	case PF1550_CHG_DONE:
+		dev_dbg(chg->dev, "In DONE mode.\n");
+		break;
+	case PF1550_CHG_TIMER_FAULT:
+		dev_info(chg->dev, "In timer fault mode.\n");
+		break;
+	case PF1550_CHG_SUSPEND:
+		dev_info(chg->dev, "In thermistor suspend mode.\n");
+		break;
+	case PF1550_CHG_OFF_INV:
+		dev_info(chg->dev, "Input invalid, charger off.\n");
+		break;
+	case PF1550_CHG_BAT_OVER:
+		dev_info(chg->dev, "Battery over-voltage.\n");
+		break;
+	case PF1550_CHG_OFF_TEMP:
+		dev_info(chg->dev, "Temp high, charger off.\n");
+		break;
+	case PF1550_CHG_LINEAR_ONLY:
+		dev_dbg(chg->dev, "In Linear mode, not charging.\n");
+		break;
+	default:
+		dev_err(chg->dev, "Unknown value read:%x\n",
+			data & PF1550_CHG_SNS_MASK);
+	}
+}
+
+static void pf1550_chg_vbus_isr(struct pf1550_charger *chg)
+{
+	enum power_supply_type old_type;
+	unsigned int data;
+
+	if (regmap_read(chg->pf1550->regmap, PF1550_CHARG_REG_VBUS_SNS, &data)) {
+		dev_err(chg->dev, "Read VBUS_SNS error.\n");
+		return;
+	}
+
+	old_type = chg->psy_desc.type;
+
+	if (data & PF1550_VBUS_UVLO) {
+		chg->psy_desc.type = POWER_SUPPLY_TYPE_BATTERY;
+		dev_dbg(chg->dev, "VBUS deattached.\n");
+	}
+	if (data & PF1550_VBUS_IN2SYS)
+		dev_dbg(chg->dev, "VBUS_IN2SYS_SNS.\n");
+	if (data & PF1550_VBUS_OVLO)
+		dev_dbg(chg->dev, "VBUS_OVLO_SNS.\n");
+	if (data & PF1550_VBUS_VALID) {
+		chg->psy_desc.type = POWER_SUPPLY_TYPE_MAINS;
+		dev_dbg(chg->dev, "VBUS attached.\n");
+	}
+
+	if (old_type != chg->psy_desc.type)
+		power_supply_changed(chg->charger);
+}
+
+static irqreturn_t pf1550_charger_irq_handler(int irq, void *data)
+{
+	struct pf1550_charger *chg = data;
+
+	chg->irq = irq;
+	schedule_delayed_work(&chg->irq_work,  msecs_to_jiffies(10));
+
+	return IRQ_HANDLED;
+}
+
+static void pf1550_charger_irq_work(struct work_struct *work)
+{
+	struct pf1550_charger *chg = container_of(to_delayed_work(work),
+						  struct pf1550_charger,
+						  irq_work);
+	int i, irq_type = -1;
+	unsigned int status;
+
+	if (!chg->charger)
+		return;
+
+	mutex_lock(&chg->mutex);
+
+	for (i = 0; i < ARRAY_SIZE(pf1550_charger_irqs); i++)
+		if (chg->irq == pf1550_charger_irqs[i].virq)
+			irq_type = pf1550_charger_irqs[i].irq;
+
+	switch (irq_type) {
+	case PF1550_CHARG_IRQ_BAT2SOCI:
+		dev_info(chg->dev, "BAT to SYS Overcurrent interrupt.\n");
+		break;
+	case PF1550_CHARG_IRQ_BATI:
+		pf1550_chg_bat_isr(chg);
+		break;
+	case PF1550_CHARG_IRQ_CHGI:
+		pf1550_chg_chg_isr(chg);
+		break;
+	case PF1550_CHARG_IRQ_VBUSI:
+		pf1550_chg_vbus_isr(chg);
+		break;
+	case PF1550_CHARG_IRQ_THMI:
+		dev_info(chg->dev, "Thermal interrupt.\n");
+		break;
+	default:
+		dev_err(chg->dev, "unknown interrupt occurred.\n");
+	}
+
+	if (regmap_read(chg->pf1550->regmap, PF1550_CHARG_REG_CHG_INT, &status))
+		dev_err(chg->dev, "Read CHG_INT error.\n");
+	if (regmap_write(chg->pf1550->regmap, PF1550_CHARG_REG_CHG_INT, status))
+		dev_err(chg->dev, "clear CHG_INT error.\n");
+
+	mutex_unlock(&chg->mutex);
+}
+
+static enum power_supply_property pf1550_charger_props[] = {
+	POWER_SUPPLY_PROP_STATUS,
+	POWER_SUPPLY_PROP_CHARGE_TYPE,
+	POWER_SUPPLY_PROP_HEALTH,
+	POWER_SUPPLY_PROP_PRESENT,
+	POWER_SUPPLY_PROP_ONLINE,
+	POWER_SUPPLY_PROP_MODEL_NAME,
+	POWER_SUPPLY_PROP_MANUFACTURER,
+};
+
+static int pf1550_charger_get_property(struct power_supply *psy,
+				       enum power_supply_property psp,
+			    union power_supply_propval *val)
+{
+	struct pf1550_charger *chg = power_supply_get_drvdata(psy);
+	struct regmap *regmap = chg->pf1550->regmap;
+	int ret = 0;
+
+	switch (psp) {
+	case POWER_SUPPLY_PROP_STATUS:
+		ret = pf1550_get_charger_state(regmap, &val->intval);
+		break;
+	case POWER_SUPPLY_PROP_CHARGE_TYPE:
+		ret = pf1550_get_charge_type(regmap, &val->intval);
+		break;
+	case POWER_SUPPLY_PROP_HEALTH:
+		ret = pf1550_get_battery_health(regmap, &val->intval);
+		break;
+	case POWER_SUPPLY_PROP_PRESENT:
+		ret = pf1550_get_present(regmap, &val->intval);
+		break;
+	case POWER_SUPPLY_PROP_ONLINE:
+		ret = pf1550_get_online(regmap, &val->intval);
+		break;
+	case POWER_SUPPLY_PROP_MODEL_NAME:
+		val->strval = pf1550_charger_model;
+		break;
+	case POWER_SUPPLY_PROP_MANUFACTURER:
+		val->strval = pf1550_charger_manufacturer;
+		break;
+	default:
+		return -EINVAL;
+	}
+
+	return ret;
+}
+
+static int pf1550_set_constant_volt(struct pf1550_charger *chg,
+				    unsigned int uvolt)
+{
+	unsigned int data;
+
+	if (uvolt >= 3500000 && uvolt <= 4440000) {
+		data = 8 + (uvolt - 3500000) / 20000;
+	} else {
+		dev_err(chg->dev, "Wrong value for constant voltage\n");
+		return -EINVAL;
+	}
+
+	dev_dbg(chg->dev, "Charging constant voltage: %u (0x%x)\n", uvolt,
+		data);
+
+	return regmap_update_bits(chg->pf1550->regmap,
+			PF1550_CHARG_REG_BATT_REG,
+			PF1550_CHARG_REG_BATT_REG_CHGCV_MASK, data);
+}
+
+static int pf1550_set_min_system_volt(struct pf1550_charger *chg,
+				      unsigned int uvolt)
+{
+	unsigned int data;
+
+	switch (uvolt) {
+	case 3500000:
+		data = 0x0;
+		break;
+	case 3700000:
+		data = 0x1;
+		break;
+	case 4300000:
+		data = 0x2;
+		break;
+	default:
+		dev_err(chg->dev, "Wrong value for minimum system voltage\n");
+		return -EINVAL;
+	}
+
+	data <<= PF1550_CHARG_REG_BATT_REG_VMINSYS_SHIFT;
+
+	dev_dbg(chg->dev, "Minimum system regulation voltage: %u (0x%x)\n",
+		uvolt, data);
+
+	return regmap_update_bits(chg->pf1550->regmap,
+			PF1550_CHARG_REG_BATT_REG,
+			PF1550_CHARG_REG_BATT_REG_VMINSYS_MASK, data);
+}
+
+static int pf1550_set_thermal_regulation_temp(struct pf1550_charger *chg,
+					      unsigned int cels)
+{
+	unsigned int data;
+
+	switch (cels) {
+	case 60:
+		data = 0x0;
+		break;
+	case 75:
+		data = 0x1;
+		break;
+	case 90:
+		data = 0x2;
+		break;
+	case 105:
+		data = 0x3;
+		break;
+	default:
+		dev_err(chg->dev, "Wrong value for thermal temperature\n");
+		return -EINVAL;
+	}
+
+	data <<= PF1550_CHARG_REG_THM_REG_CNFG_REGTEMP_SHIFT;
+
+	dev_dbg(chg->dev, "Thermal regulation loop temperature: %u (0x%x)\n",
+		cels, data);
+
+	return regmap_update_bits(chg->pf1550->regmap,
+			PF1550_CHARG_REG_THM_REG_CNFG,
+			PF1550_CHARG_REG_THM_REG_CNFG_REGTEMP_MASK, data);
+}
+
+/*
+ * Sets charger registers to proper and safe default values.
+ */
+static int pf1550_reg_init(struct pf1550_charger *chg)
+{
+	int ret;
+	unsigned int data;
+
+	/* Unmask charger interrupt, mask DPMI and reserved bit */
+	ret =  regmap_write(chg->pf1550->regmap, PF1550_CHARG_REG_CHG_INT_MASK,
+			    PF1550_CHG_INT_MASK);
+	if (ret) {
+		dev_err(chg->dev, "Error unmask charger interrupt: %d\n", ret);
+		return ret;
+	}
+
+	ret = regmap_read(chg->pf1550->regmap, PF1550_CHARG_REG_VBUS_SNS,
+			  &data);
+	if (ret) {
+		dev_err(chg->dev, "Read charg vbus_sns error: %d\n", ret);
+		return ret;
+	}
+
+	if (data & PF1550_VBUS_VALID)
+		chg->psy_desc.type = POWER_SUPPLY_TYPE_MAINS;
+
+	ret = pf1550_set_constant_volt(chg, chg->constant_volt);
+	if (ret)
+		return ret;
+
+	ret = pf1550_set_min_system_volt(chg, chg->min_system_volt);
+	if (ret)
+		return ret;
+
+	ret = pf1550_set_thermal_regulation_temp(chg,
+						 chg->thermal_regulation_temp);
+	if (ret)
+		return ret;
+
+	/* Turn on charger */
+	ret = regmap_write(chg->pf1550->regmap, PF1550_CHARG_REG_CHG_OPER,
+			   PF1550_CHG_TURNON);
+	if (ret) {
+		dev_err(chg->dev, "Error turn on charger: %d\n", ret);
+		return ret;
+	}
+
+	return 0;
+}
+
+static int pf1550_dt_init(struct device *dev, struct pf1550_charger *chg)
+{
+	struct device_node *np = dev->of_node;
+
+	if (!np) {
+		dev_err(dev, "no charger OF node\n");
+		return -EINVAL;
+	}
+
+	if (of_property_read_u32(np, "fsl,constant-microvolt",
+				 &chg->constant_volt))
+		chg->constant_volt = PF1550_DEFAULT_CONSTANT_VOLT;
+
+	if (of_property_read_u32(np, "fsl,min-system-microvolt",
+				 &chg->min_system_volt))
+		chg->min_system_volt = PF1550_DEFAULT_MIN_SYSTEM_VOLT;
+
+	if (of_property_read_u32(np, "fsl,thermal-regulation",
+				 &chg->thermal_regulation_temp))
+		chg->thermal_regulation_temp = PF1550_DEFAULT_THERMAL_TEMP;
+
+	return 0;
+}
+
+static int pf1550_charger_probe(struct platform_device *pdev)
+{
+	struct pf1550_charger *chg;
+	struct power_supply_config psy_cfg = {};
+	struct pf1550_dev *pf1550 = dev_get_drvdata(pdev->dev.parent);
+	int i, ret;
+
+	chg = devm_kzalloc(&pdev->dev, sizeof(*chg), GFP_KERNEL);
+	if (!chg)
+		return -ENOMEM;
+
+	chg->dev = &pdev->dev;
+	chg->pf1550 = pf1550;
+
+	platform_set_drvdata(pdev, chg);
+
+	ret = pf1550_dt_init(&pdev->dev, chg);
+	if (ret)
+		return ret;
+
+	mutex_init(&chg->mutex);
+
+	INIT_DELAYED_WORK(&chg->irq_work, pf1550_charger_irq_work);
+
+	for (i = 0; i < ARRAY_SIZE(pf1550_charger_irqs); i++) {
+		struct pf1550_irq_info *charger_irq =
+						&pf1550_charger_irqs[i];
+		unsigned int virq = 0;
+
+		virq = regmap_irq_get_virq(pf1550->irq_data_charger,
+					   charger_irq->irq);
+		if (!virq)
+			return -EINVAL;
+
+		charger_irq->virq = virq;
+
+		ret = devm_request_threaded_irq(&pdev->dev, virq, NULL,
+						pf1550_charger_irq_handler,
+					IRQF_NO_SUSPEND,
+					charger_irq->name, chg);
+		if (ret) {
+			dev_err(&pdev->dev,
+				"failed: irq request (IRQ: %d, error :%d)\n",
+				charger_irq->irq, ret);
+			return ret;
+		}
+	}
+
+	psy_cfg.drv_data = chg;
+
+	chg->psy_desc.name = PF1550_CHARGER_NAME;
+	chg->psy_desc.type = POWER_SUPPLY_TYPE_BATTERY;
+	chg->psy_desc.get_property = pf1550_charger_get_property;
+	chg->psy_desc.properties = pf1550_charger_props;
+	chg->psy_desc.num_properties = ARRAY_SIZE(pf1550_charger_props);
+
+	chg->charger = devm_power_supply_register(&pdev->dev, &chg->psy_desc,
+						  &psy_cfg);
+	if (IS_ERR(chg->charger)) {
+		dev_err(&pdev->dev, "failed: power supply register\n");
+		ret = PTR_ERR(chg->charger);
+		return ret;
+	}
+
+	ret = pf1550_reg_init(chg);
+
+	return ret;
+}
+
+static void pf1550_charger_remove(struct platform_device *pdev)
+{
+	struct pf1550_charger *chg = platform_get_drvdata(pdev);
+
+	cancel_delayed_work_sync(&chg->irq_work);
+}
+
+static const struct platform_device_id pf1550_charger_id[] = {
+	{ "pf1550-charger", 0 },
+	{ /* sentinel */ }
+};
+MODULE_DEVICE_TABLE(platform, pf1550_charger_id);
+
+static struct platform_driver pf1550_charger_driver = {
+	.driver = {
+		.name	= "pf1550-charger",
+	},
+	.probe		= pf1550_charger_probe,
+	.remove		= pf1550_charger_remove,
+	.id_table	= pf1550_charger_id,
+};
+module_platform_driver(pf1550_charger_driver);
+
+MODULE_AUTHOR("Robin Gong <yibin.gong@freescale.com>");
+MODULE_DESCRIPTION("PF1550 charger driver");
+MODULE_LICENSE("GPL v2");
-- 
2.49.0


