Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 5EE35154F91
	for <lists+linux-input@lfdr.de>; Fri,  7 Feb 2020 01:05:25 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726956AbgBGAFT (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 6 Feb 2020 19:05:19 -0500
Received: from us-smtp-2.mimecast.com ([205.139.110.61]:60055 "EHLO
        us-smtp-delivery-1.mimecast.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1726502AbgBGAFT (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Thu, 6 Feb 2020 19:05:19 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1581033917;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=AJb5TKRG96L77mBcZukzq+0wzOUWA35rDje++fWjf4k=;
        b=OTRE5EuDSLEn48MYNwqZKvG2juqnDqEWp973JYdLWbxR/k0MBiGv42S5F+l0TKRqm8qg/g
        AYoSteJUfyS5VUPDD24AjPA9Yegk9e/9FUPO41605GZvUlegPUmKW3oyukqEekDFdPgMNj
        RP0Q6xFI0LSN+fRWlySlhXtc9wZWxyw=
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com
 [209.85.210.197]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-428-Rznb-Km4M-GYmIQW_Kpp9g-1; Thu, 06 Feb 2020 19:05:15 -0500
X-MC-Unique: Rznb-Km4M-GYmIQW_Kpp9g-1
Received: by mail-pf1-f197.google.com with SMTP id c17so229840pfi.20
        for <linux-input@vger.kernel.org>; Thu, 06 Feb 2020 16:05:15 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=AJb5TKRG96L77mBcZukzq+0wzOUWA35rDje++fWjf4k=;
        b=Hyfq/d3znmWi/pKv9F566SEj68TNFEQC4Ed6bAb8nMMWjsGZjf1sSQQq8VIEdjlk9P
         nj1nKYkz0AYsfhOiVLZxFLDfoQrE262RGtbbYDjLhrtJlfWaCAm5yuh1E2jcbQ7NfRi8
         RSG+xoUGabFT2CvK3RJv7BzdWWjTFWoZtveF/Rq3A3Y4BMgYYmg/eC4ORmvDLwMfT319
         s9WLy4iKFiCWUckBIDZ8vbFEFp0QW5azXuJ6geiqvBwu6CUp7V+ooqp7/bGVKGKnHMAn
         nkSzPfXLUE0VM3kFJq8NhE73RB1Tko6xFqVpkBECv6n8pG3rXj7sTzm5ASYHHChGgptR
         KawA==
X-Gm-Message-State: APjAAAV7rELJMDbUSL6P8Rx8XldQJKMfImUUBBzMt46Jnvq/4Hckx2g7
        pZp67hrUavqywFRwE9TcpIAUAPSqdD/aY2ltPMA55jZqLw3nFpSHoTJmgSiegfBnj3jXmfipe/e
        CF81A+FKLe81rx6dbuhi+3ag=
X-Received: by 2002:a63:650:: with SMTP id 77mr6340126pgg.102.1581033914103;
        Thu, 06 Feb 2020 16:05:14 -0800 (PST)
X-Google-Smtp-Source: APXvYqx3Z4JT+3SfEWrdKX0+bGRf7nNMrMOjK0UAh7SwtfNeBFjRn3FdUyip+UcrU6lqa7u5jGFIwQ==
X-Received: by 2002:a63:650:: with SMTP id 77mr6340095pgg.102.1581033913793;
        Thu, 06 Feb 2020 16:05:13 -0800 (PST)
Received: from [192.168.1.200] (117-20-71-109.751447.bne.nbn.aussiebb.net. [117.20.71.109])
        by smtp.gmail.com with ESMTPSA id x132sm499022pfc.148.2020.02.06.16.05.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 06 Feb 2020 16:05:13 -0800 (PST)
Subject: Re: Make the hid-logitech-dj driver remove the HID++ nodes when the
 device disconnects
To:     Benjamin Tissoires <btissoir@redhat.com>,
        =?UTF-8?Q?Filipe_La=c3=adns?= <lains@archlinux.org>
Cc:     Hans de Goede <hdegoede@redhat.com>,
        linux-input <linux-input@vger.kernel.org>,
        Nestor Lopez Casado <nlopezcasad@logitech.com>,
        Jiri Kosina <jikos@kernel.org>,
        Bastien Nocera <hadess@hadess.net>,
        Julien Hartmann <juli1.hartmann@gmail.com>
References: <451e552444483c52a038d3d14391611f897582f4.camel@archlinux.org>
 <f2997fc7-1f34-79d3-f0aa-8367ed09f473@redhat.com>
 <ac804c20c692aa5a65e78ba6c8e22e4f328f1667.camel@archlinux.org>
 <4168f943-5ffe-10aa-b15f-21799ca99c0d@redhat.com>
 <7bf597e43c38518692dee5fdc2c03e21f78f61a1.camel@archlinux.org>
 <CAO-hwJLKrY6vJ-95+A-w3BdGXLVQDsX73VkgqjGCFOztTVRa9w@mail.gmail.com>
From:   Peter Hutterer <peter.hutterer@redhat.com>
Message-ID: <b867da88-991d-4a9b-7640-4a7994b7112a@redhat.com>
Date:   Fri, 7 Feb 2020 10:03:25 +1000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <CAO-hwJLKrY6vJ-95+A-w3BdGXLVQDsX73VkgqjGCFOztTVRa9w@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-AU
Content-Transfer-Encoding: 8bit
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On 7/2/20 3:01 am, Benjamin Tissoires wrote:
> On Thu, Feb 6, 2020 at 4:42 PM Filipe Laíns <lains@archlinux.org> wrote:
>>
>> On Thu, 2020-02-06 at 13:13 +0100, Hans de Goede wrote:
>>> Hi,
>>>
>>> On 2/6/20 12:51 PM, Filipe Laíns wrote:
>>>> On Thu, 2020-02-06 at 12:30 +0100, Hans de Goede wrote:
>>>>> HI,
>>>>>
>>>>> On 2/6/20 12:14 PM, Filipe Laíns wrote:
>>>>>> Hello,
>>>>>>
>>>>>> Right now the hid-logitech-dj driver will export one node for each
>>>>>> connected device, even when the device is not connected. That causes
>>>>>> some trouble because in userspace we don't have have any way to know if
>>>>>> the device is connected or not, so when we try to communicate, if the
>>>>>> device is disconnected it will fail.
>>>>>
>>>>> I'm a bit reluctant to make significant changes to how the
>>>>> hid-logitech-dj driver works. We have seen a number of regressions
>>>>> when it was changed to handle the non unifying receivers and I would
>>>>> like to avoid more regressions.
>>>>>
>>>>> Some questions:
>>>>> 1. What is the specific use case where you are hitting this?
>>>>
>>>> For example, in libratbag we enumerate the devices and then probe them.
>>>> Currently if the device is not connected, the communication fails. To
>>>> get the device to show up we need to replug it, so it it triggers udev,
>>>> or restart the daemon.
>>>
>>> Thanks, that is exactly the sort of context to your suggested changes
>>> which I need.
>>>
>>>>> 2. Can't the userspace tools involved by modified to handle the errors
>>>>> they are getting gracefully?
>>>>
>>>> They can, but the approaches I see are not optimal:
>>>>     - Wait for HID events coming from the device, which could never
>>>> happen.
>>>>     - Poll the device until it wakes up.
>>>
>>> I guess we do get some (other or repeated?) event when the device does
>>> actually connect, otherwise your suggested changes would not be possible.
>>
>> No, I was thinking to just send the HID++ version identification
>> routine and see if the device replies.
> 
> Hmm, to continue on these questions:
> - yes, the current approach is to have the users of the HID++ device
> try to contact the device, get an error from the receiver, then keep
> the hidraw node open until we get something out of it, and then we can
> start talking to it
> - to your question Hans, when a device connects, it emits a HID++
> notification, which we should be relaying in the hidraw node. If not,
> well then starting to receive a key or abs event on the input node is
> a pretty good hint that the device connected.
> 
> So at any time, the kernel knows which devices are connected among
> those that are paired, so the kernel knows a lot more than user space.
> 
> The main problem Filipe is facing here is that we specifically
> designed libratbag to *not* keep the device nodes opened, and to not
> poll on the input events. The reason being... we do not want libratbag
> to be considered as a keylogger.

I'm wondering - can we really get around this long-term? Even if we have 
a separate HID++ node and/or udev change events and/or some other 
notification, in the end you still have some time T between that event 
and userspace opening the actual event node. Where the first key event 
wakes up the physical keyboard, you're now racing.

So the separate HID++ node works as long as libratbag *only* listens to 
that node, as soon as we need to start caring about a normal event it 
won't work any longer.

Cheers,
   Peter

