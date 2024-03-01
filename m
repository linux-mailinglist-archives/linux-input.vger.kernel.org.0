Return-Path: <linux-input+bounces-2129-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E90B86DE03
	for <lists+linux-input@lfdr.de>; Fri,  1 Mar 2024 10:17:32 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id BE53A1C21606
	for <lists+linux-input@lfdr.de>; Fri,  1 Mar 2024 09:17:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D37206A8A2;
	Fri,  1 Mar 2024 09:17:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="GHWwlgAW"
X-Original-To: linux-input@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B3546A014;
	Fri,  1 Mar 2024 09:17:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709284642; cv=none; b=Xtp4gYLh0qcd+TDu7b5RFMOLpg6FZmJK0F4kElauD5Tm0BouFbY3pOek7yL1k7A8C81jNeMus4MpLnw2Lp7/FH3ZV/9IOLgMKGdei/HT31bxfgwzoGcElQY392VtlkoIARMz2E3DUSzlous+xzh1F41X/1cWuQYE3MAen5Hx7Rk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709284642; c=relaxed/simple;
	bh=fdb8EJldy7nGyvwgGPPoNt2RdYOXsAgc1NZdAUBmQ5g=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=gBajubwbqYEarm+8TItTzCNmP6p/y/kXsxjECvT4SzuUr38p08omS2Rt3gdvOAevQ0T9dXbJb/U1M7Y+LzaSY3LRNBDKZntty4KkTcbgq+RiK2G+KUMxWnL4wfz3VQTXlOvKsjiyGnaJ+qQR4g8gPu2gyL/iB9ZzH/ICheFeiJQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=GHWwlgAW; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EC0DAC43394;
	Fri,  1 Mar 2024 09:17:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1709284642;
	bh=fdb8EJldy7nGyvwgGPPoNt2RdYOXsAgc1NZdAUBmQ5g=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=GHWwlgAW5PgZ/inTsIc8B/RKla0xI2OrQas39Bu67uh9ExxTgF3+pACHKqf2C+DAQ
	 cMbsFVbzuUV1/k4cyi2hgNOxS8JTqAU4QAWpc1cwXPiQ1Y0BxI9W4vwefBXvcV9dV9
	 wr9eC4aexok4M0Wks5bB3wEX9ICP2m+v3lYgFTQGaftqxP/w9LVfHxZ7FPrXqM8KQR
	 4A+pI9fKK5/ZeAL+grERbWBCCrykQ8GBxZBXWilFEZE4SzWVD/r80tPBv+lOzkTdzm
	 3MhjOd0wh/uWCIuJFGeqIMf8R3hDpKPchZhz20Ztu3TQJndIie5jvOcFoJfT0zWJin
	 l1OTer5N6DlWQ==
Date: Fri, 1 Mar 2024 09:17:16 +0000
From: Lee Jones <lee@kernel.org>
To: James Ogletree <jogletre@opensource.cirrus.com>
Cc: dmitry.torokhov@gmail.com, robh+dt@kernel.org,
	krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org,
	broonie@kernel.org, jeff@labundy.com, patches@opensource.cirrus.com,
	linux-sound@vger.kernel.org, linux-input@vger.kernel.org,
	devicetree@vger.kernel.org
Subject: Re: [PATCH v8 3/5] mfd: cs40l50: Add support for CS40L50 core driver
Message-ID: <20240301091716.GA1688857@google.com>
References: <20240221003630.2535938-1-jogletre@opensource.cirrus.com>
 <20240221003630.2535938-4-jogletre@opensource.cirrus.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240221003630.2535938-4-jogletre@opensource.cirrus.com>

On Wed, 21 Feb 2024, James Ogletree wrote:

