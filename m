Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 179EF2C5F24
	for <lists+linux-input@lfdr.de>; Fri, 27 Nov 2020 05:06:08 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2389015AbgK0EFw (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 26 Nov 2020 23:05:52 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50344 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729527AbgK0EFv (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Thu, 26 Nov 2020 23:05:51 -0500
Received: from mail-pf1-x442.google.com (mail-pf1-x442.google.com [IPv6:2607:f8b0:4864:20::442])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D1F21C0613D1
        for <linux-input@vger.kernel.org>; Thu, 26 Nov 2020 20:05:51 -0800 (PST)
Received: by mail-pf1-x442.google.com with SMTP id w187so3342867pfd.5
        for <linux-input@vger.kernel.org>; Thu, 26 Nov 2020 20:05:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fourwalledcubicle-com.20150623.gappssmtp.com; s=20150623;
        h=subject:to:references:from:message-id:date:user-agent:mime-version
         :in-reply-to:content-language:content-transfer-encoding;
        bh=A9s5CgKBZdrRMuqeANJ6+7U6jlYR0xOJ962PUzc4/Ow=;
        b=yNrlc/AEducUdy+rztaMsh8DV4xL60n7OwERFygV+Vlam3BbyRFdei5NmhKLpTX+nD
         CMMxmfDCg1v6skrvcW1yc5RqydkTpERkflEM0cYPBC+lMRCJ8fGhjKCuIeUDRFRSW1sM
         dgReWuDFIEb7gz9LGEFcjpgzinH27Pe1dS6RqEYz2cR/BkLBaDyluGXHtmW+34Ta9b6D
         gmFrtVmikA3BEJuWqVrEG3sq69OQ0IH3yzPqOa5tasfTP7+i176jEOG74FdCAg3vQyJj
         kaVusPb59hyGWf1AsM6xaYFkUJ9WJon7QjtPGLHXo/1vHdcvMMFsgSxmW4IPONubsft2
         KBtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=A9s5CgKBZdrRMuqeANJ6+7U6jlYR0xOJ962PUzc4/Ow=;
        b=q6gC7eKds0TdTfqFW5prEarMRsQm1r6YDvFknX/gdHsw3l8u5dWLN0jdTK6py5yIyK
         x2p1JUxNZHWYUjfulP8LI9G7ewbFqxZuyXPtFJCqBTCbaIgs/PVT3U4pLCmHWPMgrpNE
         To7Zj/CSruiyS/VexavjA6FdIi8OGqMIoSValyGfPUI8C6opb7SyA0AyaxnQvPe8GLB9
         OxuIGOKiDHioRe9Pj1pj7F1469OQeDipvM0036rQRuT8leXRQvdVT/FOtbIwaHtpEJFY
         jWZn2st3kNCDgMYE/2a2r1PsQs/FbhDX/k2J29rqgIw9CnIYT3weybPDrvJHAg/hlQ3u
         acRQ==
X-Gm-Message-State: AOAM533ndZ5Adm9BRGg/QxyVz12ySLCcMLBhlBIcINCDFUJAuoNWGv46
        svWnyW9j8/V31exA0CND8rMgDOVA1EvQzQ6H
X-Google-Smtp-Source: ABdhPJwR95XLHBE/8WDlX5941/NwNNz5LoVqMYOmO7SPPO7O7wIm4tcQtr4DKr5xkK2FUE1GQWOgsA==
X-Received: by 2002:a05:6a00:228a:b029:18b:212a:1af7 with SMTP id f10-20020a056a00228ab029018b212a1af7mr5321296pfe.55.1606449951328;
        Thu, 26 Nov 2020 20:05:51 -0800 (PST)
Received: from [10.0.0.4] ([203.123.108.233])
        by smtp.gmail.com with ESMTPSA id y10sm8362122pjm.34.2020.11.26.20.05.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 26 Nov 2020 20:05:50 -0800 (PST)
Subject: Re: [V3, PATCH] Add additional hidraw input/output report ioctls.
To:     =?UTF-8?Q?Filipe_La=c3=adns?= <lains@archlinux.org>,
        linux-input@vger.kernel.org, jikos@kernel.org,
        benjamin.tissoires@redhat.com
References: <20201125223957.5921-1-dean@fourwalledcubicle.com>
 <2e19588821053914eebe30088b4590af51959409.camel@archlinux.org>
 <2c2bfd55-3a03-9839-22f5-16058ac24e35@fourwalledcubicle.com>
 <c8d4d17798e2c9fca417223d4edf5f4b1aebf75d.camel@archlinux.org>
From:   Dean Camera <dean@fourwalledcubicle.com>
Message-ID: <d295d0bf-9de7-9927-05b6-2897ada89c42@fourwalledcubicle.com>
Date:   Fri, 27 Nov 2020 15:05:44 +1100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.0
MIME-Version: 1.0
In-Reply-To: <c8d4d17798e2c9fca417223d4edf5f4b1aebf75d.camel@archlinux.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Thank you for the review, Filipe!

I'm still new to the kernel patch submission process, so I'm a little 
perplexed by the next steps. Who will decide if it is to be applied, and 
is there any further action I need to take?

I am obviously keen, but not impatient, to get this feature in. I'm 
happy to follow whatever process is required, I just haven't found 
anything beyond the initial "submitting your patch" documentation.

Cheers!
- Dean

On 27/11/2020 8:42 am, Filipe Laíns wrote:
> On Fri, 2020-11-27 at 08:30 +1100, Dean Camera wrote:
>> Hi Filipe,
>>
>> Comments inline.
>>
>> - Dean
>>
>> On 27/11/2020 6:05 am, Filipe Laíns wrote:
>>> Hi,
>>>
>>> What is the difference between V1, V2 and V3? I think generally you would
>>> add a
>>> small summary.
>>>
>>
>> Sorry, that's my fault -- the contents are identical. I am more used to
>> modern tooling with code review platforms, pull-requests or even emailed
>> attached patches, so the old tooling took me a few goes to get right.
>>
>> V1 was mangled by Thunderbird, while V2 was missing the cover letter
>> when I submitted it via git send-email from my test machine. V3 is where
>> I (think) I beat the tooling into submission.
> 
> No worries, I was just wondering what the differences were, given that the
> patches were identical.
> 
> *snip*
> 
>>> I am not sure using the same approach as HIDIOCGFEATURE is a good design
>>> choice.
>>> The first byte of the supplied buffer is the report ID, but you can set is
>>> to 0
>>> if you don't want to use numbered reports. From my understanding, this makes
>>> it
>>> impossible to use the ioctl with report ID 0, which valid per the HID spec.
>>>
>>
>> Report ID 0 is reserved by the HID specification and may not be used in
>> a device with multiple reports (see "Device Class Definition for HID
>> 1.11", section "6.2.2.7 Global Items" where it states "Report ID zero is
>> reserved and should not be used.").
> 
> Yup, you are right! I missed that.
> 
>> I think the designers of HID forsaw a sane future where in userspace
>> everyone just assumed the report ID was present at all times, and the
>> HID driver would just omit it on the wire if it was zero. Unfortunatly
>> every platform seems to handle that differently now, with some always
>> requring it, and others selectively omitting it in their APIs.
> 
> Yes, it's unfortunate. Perhaps if the HID designers made the spec easier to read
> we wouldn't have this issue.
> 
>>> My suggestion would be to automatically use numbered reports or not
>>> depending if
>>> the device uses them. A HID endpoint either uses numbered reports or not, it
>>> doesn't make much sense to me to let users try to use numbered reports on
>>> devices that do not use them or the other way round.
>>>
>>> But I guess this is a question for Benjamin.
>>
>> I'm *strongly* in favour of always having them at least in the
>> `ioctl()`, with a (reserved) zero value indicating it is unused - like
>> it is now. That makes userspace easier to deal with, and covers the
>> quirk case where a device does not list report IDs in its HID report
>> descriptor properly, but requires them anyway.
>>
>> It also makes the new requests consistent with the existing request, so
>> there's no extra cognitive load from working with one then switching to
>> the others.
> 
> Yeah, it makes sense given that report 0 is reserved :)
> 
>>>
>>> I tried to track down the discussion about the addition of the
>>> HIDIOCGFEATURE
>>> ioctl but from what I saw there was no mention of this design flaw.
>>>
>>> Am I missing something here?
> 
> I was :D
> 
> You can have my
> Signed-off-by: Filipe Laíns <lains@archlinux.org>
> 
> Perhaps just split the hid-example.c change to another patch.
> 
> *snip*
> 
> Cheers,
> Filipe Laíns
> 
