Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 33EC61543D2
	for <lists+linux-input@lfdr.de>; Thu,  6 Feb 2020 13:13:27 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727690AbgBFMN0 (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 6 Feb 2020 07:13:26 -0500
Received: from us-smtp-delivery-1.mimecast.com ([205.139.110.120]:54940 "EHLO
        us-smtp-1.mimecast.com" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
        with ESMTP id S1727609AbgBFMN0 (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Thu, 6 Feb 2020 07:13:26 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1580991204;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=yqFqoZsA59SVwEXAaO3c9dIryptP1lLZrFKdKlvT+kc=;
        b=IaTbIqLtda8dHgz+GDGmpYKiG8OOl+grePFur2rRkxGe565OItUPeAgBGG/0mTOuHboygt
        JMtc0ldedOBgLvCErF4cxll4OSjKJ5vhelTiG2OUQ6VCghJv6a/RFXHT45yp2JAEe2gsFa
        IAafP8/lzRp1gBCfCLZIk9jUHY5snSE=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-50-ATEaB2v5Nr6ZQwDwk3D3qQ-1; Thu, 06 Feb 2020 07:13:20 -0500
X-MC-Unique: ATEaB2v5Nr6ZQwDwk3D3qQ-1
Received: by mail-wr1-f70.google.com with SMTP id s13so3267597wrb.21
        for <linux-input@vger.kernel.org>; Thu, 06 Feb 2020 04:13:19 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=yqFqoZsA59SVwEXAaO3c9dIryptP1lLZrFKdKlvT+kc=;
        b=ebHt5z3c1lIA2EyIfaFRYPx9vgvXdy91kwaw7tqbej3ApE6Cx8NkZWqGT069eWn+XU
         EPSSZBqbXOuYWrAcAj5Jhu1ylAZ4xCQYoEepieqcRRZY0b/4DMPX0c21+Ri0RXYGbWFy
         E+tx9HaxnbICwegm946IcLmSgCB+0IplCm4FvbwcoGP1/MreYwemwd04ZKBwAhScZhbq
         p7t3LbIfFr2TI+340RJKbxEiwmoeKX3w39O/fMUooa75I3O5IgDt51vpAaqubjtdiZ/5
         +5BKlsMVzq6rqhiZenANDmpd+GNmV2YFQokj4yNc90Ohd6eMBqd19p8y1YcMKeSOS3tD
         20yQ==
X-Gm-Message-State: APjAAAWY5vX8Mj3fYzs2DM6Ed4rVJTfdehyawk/LWrxntkQC3cNdOJVD
        dV6rGiblGIhdL5RmYW341Mv5PrH7fNhKy+/6tc1/bo9syksusqLDZyJ5bF/391RHOzSCVygMTgB
        0lkvgFzHBYpfH/pIolQUL1U8=
X-Received: by 2002:a7b:c8d2:: with SMTP id f18mr4059172wml.47.1580991198841;
        Thu, 06 Feb 2020 04:13:18 -0800 (PST)
X-Google-Smtp-Source: APXvYqzbYMTd6rcBV5q2GTwdgLSW780OlgCPUxUFjIrQfg28m+ELO3Aw1RyMxvGpcFHCtXpKOI3YOg==
X-Received: by 2002:a7b:c8d2:: with SMTP id f18mr4059148wml.47.1580991198615;
        Thu, 06 Feb 2020 04:13:18 -0800 (PST)
Received: from x1.localdomain (2001-1c00-0c0c-fe00-fc7e-fd47-85c1-1ab3.cable.dynamic.v6.ziggo.nl. [2001:1c00:c0c:fe00:fc7e:fd47:85c1:1ab3])
        by smtp.gmail.com with ESMTPSA id m21sm3612600wmi.27.2020.02.06.04.13.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 06 Feb 2020 04:13:17 -0800 (PST)
Subject: Re: Make the hid-logitech-dj driver remove the HID++ nodes when the
 device disconnects
To:     =?UTF-8?Q?Filipe_La=c3=adns?= <lains@archlinux.org>,
        linux-input <linux-input@vger.kernel.org>
Cc:     Benjamin Tissoires <btissoir@redhat.com>,
        Peter Hutterer <peter.hutterer@redhat.com>,
        Nestor Lopez Casado <nlopezcasad@logitech.com>,
        Jiri Kosina <jikos@kernel.org>,
        Bastien Nocera <hadess@hadess.net>,
        Julien Hartmann <juli1.hartmann@gmail.com>
References: <451e552444483c52a038d3d14391611f897582f4.camel@archlinux.org>
 <f2997fc7-1f34-79d3-f0aa-8367ed09f473@redhat.com>
 <ac804c20c692aa5a65e78ba6c8e22e4f328f1667.camel@archlinux.org>
From:   Hans de Goede <hdegoede@redhat.com>
Message-ID: <4168f943-5ffe-10aa-b15f-21799ca99c0d@redhat.com>
Date:   Thu, 6 Feb 2020 13:13:16 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <ac804c20c692aa5a65e78ba6c8e22e4f328f1667.camel@archlinux.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Hi,

On 2/6/20 12:51 PM, Filipe Laíns wrote:
> On Thu, 2020-02-06 at 12:30 +0100, Hans de Goede wrote:
>> HI,
>>
>> On 2/6/20 12:14 PM, Filipe Laíns wrote:
>>> Hello,
>>>
>>> Right now the hid-logitech-dj driver will export one node for each
>>> connected device, even when the device is not connected. That causes
>>> some trouble because in userspace we don't have have any way to know if
>>> the device is connected or not, so when we try to communicate, if the
>>> device is disconnected it will fail.
>>
>> I'm a bit reluctant to make significant changes to how the
>> hid-logitech-dj driver works. We have seen a number of regressions
>> when it was changed to handle the non unifying receivers and I would
>> like to avoid more regressions.
>>
>> Some questions:
>> 1. What is the specific use case where you are hitting this?
> 
> For example, in libratbag we enumerate the devices and then probe them.
> Currently if the device is not connected, the communication fails. To
> get the device to show up we need to replug it, so it it triggers udev,
> or restart the daemon.

Thanks, that is exactly the sort of context to your suggested changes
which I need.

>> 2. Can't the userspace tools involved by modified to handle the errors
>> they are getting gracefully?
> 
> They can, but the approaches I see are not optimal:
>    - Wait for HID events coming from the device, which could never
> happen.
>    - Poll the device until it wakes up.

I guess we do get some (other or repeated?) event when the device does
actually connect, otherwise your suggested changes would not be possible.

So how about if we trigger a udev change event on the hid device instead
when this happens ? That seems like a less invasive change on the kernel
side and then libratbag could listen for these change events?


>> 3. Is there a bugreport open about this somewhere?
> 
> Yes, https://github.com/libratbag/libratbag/issues/785
> 
>>> The reason we do this is because otherwise we would loose the first
>>> packets when the device is turned on by key press. When a device is
>>> turned on we would have to create the device node, and the packets
>>> received while we are creating the device node would be lost.
>>
>> I don't believe that this is the reason, we only create hid child
>> devices for devices reported by the receiver, but some of the non
>> unifying hid receiver send a list of all devices paired, rather
>> then the ones which are actually connected at that time.
> 
> IIRC from my chats with Benjamin and Peter this is the reason, but
> please correct me if I'm wrong.

Could be that we can distinguish between "paired" and "connected"
and that we are enumerating "paired" but not (yet) "connected"
devices already because of what you say, I've not touched this
code in a while.

>>> This could solved by buffering those packets, but that is a bad solution as
>>> it would mess up the timings.
>>>
>>> At the moment the created node includes both normal HID and vendor
>>> usages. To solve this problem, I propose that instead of creating a
>>> single device node that contains all usages, we create one for normal
>>> HID, which would exist all the time, and one for the vendor usage,
>>> which would go away when the device disconnects. >
>>> This slight behavior change will affect userspace. Two hidraw nodes
>>> would be created instead of one. We need to make sure the current
>>> userspace stacks interfacing with this would be able to properly handle
>>> such changes.
>>>
>>> What do you think of this approach? Anyone has a better idea?
>>
>> The suggested approach sounds fragile and like it adds complexity to
>> an already not simple driver.
> 
> I understand, that is totally reasonable. I am working on a CI for the
> driver if that helps.
> 
>> It would be helpful to first describe the actual problem you are trying
>> to fix (rather then suggesting a solution without clearly defining the
>> problem) and then we can see from there.
> 
> I though I described it good enough in the first paragraph but I guess
> not, sorry. You should be able to get it from my comments above, if not
> please let me know :)

No problem, I have enough context now. I personally like my udev change
event idea, which seems more KISS. But ultimately this is Benjamin's call.

Regards,

Hans

