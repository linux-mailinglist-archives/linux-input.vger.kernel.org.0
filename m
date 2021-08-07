Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F2FC33E35C5
	for <lists+linux-input@lfdr.de>; Sat,  7 Aug 2021 16:03:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232290AbhHGODf (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Sat, 7 Aug 2021 10:03:35 -0400
Received: from mout.gmx.net ([212.227.15.18]:48217 "EHLO mout.gmx.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S232315AbhHGODe (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Sat, 7 Aug 2021 10:03:34 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
        s=badeba3b8450; t=1628344979;
        bh=k2GBgCmqU8bcXXxwqYT8+wy/dE6s67X00p5yc0rN0OU=;
        h=X-UI-Sender-Class:Date:From:To:Cc:Subject:References:In-Reply-To;
        b=AXsiYcIHZyY5fRJDsGzDyoay2LWSj2JUR/QgIoGUZGhFdJatRsatPBafTtCS423/B
         tlNRVLflnI1AODFzskSUFzSnwzmrvFOFzeMMcwe8sG5VleBXruRsC+YGozCCJUDkyC
         6eJDCoysQL0M1e/m1DQhDq8KokFmEbgwa+DnLvI8=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from titan ([79.150.72.99]) by mail.gmx.net (mrgmx005
 [212.227.17.184]) with ESMTPSA (Nemesis) id 1MtfJd-1mzX7l3fDT-00vASB; Sat, 07
 Aug 2021 16:02:59 +0200
Date:   Sat, 7 Aug 2021 16:02:45 +0200
From:   Len Baker <len.baker@gmx.com>
To:     Kees Cook <keescook@chromium.org>
Cc:     Len Baker <len.baker@gmx.com>,
        "Russell King (Oracle)" <linux@armlinux.org.uk>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Lee Jones <lee.jones@linaro.org>,
        Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= 
        <u.kleine-koenig@pengutronix.de>, linux-hardening@vger.kernel.org,
        linux-input@vger.kernel.org, linux-kernel@vger.kernel.org,
        Joe Perches <joe@perches.com>
Subject: Re: [PATCH] drivers/input: Remove all strcpy() uses in favor of
 strscpy()
Message-ID: <20210807140245.GA2688@titan>
References: <20210801144316.12841-1-len.baker@gmx.com>
 <20210801145959.GI22278@shell.armlinux.org.uk>
 <20210801155732.GA16547@titan>
 <202108010934.FA668DEB28@keescook>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <202108010934.FA668DEB28@keescook>
X-Provags-ID: V03:K1:amRQlmS54gZGkHnWWCdXUYB3d9D2joe3Nw3fVBvlzuvomE/U182
 fbj7U6CE+xYDWDdbvGcDAZTIPBN6HTjOWjdKkWWI0WejGewvXI2j0lLMe0UvrJ3GpoQmIJH
 97/nCOVcvLQpOXygEJSCRJoCmvKo5/QZcb0s12M0fRbNqmBSRb+NF5GrWeDvb12X6lnYeBn
 jMLvVXF5zVzCdr5q682gg==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:Sgos5+f0fYQ=:JjX6QYB9fgrvcGWpoc/vzv
 OVtkQ0XC/IMZtQJanushKADSO8HD0xdDs8vr3ViRh4WKXZC8rWp5pnXuZLQZnitp5YIstK0nd
 LivNQnhTtRToPkETh9fbl7BnnWGY1fKpEI/0JuZzFPRo+l9sLZFtFBi/fJBHzwh0zuM3PkSSz
 jYQsElRMy4NzEFVkv2tM+fP0YTaKfrkCqVVAcRPnoXyXzybz/JShtQLk1yVvJlbVoWK0X3Jnq
 MRJgncadwl1gaSYTvrZwfYd6erqV4zkICb8l1l1Dl+fcOw3YJUnLKgd9hCRm+bvHxqVEORVCI
 X5q274xyuGEtuMzKDLP5AxS4MN04kLyVZ8eSPLzLlW1pbJmPA5K7br1Qs6QAOAhg+17RG3yKP
 Zma5I/11/e/Vs/y79hcW0fT0twbFfBLJIT4a601w8bUjj6IDfXFSdh6fnDMtQErrjttgMRQmR
 XS43Bsdf03wWfdDVpm2o1JepaIs6gxc+yh+fLawv4OGTGQclc21vhLM8pDWnXTuf4IamwpS71
 lHPol9fpGxCYzqDPQjchy5PHTp3T+sp73otBKiMAbeFACBee/y25Rfh/8wENJuQuIpuV8bISN
 JxA6s+F5IgzKenuUYDUS9enn16wtClSkhAE52sz0sISA+hGSywyU+teDeo1A+v5o7a1CVYtcH
 W3ZpXB94UxmRGK6xBivGAh9Ohf1LhOqQS/fEv2JzL/6vyLNN8yB9POiIOfgTYAvYLc2DSatN5
 PVgEHbkUGJipXPHE4SW7PJpqujOAdT2xW7LsA8GN5zovI65xPymwfuMWdQe69pWjRvalQzpaE
 jfQkjj5IPORo4zyaYGiLhDyz90VSlFy62SD2GrHiWCc3coPVS7GiGn1nVHKTwhoWBcnYXO/ae
 8fGxtKzvw66AYSWUzHxZ5nhe+6cIal1KyCM8naISewCRurLjG0VMK6nfuZZ9I4zUWETXwSqJ0
 xrYrlxWqM6j0azPkvckimLYk+I7xSsbhnVSjX+kCkm2l3oZrQrkKoOwGVgoOKK0xE62YMTsbV
 A1frs5n8CMvurOZIyAPvMVlsPrWRedVN+jHeeWZKfahUcnQYChfYL8qyLEv+dFpQQbyPd7kyQ
 jYC1pNEZ5j21F/MC0nYFuGq/0WjA1aNzgHyOPeQjbELKHBWRCxtamC3Zg==
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Hi,

On Sun, Aug 01, 2021 at 09:44:33AM -0700, Kees Cook wrote:
> On Sun, Aug 01, 2021 at 05:57:32PM +0200, Len Baker wrote:
> > Hi,
> >
> > On Sun, Aug 01, 2021 at 04:00:00PM +0100, Russell King (Oracle) wrote:
> > > Rather than converting every single strcpy() in the kernel to
> > > strscpy(), maybe there should be some consideration given to how the
> > > issue of a strcpy() that overflows the buffer should be handled.
> > > E.g. in the case of a known string such as the above, if it's longer
> > > than the destination, should we find a way to make the compiler issu=
e
> > > a warning at compile time?
> >
> > Good point. I am a kernel newbie and have no experience. So this
> > question should be answered by some kernel hacker :) But I agree
> > with your proposals.
> >
> > Kees and folks: Any comments?
> >
> > Note: Kees is asked the same question in [2]
> >
> > [2] https://lore.kernel.org/lkml/20210731135957.GB1979@titan/
>
> Hi!
>
> Sorry for the delay at looking into this. It didn't use to be a problem
> (there would always have been a compile-time warning generated for
> known-too-small cases), but that appears to have regressed when,
> ironically, strscpy() coverage was added. I've detailed it in the bug
> report:
> https://github.com/KSPP/linux/issues/88
>
> So, bottom line: we need to fix the missing compile-time warnings for
> strcpy() and strscpy() under CONFIG_FORTIFY_SOURCE=3Dy.
>
> In the past we'd tried to add a stracpy()[1] that would only work with
> const string sources. Linus got angry[2] about API explosion, though,
> so we're mostly faced with doing the strscpy() replacements.
>
> Another idea might be to have strcpy() do the "constant strings only"
> thing, leaving strscpy() for the dynamic lengths.
>
> One thing is clear: replacing strlcpy() with strscpy() is probably the
> easiest and best first step to cleaning up the proliferation of str*()
> functions.

Thanks for all this info. I will work on it (clean up the proliferation
of str*() functions).

Regards,
Len

>
> -Kees
>
> [1] https://lore.kernel.org/lkml/ed4611a4a96057bf8076856560bfbf9b5e95d39=
0.1563889130.git.joe@perches.com/
> [2] https://lore.kernel.org/lkml/CAHk-=3DwgqQKoAnhmhGE-2PBFt7oQs9LLAATKb=
Ya573UO=3DDPBE0Q@mail.gmail.com/
>
> --
> Kees Cook
