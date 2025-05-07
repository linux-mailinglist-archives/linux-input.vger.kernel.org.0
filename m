Return-Path: <linux-input+bounces-12198-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 25916AADF0A
	for <lists+linux-input@lfdr.de>; Wed,  7 May 2025 14:25:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A0D6D9A79A5
	for <lists+linux-input@lfdr.de>; Wed,  7 May 2025 12:22:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6A2F425E462;
	Wed,  7 May 2025 12:22:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="Yl0pwM/f"
X-Original-To: linux-input@vger.kernel.org
Received: from mslow3.mail.gandi.net (mslow3.mail.gandi.net [217.70.178.249])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1045A25D91E;
	Wed,  7 May 2025 12:22:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.178.249
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746620575; cv=none; b=er8bxiPld9t515BIGeWpMBkU/U+tJkp7xxg9KLQfx1vYaJAayenZ7xknjTpzqF4/AtouDu4wkfVKcP5YUW+tC8fihPJz7OLveOz067EpqwJWWJh5UoCCiqouzJMOWnJA92aE9Ctlfi04j7sPw4B2Iq3mWDwIt7bMcslK1eSDwHA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746620575; c=relaxed/simple;
	bh=eqDUV+tTimUtwNQZnqu/rGVcIw1QUrUBizHGzo/A/rA=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Igdhc+w7KmUbkDrhdol6dHhpQ0khFI9C//DO8pK7dV2whDFotV2GBHRCqMbPatMeYv71t/14MzDuesKmU2GPE2iDgCYFExsmBYyg4tqJ/DGOW3QcvQOvXAMmWnjTwszMU99Pm/gANN2VVBJl6zcvds0AwwlGe+GJAXNqap3e+e0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=Yl0pwM/f; arc=none smtp.client-ip=217.70.178.249
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net [217.70.183.193])
	by mslow3.mail.gandi.net (Postfix) with ESMTP id 4C6E958871D;
	Wed,  7 May 2025 11:51:38 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 5FA6E43A0C;
	Wed,  7 May 2025 11:51:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1746618689;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=qvrBTRhAKJ9KBaVwiA1fHOR9OqEkbdq1vvZ72C5xK6o=;
	b=Yl0pwM/f9Ds1z7/5HsLrO/sxKf0JCRUa1jEr6qb7rT37xs6UceFKhpc8V3KmnHoQoSc6vn
	U7pJecCaj2VbTosJyT1lzKUCrXbZpZVqGCitexj+kTd5TK0vhHaCKS48KpNp262IMlPJEG
	5o1M6GSSenWdXoGkQlj/hVUr9nJb0wBjV6Pn6c/zX3xzit9LIB7ACC4225UP1PsKyv8v7w
	8LVkf5VywgzVbIdQ/OVP2nVs0WICpg+yy6xXMDOvB+7AaewRJiIPAYKsguMQtqBtYB6GLE
	7FsubM2DcoIHuh/sWZwQdkrOINr/+LZBK7PeEByXLahQcVmrHoBdWhSBiDNwQg==
Date: Wed, 7 May 2025 13:51:26 +0200
From: Maxime Chevallier <maxime.chevallier@bootlin.com>
To: "Russell King (Oracle)" <linux@armlinux.org.uk>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, Andrew Lunn
 <andrew@lunn.ch>, Woojung Huh <woojung.huh@microchip.com>, Vladimir Oltean
 <olteanv@gmail.com>, Heiner Kallweit <hkallweit1@gmail.com>, "David S.
 Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, Jakub
 Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Dmitry
 Torokhov <dmitry.torokhov@gmail.com>, linux-input@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: Re: [BUG] Stuck key syndrome (was: Re: [PATCH net-next v2] net:
 dsa: microchip: Add SGMII port support to KSZ9477 switch)
