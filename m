Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 978262F9AD7
	for <lists+linux-input@lfdr.de>; Mon, 18 Jan 2021 08:56:25 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732832AbhARH4H (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 18 Jan 2021 02:56:07 -0500
Received: from youngberry.canonical.com ([91.189.89.112]:60406 "EHLO
        youngberry.canonical.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1733174AbhARHz4 (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Mon, 18 Jan 2021 02:55:56 -0500
Received: from [222.130.132.169] (helo=[192.168.0.104])
        by youngberry.canonical.com with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
        (Exim 4.86_2)
        (envelope-from <hui.wang@canonical.com>)
        id 1l1PNX-0000QS-IE; Mon, 18 Jan 2021 07:55:12 +0000
Subject: Re: [PATCH] HID: multitouch: add a quirk to skip set inputmode for 2
 new laptops
From:   Hui Wang <hui.wang@canonical.com>
To:     =?UTF-8?Q?Barnab=c3=a1s_P=c5=91cze?= <pobrn@protonmail.com>
Cc:     "linux-input@vger.kernel.org" <linux-input@vger.kernel.org>,
        "jikos@kernel.org" <jikos@kernel.org>,
        "benjamin.tissoires@redhat.com" <benjamin.tissoires@redhat.com>,
        "jkosina@suse.cz" <jkosina@suse.cz>
References: <20210107112708.25990-1-hui.wang@canonical.com>
 <uQnmWiLQ4Lmlm2GUj2fhPTv6zZ9Cszx0BNMz2K4WvVE7TjLE82lmU6mi0Leu4OK2fXfn-86Tw8WeR6kla03TdTpKIn-1zcmb1mLHl8WAt_Q=@protonmail.com>
 <af979df2-d5dc-ce91-5349-44b5b428e517@canonical.com>
Message-ID: <d3b03a71-1cec-6277-04c7-c88f509a8ac0@canonical.com>
Date:   Mon, 18 Jan 2021 15:55:01 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.0
MIME-Version: 1.0
In-Reply-To: <af979df2-d5dc-ce91-5349-44b5b428e517@canonical.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

This turns out to be a firmware issue, synaptics provided a new firmware 
for the touchpad, and we upgraded the firmware for the touchpad under 
windows (we only have windows firmware upgrade utility), now the 
touchpad could work with trackpoint together under Linux.

Thanks.

On 1/9/21 8:35 PM, Hui Wang wrote:
>
> On 1/7/21 8:42 PM, Barnabás Pőcze wrote:
>> Hi
>>
>>
>> 2021. január 7., csütörtök 12:27 keltezéssel, Hui Wang írta:
>>
>>> we have 2 latest Thinkpad laptops, the synaptics trackpoint module is
>>> connected to i8042 bus and the synaptics touchpad module is on the i2c
>>> bus. The trackpoint is driven by input/mouse/trackpoint.c and the
>>> touchpad is driven by hid-multitouch.c.
>>>
>>> They all work well independently, but if users press any buttons of
>>> trackpoint and meanwhile move finger on the touchpad, the touchpad
>>> can't work, the i2c bus can't generate interrupts even. That is to say
>>> the touchpad can't work with trackpoint together, once trackpoint
>>> works, the touchpad stops working.
>>>
>>> The current hid driver parses the device descriptor and selects the
>>> hid-multitouch.c and applies the MT_CLS_WIN_8 to the touchpad, I found
>>> this issue begins to happen after the driver sets the
>>> MT_INPUTMODE_TOUCHPAD to the device, If skipping to set it, the
>>> touchpad work well and doesn't have that issue, even after suspend and
>>> resume, the touchpad still work well.
>>>
>>> This touchpad module doesn't support multi inputmodes, and its init
>>> mode is set by BIOS already, it is safe to skip to set it again in
>>> the kernel driver.
>>> [...]
>> Assuming I'm not missing anything obvious, a windows precision touchpad
>> should revert back to reporting events via its HID compliant mouse 
>> collection
>> when power cycled or reset by the host[1].
>>
>> Doesn't that imply that the events will be reported via the mouse 
>> collection
>> in this case, and that the multi-touch capabilities of the device 
>> will not
>> be usable? Or am I missing something?
>>
>>
>> [1]: 
>> https://docs.microsoft.com/en-us/windows-hardware/design/component-guidelines/windows-precision-touchpad-required-hid-top-level-collections#input-mode-feature-report
>
> Yes, you are right, after applying this patch, the events will be 
> reported through mouse collection and some features specific to 
> touchpad collection like multi-touch are lost. So this patch is not a 
> correct solution, please ignore this patch.
>
> And I found If using the hid-rmi.c to drive this touchpad, it will 
> work well, the touchpad and trackpoint could work well together and 
> the touchpad has multi-touch capability. But because the report 
> descriptor contains an Input item which has the usage 
> HID_DG_CONTACTID, the hid->group is set to HID_GROUP_MULTITOUCH, the 
> hid-multitouch.c is selected to drive this touchpad.
>
> Is it Okay to do the change below and let hid-rmi.c drive this touchpad?
>
> diff --git a/drivers/hid/hid-rmi.c b/drivers/hid/hid-rmi.c
> index 311eee599ce9..58a7529499f5 100644
> --- a/drivers/hid/hid-rmi.c
> +++ b/drivers/hid/hid-rmi.c
> @@ -759,6 +759,7 @@ static const struct hid_device_id rmi_id[] = {
>         { HID_USB_DEVICE(USB_VENDOR_ID_PRIMAX, 
> USB_DEVICE_ID_PRIMAX_REZEL) },
>         { HID_USB_DEVICE(USB_VENDOR_ID_SYNAPTICS, 
> USB_DEVICE_ID_SYNAPTICS_ACER_SWITCH5),
>                 .driver_data = RMI_DEVICE_OUTPUT_SET_REPORT },
> +       { HID_I2C_DEVICE(USB_VENDOR_ID_SYNAPTICS, 0xce57) },
>         { HID_DEVICE(HID_BUS_ANY, HID_GROUP_RMI, HID_ANY_ID, 
> HID_ANY_ID) },
>         { }
>  };
>
> Thanks,
>
> Hui.
>
>>
>>
>> Regards,
>> Barnabás Pőcze
>>
