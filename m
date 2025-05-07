Return-Path: <linux-input+bounces-12214-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 56B1AAAE819
	for <lists+linux-input@lfdr.de>; Wed,  7 May 2025 19:47:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id AB95C1B68F09
	for <lists+linux-input@lfdr.de>; Wed,  7 May 2025 17:47:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F060E1DF265;
	Wed,  7 May 2025 17:47:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=armlinux.org.uk header.i=@armlinux.org.uk header.b="OMywDAR0"
X-Original-To: linux-input@vger.kernel.org
Received: from pandora.armlinux.org.uk (pandora.armlinux.org.uk [78.32.30.218])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8714A79CF;
	Wed,  7 May 2025 17:47:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=78.32.30.218
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746640025; cv=none; b=NAi/zZm9y8WQoqfET1xkuIaLfyxzbn3IQFDCNLw/Ia7vLse5yA6cWDcvCXgE/vgbyNDLdjLRDs2/koLIyet4iVHs+jig0PjLrHLdPakt9FcCvg1McKC4XtlDOniRAv6uodhfcVnG9feGjqmyriZfW9iNL6OUWqXA10MCua+YcEA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746640025; c=relaxed/simple;
	bh=0wrJbMsJSmhLIcjAMpxNer7ToAebsa5FmviVT3D300U=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=BUCKxbOffBjhiBZ+wOQ7tYWwa3zjE/ewEnaIb5iYFkJmGXfEkCck7SiQblJ7/sp0suSW/BA/Htwq4acX7arJDOdK+nVMS3lwbQA7RYK1smDJeKJYoHfYkeAMp6FH5tXON5zs7+STZ2s7lXNg6O/auijXs9p5Yk5Iqoy6bRbdUDY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=armlinux.org.uk; spf=none smtp.mailfrom=armlinux.org.uk; dkim=pass (2048-bit key) header.d=armlinux.org.uk header.i=@armlinux.org.uk header.b=OMywDAR0; arc=none smtp.client-ip=78.32.30.218
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=armlinux.org.uk
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=armlinux.org.uk
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=fRNN74UTjbzrFHcfot3EQkpeAfOgMQTGhEyJ//Yz0UA=; b=OMywDAR0Lt0bkCzQP4tQubdtCl
	V5Eg1di5uFbL381PfV7GBIhazLGwXuqLBnk68E+lhTEvR13mMirpSzDfZELVhrC3dvnuUDObMbo/i
	Gyi/A/dt9sVq30QWWfiZRadJN5jXt8hNyEjv+T7/9If12lTnj/ZmobLuMhoE1T9P9Oz04xAeUQmaA
	eOdm7Dz0P+stV55DFLKprRpJsJSwmeWR9wK7K3s9S4YG3WG2KnNzo682MS9vfrv+diD/viLAuBppL
	ou7SiMKTitRFItHR1u9USA4u3NgTM+s2uGAV/cZKNz4Di4xtFtJmFlA9qsmZ52EUvf9A7PGmu6Nm2
	YXGolxJA==;
Received: from shell.armlinux.org.uk ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:49072)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <linux@armlinux.org.uk>)
	id 1uCir6-0007vq-2S;
	Wed, 07 May 2025 18:46:52 +0100
Received: from linux by shell.armlinux.org.uk with local (Exim 4.96)
	(envelope-from <linux@shell.armlinux.org.uk>)
	id 1uCir2-0005xo-1K;
	Wed, 07 May 2025 18:46:48 +0100
Date: Wed, 7 May 2025 18:46:48 +0100
From: "Russell King (Oracle)" <linux@armlinux.org.uk>
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: Linus Torvalds <torvalds@linux-foundation.org>,
	Maxime Chevallier <maxime.chevallier@bootlin.com>,
	Andrew Lunn <andrew@lunn.ch>,
	Woojung Huh <woojung.huh@microchip.com>,
	Vladimir Oltean <olteanv@gmail.com>,
	Heiner Kallweit <hkallweit1@gmail.com>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	linux-input@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [BUG] Stuck key syndrome (was: Re: [PATCH net-next v2] net: dsa:
 microchip: Add SGMII port support to KSZ9477 switch)
Message-ID: <aBuciGLIzokQrjrE@shell.armlinux.org.uk>
References: <20250507094449.60885752@fedora.home>
 <aBsadO2IB_je91Jx@shell.armlinux.org.uk>
 <20250507105457.25a3b9cb@fedora.home>
 <aBsmhfI45zMltjcy@shell.armlinux.org.uk>
 <aBsu-WBlPQy5g-Jn@shell.armlinux.org.uk>
 <20250507153236.5303be86@fedora.home>
 <aBtHmNGRTVP9SttE@shell.armlinux.org.uk>
 <20250507135126.7d34d18f@fedora.home>
 <CAHk-=wipkOP939yPWroH_u+CQGsJQRSa_BHsg4cLNPRPq86sAQ@mail.gmail.com>
 <im4cvmgjmdztjsvhorxt77t43o4a7rixoqyawp67jwijsg4vpn@jdl7m75ts2pc>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <im4cvmgjmdztjsvhorxt77t43o4a7rixoqyawp67jwijsg4vpn@jdl7m75ts2pc>
Sender: Russell King (Oracle) <linux@armlinux.org.uk>

On Wed, May 07, 2025 at 10:23:37AM -0700, Dmitry Torokhov wrote:
> On Wed, May 07, 2025 at 07:46:03AM -0700, Linus Torvalds wrote:
> > On Wed, 7 May 2025 at 04:51, Maxime Chevallier
> > <maxime.chevallier@bootlin.com> wrote:
> > >
> > > So, same as you, it'll take a long time for me to say with some amount
> > > of certainty that 'i8042_unlock=1' has a beneficial effect, of
> > > course unless I see the problem happen again in the meantime.
> > 
> > Christ. You'd expect that any i8042 issues had been fixed long ago,
> > but the problem is that the chip doesn't necessarily even exist in
> > modern platforms, and everybody just fakes it.
> 
> It has not existed as a real chip for more than 20 years I believe. It's
> all faked in firmware and embedded controllers that fake it in their
> firmwares.
> 
> And newer firmware tend to implement less and less of it, just what OS
> that devices that ship with it needs.
> 
> > 
> > So the platform presumably still has hardware support for it, but it's
> > mostly in the form of "take a trap when accessing the legacy keyboard
> > ports, and fake it in firmware".
> > 
> > Although it doesn't help that there are literally decades of clone
> > chips and hacky real hardware that extended on the i8042 in various
> > more-or-less compatible ways.
> > 
> > Which makes all of these things almost entirely undebuggable.
> > 
> > I'm surprised the XPS9510 would be particularly troublesome - I've had
> > an XPS for years (older version, obviously) with no issues outside of
> > WiFi sometimes acting up. But random firmware...
> > 
> > I doubt it's "keylock active", but who knows. I get that on my xps
> > too, it's a random bit that doesn't really mean much. But - because of
> > all the reasons above - who knows...
> 
> It is typically harmless and whats more trying to "unlock" 8042 when it
> reports being locked might confuse 8042 emulation.

So I think the summary of this thread is... laptop keyboards are
unreliable, and it's a lottery whether any particular laptop works
or remains working over firmware updates.

Surely that essentially means, laptops are basically unreliable
devices?

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 80Mbps down 10Mbps up. Decent connectivity at last!

