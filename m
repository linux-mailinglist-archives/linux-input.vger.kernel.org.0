Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E79B847BFAD
	for <lists+linux-input@lfdr.de>; Tue, 21 Dec 2021 13:25:28 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237569AbhLUMYv (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 21 Dec 2021 07:24:51 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44968 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237553AbhLUMYu (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Tue, 21 Dec 2021 07:24:50 -0500
Received: from mail-ed1-x536.google.com (mail-ed1-x536.google.com [IPv6:2a00:1450:4864:20::536])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 524E6C061746
        for <linux-input@vger.kernel.org>; Tue, 21 Dec 2021 04:24:50 -0800 (PST)
Received: by mail-ed1-x536.google.com with SMTP id z29so51195197edl.7
        for <linux-input@vger.kernel.org>; Tue, 21 Dec 2021 04:24:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=MoTPJgJK0kZOerSu3Jp9Zb+6CJ0WBkqc48qX6OzMzxM=;
        b=AcXpAvYJL3+SogW72d+2cvTlPfSSLhUoTiSJYa5yyLkarMdsABl5w9RwhqH0iPoECC
         4p4Q/mmwahrfYNtqZ12rTk4/hzDdYnB55guBF4Q44fZDtSe82RNItbEG9yOy+0b3Ot7G
         qEJ2+P1ufHfLZti3MBwimSl/Xv7XCf8L4E1vk/mSyf5G5pW3ZNVxeQe6GCdBwFAv8cXO
         Ha/XIeQUkHoCvCpoAFWSKHdRfSekatwAOQaOyBqL2oo32p4dX7sWGj5vkdnQrFCcxWHV
         mRx7IzyAqKAOkfXnI9i/Gh5F0ZjhRjTSPnNljSTs/5BwuhtBlFmckI+QXGH5ohKnmIDo
         b9/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=MoTPJgJK0kZOerSu3Jp9Zb+6CJ0WBkqc48qX6OzMzxM=;
        b=bjaofSPgat4doSiYkMk138b3NgYHZwbvXcGhTh/pnptMTwF3afGjjRXNX/kFJmMTT1
         4+y/46r3pGTrENZ4XQwz0016ZF545H0HTje7QHXGxcDet90fidycOfkJCjeZmQzVjb/R
         OC7xzJRC18ff4l0YZso9JM9PjmdU2PHAyxhYX4eQPly8ojJpJb3by1mbu+NjB4nV+LNr
         IQg7/8ZhxQ4demXjzCS2uXOmY80UXmszGdxnzPYNOENauUnprhZZ7Z7q2NPsD0SxWRlY
         A6Ud+roWyIVP05CRfT96TfUbI/904YTGgV85eNjoWCdFp7PqwsQPcmxsa7fD94rls6Zn
         9zng==
X-Gm-Message-State: AOAM532y5Eukj0k8ObwogjOsbjXZvVxPRH30AskW0RA0xQ8kYMLjxmYG
        YoHn5fJnjLieJIsFcJxUcOzUsMfTRwzaMmm9ryW9jA==
X-Google-Smtp-Source: ABdhPJyj+NVUeXk90XBlkTzieM83fRys2s8IsWREHaLZ7Vl5Sxqah7M8SCVRkQ/IZz/fkjggv7qm9GS6vSi+KHPu/y8=
X-Received: by 2002:a17:906:4904:: with SMTP id b4mr2606178ejq.174.1640089488801;
 Tue, 21 Dec 2021 04:24:48 -0800 (PST)
MIME-Version: 1.0
References: <20211217144119.2538175-1-anders.roxell@linaro.org>
 <20211217144119.2538175-7-anders.roxell@linaro.org> <YcBiFomrxSw1eEUB@kroah.com>
In-Reply-To: <YcBiFomrxSw1eEUB@kroah.com>
From:   Anders Roxell <anders.roxell@linaro.org>
Date:   Tue, 21 Dec 2021 13:24:38 +0100
Message-ID: <CADYN=9K8fD7sSdTy+mCY6dvjutabLnibs3BoAmv1W4sKcPLpXw@mail.gmail.com>
Subject: Re: [PATCH 4.19 6/6] Input: touchscreen - avoid bitwise vs logical OR warning
To:     Greg KH <greg@kroah.com>
Cc:     stable@vger.kernel.org, linux-kernel@vger.kernel.org,
        woojung.huh@microchip.com, UNGLinuxDriver@microchip.com,
        davem@davemloft.net, netdev@vger.kernel.org,
        linux-usb@vger.kernel.org, clang-built-linux@googlegroups.com,
        ulli.kroll@googlemail.com, linux@armlinux.org.uk,
        linux-arm-kernel@lists.infradead.org, amitkarwar@gmail.com,
        nishants@marvell.com, gbhat@marvell.com, huxinming820@gmail.com,
        kvalo@codeaurora.org, linux-wireless@vger.kernel.org,
        rostedt@goodmis.org, mingo@redhat.com, dmitry.torokhov@gmail.com,
        ndesaulniers@google.com, nathan@kernel.org,
        linux-input@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Mon, 20 Dec 2021 at 11:59, Greg KH <greg@kroah.com> wrote:
>
> On Fri, Dec 17, 2021 at 03:41:19PM +0100, Anders Roxell wrote:
> > From: Nathan Chancellor <nathan@kernel.org>
> >
> > commit a02dcde595f7cbd240ccd64de96034ad91cffc40 upstream.
> >
> > A new warning in clang points out a few places in this driver where a
> > bitwise OR is being used with boolean types:
> >
> > drivers/input/touchscreen.c:81:17: warning: use of bitwise '|' with boolean operands [-Wbitwise-instead-of-logical]
> >         data_present = touchscreen_get_prop_u32(dev, "touchscreen-min-x",
> >                        ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> >
> > This use of a bitwise OR is intentional, as bitwise operations do not
> > short circuit, which allows all the calls to touchscreen_get_prop_u32()
> > to happen so that the last parameter is initialized while coalescing the
> > results of the calls to make a decision after they are all evaluated.
> >
> > To make this clearer to the compiler, use the '|=' operator to assign
> > the result of each touchscreen_get_prop_u32() call to data_present,
> > which keeps the meaning of the code the same but makes it obvious that
> > every one of these calls is expected to happen.
> >
> > Signed-off-by: Nathan Chancellor <nathan@kernel.org>
> > Reported-by: Nick Desaulniers <ndesaulniers@google.com>
> > Reviewed-by: Nick Desaulniers <ndesaulniers@google.com>
> > Link: https://lore.kernel.org/r/20211014205757.3474635-1-nathan@kernel.org
> > Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
> > Signed-off-by: Anders Roxell <anders.roxell@linaro.org>
> > ---
> >  drivers/input/touchscreen/of_touchscreen.c | 18 +++++++++---------
> >  1 file changed, 9 insertions(+), 9 deletions(-)
>
> Also needed in 5.10.y and 5.4.y.
>
> Please be more careful next time.

Yes I will, I'm sorry.

Cheers,
Anders
