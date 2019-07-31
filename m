Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 52EAF7C3E9
	for <lists+linux-input@lfdr.de>; Wed, 31 Jul 2019 15:46:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728856AbfGaNqn (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 31 Jul 2019 09:46:43 -0400
Received: from mail-pf1-f196.google.com ([209.85.210.196]:39001 "EHLO
        mail-pf1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726115AbfGaNqm (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Wed, 31 Jul 2019 09:46:42 -0400
Received: by mail-pf1-f196.google.com with SMTP id f17so27914272pfn.6;
        Wed, 31 Jul 2019 06:46:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=RYIopWVWcpN8sf8fn3WkAJoSebITP0aCuEJMOu9tUgo=;
        b=mBtfxVJW9PnBRKrB+uQBu32BkJW1DpQZK21apuGw6xkdbEf29gIZyyKKBNKsyyZm7T
         Ga8GPsjvU27IBLreAzB7a7JBLV3nGCHxyflt8fC1EwA6VwdBfXDpx/LNS41rsT+kQ8Iy
         zDWh6KkJWPSgwX3Ly9uADX1D/I/alhwGVlE8+MoaV6yis/Nx0NxQzD8Vasx70JUoBQLl
         gFz9JRgRRM3XSE5pOVNr5yNywlr8SvsPxy3La4y8RJkVKMTT6V7kF44Efel3pU/5L+0q
         wvIeY52cfH5D1V9uo9EVXnVAONdv7VVM9tng9EvnE42YXqooX738ht5TCdp+HtDTUlBG
         PDkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=RYIopWVWcpN8sf8fn3WkAJoSebITP0aCuEJMOu9tUgo=;
        b=is3VUeFa+ROoe1ueeviahILRpGoR2vt0g0fmSFXpjKlk7pyQO2hKunV0EzJ0Cn4jZH
         KO5Xhtdimwz8r8oj5JZoAT0d16sSx7n7MSVIHTF9zESJMjZzxQNpU3I8vBqbVVRAHyIo
         Nodqm2o0ie0JZ61W8raZ+wTtWArG3leOmnk0rsl3JsaEwbWdBMWJ1wwnfoBJA1UcMPbC
         pULnCulVKKosWPKe9oDozhic5MRbvTPJicRlLRlYfqF3aY4gHpGhzd39zRSEDHoQQHFo
         EVPveuC2N97DngTTi+dwvM6EwTBrqrOxmSbPC3NKg0faCaLWEsbgo1nFrzhgzNGv8bIS
         3nFA==
X-Gm-Message-State: APjAAAWlji+V5KrzSYI7u2VRYI9OU/QiP1/JCRrZdnSWYZmfj3Xgr8Ky
        EZAAeiIbq2Z/ixgXhHNT+FI=
X-Google-Smtp-Source: APXvYqyJ632HMr8qTa4ZHPJ7wJMKy+mNNR1MgRTMRnjyHAyoRP9i2yT3EBmczwD7Wk7y+Y9PJWFOLg==
X-Received: by 2002:a63:cb4f:: with SMTP id m15mr38212861pgi.100.1564580801437;
        Wed, 31 Jul 2019 06:46:41 -0700 (PDT)
Received: from dtor-ws ([2620:15c:202:201:3adc:b08c:7acc:b325])
        by smtp.gmail.com with ESMTPSA id u134sm66894809pfc.19.2019.07.31.06.46.40
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Wed, 31 Jul 2019 06:46:40 -0700 (PDT)
Date:   Wed, 31 Jul 2019 06:46:38 -0700
From:   Dmitry Torokhov <dmitry.torokhov@gmail.com>
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-kernel@vger.kernel.org,
        Richard Gong <richard.gong@linux.intel.com>,
        "H. Peter Anvin" <hpa@zytor.com>,
        Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
        Borislav Petkov <bp@alien8.de>,
        Darren Hart <dvhart@infradead.org>,
        Florian Fainelli <f.fainelli@gmail.com>,
        Ingo Molnar <mingo@redhat.com>,
        Sudeep Holla <sudeep.holla@arm.com>,
        Thomas Gleixner <tglx@linutronix.de>,
        Tony Prisk <linux@prisktech.co.nz>,
        dri-devel@lists.freedesktop.org,
        linux-arm-kernel@lists.infradead.org, linux-fbdev@vger.kernel.org,
        linux-input@vger.kernel.org, platform-driver-x86@vger.kernel.org,
        x86@kernel.org
Subject: Re: [PATCH v2 00/10] drivers, provide a way to add sysfs groups
 easily
Message-ID: <20190731134638.GD147138@dtor-ws>
References: <20190731124349.4474-1-gregkh@linuxfoundation.org>
 <20190731131045.GB147138@dtor-ws>
 <20190731133840.GN23480@smile.fi.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190731133840.GN23480@smile.fi.intel.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Wed, Jul 31, 2019 at 04:38:40PM +0300, Andy Shevchenko wrote:
> On Wed, Jul 31, 2019 at 06:10:45AM -0700, Dmitry Torokhov wrote:
> > On Wed, Jul 31, 2019 at 02:43:39PM +0200, Greg Kroah-Hartman wrote:
> > > This patch originally started out just as a way for platform drivers to
> > > easily add a sysfs group in a race-free way, but thanks to Dmitry's
> > > patch, this series now is for all drivers in the kernel (hey, a unified
> > > driver model works!!!)
> > > 
> > > I've only converted a few platform drivers here in this series to show
> > > how it works, but other busses can be converted after the first patch
> > > goes into the tree.
> > > 
> > > Here's the original 00 message, for people to get an idea of what is
> > > going on here:
> > > 
> > > If a platform driver wants to add a sysfs group, it has to do so in a
> > > racy way, adding it after the driver is bound.  To resolve this issue,
> > > have the platform driver core do this for the driver, making the
> > > individual drivers logic smaller and simpler, and solving the race at
> > > the same time.
> > > 
> > > All of these patches depend on the first patch.  I'll take the first one
> > > through my driver-core tree, and any subsystem maintainer can either ack
> > > their individul patch and I will be glad to also merge it, or they can
> > > wait until after 5.4-rc1 when the core patch hits Linus's tree and then
> > > take it, it's up to them.
> > 
> > Maybe make an immutable branch off 5.2 with just patch 1/10 so that
> > subsystems (and the driver core tree itself) could pull it in at their
> > leisure into their "*-next" branches and did not have to wait till 5.4
> > or risk merge clashes?
> 
> Isn't cherry-pick enough for one patch?

With cherry-picking you run into potential merge conflicts if Greg
changes more code in the same area. Plus, once everything is merged into
Linus' tree, there will be N git commits adding the same thing.

With immutable branch there is a single git commit, so merges are
guaranteed to be clean, with no conflicts.

Thanks.

-- 
Dmitry
