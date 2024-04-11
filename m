Return-Path: <linux-input+bounces-2928-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A56F8A1323
	for <lists+linux-input@lfdr.de>; Thu, 11 Apr 2024 13:37:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 223A728213A
	for <lists+linux-input@lfdr.de>; Thu, 11 Apr 2024 11:37:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AC48214884C;
	Thu, 11 Apr 2024 11:37:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="G1+kv548"
X-Original-To: linux-input@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7988613D258;
	Thu, 11 Apr 2024 11:37:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712835452; cv=none; b=hg7XyKSCxrfbqSN4qjf0YXUGZAghWoKEXXcH+ktPJ6tiNMOECWm8OmGnFZeTlGEnxw6IijCQotccVMWocTH8SF/HhrLZ5yNCcsiUMLsGKFXNCIaDdVNUZubvGUrWegw07lATcPXNH6hdir/uoV0ubOHXJgZRNATqOv0NF+K0d4M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712835452; c=relaxed/simple;
	bh=R9Qx7TxMcEwjqshW3m2D1I/bGjxEyy5r1jfF0S/heEE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=RMRf8rHanO1Hqtw9PMyIhO9coiwZS1imst9bi0pE09eIn2apE+m23NOz/4eZzyKogi+1w0tu4aaAE4sQ406dk5yJ1SoQ34kMChb4cNXfOoIrEGZfz4zKTZQz4PhPr28/GO5Pek1n0+rgxzQ0oT/TMxEhZ+dWG43C32YyWL4U4/0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=G1+kv548; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 657DDC433F1;
	Thu, 11 Apr 2024 11:37:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1712835452;
	bh=R9Qx7TxMcEwjqshW3m2D1I/bGjxEyy5r1jfF0S/heEE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=G1+kv548oYh5IRv4b3xAUPi4JLn+yXPPEYwqEZNqqcQE2rdg1jHJe5mXcQM55zu67
	 S56WSK/YeYZtO5hJ4G4Bbu0TKGgTunrPs0UibRvsDipJXh7Pxdsuo6W+BRCznivmDI
	 6fleGN5OPX3YgTU5n5WPR6jQxEyC5/RE7nhTGGJ4iSEbfeqsUxNVqyQHXWTE55r9TD
	 jpAMECaS+sdnuEwwIXTeVVWsEO0c0zBKwgHJJQ64ASH1JVa5Cy6D1koQdYZ+jgr5tC
	 U9JaUMcNd531cy4cbj1A09qQ64hGTsz2QoHUn8KjFTZ5dmwlxBgCsdafM+eACBmlaA
	 4M/6bquJIlatw==
Date: Thu, 11 Apr 2024 12:37:26 +0100
From: Lee Jones <lee@kernel.org>
To: Karel Balej <balejk@matfyz.cz>
Cc: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-input@vger.kernel.org,
	Duje =?utf-8?Q?Mihanovi=C4=87?= <duje.mihanovic@skole.hr>,
	~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org
Subject: Re: [PATCH 2/5] mfd: add driver for Marvell 88PM886 PMIC
Message-ID: <20240411113726.GH1980182@google.com>
References: <20240331105608.7338-2-balejk@matfyz.cz>
 <20240331105608.7338-4-balejk@matfyz.cz>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240331105608.7338-4-balejk@matfyz.cz>

On Sun, 31 Mar 2024, Karel Balej wrote:

