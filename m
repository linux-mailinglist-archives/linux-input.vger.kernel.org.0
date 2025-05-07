Return-Path: <linux-input+bounces-12215-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 1DEACAAE8E7
	for <lists+linux-input@lfdr.de>; Wed,  7 May 2025 20:20:58 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id AF9871640D2
	for <lists+linux-input@lfdr.de>; Wed,  7 May 2025 18:19:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A53CA287508;
	Wed,  7 May 2025 18:18:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=armlinux.org.uk header.i=@armlinux.org.uk header.b="qnTrhkQc"
X-Original-To: linux-input@vger.kernel.org
Received: from pandora.armlinux.org.uk (pandora.armlinux.org.uk [78.32.30.218])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 083C028D846;
	Wed,  7 May 2025 18:18:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=78.32.30.218
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746641934; cv=none; b=YashmdrhAX5cSQ7cQz9+GENaOcJpEJY7otnxewlTyjLZl49BB/xPCAMfMePYwGOrPxfOxg2S6mILrT4Ko787swujBQdQbh65gLF15MRQQMD05suKJq37i0R0FnItRHc1xMn2tX5Cw3cKJ0/hbCs5rH25HTgXngxGGpH85PLfby4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746641934; c=relaxed/simple;
	bh=Cb7lPfa1I+nXXHsCAj5RVedGy/8u1X7OZXT0Y0ZEGu0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=qdAb5x/jHCWnvjOb+wYYpmIwSm+tz1b38sgHkhqPc9sCM1bL3sJjv6tvcOmY7D6ldRLBlEp+5DyL+Tasa1IF5dOEebbznZVGywFghmR3L6ttNcl7C1Hy/KmpYVRe63hxU0Vn5HU6Jo2V7wPDHjSXztFM1X1l57FvEGaOdPONkkI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=armlinux.org.uk; spf=none smtp.mailfrom=armlinux.org.uk; dkim=pass (2048-bit key) header.d=armlinux.org.uk header.i=@armlinux.org.uk header.b=qnTrhkQc; arc=none smtp.client-ip=78.32.30.218
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=armlinux.org.uk
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=armlinux.org.uk
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=6ugXgSCQEYTAHRBy/pD+R4TTEhjYrAi8FqkY7a1ivXI=; b=qnTrhkQcB1dfrE1kXPGtGpVrFt
	qGCJCIC0kkV+Y7VfZu+XyDXpp4Eioep2xWINz8URTXXIMODcmALdeUvRqdK0Fu/XhCnFCMhivS0lM
	WtWOh6dZUWbYID+BA/neL2UiEHWHdV1p2Yn9y9wZCLlcezA1Db1M0t3gIKKVRVvVVNhkmbYOSkbO4
	srC480Dfszwlflq2bO8+26GxBVMACaVmL6evD8yyZ6c4haNcrJVyKwizXCJKGHgWUrr/VmFPputQQ
	IWqeRAYoHIWCHIKt0m8mn430fwNTWEZkSd6z2Z7nVg7lqnxWDxmozRo+Co3SUEMhPIb6RZujZN0c4
	Z3mZnM4A==;
Received: from shell.armlinux.org.uk ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:56908)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <linux@armlinux.org.uk>)
	id 1uCjLt-0007y2-0i;
	Wed, 07 May 2025 19:18:41 +0100
Received: from linux by shell.armlinux.org.uk with local (Exim 4.96)
	(envelope-from <linux@shell.armlinux.org.uk>)
	id 1uCjLp-0005zp-0X;
	Wed, 07 May 2025 19:18:37 +0100
Date: Wed, 7 May 2025 19:18:37 +0100
From: "Russell King (Oracle)" <linux@armlinux.org.uk>
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: Maxime Chevallier <maxime.chevallier@bootlin.com>,
	Linus Torvalds <torvalds@linux-foundation.org>,
	Andrew Lunn <andrew@lunn.ch>,
	Woojung Huh <woojung.huh@microchip.com>,
	Vladimir Oltean <olteanv@gmail.com>,
	Heiner Kallweit <hkallweit1@gmail.com>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	linux-input@vger.kernel.org, linux-kernel@vger.kernel.org,
	Peter Hutterer <peter.hutterer@who-t.net>,
	Benjamin Tissoires <benjamin.tissoires@redhat.com>
Subject: Re: [BUG] Stuck key syndrome (was: Re: [PATCH net-next v2] net: dsa:
 microchip: Add SGMII port support to KSZ9477 switch)
Message-ID: <aBuj_ftDDNSnW4yF@shell.armlinux.org.uk>
References: <20250507000911.14825-1-Tristram.Ha@microchip.com>
 <20250507094449.60885752@fedora.home>
 <aBsadO2IB_je91Jx@shell.armlinux.org.uk>
 <20250507105457.25a3b9cb@fedora.home>
 <aBsmhfI45zMltjcy@shell.armlinux.org.uk>
 <aBsu-WBlPQy5g-Jn@shell.armlinux.org.uk>
 <20250507153236.5303be86@fedora.home>
 <aBtHmNGRTVP9SttE@shell.armlinux.org.uk>
 <20250507135126.7d34d18f@fedora.home>
 <5pqtpt3o7swty6mxdsnitultixnemfiix3zuxsxzhjb7edaylu@4d3fe7agyeuv>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <5pqtpt3o7swty6mxdsnitultixnemfiix3zuxsxzhjb7edaylu@4d3fe7agyeuv>
