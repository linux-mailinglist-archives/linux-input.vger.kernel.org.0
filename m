Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 529D4219D01
	for <lists+linux-input@lfdr.de>; Thu,  9 Jul 2020 12:07:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726446AbgGIKHp (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 9 Jul 2020 06:07:45 -0400
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]:29519 "EHLO
        us-smtp-1.mimecast.com" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
        with ESMTP id S1726327AbgGIKHo (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Thu, 9 Jul 2020 06:07:44 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1594289262;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=XGzQ4h/xdgSnPNt6v8xNLAT0U2pdFmJEzgSG1Adoozc=;
        b=RY0QX2t2WUz6p8KA/tLxlSe5PLlqmo3VgsFLSwIkvW3dPCZ8SOvd+LoL3EQAXfHxSmzDxd
        U4HOW/uZlO0xf7hYfmhvI2psruar/2VGaHpv+z9In01UhnI1eX9+sqCCY0HXk+PRollMPj
        advSBZJxCxWJ02JGU/+TCWWMz4Z7q04=
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-461-VDBghZXeOxKk0lIRi9uwOw-1; Thu, 09 Jul 2020 06:07:41 -0400
X-MC-Unique: VDBghZXeOxKk0lIRi9uwOw-1
Received: by mail-ed1-f72.google.com with SMTP id u25so2107869edq.1
        for <linux-input@vger.kernel.org>; Thu, 09 Jul 2020 03:07:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=XGzQ4h/xdgSnPNt6v8xNLAT0U2pdFmJEzgSG1Adoozc=;
        b=Kn+9xbJPsunz0TSIRBXmp+5AarTIiM2up3Pv1u8I9kFBKQxX94Enn735wx1WJLKmLn
         Ngff6b4+PU2wbVixoGMjfDNKhWvKwWxk/2EDOigvTXZ70SLuex6R2/CzWzw6Mhu2mnQF
         IBrN6I0MjcH3C1kCHLHwaLdoblFd1gEZoJthemOEm1zB04zcy2fs+vWRBs8qCqsr+7yb
         DTVTFZWxkjdTzT12IQIeoptMNvbnzNIz6R2iAbCqLwz2zEy1g6IQfAxmmOOHjMpzPOhj
         GsQfHKXLJT8Oe7Zpu6A2/nIoxNM0so5wa8J0tk+XS7Hx5yTz2t4mwJ86LolOsWP6LH3L
         lXOA==
X-Gm-Message-State: AOAM532WbD6KxHy1dc04XR+NPLUwtJY8u7DLfHi/UYJ4yTB2GblZtTZs
        jWuO9tSnoMnas9TJKSWxABSHzrn5otddeCxAUYAy5cG++jeCjPMFArBmatsiP+piRBxQKMO8wYj
        w0NZZW8UQCc1faSn6Vcdg0wY=
X-Received: by 2002:a17:906:7250:: with SMTP id n16mr48439751ejk.290.1594289260121;
        Thu, 09 Jul 2020 03:07:40 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwNztlPBh26eUmJzhZ9TTEOzcrkZpDS4/OKI+ILiWU7nscSANXIx0rJYN9g290LETLzlahYhQ==
X-Received: by 2002:a17:906:7250:: with SMTP id n16mr48439733ejk.290.1594289259929;
        Thu, 09 Jul 2020 03:07:39 -0700 (PDT)
Received: from x1.localdomain (83-84-126-242.cable.dynamic.v4.ziggo.nl. [83.84.126.242])
        by smtp.gmail.com with ESMTPSA id b11sm1657097edw.76.2020.07.09.03.07.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 09 Jul 2020 03:07:39 -0700 (PDT)
Subject: Re: [PATCH v4] HID: i2c-hid: Enable wakeup capability from
 Suspend-to-Idle
To:     Kai-Heng Feng <kai.heng.feng@canonical.com>, jikos@kernel.org,
        benjamin.tissoires@redhat.com
Cc:     anthony.wong@canonical.com,
        You-Sheng Yang <vicamo.yang@canonical.com>,
        Pavel Balan <admin@kryma.net>,
        Aaron Ma <aaron.ma@canonical.com>,
        HungNien Chen <hn.chen@weidahitech.com>,
        Daniel Playfair Cal <daniel.playfair.cal@gmail.com>,
        "open list:HID CORE LAYER" <linux-input@vger.kernel.org>,
        open list <linux-kernel@vger.kernel.org>
References: <20200709075731.5046-1-kai.heng.feng@canonical.com>
From:   Hans de Goede <hdegoede@redhat.com>
Message-ID: <82be7198-168f-d174-7cf8-10cd420e0bb6@redhat.com>
Date:   Thu, 9 Jul 2020 12:05:29 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.9.0
MIME-Version: 1.0
In-Reply-To: <20200709075731.5046-1-kai.heng.feng@canonical.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Hi,

On 7/9/20 9:57 AM, Kai-Heng Feng wrote:
> Many laptops can be woken up from Suspend-to-Idle by touchpad. This is
> also the default behavior on other OSes.
> 
> However, if touchpad and touchscreen contact to each other when lid is
> closed, wakeup events can be triggered inadventertly.
> 
> So let's disable the wakeup by default, but enable the wakeup capability
> so users can enable it at their own discretion.
> 
> Signed-off-by: Kai-Heng Feng <kai.heng.feng@canonical.com>

Thank you, this version looks good to me:

Reviewed-by: Hans de Goede <hdegoede@redhat.com>

Regards,

Hans


> ---
> v4:
>   - Enable the capability, but disable the wakeup default.
> 
> v3:
>   - Use device_init_wakeup().
>   - Wording change.
> 
> v2:
>   - Fix compile error when ACPI is not enabled.
> 
>   drivers/hid/i2c-hid/i2c-hid-core.c | 12 ++++++++++++
>   1 file changed, 12 insertions(+)
> 
> diff --git a/drivers/hid/i2c-hid/i2c-hid-core.c b/drivers/hid/i2c-hid/i2c-hid-core.c
> index 294c84e136d7..c18ca6a6cb3d 100644
> --- a/drivers/hid/i2c-hid/i2c-hid-core.c
> +++ b/drivers/hid/i2c-hid/i2c-hid-core.c
> @@ -931,6 +931,14 @@ static void i2c_hid_acpi_fix_up_power(struct device *dev)
>   		acpi_device_fix_up_power(adev);
>   }
>   
> +static void i2c_hid_acpi_enable_wakeup(struct device *dev)
> +{
> +	if (acpi_gbl_FADT.flags & ACPI_FADT_LOW_POWER_S0) {
> +		device_set_wakeup_capable(dev, true);
> +		device_set_wakeup_enable(dev, false);
> +	}
> +}
> +
>   static const struct acpi_device_id i2c_hid_acpi_match[] = {
>   	{"ACPI0C50", 0 },
>   	{"PNP0C50", 0 },
> @@ -945,6 +953,8 @@ static inline int i2c_hid_acpi_pdata(struct i2c_client *client,
>   }
>   
>   static inline void i2c_hid_acpi_fix_up_power(struct device *dev) {}
> +
> +static inline void i2c_hid_acpi_enable_wakeup(struct device *dev) {}
>   #endif
>   
>   #ifdef CONFIG_OF
> @@ -1072,6 +1082,8 @@ static int i2c_hid_probe(struct i2c_client *client,
>   
>   	i2c_hid_acpi_fix_up_power(&client->dev);
>   
> +	i2c_hid_acpi_enable_wakeup(&client->dev);
> +
>   	device_enable_async_suspend(&client->dev);
>   
>   	/* Make sure there is something at this address */
> 

