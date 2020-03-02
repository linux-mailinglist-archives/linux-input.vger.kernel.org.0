Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 46BB617597E
	for <lists+linux-input@lfdr.de>; Mon,  2 Mar 2020 12:24:27 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726451AbgCBLY0 (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 2 Mar 2020 06:24:26 -0500
Received: from relay1-d.mail.gandi.net ([217.70.183.193]:52029 "EHLO
        relay1-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726448AbgCBLY0 (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Mon, 2 Mar 2020 06:24:26 -0500
X-Originating-IP: 83.155.44.161
Received: from classic (mon69-7-83-155-44-161.fbx.proxad.net [83.155.44.161])
        (Authenticated sender: hadess@hadess.net)
        by relay1-d.mail.gandi.net (Postfix) with ESMTPSA id 53CFC240002;
        Mon,  2 Mar 2020 11:24:23 +0000 (UTC)
Message-ID: <593aebce84a31720f476ac5370041c05afb0f512.camel@hadess.net>
Subject: Re: [PATCH resend 05/10] Input: goodix - Add support for getting
 IRQ + reset GPIOs on Bay Trail devices
From:   Bastien Nocera <hadess@hadess.net>
To:     Hans de Goede <hdegoede@redhat.com>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc:     linux-input@vger.kernel.org, Dmitry Mastykin <mastichi@gmail.com>
Date:   Mon, 02 Mar 2020 12:24:22 +0100
In-Reply-To: <20200221164735.508324-5-hdegoede@redhat.com>
References: <20200221164735.508324-1-hdegoede@redhat.com>
         <20200221164735.508324-5-hdegoede@redhat.com>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.35.91 (3.35.91-1.fc32) 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Fri, 2020-02-21 at 17:47 +0100, Hans de Goede wrote:
> On most Bay Trail (x86, UEFI + ACPI) devices the ACPI tables do not
> have
> a _DSD with a "daffd814-6eba-4d8c-8a91-bc9bbf4aa301" UUID, adding
> "irq-gpios" and "reset-gpios" mappings, so we cannot get the GPIOS by
> name
> without first manually adding mappings ourselves.
> 
> These devices contain 2 GpioIo resource in their _CRS table, on all 4
> such
> devices which I have access to, the order of the 2 GPIOs is reset,
> int.
> 
> Note that the GPIO to which the touchscreen controller irq pin is
> connected
> is configured in direct-irq mode on these Bay Trail devices, the
> pinctrl-baytrail.c driver still allows controlling the pin as a GPIO
> in
> this case, but this is not necessarily the case on other X86 ACPI
> platforms, nor do we have a guarantee that the GPIO order is the same
> elsewhere, so we limit the use of a _CRS table with 2 GpioIo
> resources
> to Bay Trail devices only.
> 
> BugLink: https://bugzilla.redhat.com/show_bug.cgi?id=1786317
> BugLink: https://github.com/nexus511/gpd-ubuntu-packages/issues/10
> BugLink: https://bugzilla.kernel.org/show_bug.cgi?id=199207
> Cc: Dmitry Mastykin <mastichi@gmail.com>
> Signed-off-by: Hans de Goede <hdegoede@redhat.com>

This is gross, but...

Reviewed-by: Bastien Nocera <hadess@hadess.net>

> ---
>  drivers/input/touchscreen/goodix.c | 19 +++++++++++++++++++
>  1 file changed, 19 insertions(+)
> 
> diff --git a/drivers/input/touchscreen/goodix.c
> b/drivers/input/touchscreen/goodix.c
> index 9de2f325ac6e..d178aa33b529 100644
> --- a/drivers/input/touchscreen/goodix.c
> +++ b/drivers/input/touchscreen/goodix.c
> @@ -610,6 +610,21 @@ static int goodix_reset(struct goodix_ts_data
> *ts)
>  }
>  
>  #if defined CONFIG_X86 && defined CONFIG_ACPI
> +#include <asm/cpu_device_id.h>
> +#include <asm/intel-family.h>
> +
> +static const struct x86_cpu_id baytrail_cpu_ids[] = {
> +	{ X86_VENDOR_INTEL, 6, INTEL_FAM6_ATOM_SILVERMONT,
> X86_FEATURE_ANY, },
> +	{}
> +};
> +
> +static inline bool is_byt(void)
> +{
> +	const struct x86_cpu_id *id = x86_match_cpu(baytrail_cpu_ids);
> +
> +	return !!id;
> +}
> +
>  static const struct acpi_gpio_params first_gpio = { 0, 0, false };
>  static const struct acpi_gpio_params second_gpio = { 1, 0, false };
>  
> @@ -675,6 +690,10 @@ static int goodix_add_acpi_gpio_mappings(struct
> goodix_ts_data *ts)
>  	} else if (ts->gpio_count == 2 && ts->gpio_int_idx == 1) {
>  		ts->irq_pin_access_method = irq_pin_access_acpi_gpio;
>  		gpio_mapping = acpi_goodix_int_last_gpios;
> +	} else if (is_byt() && ts->gpio_count == 2 && ts->gpio_int_idx
> == -1) {
> +		dev_info(dev, "No ACPI GpioInt resource, assuming that
> the GPIO order is reset, int\n");
> +		ts->irq_pin_access_method = irq_pin_access_acpi_gpio;
> +		gpio_mapping = acpi_goodix_int_last_gpios;
>  	} else {
>  		dev_warn(dev, "Unexpected ACPI resources: gpio_count
> %d, gpio_int_idx %d\n",
>  			 ts->gpio_count, ts->gpio_int_idx);

