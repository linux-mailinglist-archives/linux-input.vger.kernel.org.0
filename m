Return-Path: <linux-input+bounces-5598-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A640953DE7
	for <lists+linux-input@lfdr.de>; Fri, 16 Aug 2024 01:30:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 562822827B7
	for <lists+linux-input@lfdr.de>; Thu, 15 Aug 2024 23:30:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 99E3A1494C7;
	Thu, 15 Aug 2024 23:30:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="UQOI08jV"
X-Original-To: linux-input@vger.kernel.org
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C70F615382F
	for <linux-input@vger.kernel.org>; Thu, 15 Aug 2024 23:30:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723764645; cv=none; b=rXe171/j5VnUpQWITM9KM1PsxYZDhqITlT9BVzQXQG9sfkd6Rk9SuF5KGIYqkCK6CtOEjzhKgMwtFKGDC4K0tPFqZrzBEfiVlY82UI3IfC6giWQ8hmu25SEueQTGwAVgqqN6scj34T28ESYKJOts96gc/Tf+Q78TT07biuM+tUY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723764645; c=relaxed/simple;
	bh=4+fs5mSQ7KpSnkvNF9oe70b8D0zmCSzLURhjzIQ9Z74=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=N8+7IcsiFMHoUU4VVR2reJlkjc7CCW5AIB6PebJzZ1Pxrme182sLS4YSt+0JS+WNS5jCSS6psF0VJjIGV5c5IWSQruNgjRjPH13tqrfOdIFmMNaKpzHz8HxdtkrQsH8vTdExdnSRr13nm5cAXth0Nwoja0O7gkN0rjI2BbAvTjM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=UQOI08jV; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=date:from:to:cc:subject:message-id
	:references:mime-version:content-type:in-reply-to; s=k1; bh=LoJ3
	1Az1zhTJcDtlXo0E/G0AymxQV5KdCulHjhZfi1k=; b=UQOI08jVLOnfy5yLXhu8
	Ww0VK5e1RTMuEyY0ZRDV+Mu6hIu2dZ1Zo/Meo42DWrBYXfN7NkEKjkTj2QEwFnpY
	MqM3L9xJ+8UA6Qoi+Q4jtB7zZ405ery+uExzs5wFD8tjw7G+xebyl69HX6GeCA8L
	LSAYFzDk3C99SJSDSipRGivg/MX/j+vvmf8aCmuCgYXnBSKTLo4RYaQ1D2DRIIbI
	LYJUdlYM50ZxYX6fj1czfHLLFMEkv/H78bfecmiBvJ2aSAXAWzTurDlmfm/9jhdK
	WCvnv3pMxJrH4E9UbKsrHmYTZ41uzTIHR8C1bfJTuYJ99mkyYv12eWQBE2QC1VK+
	Cg==
Received: (qmail 2431978 invoked from network); 16 Aug 2024 01:30:39 +0200
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 16 Aug 2024 01:30:39 +0200
X-UD-Smtp-Session: l3s3148p1@oa76OsEf8tBehhrc
Date: Fri, 16 Aug 2024 01:30:38 +0200
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: linux-input@vger.kernel.org, linux-kernel@vger.kernel.org,
	Trilok Soni <quic_tsoni@quicinc.com>,
	Felipe Balbi <balbi@kernel.org>, Tony Lindgren <tony@atomide.com>,
	Arnd Bergmann <arnd@arndb.de>, wsa@kernel.org
Subject: Re: lm8323/lm8333 keyboard drivers - drop or keep?
Message-ID: <Zr6PnlsdoyLoX261@shikoro>
Mail-Followup-To: Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	linux-input@vger.kernel.org, linux-kernel@vger.kernel.org,
	Trilok Soni <quic_tsoni@quicinc.com>,
	Felipe Balbi <balbi@kernel.org>, Tony Lindgren <tony@atomide.com>,
	Arnd Bergmann <arnd@arndb.de>, wsa@kernel.org
References: <Zr6I9RB5mibU_12N@google.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="XAItcD7sprNSpWaR"
Content-Disposition: inline
In-Reply-To: <Zr6I9RB5mibU_12N@google.com>


--XAItcD7sprNSpWaR
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Dmitry,

> Should either of these drivers be dropped? Or if it should be kept -
> why?

LM8333, that was a while ago! We definitely used the driver in a BSP,
back then at Pengutronix. I left the company shortly after and it seems
the board file was never upstreamed.

So, your call to remove it or not. Since the driver hasn't been
converted to DT yet, it probably never will. I agree to that.

Happy hacking,

   Wolfram


--XAItcD7sprNSpWaR
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAma+j5oACgkQFA3kzBSg
KbYfVA//Re/E+yS0xfadiGNjd2PDmyN6QGMQTMkMohD/QkB0n0XTEc6o1Gipd8vv
NjOfjI9XByom3SPtEumJN8B1hNYKd9Wce1MSuMrijUGNOS/MI9oPxvo5VZbXr5Uh
qhi7mhvAR4knQk7Bql3r0VFo/EDBG9gLQr8XoqtdvjqqR5foY8d5VoQTdVWBYzGH
nT6N5qanDtyZ0fqX6ed1k/ZCXiU6TZvYhytzUarcMB8gMcVM41r3EjUUX5DzaLvu
DaUeQ4ywMzpauu0/vFXqAK8MDWsuTifnVe8AdNNINMszjMNNhKCbmXG6fvFQqZgU
ffz6n4CYA4SXi3lkUnFCfXAoBIPwXYxlSNzEKYYSXL7f/zJycbC/Rueqrjxescx+
62wluqiBDkWnvA0nf7QVqSbl/XqiBTZeFbas8AuAV5otqTB8+z58AMtAWnNzJawa
WCA9Z7885r6jS9kM962Gq1StmcOcKr1XOBoJIcZ/udX7E5VvCKVGy8VsJIAa6G2+
LHyWRXqy7k5/kaFC7BPk6oBcCOc4LE9WMBlsIju95+OYZFF/Dk6GETubDor2Q4AG
mawXMjLx+7baKzaqdOIn68p0TQZotPsUqh+iYz50URDzn0ZZYk6j+TJNZD9vYodC
tpthmZz9zg8an0iROFf1F5i1EmZ603HTdvXjleo0EkT+1LbFCEQ=
=xEWd
-----END PGP SIGNATURE-----

--XAItcD7sprNSpWaR--

