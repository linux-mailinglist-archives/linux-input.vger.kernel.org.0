Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C59FC401666
	for <lists+linux-input@lfdr.de>; Mon,  6 Sep 2021 08:32:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239576AbhIFGcy (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 6 Sep 2021 02:32:54 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36800 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231271AbhIFGcv (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Mon, 6 Sep 2021 02:32:51 -0400
Received: from mail-pj1-x102f.google.com (mail-pj1-x102f.google.com [IPv6:2607:f8b0:4864:20::102f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5CE1FC061575;
        Sun,  5 Sep 2021 23:31:47 -0700 (PDT)
Received: by mail-pj1-x102f.google.com with SMTP id ot2-20020a17090b3b4200b0019127f8ed87so3169649pjb.1;
        Sun, 05 Sep 2021 23:31:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=73QALcmvsQh60MN6pEZ/JexbLSrk3Ky6qdf0LYCIUTY=;
        b=N4rstI4NsNRxIpSvfLA3p3oL+iNKt2Aa/gm6YjBm3fSoxB+lq8I5kHKkff+WNutPrj
         jnYKabLJ9RRUg/ZHs0/4wZCECZ0GZ+OBufeGi1qXkMhb+4JwpIAfTpzd2Ew9X0HekTZz
         m2QQ1t5RRlSHz/QQFueiynmVlKbpbhwowxyVXoXSG17AaVs6zAkBirFv3vt1A3T5+2oR
         MRpt/cPCZ/cwVEgflJld7EfYmiA8o3Kbx061HseFvG0ZQcPIc+vhWm6bg2kcGO/L6DU+
         wNNZCxFQczMaNYow+c7PWPLpTWhAP4jzblfLYNTvAsxICGbk9SS/oHmTcpF6sucDYUY7
         VYtg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=73QALcmvsQh60MN6pEZ/JexbLSrk3Ky6qdf0LYCIUTY=;
        b=iaUbtI0NIwqV2OiauXXG3vccngfKunyy1geyayZ+GmQoebvk0FPJGtDj1prNH20/U3
         tMIvyVTHeRtXub64SfVzQbAvCZ6NW8u8mwkwSG/rNuPkKilvxEArzZzvIgWtLyJni6hD
         IKgqw+nzJVGFzUs3MG6A3dMzUK3prt1oatgGEM/Jp1MhWBmgd50N+3/GG8yAX/Sg1AC2
         kkqRy9Z/5gegyIWZlgBqTxILVIaHsw3i2AFmf1u8VV0KoHcyvaPyU8wH7uJHcUws1DAY
         VDcEfRiHpOYrrdNYK9rsn4qhMqDf53cdGUE5rq83Y3urZDMp+UCKZcKDfjHUJoRFKjwq
         1pfQ==
X-Gm-Message-State: AOAM531x8Fiy5G7xtoahGVkzMSckt/vbn8rRQg8O0367rKAd7imnuH16
        95cpYjjoaeSCW1TZI4Q9oxDMOApc1F8=
X-Google-Smtp-Source: ABdhPJy4XuMW3A4xErSDHBsJggdPkzyP09KSm8FZXy3IyTCH4ixfpC0HvdLXir/2AfyiFawItw07Pw==
X-Received: by 2002:a17:90a:a585:: with SMTP id b5mr12528556pjq.201.1630909906491;
        Sun, 05 Sep 2021 23:31:46 -0700 (PDT)
Received: from google.com ([2620:15c:202:201:4bc3:62de:220d:cd94])
        by smtp.gmail.com with ESMTPSA id j14sm6154425pjg.29.2021.09.05.23.31.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 05 Sep 2021 23:31:45 -0700 (PDT)
Date:   Sun, 5 Sep 2021 23:31:42 -0700
From:   Dmitry Torokhov <dmitry.torokhov@gmail.com>
To:     Yassine Oudjana <y.oudjana@protonmail.com>
Cc:     Rob Herring <robh+dt@kernel.org>, linux-input@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        phone-devel@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht
Subject: Re: [PATCH v3 1/2] Input: cypress-sf - Add Cypress StreetFighter
 touchkey driver
Message-ID: <YTW1zso4zW4RC6N0@google.com>
References: <20210901165231.236728-1-y.oudjana@protonmail.com>
 <20210901165231.236728-2-y.oudjana@protonmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210901165231.236728-2-y.oudjana@protonmail.com>
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Hi Yassine,

On Wed, Sep 01, 2021 at 04:52:58PM +0000, Yassine Oudjana wrote:
> This adds support for Cypress StreetFighter touchkey controllers such as sf3155.
> This driver supports managing regulators and generating input events.
> 
> Due to lack of documentation, this driver is entirely based on information
> gathered from a driver written for an old Android kernel fork[1][2].
> 
> Signed-off-by: Yassine Oudjana <y.oudjana@protonmail.com>

Thank you for the patch. Please run your patches through checkpatch.pl.
See additional comments below.

> 
> [1] https://github.com/LineageOS/android_kernel_xiaomi_msm8996/blob/lineage-18.1/drivers/input/touchscreen/cyttsp_button.c
> [2] https://github.com/LineageOS/android_kernel_xiaomi_msm8996/blob/lineage-18.1/arch/arm/boot/dts/qcom/a4-msm8996-mtp.dtsi#L291-L314
> ---
> Changes since v2:
>  - Code style fixes.
>  - Added copyright statement.
> Changes since v1:
>  - Changed version variables in probe to int to allow storing error codes.
> 
>  drivers/input/keyboard/Kconfig      |  10 ++
>  drivers/input/keyboard/Makefile     |   1 +
>  drivers/input/keyboard/cypress-sf.c | 223 ++++++++++++++++++++++++++++
>  3 files changed, 234 insertions(+)
>  create mode 100644 drivers/input/keyboard/cypress-sf.c
> 
> diff --git a/drivers/input/keyboard/Kconfig b/drivers/input/keyboard/Kconfig
> index 40a070a2e7f5..6f3fbea8b803 100644
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
> index 000000000000..f2862547f633
> --- /dev/null
> +++ b/drivers/input/keyboard/cypress-sf.c
> @@ -0,0 +1,223 @@
> +// SPDX-License-Identifier: GPL-2.0-only
> +/*
> + * Cypress StreetFighter Touchkey Driver
> + *
> + * Copyright (c) 2021 Yassine Oudjana <y.oudjana@protonmail.com>
> + */
> +
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
> +#define CYPRESS_SF_REG_FW_VERSION	0x46
> +#define CYPRESS_SF_REG_HW_VERSION	0x48
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
> +	unsigned long keystates;
> +	bool curr_state, new_state;
> +	int key;
> +
> +	keystates = i2c_smbus_read_byte_data(touchkey->client,
> +					CYPRESS_SF_REG_BUTTON_STATUS);
> +	if (keystates < 0) {

keystates is declared as unsigned, so this condition will never trigger.

> +		dev_err(&touchkey->client->dev, "Failed to read button status");
> +		return IRQ_NONE;
> +	}
> +
> +	for(key = 0; key < touchkey->num_keys; ++key) {
> +		curr_state = test_bit(key, &touchkey->keystates);
> +		new_state = test_bit(key, &keystates);
> +
> +		if(curr_state ^ new_state) {

Instead of this please do

	bitmap_xor(&changed, &keystates, &touchkey->keystates,
		   touchkey->num_keys);
	for_each_set_bit(key, &changed, touchkey->num_keys) {
		...
	}

> +			dev_dbg(&touchkey->client->dev,\
> +				"Key %d changed to %d", key, new_state);
> +			input_report_key(touchkey->input_dev,
> +					touchkey->keycodes[key],
> +					new_state);
> +		}
> +	}
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
> +	int hw_version, fw_version;
> +	int i, ret;
> +
> +	touchkey = devm_kzalloc(&client->dev, sizeof(*touchkey), GFP_KERNEL);
> +	if(!touchkey)
> +		return -ENOMEM;
> +
> +	touchkey->client = client;
> +	i2c_set_clientdata(client, touchkey);
> +
> +	touchkey->regulators[0].supply = "vdd";
> +	touchkey->regulators[1].supply = "avdd";
> +
> +	ret = devm_regulator_bulk_get(&client->dev,
> +					ARRAY_SIZE(touchkey->regulators),
> +					touchkey->regulators);
> +	if(ret) {
> +		dev_err(&client->dev, "Failed to get regulators: %d\n", ret);
> +		return ret;
> +	}
> +
> +	touchkey->num_keys = of_property_count_elems_of_size(client->dev.of_node,
> +							"linux,keycodes",
> +							sizeof(u32));

Please use device_property_* API instead of of_property_*.

> +	if(touchkey->num_keys < 0)
> +		/* Default key count */
> +		touchkey->num_keys = 2;
> +
> +	touchkey->keycodes = devm_kzalloc(&client->dev,
> +				sizeof(u32) * touchkey->num_keys, GFP_KERNEL);
> +	if(!touchkey->keycodes)
> +		return -ENOMEM;
> +
> +	ret = of_property_read_u32_array(client->dev.of_node, "linux,keycodes",
> +						touchkey->keycodes, touchkey->num_keys);
> +
> +	if(touchkey->num_keys < 0) {
> +		/* Default keycodes */
> +		touchkey->keycodes[0] = KEY_BACK;
> +		touchkey->keycodes[1] = KEY_MENU;
> +	}
> +
> +	ret = regulator_bulk_enable(ARRAY_SIZE(touchkey->regulators),
> +					touchkey->regulators);

Please call variables that carry error core or 0 for success 'error'.

> +	if(ret) {
> +		dev_err(&client->dev, "Failed to enable regulators: %d\n", ret);
> +		return ret;
> +	}
> +
> +	touchkey->input_dev = devm_input_allocate_device(&client->dev);
> +	if(!touchkey->input_dev) {
> +		dev_err(&client->dev, "Failed to allocate input device\n");
> +		return -ENOMEM;
> +	}
> +
> +	touchkey->input_dev->name = CYPRESS_SF_DEV_NAME;
> +	touchkey->input_dev->id.bustype = BUS_I2C;
> +
> +	hw_version = i2c_smbus_read_byte_data(touchkey->client,
> +				CYPRESS_SF_REG_HW_VERSION);
> +	fw_version = i2c_smbus_read_word_data(touchkey->client,
> +				CYPRESS_SF_REG_FW_VERSION);
> +	if(hw_version < 0 || fw_version < 0)
> +		dev_warn(&client->dev, "Failed to read versions\n");
> +	else
> +		dev_info(&client->dev, "HW version %d, FW version %d\n",
> +				hw_version, fw_version);

Why is this needed?

> +
> +	for(i = 0; i < touchkey->num_keys; ++i)
> +		input_set_capability(touchkey->input_dev, EV_KEY,
> +					touchkey->keycodes[i]);
> +
> +	ret = input_register_device(touchkey->input_dev);
> +	if(ret) {
> +		dev_err(&client->dev,
> +			"Failed to register input device: %d\n", ret);
> +		return ret;
> +	}
> +
> +	ret = devm_request_threaded_irq(&client->dev, client->irq,
> +					NULL, cypress_sf_irq_handler,
> +					IRQF_ONESHOT,
> +					CYPRESS_SF_DEV_NAME, touchkey);
> +	if(ret) {
> +		dev_err(&client->dev,
> +			"Failed to register threaded irq: %d", ret);
> +		return ret;
> +	}
> +
> +	return 0;
> +};
> +
> +static int __maybe_unused cypress_sf_suspend(struct device *dev) {
> +	struct i2c_client *client = to_i2c_client(dev);
> +	struct cypress_sf_data *touchkey = i2c_get_clientdata(client);
> +	int ret;
> +
> +	disable_irq(client->irq);
> +	ret = regulator_bulk_disable(ARRAY_SIZE(touchkey->regulators),
> +					touchkey->regulators);
> +	if(ret) {
> +		dev_err(dev, "Failed to disable regulators: %d", ret);
> +		enable_irq(client->irq);
> +		return ret;
> +	}
> +	dev_dbg(dev, "Suspended device");
> +
> +	return 0;
> +}
> +
> +static int __maybe_unused cypress_sf_resume(struct device *dev) {
> +	struct i2c_client *client = to_i2c_client(dev);
> +	struct cypress_sf_data *touchkey = i2c_get_clientdata(client);
> +	int ret;
> +
> +	ret = regulator_bulk_enable(ARRAY_SIZE(touchkey->regulators),
> +					touchkey->regulators);
> +	if(ret) {
> +		dev_err(dev, "Failed to enable regulators: %d", ret);
> +		return ret;
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

Thanks.

-- 
Dmitry
