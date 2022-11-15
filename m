Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 08A2262A3A7
	for <lists+linux-input@lfdr.de>; Tue, 15 Nov 2022 22:01:13 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238733AbiKOVBL (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 15 Nov 2022 16:01:11 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36594 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238697AbiKOVBC (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Tue, 15 Nov 2022 16:01:02 -0500
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CC3F1248FE
        for <linux-input@vger.kernel.org>; Tue, 15 Nov 2022 13:00:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1668546004;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=EMkJX2eD6IAfYIZWGayQ08o/J/l/XGkcZzm3i4qUAQE=;
        b=KaTIKsKSzOdYLHsjWOEk/gdR/079dlhNpgYLNt9Z3RVs4sqEppJ6vH+KfzVYyU6h2wIfya
        5Rj9fPzs9dUed9mx3/TdYKxUQQKFOA+uuJEd+sVRde/dbSHu0xRQxxElfPM7mIj95yTxVy
        krfqSQ2uXbXcfhPp5FNCqvBBZ6vgod0=
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-594-53WZiaimMmWZau3ZFAWKrw-1; Tue, 15 Nov 2022 16:00:00 -0500
X-MC-Unique: 53WZiaimMmWZau3ZFAWKrw-1
Received: by mail-ed1-f69.google.com with SMTP id v18-20020a056402349200b004622e273bbbso10770009edc.14
        for <linux-input@vger.kernel.org>; Tue, 15 Nov 2022 13:00:00 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=EMkJX2eD6IAfYIZWGayQ08o/J/l/XGkcZzm3i4qUAQE=;
        b=tzJXE8w8jOySaQuAmAtOByCc+N28VHaQHW0acpcziR6/5SlgsuD2S92TdUv0igt6sI
         WrDpkmUjlB/NiKKd6g7MMBLBVXtSntzGEGitoJTdF1OfBfnIZX+Fu5xsvJRs94lf2nf/
         8zgxhpzXj8rtjhPq2inzaA4yCjhLTG1ck9e+T3M2qSZXfcjOR66V+dyDpiTCMwz6aV/5
         gQ4DAaxWcbuYGik/z3k2mxgv0K1fWFLmw7royGQdcYSC1ht91GByZV3ieFzqM3tL93br
         knpvee7Q/iTcWi2P45+cKeFAw8BcwruV5rPmZHMt4k35sVV8JwvUhI3K15m/YhKM5txf
         QhBw==
X-Gm-Message-State: ANoB5pmktEi+9GLX8uzeHhvdvSs1gZR2oqpc35ZcvNou3FGyOdwhvBqf
        pYGgCZdzIAGgJenVHXHu3EE/mi0JBbxCTIGkZzaFeitLUGzBMOKtHnMuFeu1m1iehQGH0Ukkk0K
        +oPszyCfiYnYrcUmoG2hiohk=
X-Received: by 2002:a17:906:3e55:b0:7ad:dd43:5d18 with SMTP id t21-20020a1709063e5500b007addd435d18mr14684714eji.389.1668545999416;
        Tue, 15 Nov 2022 12:59:59 -0800 (PST)
X-Google-Smtp-Source: AA0mqf5Qn1+DPnLZAX5slYxLvAxbKWzXREdHpJcD7wzTQyKpktkl+zpg8+iUqih60ujLky6o5a5+DA==
X-Received: by 2002:a17:906:3e55:b0:7ad:dd43:5d18 with SMTP id t21-20020a1709063e5500b007addd435d18mr14684700eji.389.1668545999169;
        Tue, 15 Nov 2022 12:59:59 -0800 (PST)
Received: from ?IPV6:2001:1c00:c1e:bf00:d69d:5353:dba5:ee81? (2001-1c00-0c1e-bf00-d69d-5353-dba5-ee81.cable.dynamic.v6.ziggo.nl. [2001:1c00:c1e:bf00:d69d:5353:dba5:ee81])
        by smtp.gmail.com with ESMTPSA id b1-20020a1709063ca100b00730bfe6adc4sm6002999ejh.37.2022.11.15.12.59.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 15 Nov 2022 12:59:58 -0800 (PST)
Message-ID: <69f78d53-aca5-c866-d436-6b5e7b1589d0@redhat.com>
Date:   Tue, 15 Nov 2022 21:59:57 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.1
Subject: Re: [PATCH v2 6/7] platform/x86: ideapad-laptop: Keyboard backlight
 support for more IdeaPads
Content-Language: en-US, nl
To:     =?UTF-8?Q?Eray_Or=c3=a7unus?= <erayorcunus@gmail.com>,
        platform-driver-x86@vger.kernel.org
Cc:     linux-kernel@vger.kernel.org, linux-input@vger.kernel.org,
        ike.pan@canonical.com, jikos@kernel.org,
        benjamin.tissoires@redhat.com, dmitry.torokhov@gmail.com,
        mgross@linux.intel.com, pobrn@protonmail.com
References: <20221029120311.11152-1-erayorcunus@gmail.com>
 <20221029120311.11152-7-erayorcunus@gmail.com>
From:   Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <20221029120311.11152-7-erayorcunus@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,
        RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_NONE
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Hi Eray,

On 10/29/22 14:03, Eray Orçunus wrote:
> IdeaPads with HALS_KBD_BL_SUPPORT_BIT have full keyboard light support,
> and they send an event via ACPI on light state change. Whereas some
> IdeaPads that don't have this bit set, i.e. 520-15ikb, 330-17ich and
> 5 (15), don't send an event, yet they still support switching keyboard
> light via KBLO object on DSDT. Detect these IdeaPads with searching for
> KBLO object, set their kbd_bl_partial to true and register led device
> for them. Tested on 520-15ikb.
> 
> Signed-off-by: Eray Orçunus <erayorcunus@gmail.com>
> ---
>  drivers/platform/x86/ideapad-laptop.c | 79 ++++++++++++++++++++++++---
>  1 file changed, 70 insertions(+), 9 deletions(-)
> 
> diff --git a/drivers/platform/x86/ideapad-laptop.c b/drivers/platform/x86/ideapad-laptop.c
> index e8c088e7a53d..b34fbc4d741c 100644
> --- a/drivers/platform/x86/ideapad-laptop.c
> +++ b/drivers/platform/x86/ideapad-laptop.c
> @@ -149,6 +149,7 @@ struct ideapad_private {
>  		bool fn_lock              : 1;
>  		bool hw_rfkill_switch     : 1;
>  		bool kbd_bl               : 1;
> +		bool kbd_bl_partial       : 1;
>  		bool cam_ctrl_via_ec      : 1;
>  		bool touchpad_ctrl_via_ec : 1;
>  		bool usb_charging         : 1;
> @@ -157,6 +158,9 @@ struct ideapad_private {
>  		bool initialized;
>  		struct led_classdev led;
>  		unsigned int last_brightness;
> +		/* Below are used only if kbd_bl_partial is set */
> +		acpi_handle lfcm_mutex;
> +		acpi_handle kblo_obj;
>  	} kbd_bl;
>  };
>  
> @@ -1300,19 +1304,52 @@ static void ideapad_backlight_notify_brightness(struct ideapad_private *priv)
>  		backlight_force_update(priv->blightdev, BACKLIGHT_UPDATE_HOTKEY);
>  }
>  
> +#define IDEAPAD_ACPI_MUTEX_TIMEOUT 1500
> +
>  /*
>   * keyboard backlight
>   */
>  static int ideapad_kbd_bl_brightness_get(struct ideapad_private *priv)
>  {
> -	unsigned long hals;
> +	unsigned long ret_val;
>  	int err;
> +	acpi_status status;
>  
> -	err = eval_hals(priv->adev->handle, &hals);
> +	/*
> +	 * Some IdeaPads with partially implemented keyboard lights don't give
> +	 * us the light state on HALS_KBD_BL_STATE_BIT in the return value of HALS,
> +	 * i.e. 5 (15) and 330-17ich. Fortunately we know how to gather it.
> +	 * Even if it won't work, we will still give HALS a try, because
> +	 * some IdeaPads with kbd_bl_partial, i.e. 520-15ikb,
> +	 * correctly sets HALS_KBD_BL_STATE_BIT in HALS return value.
> +	 */
> +
> +	if (priv->features.kbd_bl_partial &&
> +	    priv->kbd_bl.lfcm_mutex != NULL && priv->kbd_bl.kblo_obj != NULL) {

IMHO it would be better to only set kbd_bl_partial when both handles
are not NULL, then you can drop the handle checks here.

> +
> +		status = acpi_acquire_mutex(priv->kbd_bl.lfcm_mutex, NULL,
> +					    IDEAPAD_ACPI_MUTEX_TIMEOUT);
> +
> +		if (ACPI_SUCCESS(status)) {

This code now ends up still going through the normal kbd-bl path
when it fails to acquire the mutex.

Instead it should do:

		if (ACPI_FAILURE(status))
			return -EIO;

And then have the rest of the code one indentation level less
deep.

> +			err = eval_int(priv->kbd_bl.kblo_obj, NULL, &ret_val);
> +
> +			status = acpi_release_mutex(priv->kbd_bl.lfcm_mutex, NULL);
> +			if (ACPI_FAILURE(status))
> +				dev_err(&priv->platform_device->dev,
> +					"Failed to release LFCM mutex");

I'm pretty sure that the ACPI core will already log an error if things
fail, I would change this to just a single line:

		acpi_release_mutex(priv->kbd_bl.lfcm_mutex, NULL);


> +
> +			if (err)
> +				return err;
> +
> +			return !!ret_val;

!!ret_val turns it into a boolean, does that mean it is always either on
or off with no level in between ?

> +		}
> +	}
> +
> +	err = eval_hals(priv->adev->handle, &ret_val);
>  	if (err)
>  		return err;
>  
> -	return !!test_bit(HALS_KBD_BL_STATE_BIT, &hals);
> +	return !!test_bit(HALS_KBD_BL_STATE_BIT, &ret_val);
>  }
>  
>  static enum led_brightness ideapad_kbd_bl_led_cdev_brightness_get(struct led_classdev *led_cdev)
> @@ -1329,7 +1366,8 @@ static int ideapad_kbd_bl_brightness_set(struct ideapad_private *priv, unsigned
>  	if (err)
>  		return err;
>  
> -	priv->kbd_bl.last_brightness = brightness;
> +	if (!priv->features.kbd_bl_partial)
> +		priv->kbd_bl.last_brightness = brightness;
>  
>  	return 0;
>  }

I don't understand this change, you change ideapad_kbd_bl_brightness_get()
to do an int eval of KBLO, but here you now still do a
exec_sals(SALS_KBD_BL_ON / SALS_KBD_BL_OFF) ?

Also there is no reason not to update last_brightness here ...

> @@ -1349,6 +1387,9 @@ static void ideapad_kbd_bl_notify(struct ideapad_private *priv)
>  	if (!priv->kbd_bl.initialized)
>  		return;
>  
> +	if (priv->features.kbd_bl_partial)
> +		return;
> +

Why? If we do happen to get a notify on one of these devices and
the brightness has changed, then it would be good to let userspace
know and if never get a notify then this function won't run so
we don't need the if.

>  	brightness = ideapad_kbd_bl_brightness_get(priv);
>  	if (brightness < 0)
>  		return;
> @@ -1371,17 +1412,20 @@ static int ideapad_kbd_bl_init(struct ideapad_private *priv)
>  	if (WARN_ON(priv->kbd_bl.initialized))
>  		return -EEXIST;
>  
> -	brightness = ideapad_kbd_bl_brightness_get(priv);
> -	if (brightness < 0)
> -		return brightness;
> +	/* IdeaPads with kbd_bl_partial don't have keyboard backlight event */
> +	if (!priv->features.kbd_bl_partial) {
> +		brightness = ideapad_kbd_bl_brightness_get(priv);
> +		if (brightness < 0)
> +			return brightness;
>  
> -	priv->kbd_bl.last_brightness = brightness;
> +		priv->kbd_bl.last_brightness         = brightness;
> +		priv->kbd_bl.led.flags               = LED_BRIGHT_HW_CHANGED;
> +	}

Again no need to for the if here. Setting last_brightness and advertising
LED_BRIGHT_HW_CHANGED unconditionally won't hurt and not making this difference
keeps the code simpler.

>  
>  	priv->kbd_bl.led.name                    = "platform::" LED_FUNCTION_KBD_BACKLIGHT;
>  	priv->kbd_bl.led.max_brightness          = 1;
>  	priv->kbd_bl.led.brightness_get          = ideapad_kbd_bl_led_cdev_brightness_get;
>  	priv->kbd_bl.led.brightness_set_blocking = ideapad_kbd_bl_led_cdev_brightness_set;
> -	priv->kbd_bl.led.flags                   = LED_BRIGHT_HW_CHANGED;
>  
>  	err = led_classdev_register(&priv->platform_device->dev, &priv->kbd_bl.led);
>  	if (err)
> @@ -1594,8 +1638,25 @@ static void ideapad_check_features(struct ideapad_private *priv)
>  			if (test_bit(HALS_FNLOCK_SUPPORT_BIT, &val))
>  				priv->features.fn_lock = true;
>  
> +			/*
> +			 * IdeaPads with HALS_KBD_BL_SUPPORT_BIT have full keyboard
> +			 * light support, and they send an event via ACPI on light
> +			 * state change. Whereas some IdeaPads, at least 520-15ikb
> +			 * and 5 (15), don't send an event, yet they still have
> +			 * KBLO object. In this case, set kbd_bl_partial to true
> +			 * and cache the LFCM mutex, it might be useful while
> +			 * getting the brightness.
> +			 */
> +
>  			if (test_bit(HALS_KBD_BL_SUPPORT_BIT, &val))
>  				priv->features.kbd_bl = true;
> +			else if (ACPI_SUCCESS(acpi_get_handle(handle, "^KBLO",
> +							      &priv->kbd_bl.kblo_obj))) {

As mentioned above I would change this to:

			else if (ACPI_SUCCESS(acpi_get_handle(handle, "^KBLO",
							      &priv->kbd_bl.kblo_obj)) &&
				 ACPI_SUCCESS(acpi_get_handle(handle, "^LFCM",
							      &priv->kbd_bl.lfcm_mutex))) {

> +				priv->features.kbd_bl = true;
> +				priv->features.kbd_bl_partial = true;
> +				(void)acpi_get_handle(handle, "^LFCM",
> +						      &priv->kbd_bl.lfcm_mutex);

And then drop the acpi_get_handle() here.


> +			}
>  
>  			if (test_bit(HALS_USB_CHARGING_SUPPORT_BIT, &val))
>  				priv->features.usb_charging = true;


Regards,

Hans


