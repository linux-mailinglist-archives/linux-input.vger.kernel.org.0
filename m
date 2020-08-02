Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 76465239CFE
	for <lists+linux-input@lfdr.de>; Mon,  3 Aug 2020 01:41:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726963AbgHBXli (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Sun, 2 Aug 2020 19:41:38 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37614 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726797AbgHBXli (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Sun, 2 Aug 2020 19:41:38 -0400
Received: from mail-pl1-x644.google.com (mail-pl1-x644.google.com [IPv6:2607:f8b0:4864:20::644])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 06137C06174A;
        Sun,  2 Aug 2020 16:41:37 -0700 (PDT)
Received: by mail-pl1-x644.google.com with SMTP id w19so6861104plq.3;
        Sun, 02 Aug 2020 16:41:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=jGI41XB81DAOy+x4mHr8zcuL2LpI3mspZKnBVCKoWZg=;
        b=lWLGTETZwJK1Wi3nJpuD5Vzlpd5UZvtLDpZW2wHZ/bagPG2bup2srOV740P4mv0zyQ
         2YflFr7Y/TfDItVILZJEcyTSrb6OmD8Fwo5JgBXk2WJAovL5PfhKyzJ5HoG87ohJKJWo
         KCqPEaJBcKZTCj6Cb1r8ZXUNixfwVoIOzkJ+0zmiZ+5CZrVIaP0DMMgFpEe4UtrMzsbo
         8BU1qZH4KMv3gIK8apuoMutZs4HzzN4f1ChGaN06wTDUpTvz6qwDJZchN3Xhy3iPyCut
         DOwAAhCyJilDbnlOviJiCNAFdcxAB9VikfFExDYR2PzRd8fkUyehS06ri1fk7t0zeUTJ
         PQaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=jGI41XB81DAOy+x4mHr8zcuL2LpI3mspZKnBVCKoWZg=;
        b=IIp0BdfAudMqTU0xiZVsBd0MT6EcL7Y222HQFs+cvy037xr44o3b/pvXUGJPzEAwlY
         hfrWDr9RTFfQZGZGbpgK77xI/RJIbYqUKSubRGAXgn4uXyuhrw3rIQ/e3C/Jbyrw4NXu
         eJmDo9DS1Ga0fE4Y41BnenhAZzYxsHiF4/9yP0vsfP+62LwD6dWajpoUUFy/phyCXj3c
         mFR7ccRdsJgRNGZNyifGJ9VhdlKHYlmvO4oY0PbVShH3BBwjBl1tUK5mJam1gZUoKGA8
         03mTJnc1qLkt5VPenyt6iS8tlSXozlvxvl17SH3PABzb4uLvXYpjFWsHeThy9RzYvSw5
         sH7A==
X-Gm-Message-State: AOAM5330si7VWNVjUnv9z3OUDS3n9U58JSscAQb2VfCr2znlYScF3XyG
        gRUWlr9Q042CrPALnRyYSHjXJHVrcnHPfA==
X-Google-Smtp-Source: ABdhPJwajcpCi15Y3pT3yEzW0qcT4bbh5tIoONKxIGx0jY3xuZWnPC1wVvjNT4nFG9p5LmhexCpcmg==
X-Received: by 2002:a17:902:2:: with SMTP id 2mr12672438pla.288.1596411696894;
        Sun, 02 Aug 2020 16:41:36 -0700 (PDT)
Received: from ?IPv6:2604:4080:1012:8d30:d41e:852f:649b:7856? ([2604:4080:1012:8d30:d41e:852f:649b:7856])
        by smtp.gmail.com with ESMTPSA id c17sm13023940pfp.214.2020.08.02.16.41.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 02 Aug 2020 16:41:36 -0700 (PDT)
Subject: Re: [PATCH] Input: xpad: Spelling fixes for "Xbox", improve and
 proofread the listed xpad device names
To:     Swyter <swyterzone@gmail.com>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc:     linux-input@vger.kernel.org, Jonathan Corbet <corbet@lwn.net>,
        linux-doc@vger.kernel.org
References: <e864b39b-27e0-c6f2-76e8-db465916f310@gmail.com>
 <60d8977a-159f-f2c5-e0c1-7691fb5b2571@gmail.com>
 <407164a2-0762-8b27-065b-27378f881327@gmail.com>
From:   Cameron Gutman <aicommander@gmail.com>
Message-ID: <d6cf6ad7-ef97-baf2-6326-cd022a695e95@gmail.com>
Date:   Sun, 2 Aug 2020 16:41:35 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <407164a2-0762-8b27-065b-27378f881327@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On 7/30/20 11:54 PM, Swyter wrote:
> On 31/07/2020 8:33, Cameron Gutman wrote:
>>> While doing my research I also noticed that the 1532:0037 VID/PID seems to
>>> be used by the DeathAdder 2013, so that Razer Sabertooth instance looks
>>> wrong and very suspect to me, I created a separate patch for that.
>>
>> The above sentence probably doesn't belong in the commit message.
>>
> 
> Fair enough, I should probably turn that into "reviewer" notes.
> I think I mentioned it because I didn't update that bad entry.
> 
> Thinking it would be deleted soon. But good point.
> 
> 
>> The docs and comment changes look fine to me.
> 
> Great, I was a bit wary about this.
> 
> 
>> I'm somewhat concerned about the possibility of breaking userspace by changing
>> names. Some programs' gamepad mappings may be dependent on matching the device
>> names, rather than the VID+PID.
>>
>> For example, Android did not expose the VID and PID for input devices until
>> Android 4.4. The device name was the only available attribute for matching
>> gamepads from Android 2.3 to 4.3. While these ancient Android version will
>> almost certainly never run a kernel with this patch, I worry about the
>> possibility of apps that haven't moved to VID+PID matching (and not just for
>> Android; I don't know if other libraries or frameworks have/had similar
>> limitations).
>>
>> Perhaps my concerns are overblown, but If we aren't worried about changing
>> names, I'd really prefer to just drop the hardcoded names entirely and use the
>> manufacturer and product strings provided in the USB string descriptors. The
>> device list would turn into a quirk list where only device entries with a
>> special mapping flag like MAP_DPAD_TO_BUTTONS or MAP_TRIGGERS_TO_BUTTONS would
>> remain, and the device name strings would just become comments on each quirk
>> entry.
>>
>> Thoughts?
>>
>>
>>
>>
>> Regards,
>> Cameron
>>
> 
> I don't doubt that changing some names will break some basic rule matching.
> 
> But given that the kernel nomenclature is so inconsistent, I think anyone searching
> for "X-Box" and five other variants will also have to search for the actual "Xbox",
> or at least I hope so. Keep in mind that I have tried to make each overhauled entry
> *more* detailed when possible. So now each model has extra information (mainly
> manufacturer and button-layout type) instead only some vague/informal model name.
> 
> SDL2 and Unity abstract these things a bit. I actually implement similar strings
> checks in my own game/engine as fallback and it's exactly what I ended up doing.
> 
> I generally don't trust device strings, they'll be less detailed than these.
> A good bunch of those are unlicensed, so they'll be wrong or missing.
> 
> Let me know what you think.
> 

I agree that the changes look like an improvement. I also doubt that we'll ever
be able to prove definitively that there aren't programs out that taking a
dependency on the exact names of the gamepads in the list.

I guess one could also make the argument that adding a gamepad to this list
would have the same effect of possibly breaking userspace programs that used to
identify it via the "Generic X-box Pad" string. Those programs would need to
have the flexibility to handle receiving the generic name or a specific name
from our list, so maybe they're already robust enough to handle not matching on
one of the names they're expecting.

Dmitry, what are your thoughts about possible userspace breakage from updating
input device names? Has a similar change been done successfully before?


Regards,
Cameron
