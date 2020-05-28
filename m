Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 15FFC1E5C30
	for <lists+linux-input@lfdr.de>; Thu, 28 May 2020 11:37:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728428AbgE1JhG convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-input@lfdr.de>); Thu, 28 May 2020 05:37:06 -0400
Received: from youngberry.canonical.com ([91.189.89.112]:45804 "EHLO
        youngberry.canonical.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728420AbgE1JhE (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Thu, 28 May 2020 05:37:04 -0400
Received: from mail-pl1-f200.google.com ([209.85.214.200])
        by youngberry.canonical.com with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
        (Exim 4.86_2)
        (envelope-from <kai.heng.feng@canonical.com>)
        id 1jeEyD-0001dl-QQ
        for linux-input@vger.kernel.org; Thu, 28 May 2020 09:37:02 +0000
Received: by mail-pl1-f200.google.com with SMTP id ba6so20253676plb.3
        for <linux-input@vger.kernel.org>; Thu, 28 May 2020 02:37:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:subject:from:in-reply-to:date:cc
         :content-transfer-encoding:message-id:references:to;
        bh=uElBHPq9LpIquIfpjXBhIioWXJX+UOjzlFZ3l4h1urA=;
        b=MS762IfzlRCr/soEp8xBC35Zuh0I6kxiPINn8c2QKoRpNtryzmX4BYPyQfcoUWxRhH
         /AEjJqhZs5+BMV8jFu2bJvVke+5t+94rr9+orC4gOaimlX+VuNVAuYIT3hA9y/adncIz
         rRWmY5MfNurtrCsNFbsKxWT2szInTI6/wZ/XbWim03B5cmTWzxyzUADAoJtc4WnXCIqj
         uOtC+6zRmG9vWOyGxOdOn3HoCQ/uvgu1D7HSETuBTEflgzFY49ePFjx4FAdroO0KK5U1
         yaiiPBT7N+vpoLb2DERnTLoLk44nPB+ma/W1g5cUCAr3MYtDW7Nm6ZH+BbQ0Tee3O78d
         u+sg==
X-Gm-Message-State: AOAM532Ebf0ymzNWWwIDgceCIuF16H3TyPzkE201yRa2IESr9VGo90a3
        KxuW2cn+1pbTVXBquAoHpUP+1/SQiVIeJ1T5S1GI/Px4+fzC7CgGqcqecy7Nk8MLuIJmax4rVvQ
        KBDrzx106HzqPkIGZbT2TYML7wORqvCdN7BSBYPaR
X-Received: by 2002:a17:90a:2305:: with SMTP id f5mr2871476pje.57.1590658617438;
        Thu, 28 May 2020 02:36:57 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJysPG0b5q+A4iRcheu8QBU5PGgcYYiOBRMuyzD4TXDivrnJp03Dvjn0RzRDCh2cuifEeOrbfg==
X-Received: by 2002:a17:90a:2305:: with SMTP id f5mr2871458pje.57.1590658617053;
        Thu, 28 May 2020 02:36:57 -0700 (PDT)
Received: from [192.168.1.208] (220-133-187-190.HINET-IP.hinet.net. [220.133.187.190])
        by smtp.gmail.com with ESMTPSA id l11sm5460023pjj.33.2020.05.28.02.36.51
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 28 May 2020 02:36:54 -0700 (PDT)
Content-Type: text/plain;
        charset=us-ascii
Mime-Version: 1.0 (Mac OS X Mail 13.4 \(3608.80.23.2.2\))
Subject: Re: [PATCH] HID: multitouch: Remove MT_CLS_WIN_8_DUAL
From:   Kai-Heng Feng <kai.heng.feng@canonical.com>
In-Reply-To: <CAO-hwJJCQbGV3cYjHNmiEi7rgoC5U9uq2ugkNJtRv=Z0wHsuag@mail.gmail.com>
Date:   Thu, 28 May 2020 17:36:50 +0800
Cc:     Jiri Kosina <jikos@kernel.org>,
        "open list:HID CORE LAYER" <linux-input@vger.kernel.org>,
        open list <linux-kernel@vger.kernel.org>
Content-Transfer-Encoding: 8BIT
Message-Id: <E94C8C0C-BF5E-454E-8D2B-90854D635488@canonical.com>
References: <20200414091842.25972-1-kai.heng.feng@canonical.com>
 <nycvar.YFH.7.76.2005261023250.25812@cbobk.fhfr.pm>
 <CAO-hwJ+mTjVpBiY9vHXA2Y6D+cXYemixFJ++i+KwZZ25Z6LHHA@mail.gmail.com>
 <A51B9D28-88BF-42EB-9161-8E3081B128D2@canonical.com>
 <CAO-hwJJ=_2bn1BEshZ6URT813UAA6KRLaiEHt6bNPUcd9esskg@mail.gmail.com>
 <CAO-hwJJCQbGV3cYjHNmiEi7rgoC5U9uq2ugkNJtRv=Z0wHsuag@mail.gmail.com>
To:     Benjamin Tissoires <benjamin.tissoires@redhat.com>
X-Mailer: Apple Mail (2.3608.80.23.2.2)
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org



> On May 27, 2020, at 20:15, Benjamin Tissoires <benjamin.tissoires@redhat.com> wrote:
> 
> On Wed, May 27, 2020 at 11:24 AM Benjamin Tissoires
> <benjamin.tissoires@redhat.com> wrote:
>> 
>> On Wed, May 27, 2020 at 8:19 AM Kai-Heng Feng
>> <kai.heng.feng@canonical.com> wrote:
>>> 
>>> 
>>> 
>>>> On May 26, 2020, at 16:43, Benjamin Tissoires <benjamin.tissoires@redhat.com> wrote:
>>>> 
>>>> On Tue, May 26, 2020 at 10:24 AM Jiri Kosina <jikos@kernel.org> wrote:
>>>>> 
>>>>> On Tue, 14 Apr 2020, Kai-Heng Feng wrote:
>>>>> 
>>>>>> After commit c23e2043d5f7 ("HID: multitouch: do not filter mice nodes"),
>>>>>> MT_CLS_WIN_8 also supports mouse nodes, hence make MT_CLS_WIN_8_DUAL
>>>>>> redundant.
>>>>>> 
>>>>>> Remove MT_CLS_WIN_8_DUAL accordingly.
>>>>> 
>>>>> Benjamin, can I get your Ack on this one please?
>>>> 
>>>> Heh, funny enough I was trying to fix
>>>> https://bugzilla.kernel.org/show_bug.cgi?id=207235 and was pondering
>>>> this one too.
>>>> 
>>>> To fix #207235, I'll likely need to add a new class and quirk in
>>>> hid-multitouch. I can't really find a generic solution for now, and we
>>>> better have a local quirk for the 2 devices we currently have and
>>>> backport those to stable. However, this patch will likely conflict
>>>> (trivially), with the new quirks, so I was thinking:
>>>> - submitting my quick and dirty quirk and mark it to stable
>>>> - apply this one on top of it (this one really doesn't need to go to stable)
>>>> 
>>>> How does that sound?
>>> 
>>> Sounds good. I'll resend this patch once your patch lands in the tree.
>> 
>> Great, thanks. Though I should be able to rebase it and push it
>> directly. I'll notify you if I can't get to it today.
> 
> Alright, rebased and pushed to for-5.8/multitouch.
> 
> Thanks a lot.

Thanks for your work :)

Kai-Heng

> 
> Cheers,
> Benjamin
> 
>> 
>> Cheers,
>> Benjamin
>> 
>>> 
>>> Kai-Heng
>>> 
>>>> 
>>>> Cheers,
>>>> Benjamin
>>>> 
>>>>> 
>>>>> Thanks,
>>>>> 
>>>>> --
>>>>> Jiri Kosina
>>>>> SUSE Labs