> Marvell 88PM886 is a PMIC which provides various functions such as
> onkey, battery, charger and regulators. It is found for instance in the
> samsung,coreprimevelte smartphone with which this was tested. Implement
> basic support to allow for the use of regulators and onkey.
> 
> Signed-off-by: Karel Balej <balejk@matfyz.cz>
> ---
> 
> Notes:
>     v1:
>     - Address Mark's feedback:
>       - Move regmap config back out of the header and rename it. Also lower
>         its maximum register based on what's actually used in the downstream
>         code.
>     RFC v4:
>     - Use MFD_CELL_* macros.
>     - Address Lee's feedback:
>       - Do not define regmap_config.val_bits and .reg_bits.
>       - Drop everything regulator related except mfd_cell (regmap
>         initialization, IDs enum etc.). Drop pm886_initialize_subregmaps.
>       - Do not store regmap pointers as an array as there is now only one
>         regmap. Also drop the corresponding enum.
>       - Move regmap_config to the header as it is needed in the regulators
>         driver.
>       - pm886_chip.whoami -> chip_id
>       - Reword chip ID mismatch error message and print the ID as
>         hexadecimal.
>       - Fix includes in include/linux/88pm886.h.
>       - Drop the pm886_irq_number enum and define the (for the moment) only
>         IRQ explicitly.
>     - Have only one MFD cell for all regulators as they are now registered
>       all at once in the regulators driver.
>     - Reword commit message.
>     - Make device table static and remove comma after the sentinel to signal
>       that nothing should come after it.
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
>  drivers/mfd/88pm886.c       | 157 ++++++++++++++++++++++++++++++++++++
>  drivers/mfd/Kconfig         |  12 +++
>  drivers/mfd/Makefile        |   1 +
>  include/linux/mfd/88pm886.h |  30 +++++++
>  4 files changed, 200 insertions(+)
>  create mode 100644 drivers/mfd/88pm886.c
>  create mode 100644 include/linux/mfd/88pm886.h
> 
> diff --git a/drivers/mfd/88pm886.c b/drivers/mfd/88pm886.c
> new file mode 100644
> index 000000000000..e06d418a5da9
> --- /dev/null
> +++ b/drivers/mfd/88pm886.c
> @@ -0,0 +1,157 @@
> +// SPDX-License-Identifier: GPL-2.0-only
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
> +#define PM886_IRQ_ONKEY				0
> +
> +#define PM886_REGMAP_CONF_MAX_REG		0xef

Why have you split the defines up between here and the header?

Please place them all in the header.

> +static const struct regmap_config pm886_regmap_config = {
> +	.reg_bits = 8,
> +	.val_bits = 8,
> +	.max_register = PM886_REGMAP_CONF_MAX_REG,
> +};
> +
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
> +	MFD_CELL_RES("88pm886-onkey", pm886_onkey_resources),
> +	MFD_CELL_NAME("88pm886-regulator"),
> +};
> +
> +static int pm886_power_off_handler(struct sys_off_data *sys_off_data)
> +{
> +	struct pm886_chip *chip = sys_off_data->cb_data;
> +	struct regmap *regmap = chip->regmap;
> +	struct device *dev = &chip->client->dev;
> +	int err;
> +
> +	err = regmap_update_bits(regmap, PM886_REG_MISC_CONFIG1, PM886_SW_PDOWN,
> +				PM886_SW_PDOWN);

Use 100-chars to avoid the '\n'.

> +	if (err) {
> +		dev_err(dev, "Failed to power off the device: %d\n", err);
> +		return NOTIFY_BAD;
> +	}
> +	return NOTIFY_DONE;
> +}
> +
> +static int pm886_setup_irq(struct pm886_chip *chip,
> +		struct regmap_irq_chip_data **irq_data)
> +{
> +	struct regmap *regmap = chip->regmap;
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
> +	chip->chip_id = (uintptr_t)device_get_match_data(dev);
> +	i2c_set_clientdata(client, chip);
> +
> +	regmap = devm_regmap_init_i2c(client, &pm886_regmap_config);
> +	if (IS_ERR(regmap))
> +		return dev_err_probe(dev, PTR_ERR(regmap), "Failed to initialize regmap\n");
> +	chip->regmap = regmap;
> +
> +	err = regmap_read(regmap, PM886_REG_ID, &chip_id);
> +	if (err)
> +		return dev_err_probe(dev, err, "Failed to read chip ID\n");
> +
> +	if (chip->chip_id != chip_id)
> +		return dev_err_probe(dev, -EINVAL, "Unsupported chip: 0x%x\n", chip_id);
> +
> +	err = pm886_setup_irq(chip, &irq_data);
> +	if (err)
> +		return err;
> +
> +	err = devm_mfd_add_devices(dev, 0, pm886_devs, ARRAY_SIZE(pm886_devs),

Why 0?

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
> +static const struct of_device_id pm886_of_match[] = {
> +	{ .compatible = "marvell,88pm886-a1", .data = (void *)PM886_A1_CHIP_ID },
> +	{ }
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
> index 4b023ee229cf..d6a762b2bd47 100644
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
> index 000000000000..5ce30a3b85aa
> --- /dev/null
> +++ b/include/linux/mfd/88pm886.h
> @@ -0,0 +1,30 @@
> +/* SPDX-License-Identifier: GPL-2.0-only */
> +#ifndef __MFD_88PM886_H
> +#define __MFD_88PM886_H
> +
> +#include <linux/i2c.h>
> +#include <linux/regmap.h>
> +
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
> +struct pm886_chip {
> +	struct i2c_client *client;
> +	unsigned int chip_id;
> +	struct regmap *regmap;
> +};
> +#endif /* __MFD_88PM886_H */
> -- 
> 2.44.0
> 

-- 
Lee Jones [李琼斯]

