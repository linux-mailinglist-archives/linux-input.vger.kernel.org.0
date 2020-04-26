Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8163E1B9192
	for <lists+linux-input@lfdr.de>; Sun, 26 Apr 2020 18:14:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726147AbgDZQOs (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Sun, 26 Apr 2020 12:14:48 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53180 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1726143AbgDZQOs (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Sun, 26 Apr 2020 12:14:48 -0400
Received: from mail-lf1-x141.google.com (mail-lf1-x141.google.com [IPv6:2a00:1450:4864:20::141])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B3B03C061A0F;
        Sun, 26 Apr 2020 09:14:47 -0700 (PDT)
Received: by mail-lf1-x141.google.com with SMTP id x23so11751409lfq.1;
        Sun, 26 Apr 2020 09:14:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=fbeiDF1kUAsoJB1+WoS9p+1qkjPiGJkt6XP9xAgTz10=;
        b=NIJo5MQ2J5/d6j1rxw6exdSQ5ObG9yD6jCsqUggB/2S0pd+PBNywMwLDH26KJ763kP
         BzS4Y8ukhQX/5mgrMDPWHaDclfevXWApKY+Qv76zNeoJLhpiRwwpjseTnaohOCijKYaV
         HmCMO6H6vhlVq5FcHQtsTLljT6cMzr3FbsRpSHbCQuWZSpiV7D68ZaN4K1O8u4uOKcgU
         iQ3LJcSp0OpXzdPr8WbC+MBntvV57viZzs5xBBxKXe7YkAbn8Cw8kSK9V4JvvL0MiTmm
         +H4PPHe8qblTNPWO/dDcKJXDO264OoDN1DeOMgox1i7HpOs+i8HXs7Yl0eDiNznofMI3
         e/kw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=fbeiDF1kUAsoJB1+WoS9p+1qkjPiGJkt6XP9xAgTz10=;
        b=JUurMem8olZpdyoKEuTmVTXa0C1qaiGQkFLRDJ1nDmDmAoxk1RglBGDWNhlyzvWxgh
         8BMdHOrpx73kSqaSXfcQC+EI+H91Ycyjvn73zpFbGLQsa9D0c+n5DTPxbszBtqwCH4dr
         PWlzReRQxTBDpCpuMOo9NkMg5weZo07jeXvvGg3ytYj3G4uXypsKK1qH+ebOvCxynVQA
         4sWlCLMkZaKLnR3n8oHyEtqL8mJzKIo3o6FtHi/8fzr/UEQU675gD1d54I6hSV8gPczV
         FowARhRXL2CIUOd3NzD9GdLXnv8tXpdXNV0Ww3o9tKvZv4UdDm0sgl3rExiVd0Dea06q
         m3Rg==
X-Gm-Message-State: AGi0PubBuxVoQFXn2yC8gwK3kt58Pfm8RzUTha36rmxH9F7n9tkTCgy1
        CPIyYE8LUjwSa1tgcFaWAyAm8juk
X-Google-Smtp-Source: APiQypJmtMX+5RMGRMy/wasBaA10MZ//AzsAiS/VgNm1B3Xr7z7hfTxbZZVL34JROBKxs3Tu7C2TVQ==
X-Received: by 2002:a05:6512:31c1:: with SMTP id j1mr13003207lfe.14.1587917685809;
        Sun, 26 Apr 2020 09:14:45 -0700 (PDT)
Received: from [192.168.2.145] (ppp91-78-208-152.pppoe.mtu-net.ru. [91.78.208.152])
        by smtp.googlemail.com with ESMTPSA id a28sm9204700lfr.4.2020.04.26.09.14.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 26 Apr 2020 09:14:45 -0700 (PDT)
Subject: Re: [PATCH v3 3/9] input: elants: remove unused axes
To:     =?UTF-8?B?TWljaGHFgiBNaXJvc8WCYXc=?= <mirq-linux@rere.qmqm.pl>
Cc:     Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Henrik Rydberg <rydberg@bitmath.org>,
        James Chen <james.chen@emc.com.tw>,
        Johnny Chuang <johnny.chuang@emc.com.tw>,
        Rob Herring <robh+dt@kernel.org>,
        Scott Liu <scott.liu@emc.com.tw>,
        David Heidelberg <david@ixit.cz>, linux-input@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <cover.1586784389.git.mirq-linux@rere.qmqm.pl>
 <62e897b0d6f6054dae26c853a9a1f1fb6d3c420b.1586784389.git.mirq-linux@rere.qmqm.pl>
 <20200426045200.GN125362@dtor-ws> <20200426112150.GA16230@qmqm.qmqm.pl>
 <a9828df8-c974-3bc2-6ecf-962489cf1189@gmail.com>
 <489b497b-fd25-fa6b-59c9-9d925c489fe0@gmail.com>
 <20200426161246.GA23794@qmqm.qmqm.pl>
From:   Dmitry Osipenko <digetx@gmail.com>
Message-ID: <1fac5c67-d3bf-2767-13d6-778eb6b51f3e@gmail.com>
Date:   Sun, 26 Apr 2020 19:14:44 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <20200426161246.GA23794@qmqm.qmqm.pl>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

26.04.2020 19:12, Michał Mirosław пишет:
> On Sun, Apr 26, 2020 at 06:41:34PM +0300, Dmitry Osipenko wrote:
>> 26.04.2020 18:39, Dmitry Osipenko пишет:
>>> 26.04.2020 14:21, Michał Mirosław пишет:
>>>> On Sat, Apr 25, 2020 at 09:52:00PM -0700, Dmitry Torokhov wrote:
>>>>> On Mon, Apr 13, 2020 at 03:32:23PM +0200, Michał Mirosław wrote:
>>>>>> Driver only ever reports MT events. Clear capabilities of all others.
>>>>> This is not true. input_mt_sync_frame() calls
>>>>> input_mt_report_pointer_emulation() which does emut single-touch events
>>>>> for the benefit of older userspace (or userspace that is not interested
>>>>> in multitouch).
>>>>
>>>> Oh, I didn't notice that. Looking at the code, I see that
>>>> input_mt_init_slots() sets up the emulated axes in this case.
>>>>
>>>> Do you need me to update the commitmsg?
>>>
>>> I tried Ubuntu 12.04 that uses ancient libinput (or whatever it was back
>>> then), which doesn't support MT. Mouse doesn't move at all with this
>>> patch being applied. Without this patch mouse moves, but it's not usable
>>> because the cursor's position is wrong, i.e. mouse position doesn't
>>> match the screen touches.
>>>
>>> This means that input_mt_report_pointer_emulation() doesn't set up
>>> everything needed for the legacy pointer emulation.
>>>
>>
>> I meant the input_mt_init_slots().
> 
> Can you try v4 and see if it helps? input_mt_init_slots() needs other
> axes set up before for it to use correct ranges.


Sure! I'll try it right now.

