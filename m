Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CDE25239CE2
	for <lists+linux-input@lfdr.de>; Mon,  3 Aug 2020 00:50:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726968AbgHBWuW (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Sun, 2 Aug 2020 18:50:22 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58056 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726841AbgHBWuW (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Sun, 2 Aug 2020 18:50:22 -0400
Received: from mail-pj1-x1041.google.com (mail-pj1-x1041.google.com [IPv6:2607:f8b0:4864:20::1041])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2E598C06174A
        for <linux-input@vger.kernel.org>; Sun,  2 Aug 2020 15:50:22 -0700 (PDT)
Received: by mail-pj1-x1041.google.com with SMTP id ep8so1068743pjb.3
        for <linux-input@vger.kernel.org>; Sun, 02 Aug 2020 15:50:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=cHkqUZy+yIt7raPhCf2fIfBGLjBJ16Jc00rQTBopIug=;
        b=mvmeZjb39vX+cZkTM+ZqWGaClCmIwmLjZOlUK1wJXHIyTt5fWLSjXMYLMrV+4VKlpa
         dGS58+zpLfR/Hf6YUVO3C+DRYlYghFO1gni+VcI6CmdR7BEGGf9KrvJ/lrynBJAaBd5Y
         UZB/pf3H0MAcs2XLQLEAqRQ+BWotdYvQPfprQeIyVMChSaLZUXL7vHkNwy4Sq6+7c3Ya
         Zy7vCIyjVkDHQZFtRvdYwO61BRLmABooK+2CPCxtIGW8K75MUMXUihxTGve1QdMMMFOe
         T6kZNsOGEY5VukdkczBhnyS+eyanM0IigqkpT1QW76aak5e6ZkXTj/vBY9TJ8NgC6mAw
         /WlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=cHkqUZy+yIt7raPhCf2fIfBGLjBJ16Jc00rQTBopIug=;
        b=pybOdk1RYyDMjwTNmxGMa0h6CmSUzmgK6thVJ4o5HpWdYPTAYmCV/DeU+r7yTLgk8t
         XQ0GuOMUDNW2kxQcfYiQQgl/m+jtPtpxCW5wtNhk8PaX2PhDk6Z80HxvBmM1QunqqNOD
         M0QKMXMCCy35ckml3xHROBHMkMdCKChtJMSSZT9FXmEWRzXK57RbCKa6R+UvgiQ1rjzB
         JkqWOGgAbeN/Ael1K3v+bA/5V7cjL3kpSHwwvH4Yw4AmOETp5g5dC2M90MTAOf1I5TDc
         qUD+tyqPxO8J3zpaCv3Mdlgo4eeiaZ+WeWH/eoT2BVoBKU29KoZrXYLFla5TJ/dKEgUQ
         hhQw==
X-Gm-Message-State: AOAM533W1jV9lZBj9dul/X0KJ4dhR3vw6ow/fQVn8YczRMUBWmTE9hKX
        +85BUMJIN2uGys0QDCXOPOg=
X-Google-Smtp-Source: ABdhPJxfdkN1DdAhkFWOK6C1d0Em7a7a7GV7XLgXFaiCH0s1dCkRnAMbzpw85Nv1NI1vcYweXA5tuw==
X-Received: by 2002:a17:902:aa84:: with SMTP id d4mr12207505plr.208.1596408621517;
        Sun, 02 Aug 2020 15:50:21 -0700 (PDT)
Received: from ?IPv6:2604:4080:1012:8d30:d41e:852f:649b:7856? ([2604:4080:1012:8d30:d41e:852f:649b:7856])
        by smtp.gmail.com with ESMTPSA id t10sm14724236pga.73.2020.08.02.15.50.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 02 Aug 2020 15:50:20 -0700 (PDT)
Subject: Re: [PATCH] Input: xpad: Remove a conflicting Razer Sabertooth using
 the VID/PID for the Razer DeathAdder 2013 mouse
To:     Swyter <swyterzone@gmail.com>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc:     linux-input@vger.kernel.org,
        Benjamin Valentin <benpicco@zedat.fu-berlin.de>
References: <b9e7cb27-1866-83bb-b453-ae265ab6bde6@gmail.com>
 <a66472a1-b07a-169c-20dc-6d5e51d4d3bc@gmail.com>
 <a6fd180e-a915-1eef-5d8d-8e260cb3c709@gmail.com>
From:   Cameron Gutman <aicommander@gmail.com>
Message-ID: <f4f0fa65-3950-249e-c183-4dd632326c91@gmail.com>
Date:   Sun, 2 Aug 2020 15:50:20 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <a6fd180e-a915-1eef-5d8d-8e260cb3c709@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On 7/30/20 11:14 PM, Swyter wrote:
> On 31/07/2020 7:54, Cameron Gutman wrote:
>> On 7/30/20 8:44 AM, Ismael Ferreras Morezuelas wrote:
>>> -	{ 0x1532, 0x0037, "Razer Sabertooth", 0, XTYPE_XBOX360 },
>>>
>>
>> The list here doesn't actually affect which devices that xpad will attach to.
>> xpad_table[] is what determines the devices that xpad's probe() will be
>> called for. It does this using the VID + vendor-defined interface subclass
>> and interface number, not the VID+PID combos. xpad_device[] just provides a
>> friendly name and quirk flags for some supported gamepads. Gamepads that
>> aren't in the list will just show up as "Generic X-Box pad" with no quirk
>> flags applied.
>>
>> If 1532:0037 is actually a mouse, it's unlikely we'd even reach the probe()
>> in the first place. The device would lack the expected vendor-defined Xbox
>> interface that is required for xpad to attach to the device.
>>
>> All that said, I'm definitely not opposed to removing the entry if it isn't
>> a real gamepad. Given the difficulty you had finding information about this
>> device, I take it you don't have any 'lsusb -v' output for this device, right?
>>
>> Regards,
>> Cameron
>>
> 
> Hi, Cameron. Yeah, the main idea is to clean the list, even if as you say it hasn't
> caused mouse issues and that's why probably nobody has noticed it before.
> 
> Because, for some reason, everyone assumes some kind of correctness even when most of
> these are community-sourced and self-reported, everyone copies these lists from
> somewhere else. Hopefully the fixes will trickle downstream.
> 
> So yeah, I know for sure that (for example) the internal list Valve uses comes right from here:
> https://hg.libsdl.org/SDL/file/7d94464f10f7/src/joystick/controller_type.h#l246
> 
> (It's commented out)
> 
> Actual change referencing this kernel issue:
> https://hg.libsdl.org/SDL/rev/29809f6f0271
> 
> For more information of the device, take a look here:
> https://github.com/xboxdrv/xboxdrv/pull/59
> 
> You can see a lsusb dump here: https://github.com/xboxdrv/xboxdrv/files/76581/Qa6dBcrv.txt
> 
> So yeah, let me know what you guys think. This has been a weird tangent for me. :)
> 

Yep, that device definitely isn't an Xbox controller. That's for sure.

We wouldn't reach xpad_probe(), but it's a good idea to get rid of it anyway
to ensure that other projects using the our list won't be misled like SDL was.

On the off chance Razer did release an Xbox gamepad with that VID/PID, we'll
still enumerate it properly in xpad using the generic controller codepath.

So this patch looks good to me.

Reviewed-by: Cameron Gutman <aicommander@gmail.com>


Regards,
Cameron

