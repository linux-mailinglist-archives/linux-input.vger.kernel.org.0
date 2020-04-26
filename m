Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 594F71B913E
	for <lists+linux-input@lfdr.de>; Sun, 26 Apr 2020 17:41:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726144AbgDZPlj (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Sun, 26 Apr 2020 11:41:39 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48048 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1726143AbgDZPlj (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Sun, 26 Apr 2020 11:41:39 -0400
Received: from mail-lf1-x141.google.com (mail-lf1-x141.google.com [IPv6:2a00:1450:4864:20::141])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BB28EC061A0F;
        Sun, 26 Apr 2020 08:41:38 -0700 (PDT)
Received: by mail-lf1-x141.google.com with SMTP id m2so11681626lfo.6;
        Sun, 26 Apr 2020 08:41:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:from:to:cc:references:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=pXhCVLeGuzt1Hx8MnSSCOHZYQw4yNVKrc8bMnaEx8d4=;
        b=D79KSYn58cGBytW8sLcNr6b0i5H6Axd2ZM5O0H9n0M+E+vKJbz8YKkgXtdmZ2YYKgj
         uVBVp5Qha64xSkPRZUm4cDdJuOxNTAz5lX+ipCMPdkt6HchKqMBnvrc7ZQZBnqMqSxcf
         XXvQ2wtWrwGeEMS0mOLYKfspx6wx+FjPIzcWpU3uTNz7aFK1w0mEyeVwSWZlgwF+4xmi
         hZJHJjZ787nyiobN/YaPVwnQJhoCc9iBgiIJX/KMZegsjCGM313t6c/nPqmRgdSXTYXl
         yFKv+JKxoJ4aRYgfQxPVCMvoXgWulqcDnNBEPkUPgHC7E4YSUNUFI0kAWgtc6AcT1kil
         6dDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:from:to:cc:references:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=pXhCVLeGuzt1Hx8MnSSCOHZYQw4yNVKrc8bMnaEx8d4=;
        b=hAX+sVw2TCB9IgYof4WdmlsdzeZGwob1jX7eYXQQ5/BGuGSVwTLa2CsH6dg5jHQXLA
         8+PHIsuDP9y9Y062Nnc6w9pjlIWLzlwYxSvEMIXR0foQfgUcgy627KiUNIw9uSNBKIox
         qj+IyDTeslrfiH8vB9E8JqqqUhIR4UWVHBgyaSktfA4Qni5YmL4131inRq5IazAHSWvn
         eKSugVNpQnXNbmyvIPSp68BUcD3aefRUprLb+R7OUBZK0j/2ynNFFxfOGFzUd1sIq2u8
         giuqvEdvFUc0BXVQv6WaeIew/ffn8claBBtVpPQ73BlpAXlDAiUXvgF/2QQBZLMTiyf8
         mVrw==
X-Gm-Message-State: AGi0PuZBXgYaNhEe03ZSa81N9RBY52q90zZDMcVLSOcykomM7rHpWDPR
        HXdMXPNoDIjl8UVDw/dEYN1DYJEP
X-Google-Smtp-Source: APiQypLCbZewRJhtaO28soEIftvKpAxm6yBQ/9gTcDqIl+0sR6hTrfZIwgyRLY0jdvNYV8fTmt1DVQ==
X-Received: by 2002:a05:6512:3189:: with SMTP id i9mr12672004lfe.178.1587915696897;
        Sun, 26 Apr 2020 08:41:36 -0700 (PDT)
Received: from [192.168.2.145] (ppp91-78-208-152.pppoe.mtu-net.ru. [91.78.208.152])
        by smtp.googlemail.com with ESMTPSA id r12sm6726588ljc.12.2020.04.26.08.41.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 26 Apr 2020 08:41:35 -0700 (PDT)
Subject: Re: [PATCH v3 3/9] input: elants: remove unused axes
From:   Dmitry Osipenko <digetx@gmail.com>
To:     =?UTF-8?B?TWljaGHFgiBNaXJvc8WCYXc=?= <mirq-linux@rere.qmqm.pl>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc:     Henrik Rydberg <rydberg@bitmath.org>,
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
Message-ID: <489b497b-fd25-fa6b-59c9-9d925c489fe0@gmail.com>
Date:   Sun, 26 Apr 2020 18:41:34 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <a9828df8-c974-3bc2-6ecf-962489cf1189@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

26.04.2020 18:39, Dmitry Osipenko пишет:
> 26.04.2020 14:21, Michał Mirosław пишет:
>> On Sat, Apr 25, 2020 at 09:52:00PM -0700, Dmitry Torokhov wrote:
>>> On Mon, Apr 13, 2020 at 03:32:23PM +0200, Michał Mirosław wrote:
>>>> Driver only ever reports MT events. Clear capabilities of all others.
>>> This is not true. input_mt_sync_frame() calls
>>> input_mt_report_pointer_emulation() which does emut single-touch events
>>> for the benefit of older userspace (or userspace that is not interested
>>> in multitouch).
>>
>> Oh, I didn't notice that. Looking at the code, I see that
>> input_mt_init_slots() sets up the emulated axes in this case.
>>
>> Do you need me to update the commitmsg?
> 
> I tried Ubuntu 12.04 that uses ancient libinput (or whatever it was back
> then), which doesn't support MT. Mouse doesn't move at all with this
> patch being applied. Without this patch mouse moves, but it's not usable
> because the cursor's position is wrong, i.e. mouse position doesn't
> match the screen touches.
> 
> This means that input_mt_report_pointer_emulation() doesn't set up
> everything needed for the legacy pointer emulation.
> 

I meant the input_mt_init_slots().
