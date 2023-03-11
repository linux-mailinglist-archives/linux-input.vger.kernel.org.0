Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 772896B5B1B
	for <lists+linux-input@lfdr.de>; Sat, 11 Mar 2023 12:21:40 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231181AbjCKLVh (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Sat, 11 Mar 2023 06:21:37 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60880 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230209AbjCKLUy (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Sat, 11 Mar 2023 06:20:54 -0500
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1C0E813FF08
        for <linux-input@vger.kernel.org>; Sat, 11 Mar 2023 03:17:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1678533396;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=8HtTZHNiIUPp0Ayn4qV3goPGQiFJ+yAjnlk3bginDtc=;
        b=W0h/QtdS3wSAqjerNcIm0zfAdUzGAJB/qxAKioi7VOYyw8a8lO1wJ9uw9xrRJL2Sv67Lh1
        QA+unRj7z5DVgmyjLaOR6SsBfvl1MoVIXYOB8H3tfjasz9HPNrmnP2SJJOst2vMsWdakMh
        oAJESeovdyApxY7RyIoX3QDoeduHarc=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-657-f6f0KwmRPkWSOqVzMBUq8Q-1; Sat, 11 Mar 2023 06:16:35 -0500
X-MC-Unique: f6f0KwmRPkWSOqVzMBUq8Q-1
Received: by mail-ed1-f70.google.com with SMTP id da22-20020a056402177600b004c60694083eso10905160edb.5
        for <linux-input@vger.kernel.org>; Sat, 11 Mar 2023 03:16:34 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678533394;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=8HtTZHNiIUPp0Ayn4qV3goPGQiFJ+yAjnlk3bginDtc=;
        b=IEOKwbBN2Q+Pp2RxXONSyDmBQRHhbVtojsB+8A3+KMk3VGH85BaoKdw99KikAozV+F
         2LjmqDrDDwG0ph82S62Y+m2hXFFPGhHEi0F15jCbEMXRTq08oa+l7wSg73F44FVIIW2R
         Euf84uho4jYjwlP6NiZFBfNHIdYuPL9c1hTLres9JQpeXJ8obrDLPffpN54RxafCf8Ce
         kkwC41/Rre8fUwZq8GpB5pS6nNdGzQw1uV3nPVJqWhIRoTEczW4koj7ohgfPaNYwXmfa
         gJVgEQKbkKquI8z34ont39vJgHbUY15sODBqUkRJTl/MNA62dMExtjlkYxhoxzNfiCxn
         setQ==
X-Gm-Message-State: AO0yUKV5Aq1LrkjsQBqSuxg/gzX8IscGfLycsAuBCBdxViEmssEBgtB1
        mdbQCOpn3uXlrYWJKynyjcnlUs8jmFuvaf6GNczw7z4AeaJ92NYTVmfkYI4woy27FBj+aIcMb8+
        OROkvy36taOd33WAMIhNZr6A=
X-Received: by 2002:a17:906:2843:b0:8b1:15ab:f4cd with SMTP id s3-20020a170906284300b008b115abf4cdmr25458854ejc.53.1678533394002;
        Sat, 11 Mar 2023 03:16:34 -0800 (PST)
X-Google-Smtp-Source: AK7set/DgMDrtZ3a31jMzz1d2WO9NqheioXGi0XTx4aVefbWEmAwioRqA07Vb0G7te0m+Ce48644pQ==
X-Received: by 2002:a17:906:2843:b0:8b1:15ab:f4cd with SMTP id s3-20020a170906284300b008b115abf4cdmr25458840ejc.53.1678533393676;
        Sat, 11 Mar 2023 03:16:33 -0800 (PST)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id y25-20020a170906519900b008eb5b085075sm987274ejk.122.2023.03.11.03.16.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 11 Mar 2023 03:16:33 -0800 (PST)
Message-ID: <4a273927-fa03-8503-e1c8-94b0223e80d1@redhat.com>
Date:   Sat, 11 Mar 2023 12:16:32 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH v2 2/2] Input: hideep - Optionally reset controller work
 mode to native HiDeep protocol
Content-Language: en-US, nl
To:     Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc:     Krzysztof Kozlowski <krzk@kernel.org>, devicetree@vger.kernel.org,
        linux-input@vger.kernel.org
References: <20230303222113.285546-1-hdegoede@redhat.com>
 <20230303222113.285546-3-hdegoede@redhat.com>
 <42ac04f2-e7dc-a5a8-750e-243aa82c35db@kernel.org>
 <857e6fc3-65f6-5b71-073f-b518ab3c814e@redhat.com>
 <ZAwIIypDOjkNLRLk@google.com>
From:   Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <ZAwIIypDOjkNLRLk@google.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,
        RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_NONE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Hi,

On 3/11/23 05:48, Dmitry Torokhov wrote:
> On Sun, Mar 05, 2023 at 04:04:30PM +0100, Hans de Goede wrote:
>> Hi,
>>
>> On 3/5/23 14:34, Krzysztof Kozlowski wrote:
>>> On 03/03/2023 23:21, Hans de Goede wrote:
>>>> The HiDeep IST940E touchscreen controller used on the Lenovo Yoga Book X90F
>>>> convertible comes up in HID mode by default.
>>>>
>>>> This works well on the X91F Windows model where the touchscreen is
>>>> correctly described in ACPI and ACPI takes care of controlling
>>>> the reset GPIO and regulators.
>>>>
>>>> But the X90F ships with Android and the ACPI tables on this model don't
>>>> describe the touchscreen. Instead this is hardcoded in the vendor kernel.
>>>>
>>>> The vendor kernel uses the touchscreen in native HiDeep 20 (2.0?) protocol
>>>> mode and switches the controller to this mode by writing 0 to reg 0x081e.
>>>>
>>>> Adjusting the i2c-hid code to deal with the reset-gpio and regulators on
>>>> this non devicetree (but rather broken ACPI) convertible is somewhat tricky
>>>> and the native protocol reports ABS_MT_PRESSURE and ABS_MT_TOUCH_MAJOR
>>>> which are not reported in HID mode, so it is preferable to use the native
>>>> mode.
>>>>
>>>> Add support to the hideep driver to reset the work-mode to the native
>>>> HiDeep protocol to allow using it on the Lenovo Yoga Book X90F.
>>>> This is guarded behind a new "hideep,reset-work-mode" boolean property,
>>>> to avoid changing behavior on other devices.
>>>>
>>>> For the record: I did test using the i2c-hid driver with some quick hacks
>>>> and it does work. The I2C-HID descriptor is available from address 0x0020,
>>>> just like on the X91F Windows model.
>>>>
>>>> Signed-off-by: Hans de Goede <hdegoede@redhat.com>
>>>
>>> Please use scripts/get_maintainers.pl to get a list of necessary people
>>> and lists to CC.  It might happen, that command when run on an older
>>> kernel, gives you outdated entries.  Therefore please be sure you base
>>> your patches on recent Linux kernel.
>>>
>>>> ---
>>>>  .../bindings/input/touchscreen/hideep.txt        |  1 +
>>>>  drivers/input/touchscreen/hideep.c               | 16 ++++++++++++++++
>>>>  2 files changed, 17 insertions(+)
>>>>
>>>> diff --git a/Documentation/devicetree/bindings/input/touchscreen/hideep.txt b/Documentation/devicetree/bindings/input/touchscreen/hideep.txt
>>>> index a47c36190b01..68bb9f8dcc30 100644
>>>> --- a/Documentation/devicetree/bindings/input/touchscreen/hideep.txt
>>>> +++ b/Documentation/devicetree/bindings/input/touchscreen/hideep.txt
>>>> @@ -17,6 +17,7 @@ Optional properties:
>>>>  - linux,keycodes	: Specifies an array of numeric keycode values to
>>>>  			be used for reporting button presses. The array can
>>>>  			contain up to 3 entries.
>>>> +- hideep,reset-work-mode: bool, reset touch report format to the native HiDeep protocol
>>>
>>> Bindings must be a separate patch.
>>>
>>> Also, would be nice to convert first the TXT to DT schema (YAML).
>>>
>>> "-mode" suggests it's some enum, not bool. Otherwise what exactly it is
>>> choosing (which mode)?
>>
>> As it says it is resetting the mode to the native HiDeep protocol,
>> we have no docs on the controller, so I have no idea what other
>> values may be written to 0x081e other then 0 and what modes those
>> values will enable.
> 
> We could either have property specify desired register value, or call
> the property something like "hideep,force-native-protocol" if we want to
> keep it a bool.

"hideep,force-native-protocol" is a good suggestion I'll prepare a new
version with that.

>> Anyways I just realized I should have not included this at all,
>> since atm this new property is only used on X86/ACPI platforms
>> (through platform code setting a device-property), so it is not
>> used on devicetree platforms at all.
> 
> Even if such properties are not documented I do not see how it will
> prevent people from using them... I guess if they validate DT they will
> be caught, but I am not sure that we can rely on this happening.

Right, but I have beene explicitly told multiple times (1) to not document
device-properties when they are only used between x86 platform code and
drivers consuming them (and thus not actually used in any DT files
at that point in time).

Regards,

Hans


1) By the DT bindings maintainers

