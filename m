Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2547C6DE27F
	for <lists+linux-input@lfdr.de>; Tue, 11 Apr 2023 19:29:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229624AbjDKR3e (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 11 Apr 2023 13:29:34 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56566 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229650AbjDKR3d (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Tue, 11 Apr 2023 13:29:33 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 83B296192
        for <linux-input@vger.kernel.org>; Tue, 11 Apr 2023 10:28:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1681234125;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=dj6+ADX2WcsoCiKzNloAeGOVRf5OKfuU5oxUh+FPHwk=;
        b=V2b2TL76SB2ckn2RMmSpTW3sH7l9LGHwoCj8LBx/B/kUrbPf/+qCR6hRQgX1uk7MxajFBG
        nFooGWDLQtlkqUOlUaF7DTtxczZwHBd/EjqI6wDZLVVEpY97+SD+mGAKJ/Yl0gAQxHQgZ7
        fA0FMvMT87VxEIw8nA9Hax6CfNSB7Pc=
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-402-8gpN__UQMrOo0wHoQiz_8Q-1; Tue, 11 Apr 2023 13:28:44 -0400
X-MC-Unique: 8gpN__UQMrOo0wHoQiz_8Q-1
Received: by mail-ed1-f71.google.com with SMTP id 4fb4d7f45d1cf-50270e74786so2428056a12.0
        for <linux-input@vger.kernel.org>; Tue, 11 Apr 2023 10:28:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1681234123; x=1683826123;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=dj6+ADX2WcsoCiKzNloAeGOVRf5OKfuU5oxUh+FPHwk=;
        b=jsayCHN99bbXU9sdZvyam8s9d6kgdwZddFy6hp6tIAPABrp2/An+Qb9YcYUnuwM8rM
         lqDYs9iP4UmUkWm6DnJWZ61AXZkmQgxS0kEMyIss5npSAs9JgSLLu294GCpz/qhl85jP
         GRPnOA5KweqTv3rK86YcxwsOQQgTNBL3giW9ddaQldgYu+NJs+BWPjfzH6ngM1jZvCzy
         nxdaos0zsf7+fUMlZjIY/d+81KtanZh+NiTZr0TefedLZnSJ8hkQwyUVCWUJjvidqIyy
         wGjuze/E/I19p7YEXG5H5bOuWgoLGSV3PLlTtNquGLIzJvjHGj9tWwAiu7M7emX19bq2
         HKOg==
X-Gm-Message-State: AAQBX9cj/EGSSeAeqGv7dni+0rst8dcAMa/ZZS+XQbReIskSqaxrFc4W
        oRZ4DRKh9AWofVt8157SvrnoJQryRSwZKwhD7quYhp3pN4uKZ0QtHPrv3cyALa19RBTp48mEjKy
        Azl76RWGmnLQFxJnfhKW4xpU=
X-Received: by 2002:aa7:c059:0:b0:502:9aef:6f18 with SMTP id k25-20020aa7c059000000b005029aef6f18mr2714027edo.31.1681234123164;
        Tue, 11 Apr 2023 10:28:43 -0700 (PDT)
X-Google-Smtp-Source: AKy350bnYCWjVgl6WEZ1Xnorra2pX8OrLzu6HdYQXTCVJojreuaB2G+4e/qd0wgnnw0lgTlZosaCMw==
X-Received: by 2002:aa7:c059:0:b0:502:9aef:6f18 with SMTP id k25-20020aa7c059000000b005029aef6f18mr2714007edo.31.1681234122660;
        Tue, 11 Apr 2023 10:28:42 -0700 (PDT)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id b15-20020a50cccf000000b004c10b4f9ebesm6052898edj.15.2023.04.11.10.28.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 11 Apr 2023 10:28:42 -0700 (PDT)
Message-ID: <130ab0b0-6685-1707-3f82-1540958b2389@redhat.com>
Date:   Tue, 11 Apr 2023 19:28:41 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH 0/6] HID: i2c-hid-of: Allow using i2c-hid-of on non OF
 platforms + remove specialized drivers
To:     Benjamin Tissoires <benjamin.tissoires@redhat.com>
Cc:     Jiri Kosina <jikos@kernel.org>,
        Douglas Anderson <dianders@chromium.org>,
        linux-input@vger.kernel.org
References: <20230409144243.25360-1-hdegoede@redhat.com>
 <20230411090209.gartwrkq56syerwk@mail.corp.redhat.com>
 <c3e08839-b621-3e57-0d6b-f4cd14c897b9@redhat.com>
 <20230411125036.3ojjdrjzxhasu5du@mail.corp.redhat.com>
 <eafe8744-49d4-31e3-2329-ddd452358915@redhat.com>
 <20230411165653.rw3ivfjdhjv5dmc3@mail.corp.redhat.com>
Content-Language: en-US, nl
From:   Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <20230411165653.rw3ivfjdhjv5dmc3@mail.corp.redhat.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.4 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_NONE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Hi Benjamin,

On 4/11/23 18:56, Benjamin Tissoires wrote:
> On Apr 11 2023, Hans de Goede wrote:
>> Hi Benjamin,
>>
>> On 4/11/23 14:50, Benjamin Tissoires wrote:
>>> On Apr 11 2023, Hans de Goede wrote:
>>>> Hi Benjamin,
>>>>
>>>> On 4/11/23 11:02, Benjamin Tissoires wrote:

<snip>

>>>>> Also, the problem of "post-reset-deassert-delay-ms" is that you are not
>>>>> documenting it, because the OF folks do not want this in device tree,
>>>>> and I tend to agree with them. So this basically creates a brand new
>>>>> undocumented property, which is less than ideal.
>>>>
>>>> I'm merely not documenting it because there are no devicetree users yet.
>>>
>>> AFAIU, the non devicetree properties should also be documented through
>>> DT bindings, no? So not documenting feels very much like "I want to slip
>>> this one in without having to deal with DT maintainers" (and before you
>>> take it personaly, I know this is definitively not the intent). So I'd
>>> rather much having a public API documented, even if there are no users.
>>
>> Right, so as a hobby I have a tendency to work on these somewhat niche/weird
>> x86 devices, like x86 tablets which use Android as factory OS :)
>>
>> As such I have encountered the need for device-properties to pass info
>> from drivers/platform/x86 code to more generic drivers a number of
>> times before.
>>
>> Each time this happens, if I try to add them to bindings I get
>> asked for some example devicetree code, I then respond that these
>> are *device*-properties not of-properties and that there are no
>> current devicetree users after which the DT maintainers tell me
>> to then NOT document them in the DT bindings, at least not until
>> actually DT users show up. I fully expect any attempt do add
>> this to the DT bindings to go the same way.
>>
>> And now I have you telling me you really want to see this
>> documented at the same time as it getting implemented. Which
>> I fully understand, but does leads to a bit of a catch 22.
> 
> Ouch. Sorry for that.

