Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7FCB9307690
	for <lists+linux-input@lfdr.de>; Thu, 28 Jan 2021 14:01:04 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231396AbhA1M7I (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 28 Jan 2021 07:59:08 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:33755 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S229684AbhA1M6w (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Thu, 28 Jan 2021 07:58:52 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1611838645;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=RQRTze2u1DHqclyMF0wb2FPkoyfGM5emp3NoekYOq7Q=;
        b=NSGbfG9sJhJ0L/if25sZzk3rLRKlkvncdspi43n245kYf6TXD0rW1Dm0pBhIvND5nAgGxv
        6RSwbSMvkyq+nOvq0gMGkaPzj0aWeAtQwt3yeW6CQifXqhWH5wJ2iQywXA66IEp2ehGORa
        OH4s/fiPKpcd4gNVqesaIIMPGi9HrMs=
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-242-NQ5l5JaTMGGfa-KJQ2DKFw-1; Thu, 28 Jan 2021 07:57:23 -0500
X-MC-Unique: NQ5l5JaTMGGfa-KJQ2DKFw-1
Received: by mail-ed1-f69.google.com with SMTP id j11so3114440edy.20
        for <linux-input@vger.kernel.org>; Thu, 28 Jan 2021 04:57:23 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=RQRTze2u1DHqclyMF0wb2FPkoyfGM5emp3NoekYOq7Q=;
        b=E/28Fa7FggeU0HQtuht7JHg8defYDm6++xNlyTajg8/1buv6DBr8UHAlS+GMwVtmAy
         gtNomS/XTunVEQtwXujITMmdNmD/Xb7wpMIc36r3UcfmI71l5iUzddOP4l5XwzY95SW5
         81AUVa74/S450idsBThb+PoBy2UwwXJjhj7ENPpuXDNtUGU7ewt7/JQnrQPKVLf9drnE
         K1lttxZPqus0EjPwO4Ci/S9axdsw6Rbq6kuwFv+dNdT1rsJOn5CCRe/FcilPBinQu47+
         Xv9pQvMaElO7VhzjvUqmen3dpEvL4ExbQ5CltCIcGM5vdXBjz5fJunYWNDpEsoZlhB7m
         YAXQ==
X-Gm-Message-State: AOAM532RlxvbV7jpZkwnmWFUIl+cEJDm28rCznH3G27YSL9dUEwS4hjI
        RlrPyUsWv82p+PquwtaLwSqOKuESqDgK/VExHC+FDczq7TGWsaZAQvBItJhInEUWINFQlSDYRzg
        zExHdXplhV2DSEOwBeFpg9Pk84tSM9wriQ5iJoPNWtdC1yHsM3QIa4R4RZ/VbV/HRid4Jsnsj/I
        E=
X-Received: by 2002:a50:a086:: with SMTP id 6mr13723202edo.70.1611838642291;
        Thu, 28 Jan 2021 04:57:22 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzQeNJBswx+1gSrdRThIvMijeRrlemA25moWE8b4X7543NVprddj7C0DUMX3VZh4gE86Hwy9g==
X-Received: by 2002:a50:a086:: with SMTP id 6mr13723185edo.70.1611838642065;
        Thu, 28 Jan 2021 04:57:22 -0800 (PST)
Received: from x1.localdomain (2001-1c00-0c1e-bf00-37a3-353b-be90-1238.cable.dynamic.v6.ziggo.nl. [2001:1c00:c1e:bf00:37a3:353b:be90:1238])
        by smtp.gmail.com with ESMTPSA id t19sm2236842ejc.62.2021.01.28.04.57.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 28 Jan 2021 04:57:21 -0800 (PST)
Subject: Re: [PATCH] Input: silead - Add workaround for x86 BIOS-es which
 bring the Silead chip up in a stuck state
To:     Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc:     linux-input@vger.kernel.org
References: <20210128125256.106879-1-hdegoede@redhat.com>
From:   Hans de Goede <hdegoede@redhat.com>
Message-ID: <4cf568a0-7409-ce07-773d-9df83ec2a861@redhat.com>
Date:   Thu, 28 Jan 2021 13:57:20 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <20210128125256.106879-1-hdegoede@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Hi,

Ugh, I had a local compile-fix which I forgot to git commit -a --amend,
so this version does not compile, please ignore.

V2 coming up right away.

Regards,

Hans



On 1/28/21 1:52 PM, Hans de Goede wrote:
> Some buggy BIOS-es bring up the touchscreen-controller in a stuck
> state where it blocks the I2C bus. Specifically this happens on
> the Jumper EZpad 7 tablet model.
> 
> After much poking at this problem I have found that the following steps
> are necessary to unstuck the chip / bus:
> 
> 1. Turn off the Silead chip.
> 2. Try to do an I2C transfer with the chip, this will fail in response to
>    which the I2C-bus-driver will call: i2c_recover_bus() which will unstuck
>    the I2C-bus. Note the unstuck-ing of the I2C bus only works if we first
>    drop the chip of the bus by turning it off.
> 3. Turn the chip back on.
> 
> On the x86/ACPI systems were this problem is seen, step 1. and 3. require
> making ACPI calls and dealing with ACPI Power Resources. This commit adds
> a workaround which runtime-suspends the chip to turn it off, leaving it up
> to the ACPI subsystem to deal with all the ACPI specific details.
> 
> There is no good way to detect this bug, so the workaround gets activated
> by a new "silead,stuck-controller-bug" boolean device-property. Since this
> is only used on x86/ACPI, this will be set by model specific device-props
> set by drivers/platform/x86/touchscreen_dmi.c. Therefor this new
> device-property is not documented in the DT-bindings.
> 
> Dmesg will contain the following messages on systems where the workaround
> is activated:
> 
> [   54.309029] silead_ts i2c-MSSL1680:00: [Firmware Bug]: Stuck I2C bus: please ignore the next 'controller timed out' error
> [   55.373593] i2c_designware 808622C1:04: controller timed out
> [   55.582186] silead_ts i2c-MSSL1680:00: Silead chip ID: 0x80360000
> 
> Signed-off-by: Hans de Goede <hdegoede@redhat.com>
> ---
>  drivers/input/touchscreen/silead.c | 39 +++++++++++++++++++++++++++---
>  1 file changed, 35 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/input/touchscreen/silead.c b/drivers/input/touchscreen/silead.c
> index 8fa2f3b7cfd8..9deef6317761 100644
> --- a/drivers/input/touchscreen/silead.c
> +++ b/drivers/input/touchscreen/silead.c
> @@ -20,6 +20,7 @@
>  #include <linux/input/mt.h>
>  #include <linux/input/touchscreen.h>
>  #include <linux/pm.h>
> +#include <linux/pm_runtime.h>
>  #include <linux/irq.h>
>  #include <linux/regulator/consumer.h>
>  
> @@ -335,10 +336,8 @@ static int silead_ts_get_id(struct i2c_client *client)
>  
>  	error = i2c_smbus_read_i2c_block_data(client, SILEAD_REG_ID,
>  					      sizeof(chip_id), (u8 *)&chip_id);
> -	if (error < 0) {
> -		dev_err(&client->dev, "Chip ID read error %d\n", error);
> +	if (error < 0)
>  		return error;
> -	}
>  
>  	data->chip_id = le32_to_cpu(chip_id);
>  	dev_info(&client->dev, "Silead chip ID: 0x%8X", data->chip_id);
> @@ -351,12 +350,44 @@ static int silead_ts_setup(struct i2c_client *client)
>  	int error;
>  	u32 status;
>  
> +	/*
> +	 * Some buggy BIOS-es bring up the chip in a stuck state where it blocks the I2C bus.
> +	 * The following steps are necessary to unstuck the chip / bus:
> +	 * 1. Turn off the Silead chip.
> +	 * 2. Try to do an I2C transfer with the chip, this will fail in response to
> +	 *    which the I2C-bus-driver will call: i2c_recover_bus() which will unstuck
> +	 *    the I2C-bus. Note the unstuck-ing of the I2C bus only works if we first
> +	 *    drop the chip of the bus by turning it off.
> +	 * 3. Turn the chip back on.
> +	 *
> +	 * On the x86/ACPI systems were this problem is seen, step 1. and 3. require
> +	 * making ACPI calls and dealing with ACPI Power Resources. The workaround below
> +	 * runtime-suspends the chip to turn it off, leaving it up to the ACPI subsystem
> +	 * to deal with this.
> +	 */
> +	if (device_property_read_bool(dev, "silead,stuck-controller-bug")) {
> +		pm_runtime_set_active(&client->dev);
> +		pm_runtime_enable(&client->dev);
> +		pm_runtime_allow(&client->dev);
> +
> +		pm_runtime_suspend(&client->dev);
> +
> +		dev_warn(&client->dev, FW_BUG "Stuck I2C bus: please ignore the next 'controller timed out' error\n");
> +		silead_ts_get_id(client);
> +
> +		/* The forbid will also resume the device */
> +		pm_runtime_forbid(&client->dev);
> +		pm_runtime_disable(&client->dev);
> +	}
> +
>  	silead_ts_set_power(client, SILEAD_POWER_OFF);
>  	silead_ts_set_power(client, SILEAD_POWER_ON);
>  
>  	error = silead_ts_get_id(client);
> -	if (error)
> +	if (error) {
> +		dev_err(&client->dev, "Chip ID read error %d\n", error);
>  		return error;
> +	}
>  
>  	error = silead_ts_init(client);
>  	if (error)
> 

