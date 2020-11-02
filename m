Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4287F2A3169
	for <lists+linux-input@lfdr.de>; Mon,  2 Nov 2020 18:24:08 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727530AbgKBRYH (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 2 Nov 2020 12:24:07 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48088 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727521AbgKBRYH (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Mon, 2 Nov 2020 12:24:07 -0500
Received: from mail-oi1-x244.google.com (mail-oi1-x244.google.com [IPv6:2607:f8b0:4864:20::244])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E44CBC0617A6;
        Mon,  2 Nov 2020 09:24:06 -0800 (PST)
Received: by mail-oi1-x244.google.com with SMTP id x1so15382291oic.13;
        Mon, 02 Nov 2020 09:24:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-transfer-encoding:content-language;
        bh=lfw2jLxBnVtL+aa71vV2gHfausONFB9h06LJFPSqQPk=;
        b=p90re8hvq5F8LQNi+Ew9VJg44LTcFzp01O0cbGsGbw1ZkBMrMrTBIjMPAmZWREfEt7
         rQG7D4sHtE0SK9aKoyHXJGfJFeg/X2Aicw4pM2ahM72HAaCS/tizky6THNMbFsKMp8ap
         xd8VmvqiMV9HOgBebVpJ6s9lc+uxLyxXoS3/CaKQ2rfjQ1e5h5I2BM/+5aHgMRS1Aq4m
         EAgDJvRwmnvLeA2CzkaXmYLzml+EzF3UZ8nGjc7EzbwRvcYrf81ZIEu6aKoevcxPvKwh
         Q3g+ZQt3ryFo+Srd4Q5btBrf8JjoFi3Vq5JgT1Io4HVTFo9mehkLnABc1yuRPG8Q4OPi
         7GUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-transfer-encoding
         :content-language;
        bh=lfw2jLxBnVtL+aa71vV2gHfausONFB9h06LJFPSqQPk=;
        b=BID67iYCBEUMDzvGtXLeNuZpX1WXdiAl4u9xw3e3/9zclG0sE62gzzbwHlDdU5ui5c
         gOoILLfYgt/bzylKHaUE0xQFVH9Hj+oDTzgnZpyo7DJLMkHHbqtQLDCokRqeoFLTycUH
         HCBJL2uI2BjDSQaYvw9TeJDEt8rUeUiEOZszkz9c6N8HaxG3u2LfQ9T4X+kxHgHnPXal
         mrt50PXLsHjOChxixtT6PfdPf0I+bRfp4O8i/6CwTqPXSb+9UUFaOVdRQWWsZOAYBXDn
         Vs0asJQgnOxeQXY8CcJNDzV/2ug143TbMd4p7LWdE3Jnq39yfgsmXeiZCcjeqXWA1UMq
         A8Aw==
X-Gm-Message-State: AOAM532pB7BzWWIMlqCBF23aT1zBWJLb/TZnnl0UXKJzPLMPIW8BZbeo
        GgzsVcfNjWvdPTPJXBXv56m2FuW+tT5+m2kV
X-Google-Smtp-Source: ABdhPJxf71qA0zX5ZmA1jB50m7GrFqE42LhbarEfUP/J0xKPKSZ/LXL8vJtsjf+9LAZH2CqDVQTCOA==
X-Received: by 2002:aca:120f:: with SMTP id 15mr10911201ois.155.1604337844449;
        Mon, 02 Nov 2020 09:24:04 -0800 (PST)
Received: from ?IPv6:2600:1700:4a30:eaf0::21? ([2600:1700:4a30:eaf0::21])
        by smtp.gmail.com with ESMTPSA id f13sm3502666oij.0.2020.11.02.09.24.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 02 Nov 2020 09:24:03 -0800 (PST)
Subject: Re: [PATCH v2] Input: Fix the HID usage of DPAD input event
 generation.
To:     Benjamin Tissoires <benjamin.tissoires@redhat.com>,
        Chris Ye <lzye@google.com>
Cc:     Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Jiri Kosina <jikos@kernel.org>,
        lkml <linux-kernel@vger.kernel.org>, trivial@kernel.org,
        "open list:HID CORE LAYER" <linux-input@vger.kernel.org>
References: <20201101193504.679934-1-lzye@google.com>
 <CAO-hwJJVKOM7Om8E+kmYXTrA7SiOFgFt46BHfv+0j+ORhepbaQ@mail.gmail.com>
From:   Chris Ye <linzhao.ye@gmail.com>
Message-ID: <7505bbc6-9f76-0875-c1c1-95d611a980bb@gmail.com>
Date:   Mon, 2 Nov 2020 09:24:02 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.3.1
MIME-Version: 1.0
In-Reply-To: <CAO-hwJJVKOM7Om8E+kmYXTrA7SiOFgFt46BHfv+0j+ORhepbaQ@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Hi Benjamin,

     I've tried the hid-tool for testing on my linux machine and it 
works.  However the issue comes from a game controller I don't posses in 
hand right now so I can't physically connect it and provide the log from 
hid-tool recording.  I do have the raw HID descriptor and in Linux 
kernel the debug info is like below:

# cat /d/hid/0005\:27F8\:0BBE.0001/rdesc
05 01 09 05 a1 01 a1 02 15 81 25 7f 05 01 09 01 a1 00 75 08 95 04 35 00 
46 ff 00 09 30 09 31 09 32 09 35 81 02 75 08 95 02 15 01 26 ff 00 09 39 
09 39 81 02 c0 05 07 19 4f 29 52 15 00 25 01 75 01 95 04 81 02 05 01 09 
90 09 91 09 92 09 93 75 01 95 04 81 02 75 01 95 10 05 09 19 01 29 10 81 
02 06 02 ff 09 01 a1 01 15 00 25 01 09 04 75 01 95 01 81 02 c0 05 0c 09 
01 a1 01 15 00 25 01 0a 24 02 75 01 95 01 81 06 c0 75 01 95 06 81 03 15 
00 25 ff 05 02 09 01 a1 00 75 08 95 02 35 00 45 ff 09 c4 09 c5 81 02 c0 
06 00 ff 09 80 75 08 95 08 15 00 26 ff 00 b1 02 c0 c0

   INPUT[INPUT]
     Field(0)
       Physical(GenericDesktop.Pointer)
       Application(GenericDesktop.GamePad)
       Usage(4)
         GenericDesktop.X
         GenericDesktop.Y
         GenericDesktop.Z
         GenericDesktop.Rz
       Logical Minimum(-127)
       Logical Maximum(127)
       Physical Minimum(0)
       Physical Maximum(255)
       Report Size(8)
       Report Count(4)
       Report Offset(0)
       Flags( Variable Absolute )
     Field(1)
       Physical(GenericDesktop.Pointer)
       Application(GenericDesktop.GamePad)
       Usage(2)
         GenericDesktop.HatSwitch
         GenericDesktop.HatSwitch
       Logical Minimum(1)
       Logical Maximum(255)
       Physical Minimum(0)
       Physical Maximum(255)
       Report Size(8)
       Report Count(2)
       Report Offset(32)
       Flags( Variable Absolute )
     Field(2)
       Application(GenericDesktop.GamePad)
       Usage(4)
         Keyboard.004f
         Keyboard.0050
         Keyboard.0051
         Keyboard.0052
       Logical Minimum(0)
       Logical Maximum(1)
       Physical Minimum(0)
       Physical Maximum(255)
       Report Size(1)
       Report Count(4)
       Report Offset(48)
       Flags( Variable Absolute )
     Field(3)
       Application(GenericDesktop.GamePad)
       Usage(4)
         GenericDesktop.D-PadUp
         GenericDesktop.D-PadDown
         GenericDesktop.D-PadRight
         GenericDesktop.D-PadLeft
       Logical Minimum(0)
       Logical Maximum(1)
       Physical Minimum(0)
       Physical Maximum(255)
       Report Size(1)
       Report Count(4)
       Report Offset(52)
       Flags( Variable Absolute )
     Field(4)
       Application(GenericDesktop.GamePad)
       Usage(16)
         Button.0001
         Button.0002
         Button.0003
         Button.0004
         Button.0005
         Button.0006
         Button.0007
         Button.0008
         Button.0009
         Button.000a
         Button.000b
         Button.000c
         Button.000d
         Button.000e
         Button.000f
         Button.0010
       Logical Minimum(0)
       Logical Maximum(1)
       Physical Minimum(0)
       Physical Maximum(255)
       Report Size(1)
       Report Count(16)
       Report Offset(56)
       Flags( Variable Absolute )
     Field(5)
       Application(ff02.0001)
       Usage(1)
         ff02.0004
       Logical Minimum(0)
       Logical Maximum(1)
       Physical Minimum(0)
       Physical Maximum(255)
       Report Size(1)
       Report Count(1)
       Report Offset(72)
       Flags( Variable Absolute )
     Field(6)
       Application(Consumer.0001)
       Usage(1)
         Consumer.0224
       Logical Minimum(0)
       Logical Maximum(1)
       Physical Minimum(0)
       Physical Maximum(255)
       Report Size(1)
       Report Count(1)
       Report Offset(73)
       Flags( Variable Relative )
     Field(7)
       Physical(Simulation.0001)
       Application(GenericDesktop.GamePad)
       Usage(2)
         Simulation.00c4
         Simulation.00c5
       Logical Minimum(0)
       Logical Maximum(255)
       Physical Minimum(0)
       Physical Maximum(255)
       Report Size(8)
       Report Count(2)
       Report Offset(80)
       Flags( Variable Absolute )
   FEATURE[FEATURE]
     Field(0)
       Application(GenericDesktop.GamePad)
       Usage(8)
         ff00.0080
         ff00.0080
         ff00.0080
         ff00.0080
         ff00.0080
         ff00.0080
         ff00.0080
         ff00.0080
       Logical Minimum(0)
       Logical Maximum(255)
       Physical Minimum(0)
       Physical Maximum(255)
       Report Size(8)
       Report Count(8)
       Report Offset(0)
       Flags( Variable Absolute )

GenericDesktop.X ---> Absolute.X
GenericDesktop.Y ---> Absolute.Y
GenericDesktop.Z ---> Absolute.Z
GenericDesktop.Rz ---> Absolute.Rz
GenericDesktop.HatSwitch ---> Absolute.Hat0X
GenericDesktop.HatSwitch ---> Absolute.Hat0Y
Keyboard.004f ---> Key.Right
Keyboard.0050 ---> Key.Left
Keyboard.0051 ---> Key.Down
Keyboard.0052 ---> Key.Up
GenericDesktop.D-PadUp ---> Absolute.Hat1X
GenericDesktop.D-PadDown ---> Sync.Report
GenericDesktop.D-PadRight ---> Sync.Report
GenericDesktop.D-PadLeft ---> Sync.Report
Button.0001 ---> Key.BtnA
Button.0002 ---> Key.BtnB
Button.0003 ---> Key.BtnC
Button.0004 ---> Key.BtnX
Button.0005 ---> Key.BtnY
Button.0006 ---> Key.BtnZ
Button.0007 ---> Key.BtnTL
Button.0008 ---> Key.BtnTR
Button.0009 ---> Key.BtnTL2
Button.000a ---> Key.BtnTR2
Button.000b ---> Key.BtnSelect
Button.000c ---> Key.BtnStart
Button.000d ---> Key.BtnMode
Button.000e ---> Key.BtnThumbL
Button.000f ---> Key.BtnThumbR
Button.0010 ---> Key.?
ff02.0004 ---> Key.Btn0
Consumer.0224 ---> Key.Back
Simulation.00c4 ---> Absolute.Gas
Simulation.00c5 ---> Absolute.Brake

So you can see the device has D-Up, D-Down,D-Right,D-Left usages, and 
D-up is mapped to Hat1X.

Also if you can send HID report from hid-tool,  you will see there are 
always intail events on Hat1X/Hat1Y as the HatDir is 0, even no DPAD 
buttons pressed.  When you send HID report with D-DPAD buttons with 
different state, it doesn't generate any axis events because the HatDir 
internally is still 0 regardless the report value of the 4 DPAD usages.


Thanks!

Chris


On 11/2/20 12:16 AM, Benjamin Tissoires wrote:
> Hi Chris,
>
>
> On Sun, Nov 1, 2020 at 8:35 PM Chris Ye <lzye@google.com> wrote:
>> Generic Desktop DPAD usage is mapped by hid-input, that only the first
>> DPAD usage maps to usage type EV_ABS and code of an axis. If HID
>> descriptor has DPAD UP/DOWN/LEFT/RIGHT HID usages and each of usage size
>> is 1 bit, then only the first one will generate input event, the rest of
>> the HID usages will be assigned to hat direction only.
>> The hid input event should check the HID report value and generate
>> HID event for its hat direction.
>>
>> Test: Connect HID device with Generic Desktop DPAD usage and press the
>> DPAD to generate input events.
> Thanks for the patch, but I would rather have a proper tests added to
> https://gitlab.freedesktop.org/libevdev/hid-tools
>
> We already have gamepads tests, and it would be very nice to have this
> patch reflected as a test as well. This would also allow me to better
> understand the problem. I am not sure I follow the whole logic of this
> patch without seeing the 2 variants of report descriptors.
>
> Cheers,
> Benjamin
>
>> Signed-off-by: Chris Ye <lzye@google.com>
>> ---
>>   drivers/hid/hid-input.c | 16 ++++++++++++----
>>   1 file changed, 12 insertions(+), 4 deletions(-)
>>
>> diff --git a/drivers/hid/hid-input.c b/drivers/hid/hid-input.c
>> index 9770db624bfa..6c1007de3409 100644
>> --- a/drivers/hid/hid-input.c
>> +++ b/drivers/hid/hid-input.c
>> @@ -1269,7 +1269,7 @@ void hidinput_hid_event(struct hid_device *hid, struct hid_field *field, struct
>>          struct input_dev *input;
>>          unsigned *quirks = &hid->quirks;
>>
>> -       if (!usage->type)
>> +       if (!usage->type && !field->dpad)
>>                  return;
>>
>>          if (usage->type == EV_PWR) {
>> @@ -1286,9 +1286,17 @@ void hidinput_hid_event(struct hid_device *hid, struct hid_field *field, struct
>>                  int hat_dir = usage->hat_dir;
>>                  if (!hat_dir)
>>                          hat_dir = (value - usage->hat_min) * 8 / (usage->hat_max - usage->hat_min + 1) + 1;
>> -               if (hat_dir < 0 || hat_dir > 8) hat_dir = 0;
>> -               input_event(input, usage->type, usage->code    , hid_hat_to_axis[hat_dir].x);
>> -               input_event(input, usage->type, usage->code + 1, hid_hat_to_axis[hat_dir].y);
>> +               if (hat_dir < 0 || hat_dir > 8 || value == 0)
>> +                       hat_dir = 0;
>> +               if (field->dpad) {
>> +                       input_event(input, EV_ABS, field->dpad, hid_hat_to_axis[hat_dir].x);
>> +                       input_event(input, EV_ABS, field->dpad + 1, hid_hat_to_axis[hat_dir].y);
>> +               } else {
>> +                       input_event(input, usage->type, usage->code,
>> +                               hid_hat_to_axis[hat_dir].x);
>> +                       input_event(input, usage->type, usage->code + 1,
>> +                               hid_hat_to_axis[hat_dir].y);
>> +               }
>>                  return;
>>          }
>>
>> --
>> 2.29.1.341.ge80a0c044ae-goog
>>
