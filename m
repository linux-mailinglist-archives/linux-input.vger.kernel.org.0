Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 8F880BF3DF
	for <lists+linux-input@lfdr.de>; Thu, 26 Sep 2019 15:16:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725836AbfIZNQ3 convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-input@lfdr.de>); Thu, 26 Sep 2019 09:16:29 -0400
Received: from youngberry.canonical.com ([91.189.89.112]:57634 "EHLO
        youngberry.canonical.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726759AbfIZNQ3 (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Thu, 26 Sep 2019 09:16:29 -0400
Received: from mail-pl1-f198.google.com ([209.85.214.198])
        by youngberry.canonical.com with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
        (Exim 4.86_2)
        (envelope-from <kai.heng.feng@canonical.com>)
        id 1iDTdD-0005fd-U3
        for linux-input@vger.kernel.org; Thu, 26 Sep 2019 13:16:28 +0000
Received: by mail-pl1-f198.google.com with SMTP id j9so1465864plk.21
        for <linux-input@vger.kernel.org>; Thu, 26 Sep 2019 06:16:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:subject:from:in-reply-to:date:cc
         :content-transfer-encoding:message-id:references:to;
        bh=/7n0aExf+ohBQd8Re0udWuq4nAX+jLuonye3u/w2AKA=;
        b=d5ZJn1shGXfWW8GxPHbwkrMDy9iUnouH41sXvw+Wx212VyVBtdr7QnI11IfLNInduK
         pA+och0cd583HFpq4kVM2293/W2AaLcVu8wr90UBfqx/bN2kFaLiCsVPmwBNCmpA/k6A
         O+b1T+L4uwcmoryt3cnkGx+zbKdQnp/3rZ4lb22VIBZ6GwLzUtI/q+/ge3HcRu8BUGJo
         dAEC+YkSnFcl9zmXd49xQGY2OPj8d9CluqG/JxknHMHA3FRD7vW1oEgGgAs0thEeAiKi
         Khg2dyDkfCCIgrMxtmRsvudK1thuXJ1vW0XBncMYrvyc+QXoapzDfzr8v8qK2wbNGQ0U
         Z15w==
X-Gm-Message-State: APjAAAXfjDCIaCsLmByovJ6+uJfc/1zWQSC64Np2uqWBirprQ6NEIl5j
        KeVT9NNCUYdQumh0rr2g8T/mFFKLnORAF26RED+BC8HxSpG7yUfRq653CUk6vsd78UISg4NSf+C
        m1VsBz5zcYzFL+a3AbY2U4ZUeKTdjOi0SIB9ZieuN
X-Received: by 2002:a63:eb4c:: with SMTP id b12mr3019406pgk.1.1569503786499;
        Thu, 26 Sep 2019 06:16:26 -0700 (PDT)
X-Google-Smtp-Source: APXvYqyxR572L9wT2uhQu3ZencnIZunvS1CHkt7+1Gyua36sW2ZsZ+5jlVY4xrv/SFXNFyiuPRD2NA==
X-Received: by 2002:a63:eb4c:: with SMTP id b12mr3019364pgk.1.1569503786039;
        Thu, 26 Sep 2019 06:16:26 -0700 (PDT)
Received: from 2001-b011-380f-3c42-b03c-a31c-0ec4-aab6.dynamic-ip6.hinet.net (2001-b011-380f-3c42-b03c-a31c-0ec4-aab6.dynamic-ip6.hinet.net. [2001:b011:380f:3c42:b03c:a31c:ec4:aab6])
        by smtp.gmail.com with ESMTPSA id g24sm2890623pfi.81.2019.09.26.06.16.24
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 26 Sep 2019 06:16:25 -0700 (PDT)
Content-Type: text/plain;
        charset=utf-8
Mime-Version: 1.0 (Mac OS X Mail 13.0 \(3594.4.13\))
Subject: Re: Elantech touchpad breaks with older HP model
From:   Kai-Heng Feng <kai.heng.feng@canonical.com>
In-Reply-To: <CAO-hwJJVrxuNHZE5zi-2CnTRCie6gCQOgG3jCtB=gBPkYNoptw@mail.gmail.com>
Date:   Thu, 26 Sep 2019 21:16:22 +0800
Cc:     rility <rility3@gmail.com>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        "open list:HID CORE LAYER" <linux-input@vger.kernel.org>
Content-Transfer-Encoding: 8BIT
Message-Id: <25BA7250-B232-4D26-ABDA-5CB99FF73768@canonical.com>
References: <fe524920-8476-540c-1b58-52c3b8b6a92d@gmail.com>
 <56C50F68-7DD6-443D-9034-5FEA19C373B7@canonical.com>
 <CAO-hwJJVrxuNHZE5zi-2CnTRCie6gCQOgG3jCtB=gBPkYNoptw@mail.gmail.com>
To:     Benjamin Tissoires <benjamin.tissoires@redhat.com>,
        =?utf-8?B?5buW5bSH5qau?= <kt.liao@emc.com.tw>
X-Mailer: Apple Mail (2.3594.4.13)
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

[+cc KT Liao]

Hi Benjamin,

> On Sep 26, 2019, at 18:01, Benjamin Tissoires <benjamin.tissoires@redhat.com> wrote:
> 
> Hi Kai-Heng,
> 
> On Wed, Sep 25, 2019 at 8:08 PM Kai-Heng Feng
> <kai.heng.feng@canonical.com> wrote:
>> 
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
>> 
>> So using dmi_get_bios_year() as manufacturing date is inaccurate.
> 
> indeed. Not something I expected. But it kind of makes sense now :/
> 
>> 
>>> 
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
>> 
>> Do you think it’s a bug we should work on, or we should simply blacklist affected touchpad?
>> 
> 
> It *really* looks like the touchpad is not supposed to be used under
> SMBus. There is however a (non successful) patch I wrote for an other
> HP laptop at https://bugzilla.kernel.org/show_bug.cgi?id=204771
> 
> Rility, can you apply
> v2-0001-Input-elan-also-provide-the-product-ID-from-PS-2-.patch in the
> bug report above and report if this helps?

Hopefully your patch can help.

> 
> Blacklist IMO is never going to scale, because even if BIOS updates
> after a couple of years are not that common, but that also means we
> accidentally break touchpads randomly,

I don’t think whitelist can scale in this case. There are several HP laptops need to use SMBus instead of psmouse.

> 
> If the patch mentioned above doesn't really helps, I would rather
> revert the commit introducing the dmi_get_bios_year() in elantech.c,
> and add manually the devices that can be tested one by one.

KT, can you share how Windows driver handles this situation? Is a blacklist or a whitelist in use?

Kai-Heng

> 
> Cheers,
> Benjamin
> 
>> Kai-Heng
>> 
>>> 
>>> 
>>> 
>>> 
>>> While with the previous version of kernel.
>>> 
>>> 
>>> ~ sudo dmesg | grep elan -i
>>> [    4.193067] psmouse serio1: elantech: assuming hardware version 4 (with firmware version 0x5e0f01)
>>> [    4.208056] psmouse serio1: elantech: Synaptics capabilities query result 0x70, 0x16, 0x0a.
>>> [    4.223009] psmouse serio1: elantech: Elan sample query result 0b, 01, a7
>>> [    4.302361] input: ETPS/2 Elantech Touchpad as /devices/platform/i8042/serio1/input/input27
>>> 
>>> 
>>> 
>>> ~ lspci
>>> 00:00.0 Host bridge: Intel Corporation Xeon E3-1200 v5/E3-1500 v5/6th Gen Core Processor Host Bridge/DRAM Registers (rev 08)
>>> 00:02.0 VGA compatible controller: Intel Corporation Skylake GT2 [HD Graphics 520] (rev 07)
>>> 00:04.0 Signal processing controller: Intel Corporation Xeon E3-1200 v5/E3-1500 v5/6th Gen Core Processor Thermal Subsystem (rev 08)
>>> 00:14.0 USB controller: Intel Corporation Sunrise Point-LP USB 3.0 xHCI Controller (rev 21)
>>> 00:14.2 Signal processing controller: Intel Corporation Sunrise Point-LP Thermal subsystem (rev 21)
>>> 00:16.0 Communication controller: Intel Corporation Sunrise Point-LP CSME HECI #1 (rev 21)
>>> 00:17.0 SATA controller: Intel Corporation Sunrise Point-LP SATA Controller [AHCI mode] (rev 21)
>>> 00:1c.0 PCI bridge: Intel Corporation Sunrise Point-LP PCI Express Root Port #1 (rev f1)
>>> 00:1c.4 PCI bridge: Intel Corporation Sunrise Point-LP PCI Express Root Port #5 (rev f1)
>>> 00:1c.5 PCI bridge: Intel Corporation Sunrise Point-LP PCI Express Root Port #6 (rev f1)
>>> 00:1f.0 ISA bridge: Intel Corporation Sunrise Point-LP LPC Controller (rev 21)
>>> 00:1f.2 Memory controller: Intel Corporation Sunrise Point-LP PMC (rev 21)
>>> 00:1f.3 Audio device: Intel Corporation Sunrise Point-LP HD Audio (rev 21)
>>> 00:1f.4 SMBus: Intel Corporation Sunrise Point-LP SMBus (rev 21)
>>> 
>>> 
>>> ```
>>> 
>>> 
>>> 
>>> Grateful,
>>> 
>>> Rility

