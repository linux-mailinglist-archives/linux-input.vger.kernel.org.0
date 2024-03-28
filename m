Return-Path: <linux-input+bounces-2229-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E2A6871E2A
	for <lists+linux-input@lfdr.de>; Tue,  5 Mar 2024 12:44:29 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 911781C2380C
	for <lists+linux-input@lfdr.de>; Tue,  5 Mar 2024 11:44:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 44F4A57337;
	Tue,  5 Mar 2024 11:44:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="h0/SWPRd"
X-Original-To: linux-input@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 142755676D;
	Tue,  5 Mar 2024 11:44:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709639065; cv=none; b=qDKECgNL+DyUJCMsnTzxJ+17Q/iez9eRYPDRSa1JUnbIHmWh7XaQJipD0IXmXBYLj83kBwynb6jdSjh7HQjJeGmo09QtfK7uIhA0WCGpWh1bIqkHO9TFWZFSXqYkvlG8vrvjTf9aQARwWyYKmx35MqpyegSLM15u3K8C/8Oonj8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709639065; c=relaxed/simple;
	bh=vPvMT3DqJXqEQcuhTAcxhF5Qi2lIxMQ341S/wtbhsU4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=AkiJypLYrQCP89r16n/023tM3SU85aoen5/IEBd9T6lVc9aYvFbi167/K36ntplKyoqpzS+f+MUYWm+qpsSOOMr1baVhLRj/7URWI8BpRGaWJbD4wusyKTo8bFlaIyOVpV5VctM/NPo1bp8Y9QGiZ8hYtumPJczyo2PWSr6ffv0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=h0/SWPRd; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 731B2C433F1;
	Tue,  5 Mar 2024 11:44:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1709639064;
	bh=vPvMT3DqJXqEQcuhTAcxhF5Qi2lIxMQ341S/wtbhsU4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=h0/SWPRdYEszB9WowJ2/OLDB+ZZ45u0BGy6R6eqikMSTiYrB3xekR/yai+QDe2E6e
	 +OFB1fzNGFCI4p8dFtBgg2iK6tUcoKzjVoQtIXKs9N6gi3bFaSLTutq9csQqJZIQUU
	 me4lDjMjDi1A9P25sTd14xgTzhCF2WCi6wfXZNjPSzzw0P6Yc2NRDcXDMmBGc4VYqA
	 QZImmHVZWM+C4Favm2otPOMJq3NCG/t1BS0sEtnBkNr/T1ygeSaofgyZ3m1h6Ap3a9
	 VNsxsj089Z4Tzbc0Ab+lObIpX25bkKm4N0rETf7VbCXZXNPBOBPs7MSgsJFP5pdf1J
	 BGIVFxE1X//FQ==
Date: Tue, 5 Mar 2024 11:44:18 +0000
From: Lee Jones <lee@kernel.org>
To: Karel Balej <karelb@gimli.ms.mff.cuni.cz>
Cc: Karel Balej <balejk@matfyz.cz>, Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-input@vger.kernel.org,
	Duje =?utf-8?Q?Mihanovi=C4=87?= <duje.mihanovic@skole.hr>,
	~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org
Subject: Re: [RFC PATCH v3 2/5] mfd: add driver for Marvell 88PM886 PMIC
Message-ID: <20240305114418.GB86322@google.com>
References: <20240303101506.4187-1-karelb@gimli.ms.mff.cuni.cz>
 <20240303101506.4187-3-karelb@gimli.ms.mff.cuni.cz>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240303101506.4187-3-karelb@gimli.ms.mff.cuni.cz>

On Sun, 03 Mar 2024, Karel Balej wrote:

> From: Karel Balej <balejk@matfyz.cz>
> 
> Marvell 88PM886 is a PMIC which provides various functions such as
> onkey, battery, charger and regulators. It is found for instance in the
> samsung,coreprimevelte smartphone with which this was tested.
> 
> Only implement basic support to allow for the use of regulators and
> onkey omitting the currently unused register definitions and I2C
> subclients which should thus be added with the subdevice drivers which
> need them.
> 
> Signed-off-by: Karel Balej <balejk@matfyz.cz>
> ---
> 
> Notes:
>     RFC v3:
>     - Drop onkey cell .of_compatible.
>     - Rename LDO page offset and regmap to REGULATORS.
>     RFC v2:
>     - Remove some abstraction.
>     - Sort includes alphabetically and add linux/of.h.
>     - Depend on OF, remove of_match_ptr and add MODULE_DEVICE_TABLE.
>     - Use more temporaries and break long lines.
>     - Do not initialize ret in probe.
>     - Use the wakeup-source DT property.
>     - Rename ret to err.
>     - Address Lee's comments:
>       - Drop patched in presets for base regmap and related defines.
>       - Use full sentences in comments.
>       - Remove IRQ comment.
>       - Define regmap_config member values.
>       - Rename data to sys_off_data.
>       - Add _PMIC suffix to Kconfig.
>       - Use dev_err_probe.
>       - Do not store irq_data.
>       - s/WHOAMI/CHIP_ID

I still see 'whoami'.

>       - Drop LINUX part of include guard name.
>       - Merge in the regulator series modifications in order to have more
>         devices and modify the commit message accordingly. Changes with
>         respect to the original regulator series patches:
>         - ret -> err
>         - Add temporary for dev in pm88x_initialize_subregmaps.
>         - Drop of_compatible for the regulators.
>         - Do not duplicate LDO regmap for bucks.
>     - Rewrite commit message.
> 
>  drivers/mfd/88pm886.c       | 210 ++++++++++++++++++++++++++++++++++++
>  drivers/mfd/Kconfig         |  12 +++
>  drivers/mfd/Makefile        |   1 +
>  include/linux/mfd/88pm886.h |  46 ++++++++
>  4 files changed, 269 insertions(+)
>  create mode 100644 drivers/mfd/88pm886.c
>  create mode 100644 include/linux/mfd/88pm886.h
> 
> diff --git a/drivers/mfd/88pm886.c b/drivers/mfd/88pm886.c
> new file mode 100644
> index 000000000000..c17220e1b7e2
> --- /dev/null
> +++ b/drivers/mfd/88pm886.c
> @@ -0,0 +1,210 @@
> +// SPDX-License-Identifier: GPL-2.0-only

Header?  Description?  Author?  Copyright?

> +#include <linux/i2c.h>
> +#include <linux/mfd/core.h>
> +#include <linux/module.h>
> +#include <linux/notifier.h>
> +#include <linux/of.h>
> +#include <linux/reboot.h>
> +#include <linux/regmap.h>
> +
> +#include <linux/mfd/88pm886.h>
> +
> +#define PM886_REG_INT_STATUS1			0x05
> +
> +#define PM886_REG_INT_ENA_1			0x0a
> +#define PM886_INT_ENA1_ONKEY			BIT(0)
> +
> +#define PM886_REGMAP_CONF_REG_BITS		8
> +#define PM886_REGMAP_CONF_VAL_BITS		8

These 2 are not commonly defined, just the one below please.

> +#define PM886_REGMAP_CONF_MAX_REG		0xfe

> +enum pm886_irq_number {
> +	PM886_IRQ_ONKEY,
> +
> +	PM886_MAX_IRQ
> +};

Seems superfluous for 1 IRQ and an unused MAX.

Looks like I've mentioned this before.

The IRQ number probably shouldn't be arbitrary either.