No problem.

> Then I guess if the DT maintainers have a tendency
> to accept those hidden properties, this is the simplest solution from a
> i2c-hid/HID maintainer point of view, no?

Yes, I believe so, which is why I went this route in the first place.

> It's going to be a pain for the
> platform driver because you still have to hardcode those properties
> somewhere I guess.

Since the entire description is missing in ACPI for the digitizer (*)
the x86-android-tablets.ko module which contains glue code to support
these x86 android tablets already contains the i2c-busnumber,
i2c-address, GPIO lookups, IRQ and other necessary device-properties
like "hid-descr-addr", so adding one more device-property is very little
trouble.

*) and also for other devices both on this and other x86 android tablets

<snip>

>> So I see 2 options here:
>>
>> 1. Take the approach from patches 1-4 here, but drop the property and
>>    use match data on a new "wacom0169" i2c_device_id instead.
>>    This would also pave the way to merging patches 5 + 6 once tested
>>    by google to reduce some code duplication. Although you write below
>>    you would prefer to keep these around as example code for other
>>    specialized drivers...
>>
>> 2. Add a new specialized i2c-hid-of-wacom driver for this.
>>    Question: Since this will be using i2c_device_id binding not
>>    DT/OF binding the -of- in the name is technically incorrect,
>>    but it would be consistent with the other specialized drivers
>>    and could be seen as preparation (avoiding a rename/confusion)
>>    for when any DT enumerated devices which need special handling
>>    show up (note only relevant if you prefer this approach).
> 
> Well, option 2 is probably too much work for little gain. So I would go
> with option 1, but with the following questions:
> 
> - a device property is public, so it can be seen as public API, right?
>   So should we document it some way (not through DT) so we "guarantee"
>   some behavior for it?

I believe the whole idea from the DT maintainers behind not documenting
it as DT binding when not actually used in dts files is to keep it as
in kernel *private* API, in this case between the x86-android-tablets.ko
code instantiating the i2c_client and the i2c-hid code consuming it.

Take the hideep touchscreen on this same tablet for example. After
this patch series we could also use it in i2c-hid mode (I did test
that as an extra test for patches 1-3) but the stock Android uses
it in its native hideep protocol mode which gives some more info
(ABS_MT_PRESSURE and ABS_MT_TOUCH_MAJOR). So currently in -next
the touchscreen is driven in its native mode. This requires sending
a command to (re)set it to native mode since it comes up in i2c-hid
mode by default.

This command is only send if a device-property is set (to avoid
causing issues on other hideep models) and the code consuming
that property looks like this:

        /*
         * Reset touch report format to the native HiDeep 20 protocol if requested.
         * This is necessary to make touchscreens which come up in I2C-HID mode
         * work with this driver.
         *
         * Note this is a kernel internal device-property set by x86 platform code,
         * this MUST not be used in devicetree files without first adding it to
         * the DT bindings.
         */
        if (device_property_read_bool(&ts->client->dev, "hideep,force-native-protocol"))
                regmap_write(ts->reg, HIDEEP_WORK_MODE, 0x00);

So maybe copy that and just add a:

	/*
         * Note this is a kernel internal device-property set by x86 platform code,
         * this MUST not be used in devicetree files without first adding it to
         * the DT bindings.
         */

Comment to the code reading the "post-reset-deassert-delay-ms"
property (patch 3/6) for v2 of this patch-set and leave it
at that ?

(and in hindsight I should have added that comment for v1 already)

> If the above is correct, then that means that the device property can
> be used, which makes little changes to your series.

Sounds good to me.

> But then, why aren't you using that property directly for those 2 other
> drivers? Can't we have elan and goodix i2c-hid-of variants, be just a
> stub around adding the gpio names and the specific reset? (A plain "this
> is completely dumb" answer is fine, just trying to get my head around it).

Only 1 driver can bind to an i2c_client, and if those stub drivers
bind to it, then they must deal with it, or they would need to
create some fake i2c_client and pass everything through, but that
would be rather ugly.

> So, given the above, and your experience with the DT maintainers, I
> would go with patches 1-3 + a documentation of the new property, likely
> in the header or in kernel docs.

I'm fine with going with just patches 1-3. With patch 3 updated to
add the "this is a kernel internal only property" comment.

> Patches 4-6 either dropped, reworked, or left as they are, and we would
> merge them only if the maintainers of those files tested the changes.

Patches 4-6 were meant to make adding support for more
i2c-hid-of devices in the future easier, nothing more nothing
less. So I'm fine with dropping them.

I agree that at a minimum they should get tested before
merging them.

Regards,

Hans