> Introduce support for Cirrus Logic Device CS40L50: a
> haptic driver with waveform memory, integrated DSP,
> and closed-loop algorithms.
> 
> The MFD component registers and initializes the device.
> 
> Signed-off-by: James Ogletree <jogletre@opensource.cirrus.com>
> ---
>  MAINTAINERS                 |   2 +
>  drivers/mfd/Kconfig         |  30 ++
>  drivers/mfd/Makefile        |   4 +
>  drivers/mfd/cs40l50-core.c  | 531 ++++++++++++++++++++++++++++++++++++
>  drivers/mfd/cs40l50-i2c.c   |  69 +++++
>  drivers/mfd/cs40l50-spi.c   |  69 +++++
>  include/linux/mfd/cs40l50.h | 142 ++++++++++
>  7 files changed, 847 insertions(+)
>  create mode 100644 drivers/mfd/cs40l50-core.c
>  create mode 100644 drivers/mfd/cs40l50-i2c.c
>  create mode 100644 drivers/mfd/cs40l50-spi.c
>  create mode 100644 include/linux/mfd/cs40l50.h

Mostly fine, just a few nits.

Assumingly this needs to go in via one tree (usually MFD).

I can't do so until the other maintainers have provided Acks.

[...]

> +static struct regmap_irq_chip cs40l50_irq_chip = {
> +	.name =		"CS40L50 IRQ Controller",
> +
> +	.status_base =	CS40L50_IRQ1_INT_1,
> +	.mask_base =	CS40L50_IRQ1_MASK_1,
> +	.ack_base =	CS40L50_IRQ1_INT_1,
> +	.num_regs =	22,
> +
> +	.irqs =		cs40l50_reg_irqs,
> +	.num_irqs =	ARRAY_SIZE(cs40l50_reg_irqs),
> +
> +	.runtime_pm =	true,
> +};
> +
> +int cs40l50_dsp_write(struct device *dev, struct regmap *regmap, u32 val)
> +{
> +	int err, i;
> +	u32 ack;
> +
> +	/* Device NAKs if exiting hibernation, so optionally retry here */
> +	for (i = 0; i < CS40L50_DSP_TIMEOUT_COUNT; i++) {
> +		err = regmap_write(regmap, CS40L50_DSP_QUEUE, val);
> +		if (!err)
> +			break;
> +
> +		usleep_range(CS40L50_DSP_POLL_US, CS40L50_DSP_POLL_US + 100);
> +	}
> +
> +	/* If we never wrote, don't bother checking for ACK */

"If the write never took place, no need to check for the ACK"

> +	if (i == CS40L50_DSP_TIMEOUT_COUNT) {
> +		dev_err(dev, "Timed out writing %#X to DSP: %d\n", val, err);
> +		return err;
> +	}
> +
> +	err = regmap_read_poll_timeout(regmap, CS40L50_DSP_QUEUE, ack, !ack,
> +				       CS40L50_DSP_POLL_US,
> +				       CS40L50_DSP_POLL_US * CS40L50_DSP_TIMEOUT_COUNT);
> +	if (err)
> +		dev_err(dev, "DSP did not ack %#X: %d\n", val, err);
> +
> +	return err;
> +}
> +EXPORT_SYMBOL_GPL(cs40l50_dsp_write);
> +
> +static const struct cs_dsp_region cs40l50_dsp_regions[] = {
> +	{ .type = WMFW_HALO_PM_PACKED, .base = CS40L50_PMEM_0 },
> +	{ .type = WMFW_HALO_XM_PACKED, .base = CS40L50_XMEM_PACKED_0 },
> +	{ .type = WMFW_HALO_YM_PACKED, .base = CS40L50_YMEM_PACKED_0 },
> +	{ .type = WMFW_ADSP2_XM, .base = CS40L50_XMEM_UNPACKED24_0 },
> +	{ .type = WMFW_ADSP2_YM, .base = CS40L50_YMEM_UNPACKED24_0 },
> +};
> +
> +static void cs40l50_dsp_remove(void *data)
> +{
> +	cs_dsp_remove((struct cs_dsp *)data);

Is the cast required?

Where is this function?

> +}
> +
> +static const struct cs_dsp_client_ops cs40l50_client_ops;

What's this for?  Where is it used?

In general, I'm not a fan of empty struct definitions like this.

