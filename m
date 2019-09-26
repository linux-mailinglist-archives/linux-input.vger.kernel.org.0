Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id DB2BDBF616
	for <lists+linux-input@lfdr.de>; Thu, 26 Sep 2019 17:42:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726991AbfIZPmK (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 26 Sep 2019 11:42:10 -0400
Received: from mail-pl1-f193.google.com ([209.85.214.193]:45297 "EHLO
        mail-pl1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726845AbfIZPmK (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Thu, 26 Sep 2019 11:42:10 -0400
Received: by mail-pl1-f193.google.com with SMTP id u12so1210320pls.12
        for <linux-input@vger.kernel.org>; Thu, 26 Sep 2019 08:42:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:references:from:cc:message-id:date:user-agent
         :mime-version:in-reply-to:content-transfer-encoding:content-language;
        bh=KMIyGePZlA3mCHLctcIRPk5s2gGHtO4IzK8C2lBaObU=;
        b=k4izAMx7XSdLj3F7KSEp2P31b5utzSAZ7KRwg/+IIt8C8P+/lYGw2koj8ozVHP5nSK
         CSBFK4A4nb2KBjomHYSgfNGI+YKXwwXCJ5UlavMDSGBNsXiOIIMtdkc9oSkrsoyzR0z/
         KyljXdXYDRuI38SMIj1m6fBMWRnyf1Zm7PkHs1RGKkg4jYAZlj4Dd7veyYhNmoKP6sF2
         mNaVMSdZoV0hLsm76810YjlfSBQfuZFlJe1VcisV4zheWenOx7SviMf4DIZH09vjeqKj
         hgbd4CYKS5pORux8w8ETqWiA9sVT+bgDayeq/JoioOdJeTdhxtDBeJiQdIAtzQKMXbLm
         UwCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:references:from:cc:message-id:date
         :user-agent:mime-version:in-reply-to:content-transfer-encoding
         :content-language;
        bh=KMIyGePZlA3mCHLctcIRPk5s2gGHtO4IzK8C2lBaObU=;
        b=ULBjnLTLfEWVFhb9kFVnRUK5LoNbdVPQ2HpbQ45KGpxlYimWhJF4X7KKaRrSucfGL9
         KFIEiOJrYk9vsOeG9wZ54gPeteYKTUZW164ODbvtjPv3ORh2a5wrWvVUv3JmzAKnGYcp
         vPGlluCBxUnu6HMHENJvK8rqtAM5vrqtz0yHsaZv4jT1bEjGczDic7Kzns4rCaK5milT
         TMPUja8Qr4Odsukqv+M915LPPCNBJifJ2zvjjIuQr4h+xDjA3a+lUn8DX3mQdKHef61y
         7W21qjzPf0ivSvSVG61kjwSRPSo/dwMSsNPz00UC+HPYbMRhaVQg0noYHI84DBFn3403
         I1vA==
X-Gm-Message-State: APjAAAVqNTfdo65t7SC1C4Aja63juRxewe/JWn2vcLdQZexTCtUSlJaH
        rRBsJsj/aPkQwOf4MK6gtbIamFQ/SIaHdnPY
X-Google-Smtp-Source: APXvYqydEccCokZVs0FtKA3IZBtEFo56DUdkxIa033nvhDIALYmV95fynQnHflfaDEksXRSmbH5W4w==
X-Received: by 2002:a17:902:9044:: with SMTP id w4mr4397377plz.228.1569512528895;
        Thu, 26 Sep 2019 08:42:08 -0700 (PDT)
Received: from [0.0.0.0] ([140.238.42.76])
        by smtp.gmail.com with ESMTPSA id c8sm2319660pgw.37.2019.09.26.08.42.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 26 Sep 2019 08:42:08 -0700 (PDT)
Subject: Re: Elantech touchpad breaks with older HP model
To:     Benjamin Tissoires <benjamin.tissoires@redhat.com>
References: <fe524920-8476-540c-1b58-52c3b8b6a92d@gmail.com>
 <56C50F68-7DD6-443D-9034-5FEA19C373B7@canonical.com>
 <CAO-hwJJVrxuNHZE5zi-2CnTRCie6gCQOgG3jCtB=gBPkYNoptw@mail.gmail.com>
From:   rility <rility3@gmail.com>
Cc:     Kai-Heng Feng <kai.heng.feng@canonical.com>,
        linux-input@vger.kernel.org
Message-ID: <c8b04a3e-22e2-bc1f-bec2-24e7f2d10083@gmail.com>
Date:   Thu, 26 Sep 2019 23:41:56 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.1.0
MIME-Version: 1.0
In-Reply-To: <CAO-hwJJVrxuNHZE5zi-2CnTRCie6gCQOgG3jCtB=gBPkYNoptw@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org


On 9/26/19 6:01 PM, Benjamin Tissoires wrote:
> Hi Kai-Heng,
>
> On Wed, Sep 25, 2019 at 8:08 PM Kai-Heng Feng
> <kai.heng.feng@canonical.com> wrote:
>> [+cc Benjamin, linux-input]
>>
>> Hi Benjamin,
>>
>>> On Sep 26, 2019, at 00:00, rility <rility3@gmail.com> wrote:
>>>
>>> Hi Dmitry and Feng,
>>>
>>> I'm seeming to have some problem using my ELAN touchpad with later kernel with this commit [Input: elantech - enable SMBus on new (2018+) systems](https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux.git/commit/drivers/input/mouse?id=883a2a80f79ca5c0c105605fafabd1f3df99b34c).
>>>
>>> This ELAN touchpad fails to be detected. It's on a 2016 HP laptop model 340 G3, though I did update the BIOS this year.
>> So using dmi_get_bios_year() as manufacturing date is inaccurate.
> indeed. Not something I expected. But it kind of makes sense now :/
>
>>> I don't really have the first knowledge of kernel development, and am wondering if you can help out.
>>>
>>> ```
>>>
>>> With the latest 5.4.rc0
>>>
>>>
>>>
>>> ~ sudo dmesg | grep elan -i
>>>
>>> [    4.127896] psmouse serio1: elantech: assuming hardware version 4 (with firmware version 0x5e0f01)
>>> [    4.142887] psmouse serio1: elantech: Synaptics capabilities query result 0x70, 0x16, 0x0a.
>>> [    4.158366] psmouse serio1: elantech: Elan sample query result 0b, 01, a7
>>> [    4.191200] psmouse serio1: elantech: Trying to set up SMBus access
>>> [    4.198630] elan_i2c 0-0015: 0-0015 supply vcc not found, using dummy regulator
>>> [    4.202104] elan_i2c 0-0015: failed to get product ID: -6
>>> [    4.243786] elan_i2c 0-0015: failed to get product ID: -71
>>> [    4.287117] elan_i2c 0-0015: failed to get product ID: -71
>>> [    4.322734] elan_i2c: probe of 0-0015 failed with error -71
>> Do you think it’s a bug we should work on, or we should simply blacklist affected touchpad?
>>
> It *really* looks like the touchpad is not supposed to be used under
> SMBus. There is however a (non successful) patch I wrote for an other
> HP laptop at https://bugzilla.kernel.org/show_bug.cgi?id=204771
>
> Rility, can you apply
> v2-0001-Input-elan-also-provide-the-product-ID-from-PS-2-.patch in the
> bug report above and report if this helps?

I tested the patch applied on 5.4 and the touchpad still fails to start.

The logs are similar.

~ sudo dmesg | grep elan -i
[    4.191687] psmouse serio1: elantech: assuming hardware version 4 
(with firmware version 0x5e0f01)
[    4.206565] psmouse serio1: elantech: Synaptics capabilities query 
result 0x70, 0x16, 0x0a.
[    4.221495] psmouse serio1: elantech: Elan sample query result 0b, 01, a7
[    4.251876] psmouse serio1: elantech: Trying to set up SMBus access
[    4.310231] elan_i2c 0-0015: 0-0015 supply vcc not found, using dummy 
regulator
[    4.320552] elan_i2c 0-0015: failed to get product ID: -71
[    4.365460] elan_i2c 0-0015: failed to get product ID: -71
[    4.411115] elan_i2c 0-0015: failed to get product ID: -71
[    4.449716] elan_i2c: probe of 0-0015 failed with error -71

Rility

> Blacklist IMO is never going to scale, because even if BIOS updates
> after a couple of years are not that common, but that also means we
> accidentally break touchpads randomly,
>
> If the patch mentioned above doesn't really helps, I would rather
> revert the commit introducing the dmi_get_bios_year() in elantech.c,
> and add manually the devices that can be tested one by one.
>
> Cheers,
> Benjamin
>
>> Kai-Heng
>>
>>
>>
>> While with the previous version of kernel.
>>
>>
>> ~ sudo dmesg | grep elan -i
>> [    4.193067] psmouse serio1: elantech: assuming hardware version 4 (with firmware version 0x5e0f01)
>> [    4.208056] psmouse serio1: elantech: Synaptics capabilities query result 0x70, 0x16, 0x0a.
>> [    4.223009] psmouse serio1: elantech: Elan sample query result 0b, 01, a7
>> [    4.302361] input: ETPS/2 Elantech Touchpad as /devices/platform/i8042/serio1/input/input27
>>
>>
>>
>> ~ lspci
>> 00:00.0 Host bridge: Intel Corporation Xeon E3-1200 v5/E3-1500 v5/6th Gen Core Processor Host Bridge/DRAM Registers (rev 08)
>> 00:02.0 VGA compatible controller: Intel Corporation Skylake GT2 [HD Graphics 520] (rev 07)
>> 00:04.0 Signal processing controller: Intel Corporation Xeon E3-1200 v5/E3-1500 v5/6th Gen Core Processor Thermal Subsystem (rev 08)
>> 00:14.0 USB controller: Intel Corporation Sunrise Point-LP USB 3.0 xHCI Controller (rev 21)
>> 00:14.2 Signal processing controller: Intel Corporation Sunrise Point-LP Thermal subsystem (rev 21)
>> 00:16.0 Communication controller: Intel Corporation Sunrise Point-LP CSME HECI #1 (rev 21)
>> 00:17.0 SATA controller: Intel Corporation Sunrise Point-LP SATA Controller [AHCI mode] (rev 21)
>> 00:1c.0 PCI bridge: Intel Corporation Sunrise Point-LP PCI Express Root Port #1 (rev f1)
>> 00:1c.4 PCI bridge: Intel Corporation Sunrise Point-LP PCI Express Root Port #5 (rev f1)
>> 00:1c.5 PCI bridge: Intel Corporation Sunrise Point-LP PCI Express Root Port #6 (rev f1)
>> 00:1f.0 ISA bridge: Intel Corporation Sunrise Point-LP LPC Controller (rev 21)
>> 00:1f.2 Memory controller: Intel Corporation Sunrise Point-LP PMC (rev 21)
>> 00:1f.3 Audio device: Intel Corporation Sunrise Point-LP HD Audio (rev 21)
>> 00:1f.4 SMBus: Intel Corporation Sunrise Point-LP SMBus (rev 21)
>>
>> ```
>>
>> Grateful,
>>
>> Rility
>>
