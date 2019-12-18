Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B043D123F74
	for <lists+linux-input@lfdr.de>; Wed, 18 Dec 2019 07:16:46 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725810AbfLRGQp (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 18 Dec 2019 01:16:45 -0500
Received: from us-smtp-1.mimecast.com ([207.211.31.81]:30626 "EHLO
        us-smtp-delivery-1.mimecast.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1725799AbfLRGQp (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Wed, 18 Dec 2019 01:16:45 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1576649803;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=z1QaV1fOw0+UsZyLAgw/u50No3w3TDLBJ6WiYDXs8ZM=;
        b=BvmhN13UXUSkYowR5Pz1e4DPnAaxDzRmlI/kwMkc9libj+qaSmIjz2As7U7FRrT1drPitc
        0R0A+VgBZKgYFsJKqQUOQ2Ll9s6upOAw9VSTx1Ld25fp86FA66a5xz/xDxG5zWO194m+MJ
        Tfw8rZLyj4DTEaGIDH1L+m7MIMRlCS4=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-427-lvsHapkNOFqOrrblAz0vgg-1; Wed, 18 Dec 2019 01:16:41 -0500
X-MC-Unique: lvsHapkNOFqOrrblAz0vgg-1
Received: by mail-wm1-f69.google.com with SMTP id m133so180486wmf.2
        for <linux-input@vger.kernel.org>; Tue, 17 Dec 2019 22:16:41 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=z1QaV1fOw0+UsZyLAgw/u50No3w3TDLBJ6WiYDXs8ZM=;
        b=mFhPLw2fRJxN1ljLr7p1i1brbjt2vSULU6Vkll7/c5b6XCjOCAeUMws1FPM8i4Ue+W
         9W04G8mBy9mwBPA3EB9k6oE/Iqlx24yGEwEU4BEUE0MMXPIXDcXHbCdxFYD1lnrd11TO
         NOoECjwWNc6c1PM3pjC9mexjNvlBoHfQH0MnwEJw1VDw+hyA5RrRKjWeuP+xXE4/4WeU
         LgyZmG5yNHY/LuOBN9z6GQ2Z4jhoeiy4lfb4mCsc3BnO3N6YWFW0d6FMt4ifVrR0N4I0
         KaiXtztRF/geRzCfiDLGIRkVapHVyPYLDxH20rmp7CqoSC1jih+NWoT0DYJHFOqGMuz7
         ZUVw==
X-Gm-Message-State: APjAAAWPsfOpvFHS0H0q6Xe4Q352Het0a4PkLKnOjoXgrddfyunoGMs5
        Qh2omi1Xikc8a5EVMoR3qW2oh7KoAgN67a3ZqyIVeXjP3+pn6U5lH2IPeT8A7v2mdkKkPayPM7V
        V9i/za0sTZhpvXW4YNlkB7tc=
X-Received: by 2002:adf:dfd2:: with SMTP id q18mr666471wrn.152.1576649800501;
        Tue, 17 Dec 2019 22:16:40 -0800 (PST)
X-Google-Smtp-Source: APXvYqyCpLvk75Ppc1vvR5mhBsbDYCzBrn1QxbEMr+9aNtJP9CW0NvlzLZUKTlbN+j9eW+K84xXKog==
X-Received: by 2002:adf:dfd2:: with SMTP id q18mr666445wrn.152.1576649800184;
        Tue, 17 Dec 2019 22:16:40 -0800 (PST)
Received: from shalem.localdomain (2001-1c00-0c0c-fe00-7e79-4dac-39d0-9c14.cable.dynamic.v6.ziggo.nl. [2001:1c00:c0c:fe00:7e79:4dac:39d0:9c14])
        by smtp.gmail.com with ESMTPSA id f1sm1339937wrp.93.2019.12.17.22.16.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 17 Dec 2019 22:16:39 -0800 (PST)
Subject: =?UTF-8?B?UmU6INCy0L7Qv9GA0L7RgSDQv9C+IHN1c3BlbmQvcmVzdW1lINCyIGdv?=
 =?UTF-8?Q?odix?=
To:     Dmitry Mastykin <mastichi@gmail.com>
Cc:     Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Bastien Nocera <hadess@hadess.net>, linux-input@vger.kernel.org
References: <CALieaefYFFBaFAo4E7hsESrxhN7N_tbWbeG_C6WHzwDpFiLqeQ@mail.gmail.com>
 <20191212192009.GB101194@dtor-ws>
 <e2876e96-ba7d-47ff-44e0-6478b48c6fe3@redhat.com>
 <CALieaecDVVO0GMySV8ge4ecsyPziRxKpCo=RTdWX266vzdNyBw@mail.gmail.com>
From:   Hans de Goede <hdegoede@redhat.com>
Message-ID: <bceaca05-bec1-4fcf-9f52-3a9a2a3318c7@redhat.com>
Date:   Wed, 18 Dec 2019 07:16:38 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.2
MIME-Version: 1.0
In-Reply-To: <CALieaecDVVO0GMySV8ge4ecsyPziRxKpCo=RTdWX266vzdNyBw@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Hi,

On 13-12-2019 09:17, Dmitry Mastykin wrote:
> Hi guys!
> Thank you very much for your answers, it's always surprising how fast
> the community reacts!
> 
>> We have reports of the touchscreen no longer working after suspend/resume
>> on some GPD pocket devices, but not combined with these errors.
>>
> I copied my error messages precisely from gpd support site, because I
> have the same:
> https://gpdsupport.com/t/touchscreen-issue-resolved/132/84
> But seems that rmmod/insmod helps in their case.
> I noticed that the problem is not repeatable. But happens very often.

Interesting I did not realize the same errors are showing on the GPD pocket.

I have the feeling this might have something todo with us not putting the
touchscreen controller to sleep on ACPI devices because we cannot use
the IRQ pin as GPIO which is necessary for wakeup.

On most newer devices (such as the GPD) the IRQ pin is actually declared
as a GpioInt in the ACPI tables, so we should be able to use it as a GPIO
with some extra work.

I plan to write a patch to make us do this sometime in the near future
(no idea when I will get around to this though). I will put you
(Dmitry Mastykin) in the Cc of the patch when I get around to writing it.

Note I do not know if this patch will actually help.

Regards,

Hans


> 
> 
>> When this happens, are these messages appear constantly, or only in
>> response to actual touch? Can you still interact with the device?
>>
> Constantly with 25Hz frequency.
> 
>> The fact that you can talk to the controller like that is interesting.
>> Just to confirm, does it return sane data, or garbage?
>>
> root@or212:/home/u# i2cset -y 6 0x5d 0x81 0x4e 0x00 i
> root@or212:/home/u# i2cset -y 6 0x5d 0x81 0x4e i
> root@or212:/home/u# i2cget -y 6 0x5d
> 0x83
> root@or212:/home/u# i2cset -y 6 0x5d 0x81 0x4e 0x00 i
> root@or212:/home/u# i2cset -y 6 0x5d 0x81 0x4e i
> root@or212:/home/u# i2cget -y 6 0x5d
> 0x81
> First I touch with 3 fingers, then with one.
> 
>> What is the model of the tablet?
>>
> Not sure about model, seems that it's this one:
> http://logic-instrument.com/en/fieldbook-k122.php
> 
> Dmesg is attached
> 
> Thank you!
> Kind regards,
> Dmitry Mastykin
> 
> On Thu, Dec 12, 2019 at 11:51 PM Hans de Goede <hdegoede@redhat.com> wrote:
>>
>> Hi,
>>
>> On 12-12-2019 20:20, Dmitry Torokhov wrote:
>>> Hi Dmitry,
>>>
>>> On Thu, Dec 12, 2019 at 06:34:46PM +0300, Dmitry Mastykin wrote:
>>>> Здравствуйте, Дмитрий.
>>>> Простите, что отвлекаю, если что - не отвечайте и в лучшем случае
>>>> пошлите в mail-list)
>>>> У меня есть планшет с x86, вариантом Debian с ядром 4.15 и
>>>> контроллером тач-скрина gt928.
>>>
>>> What is the model of the tablet?
>>>
>>>> После suspend/resume не всегда, но очень часто тачскрин перестает
>>>> работать и постоянно выводит:
>>>> [ 3276.729412] Goodix-TS i2c-GDIX1002:00: I2C write end_cmd error
>>>> [ 3276.770153] Goodix-TS i2c-GDIX1002:00: I2C transfer error: -121
>>>
>>> When this happens, are these messages appear constantly, or only in
>>> response to actual touch? Can you still interact with the device?
>>>
>>> Could you please send the full dmesg so we know more about the device.
>>>
>>> Hans, Bastien, have you seen such issues with Goodix occasionally
>>> misbehaving on resume?
>>
>> We have reports of the touchscreen no longer working after suspend/resume
>> on some GPD pocket devices, but not combined with these errors.
>>
>> Regards,
>>
>> Hans
>>
>>
>>>
>>>> По i2cget/i2cset контроллер успешно отвечает.
>>>
>>> The fact that you can talk to the controller like that is interesting.
>>> Just to confirm, does it return sane data, or garbage?
>>>
>>> Thanks.
>>>
>>

