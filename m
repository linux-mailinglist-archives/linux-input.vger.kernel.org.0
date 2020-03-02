Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 05053175E57
	for <lists+linux-input@lfdr.de>; Mon,  2 Mar 2020 16:40:20 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727072AbgCBPkT (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 2 Mar 2020 10:40:19 -0500
Received: from us-smtp-delivery-1.mimecast.com ([205.139.110.120]:52454 "EHLO
        us-smtp-1.mimecast.com" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
        with ESMTP id S1726751AbgCBPkS (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Mon, 2 Mar 2020 10:40:18 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1583163616;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=u5RSBNV//k1MMQZ8X1mHko3UiG7wvyN6+6kHQh/Gi4o=;
        b=M7jp2r0suZy57l7NiUlP/K3VFlw1QtaN/HTmLYxICWdwmNtvyY4mqO+c5A+WeG7oiS9RWR
        6bkY3g9tb4J3xveN9GiiuY9i6Km/CvGc703uKabDy04zc+mWJ4oAI4DPZVa4V52mWPHG3k
        V7NahtrMPob13t2dKX9smAFvI1xo1hE=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-374-iAyEAzNlM_OSbLXQM4UwFQ-1; Mon, 02 Mar 2020 10:40:11 -0500
X-MC-Unique: iAyEAzNlM_OSbLXQM4UwFQ-1
Received: by mail-wm1-f69.google.com with SMTP id j130so3033108wmj.9
        for <linux-input@vger.kernel.org>; Mon, 02 Mar 2020 07:40:11 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=u5RSBNV//k1MMQZ8X1mHko3UiG7wvyN6+6kHQh/Gi4o=;
        b=eXxUsvcZD7Byk1XAuJikZiihAnXQF8in8hCkyYD1X017qQExPeOlZTjFyMy04z3IKG
         dBLLoMGzf2/vOWgQjjT2el5xI4XXrVNc14nJ4gVKfVAtn1t8rKfS9Co7jOopvuVBtDf1
         T+RNi7DCMJ8ur908sjCPygUjo09GekHekbeC0w6p8UsD/x9vcojM/S4xboh0yqgwXNpa
         18g0hmmTkM8nV6QjsTGFSwgvHrqsw37/QILlmJfmKKiybLIpq9zx2/LbTdAEPwgilrDs
         Bbkj2/8dPja7JSEAtU0b6OVbre8Zg/gflrEZvN7bz+ZFpTi34ASDXrJnGaezcW5lXFbJ
         /3bA==
X-Gm-Message-State: ANhLgQ2woor90ojom44xUuPKmQbSGDG59+RmMVjpPOl+RN79RxMpGDD8
        GMesZYv12LAHmC426L4u/R9zTqbMlqVCAcW391tKjGNvYErRUqXIEvYyPBcqzRjrij9m6+GkOil
        kYYbt3ZIrxdKBbzbEWktY10s=
X-Received: by 2002:a5d:4247:: with SMTP id s7mr242053wrr.66.1583163610031;
        Mon, 02 Mar 2020 07:40:10 -0800 (PST)
X-Google-Smtp-Source: ADFU+vvXTODqX9QLMwDHtoAR4hq7o7MJK0xeqdG0l5SEf0S+tMDsU9U28MNtMVcPxuSwmI0M8MIZpg==
X-Received: by 2002:a5d:4247:: with SMTP id s7mr242027wrr.66.1583163609711;
        Mon, 02 Mar 2020 07:40:09 -0800 (PST)
Received: from x1.localdomain (2001-1c00-0c0c-fe00-fc7e-fd47-85c1-1ab3.cable.dynamic.v6.ziggo.nl. [2001:1c00:c0c:fe00:fc7e:fd47:85c1:1ab3])
        by smtp.gmail.com with ESMTPSA id 18sm16492088wmf.1.2020.03.02.07.40.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 02 Mar 2020 07:40:09 -0800 (PST)
Subject: Re: [PATCH resend 04/10] Input: goodix - Add support for getting IRQ
 + reset GPIOs on Cherry Trail devices
To:     Bastien Nocera <hadess@hadess.net>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc:     linux-input@vger.kernel.org, Dmitry Mastykin <mastichi@gmail.com>
References: <20200221164735.508324-1-hdegoede@redhat.com>
 <20200221164735.508324-4-hdegoede@redhat.com>
 <d387bb62dee39cb16bb27371c1e5764cb856c6b5.camel@hadess.net>
From:   Hans de Goede <hdegoede@redhat.com>
Message-ID: <1b90d2d4-5cf4-3017-9e06-6a9187a73ca5@redhat.com>
Date:   Mon, 2 Mar 2020 16:40:08 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <d387bb62dee39cb16bb27371c1e5764cb856c6b5.camel@hadess.net>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Hi,

On 3/2/20 12:23 PM, Bastien Nocera wrote:
> On Fri, 2020-02-21 at 17:47 +0100, Hans de Goede wrote:
>> On most Cherry Trail (x86, UEFI + ACPI) devices the ACPI tables do
>> not have
>> a _DSD with a "daffd814-6eba-4d8c-8a91-bc9bbf4aa301" UUID, adding
>> "irq-gpios" and "reset-gpios" mappings, so we cannot get the GPIOS by
>> name
>> without first manually adding mappings ourselves.
>>
>> These devices contain 1 GpioInt and 1 GpioIo resource in their _CRS
>> table.
>> There is no fixed order for these 2. This commit adds code to check
>> that
>> there is 1 of each as expected and then registers a mapping matching
>> their
>> order using devm_acpi_dev_add_driver_gpios().
>>
>> This gives us access to both GPIOs allowing us to properly suspend
>> the
>> controller during suspend, and making it possible to reset the
>> controller
>> if necessary.
> 
> Can you include the DSDT snippet that defines those GPIOs in the commit
> message?

Will do for v2 of this series.

>> BugLink: https://bugzilla.redhat.com/show_bug.cgi?id=1786317
>> BugLink: https://github.com/nexus511/gpd-ubuntu-packages/issues/10
>> BugLink: https://bugzilla.kernel.org/show_bug.cgi?id=199207
>> Cc: Dmitry Mastykin <mastichi@gmail.com>
>> Signed-off-by: Hans de Goede <hdegoede@redhat.com>
>> ---
>>   drivers/input/touchscreen/goodix.c | 113
>> ++++++++++++++++++++++++++++-
>>   1 file changed, 109 insertions(+), 4 deletions(-)
>>
>> diff --git a/drivers/input/touchscreen/goodix.c
>> b/drivers/input/touchscreen/goodix.c
>> index dd5a8f9e8ada..9de2f325ac6e 100644
>> --- a/drivers/input/touchscreen/goodix.c
>> +++ b/drivers/input/touchscreen/goodix.c
>> @@ -34,6 +34,7 @@ struct goodix_ts_data;
>>   enum goodix_irq_pin_access_method {
>>   	irq_pin_access_none,
>>   	irq_pin_access_gpio,
>> +	irq_pin_access_acpi_gpio,
>>   };
>>   
>>   struct goodix_chip_data {
>> @@ -53,6 +54,8 @@ struct goodix_ts_data {
>>   	struct regulator *vddio;
>>   	struct gpio_desc *gpiod_int;
>>   	struct gpio_desc *gpiod_rst;
>> +	int gpio_count;
>> +	int gpio_int_idx;
>>   	u16 id;
>>   	u16 version;
>>   	const char *cfg_name;
>> @@ -521,6 +524,12 @@ static int goodix_irq_direction_output(struct
>> goodix_ts_data *ts,
>>   		return -EINVAL;
>>   	case irq_pin_access_gpio:
>>   		return gpiod_direction_output(ts->gpiod_int, value);
>> +	case irq_pin_access_acpi_gpio:
>> +		/*
>> +		 * The IRQ pin triggers on a falling edge, so its gets
>> marked
>> +		 * as active-low, use output_raw to avoid the value
>> inversion.
>> +		 */
>> +		return gpiod_direction_output_raw(ts->gpiod_int,
>> value);
>>   	}
>>   
>>   	return -EINVAL; /* Never reached */
>> @@ -535,6 +544,7 @@ static int goodix_irq_direction_input(struct
>> goodix_ts_data *ts)
>>   			__func__);
>>   		return -EINVAL;
>>   	case irq_pin_access_gpio:
>> +	case irq_pin_access_acpi_gpio:
>>   		return gpiod_direction_input(ts->gpiod_int);
>>   	}
>>   
>> @@ -599,6 +609,87 @@ static int goodix_reset(struct goodix_ts_data
>> *ts)
>>   	return 0;
>>   }
>>   
>> +#if defined CONFIG_X86 && defined CONFIG_ACPI
>> +static const struct acpi_gpio_params first_gpio = { 0, 0, false };
>> +static const struct acpi_gpio_params second_gpio = { 1, 0, false };
>> +
>> +static const struct acpi_gpio_mapping acpi_goodix_int_first_gpios[]
>> = {
>> +	{ GOODIX_GPIO_INT_NAME "-gpios", &first_gpio, 1 },
>> +	{ GOODIX_GPIO_RST_NAME "-gpios", &second_gpio, 1 },
>> +	{ },
>> +};
>> +
>> +static const struct acpi_gpio_mapping acpi_goodix_int_last_gpios[] =
>> {
>> +	{ GOODIX_GPIO_RST_NAME "-gpios", &first_gpio, 1 },
>> +	{ GOODIX_GPIO_INT_NAME "-gpios", &second_gpio, 1 },
>> +	{ },
>> +};
>> +
>> +static int goodix_resource(struct acpi_resource *ares, void *data)
>> +{
>> +	struct goodix_ts_data *ts = data;
>> +	struct device *dev = &ts->client->dev;
>> +	struct acpi_resource_gpio *gpio;
>> +
>> +	switch (ares->type) {
>> +	case ACPI_RESOURCE_TYPE_GPIO:
>> +		gpio = &ares->data.gpio;
>> +		if (gpio->connection_type ==
>> ACPI_RESOURCE_GPIO_TYPE_INT) {
>> +			if (ts->gpio_int_idx == -1) {
>> +				ts->gpio_int_idx = ts->gpio_count;
>> +			} else {
>> +				dev_err(dev, "More then one GpioInt
>> resource, ignoring ACPI GPIO resources\n");
>> +				ts->gpio_int_idx = -2;
>> +			}
>> +		}
>> +		ts->gpio_count++;
>> +		break;
>> +	default:
>> +		break;
>> +	}
>> +
>> +	return 0;
>> +}
>> +
>> +static int goodix_add_acpi_gpio_mappings(struct goodix_ts_data *ts)
> 
> Is there no way to implement this in a more generic way? Is goodix the
> only driver that needs this sort of handling of GPIOs for ACPI?

The Linux GPIO subsystem expects drivers to request GPIOs by name, but
in most ACPI tables there is only a list of resources, so we have an
index, but not a name.  ACPI tables can define extra GPIO info using
a method with the special ACPI "daffd814-6eba-4d8c-8a91-bc9bbf4aa301"
UUID which is reserved for this, but I'm not aware of any devices where
the ACPI tables actually use this.

So all x86 drivers which lookup GPIOs from ACPI tables need to manually
add a mapping by calling devm_acpi_dev_add_driver_gpios(). Ideally the
Windows driver mandates a fixed order in which the GPIOs must be put
in the _CRS method and all we need a single acpi_gpio_mapping in the
driver.

But in some cases, like this case the order is not fixed and we need
some heuristics to figure out the right order and we have multiple
acpi_gpio_mapping-s and select one to pass to devm_acpi_dev_add_driver_gpios()
based on heuristics. That is what happening here. These heuristics
are tyically different per driver, so this is not really something
which we can share between drivers. The only other case which I'm aware
of which is doing something similar (but not identical) is the bcm
bluetooth code in drivers/bluetooth/hci_bcm.c, starting around line 880.

TL;DR: at this point in time I do not see a more generic way to do this.

> This portion could do with being split off, if we were ever to get that
> more generic solution.
> 
>> +{
>> +	const struct acpi_gpio_mapping *gpio_mapping = NULL;
>> +	struct device *dev = &ts->client->dev;
>> +	LIST_HEAD(resources);
>> +	int ret;
>> +
>> +	ts->gpio_count = 0;
>> +	ts->gpio_int_idx = -1;
>> +	ret = acpi_dev_get_resources(ACPI_COMPANION(dev), &resources,
>> +				     goodix_resource, ts);
>> +	if (ret < 0) {
>> +		dev_err(dev, "Error getting ACPI resources: %d\n",
>> ret);
>> +		return ret;
>> +	}
>> +
>> +	acpi_dev_free_resource_list(&resources);
>> +
>> +	if (ts->gpio_count == 2 && ts->gpio_int_idx == 0) {
>> +		ts->irq_pin_access_method = irq_pin_access_acpi_gpio;
>> +		gpio_mapping = acpi_goodix_int_first_gpios;
>> +	} else if (ts->gpio_count == 2 && ts->gpio_int_idx == 1) {
>> +		ts->irq_pin_access_method = irq_pin_access_acpi_gpio;
>> +		gpio_mapping = acpi_goodix_int_last_gpios;
>> +	} else {
>> +		dev_warn(dev, "Unexpected ACPI resources: gpio_count
>> %d, gpio_int_idx %d\n",
>> +			 ts->gpio_count, ts->gpio_int_idx);
>> +		return -EINVAL;
>> +	}
>> +
>> +	return devm_acpi_dev_add_driver_gpios(dev, gpio_mapping);
>> +}
>> +#else
>> +static int goodix_add_acpi_gpio_mappings(struct goodix_ts_data *ts)
>> +{
>> +	return -EINVAL;
>> +}
>> +#endif /* CONFIG_X86 && CONFIG_ACPI */
>> +
>>   /**
>>    * goodix_get_gpio_config - Get GPIO config from ACPI/DT
>>    *
>> @@ -609,6 +700,7 @@ static int goodix_get_gpio_config(struct
>> goodix_ts_data *ts)
>>   	int error;
>>   	struct device *dev;
>>   	struct gpio_desc *gpiod;
>> +	bool added_acpi_mappings = false;
>>   
>>   	if (!ts->client)
>>   		return -EINVAL;
>> @@ -632,6 +724,7 @@ static int goodix_get_gpio_config(struct
>> goodix_ts_data *ts)
>>   		return error;
>>   	}
>>   
>> +retry_get_irq_gpio:
>>   	/* Get the interrupt GPIO pin number */
>>   	gpiod = devm_gpiod_get_optional(dev, GOODIX_GPIO_INT_NAME,
>> GPIOD_IN);
>>   	if (IS_ERR(gpiod)) {
>> @@ -641,6 +734,11 @@ static int goodix_get_gpio_config(struct
>> goodix_ts_data *ts)
>>   				GOODIX_GPIO_INT_NAME, error);
>>   		return error;
>>   	}
>> +	if (!gpiod && has_acpi_companion(dev) && !added_acpi_mappings)
>> {
>> +		added_acpi_mappings = true;
> 
> Does this mean we retry at most once?

Yes, we are not really "retrying", we are doing a 2 step
probe:

1) First try to get the GPIOs without having done our heuristics and
without having called devm_acpi_dev_add_driver_gpios(). This is for
ACPI platforms extra GPIO info (including names) using the special
ACPI "daffd814-6eba-4d8c-8a91-bc9bbf4aa301" UUID method.

2) If this fails then we add our own name to index mappings and
get the GPIOs using those.


>> +		if (goodix_add_acpi_gpio_mappings(ts) == 0)
>> +			goto retry_get_irq_gpio;
>> +	}
>>   
>>   	ts->gpiod_int = gpiod;
>>   
>> @@ -656,10 +754,17 @@ static int goodix_get_gpio_config(struct
>> goodix_ts_data *ts)
>>   
>>   	ts->gpiod_rst = gpiod;
>>   
>> -	if (ts->gpiod_int && ts->gpiod_rst) {
>> -		ts->reset_controller_at_probe = true;
>> -		ts->load_cfg_from_disk = true;
>> -		ts->irq_pin_access_method = irq_pin_access_gpio;
>> +	switch (ts->irq_pin_access_method) {
> 
> Can't say I like switch statements with only 2 cases...

More cases are added in later patches.

> 
>> +	case irq_pin_access_acpi_gpio:
> 
> Can you add a comment that explains that this is to fallback in case we
> didn't manage to get the ACPI mappings?

Will do for v2 if this patch series.

> 
>> +		if (!ts->gpiod_int || !ts->gpiod_rst)
>> +			ts->irq_pin_access_method =
>> irq_pin_access_none;
>> +		break;
>> +	default:
>> +		if (ts->gpiod_int && ts->gpiod_rst) {
>> +			ts->reset_controller_at_probe = true;
>> +			ts->load_cfg_from_disk = true;
>> +			ts->irq_pin_access_method =
>> irq_pin_access_gpio;
>> +		}
>>   	}
>>   
>>   	return 0;
> 

Regards,

Hans

