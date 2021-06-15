Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9D75B3A89AF
	for <lists+linux-input@lfdr.de>; Tue, 15 Jun 2021 21:41:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229946AbhFOToB (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 15 Jun 2021 15:44:01 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54510 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229898AbhFOToB (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Tue, 15 Jun 2021 15:44:01 -0400
Received: from mail-pj1-x102e.google.com (mail-pj1-x102e.google.com [IPv6:2607:f8b0:4864:20::102e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 705BEC061574;
        Tue, 15 Jun 2021 12:41:55 -0700 (PDT)
Received: by mail-pj1-x102e.google.com with SMTP id x21-20020a17090aa395b029016e25313bfcso317368pjp.2;
        Tue, 15 Jun 2021 12:41:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=f6/i5s8IOzCUxNSyaYvlK4MuXc588RPfZhmyhczPhoM=;
        b=WBPbfro2NwATm3JEz1Lg4fLKfLoX9TbPrF2j5G6OvxuIWu42YzPvjntCGsNjz+hlRd
         OCMLh+uE8u7spUQyarI/anBiSczOW3GVEkR4erCABZJ0Zgrzh9F3ZvxRFfimRRR0Y1cz
         rpPPtbnlrZyB3qU0YGCwDJnD1VIi6fejznBKQ0SYBb/NR23U/2hWucitbpc1nkw5XJna
         Ob9Q5ZDVZmU02N653mtAnfxUXiaK6YSNOU+bn/8I8oGryfv8nvn2KOPSIdxth6CwkWqJ
         PrVWhedUUw67dIhd/VZebA4YdrsD4tu6HlvlVMu4ViGGxbHpXl/zPjabcD26F5AnB9Gh
         KC2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=f6/i5s8IOzCUxNSyaYvlK4MuXc588RPfZhmyhczPhoM=;
        b=tF0+6iuzAUpr7oso4O8vNd65TBbSgBNfrlbSg9i/xK3nZBmTQU2RXRnq8+djJWeoAB
         kcHOUq5V6+O3+V4pDeQOz0WWDoNn6LaeVgronQ1E+ix1VrqePkur276xEu9A86Z/Aubc
         oLtcC5wPm5v++ZqvD8d0o6lzB2bZ4GechYjJTppeJTwOZHDs4XkVJ5/WRn41HOhmbpuF
         56PF67Z6+LZ3FxTRyQ/hHXow5sQwZML5866MKYD7aGbfXz1wvoXGz7nCnzrLHeRGBbJ3
         vXwo0Tz4x5+5sdfb7WY9WH/s5R+dI0LNqA2jFeq7fQAnZmKGjCRSIxwobrGuMzkPkiIJ
         uYNw==
X-Gm-Message-State: AOAM533j2zkWYZPGdBa9FV0pJOFt+1CWkr+S9jjumhQxCBq3AhFbyLlo
        /uIlcSRFQQ8CHK0kqdxs0Zo=
X-Google-Smtp-Source: ABdhPJwGP9achyFY7LVCoQp+gaF/JatGoWlCKrtrfiNATf+SFZF8Hi0GvRMlCM+ICP1uQ4JVzP6Bbg==
X-Received: by 2002:a17:902:b181:b029:fc:c069:865c with SMTP id s1-20020a170902b181b02900fcc069865cmr5728006plr.28.1623786114824;
        Tue, 15 Jun 2021 12:41:54 -0700 (PDT)
Received: from google.com ([2620:15c:202:201:c700:bb55:c690:c756])
        by smtp.gmail.com with ESMTPSA id n69sm16483124pfd.132.2021.06.15.12.41.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Jun 2021 12:41:53 -0700 (PDT)
Date:   Tue, 15 Jun 2021 12:41:51 -0700
From:   Dmitry Torokhov <dmitry.torokhov@gmail.com>
To:     Yizhuo Zhai <yzhai003@ucr.edu>
Cc:     linux-input@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] Input: hideep - fix the uninitialized use in
 hideep_nvm_unlock()
Message-ID: <YMkCfykNyHtuMUkY@google.com>
References: <CABvMjLRuGPgEJ3Ef7=sBk3m3oa+3HuyV9mVY0ZCYuHK=rJRA4w@mail.gmail.com>
 <YMjuPtKtiaVLLO0q@google.com>
 <CABvMjLSKe2ojoVTZOwv_Dr4P4rsDa334vBc_-T8sMTPUJ-f==g@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CABvMjLSKe2ojoVTZOwv_Dr4P4rsDa334vBc_-T8sMTPUJ-f==g@mail.gmail.com>
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Tue, Jun 15, 2021 at 11:57:36AM -0700, Yizhuo Zhai wrote:
> Hi Demitry:
> 
> Thanks for your quick response, following your advice, a careful way
> is changing the return type of  "hideep_nvm_unlock()" from void to
> int, and its caller "hideep_program_nvm()" also needs to add the
> return check.
> 
> If this sounds ok, I would go ahead to modify the patch accordingly.

Yes, this sounds right.

> 
> On Tue, Jun 15, 2021 at 11:15 AM Dmitry Torokhov
> <dmitry.torokhov@gmail.com> wrote:
> >
> > Hi Yizhuo,
> >
> > On Tue, Jun 15, 2021 at 10:26:09AM -0700, Yizhuo Zhai wrote:
> > > Inside function hideep_nvm_unlock(), variable "unmask_code" could
> > > be uninitialized if hideep_pgm_r_reg() returns error, however, it
> > > is used in the later if statement after an "and" operation, which
> > > is potentially unsafe.
> >
> > I do not think that simply initializing the variable makes the code
> > behave any better. If we want to fix this properly we need to check for
> > errors returned by hideep_pgm_r_reg() and hideep_pgm_w_reg() and exit
> > this function early, signalling the caller about errors.
> >
> > >
> > > Signed-off-by: Yizhuo <yzhai003@ucr.edu>
> > > ---
> > >  drivers/input/touchscreen/hideep.c | 2 +-
> > >  1 file changed, 1 insertion(+), 1 deletion(-)
> > >
> > > diff --git a/drivers/input/touchscreen/hideep.c
> > > b/drivers/input/touchscreen/hideep.c
> > > index ddad4a82a5e5..49b713ad4384 100644
> > > --- a/drivers/input/touchscreen/hideep.c
> > > +++ b/drivers/input/touchscreen/hideep.c
> > > @@ -363,7 +363,7 @@ static int hideep_enter_pgm(struct hideep_ts *ts)
> > >
> > >  static void hideep_nvm_unlock(struct hideep_ts *ts)
> > >  {
> > > -       u32 unmask_code;
> > > +       u32 unmask_code = 0;
> > >
> > >         hideep_pgm_w_reg(ts, HIDEEP_FLASH_CFG, HIDEEP_NVM_SFR_RPAGE);
> > >         hideep_pgm_r_reg(ts, 0x0000000C, &unmask_code);
> > > --
> > > 2.17.1
> >
> > Thanks.
> >
> > --
> > Dmitry
> 
> 
> 
> -- 
> Kind Regards,
> 
> Yizhuo Zhai
> 
> Computer Science, Graduate Student
> University of California, Riverside

-- 
Dmitry
