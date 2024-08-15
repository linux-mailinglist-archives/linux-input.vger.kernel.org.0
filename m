Return-Path: <linux-input+bounces-5595-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 11A9D953C87
	for <lists+linux-input@lfdr.de>; Thu, 15 Aug 2024 23:21:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 794B31F269AE
	for <lists+linux-input@lfdr.de>; Thu, 15 Aug 2024 21:21:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 695D814F100;
	Thu, 15 Aug 2024 21:21:00 +0000 (UTC)
X-Original-To: linux-input@vger.kernel.org
Received: from angie.orcam.me.uk (angie.orcam.me.uk [78.133.224.34])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3195714EC79;
	Thu, 15 Aug 2024 21:20:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=78.133.224.34
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723756860; cv=none; b=aN51bZWM31SQXglNNUmThe59HALoImPwLOZzaCJNBV6MCeV3n96fV22lU/5ouiSihyQkZfjBMkPXoNvFqP6pq+uab44AQd8Sj2Nhnvl+mLAO5KFNK9Ja+8PxUpt5L8DpFM2SKECSSf0X3RssmfujFqcmbfrQ1JH2cNwNpPcO7VI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723756860; c=relaxed/simple;
	bh=VaAkehavfCAFwNZIPqcMx7oZjPWos8HCNv8piQ4rC+A=;
	h=Date:From:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=HNItnDSXhZNOX1YOTsS4fFzihDolBXv8HeApr5Jae980C562IeQPtBt/53hZZooBqzke4yQ4XRULpv6DH1ru6OsSZr+rbBtQINVApwTXo6EYfyTZXh830hyVaLhBWb6Yz3MPOaz0snxaP0iD4pWWStWr/iR7KDKOcV/ii2WROUU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=orcam.me.uk; spf=none smtp.mailfrom=orcam.me.uk; arc=none smtp.client-ip=78.133.224.34
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=orcam.me.uk
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=orcam.me.uk
Received: by angie.orcam.me.uk (Postfix, from userid 500)
	id 9B35F92009C; Thu, 15 Aug 2024 23:20:49 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by angie.orcam.me.uk (Postfix) with ESMTP id 94DEB92009B;
	Thu, 15 Aug 2024 22:20:49 +0100 (BST)
Date: Thu, 15 Aug 2024 22:20:49 +0100 (BST)
From: "Maciej W. Rozycki" <macro@orcam.me.uk>
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>
cc: linux-input@vger.kernel.org, linux-kernel@vger.kernel.org, 
    Vojtech Pavlik <vojtech@ucw.cz>, Jiri Kosina <jikos@kernel.org>, 
    Benjamin Tissoires <bentiss@kernel.org>
Subject: Re: [RFC PATCH 0/5] Removal of a few obsolete input drivers
In-Reply-To: <Zro8fpgvqa74aki4@google.com>
Message-ID: <alpine.DEB.2.21.2408131802050.59022@angie.orcam.me.uk>
References: <20240808172733.1194442-1-dmitry.torokhov@gmail.com> <alpine.DEB.2.21.2408090122060.61955@angie.orcam.me.uk> <ZrmUnaLJ5Ft0_tst@google.com> <alpine.DEB.2.21.2408121448250.59022@angie.orcam.me.uk> <Zro8fpgvqa74aki4@google.com>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Mon, 12 Aug 2024, Dmitry Torokhov wrote:

> > > >  Are these drivers broken, e.g. fail to compile or crash the system?  
> > > 
> > > I have no idea because I doubt that anyone has tested them since
> > > forever.
> > 
> >  What's the rationale for your conclusion?  How do you know nobody uses 
> > them?
> 
> Because they are either require ISA add-on cards and it is quite hard to
> find devices that still work, and are supported by the current kernel,
> or internal peripherals in devices that are no longer useful. Do you
> expect anyone using "Gateway AOL Connected Touchpad" in the year of our
> Lord 2024?

 Maybe, maybe not.

 I certainly use Linux with actual ISA hardware, i.e. systems with ISA or 
EISA slots and option cards within, as well as other hardware dating back 
to 1989.  I'm told people use Linux with m68k hardware going back in time 
even further.  I don't use any of the bus mice themselves though (having 
had perhaps a more common serial mouse instead), but if the drivers build 
just fine, then I fail to see a reason to dump them.

> > > The same gain that we get from removing obsolete boards and
> > > architectures - less maintenance burden, less work when we need to
> > > change some APIs, less energy burnt by 0-day and other bots, CI systems,
> > > etc, compiling useless drivers over and over and over.
> > 
> >  Well, you don't have do do anything about these drivers, do you?  They 
> > don't scream for food.  And as to the energy, well I doubt this really 
> > matters, the amount is noise lost in the overall consumption.
> 
> I kind of do even if they did not require much involvement.
> 
> Let me ask this: why do you want to keep them? Do you know of a large
> (or small) userbase of bus mice enthusiasts? Note that it would be very
> easy to "git revert" the removal if someone actually needs this.

 There is burden involved as well as repo clutter from going through an 
apply/revert cycle though.

 Sometimes we do want to discard code, because it causes burden elsewhere.  
It was the case with the removal of support for the original 80386 CPU due 
to its lack of user page write-protection in the kernel mode, which in 
turn required us to have explicit checks carefully sprinkled throughout 
and painfully maintained.  That hindered generic code and was a good 
argument in favour to removal as soon as 80386 became unimportant enough.

 In this case the decision seems arbitrary, the presence of these drivers 
does not hurt anything else.  I agree it might well be that nobody uses 
them anymore (though someone may come across a relevant piece of hardware 
anytime and wish to try it with Linux; I do it from time to time, and I 
also have old stuff even I'd like to write entirely new drivers for if I 
ever find some time for that, i.e. I have sorted higher priority stuff), 
which I can sort of recognise as an argument in favour of discarding them.

 I'm not entirely convinced it's enough of an argument by itself, however 
if there are other people who think otherwise, can we please at least do 
it in stages such as some other projects do?  That is require an explicit 
action for any interested party to keep the drivers enabled, say by hiding 
them behind CONFIG_DEPRECATED or suchlike (with clear documentation saying 
it's for stuff slated for removal), wait a year or two, and only if nobody 
speaks out during that period, then actually retire the code in question?

 A part of the joy with Linux for me and I believe other people as well it 
has been the ability to do odd stuff just for the sake of it.  It used not 
to be business back in 1990s and it still not is, not at least entirely, 
for such a Linux old-timer as I have now oddly enough become.

  Maciej

