Return-Path: <linux-input+bounces-12190-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F623AADB65
	for <lists+linux-input@lfdr.de>; Wed,  7 May 2025 11:24:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 6815D1BC0D66
	for <lists+linux-input@lfdr.de>; Wed,  7 May 2025 09:23:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AC2621B87EB;
	Wed,  7 May 2025 09:23:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=armlinux.org.uk header.i=@armlinux.org.uk header.b="iZ/pVfEY"
X-Original-To: linux-input@vger.kernel.org
Received: from pandora.armlinux.org.uk (pandora.armlinux.org.uk [78.32.30.218])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC03017A2E3;
	Wed,  7 May 2025 09:23:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=78.32.30.218
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746609812; cv=none; b=izMB87kxZXwJlQvIWBdkfFmjizzHNZdPyiudQHsELO7FzqczKRYISidcgynZZkh9D91CyQ76bU8XM4pavb/qYxTe424u2DnWhhaoBVaQ6k6Rx2802jdhTOHfiP6+SFonRebXxkxicZ2qZFKKdQPejg/p2pXH1qa5J8VxA3kznMY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746609812; c=relaxed/simple;
	bh=s7tBVy/4yRPxvQTxRMP3pUOBkZ+UDB0qWnP2HwoNlng=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=e05OIThJnD4tHxCT30ASi8mohletis30Y9AgII+LvBv8Y3BeQP1wJ8p/YO65HmhiQ17o3618cDbWLQZ5INWM1l0Lp62jAWx341/upnE0jN9acHZBFxoK5ZGy0KLi8+upUE0YMD+O1PwzLRrxP/vzS+7rm5kELDaTccchNkOIBbo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=armlinux.org.uk; spf=none smtp.mailfrom=armlinux.org.uk; dkim=pass (2048-bit key) header.d=armlinux.org.uk header.i=@armlinux.org.uk header.b=iZ/pVfEY; arc=none smtp.client-ip=78.32.30.218
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=armlinux.org.uk
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=armlinux.org.uk
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=k8F60xDzoxPgiF6ANkypIdXoaa0fUeOYplHB5ihSYa4=; b=iZ/pVfEYtUo/ZYCC81cBYkeUE0
	v5B+qBDLW+Kxc8jpMG7INT+oTVo1iksD9JRrMjh3CKwG7qrF0q2CIFJgnrDYbYo+5flu5Gd8pq2yK
	i7NRz79F+VZPPJnV42vzK7e37+gGeYByrq0VHJykhFdgBQkGM02Oz9Zo+VmIxQnwiU+jWumxwfA9q
	5sijO/b3oLTT6MOS0QRAZNQt9vQ09vFxTqSvLIOhc+OEV2S49QFYK6EmmlV86bVElw9w1xIY7hcv2
	Z8GHnE7eJsP8/n5gagcCaH5UsYE0kId0pOiidN30MVtI+IwkLlZdbsKDnAAtkmiiImz2RKuI277Y6
	/dUXJ6Aw==;
Received: from shell.armlinux.org.uk ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:44182)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <linux@armlinux.org.uk>)
	id 1uCazo-0007Hw-1K;
	Wed, 07 May 2025 10:23:20 +0100
Received: from linux by shell.armlinux.org.uk with local (Exim 4.96)
	(envelope-from <linux@shell.armlinux.org.uk>)
	id 1uCazl-0005fV-2W;
	Wed, 07 May 2025 10:23:17 +0100
Date: Wed, 7 May 2025 10:23:17 +0100
From: "Russell King (Oracle)" <linux@armlinux.org.uk>
To: Maxime Chevallier <maxime.chevallier@bootlin.com>,
	Linus Torvalds <torvalds@linux-foundation.org>
Cc: Andrew Lunn <andrew@lunn.ch>, Woojung Huh <woojung.huh@microchip.com>,
	Vladimir Oltean <olteanv@gmail.com>,
	Heiner Kallweit <hkallweit1@gmail.com>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	linux-input@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [BUG] Stuck key syndrome (was: Re: [PATCH net-next v2] net: dsa:
 microchip: Add SGMII port support to KSZ9477 switch)
Message-ID: <aBsmhfI45zMltjcy@shell.armlinux.org.uk>
References: <20250507000911.14825-1-Tristram.Ha@microchip.com>
 <20250507094449.60885752@fedora.home>
 <aBsadO2IB_je91Jx@shell.armlinux.org.uk>
 <20250507105457.25a3b9cb@fedora.home>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250507105457.25a3b9cb@fedora.home>
Sender: Russell King (Oracle) <linux@armlinux.org.uk>

[Sorry for going off topic here - changed the Cc list, added Linus,
changed the subject.]

On Wed, May 07, 2025 at 10:54:57AM +0200, Maxime Chevallier wrote:
> On Wed, 7 May 2025 09:31:48 +0100
> "Russell King (Oracle)" <linux@armlinux.org.uk> wrote:
> > [rest of the email got deleted because Linux / X11 / KDE got confused
> > about the state the backspace key and decided it was going to be
> > continuously pressed and doing nothing except shutting the laptop
> > down would stop it.]
> 
> Funny how I have the same exact issue on my laptop as well... 

I've had the "stuck key" behaviour with the HP Pavilion 15-au185sa
laptop I had previously (normally with ctrl-F keys). However, hitting
ctrl/shift/alt would stop it.

This is the first time I've seen the behaviour with the Carbon X1
laptop, but this was way more severe. No key would stop it. Trying to
move the focus using the trackpad/nipple had any effect. Meanwhile
the email was being deleted one character at a time. So I shut the
laptop lid causing it to suspend, and wondered what to do... on
re-opening the laptop, it didn't restart and is back to normal.

This suggests that the entire input subsystem in the software stack
collapsed just after the backspace key was pressed, and Xorg never
saw the key-release event. So Xorg duitifully did its key-repeat
processing, causing the email to be deleted one character at a time.

The problem is, not only did this destroy the email reply, but it
also destroyed my train of thought for the reply as well through
the panic of trying to stop the entire email being deleted.

I don't think this is a hardware issue - I think there's a problem
in the input handling somewhere in the stack of kernel, Xorg,
whatever multiple input libraries make up modern systems, and KDE.

I did check the logs. Nothing in the kernel messages that suggests
a problem. Nothing in Xorg's logs (which are difficult to tie up
because it doesn't use real timestamps that one can relate to real
time.) There's no longer any ~/.xsession-errors logfile for logging
the stuff below Xorg.

I'm running Debian Stable here - kernel 6.1.0-34-amd64, X.Org X Server
1.21.1.7, KDE Plasma (5.27.5, frameworks 5.103.0, QT 5.15.8).

Anyone else seeing this kind of behaviour - if so, what are you
using?

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 80Mbps down 10Mbps up. Decent connectivity at last!

