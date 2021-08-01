Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 056853DCC88
	for <lists+linux-input@lfdr.de>; Sun,  1 Aug 2021 18:00:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232331AbhHAQAH (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Sun, 1 Aug 2021 12:00:07 -0400
Received: from mout.gmx.net ([212.227.15.19]:54237 "EHLO mout.gmx.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S232182AbhHAP57 (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Sun, 1 Aug 2021 11:57:59 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
        s=badeba3b8450; t=1627833465;
        bh=uIp/F9cPZ4nbV8lcgGOWiwqQvbgdDT5HQOH7MNboQUM=;
        h=X-UI-Sender-Class:Date:From:To:Cc:Subject:References:In-Reply-To;
        b=Lrs0wwdU5bGq7rpaGbgfrKt1rIViW2k3KwG0JOjakr6Dv/Ymme5MIOmS7O26cTF7e
         0t3Ed8vSmxl/UTxy+ynac2RV2rB7LOSLC+w9+P4CrqzRqwh4buq4/cpgGSayjQ9TMZ
         LtGmc8cKvb13dmU3cNpmajnnRbRpdeBTjteegOlU=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from titan ([79.150.72.99]) by mail.gmx.net (mrgmx005
 [212.227.17.184]) with ESMTPSA (Nemesis) id 1MI5Q5-1mM64E0Brr-00F9h6; Sun, 01
 Aug 2021 17:57:45 +0200
Date:   Sun, 1 Aug 2021 17:57:32 +0200
From:   Len Baker <len.baker@gmx.com>
To:     "Russell King (Oracle)" <linux@armlinux.org.uk>,
        Kees Cook <keescook@chromium.org>
Cc:     Len Baker <len.baker@gmx.com>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Lee Jones <lee.jones@linaro.org>,
        Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= 
        <u.kleine-koenig@pengutronix.de>, linux-hardening@vger.kernel.org,
        linux-input@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] drivers/input: Remove all strcpy() uses in favor of
 strscpy()
Message-ID: <20210801155732.GA16547@titan>
References: <20210801144316.12841-1-len.baker@gmx.com>
 <20210801145959.GI22278@shell.armlinux.org.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210801145959.GI22278@shell.armlinux.org.uk>
X-Provags-ID: V03:K1:p5Rf1W+wH/qK5zk0aP7TDfw6RmKxpBn4zYXQtyvZt/ZS5elNmzr
 SY8rHTHoCbVAHmt0aCGq/wkhNddzUvuz8bg38cyI8qU3Ioh+shl/pYCdKeHOq4a5PHlDRfQ
 0dGtUuDMNYjTgCcpKTKfmt/z8yaJFa1oYpMqe83nzt6k1q+OHkOzIOD2QxmZjpDsbdihjkn
 WgFVZwU9xzgYuaD7rnAQA==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:aNEGxuvMOIQ=:TzqWM9lbo7/128NdyLXnfq
 pq0kHb4NZ4ivvF6bEVriWruLN8at/fWqA7J+Ke6GCwF1NAHyjYpe6P6TiTdN5tWH32rdjm9zy
 j9eiiKy7vDdjKLisZOYSnJ2Ys8r4fsbe2xGeEdX4JGOCdsc74Rrt7+R56whI6acHFbG372WpE
 5gRjAfKQnjFefwaT04FxtMCIuDaig6Mq/BLqYxbW2VOaQ2z7stcqvWyor8CUJrNP0On8bOw1S
 2MYt1FBe2wbL8/0qKJZYLJJA8AuCgtARVNq1xfktOs49NpaYC9qufLw3FZyEMxTZ2l2+xzApv
 xmD26yf3f9HIp+L+oXIA31GdcazM3vPYfl/uDSRqoyZ7u/T0hrNGmeR+6FkwD6/t0WmLxDHBc
 VHMO2thQv0LnzbJV7j1UvFWKu8DzNHeSXI7bFzBt11dVH3ywfknSCsFYh6jDNzLxj25ExZ6Xf
 aDpBaRxpGWUqJZ+ieC9lTk33kEiTRwTyFYgjxM5K6KPt4PvE0eGbYhlLaQEl61DsQLa7fg24p
 Nv5SSeYJsRzTgFP9XPY2Z3VENgAKiodfgM7Fevs/yE2ygDwH73Qw+BgTgzIBTAHiITISKX/oU
 vTyIZda+w01/QWIAFTGAqChRUSjerAh2zwHLIjF/0aOGXhg/WJtoiiU2hwQHOUq/Y47C2Plwu
 1k6Wn2l/sTmHZMUF9Igcs+6f4wZQ9XyWkVv0NMYxs88vpSvqsraJqru4HtUpeBPM4fCdebRHU
 9XY6Z/k/k5egUrrWoerSrXyX29SAjVycAn95RqJZb4ZEy9AfZxKhMre2NdM6dcJmJuFJDuyI/
 8tO9Fy6jBLTI/Ir+2O2cYCKvZU3UdUAonJrWWSUMimFI53Uv2xarD4EZwMoDVR1vKArue4RNV
 Z4qPG0GoKSgJIMk713BWiIuXAeszTRVatrSeKFSq0HGNTqsCnhJu1h08U7z9Ububq530RXsAB
 Yo1OG8wIl5+Gb9lkanbyAdCmxyzttQMPubYHS81+Z5JNwehqZWlfyKRynIfcMgteLE4akvPCG
 UbOLYt1Xhd5zIi2kzITxqCZ2zDVhyevO4klcFtT3hwuiVddntPOQApN39x2yvTwr6Ja1/uZpJ
 dfZojggF5QfAjmFu0UK1Y09VhLOuAASbLmy
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Hi,

On Sun, Aug 01, 2021 at 04:00:00PM +0100, Russell King (Oracle) wrote:
> On Sun, Aug 01, 2021 at 04:43:16PM +0200, Len Baker wrote:
> > strcpy() performs no bounds checking on the destination buffer. This
> > could result in linear overflows beyond the end of the buffer, leading
> > to all kinds of misbehaviors. The safe replacement is strscpy().
> >
> > Signed-off-by: Len Baker <len.baker@gmx.com>
> > ---
> > This is a task of the KSPP [1]
> >
> > [1] https://github.com/KSPP/linux/issues/88
> >
> >  drivers/input/keyboard/locomokbd.c | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > diff --git a/drivers/input/keyboard/locomokbd.c b/drivers/input/keyboa=
rd/locomokbd.c
> > index dae053596572..dbb3dc48df12 100644
> > --- a/drivers/input/keyboard/locomokbd.c
> > +++ b/drivers/input/keyboard/locomokbd.c
> > @@ -254,7 +254,7 @@ static int locomokbd_probe(struct locomo_dev *dev)
> >  	locomokbd->suspend_jiffies =3D jiffies;
> >
> >  	locomokbd->input =3D input_dev;
> > -	strcpy(locomokbd->phys, "locomokbd/input0");
> > +	strscpy(locomokbd->phys, "locomokbd/input0", sizeof(locomokbd->phys)=
);
>
> So if the string doesn't fit, it's fine to silently truncate it?

I think it is better than overflow :)

> Rather than converting every single strcpy() in the kernel to
> strscpy(), maybe there should be some consideration given to how the
> issue of a strcpy() that overflows the buffer should be handled.
> E.g. in the case of a known string such as the above, if it's longer
> than the destination, should we find a way to make the compiler issue
> a warning at compile time?

Good point. I am a kernel newbie and have no experience. So this
question should be answered by some kernel hacker :) But I agree
with your proposals.

Kees and folks: Any comments?

Note: Kees is asked the same question in [2]

[2] https://lore.kernel.org/lkml/20210731135957.GB1979@titan/

Regards,
Len
