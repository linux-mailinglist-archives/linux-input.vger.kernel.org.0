Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F26E82AB6BB
	for <lists+linux-input@lfdr.de>; Mon,  9 Nov 2020 12:25:20 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729493AbgKILYl (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 9 Nov 2020 06:24:41 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:57845 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1729758AbgKILYl (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Mon, 9 Nov 2020 06:24:41 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1604921078;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=MthOriqJfE+60FWjco1JPUkMHNL9HDoZ8g5kvyK76w0=;
        b=XFndzODrOt9Y8zOJsCsVfLDf89L9gGClijIw1TNScao2szXsNB3ak6/YIiCkKaAu3do65G
        KhHwDQcE/1GASvcxwW7MssobtLkTKDbF9dNpOxQ+rMwSNgw+DOLY4eQXsvLsCgeiyIP2X1
        46eJr5Mm3LmvkYhzT9PlLJAQIYrLbuY=
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-243-g-3C33eiPxuVRxjEFgIA5w-1; Mon, 09 Nov 2020 06:24:37 -0500
X-MC-Unique: g-3C33eiPxuVRxjEFgIA5w-1
Received: by mail-ed1-f69.google.com with SMTP id dj19so1159851edb.13
        for <linux-input@vger.kernel.org>; Mon, 09 Nov 2020 03:24:37 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=MthOriqJfE+60FWjco1JPUkMHNL9HDoZ8g5kvyK76w0=;
        b=OK4irQbf7S1juoetAobbeG+Vgy1F3WxyBBhJXnLvb4uxdjeklhmhsiyvkwDg+WlUum
         d+zbUtyKRpPNmCgZkBpjSTPyIVsanlCfop+ZdL7fSutD4+4Jp18EAXZs6Ec9i6uabzxw
         TYadJHG8gPS762b25nY6FNugWWlbnrKZRUA/Tp4xN0ActqcH7OedQ2/5hNi2Zsjzzw70
         MRoN0Z0dFoGmYyybNG95X5WUyAFSzlro+wChxdCrNIIdBSiEnSV26wkhr/ofqJZp8Osp
         iOSIuX+bWjIJ7JCAU7Os+8e7T4LJJDXfe8Pe+m8Sngm2nntKd8p/sgHSAem+Iwzw3q1S
         NOnw==
X-Gm-Message-State: AOAM533wUf/oHW6FYpL7nxtJP02kkiDUMrSIRoS3lSH0/MzbmKcE3vuG
        MN6ZpbAvMWpo6nRVJzXzprkbrEKha0Vlk61McNvYTkyKppfZYdu2SZsOeBzAv5T0RmBfFlj1wM7
        UmcCjOyGM7/JV/eUloHbD28E=
X-Received: by 2002:a17:906:745:: with SMTP id z5mr15207864ejb.408.1604921075973;
        Mon, 09 Nov 2020 03:24:35 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxckM1hesxtpDoMS8XhbYeZ17Kk4myad+hrrppPCJs4QXpBEf1zd2+2DL7ODfoVcc7HolwbgA==
X-Received: by 2002:a17:906:745:: with SMTP id z5mr15207850ejb.408.1604921075702;
        Mon, 09 Nov 2020 03:24:35 -0800 (PST)
Received: from x1.localdomain (2001-1c00-0c0c-fe00-6c10-fbf3-14c4-884c.cable.dynamic.v6.ziggo.nl. [2001:1c00:c0c:fe00:6c10:fbf3:14c4:884c])
        by smtp.gmail.com with ESMTPSA id 22sm8352952ejw.27.2020.11.09.03.24.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 09 Nov 2020 03:24:35 -0800 (PST)
Subject: Re: [PATCH v4 1/4] HID: i2c-hid: Reorganize so ACPI and OF are
 subclasses
To:     Doug Anderson <dianders@chromium.org>
Cc:     Jiri Kosina <jkosina@suse.cz>,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        "open list:HID CORE LAYER" <linux-input@vger.kernel.org>,
        Stephen Boyd <swboyd@chromium.org>,
        Andrea Borgia <andrea@borgia.bo.it>,
        Kai-Heng Feng <kai.heng.feng@canonical.com>,
        Rob Herring <robh+dt@kernel.org>,
        Aaron Ma <aaron.ma@canonical.com>,
        Jiri Kosina <jikos@kernel.org>,
        Masahiro Yamada <masahiroy@kernel.org>,
        Pavel Balan <admin@kryma.net>,
        Xiaofei Tan <tanxiaofei@huawei.com>,
        You-Sheng Yang <vicamo.yang@canonical.com>,
        LKML <linux-kernel@vger.kernel.org>
References: <20201104012929.3850691-1-dianders@chromium.org>
 <20201103172824.v4.1.Ied4ce10d229cd7c69abf13a0361ba0b8d82eb9c4@changeid>
 <ea8d8fa3-4e3e-3c56-cda3-c1f6b155018c@redhat.com>
 <CAD=FV=XLnL35Ltu0ZF2c_u262TDaJ+oZ_jiME_VUd8V+1P5Vaw@mail.gmail.com>
From:   Hans de Goede <hdegoede@redhat.com>
Message-ID: <20283437-4166-b65e-c498-a650bf53cd8e@redhat.com>
Date:   Mon, 9 Nov 2020 12:24:34 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.3.1
MIME-Version: 1.0
In-Reply-To: <CAD=FV=XLnL35Ltu0ZF2c_u262TDaJ+oZ_jiME_VUd8V+1P5Vaw@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Hi,

On 11/4/20 5:06 PM, Doug Anderson wrote:
> Hi,
> 
> On Wed, Nov 4, 2020 at 4:07 AM Hans de Goede <hdegoede@redhat.com> wrote:
>>
>>> +#include "i2c-hid.h"
>>> +
>>> +struct i2c_hid_acpi {
>>> +     struct i2chid_subclass_data subclass;
>>
>> This feels a bit weird, we are the subclass so typically we would
>> be embedding a base_class data struct here ...
>>
>> (more remarks below, note just my 2 cents you may want to wait
>> for feedback from others).
>>
>>> +     struct i2c_client *client;
>>
>> You pass this to i2c_hid_core_probe which then stores it own
>> copy, why not just store it in the subclass (or even better
>> baseclass) data struct ?
> 
> My goal was to avoid moving the big structure to the header file.
> Without doing that, I think you need something more like the setup I
> have.  I'll wait for Benjamin to comment on whether he'd prefer
> something like what I have here or if I should move the structure.

Ok, if Benjamin decides to keep things this way, can you consider
renaming i2chid_subclass_data to i2chid_ops ?

It just feels weird to have a struct with subclass in the name
embedded inside as a member in another struct, usualy the kobject model
works by having the the parent/base-class struct embedded inside
the subclass data struct.

This also avoids the need for a callback_priv_data pointer to the ops,
as the ops get a pointer to the baseclass data struct as argument and
you can then use container_of to get your own subclassdata struct
since that encapsulates (contains) the baseclass struct.

Note the dropping of the callback_priv_data pointer only works if you
do move the entire struct to the header.



> 
> 
>>> @@ -156,10 +152,10 @@ struct i2c_hid {
>>>
>>>       wait_queue_head_t       wait;           /* For waiting the interrupt */
>>>
>>> -     struct i2c_hid_platform_data pdata;
>>> -
>>>       bool                    irq_wake_enabled;
>>>       struct mutex            reset_lock;
>>> +
>>> +     struct i2chid_subclass_data *subclass;
>>>  };
>>
>> Personally, I would do things a bit differently here:
>>
>> 1. Just add the
>>
>>         int (*power_up_device)(struct i2chid_subclass_data *subclass);
>>         void (*power_down_device)(struct i2chid_subclass_data *subclass);
>>
>> members which you put in the subclass struct here.
>>
>> 2. Move the declaration of this complete struct to drivers/hid/i2c-hid/i2c-hid.h
>> and use this as the base-class which I described before (and store the client
>> pointer here).
>>
>> 3. And then kzalloc both this baseclass struct + the subclass-data
>> (only the bool "power_fixed" in the ACPI case) in one go in the subclass code
>> replacing 2 kzallocs (+ error checking with one, simplifying the code and
>> reducing memory fragmentation (by a tiny sliver).
> 
> Sure, I'll do that if Benjamin likes moving the structure to the header.
> 
> 
>> About the power_*_device callbacks, I wonder if it would not be more consistent
>> to also have a shutdown callback and make i2c_driver.shutdown point to
>> a (modified) i2c_hid_core_shutdown() function.
> 
> Personally this doesn't seem cleaner to me, but I'm happy to do it if
> folks like it better.  Coming up with a name for the callback would be
> a bit awkward, which is a sign that this isn't quite ideal?  For the
> power_up()/power_down() those are sane concepts to abstract out.  Here
> we'd be abstracting out "subclass_shutdown_tail()" or something?
> ...and if a subclass needs something at the head of shutdown, we'd
> need to add a "subclass_shutdown_head()"?

I have no real preference here either way.

>> You may also want to consider pointing that shutdown callback to the power_off
>> function in the of case (in a separate commit as that is a behavioral change).
> 
> I don't think this is the point of shutdown, but I could be corrected.
> Shutdown isn't really supposed to be the same as driver remove or
> anything.  IIUC the main point of shutdown is to support kexec and the
> goal is to quiesce DMA transactions.  Turning off power has never been
> a requirement that I was aware of.  We don't want to jam too much
> stuff in shutdown or else "shutdown" becomes as slow as boot for no
> good reason, right?

This sorta depends on if the regulators for the HID device are part of the
PMIC or not. If they are part of the PMIC then on shutdown they will
typically be turned off by the PMIC. But if they are separate they may
stay enabled on shutdown.

Anyways I again have no real preference here...

Regards,

Hans






> 
> 
>>> diff --git a/drivers/hid/i2c-hid/i2c-hid-of.c b/drivers/hid/i2c-hid/i2c-hid-of.c
>>> new file mode 100644
>>> index 000000000000..e1838cdef0aa
>>> --- /dev/null
>>> +++ b/drivers/hid/i2c-hid/i2c-hid-of.c
>>> @@ -0,0 +1,149 @@
>>> +/*
>>> + * HID over I2C Open Firmware Subclass
>>> + *
>>> + * Copyright (c) 2012 Benjamin Tissoires <benjamin.tissoires@gmail.com>
>>> + * Copyright (c) 2012 Ecole Nationale de l'Aviation Civile, France
>>> + * Copyright (c) 2012 Red Hat, Inc
>>
>> <snip>
>>
>>> +MODULE_DESCRIPTION("HID over I2C OF driver");
>>> +MODULE_AUTHOR("Benjamin Tissoires <benjamin.tissoires@gmail.com>");
>>
>> In case Benjamin misses this during his own review: I'm not sure if he
>> will want to be set as AUTHOR of this, given that part of the plan is
>> for someone else to be the primary point of contact for the of bits.
> 
> I can stick myself in as the author if needed.  I'll wait for
> Benjamin's feedback here.
> 
> 
> -Doug
> 

