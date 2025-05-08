Return-Path: <linux-input+bounces-12226-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 09EC3AAF2AB
	for <lists+linux-input@lfdr.de>; Thu,  8 May 2025 07:13:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id E2C21982472
	for <lists+linux-input@lfdr.de>; Thu,  8 May 2025 05:12:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1A42D210F59;
	Thu,  8 May 2025 05:13:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=who-t.net header.i=@who-t.net header.b="lWCqPAmn";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="umcakLIy"
X-Original-To: linux-input@vger.kernel.org
Received: from fhigh-b8-smtp.messagingengine.com (fhigh-b8-smtp.messagingengine.com [202.12.124.159])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 28064770E2;
	Thu,  8 May 2025 05:12:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.12.124.159
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746681183; cv=none; b=OJZEYFAfja9QYZgM8a8RainvfOQyptdPVudRG6aQxgzgyOsRSHZ0N5gSsM9yh5F29VQqVw/TdAFzUwJaO0cG+1V5MP+RijKDQVawtvUdTxd5E4zY9l+4KsaA6Ai2dtnTKxN2JcaMMr0KkxRYrFWxLV2dz1xRIkl1BvkGDwgJmWU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746681183; c=relaxed/simple;
	bh=G4174IeeHaeXuRFMW9GGMeDceAaDN6HzKM45VautBw8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=His6Hp6X44V0bx5cYalhaS0paJzgj357TsXSCSgyWhCyFbrEuXzrh5vLmRSb2mrw6Fr9HMvKC9cjmJNuTmyVgWJuo0IngmkzlJcNTuc0YW1CEzbWqlIfakUpeJU0WaE6d2PVgqqLoZfjtLcGptelK9/cjhhGCDQLR4zJocHNx5I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=who-t.net; spf=pass smtp.mailfrom=who-t.net; dkim=pass (2048-bit key) header.d=who-t.net header.i=@who-t.net header.b=lWCqPAmn; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=umcakLIy; arc=none smtp.client-ip=202.12.124.159
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=who-t.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=who-t.net
Received: from phl-compute-01.internal (phl-compute-01.phl.internal [10.202.2.41])
	by mailfhigh.stl.internal (Postfix) with ESMTP id 6A3FA25401BF;
	Thu,  8 May 2025 01:12:58 -0400 (EDT)
Received: from phl-mailfrontend-01 ([10.202.2.162])
  by phl-compute-01.internal (MEProxy); Thu, 08 May 2025 01:12:58 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=who-t.net; h=cc
	:cc:content-type:content-type:date:date:from:from:in-reply-to
	:in-reply-to:message-id:mime-version:references:reply-to:subject
	:subject:to:to; s=fm2; t=1746681178; x=1746767578; bh=mgf94WRZaU
	yNTPCpaXcAf00AKluLV1/JoRboWzDAl+U=; b=lWCqPAmnC5DmLQDFjAWprDOEC+
	e4nmGTQXoxB6CpRzSCqOLRkWK+0ezPXoXW1xhud63Nw8pzZ5Q7Q/JiN7GCf+5uff
	10SsTAuFpdEqrHgtmZef/zUghHLBjj6PHe1+Rp0GNab3xYrj9J5YdUt/2RYLwOCw
	FysPHVdTlkGR+Zjpcjnt/863r0Z8VU058cHlRYSmRKJ5IVzScQ/HpvNzSKbSrNZW
	UjKwbL+vVZo2hGfQSOnCXC25Oen8iuYbY93FcrHqsPB+fEMAa9UV6y1Ux2a5MG54
	AKItX8DDmZGt9h3yJRK6Pcpu7eH65VMEvAMU81SQByo6eIisYYEkl9N3Ahag==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=
	1746681178; x=1746767578; bh=mgf94WRZaUyNTPCpaXcAf00AKluLV1/JoRb
	oWzDAl+U=; b=umcakLIykQNxuKsed88HTHOrZLkYPun0P/kx9QeycObdmjLMqx2
	5rAKF93fD2YCKTax7vcIYCLyoZFQG+T/H9JWW/AQR4uNOqp8d2O6GtS+ErFsVaP9
	rsCYKKPuGAi8K5XRxF/vW7fqSuODZEpq5tmuoGKDxNtyRombNr5nqzlbh5ux9Ovc
	ZU5epDjykbANX/T40RDGmGH90FzapFB9Jhp0Z91DgEeAa6ZvXoWR5TiZajJZUNXg
	nLAZRwErjUT3i3sgpTlb8Z9Ido2sfpsf96+pP75IYIotwyN5Uh5kN+igDKGWqd3W
	nkzA1W6USOhVLGSI0plyjpWDD8eNJhAdtog==
