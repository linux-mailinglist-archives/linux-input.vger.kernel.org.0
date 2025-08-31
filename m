Return-Path: <linux-input+bounces-14405-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id E00DFB3D516
	for <lists+linux-input@lfdr.de>; Sun, 31 Aug 2025 22:09:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 153AD189167E
	for <lists+linux-input@lfdr.de>; Sun, 31 Aug 2025 20:10:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4A0BB238176;
	Sun, 31 Aug 2025 20:09:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ewhac.org header.i=@ewhac.org header.b="Ep+RkIzn"
X-Original-To: linux-input@vger.kernel.org
Received: from rusty.tulip.relay.mailchannels.net (rusty.tulip.relay.mailchannels.net [23.83.218.252])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 09506220686;
	Sun, 31 Aug 2025 20:09:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=23.83.218.252
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756670988; cv=pass; b=KyhP5BD/+pf3VeB4Y4GSjiVOczuqxR4fCbuhJ9g8anSgjsdGtaYPH1KoCOj93P6f2cO79Q1aSMGgsdwQGJVlHhr/fRGS3Hta7Nmkgro00M3hlIYJC1811Ly58MNo+2YqSf14L45SZCVo6aWdl4Xu2OIImV+DrJazZ/cnE8Ctrs0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756670988; c=relaxed/simple;
	bh=rFY77zlNYisqh2L+7CvaIyrO2n3RY5k9OZWQ0j5EUjA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=JPBLHNacGOoBKRBqmnZhYryEp/7yu98dfA5CYDxrHlt5UTkg414q7nrbhB7xlS5c5ZGR8d4bM4aX/TSElJ9pdNZIMVZMXdr7eYxNmkRAb22mWnPjAcWv3PrHTj3sR+O1EusdkDqb/jCMGLSmkiO+DiayAS+H0DDYM9/R7qDWtvI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ewhac.org; spf=pass smtp.mailfrom=ewhac.org; dkim=pass (2048-bit key) header.d=ewhac.org header.i=@ewhac.org header.b=Ep+RkIzn; arc=pass smtp.client-ip=23.83.218.252
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ewhac.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ewhac.org
X-Sender-Id: dreamhost|x-authsender|ewhac@ewhac.org
Received: from relay.mailchannels.net (localhost [127.0.0.1])
	by relay.mailchannels.net (Postfix) with ESMTP id 6A78A8C288F;
	Sun, 31 Aug 2025 19:51:18 +0000 (UTC)
Received: from pdx1-sub0-mail-a297.dreamhost.com (trex-blue-3.trex.outbound.svc.cluster.local [100.102.95.70])
	(Authenticated sender: dreamhost)
	by relay.mailchannels.net (Postfix) with ESMTPA id 03B998C321B;
	Sun, 31 Aug 2025 19:51:18 +0000 (UTC)
ARC-Seal: i=1; s=arc-2022; d=mailchannels.net; t=1756669878; a=rsa-sha256;
	cv=none;
	b=1tX7HvwtjizUQjyciDKZifDtaD5VdyA3XJplYTlAvoomySZkRs5cd63RNracaR3zW2qXZ/
	svbBZcSveIyDAklzxAfjUgr+ZCeCMJkdDPFdh4SECdOAVMiMsUEdj1tD7fSab8vXx8W1KN
	mErdy7UGL92dZ+d0JAkFpC9YJ5jvgEyXePbeT9Fu23ZIocqdz/ZJ6Ygf6BnEPiBAlsmjyP
	qceyxYLtymXKft1dSNDD4D7UfmMCy4UqDI7stJPX107sPMC1LW6Oz1u2dVbQgJxNxI1NlG
	XOoWpxLi6ulXVSDLUp13EY9HfVviWpv4MZInrGCfD9ioNVvHEouth3vDyLgMLQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mailchannels.net;
	s=arc-2022; t=1756669878;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references:dkim-signature;
	bh=VLU02iVNycclzI6Z0IFREXDuWWf/noRKQ+SxISglTxQ=;
	b=iV73ZQYpONregkYQgkHBihU6c9O/qdg/WNK39B1pIgc0yxijX91ZDBR1uIc33bntwelMne
	IAGV0NBBf+v1xKFtMgxjAV3d1rWwLeCUDMQ1dpenE0H2x7lGpRKCP8bmeExz1OjcHzZE0o
	6fKb64M/jP6Kv9iTBEuVAkcsjAuiCpvUAXaeeVcNTlS6os+L6nQmY/vT56vUNeU9rfA7ld
	gE7DGMcznWCQnuDprqsrRux8rrLlf9ZwtJ9MxwMEhdhwTC5C3K5QP2XV0eOeswjNskgtdw
	/QSmbABQp/+7g+f8oLNKQvlxJpSBksihXm22EUiLuk6M3hhawaa2YeanlAgpnw==
ARC-Authentication-Results: i=1;
	rspamd-7b4c58cfff-t4shr;
	auth=pass smtp.auth=dreamhost smtp.mailfrom=ewhac@ewhac.org
