Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 83E8812A7D5
	for <lists+linux-input@lfdr.de>; Wed, 25 Dec 2019 13:25:03 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726185AbfLYMZC (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 25 Dec 2019 07:25:02 -0500
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]:37661 "EHLO
        us-smtp-1.mimecast.com" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
        with ESMTP id S1726106AbfLYMZC (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Wed, 25 Dec 2019 07:25:02 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1577276699;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=47j+EheVLTqqrf91aVJc4SfTgb3OHdU1+TstAoFhiUc=;
        b=OY2XM0rruDH1sh6hZJAz3t5wgA1eZP+PjghjDqtWAD0RwtBqhWSKWZM5GmERGhQwQoHmeH
        PU4Tkit5oUCqVcfUWl8+6kCsJXGMlULIWvGNjBtzZZEgxmaBmbhfF4RKsncXdTxbnhJvOX
        d0NzQ/aZtNeWuX00rfJnvdMS5P7V01k=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-29-ej5tLq2KOJGhNVANWIyjkQ-1; Wed, 25 Dec 2019 07:24:54 -0500
X-MC-Unique: ej5tLq2KOJGhNVANWIyjkQ-1
Received: by mail-wr1-f71.google.com with SMTP id c17so4805339wrp.10
        for <linux-input@vger.kernel.org>; Wed, 25 Dec 2019 04:24:54 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=47j+EheVLTqqrf91aVJc4SfTgb3OHdU1+TstAoFhiUc=;
        b=bryNwvCtYNMjOlsb0EVqYpyHoh3l+U92oR0R2Nq7+tJ0SNYUSyjDKWfrjNOPjs7knW
         ne+VZokDM56CcSyDXgr0NLuHQztog6pCeYFI2eqRuERSd/KRpXj/8Lc/N3qe4A+PjkLz
         1Y10CI26fIdV5OsYzWOOhy8kCXrTTEXlvOjqOGt1eoalgZ+wUBiamr7Fkser6y6Nd6IA
         EH756Kl9hEoUzjq0zi+Kcu9qPvdtOaaH6v41WIRBfDW2uoggRw7pwm4fmmLY/E0DMeG7
         tfhzf3osMySoSeRjlJ1+EGsoyIx8I+lT4cGzs/2gmvGSOc0Pm6EUpP4kZeGNJydyaKn9
         g7eA==
X-Gm-Message-State: APjAAAXK94TRkvMuiFNNEvbrsZ7hn1907MhCu0Obf/iiXQdsa/up0nyH
        RmkIveSrbhyLLi3zWIeGW0qEjf7NOqGGu1HtkyP+isQQ+33i6m1KapgwjNbtTynsglrkOlO90y/
        BeDmviJbyB9GL6IFDHq3E+d8=
X-Received: by 2002:a05:600c:210e:: with SMTP id u14mr9265096wml.28.1577276692757;
        Wed, 25 Dec 2019 04:24:52 -0800 (PST)
X-Google-Smtp-Source: APXvYqzXLghX7rXYKOyY2PaG7CoRLFgiNQjZ5faFeOFa7B6/GMnR8dnLjWZFJXZ7dVqgJf0jJnvdlw==
X-Received: by 2002:a05:600c:210e:: with SMTP id u14mr9265070wml.28.1577276692343;
        Wed, 25 Dec 2019 04:24:52 -0800 (PST)
Received: from shalem.localdomain (2001-1c00-0c0c-fe00-7e79-4dac-39d0-9c14.cable.dynamic.v6.ziggo.nl. [2001:1c00:c0c:fe00:7e79:4dac:39d0:9c14])
        by smtp.gmail.com with ESMTPSA id 16sm5462660wmi.0.2019.12.25.04.24.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 25 Dec 2019 04:24:51 -0800 (PST)
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
 <b4b7689d-5d96-8654-71d0-590476984813@redhat.com>
 <CALieaeen5zujxbLGnQryHYdWT_9K318H38dUmkAV3YMBHFXN5A@mail.gmail.com>
From:   Hans de Goede <hdegoede@redhat.com>
Message-ID: <0f80c872-8953-41fe-0ae4-ba9166f406bb@redhat.com>
Date:   Wed, 25 Dec 2019 13:24:50 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.3.1
MIME-Version: 1.0
In-Reply-To: <CALieaeen5zujxbLGnQryHYdWT_9K318H38dUmkAV3YMBHFXN5A@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Hi,

On 20-12-2019 16:40, Dmitry Mastykin wrote:
> Thank you Hans!
> 
> Your explanations were extremely useful!
> Manufacturer answered, he had an error in pin numbers.
> 
> I've changed table to:
> --------------------
> Name (RBUF, ResourceTemplate ()
> {
> I2cSerialBusV2 (0x0014, ControllerInitiated, 0x00061A80,
> AddressingMode7Bit, "\\_SB.PCI0.I2C3",
> 0x00, ResourceConsumer, , Exclusive,
> )
> GpioInt (Edge, ActiveHigh, Shared, PullDefault, 0x0000,
> "\\_SB.GPO0", 0x00, ResourceConsumer, ,
> )
> { // Pin list
> 0x0015
> }
> GpioIo (Shared, PullDefault, 0x0000, 0x0000, IoRestrictionOutputOnly,
> "\\_SB.GPO0", 0x00, ResourceConsumer, ,
> )
> { // Pin list
> 0x0019
> }
> })
> Now the I2C address is stably detected. But interrupt doesn't work:
> Goodix-TS i2c-GDIX1002:00: request IRQ failed: -1

Right, because the GPIO pin for the touchscreen irq pin is still
in direct-irq mode (as it was set by the BIOS), so we cannot use it
as GPIO. I've just received another bugreport about a similar problem
on another Apollo Lake device with Goodix touchscreen:

https://bugzilla.redhat.com/show_bug.cgi?id=1786317

This is about the Trekstor S11B and there the ACPI bits describing
the touchscreen has the following methods: INTI INTO and INTS
to respectively put the interrupt pin in input mode, put it in output
mode (and pass a value to output) and to get its current value.
See the Trekstor S11B acpidump attached to the bugzilla link above.

I can see the same methods in the DSDT-s of all Cherry Trail devices
with a goodix touchscreen I have, but those describe the irq as a
GpioInt, so there we can also just use normal gpio accesses instead
of poking the ACPI methods. Still we probably need to add support for
the ACPI methods for the Trekstor S11B case.

The combination of using a direct-irq enabled GPIO for the irq +
listing 2 normal GpioIo resources as your device does is seen on
Bay Trail devices, but is normally not used on anything newer and
on Bay Trail devices the touchscreen just stays awake during suspend
and still works afterwards. I don't really see a clean way to
support that weird combo (without the ACPI methods).

Long story short I don't really see a way to make things work
properly OOTB with your specific device. But I'm working on a

Regards,

Hans











> --------------------
> 
> If I use:
> --------------------
> I2cSerialBusV2 (0x0014, ControllerInitiated, 0x00061A80,
> AddressingMode7Bit, "\\_SB.PCI0.I2C3",
> 0x00, ResourceConsumer, , Exclusive,
> )
> GpioIo (Shared, PullDefault, 0x0000, 0x0000, IoRestrictionOutputOnly,
> "\\_SB.GPO0", 0x00, ResourceConsumer, ,
> )
> { // Pin list
> 0x0015
> }
> GpioIo (Shared, PullDefault, 0x0000, 0x0000, IoRestrictionOutputOnly,
> "\\_SB.GPO0", 0x00, ResourceConsumer, ,
> )
> { // Pin list
> 0x0019
> }
> Interrupt (ResourceConsumer, Edge, ActiveHigh, Shared, ,, )
> {
> 0x00000032,
> }
> })
> --------------------
> there is no error, but no interrupt is generated.
> 
> I understand that the problem is far from the driver but may be you
> could suggest where the problem is.
> Thank you!
> 
> Dmitry
> 
> On Fri, Dec 20, 2019 at 1:45 PM Hans de Goede <hdegoede@redhat.com> wrote:
>>
>> Hi,
>>
>> On 19-12-2019 10:10, Dmitry Mastykin wrote:
>>> Hi,
>>>>> I discovered what was with my device.
>>>>> After suspend/resume I2C address often changes to 0x5d (and ACPI table
>>>>> has 0x14).
>>>>>
>>>> Often but not always?
>>>>
>>> Yes, I think this is because INT from chipset side is tri-stated.
>>>
>>> I'm attaching the acpidump.
>>
>> Thanks, hmm, so looking at the acpidump, your device is using an Apollo
>> Lake and thus definitely is NOT the fieldbook-k122 as that is using
>> a Cherry Trail SoC and not an Apollo Lake SoC.
>>
>> It is also using a GPIO pin configured in direct-irq mode pin for the IRQ line:
>>
>>          Name (RBUF, ResourceTemplate ()
>>          {
>>              I2cSerialBusV2 (0x0014, ControllerInitiated, 0x00061A80,
>>                  AddressingMode7Bit, "\\_SB.PCI0.I2C3",
>>                  0x00, ResourceConsumer, , Exclusive,
>>                  )
>>              Interrupt (ResourceConsumer, Edge, ActiveHigh, Exclusive, ,, )
>>              {
>>                  0x00000032,
>>              }
>>              GpioIo (Shared, PullDefault, 0x0000, 0x0000, IoRestrictionOutputOnly,
>>                  "\\_SB.GPO0", 0x00, ResourceConsumer, ,
>>                  )
>>                  {   // Pin list
>>                      0x0019
>>                  }
>>              GpioIo (Shared, PullDefault, 0x0000, 0x0000, IoRestrictionOutputOnly,
>>                  "\\_SB.GPO0", 0x00, ResourceConsumer, ,
>>                  )
>>                  {   // Pin list
>>                      0x0005
>>                  }
>>          })
>>
>> And both GPIOs are listed as output-only which certainly does not match the
>> IRQ pin. So this setup is a bit foobar and the plan I have to allow the touchscreen
>> to properly power-down on suspend on Cherry Trail devices, will not work here :|
>>
>> For reference here are the ACPI resources for a GDIX touchscreen on Cherry Trail:
>>
>>       Name (WBUF, ResourceTemplate ()
>>       {
>>           I2cSerialBusV2 (0x0014, ControllerInitiated, 0x00061A80,
>>               AddressingMode7Bit, "\\_SB.PCI0.I2C6",
>>               0x00, ResourceConsumer, , Exclusive,
>>               )
>>           GpioInt (Edge, ActiveLow, Shared, PullDefault, 0x0000,
>>               "\\_SB.GPO3", 0x00, ResourceConsumer, ,
>>               )
>>               {   // Pin list
>>                   0x004D
>>               }
>>           GpioIo (Shared, PullDefault, 0x0000, 0x0000, IoRestrictionOutputOnly,
>>               "\\_SB.GPO1", 0x00, ResourceConsumer, ,
>>               )
>>               {   // Pin list
>>                   0x0014
>>               }
>>       })
>>
>> Notice how the Interrupt is specified as a GpioInt so we should be able
>> to use it as a GPIO during suspend so that we can wakeup the touchscreen on
>> resume...
>>
>> I'm afraid I do not have any easy ideas / fixes for how to fix the issue
>> you are seeing on your device.
>>
>> Regards,
>>
>> Hans
>>
>>
>>
>>
>>> On Wed, Dec 18, 2019 at 6:07 PM Hans de Goede <hdegoede@redhat.com> wrote:
>>>>
>>>> Hi,
>>>>
>>>> On 18-12-2019 15:50, Dmitry Mastykin wrote:
>>>>> Hi,
>>>>>
>>>>> I discovered what was with my device.
>>>>> After suspend/resume I2C address often changes to 0x5d (and ACPI table
>>>>> has 0x14).
>>>>
>>>> Often but not always?
>>>>
>>>>> ACPI tables doesn't contain _DSD section, and GPIOs are not mapped to
>>>>> ts->gpiod_int/rst. They are NULL. So reset sequence is not called.
>>>>> That's why rmmod/insmod doesn't help.
>>>>>
>>>>> (As temporary solution i changed client->addr, and will wait for
>>>>> better ACPI tables.
>>>>> I tried also to map gpios by index and seems that RESET works but INT
>>>>> doesn't. I can't change I2C address by reset sequence.
>>>>> I've sent a question to tablet's manufacturer about that.)
>>>>
>>>> Interesting, can you provide an acpidump of the device:
>>>>
>>>> sudo acpidump -o acpidump
>>>>
>>>> And then attach the generated acpidump file to your next email ?
>>>>
>>>> Regards,
>>>>
>>>> Hans
>>>>
>>>>
>>>>>
>>>>>> On most newer devices (such as the GPD) the IRQ pin is actually declared
>>>>>> as a GpioInt in the ACPI tables, so we should be able to use it as a GPIO
>>>>>> with some extra work.
>>>>>>
>>>>> I will be glad to test this when it's ready provided I have new ACPI tables.
>>>>>
>>>>> Thank you!
>>>>> Kind regards,
>>>>> Dmitry Mastykin
>>>>>
>>>>> On Wed, Dec 18, 2019 at 9:16 AM Hans de Goede <hdegoede@redhat.com> wrote:
>>>>>>
>>>>>> Hi,
>>>>>>
>>>>>> On 13-12-2019 09:17, Dmitry Mastykin wrote:
>>>>>>> Hi guys!
>>>>>>> Thank you very much for your answers, it's always surprising how fast
>>>>>>> the community reacts!
>>>>>>>
>>>>>>>> We have reports of the touchscreen no longer working after suspend/resume
>>>>>>>> on some GPD pocket devices, but not combined with these errors.
>>>>>>>>
>>>>>>> I copied my error messages precisely from gpd support site, because I
>>>>>>> have the same:
>>>>>>> https://gpdsupport.com/t/touchscreen-issue-resolved/132/84
>>>>>>> But seems that rmmod/insmod helps in their case.
>>>>>>> I noticed that the problem is not repeatable. But happens very often.
>>>>>>
>>>>>> Interesting I did not realize the same errors are showing on the GPD pocket.
>>>>>>
>>>>>> I have the feeling this might have something todo with us not putting the
>>>>>> touchscreen controller to sleep on ACPI devices because we cannot use
>>>>>> the IRQ pin as GPIO which is necessary for wakeup.
>>>>>>
>>>>>> On most newer devices (such as the GPD) the IRQ pin is actually declared
>>>>>> as a GpioInt in the ACPI tables, so we should be able to use it as a GPIO
>>>>>> with some extra work.
>>>>>>
>>>>>> I plan to write a patch to make us do this sometime in the near future
>>>>>> (no idea when I will get around to this though). I will put you
>>>>>> (Dmitry Mastykin) in the Cc of the patch when I get around to writing it.
>>>>>>
>>>>>> Note I do not know if this patch will actually help.
>>>>>>
>>>>>> Regards,
>>>>>>
>>>>>> Hans
>>>>>>
>>>>>>
>>>>>>>
>>>>>>>
>>>>>>>> When this happens, are these messages appear constantly, or only in
>>>>>>>> response to actual touch? Can you still interact with the device?
>>>>>>>>
>>>>>>> Constantly with 25Hz frequency.
>>>>>>>
>>>>>>>> The fact that you can talk to the controller like that is interesting.
>>>>>>>> Just to confirm, does it return sane data, or garbage?
>>>>>>>>
>>>>>>> root@or212:/home/u# i2cset -y 6 0x5d 0x81 0x4e 0x00 i
>>>>>>> root@or212:/home/u# i2cset -y 6 0x5d 0x81 0x4e i
>>>>>>> root@or212:/home/u# i2cget -y 6 0x5d
>>>>>>> 0x83
>>>>>>> root@or212:/home/u# i2cset -y 6 0x5d 0x81 0x4e 0x00 i
>>>>>>> root@or212:/home/u# i2cset -y 6 0x5d 0x81 0x4e i
>>>>>>> root@or212:/home/u# i2cget -y 6 0x5d
>>>>>>> 0x81
>>>>>>> First I touch with 3 fingers, then with one.
>>>>>>>
>>>>>>>> What is the model of the tablet?
>>>>>>>>
>>>>>>> Not sure about model, seems that it's this one:
>>>>>>> http://logic-instrument.com/en/fieldbook-k122.php
>>>>>>>
>>>>>>> Dmesg is attached
>>>>>>>
>>>>>>> Thank you!
>>>>>>> Kind regards,
>>>>>>> Dmitry Mastykin
>>>>>>>
>>>>>>> On Thu, Dec 12, 2019 at 11:51 PM Hans de Goede <hdegoede@redhat.com> wrote:
>>>>>>>>
>>>>>>>> Hi,
>>>>>>>>
>>>>>>>> On 12-12-2019 20:20, Dmitry Torokhov wrote:
>>>>>>>>> Hi Dmitry,
>>>>>>>>>
>>>>>>>>> On Thu, Dec 12, 2019 at 06:34:46PM +0300, Dmitry Mastykin wrote:
>>>>>>>>>> Здравствуйте, Дмитрий.
>>>>>>>>>> Простите, что отвлекаю, если что - не отвечайте и в лучшем случае
>>>>>>>>>> пошлите в mail-list)
>>>>>>>>>> У меня есть планшет с x86, вариантом Debian с ядром 4.15 и
>>>>>>>>>> контроллером тач-скрина gt928.
>>>>>>>>>
>>>>>>>>> What is the model of the tablet?
>>>>>>>>>
>>>>>>>>>> После suspend/resume не всегда, но очень часто тачскрин перестает
>>>>>>>>>> работать и постоянно выводит:
>>>>>>>>>> [ 3276.729412] Goodix-TS i2c-GDIX1002:00: I2C write end_cmd error
>>>>>>>>>> [ 3276.770153] Goodix-TS i2c-GDIX1002:00: I2C transfer error: -121
>>>>>>>>>
>>>>>>>>> When this happens, are these messages appear constantly, or only in
>>>>>>>>> response to actual touch? Can you still interact with the device?
>>>>>>>>>
>>>>>>>>> Could you please send the full dmesg so we know more about the device.
>>>>>>>>>
>>>>>>>>> Hans, Bastien, have you seen such issues with Goodix occasionally
>>>>>>>>> misbehaving on resume?
>>>>>>>>
>>>>>>>> We have reports of the touchscreen no longer working after suspend/resume
>>>>>>>> on some GPD pocket devices, but not combined with these errors.
>>>>>>>>
>>>>>>>> Regards,
>>>>>>>>
>>>>>>>> Hans
>>>>>>>>
>>>>>>>>
>>>>>>>>>
>>>>>>>>>> По i2cget/i2cset контроллер успешно отвечает.
>>>>>>>>>
>>>>>>>>> The fact that you can talk to the controller like that is interesting.
>>>>>>>>> Just to confirm, does it return sane data, or garbage?
>>>>>>>>>
>>>>>>>>> Thanks.
>>>>>>>>>
>>>>>>>>
>>>>>>
>>>>>
>>>>
>>
> 