X-ME-Sender: <xms:WT0caMlPFzsk7TeLJ8gKUihsY8kxN9CeycYuAGX0rvmrfyef0fk5Qg>
    <xme:WT0caL2q3T2tGM7pN-pDitQmNvv55tjejlyJyxe657uBWz7HAiY6EmfiE6OPeR0tI
    te1QdXAFO46_8GMGpk>
X-ME-Received: <xmr:WT0caKrYY8I7kdvVnvwFELqpVvGuO_wJ8GvTroHGJcdThLrGodSq4NFkmIQPcNeQsNbMpzk6eHln7eMcWOSHjY-vsbJC78Imew>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddvkeekkeeiucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdggtfgfnhhsuhgsshgtrhhisggv
    pdfurfetoffkrfgpnffqhgenuceurghilhhouhhtmecufedttdenucesvcftvggtihhpih
    gvnhhtshculddquddttddmnecujfgurhepfffhvfevuffkfhggtggujgesthdtredttddt
    vdenucfhrhhomheprfgvthgvrhcujfhuthhtvghrvghruceophgvthgvrhdrhhhuthhtvg
    hrvghrseifhhhoqdhtrdhnvghtqeenucggtffrrghtthgvrhhnpeekvdekgeehfeejgfdv
    udffhfevheejffevgfeigfekhfduieefudfgtedugfetgfenucevlhhushhtvghrufhiii
    gvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehpvghtvghrrdhhuhhtthgvrhgvrhes
    fihhohdqthdrnhgvthdpnhgspghrtghpthhtohepudehpdhmohguvgepshhmthhpohhuth
    dprhgtphhtthhopehlihhnuhigsegrrhhmlhhinhhugidrohhrghdruhhkpdhrtghpthht
    ohepughmihhtrhihrdhtohhrohhkhhhovhesghhmrghilhdrtghomhdprhgtphhtthhope
    hmrgigihhmvgdrtghhvghvrghllhhivghrsegsohhothhlihhnrdgtohhmpdhrtghpthht
    ohepthhorhhvrghlughssehlihhnuhigqdhfohhunhgurghtihhonhdrohhrghdprhgtph
    htthhopegrnhgurhgvfieslhhunhhnrdgthhdprhgtphhtthhopeifohhojhhunhhgrdhh
    uhhhsehmihgtrhhotghhihhprdgtohhmpdhrtghpthhtohepohhlthgvrghnvhesghhmrg
    hilhdrtghomhdprhgtphhtthhopehhkhgrlhhlfigvihhtudesghhmrghilhdrtghomhdp
    rhgtphhtthhopegurghvvghmsegurghvvghmlhhofhhtrdhnvght
X-ME-Proxy: <xmx:WT0caIlox-Z7sgQpiNI3mYtFISNNN16cAaOQTOi8BFAcJEZaUCDCpA>
    <xmx:WT0caK1cYtMp3pShmyeJQiFOFlCdK14-EVek1X1uvU1r_xI71zMBsw>
    <xmx:WT0caPt_h1ZK1uFeHd6XNBUnWvhe7VQrgUIIpjDQ1SWC9iuv2qqAiw>
    <xmx:WT0caGWRrqxIf3-FVkhhLAQ9OAw9qcEGb2juimpTVA6aWc5ej-nDkA>
    <xmx:Wj0caLP6J8Kvg6s4gXWHwzINh8ZA7qCmVWIbQYDmq61LuJzNQgRQNvlo>
