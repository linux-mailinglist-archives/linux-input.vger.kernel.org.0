Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C180529818C
	for <lists+linux-input@lfdr.de>; Sun, 25 Oct 2020 13:05:02 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1415590AbgJYMFB (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Sun, 25 Oct 2020 08:05:01 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:41379 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1415587AbgJYMFA (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Sun, 25 Oct 2020 08:05:00 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1603627498;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=lJ0d2JrDKYVQ0HyQZ48+8rjyn+qG0JBE0vmi+07P2SE=;
        b=TtOEQeNL1H26uw+Fm3ExYytyONZYcmC3kK4oFgWXVmPvSmyDxkXunatmTQWk1HZ/vPbH2r
        46Zkvv8i81VMOg/AsDdIj2tUHtDVVzvS2LvXd3ABiRG15DMtLYZfOTE92xcolpx7T7dOAb
        MCUeBlNdxKbmA/LkUbvTtIzXwYYWKQs=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-149-HScU1cfCPJmuE7HjtATnvw-1; Sun, 25 Oct 2020 08:04:56 -0400
X-MC-Unique: HScU1cfCPJmuE7HjtATnvw-1
Received: by mail-ed1-f70.google.com with SMTP id m1so772903edr.8
        for <linux-input@vger.kernel.org>; Sun, 25 Oct 2020 05:04:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=lJ0d2JrDKYVQ0HyQZ48+8rjyn+qG0JBE0vmi+07P2SE=;
        b=WfCQQeQUZsJaDQP/Y/hGL4H5RAOsBv3IIVYmk9F6KRpYp06kB6S+IAr9amj8rQCbGY
         m/EmZ8W8C07gfJ16salpKQd9OhN3/mdIbNnruUWJZNdNkqv1hyUTh2Bz2QnBhdPjgwjY
         Jt/0u9aJb3nPJeZRmRoSOGnK/WX8xvqu1VuhSX3lcDG4qCOe5aj2p50vhCGhO2wShioi
         qjrKkFnGM2c2iaj7lH3bzRSWdy/AKyo/Pweh7xx9qC8s7ld86cT4a69mFzDu/3TK/afn
         YQdWQnQH240AYwRorJTr2+fy4M2aZL6NOV1CecDe1XuMJRIeIjxngN4YtuQd9KEbCEb7
         41CQ==
X-Gm-Message-State: AOAM530Xtp6UzmPzSPxGl/Q2s580R/5h9hPZiqeDrJFRw1nrMfJayNG6
        F4UGUE+rTQq6f9LhDeVkXonQdPppdZNvQpPXVC4X8KGAHqG75gPCZEN7n1JszvyGRE4Aw9zMccw
        8O3MK7pQCh9670+XaUwqULZk=
X-Received: by 2002:a05:6402:1c10:: with SMTP id ck16mr11332731edb.7.1603627495004;
        Sun, 25 Oct 2020 05:04:55 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxoR3iCdZ+Px5M45ufrva2hbWOfuTv7Xwk5FpsP9xE0/hqHvbv1d03EwRrc9FmAfzijyZI5Lg==
X-Received: by 2002:a05:6402:1c10:: with SMTP id ck16mr11332712edb.7.1603627494755;
        Sun, 25 Oct 2020 05:04:54 -0700 (PDT)
Received: from x1.localdomain (2001-1c00-0c0c-fe00-d2ea-f29d-118b-24dc.cable.dynamic.v6.ziggo.nl. [2001:1c00:c0c:fe00:d2ea:f29d:118b:24dc])
        by smtp.gmail.com with ESMTPSA id bw25sm3861305ejb.119.2020.10.25.05.04.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 25 Oct 2020 05:04:54 -0700 (PDT)
Subject: Re: [PATCH v2 2/3] platform/x86: thinkpad_acpi: Add support for
 Lenovo palm sensor
To:     Mark Pearson <markpearson@lenovo.com>
Cc:     njoshi1@lenovo.com, dmitry.torokhov@gmail.com,
        platform-driver-x86@vger.kernel.org, linux-input@vger.kernel.org,
        jeff@labundy.com, anthony.wong@canonical.com, hadess@hadess.net
References: <markpearson@lenovo.com>
 <20201020001556.388099-1-markpearson@lenovo.com>
 <20201020001556.388099-2-markpearson@lenovo.com>
From:   Hans de Goede <hdegoede@redhat.com>
Message-ID: <ac27f71b-c3ce-8d68-cbf6-4c8b43689cf1@redhat.com>
Date:   Sun, 25 Oct 2020 13:04:53 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.3.1
MIME-Version: 1.0
In-Reply-To: <20201020001556.388099-2-markpearson@lenovo.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Hi,

On 10/20/20 2:15 AM, Mark Pearson wrote:
> Use input device event support for notifying userspace of palm sensor
> state changes
> 
> Signed-off-by: Mark Pearson <markpearson@lenovo.com>
> ---
>  drivers/platform/x86/thinkpad_acpi.c | 99 +++++++++++++++++++++++++++-
>  1 file changed, 97 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/platform/x86/thinkpad_acpi.c b/drivers/platform/x86/thinkpad_acpi.c
> index eae3579f106f..5ddf2775fb06 100644
> --- a/drivers/platform/x86/thinkpad_acpi.c
> +++ b/drivers/platform/x86/thinkpad_acpi.c
> @@ -4013,6 +4013,7 @@ static bool hotkey_notify_usrevent(const u32 hkey,
>  }
>  
>  static void thermal_dump_all_sensors(void);
> +static void proxsensor_refresh(void);
>  
>  static bool hotkey_notify_6xxx(const u32 hkey,
>  				 bool *send_acpi_ev,
> @@ -4079,8 +4080,8 @@ static bool hotkey_notify_6xxx(const u32 hkey,
>  
>  	case TP_HKEY_EV_PALM_DETECTED:
>  	case TP_HKEY_EV_PALM_UNDETECTED:
> -		/* palm detected hovering the keyboard, forward to user-space
> -		 * via netlink for consumption */
> +		/* palm detected  - pass on to event handler */
> +		proxsensor_refresh();
>  		return true;
>  
>  	default:
> @@ -9918,6 +9919,96 @@ static struct ibm_struct dytc_driver_data = {
>  	.exit = dytc_exit,
>  };
>  
> +/*************************************************************************
> + * Proximity sensor subdriver
> + */
> +
> +#define PALMSENSOR_PRESENT_BIT 0 /* Determine if psensor present */
> +#define PALMSENSOR_ON_BIT      1 /* psensor status */
> +
> +struct input_dev *tpacpi_sw_dev;
> +bool has_palmsensor;
> +bool palmsensor_state;

There is no need to make palmsensor_state global, see below.

> +
> +static int palmsensor_get(bool *present, bool *state)
> +{
> +	acpi_handle psensor_handle;
> +	int output;
> +
> +	if (ACPI_FAILURE(acpi_get_handle(hkey_handle, "GPSS", &psensor_handle)))
> +		return -ENODEV;
> +	if (!acpi_evalf(psensor_handle, &output, NULL, "d"))
> +		return -EIO;
> +
> +	*present = output & BIT(PALMSENSOR_PRESENT_BIT) ? true : false;
> +	*state = output & BIT(PALMSENSOR_ON_BIT) ? true : false;
> +	return 0;
> +}
> +
> +static void proxsensor_refresh(void)
> +{
> +	bool new_state;
> +	int err;
> +
> +	if (has_palmsensor) {
> +		err = palmsensor_get(&has_palmsensor, &new_state);
> +		if (err)
> +			return;
> +		if (new_state != palmsensor_state) {
> +			input_report_switch(tpacpi_sw_dev, SW_PALMREST_PROXIMITY, new_state);
> +			input_sync(tpacpi_sw_dev);
> +			palmsensor_state = new_state;
> +		}

There is no need for the whole new_state / orig_state dance here, the input subsys
will only send events to userspace if anything has actually changed, so you can just
write the following here:

		err = palmsensor_get(&has_palmsensor, &new_state);
		if (err)
			return;

		input_report_switch(tpacpi_sw_dev, SW_PALMREST_PROXIMITY, new_state);
		input_sync(tpacpi_sw_dev);

> +	}
> +}
> +
> +static int tpacpi_proxsensor_init(struct ibm_init_struct *iibm)
> +{
> +	int palm_err;
> +
> +	palm_err = palmsensor_get(&has_palmsensor, &palmsensor_state);
> +	/* If support isn't available (ENODEV) then don't return an error */
> +	if (palm_err == -ENODEV)
> +		return 0;

If you return 1 here, then this new-module will not be added
to the tpacpi_all_drivers list (which is good since it is non functional)
and then tpacpi_proxsensor_exit will also be skipped.

> +	/* For all other errors we can flag the failure */
> +	if (palm_err)
> +		return palm_err;
> +
> +	if (has_palmsensor) {
> +		tpacpi_sw_dev = input_allocate_device();
> +		if (!tpacpi_sw_dev)
> +			return -ENOMEM;
> +		tpacpi_sw_dev->name = "Thinkpad proximity switches";
> +		tpacpi_sw_dev->phys = TPACPI_DRVR_NAME "/input1";
> +		tpacpi_sw_dev->id.bustype = BUS_HOST;
> +		tpacpi_sw_dev->id.vendor = thinkpad_id.vendor;
> +		tpacpi_sw_dev->id.product = TPACPI_HKEY_INPUT_PRODUCT;
> +		tpacpi_sw_dev->id.version = TPACPI_HKEY_INPUT_VERSION;
> +		tpacpi_sw_dev->dev.parent = &tpacpi_pdev->dev;
> +
> +		if (has_palmsensor) {
> +			input_set_capability(tpacpi_sw_dev, EV_SW, SW_PALMREST_PROXIMITY);
> +			input_report_switch(tpacpi_sw_dev, SW_PALMREST_PROXIMITY, palmsensor_state);
> +		}
> +		palm_err = input_register_device(tpacpi_sw_dev);
> +		if (palm_err) {
> +			input_free_device(tpacpi_sw_dev);

Maybe do "tpacpi_sw_dev = NULL" here to avoid leaving a dangling global pointer around ?

> +			return palm_err;
> +		}

		return 0 here

> +	}
> +	return 0;

And return 1 here, as discussed above.

This will ...

> +}
> +
> +static void proxsensor_exit(void)
> +{
> +	input_unregister_device(tpacpi_sw_dev);

Avoid a NULL pointer deref here when there is no palmrest sensor.

> +	input_free_device(tpacpi_sw_dev);

The line needs to be deleted, input_free_device() is only for freeing
devices before they are registered (so in case of some error)
input_unregister_device() already does a put on the device, so also
calling input_free_device() here messes up the ref counting.

> +}
> +
> +static struct ibm_struct proxsensor_driver_data = {
> +	.name = "proximity-sensor",
> +	.exit = proxsensor_exit,
> +};
>  /****************************************************************************
>   ****************************************************************************
>   *
> @@ -10411,6 +10502,10 @@ static struct ibm_init_struct ibms_init[] __initdata = {
>  		.init = tpacpi_dytc_init,
>  		.data = &dytc_driver_data,
>  	},
> +	{
> +		.init = tpacpi_proxsensor_init,
> +		.data = &proxsensor_driver_data,
> +	},
>  };
>  
>  static int __init set_ibm_param(const char *val, const struct kernel_param *kp)
> 

Otherwise this looks good to me.

Regards,

Hans

