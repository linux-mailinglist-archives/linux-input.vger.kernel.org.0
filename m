Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 186F52ABF18
	for <lists+linux-input@lfdr.de>; Mon,  9 Nov 2020 15:45:11 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732147AbgKIOoi (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 9 Nov 2020 09:44:38 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:37661 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1731988AbgKIOoG (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Mon, 9 Nov 2020 09:44:06 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1604933045;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=YPCE6yCI2eHm1BkAkFBsff23HgizVskYri9f1zGQnIc=;
        b=VUxwZt1fxmdOoyTAcAwBf9zzenNg7mm5MBif2DxMmtqwnx01Z36FkNYHpCX7eQw4V06fBs
        ZhMgJEIoESTNtiK8A/F8RlHin08oj8so5JkAnpXLU5PKT19yL1szPL4tSHJ0MyihQViPLw
        o3zSeixZHAK+vuUnYZ7+rmFqOuGlzEc=
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-159-TQ2ITYuyMiy84NL-DnuoIw-1; Mon, 09 Nov 2020 09:44:03 -0500
X-MC-Unique: TQ2ITYuyMiy84NL-DnuoIw-1
Received: by mail-ed1-f69.google.com with SMTP id y99so2809306ede.3
        for <linux-input@vger.kernel.org>; Mon, 09 Nov 2020 06:44:03 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=YPCE6yCI2eHm1BkAkFBsff23HgizVskYri9f1zGQnIc=;
        b=SwQOkqjQHHEdl64Kco+fsVSuzpkTbbWBGD6hFUe4q9H23K+ByyFZgfMaATqVnnxk9G
         uPHu9gvzbLiqo7bTZwJhTDG5y+LOcDMcvW7qtoo77ltXf3qZlVCZOWP9BbSylaXRLWIQ
         WKHvi1G5rHF6ysHlNcS4IbZsHqmvYPQaKJ7k/7lOwUJyfI7B4AQoSW1KlFRwlGfGUVUl
         UJjk/ft6aUme+Y/ztyAfE9FxaaLBUShUKdzY3jl5NycmjFLhVS1TNusCsvPtDCBZ3gyx
         tMpBEU3QSmDWv3TwNrg7fxQ2kucKI7MAyEMMZy0u4aPGvak+DhzHMaMHZP/oAm2VFTCG
         s99A==
X-Gm-Message-State: AOAM5334wAbfbyQHNWh3W0MkvFljqK1c7hVh8bmunwIVUV3R5d7/F4SH
        gu+9owSTMW00+GptcK68BT0B78oSyLEa80uuUYd7NUFCXIp5ikSnXh/yMIYGfq7jih0ECL82bnv
        uhpluCJxvzNndXp752BgOOPI=
X-Received: by 2002:a17:906:2683:: with SMTP id t3mr15803982ejc.414.1604933041929;
        Mon, 09 Nov 2020 06:44:01 -0800 (PST)
X-Google-Smtp-Source: ABdhPJySA0GBIUbv28XFj4RsyIhHvm1xFXHuQr9V+Kbzrmc7R6ffbTYPV9HgMSrijnsOmUOASjBaQQ==
X-Received: by 2002:a17:906:2683:: with SMTP id t3mr15803943ejc.414.1604933041655;
        Mon, 09 Nov 2020 06:44:01 -0800 (PST)
Received: from x1.localdomain (2001-1c00-0c0c-fe00-6c10-fbf3-14c4-884c.cable.dynamic.v6.ziggo.nl. [2001:1c00:c0c:fe00:6c10:fbf3:14c4:884c])
        by smtp.gmail.com with ESMTPSA id o31sm8946615edd.94.2020.11.09.06.44.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 09 Nov 2020 06:44:01 -0800 (PST)
Subject: Re: [PATCH v4 1/4] HID: i2c-hid: Reorganize so ACPI and OF are
 subclasses
To:     Benjamin Tissoires <benjamin.tissoires@redhat.com>
Cc:     Doug Anderson <dianders@chromium.org>,
        Jiri Kosina <jkosina@suse.cz>,
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
 <20283437-4166-b65e-c498-a650bf53cd8e@redhat.com>
 <CAO-hwJ+C9M8zqaiiAW2CATZtng7B9QPOMBSMts6hPUHE9PmSCQ@mail.gmail.com>
From:   Hans de Goede <hdegoede@redhat.com>
Message-ID: <fd5958b8-106a-4ee8-04d1-f4eb882661e4@redhat.com>
Date:   Mon, 9 Nov 2020 15:44:00 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.3.1
MIME-Version: 1.0
In-Reply-To: <CAO-hwJ+C9M8zqaiiAW2CATZtng7B9QPOMBSMts6hPUHE9PmSCQ@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Hi,

On 11/9/20 3:29 PM, Benjamin Tissoires wrote:
> Hi,
> 
> sorry for the delay. I have been heavily sidetracked and have a bunch
> of internal deadlines coming in :/
> 
> On Mon, Nov 9, 2020 at 12:24 PM Hans de Goede <hdegoede@redhat.com> wrote:
>>
>> Hi,
>>
>> On 11/4/20 5:06 PM, Doug Anderson wrote:
>>> Hi,
>>>
>>> On Wed, Nov 4, 2020 at 4:07 AM Hans de Goede <hdegoede@redhat.com> wrote:
>>>>
>>>>> +#include "i2c-hid.h"
>>>>> +
>>>>> +struct i2c_hid_acpi {
>>>>> +     struct i2chid_subclass_data subclass;
>>>>
>>>> This feels a bit weird, we are the subclass so typically we would
>>>> be embedding a base_class data struct here ...
>>>>
>>>> (more remarks below, note just my 2 cents you may want to wait
>>>> for feedback from others).
>>>>
>>>>> +     struct i2c_client *client;
>>>>
>>>> You pass this to i2c_hid_core_probe which then stores it own
>>>> copy, why not just store it in the subclass (or even better
>>>> baseclass) data struct ?
>>>
>>> My goal was to avoid moving the big structure to the header file.
>>> Without doing that, I think you need something more like the setup I
>>> have.  I'll wait for Benjamin to comment on whether he'd prefer
>>> something like what I have here or if I should move the structure.
>>
>> Ok, if Benjamin decides to keep things this way, can you consider
>> renaming i2chid_subclass_data to i2chid_ops ?
>>
>> It just feels weird to have a struct with subclass in the name
>> embedded inside as a member in another struct, usualy the kobject model
>> works by having the the parent/base-class struct embedded inside
>> the subclass data struct.
>>
>> This also avoids the need for a callback_priv_data pointer to the ops,
>> as the ops get a pointer to the baseclass data struct as argument and
>> you can then use container_of to get your own subclassdata struct
>> since that encapsulates (contains) the baseclass struct.
>>
>> Note the dropping of the callback_priv_data pointer only works if you
>> do move the entire struct to the header.
> 
> I am not sure my opinion is the best in this case. However, the one
> thing I'd like us to do is knowing which use cases we are solving, and
> this should hopefully help us finding the best approach:
> 
> - use case 1: fully upstream driver (like this one)
>    -> the OEM sets up the DT associated with the embedded devices
>    -> the kernel is compiled with the proper flags/configs
>   -> the device works out of the box (yay!)
> 
> - use case 2: tinkerer in a garage
>   -> assembly of a generic SoC + Goodix v-next panel (that needs
> modifications in the driver)
>   -> use of a generic (arm?) distribution
>   -> the user compiles the new (changed) goodix driver
>   -> the DT is populated (with overloads)
>   -> the device works
>   -> do we want to keep compatibility across kernel versions (not
> recompile the custom module)
> 
> - use case 3: Google fixed kernel
>   -> the kernel is built once for all platforms
>   -> OEMs can recompile a few drivers if they need, but can not touch
> the core system
>   -> DT/goodix specific drivers are embedded
>   -> device works
>   -> do we want compatibility across major versions, and how "nice" we
> want to be with OEM?
> 
> I understand that use case 2 should in the end become use case 1, but
> having a possibility for casual/enthusiasts developers to fix their
> hardware is always nice.
> 
> So to me, having the base struct in an external header means we are
> adding a lot of ABI and putting a lot more weight to case 1.
> 
> Personally, I am not that much in favour of being too strict and I
> think we also want to help these external drivers. It is true that
> i2c-hid should be relatively stable from now on, but we can never
> predict the future, so maybe the external header is not so much a good
> thing (for me).
> 
> Anyway, if we were to extract the base struct, we would need to
> provide allocators to be able to keep forward compatibility (I think).
> 
> Does that help a bit?
> 
> [mode bikeshedding on]
> And to go back to Hans' suggestion, I really prefer i2chid_ops. This
> whole architecture makes me think of a bus, not a subclass hierarchy.
> In the same way we have the hid bus, we could have the i2c-hid bus,
> with separate drivers in it (acpi, of, goodix).
> 
> Note that I don't want the i2c-hid to be converted into an actual bus,
> but just rely on the concepts.
> [bikeshedding off]

Ok, so TL;DR: keep as is but rename subclass to i2chid_ops. That works
for me.

>>>>> @@ -156,10 +152,10 @@ struct i2c_hid {
>>>>>
>>>>>       wait_queue_head_t       wait;           /* For waiting the interrupt */
>>>>>
>>>>> -     struct i2c_hid_platform_data pdata;
>>>>> -
>>>>>       bool                    irq_wake_enabled;
>>>>>       struct mutex            reset_lock;
>>>>> +
>>>>> +     struct i2chid_subclass_data *subclass;
>>>>>  };
>>>>
>>>> Personally, I would do things a bit differently here:
>>>>
>>>> 1. Just add the
>>>>
>>>>         int (*power_up_device)(struct i2chid_subclass_data *subclass);
>>>>         void (*power_down_device)(struct i2chid_subclass_data *subclass);
>>>>
>>>> members which you put in the subclass struct here.
>>>>
>>>> 2. Move the declaration of this complete struct to drivers/hid/i2c-hid/i2c-hid.h
>>>> and use this as the base-class which I described before (and store the client
>>>> pointer here).
>>>>
>>>> 3. And then kzalloc both this baseclass struct + the subclass-data
>>>> (only the bool "power_fixed" in the ACPI case) in one go in the subclass code
>>>> replacing 2 kzallocs (+ error checking with one, simplifying the code and
>>>> reducing memory fragmentation (by a tiny sliver).
>>>
>>> Sure, I'll do that if Benjamin likes moving the structure to the header.
>>>
>>>
>>>> About the power_*_device callbacks, I wonder if it would not be more consistent
>>>> to also have a shutdown callback and make i2c_driver.shutdown point to
>>>> a (modified) i2c_hid_core_shutdown() function.
>>>
>>> Personally this doesn't seem cleaner to me, but I'm happy to do it if
>>> folks like it better.  Coming up with a name for the callback would be
>>> a bit awkward, which is a sign that this isn't quite ideal?  For the
>>> power_up()/power_down() those are sane concepts to abstract out.  Here
>>> we'd be abstracting out "subclass_shutdown_tail()" or something?
>>> ...and if a subclass needs something at the head of shutdown, we'd
>>> need to add a "subclass_shutdown_head()"?
>>
>> I have no real preference here either way.
> 
> If we are using i2chid_ops, we could just have `shutdown_tail()`.
> Basically drop any "device" or "subclass" in the op name.
> This would lead to better code IMO: "ihid->dev_ops->shutdown()" for example


This also works for me.

Regards,

Hans

