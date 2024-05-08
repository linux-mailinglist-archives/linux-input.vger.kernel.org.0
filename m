Return-Path: <linux-input+bounces-3609-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id DD3508BFCA5
	for <lists+linux-input@lfdr.de>; Wed,  8 May 2024 13:48:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 980CC287992
	for <lists+linux-input@lfdr.de>; Wed,  8 May 2024 11:48:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A9BEB8287F;
	Wed,  8 May 2024 11:47:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="PzMa+iHl"
X-Original-To: linux-input@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F4DC82492;
	Wed,  8 May 2024 11:47:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715168874; cv=none; b=OeQxuHfqMNroZFyBFTLWZra98e72ImojDfuN3bGHV6TE70/Zo2ZmHThD1uce0uVT8DbqRdJR3DwDNqKnD1mvu/bnDdsSTShBFMmHckzdPgcGK2cnjTthWbK9bbPHwxujYz00LIaP8+HrmAbufrY32BS9lZJvlaJlLl+ZKqrLd2Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715168874; c=relaxed/simple;
	bh=uDG480PUhwe0ESIDmugza7mKOq0B7fW09PsYqfZWf+w=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=OQD9hDbdereDTM4di/juqy383T6o6AEYOO0uPzbYwWZV4P1iYhXH4XWMkHKiLcIMRUsFW0dg1ipHig8LBdX7lCAYmGT8TiJZEn2Tlx3YRjfuM0lduX7llgSU6KK2lqO7qa0a3t248pbypCVtlShdK0q8wihPCYQGm6/TiC9eYII=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=PzMa+iHl; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CFB8DC113CC;
	Wed,  8 May 2024 11:47:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1715168874;
	bh=uDG480PUhwe0ESIDmugza7mKOq0B7fW09PsYqfZWf+w=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=PzMa+iHlmGnMVBsjCPWjPeHvQZtIFYHrHr70MzejGo9K494+r1vUTzSegQVW8tQe5
	 4sUy59+h9vZq4b9MeGcfSzeIbX1WFy2YC0l0twTGv1vU2MrnxQRTW5TftBIgr+Ikyx
	 bldlW9k2RqgO/E7/oVymFWM+DbeXyUNgCQBfgjmfsvG3zXvMvV6fV1itm5qze0o1fv
	 +NIH/NEeG5uUqyX/2ThBI7VfoU9JRN+Y6mEQvXUYb3ypEsGepAqWZaka9YXE7/C1Nd
	 8xgXxwAY0Ay/0FQQvw6wthkJUVAUxbxCbUlEm3xRjDvRl2YOIZFymdHNUzdw2wF8U2
	 Z6jj9cQfnDiMg==
Date: Wed, 8 May 2024 20:47:51 +0900
From: Mark Brown <broonie@kernel.org>
To: Richard Hughes <hughsient@gmail.com>
Cc: Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Jeff LaBundy <jeff@labundy.com>,
	Hans de Goede <hdegoede@redhat.com>,
	Charles Wang <charles.goodix@gmail.com>, hadess@hadess.net,
	linux-input@vger.kernel.org, linux-kernel@vger.kernel.org,
	neil.armstrong@linaro.org
Subject: Re: [PATCH] Input: goodix-berlin - Add sysfs interface for reading
 and writing touch IC registers
Message-ID: <ZjtmZ6Jrj6vn6sv3@finisterre.sirena.org.uk>
References: <20240506114752.47204-1-charles.goodix@gmail.com>
 <6362e889-7df2-4c61-8ad5-bfe199e451ec@redhat.com>
 <ZjmOUp725QTHrfcT@google.com>
 <Zjo8eTQQS1LvzFgZ@finisterre.sirena.org.uk>
 <ZjpFVGw6PgjRcZY3@nixie71>
 <ZjqYp1oxPPWcF3jW@google.com>
 <ZjrledLjn8RsGiwC@finisterre.sirena.org.uk>
 <CAD2FfiE+VFa+7sHQg=LGkBy556msNyyFUhmWW_cAfZd0V4DPYQ@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="nDq691KZs7iF1YOg"
Content-Disposition: inline
In-Reply-To: <CAD2FfiE+VFa+7sHQg=LGkBy556msNyyFUhmWW_cAfZd0V4DPYQ@mail.gmail.com>
X-Cookie: Accuracy, n.:


--nDq691KZs7iF1YOg
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, May 08, 2024 at 09:39:41AM +0100, Richard Hughes wrote:

> If it helps, fwupd already uses mtd for other devices too, although at
> the moment we're using it only for system firmware -- e.g. intel-spi
> style. The MTD subsystem doesn't give fwupd much info about the
> {removable} device itself, and that can pose a problem unless you
> start using heuristics about the parent device to match firmware to
> the mtd device.

FWIW I know SolareFlare network cards used to do this too, though I
don't know about current products.

--nDq691KZs7iF1YOg
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmY7ZmcACgkQJNaLcl1U
h9Bivgf8C+o2DfqpMLI8yUtww0Hmq/ALfX3f27DBHJBMrIuD/k475jxEPHnIbIJH
lzizEAs4ZZW+LU5Yl+kmdYikVAv3pelrRnjHlEI5TL47wypIft3/Nh3iRHMflPkt
oskqPewUw52nQVijTLjXeT+lDPt5WhtVPohVTZPOqAeF/Gq+hen059KvvizBF6id
f6iGzbZuNTGuCOJ6xrysqjZtK+7nZxqHyhRhG2+GjV2Dxri6YQEETSCc//Nl+o2D
PE5gJ4YPIIuscbi0BINKgiYa/mIB4/HkOK2cG/lvLM1UCMWeX7uZ1GllSp5KC49q
DDYFT4Gih3hzgVzilxTxF+XKGS1D4g==
=XTWh
-----END PGP SIGNATURE-----

--nDq691KZs7iF1YOg--

