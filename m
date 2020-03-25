Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id CB3E0192B93
	for <lists+linux-input@lfdr.de>; Wed, 25 Mar 2020 15:55:53 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727222AbgCYOzx (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 25 Mar 2020 10:55:53 -0400
Received: from us-smtp-delivery-74.mimecast.com ([63.128.21.74]:31947 "EHLO
        us-smtp-delivery-74.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726969AbgCYOzw (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Wed, 25 Mar 2020 10:55:52 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1585148151;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=hH0gkJ61BXJmQAYvZ6d6A9XrsS45+RVww40BKZFAC9c=;
        b=YU40dXIKPL1dA8PxskNRKgmpBtgMmGdakK+m68aocMzmXZqOzARWLsNhx4tDT/opJjoU9L
        +ZuKpflVv0tWV+56UnnZ9iAo7Y/YK3z5fpj6Qm0NPKEl3zTq2FrnwSv5zUTTQ97MdqXUGP
        8Feb2VJv3YzWd+V8WrtvbIpwQ7xuqv4=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-16-5W2q6CsnMemJI7vCZvt7Hw-1; Wed, 25 Mar 2020 10:55:49 -0400
X-MC-Unique: 5W2q6CsnMemJI7vCZvt7Hw-1
Received: by mail-wm1-f71.google.com with SMTP id g9so2579346wmh.1
        for <linux-input@vger.kernel.org>; Wed, 25 Mar 2020 07:55:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=hH0gkJ61BXJmQAYvZ6d6A9XrsS45+RVww40BKZFAC9c=;
        b=nI45vzdjkVB3ZLj6V8fzDN2HpvL2d/DA5nPOAzinuWmNDuwDs9uv+/PjS0xkMCZvwR
         udXMolKEyQ3PsNsJw6Zt1BERVZfE/osjrjpRsJWXRFfucEq/b7FVqZWAMk87+t5HQQBX
         grSmrCKNeAlxRebTo8FDIq5UW8BzDctj1O43ThRgfRBGeWxXeH9VJNoyByDjCevEPhRK
         r50RmRODRsUH5E3cq9JVCYIx7yHuVldWHNdov73bGy+bQElolIMkobhBHKcq5CvMRhhn
         c2+SbBZBr54aV0elUfi6xhBQuc7ZKyzIox6XVFn2S2hd7Q3tl8qF2SEcI/JGUjiQJ3lr
         sWrg==
X-Gm-Message-State: ANhLgQ00n37QS44DSqEXjjs+1duXMqdfpIOroZYAnMu0nznhkazQDra2
        pmP0FflP4djsGnbQ6IiAJNFb95HyWZf2zHs/j6aTd3tcs/MyxHv94DKyJl4nFbuOFOE2XPsUeFU
        afS2jVVljtjDTYph3seBqyKg=
X-Received: by 2002:a1c:7412:: with SMTP id p18mr3702630wmc.46.1585148148089;
        Wed, 25 Mar 2020 07:55:48 -0700 (PDT)
X-Google-Smtp-Source: ADFU+vtPLEDSLhiJ+Uf+p8T7uT0e+ruhGvkOluJdbJOnZfTp2AOOUYEO5lOS++e8D3f8yJnl29MT4A==
X-Received: by 2002:a1c:7412:: with SMTP id p18mr3702614wmc.46.1585148147851;
        Wed, 25 Mar 2020 07:55:47 -0700 (PDT)
Received: from x1.localdomain (2001-1c00-0c0c-fe00-fc7e-fd47-85c1-1ab3.cable.dynamic.v6.ziggo.nl. [2001:1c00:c0c:fe00:fc7e:fd47:85c1:1ab3])
        by smtp.gmail.com with ESMTPSA id q185sm9701901wme.10.2020.03.25.07.55.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 25 Mar 2020 07:55:45 -0700 (PDT)
Subject: Re: [PATCH] Input: goodix - Fix compilation when ACPI support is
 disabled
To:     Bastien Nocera <hadess@hadess.net>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc:     linux-input@vger.kernel.org, kbuild test robot <lkp@intel.com>
References: <20200325103348.108792-1-hdegoede@redhat.com>
 <9f4df3fdc54448728582ea35f4d3a08411f6aba5.camel@hadess.net>
 <6611fe58-8e3d-d443-9dd1-6ed9086fa752@redhat.com>
 <1db6a35732a2c191ff56043f1ae357d8ae1b5b10.camel@hadess.net>
 <5aca9fe9-3751-f0f6-9851-5d9a0c048388@redhat.com>
 <be555dbf9c8508c5b8d9ed561384c66d76326241.camel@hadess.net>
 <3ed2db45-0fd6-694e-023d-427cb8854f81@redhat.com>
 <a9c1e74e54abf7db4bb09e77e148831f42de9fa2.camel@hadess.net>
From:   Hans de Goede <hdegoede@redhat.com>
Message-ID: <abdfb071-b1e1-d667-0d3b-83fd2f053148@redhat.com>
Date:   Wed, 25 Mar 2020 15:55:44 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.6.0
MIME-Version: 1.0
In-Reply-To: <a9c1e74e54abf7db4bb09e77e148831f42de9fa2.camel@hadess.net>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Hi,

On 3/25/20 3:10 PM, Bastien Nocera wrote:
> On Wed, 2020-03-25 at 15:05 +0100, Hans de Goede wrote:
>> Hi,
>>
>> On 3/25/20 3:02 PM, Bastien Nocera wrote:
>>> On Wed, 2020-03-25 at 14:55 +0100, Hans de Goede wrote:
>>>> We could do something like that, but TBH I'm not a fan of that
>>>>
>>>> adding extra wrappers makes it harder to see what the code is
>>>>
>>>> actually doing.
>>>>
>>>>
>>>>
>>>> I understand your dislike for the extra braces I added and
>>>>
>>>> I'm fine with fixing that by adding __maybe_unused to the
>>>>
>>>> variable declarations at the top. I don't really see what
>>>>
>>>> the problem with the #ifdef-s is given how clean they are,
>>>>
>>>> with the braces thing fixed by using __maybe_unused things
>>>>
>>>> would look like e.g. this:
>>>
>>> It's not only the fact that there's extra #ifdef's, it's that the
>>> ifdef's need to be just "that". It's not "#ifdef FOO", it's "#if
>>> defined CONFIG_X86 && defined CONFIG_ACPI".
>>
>> If that is the problem I would prefer adding:
>>
>> /* Our special handling for GPIO accesses through ACPI is x86
>> specific */
>> #if defined CONFIG_X86 && defined CONFIG_ACPI
>> #define ACPI_GPIO_SUPPORT
>> #endif
>>
>> And use:
>>
>> #ifdef ACPI_GPIO_SUPPORT
>>
>> Elsewhere.
>>
>> Would that work for you?
> 
> That's slightly better, but I would still have preferred stubbing out
> those ACPI calls directly. Right now, the fact that we expect half of
> the commands to be stubbed out and the other half to not be called is
> just weird.

I agree that ideally we would have stubs for this in the include/linux/...
headers, but unfortunately that is not the case here; and fixing this
is tricky for the acpi case as explained before.

I'm not a fan of adding local stubs for this, so I'm going to go with
adding:

#if defined CONFIG_X86 && defined CONFIG_ACPI
#define ACPI_GPIO_SUPPORT
#endif

+ using __maybe_unused to avoid the extra braces for v2, and then lets
see if Dmitry has anything to add to this discussion.

Regards,

Hans


