Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 48C182AD1F3
	for <lists+linux-input@lfdr.de>; Tue, 10 Nov 2020 10:01:18 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726827AbgKJJBR (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 10 Nov 2020 04:01:17 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:38442 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726462AbgKJJBQ (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Tue, 10 Nov 2020 04:01:16 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1604998874;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=W4VY/yPsS/m/WZ9pEuQqK3Pk7b75F4LRKyeFxg81vzQ=;
        b=C2ZaR5l+NR/aMulEwmzseHMCvd2TnMmJbt/7JEV9t7Uim4gCOT3Uk/ajH6OMrUHalQt4tc
        yhfCUwRqtrgPoJdsqAqPIwIaM12HiTCUtUWcJGQMfc6LWdw21iQHomih+/5aa+yukBkWRa
        5p3I5sz/0IA9kofo76t1PjN2aJuysZA=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-595-ltwSk8uMPPaaL8vF_fVbhQ-1; Tue, 10 Nov 2020 04:01:13 -0500
X-MC-Unique: ltwSk8uMPPaaL8vF_fVbhQ-1
Received: by mail-ed1-f70.google.com with SMTP id s7so2390093eds.17
        for <linux-input@vger.kernel.org>; Tue, 10 Nov 2020 01:01:13 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=W4VY/yPsS/m/WZ9pEuQqK3Pk7b75F4LRKyeFxg81vzQ=;
        b=JQ0AKXpNQLV4wEhC8GbOnGKCoCsTvyjG/p+3QqGH5aHS+hwWgHLzAuI23WHhFj2+eK
         M2fMZNDsQErXb329UYWf+hQjbe3u556ItsM2g8ZW6Bv/Czca7IJxayUKT42PUbXXCBiU
         zCCXLtE3kdzQUBS6ots/ES024yqDhOc06H/XR8+umfDw423qQRvOKS34ORtLi8eH9NZ+
         6vt8E7xmn1rbp5gFWFeqlI3iwKu6NzDL/OsvLD1OkU9PR8aXuJK5dPMs34Unnn3gJciQ
         npneVKO5PqKI7MDAFFgnuEOo/E0aszDGJ7dwIN5cLH0oYpgYj3E8Q850nuUkNuankfCj
         w2Dw==
X-Gm-Message-State: AOAM53102gwBGpcfVXLS4igWlwp0W1aC/gtZML36vhdIaTn6hZzK7OYg
        Vcrs/q+gHgX3/Y0ftbPp4UWsuaUpfoyGcwvn4eA80zvuJ3fvUCXsjxi9VPlG4tj1hjPeAmoIvrp
        JojamiXaif8D6mDSbx8GfaCw=
X-Received: by 2002:aa7:cdd9:: with SMTP id h25mr20062222edw.294.1604998871837;
        Tue, 10 Nov 2020 01:01:11 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzXhICreT0TZ9M8hsz1LDME3U8E+EEx5OL0tlEE9oJncCENp46nIsg6LLXNUb+SAjFVKh/hsA==
X-Received: by 2002:aa7:cdd9:: with SMTP id h25mr20062196edw.294.1604998871623;
        Tue, 10 Nov 2020 01:01:11 -0800 (PST)
Received: from x1.localdomain (2001-1c00-0c0c-fe00-6c10-fbf3-14c4-884c.cable.dynamic.v6.ziggo.nl. [2001:1c00:c0c:fe00:6c10:fbf3:14c4:884c])
        by smtp.gmail.com with ESMTPSA id e18sm9952662eja.124.2020.11.10.01.01.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 10 Nov 2020 01:01:11 -0800 (PST)
Subject: Re: [PATCH v5 1/4] HID: i2c-hid: Reorganize so ACPI and OF are
 separate modules
To:     Douglas Anderson <dianders@chromium.org>, jkosina@suse.cz,
        benjamin.tissoires@redhat.com, gregkh@linuxfoundation.org,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc:     kai.heng.feng@canonical.com, robh+dt@kernel.org,
        linux-input@vger.kernel.org, swboyd@chromium.org,
        andrea@borgia.bo.it, Jiri Kosina <jikos@kernel.org>,
        Masahiro Yamada <masahiroy@kernel.org>,
        Pavel Balan <admin@kryma.net>,
        Xiaofei Tan <tanxiaofei@huawei.com>,
        You-Sheng Yang <vicamo.yang@canonical.com>,
        linux-kernel@vger.kernel.org
References: <20201109213636.1267536-1-dianders@chromium.org>
 <20201109133526.v5.1.Ied4ce10d229cd7c69abf13a0361ba0b8d82eb9c4@changeid>
From:   Hans de Goede <hdegoede@redhat.com>
Message-ID: <d51318d1-5d26-f840-2651-42a1134d407b@redhat.com>
Date:   Tue, 10 Nov 2020 10:01:10 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.3.1
MIME-Version: 1.0
In-Reply-To: <20201109133526.v5.1.Ied4ce10d229cd7c69abf13a0361ba0b8d82eb9c4@changeid>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Hi,

On 11/9/20 10:36 PM, Douglas Anderson wrote:
> This patch rejiggers the i2c-hid code so that the OF (Open Firmware
> aka Device Tree) and ACPI support is separated out a bit.  The OF and
> ACPI drivers are now separate modules that wrap the core module.
> 
> Essentially, what we're doing here:
> * Make "power up" and "power down" a function that can be (optionally)
>   implemented by a given user of the i2c-hid core.
> * The OF and ACPI modules are drivers on their own, so they implement
>   probe / remove / suspend / resume / shutdown.  The core code
>   provides implementations that OF and ACPI can call into.
> 
> We'll organize this so that we now have 3 modules: the old i2c-hid
> module becomes the "core" module and two new modules will depend on
> it, handling probing the specific device.
> 
> As part of this work, we'll remove the i2c-hid "platform data"
> concept since it's not needed.
> 
> Signed-off-by: Douglas Anderson <dianders@chromium.org>
> ---
> 
> Changes in v5:
> - Add shutdown_tail op and use it in ACPI.
> - i2chid_subclass_data => i2chid_ops.
> - power_up_device => power_up (same with power_down).
> - subclass => ops.
> 

Thanks this looks good to now, 2 small remarks below (since you are
going to do a v6 anyways). Feel free to ignore these remarks if
you prefer to keep things as is.

And feel free to add my reviewed-by to v6 of this patch:

Reviewed-by: Hans de Goede <hdegoede@redhat.com>

<snip>

> diff --git a/drivers/hid/i2c-hid/i2c-hid-acpi.c b/drivers/hid/i2c-hid/i2c-hid-acpi.c
> new file mode 100644
> index 000000000000..5f09635d00ce
> --- /dev/null
> +++ b/drivers/hid/i2c-hid/i2c-hid-acpi.c
> @@ -0,0 +1,170 @@

<snip>

> +static const struct i2c_device_id i2c_hid_acpi_id_table[] = {
> +	{ "hid", 0 },
> +	{ "hid-over-i2c", 0 },
> +	{ },
> +};
> +MODULE_DEVICE_TABLE(i2c, i2c_hid_acpi_id_table);

Hmm, I do not think these old-style i2c-ids are necessarry at
all in this driver. I expect all use-cases to use either
of or acpi matches.

This was already present in the code before though, so
please ignore this remark. This is just something which
I noticed and thought was worth while pointing out as
a future cleanup.

<snip>

> diff --git a/drivers/hid/i2c-hid/i2c-hid-core.c b/drivers/hid/i2c-hid/i2c-hid-core.c
> index aeff1ffb0c8b..9551ba96dc49 100644
> --- a/drivers/hid/i2c-hid/i2c-hid-core.c
> +++ b/drivers/hid/i2c-hid/i2c-hid-core.c
> @@ -35,12 +35,8 @@
>  #include <linux/kernel.h>
>  #include <linux/hid.h>
>  #include <linux/mutex.h>
> -#include <linux/acpi.h>
> -#include <linux/of.h>
>  #include <linux/regulator/consumer.h>

I think you can drop this regulator include here now too ?


> diff --git a/drivers/hid/i2c-hid/i2c-hid-of.c b/drivers/hid/i2c-hid/i2c-hid-of.c
> new file mode 100644
> index 000000000000..15d533be2b24
> --- /dev/null
> +++ b/drivers/hid/i2c-hid/i2c-hid-of.c
<snip>

> +static const struct dev_pm_ops i2c_hid_of_pm = {
> +	SET_SYSTEM_SLEEP_PM_OPS(i2c_hid_core_suspend, i2c_hid_core_resume)
> +};

This dev_pm_ops struct is identical to the one in i2c-hid-acpi.c
and the one which you introduce later in i2c-hid-of-goodix.c
is also identical, so that is 3 copies.

Maybe just put a shared dev_pm_ops struct in the i2c-core
(and don't export the suspend/resume handlers) ?

Regards,

Hans

