Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A27EB1FF6A3
	for <lists+linux-input@lfdr.de>; Thu, 18 Jun 2020 17:28:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731473AbgFRP21 (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 18 Jun 2020 11:28:27 -0400
Received: from us-smtp-2.mimecast.com ([205.139.110.61]:40587 "EHLO
        us-smtp-delivery-1.mimecast.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1731454AbgFRP20 (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Thu, 18 Jun 2020 11:28:26 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1592494104;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=6t+LMexuwO8rApPO3GfOJDLY+tnZX1xQZaII2oSVytY=;
        b=Qeo4vyXOHXrnQj6QoOVqMAA11ngZFG5vOjkmigyH0pD/2QLQ/7jdxBqsB53ntMNwlBNi9Z
        8vNYpSUE/I7XJDujO39fMADAy6oJYbzK5eDntu6+goE7YNWgHkQXaJUlmBLQQN3fFFO9jm
        UnW+B6cwvBME5Tl6xv7zGv6zXT9Mncc=
Received: from mail-ej1-f70.google.com (mail-ej1-f70.google.com
 [209.85.218.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-434-wJNu4L3XOpWU4xI_D7qyTA-1; Thu, 18 Jun 2020 11:28:22 -0400
X-MC-Unique: wJNu4L3XOpWU4xI_D7qyTA-1
Received: by mail-ej1-f70.google.com with SMTP id do21so2756540ejc.2
        for <linux-input@vger.kernel.org>; Thu, 18 Jun 2020 08:28:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=6t+LMexuwO8rApPO3GfOJDLY+tnZX1xQZaII2oSVytY=;
        b=hls2e4vmEpSFDf0EFKt/QEBUr1NpnVDHOgUmmspui/a8LJsyzJzl1TZPiPJThkuqGJ
         y0Vj8XVNRMTPgXqgZrQj1YWmSIFNawum4jY+SbUZDK9KdlhLrQ2JKvK5R0wQ6eAi4prA
         9wCKrRms0g/WBMod9UF9srnvvLDUwiUcMPAY1QfQPq+3a+pcuYxxTWyDjhl8do7BvIyK
         9I0vzGwOQ/bv5zHwPGi87EQYIE7VD3Ex99WYn8/NhMpGgVN1zn8nbBlZTMmPUGs7kuF0
         6Q9crrMvjPsyhZTINBK4wsCGm9hXRjPH8TdTAT7tUBD24AzcKuPvWrwNYQW6hmk0Eev3
         pzUQ==
X-Gm-Message-State: AOAM532TZQqUB1VgYCRFa/4WMnQfJ9aP+BqFgaBgT9A1aQXdZZMtXzNG
        XUQZ2uSKAdWMuITGWwY1Dzh0DY2zBdsw2eEIodxlHXEMie3XD+UOwyJMO+9EvfnyvKwWVdtHDJd
        1qYaFL9tZNq2yXJR1xxMUa8Y=
X-Received: by 2002:a17:906:1a06:: with SMTP id i6mr4736824ejf.9.1592494101445;
        Thu, 18 Jun 2020 08:28:21 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwOb/3dDEWNCo2JSy7yikbnO/oC0SvF4eCfj1Oz2sGSq/unVGc4FvN1k8A+v0oOlJzmgl1RWw==
X-Received: by 2002:a17:906:1a06:: with SMTP id i6mr4736804ejf.9.1592494101214;
        Thu, 18 Jun 2020 08:28:21 -0700 (PDT)
Received: from x1.localdomain (2001-1c00-0c0c-fe00-d2ea-f29d-118b-24dc.cable.dynamic.v6.ziggo.nl. [2001:1c00:c0c:fe00:d2ea:f29d:118b:24dc])
        by smtp.gmail.com with ESMTPSA id la5sm2522044ejb.94.2020.06.18.08.28.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 18 Jun 2020 08:28:20 -0700 (PDT)
Subject: Re: [PATCH v3] HID: i2c-hid: Enable touchpad wakeup from
 Suspend-to-Idle
To:     Kai-Heng Feng <kai.heng.feng@canonical.com>, jikos@kernel.org,
        benjamin.tissoires@redhat.com
Cc:     You-Sheng Yang <vicamo.yang@canonical.com>,
        Daniel Playfair Cal <daniel.playfair.cal@gmail.com>,
        HungNien Chen <hn.chen@weidahitech.com>,
        Pavel Balan <admin@kryma.net>,
        "open list:HID CORE LAYER" <linux-input@vger.kernel.org>,
        open list <linux-kernel@vger.kernel.org>
References: <20200618145515.5055-1-kai.heng.feng@canonical.com>
From:   Hans de Goede <hdegoede@redhat.com>
Message-ID: <c280d8b5-05bf-e560-51df-c57edeffe8a3@redhat.com>
Date:   Thu, 18 Jun 2020 17:28:19 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <20200618145515.5055-1-kai.heng.feng@canonical.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Hi,

On 6/18/20 4:55 PM, Kai-Heng Feng wrote:
> Many laptops can be woken up from Suspend-to-Idle by touchpad. This is
> also the default behavior on other OSes.
> 
> So let's enable the wakeup support if the system defaults to
> Suspend-to-Idle.

I have been debugging a spurious wakeup issue on an Asus T101HA,
where the system would not stay suspended when the lid was closed.

The issue turns out to be that the touchpad is generating touch
events when the lid/display gets close to the touchpad. In this case
wakeup is already enabled by default because it is an USB device.

So I do not believe that this is a good idea, most current devices
with a HID multi-touch touchpad use i2c-hid and also use S2idle,
so this will basically enable wakeup by touchpad on almost all
current devices.

There will likely be other devices with the same issue as the T101HA,
but currently we are not seeing this issue because by default i2c-hid
devices do not have wakeup enabled. This change will thus likely cause
new spurious wakeup issues on more devices. So this seems like a
bad idea.

Also your commit message mentions touchpads, but the change
will also enable wakeup on most touchscreens out there, meaning
that just picking up a device in tablet mode and accidentally
touching the screen will wake it up.

Also hid multi-touch devices have 3 modes, see the diagrams
in Microsoft hw design guides for win8/10 touch devices:
1. Reporting events with low latency (high power mode)
2. Reporting events with high latency (lower power mode)
3. Not reporting events (lowest power mode)

I actually still need to write some patches for hid-multitouch.c
to set the mode to 2 or 3 on suspend depending on the device_may_wakeup
setting of the parent. Once that patch is written, it should
put most i2c-hid mt devices in mode 3, hopefully also helping
with Linux' relative high power consumption when a device is
suspended. With your change instead my to-be-written patch
would put the device in mode 2, which would still be an
improvement but less so.

Regards,

Hans






> 
> Signed-off-by: Kai-Heng Feng <kai.heng.feng@canonical.com>
> ---
> v3:
>   - Use device_init_wakeup().
>   - Wording change.
> 
> v2:
>   - Fix compile error when ACPI is not enabled.
>   drivers/hid/i2c-hid/i2c-hid-core.c | 10 ++++++++++
>   1 file changed, 10 insertions(+)
> 
> diff --git a/drivers/hid/i2c-hid/i2c-hid-core.c b/drivers/hid/i2c-hid/i2c-hid-core.c
> index 294c84e136d7..dae1d072daf6 100644
> --- a/drivers/hid/i2c-hid/i2c-hid-core.c
> +++ b/drivers/hid/i2c-hid/i2c-hid-core.c
> @@ -931,6 +931,12 @@ static void i2c_hid_acpi_fix_up_power(struct device *dev)
>   		acpi_device_fix_up_power(adev);
>   }
>   
> +static void i2c_hid_acpi_enable_wakeup(struct device *dev)
> +{
> +	if (acpi_gbl_FADT.flags & ACPI_FADT_LOW_POWER_S0)
> +		device_init_wakeup(dev, true);
> +}
> +
>   static const struct acpi_device_id i2c_hid_acpi_match[] = {
>   	{"ACPI0C50", 0 },
>   	{"PNP0C50", 0 },
> @@ -945,6 +951,8 @@ static inline int i2c_hid_acpi_pdata(struct i2c_client *client,
>   }
>   
>   static inline void i2c_hid_acpi_fix_up_power(struct device *dev) {}
> +
> +static inline void i2c_hid_acpi_enable_wakeup(struct device *dev) {}
>   #endif
>   
>   #ifdef CONFIG_OF
> @@ -1072,6 +1080,8 @@ static int i2c_hid_probe(struct i2c_client *client,
>   
>   	i2c_hid_acpi_fix_up_power(&client->dev);
>   
> +	i2c_hid_acpi_enable_wakeup(&client->dev);
> +
>   	device_enable_async_suspend(&client->dev);
>   
>   	/* Make sure there is something at this address */
> 