Message-ID: <20250507135126.7d34d18f@fedora.home>
In-Reply-To: <aBtHmNGRTVP9SttE@shell.armlinux.org.uk>
References: <20250507000911.14825-1-Tristram.Ha@microchip.com>
	<20250507094449.60885752@fedora.home>
	<aBsadO2IB_je91Jx@shell.armlinux.org.uk>
	<20250507105457.25a3b9cb@fedora.home>
	<aBsmhfI45zMltjcy@shell.armlinux.org.uk>
	<aBsu-WBlPQy5g-Jn@shell.armlinux.org.uk>
	<20250507153236.5303be86@fedora.home>
	<aBtHmNGRTVP9SttE@shell.armlinux.org.uk>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.43; x86_64-redhat-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddvkeeijeelucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpeffhffvvefukfgjfhhoofggtgfgsehtjeertdertddvnecuhfhrohhmpeforgigihhmvgcuvehhvghvrghllhhivghruceomhgrgihimhgvrdgthhgvvhgrlhhlihgvrhessghoohhtlhhinhdrtghomheqnecuggftrfgrthhtvghrnhepgeevledtvdevueehhfevhfelhfekveeftdfgiedufeffieeltddtgfefuefhueeknecukfhppedvrgdtvdemkeeggedtmehfhedtsgemfedvheemrgeigeefmedufheiugemfhgvrgegmeegsgduieenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpedvrgdtvdemkeeggedtmehfhedtsgemfedvheemrgeigeefmedufheiugemfhgvrgegmeegsgduiedphhgvlhhopehfvgguohhrrgdrhhhomhgvpdhmrghilhhfrhhomhepmhgrgihimhgvrdgthhgvvhgrlhhlihgvrhessghoohhtlhhinhdrtghomhdpnhgspghrtghpthhtohepudefpdhrtghpthhtoheplhhinhhugiesrghrmhhlihhnuhigrdhorhhgrdhukhdprhgtphhtthhopehtohhrvhgrlhgusheslhhinhhugidqfhhouhhnuggrthhiohhnrdhorhhgpdhrtghpthhtoheprghnughrvgifsehluhhnn
 hdrtghhpdhrtghpthhtohepfihoohhjuhhnghdrhhhuhhesmhhitghrohgthhhiphdrtghomhdprhgtphhtthhopeholhhtvggrnhhvsehgmhgrihhlrdgtohhmpdhrtghpthhtohephhhkrghllhifvghithdusehgmhgrihhlrdgtohhmpdhrtghpthhtohepuggrvhgvmhesuggrvhgvmhhlohhfthdrnhgvthdprhgtphhtthhopegvughumhgriigvthesghhoohhglhgvrdgtohhm
X-GND-Sasl: maxime.chevallier@bootlin.com

On Wed, 7 May 2025 12:44:24 +0100
"Russell King (Oracle)" <linux@armlinux.org.uk> wrote:

