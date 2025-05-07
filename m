Return-Path: <linux-input+bounces-12221-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id DDA7EAAEE75
	for <lists+linux-input@lfdr.de>; Thu,  8 May 2025 00:07:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 1AAF71BC6C8E
	for <lists+linux-input@lfdr.de>; Wed,  7 May 2025 22:07:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9FC641F8723;
	Wed,  7 May 2025 22:07:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=armlinux.org.uk header.i=@armlinux.org.uk header.b="jjquYRkD"
X-Original-To: linux-input@vger.kernel.org
Received: from pandora.armlinux.org.uk (pandora.armlinux.org.uk [78.32.30.218])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C0171DD877;
	Wed,  7 May 2025 22:07:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=78.32.30.218
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746655635; cv=none; b=upYOlDVr8NDMN1yan+LW3WOX108Lw4J1uUcbfrZCKZ88T/1JvXiAg6Bjk4QhCflWMrSg91RNUrPtIWcTyOett6tyrBglOr4xor6Y2u7FbfnlUOxiFvxcAFlQiGnqHBEDmMjjtjHzHT9IYYP+y7BrtCBXIn2bqVD4D8WWJ+WrJs8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746655635; c=relaxed/simple;
	bh=vIxEEIRICokF33YBS+BcCzpwa911E4JyQvnArQI2jlE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=W4SEVrthtJet7EHXXGxvh4P/8OZ/Nn7ZNCu2433wufG+P5nbClAlBCQV1kZ0V9EokGN3JL0nTT+SLB3VRKJLcaPB9zOY3t050RtYzQUTLfOO6wbSjbTIkrmV61N1Vsdkpml5HMcHRoY6MIUhG82SDeBjgd5dPxkPHsE+jBChnLU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=armlinux.org.uk; spf=none smtp.mailfrom=armlinux.org.uk; dkim=pass (2048-bit key) header.d=armlinux.org.uk header.i=@armlinux.org.uk header.b=jjquYRkD; arc=none smtp.client-ip=78.32.30.218
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=armlinux.org.uk
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=armlinux.org.uk
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=i/a0Nsunve2Hy/HkJJsAqbzROyIl/VOYWXiJOwtQYJ8=; b=jjquYRkDcq+oGztsCVUBn3gcHQ
	gyjeInGoRI7WtZCDIpjEQzmeC8/uO9MjdKoZSAebhUGtV9js5SssxEwsvXyZbbNCx7LxgOxBxuqZh
	BqLCv7jZqW3Opdcnpe07ZMCxd49SXI5J3sjAzyXqPCIC1gmGG4KY7GgJPyiV6aaMk4oFvE4S1jVGI
	goLkfeCzjo79SlS5V6kQ/Uxiqqygf+L0CNWJUNua8FwYFZWVJ33+ag8GMRhaTu57uFgIcl76lDGB+
	YnM0uTMV7aja/xniKOckMie7/MgVH/gDRcOM0rEj+SR0Xpasb3kDRK/a9/x0jpLwKW41OUeamP73M
	XeHISJHQ==;
Received: from shell.armlinux.org.uk ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:48560)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <linux@armlinux.org.uk>)
	id 1uCmut-00088Z-09;
	Wed, 07 May 2025 23:07:03 +0100
Received: from linux by shell.armlinux.org.uk with local (Exim 4.96)
	(envelope-from <linux@shell.armlinux.org.uk>)
	id 1uCmuo-00068S-21;
	Wed, 07 May 2025 23:06:58 +0100
Date: Wed, 7 May 2025 23:06:58 +0100
From: "Russell King (Oracle)" <linux@armlinux.org.uk>
To: Holger =?iso-8859-1?Q?Hoffst=E4tte?= <holger@applied-asynchrony.com>
Cc: Maxime Chevallier <maxime.chevallier@bootlin.com>,
	Linus Torvalds <torvalds@linux-foundation.org>,
	Andrew Lunn <andrew@lunn.ch>,
	Woojung Huh <woojung.huh@microchip.com>,
	Vladimir Oltean <olteanv@gmail.com>,
	Heiner Kallweit <hkallweit1@gmail.com>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	linux-input@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [BUG] Stuck key syndrome
Message-ID: <aBvZgk4HFakkw_c4@shell.armlinux.org.uk>
References: <20250507000911.14825-1-Tristram.Ha@microchip.com>
 <20250507094449.60885752@fedora.home>
 <aBsadO2IB_je91Jx@shell.armlinux.org.uk>
 <20250507105457.25a3b9cb@fedora.home>
 <aBsmhfI45zMltjcy@shell.armlinux.org.uk>
 <aBsu-WBlPQy5g-Jn@shell.armlinux.org.uk>
 <20250507153236.5303be86@fedora.home>
 <aBtHmNGRTVP9SttE@shell.armlinux.org.uk>
 <859b32ca-acd5-43fd-0577-a76559ba3a9e@applied-asynchrony.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <859b32ca-acd5-43fd-0577-a76559ba3a9e@applied-asynchrony.com>
Sender: Russell King (Oracle) <linux@armlinux.org.uk>

On Wed, May 07, 2025 at 10:46:35PM +0200, Holger Hoffstätte wrote:
> On 2025-05-07 13:44, Russell King (Oracle) wrote:
> > Could you try booting with i8042_unlock=1 and see whether that makes any
> > difference please?
> 
> It did not help - just had another runaway event with that setting,
> on my ca. 2021 Thinkpad L14. Had the symptom for as long as I have
> had this machine.
> 
> We've been tracking this problem in Gentoo since late 2022, see
> https://bugs.gentoo.org/873163 and none of the suggested options
> for i8042 really make a difference. In my case I almost always get
> the stuck key events when using the cursor keys for scrolling in a
> web browser. Sometimes once a month, sometimes twice a day.
> 
> Fwiw it's not necessary to reboot; suspend/resume fixes it,
> as in close/reopen the lid if you have that configured.

Thanks - it's good to know that I'm not alone with this problem!
I wonder how common it is, I think we're now up to four people.

So it's interesting that Finn's system is AMD vs mine which have
both been Intel based systems, and we seem to have exactly the same
problem. Is it possible that both are using the same firmware for
emulating an i8042?

Also what seems to be interesting is that it afflicts specific keys.
On my old HP Pavilion, it was always Ctrl-F3 which would get stuck
down (which I use to switch to virtual desktop 3 which has my Konsoles
on.) In this case, pressing all of ctrl-shift-alt would clear it.

I've only had it once on the Lenovo Carbon X1 so far, so can't comment
if it's going to be the backspace key every time - there is an Intel ME
firmware update pending (it didn't get installed at the last reboot -
I'd accidentally left the laptop with sleep disabled but no external
power, so it drained the battery and shut itself down which probably
prevented the firmware update being installed.) I believe the Intel ME
deals with the keyboard.

Thanks for adding comment 24... I assume from what you've said above
that comment 23 has proven not to solve it completely, but has it
reduced the frequency at all for you?

What also crosses my mind is that if the i8042 is now emulated by
firmware, is there a replacement interface that the kernel should
instead be using? Surely if the i8042 emulation is as bad as this,
then e.g. under Windows these laptops would be getting very poor
write-ups due to keyboard problems afflicting Windows as well.

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 80Mbps down 10Mbps up. Decent connectivity at last!

