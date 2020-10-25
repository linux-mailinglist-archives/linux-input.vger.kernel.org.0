Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7FCF129818A
	for <lists+linux-input@lfdr.de>; Sun, 25 Oct 2020 13:03:48 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1415571AbgJYMDq (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Sun, 25 Oct 2020 08:03:46 -0400
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:40026 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1415568AbgJYMDo (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Sun, 25 Oct 2020 08:03:44 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1603627421;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=H0YzLLcHpN6MlXa140xdvHN0hwpIvbV02txm9eA0/To=;
        b=CaPw/P3tAIY7OLNA9NKkaK/CqZzKfVQ+F7MiXlJDOK2NmHSZOHG4wGED8W3m5YyqHJMdvU
        0+nD6tLVDq2hRt8h65/kmJ5WSx8mGMOpgNtgQNekjqUAMKz2Uuyfy57T5t0k6MSITJYWyy
        4iuqkUorLKU5r/px+GEDfnBc0LrAVJw=
Received: from mail-ej1-f72.google.com (mail-ej1-f72.google.com
 [209.85.218.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-38-XJtR7UnwNMWbnLePgIzPWw-1; Sun, 25 Oct 2020 08:03:39 -0400
X-MC-Unique: XJtR7UnwNMWbnLePgIzPWw-1
Received: by mail-ej1-f72.google.com with SMTP id i21so3520366ejb.5
        for <linux-input@vger.kernel.org>; Sun, 25 Oct 2020 05:03:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=H0YzLLcHpN6MlXa140xdvHN0hwpIvbV02txm9eA0/To=;
        b=r81SEh9I3nsK/3d67YbT+zjUO9w64ZXripk0IgJkCXBw6UWdCmaIcAVgZayHIAt0R5
         YUv6gUjwfrtYuYM38gAWczCPsBSVe5gqNrQhWeQWSL8fsDNnZh8ea4Wsv3RYxcBA5ZY6
         NTPp5L0Nq6E4asI2HR8qODRuDzh4WlioaoFtgCM5m63UrNKbOrH5wGYw+13DpsJsmatZ
         W+AVO6Wbqh0XbK+FTUnceNVSuZs2Lygxr/VruPDzGS1sNraGDLZaUZ/l/sfQYAe5ijT5
         g/RYgUMhuFYa5tJexrYify1p4lEA8m+bDK/LPUGAtMtcW37pWYl0AKgj5md6XOhtfBpc
         TYng==
X-Gm-Message-State: AOAM533KwltjHKjLLSQ5xz9IaxGiV0KI4MR27qmjFOZJmj/mfLMbiT+s
        ZkThQ+mFwGPEJECPrT/ZghS2AOqqXTXYN24JAfwThT1ZE89O0hcGDIGsnDik2roZqZqtyB92eGt
        POBpMmQTEk9gt6mdF1d+dUJY=
X-Received: by 2002:a17:906:3852:: with SMTP id w18mr10595115ejc.551.1603627418008;
        Sun, 25 Oct 2020 05:03:38 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzUfw1QSmMsRH+SP9uZHNEA6GI36E7VmLQz7sWFOCLQdEdHxhNxtaNllj7+0bPMFdci3yaJhw==
X-Received: by 2002:a17:906:3852:: with SMTP id w18mr10595087ejc.551.1603627417682;
        Sun, 25 Oct 2020 05:03:37 -0700 (PDT)
Received: from x1.localdomain (2001-1c00-0c0c-fe00-d2ea-f29d-118b-24dc.cable.dynamic.v6.ziggo.nl. [2001:1c00:c0c:fe00:d2ea:f29d:118b:24dc])
        by smtp.gmail.com with ESMTPSA id u23sm3843060ejy.87.2020.10.25.05.03.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 25 Oct 2020 05:03:37 -0700 (PDT)
Subject: Re: [PATCH v2 3/3] platform/x86: thinkpad_acpi: Add support for
 Lenovo lap sensor
To:     Mark Pearson <markpearson@lenovo.com>
Cc:     njoshi1@lenovo.com, dmitry.torokhov@gmail.com,
        platform-driver-x86@vger.kernel.org, linux-input@vger.kernel.org,
        jeff@labundy.com, anthony.wong@canonical.com, hadess@hadess.net
References: <markpearson@lenovo.com>
 <20201020001556.388099-1-markpearson@lenovo.com>
 <20201020001556.388099-3-markpearson@lenovo.com>
From:   Hans de Goede <hdegoede@redhat.com>
Message-ID: <89f0bb4e-7edb-9d39-3986-25ed842f0549@redhat.com>
Date:   Sun, 25 Oct 2020 13:03:35 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.3.1
MIME-Version: 1.0
In-Reply-To: <20201020001556.388099-3-markpearson@lenovo.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Hi,

On 10/20/20 2:15 AM, Mark Pearson wrote:
> Use input device event support for notifying userspace of lap mode sensor
> state changes.
> 
> Signed-off-by: Mark Pearson <markpearson@lenovo.com>
> ---
>  drivers/platform/x86/thinkpad_acpi.c | 75 ++++++++++++++++++++++------
>  1 file changed, 59 insertions(+), 16 deletions(-)
> 
> diff --git a/drivers/platform/x86/thinkpad_acpi.c b/drivers/platform/x86/thinkpad_acpi.c
> index 5ddf2775fb06..c20b9902270b 100644
> --- a/drivers/platform/x86/thinkpad_acpi.c
> +++ b/drivers/platform/x86/thinkpad_acpi.c
> @@ -4013,7 +4013,7 @@ static bool hotkey_notify_usrevent(const u32 hkey,
>  }
>  
>  static void thermal_dump_all_sensors(void);
> -static void proxsensor_refresh(void);
> +static void proxsensor_refresh(bool palm, bool lap);
>  
>  static bool hotkey_notify_6xxx(const u32 hkey,
>  				 bool *send_acpi_ev,
> @@ -4081,7 +4081,7 @@ static bool hotkey_notify_6xxx(const u32 hkey,
>  	case TP_HKEY_EV_PALM_DETECTED:
>  	case TP_HKEY_EV_PALM_UNDETECTED:
>  		/* palm detected  - pass on to event handler */
> -		proxsensor_refresh();
> +		proxsensor_refresh(true /* palm */, false /* lap */);
>  		return true;
>  
>  	default:
> @@ -9929,6 +9929,23 @@ static struct ibm_struct dytc_driver_data = {
>  struct input_dev *tpacpi_sw_dev;
>  bool has_palmsensor;
>  bool palmsensor_state;
> +bool has_lapsensor;
> +bool lapsensor_state;

Again, drop the global _state caching, it is not necessary.

> +
> +static int lapsensor_get(bool *present, bool *state)
> +{
> +	acpi_handle dytc_handle;
> +	int output;
> +
> +	*present = false;
> +	if (ACPI_FAILURE(acpi_get_handle(hkey_handle, "DYTC", &dytc_handle)))
> +		return -ENODEV;
> +	if (!acpi_evalf(dytc_handle, &output, NULL, "dd", DYTC_CMD_GET))
> +		return -EIO;
> +	*present = true; /*If we get his far, we have lapmode support*/
> +	*state = output & BIT(DYTC_GET_LAPMODE_BIT) ? true : false;
> +	return 0;
> +}
>  
>  static int palmsensor_get(bool *present, bool *state)
>  {
> @@ -9945,36 +9962,56 @@ static int palmsensor_get(bool *present, bool *state)
>  	return 0;
>  }
>  
> -static void proxsensor_refresh(void)
> +static void proxsensor_refresh(bool palm, bool lap)

There is zero shared code between the palm ==true and the
lap ==true paths, please just make this 2 separate functions.

And then I guess rename the original proxsensor_refresh to
palmsensor_refresh (note please do this in the 2/3 patch)
and add a new lapsensor_refresh

>  {
>  	bool new_state;
>  	int err;
>  
> -	if (has_palmsensor) {
> +	if (palm && has_palmsensor) {
>  		err = palmsensor_get(&has_palmsensor, &new_state);
> -		if (err)
> -			return;

And then you can also keep the if (err) return; construct, which
is a bit cleaner (more common used) solution vs the !err way
of handling errors.

> -		if (new_state != palmsensor_state) {
> +		if (!err && (new_state != palmsensor_state)) {
>  			input_report_switch(tpacpi_sw_dev, SW_PALMREST_PROXIMITY, new_state);
>  			input_sync(tpacpi_sw_dev);
>  			palmsensor_state = new_state;
>  		}
>  	}
> +
> +	if (lap && has_lapsensor) {
> +		err = lapsensor_get(&has_lapsensor, &new_state);
> +		if (!err && (new_state != lapsensor_state)) {
> +			input_report_switch(tpacpi_sw_dev, SW_LAP_PROXIMITY, new_state);
> +			input_sync(tpacpi_sw_dev);
> +			lapsensor_state = new_state;

Same as with the other patch there is no need for the
new_state != lapsensor_state check, the input core does this for you
turning reporting the same state twice into a no-op.

> +		}
> +	}
>  }
>  
>  static int tpacpi_proxsensor_init(struct ibm_init_struct *iibm)
>  {
> -	int palm_err;
> +	int palm_err, lap_err, err;
>  
> +	/* Make sure globals are set to a sensible initial value */
> +	has_palmsensor = false;
> +	has_lapsensor = false;
>  	palm_err = palmsensor_get(&has_palmsensor, &palmsensor_state);
> +	lap_err = lapsensor_get(&has_lapsensor, &lapsensor_state);
> +
>  	/* If support isn't available (ENODEV) then don't return an error */
> -	if (palm_err == -ENODEV)
> +	if ((palm_err == -ENODEV) && (lap_err == -ENODEV))
>  		return 0;

return 1, see comment on previous patch.

## begin block ###
> -	/* For all other errors we can flag the failure */
> +	/* If both sensors error out - return an error */
> +	if (palm_err && lap_err)
> +		return palm_err ? palm_err : lap_err;
> +	/*
> +	 * If just one sensor not available, we still want the input device,
> +	 * so just flag it and carry on
> +	 */
>  	if (palm_err)
> -		return palm_err;
> +		pr_info("Palm sensor returned error %d", palm_err);
> +	if (lap_err)
> +		pr_info("Lap sensor returned error %d", lap_err);
### end block ###

thinkpad_acpi will typically error out completely on non -ENODEV
errors and the palmsensor code from patch 2/3 also does that.
Note that returning an error from a module/sub-driver's init() is
fatal (causes the module to not load), so before this change the
palmsensor_get call failing with a non -ENODEV error was fatal.
This may seem a bit harsh, but it is how error handling in
thinkpad_acpi has worked so far, so lets be consistent here.

Also if now only 1 of the 2 sensors is available you will log
the -ENODEV error.

So this whole block should be replaced with something like this:

	if (palm_err && palm_err != ENODEV)
		return palm_err;

	if (lap_err && lap_err != ENODEV)
		return lap_err;

>  
> -	if (has_palmsensor) {
> +	if (has_palmsensor || has_lapsensor) {
>  		tpacpi_sw_dev = input_allocate_device();
>  		if (!tpacpi_sw_dev)
>  			return -ENOMEM;
> @@ -9990,10 +10027,14 @@ static int tpacpi_proxsensor_init(struct ibm_init_struct *iibm)
>  			input_set_capability(tpacpi_sw_dev, EV_SW, SW_PALMREST_PROXIMITY);
>  			input_report_switch(tpacpi_sw_dev, SW_PALMREST_PROXIMITY, palmsensor_state);
>  		}
> -		palm_err = input_register_device(tpacpi_sw_dev);
> -		if (palm_err) {
> +		if (has_lapsensor) {
> +			input_set_capability(tpacpi_sw_dev, EV_SW, SW_LAP_PROXIMITY);
> +			input_report_switch(tpacpi_sw_dev, SW_LAP_PROXIMITY, lapsensor_state);
> +		}
> +		err = input_register_device(tpacpi_sw_dev);
> +		if (err) {
>  			input_free_device(tpacpi_sw_dev);
> -			return palm_err;
> +			return err;
>  		}
>  	}
>  	return 0;
> @@ -10057,8 +10098,10 @@ static void tpacpi_driver_event(const unsigned int hkey_event)
>  		mutex_unlock(&kbdlight_mutex);
>  	}
>  
> -	if (hkey_event == TP_HKEY_EV_THM_CSM_COMPLETED)
> +	if (hkey_event == TP_HKEY_EV_THM_CSM_COMPLETED) {
>  		dytc_lapmode_refresh();
> +		proxsensor_refresh(false /* palm */, true /* lap */);
> +	}
>  
>  }
>  
> 

Otherwise this looks good to me,

Regards,

Hans

