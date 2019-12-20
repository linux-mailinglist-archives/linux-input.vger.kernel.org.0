Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 9857512798A
	for <lists+linux-input@lfdr.de>; Fri, 20 Dec 2019 11:45:23 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727177AbfLTKpW (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Fri, 20 Dec 2019 05:45:22 -0500
Received: from us-smtp-2.mimecast.com ([205.139.110.61]:33401 "EHLO
        us-smtp-delivery-1.mimecast.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1726210AbfLTKpW (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Fri, 20 Dec 2019 05:45:22 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1576838720;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=jD68FeqhhWt3tibZYfTx6fNEexfv3uFFugHalLdycjU=;
        b=eqjsFDX5OLhd4TlWxG7F1DSMW1IzwpPGnuGDrRpRjgujcHmYZw4WecVZu8bNhisa/2YyWn
        Ah4VvsoUazLb2NZ/Sd7Z1K5ykSHNyUacyRvptWbtbA53HgRs+eWumpwmOFtWci9Ya5tZp5
        2Y0uEvaHEEU9eIpXpdQHaWalT51ZkT0=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-274-7OVqmvzsMEOJn0lilRUAxg-1; Fri, 20 Dec 2019 05:45:18 -0500
X-MC-Unique: 7OVqmvzsMEOJn0lilRUAxg-1
Received: by mail-wm1-f69.google.com with SMTP id b131so2370076wmd.9
        for <linux-input@vger.kernel.org>; Fri, 20 Dec 2019 02:45:18 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=jD68FeqhhWt3tibZYfTx6fNEexfv3uFFugHalLdycjU=;
        b=TcL0L7wYArcboaa2Mbt3+D23n92hDM/PYSt/7Gy6X4oY+fL0UuZr158Tl8VGRh0lV2
         Qe7srwC8cNbFksTvz9cZMMPAf4mr0GfYH+yOmj7FkuQE+Tcr6/h9g72BbbheTazYzbbn
         yXTMuCAc5HkVp1Fi0pa02pUElvyh7Z00pR8GBTq3O1U3FtsTL195iaAQCCmfJ+FvRkyu
         VkNemZ8gkJC3zwngU1RNbTUur6lkjlbdpZKbtqjuwfa7JIeMOxqOUR8AiovoID5k+Zwe
         XpB4vCrHWeMLc3su+zPsGESsFE1qF41zPfqohKZGreWp47NoTlS7vjIRQo7QP10BSDrd
         Cgkw==
X-Gm-Message-State: APjAAAWroy88bjiac9pm4PzEKawxH4cujw2zyU7O+/VVB6mFmUEuwGlg
        DR8+lyHKu6yHMoNH7fXC95OBAuRf3uZ1dLQXIPMgUhw2CsAOnRyTum5tSdBLcvWTDcK3Er/bMD7
        0BZvJI9Sw7LEiKMjPiZ0MmOY=
X-Received: by 2002:a1c:4008:: with SMTP id n8mr14680776wma.121.1576838716683;
        Fri, 20 Dec 2019 02:45:16 -0800 (PST)
X-Google-Smtp-Source: APXvYqxjotsXJz/N6Mn902ASULPdsoZ7J5yP7t+q5rPyY2TZnVnkmjPq1rlJJaA7wvQIng+1B1u8gQ==
X-Received: by 2002:a1c:4008:: with SMTP id n8mr14680749wma.121.1576838716329;
        Fri, 20 Dec 2019 02:45:16 -0800 (PST)
Received: from shalem.localdomain (2001-1c00-0c0c-fe00-7e79-4dac-39d0-9c14.cable.dynamic.v6.ziggo.nl. [2001:1c00:c0c:fe00:7e79:4dac:39d0:9c14])
        by smtp.gmail.com with ESMTPSA id g21sm9809284wrb.48.2019.12.20.02.45.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 20 Dec 2019 02:45:15 -0800 (PST)
Subject: =?UTF-8?B?UmU6INCy0L7Qv9GA0L7RgSDQv9C+IHN1c3BlbmQvcmVzdW1lINCyIGdv?=
 =?UTF-8?Q?odix?=
To:     Dmitry Mastykin <mastichi@gmail.com>
Cc:     Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Bastien Nocera <hadess@hadess.net>, linux-input@vger.kernel.org
References: <CALieaefYFFBaFAo4E7hsESrxhN7N_tbWbeG_C6WHzwDpFiLqeQ@mail.gmail.com>
 <20191212192009.GB101194@dtor-ws>
 <e2876e96-ba7d-47ff-44e0-6478b48c6fe3@redhat.com>
 <CALieaecDVVO0GMySV8ge4ecsyPziRxKpCo=RTdWX266vzdNyBw@mail.gmail.com>
 <bceaca05-bec1-4fcf-9f52-3a9a2a3318c7@redhat.com>
 <CALieaefc7qea10HrFrhiq_dnwfZ127a61Jwk6+r39_sKzyt6MQ@mail.gmail.com>
 <540d7e12-1c29-63ec-307a-6db352f67e9c@redhat.com>
 <CALieaecwpcimMDos5QWz-MP1ZW+16HPcTc0rnX4GCYnRqoxR4g@mail.gmail.com>
From:   Hans de Goede <hdegoede@redhat.com>
Message-ID: <b4b7689d-5d96-8654-71d0-590476984813@redhat.com>
Date:   Fri, 20 Dec 2019 11:45:14 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.3.1
MIME-Version: 1.0
In-Reply-To: <CALieaecwpcimMDos5QWz-MP1ZW+16HPcTc0rnX4GCYnRqoxR4g@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Hi,

On 19-12-2019 10:10, Dmitry Mastykin wrote:
> Hi,
>>> I discovered what was with my device.
>>> After suspend/resume I2C address often changes to 0x5d (and ACPI table
>>> has 0x14).
>>>
>> Often but not always?
>>
> Yes, I think this is because INT from chipset side is tri-stated.
> 
> I'm attaching the acpidump.

Thanks, hmm, so looking at the acpidump, your device is using an Apollo
Lake and thus definitely is NOT the fieldbook-k122 as that is using
a Cherry Trail SoC and not an Apollo Lake SoC.

It is also using a GPIO pin configured in direct-irq mode pin for the IRQ line:

        Name (RBUF, ResourceTemplate ()
        {
            I2cSerialBusV2 (0x0014, ControllerInitiated, 0x00061A80,
                AddressingMode7Bit, "\\_SB.PCI0.I2C3",
                0x00, ResourceConsumer, , Exclusive,
                )
            Interrupt (ResourceConsumer, Edge, ActiveHigh, Exclusive, ,, )
            {
                0x00000032,
            }
            GpioIo (Shared, PullDefault, 0x0000, 0x0000, IoRestrictionOutputOnly,
                "\\_SB.GPO0", 0x00, ResourceConsumer, ,
                )
                {   // Pin list
                    0x0019
                }
            GpioIo (Shared, PullDefault, 0x0000, 0x0000, IoRestrictionOutputOnly,
                "\\_SB.GPO0", 0x00, ResourceConsumer, ,
                )
                {   // Pin list
                    0x0005
                }
        })

And both GPIOs are listed as output-only which certainly does not match the
IRQ pin. So this setup is a bit foobar and the plan I have to allow the touchscreen
to properly power-down on suspend on Cherry Trail devices, will not work here :|

For reference here are the ACPI resources for a GDIX touchscreen on Cherry Trail:

     Name (WBUF, ResourceTemplate ()
     {
         I2cSerialBusV2 (0x0014, ControllerInitiated, 0x00061A80,
             AddressingMode7Bit, "\\_SB.PCI0.I2C6",
             0x00, ResourceConsumer, , Exclusive,
             )
         GpioInt (Edge, ActiveLow, Shared, PullDefault, 0x0000,
             "\\_SB.GPO3", 0x00, ResourceConsumer, ,
             )
             {   // Pin list
                 0x004D
             }
         GpioIo (Shared, PullDefault, 0x0000, 0x0000, IoRestrictionOutputOnly,
             "\\_SB.GPO1", 0x00, ResourceConsumer, ,
             )
             {   // Pin list
                 0x0014
             }
     })

Notice how the Interrupt is specified as a GpioInt so we should be able
to use it as a GPIO during suspend so that we can wakeup the touchscreen on
resume...

I'm afraid I do not have any easy ideas / fixes for how to fix the issue
you are seeing on your device.

Regards,

Hans




> On Wed, Dec 18, 2019 at 6:07 PM Hans de Goede <hdegoede@redhat.com> wrote:
>>
>> Hi,
>>
>> On 18-12-2019 15:50, Dmitry Mastykin wrote:
>>> Hi,
>>>
>>> I discovered what was with my device.
>>> After suspend/resume I2C address often changes to 0x5d (and ACPI table
>>> has 0x14).
>>
>> Often but not always?
>>
>>> ACPI tables doesn't contain _DSD section, and GPIOs are not mapped to
>>> ts->gpiod_int/rst. They are NULL. So reset sequence is not called.
>>> That's why rmmod/insmod doesn't help.
>>>
>>> (As temporary solution i changed client->addr, and will wait for
>>> better ACPI tables.
>>> I tried also to map gpios by index and seems that RESET works but INT
>>> doesn't. I can't change I2C address by reset sequence.
>>> I've sent a question to tablet's manufacturer about that.)
>>
>> Interesting, can you provide an acpidump of the device:
>>
>> sudo acpidump -o acpidump
>>
>> And then attach the generated acpidump file to your next email ?
>>
>> Regards,
>>
>> Hans
>>
>>
>>>
>>>> On most newer devices (such as the GPD) the IRQ pin is actually declared
>>>> as a GpioInt in the ACPI tables, so we should be able to use it as a GPIO
>>>> with some extra work.
>>>>
>>> I will be glad to test this when it's ready provided I have new ACPI tables.
>>>
>>> Thank you!
>>> Kind regards,
>>> Dmitry Mastykin
>>>
>>> On Wed, Dec 18, 2019 at 9:16 AM Hans de Goede <hdegoede@redhat.com> wrote:
>>>>
>>>> Hi,
>>>>
>>>> On 13-12-2019 09:17, Dmitry Mastykin wrote:
>>>>> Hi guys!
>>>>> Thank you very much for your answers, it's always surprising how fast
>>>>> the community reacts!
>>>>>
>>>>>> We have reports of the touchscreen no longer working after suspend/resume
>>>>>> on some GPD pocket devices, but not combined with these errors.
>>>>>>
>>>>> I copied my error messages precisely from gpd support site, because I
>>>>> have the same:
>>>>> https://gpdsupport.com/t/touchscreen-issue-resolved/132/84
>>>>> But seems that rmmod/insmod helps in their case.
>>>>> I noticed that the problem is not repeatable. But happens very often.
>>>>
>>>> Interesting I did not realize the same errors are showing on the GPD pocket.
>>>>
>>>> I have the feeling this might have something todo with us not putting the
>>>> touchscreen controller to sleep on ACPI devices because we cannot use
>>>> the IRQ pin as GPIO which is necessary for wakeup.
>>>>
>>>> On most newer devices (such as the GPD) the IRQ pin is actually declared
>>>> as a GpioInt in the ACPI tables, so we should be able to use it as a GPIO
>>>> with some extra work.
>>>>
>>>> I plan to write a patch to make us do this sometime in the near future
>>>> (no idea when I will get around to this though). I will put you
>>>> (Dmitry Mastykin) in the Cc of the patch when I get around to writing it.
>>>>
>>>> Note I do not know if this patch will actually help.
>>>>
>>>> Regards,
>>>>
>>>> Hans
>>>>
>>>>
>>>>>
>>>>>
>>>>>> When this happens, are these messages appear constantly, or only in
>>>>>> response to actual touch? Can you still interact with the device?
>>>>>>
>>>>> Constantly with 25Hz frequency.
>>>>>
>>>>>> The fact that you can talk to the controller like that is interesting.
>>>>>> Just to confirm, does it return sane data, or garbage?
>>>>>>
>>>>> root@or212:/home/u# i2cset -y 6 0x5d 0x81 0x4e 0x00 i
>>>>> root@or212:/home/u# i2cset -y 6 0x5d 0x81 0x4e i
>>>>> root@or212:/home/u# i2cget -y 6 0x5d
>>>>> 0x83
>>>>> root@or212:/home/u# i2cset -y 6 0x5d 0x81 0x4e 0x00 i
>>>>> root@or212:/home/u# i2cset -y 6 0x5d 0x81 0x4e i
>>>>> root@or212:/home/u# i2cget -y 6 0x5d
>>>>> 0x81
>>>>> First I touch with 3 fingers, then with one.
>>>>>
>>>>>> What is the model of the tablet?
>>>>>>
>>>>> Not sure about model, seems that it's this one:
>>>>> http://logic-instrument.com/en/fieldbook-k122.php
>>>>>
>>>>> Dmesg is attached
>>>>>
>>>>> Thank you!
>>>>> Kind regards,
>>>>> Dmitry Mastykin
>>>>>
>>>>> On Thu, Dec 12, 2019 at 11:51 PM Hans de Goede <hdegoede@redhat.com> wrote:
>>>>>>
>>>>>> Hi,
>>>>>>
>>>>>> On 12-12-2019 20:20, Dmitry Torokhov wrote:
>>>>>>> Hi Dmitry,
>>>>>>>
>>>>>>> On Thu, Dec 12, 2019 at 06:34:46PM +0300, Dmitry Mastykin wrote:
>>>>>>>> Здравствуйте, Дмитрий.
>>>>>>>> Простите, что отвлекаю, если что - не отвечайте и в лучшем случае
>>>>>>>> пошлите в mail-list)
>>>>>>>> У меня есть планшет с x86, вариантом Debian с ядром 4.15 и
>>>>>>>> контроллером тач-скрина gt928.
>>>>>>>
>>>>>>> What is the model of the tablet?
>>>>>>>
>>>>>>>> После suspend/resume не всегда, но очень часто тачскрин перестает
>>>>>>>> работать и постоянно выводит:
>>>>>>>> [ 3276.729412] Goodix-TS i2c-GDIX1002:00: I2C write end_cmd error
>>>>>>>> [ 3276.770153] Goodix-TS i2c-GDIX1002:00: I2C transfer error: -121
>>>>>>>
>>>>>>> When this happens, are these messages appear constantly, or only in
>>>>>>> response to actual touch? Can you still interact with the device?
>>>>>>>
>>>>>>> Could you please send the full dmesg so we know more about the device.
>>>>>>>
>>>>>>> Hans, Bastien, have you seen such issues with Goodix occasionally
>>>>>>> misbehaving on resume?
>>>>>>
>>>>>> We have reports of the touchscreen no longer working after suspend/resume
>>>>>> on some GPD pocket devices, but not combined with these errors.
>>>>>>
>>>>>> Regards,
>>>>>>
>>>>>> Hans
>>>>>>
>>>>>>
>>>>>>>
>>>>>>>> По i2cget/i2cset контроллер успешно отвечает.
>>>>>>>
>>>>>>> The fact that you can talk to the controller like that is interesting.
>>>>>>> Just to confirm, does it return sane data, or garbage?
>>>>>>>
>>>>>>> Thanks.
>>>>>>>
>>>>>>
>>>>
>>>
>>