Sender: Russell King (Oracle) <linux@armlinux.org.uk>

On Wed, May 07, 2025 at 10:45:48AM -0700, Dmitry Torokhov wrote:
> On Wed, May 07, 2025 at 01:51:26PM +0200, Maxime Chevallier wrote:
> > On Wed, 7 May 2025 12:44:24 +0100
> > "Russell King (Oracle)" <linux@armlinux.org.uk> wrote:
> > 
> > > Hi Maxime,
> > > 
> > > On Wed, May 07, 2025 at 03:32:36PM +0200, Maxime Chevallier wrote:
> > > > Hi Russell,
> > > > 
> > > > On Wed, 7 May 2025 10:59:21 +0100
> > > > "Russell King (Oracle)" <linux@armlinux.org.uk> wrote:
> > > >   
> > > > > On Wed, May 07, 2025 at 10:23:17AM +0100, Russell King (Oracle) wrote:  
> > > > > > [Sorry for going off topic here - changed the Cc list, added Linus,
> > > > > > changed the subject.]
> > > > > > 
> > > > > > On Wed, May 07, 2025 at 10:54:57AM +0200, Maxime Chevallier wrote:    
> > > > > > > On Wed, 7 May 2025 09:31:48 +0100
> > > > > > > "Russell King (Oracle)" <linux@armlinux.org.uk> wrote:    
> > > > > > > > [rest of the email got deleted because Linux / X11 / KDE got confused
> > > > > > > > about the state the backspace key and decided it was going to be
> > > > > > > > continuously pressed and doing nothing except shutting the laptop
> > > > > > > > down would stop it.]    
> > > > > > > 
> > > > > > > Funny how I have the same exact issue on my laptop as well...     
> > > > > > 
> > > > > > I've had the "stuck key" behaviour with the HP Pavilion 15-au185sa
> > > > > > laptop I had previously (normally with ctrl-F keys). However, hitting
> > > > > > ctrl/shift/alt would stop it.
> > > > > > 
> > > > > > This is the first time I've seen the behaviour with the Carbon X1
> > > > > > laptop, but this was way more severe. No key would stop it. Trying to
> > > > > > move the focus using the trackpad/nipple had any effect. Meanwhile
> > > > > > the email was being deleted one character at a time. So I shut the
> 
> If we indeed lost a key release event somewhere the way to "restore" it
> is to hit the stuck key again. Then we should get press/release with
> press most likely being ignored and release achieving the desired
> result. Of course that will not help if embedded controller is confused.

I tried pressing every key...

> > > > > The mysterious thing is "Keylock active" - clearly it isn't because I
> > > > > can write this email typing on that very keyboard. However, I wonder
> > > > > if it needs i8042_unlock=1 to set I8042_CTR_IGNKEYLOCK.
> 
> Just ignore this message, it is harmless and trying to flip the bit
> might confuse the emulation even more. Maybe we should lower the
> severity of it to debug.
> 
> That said I do not see it on my Carbon (neither v5 nor v12, can't check
> v9 because it is at home)... What version of Carbon do you have? Do you
> have up-to-date BIOS/EC?

Neither did I see a problem until today, and I've been using the laptop
since October 2024, and this is the first time it's had an issue.

Looking at fwupd, it has an Intel ME update pending (1.32.2418 to
1.35.2557). I can't find a way to get any update history beyond
that out of fwupd and fwupd doesn't seem to log to journald what
it's doing.

> > > > It just happened to me as I was typing this very email (key 'd' got
> > > > stuck, nothing could un-stick it, couldn't move the mouse cursor but
> > > > mouse-click events did work, had to suspend/resume the laptop to fix
> > > > that)
> 
> This is weird and suggests that the breakage happens up the stack from
> the kernel (or down in the firmware). Mouse clicks and mouse movement is
> delivered as part of a mouse packet, so if there are button clicks there
> will also be movement, they are not separate. If the cursor is not
> reacting that means desktop environment is not handling input properly.

So could we be looking at an Xorg bug?

> The kernel does drop input events if userspace is unable to read buffers
> quickly enough. It notifies userspace by queuing special
> EV_SYN/SYN_DROPPED event and userspace is supposed to query the full
> device state upon receiving it to figure out what to do. I doubt we are
> running into this with keyboards, but maybe we should add some logging
> there to rule this out.
> 
> I'll add Peter and Benjamin to this thread in case they have ideas.

I'm thinking of leaving evtest running in a terminal, so its output
can be inspected if it happens again. One issue though is the
timestamps aren't readable, but I'm sure with a bit of perl
post-processing that could be fixed.

That would allow an answer to "is it kernel or firmware" vs
"userspace".

The problem is - if it's taken 7-ish months to show for me, it's
likely that evtest won't be running when it next happens (as there
will be needs to reboot for kernel upgrades/firmware upgrades in
that time.) Really, it needs to be something like an automatically
started at boot e.g. evtest inside a detached screen session.

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 80Mbps down 10Mbps up. Decent connectivity at last!

