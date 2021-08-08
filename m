Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4FE233E39F9
	for <lists+linux-input@lfdr.de>; Sun,  8 Aug 2021 13:31:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230363AbhHHLbX (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Sun, 8 Aug 2021 07:31:23 -0400
Received: from mout.gmx.net ([212.227.15.15]:52729 "EHLO mout.gmx.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229473AbhHHLbX (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Sun, 8 Aug 2021 07:31:23 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
        s=badeba3b8450; t=1628422255;
        bh=W5chU5//YfU3n5/LhSUUVSldCLiEe1+cMgrkYXazda0=;
        h=X-UI-Sender-Class:Date:From:To:Cc:Subject:References:In-Reply-To;
        b=C9NVFolz1ZsuztP7hj7CJh6tZUOPaGkLRIeA11yOMplKcp81SspAM4UApgNIyzct0
         tM8nRFXsYv5+bS9hjP+tDhl3VE1QcY+h+xUO5jQcyD1h7EZOiI11dzIzTCpRKTzhkE
         N27zc9Typcu5BRft/5MU7uZdmw/zIGmLeyxn1Tog=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from titan ([79.150.72.99]) by mail.gmx.net (mrgmx005
 [212.227.17.184]) with ESMTPSA (Nemesis) id 1MiaY9-1moFlA2Fl9-00fitP; Sun, 08
 Aug 2021 13:30:55 +0200
Date:   Sun, 8 Aug 2021 13:30:43 +0200
From:   Len Baker <len.baker@gmx.com>
To:     Joe Perches <joe@perches.com>
Cc:     Len Baker <len.baker@gmx.com>, Kees Cook <keescook@chromium.org>,
        "Russell King (Oracle)" <linux@armlinux.org.uk>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Lee Jones <lee.jones@linaro.org>,
        Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= 
        <u.kleine-koenig@pengutronix.de>, linux-hardening@vger.kernel.org,
        linux-input@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] drivers/input: Remove all strcpy() uses in favor of
 strscpy()
Message-ID: <20210808113043.GA3042@titan>
References: <20210801144316.12841-1-len.baker@gmx.com>
 <20210801145959.GI22278@shell.armlinux.org.uk>
 <20210801155732.GA16547@titan>
 <202108010934.FA668DEB28@keescook>
 <20210807140245.GA2688@titan>
 <0c1d7c01821f1f0891fd8f13c1e8f9a68bb21717.camel@perches.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <0c1d7c01821f1f0891fd8f13c1e8f9a68bb21717.camel@perches.com>
X-Provags-ID: V03:K1:yhtkYHOcv/CHfzZdfq4WcAMbmVNEMTMq971wsGS9ywr1epjn7nE
 1anGABKOQFM/27iH0g27l/ljraDexB9IRu9iidvy8X/LpM2joGccUuJYn98zRJNpxcwF1hH
 4kVyEgb9uCeY8Onw6RSereN+/KNXvT3RnXvdOJrUxK7RXnDvSFgiQIMNPInOon9nvXKypme
 +cp9kDx3Wn2kEYwZssgJA==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:wbeyWHOiozo=:5WOgHNeL5Q45hm6gMdYeBG
 WtTe2QQjS0HdeW5zyT6ibXFFhDJc3tdwylJNHtEWpt2TyFEj5WYb3YrzrxD08eg3Xy/woBHn9
 yEe1nYJtrqknaCyOdbpw6Ki0gGFcNG2smWJdumrE43lrtiX+Pn8oKoDEMPdrraXIVNACGBTLU
 ZX4j1OlOKccvxSoq5KOOEgl92gufFkfZoUE7yXeQwgxWVwr4OkeZToan0kvPPoy1kcaTEDQCm
 ZYsqxGKLO8iB5mbi56GDECJsbkq+a8FLK+arZMRQ8qpQ4jMpxfbWKl1p56zZNGwGJm9OBHs8Y
 fogIgg+H5dXs8bryCTlR4klKFQYyl8CQiR4VFBaZMWnvnRYHDjSRrmB6y0mCY8xyn8mbXO9EQ
 9+YCfUODUW3PDoDCkBfr5faMTYYAZuLsJOBDVwVNbuGJ95SB4ztfyzmj+0DO4Wonl4YySCgkm
 LBnLG/DRJv5Xp7pmaji6AFQcXMYk/PEi4QMs09WOTkWMbJeQqwh0a51+z1asCisPBjIVSSnYB
 eu8v3PywFRBhwHQjENl/7d68Yp4qeJOw1n/LiO2ELjdGzbzRO/ewiv9cm2+Yk1f26WtCwKrIv
 1yhCRyvPiVVjFimBFkybHI4UMqqv7wNftFul18QJttS0jVxkAsuPme4ou5oxtWqyk6dkQSjP9
 FsQPmhnghB5J+nyJgFFx0TuzMonxdVMtiw+kBv8WsE4W8JOYdHXqAXP8WxRLWsi6BbDF0uKTb
 Sbr95zUO9WW1qwlCrUra+4VfJ4rI3ei0d39mkC+R46YRW98TD7jIrcfWIjjmqIhkGN/ZaVYCJ
 gZExeTTDL7cj6JlpXQVNdapx7yXQSRCw2ncdAt6RRBSyMksIh019QOQZ+yVRTe8zGj0LEcuvV
 j9flNdLJojegbi1BK7m8lNh3oJBdw7MM/Sy5af/Nn78vGMR0HlDgXat6OnZ7Z0IYSn4di8YjS
 swWD/W23RYRBHgPJN8h2mEQ18S73GveQDcdvVFQYzSOfR1qXm+9nPtyBaBTkP0rVKqgCFihl5
 J3PM0ngze9EgpdyGDO7AlXxDKGymZXvGntpxQxu7PL416mv5Hw+M82DbL1BJvVbVK9lfxMjhO
 o1GyuBOQ00Q4wiHnSiH9k3kJqWAGTpT/WL0OoH3iTaFhGOnTgXXMOKYUA==
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Hi,

On Sat, Aug 07, 2021 at 08:17:39AM -0700, Joe Perches wrote:
> On Sat, 2021-08-07 at 16:02 +0200, Len Baker wrote:
> > On Sun, Aug 01, 2021 at 09:44:33AM -0700, Kees Cook wrote:
> []
> > > One thing is clear: replacing strlcpy() with strscpy() is probably t=
he
> > > easiest and best first step to cleaning up the proliferation of str*=
()
> > > functions.
> >
> > Thanks for all this info. I will work on it (clean up the proliferatio=
n
> > of str*() functions).
>
> btw:
>
> It's not possible to sed as the return value is different,
> but here is a cocci script that converts strlcpy to strscpy
> when the return value is unused.
>
>     @@
>     expression e1, e2, e3;
>     @@
>
>     -       strlcpy(
>     +       strscpy(
>             e1, e2, e3);
>
> This cocci script was used on sound/ awhile back.
> see commit 75b1a8f9d62e.

Thanks a lot for your help on this. I will take into account all this info=
.

Regards,
Len
