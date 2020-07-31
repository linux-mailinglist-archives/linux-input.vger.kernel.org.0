Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6DCCB233F79
	for <lists+linux-input@lfdr.de>; Fri, 31 Jul 2020 08:55:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731511AbgGaGyu (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Fri, 31 Jul 2020 02:54:50 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37174 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731508AbgGaGyu (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Fri, 31 Jul 2020 02:54:50 -0400
Received: from mail-wr1-x443.google.com (mail-wr1-x443.google.com [IPv6:2a00:1450:4864:20::443])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F2D77C061574;
        Thu, 30 Jul 2020 23:54:49 -0700 (PDT)
Received: by mail-wr1-x443.google.com with SMTP id a5so17003099wrm.6;
        Thu, 30 Jul 2020 23:54:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=M3aBvvjjOLOv02wO8Xb9L+hWYarDkMBk5vQeoGNmsHM=;
        b=ncYKtddyFt7IVn56KlD4tfeVlsyTMOlg2zAvrwf8bkeX4hcmzyguK96neeQ5CsTtnu
         WdXbfMYxnXk8dJwcZcAdicFiQOVdwfSrqVPqAYGdfWvn7njgb6GGSkPucnNcCO2D66Um
         2hE/BdAYwgQ5jFOYsddIg+NvbRj5/UqfV0qJTEx8WbFcfiRzWzNUMov9n9EnQOepPaIp
         KeUi/rRkI5OPG5fr7LRtzg9bW7ODSj4LUSEQdgklzBYyMSCbE6SYqSqtWr68WkyHXNf1
         nIyV7t2ZGSrGPueaHNon9JLBZRtLgLUDI4yqjgaGorQ6Yj2Xq/oq3CXd3smo/KJBCbbJ
         U7ZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=M3aBvvjjOLOv02wO8Xb9L+hWYarDkMBk5vQeoGNmsHM=;
        b=lY2fptZM8uhHsrSq+13+q3qLd3/+LSiyLuIb2exGgq6ZszwrUHah74pYyM5H0BeY8l
         8PJAafsDm4zA8x4e67SLq4SAC6aH6NiWKvhSRbNDISAmkD54QuRX/X5hKgs/kztNSffl
         QEz32IMn13Gp5V+h4JOgREiOL/KXY67PellCNKODTVHSQrAMO0K7oU/eFtRy155x/KaG
         WxqpX6kWxfb0zH8bnwOk01ztUF25F2aKQn3/hvuaDiNLMVU4cm0wZC8sAx2BrwjLGYeK
         2xVYoC/GY4EoKU7YD90KVa7txfgyI5IfBGZr1CxnIM0NeuQ8lli02e2Ja5q2WNDiS/Pr
         AP3A==
X-Gm-Message-State: AOAM5318FIgi2nWSCq3o+g9DqZVzwqtZBp/Ex1SXItyh/HZXDGdK/BVR
        dr0gmcm8rIduN4o3J9EG3fpjW14iSVo=
X-Google-Smtp-Source: ABdhPJyr9eQTTWxaZAxAiyBiMSV7HAyXhwoOulgmIZlNjzHY30G+fjo0x1DPhe63msW+6i/eMp/OEQ==
X-Received: by 2002:a05:6000:8b:: with SMTP id m11mr2066400wrx.245.1596178488379;
        Thu, 30 Jul 2020 23:54:48 -0700 (PDT)
Received: from 168.52.45.77 (201.ip-51-68-45.eu. [51.68.45.201])
        by smtp.gmail.com with ESMTPSA id b142sm9007791wmd.19.2020.07.30.23.54.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 30 Jul 2020 23:54:47 -0700 (PDT)
Subject: Re: [PATCH] Input: xpad: Spelling fixes for "Xbox", improve and
 proofread the listed xpad device names
To:     Cameron Gutman <aicommander@gmail.com>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc:     linux-input@vger.kernel.org, Jonathan Corbet <corbet@lwn.net>,
        linux-doc@vger.kernel.org
References: <e864b39b-27e0-c6f2-76e8-db465916f310@gmail.com>
 <60d8977a-159f-f2c5-e0c1-7691fb5b2571@gmail.com>
From:   Swyter <swyterzone@gmail.com>
Message-ID: <407164a2-0762-8b27-065b-27378f881327@gmail.com>
Date:   Fri, 31 Jul 2020 08:54:44 +0200
User-Agent: nano 6.4
MIME-Version: 1.0
In-Reply-To: <60d8977a-159f-f2c5-e0c1-7691fb5b2571@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On 31/07/2020 8:33, Cameron Gutman wrote:
>> While doing my research I also noticed that the 1532:0037 VID/PID seems to
>> be used by the DeathAdder 2013, so that Razer Sabertooth instance looks
>> wrong and very suspect to me, I created a separate patch for that.
> 
> The above sentence probably doesn't belong in the commit message.
> 

Fair enough, I should probably turn that into "reviewer" notes.
I think I mentioned it because I didn't update that bad entry.

Thinking it would be deleted soon. But good point.


> The docs and comment changes look fine to me.

Great, I was a bit wary about this.


> I'm somewhat concerned about the possibility of breaking userspace by changing
> names. Some programs' gamepad mappings may be dependent on matching the device
> names, rather than the VID+PID.
> 
> For example, Android did not expose the VID and PID for input devices until
> Android 4.4. The device name was the only available attribute for matching
> gamepads from Android 2.3 to 4.3. While these ancient Android version will
> almost certainly never run a kernel with this patch, I worry about the
> possibility of apps that haven't moved to VID+PID matching (and not just for
> Android; I don't know if other libraries or frameworks have/had similar
> limitations).
> 
> Perhaps my concerns are overblown, but If we aren't worried about changing
> names, I'd really prefer to just drop the hardcoded names entirely and use the
> manufacturer and product strings provided in the USB string descriptors. The
> device list would turn into a quirk list where only device entries with a
> special mapping flag like MAP_DPAD_TO_BUTTONS or MAP_TRIGGERS_TO_BUTTONS would
> remain, and the device name strings would just become comments on each quirk
> entry.
> 
> Thoughts?
> 
> 
> 
> 
> Regards,
> Cameron
> 

I don't doubt that changing some names will break some basic rule matching.

But given that the kernel nomenclature is so inconsistent, I think anyone searching
for "X-Box" and five other variants will also have to search for the actual "Xbox",
or at least I hope so. Keep in mind that I have tried to make each overhauled entry
*more* detailed when possible. So now each model has extra information (mainly
manufacturer and button-layout type) instead only some vague/informal model name.

SDL2 and Unity abstract these things a bit. I actually implement similar strings
checks in my own game/engine as fallback and it's exactly what I ended up doing.

I generally don't trust device strings, they'll be less detailed than these.
A good bunch of those are unlicensed, so they'll be wrong or missing.

Let me know what you think.