> +static int cs40l50_dsp_init(struct cs40l50 *cs40l50)
> +{
> +	int err;
> +
> +	cs40l50->dsp.num = 1;
> +	cs40l50->dsp.type = WMFW_HALO;
> +	cs40l50->dsp.dev = cs40l50->dev;
> +	cs40l50->dsp.regmap = cs40l50->regmap;
> +	cs40l50->dsp.base = CS40L50_CORE_BASE;
> +	cs40l50->dsp.base_sysinfo = CS40L50_SYS_INFO_ID;
> +	cs40l50->dsp.mem = cs40l50_dsp_regions;
> +	cs40l50->dsp.num_mems = ARRAY_SIZE(cs40l50_dsp_regions);
> +	cs40l50->dsp.no_core_startstop = true;
> +	cs40l50->dsp.client_ops = &cs40l50_client_ops;
> +
> +	err = cs_dsp_halo_init(&cs40l50->dsp);
> +	if (err)
> +		return err;
> +
> +	return devm_add_action_or_reset(cs40l50->dev, cs40l50_dsp_remove,
> +					&cs40l50->dsp);
> +}

[...]

> +++ b/drivers/mfd/cs40l50-i2c.c
> @@ -0,0 +1,69 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * CS40L50 Advanced Haptic Driver with waveform memory,
> + * integrated DSP, and closed-loop algorithms
> + *
> + * Copyright 2024 Cirrus Logic, Inc.
> + *
> + * Author: James Ogletree <james.ogletree@cirrus.com>
> + */
> +
> +#include <linux/i2c.h>
> +#include <linux/mfd/cs40l50.h>
> +
> +static int cs40l50_i2c_probe(struct i2c_client *client)
> +{
> +	struct device *dev = &client->dev;
> +	struct cs40l50 *cs40l50;
> +
> +	cs40l50 = devm_kzalloc(dev, sizeof(*cs40l50), GFP_KERNEL);
> +	if (!cs40l50)
> +		return -ENOMEM;
> +
> +	i2c_set_clientdata(client, cs40l50);
> +
> +	cs40l50->regmap = devm_regmap_init_i2c(client, &cs40l50_regmap);
> +	if (IS_ERR(cs40l50->regmap))
> +		return dev_err_probe(cs40l50->dev, PTR_ERR(cs40l50->regmap),
> +				     "Failed to initialize register map\n");
> +
> +	cs40l50->dev = dev;
> +	cs40l50->irq = client->irq;
> +
> +	return cs40l50_probe(cs40l50);
> +}
> +
> +static void cs40l50_i2c_remove(struct i2c_client *client)
> +{
> +	struct cs40l50 *cs40l50 = i2c_get_clientdata(client);
> +
> +	cs40l50_remove(cs40l50);
> +}
> +
> +static const struct i2c_device_id cs40l50_id_i2c[] = {
> +	{"cs40l50"},

Spaces either side of the "s

> +	{}
> +};
> +MODULE_DEVICE_TABLE(i2c, cs40l50_id_i2c);
> +
> +static const struct of_device_id cs40l50_of_match[] = {
> +	{ .compatible = "cirrus,cs40l50" },
> +	{}
> +};
> +MODULE_DEVICE_TABLE(of, cs40l50_of_match);
> +
> +static struct i2c_driver cs40l50_i2c_driver = {
> +	.driver = {
> +		.name = "cs40l50",
> +		.of_match_table = cs40l50_of_match,
> +		.pm = pm_ptr(&cs40l50_pm_ops),
> +	},
> +	.id_table = cs40l50_id_i2c,
> +	.probe = cs40l50_i2c_probe,
> +	.remove = cs40l50_i2c_remove,
> +};
> +module_i2c_driver(cs40l50_i2c_driver);
> +
> +MODULE_DESCRIPTION("CS40L50 I2C Driver");
> +MODULE_AUTHOR("James Ogletree, Cirrus Logic Inc. <james.ogletree@cirrus.com>");
> +MODULE_LICENSE("GPL");
> diff --git a/drivers/mfd/cs40l50-spi.c b/drivers/mfd/cs40l50-spi.c
> new file mode 100644
> index 000000000000..9e18bb74eae0
> --- /dev/null
> +++ b/drivers/mfd/cs40l50-spi.c
> @@ -0,0 +1,69 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * CS40L50 Advanced Haptic Driver with waveform memory,
> + * integrated DSP, and closed-loop algorithms
> + *
> + * Copyright 2024 Cirrus Logic, Inc.
> + *
> + * Author: James Ogletree <james.ogletree@cirrus.com>
> + */
> +
> +#include <linux/mfd/cs40l50.h>
> +#include <linux/spi/spi.h>
> +
> +static int cs40l50_spi_probe(struct spi_device *spi)
> +{
> +	struct cs40l50 *cs40l50;
> +	struct device *dev = &spi->dev;
> +
> +	cs40l50 = devm_kzalloc(dev, sizeof(*cs40l50), GFP_KERNEL);
> +	if (!cs40l50)
> +		return -ENOMEM;
> +
> +	spi_set_drvdata(spi, cs40l50);
> +
> +	cs40l50->regmap = devm_regmap_init_spi(spi, &cs40l50_regmap);
> +	if (IS_ERR(cs40l50->regmap))
> +		return dev_err_probe(cs40l50->dev, PTR_ERR(cs40l50->regmap),
> +				     "Failed to initialize register map\n");
> +
> +	cs40l50->dev = dev;
> +	cs40l50->irq = spi->irq;
> +
> +	return cs40l50_probe(cs40l50);
> +}
> +
> +static void cs40l50_spi_remove(struct spi_device *spi)
> +{
> +	struct cs40l50 *cs40l50 = spi_get_drvdata(spi);
> +
> +	cs40l50_remove(cs40l50);
> +}
> +
> +static const struct spi_device_id cs40l50_id_spi[] = {
> +	{"cs40l50"},

As above.

> +	{}
> +};
> +MODULE_DEVICE_TABLE(spi, cs40l50_id_spi);
> +
> +static const struct of_device_id cs40l50_of_match[] = {
> +	{ .compatible = "cirrus,cs40l50" },
> +	{}
> +};
> +MODULE_DEVICE_TABLE(of, cs40l50_of_match);
> +
> +static struct spi_driver cs40l50_spi_driver = {
> +	.driver = {
> +		.name = "cs40l50",
> +		.of_match_table = cs40l50_of_match,
> +		.pm = pm_ptr(&cs40l50_pm_ops),
> +	},
> +	.id_table = cs40l50_id_spi,
> +	.probe = cs40l50_spi_probe,
> +	.remove = cs40l50_spi_remove,
> +};
> +module_spi_driver(cs40l50_spi_driver);
> +
> +MODULE_DESCRIPTION("CS40L50 SPI Driver");
> +MODULE_AUTHOR("James Ogletree, Cirrus Logic Inc. <james.ogletree@cirrus.com>");
> +MODULE_LICENSE("GPL");
> diff --git a/include/linux/mfd/cs40l50.h b/include/linux/mfd/cs40l50.h
> new file mode 100644
> index 000000000000..d855784a88a9
> --- /dev/null
> +++ b/include/linux/mfd/cs40l50.h
> @@ -0,0 +1,142 @@
> +/* SPDX-License-Identifier: GPL-2.0
> + *
> + * CS40L50 Advanced Haptic Driver with waveform memory,
> + * integrated DSP, and closed-loop algorithms
> + *
> + * Copyright 2024 Cirrus Logic, Inc.
> + *
> + * Author: James Ogletree <james.ogletree@cirrus.com>
> + */
> +
> +#ifndef __CS40L50_H__
> +#define __CS40L50_H__

MFD_

And at the bottom of this file.

[...]

> +int cs40l50_dsp_write(struct device *dev, struct regmap *regmap, u32 val);
> +int cs40l50_probe(struct cs40l50 *cs40l50);
> +int cs40l50_remove(struct cs40l50 *cs40l50);
> +
> +extern const struct regmap_config cs40l50_regmap;
> +extern const struct dev_pm_ops cs40l50_pm_ops;
> +
> +#endif /* __CS40L50_H__ */

Here.

-- 
Lee Jones [李琼斯]

