Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D8B022AEF53
	for <lists+linux-input@lfdr.de>; Wed, 11 Nov 2020 12:13:35 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726481AbgKKLN2 (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 11 Nov 2020 06:13:28 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:20186 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726513AbgKKLN0 (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Wed, 11 Nov 2020 06:13:26 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1605093203;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=Z8S+siqoexZXXM7q29fDjpzHS86Gh3tR8QOyHiVyeH8=;
        b=LquYXfoyMkQ1fJv1ecATHemiB5t4UM3FxVbkDeO+lDC7OkBrXgIONxccejd865tVm3x8X9
        kkpxy51wXlvJzBRkQiieVowJ0z/7fZLNYcEkyruPw2xDWub1aRIw5F4kRoHqhNnBUw+Grh
        zDdci2OJE1YLh3lGoymVGlsAtM/hSx4=
Received: from mail-ej1-f70.google.com (mail-ej1-f70.google.com
 [209.85.218.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-377-ZPqShXj5PleZD3qnPqEeJQ-1; Wed, 11 Nov 2020 06:13:22 -0500
X-MC-Unique: ZPqShXj5PleZD3qnPqEeJQ-1
Received: by mail-ej1-f70.google.com with SMTP id q11so592389ejy.0
        for <linux-input@vger.kernel.org>; Wed, 11 Nov 2020 03:13:21 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=Z8S+siqoexZXXM7q29fDjpzHS86Gh3tR8QOyHiVyeH8=;
        b=Ax5jIA0qNQrY5g2ahlK8YXTiOloezppRCWl/fi9uCamO3DP79DeqH2ad2G2Gc07QLe
         /jLd4cLUiP4rBEN1BxnwRdY77Yf28aOFGZqK8NsjhirNHsFm5OMdXTtPB0aekICLV9A9
         /wK393po1y5h4bxuaulCdv81fvmbrJncxINx+SOKRbmpz+QjviUuWX8VKzfhX/aQ6njW
         d6U+i3MuGbK4suEZQFHNkX17Y6fFNX9+aV4KSfOmsgjZcI6tw50PEGYAlSbmhGvBZJrf
         s07hpRy/zT3fhXlNPg0bdJK9+m8X4zmiFLeM7D0u7p0FJ1GroHtAW8uL96wn8b3nBCfR
         jHeQ==
X-Gm-Message-State: AOAM5316Q3rj5MQhe4bXKerfTCh5vsi1BgFFfAlTORt8Wbi+1795JNHc
        0d29wNX2IH84gahRuRZgkMudeIVtDLkBJYWL7FC69ccRkJAnrqGwrLQ3g/hpdZmdMIqT4/AQzBx
        Hhwrvt+7HQIQhNy50gKswB6s=
X-Received: by 2002:a17:906:892:: with SMTP id n18mr24125344eje.1.1605093200635;
        Wed, 11 Nov 2020 03:13:20 -0800 (PST)
X-Google-Smtp-Source: ABdhPJz99HJvX1FUbNByylAknLNJ/wBG4xsEFBX+F/mEyCsUbAfospfLtXxB8FtKEDJXIrvF2zhZ3w==
X-Received: by 2002:a17:906:892:: with SMTP id n18mr24125309eje.1.1605093200346;
        Wed, 11 Nov 2020 03:13:20 -0800 (PST)
Received: from x1.localdomain (2001-1c00-0c0c-fe00-6c10-fbf3-14c4-884c.cable.dynamic.v6.ziggo.nl. [2001:1c00:c0c:fe00:6c10:fbf3:14c4:884c])
        by smtp.gmail.com with ESMTPSA id h2sm725863ejx.55.2020.11.11.03.13.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 11 Nov 2020 03:13:19 -0800 (PST)
Subject: Re: [PATCH v5 1/4] HID: i2c-hid: Reorganize so ACPI and OF are
 separate modules
To:     Doug Anderson <dianders@chromium.org>
Cc:     Jiri Kosina <jkosina@suse.cz>,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Kai-Heng Feng <kai.heng.feng@canonical.com>,
        Rob Herring <robh+dt@kernel.org>,
        "open list:HID CORE LAYER" <linux-input@vger.kernel.org>,
        Stephen Boyd <swboyd@chromium.org>,
        Andrea Borgia <andrea@borgia.bo.it>,
        Jiri Kosina <jikos@kernel.org>,
        Masahiro Yamada <masahiroy@kernel.org>,
        Pavel Balan <admin@kryma.net>,
        Xiaofei Tan <tanxiaofei@huawei.com>,
        You-Sheng Yang <vicamo.yang@canonical.com>,
        LKML <linux-kernel@vger.kernel.org>
References: <20201109213636.1267536-1-dianders@chromium.org>
 <20201109133526.v5.1.Ied4ce10d229cd7c69abf13a0361ba0b8d82eb9c4@changeid>
 <d51318d1-5d26-f840-2651-42a1134d407b@redhat.com>
 <CAD=FV=WL7C_OPOQqJY_9nDP4Riz6c4XMHXBBj7FkzMJPBVo9Nw@mail.gmail.com>
From:   Hans de Goede <hdegoede@redhat.com>
Message-ID: <38773dae-32fa-b153-a774-27b474d1a778@redhat.com>
Date:   Wed, 11 Nov 2020 12:13:18 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.3.1
MIME-Version: 1.0
In-Reply-To: <CAD=FV=WL7C_OPOQqJY_9nDP4Riz6c4XMHXBBj7FkzMJPBVo9Nw@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Hi,

On 11/10/20 11:17 PM, Doug Anderson wrote:
> Hi,
> 
> On Tue, Nov 10, 2020 at 1:01 AM Hans de Goede <hdegoede@redhat.com> wrote:
>>
>> Hi,
>>
>> On 11/9/20 10:36 PM, Douglas Anderson wrote:
>>> This patch rejiggers the i2c-hid code so that the OF (Open Firmware
>>> aka Device Tree) and ACPI support is separated out a bit.  The OF and
>>> ACPI drivers are now separate modules that wrap the core module.
>>>
>>> Essentially, what we're doing here:
>>> * Make "power up" and "power down" a function that can be (optionally)
>>>   implemented by a given user of the i2c-hid core.
>>> * The OF and ACPI modules are drivers on their own, so they implement
>>>   probe / remove / suspend / resume / shutdown.  The core code
>>>   provides implementations that OF and ACPI can call into.
>>>
>>> We'll organize this so that we now have 3 modules: the old i2c-hid
>>> module becomes the "core" module and two new modules will depend on
>>> it, handling probing the specific device.
>>>
>>> As part of this work, we'll remove the i2c-hid "platform data"
>>> concept since it's not needed.
>>>
>>> Signed-off-by: Douglas Anderson <dianders@chromium.org>
>>> ---
>>>
>>> Changes in v5:
>>> - Add shutdown_tail op and use it in ACPI.
>>> - i2chid_subclass_data => i2chid_ops.
>>> - power_up_device => power_up (same with power_down).
>>> - subclass => ops.
>>>
>>
>> Thanks this looks good to now, 2 small remarks below (since you are
>> going to do a v6 anyways). Feel free to ignore these remarks if
>> you prefer to keep things as is.
>>
>> And feel free to add my reviewed-by to v6 of this patch:
>>
>> Reviewed-by: Hans de Goede <hdegoede@redhat.com>
> 
> Thanks!
> 
> 
>>> +static const struct i2c_device_id i2c_hid_acpi_id_table[] = {
>>> +     { "hid", 0 },
>>> +     { "hid-over-i2c", 0 },
>>> +     { },
>>> +};
>>> +MODULE_DEVICE_TABLE(i2c, i2c_hid_acpi_id_table);
>>
>> Hmm, I do not think these old-style i2c-ids are necessarry at
>> all in this driver. I expect all use-cases to use either
>> of or acpi matches.
>>
>> This was already present in the code before though, so
>> please ignore this remark. This is just something which
>> I noticed and thought was worth while pointing out as
>> a future cleanup.
> 
> Yeah, I wasn't sure if there was anyone using them.
> 
> Hrm.  Thinking about it, though, is it really OK for two drivers to
> both have the same table listed?  I'm not sure how that would work.
> Do you know?

Ah I missed that you are adding the i2c_device_id table to
both the new -acpi and -of drivers.

That indeed is not a good idea.

> I don't know a ton about ACPI, but for device tree I know i2c has a
> fallback mode.  Specifically having this table means that we'll match
> compatible strings such as:
> 
>   "zipzapzing,hid"
>   "kapowzers,hid-over-i2c"
> 
> In other words it'll ignore the vendor part and just match on the
> second half.

Yeah I know about that clever hack the i2c subsys has. 

> Just to make sure I wasn't remembering that from a dream
> I tried it and it worked.  I don't see any mainline device trees that
> look like that, though.  I could delete it, though it doesn't really
> take up much space and it seems nice to keep it working in case anyone
> was relying on it?

Ack, so in the of case there is a reason to keep this. But ACPI binding
does not use anything similar, so the old-style i2c_device_id table
should probably be removed from the -acpi driver.

> For ACPI is there a similar fallback?  If not then it seems like it'd
> be easy to remove it from there...
> 
> 
>> <snip>
>>
>>> diff --git a/drivers/hid/i2c-hid/i2c-hid-core.c b/drivers/hid/i2c-hid/i2c-hid-core.c
>>> index aeff1ffb0c8b..9551ba96dc49 100644
>>> --- a/drivers/hid/i2c-hid/i2c-hid-core.c
>>> +++ b/drivers/hid/i2c-hid/i2c-hid-core.c
>>> @@ -35,12 +35,8 @@
>>>  #include <linux/kernel.h>
>>>  #include <linux/hid.h>
>>>  #include <linux/mutex.h>
>>> -#include <linux/acpi.h>
>>> -#include <linux/of.h>
>>>  #include <linux/regulator/consumer.h>
>>
>> I think you can drop this regulator include here now too ?
> 
> Good point.
> 
> 
>>> diff --git a/drivers/hid/i2c-hid/i2c-hid-of.c b/drivers/hid/i2c-hid/i2c-hid-of.c
>>> new file mode 100644
>>> index 000000000000..15d533be2b24
>>> --- /dev/null
>>> +++ b/drivers/hid/i2c-hid/i2c-hid-of.c
>> <snip>
>>
>>> +static const struct dev_pm_ops i2c_hid_of_pm = {
>>> +     SET_SYSTEM_SLEEP_PM_OPS(i2c_hid_core_suspend, i2c_hid_core_resume)
>>> +};
>>
>> This dev_pm_ops struct is identical to the one in i2c-hid-acpi.c
>> and the one which you introduce later in i2c-hid-of-goodix.c
>> is also identical, so that is 3 copies.
>>
>> Maybe just put a shared dev_pm_ops struct in the i2c-core
>> (and don't export the suspend/resume handlers) ?
> 
> Sounds good.

Regards,

Hans

