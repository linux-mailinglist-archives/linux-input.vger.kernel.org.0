Return-Path: <linux-input+bounces-2031-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 96CE585EBBC
	for <lists+linux-input@lfdr.de>; Wed, 21 Feb 2024 23:18:12 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 1DC21B21F3C
	for <lists+linux-input@lfdr.de>; Wed, 21 Feb 2024 22:18:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A839A12880E;
	Wed, 21 Feb 2024 22:18:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ucw.cz header.i=@ucw.cz header.b="ThTmacQ+"
X-Original-To: linux-input@vger.kernel.org
Received: from jabberwock.ucw.cz (jabberwock.ucw.cz [46.255.230.98])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F04EE45C10;
	Wed, 21 Feb 2024 22:18:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=46.255.230.98
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708553884; cv=none; b=sWbna+ROYyew5wE1R//gSWVXz2Uwena0H9ZezUi4FBid3ZM0JWoHAELmVjLMY1fbDIWKuQbDYT0lwUhqtdkmUeTUEFUsRWMmc1DQZAeL+sGteDosr5jjuwGI8cX8m733KB5cn0KObu1IUbM7HvMxYlEKp0Qvy4vKVxtI9e8sfv8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708553884; c=relaxed/simple;
	bh=Eeu2uU6M2y9hQjlwZzy2fp5HKOjz0EE9VsbRlCvOQEo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=TB2srJtwi33p+7j/d7DbthwzwfGL8J862Qyb+LDBkfQCI2YnHcafpMvZQ5i3IoiyDkyh4h1sNsr8pxgEYtkRUrQHmVhqnY1alugxzxnOQyQF0RBhN4m+tS2bYOf1J3g2nEGHDGzb+KW5WZmKN99e9vW8+loWYjfhM5dwxIHCxC4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ucw.cz; spf=pass smtp.mailfrom=ucw.cz; dkim=pass (1024-bit key) header.d=ucw.cz header.i=@ucw.cz header.b=ThTmacQ+; arc=none smtp.client-ip=46.255.230.98
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ucw.cz
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ucw.cz
Received: by jabberwock.ucw.cz (Postfix, from userid 1017)
	id 61A0B1C0080; Wed, 21 Feb 2024 23:17:53 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ucw.cz; s=gen1;
	t=1708553873;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=mCiY21dwg8agnszDbeKtSlu1VbMK1uasVv6xavoY4HU=;
	b=ThTmacQ+LWEH3D5zQEmviRVVyITf1+8WrPGagCpRAlALpWivU2AKw0VFzaiHD/prKLPI6R
	9c2rrfxclMBi2FEdL2/lVosQ0LahH3rRLLYVQXyoF3V9k/k1Pr+oumE0upFXwC+jLnvLft
	ApT6fry3D1huFvoZ5xIqLJjrA6Hv2us=
Date: Wed, 21 Feb 2024 23:17:52 +0100
From: Pavel Machek <pavel@ucw.cz>
To: Werner Sembach <wse@tuxedocomputers.com>
Cc: Hans de Goede <hdegoede@redhat.com>, Lee Jones <lee@kernel.org>,
	jikos@kernel.org, linux-kernel@vger.kernel.org,
	Jelle van der Waa <jelle@vdwaa.nl>,
	Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>,
	"dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
	linux-input@vger.kernel.org, ojeda@kernel.org,
	linux-leds@vger.kernel.org
Subject: Re: Future handling of complex RGB devices on Linux v2
Message-ID: <ZdZ2kMASawJ9wdZj@duo.ucw.cz>
References: <0cdb78b1-7763-4bb6-9582-d70577781e61@tuxedocomputers.com>
 <7228f2c6-fbdd-4e19-b703-103b8535d77d@redhat.com>
 <730bead8-6e1d-4d21-90d2-4ee73155887a@tuxedocomputers.com>
 <952409e1-2f0e-4d7a-a7a9-3b78f2eafec7@redhat.com>
 <9851a06d-956e-4b57-be63-e10ff1fce8b4@tuxedocomputers.com>
 <1bc6d6f0-a13d-4148-80cb-9c13dec7ed32@redhat.com>
 <b70b2ea8-abfd-4d41-b336-3e34e5bdb8c6@tuxedocomputers.com>
 <477d30ee-247e-47e6-bc74-515fd87fdc13@redhat.com>
 <e21a7d87-3059-4a51-af04-1062dac977d2@tuxedocomputers.com>
 <247b5dcd-fda8-45a7-9896-eabc46568281@tuxedocomputers.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="dAbXhNBZxMUy0vp0"
Content-Disposition: inline
In-Reply-To: <247b5dcd-fda8-45a7-9896-eabc46568281@tuxedocomputers.com>


--dAbXhNBZxMUy0vp0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi!

> so after more feedback from the OpenRGB maintainers I came up with an even
> more generic proposal:
> https://gitlab.com/CalcProgrammer1/OpenRGB/-/issues/3916#note_1753072869

> >evaluate-set-command ioctl taking:
> >{
> >=A0=A0=A0 enum command=A0=A0=A0 =A0=A0=A0 =A0=A0=A0 =A0=A0=A0 /* one of =
supported_commands */
> >=A0=A0=A0 union data
> >=A0=A0=A0 {
> >=A0=A0=A0 =A0=A0=A0 char raw[3072],
> >=A0=A0=A0 =A0=A0=A0 {
> >=A0=A0=A0 =A0=A0=A0 =A0=A0=A0 <input struct for command 0>
> >=A0=A0=A0 =A0=A0=A0 },

Yeah, so ... this is not a interface. This is a backdoor to pass
arbitrary data. That's not going to fly.

For keyboards, we don't need complete new interface; we reasonable
extensions over existing display APIs -- keyboards are clearly 2D.

Best regards,
								Pavel
--=20
People of Russia, stop Putin before his war on Ukraine escalates.

--dAbXhNBZxMUy0vp0
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iF0EABECAB0WIQRPfPO7r0eAhk010v0w5/Bqldv68gUCZdZ2kAAKCRAw5/Bqldv6
8h9zAKDEJUHJV0ZbVJCjUCqpMQaA0+xLowCfV5MWLs4adC4rSVD6cfTu5HRFilE=
=PKVx
-----END PGP SIGNATURE-----

--dAbXhNBZxMUy0vp0--

