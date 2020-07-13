Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2E7F821D3C2
	for <lists+linux-input@lfdr.de>; Mon, 13 Jul 2020 12:29:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729357AbgGMK3O (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 13 Jul 2020 06:29:14 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47270 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728883AbgGMK3N (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Mon, 13 Jul 2020 06:29:13 -0400
Received: from mail-lf1-x143.google.com (mail-lf1-x143.google.com [IPv6:2a00:1450:4864:20::143])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 60635C061755;
        Mon, 13 Jul 2020 03:29:13 -0700 (PDT)
Received: by mail-lf1-x143.google.com with SMTP id k17so8595779lfg.3;
        Mon, 13 Jul 2020 03:29:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=ROwNa64qSxchEG+kY4fFrmxZ7DSyGh7vNLriuITASyo=;
        b=FVH7yoV0vwQBLOIotzDbk5UZspAhdbsxCBd12gEPKVMhyL81KxjGxkz5oLt9AwfODA
         fh2dsgQPUh82ecOnO38cF/ncpj7Xc34ihS3jEv/GmWddShwhD+ImVq1Iq10NXGr+Odo/
         p1mcBok4dzHjkrJB6sIWe+AL/5lj4pLMMy5wIf9O9rleYWjgKZML0quCJBCf0xEUA9uW
         G39E7CVgk6PkzlhYxJ8yN20JWKdvNS5XW23kHn3y4UsAI00BFhZf6oKI3BwhK4ImP2fY
         8a6AzhwkHUJ66GdKw8tcMCP4xjjfJUgybqDIvLF0QHb5obS+AfZ65mCIXX9YaB19aQwN
         vtOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=ROwNa64qSxchEG+kY4fFrmxZ7DSyGh7vNLriuITASyo=;
        b=DnM2ThTExFfzYwMbG5N7EEnXi+JfotktOj6lpabYQiEi8QAzqXf487dHTXJFvMw9AD
         cGxRuG+ccjWvVtwbMpwtY7k9a+AX+VT8Hod4k1RYSlIpJEC1isFhF301iuybFlKqpXUk
         tZpEr6xFfQw4S6A58ia6SO2uFd1zX437eBP/6XsAvjlYqBVrPYfmckqpmcrldINALGtc
         fLDzGxTV0/8nWuNlngjSlb/XBsk5c0BFoqe490RDa1pYzC7m1zfeSLFwsQ8KjD2WZmng
         PxwldBuAr6wtmeYM3pEm1p01IYog7+Y2wYZ0LF3bg5X7fsvJD6cy1k+AY+XS3t73vEAj
         xCAA==
X-Gm-Message-State: AOAM533iJ0aNB6JASVR5Nk0TnLY4GMOs0oidjTOIA3J1V2hmSQRk6DeU
        laFOGtw1gaancWVpKLMnswTibJviYbhNoJTafBU=
X-Google-Smtp-Source: ABdhPJxz4maK+sOWeXA7wvUaczVHLEMa7dkdr7kRuWo4yMFR0Nh80OYo+mGKcapc+h2v8Sqd2BLPuMvDXS22mxAhK00=
X-Received: by 2002:ac2:5629:: with SMTP id b9mr52585478lff.208.1594636151850;
 Mon, 13 Jul 2020 03:29:11 -0700 (PDT)
MIME-Version: 1.0
References: <cpuwolf@gmail.com> <20200710065112.18286-1-cpuwolf@gmail.com>
 <CACa7zykn0q9XJAUvrqnNATr4DUv3Kc7XujF3vm6sfRB5pE6YNQ@mail.gmail.com> <20200713090653.GB3703480@smile.fi.intel.com>
In-Reply-To: <20200713090653.GB3703480@smile.fi.intel.com>
From:   Wei Shuai <cpuwolf@gmail.com>
Date:   Mon, 13 Jul 2020 18:29:00 +0800
Message-ID: <CACa7zympptGqVTx5njTuwNixz1yQ7Zc3Lynx2C4j+NXg8s4u3w@mail.gmail.com>
Subject: Re: [PATCH] Input: break joystick limitation of maximum 80 buttons
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc:     "open list:INPUT (KEYBOARD, MOUSE, JOYSTICK, TOUCHSCREEN)..." 
        <linux-input@vger.kernel.org>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Jeffrey Hugo <jhugo@codeaurora.org>,
        Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
        Borislav Petkov <bp@suse.de>, Mattias Jacobsson <2pi@mok.nu>,
        Mark Gross <mgross@linux.intel.com>,
        Russell King <rmk+kernel@armlinux.org.uk>,
        Erwan Velu <e.velu@criteo.com>,
        Thomas Gleixner <tglx@linutronix.de>,
        open list <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

hi Andy,
sorry from a newbie

we found Linux kernel has max joystick buttons up to 80, no more

We are selling USB joystick device QMCP737C for flight simulator,
which is nothing but common USB joystick. it has 104 buttons

Product link
https://x-plane.vip/quickmade/qmcp737c/

it works well on Windows, Mac, but not on Linux.
Linux kernel exposes /dev/input/js0 max to 80 button, but we have 104 butto=
ns.

I did a lot of google search, but nothing I got. then I have to look
at Kernel source, to find out where this number max 80 comes from

Eventually, I found the final limitation

#define BTN_JOYSTICK 0x120
#define BTN_DEAD 0x12f
#define BTN_TRIGGER_HAPPY 0x2c0
#define KEY_MAX 0x2ff

include/uapi/linux/input-event-codes.h

according to function hidinput_configure_usage() in file drivers/hid/hid-in=
put.c

the joystick button mapping is not a continues space, generally speak
the mapping space is from

BTN_JOYSTICK~BTN_DEAD
BTN_TRIGGER_HAPPY~KEY_MAX

and finally, I got the max limitation is 80.

my question is why KEY_MAX is 0x2ff?  this number 0x2ff looks like not
align with char? integer? the answer is no

so may I ask to expand KEY_MAX to such as 0x4ff?

Andy Shevchenko <andriy.shevchenko@linux.intel.com> =E4=BA=8E2020=E5=B9=B47=
=E6=9C=8813=E6=97=A5=E5=91=A8=E4=B8=80 =E4=B8=8B=E5=8D=885:06=E5=86=99=E9=
=81=93=EF=BC=9A
>
> On Sun, Jul 12, 2020 at 07:54:54AM +0800, Wei Shuai wrote:
> > The joystick max buttons 80 limitation comes from
> >
> > #define BTN_JOYSTICK 0x120
> > #define BTN_DEAD 0x12f
> > #define BTN_TRIGGER_HAPPY 0x2c0
> > #define KEY_MAX 0x2ff
> >
> > include/uapi/linux/input-event-codes.h
> >
> > according to function hidinput_configure_usage() in file drivers/hid/hi=
d-input.c
> >
> > the joystick button mapping is not a continues space
> > generally speaking, the mapping space is from
> >
> > 1. BTN_JOYSTICK~BTN_DEAD
> > 2. BTN_TRIGGER_HAPPY~KEY_MAX
> >
> > Finally, I got the max limitation is 80.
> > The patch is expanding KEY_MAX from 0x2ff to 4ff
> > and the change has been verified on 104 button USB HID device on Ubuntu
>
>
> If you send and resend this patch too often, nobody will take you serious=
ly.
> Also, you have to provide versioning and changelog in each submission.
> Besides that, above doesn't answer to question "why?". Why are you doing =
this
> at all? What the problem?
>
>
> --
> With Best Regards,
> Andy Shevchenko
>
>