> +static struct regmap_irq pm886_regmap_irqs[] = {
> +	REGMAP_IRQ_REG(PM886_IRQ_ONKEY, 0, PM886_INT_ENA1_ONKEY),
> +};
> +
> +static struct regmap_irq_chip pm886_regmap_irq_chip = {
> +	.name = "88pm886",
> +	.irqs = pm886_regmap_irqs,
> +	.num_irqs = ARRAY_SIZE(pm886_regmap_irqs),
> +	.num_regs = 4,
> +	.status_base = PM886_REG_INT_STATUS1,
> +	.ack_base = PM886_REG_INT_STATUS1,
> +	.unmask_base = PM886_REG_INT_ENA_1,
> +};
> +
> +static struct resource pm886_onkey_resources[] = {
> +	DEFINE_RES_IRQ_NAMED(PM886_IRQ_ONKEY, "88pm886-onkey"),
> +};
> +
> +static struct mfd_cell pm886_devs[] = {
> +	{
> +		.name = "88pm886-onkey",
> +		.num_resources = ARRAY_SIZE(pm886_onkey_resources),
> +		.resources = pm886_onkey_resources,
> +	},
> +	{
> +		.name = "88pm886-regulator",
> +		.id = PM886_REGULATOR_ID_LDO2,

Why doesn't PLATFORM_DEVID_AUTO work for this device?

> +	},
> +	{
> +		.name = "88pm886-regulator",
> +		.id = PM886_REGULATOR_ID_LDO15,
> +	},
> +	{
> +		.name = "88pm886-regulator",
> +		.id = PM886_REGULATOR_ID_BUCK2,
> +	},
> +};
> +
> +static const struct regmap_config pm886_i2c_regmap = {
> +	.reg_bits = PM886_REGMAP_CONF_REG_BITS,
> +	.val_bits = PM886_REGMAP_CONF_VAL_BITS,
> +	.max_register = PM886_REGMAP_CONF_MAX_REG,
> +};
> +
/> +static int pm886_power_off_handler(struct sys_off_data *sys_off_data)
> +{
> +	struct pm886_chip *chip = sys_off_data->cb_data;
> +	struct regmap *regmap = chip->regmaps[PM886_REGMAP_BASE];
> +	struct device *dev = &chip->client->dev;
> +	int err;
> +
> +	err = regmap_update_bits(regmap, PM886_REG_MISC_CONFIG1, PM886_SW_PDOWN,
> +				PM886_SW_PDOWN);
> +	if (err) {
> +		dev_err(dev, "Failed to power off the device: %d\n", err);
> +		return NOTIFY_BAD;
> +	}
> +	return NOTIFY_DONE;
> +}
> +
> +static int pm886_initialize_subregmaps(struct pm886_chip *chip)
> +{
> +	struct device *dev = &chip->client->dev;
> +	struct i2c_client *page;
> +	struct regmap *regmap;
> +	int err;
> +
> +	/* regulators page */
> +	page = devm_i2c_new_dummy_device(dev, chip->client->adapter,
> +				chip->client->addr + PM886_PAGE_OFFSET_REGULATORS);
> +	if (IS_ERR(page)) {
> +		err = PTR_ERR(page);
> +		dev_err(dev, "Failed to initialize regulators client: %d\n", err);
> +		return err;
> +	}
> +	regmap = devm_regmap_init_i2c(page, &pm886_i2c_regmap);
> +	if (IS_ERR(regmap)) {
> +		err = PTR_ERR(regmap);
> +		dev_err(dev, "Failed to initialize regulators regmap: %d\n", err);
> +		return err;
> +	}
> +	chip->regmaps[PM886_REGMAP_REGULATORS] = regmap;

Except for the regulator driver, where else is the regulators regmap used?

> +
> +	return 0;
> +}
> +
> +static int pm886_setup_irq(struct pm886_chip *chip,
> +		struct regmap_irq_chip_data **irq_data)
> +{
> +	struct regmap *regmap = chip->regmaps[PM886_REGMAP_BASE];
> +	struct device *dev = &chip->client->dev;
> +	int err;
> +
> +	/* Set interrupt clearing mode to clear on write. */
> +	err = regmap_update_bits(regmap, PM886_REG_MISC_CONFIG2,
> +			PM886_INT_INV | PM886_INT_CLEAR | PM886_INT_MASK_MODE,
> +			PM886_INT_WC);
> +	if (err) {
> +		dev_err(dev, "Failed to set interrupt clearing mode: %d\n", err);
> +		return err;
> +	}
> +
> +	err = devm_regmap_add_irq_chip(dev, regmap, chip->client->irq,
> +					IRQF_ONESHOT, -1, &pm886_regmap_irq_chip,
> +					irq_data);
> +	if (err) {
> +		dev_err(dev, "Failed to request IRQ: %d\n", err);
> +		return err;
> +	}
> +
> +	return 0;
> +}
> +
> +static int pm886_probe(struct i2c_client *client)
> +{
> +	struct regmap_irq_chip_data *irq_data;
> +	struct device *dev = &client->dev;
> +	struct pm886_chip *chip;
> +	struct regmap *regmap;
> +	unsigned int chip_id;
> +	int err;
> +
> +	chip = devm_kzalloc(dev, sizeof(*chip), GFP_KERNEL);
> +	if (!chip)
> +		return -ENOMEM;
> +
> +	chip->client = client;
> +	chip->whoami = (uintptr_t)device_get_match_data(dev);
> +	i2c_set_clientdata(client, chip);
> +
> +	regmap = devm_regmap_init_i2c(client, &pm886_i2c_regmap);
> +	if (IS_ERR(regmap)) {
> +		err = PTR_ERR(regmap);
> +		return dev_err_probe(dev, err, "Failed to initialize regmap\n");
> +	}
> +	chip->regmaps[PM886_REGMAP_BASE] = regmap;
> +
> +	err = regmap_read(regmap, PM886_REG_ID, &chip_id);
> +	if (err)
> +		return dev_err_probe(dev, err, "Failed to read chip ID\n");

'\n'

> +	if (chip->whoami != chip_id)
> +		return dev_err_probe(dev, -EINVAL, "Device reported wrong chip ID: %u\n",

"Unsupported chip"

> +					chip_id);

How many chars does this take up if on one line?

Nit: If you have to break, break after the "-EINVAL" param.

> +
> +	err = pm886_initialize_subregmaps(chip);
> +	if (err)
> +		return err;
> +
> +	err = pm886_setup_irq(chip, &irq_data);
> +	if (err)
> +		return err;
> +
> +	err = devm_mfd_add_devices(dev, 0, pm886_devs, ARRAY_SIZE(pm886_devs),
> +				NULL, 0, regmap_irq_get_domain(irq_data));
> +	if (err)
> +		return dev_err_probe(dev, err, "Failed to add devices\n");
> +
> +	err = devm_register_power_off_handler(dev, pm886_power_off_handler, chip);
> +	if (err)
> +		return dev_err_probe(dev, err, "Failed to register power off handler\n");
> +
> +	device_init_wakeup(dev, device_property_read_bool(dev, "wakeup-source"));
> +
> +	return 0;
> +}
> +
> +const struct of_device_id pm886_of_match[] = {
> +	{ .compatible = "marvell,88pm886-a1", .data = (void *)PM886_A1_CHIP_ID },
> +	{ },
> +};
> +MODULE_DEVICE_TABLE(of, pm886_of_match);
> +
> +static struct i2c_driver pm886_i2c_driver = {
> +	.driver = {
> +		.name = "88pm886",
> +		.of_match_table = pm886_of_match,
> +	},
> +	.probe = pm886_probe,
> +};
> +module_i2c_driver(pm886_i2c_driver);
> +
> +MODULE_DESCRIPTION("Marvell 88PM886 PMIC driver");
> +MODULE_AUTHOR("Karel Balej <balejk@matfyz.cz>");
> +MODULE_LICENSE("GPL");
> diff --git a/drivers/mfd/Kconfig b/drivers/mfd/Kconfig
> index e7a6e45b9fac..9ef921c59f30 100644
> --- a/drivers/mfd/Kconfig
> +++ b/drivers/mfd/Kconfig
> @@ -794,6 +794,18 @@ config MFD_88PM860X
>  	  select individual components like voltage regulators, RTC and
>  	  battery-charger under the corresponding menus.
>  
> +config MFD_88PM886_PMIC
> +	bool "Marvell 88PM886 PMIC"
> +	depends on I2C=y
> +	depends on OF
> +	select REGMAP_I2C
> +	select REGMAP_IRQ
> +	select MFD_CORE
> +	help
> +	  This enables support for Marvell 88PM886 Power Management IC.
> +	  This includes the I2C driver and the core APIs _only_, you have to
> +	  select individual components like onkey under the corresponding menus.
> +
>  config MFD_MAX14577
>  	tristate "Maxim Semiconductor MAX14577/77836 MUIC + Charger Support"
>  	depends on I2C
> diff --git a/drivers/mfd/Makefile b/drivers/mfd/Makefile
> index c66f07edcd0e..d016b7fed354 100644
> --- a/drivers/mfd/Makefile
> +++ b/drivers/mfd/Makefile
> @@ -7,6 +7,7 @@
>  obj-$(CONFIG_MFD_88PM860X)	+= 88pm860x.o
>  obj-$(CONFIG_MFD_88PM800)	+= 88pm800.o 88pm80x.o
>  obj-$(CONFIG_MFD_88PM805)	+= 88pm805.o 88pm80x.o
> +obj-$(CONFIG_MFD_88PM886_PMIC)	+= 88pm886.o
>  obj-$(CONFIG_MFD_ACT8945A)	+= act8945a.o
>  obj-$(CONFIG_MFD_SM501)		+= sm501.o
>  obj-$(CONFIG_ARCH_BCM2835)	+= bcm2835-pm.o
> diff --git a/include/linux/mfd/88pm886.h b/include/linux/mfd/88pm886.h
> new file mode 100644
> index 000000000000..c7527bab0fba
> --- /dev/null
> +++ b/include/linux/mfd/88pm886.h
> @@ -0,0 +1,46 @@
> +/* SPDX-License-Identifier: GPL-2.0-only */
> +#ifndef __MFD_88PM886_H
> +#define __MFD_88PM886_H
> +
> +#include <linux/mfd/core.h>

