Return-Path: <linux-input+bounces-12196-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E416EAADDA4
	for <lists+linux-input@lfdr.de>; Wed,  7 May 2025 13:44:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 54CB57B5C45
	for <lists+linux-input@lfdr.de>; Wed,  7 May 2025 11:43:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D884924291E;
	Wed,  7 May 2025 11:44:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=armlinux.org.uk header.i=@armlinux.org.uk header.b="GUL4Pqgb"
X-Original-To: linux-input@vger.kernel.org
Received: from pandora.armlinux.org.uk (pandora.armlinux.org.uk [78.32.30.218])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C93220E005;
	Wed,  7 May 2025 11:44:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=78.32.30.218
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746618279; cv=none; b=Tr6Tf5UaM8069DDtwDtxvlG9yWc+iYn9R42/3W0RAO9RhyIKUp6iq9zRRI9pzEi0hx68MtENwqrrarWbrOa6Cdt/Yl5sp+o8WWjrrfYsFzeSb/6DP4XA15N3lLJ4ydmef8OdCvqFAtKWCoRWXfGJibEKk15edwiRiXhSIK5vrvM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746618279; c=relaxed/simple;
	bh=ARNpSkioTWa/QNiQYCHE3Jg8Dd0xmmavPCfPg7mh8/o=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=rM7htb+uI2WFjOLYwjNz2V187Ed9gODhY8Vs8YTonJcFuzwalUmKg5+Tw5GaXwLtfNtxOTXg9Orb+khVI+akx2hZn4FIrhPAzhuPrvGGL+4SVcXe/keeN+jv90DuSFv8JdozhSXJKVSwBmpTe2OIJENOEwJ1G0WtiGn33Y7lMgU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=armlinux.org.uk; spf=none smtp.mailfrom=armlinux.org.uk; dkim=pass (2048-bit key) header.d=armlinux.org.uk header.i=@armlinux.org.uk header.b=GUL4Pqgb; arc=none smtp.client-ip=78.32.30.218
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=armlinux.org.uk
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=armlinux.org.uk
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=EN8g4EHsDjptpFzBX1wGeZiDRnrK6OKpcAy2HnA0VHo=; b=GUL4Pqgbb9W892qJhD8aJcoqZl
	3y7WCfpmmJ2IzTsw1Oas4CTPWw03yrXKF1eG8LxQbxfkmhbJI5wGSSwYqxvwrAJT9isWpbtjwHSrD
	1Xvt8dQg/39xNAsSWWE562+PW6lsDLxJ3r88+NG8b4XNBqQImOnpypUU5AjA5zEbGTmaGSHg00unq
	zd4zg8pkmx/i5COnS+H6FjDiIN5eNQ0p3XNtfs4WKc8JFwNGxAnZVhhBaiNWa6R53hbohhyciPrnw
	EHrI68e1IrGp604t7Ng3JdSyPrSwJIt5/5Yg4hCMqp+OsT+6OzkzWZX1jTMhg2lTSjDEbXpFRLOJb
	89Y+aGfg==;
Received: from shell.armlinux.org.uk ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:35768)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <linux@armlinux.org.uk>)
	id 1uCdCN-0007U0-1u;
	Wed, 07 May 2025 12:44:27 +0100
Received: from linux by shell.armlinux.org.uk with local (Exim 4.96)
	(envelope-from <linux@shell.armlinux.org.uk>)
	id 1uCdCK-0005l0-1K;
	Wed, 07 May 2025 12:44:24 +0100
Date: Wed, 7 May 2025 12:44:24 +0100
From: "Russell King (Oracle)" <linux@armlinux.org.uk>
To: Maxime Chevallier <maxime.chevallier@bootlin.com>
Cc: Linus Torvalds <torvalds@linux-foundation.org>,
	Andrew Lunn <andrew@lunn.ch>,
	Woojung Huh <woojung.huh@microchip.com>,
	Vladimir Oltean <olteanv@gmail.com>,
	Heiner Kallweit <hkallweit1@gmail.com>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	linux-input@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [BUG] Stuck key syndrome (was: Re: [PATCH net-next v2] net: dsa:
 microchip: Add SGMII port support to KSZ9477 switch)
Message-ID: <aBtHmNGRTVP9SttE@shell.armlinux.org.uk>
References: <20250507000911.14825-1-Tristram.Ha@microchip.com>
 <20250507094449.60885752@fedora.home>
 <aBsadO2IB_je91Jx@shell.armlinux.org.uk>
 <20250507105457.25a3b9cb@fedora.home>
 <aBsmhfI45zMltjcy@shell.armlinux.org.uk>
 <aBsu-WBlPQy5g-Jn@shell.armlinux.org.uk>
 <20250507153236.5303be86@fedora.home>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250507153236.5303be86@fedora.home>
Sender: Russell King (Oracle) <linux@armlinux.org.uk>

Hi Maxime,

