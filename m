Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D2C502A63EC
	for <lists+linux-input@lfdr.de>; Wed,  4 Nov 2020 13:09:56 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729770AbgKDMJt (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 4 Nov 2020 07:09:49 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:43416 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1728700AbgKDMJr (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Wed, 4 Nov 2020 07:09:47 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1604491784;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=8X0S1sv2/i0Zud5qtEP+oQAk7cVps73I9eCINx3qYE8=;
        b=jHQiFFosEYvbljgkp5PpkNoyF1lmgZeF4+B78SikZQAlsfrg0NseZ+AKJbkgOlZwrPRTL4
        vTiZd/EAuhi6YHggvTejNDS4IlHFuSY4MSAkC1LtSl4qc5rwBpFBcnZ7fAiprMHNVHXs32
        rMzzZZ69ed8nDfk3+WuXhryQM4dk1/c=
Received: from mail-ej1-f69.google.com (mail-ej1-f69.google.com
 [209.85.218.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-35-goSOkXjWPaSCBGkODm1zQA-1; Wed, 04 Nov 2020 07:09:42 -0500
X-MC-Unique: goSOkXjWPaSCBGkODm1zQA-1
Received: by mail-ej1-f69.google.com with SMTP id 27so2938242ejy.8
        for <linux-input@vger.kernel.org>; Wed, 04 Nov 2020 04:09:42 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=8X0S1sv2/i0Zud5qtEP+oQAk7cVps73I9eCINx3qYE8=;
        b=uZpEce+cUXtyB87LDOHMkx3MkjT4CtBkkRCKq5+5JWWb1B39txu6y2L4ZQIQuzFIRH
         CJnyq/BiN6dqix3NaEN2CLVWtWGr2sr9lB/WYYKdfIkM23UWaCM++ODXe3zZOYnbrtVv
         TvvxlOiaqedy8d90JQuRph10VXs303fKvZyO5MyQY9BtIlD82dWZeatGPKbMSJWLecqW
         e2c+6Gyx0TfhfM783Dt1vwa18YMyY0blvuq0yedNNgPfMPlqpzSdHpsfX2yubDt3jUg0
         BEuHly+lp6yh7NXUAXTBEptktSYxJexO+2EnWm3l9UvTDPM87NKI7MA4pBtHf3hgX2O0
         kLyg==
X-Gm-Message-State: AOAM530AILqduUhG9/da+WQo5ICjhaKWpRB+6L4/PN+VsOvfxV/16xow
        jf4VFIUrGHReUM/SCmws34sxL8E3Bpe6TsYjyGR8/5tX7xr8bFTFRHIGtSIkABtENxLwxW9W/VV
        unzZqTswgdcDRtwPqE/pZKwA=
X-Received: by 2002:a50:cd09:: with SMTP id z9mr23107414edi.152.1604491781526;
        Wed, 04 Nov 2020 04:09:41 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxWEE71gTDD/ML0iAxSNu3Q2UdAFV3zc69dH9n0thhjduqZawAzfo5twHfc2tzaSzbFJvCAxQ==
X-Received: by 2002:a50:cd09:: with SMTP id z9mr23107388edi.152.1604491781303;
        Wed, 04 Nov 2020 04:09:41 -0800 (PST)
Received: from x1.localdomain (2001-1c00-0c0c-fe00-6c10-fbf3-14c4-884c.cable.dynamic.v6.ziggo.nl. [2001:1c00:c0c:fe00:6c10:fbf3:14c4:884c])
        by smtp.gmail.com with ESMTPSA id a10sm975486edn.77.2020.11.04.04.09.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 04 Nov 2020 04:09:40 -0800 (PST)
Subject: Re: [PATCH v4 4/4] HID: i2c-hid: Introduce goodix-i2c-hid as a
 subclass of i2c-hid
To:     Douglas Anderson <dianders@chromium.org>, jkosina@suse.cz,
        benjamin.tissoires@redhat.com, gregkh@linuxfoundation.org,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc:     linux-input@vger.kernel.org, swboyd@chromium.org,
        andrea@borgia.bo.it, kai.heng.feng@canonical.com,
        robh+dt@kernel.org, Jiri Kosina <jikos@kernel.org>,
        Masahiro Yamada <masahiroy@kernel.org>,
        linux-kernel@vger.kernel.org
References: <20201104012929.3850691-1-dianders@chromium.org>
 <20201103172824.v4.4.If41b7d621633b94d56653c6d53f5f89c5274de7b@changeid>
From:   Hans de Goede <hdegoede@redhat.com>
Message-ID: <f1350d40-53b9-82b0-f463-88ac3c8a6f89@redhat.com>
Date:   Wed, 4 Nov 2020 13:09:40 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.3.1
MIME-Version: 1.0
In-Reply-To: <20201103172824.v4.4.If41b7d621633b94d56653c6d53f5f89c5274de7b@changeid>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Hi,

On 11/4/20 2:29 AM, Douglas Anderson wrote:
> Goodix i2c-hid touchscreens are mostly i2c-hid compliant but have some
> special power sequencing requirements, including the need to drive a
> reset line during the sequencing.
> 
> Let's use the new ability of i2c-hid to have subclasses for power
> sequencing to support the first Goodix i2c-hid touchscreen: GT7375P
> 
> Signed-off-by: Douglas Anderson <dianders@chromium.org>
> ---
> 
> Changes in v4:
> - Totally redid based on the new subclass system.

Again just my 2 cents, but I'm not sure if this should be an
entirely separate driver, or just something added to the
generic drivers/hid/i2c-hid/i2c-hid-of.c code.

I have no real preference either way, just asking the
question to make sure both options are considered.

Regards,

Hans




> Changes in v3:
> - Rework to use subclassing.
> 
>  drivers/hid/i2c-hid/Kconfig             |  19 +++-
>  drivers/hid/i2c-hid/Makefile            |   1 +
>  drivers/hid/i2c-hid/i2c-hid-of-goodix.c | 120 ++++++++++++++++++++++++
>  3 files changed, 138 insertions(+), 2 deletions(-)
>  create mode 100644 drivers/hid/i2c-hid/i2c-hid-of-goodix.c
> 
> diff --git a/drivers/hid/i2c-hid/Kconfig b/drivers/hid/i2c-hid/Kconfig
> index 819b7521c182..a16c6a69680b 100644
> --- a/drivers/hid/i2c-hid/Kconfig
> +++ b/drivers/hid/i2c-hid/Kconfig
> @@ -32,10 +32,25 @@ config I2C_HID_OF
>  	  will be called i2c-hid-of.  It will also build/depend on the
>  	  module i2c-hid.
>  
> +config I2C_HID_OF_GOODIX
> +	tristate "Driver for Goodix hid-i2c based devices on OF systems"
> +	default n
> +	depends on I2C && INPUT && OF
> +	help
> +	  Say Y here if you want support for Goodix i2c devices that use
> +	  the i2c-hid protocol on Open Firmware (Device Tree)-based
> +	  systems.
> +
> +	  If unsure, say N.
> +
> +	  This support is also available as a module.  If so, the module
> +	  will be called i2c-hid-of-goodix.  It will also build/depend on
> +	  the module i2c-hid.
> +
>  endmenu
>  
>  config I2C_HID_CORE
>  	tristate
> -	default y if I2C_HID_ACPI=y || I2C_HID_OF=y
> -	default m if I2C_HID_ACPI=m || I2C_HID_OF=m
> +	default y if I2C_HID_ACPI=y || I2C_HID_OF=y || I2C_HID_OF_GOODIX=y
> +	default m if I2C_HID_ACPI=m || I2C_HID_OF=m || I2C_HID_OF_GOODIX=m
>  	select HID
> diff --git a/drivers/hid/i2c-hid/Makefile b/drivers/hid/i2c-hid/Makefile
> index 9b4a73446841..302545a771f3 100644
> --- a/drivers/hid/i2c-hid/Makefile
> +++ b/drivers/hid/i2c-hid/Makefile
> @@ -10,3 +10,4 @@ i2c-hid-$(CONFIG_DMI)				+= i2c-hid-dmi-quirks.o
>  
>  obj-$(CONFIG_I2C_HID_ACPI)			+= i2c-hid-acpi.o
>  obj-$(CONFIG_I2C_HID_OF)			+= i2c-hid-of.o
> +obj-$(CONFIG_I2C_HID_OF_GOODIX)			+= i2c-hid-of-goodix.o
> diff --git a/drivers/hid/i2c-hid/i2c-hid-of-goodix.c b/drivers/hid/i2c-hid/i2c-hid-of-goodix.c
> new file mode 100644
> index 000000000000..7b27fd8b7401
> --- /dev/null
> +++ b/drivers/hid/i2c-hid/i2c-hid-of-goodix.c
> @@ -0,0 +1,120 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * Driver for Goodix touchscreens that use the i2c-hid protocol.
> + *
> + * Copyright 2020 Google LLC
> + */
> +
> +#include <linux/delay.h>
> +#include <linux/device.h>
> +#include <linux/gpio/consumer.h>
> +#include <linux/i2c.h>
> +#include <linux/kernel.h>
> +#include <linux/module.h>
> +#include <linux/of.h>
> +#include <linux/pm.h>
> +#include <linux/regulator/consumer.h>
> +
> +#include "i2c-hid.h"
> +
> +struct goodix_i2c_hid_timing_data {
> +	unsigned int post_gpio_reset_delay_ms;
> +	unsigned int post_power_delay_ms;
> +};
> +
> +struct i2c_hid_of_goodix {
> +	struct i2chid_subclass_data subclass;
> +
> +	struct regulator *vdd;
> +	struct gpio_desc *reset_gpio;
> +	const struct goodix_i2c_hid_timing_data *timings;
> +};
> +
> +static int goodix_i2c_hid_power_up_device(struct i2chid_subclass_data *subclass)
> +{
> +	struct i2c_hid_of_goodix *ihid_goodix =
> +		container_of(subclass, struct i2c_hid_of_goodix, subclass);
> +	int ret;
> +
> +	ret = regulator_enable(ihid_goodix->vdd);
> +	if (ret)
> +		return ret;
> +
> +	if (ihid_goodix->timings->post_power_delay_ms)
> +		msleep(ihid_goodix->timings->post_power_delay_ms);
> +
> +	gpiod_set_value_cansleep(ihid_goodix->reset_gpio, 0);
> +	if (ihid_goodix->timings->post_gpio_reset_delay_ms)
> +		msleep(ihid_goodix->timings->post_gpio_reset_delay_ms);
> +
> +	return 0;
> +}
> +
> +static void goodix_i2c_hid_power_down_device(struct i2chid_subclass_data *subclass)
> +{
> +	struct i2c_hid_of_goodix *ihid_goodix =
> +		container_of(subclass, struct i2c_hid_of_goodix, subclass);
> +
> +	gpiod_set_value_cansleep(ihid_goodix->reset_gpio, 1);
> +	regulator_disable(ihid_goodix->vdd);
> +}
> +
> +static int i2c_hid_of_goodix_probe(struct i2c_client *client,
> +				   const struct i2c_device_id *id)
> +{
> +	struct i2c_hid_of_goodix *ihid_goodix;
> +
> +	ihid_goodix = devm_kzalloc(&client->dev, sizeof(*ihid_goodix),
> +				   GFP_KERNEL);
> +	if (!ihid_goodix)
> +		return -ENOMEM;
> +
> +	ihid_goodix->subclass.power_up_device = goodix_i2c_hid_power_up_device;
> +	ihid_goodix->subclass.power_down_device = goodix_i2c_hid_power_down_device;
> +
> +	/* Start out with reset asserted */
> +	ihid_goodix->reset_gpio =
> +		devm_gpiod_get_optional(&client->dev, "reset", GPIOD_OUT_HIGH);
> +	if (IS_ERR(ihid_goodix->reset_gpio))
> +		return PTR_ERR(ihid_goodix->reset_gpio);
> +
> +	ihid_goodix->vdd = devm_regulator_get(&client->dev, "vdd");
> +	if (IS_ERR(ihid_goodix->vdd))
> +		return PTR_ERR(ihid_goodix->vdd);
> +
> +	ihid_goodix->timings = device_get_match_data(&client->dev);
> +
> +	return i2c_hid_core_probe(client, &ihid_goodix->subclass, 0x0001);
> +}
> +
> +static const struct goodix_i2c_hid_timing_data goodix_gt7375p_timing_data = {
> +	.post_power_delay_ms = 10,
> +	.post_gpio_reset_delay_ms = 120,
> +};
> +
> +static const struct of_device_id goodix_i2c_hid_of_match[] = {
> +	{ .compatible = "goodix,gt7375p", .data = &goodix_gt7375p_timing_data },
> +	{ }
> +};
> +MODULE_DEVICE_TABLE(of, goodix_i2c_hid_of_match);
> +
> +static const struct dev_pm_ops goodix_i2c_hid_pm = {
> +	SET_SYSTEM_SLEEP_PM_OPS(i2c_hid_core_suspend, i2c_hid_core_resume)
> +};
> +
> +static struct i2c_driver goodix_i2c_hid_ts_driver = {
> +	.driver = {
> +		.name	= "i2c_hid_of_goodix",
> +		.pm	= &goodix_i2c_hid_pm,
> +		.probe_type = PROBE_PREFER_ASYNCHRONOUS,
> +		.of_match_table = of_match_ptr(goodix_i2c_hid_of_match),
> +	},
> +	.probe		= i2c_hid_of_goodix_probe,
> +	.remove		= i2c_hid_core_remove,
> +	.shutdown	= i2c_hid_core_shutdown,
> +};
> +module_i2c_driver(goodix_i2c_hid_ts_driver);
> +
> +MODULE_AUTHOR("Douglas Anderson <dianders@chromium.org>");
> +MODULE_DESCRIPTION("Goodix i2c-hid touchscreen driver");
> +MODULE_LICENSE("GPL v2");
> 

