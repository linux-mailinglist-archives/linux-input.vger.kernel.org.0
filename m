Return-Path: <linux-input+bounces-12201-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0780EAAE19A
	for <lists+linux-input@lfdr.de>; Wed,  7 May 2025 15:55:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id D4B859A4325
	for <lists+linux-input@lfdr.de>; Wed,  7 May 2025 13:53:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3AFE928A721;
	Wed,  7 May 2025 13:49:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="n12kzImp"
X-Original-To: linux-input@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D3A1A28A70B;
	Wed,  7 May 2025 13:49:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746625798; cv=none; b=QITtTaJ3cLbxL593Dc0stJ0en/mDiaFDe4wHUF3wWjGUpCpvv98EDEKrv8gtohsOEtFhg05jNYTxXzixpMcaTmXb321BzO7ae9UA8HKpinV0u7pBAG59yq1WjNYk1NMMyfyzOtDbuQ5Q4+yKLZ+5WokKa+5AEuAjw/Tm/FxIWOc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746625798; c=relaxed/simple;
	bh=wpf1mvl8J9ZWAnzeW4nk5FXAObJeyfts+D9xDzXCJGQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=COSDLPbaGZ5Fohlt4RafFzF7QIQCKfa5DdVnVg6Z3C4OiaxSxObP9BN4wxCfTCw5D7d6F7WrUBTtz0a5uEmte9/1hhQpjps+rKSK/Y/+9+NZ0y8yL3dv2leGD5Rcj9Z3ay6b35NmKYkA1a36ovruIeT+pLzR5AKYD/8ch8kN23I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=n12kzImp; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1746625796; x=1778161796;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=wpf1mvl8J9ZWAnzeW4nk5FXAObJeyfts+D9xDzXCJGQ=;
  b=n12kzImpZAf10ODZifZASYKlrB817nLnePxN2HZr4c4JhCSZBpvohSqM
   j+p/960uC+iEe9cZ2XdSjNL4hSOG1E1iHPT716z6fq1HOwlH3Aj2RKnDS
   of6obJStpSrEabd2nt9SilnK+a4EvTXOeXUDn8uuvoq+t00oFyPAyY5TA
   PQctAkjrjdVTt69iEZoxK61REaM+1QxKFd0Usu2Cp6+XSMhLrpGp4Na4j
   HxkRqbVV9buGrDWOG3JlsrJX2zdPxcNcD2gE2L0GAPyWObKuGwKk1tPUD
   asjOsJXXfZSUOKaJEaAIQN/iG2GhjppZ0nU+HGkTfO5n3J+YicG4QXMIP
   g==;
X-CSE-ConnectionGUID: jITjY44HSqW7VDQ5SyEa5g==
X-CSE-MsgGUID: boxpjO7JQDKhPqrIAIWMNw==
X-IronPort-AV: E=McAfee;i="6700,10204,11426"; a="52011212"
X-IronPort-AV: E=Sophos;i="6.15,269,1739865600"; 
   d="scan'208";a="52011212"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 May 2025 06:49:55 -0700
X-CSE-ConnectionGUID: ZysioNgiRyqBOl23ETAa7Q==
X-CSE-MsgGUID: gMVbvhDLRFqCMIHnN8DMkg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,269,1739865600"; 
   d="scan'208";a="135825861"
Received: from smile.fi.intel.com ([10.237.72.55])
  by orviesa010.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 May 2025 06:49:54 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.98.2)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1uCf9j-00000003kIS-1vAm;
	Wed, 07 May 2025 16:49:51 +0300
Date: Wed, 7 May 2025 16:49:51 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: linux-input@vger.kernel.org, linux-kernel@vger.kernel.org,
	Pali =?iso-8859-1?Q?Roh=E1r?= <pali@kernel.org>
Subject: Re: [PATCH v1 1/1] Input: ALPS - bail out when device path can't fit
 buffer