On Wed, May 07, 2025 at 03:32:36PM +0200, Maxime Chevallier wrote:
> Hi Russell,
> 
> On Wed, 7 May 2025 10:59:21 +0100
> "Russell King (Oracle)" <linux@armlinux.org.uk> wrote:
> 
> > On Wed, May 07, 2025 at 10:23:17AM +0100, Russell King (Oracle) wrote:
> > > [Sorry for going off topic here - changed the Cc list, added Linus,
> > > changed the subject.]
> > > 
> > > On Wed, May 07, 2025 at 10:54:57AM +0200, Maxime Chevallier wrote:  
> > > > On Wed, 7 May 2025 09:31:48 +0100
> > > > "Russell King (Oracle)" <linux@armlinux.org.uk> wrote:  
> > > > > [rest of the email got deleted because Linux / X11 / KDE got confused
> > > > > about the state the backspace key and decided it was going to be
> > > > > continuously pressed and doing nothing except shutting the laptop
> > > > > down would stop it.]  
> > > > 
> > > > Funny how I have the same exact issue on my laptop as well...   
> > > 
> > > I've had the "stuck key" behaviour with the HP Pavilion 15-au185sa
> > > laptop I had previously (normally with ctrl-F keys). However, hitting
> > > ctrl/shift/alt would stop it.
> > > 
> > > This is the first time I've seen the behaviour with the Carbon X1
> > > laptop, but this was way more severe. No key would stop it. Trying to
> > > move the focus using the trackpad/nipple had any effect. Meanwhile
> > > the email was being deleted one character at a time. So I shut the
> > > laptop lid causing it to suspend, and wondered what to do... on
> > > re-opening the laptop, it didn't restart and is back to normal.
> > > 
> > > This suggests that the entire input subsystem in the software stack
> > > collapsed just after the backspace key was pressed, and Xorg never
> > > saw the key-release event. So Xorg duitifully did its key-repeat
> > > processing, causing the email to be deleted one character at a time.
> > > 
> > > The problem is, not only did this destroy the email reply, but it
> > > also destroyed my train of thought for the reply as well through
> > > the panic of trying to stop the entire email being deleted.
> > > 
> > > I don't think this is a hardware issue - I think there's a problem
> > > in the input handling somewhere in the stack of kernel, Xorg,
> > > whatever multiple input libraries make up modern systems, and KDE.
> > > 
> > > I did check the logs. Nothing in the kernel messages that suggests
> > > a problem. Nothing in Xorg's logs (which are difficult to tie up
> > > because it doesn't use real timestamps that one can relate to real
> > > time.) There's no longer any ~/.xsession-errors logfile for logging
> > > the stuff below Xorg.
> > > 
> > > I'm running Debian Stable here - kernel 6.1.0-34-amd64, X.Org X Server
> > > 1.21.1.7, KDE Plasma (5.27.5, frameworks 5.103.0, QT 5.15.8).  
> > 
> > I'll also add that The Carbon X1, being a laptop, its built-in keyboard
> > uses the i8042:
> > 
> > [    1.698156] i8042: PNP: PS/2 Controller [PNP0303:KBD,PNP0f13:MOU] at 0x60,0x64 irq 1,12
> > [    1.698543] i8042: Warning: Keylock active
> > [    1.700170] serio: i8042 KBD port at 0x60,0x64 irq 1
> > [    1.700174] serio: i8042 AUX port at 0x60,0x64 irq 12
> > [    1.700271] mousedev: PS/2 mouse device common for all mice
> > [    1.702951] input: AT Translated Set 2 keyboard as /devices/platform/i8042/serio0/input/input0
> > 
> > I don't have the HP laptop with me to check what that was using.
> > 
> > The mysterious thing is "Keylock active" - clearly it isn't because I
> > can write this email typing on that very keyboard. However, I wonder
> > if it needs i8042_unlock=1 to set I8042_CTR_IGNKEYLOCK.
> > 
> > Unfortunately, it's probably going to take a year on the Carbon X1
> > to work out if this makes any difference.
> >
> > > Anyone else seeing this kind of behaviour - if so, what are you
> > > using?
> 
> It just happened to me as I was typing this very email (key 'd' got
> stuck, nothing could un-stick it, couldn't move the mouse cursor but
> mouse-click events did work, had to suspend/resume the laptop to fix
> that)

'd' can be quite disastrous if you're using vi and you're in command
mode!

> Got the same "Keylock active" warning at boot :
> 
> [    0.916750] i8042: PNP: PS/2 Controller [PNP0303:PS2K,PNP0f13:PS2M] at 0x60,0x64 irq 1,12
> [    0.917210] i8042: Warning: Keylock active
> [    0.920087] serio: i8042 KBD port at 0x60,0x64 irq 1
> [    0.920090] serio: i8042 AUX port at 0x60,0x64 irq 12
> 
> Nothing in the kernel logs when the key got stuck.
> 
> Laptop is a Dell XPS 15 9510, Running Fedora 41 but I saw this issue
> before, kernel 6.14.4-200.fc41.x86_64, Wayland-based, Gnome 47.
> 
> Hopefully this helps a bit narrowing this down, I have a fairly
> different userspace stack and kernel version, but we do have the same
> driver involved and same keylock warning...

Could you try booting with i8042_unlock=1 and see whether that makes any
difference please?

I've added that to my grub config in preparation for rebooting, but even
if I booted now, I suspect it'll be some time before I have any useful
result.

How often do you see the problem?

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 80Mbps down 10Mbps up. Decent connectivity at last!

