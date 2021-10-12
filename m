Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 40AA6429B1D
	for <lists+linux-input@lfdr.de>; Tue, 12 Oct 2021 03:43:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229633AbhJLBpL (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 11 Oct 2021 21:45:11 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55598 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229632AbhJLBpK (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Mon, 11 Oct 2021 21:45:10 -0400
Received: from mail-pf1-x431.google.com (mail-pf1-x431.google.com [IPv6:2607:f8b0:4864:20::431])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1B9E7C061570;
        Mon, 11 Oct 2021 18:43:10 -0700 (PDT)
Received: by mail-pf1-x431.google.com with SMTP id g14so16260433pfm.1;
        Mon, 11 Oct 2021 18:43:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=aaPgiHJn15zNIap+eZg+EerM3NP47gZ4DTG/7AGcqDU=;
        b=ibkUO6s7sr32QaV28gFq4Te8miEtqiHGyph/cbLhFcP9vpZTJNlVs8a4KiermjP+82
         gQ1+hN20FSXfgcMd7gWMsyl8F03pyXT5cPtvYl2q+jKZTzOT8Obha6YTP5OgsYM13VmR
         Bnlmk/iMnU4aubMRQ7e/jBxVpPL6a3gaamMMgxOjSC9nbYqq8PXJxNUZa1c9wAvVsy/o
         sSxdThMUr2Nbi26g22OAPj4AFwvqlrkDvhFP8FjY+WzbgU89FpCR9wxS5e+HhaHu1gHW
         8HU+G7Pbb9xsYnL9foUt1gUNDbGkeNb1iNR43GgRI70+V1f5Dt3XseRbErT33pa3d1+H
         kDuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=aaPgiHJn15zNIap+eZg+EerM3NP47gZ4DTG/7AGcqDU=;
        b=QeZIN2dCb1A4r7V4cqIfagFzsg+N/+6URZuiYoq0vELQ5YpMTIYg//twWpdfAYhPf0
         5hACi+IXkb0eE3H1CQgyr/OUOLSQErLFhyoq7Fl0xOR0kpIz15LdgpG5bjOMlvLBvTFJ
         X/XFl3XzYmVfXnnqq61J41BSBiKLU584w9In5ANlMlazlMbxXDUCe2bR/pGxuZHz248B
         KmAkYL0t+JUDcAgtjCy+Xgq23t8TRNxd9THSDW+7NqQdeC6fL5iaQ806W7FHZwsM+cU9
         ulnT+FLjP4JWQ1rnsyxDqq0YN8XU5mGCTBQ37leWJTLkEpr+NMhOMft673A0ODXJdpSm
         D8gQ==
X-Gm-Message-State: AOAM533fHECkSIYq++rdjDYiHqKAPDt6bqjdwZF2pXYx722WQB7dMnVg
        deqPafHd8htpmYLIEv02dryVvtYdO+w=
X-Google-Smtp-Source: ABdhPJxn5ABtPWNaQC1n/OgsENcsTha5zCyuk1bSerqk84x/UBaFf90cHvAZMiJajSnf4YN0613csg==
X-Received: by 2002:a63:7e45:: with SMTP id o5mr20563078pgn.445.1634002988886;
        Mon, 11 Oct 2021 18:43:08 -0700 (PDT)
Received: from google.com ([2620:15c:202:201:10fb:4b55:2926:7ada])
        by smtp.gmail.com with ESMTPSA id t8sm6638670pgk.66.2021.10.11.18.43.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 Oct 2021 18:43:07 -0700 (PDT)
Date:   Mon, 11 Oct 2021 18:43:05 -0700
From:   Dmitry Torokhov <dmitry.torokhov@gmail.com>
To:     Alexander Sverdlin <alexander.sverdlin@gmail.com>
Cc:     Geert Uytterhoeven <geert@linux-m68k.org>,
        Nikita Shubin <nikita.shubin@maquefel.me>,
        linux-input@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 3/7] Input: ep93xx_keypad: Prepare clock before using it
Message-ID: <YWToKXF66a49mEf/@google.com>
References: <20210613233041.128961-1-alexander.sverdlin@gmail.com>
 <20210613233041.128961-4-alexander.sverdlin@gmail.com>
 <YMfQR8iM9be5Qg8+@google.com>
 <9bf87ee0e1c2a97b0a1b98734e34e456f84ea3d7.camel@gmail.com>
 <YM60mjew2mqMAMRO@google.com>
 <2cd73e19fde5a9dee6a962f9994b4dd5ea4d21be.camel@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2cd73e19fde5a9dee6a962f9994b4dd5ea4d21be.camel@gmail.com>
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Hi Alexander,

On Mon, Sep 13, 2021 at 11:29:14PM +0200, Alexander Sverdlin wrote:
> Hello Dmitry,
> 
> On Sat, 2021-06-19 at 20:23 -0700, Dmitry Torokhov wrote:
> > > On Mon, 2021-06-14 at 14:55 -0700, Dmitry Torokhov wrote:
> > > > > Use clk_prepare_enable()/clk_disable_unprepare() in preparation for switch
> > > > > to Common Clock Framework.
> > > > 
> > > > Can this be merged standalone?
> > > 
> > > In principle, yes, but I thought it would be easier if the patches
> > > would go via the same path as CCF conversion.
> > 
> > OK, in this case:
> > 
> > Acked-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
> 
> our initial attempt to find a maintainer for the whole series
> didn't work out. Would you take this single patch, please?
> Three others were already taken into respective subsystems
> and I'll ping the rest of maintainers individually...

It looks like I forgot to mention it, but I applied this patch and it
should be in mainline now. I also CCed you on a few patches to
ep93xx_keyboard driver and woudl appreciate if you looked them over as I
do not have the hardware.

Thanks.

-- 
Dmitry
