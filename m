Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0D7BB2A63E3
	for <lists+linux-input@lfdr.de>; Wed,  4 Nov 2020 13:07:52 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728523AbgKDMHv (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 4 Nov 2020 07:07:51 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:46721 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1729481AbgKDMHu (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Wed, 4 Nov 2020 07:07:50 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1604491667;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=MYIqumr/TUod3fxLpneCnXJl7Cwbmb61D8YOXZY/RJM=;
        b=ddjKVUfSrfxTXp3jAYL4qy+rXWAzid9FGBx47k4Ys1G3FCRK6gi1FTIvdaj67N1gBWuFWd
        7ETXRl6AvWMc+h/HdVkO+pe0JkV+UdNiSh5A6RPG1bTgzXKa6BNEBEgfIfVLKfJsWAvydM
        EAv+FSfWWTwsbLunxSwAOXJaXr03Ah0=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-222-hv9U4YkJOIWrUb-3SHKpQw-1; Wed, 04 Nov 2020 07:07:46 -0500
X-MC-Unique: hv9U4YkJOIWrUb-3SHKpQw-1
Received: by mail-ed1-f70.google.com with SMTP id n16so8788441edw.19
        for <linux-input@vger.kernel.org>; Wed, 04 Nov 2020 04:07:46 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=MYIqumr/TUod3fxLpneCnXJl7Cwbmb61D8YOXZY/RJM=;
        b=P223AZZHNczUCed7KXNm1pusnsCVAHYn61RO+yzzqXS+/1S1QTgdDPanlOlXAZZnaM
         EfpPdX36C7YEDQCr6PJyRpu4GDhQgLGPmmQV6Q012aYwoW8DEqL5cSIsyu8k9nYaNklq
         k8LRTX65W08NAjqE/Xt1a4uszEiIcmHsh5Bi70I/jG4QndtZ5ccLyWEJFWhabGM3zANY
         h751FKtABMcGwm6YWf2V2WG7rCN846RCBIan06hrTMswo4gPC2fdG+cKQG/nLny3xh0I
         LSDqVaTwTVYbOIyv3+uol/s7tLJTq6Vku6DZkyr/+CB4bnz/d8KN2WbrrW+adOHSP+zT
         8TwA==
X-Gm-Message-State: AOAM530VTQVky6CTBaO9YZ3BGf+XpWwqUSVjylLB4wpCUfADcf0b9RxU
        tYpoNwfu1DI8+msik8R/bba5LZkrf+O+dahFnJ0eCxmYFXWzhWymuA0h4Vabv402mYzJVfnEPO+
        /EJ01BMo40+uUIVSF2I2LCO8=
X-Received: by 2002:aa7:db48:: with SMTP id n8mr18916833edt.123.1604491664609;
        Wed, 04 Nov 2020 04:07:44 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxDSqmWCrNhXIjT7YreEx+UuN0J+Iy2gOhwLgXQczJahJB+s3hPG94XQqz2qtavzf5PwCbkRQ==
X-Received: by 2002:aa7:db48:: with SMTP id n8mr18916814edt.123.1604491664335;
        Wed, 04 Nov 2020 04:07:44 -0800 (PST)
Received: from x1.localdomain (2001-1c00-0c0c-fe00-6c10-fbf3-14c4-884c.cable.dynamic.v6.ziggo.nl. [2001:1c00:c0c:fe00:6c10:fbf3:14c4:884c])
        by smtp.gmail.com with ESMTPSA id bx24sm894687ejb.51.2020.11.04.04.07.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 04 Nov 2020 04:07:43 -0800 (PST)
Subject: Re: [PATCH v4 1/4] HID: i2c-hid: Reorganize so ACPI and OF are
 subclasses
To:     Douglas Anderson <dianders@chromium.org>, jkosina@suse.cz,
        benjamin.tissoires@redhat.com, gregkh@linuxfoundation.org,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc:     linux-input@vger.kernel.org, swboyd@chromium.org,
        andrea@borgia.bo.it, kai.heng.feng@canonical.com,
        robh+dt@kernel.org, Aaron Ma <aaron.ma@canonical.com>,
        Jiri Kosina <jikos@kernel.org>,
        Masahiro Yamada <masahiroy@kernel.org>,
        Pavel Balan <admin@kryma.net>,
        Xiaofei Tan <tanxiaofei@huawei.com>,
        You-Sheng Yang <vicamo.yang@canonical.com>,
        linux-kernel@vger.kernel.org
References: <20201104012929.3850691-1-dianders@chromium.org>
 <20201103172824.v4.1.Ied4ce10d229cd7c69abf13a0361ba0b8d82eb9c4@changeid>
From:   Hans de Goede <hdegoede@redhat.com>
Message-ID: <ea8d8fa3-4e3e-3c56-cda3-c1f6b155018c@redhat.com>
Date:   Wed, 4 Nov 2020 13:07:42 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.3.1
MIME-Version: 1.0
In-Reply-To: <20201103172824.v4.1.Ied4ce10d229cd7c69abf13a0361ba0b8d82eb9c4@changeid>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Hi,

On 11/4/20 2:29 AM, Douglas Anderson wrote:
> This patch rejiggers the i2c-hid code so that the OF (Device Tree) and
> ACPI support is separated out a bit.  The OF and ACPI drivers are now
> effectively "subclasses" of the generic code.
> 
> Essentially, what we're doing here:
> * Make "power up" and "power down" a virtual function that can be
>   (optionally) implemented by subclasses.
> * Each subclass is a drive on its own, so it implements probe / remove
>   / suspend / resume / shutdown.  The core code provides
>   implementations that the subclasses can call into, or fully use for
>   their implementation if they don't have special needs.
> 
> We'll organize this so that we now have 3 modules: the old i2c-hid
> module becomes the "core" module and two new modules will depend on
> it, handling probing the specific device.
> 
> As part of this work, we'll remove the i2c-hid "platform data"
> concept since it's not needed.
> 
> Signed-off-by: Douglas Anderson <dianders@chromium.org>

Thank you for doing this, overall this looks pretty good to me.

Some small comments inline, not a full review.

<snip>

> diff --git a/drivers/hid/i2c-hid/i2c-hid-acpi.c b/drivers/hid/i2c-hid/i2c-hid-acpi.c
> new file mode 100644
> index 000000000000..d4c29dc62297
> --- /dev/null
> +++ b/drivers/hid/i2c-hid/i2c-hid-acpi.c
> @@ -0,0 +1,167 @@
> +/*
> + * HID over I2C ACPI Subclass
> + *
> + * Copyright (c) 2012 Benjamin Tissoires <benjamin.tissoires@gmail.com>
> + * Copyright (c) 2012 Ecole Nationale de l'Aviation Civile, France
> + * Copyright (c) 2012 Red Hat, Inc
> + *
> + * This code was forked out of the core code, which was partly based on
> + * "USB HID support for Linux":
> + *
> + *  Copyright (c) 1999 Andreas Gal
> + *  Copyright (c) 2000-2005 Vojtech Pavlik <vojtech@suse.cz>
> + *  Copyright (c) 2005 Michael Haboustak <mike-@cinci.rr.com> for Concept2, Inc
> + *  Copyright (c) 2007-2008 Oliver Neukum
> + *  Copyright (c) 2006-2010 Jiri Kosina
> + *
> + * This file is subject to the terms and conditions of the GNU General Public
> + * License.  See the file COPYING in the main directory of this archive for
> + * more details.
> + */
> +
> +#include <linux/acpi.h>
> +#include <linux/device.h>
> +#include <linux/i2c.h>
> +#include <linux/kernel.h>
> +#include <linux/module.h>
> +#include <linux/pm.h>
> +
> +#include "i2c-hid.h"
> +
> +struct i2c_hid_acpi {
> +	struct i2chid_subclass_data subclass;

This feels a bit weird, we are the subclass so typically we would
be embedding a base_class data struct here ...

(more remarks below, note just my 2 cents you may want to wait
for feedback from others).

> +	struct i2c_client *client;

You pass this to i2c_hid_core_probe which then stores it own
copy, why not just store it in the subclass (or even better
baseclass) data struct ?

> +	bool power_fixed;
> +};
> +
> +static const struct acpi_device_id i2c_hid_acpi_blacklist[] = {
> +	/*
> +	 * The CHPN0001 ACPI device, which is used to describe the Chipone
> +	 * ICN8505 controller, has a _CID of PNP0C50 but is not HID compatible.
> +	 */
> +	{"CHPN0001", 0 },
> +	{ },
> +};
> +
> +static int i2c_hid_acpi_get_descriptor(struct i2c_client *client)
> +{
> +	static guid_t i2c_hid_guid =
> +		GUID_INIT(0x3CDFF6F7, 0x4267, 0x4555,
> +			  0xAD, 0x05, 0xB3, 0x0A, 0x3D, 0x89, 0x38, 0xDE);
> +	union acpi_object *obj;
> +	struct acpi_device *adev;
> +	acpi_handle handle;
> +	u16 hid_descriptor_address;
> +
> +	handle = ACPI_HANDLE(&client->dev);
> +	if (!handle || acpi_bus_get_device(handle, &adev)) {
> +		dev_err(&client->dev, "Error could not get ACPI device\n");
> +		return -ENODEV;
> +	}
> +
> +	if (acpi_match_device_ids(adev, i2c_hid_acpi_blacklist) == 0)
> +		return -ENODEV;
> +
> +	obj = acpi_evaluate_dsm_typed(handle, &i2c_hid_guid, 1, 1, NULL,
> +				      ACPI_TYPE_INTEGER);
> +	if (!obj) {
> +		dev_err(&client->dev, "Error _DSM call to get HID descriptor address failed\n");
> +		return -ENODEV;
> +	}
> +
> +	hid_descriptor_address = obj->integer.value;
> +	ACPI_FREE(obj);
> +
> +	return hid_descriptor_address;
> +}
> +
> +static int i2c_hid_acpi_power_up_device(struct i2chid_subclass_data *subclass)
> +{
> +	struct i2c_hid_acpi *ihid_of =
> +		container_of(subclass, struct i2c_hid_acpi, subclass);
> +	struct device *dev = &ihid_of->client->dev;
> +	struct acpi_device *adev;
> +
> +	/* Only need to call acpi_device_fix_up_power() the first time */
> +	if (ihid_of->power_fixed)
> +		return 0;
> +	ihid_of->power_fixed = true;
> +
> +	adev = ACPI_COMPANION(dev);
> +	if (adev)
> +		acpi_device_fix_up_power(adev);
> +
> +	return 0;
> +}
> +
> +int i2c_hid_acpi_probe(struct i2c_client *client,
> +		       const struct i2c_device_id *dev_id)
> +{
> +	struct device *dev = &client->dev;
> +	struct i2c_hid_acpi *ihid_acpi;
> +	u16 hid_descriptor_address;
> +	int ret;
> +
> +	ihid_acpi = devm_kzalloc(&client->dev, sizeof(*ihid_acpi), GFP_KERNEL);
> +	if (!ihid_acpi)
> +		return -ENOMEM;
> +
> +	ihid_acpi->subclass.power_up_device = i2c_hid_acpi_power_up_device;
> +
> +	ret = i2c_hid_acpi_get_descriptor(client);
> +	if (ret < 0)
> +		return ret;
> +	hid_descriptor_address = ret;
> +
> +	if (acpi_gbl_FADT.flags & ACPI_FADT_LOW_POWER_S0) {
> +		device_set_wakeup_capable(dev, true);
> +		device_set_wakeup_enable(dev, false);
> +	}
> +
> +	return i2c_hid_core_probe(client, &ihid_acpi->subclass,
> +				  hid_descriptor_address);
> +}
> +
> +static void i2c_hid_acpi_shutdown(struct i2c_client *client)
> +{
> +	i2c_hid_core_shutdown(client);
> +	acpi_device_set_power(ACPI_COMPANION(&client->dev), ACPI_STATE_D3_COLD);
> +}
> +
> +static const struct dev_pm_ops i2c_hid_acpi_pm = {
> +	SET_SYSTEM_SLEEP_PM_OPS(i2c_hid_core_suspend, i2c_hid_core_resume)
> +};
> +
> +static const struct acpi_device_id i2c_hid_acpi_match[] = {
> +	{"ACPI0C50", 0 },
> +	{"PNP0C50", 0 },
> +	{ },
> +};
> +MODULE_DEVICE_TABLE(acpi, i2c_hid_acpi_match);
> +
> +static const struct i2c_device_id i2c_hid_acpi_id_table[] = {
> +	{ "hid", 0 },
> +	{ "hid-over-i2c", 0 },
> +	{ },
> +};
> +MODULE_DEVICE_TABLE(i2c, i2c_hid_acpi_id_table);
> +
> +static struct i2c_driver i2c_hid_acpi_driver = {
> +	.driver = {
> +		.name	= "i2c_hid_acpi",
> +		.pm	= &i2c_hid_acpi_pm,
> +		.probe_type = PROBE_PREFER_ASYNCHRONOUS,
> +		.acpi_match_table = ACPI_PTR(i2c_hid_acpi_match),
> +	},
> +
> +	.probe		= i2c_hid_acpi_probe,
> +	.remove		= i2c_hid_core_remove,
> +	.shutdown	= i2c_hid_acpi_shutdown,
> +	.id_table	= i2c_hid_acpi_id_table,
> +};
> +
> +module_i2c_driver(i2c_hid_acpi_driver);
> +
> +MODULE_DESCRIPTION("HID over I2C ACPI driver");
> +MODULE_AUTHOR("Benjamin Tissoires <benjamin.tissoires@gmail.com>");
> +MODULE_LICENSE("GPL");
> diff --git a/drivers/hid/i2c-hid/i2c-hid-core.c b/drivers/hid/i2c-hid/i2c-hid-core.c
> index aeff1ffb0c8b..7e7303c2a45e 100644
> --- a/drivers/hid/i2c-hid/i2c-hid-core.c
> +++ b/drivers/hid/i2c-hid/i2c-hid-core.c
> @@ -35,12 +35,8 @@
>  #include <linux/kernel.h>
>  #include <linux/hid.h>
>  #include <linux/mutex.h>
> -#include <linux/acpi.h>
> -#include <linux/of.h>
>  #include <linux/regulator/consumer.h>
>  
> -#include <linux/platform_data/i2c-hid.h>
> -
>  #include "../hid-ids.h"
>  #include "i2c-hid.h"
>  
> @@ -156,10 +152,10 @@ struct i2c_hid {
>  
>  	wait_queue_head_t	wait;		/* For waiting the interrupt */
>  
> -	struct i2c_hid_platform_data pdata;
> -
>  	bool			irq_wake_enabled;
>  	struct mutex		reset_lock;
> +
> +	struct i2chid_subclass_data *subclass;
>  };

Personally, I would do things a bit differently here:

1. Just add the

	int (*power_up_device)(struct i2chid_subclass_data *subclass);
	void (*power_down_device)(struct i2chid_subclass_data *subclass);

members which you put in the subclass struct here.

2. Move the declaration of this complete struct to drivers/hid/i2c-hid/i2c-hid.h
and use this as the base-class which I described before (and store the client
pointer here).

3. And then kzalloc both this baseclass struct + the subclass-data
(only the bool "power_fixed" in the ACPI case) in one go in the subclass code
replacing 2 kzallocs (+ error checking with one, simplifying the code and
reducing memory fragmentation (by a tiny sliver).

###

About the power_*_device callbacks, I wonder if it would not be more consistent
to also have a shutdown callback and make i2c_driver.shutdown point to
a (modified) i2c_hid_core_shutdown() function. 

You may also want to consider pointing that shutdown callback to the power_off
function in the of case (in a separate commit as that is a behavioral change).

<snip>

> diff --git a/drivers/hid/i2c-hid/i2c-hid-of.c b/drivers/hid/i2c-hid/i2c-hid-of.c
> new file mode 100644
> index 000000000000..e1838cdef0aa
> --- /dev/null
> +++ b/drivers/hid/i2c-hid/i2c-hid-of.c
> @@ -0,0 +1,149 @@
> +/*
> + * HID over I2C Open Firmware Subclass
> + *
> + * Copyright (c) 2012 Benjamin Tissoires <benjamin.tissoires@gmail.com>
> + * Copyright (c) 2012 Ecole Nationale de l'Aviation Civile, France
> + * Copyright (c) 2012 Red Hat, Inc

<snip>

> +MODULE_DESCRIPTION("HID over I2C OF driver");
> +MODULE_AUTHOR("Benjamin Tissoires <benjamin.tissoires@gmail.com>");

In case Benjamin misses this during his own review: I'm not sure if he
will want to be set as AUTHOR of this, given that part of the plan is
for someone else to be the primary point of contact for the of bits.

> +MODULE_LICENSE("GPL");

<snip>

> diff --git a/include/linux/platform_data/i2c-hid.h b/include/linux/platform_data/i2c-hid.h
> deleted file mode 100644
> index c628bb5e1061..000000000000
> --- a/include/linux/platform_data/i2c-hid.h
> +++ /dev/null
> @@ -1,41 +0,0 @@
> -/*
> - * HID over I2C protocol implementation
> - *
> - * Copyright (c) 2012 Benjamin Tissoires <benjamin.tissoires@gmail.com>
> - * Copyright (c) 2012 Ecole Nationale de l'Aviation Civile, France
> - *
> - * This file is subject to the terms and conditions of the GNU General Public
> - * License.  See the file COPYING in the main directory of this archive for
> - * more details.
> - */
> -
> -#ifndef __LINUX_I2C_HID_H
> -#define __LINUX_I2C_HID_H
> -
> -#include <linux/regulator/consumer.h>
> -#include <linux/types.h>
> -
> -/**
> - * struct i2chid_platform_data - used by hid over i2c implementation.
> - * @hid_descriptor_address: i2c register where the HID descriptor is stored.
> - * @supplies: regulators for powering on the device.
> - * @post_power_delay_ms: delay after powering on before device is usable.
> - *
> - * Note that it is the responsibility of the platform driver (or the acpi 5.0
> - * driver, or the flattened device tree) to setup the irq related to the gpio in
> - * the struct i2c_board_info.
> - * The platform driver should also setup the gpio according to the device:
> - *
> - * A typical example is the following:
> - *	irq = gpio_to_irq(intr_gpio);
> - *	hkdk4412_i2c_devs5[0].irq = irq; // store the irq in i2c_board_info
> - *	gpio_request(intr_gpio, "elan-irq");
> - *	s3c_gpio_setpull(intr_gpio, S3C_GPIO_PULL_UP);
> - */
> -struct i2c_hid_platform_data {
> -	u16 hid_descriptor_address;
> -	struct regulator_bulk_data supplies[2];
> -	int post_power_delay_ms;
> -};
> -
> -#endif /* __LINUX_I2C_HID_H */

Nice, deleting platform_data files is always good :)

Regards,

Hans


