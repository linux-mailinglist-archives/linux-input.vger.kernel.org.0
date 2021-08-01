Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 04CD93DCCE0
	for <lists+linux-input@lfdr.de>; Sun,  1 Aug 2021 19:19:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229520AbhHARTV (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Sun, 1 Aug 2021 13:19:21 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56096 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229592AbhHARTU (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Sun, 1 Aug 2021 13:19:20 -0400
Received: from mail-pl1-x632.google.com (mail-pl1-x632.google.com [IPv6:2607:f8b0:4864:20::632])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BCD07C06175F;
        Sun,  1 Aug 2021 10:19:11 -0700 (PDT)
Received: by mail-pl1-x632.google.com with SMTP id u2so8676274plg.10;
        Sun, 01 Aug 2021 10:19:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=6x3QWVYNzA8oWY+P2CnHY/LSOtwPRNB5RDZ9JILj+eY=;
        b=ky/IPsSGP1pgCJX+7tKzpqQbcF8UtDmxisvlH8DgENnL54BDKicV0UV3XIICgvK8TL
         ymkgV8EfwN/3pa/Xu0smcU3oNqgJKjpZATBK1MtbKGJqvhAHS5r+6QjAvT/IVkVcOvF2
         bZNxmk5pBUL4KfRtTJluK/fN6Lab9+r0UvO3ejwmoHaKuA9MKTe32GgIl3mMTEr/tEXb
         9dtKwdLJpROQgbjLVWASLPGeMoubl9qow4ZlmaL4m3GmpJ2wgXi8A4tzw04clOqixFeq
         TOIsv4xcmLTU6N70ZrIoT+F8IFan3zTXC+EBtrUdr0rgJ+s2jvhZrIIkzXexwCJULET4
         5tqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=6x3QWVYNzA8oWY+P2CnHY/LSOtwPRNB5RDZ9JILj+eY=;
        b=BJP6wUKUY4zYYgt26MHakNQmdC6dieqeYe79Kh23e5+RBPgzAhfm1BmxhGPCsjgLHf
         0cvwoKQ1+sUn03qj0rFoZukhtCGGmAAJE8IyJACzocxmGcU1CI+GiU2EfR6PyXT6L83V
         UH6Es8crAhmVzgoo29nSlYfh1uBHNpcfSPjHWNS551HK7iTOGcnkb7FLYbZp8qau3opS
         V0Y58Ko5OrySDySBCPH1hFFqRBZZ6W5ew0/0UPNJMMKysleBIdPtsExzC80EZG8DIF6Y
         OCnMISise6ixZGLqYP4z5ltDnMrYcoPk9LYg4IPSPtj9oMB+cT7r4CFDvU4+7IJPEx4S
         bGHQ==
X-Gm-Message-State: AOAM531lRq0dNF88jb6jsJh5YKapBikjsQn90vD7hzSCjWq0ysP6FS7j
        B2S8A5RxmWc1iujJoTOScUg=
X-Google-Smtp-Source: ABdhPJzxn/JWAy+XyIIVy1nAD4L2hpuDqJ97xmYG3WaNsA8mgiRLU83yOqyqEohRIdrB2g8Y1Wno/g==
X-Received: by 2002:a17:902:7d82:b029:12c:5930:98c7 with SMTP id a2-20020a1709027d82b029012c593098c7mr11080561plm.46.1627838350958;
        Sun, 01 Aug 2021 10:19:10 -0700 (PDT)
Received: from google.com ([2620:15c:202:201:f80c:7a7e:9e46:8cee])
        by smtp.gmail.com with ESMTPSA id p17sm8613878pfh.33.2021.08.01.10.19.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 01 Aug 2021 10:19:09 -0700 (PDT)
Date:   Sun, 1 Aug 2021 10:19:07 -0700
From:   Dmitry Torokhov <dmitry.torokhov@gmail.com>
To:     Kees Cook <keescook@chromium.org>
Cc:     Len Baker <len.baker@gmx.com>,
        "Russell King (Oracle)" <linux@armlinux.org.uk>,
        Lee Jones <lee.jones@linaro.org>,
        Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= 
        <u.kleine-koenig@pengutronix.de>, linux-hardening@vger.kernel.org,
        linux-input@vger.kernel.org, linux-kernel@vger.kernel.org,
        Joe Perches <joe@perches.com>
Subject: Re: [PATCH] drivers/input: Remove all strcpy() uses in favor of
 strscpy()
Message-ID: <YQbXiwie4YPzPWKK@google.com>
References: <20210801144316.12841-1-len.baker@gmx.com>
 <20210801145959.GI22278@shell.armlinux.org.uk>
 <20210801155732.GA16547@titan>
 <202108010934.FA668DEB28@keescook>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <202108010934.FA668DEB28@keescook>
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Sun, Aug 01, 2021 at 09:44:33AM -0700, Kees Cook wrote:
> On Sun, Aug 01, 2021 at 05:57:32PM +0200, Len Baker wrote:
> > Hi,
> > 
> > On Sun, Aug 01, 2021 at 04:00:00PM +0100, Russell King (Oracle) wrote:
> > > On Sun, Aug 01, 2021 at 04:43:16PM +0200, Len Baker wrote:
> > > > strcpy() performs no bounds checking on the destination buffer. This
> > > > could result in linear overflows beyond the end of the buffer, leading
> > > > to all kinds of misbehaviors. The safe replacement is strscpy().
> > > >
> > > > Signed-off-by: Len Baker <len.baker@gmx.com>
> > > > ---
> > > > This is a task of the KSPP [1]
> > > >
> > > > [1] https://github.com/KSPP/linux/issues/88
> > > >
> > > >  drivers/input/keyboard/locomokbd.c | 2 +-
> > > >  1 file changed, 1 insertion(+), 1 deletion(-)
> > > >
> > > > diff --git a/drivers/input/keyboard/locomokbd.c b/drivers/input/keyboard/locomokbd.c
> > > > index dae053596572..dbb3dc48df12 100644
> > > > --- a/drivers/input/keyboard/locomokbd.c
> > > > +++ b/drivers/input/keyboard/locomokbd.c
> > > > @@ -254,7 +254,7 @@ static int locomokbd_probe(struct locomo_dev *dev)
> > > >  	locomokbd->suspend_jiffies = jiffies;
> > > >
> > > >  	locomokbd->input = input_dev;
> > > > -	strcpy(locomokbd->phys, "locomokbd/input0");
> > > > +	strscpy(locomokbd->phys, "locomokbd/input0", sizeof(locomokbd->phys));
> > >
> > > So if the string doesn't fit, it's fine to silently truncate it?
> > 
> > I think it is better than overflow :)
> > 
> > > Rather than converting every single strcpy() in the kernel to
> > > strscpy(), maybe there should be some consideration given to how the
> > > issue of a strcpy() that overflows the buffer should be handled.
> > > E.g. in the case of a known string such as the above, if it's longer
> > > than the destination, should we find a way to make the compiler issue
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
> strcpy() and strscpy() under CONFIG_FORTIFY_SOURCE=y.

Is it possible to have them warn always? Or that would be too many false
positives?

> 
> In the past we'd tried to add a stracpy()[1] that would only work with
> const string sources. Linus got angry[2] about API explosion, though,
> so we're mostly faced with doing the strscpy() replacements.

I would like to have an API that would do compile-time checks and
BUILD_BUG_ON() for a few places in input drivers where we copy constant
strings. There is no reason to encumber the code with runtime checks,
and bombing out on compile instead of truncating would be nice.

> 
> Another idea might be to have strcpy() do the "constant strings only"
> thing, leaving strscpy() for the dynamic lengths.
> 
> One thing is clear: replacing strlcpy() with strscpy() is probably the
> easiest and best first step to cleaning up the proliferation of str*()
> functions.

OK, so the consensus is that we set this patch aside as it does not
really fix any issues (the strcpy() destination is 32 bytes and is big
enough to hold the string being copied)?

Thanks.

-- 
Dmitry
