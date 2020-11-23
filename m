Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 098B42C01A4
	for <lists+linux-input@lfdr.de>; Mon, 23 Nov 2020 09:46:54 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728032AbgKWIqL (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 23 Nov 2020 03:46:11 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:58501 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1727982AbgKWIqK (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Mon, 23 Nov 2020 03:46:10 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1606121169;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=jYMiKkTGrMYQ2NetJ3YPrn1xVtPypbL8WrDyKHTMzOs=;
        b=UONhhJfNtMrg/eHMvN7K8Pdg5PHxA8TPvbDOBfLLdaE7rZUJ+mnoYTRhUlX6/Z0Pu8LCJo
        Mqs2FbJIStNqA+6oSYOykx2kkAWSsxSPvHOZAp0w8F/NZs5FKTHW2HhfQ/e3fc9Aa4Vwnf
        meFzeVoB7J+f8tp4OilId9ufdc/fTBM=
Received: from mail-ej1-f69.google.com (mail-ej1-f69.google.com
 [209.85.218.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-232-mprvmUm3OFCpQ2Utrt20fQ-1; Mon, 23 Nov 2020 03:46:07 -0500
X-MC-Unique: mprvmUm3OFCpQ2Utrt20fQ-1
Received: by mail-ej1-f69.google.com with SMTP id e7so5416143eja.15
        for <linux-input@vger.kernel.org>; Mon, 23 Nov 2020 00:46:06 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=jYMiKkTGrMYQ2NetJ3YPrn1xVtPypbL8WrDyKHTMzOs=;
        b=hEPF115ptKnIO8yit44VP3r8Uugq1lvlvDuCPT+5FEHn5Sa/+0e9jZRyCUS6rTmT9E
         5tFalc6eaPBvYMxzWwUXRc4oCU/J09DF/XQvV9VgWVFZD+6WlO3/Q1gs7qBrtEuGP2kG
         hEpzuj5oT4/ekDdA09BlfhY5vfwX92Z5Jb6zl3ssiGUg9547Gt4Qf5hB2gt1kWgh+N4P
         8Obd/QCIa603IjMVvZg30y6EqH5AwqBlWVaJkoWkU26aHN/LuQwAofjAjoufO/RJl2XB
         rbwRhkxMNiiRLbT1m33EWGXmKqu+srxXyyPkdfFhD0KdNNOJE3Tfkn1GS6C4u+FKCRN6
         XbEw==
X-Gm-Message-State: AOAM531cDmXV8Apzkly/9pwUUSr0ec/QFL2SDUah23UgA2zMUibVpwGY
        q0LNhrscT7RF+n2JFjnlXl6E6QiFcWOtlbYY2s07aM3Hc5btcdKZ6PIoSvm0ve8vrO1qq8yti5F
        gNIxHap8YwROwwBUUM+1VeUM=
X-Received: by 2002:a05:6402:1a22:: with SMTP id be2mr24532767edb.102.1606121165435;
        Mon, 23 Nov 2020 00:46:05 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzHAlytM8HZAuIe1TFTLq5EO2Yi955/QctUdn81v7hrbJNCLA84nh49UlvJcnxIviSNRiTGPw==
X-Received: by 2002:a05:6402:1a22:: with SMTP id be2mr24532760edb.102.1606121165221;
        Mon, 23 Nov 2020 00:46:05 -0800 (PST)
Received: from x1.localdomain (2001-1c00-0c0c-fe00-6c10-fbf3-14c4-884c.cable.dynamic.v6.ziggo.nl. [2001:1c00:c0c:fe00:6c10:fbf3:14c4:884c])
        by smtp.gmail.com with ESMTPSA id j9sm4519025ejf.105.2020.11.23.00.46.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 23 Nov 2020 00:46:04 -0800 (PST)
Subject: Re: [PATCH 1/3] Input: goodix - add option to disable firmware
 loading
To:     Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc:     Andrej Valek <andrej.valek@siemens.com>, nick@shmanahar.org,
        hadess@hadess.net, linux-input@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
References: <20201029170313.25529-1-andrej.valek@siemens.com>
 <20201029170313.25529-2-andrej.valek@siemens.com>
 <20201029203608.GE2547185@dtor-ws>
 <a5964429-a472-6b78-e53c-69b4cb115b94@redhat.com>
 <20201123065336.GC2034289@dtor-ws>
From:   Hans de Goede <hdegoede@redhat.com>
Message-ID: <07a7e9e2-0c82-fdc0-2db0-5011b94816e2@redhat.com>
Date:   Mon, 23 Nov 2020 09:46:03 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <20201123065336.GC2034289@dtor-ws>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Hi,

On 11/23/20 7:53 AM, Dmitry Torokhov wrote:
> On Fri, Oct 30, 2020 at 10:56:20AM +0100, Hans de Goede wrote:
>> Hi,
>>
>> On 10/29/20 9:36 PM, Dmitry Torokhov wrote:
>>> Hi Andrej,
>>>
>>> On Thu, Oct 29, 2020 at 06:03:11PM +0100, Andrej Valek wrote:
>>>> Firmware file loadind for GT911 controller takes too much time (~60s).
>>>> There is no check that configuration is the same which is already present.
>>>> This happens always during boot, which makes touchscreen unusable.
>>>>
>>>> Add there an option to prevent firmware file loading, but keep it enabled
>>>> by default.
>>>
>>> I thought that Goodix was losing firmware loading at poweroff. Is this
>>> not the case with this model?
>>
>> So first of all there are 2 sorts of firmware involved with the
>> Goodix touchscreen controllers, the actual firmware and a block
>> of config data for that firmware which I presume adjusts it for
>> the specific (model of) the digitizer which is attached.
>>
>> ATM the mainline Linux driver does not support models where
>> the actual firmware itself needs to be loaded (because they
>> only have RAM, so they come up without firmware).
>>
>> I do have one model tablet with a ROM-less goodix touchpad
>> controller, so if I ever find the time I might add support
>> for loading the actual firmware.
>>
>> So what we are talking about here is just loading the config
>> data and I'm a bit surprised that this take so long.
> 
> So I am still confused about this: is the config stored in RAM or NVRAM?
> I.e. do we actually need to re-load it every time on boot, or it
> supposed to be flashed only when it is changed (or lost)?

I only know about these touchscreens on x86, where we have a BIOS
muddling the waters.

We have seen devices which loose the config over suspend/resume,
which suggests it is in RAM. I recently added a fix for these which
saves the config at boot, which suggests that at least on the device
model with the suspend/resume issue the config is loaded into the chip
by the BIOS.

But I'm not sure that this is the case everywhere. Most other models
likely have the config in NVRAM.

I guess this is the same as with the firmware, and it differs per
model. I know for sure that their are RAM only models which need
the firmware loaded at boot, these are mostly found on ARM devs,
but I have one X86 devices (which currently does not work) which
also has RAM only and thus needs Linux to load the firmware
(which is not supported atm). These RAM only models, presumably
also have only RAM for the config.

Regards,

Hans

