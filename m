Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C56791165A1
	for <lists+linux-input@lfdr.de>; Mon,  9 Dec 2019 04:51:10 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727091AbfLIDvK (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Sun, 8 Dec 2019 22:51:10 -0500
Received: from a27-55.smtp-out.us-west-2.amazonses.com ([54.240.27.55]:35342
        "EHLO a27-55.smtp-out.us-west-2.amazonses.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726748AbfLIDvK (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Sun, 8 Dec 2019 22:51:10 -0500
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
        s=zsmsymrwgfyinv5wlfyidntwsjeeldzt; d=codeaurora.org; t=1575863468;
        h=Subject:To:Cc:References:From:Message-ID:Date:MIME-Version:In-Reply-To:Content-Type:Content-Transfer-Encoding;
        bh=e3UtgQls/Zp6xIW7RC0Gq8c3Z4lUm5Oz/P0QSe1xE3E=;
        b=KyvudO7Yt4EPyiA/T0SsrJs2DUyJ9Ou9c6oNClyrD7i32aBIzMq8ujLMIjk1P9c9
        +4/i3iRMWBWaurFsSUiTPngUFAePPJhzQOt/smoXhhtk0LaDnhRgQjfrdQMC3qPzD9r
        1y9+YwzYaTHuQ3WVb1Mdp9+5fVpuBldunOLxw28k=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
        s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1575863468;
        h=Subject:To:Cc:References:From:Message-ID:Date:MIME-Version:In-Reply-To:Content-Type:Content-Transfer-Encoding:Feedback-ID;
        bh=e3UtgQls/Zp6xIW7RC0Gq8c3Z4lUm5Oz/P0QSe1xE3E=;
        b=LU7hK+bzVKSLSaNtHOLg0GyVXHMI0a0SKfEqgokjz1lCKpVkuQ9TY5SvGCzYB9UO
        1pNpoP1gpoMBcaN9Z4+YJRWvqh7oku3xtkRJJ7OeqTxnPzEGSr3BRPsqzMSupbDsSoF
        xP+RdHw0HjcEpOqWQKmwqwQ9OxNz9e4Mr3YePa/c=
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED,SPF_NONE
        autolearn=unavailable autolearn_force=no version=3.4.0
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org DBA56C43383
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=none smtp.mailfrom=neeraju@codeaurora.org
Subject: Re: Query regarding hid-multitouch.c driver in 4.14/4.19
To:     Benjamin Tissoires <benjamin.tissoires@redhat.com>
Cc:     Jiri Kosina <jikos@kernel.org>,
        Henrik Rydberg <rydberg@bitmath.org>,
        "open list:HID CORE LAYER" <linux-input@vger.kernel.org>,
        lkml <linux-kernel@vger.kernel.org>,
        MSM <linux-arm-msm@vger.kernel.org>, prsood@codeaurora.org,
        gkohli@codeaurora.org
References: <e1e05bd3-19f5-0dfe-66ad-70717c1c29c6@codeaurora.org>
 <CAO-hwJLdz1sA4tNsLLgZKGA7Ko6dqt9VF5T2nh5uczHxU532HA@mail.gmail.com>
 <4eecbd2a-9d19-c6a2-a95b-656e3fce05a4@codeaurora.org>
 <0101016e916ab42c-fbc61178-9bdd-42ba-b111-722c46db5dc1-000000@us-west-2.amazonses.com>
 <CAO-hwJLDtz7mjWDdqoMKtFjAoweUFq3bAJ2ovbtg0_Gji1nW1w@mail.gmail.com>
From:   Neeraj Upadhyay <neeraju@codeaurora.org>
Message-ID: <0101016ee8c83f70-8eee4b60-7531-4bb3-994b-3973399dcfe4-000000@us-west-2.amazonses.com>
Date:   Mon, 9 Dec 2019 03:51:07 +0000
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.3.0
MIME-Version: 1.0
In-Reply-To: <CAO-hwJLDtz7mjWDdqoMKtFjAoweUFq3bAJ2ovbtg0_Gji1nW1w@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit
X-SES-Outgoing: 2019.12.09-54.240.27.55
Feedback-ID: 1.us-west-2.CZuq2qbDmUIuT3qdvXlRHZZCpfZqZ4GtG9v3VKgRyF0=:AmazonSES
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Hi Benjamin,

Thanks for taking a look at it and providing your inputs. We will check
in the direction suggested by you. I was off from work for some time, so
couldn't reply earlier.


Thanks
Neeraj

On 11/22/2019 2:55 PM, Benjamin Tissoires wrote:
> Hi Neeraj,
> 
> On Fri, Nov 22, 2019 at 5:42 AM Neeraj Upadhyay <neeraju@codeaurora.org> wrote:
>>
>> Hi Benjamin,
>>
>> Can you please provide guidance on how to workaround this problem? Is it
>> possible to support the 4.14 kernel behaviour again, so that existing
>> clients are not impacted?
> 
> Hmm, hard to say. Both evdev outputs from 4.14 and 4.19 are
> technically valid. So I guess the issue is more that the android
> version you are using is not interpreting correctly the 4.19 event
> stream and probably requires some more events (like pressure or
> width/height).
> 
> Also, the report descriptor is crap:
> 
> 0x05, 0x0d,                    // Usage Page (Digitizers)             0
> 0x09, 0x02,                    // Usage (Pen)                         2
> 0xa1, 0x01,                    // Collection (Application)            4
> 0x85, 0x01,                    //  Report ID (1)                      6
> 0x09, 0x22,                    //  Usage (Finger)                     8
> 0xa1, 0x02,                    //  Collection (Logical)               10
> 0x09, 0x42,                    //   Usage (Tip Switch)                12
> 0x15, 0x00,                    //   Logical Minimum (0)               14
> 0x25, 0x01,                    //   Logical Maximum (1)               16
> 0x75, 0x01,                    //   Report Size (1)                   18
> 0x95, 0x01,                    //   Report Count (1)                  20
> 0x81, 0x02,                    //   Input (Data,Var,Abs)              22
> 0x09, 0x32,                    //   Usage (In Range)                  24
> 0x81, 0x02,                    //   Input (Data,Var,Abs)              26
> 0x95, 0x06,                    //   Report Count (6)                  28
> 0x81, 0x03,                    //   Input (Cnst,Var,Abs)              30
> 0x75, 0x08,                    //   Report Size (8)                   32
> 0x09, 0x51,                    //   Usage (Contact Id)                34
> 0x95, 0x01,                    //   Report Count (1)                  36
> 0x81, 0x02,                    //   Input (Data,Var,Abs)              38
> 0x05, 0x01,                    //   Usage Page (Generic Desktop)      40
> 0x26, 0xff, 0x0f,              //   Logical Maximum (4095)            42
> 0x75, 0x10,                    //   Report Size (16)                  45
> 0x55, 0x0e,                    //   Unit Exponent (-2)                47
> 0x65, 0x33,                    //   Unit (Inch^3,EngLinear)           49
> 0x09, 0x30,                    //   Usage (X)                         51
> 0x35, 0x00,                    //   Physical Minimum (0)              53
> 0x46, 0xb5, 0x04,              //   Physical Maximum (1205)           55
> 0x81, 0x02,                    //   Input (Data,Var,Abs)              58
> 0x46, 0x8a, 0x03,              //   Physical Maximum (906)            60
> 0x09, 0x31,                    //   Usage (Y)                         63
> 0x81, 0x02,                    //   Input (Data,Var,Abs)              65
> 0xc0,                          //  End Collection                     67
> 0x05, 0x0d,                    //  Usage Page (Digitizers)            68
> 0x09, 0x54,                    //  Usage (Contact Count)              70
> 0x95, 0x01,                    //  Report Count (1)                   72
> 0x75, 0x08,                    //  Report Size (8)                    74
> 0x81, 0x02,                    //  Input (Data,Var,Abs)               76
> 0x85, 0x08,                    //  Report ID (8)                      78
> 0x09, 0x55,                    //  Usage (Contact Max)                80
> 0x25, 0x05,                    //  Logical Maximum (5)                82
> 0xb1, 0x02,                    //  Feature (Data,Var,Abs)             84
> 0xc0,                          // End Collection                      86
> 0x05, 0x0c,                    // Usage Page (Consumer Devices)       87
> 0x09, 0x01,                    // Usage (Consumer Control)            89
> 0xa1, 0x01,                    // Collection (Application)            91
> 0x85, 0x02,                    //  Report ID (2)                      93
> 0x09, 0xe9,                    //  Usage (Volume Up)                  95
> 0x09, 0xea,                    //  Usage (Volume Down)                97
> 0x0a, 0xae, 0x01,              //  Usage (AL Keyboard Layout)         99
> 0x09, 0xe2,                    //  Usage (Mute)                       102
> 0x09, 0x30,                    //  Usage (Power)                      104
> 0x15, 0x01,                    //  Logical Minimum (1)                106
> 0x25, 0x0c,                    //  Logical Maximum (12)               108
> 0x75, 0x10,                    //  Report Size (16)                   110
> 0x95, 0x01,                    //  Report Count (1)                   112
> 0x81, 0x00,                    //  Input (Data,Arr,Abs)               114
> 0xc0,                          // End Collection                      116
> 
> It declares right at the beginning a Pen application collection then a
> Finger logical application. This should never happen as you can not
> use a pen with a bare finger.
> 
> Anyway, there are a few things you could do to solve the issue,
> depending on what you are allowed to do:
> - if you can tweak the kernel, then maybe adding an extra kernel
> module that just binds to the device without changing anything in
> probe or in events might do the trick. For extra safety you should
> probably fix the report descriptor in this new kernel module
> - if you can tweak bluez or the device itself, at least change the
> ContactID usage to 00 (byte offset 35 above: change 0x51 to 0x00). It
> would be best to actually change the whole report descriptor with the
> correct applications, but, meh, this seems to be working.
> - if you can tweak android, then ensure it can understand this
> particular event stream
> 
> Anyway, I don't think this is an upstream problem, as the device
> behaves somehow correctly by 5.3, at least it sends me the events I
> expect. So I can't really spend a lot of time providing a workaround
> for that.
> 
> My best bet would be to contact the device maker, and ask them to fix
> their device to be working with 4.19 kernel.
> 
> Cheers,
> Benjamin
> 
>>
>>
>> Thanks
>> Neeraj
>>
>> On 11/14/2019 10:01 AM, Neeraj Upadhyay wrote:
>>> Hi Benjamin,
>>>
>>> Sorry for the delay, was waiting for the required information from our
>>> team.
>>>
>>> On 11/13/2019 3:00 PM, Benjamin Tissoires wrote:
>>>> Hi Neeraj,
>>>>
>>>> On Wed, Nov 13, 2019 at 4:11 AM Neeraj Upadhyay
>>>> <neeraju@codeaurora.org> wrote:
>>>>> Hi,
>>>>>
>>>>> I have one query regarding hid-multitouch.c driver and need your
>>>>> guidance on
>>>>> how hid-multitouchc can restore/support the original behaviour,
>>>>> where, for
>>>>> devices, for which application is not
>>>>> HID_DG_TOUCHSCREEN/HID_DG_TOUCHPAD, and has
>>>>> HID_DG_CONTACTID usage in its report, can still use generic input
>>>>> mappings.
>>>>>
>>>>> We are using kernel versions 4.14 , 4.19 respectively in 2 different
>>>>> projects:
>>>>>
>>>>> 4.14:
>>>>> https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux.git/tree/drivers/hid/hid-multitouch.c?h=v4.14.153
>>>>>
>>>>> 4.19:
>>>>> https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux.git/tree/drivers/hid/hid-multitouch.c?h=v4.19.83
>>>>>
>>>>>
>>>>> I checked the application for our hid device, it's HID_DG_PEN, device
>>>>> also has a HID_DG_CONTACTID usage defined in
>>>>>
>>>>> its report.
>>>>>
>>>>> In 4.19, is_mt_collection is set to 'true'. All multitouch code paths or
>>>>> input mapping is configured
>>>>>
>>>>> mt_allocate_report_data()
>>>>>            ...
>>>>>            for (n = 0; n < field->report_count; n++) {
>>>>>                            if (field->usage[n].hid == HID_DG_CONTACTID)
>>>>>                                    rdata->is_mt_collection = true;   //
>>>>> is_mt_collection is set to 'true'
>>>>>                    }
>>>>>            }
>>>>>
>>>>> mt_input_mapping()
>>>>>            ...
>>>>>            if (rdata->is_mt_collection)
>>>>>                return mt_touch_input_mapping(...)  //
>>>>> mt_touch_input_mapping() is called
>>>>>
>>>>> mt_event()
>>>>>            if (rdata && rdata->is_mt_collection)
>>>>>                return mt_touch_event();  // mt_touch_event() is called
>>>>>
>>>>> However, in 4.14, the behaviour was different, mt input mapping was done
>>>>> only
>>>>> for HID_DG_TOUCHSCREEN/HID_DG_TOUCHPAD , and because our hid device is
>>>>> HID_DG_PEN, generic mappings were applied for it; with these settings,
>>>>> device
>>>>> responds to events.
>>>>>
>>>>> static int mt_input_mapping()
>>>>>            if (field->application == HID_DG_TOUCHSCREEN ||
>>>>>                field->application == HID_DG_TOUCHPAD)
>>>>>                return mt_touch_input_mapping();  // This is not called.
>>>>>
>>>>>
>>>>> mt_touch_input_mapping()
>>>>>            case HID_DG_CONTACTID:
>>>>>                            mt_store_field(usage, td, hi);
>>>>>                            td->touches_by_report++;
>>>>>                            td->mt_report_id = field->report->id; //
>>>>> mt_report_id is not set.
>>>>>                            return 1;
>>>>>
>>>>>
>>>>> Looks like this behaviour changed, with below commits:
>>>>>
>>>>> https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux.git/commit/drivers/hid/hid-multitouch.c?h=v4.19.83&id=8dfe14b3b47ff832cb638731f9fc696a3a84f804
>>>>>
>>>>> 8dfe14b3b47f    HID: multitouch: ditch mt_report_id
>>>>> https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux.git/commit/drivers/hid/hid-multitouch.c?h=v4.19.83&id=ba6b055e0f3b4ff4942e4ab273260affcfad9bff
>>>>>
>>>>> ba6b055e0f3b     HID: input: enable Totem on the Dell Canvas 27
>>>>>
>>>>> Can you please suggest on how we can support/preserve the original
>>>>> behaviour?
>>>> Hmm, I would initially say that a firmware that exports Contact ID for
>>>> a Pen is definitely wrong. The Contact ID usage has been introduced in
>>>> https://www.usb.org/sites/default/files/hutrr34.pdf and is
>>>> specifically for multi-touch, not multi pen.
>>>>
>>>> Anyway, couple of questions:
>>>> - does the device supports multi-pen?
>>>
>>> Actually the device is a selfie stick device:
>>> https://item.jd.com/33082497741.html
>>>
>>> It does not support multi-pen.
>>>
>>>> - can you share the report descriptor and a few events when triggering
>>>> this particular report (ideally with hid-recorder from
>>>> https://gitlab.freedesktop.org/libevdev/hid-tools/
>>>
>>> Report descriptor is below:
>>>
>>> 05 0d 09 02 a1 01 85 01 09 22 a1 02 09 42 15 00 25 01 75 01 95 01 81 02
>>> 09 32 81 02 95 06 81 03 75 08 09 51 95 01 81 02 05 01 26 ff 0f 75 10 55
>>> 0e 65 33 09 30 35 00 46 b5 04 81 02 46 8a 03 09 31 81 02 c0 05 0d 09 54
>>> 95 01 75 08 81 02 85 08 09 55 25 05 b1 02 c0 05 0c 09 01 a1 01 85 02 09
>>> e9 09 ea 0a ae 01 09 e2 09 30 15 01 25 0c 75 10 95 01 81 00 c0
>>>
>>> Events were collected using getevent call in adb shell in android:
>>>
>>> On 4.19
>>>
>>> # getevent -l
>>>
>>> add device 7: /dev/input/event6
>>>     name:     "BLE-M1 UNKNOWN"
>>>
>>> /dev/input/event6: EV_ABS       ABS_MT_TRACKING_ID   00000000
>>> /dev/input/event6: EV_ABS       ABS_MT_POSITION_X    00000800
>>> /dev/input/event6: EV_ABS       ABS_MT_POSITION_Y    00000d60
>>> /dev/input/event6: EV_KEY       BTN_TOUCH            DOWN
>>> /dev/input/event6: EV_SYN       SYN_REPORT           00000000
>>> /dev/input/event6: EV_ABS       ABS_MT_TRACKING_ID   ffffffff
>>> /dev/input/event6: EV_KEY       BTN_TOUCH            UP
>>> /dev/input/event6: EV_SYN       SYN_REPORT           00000000
>>> /dev/input/event6: EV_ABS       ABS_MT_TRACKING_ID   00000001
>>> /dev/input/event6: EV_KEY       BTN_TOUCH            DOWN
>>> /dev/input/event6: EV_SYN       SYN_REPORT           00000000
>>> /dev/input/event6: EV_ABS       ABS_MT_TRACKING_ID   ffffffff
>>> /dev/input/event6: EV_KEY       BTN_TOUCH            UP
>>> /dev/input/event6: EV_SYN       SYN_REPORT           00000000
>>>
>>> On 4.14
>>>
>>> add device 2: /dev/input/event5
>>>     name:     "BLE-M1 UNKNOWN"
>>>
>>> /dev/input/event5: EV_MSC       MSC_SCAN             000d0042
>>> /dev/input/event5: EV_KEY       BTN_TOUCH            DOWN
>>> /dev/input/event5: EV_KEY       BTN_DIGI             DOWN
>>> /dev/input/event5: EV_ABS       ABS_MISC             00000001
>>> /dev/input/event5: EV_ABS       ABS_X                00000800
>>> /dev/input/event5: EV_ABS       ABS_Y                00000d60
>>> /dev/input/event5: EV_ABS       0029                 00000001
>>> /dev/input/event5: EV_SYN       SYN_REPORT           00000000
>>>
>>> /dev/input/event5: EV_MSC       MSC_SCAN             000d0042
>>> /dev/input/event5: EV_KEY       BTN_TOUCH            UP
>>> /dev/input/event5: EV_KEY       BTN_DIGI             UP
>>> /dev/input/event5: EV_ABS       0029                 00000000
>>> /dev/input/event5: EV_SYN       SYN_REPORT           00000000
>>>
>>> /dev/input/event5: EV_MSC       MSC_SCAN             000d0042
>>> /dev/input/event5: EV_KEY       BTN_TOUCH            DOWN
>>> /dev/input/event5: EV_KEY       BTN_DIGI             DOWN
>>> /dev/input/event5: EV_ABS       0029                 00000001
>>> /dev/input/event5: EV_SYN       SYN_REPORT           00000000
>>>
>>> /dev/input/event5: EV_MSC       MSC_SCAN             000d0042
>>> /dev/input/event5: EV_KEY       BTN_TOUCH            UP
>>> /dev/input/event5: EV_KEY       BTN_DIGI             UP
>>> /dev/input/event5: EV_ABS       0029                 00000000
>>> /dev/input/event5: EV_SYN       SYN_REPORT           00000000
>>>
>>>
>>> As I have little understanding of the framework, use cases and of the
>>> flow, I am sorry, if the information provided above is
>>>
>>> incomplete (w.r.t. what you were expecting).
>>>
>>>
>>> Thanks
>>>
>>> Neeraj
>>>
>>>> Cheers,
>>>> Benjamin
>>>>
>>>>>
>>>>> Thanks
>>>>> Neeraj
>>>>>
>>>>> --
>>>>> QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a
>>>>> member of the Code Aurora Forum, hosted by The Linux Foundation
>>>>>
>>
>> --
>> QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a
>> member of the Code Aurora Forum, hosted by The Linux Foundation
>>
> 

-- 
QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a 
member of the Code Aurora Forum, hosted by The Linux Foundation
