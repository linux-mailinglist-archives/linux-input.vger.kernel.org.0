Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 71E1B1DBAF1
	for <lists+linux-input@lfdr.de>; Wed, 20 May 2020 19:16:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726860AbgETRQX (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 20 May 2020 13:16:23 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54094 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726737AbgETRQW (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Wed, 20 May 2020 13:16:22 -0400
Received: from mail-pg1-x542.google.com (mail-pg1-x542.google.com [IPv6:2607:f8b0:4864:20::542])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E6E37C061A0E;
        Wed, 20 May 2020 10:16:21 -0700 (PDT)
Received: by mail-pg1-x542.google.com with SMTP id j21so1730856pgb.7;
        Wed, 20 May 2020 10:16:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=QOr9A6/o+X7HN0o8pNRUCaleEl/+hhlZ4ITogdoH+tM=;
        b=PsTQzxra0jbxZGBdtbvJFoxoHPuxr0tzFZ5WhlDoa+NVXcYDIfqXIfwP1Q5y6vnrap
         9R8VdlzbCLF2e72JjNwZp5wS1bBf3gyayzW4ZeFc40YpwLJ6DXhgrfGY2pCfqs55Ze9d
         rDyxeBw+5s/Dx4Yw+Bn4xOKZZxLXazS4Or93V2Q5ySxRGXsCWw9ucRs2rM8pnfIDNPmb
         t+7RNVBq8+EgX50l3FvwnilCiPlGXjhpdhABz0OP8Ec7s8pGYF5uViPfE3CrcjYXSOtY
         4PW0tyayfiF7JoL26m/0iw8MQlJROUSQuox78rY6WgrKVJcIGdMw0hQeIw8Rl5a641G0
         SIog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=QOr9A6/o+X7HN0o8pNRUCaleEl/+hhlZ4ITogdoH+tM=;
        b=FQ+2SDLzak5kKyUBht9XWP8ofdf1bBjU/xvZrwsdQJ6OdnbdX/niNvwdUgta+1W2Ep
         JMiwMe8GIgn2fGffmneHzMuIfdYgckQ8w1wMjQw4YgnZlWbmNWSN9D4oYpMEN/L/NWJq
         DqcYfJfvmm8rDhd5xbRsq52nx3uAQQS5kZ4/idtgttlT6J87K4bcW8MEvO9cFPNRAG4r
         j3xGycMnihvyhkQiO+hrB7ri/SMQibUoxIM3wwOts8WeViilNOSbC8Qs4A1xsuElQrhn
         +iDZfYrO8UeRmvTC/b6oDoZ5BuOnKNU4/exlmKrB+sgtAdimXliCoF9kANfE+9JF4XGK
         zYfw==
X-Gm-Message-State: AOAM530rgjTMGLGzIdgifUAQd6xNZzmFJnvl9vfWZ1ZekunENPZVeAlD
        qKnsn5IgmVM+AUqbUfwiRXo=
X-Google-Smtp-Source: ABdhPJyE8U+eqza0u+/BgRwGYurqbJZJmair/oCm+T178M7MykVJpxyH+LIUWsRiHrVZ78W2i90TKg==
X-Received: by 2002:aa7:82d7:: with SMTP id f23mr5685263pfn.198.1589994981193;
        Wed, 20 May 2020 10:16:21 -0700 (PDT)
Received: from dtor-ws ([2620:15c:202:201:3c2a:73a9:c2cf:7f45])
        by smtp.gmail.com with ESMTPSA id t188sm2544922pfb.185.2020.05.20.10.16.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 May 2020 10:16:20 -0700 (PDT)
Date:   Wed, 20 May 2020 10:16:18 -0700
From:   Dmitry Torokhov <dmitry.torokhov@gmail.com>
To:     Michael Ellerman <mpe@ellerman.id.au>
Cc:     linux-input@vger.kernel.org,
        Nathan Chancellor <natechancellor@gmail.com>,
        Benjamin Herrenschmidt <benh@kernel.crashing.org>,
        Paul Mackerras <paulus@samba.org>,
        linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org,
        clang-built-linux@googlegroups.com,
        kbuild test robot <lkp@intel.com>
Subject: Re: [PATCH] input: i8042: Remove special PowerPC handling
Message-ID: <20200520171618.GT89269@dtor-ws>
References: <87a7254bxd.fsf@mpe.ellerman.id.au>
 <20200518181043.3363953-1-natechancellor@gmail.com>
 <87ftbv87i3.fsf@mpe.ellerman.id.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <87ftbv87i3.fsf@mpe.ellerman.id.au>
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Hi Michael,

On Wed, May 20, 2020 at 04:07:00PM +1000, Michael Ellerman wrote:
> [ + Dmitry & linux-input ]
> 
> Nathan Chancellor <natechancellor@gmail.com> writes:
> > This causes a build error with CONFIG_WALNUT because kb_cs and kb_data
> > were removed in commit 917f0af9e5a9 ("powerpc: Remove arch/ppc and
> > include/asm-ppc").
> >
> > ld.lld: error: undefined symbol: kb_cs
> >> referenced by i8042-ppcio.h:28 (drivers/input/serio/i8042-ppcio.h:28)
> >> input/serio/i8042.o:(__i8042_command) in archive drivers/built-in.a
> >> referenced by i8042-ppcio.h:28 (drivers/input/serio/i8042-ppcio.h:28)
> >> input/serio/i8042.o:(__i8042_command) in archive drivers/built-in.a
> >> referenced by i8042-ppcio.h:28 (drivers/input/serio/i8042-ppcio.h:28)
> >> input/serio/i8042.o:(__i8042_command) in archive drivers/built-in.a
> >
> > ld.lld: error: undefined symbol: kb_data
> >> referenced by i8042.c:309 (drivers/input/serio/i8042.c:309)
> >> input/serio/i8042.o:(__i8042_command) in archive drivers/built-in.a
> >> referenced by i8042-ppcio.h:33 (drivers/input/serio/i8042-ppcio.h:33)
> >> input/serio/i8042.o:(__i8042_command) in archive drivers/built-in.a
> >> referenced by i8042.c:319 (drivers/input/serio/i8042.c:319)
> >> input/serio/i8042.o:(__i8042_command) in archive drivers/built-in.a
> >> referenced 15 more times
> >
> > Presumably since nobody has noticed this for the last 12 years, there is
> > not anyone actually trying to use this driver so we can just remove this
> > special walnut code and use the generic header so it builds for all
> > configurations.
> >
> > Fixes: 917f0af9e5a9 ("powerpc: Remove arch/ppc and include/asm-ppc")
> > Reported-by: kbuild test robot <lkp@intel.com>
> > Signed-off-by: Nathan Chancellor <natechancellor@gmail.com>
> > ---
> >  drivers/input/serio/i8042-ppcio.h | 57 -------------------------------
> >  drivers/input/serio/i8042.h       |  2 --
> >  2 files changed, 59 deletions(-)
> >  delete mode 100644 drivers/input/serio/i8042-ppcio.h
> 
> This LGTM.
> 
> Acked-by: Michael Ellerman <mpe@ellerman.id.au> (powerpc)
> 
> I assumed drivers/input/serio would be pretty quiet, but there's
> actually some commits to it in linux-next. So perhaps this should go via
> the input tree.
> 
> Dmitry do you want to take this, or should I take it via powerpc?
> 
> Original patch is here:
>   https://lore.kernel.org/lkml/20200518181043.3363953-1-natechancellor@gmail.com

I'm fine with you taking it through powerpc.

Acked-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>

Also, while I have your attention ;), could you please ack or take
https://lore.kernel.org/lkml/20191002214854.GA114387@dtor-ws/ as I
believe this is the last user or input_polled_dev API and I would like
to drop it from the tree.

Thanks!

-- 
Dmitry
