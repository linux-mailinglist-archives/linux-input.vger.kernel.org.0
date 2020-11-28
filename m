Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AA45A2C722A
	for <lists+linux-input@lfdr.de>; Sat, 28 Nov 2020 23:06:06 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387862AbgK1VuZ (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Sat, 28 Nov 2020 16:50:25 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42380 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731747AbgK1SzO (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Sat, 28 Nov 2020 13:55:14 -0500
Received: from mail-pf1-x441.google.com (mail-pf1-x441.google.com [IPv6:2607:f8b0:4864:20::441])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 99E5AC09424D
        for <linux-input@vger.kernel.org>; Fri, 27 Nov 2020 23:03:00 -0800 (PST)
Received: by mail-pf1-x441.google.com with SMTP id w187so6370209pfd.5
        for <linux-input@vger.kernel.org>; Fri, 27 Nov 2020 23:03:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fourwalledcubicle-com.20150623.gappssmtp.com; s=20150623;
        h=subject:to:references:from:message-id:date:user-agent:mime-version
         :in-reply-to:content-language:content-transfer-encoding;
        bh=NU4z0OiErDMQDw3JmLN+FqLZ6SUoe1hTNyHYijHV1zE=;
        b=LgPaA+kHazkRlGTf9fIkNfASDDbMOG+8YS7I0lJ2t4we1TKF3G2OeSfQ7yzGOin/iB
         Vb5p2i3UE8eiUpGMimQspNj5ilMrthAO8QrWLOlA7sgoJg7vldqlB+Qcz7n18mC9XXbP
         zFO5UfW2kLrxlBZs0q4qREpKvVnrbcMGsq4dDfBxVXLpkOdKlnrIckaHvCUyXoMN7TIh
         /thP2FzZgtWU0o4kDvurG6JfkWsmtp31dRBFbYB13GPUclZhn4xoWN2e47rPBaqpGCcD
         STAKP0XWfk/lv0CtejplsdSdzmyuuWtAG8l4vvN79bcCjwLi5TGuMMV26P8Ok2t1JLIG
         H+/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=NU4z0OiErDMQDw3JmLN+FqLZ6SUoe1hTNyHYijHV1zE=;
        b=uFFFUDgqdSlKLWeTa6EcdRXkcnNJKv8wOsMlk9i9TxoTlnqPPGXTTwypec7Xp9/AXQ
         CKamJtjCAinYOQbzVse4u/l8rtkiHBjUd38a3IYx/eazpgMCf1mrGYo6hIxHhY0Fa9CC
         uJMmpFtzq18ON58orFB1sIgfSqhpICKbw5VhSyQAzsQqeGbH3Z5haSWHzj2pjSfn/oA9
         SICibmBsrk9ql6RBBlbCDb9GHUtrdmYg1HR/0AAlycm3vqrQLConkkFA/BNmRdOADpe3
         Iwc1NZt2DalQ8ASywB/K0gEipHCAKJKvAJCPM0yo85s1i6B1+Oz8FZV0LL/JjzDLaTxG
         8RiA==
X-Gm-Message-State: AOAM5330PKRisUF3uCrfmGRga53CnlWKyGHwghYxgZKdhqkxFapc5Xar
        tmf1qqMK10ri9/pO8H0EN8eLCw==
X-Google-Smtp-Source: ABdhPJyXUdGijpuWpU2iGWq929vAV969XoIHEqq5vAG0GGla6aVvBgVDCthJHGHbAZY08csfQYcupQ==
X-Received: by 2002:a63:445c:: with SMTP id t28mr9580082pgk.373.1606546980050;
        Fri, 27 Nov 2020 23:03:00 -0800 (PST)
Received: from [10.0.0.4] (203-123-108-233.ip4.superloop.com. [203.123.108.233])
        by smtp.gmail.com with ESMTPSA id e18sm9083239pgr.71.2020.11.27.23.02.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 27 Nov 2020 23:02:59 -0800 (PST)
Subject: Re: [V3, PATCH] Add additional hidraw input/output report ioctls.
To:     =?UTF-8?Q?Filipe_La=c3=adns?= <lains@archlinux.org>,
        linux-input@vger.kernel.org, jikos@kernel.org,
        benjamin.tissoires@redhat.com
References: <20201125223957.5921-1-dean@fourwalledcubicle.com>
 <2e19588821053914eebe30088b4590af51959409.camel@archlinux.org>
 <2c2bfd55-3a03-9839-22f5-16058ac24e35@fourwalledcubicle.com>
 <c8d4d17798e2c9fca417223d4edf5f4b1aebf75d.camel@archlinux.org>
 <d295d0bf-9de7-9927-05b6-2897ada89c42@fourwalledcubicle.com>
 <877bfbede4d3bbf40a91c8392218eeab6672e98c.camel@archlinux.org>
From:   Dean Camera <dean@fourwalledcubicle.com>
Message-ID: <c55b4ad5-9fb8-18ef-b931-38a4c37f445f@fourwalledcubicle.com>
Date:   Sat, 28 Nov 2020 18:02:55 +1100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.0
MIME-Version: 1.0
In-Reply-To: <877bfbede4d3bbf40a91c8392218eeab6672e98c.camel@archlinux.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On 28/11/2020 7:11 am, Filipe Laíns wrote:
> On Fri, 2020-11-27 at 15:05 +1100, Dean Camera wrote:
>> Thank you for the review, Filipe!
>>
>> I'm still new to the kernel patch submission process, so I'm a little
>> perplexed by the next steps. Who will decide if it is to be applied, and
>> is there any further action I need to take?
> 
> No worries :)
> That'd probably Benjamin Tissoires, co-maintainer of the HID subsystem.
> There is no further action you need to take, just wait. Please understand that
> these things can sometimes take a while as maintainer time is limited and they
> may have a long backlog to fight through.
> 

I completely understand - I maintain some open source projects myself, 
so I know how it is. I'm just a millenial used to pull requests, issue 
trackers and/or email attachments, so I wasn't too sure how to proceed 
here and didn't want to mis-step and end up with it getting lost due to 
my own inaction.

Thank you both sincerely for your time and efforts, they are very much 
appreciated.

> Also be aware that maintainers might be a bit conservative about adding new
> features as they will be required to maintain them in the long run, so don't
> take it personally if they chose not to to merge some of your patches.
> 
>> I am obviously keen, but not impatient, to get this feature in. I'm
>> happy to follow whatever process is required, I just haven't found
>> anything beyond the initial "submitting your patch" documentation.
> 
> Yeah, I sympathize. The process essentially is to send the patch and wait :P
> 

I do wish there was a way to track the patches a little better - I fully 
understand about the time pressures involved, but having a way to at 
least know it was seen and added to a backlog somewhere would be nice. 
Alas, I fear such talk is somewhat like the proverbial ocean boiling.

> Just one thing, in the kernel mailing lists you are discouraged to top-post.

Thanks for the advice, taken under consideration :).

> 
> A: Because it messes up the order in which people normally read text.
> Q: Why is top-posting such a bad thing?
> 
> A: Top-posting.
> Q: What is the most annoying thing in e-mail?
> 
> A: No.
> Q: Should I include quotations after my reply?
> 
>> Cheers!
>> - Dean
> 
> Cheers,
> Filipe Laíns
> 

Cheers!
- Dean
