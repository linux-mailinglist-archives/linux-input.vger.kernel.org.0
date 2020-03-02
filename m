Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 14F80175980
	for <lists+linux-input@lfdr.de>; Mon,  2 Mar 2020 12:25:24 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726935AbgCBLZX (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 2 Mar 2020 06:25:23 -0500
Received: from relay10.mail.gandi.net ([217.70.178.230]:59559 "EHLO
        relay10.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725996AbgCBLZX (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Mon, 2 Mar 2020 06:25:23 -0500
Received: from classic (mon69-7-83-155-44-161.fbx.proxad.net [83.155.44.161])
        (Authenticated sender: hadess@hadess.net)
        by relay10.mail.gandi.net (Postfix) with ESMTPSA id 3237B24000A;
        Mon,  2 Mar 2020 11:25:19 +0000 (UTC)
Message-ID: <2e96ce29792562ca1eb555d7486955e88fa62ca3.camel@hadess.net>
Subject: Re: [PATCH resend 06/10] Input: goodix - Add support for
 controlling the IRQ pin through ACPI methods
From:   Bastien Nocera <hadess@hadess.net>
To:     Hans de Goede <hdegoede@redhat.com>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc:     linux-input@vger.kernel.org, Dmitry Mastykin <mastichi@gmail.com>
Date:   Mon, 02 Mar 2020 12:25:19 +0100
In-Reply-To: <20200221164735.508324-6-hdegoede@redhat.com>
References: <20200221164735.508324-1-hdegoede@redhat.com>
         <20200221164735.508324-6-hdegoede@redhat.com>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.35.91 (3.35.91-1.fc32) 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Fri, 2020-02-21 at 17:47 +0100, Hans de Goede wrote:
> Some Apollo Lake (x86, UEFI + ACPI) devices only list the reset GPIO
> in their _CRS table and the bit-banging of the IRQ line necessary to
> wake-up the controller from suspend can be done by calling 2 Goodix
> custom / specific ACPI methods.
> 
> This commit adds support for controlling the IRQ line in this matter,
> allowing us to properly suspend the touchscreen controller on such
> devices.
> 
> BugLink: https://bugzilla.redhat.com/show_bug.cgi?id=1786317
> BugLink: https://github.com/nexus511/gpd-ubuntu-packages/issues/10
> BugLink: https://bugzilla.kernel.org/show_bug.cgi?id=199207
> Cc: Dmitry Mastykin <mastichi@gmail.com>
> Signed-off-by: Hans de Goede <hdegoede@redhat.com>

What.

Reviewed-by: Bastien Nocera <hadess@hadess.net>

> ---
>  drivers/input/touchscreen/goodix.c | 30
> ++++++++++++++++++++++++++++++
>  1 file changed, 30 insertions(+)
> 
> diff --git a/drivers/input/touchscreen/goodix.c
> b/drivers/input/touchscreen/goodix.c
> index d178aa33b529..784c4dd8c430 100644
> --- a/drivers/input/touchscreen/goodix.c
> +++ b/drivers/input/touchscreen/goodix.c
> @@ -35,6 +35,7 @@ enum goodix_irq_pin_access_method {
>  	irq_pin_access_none,
>  	irq_pin_access_gpio,
>  	irq_pin_access_acpi_gpio,
> +	irq_pin_access_acpi_method,
>  };
>  
>  struct goodix_chip_data {
> @@ -516,6 +517,9 @@ static int goodix_send_cfg(struct goodix_ts_data
> *ts,
>  static int goodix_irq_direction_output(struct goodix_ts_data *ts,
>  				       int value)
>  {
> +	struct device *dev = &ts->client->dev;
> +	acpi_status status;
> +
>  	switch (ts->irq_pin_access_method) {
>  	case irq_pin_access_none:
>  		dev_err(&ts->client->dev,
> @@ -530,6 +534,10 @@ static int goodix_irq_direction_output(struct
> goodix_ts_data *ts,
>  		 * as active-low, use output_raw to avoid the value
> inversion.
>  		 */
>  		return gpiod_direction_output_raw(ts->gpiod_int,
> value);
> +	case irq_pin_access_acpi_method:
> +		status = acpi_execute_simple_method(ACPI_HANDLE(dev),
> +						    "INTO", value);
> +		return ACPI_SUCCESS(status) ? 0 : -EIO;
>  	}
>  
>  	return -EINVAL; /* Never reached */
> @@ -537,6 +545,9 @@ static int goodix_irq_direction_output(struct
> goodix_ts_data *ts,
>  
>  static int goodix_irq_direction_input(struct goodix_ts_data *ts)
>  {
> +	struct device *dev = &ts->client->dev;
> +	acpi_status status;
> +
>  	switch (ts->irq_pin_access_method) {
>  	case irq_pin_access_none:
>  		dev_err(&ts->client->dev,
> @@ -546,6 +557,10 @@ static int goodix_irq_direction_input(struct
> goodix_ts_data *ts)
>  	case irq_pin_access_gpio:
>  	case irq_pin_access_acpi_gpio:
>  		return gpiod_direction_input(ts->gpiod_int);
> +	case irq_pin_access_acpi_method:
> +		status = acpi_evaluate_object(ACPI_HANDLE(dev), "INTI",
> +					      NULL, NULL);
> +		return ACPI_SUCCESS(status) ? 0 : -EIO;
>  	}
>  
>  	return -EINVAL; /* Never reached */
> @@ -640,6 +655,11 @@ static const struct acpi_gpio_mapping
> acpi_goodix_int_last_gpios[] = {
>  	{ },
>  };
>  
> +static const struct acpi_gpio_mapping acpi_goodix_reset_only_gpios[]
> = {
> +	{ GOODIX_GPIO_RST_NAME "-gpios", &first_gpio, 1 },
> +	{ },
> +};
> +
>  static int goodix_resource(struct acpi_resource *ares, void *data)
>  {
>  	struct goodix_ts_data *ts = data;
> @@ -690,6 +710,12 @@ static int goodix_add_acpi_gpio_mappings(struct
> goodix_ts_data *ts)
>  	} else if (ts->gpio_count == 2 && ts->gpio_int_idx == 1) {
>  		ts->irq_pin_access_method = irq_pin_access_acpi_gpio;
>  		gpio_mapping = acpi_goodix_int_last_gpios;
> +	} else if (ts->gpio_count == 1 && ts->gpio_int_idx == -1 &&
> +		   acpi_has_method(ACPI_HANDLE(dev), "INTI") &&
> +		   acpi_has_method(ACPI_HANDLE(dev), "INTO")) {
> +		dev_info(dev, "Using ACPI INTI and INTO methods for IRQ
> pin access\n");
> +		ts->irq_pin_access_method = irq_pin_access_acpi_method;
> +		gpio_mapping = acpi_goodix_reset_only_gpios;
>  	} else if (is_byt() && ts->gpio_count == 2 && ts->gpio_int_idx
> == -1) {
>  		dev_info(dev, "No ACPI GpioInt resource, assuming that
> the GPIO order is reset, int\n");
>  		ts->irq_pin_access_method = irq_pin_access_acpi_gpio;
> @@ -778,6 +804,10 @@ static int goodix_get_gpio_config(struct
> goodix_ts_data *ts)
>  		if (!ts->gpiod_int || !ts->gpiod_rst)
>  			ts->irq_pin_access_method =
> irq_pin_access_none;
>  		break;
> +	case irq_pin_access_acpi_method:
> +		if (!ts->gpiod_rst)
> +			ts->irq_pin_access_method =
> irq_pin_access_none;
> +		break;
>  	default:
>  		if (ts->gpiod_int && ts->gpiod_rst) {
>  			ts->reset_controller_at_probe = true;

