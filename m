Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 61E0A28DAF3
	for <lists+linux-input@lfdr.de>; Wed, 14 Oct 2020 10:16:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726596AbgJNIQn (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 14 Oct 2020 04:16:43 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:60056 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726583AbgJNIQk (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Wed, 14 Oct 2020 04:16:40 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1602663397;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=NEuzfJp3kLFJYoyFS4yjEaw3Qu/nOPM379Heem1cvIY=;
        b=CQknKCrfD59IftUl1Q2hry/i9inqQsjZVw0FYAaj/M6nEOMW1cDV/EYRW2Hmg86iS19qfd
        eoG/21QYHQKB1nmI7nRSy+TUQGJR4d56MY/7sE0f58p98eyXMu4w7nyWOHlH+k+6Sf8yiD
        hUbi6MwxIIAvxj/Zf7XvzmOMyatFL4s=
Received: from mail-ej1-f71.google.com (mail-ej1-f71.google.com
 [209.85.218.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-271--TyEr8O8PgCLKA5O0sKu9g-1; Wed, 14 Oct 2020 04:16:36 -0400
X-MC-Unique: -TyEr8O8PgCLKA5O0sKu9g-1
Received: by mail-ej1-f71.google.com with SMTP id p19so860413ejy.11
        for <linux-input@vger.kernel.org>; Wed, 14 Oct 2020 01:16:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=NEuzfJp3kLFJYoyFS4yjEaw3Qu/nOPM379Heem1cvIY=;
        b=YCX8U32vD1fpa6RksC+2HOT32cnC70yPH+w3a2HDd9lrmRjaBq/qvrKEX3P+6+xhBe
         SVz6ss3Y3K2VSZ4/e/MrUaWWx6BdVkv9KqSsna6fkOWWt3ho/QR2g/cLMoC8syNlhj7N
         i1WHIef/L8FAggjo199YXYcKT3VRpEZb2dTc88lr5nvXbej3VBzvXFfJU2Id3QPiae+I
         gBymcKrgvBdPBAhj7wKR24oamIKY5Mht0AlJeCMD1nZJRmAfZYUeWIP1qglUMQEZoy7A
         bRUSaymK5tcK/LMRY76flcDf9WXDkMhjLlRBUbiG/A7N3ohUvBtGOTGuyCt4sajg5P7E
         DJFA==
X-Gm-Message-State: AOAM530hQYRn9OEBrXBOydK/9xcrbwm934K0vXz0Mu3mY+YtkcOnELsS
        ek0BCkDyBu49SJRuvs+QbJSAezOev0+gwSzsvW3urADFzYQlnzfbp701vljriu2NrCMNGjwjm0k
        nollpnNK7GfUMFCQhLO1Rq28=
X-Received: by 2002:a17:906:16c6:: with SMTP id t6mr3888373ejd.453.1602663394862;
        Wed, 14 Oct 2020 01:16:34 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxfABKskznyFPovKXzHLmivfv/H+1LjLqnuqwzcIuE8BplwylF+q5MWWFOsIXAUcxJX4yy9+A==
X-Received: by 2002:a17:906:16c6:: with SMTP id t6mr3888356ejd.453.1602663394612;
        Wed, 14 Oct 2020 01:16:34 -0700 (PDT)
Received: from x1.localdomain (2001-1c00-0c0c-fe00-d2ea-f29d-118b-24dc.cable.dynamic.v6.ziggo.nl. [2001:1c00:c0c:fe00:d2ea:f29d:118b:24dc])
        by smtp.gmail.com with ESMTPSA id a10sm1235250ejs.11.2020.10.14.01.16.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 14 Oct 2020 01:16:34 -0700 (PDT)
Subject: Re: [External] Using IIO to export laptop palm-sensor and lap-mode
 info to userspace?
To:     Mark Pearson <markpearson@lenovo.com>,
        Jeff LaBundy <jeff@labundy.com>
Cc:     Bastien Nocera <hadess@hadess.net>,
        Jonathan Cameron <Jonathan.Cameron@Huawei.com>,
        Nitin Joshi1 <njoshi1@lenovo.com>, linux-input@vger.kernel.org,
        dmitry.torokhov@gmail.com
References: <9f9b0ff6-3bf1-63c4-eb36-901cecd7c4d9@redhat.com>
 <5a646527-7a1f-2fb9-7c09-8becdbff417b@lenovo.com>
 <20201007083602.00006b7e@Huawei.com>
 <218be284-4a37-e9f9-749d-c126ef1d098b@redhat.com>
 <b400b6956270a2433373dd6cbdae3332aa683f4f.camel@hadess.net>
 <cadabe4d-7cce-281e-75fe-fcc2099848da@redhat.com>
 <5273a1de9db682cd41e58553fe57707c492a53b7.camel@hadess.net>
 <272074b5-b28e-1b74-8574-3dc2d614269a@redhat.com>
 <20201008001424.GA3713@labundy.com>
 <9893a32c-02c8-f00c-7f00-6287d55043ab@redhat.com>
 <20201009021949.GA3629@labundy.com>
 <961aeee6-22e9-75dc-9fcf-45cee00ab62c@redhat.com>
 <075a5f57-3330-78fe-669b-01570d43d9c0@lenovo.com>
From:   Hans de Goede <hdegoede@redhat.com>
Message-ID: <a7ba6f8b-a321-013b-b4e5-c9e270eb3df5@redhat.com>
Date:   Wed, 14 Oct 2020 10:16:33 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <075a5f57-3330-78fe-669b-01570d43d9c0@lenovo.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Hi Mark,

On 10/13/20 11:59 PM, Mark Pearson wrote:
> Hi
> 
> On 2020-10-12 8:13 a.m., Hans de Goede wrote:
>> Hi,
>>
>> On 10/9/20 4:19 AM, Jeff LaBundy wrote:
>>> Hi Hans,
>>>
> <snip>
>>>>
>>>>> I just wanted to chime in and confirm that we do have at least one
>>>>> precedent for these being in input (keyboard/iqs62x-keys) and not
>>>>> iio so I agree with Jonathan here. My argument is that we want to
>>>>> signal binary events (user grabbed onto or let go of the handset)
>>>>> rather than deliver continuous data.
>>>>
>>>> I was curious what keycode you are using for this, but I see
>>>> that the keycodes come from devicetree, so I guess I should
>>>> just ask: what keycode are you using for this ?
>>>
>>> The idea here was that a vendor might implement their own daemon
>>> that interprets any keycode of their choice, hence leaving the
>>> keycodes assignable via devicetree.
>>>
>>> This particular device also acts as a capacitive/inductive button
>>> sensor, and these applications were the primary motivation for it
>>> landing in input with its status bits mapped to keycodes.
>>>
>>> I don't think there are any keycodes that exist today that would
>>> universally work for this application. The couple that seem most
>>> closely related (e.g. KEY_WLAN or KEY_RFKILL) are typically used
>>> for disabling the adapter entirely or for airplane mode (please
>>> correct me if I'm wrong).
>>
>> You're right (aka not wrong), KEY_WLAN and KEY_RFKILL are used to
>> toggle wireless radios on/off and re-using them for some SAR
>> purpose would lead to nothing but confusion. We really need to
>> define some standard *new* event-codes for this, such as e.g.
>> the proposed SW_LAP_PROXIMITY and SW_PALMREST_PROXIMITY.
>>
>>> To that end, I'm keen to see how this interface unfolds because
>>> SAR detection tends to be an available mode of operation for
>>> several of the capacitive touch devices I've been working with.
>>
>> I guess that for touchscreens at least (which are on the front),
>> using the existing SW_FRONT_PROXIMITY would make the most sense.
>>
> 
> I've been looking at implementing this and I'm missing something - and I think it's probably something obvious so hoping someone can short cut me to the answer. Hope it's OK to do that in this thread (I removed the linux-iio list as I'm assuming they won't be interested)
> 
> I've added the new event codes to input-event-codes.h and updated mode_devicetable.h
> 
> In the thinkpad_acpi.c driver I initialise the device:
> 
>     tpacpi_sw_dev = input_allocate_device();
>     if (!tpacpi_sw_dev)
>             return -ENOMEM;
>     tpacpi_sw_dev->name = "Thinkpad proximity switches";
>     tpacpi_sw_dev->phys = TPACPI_DRVR_NAME "/input1";
>     tpacpi_sw_dev->id.bustype = BUS_HOST;
>     tpacpi_sw_dev->id.vendor = thinkpad_id.vendor;
>     tpacpi_sw_dev->id.product = TPACPI_HKEY_INPUT_PRODUCT;
>     tpacpi_sw_dev->id.version = TPACPI_HKEY_INPUT_VERSION;
>     tpacpi_sw_dev->dev.parent = &tpacpi_pdev->dev;
> 
>     if (has_palmsensor) {
>        input_set_capability(tpacpi_sw_dev, EV_SW, SW_PALMREST_PROXIMITY);
>        input_report_switch(tpacpi_sw_dev,SW_PALMREST_PROXIMITY, palmsensor_state);
>     }
> 
>     if (has_lapsensor) {
>          input_set_capability(tpacpi_sw_dev, EV_SW, SW_LAP_PROXIMITY);
>          input_report_switch(tpacpi_sw_dev, SW_LAP_PROXIMITY, lapsensor_state);
>     }
>     err = input_register_device(tpacpi_sw_dev);
> 
> If the sensor triggers I update the inputdevice with:
>     input_report_switch(tpacpi_sw_dev, SW_PALMREST_PROXIMITY, new_state);
>     input_sync(tpacpi_sw_dev);
> <similar for lapmode>
> 
> However I'm not seeing the change when I look under evtest, though I do see the new sensors show up:
> 
>     [banther@localhost linux]$ sudo evtest
>     No device specified, trying to scan all of /dev/input/event*
>     Available devices:
>     /dev/input/event0:    Sleep Button
>     /dev/input/event1:    Lid Switch
>     /dev/input/event2:    Power Button
>     /dev/input/event3:    AT Translated Set 2 keyboard
>     /dev/input/event4:    TPPS/2 Elan TrackPoint
>     /dev/input/event5:    SYNA8004:00 06CB:CD8B Mouse
>     /dev/input/event6:    SYNA8004:00 06CB:CD8B Touchpad
>     /dev/input/event7:    Video Bus
>     /dev/input/event8:    Thinkpad proximity switches
>     /dev/input/event9:    PC Speaker
>     /dev/input/event10:    Integrated Camera: Integrated C
>     /dev/input/event11:    sof-hda-dsp Headset Jack
>     /dev/input/event12:    sof-hda-dsp Mic
>     /dev/input/event13:    sof-hda-dsp Headphone
>     /dev/input/event14:    sof-hda-dsp HDMI/DP,pcm=3
>     /dev/input/event15:    sof-hda-dsp HDMI/DP,pcm=4
>     /dev/input/event16:    sof-hda-dsp HDMI/DP,pcm=5
>     /dev/input/event17:    ThinkPad Extra Buttons
>     Select the device event number [0-17]: 8
>     Input driver version is 1.0.1
>     Input device ID: bus 0x19 vendor 0x17aa product 0x5054 version 0x4101
>     Input device name: "Thinkpad proximity switches"
>     Supported events:
>       Event type 0 (EV_SYN)
>       Event type 5 (EV_SW)
>         Event code 17 (?) state 0
>         Event code 18 (?) state 0
>     Properties:
>     Testing ... (interrupt to exit)
> 
> The state for both sensors is supposed to be 1.
> I did download and rebuild evtest and fixed the (?), but haven't figured out why the state is wrong. It seemed related to the number of keys which I found odd.
> 
> Any suggestions from what I'm missing, or have done wrong, or where I should dig next? What's the recommended way of testing my implementation?

A couple suggestions:

1. What Jeff said, add a printf to make sure that the input_report_switch + sync actually get called.
2. Did you rebuild your entire kernel after adding the new SW_ definitions to input-event-codes.h ?  The core may very well be using a check for SW_MAX / SW_CNT
3. Did you rebuild the evtest tool against the latest headers, including an updated SW_MAX / SW_CNT.

To rule out issues with evtest still using an old SW_MAX somewhere you could (as a hack) replace the 2 new SW_... codes with 2 existing ones and see if that makes things work.

Regards,

Hans

