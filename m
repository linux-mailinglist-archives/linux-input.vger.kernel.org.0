Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AD6CA47C6EC
	for <lists+linux-input@lfdr.de>; Tue, 21 Dec 2021 19:49:44 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241535AbhLUStn (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 21 Dec 2021 13:49:43 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:56229 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S241501AbhLUStn (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Tue, 21 Dec 2021 13:49:43 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1640112582;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=vARMTVo1VrfVGVXiFzEjZdP3U1cg4RJvquwDM2LMhlA=;
        b=LUKhbMwmvoybI68cNOSv6+7vcocJfcvNbrdBO85kC3rEsrJ2xRU1SJb7hKlsSUkn9lErZZ
        2ofc/9I7Bi8Zc+WL0ESlTWA+88h/nQ8ymlR5QTgFI/lNMeFhQ1n1U/G0YDwXatH2TB2sq9
        QwmHzWy0xXJqkYPdo0JiRcmh3MvRqjw=
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-661-ImRvc8rxNLyHl5toKw2zkg-1; Tue, 21 Dec 2021 13:49:41 -0500
X-MC-Unique: ImRvc8rxNLyHl5toKw2zkg-1
Received: by mail-ed1-f72.google.com with SMTP id f20-20020a056402355400b003f81df0975bso10072844edd.9
        for <linux-input@vger.kernel.org>; Tue, 21 Dec 2021 10:49:40 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=vARMTVo1VrfVGVXiFzEjZdP3U1cg4RJvquwDM2LMhlA=;
        b=NgAzc+GdfahP3our4oPFXkR/ngDmt87FSJI7CdyvnEMk8xezviJHot+Y6Jk/aTwGju
         /EjDO07T7AjA7BCCCM8JJyCl2dzctH6kUrnZCpZU66jozAdHGyva9gOrJ2PJHiuBaWH6
         OPNZU/uGw73bcTYYOq5RCUq992pnOo20tLcU1z1WBC277jzuQiBqyTcozL9PQeojr8DQ
         XrTNRKBIMUyCe/9XUUFvepMVKKImZLnoaln8Ha/OHt+JQAYmtT1krV1FYFDvZBIbdmOK
         +sCZh4kFUMcAFXkKKF4JvjE+bzA7aPAXpaRFRpwj+nAB5DNke7euCgEIF+jGNWz5mMXz
         knvg==
X-Gm-Message-State: AOAM532YEIDZvaKq6kBJ48YNFzbcprzAMKTbZG374VTwOy7rOuoWhEYp
        7WvLOEjneIxSQBC+DiHDI3XXaKzfyPjYFcjGke1fvXvOwWdXJScuCg+rMCreUKNR2ANpesLB5D7
        9cHQNzAehWpCtfA+fuhYa+gw=
X-Received: by 2002:a17:906:7942:: with SMTP id l2mr3991862ejo.730.1640112580044;
        Tue, 21 Dec 2021 10:49:40 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyyO538Lipz6cNX+mZBtLLJWpIHrSR/4+UTj3o1R2kN4X0xf64zHHFF4HFEzKkD96jK5RxqoA==
X-Received: by 2002:a17:906:7942:: with SMTP id l2mr3991851ejo.730.1640112579875;
        Tue, 21 Dec 2021 10:49:39 -0800 (PST)
Received: from ?IPV6:2001:1c00:c1e:bf00:1db8:22d3:1bc9:8ca1? (2001-1c00-0c1e-bf00-1db8-22d3-1bc9-8ca1.cable.dynamic.v6.ziggo.nl. [2001:1c00:c1e:bf00:1db8:22d3:1bc9:8ca1])
        by smtp.gmail.com with ESMTPSA id hw8sm3680167ejc.198.2021.12.21.10.49.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 21 Dec 2021 10:49:39 -0800 (PST)
Message-ID: <7d4f20da-f18b-eccf-19c4-ea7c15492634@redhat.com>
Date:   Tue, 21 Dec 2021 19:49:38 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Subject: Re: [PATCH 1/3] HID: i2c-hid-acpi: Remove explicit
 device_set_wakeup_capable
Content-Language: en-US
To:     Raul E Rangel <rrangel@chromium.org>, linux-kernel@vger.kernel.org,
        "Rafael J . Wysocki" <rjw@rjwysocki.net>
Cc:     mario.limonciello@amd.com, linux-input@vger.kernel.org,
        dianders@chromium.org,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>,
        Jiri Kosina <jikos@kernel.org>
References: <20211220234346.2798027-1-rrangel@chromium.org>
 <20211220163823.1.Ie20ca47a26d3ea68124d8197b67bb1344c67f650@changeid>
From:   Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <20211220163823.1.Ie20ca47a26d3ea68124d8197b67bb1344c67f650@changeid>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Hi,

On 12/21/21 00:43, Raul E Rangel wrote:
> The ACPI subsystem is responsible for managing the power and wake
> sources for an ACPI device. By explicitly calling
> device_set_wakeup_capable, we are circumvent the ACPI subsystem and
> setting wake capabilities on the device when it doesn't support it.
> 
> Take the following example:
> * We have an ACPI HID device that has `_PR0` and `_PR3`. It doesn't have
> `_PRW` so that means the device can't wake the system.
> * The IRQ line is active level low for this device and is pulled up by the
> power resource defined in `_PR0`/`_PR3`.
> 
> Since the i2c-hid driver has set the device as wake capable, the wake
> pin gets enabled on suspend.

The IRQ pin should only have a enable_irq_wake() called on it if
something has actually requested the i2c-HID device to be a wakeup source,
the removed code claims the device is wakeup *capable*, but is also
explicitly calls device_set_wakeup_enable(dev, false), disabling wakeup.

And i2c-hid suspend does:

        if (device_may_wakeup(&client->dev)) {
                wake_status = enable_irq_wake(client->irq);

And device_may_wakeup() checks the wakeup *enabled* setting AFAIK.

I've added Rafael to the Cc since he knows all this a lot better then me.

I have the feeling that your userspace is perhaps poking the
wakeup settings in sysfs, triggering this issue.

> As part of suspend, ACPI will power down
> the device since it's not a wake source. When the device is powered
> down, the IRQ line will drop, and it will trigger a wake event.

To me that sounds like the device is not wakeup *capable* at all, so
its ACPI node should not set the ACPI_FADT_LOW_POWER_S0 flag at all.

Note I'm not certain about this at all, but at a first look this feels
like it is not the right fix for your problem.

Regards,

Hans


> 
> See the following debug log:
> [   42.335804] PM: Suspending system (s2idle)
> [   42.340186] amd_gpio AMD0030:00: RX: Setting wake for pin 89 to enable
> [   42.467736]     power-0416 __acpi_power_off      : Power resource [PR00] turned off
> [   42.467739] device_pm-0280 device_set_power      : Device [H05D] transitioned to D3cold
> [   42.475210] PM: pm_system_irq_wakeup: 11 triggered pinctrl_amd
> [   42.535293] PM: Wakeup unrelated to ACPI SCI
> [   42.535294] PM: resume from suspend-to-idle
> 
> Signed-off-by: Raul E Rangel <rrangel@chromium.org>
> ---
> 
>  drivers/hid/i2c-hid/i2c-hid-acpi.c | 5 -----
>  1 file changed, 5 deletions(-)
> 
> diff --git a/drivers/hid/i2c-hid/i2c-hid-acpi.c b/drivers/hid/i2c-hid/i2c-hid-acpi.c
> index a6f0257a26de..fc311a19a19d 100644
> --- a/drivers/hid/i2c-hid/i2c-hid-acpi.c
> +++ b/drivers/hid/i2c-hid/i2c-hid-acpi.c
> @@ -105,11 +105,6 @@ static int i2c_hid_acpi_probe(struct i2c_client *client)
>  
>  	acpi_device_fix_up_power(adev);
>  
> -	if (acpi_gbl_FADT.flags & ACPI_FADT_LOW_POWER_S0) {
> -		device_set_wakeup_capable(dev, true);
> -		device_set_wakeup_enable(dev, false);
> -	}
> -
>  	return i2c_hid_core_probe(client, &ihid_acpi->ops,
>  				  hid_descriptor_address);
>  }
> 

