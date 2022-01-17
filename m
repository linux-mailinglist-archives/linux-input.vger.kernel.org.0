Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8634C49049A
	for <lists+linux-input@lfdr.de>; Mon, 17 Jan 2022 10:08:55 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233691AbiAQJIv (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 17 Jan 2022 04:08:51 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:60324 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S233504AbiAQJIv (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Mon, 17 Jan 2022 04:08:51 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1642410530;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=TCqojMBzneNNc6lN3uFWc2rgbGZACzzVm/491Ruez1Y=;
        b=gaFDvhkbxtL6THmL40Hf5iEIWN5Aypb2EX6phkN/3sBdiP9oS4g65PmdVY4ZWswey7yRX5
        lkTGF+KIIm81Cl7iGFVUhkL4+RBuJCuqZyNBqsR/wFbbH2wv/WyEej53/64WaAmfB2eItw
        bKAGQevsMlRklYshblGW+K/ZXQdURcM=
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-663-fbvmEhGWOE6mNNdhxUlBNg-1; Mon, 17 Jan 2022 04:08:49 -0500
X-MC-Unique: fbvmEhGWOE6mNNdhxUlBNg-1
Received: by mail-ed1-f69.google.com with SMTP id h1-20020aa7cdc1000000b0040042dd2fe4so12349542edw.17
        for <linux-input@vger.kernel.org>; Mon, 17 Jan 2022 01:08:49 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:references:from:in-reply-to
         :content-transfer-encoding;
        bh=TCqojMBzneNNc6lN3uFWc2rgbGZACzzVm/491Ruez1Y=;
        b=A6EEtw5ageqGBQCOwh9QAhrPEZ+byM1r4xCCQSVTH2P5DhVTAoP9zlgo0SqXFlENQC
         VRHtym0+ybEN9eoh5ZokkCxJ8qHxDYFheejic61vQcxnCqJx5qCo9r614AlGXtiOsUPM
         XfVxjCOOAQXXWTSA3/LzHTYsPMhWMi8ILfTI+N9esJtwsY5XtuNGiBne9FusemN83NzP
         QfpSm/K62PuPOdMY79UdILSJVk/nlON0jQ131inEfVqljZIrkk7WangVsKiSdpfoqUJ3
         CXxoDYwpd4GXJQ51NPx/iwiFIcjZPNBUN+PAIcupGPZrc0Ldy5l2IQj0UuA91kNz9e75
         FxFw==
X-Gm-Message-State: AOAM532kaTTqKDreWt72Hpv8BGSSYb6BGtDFaPAFV9A43kAcWVnaRuIx
        3DWMtJ+BjrmNv0zz1RDmjMjbhOiPbUErAz1GcuKBSdWSJntwWr9Gnv3wCnUCe4s47PIqpT9jc/W
        iKeh5Z1Y5MHZQQcIQPyrf/2s=
X-Received: by 2002:a17:906:d54e:: with SMTP id cr14mr15920391ejc.527.1642410527972;
        Mon, 17 Jan 2022 01:08:47 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwvwd/6SYaUs88+PunBhCPvnI0EorOQA/P4dO8yOYx3DEpXdTek9FzJWwgjdA3oF+nGHuY2gw==
X-Received: by 2002:a17:906:d54e:: with SMTP id cr14mr15920364ejc.527.1642410527632;
        Mon, 17 Jan 2022 01:08:47 -0800 (PST)
Received: from ?IPV6:2001:1c00:c1e:bf00:1db8:22d3:1bc9:8ca1? (2001-1c00-0c1e-bf00-1db8-22d3-1bc9-8ca1.cable.dynamic.v6.ziggo.nl. [2001:1c00:c1e:bf00:1db8:22d3:1bc9:8ca1])
        by smtp.gmail.com with ESMTPSA id t14sm647141edq.24.2022.01.17.01.08.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 17 Jan 2022 01:08:47 -0800 (PST)
Message-ID: <cf3c89a5-f242-2c1f-f636-fd3241b18ff1@redhat.com>
Date:   Mon, 17 Jan 2022 10:08:46 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Subject: Re: Touchpad stickiness on AMD laptops (was Dell Inspiron/XPS)
Content-Language: en-US
To:     =?UTF-8?Q?Miroslav_Bend=c3=adk?= <miroslav@wisdomtech.sk>,
        "Limonciello, Mario" <Mario.Limonciello@amd.com>,
        Wolfram Sang <wsa@kernel.org>,
        Benjamin Tissoires <btissoir@redhat.com>,
        Andrea Ippolito <andrea.ippo@gmail.com>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Alex Hung <alex.hung@canonical.com>,
        Linux I2C <linux-i2c@vger.kernel.org>,
        "open list:HID CORE LAYER" <linux-input@vger.kernel.org>,
        Platform Driver <platform-driver-x86@vger.kernel.org>,
        "Shah, Nehal-bakulchandra" <Nehal-bakulchandra.Shah@amd.com>
References: <CAGhUXvBw4rzCQrqttyyS=Psxmhppk79c6fDoxPbV91jE7fO_9A@mail.gmail.com>
 <CAGhUXvDNj2v3O==+wWWKPYVzej8Vq+WNiBtPwmYxSQ2dTuLb9Q@mail.gmail.com>
 <CAGhUXvC8eHfxEKzkGN06VvRU6Z0ko7MJ9hF6uXNq+PxRZSbEmQ@mail.gmail.com>
 <70cbe360-6385-2536-32bd-ae803517d2b2@redhat.com> <YdbrLz3tU4ohANDk@ninjato>
 <42c83ec8-bbac-85e2-9ab5-87e59a679f95@redhat.com>
 <CAO-hwJJ9ALxpd5oRU8SQ3F65hZjDitR=MzmwDk=uiEguaXZYtw@mail.gmail.com>
 <5409e747-0c51-24e2-7ffa-7dd9c8a7aec7@amd.com> <Yd6SRl7sm8zS85Al@ninjato>
 <596d6af1-d67c-b9aa-0496-bd898350865c@wisdomtech.sk>
 <d39101a9-adc6-df32-12f5-fccc8fd34515@amd.com>
 <5c0ed06a-617e-077a-a4a4-549e91d372ba@wisdomtech.sk>
 <BL1PR12MB5157412781B6C84B97C2A3E7E2559@BL1PR12MB5157.namprd12.prod.outlook.com>
 <541865be-207d-01db-efc4-7eff600d56dc@wisdomtech.sk>
From:   Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <541865be-207d-01db-efc4-7eff600d56dc@wisdomtech.sk>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Hi,

On 1/17/22 09:39, Miroslav Bendík wrote:
>> [AMD Official Use Only]
>>
>>> Now i am trying to change ASF registers instead of SMBus registers.
>>> I have tried to enable interrupts and set listen address, but it don't
>>> work or
>>> i can't recognize the difference between interrupts generated by
>>> transfers and
>>> interrupts generated from slave.
>> Try reading the value of SFx0A ASFStatus bit 5 (it's write to clear if it's an interrupt).
>>
>>> outb_p(0x02, 0x15 + piix4_smba); // SlaveIntrListenEn
>>> outb_p(0x2c << 1 | 0x01, 0x09 + piix4_smba); // ListenAdr | ListenAdrEn
>> ASFx04 SlaveAddress instead of  ASFx09 ListenAdr
>> ?
>>
>>
> Little bit more informations:
> 
> Interrupts are generated only if ASFx09 ListenAdr is:
> 
> (0x08 << 1) | 0x01
> (0x10 << 1) | 0x01
> 
> and touchpad is initialized with synaptics_intertouch=1
> 
> There is maybe small correlation between frequency and touch, but i am
> not 100% sure.

I know very litlle about this, but I believe that when using
host-notify that after receiving the host-notify you are supposed to
do an I2C read from the SMBus Alert Response Address (ARA, 0x0c) to find
out the source of the notify (since multiple devices on the bus may
be notify capable). I guess that the controller may not do that itself
and that as long as you have not done it the touchpad may keep repeating
the notify.

But as said I know very little about this, so take this with a big
grain of salt :)  I guess you may want to read up a bit on how this
is supposed to work at the bus level. I believe that the SMBUS spec
is public.

Regards,

Hans




> 
> There are no register changed in interrupt handler except of
> ASFx13 DataBankSel. I can't determine if interrupt is generated from
> transfer, or from external event.
> 
> ASF should be system for remote management. It should have access to
> SMBus and data / command registers are identical, this means, that SMBus
> should work (except block transfers).
> 
> If ASF just mirrors SMBus, then question is, why i can't access to
> touchpad using SMBus? One strange thing is, that i2cdetect on standard
> SMbus (0xb00), port 0 returns:
> 
>      0  1  2  3  4  5  6  7  8  9  a  b  c  d  e  f
> 00:                         -- -- -- -- -- -- -- --
> 10: -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --
> 20: -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --
> 30: -- -- -- -- -- -- 36 37 -- -- -- -- -- -- -- --
> 40: -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --
> 50: 50 -- -- -- -- -- -- -- 58 -- -- -- -- -- -- --
> 60: -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --
> 70: -- -- -- -- -- -- -- --
> 
> Address 0x58 is exactly 0x2c (synaptics) moved 1 bit left, but i2c-piix4
> correctly moves address.
> 