Feedback-ID: i7ce144cd:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 8 May 2025 01:12:53 -0400 (EDT)
Date: Thu, 8 May 2025 15:10:44 +1000
From: Peter Hutterer <peter.hutterer@who-t.net>
To: "Russell King (Oracle)" <linux@armlinux.org.uk>
Cc: Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Maxime Chevallier <maxime.chevallier@bootlin.com>,
	Linus Torvalds <torvalds@linux-foundation.org>,
	Andrew Lunn <andrew@lunn.ch>,
	Woojung Huh <woojung.huh@microchip.com>,
	Vladimir Oltean <olteanv@gmail.com>,
	Heiner Kallweit <hkallweit1@gmail.com>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	linux-input@vger.kernel.org, linux-kernel@vger.kernel.org,
	Benjamin Tissoires <benjamin.tissoires@redhat.com>
Subject: Re: [BUG] Stuck key syndrome (was: Re: [PATCH net-next v2] net: dsa:
 microchip: Add SGMII port support to KSZ9477 switch)
Message-ID: <20250508051044.GA3689439@quokka>
References: <20250507094449.60885752@fedora.home>
 <aBsadO2IB_je91Jx@shell.armlinux.org.uk>
 <20250507105457.25a3b9cb@fedora.home>
 <aBsmhfI45zMltjcy@shell.armlinux.org.uk>
 <aBsu-WBlPQy5g-Jn@shell.armlinux.org.uk>
 <20250507153236.5303be86@fedora.home>
 <aBtHmNGRTVP9SttE@shell.armlinux.org.uk>
 <20250507135126.7d34d18f@fedora.home>
 <5pqtpt3o7swty6mxdsnitultixnemfiix3zuxsxzhjb7edaylu@4d3fe7agyeuv>
 <aBuj_ftDDNSnW4yF@shell.armlinux.org.uk>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aBuj_ftDDNSnW4yF@shell.armlinux.org.uk>

On Wed, May 07, 2025 at 07:18:37PM +0100, Russell King (Oracle) wrote:
> On Wed, May 07, 2025 at 10:45:48AM -0700, Dmitry Torokhov wrote:
> > On Wed, May 07, 2025 at 01:51:26PM +0200, Maxime Chevallier wrote:
> > > On Wed, 7 May 2025 12:44:24 +0100
> > > "Russell King (Oracle)" <linux@armlinux.org.uk> wrote:
> > > 
> > > > Hi Maxime,
> > > > 
> > > > On Wed, May 07, 2025 at 03:32:36PM +0200, Maxime Chevallier wrote:
> > > > > Hi Russell,
> > > > > 
> > > > > On Wed, 7 May 2025 10:59:21 +0100
> > > > > "Russell King (Oracle)" <linux@armlinux.org.uk> wrote:
> > > > >   
> > > > > > On Wed, May 07, 2025 at 10:23:17AM +0100, Russell King (Oracle) wrote:  
> > > > > > > [Sorry for going off topic here - changed the Cc list, added Linus,
> > > > > > > changed the subject.]
> > > > > > > 
> > > > > > > On Wed, May 07, 2025 at 10:54:57AM +0200, Maxime Chevallier wrote:    
> > > > > > > > On Wed, 7 May 2025 09:31:48 +0100
> > > > > > > > "Russell King (Oracle)" <linux@armlinux.org.uk> wrote:    
> > > > > > > > > [rest of the email got deleted because Linux / X11 / KDE got confused
> > > > > > > > > about the state the backspace key and decided it was going to be
> > > > > > > > > continuously pressed and doing nothing except shutting the laptop
> > > > > > > > > down would stop it.]    
> > > > > > > > 
> > > > > > > > Funny how I have the same exact issue on my laptop as well...     
> > > > > > > 
> > > > > > > I've had the "stuck key" behaviour with the HP Pavilion 15-au185sa
> > > > > > > laptop I had previously (normally with ctrl-F keys). However, hitting
> > > > > > > ctrl/shift/alt would stop it.
> > > > > > > 
> > > > > > > This is the first time I've seen the behaviour with the Carbon X1
> > > > > > > laptop, but this was way more severe. No key would stop it. Trying to
> > > > > > > move the focus using the trackpad/nipple had any effect. Meanwhile
> > > > > > > the email was being deleted one character at a time. So I shut the
> > 
> > If we indeed lost a key release event somewhere the way to "restore" it
> > is to hit the stuck key again. Then we should get press/release with
> > press most likely being ignored and release achieving the desired
> > result. Of course that will not help if embedded controller is confused.
> 
> I tried pressing every key...