> Hi Maxime,
> 
> On Wed, May 07, 2025 at 03:32:36PM +0200, Maxime Chevallier wrote:
> > Hi Russell,
> > 
> > On Wed, 7 May 2025 10:59:21 +0100
> > "Russell King (Oracle)" <linux@armlinux.org.uk> wrote:
> >   
> > > On Wed, May 07, 2025 at 10:23:17AM +0100, Russell King (Oracle) wrote:  
> > > > [Sorry for going off topic here - changed the Cc list, added Linus,
> > > > changed the subject.]
> > > > 
> > > > On Wed, May 07, 2025 at 10:54:57AM +0200, Maxime Chevallier wrote:    
> > > > > On Wed, 7 May 2025 09:31:48 +0100
> > > > > "Russell King (Oracle)" <linux@armlinux.org.uk> wrote:    
> > > > > > [rest of the email got deleted because Linux / X11 / KDE got confused
> > > > > > about the state the backspace key and decided it was going to be
> > > > > > continuously pressed and doing nothing except shutting the laptop
> > > > > > down would stop it.]    
> > > > > 
> > > > > Funny how I have the same exact issue on my laptop as well...     
> > > > 
> > > > I've had the "stuck key" behaviour with the HP Pavilion 15-au185sa
> > > > laptop I had previously (normally with ctrl-F keys). However, hitting
> > > > ctrl/shift/alt would stop it.
> > > > 
> > > > This is the first time I've seen the behaviour with the Carbon X1
> > > > laptop, but this was way more severe. No key would stop it. Trying to
> > > > move the focus using the trackpad/nipple had any effect. Meanwhile
> > > > the email was being deleted one character at a time. So I shut the
> > > > laptop lid causing it to suspend, and wondered what to do... on
> > > > re-opening the laptop, it didn't restart and is back to normal.
> > > > 
> > > > This suggests that the entire input subsystem in the software stack
> > > > collapsed just after the backspace key was pressed, and Xorg never
> > > > saw the key-release event. So Xorg duitifully did its key-repeat
> > > > processing, causing the email to be deleted one character at a time.
> > > > 
> > > > The problem is, not only did this destroy the email reply, but it
> > > > also destroyed my train of thought for the reply as well through
> > > > the panic of trying to stop the entire email being deleted.
> > > > 
> > > > I don't think this is a hardware issue - I think there's a problem
> > > > in the input handling somewhere in the stack of kernel, Xorg,
> > > > whatever multiple input libraries make up modern systems, and KDE.
> > > > 
> > > > I did check the logs. Nothing in the kernel messages that suggests
> > > > a problem. Nothing in Xorg's logs (which are difficult to tie up
> > > > because it doesn't use real timestamps that one can relate to real
> > > > time.) There's no longer any ~/.xsession-errors logfile for logging
> > > > the stuff below Xorg.
> > > > 
> > > > I'm running Debian Stable here - kernel 6.1.0-34-amd64, X.Org X Server
> > > > 1.21.1.7, KDE Plasma (5.27.5, frameworks 5.103.0, QT 5.15.8).    
> > > 
> > > I'll also add that The Carbon X1, being a laptop, its built-in keyboard
> > > uses the i8042:
> > > 
> > > [    1.698156] i8042: PNP: PS/2 Controller [PNP0303:KBD,PNP0f13:MOU] at 0x60,0x64 irq 1,12
> > > [    1.698543] i8042: Warning: Keylock active
> > > [    1.700170] serio: i8042 KBD port at 0x60,0x64 irq 1
> > > [    1.700174] serio: i8042 AUX port at 0x60,0x64 irq 12
> > > [    1.700271] mousedev: PS/2 mouse device common for all mice
> > > [    1.702951] input: AT Translated Set 2 keyboard as /devices/platform/i8042/serio0/input/input0
> > > 
> > > I don't have the HP laptop with me to check what that was using.
> > > 
> > > The mysterious thing is "Keylock active" - clearly it isn't because I
> > > can write this email typing on that very keyboard. However, I wonder
> > > if it needs i8042_unlock=1 to set I8042_CTR_IGNKEYLOCK.
> > > 
> > > Unfortunately, it's probably going to take a year on the Carbon X1
> > > to work out if this makes any difference.
> > >  
> > > > Anyone else seeing this kind of behaviour - if so, what are you
> > > > using?  
> > 
> > It just happened to me as I was typing this very email (key 'd' got
> > stuck, nothing could un-stick it, couldn't move the mouse cursor but
> > mouse-click events did work, had to suspend/resume the laptop to fix
> > that)  
> 
> 'd' can be quite disastrous if you're using vi and you're in command
> mode!
> 
> > Got the same "Keylock active" warning at boot :
> > 
> > [    0.916750] i8042: PNP: PS/2 Controller [PNP0303:PS2K,PNP0f13:PS2M] at 0x60,0x64 irq 1,12
> > [    0.917210] i8042: Warning: Keylock active
> > [    0.920087] serio: i8042 KBD port at 0x60,0x64 irq 1
> > [    0.920090] serio: i8042 AUX port at 0x60,0x64 irq 12
> > 
> > Nothing in the kernel logs when the key got stuck.
> > 
> > Laptop is a Dell XPS 15 9510, Running Fedora 41 but I saw this issue
> > before, kernel 6.14.4-200.fc41.x86_64, Wayland-based, Gnome 47.
> > 
> > Hopefully this helps a bit narrowing this down, I have a fairly
> > different userspace stack and kernel version, but we do have the same
> > driver involved and same keylock warning...  
> 
> Could you try booting with i8042_unlock=1 and see whether that makes any
> difference please?

I'll try this out indeed :)

> I've added that to my grub config in preparation for rebooting, but even
> if I booted now, I suspect it'll be some time before I have any useful
> result.
> 
> How often do you see the problem?

It's very sporadic, sometimes I'll see this behaviour multiple times a
day, and then nothing for weeks... This laptop has been very quirky
ever since I got it, so I categorized that as a "yet another XPS 9510
broken behaviour", but this has been a recurrent thing for multiple
years...

So, same as you, it'll take a long time for me to say with some amount
of certainty that 'i8042_unlock=1' has a beneficial effect, of
course unless I see the problem happen again in the meantime.

Maxime

