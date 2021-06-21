Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 382503AF8A3
	for <lists+linux-input@lfdr.de>; Tue, 22 Jun 2021 00:38:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231446AbhFUWk7 (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 21 Jun 2021 18:40:59 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56762 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230438AbhFUWk7 (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Mon, 21 Jun 2021 18:40:59 -0400
Received: from mail-pj1-x1036.google.com (mail-pj1-x1036.google.com [IPv6:2607:f8b0:4864:20::1036])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A67C4C061574;
        Mon, 21 Jun 2021 15:38:43 -0700 (PDT)
Received: by mail-pj1-x1036.google.com with SMTP id b5-20020a17090a9905b029016fc06f6c5bso470803pjp.5;
        Mon, 21 Jun 2021 15:38:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=5jTTwbPg5aA08kWmM54tNTs/OmEDeM6LKJVdhYuFH14=;
        b=HBYIAUjX4Mgt1ZnCBVIxrxXOExvlU5RU16L32k9uNAedNlWaX4/eI9Ppgm39VanY/7
         RlkmrLuameKM6FzWhahTvGYxIIqHrZ2uIPCmKv1CNUIMzQmh2+QbnnnOmB0rqgm1cxwI
         6oICzqEr5ndIHmssKrjHeG11ASnt0mnT8OGRWVH2Jd7M0XtxbGO+Oe39V1qnn/801sUO
         iulWXLLDCoJTpgo5F/ffSupKzdsq8dVgthXFglTvJm2KJa4yS7QD2K/F7bcUJzSM6YQA
         /B5qFS1+eN+F1CqusjK5ap4f6q9OCrH8l+o9jgWAwwuVbjRVBhrTh5z6DNlYID7RbD6E
         KlvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=5jTTwbPg5aA08kWmM54tNTs/OmEDeM6LKJVdhYuFH14=;
        b=SvDoseLbIyXW5EvpD1WK4KaJZVxX1ITKkAa55stHhHl5/8VpdJDbSQtyLWCKKB6Mzq
         489PKuJTPy0iKnjy+eF7lMkJJ4ais3KagqTEE9oyZ4EhAUrojzVyAtAn00gvj794uD5K
         eBow1/aFJiGlICBBagy71wqk4Y5Op5/ctu62qPevntrPiQFrschXjevbTltEn53wvlBH
         zEfPVviO/D9w63pzgkEls1PqYnzUJ3I1ik3EZV1VWZkE9UkSUubXWkX0HZUtiPM3MpE/
         dS7SXAmO1XXykPhithEfWQs2yLWtVIHtjqxvjsd/1Yj8EjPiiBKCTeKPyIeqBeAXzknH
         dMmw==
X-Gm-Message-State: AOAM533hskKnsOq8Pd8hqSUxR2OIcDrLCQf71Ba2UWabqPsUDUamfVgG
        sxSOIj+LOb+SgtDhat/108A=
X-Google-Smtp-Source: ABdhPJyLNScOpoMcQHbsjJ8Yf6/kiNt5s8gd8KuU3oQqEu+Y82ySplSBY/UCpVm0X1y30SCnDsA+Lw==
X-Received: by 2002:a17:90a:8589:: with SMTP id m9mr520145pjn.168.1624315123034;
        Mon, 21 Jun 2021 15:38:43 -0700 (PDT)
Received: from google.com ([2620:15c:202:201:a276:c46e:ab3a:dce2])
        by smtp.gmail.com with ESMTPSA id l5sm15871455pff.20.2021.06.21.15.38.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Jun 2021 15:38:42 -0700 (PDT)
Date:   Mon, 21 Jun 2021 15:38:39 -0700
From:   Dmitry Torokhov <dmitry.torokhov@gmail.com>
To:     Alexander Larkin <avlarkin82@gmail.com>
Cc:     torvalds@linux-foundation.org, dan.carpenter@oracle.com,
        linux-input@vger.kernel.org, linux-kernel@vger.kernel.org,
        murray.mcallister@gmail.com, security@kernel.org
Subject: Re: [PATCH] Input: joydev - prevent potential write out of bounds in
 ioctl
Message-ID: <YNEU78BBWy2dS0Dq@google.com>
References: <CAHk-=wjtK7XgQqTE_OyGV8uPX3d1RqUhTQO1D+Bk3wGEiea3Ow@mail.gmail.com>
 <20210621213215.1698347-1-avlarkin82@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210621213215.1698347-1-avlarkin82@gmail.com>
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Hi Alexander,

On Tue, Jun 22, 2021 at 12:32:15AM +0300, Alexander Larkin wrote:
> I'm still studying "git send-email", so the first intro part of prev msg deleted, sorry, again:
> 
> Continuying my previous message, the JSIOCGBTNMAP always returns 1024 return code,
> but not "amount of buttons" like I said before
> (that is probably the size of the keymap that is _u16 keymap[KEY_MAX - BTN_MISC + 1] ).
> Is it correct?
> Reading the line of kernel joydev.c
> 579	len = min_t(size_t, _IOC_SIZE(cmd), sizeof(joydev->keypam)),
> , why the min is always sizeof(joydev->keypam) ?
> If I try to call from the userspace
> ioctl(fd, JSIOCGBTNMAP, buttons)
> where the buttons is "__u16 buttons[5]", then still I get 1024.
> 
> Also I did userspace test (that shows how kernel overwrites (out of array bound) the userspace):
> 1. The buttons is "__u16 buttons[5]" in userspace,
> 2. buttons[5] = 1;
> 3. ioctl(fd, JSIOCGBTNMAP, buttons)
> 4. printf("new %i\n", buttons[5]),
> and the output is "new 0", so the value is being overwritten by kernel (so 1024 bytes copied
> to 10 bytes buffer).
> 
> It looks like I don't understand what is the expected value of the _IOC_SIZE(cmd),
> why not 10 for this read ioctl example? Is it possible to make this ioctl safe, so
> it doesn't copy more data than user can handle?

The definition of JSIOCGBTNMAP is:

#define JSIOCGBTNMAP _IOR('j', 0x34, __u16[KEY_MAX - BTN_MISC + 1])

so the size is encoded in the definition and userspace is supposed to
supply buffer of appropriate size. In your examples you are essentially
are lying to the kernel and say that the buffer size is KEY_MAX -
BTN_MISC + 1 words while in reality you only supply 10 bytes (5 words).

Maybe we should have defined (long time ago)

#define JSIOCGBTNMAP_LEN(len)	_IOC(_IOC_READ, 'j', 0x43, len)

to allow userspace better control over the buffer, but I consider joydev
interface obsolete and all new clients should be using evdev to get
events from input devices. so I am not sure if there is any benefit in
fixing joydev ioctls.

Thanks.

-- 
Dmitry