X-Sender-Id: dreamhost|x-authsender|ewhac@ewhac.org
X-MC-Relay: Neutral
X-MailChannels-SenderId: dreamhost|x-authsender|ewhac@ewhac.org
X-MailChannels-Auth-Id: dreamhost
X-Fearful-Obese: 20a9405e038de6a0_1756669878256_3802233824
X-MC-Loop-Signature: 1756669878255:3413618577
X-MC-Ingress-Time: 1756669878255
Received: from pdx1-sub0-mail-a297.dreamhost.com (pop.dreamhost.com
 [64.90.62.162])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384)
	by 100.102.95.70 (trex/7.1.3);
	Sun, 31 Aug 2025 19:51:18 +0000
Received: from ewhac.org (unknown [50.196.148.202])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: ewhac@ewhac.org)
	by pdx1-sub0-mail-a297.dreamhost.com (Postfix) with ESMTPSA id 4cFN1162dzzJ8;
	Sun, 31 Aug 2025 12:51:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ewhac.org;
	s=dreamhost; t=1756669877;
	bh=VLU02iVNycclzI6Z0IFREXDuWWf/noRKQ+SxISglTxQ=;
	h=Date:From:To:Cc:Subject:Content-Type;
	b=Ep+RkIzn1AINQ+pdRF61/xejc5wtjDcNkOKKam29ChjQ0R6zYG1cPey9wpmaK83Yl
	 jTI9eo8RUbBd6x9WCBqR4Dk0SPnX7IS/OYiybozFXdbw8OilvnU4eJ/2Xr6DiJkLDu
	 1YBfwt1DLvSXfJF71agTLIKktOEgDm3o4lfekE7fzX/3MObOvJXX81djGNJMxA/1BW
	 9Rrnn184YOlzGSOoyx6+tq3w/MQ0JL3kKSRo/bc5NBD41/nNgRLTW8XYvBrYYFCn/u
	 ul+CfbMjao5NTgmO1+3gum1u3LMXzeyaViJjEawQjsvrnhPDJnj0LcpQwsWMsihHo6
	 ASwfDsy2rRUgA==
Received: from ewhac by walkies with local (Exim 4.98.2)
	(envelope-from <ewhac@ewhac.org>)
	id 1uso56-00000000Clk-4B4U;
	Sun, 31 Aug 2025 12:51:17 -0700
Date: Sun, 31 Aug 2025 12:51:16 -0700
From: "Leo L. Schwab" <ewhac@ewhac.org>
To: Hans de Goede <hansg@kernel.org>
Cc: Kate Hsuan <hpa@redhat.com>, Jiri Kosina <jikos@kernel.org>,
	Benjamin Tissoires <bentiss@kernel.org>,
	linux-input@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3] HID: lg-g15 - Add support for Logitech G13.
Message-ID: <aLSntMknSv3lMarZ@ewhac.org>
References: <20250814212641.197573-2-ewhac@ewhac.org>
 <7d356834-5795-4979-9f51-0ffcec52ae1d@kernel.org>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <7d356834-5795-4979-9f51-0ffcec52ae1d@kernel.org>

On Sun, Aug 31, 2025 at 03:01:12PM +0200, Hans de Goede wrote:
> > +static const u16 g13_keys_for_bits_js[] = {
> > +	/* Joystick buttons */
> > +	/* These keybits are at bit indices 33, 34, and 35. */
> > +	BTN_BASE,	/* Left side */
> > +	BTN_BASE2,	/* Bottom side */
> > +	BTN_THUMB,	/* Stick depress */
> > +};
> 
> You are using this 33 offset hardcoded below, maybe
> at a #define for this, e.g. :
> 
> #define G13_JS_KEYBITS_OFFSET	33
>
	Noted.

> g13_keys_for_bits_js[] is contiguous so no need
> for this if (g13_keys_for_bits_js[i]) test.
>
	Noted.

> > +	if (IS_ENABLED(CONFIG_LEDS_BRIGHTNESS_HW_CHANGED)) {
> 
> I do not believe that this IS_ENABLED(CONFIG_LEDS_BRIGHTNESS_HW_CHANGED)
> is necessary, led_classdev_notify_brightness_hw_changed() has a static
> inline replacement when CONFIG_LEDS_BRIGHTNESS_HW_CHANGED is not set,
> so you can just call it unconditionally.
> 
> This is already called unconditionally in other places of the code.
>
	I was actually bit by this in the first two revs by the build bot.
If CONFIG_LEDS_BRIGHTNESS_HW_CHANGED is not enabled, the field
`cdev.brightness_hw_changed`, referenced a bit further down, does not exist,
and causes a build failure.

	My first attempt at #ifdef-ing around it led to another build bot
warning about `hw_brightness_changed` being defined but not used.  Then I
leanred about `IS_ENABLED()`, which is evidently now preferred over `#ifdef
CONFIG_`, and nicely isolated the whole block, so I went with that.

> g13_keys_for_bits_js[] is contiguous so no need
> for this if (g13_keys_for_bits_js[i]) test.
> 
> This will also allow you to drop the {} from the for loop.
>
	Noted.

	I've been mucking around with Rust a bit lately (and badly indented
JavaScript rather more), and am now in the habit putting braces around
single-line `if` clauses.

> Besides from my few small remarks this looks good to me,
> feel free to add:
> 
> Reviewed-by: Hans de Goede <hansg@kernel.org>
> 
> to the next version.
>
	Thank you very kindly, sir!

					Schwab

