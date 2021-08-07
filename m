Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 045223E35CE
	for <lists+linux-input@lfdr.de>; Sat,  7 Aug 2021 16:10:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232317AbhHGOKl (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Sat, 7 Aug 2021 10:10:41 -0400
Received: from mout.gmx.net ([212.227.15.18]:55143 "EHLO mout.gmx.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S232313AbhHGOKh (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Sat, 7 Aug 2021 10:10:37 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
        s=badeba3b8450; t=1628345415;
        bh=2XyimEmEYl/lKBquM6tBAeYoKZJpmmbSuZhTtFJNPfQ=;
        h=X-UI-Sender-Class:Date:From:To:Cc:Subject:References:In-Reply-To;
        b=JAEdCpjTpcvxUtqH9t5WGPE93ZpRSGN77jaBFcDDpn3AQ9nSK+8dO/nFrsHU4iyDH
         Dy0Roz/TZKSe3GTw8viANuw8LMGDDjqdO7sRvrb111Ss6YBeVIFqz4OMv4qoVr7CDc
         jyoumrYrV29Dm+7EqgVMvJYVQpyGGHsSGw0C9+ug=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from titan ([79.150.72.99]) by mail.gmx.net (mrgmx004
 [212.227.17.184]) with ESMTPSA (Nemesis) id 1MHXFr-1mPrZH2nZ3-00DTpV; Sat, 07
 Aug 2021 16:10:14 +0200
Date:   Sat, 7 Aug 2021 16:10:09 +0200
From:   Len Baker <len.baker@gmx.com>
To:     Joe Perches <joe@perches.com>
Cc:     Kees Cook <keescook@chromium.org>,
        "Russell King (Oracle)" <linux@armlinux.org.uk>,
        Len Baker <len.baker@gmx.com>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Lee Jones <lee.jones@linaro.org>,
        Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= 
        <u.kleine-koenig@pengutronix.de>, linux-hardening@vger.kernel.org,
        linux-input@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] drivers/input: Remove all strcpy() uses in favor of
 strscpy()
Message-ID: <20210807141009.GB2688@titan>
References: <20210801144316.12841-1-len.baker@gmx.com>
 <20210801145959.GI22278@shell.armlinux.org.uk>
 <922b0d99b6397adc44761abaed12c019dc0b9e88.camel@perches.com>
 <4962ac72a94bc5826960dab855b5e2f47a4d1b9a.camel@perches.com>
 <202108020912.3807510B4B@keescook>
 <30984a540fb8e340c12e52054cdf7d6478b8b960.camel@perches.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <30984a540fb8e340c12e52054cdf7d6478b8b960.camel@perches.com>
X-Provags-ID: V03:K1:ZDyRuhCSgMs++8d5awfaqKJBTxJVs4wIK4CaVmZFFcgvZo3+JNH
 JVsTnL949m6zxijXU+WNWKKhSkOXAB+0m1UvrdXOezJZ56WJJkkMuVE6r8UFebu918XBpoC
 7a3lJ1m60uKxhKZhVapCdhBKfeTo9HsPpS68ibikj1+RNhKQ/1i4sITVUJ5/jHoIbyJ5DTQ
 YsW+ZuPBQBKB704ol1mcg==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:Apm4scjDcJ8=:expUrFCzODpmgOcIy7HXlX
 XpdnE0c/36E5WcocYptWAnyY2l2HZCr9A2ybzLvTHWNg8f7c69uUmEMJEUw6uIOoqDNF0pcm4
 Z8rhPzti5TjjV3KL7F2KaAereLZc+crt0ak8L8T49YmHbDGGLFR0hjpwmJ0nGRsFBHMKwM7MR
 cgJ6jvNUw+EP39Jvrge0rQU8MXlIO2t4DeUKVho8pWUcD9NwQURbbq6MghGLMhmCHEXevIVWS
 IHeCgBQ+/pme3H4kKsBiDFA4j3GgeO7YKzv5HEq+MZabcseseS+My0pcfKaR1RkodblDEleZY
 3GEwhWHuXLkVHSyn1EpB47hrwUSmoHI6q5dE4bIhhYLo4bAOC7+DisXV2/xW1Qh2U9Gc9WhO8
 p21r4bGF3SbvbYBUtK++ZIwX4kjJqT4lajxHKbpRaDGXYRcu5dSD96Q5gVlyJxAU2z6trpv5+
 DWupr8dUbGALL6wofLUpMFsQRw7EKKAywYlshcrbkLWhEbZvdlD7q1tYRZdAuuo4Y1kSflPv0
 kfEFqKBqNvryPE1Uv3XnCOk2GYTY9IBPTDAiz+V9fIDM6GuIqIWZe7UGxXey117iOiZqpRqC6
 hphM7L6HDPfs3W1ItlN6DRO1Y/ZIetyw5hZkHWgjOZtVwYaq0Mj3xJYtGmDJJEiocaAHGuccw
 wWSkqmaQ4Zo7xLhwDZQvJH5W7wScLY1580nGeLlKK1gq+5IBL+q4bIIE0qL5f8OJ7m1yIN6QR
 KMgdzkesMiLP++RcwszuKwK4j+3lNMyGnxRdAcPLsR8qgjUQKEMKjVSXUi63wRbq4UqJW3XK8
 PTWRwpBHdhlsSMoomRYF1WXYTEyBnAviRjAx8rjLhBVkLQYgX/kh8toXB1LGH08iewdqaGYR4
 UZRXy1ZNcARW/orxvU1y3tc8cJku5waOzcyIYMA0VRiBKKf1PYeJy7UKzOJrxo2pAvp2IRyQe
 exuf8MvbbJhQqtlZ43fkb3/1aRsxQPsaaEW+EWgGJIHyk+eoMvqIYVG0PtmJ+VqYhlzCs/3bA
 XULSNCqC2Kp4BVAIZnQCfT7pRFO8qTX5mBpE7rE/RPEVFL74+Ak6Or5w+iBwc/GAJxAW2q+Fz
 Icpzed3X4xTE8PkdLZeKZH2g57h3sNe7vZlaQ8Pze/nb3U1KU3IT81TiA==
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Hi Joe,

On Mon, Aug 02, 2021 at 11:57:40AM -0700, Joe Perches wrote:
> On Mon, 2021-08-02 at 09:13 -0700, Kees Cook wrote:
> > I'm wondering, instead, if we could convert strcpy() into this instead
> > of adding another API? I.e. convert all the places that warn (if this
> > were strcpy), and then land the conversion.
>
> Perhaps not as strcpy is a builtin.
>
> It might be easier as a cocci script.  Something like:
>
> @@
> char [] dest;
> constant char [] src;
> @@
>
> *	strcpy(dest, src)
>
> There are some additional test that needs to be added so that
> only length(src) > length(dest) is reported.
>
Thanks for the ideas. I will think on this.

Regards,
Len
