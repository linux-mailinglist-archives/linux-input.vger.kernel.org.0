Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3A1AA61F2D7
	for <lists+linux-input@lfdr.de>; Mon,  7 Nov 2022 13:22:05 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232010AbiKGMWD (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 7 Nov 2022 07:22:03 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48276 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232128AbiKGMWA (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Mon, 7 Nov 2022 07:22:00 -0500
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DACA5D62
        for <linux-input@vger.kernel.org>; Mon,  7 Nov 2022 04:21:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1667823667;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=UcspqJApO0NOnS5NS4GdB0SX4RQjBxE7UoOSIEHHcKI=;
        b=eiV5DyEDmVPgpgrVqfb+AIUzMLpvso1RErEchIByYIGmA40eL7XkgMW4DQe0yYmQ4e+PL6
        S9T9Z1K4C7Rg1FLMWHEOYvOTuxZbQBosWc8H9ooEbrbgz5MuEekz6fvgwLKqWa5aC+60s+
        IQqs/a8rsck9GOuMn2KZECbYZIRZIU4=
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-97-ht_T277HOEWs5Fga1g4WWg-1; Mon, 07 Nov 2022 07:21:06 -0500
X-MC-Unique: ht_T277HOEWs5Fga1g4WWg-1
Received: by mail-ed1-f72.google.com with SMTP id b13-20020a056402350d00b00464175c3f1eso8215994edd.11
        for <linux-input@vger.kernel.org>; Mon, 07 Nov 2022 04:21:05 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=UcspqJApO0NOnS5NS4GdB0SX4RQjBxE7UoOSIEHHcKI=;
        b=6G41bbzE+rlZs1DJ8O+xQCgK9oH4p0DXYusrvRKpdIAlkib3iXEZtPF1mPtAJiN3zl
         CF+KMZP6SGR3MelpjyxCSlxlHHsRFgOHU+wYJjIwGp+xwkZj8jAuTH9VkMxuQiQ0Ymxv
         7pnEXtDW0C1EwrFzyzkrbNa/yvVgCyBm58V9XDBtbQ9BS30oP+HqxF92Gs1M/DOWzYpe
         f2JRHHkawvakjk3NAdZDbjYMybf284xd/+dkkCGuDsdfWReMpuu0tNN36qvYlKxNyEKc
         Usr0a8PA7iRtxetRchmmQZ06LQzqiusl5d81ZbkWPm8YUkjsEdwfRrRy2o+0RceUtAkn
         lH3Q==
X-Gm-Message-State: ACrzQf2ML2YO/b0N6c+Ekb5PyNi9bpP0CqWMsIh459nXNJQmgKFcn/qV
        6L/1Kfn1vaxssPQhubTg1nXPZGkyAyY4IqxdnVbdtWL1PsRHWMX10Dced1cNIk47QmPV/3I6Ich
        S4SrwqX8j9w2/QuuPdYgFC04=
X-Received: by 2002:aa7:dd57:0:b0:453:2d35:70bb with SMTP id o23-20020aa7dd57000000b004532d3570bbmr50676122edw.26.1667823664560;
        Mon, 07 Nov 2022 04:21:04 -0800 (PST)
X-Google-Smtp-Source: AMsMyM6acwTSAHhKPd/NL81CMMwuivR1LuHdu/Y9FBPag9bWdyJTVzmYPqa6LyAIeDoaqAY5KPnEVQ==
X-Received: by 2002:aa7:dd57:0:b0:453:2d35:70bb with SMTP id o23-20020aa7dd57000000b004532d3570bbmr50676106edw.26.1667823664349;
        Mon, 07 Nov 2022 04:21:04 -0800 (PST)
Received: from [10.40.98.142] ([78.108.130.194])
        by smtp.gmail.com with ESMTPSA id f26-20020a17090631da00b0078cb06c2ef9sm3340134ejf.8.2022.11.07.04.21.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 07 Nov 2022 04:21:03 -0800 (PST)
Message-ID: <a804b4e1-4a17-96f8-671b-4da0dad149b1@redhat.com>
Date:   Mon, 7 Nov 2022 13:21:02 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.1
Subject: Re: Detecting if a laptop is using a i2c/smbus or a ps/2 attached
 touchpad?
Content-Language: en-US
To:     Benjamin Tissoires <benjamin.tissoires@redhat.com>
Cc:     linux-input <linux-input@vger.kernel.org>,
        Manyi Li <limanyi@uniontech.com>
References: <ae50236e-1ce8-b526-9c17-7bc0463ebb86@redhat.com>
 <CAO-hwJJUdXb1iBN7AVushaJz9LawuaO5hP8GWKucWuxzDpnCTg@mail.gmail.com>
From:   Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <CAO-hwJJUdXb1iBN7AVushaJz9LawuaO5hP8GWKucWuxzDpnCTg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,
        RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_NONE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Hi,

On 11/7/22 11:52, Benjamin Tissoires wrote:
> Hi Hans,
> 
> On Mon, Nov 7, 2022 at 11:10 AM Hans de Goede <hdegoede@redhat.com> wrote:
>>
>> Hi Benjamin, et. al.,
>>
>> I have just merged a patch which adds a couple of DMI quirks to disable
>> the touchpad on/off functionality of the ideapad-laptop module on some models,
>> because it is causing issues there.
>>
>> Patch:      https://lore.kernel.org/platform-driver-x86/20221018095323.14591-1-limanyi@uniontech.com/
>> Discussion: https://lore.kernel.org/platform-driver-x86/fdceb6d2-c38c-e8ff-4c19-b01521ca46c0@redhat.com/
>>
>> Rather then using DMI quirks I would prefer to just disable it everywhere
>> where a i2c-attached touchpad is used. Be it either one only attached to
>> i2c, or one of the synaptics intertouch thingies. I'm still trying to
>> figure out why the ideapad-laptop module's touchpad control (which
>> uses the EC + enabling/disabling the i8042 aux-port) matters for
>> i2c-attached touchpads at all, so I suspect that intertouch might be
>> a part of it.
>>
>> So now I'm wondering if there is some nice way for the ideapad-laptop
>> code to check if the touchpad is intertouch and/or if it is i2c-attached
>> only ...
>>
>> Any ideas?
> 
> TL;DR: it's a complete mess.
> 
> For mostly UEFI/BIOS compatibility, all touchpads on modern laptops
> have a PS/2 interface.
> 
> But then, most of the touchpads (and of course not all) can also use
> I2C or SMBus to communicate.
> 
> And this is where things are bad:
> 
> - when using i2c-hid, there is a DT entry that enumerates the
> touchpad, but sometimes the manufacturers like to reuse the same DT
> and just enable/disable devices in it, so it's not easy to do.
> In the i2c-hid case, the PS/2 node has no idea it is not used anymore,
> and thus is kept up forever
> 
> - for touchpads using SMBus (on Intel platforms only currently), the
> enumeration is done at the PS/2 level: there is a byte that says that
> the touchpad supports another bus or not.
> This is valid for both Synaptics, and Elan, as you figured out.
> 
> But in the SMBus case there are many cases where it is not working: if
> the SMBus doesn't support Host Notify (AMD platforms), or if the
> enumeration is not working because the touchpad is not happy, etc...
> 
> So again, in SMBus, we can not disable the PS/2 nodes, because there
> is a high chance the touchpad will not work. Not to mention that the
> specific bit to enable the touchpad might also be required when coming
> back from suspend (not entirely sure though).
> 
> However, in the Synaptics SMbus case, we took a safer approach
> (because the SMBus driver is not standard and sometimes breaks on new
> hardware), so we are using the PnP ID to selectively enable the
> devices (see smbus_pnp_ids[] in drivers/input/mouse/synaptics.c)
> 
> In the Elan case, if the touchpad exports the magic bit, we forward it
> to SMBus as the driver is behaving better with new devices.
> 
> As a result, from user space, it's easier to know if the device uses
> smbus/i2c, simply because you can enumerate all devices.
> But from the kernel, either you have to look for the ACPI tables, and
> hope that the I2C bus is correctly supported in the system, or you
> have to talk over PS/2 and hope that the platform supports
> HostNotify...
> 
>>
>> Regards,
>>
>> Hans
>>
>> p.s.
>>
>> Is it possible that Elan touchpads use something similar to intertouch,
>> or is that a synaptics thing only (under Linux)  ?
>>
> 
> Yep, see above. If the touchpad says it can be driven through SMBus,
> we forward it.

Ok, thank you for the long answer.

I will try to find some generic solution on the ideapad-laptop driver
side. First of all we need to root cause which call in that driver
is exactly causing the touchpad to not work.

Regards,

hans