What's this for?

> +#define PM886_A1_CHIP_ID		0xa1
> +
> +#define PM886_REG_ID			0x00
> +
> +#define PM886_REG_STATUS1		0x01
> +#define PM886_ONKEY_STS1		BIT(0)
> +
> +#define PM886_REG_MISC_CONFIG1		0x14
> +#define PM886_SW_PDOWN			BIT(5)
> +
> +#define PM886_REG_MISC_CONFIG2		0x15
> +#define PM886_INT_INV			BIT(0)
> +#define PM886_INT_CLEAR			BIT(1)
> +#define PM886_INT_RC			0x00
> +#define PM886_INT_WC			BIT(1)
> +#define PM886_INT_MASK_MODE		BIT(2)
> +
> +#define PM886_PAGE_OFFSET_REGULATORS	1
> +
> +enum pm886_regulator_id {
> +	PM886_REGULATOR_ID_LDO2,
> +	PM886_REGULATOR_ID_LDO15,
> +	PM886_REGULATOR_ID_BUCK2,
> +
> +	PM886_REGULATOR_ID_SENTINEL
> +};
> +
> +enum pm886_regmap_index {
> +	PM886_REGMAP_BASE,
> +	PM886_REGMAP_REGULATORS,
> +
> +	PM886_REGMAP_NR
> +};
> +
> +struct pm886_chip {
> +	struct i2c_client *client;
> +	unsigned int whoami;

chip_id

> +	struct regmap *regmaps[PM886_REGMAP_NR];
> +};
> +#endif /* __MFD_88PM886_H */
> -- 
> 2.44.0
> 

-- 
Lee Jones [李琼斯]

