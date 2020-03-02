Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3A985175979
	for <lists+linux-input@lfdr.de>; Mon,  2 Mar 2020 12:23:07 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726831AbgCBLXG (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 2 Mar 2020 06:23:06 -0500
Received: from relay1-d.mail.gandi.net ([217.70.183.193]:42257 "EHLO
        relay1-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726448AbgCBLXG (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Mon, 2 Mar 2020 06:23:06 -0500
X-Originating-IP: 83.155.44.161
Received: from classic (mon69-7-83-155-44-161.fbx.proxad.net [83.155.44.161])
        (Authenticated sender: hadess@hadess.net)
        by relay1-d.mail.gandi.net (Postfix) with ESMTPSA id 8FBC6240003;
        Mon,  2 Mar 2020 11:23:02 +0000 (UTC)
Message-ID: <d387bb62dee39cb16bb27371c1e5764cb856c6b5.camel@hadess.net>
Subject: Re: [PATCH resend 04/10] Input: goodix - Add support for getting
 IRQ + reset GPIOs on Cherry Trail devices
From:   Bastien Nocera <hadess@hadess.net>
To:     Hans de Goede <hdegoede@redhat.com>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc:     linux-input@vger.kernel.org, Dmitry Mastykin <mastichi@gmail.com>
Date:   Mon, 02 Mar 2020 12:23:01 +0100
In-Reply-To: <20200221164735.508324-4-hdegoede@redhat.com>
References: <20200221164735.508324-1-hdegoede@redhat.com>
         <20200221164735.508324-4-hdegoede@redhat.com>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.35.91 (3.35.91-1.fc32) 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Fri, 2020-02-21 at 17:47 +0100, Hans de Goede wrote:
> On most Cherry Trail (x86, UEFI + ACPI) devices the ACPI tables do
> not have
> a _DSD with a "daffd814-6eba-4d8c-8a91-bc9bbf4aa301" UUID, adding
> "irq-gpios" and "reset-gpios" mappings, so we cannot get the GPIOS by
> name
> without first manually adding mappings ourselves.
> 
> These devices contain 1 GpioInt and 1 GpioIo resource in their _CRS
> table.
> There is no fixed order for these 2. This commit adds code to check
> that
> there is 1 of each as expected and then registers a mapping matching
> their
> order using devm_acpi_dev_add_driver_gpios().
> 
> This gives us access to both GPIOs allowing us to properly suspend
> the
> controller during suspend, and making it possible to reset the
> controller
> if necessary.

Can you include the DSDT snippet that defines those GPIOs in the commit
message?

> 
> BugLink: https://bugzilla.redhat.com/show_bug.cgi?id=1786317
> BugLink: https://github.com/nexus511/gpd-ubuntu-packages/issues/10
> BugLink: https://bugzilla.kernel.org/show_bug.cgi?id=199207
> Cc: Dmitry Mastykin <mastichi@gmail.com>
> Signed-off-by: Hans de Goede <hdegoede@redhat.com>
> ---
>  drivers/input/touchscreen/goodix.c | 113
> ++++++++++++++++++++++++++++-
>  1 file changed, 109 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/input/touchscreen/goodix.c
> b/drivers/input/touchscreen/goodix.c
> index dd5a8f9e8ada..9de2f325ac6e 100644
> --- a/drivers/input/touchscreen/goodix.c
> +++ b/drivers/input/touchscreen/goodix.c
> @@ -34,6 +34,7 @@ struct goodix_ts_data;
>  enum goodix_irq_pin_access_method {
>  	irq_pin_access_none,
>  	irq_pin_access_gpio,
> +	irq_pin_access_acpi_gpio,
>  };
>  
>  struct goodix_chip_data {
> @@ -53,6 +54,8 @@ struct goodix_ts_data {
>  	struct regulator *vddio;
>  	struct gpio_desc *gpiod_int;
>  	struct gpio_desc *gpiod_rst;
> +	int gpio_count;
> +	int gpio_int_idx;
>  	u16 id;
>  	u16 version;
>  	const char *cfg_name;
> @@ -521,6 +524,12 @@ static int goodix_irq_direction_output(struct
> goodix_ts_data *ts,
>  		return -EINVAL;
>  	case irq_pin_access_gpio:
>  		return gpiod_direction_output(ts->gpiod_int, value);
> +	case irq_pin_access_acpi_gpio:
> +		/*
> +		 * The IRQ pin triggers on a falling edge, so its gets
> marked
> +		 * as active-low, use output_raw to avoid the value
> inversion.
> +		 */
> +		return gpiod_direction_output_raw(ts->gpiod_int,
> value);
>  	}
>  
>  	return -EINVAL; /* Never reached */
> @@ -535,6 +544,7 @@ static int goodix_irq_direction_input(struct
> goodix_ts_data *ts)
>  			__func__);
>  		return -EINVAL;
>  	case irq_pin_access_gpio:
> +	case irq_pin_access_acpi_gpio:
>  		return gpiod_direction_input(ts->gpiod_int);
>  	}
>  
> @@ -599,6 +609,87 @@ static int goodix_reset(struct goodix_ts_data
> *ts)
>  	return 0;
>  }
>  
> +#if defined CONFIG_X86 && defined CONFIG_ACPI
> +static const struct acpi_gpio_params first_gpio = { 0, 0, false };
> +static const struct acpi_gpio_params second_gpio = { 1, 0, false };
> +
> +static const struct acpi_gpio_mapping acpi_goodix_int_first_gpios[]
> = {
> +	{ GOODIX_GPIO_INT_NAME "-gpios", &first_gpio, 1 },
> +	{ GOODIX_GPIO_RST_NAME "-gpios", &second_gpio, 1 },
> +	{ },
> +};
> +
> +static const struct acpi_gpio_mapping acpi_goodix_int_last_gpios[] =
> {
> +	{ GOODIX_GPIO_RST_NAME "-gpios", &first_gpio, 1 },
> +	{ GOODIX_GPIO_INT_NAME "-gpios", &second_gpio, 1 },
> +	{ },
> +};
> +
> +static int goodix_resource(struct acpi_resource *ares, void *data)
> +{
> +	struct goodix_ts_data *ts = data;
> +	struct device *dev = &ts->client->dev;
> +	struct acpi_resource_gpio *gpio;
> +
> +	switch (ares->type) {
> +	case ACPI_RESOURCE_TYPE_GPIO:
> +		gpio = &ares->data.gpio;
> +		if (gpio->connection_type ==
> ACPI_RESOURCE_GPIO_TYPE_INT) {
> +			if (ts->gpio_int_idx == -1) {
> +				ts->gpio_int_idx = ts->gpio_count;
> +			} else {
> +				dev_err(dev, "More then one GpioInt
> resource, ignoring ACPI GPIO resources\n");
> +				ts->gpio_int_idx = -2;
> +			}
> +		}
> +		ts->gpio_count++;
> +		break;
> +	default:
> +		break;
> +	}
> +
> +	return 0;
> +}
> +
> +static int goodix_add_acpi_gpio_mappings(struct goodix_ts_data *ts)

Is there no way to implement this in a more generic way? Is goodix the
only driver that needs this sort of handling of GPIOs for ACPI?

This portion could do with being split off, if we were ever to get that
more generic solution.

> +{
> +	const struct acpi_gpio_mapping *gpio_mapping = NULL;
> +	struct device *dev = &ts->client->dev;
> +	LIST_HEAD(resources);
> +	int ret;
> +
> +	ts->gpio_count = 0;
> +	ts->gpio_int_idx = -1;
> +	ret = acpi_dev_get_resources(ACPI_COMPANION(dev), &resources,
> +				     goodix_resource, ts);
> +	if (ret < 0) {
> +		dev_err(dev, "Error getting ACPI resources: %d\n",
> ret);
> +		return ret;
> +	}
> +
> +	acpi_dev_free_resource_list(&resources);
> +
> +	if (ts->gpio_count == 2 && ts->gpio_int_idx == 0) {
> +		ts->irq_pin_access_method = irq_pin_access_acpi_gpio;
> +		gpio_mapping = acpi_goodix_int_first_gpios;
> +	} else if (ts->gpio_count == 2 && ts->gpio_int_idx == 1) {
> +		ts->irq_pin_access_method = irq_pin_access_acpi_gpio;
> +		gpio_mapping = acpi_goodix_int_last_gpios;
> +	} else {
> +		dev_warn(dev, "Unexpected ACPI resources: gpio_count
> %d, gpio_int_idx %d\n",
> +			 ts->gpio_count, ts->gpio_int_idx);
> +		return -EINVAL;
> +	}
> +
> +	return devm_acpi_dev_add_driver_gpios(dev, gpio_mapping);
> +}
> +#else
> +static int goodix_add_acpi_gpio_mappings(struct goodix_ts_data *ts)
> +{
> +	return -EINVAL;
> +}
> +#endif /* CONFIG_X86 && CONFIG_ACPI */
> +
>  /**
>   * goodix_get_gpio_config - Get GPIO config from ACPI/DT
>   *
> @@ -609,6 +700,7 @@ static int goodix_get_gpio_config(struct
> goodix_ts_data *ts)
>  	int error;
>  	struct device *dev;
>  	struct gpio_desc *gpiod;
> +	bool added_acpi_mappings = false;
>  
>  	if (!ts->client)
>  		return -EINVAL;
> @@ -632,6 +724,7 @@ static int goodix_get_gpio_config(struct
> goodix_ts_data *ts)
>  		return error;
>  	}
>  
> +retry_get_irq_gpio:
>  	/* Get the interrupt GPIO pin number */
>  	gpiod = devm_gpiod_get_optional(dev, GOODIX_GPIO_INT_NAME,
> GPIOD_IN);
>  	if (IS_ERR(gpiod)) {
> @@ -641,6 +734,11 @@ static int goodix_get_gpio_config(struct
> goodix_ts_data *ts)
>  				GOODIX_GPIO_INT_NAME, error);
>  		return error;
>  	}
> +	if (!gpiod && has_acpi_companion(dev) && !added_acpi_mappings)
> {
> +		added_acpi_mappings = true;

Does this mean we retry at most once?

> +		if (goodix_add_acpi_gpio_mappings(ts) == 0)
> +			goto retry_get_irq_gpio;
> +	}
>  
>  	ts->gpiod_int = gpiod;
>  
> @@ -656,10 +754,17 @@ static int goodix_get_gpio_config(struct
> goodix_ts_data *ts)
>  
>  	ts->gpiod_rst = gpiod;
>  
> -	if (ts->gpiod_int && ts->gpiod_rst) {
> -		ts->reset_controller_at_probe = true;
> -		ts->load_cfg_from_disk = true;
> -		ts->irq_pin_access_method = irq_pin_access_gpio;
> +	switch (ts->irq_pin_access_method) {

Can't say I like switch statements with only 2 cases...

> +	case irq_pin_access_acpi_gpio:

Can you add a comment that explains that this is to fallback in case we
didn't manage to get the ACPI mappings?

> +		if (!ts->gpiod_int || !ts->gpiod_rst)
> +			ts->irq_pin_access_method =
> irq_pin_access_none;
> +		break;
> +	default:
> +		if (ts->gpiod_int && ts->gpiod_rst) {
> +			ts->reset_controller_at_probe = true;
> +			ts->load_cfg_from_disk = true;
> +			ts->irq_pin_access_method =
> irq_pin_access_gpio;
> +		}
>  	}
>  
>  	return 0;

