Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AFED31B9298
	for <lists+linux-input@lfdr.de>; Sun, 26 Apr 2020 19:58:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726156AbgDZR6F (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Sun, 26 Apr 2020 13:58:05 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40878 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1726152AbgDZR6F (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Sun, 26 Apr 2020 13:58:05 -0400
Received: from mail-lf1-x143.google.com (mail-lf1-x143.google.com [IPv6:2a00:1450:4864:20::143])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 10152C061A0F;
        Sun, 26 Apr 2020 10:58:05 -0700 (PDT)
Received: by mail-lf1-x143.google.com with SMTP id x23so11893485lfq.1;
        Sun, 26 Apr 2020 10:58:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:from:to:cc:references:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=JjJb2Qc12xywb2asV5mKmbeFAK1UlctAKb+PNhSFdR4=;
        b=DQOc/e7HapgZiR3sE6iMUiqzxo75S/qVTi69QPQkZhtmalDnU9OaVvdcB2+tRGA30Y
         toAJC/cPMjicrVdCZvMYMvBeQ7gWJM/4aMgBazgsCKwCl4094bEkVGAl+q2Mfg0w9ZtU
         UZUvS+vWig8qUVR/8dZIrqTi8x53Q81UQvLJyz7mf1OnkqFW6Mt03lEnsgLG/TpYsh9T
         4rhCr6hSv2s0qpg6TStYFL4u+ZUONEyws7FAypmTh/wlE27C65Ku9OJIpQvhHMrAtn2E
         RllfK6Nybz6lAS7ln8yY7GvIw5Xf8TajPr4vUavNesKSKvK1LNSPDNHMvaQmhmJUUkMR
         1qPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:from:to:cc:references:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=JjJb2Qc12xywb2asV5mKmbeFAK1UlctAKb+PNhSFdR4=;
        b=J0MB0sTH14UNwGNWBHY9JLiWbzyDn+Jg4897sZBsVXDuWpKzrROzM/B9mHgGRWu5ro
         z55rLSxBTYZthnKF/mUbRwFsD9IT5PRCcRDlEutlUYblpDYBvACo6PIRW5/R46FmqW0U
         nKlrm7gaXFZce7VDh4e+cExn9ZKVafrivQo2ZqBdLHQB7oN2cXB/G7+dhiVZXD6D82WC
         d5Wn5+4FPj7zbLo0Gl27OA8WAunpPvJlrEQijexPvD43msc8/QyjPPT8NOGKnitgqwL7
         DAxK0FoloOdsJiyMUnciD+gEMkXhiEyhCV66HofMywKh2U9S0R7wCTZ1PtSPtZrTHYRS
         d8lA==
X-Gm-Message-State: AGi0Puan51lURopuZrirvgYNAWo2Cq+d1wzBug7YeRPzIKlwSqibu0iT
        hGtFlB3z3cnMVHizArqSspGx9Rv7
X-Google-Smtp-Source: APiQypKzu4gzgXZdJdOLCe0p78TH6rwA63rhfh9q10q51DxM9mkj0s8WrFsZ2azbCMm0ElDlSDRobg==
X-Received: by 2002:ac2:4d12:: with SMTP id r18mr13028090lfi.181.1587923883259;
        Sun, 26 Apr 2020 10:58:03 -0700 (PDT)
Received: from [192.168.2.145] (ppp91-78-208-152.pppoe.mtu-net.ru. [91.78.208.152])
        by smtp.googlemail.com with ESMTPSA id 1sm8706648ljw.91.2020.04.26.10.58.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 26 Apr 2020 10:58:02 -0700 (PDT)
Subject: Re: [PATCH v4 03/10] input: elants: remove unused axes
From:   Dmitry Osipenko <digetx@gmail.com>
To:     =?UTF-8?B?TWljaGHFgiBNaXJvc8WCYXc=?= <mirq-linux@rere.qmqm.pl>
Cc:     David Heidelberg <david@ixit.cz>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Henrik Rydberg <rydberg@bitmath.org>,
        James Chen <james.chen@emc.com.tw>,
        Johnny Chuang <johnny.chuang@emc.com.tw>,
        Rob Herring <robh+dt@kernel.org>,
        Scott Liu <scott.liu@emc.com.tw>, linux-input@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <cover.1587916846.git.mirq-linux@rere.qmqm.pl>
 <b6cb0f810eec2d5c6245d6128502eebd342ca02a.1587916846.git.mirq-linux@rere.qmqm.pl>
 <0f66e93c-9c71-73d0-90b8-15e0802a79c5@gmail.com>
 <20200426172954.GA15436@qmqm.qmqm.pl>
 <8b39ab58-dfc2-323c-3b25-4e9023cf8f0d@gmail.com>
Message-ID: <df9524db-0114-de13-e619-ad8de10e8f49@gmail.com>
Date:   Sun, 26 Apr 2020 20:58:01 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <8b39ab58-dfc2-323c-3b25-4e9023cf8f0d@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

26.04.2020 20:45, Dmitry Osipenko пишет:
> 26.04.2020 20:29, Michał Mirosław пишет:
>> On Sun, Apr 26, 2020 at 07:35:47PM +0300, Dmitry Osipenko wrote:
>>> 26.04.2020 19:11, Michał Mirosław пишет:
>>>> Driver only ever reports MT events and input_mt_init_slots() sets up
>>>> emulated axes already.  Clear the capabilities not generated directly
>>>> and move MT axes setup, so they are visible by input_mt_init_slots().
>>>>
>>>> Signed-off-by: Michał Mirosław <mirq-linux@rere.qmqm.pl>
>>>> Reviewed-by: Dmitry Osipenko <digetx@gmail.com>
>>>> Tested-by: Dmitry Osipenko <digetx@gmail.com>
>>>> ---
>>>> v4: reword commitmsg; reorder axis setup
>>>> ---
>>>
>>> Legacy pointer emulation doesn't work using v4. I think it will be
>>> better to drop this patch for now and add this hunk to the patch #4:
>>
>> Have you tried it together with the next patch? It adds
>> touchscreen_parse_properties() to initialize axes also from DT, and
>> should be equivalent to the hunk you proposed.
> 
> Yes, the touchscreen_parse_properties() takes bool multitouch for the
> argument, and thus, it needs to be applied to both MT/non-MT cases.
> 
> https://elixir.bootlin.com/linux/v5.7-rc2/source/drivers/input/touchscreen/of_touchscreen.c#L64
> 
>> [...]
>>> Maybe input_mt_init_slots() could be changed to set up all the
>>> properties that are needed for the legacy pointer, but I'm not 100% sure
>>> because not very familiar with that code. Perhaps Dmitry Torokhov could
>>> clarify?
>>
>> The code of input_mt_init_slots() looks like it does initialize the
>> properties needed. What does evtest return with and without the patches?

Oh wait, seems I messed up something while was applying the patches.
I'll try the v5 now.