Message-ID: <aBtk_zBywXqhU-YU@smile.fi.intel.com>
References: <20250422185645.1949391-1-andriy.shevchenko@linux.intel.com>
 <ybenmz2fmjxjpo3zhnrh2ptquikxrtb63664qbhhfv5d4ezx5n@c3p2tbosx2tz>
 <aBBdFoBbdl8GI6da@surfacebook.localdomain>
 <aBTOMzlitljoDAob@smile.fi.intel.com>
 <2blm4mirspwgcukwnybfgqhiozhtkcqjl2e7g2onxp6ms4ex4a@l4jayj4i6fti>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2blm4mirspwgcukwnybfgqhiozhtkcqjl2e7g2onxp6ms4ex4a@l4jayj4i6fti>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo

On Mon, May 05, 2025 at 10:34:56PM -0700, Dmitry Torokhov wrote:
> On Fri, May 02, 2025 at 04:52:51PM +0300, Andy Shevchenko wrote:
> > On Tue, Apr 29, 2025 at 08:01:10AM +0300, Andy Shevchenko wrote:
> > > Mon, Apr 28, 2025 at 04:30:13PM -0700, Dmitry Torokhov kirjoitti:
> > > > On Tue, Apr 22, 2025 at 09:56:45PM +0300, Andy Shevchenko wrote:

...

> > > > > +		n = snprintf(priv->phys2, sizeof(priv->phys2), "%s/input1",
> > > > > +			     psmouse->ps2dev.serio->phys);
> > > > > +		if (n >= sizeof(priv->phys2)) {
> > > > > +			psmouse_err(psmouse,
> > > > > +				    "failed to prepare path to the trackstick device\n");
> > > > > +			error = -E2BIG;
> > > > > +			goto init_fail;
> > > > 
> > > > So you just broke touchpad of some poor guy who had it working just fine 
> > > > for many years. For maximum impact you should add BUG() or panic()
> > > > here.
> > > 
> > > Ha-ha. You know that your speculation most likely so far from the truth.
> 
> If your code is not a noop that is precisely what happened.
> 
> > And actually what you are telling about is not true at all. If the device was
> > working it means that the file node name is not cut, and hence this patch won't
> > anyhow change this behaviour. Otherwise, provide an example which can fail this
> > and still be working in the user space.
> 
> "phys" is not a name of a device node. It is a string available via
> /proc/bus/input/devices, sysfs /sys/class/input/input<N>/phys and also
> EVIOCGPHYS ioctl. A driver is free to not set it at all and everything
> will be working fine.

Okay, this is then indeed a problematic in the cases when strings are shorten
than supposed to be.

> Actually, input devices themselves to not have device nodes, it is evdev
> interface that provides /dev/input/event<N>.
> 
> > > > In all seriousness, it is OK to have truncated phys, rarely anyone looks
> > > > at it and if we get a report of it being truncated then we can consider
> > > > addressing the size (or we can decide to live with it truncated).
> > > 
> > > In all seriousness, while I agree on the statement, the 4 drivers in Input
> > > subsystem break the build. It's the biggest obstacle now to enable WERROR=y,
> > > which is default, builds on `make W=1`. So, I already gave you chance to fix,
> > > instead I hear nothing back for a months (to be precise 2 months and a day
> > > passed from my first attempt that you didn't like), the problem still exists.
> > > Please, address this the way you like.
> > 
> > For the reference, the first approach:
> > https://lore.kernel.org/r/20250228121147.242115-1-andriy.shevchenko@linux.intel.com
> > where I also asked about this one, ano got no answer.
> 
> Sorry I was busy with other projects.
> 
> > I really don't want to try anything new as it seems a big pushback to whatever
> > I propose. So, please consider fixing the issues rather sooner. I will be more
> > than happy to test.
> 
> Have you considered that this warning is bogus and it should be disabled
> instead? Or maybe GCC should see if there are followup writes to the
> same buffer before emitting the warning? 

I considered this warning as a problem that prevents me compiling the code.
Since there are only few issues over the kernel left with some maintainers
who are definitely busy, I consider the disabling warning wouldn't make it
better. And if so, this should be send not by me, I have no good arguments
against it. Perhaps you have?

-- 
With Best Regards,
Andy Shevchenko