ftr, any key autorepeat in XKB (or libxkbcommon) is cancelled when
another key arrives so this does indeed hint at a firmware/controller
issue.

> > > > > > The mysterious thing is "Keylock active" - clearly it isn't because I
> > > > > > can write this email typing on that very keyboard. However, I wonder
> > > > > > if it needs i8042_unlock=1 to set I8042_CTR_IGNKEYLOCK.
> > 
> > Just ignore this message, it is harmless and trying to flip the bit
> > might confuse the emulation even more. Maybe we should lower the
> > severity of it to debug.
> > 
> > That said I do not see it on my Carbon (neither v5 nor v12, can't check
> > v9 because it is at home)... What version of Carbon do you have? Do you
> > have up-to-date BIOS/EC?
> 
> Neither did I see a problem until today, and I've been using the laptop
> since October 2024, and this is the first time it's had an issue.
> 
> Looking at fwupd, it has an Intel ME update pending (1.32.2418 to
> 1.35.2557). I can't find a way to get any update history beyond
> that out of fwupd and fwupd doesn't seem to log to journald what
> it's doing.
> 
> > > > > It just happened to me as I was typing this very email (key 'd' got
> > > > > stuck, nothing could un-stick it, couldn't move the mouse cursor but
> > > > > mouse-click events did work, had to suspend/resume the laptop to fix
> > > > > that)
> > 
> > This is weird and suggests that the breakage happens up the stack from
> > the kernel (or down in the firmware). Mouse clicks and mouse movement is
> > delivered as part of a mouse packet, so if there are button clicks there
> > will also be movement, they are not separate. If the cursor is not
> > reacting that means desktop environment is not handling input properly.
> 
> So could we be looking at an Xorg bug?
> 
> > The kernel does drop input events if userspace is unable to read buffers
> > quickly enough. It notifies userspace by queuing special
> > EV_SYN/SYN_DROPPED event and userspace is supposed to query the full
> > device state upon receiving it to figure out what to do. I doubt we are
> > running into this with keyboards, but maybe we should add some logging
> > there to rule this out.
> > 
> > I'll add Peter and Benjamin to this thread in case they have ideas.
> 
> I'm thinking of leaving evtest running in a terminal, so its output
> can be inspected if it happens again. One issue though is the
> timestamps aren't readable, but I'm sure with a bit of perl
> post-processing that could be fixed.

$ screen sudo libinput record --autorestart=5 -o keyboard.yml

Select the keyboard devce and off you go.
This will create a keyboard.yml.$DATETIME file and after 5 seconds of no
events it will rotate to the next file. This means you can leave this
running for months and when it happens you stop typing for 5 seconds and
then look at the most recent (usually) two files for epiphanies.
Bonus points for ssh-ing in and killing the process remotely because
then you don't have interference of whatever

If the last event you get is a key down event the issue is in the
firmware and userspace does the right thing. In that case your 
logs will be full of EV_KEY KEY_FOO with a value of 2 (kernel repeat).

If the last event you get is a key up but the desktop still repeats
then the issue is in that part of the stack. In that case the log should
be empty after you stopped typing.

If you get a SYN_DROPPED and the desktop does the wrong thing the issue
is in libinput because it should handle that transparently (same with
the Xorg evdev driver if you're using that).

Optionally: --show-keycodes but adding this means you will leak
all your key presses into the logs (without this all alphanumeric keys
are recorded as KEY_A). So maybe only use that for entertainment value.

Optionally: provide the device node as arg (see below)

> That would allow an answer to "is it kernel or firmware" vs
> "userspace".
> 
> The problem is - if it's taken 7-ish months to show for me, it's
> likely that evtest won't be running when it next happens (as there
> will be needs to reboot for kernel upgrades/firmware upgrades in
> that time.) Really, it needs to be something like an automatically
> started at boot e.g. evtest inside a detached screen session.
 
Well, that bit I leave to you to figure out because it'll also require
scripting to find the keyboard's device node automatically so you can
pass it to libinput record via the .unit file, or cron job script, or
whatever.

Either way, this should at least make it easier to catch the issue when
it occurs.

Cheers,
  Peter

