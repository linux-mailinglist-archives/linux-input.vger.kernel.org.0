Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 29CDB4066B3
	for <lists+linux-input@lfdr.de>; Fri, 10 Sep 2021 07:25:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230271AbhIJF0x (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Fri, 10 Sep 2021 01:26:53 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49000 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230037AbhIJF0x (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Fri, 10 Sep 2021 01:26:53 -0400
Received: from mail-pg1-x533.google.com (mail-pg1-x533.google.com [IPv6:2607:f8b0:4864:20::533])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BDF14C061574;
        Thu,  9 Sep 2021 22:25:42 -0700 (PDT)
Received: by mail-pg1-x533.google.com with SMTP id k24so805359pgh.8;
        Thu, 09 Sep 2021 22:25:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=iRpmxsphW/wez7/Sn8AcASRXVU/7moF0uHf84RItfKc=;
        b=cs9ivGn5TVIdLqpcGdn8+jN2iFm4ADQYi3pYjofs5xRdbDvvN9aPY3X5thcnVWlAgB
         zMjNN0NRUmj0aXad+3qa7VYGyiwdhd1SX1fXHSd3wnwF1uC+88iV96CwfKFEdPILt7ES
         P1++O6eLhwF3nqQwnIfY/wGwT2XQBGQDEjWhgyIkqB7cuPS0KGMsJo1zkUGdEskadSb+
         ncAIgJQZg/npOg3b9YGgSQBIKHtVyRbhxk/+mwOm4dFSchk1JVQsF4z2X5+zMG+wpN2w
         nmeZXpD+0YOmSisotSf4kvDZLuQaP2IeEfFz3AbjzTzZSy6wSExlnoLL8rWeSEahtae9
         Ja5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=iRpmxsphW/wez7/Sn8AcASRXVU/7moF0uHf84RItfKc=;
        b=pZ/Q7yBgEnjCdNUXsL/RnFewaJDHr/fnv+h71ynfQujjA23BmvV6GqP+PfGaUmbDkk
         VNNSf78Zsz0jzAurr98ImdWdzYSBT0pi2b0Ddq/evckAHG8CS+DS4X/7HXkRT01xpgAc
         FIUp/vtF2SJW0/0rioLMs83NA9ihA6jFKFsUOmfgr4nUIgSB2qXsMNb2T/oAcOTSeNXt
         C5OkHFdCrCboqyB9W+Lax0ZpXOOKdF3PCJH6Je7L+TIqXPUy0AKcX+3nglRpLXPoAF1p
         w5/MGiNsj0XWvyoc/qnQiN2ubqGOhKWejk6EZkG+5+TECmRQqvcwisLEYfrpqz7aja6o
         XQyQ==
X-Gm-Message-State: AOAM531Q5qez+bDSpSinbhTUoBtL8nlU/rfWS9uTvAAqgOl0rWeVZMFW
        Y3mzWiLoNS4QmlBtMpYgPzo=
X-Google-Smtp-Source: ABdhPJyquvx3XWHus/YADJGUV34ow41IY8qOuzmfoBsx7JiMNc5RDgPYKY6zmYUVfcbsjjXVnBHqiQ==
X-Received: by 2002:a63:7517:: with SMTP id q23mr5821297pgc.15.1631251542097;
        Thu, 09 Sep 2021 22:25:42 -0700 (PDT)
Received: from google.com ([2620:15c:202:201:acdc:1d22:e20a:2796])
        by smtp.gmail.com with ESMTPSA id d200sm3847751pfd.127.2021.09.09.22.25.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Sep 2021 22:25:41 -0700 (PDT)
Date:   Thu, 9 Sep 2021 22:25:38 -0700
From:   Dmitry Torokhov <dmitry.torokhov@gmail.com>
To:     Yassine Oudjana <y.oudjana@protonmail.com>
Cc:     Rob Herring <robh+dt@kernel.org>, linux-input@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        phone-devel@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht
Subject: Re: [PATCH v4 1/2] Input: cypress-sf - Add Cypress StreetFighter
 touchkey driver
Message-ID: <YTrsUnH3W/aGP3oP@google.com>
References: <20210907174341.422013-1-y.oudjana@protonmail.com>
 <20210907174341.422013-2-y.oudjana@protonmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210907174341.422013-2-y.oudjana@protonmail.com>
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Hi Yassine,

On Tue, Sep 07, 2021 at 05:44:07PM +0000, Yassine Oudjana wrote:
> This adds support for Cypress StreetFighter touchkey controllers such
> as sf3155. This driver supports managing regulators and generating
> input events.
> 
> Due to lack of documentation, this driver is entirely based on
> information gathered from a driver written for an old Android kernel
> fork[1][2].
> 
> Signed-off-by: Yassine Oudjana <y.oudjana@protonmail.com>
> 
> [1] https://github.com/LineageOS/android_kernel_xiaomi_msm8996/blob/lineage-18.1/drivers/input/touchscreen/cyttsp_button.c
> [2] https://github.com/LineageOS/android_kernel_xiaomi_msm8996/blob/lineage-18.1/arch/arm/boot/dts/qcom/a4-msm8996-mtp.dtsi#L291-L314
> ---
> Changes since v3:
>  - Use device_property_read_u32_array to read keycodes.
>  - Read status register into integer first to check for errors.
>  - Use bitmap_xor and for_each_set_bit to check for key state changes.
>  - More code style fixes.
>  - Add MAINTAINERS entry.
> Changes since v2:
>  - Code style fixes.
>  - Added copyright statement.
> Changes since v1:
>  - Changed version variables in probe to int to allow storing error codes.
> 
>  MAINTAINERS                         |   6 +
>  drivers/input/keyboard/Kconfig      |  10 ++
>  drivers/input/keyboard/Makefile     |   1 +
>  drivers/input/keyboard/cypress-sf.c | 219 ++++++++++++++++++++++++++++
>  4 files changed, 236 insertions(+)
>  create mode 100644 drivers/input/keyboard/cypress-sf.c
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 5a61cb2d0cd4..0e6ce2b71829 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -5123,6 +5123,12 @@ L:	linux-input@vger.kernel.org
>  S:	Maintained
>  F:	drivers/input/touchscreen/cy8ctma140.c
>  
> +CYPRESS STREETFIGHTER TOUCHKEYS DRIVER
> +M:	Yassine Oudjana <y.oudjana@protonmail.com>
> +L:	linux-input@vger.kernel.org
> +S:	Maintained
> +F:	drivers/input/keyboard/cypress-sf.c
> +
>  CYTTSP TOUCHSCREEN DRIVER
>  M:	Linus Walleij <linus.walleij@linaro.org>
>  L:	linux-input@vger.kernel.org
> diff --git a/drivers/input/keyboard/Kconfig b/drivers/input/keyboard/Kconfig
> index e75650e98c9e..0c607da9ee10 100644
> --- a/drivers/input/keyboard/Kconfig
> +++ b/drivers/input/keyboard/Kconfig
> @@ -788,4 +788,14 @@ config KEYBOARD_MTK_PMIC
>  	  To compile this driver as a module, choose M here: the
>  	  module will be called pmic-keys.
>  
> +config KEYBOARD_CYPRESS_SF
> +	tristate "Cypress StreetFighter touchkey support"
> +	depends on I2C
> +	help
> +	  Say Y here if you want to enable support for Cypress StreetFighter
> +	  touchkeys.
> +
> +	  To compile this driver as a module, choose M here: the
> +	  module will be called cypress-sf.
> +
>  endif
> diff --git a/drivers/input/keyboard/Makefile b/drivers/input/keyboard/Makefile
> index 1d689fdd5c00..e3c8648f834e 100644
> --- a/drivers/input/keyboard/Makefile
> +++ b/drivers/input/keyboard/Makefile
> @@ -17,6 +17,7 @@ obj-$(CONFIG_KEYBOARD_BCM)		+= bcm-keypad.o
>  obj-$(CONFIG_KEYBOARD_CAP11XX)		+= cap11xx.o
>  obj-$(CONFIG_KEYBOARD_CLPS711X)		+= clps711x-keypad.o
>  obj-$(CONFIG_KEYBOARD_CROS_EC)		+= cros_ec_keyb.o
> +obj-$(CONFIG_KEYBOARD_CYPRESS_SF)	+= cypress-sf.o
>  obj-$(CONFIG_KEYBOARD_DAVINCI)		+= davinci_keyscan.o
>  obj-$(CONFIG_KEYBOARD_DLINK_DIR685)	+= dlink-dir685-touchkeys.o
>  obj-$(CONFIG_KEYBOARD_EP93XX)		+= ep93xx_keypad.o
> diff --git a/drivers/input/keyboard/cypress-sf.c b/drivers/input/keyboard/cypress-sf.c
> new file mode 100644
> index 000000000000..dbd5d627f863
> --- /dev/null
> +++ b/drivers/input/keyboard/cypress-sf.c
> @@ -0,0 +1,219 @@
> +// SPDX-License-Identifier: GPL-2.0-only
> +/*
> + * Cypress StreetFighter Touchkey Driver
> + *
> + * Copyright (c) 2021 Yassine Oudjana <y.oudjana@protonmail.com>
> + */
> +
> +#include <linux/bitmap.h>
> +#include <linux/bitops.h>
> +#include <linux/device.h>
> +#include <linux/i2c.h>
> +#include <linux/input.h>
> +#include <linux/interrupt.h>
> +#include <linux/module.h>
> +#include <linux/pm.h>
> +#include <linux/regulator/consumer.h>
> +
> +#define CYPRESS_SF_DEV_NAME "cypress-sf"
> +
> +#define CYPRESS_SF_REG_BUTTON_STATUS	0x4a
> +
> +struct cypress_sf_data {
> +	struct i2c_client *client;
> +	struct input_dev *input_dev;
> +	struct regulator_bulk_data regulators[2];
> +	u32 *keycodes;
> +	unsigned long keystates;
> +	int num_keys;
> +};
> +
> +static irqreturn_t cypress_sf_irq_handler(int irq, void *devid)
> +{
> +	struct cypress_sf_data *touchkey = devid;
> +	unsigned long keystates, changed;
> +	bool new_state;
> +	int val, key;
> +
> +	val = i2c_smbus_read_byte_data(touchkey->client,
> +					CYPRESS_SF_REG_BUTTON_STATUS);
> +	if (val < 0) {
> +		dev_err(&touchkey->client->dev, "Failed to read button status: %d",
> +			val);
> +		return IRQ_NONE;
> +	}
> +	keystates = val;
> +
> +	bitmap_xor(&changed, &keystates, &touchkey->keystates,
> +		   touchkey->num_keys);
> +
> +	for_each_set_bit(key, &changed, touchkey->num_keys) {
> +		new_state = keystates & BIT(key);
> +		dev_dbg(&touchkey->client->dev,
> +				"Key %d changed to %d", key, new_state);
> +		input_report_key(touchkey->input_dev,
> +				touchkey->keycodes[key],
> +				new_state);
> +	}
> +
> +	input_sync(touchkey->input_dev);
> +	touchkey->keystates = keystates;
> +
> +	return IRQ_HANDLED;
> +}
> +
> +static int cypress_sf_probe(struct i2c_client *client,
> +				const struct i2c_device_id *id)
> +{
> +	struct cypress_sf_data *touchkey;
> +	int key, error;
> +
> +	touchkey = devm_kzalloc(&client->dev, sizeof(*touchkey), GFP_KERNEL);
> +	if (!touchkey)
> +		return -ENOMEM;
> +
> +	touchkey->client = client;
> +	i2c_set_clientdata(client, touchkey);
> +
> +	touchkey->regulators[0].supply = "vdd";
> +	touchkey->regulators[1].supply = "avdd";
> +
> +	error = devm_regulator_bulk_get(&client->dev,
> +					ARRAY_SIZE(touchkey->regulators),
> +					touchkey->regulators);
> +	if (error) {
> +		dev_err(&client->dev, "Failed to get regulators: %d\n", error);
> +		return error;
> +	}
> +
> +	touchkey->num_keys = device_property_read_u32_array(&client->dev,
> +						"linux,keycodes", NULL, 0);
> +	if (touchkey->num_keys < 0) {
> +		/* Default key count */
> +		touchkey->num_keys = 2;
> +	}
> +
> +	touchkey->keycodes = devm_kzalloc(&client->dev,
> +				sizeof(u32) * touchkey->num_keys, GFP_KERNEL);

I changed this to devm_kcalloc().

> +	if (!touchkey->keycodes)
> +		return -ENOMEM;
> +
> +	error = device_property_read_u32_array(&client->dev, "linux,keycodes",
> +						touchkey->keycodes,
> +						touchkey->num_keys);
> +
> +	if (error) {
> +		dev_warn(&client->dev,
> +			"Failed to read keycodes: %d, using defaults\n", error);
> +
> +		/* Default keycodes */
> +		touchkey->keycodes[0] = KEY_BACK;
> +		touchkey->keycodes[1] = KEY_MENU;
> +	}
> +
> +	error = regulator_bulk_enable(ARRAY_SIZE(touchkey->regulators),
> +					touchkey->regulators);
> +	if (error) {
> +		dev_err(&client->dev, "Failed to enable regulators: %d\n", error);
> +		return error;
> +	}
> +
> +	touchkey->input_dev = devm_input_allocate_device(&client->dev);
> +	if (!touchkey->input_dev) {
> +		dev_err(&client->dev, "Failed to allocate input device\n");
> +		return -ENOMEM;
> +	}
> +
> +	touchkey->input_dev->name = CYPRESS_SF_DEV_NAME;
> +	touchkey->input_dev->id.bustype = BUS_I2C;
> +
> +	for (key = 0; key < touchkey->num_keys; ++key)
> +		input_set_capability(touchkey->input_dev, EV_KEY,
> +					touchkey->keycodes[key]);
> +
> +	error = input_register_device(touchkey->input_dev);
> +	if (error) {
> +		dev_err(&client->dev,
> +			"Failed to register input device: %d\n", error);
> +		return error;
> +	}
> +
> +	error = devm_request_threaded_irq(&client->dev, client->irq,
> +					NULL, cypress_sf_irq_handler,
> +					IRQF_ONESHOT,
> +					CYPRESS_SF_DEV_NAME, touchkey);
> +	if (error) {
> +		dev_err(&client->dev,
> +			"Failed to register threaded irq: %d", error);
> +		return error;
> +	}
> +
> +	return 0;
> +};
> +
> +static int __maybe_unused cypress_sf_suspend(struct device *dev)
> +{
> +	struct i2c_client *client = to_i2c_client(dev);
> +	struct cypress_sf_data *touchkey = i2c_get_clientdata(client);
> +	int error;
> +
> +	disable_irq(client->irq);
> +	error = regulator_bulk_disable(ARRAY_SIZE(touchkey->regulators),
> +					touchkey->regulators);
> +	if (error) {
> +		dev_err(dev, "Failed to disable regulators: %d", error);
> +		enable_irq(client->irq);
> +		return error;
> +	}
> +	dev_dbg(dev, "Suspended device");
> +
> +	return 0;
> +}
> +
> +static int __maybe_unused cypress_sf_resume(struct device *dev)
> +{
> +	struct i2c_client *client = to_i2c_client(dev);
> +	struct cypress_sf_data *touchkey = i2c_get_clientdata(client);
> +	int error;
> +
> +	error = regulator_bulk_enable(ARRAY_SIZE(touchkey->regulators),
> +					touchkey->regulators);
> +	if (error) {
> +		dev_err(dev, "Failed to enable regulators: %d", error);
> +		return error;
> +	}
> +	enable_irq(client->irq);
> +	dev_dbg(dev, "Resumed device");
> +
> +	return 0;
> +}
> +
> +static SIMPLE_DEV_PM_OPS(cypress_sf_pm_ops,
> +			 cypress_sf_suspend, cypress_sf_resume);
> +
> +static struct i2c_device_id cypress_sf_id_table[] = {
> +	{ CYPRESS_SF_DEV_NAME, 0 },
> +	{ }
> +};
> +MODULE_DEVICE_TABLE(i2c, cypress_sf_id_table);
> +
> +static const struct of_device_id cypress_sf_of_match[] = {
> +	{ .compatible = "cypress,sf3155", },
> +	{ },
> +};
> +MODULE_DEVICE_TABLE(of, cypress_sf_of_match);

Added #ifdef CONFIG_OF guard here.

> +
> +static struct i2c_driver cypress_sf_driver = {
> +	.driver = {
> +		.name = CYPRESS_SF_DEV_NAME,
> +		.pm = &cypress_sf_pm_ops,
> +		.of_match_table = of_match_ptr(cypress_sf_of_match),
> +	},
> +	.id_table = cypress_sf_id_table,
> +	.probe = cypress_sf_probe,
> +};
> +module_i2c_driver(cypress_sf_driver);
> +
> +MODULE_AUTHOR("Yassine Oudjana <y.oudjana@protonmail.com>");
> +MODULE_DESCRIPTION("Cypress StreetFighter Touchkey Driver");
> +MODULE_LICENSE("GPL v2");
> -- 
> 2.33.0
> 
> 

And applied, thank you.

-- 
Dmitry
