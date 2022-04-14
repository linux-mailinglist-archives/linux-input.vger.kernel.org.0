Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id BCB8B501607
	for <lists+linux-input@lfdr.de>; Thu, 14 Apr 2022 17:47:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240651AbiDNOrF (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 14 Apr 2022 10:47:05 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50402 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1343917AbiDNOJd (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Thu, 14 Apr 2022 10:09:33 -0400
Received: from mail-lf1-x135.google.com (mail-lf1-x135.google.com [IPv6:2a00:1450:4864:20::135])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 247C6B0D02
        for <linux-input@vger.kernel.org>; Thu, 14 Apr 2022 07:01:43 -0700 (PDT)
Received: by mail-lf1-x135.google.com with SMTP id u19so9271907lff.4
        for <linux-input@vger.kernel.org>; Thu, 14 Apr 2022 07:01:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=iSm/4CMJrzAb5nZSUwEnEIJgkv5AdD6FqaBeZPlRMBE=;
        b=IyKHDZpEHYEL+kEydgx22b9VJbJwbTouMDG0wRA9RzcxX+2eDs1zvwqVRdB7vJ7jQk
         +7juW7PjXMP3K/OzPAvqjExOOLayN4DxRBzWBUGe9pw1I7m8IccK9gSb9AAfXRX84dIy
         tesZhP/rqoVQBiPveCjB7zvot8vC51JNPD3t8pdYSu1TV83izxK6LpuwazMyziCpWJUF
         s76bRmrRh32IrQH5Z6BXrOgtwKVH8nWc+QUf71iPdylc2RRa/hLDnLI8Ryg1+PSaNaWI
         FvyQ1is9+U6UETl1QqnjW5czCkPJjX0jF8mCWH8c7oxS4IQXCl7gQ8qp4D0RLA9giul/
         RNHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=iSm/4CMJrzAb5nZSUwEnEIJgkv5AdD6FqaBeZPlRMBE=;
        b=Q6UJCEy9ijdNCK/JkK8pOi/R6/9vNs4Wl4b8hlkkW4FDdtf6ZBVN6djJmkHheCEf15
         3qKBci3EFtZCGLYmqsQfGTIIBFnn1j/pJhJyOYv4aHWkOnoxOCdj21O6pd1VRA+B1DOG
         wNZfMm7Z14BclWs/OwhqGF4FYAi06SKbwKu25cCOHE6BgkdxfyDphY9QQui7vBtl4nFy
         LRMvIeSWbsRh0N0H3Y3S4W74R4W2WpgoluSrnxqUpCgR3mfECJcvs7+O2URVT5RanQ/p
         kepdGF5CY7guG92t/n0BnC9pB+O0p2zP+f2aA3Td+JU0L/o3bVRiCG0y7vXI3CuzI2XU
         YMSg==
X-Gm-Message-State: AOAM530ekkpP4J6IzHGiOj7N37J8JPj9qF4F5IPCYOPeGdiOzpuASK9Q
        MNlWP8Rbs2PyzNOrOYrRGr72LqauT8iA5dsFn+0djlkbDBg=
X-Google-Smtp-Source: ABdhPJwye+Z6I2u0K6i5obVzAjlyLDdko7qv9DJa6JqeqruIL4ivSGxqGFJ4h8p3bht5A9VjzKaJFKZAtWKwBDsS/HY=
X-Received: by 2002:a05:6512:2102:b0:46b:b6f2:83ab with SMTP id
 q2-20020a056512210200b0046bb6f283abmr1989460lfr.202.1649944901883; Thu, 14
 Apr 2022 07:01:41 -0700 (PDT)
MIME-Version: 1.0
References: <CAO3Us=m-Tj2yrt4=1nnr=CgUA2LR29W5DbPAP4T8xwt2VS=FnA@mail.gmail.com>
 <CA+jURctcSHLb3-7VYpUUP9_RF_71xgWnM-v8UwcynRZkdHYDkg@mail.gmail.com>
In-Reply-To: <CA+jURctcSHLb3-7VYpUUP9_RF_71xgWnM-v8UwcynRZkdHYDkg@mail.gmail.com>
From:   Marcos Alano <marcoshalano@gmail.com>
Date:   Thu, 14 Apr 2022 11:01:30 -0300
Message-ID: <CAO3Us=mnboZut6AJnqbT6Okc+ABmSUGzESeQHe-pwXCmSq04Og@mail.gmail.com>
Subject: Re: Getting the raw keycode to implement a new key in Linux
To:     Harry Cutts <hcutts@chromium.org>
Cc:     HID CORE LAYER <linux-input@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Thanks for the tip!

I found the scancode in dmesg log. After that, I used udev to
implement a rule to mute the microphone. Now I need to develop or use
an existent daemon to control the boost mode. I think it won't need
any incursion in kernel code. :)

On Tue, Apr 12, 2022 at 10:20 PM Harry Cutts <hcutts@chromium.org> wrote:
>
> On Tue, 12 Apr 2022 at 16:29, Marcos Alano <marcoshalano@gmail.com> wrote:
> > I have a Dell G15 5511 laptop and this machine has a very particular
> > feature: a key called "G- key" (accessed pressing Fn+F7) which is used
> > (on Windows at least) to do a boost in the machine. The details about
> > how this boost works is not the question here. The question is: How
> > can I find, in the kernel level, what code is emitted? I want to know
> > that, so I can start hacking around and come up with a patch, so the
> > key can be recognized by the OS, so a user space daemon can be
> > triggered to do the boost part (or any other action).
>
> Probably the best starting place is to run the evtest command, choose
> your keyboard, and press the key. That should at least give you an
> MSC_SCAN line giving you the scan code, unless Dell have done
> something in their keyboard controller to treat Fn+F7 as something
> other than a normal keypress.
>
> Harry Cutts
> Chrome OS Touch/Input team



-- 
Marcos H. Alano
Linux System Administrator
marcoshalano@gmail.com
