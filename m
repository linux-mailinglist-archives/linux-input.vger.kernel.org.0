Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 774561B926C
	for <lists+linux-input@lfdr.de>; Sun, 26 Apr 2020 19:45:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726177AbgDZRpS (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Sun, 26 Apr 2020 13:45:18 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38892 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1726152AbgDZRpS (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Sun, 26 Apr 2020 13:45:18 -0400
Received: from mail-lf1-x143.google.com (mail-lf1-x143.google.com [IPv6:2a00:1450:4864:20::143])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2B969C061A0F;
        Sun, 26 Apr 2020 10:45:18 -0700 (PDT)
Received: by mail-lf1-x143.google.com with SMTP id k28so11857566lfe.10;
        Sun, 26 Apr 2020 10:45:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=MVLNP2P1+qSQda/ZuhppMGEONT7tsbmZZDAMfd3/Zrw=;
        b=PIzEcxY6bkM+Q5fo1nmJl7xm5ibTjNmsku52Lc5Hrd+tVdjIuVgsAQq/8Gbd4kUx0T
         dBTBXMmk0zVI5N0kI7Q2Ov+jtv+ffR89Ose41G4TNa/RE9GasLpgJd5ohCThKTpnabsn
         6tQlfaR8HFr3sGUpTZuCNNUgqTC0NPK4okeDZRF0foEPjUalexucqsrAWxX+7YmGjQDg
         0XTNszVtMl09tph9LtF1VfoJ2/CfOgUTtODdPcxjnMrUJsnEur850Ee46eWDQkVKf9DA
         g/tRR3jnQynF8ThbEEfae1pcH6cPlwS8V6BcxGim8BIiKBSmiJwEEEUy4PK9lP/tXY72
         CNlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=MVLNP2P1+qSQda/ZuhppMGEONT7tsbmZZDAMfd3/Zrw=;
        b=ThAOVDhmfnrPk/lieLeeLFROHpgFR7XqQ1s/SAeSj/B8lnHuTztLdw7l73KTBGB2jx
         ziVCOOLtS9uuZwbENrKkMpx0P9HHt+7czsHKJQ2I1fma3j23Pmzv94j0CjqhIZVVnFU6
         3IAZzz9pDiZikFLQVRDAgVOsMUmzIEnfvCMLKqvVrammIVKqux1EaNe92fzaHCXM8zAz
         PSRgR7eKaf5X9LRJMYWzIdjqCZFuGXfoR2oDvf/z64u9t5hC26Hx76+Vyp5K9ugqTnJ+
         Tk2uXgHng1vPrGNnrUOYXPQDfdL5euACHStVr6SjyponaUVe4Y1qHIastiwlr5L9Ukgw
         twfg==
X-Gm-Message-State: AGi0PuYZh49VVmZGrPwzL4xiC7i3V3QsbItWHobIEmygUDumINxQaSRN
        kPOweNkoJR7K6pHIVIaA8Fm3iP8W
X-Google-Smtp-Source: APiQypIqkemKGoeS5/EC2urb4VbRq4ed7LC3vj+uvgb8E5vGXkDw8kyH2kIHvilRe48pMwevdqpeSQ==
X-Received: by 2002:a19:230c:: with SMTP id j12mr13104594lfj.109.1587923116231;
        Sun, 26 Apr 2020 10:45:16 -0700 (PDT)
Received: from [192.168.2.145] (ppp91-78-208-152.pppoe.mtu-net.ru. [91.78.208.152])
        by smtp.googlemail.com with ESMTPSA id y9sm2962925ljy.31.2020.04.26.10.45.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 26 Apr 2020 10:45:15 -0700 (PDT)
Subject: Re: [PATCH v4 03/10] input: elants: remove unused axes
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
From:   Dmitry Osipenko <digetx@gmail.com>
Message-ID: <8b39ab58-dfc2-323c-3b25-4e9023cf8f0d@gmail.com>
Date:   Sun, 26 Apr 2020 20:45:14 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <20200426172954.GA15436@qmqm.qmqm.pl>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

26.04.2020 20:29, Michał Mirosław пишет:
> On Sun, Apr 26, 2020 at 07:35:47PM +0300, Dmitry Osipenko wrote:
>> 26.04.2020 19:11, Michał Mirosław пишет:
>>> Driver only ever reports MT events and input_mt_init_slots() sets up
>>> emulated axes already.  Clear the capabilities not generated directly
>>> and move MT axes setup, so they are visible by input_mt_init_slots().
>>>
>>> Signed-off-by: Michał Mirosław <mirq-linux@rere.qmqm.pl>
>>> Reviewed-by: Dmitry Osipenko <digetx@gmail.com>
>>> Tested-by: Dmitry Osipenko <digetx@gmail.com>
>>> ---
>>> v4: reword commitmsg; reorder axis setup
>>> ---
>>
>> Legacy pointer emulation doesn't work using v4. I think it will be
>> better to drop this patch for now and add this hunk to the patch #4:
> 
> Have you tried it together with the next patch? It adds
> touchscreen_parse_properties() to initialize axes also from DT, and
> should be equivalent to the hunk you proposed.

Yes, the touchscreen_parse_properties() takes bool multitouch for the
argument, and thus, it needs to be applied to both MT/non-MT cases.

https://elixir.bootlin.com/linux/v5.7-rc2/source/drivers/input/touchscreen/of_touchscreen.c#L64

> [...]
>> Maybe input_mt_init_slots() could be changed to set up all the
>> properties that are needed for the legacy pointer, but I'm not 100% sure
>> because not very familiar with that code. Perhaps Dmitry Torokhov could
>> clarify?
> 
> The code of input_mt_init_slots() looks like it does initialize the
> properties needed. What does evtest return with and without the patches?

==== vanilla v4 (doesn't work) ====

Input driver version is 1.0.1
Input device ID: bus 0x18 vendor 0x0 product 0x0 version 0x0
Input device name: "Elan Touchscreen"
Supported events:
  Event type 0 (EV_SYN)
  Event type 1 (EV_KEY)
    Event code 330 (BTN_TOUCH)
  Event type 3 (EV_ABS)
    Event code 47 (ABS_MT_SLOT)
      Value      0
      Min        0
      Max        9
    Event code 48 (ABS_MT_TOUCH_MAJOR)
      Value      0
      Min        0
      Max      255
      Resolution       1
    Event code 53 (ABS_MT_POSITION_X)
      Value      0
      Min        0
      Max     1279
    Event code 54 (ABS_MT_POSITION_Y)
      Value      0
      Min        0
      Max     2111
    Event code 55 (ABS_MT_TOOL_TYPE)
      Value      0
      Min        0
      Max        2
    Event code 57 (ABS_MT_TRACKING_ID)
      Value      0
      Min        0
      Max    65535
    Event code 58 (ABS_MT_PRESSURE)
      Value      0
      Min        0
      Max      255

Event: time 1587922487.077439, type 3 (EV_ABS), code 57
(ABS_MT_TRACKING_ID), value 64
Event: time 1587922487.077439, type 3 (EV_ABS), code 53
(ABS_MT_POSITION_X), value 855
Event: time 1587922487.077439, type 3 (EV_ABS), code 54
(ABS_MT_POSITION_Y), value 893
Event: time 1587922487.077439, type 3 (EV_ABS), code 58
(ABS_MT_PRESSURE), value 47
Event: time 1587922487.077439, type 1 (EV_KEY), code 330 (BTN_TOUCH),
value 1
Event: time 1587922487.077439, -------------- SYN_REPORT ------------
Event: time 1587922487.089144, type 3 (EV_ABS), code 54
(ABS_MT_POSITION_Y), value 899
Event: time 1587922487.089144, type 3 (EV_ABS), code 58
(ABS_MT_PRESSURE), value 124
Event: time 1587922487.089144, type 3 (EV_ABS), code 48
(ABS_MT_TOUCH_MAJOR), value 11
Event: time 1587922487.089144, -------------- SYN_REPORT ------------
Event: time 1587922487.100292, type 3 (EV_ABS), code 53
(ABS_MT_POSITION_X), value 854
Event: time 1587922487.100292, type 3 (EV_ABS), code 54
(ABS_MT_POSITION_Y), value 911
Event: time 1587922487.100292, type 3 (EV_ABS), code 58
(ABS_MT_PRESSURE), value 166
Event: time 1587922487.100292, -------------- SYN_REPORT ------------
Event: time 1587922487.109238, type 3 (EV_ABS), code 53
(ABS_MT_POSITION_X), value 851
Event: time 1587922487.109238, type 3 (EV_ABS), code 54
(ABS_MT_POSITION_Y), value 922
Event: time 1587922487.109238, type 3 (EV_ABS), code 58
(ABS_MT_PRESSURE), value 180
Event: time 1587922487.109238, -------------- SYN_REPORT ------------
Event: time 1587922487.117997, type 3 (EV_ABS), code 53
(ABS_MT_POSITION_X), value 847
Event: time 1587922487.117997, type 3 (EV_ABS), code 54
(ABS_MT_POSITION_Y), value 936
Event: time 1587922487.117997, type 3 (EV_ABS), code 58
(ABS_MT_PRESSURE), value 187
Event: time 1587922487.117997, -------------- SYN_REPORT ------------
Event: time 1587922487.126925, type 3 (EV_ABS), code 53
(ABS_MT_POSITION_X), value 841
Event: time 1587922487.126925, type 3 (EV_ABS), code 54
(ABS_MT_POSITION_Y), value 947
Event: time 1587922487.126925, type 3 (EV_ABS), code 58
(ABS_MT_PRESSURE), value 199
Event: time 1587922487.126925, -------------- SYN_REPORT ------------
Event: time 1587922487.139066, type 3 (EV_ABS), code 53
(ABS_MT_POSITION_X), value 836
Event: time 1587922487.139066, type 3 (EV_ABS), code 54
(ABS_MT_POSITION_Y), value 958
Event: time 1587922487.139066, type 3 (EV_ABS), code 58
(ABS_MT_PRESSURE), value 204
Event: time 1587922487.139066, -------------- SYN_REPORT ------------
Event: time 1587922487.150355, type 3 (EV_ABS), code 53
(ABS_MT_POSITION_X), value 829
Event: time 1587922487.150355, type 3 (EV_ABS), code 54
(ABS_MT_POSITION_Y), value 969
Event: time 1587922487.150355, type 3 (EV_ABS), code 58
(ABS_MT_PRESSURE), value 207
Event: time 1587922487.150355, -------------- SYN_REPORT ------------
Event: time 1587922487.172261, type 3 (EV_ABS), code 53
(ABS_MT_POSITION_X), value 826
Event: time 1587922487.172261, type 3 (EV_ABS), code 54
(ABS_MT_POSITION_Y), value 977
Event: time 1587922487.172261, type 3 (EV_ABS), code 58
(ABS_MT_PRESSURE), value 183
Event: time 1587922487.172261, -------------- SYN_REPORT ------------
Event: time 1587922487.205326, type 3 (EV_ABS), code 57
(ABS_MT_TRACKING_ID), value -1
Event: time 1587922487.205326, type 1 (EV_KEY), code 330 (BTN_TOUCH),
value 0
Event: time 1587922487.205326, -------------- SYN_REPORT ------------


==== v4 with reverted patch #3 + my hunk applied (works) ====

Input driver version is 1.0.1
Input device ID: bus 0x18 vendor 0x0 product 0x0 version 0x0
Input device name: "Elan Touchscreen"
Supported events:
  Event type 0 (EV_SYN)
  Event type 1 (EV_KEY)
    Event code 330 (BTN_TOUCH)
  Event type 3 (EV_ABS)
    Event code 0 (ABS_X)
      Value      0
      Min        0
      Max     1279
    Event code 1 (ABS_Y)
      Value      0
      Min        0
      Max     2111
    Event code 24 (ABS_PRESSURE)
      Value      0
      Min        0
      Max      255
    Event code 47 (ABS_MT_SLOT)
      Value      0
      Min        0
      Max        9
    Event code 48 (ABS_MT_TOUCH_MAJOR)
      Value      0
      Min        0
      Max      255
      Resolution       1
    Event code 53 (ABS_MT_POSITION_X)
      Value      0
      Min        0
      Max     1279
    Event code 54 (ABS_MT_POSITION_Y)
      Value      0
      Min        0
      Max     2111
    Event code 55 (ABS_MT_TOOL_TYPE)
      Value      0
      Min        0
      Max        2
    Event code 57 (ABS_MT_TRACKING_ID)
      Value      0
      Min        0
      Max    65535
    Event code 58 (ABS_MT_PRESSURE)
      Value      0
      Min        0
      Max      255
Testing ... (interrupt to exit)
Event: time 1587922846.335151, type 3 (EV_ABS), code 57
(ABS_MT_TRACKING_ID), value 0
Event: time 1587922846.335151, type 3 (EV_ABS), code 53
(ABS_MT_POSITION_X), value 565
Event: time 1587922846.335151, type 3 (EV_ABS), code 54
(ABS_MT_POSITION_Y), value 423
Event: time 1587922846.335151, type 3 (EV_ABS), code 58
(ABS_MT_PRESSURE), value 39
Event: time 1587922846.335151, type 3 (EV_ABS), code 48
(ABS_MT_TOUCH_MAJOR), value 10
Event: time 1587922846.335151, type 1 (EV_KEY), code 330 (BTN_TOUCH),
value 1
Event: time 1587922846.335151, type 3 (EV_ABS), code 0 (ABS_X), value 565
Event: time 1587922846.335151, type 3 (EV_ABS), code 1 (ABS_Y), value 423
Event: time 1587922846.335151, type 3 (EV_ABS), code 24 (ABS_PRESSURE),
value 39
Event: time 1587922846.335151, -------------- SYN_REPORT ------------
Event: time 1587922846.464426, type 3 (EV_ABS), code 57
(ABS_MT_TRACKING_ID), value -1
Event: time 1587922846.464426, type 1 (EV_KEY), code 330 (BTN_TOUCH),
value 0
Event: time 1587922846.464426, type 3 (EV_ABS), code 24 (ABS_PRESSURE),
value 0
Event: time 1587922846.464426, -------------- SYN_REPORT ------------

