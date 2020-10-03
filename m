Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E6ED3282270
	for <lists+linux-input@lfdr.de>; Sat,  3 Oct 2020 10:26:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725648AbgJCI0X (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Sat, 3 Oct 2020 04:26:23 -0400
Received: from mail.kernel.org ([198.145.29.99]:42208 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725601AbgJCI0X (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Sat, 3 Oct 2020 04:26:23 -0400
Received: from localhost (83-86-74-64.cable.dynamic.v4.ziggo.nl [83.86.74.64])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id B92C8206CA;
        Sat,  3 Oct 2020 08:26:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1601713582;
        bh=qY1uDVpidDLHdL3/prCqreUy10orTSXfQcRuJfqVI4M=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=mIeCU+CpdIFebXV8YssNi/b/q4CPtbfqLrc6n4zAXpeRA8A2vbMlUFAF0Pw4Qt1+Y
         jUdh7kxKRZytRxGPkPQmpVIhMmcOCDM4tBrKoErUEspAKKuhrVvgXinc8pb3tNVJaU
         zC+E3iwwpkJhk4QcB9EW86+SFg1836SLXrTc7jxU=
Date:   Sat, 3 Oct 2020 10:26:18 +0200
From:   Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To:     Andrzej Pietrasiewicz <andrzej.p@collabora.com>
Cc:     linux-kernel@vger.kernel.org,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>, Jiri Slaby <jslaby@suse.com>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        linux-input@vger.kernel.org, dri-devel@lists.freedesktop.org,
        kernel@collabora.com
Subject: Re: [PATCH v3 2/2] tty/sysrq: Add configurable handler to execute a
 compound action
Message-ID: <20201003082618.GA113835@kroah.com>
References: <20200818112825.6445-1-andrzej.p@collabora.com>
 <20200818112825.6445-3-andrzej.p@collabora.com>
 <20201002125429.GA3350322@kroah.com>
 <db7fe4ed-19a4-3303-a544-eb789badb8a1@collabora.com>
 <20201002140233.GB3475053@kroah.com>
 <2031d74a-41df-d556-d5de-37f4b63ee30f@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <2031d74a-41df-d556-d5de-37f4b63ee30f@collabora.com>
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Fri, Oct 02, 2020 at 05:06:54PM +0200, Andrzej Pietrasiewicz wrote:
> Hi,
> 
> W dniu 02.10.2020 o 16:02, Greg Kroah-Hartman pisze:
> > On Fri, Oct 02, 2020 at 03:42:52PM +0200, Andrzej Pietrasiewicz wrote:
> > > Hi,
> > > 
> > > W dniu 02.10.2020 o 14:54, Greg Kroah-Hartman pisze:
> > > > On Tue, Aug 18, 2020 at 01:28:25PM +0200, Andrzej Pietrasiewicz wrote:
> > > > > Userland might want to execute e.g. 'w' (show blocked tasks), followed
> > > > > by 's' (sync), followed by 1000 ms delay and then followed by 'c' (crash)
> > > > > upon a single magic SysRq. Or one might want to execute the famous "Raising
> > > > > Elephants Is So Utterly Boring" action. This patch adds a configurable
> > > > > handler, triggered with 'C', for this exact purpose. The user specifies the
> > > > > composition of the compound action using syntax similar to getopt, where
> > > > > each letter corresponds to an individual action and a colon followed by a
> > > > > number corresponds to a delay of that many milliseconds, e.g.:
> > > > > 
> > > > > ws:1000c
> > > > > 
> > > > > or
> > > > > 
> > > > > r:100eis:1000ub
> > > > 
> > > > A macro language for sysrq commands, who would have thought...
> > > > 
> > > > Anyway, _why_ would userland want to do something so crazy as this?
> > > > What is the use-case here?
> > > > 
> > > 
> > > A use-case is Chromebooks which do want to execute 'w', 's',
> > > wait 1000ms and then 'c' under one key combination. Having that supported
> > > upstream brings us one little step closer to those machines running
> > > upstream kernel.
> > 
> > Who is causing that to "execute"?  Some daemon/program?
> 
> No, as far as I know they patch the kernel to change the behavior
> of Sysrq-x combination, so the "execution" is triggered by the user.

So this isn't coming from the chromeos team, so there is no guarantee
that they will switch to this if it is merged?

> > > Another argument for such a "macro language" is when a machine's system
> > > keeps degrading over time, possibly degrading (relatively) fast.
> > > "Raising Elephants Is So Utterly Boring" consists of 6 actions, each
> > > of which requires pressing several keys. The user might be unable
> > > to complete all the 6 steps, while a "macro" requires user's involvement
> > > for carrying out just one step.
> > 
> > So you want to "preload" some commands ahead of time, for when you get
> > in trouble
> It can be said this way, yes.
> 
> > 
> > These should just be debugging / last resort types of things, how
> > regular are they being used in your systems?
> > 
> 
> The "REISUB" itself is a kind of a last resort thing.
> 
> It is true that it's not a very frequent situation, but does its being rare
> preclude having such a function in the kernel?
> 
> While preparing this patch I wanted it to be flexible, but perhaps it is
> too flexible for some reason? If the permissions of the module_param's
> sysfs entry were changed to 0444 would it be better? Then the compound
> action would still be configurable but only at boot time rather than at
> boot time _and_ runtime.

I don't have an issue with it happening at runtime and boot time, just
that this is adding additional complexity to the kernel (parsers are
fun!) for no real-world user.

thanks,

greg k-h
