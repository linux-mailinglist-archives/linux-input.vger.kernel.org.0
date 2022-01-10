Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5D625489BAB
	for <lists+linux-input@lfdr.de>; Mon, 10 Jan 2022 15:58:19 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235788AbiAJO6S (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 10 Jan 2022 09:58:18 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:40017 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S235783AbiAJO6R (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Mon, 10 Jan 2022 09:58:17 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1641826697;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=ERqqiX8v12ma06sQOK+5EKzZdekhOuQdLo2VDgFl6xE=;
        b=PbkEQwh6swfxjoOr0gFodirkxs2QoZi1T/GlxYaUlcT8i+QDDXUnIDFpk3pfrdtNmHQaKv
        usDXtG5eSVkXe0ir2HGwd8KI9yfE67lIqlBGPZfZ3yYPm0hdDU2tPQwAZMcpV0vXLxCQ5K
        vxccK5M7ai+c9HiB4UHAXcQyLQNb6MY=
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-329-NKzdhJtoOPqP3qqZ8B9M4w-1; Mon, 10 Jan 2022 09:58:15 -0500
X-MC-Unique: NKzdhJtoOPqP3qqZ8B9M4w-1
Received: by mail-ed1-f69.google.com with SMTP id r8-20020a05640251c800b003f9a52daa3fso10313094edd.22
        for <linux-input@vger.kernel.org>; Mon, 10 Jan 2022 06:58:15 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=ERqqiX8v12ma06sQOK+5EKzZdekhOuQdLo2VDgFl6xE=;
        b=l8VOAJjLL9pPj3vypAIxo14lpEEWLDWtMBXbyXC6IUbHWVVwy2XhryPSGHhI9ewjaN
         efS/Tcwi7ahz2YuEPdqPvj7TCx2gO/XqXdclAc9wonVc68zh4uBf1xuIJ4YLfL1iL1J4
         qe7fZ77AO58VWilI+OQgmFjhNh41el6+JtCes43X/N4RgclabE4GFbcir+cvpr7w6Gjo
         I5ZjRajzZ9Y2gs9ubEVxuEgScjMa3+WNMc/WiUChpplw7woZbOglsOlOtSFSL6ZguiB9
         KTXXFktSaIKEDuqCHfFgTa3eIELaPSVDrfJQxVlabcdGo5/a59YvEgiCmLukdJqGYx/n
         aJMw==
X-Gm-Message-State: AOAM533YcBwL82OEjTIZn5oWiw7gUtWM/8jKDDgVXVDUTSypXzuRG9bG
        Z8nNfOhmSFz3gzm+luLQ/w4kHFIYAQ++1QGXbMfQDZpwD7UkNQhOst8fON06EB7c6lAu3V0ABrx
        kjpT4c3lQ1TQioILNPmG31CI=
X-Received: by 2002:a17:907:3f8b:: with SMTP id hr11mr101614ejc.57.1641826694518;
        Mon, 10 Jan 2022 06:58:14 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyGhMwyJ+cxNV8AtoxaqVoPVw4434c9YCKLonuevi16XMBHXOW98VDIZqVKzP557i/b9a6EjQ==
X-Received: by 2002:a17:907:3f8b:: with SMTP id hr11mr101603ejc.57.1641826694287;
        Mon, 10 Jan 2022 06:58:14 -0800 (PST)
Received: from ?IPV6:2001:1c00:c1e:bf00:1db8:22d3:1bc9:8ca1? (2001-1c00-0c1e-bf00-1db8-22d3-1bc9-8ca1.cable.dynamic.v6.ziggo.nl. [2001:1c00:c1e:bf00:1db8:22d3:1bc9:8ca1])
        by smtp.gmail.com with ESMTPSA id dd5sm2559620ejc.99.2022.01.10.06.58.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 10 Jan 2022 06:58:13 -0800 (PST)
Message-ID: <aa50d961-7861-5263-7f83-91ca201ac8b1@redhat.com>
Date:   Mon, 10 Jan 2022 15:58:13 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Subject: Re: [regression] Touchpad is not working after suspend to RAM since
 kernel 5.14 (fwd from b.k.o bug 214667)
Content-Language: en-US
To:     Jiri Kosina <jikos@kernel.org>,
        Thorsten Leemhuis <regressions@leemhuis.info>
Cc:     Benjamin Tissoires <benjamin.tissoires@redhat.com>,
        linux-input@vger.kernel.org,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        "regressions@lists.linux.dev" <regressions@lists.linux.dev>,
        casteyde.christian@free.fr
References: <12b9a10a-626b-cafd-05d6-cf0a116aa39b@leemhuis.info>
 <nycvar.YFH.7.76.2201101359080.28059@cbobk.fhfr.pm>
From:   Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <nycvar.YFH.7.76.2201101359080.28059@cbobk.fhfr.pm>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Hi,

On 1/10/22 14:00, Jiri Kosina wrote:
> On Tue, 28 Dec 2021, Thorsten Leemhuis wrote:
> 
>> Hi, this is your Linux kernel regression tracker speaking.
>>
>> Forwarding a regression reported by Christian Casteyde (CCed) in
>> bugzilla.kernel.org which apparently has fallen through the cracks.
>>
>> https://bugzilla.kernel.org/show_bug.cgi?id=214667

Thanks, I will respond to this in the bugzilla ticket.

Regards,

Hans




>>
>> A few quotes from comments in the ticket:
>>
>>> Since Kernel 5.14 (probably 5.14-rc5 indeed) the touchpad does not
>>> work anymore after resume from suspend to RAM. Was working with 5.13
>>> kernel.
>>>
>>> I've bisected the bug, first bad commit is: 
>>> b3e29642548258c7cd2cb3326a776fff84cd6b69 is the first bad commit
>>>
>>> SC[33mcommit b3e29642548258c7cd2cb3326a776fff84cd6b69ESC[m Merge:
>>> 8f4ef88 498d0dd Author: Jiri Kosina <jkosina@suse.cz> Date:   Wed Jun
>>> 30 09:15:15 2021 +0200
>>>
>>> Merge branch 'for-5.14/multitouch' into for-linus
>>>
>>> - patch series that ensures that hid-multitouch driver disables touch
>>> and button-press reporting on hid-mt devices during suspend when the
>>> device is not configured as a wakeup-source, from Hans de Goede
>>>
>>> Seem to be related with the observed behaviour.
>>
>> Yes, that's a merge, but it contains code changes, maybe something went
>> wrong there.
> 
> CCing Hans, as that merge commit brought his series "disable touch and 
> button-press during suspend" series.
> 
> It's strange though that bisection points to a merge commit and not a 
> commit in that series.
> 
>>
>>> Update with kernel 5.15-rc7
>>>
>>> Still present. However, I noticed dmesg ouput interesting messages
>>> telling there is a transfer from the ELAN touchpad while suspended,
>>> it failed to suspend, then failed to resume. The interesting thing is
>>> if I try to suspend a second time, at resume the touchpad manages to
>>> resume. Appending dmesg output for reference.
>>
>>
>>> The problem is still present in 5.16-rc7, but indeed it got worse
>>> (and indeed is now critical). a) After the first "suspend" tentative
>>> (closing the lid), the laptop doesn't suspend (only the screen is
>>> blanked) b) When I reopen the lid, the touchpad stays disabled c)
>>> When I try to suspend a second time (closing the lid), the system
>>> totally freeze (without any info in dmesg) and I need to reset it
>>> totally. I'll open a separate bug report for this one, when bisected,
>>> and will try to post it to the suspend maintainer together with the
>>> mailing list (I'm not accustomed to mailing lists).
>>
>> FWIW, Christian did this here:
>> https://lore.kernel.org/all/256689953.114854578.1640622738334.JavaMail.root@zimbra40-e7.priv.proxad.net/
>>
>>> FYI, if I remember well, reverting this single commit fixed the issue
>>> and the diff was making sense (try to disable the touchpad before
>>> going to sleep to prevent unexpected event from it while
>>> suspending... if I understood well the code).
>>
>> To be sure this issue doesn't again fall through the cracks unnoticed,
>> I'm adding it to regzbot, my Linux kernel regression tracking bot:
>>
>> #regzbot introduced b3e29642548258c7cd2cb3326a776fff84cd6b69ESC
>> #regzbot title hid: touchpad is not working after suspend to RAM
>> #regzbot from: Christian Casteyde <casteyde.christian@free.fr>
>> #regzbot ignore-activity
>>
>> Reminder: when fixing the issue, please add a 'Link:' tag with the URL
>> to the report (the parent of this mail) using the kernel.org redirector,
>> as explained in 'Documentation/process/submitting-patches.rst'. Regzbot
>> then will automatically mark the regression as resolved once the fix
>> lands in the appropriate tree. For more details about regzbot see footer.
>>
>> Sending this to everyone that got the initial report, to make all aware
>> of the tracking. I also hope that messages like this motivate people to
>> directly get at least the regression mailing list and ideally even
>> regzbot involved when dealing with regressions, as messages like this
>> wouldn't be needed then.
>>
>> Don't worry, I'll send further messages wrt to this regression just to
>> the lists (with a tag in the subject so people can filter them away), as
>> long as they are intended just for regzbot. With a bit of luck no such
>> messages will be needed anyway.
>>
>>
>>
>> Ciao, Thorsten (wearing his 'Linux kernel regression tracker' hat).
>>
>> P.S.: As a Linux kernel regression tracker I'm getting a lot of reports
>> on my table. I can only look briefly into most of them. Unfortunately
>> therefore I sometimes will get things wrong or miss something important.
>> I hope that's not the case here; if you think it is, don't hesitate to
>> tell me about it in a public reply. That's in everyone's interest, as
>> what I wrote above might be misleading to everyone reading this; any
>> suggestion I gave thus might sent someone reading this down the wrong
>> rabbit hole, which none of us wants.
>>
>> BTW, I have no personal interest in this issue, which is tracked using
>> regzbot, my Linux kernel regression tracking bot
>> (https://linux-regtracking.leemhuis.info/regzbot/). I'm only posting
>> this mail to get things rolling again and hence don't need to be CC on
>> all further activities wrt to this regression.
>>
>> ---
>> Additional information about regzbot:
>>
>> If you want to know more about regzbot, check out its web-interface, the
>> getting start guide, and/or the references documentation:
>>
>> https://linux-regtracking.leemhuis.info/regzbot/
>> https://gitlab.com/knurd42/regzbot/-/blob/main/docs/getting_started.md
>> https://gitlab.com/knurd42/regzbot/-/blob/main/docs/reference.md
>>
>> The last two documents will explain how you can interact with regzbot
>> yourself if your want to.
>>
>> Hint for reporters: when reporting a regression it's in your interest to
>> tell #regzbot about it in the report, as that will ensure the regression
>> gets on the radar of regzbot and the regression tracker. That's in your
>> interest, as they will make sure the report won't fall through the
>> cracks unnoticed.
>>
>> Hint for developers: you normally don't need to care about regzbot once
>> it's involved. Fix the issue as you normally would, just remember to
>> include a 'Link:' tag to the report in the commit message, as explained
>> in Documentation/process/submitting-patches.rst
>> That aspect was recently was made more explicit in commit 1f57bd42b77c:
>> https://git.kernel.org/linus/1f57bd42b77c
>>
> 

