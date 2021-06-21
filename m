Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 944603AE2BB
	for <lists+linux-input@lfdr.de>; Mon, 21 Jun 2021 07:25:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229567AbhFUF12 (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 21 Jun 2021 01:27:28 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48178 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229486AbhFUF11 (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Mon, 21 Jun 2021 01:27:27 -0400
Received: from mail-pj1-x102b.google.com (mail-pj1-x102b.google.com [IPv6:2607:f8b0:4864:20::102b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E6EF8C061574;
        Sun, 20 Jun 2021 22:25:12 -0700 (PDT)
Received: by mail-pj1-x102b.google.com with SMTP id t19-20020a17090ae513b029016f66a73701so4510053pjy.3;
        Sun, 20 Jun 2021 22:25:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=1qVAoYNk5ZopylsEj2qCzbf543VF7z7ZlB5UYvXcDuI=;
        b=o8cXAWOYVtQerhlY9qg+MFlJo6FPNgDQscSbfLfanhgNNooHFb1DOPVyw9XR3LCRPq
         dFKL4xFyDp6SUGi/7EcgmyHWs45UEVR0VJQd/PnM+K5AwVDOc5Bd1/i3QKVy4uQjxugO
         QDY45KOfVk+ySEbwdtJSdjXNC2v7cJT7QgMoi3w9/03MHePlzt22jT/I1MfcD6n7jlch
         Ei7QEEUrl1XJO3I/Hk2GfxRXlNygIYlEHqoW6qH/5vM5FEIUfwMo5PKrf80c4wtzsQEu
         vjU95k9JBjWiMpT5tMfdhXMKlne6HdPlkpPxpPKYFTeChbfB/ZHRQfPdJCOBYRYBm3jb
         4JVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=1qVAoYNk5ZopylsEj2qCzbf543VF7z7ZlB5UYvXcDuI=;
        b=UeZ3we64/69R03o3pFX43YQQoU+88hrVaXKHCbeDyIsBGyPs4Wkmxoiex0uCz2hiyB
         deavNBR+zurtU5nFK9Mgec3ZADGtYODY24RyCbD/cPxHho2uN9GlkORkqbwyzdYhjskQ
         BOcdPOU4BPSFuQguPdfu76UlLdGb8QeNhcsGgbn9XqbSFbpTKREJwY56cXZeA++jB2N6
         ivXBsRG/cNFV7E6AgdzNF9wlFRxLsRaDgKT8LE4VV1v+8dOswlvzzzIMyexTY6jxaCIV
         mlo2Ae/GlzpYXn1mJBVJczuPjNVG6RUdGuhj5XdaVZ+HEpQ/11WW8KKd70hCeb1Dp1Nq
         utWA==
X-Gm-Message-State: AOAM532fu+vK/BWBAramedvpkooweTIygn+bh3P4xRnrWKT6Gq+32FDw
        jvgT+fZHb7lQ4FVmcWQpNl2csDO4yAM=
X-Google-Smtp-Source: ABdhPJzJJGTDm3OMi6Ry4Jn28iYe9McE/TLPRyz1L+rmBGOn7vyxdANL/JSPvMEwwzjTlmgXVx2iGg==
X-Received: by 2002:a17:902:d909:b029:11b:870f:ddad with SMTP id c9-20020a170902d909b029011b870fddadmr16374023plz.81.1624253112211;
        Sun, 20 Jun 2021 22:25:12 -0700 (PDT)
Received: from google.com ([2620:15c:202:201:df5a:b40e:40c9:a3e7])
        by smtp.gmail.com with ESMTPSA id w123sm13835706pfb.109.2021.06.20.22.25.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 20 Jun 2021 22:25:11 -0700 (PDT)
Date:   Sun, 20 Jun 2021 22:25:08 -0700
From:   Dmitry Torokhov <dmitry.torokhov@gmail.com>
To:     Linus Torvalds <torvalds@linux-foundation.org>
Cc:     Alexander Larkin <avlarkin82@gmail.com>,
        Dan Carpenter <dan.carpenter@oracle.com>,
        linux-input@vger.kernel.org, lkml <linux-kernel@vger.kernel.org>,
        Security Officers <security@kernel.org>,
        Murray McAllister <murray.mcallister@gmail.com>
Subject: Re: [PATCH] Input: joydev - prevent potential write out of bounds in
 ioctl
Message-ID: <YNAitJfOpoBkFitU@google.com>
References: <20210620120030.1513655-1-avlarkin82@gmail.com>
 <CAADWXX-fpcPh+jGX7=Hbkqr7yhwzbUT915NBBzqHGecFVbxmzw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAADWXX-fpcPh+jGX7=Hbkqr7yhwzbUT915NBBzqHGecFVbxmzw@mail.gmail.com>
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Sun, Jun 20, 2021 at 09:37:47AM -0700, Linus Torvalds wrote:
> On Sun, Jun 20, 2021 at 5:01 AM Alexander Larkin <avlarkin82@gmail.com> wrote:
> >
> >     The problem is that the check of user input values that is just
> >     before the fixed line of code is for the part of first values
> >     (before len or before len/2), but then the usage of all the values
> >     including i >= len (or i >= len/2) could be.
> 
> No, I think the problem is simpler than that.
> 
> > -       for (i = 0; i < joydev->nabs; i++)
> > +       for (i = 0; i < len && i < joydev->nabs; i++)
> >                 joydev->absmap[joydev->abspam[i]] = i;
> 
> This part is unnecessary - all values of "joydev->abspam[i]" have been
> validated (either they are the old ones, or the new ones that we just
> validated).
> 
> >         memcpy(joydev->keypam, keypam, len);
> >
> > -       for (i = 0; i < joydev->nkey; i++)
> > +       for (i = 0; i < (len / 2) && i < joydev->nkey; i++)
> >                 joydev->keymap[keypam[i] - BTN_MISC] = i;
> 
> The problem here is not that we walk past "len/2", but that the code
> *should* have used
> 
>         joydev->keymap[joydev->keypam[i] - BTN_MISC] = i;
> 
> (note the "keypam[1]" vs "joydev->keypam[i]").
> 
> And the reason it *should* walk the whole "joydev->nkey" is that if
> there are later cases with the same keypam value, the later ones
> should override the previous ones (well, that "should" is more a
> "traditionally have").

Yes, we can discuss whether "short" ioctl should clear out the part of
map that is not supplied by the call, but given that I consider joydev
legacy my preference would be to leave this as it was.

> 
> So I think the right patch is this one-liner
> 
>   diff --git a/drivers/input/joydev.c b/drivers/input/joydev.c
>   index da8963a9f044..947d440a3be6 100644
>   --- a/drivers/input/joydev.c
>   +++ b/drivers/input/joydev.c
>   @@ -499,7 +499,7 @@ static int joydev_handle_JSIOCSBTNMAP(struct
> joydev *joydev,
>         memcpy(joydev->keypam, keypam, len);
> 
>         for (i = 0; i < joydev->nkey; i++)
>   -             joydev->keymap[keypam[i] - BTN_MISC] = i;
>   +             joydev->keymap[joydev->keypam[i] - BTN_MISC] = i;
> 
>     out:
>         kfree(keypam);
> 
> (whitespace-damaged, I would like Dmitry to think about it rather than
> apply this mindlessly.
> 
> Dmitry?

Yes, this makes sense to me and it is safe as joydev->keypam is
guaranteed to be the right size.

Are you going to reformat this and resend or should I?


Thanks.

-- 
Dmitry
