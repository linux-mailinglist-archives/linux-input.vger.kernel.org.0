Return-Path: <linux-input+bounces-12197-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C560AADDCE
	for <lists+linux-input@lfdr.de>; Wed,  7 May 2025 13:54:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 49DED1B62576
	for <lists+linux-input@lfdr.de>; Wed,  7 May 2025 11:54:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 66A1F2580C2;
	Wed,  7 May 2025 11:54:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ucw.cz header.i=@ucw.cz header.b="av6sO1XQ"
X-Original-To: linux-input@vger.kernel.org
Received: from jabberwock.ucw.cz (jabberwock.ucw.cz [46.255.230.98])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A4179222576;
	Wed,  7 May 2025 11:54:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=46.255.230.98
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746618844; cv=none; b=ENFI4v4bPWY8/DryWmRGMjP24wkwzknF1fr9oRF9phR9l2sHEvtDR+bGqBVGLbW6MxrfTajuhIP4ARl/fjCjSWOoPD6dStneOFpVntMzKM675jilyvcRDG9fAY4Ml8BKupVeDmLs/sPqVl3GEzhd7BMY+aK5OUU/OO3ZYeGRGYc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746618844; c=relaxed/simple;
	bh=FyBHsf0CBqcSNgBthgDITgy59CPDiJqQeKjMNVNDAG4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=f1GDB5G2PAo5bWMKDZM+wvADYANXqRLXOT78XGixBeI7dALVBiQoK8xoU6TtLoPE1MCWGSX9FkVR41sc5nsHpmgdIaqenLnJuXGq9pg2jDBCtrnUxeco2AfptOv6SLaC75UCc3fhobRC9GBDHZGKoGqZlHqXFH3oB3nStLoM8vQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ucw.cz; spf=pass smtp.mailfrom=ucw.cz; dkim=pass (1024-bit key) header.d=ucw.cz header.i=@ucw.cz header.b=av6sO1XQ; arc=none smtp.client-ip=46.255.230.98
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ucw.cz
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ucw.cz
Received: by jabberwock.ucw.cz (Postfix, from userid 1017)
	id ADC361C009E; Wed,  7 May 2025 13:53:59 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ucw.cz; s=gen1;
	t=1746618839;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=5J5xnY0EPi15hqHPaWeFE5R9mbwtf10YeBUsROx/HR0=;
	b=av6sO1XQSJoBBCuroSNC9tnsYboYzW1r8Pxzpb742PP3T9swfPX6d1BIxv40bHCtelxPBL
	ILUC/161+BOt9MKIi4Pv8Dd4rMz5GeIahdfaZinZNF/7+ynMNHNTQ2YAcI12ReJfmxU12x
	l9Lg6j5qm6As7dPlJafO2INWqvkEJKk=
Date: Wed, 7 May 2025 13:53:59 +0200
From: Pavel Machek <pavel@ucw.cz>
To: Ilpo =?iso-8859-1?Q?J=E4rvinen?= <ilpo.jarvinen@linux.intel.com>
Cc: Hans de Goede <hdegoede@redhat.com>, bentiss@kernel.org,
	Werner Sembach <wse@tuxedocomputers.com>,
	linux-input@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>,
	platform-driver-x86@vger.kernel.org
Subject: Re: [PATCH v9 0/1] platform/x86/tuxedo: Add virtual LampArray for
 TUXEDO NB04 devices
Message-ID: <aBtJ1+gdmGkJKUrK@duo.ucw.cz>
References: <20250425210043.342288-1-wse@tuxedocomputers.com>
 <174645314692.23202.56309255974182976.b4-ty@linux.intel.com>
 <aBtFDy+Qu3RvAHur@duo.ucw.cz>
 <56a927e8-b6c6-d07b-df34-1a73cdef8528@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="fefvjMh9N0dESyqs"
Content-Disposition: inline
In-Reply-To: <56a927e8-b6c6-d07b-df34-1a73cdef8528@linux.intel.com>


--fefvjMh9N0dESyqs
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi!

> > > Thank you for your contribution, it has been applied to my local
> > > review-ilpo-next branch. Note it will show up in the public
> > > platform-drivers-x86/review-ilpo-next branch only once I've pushed my
> > > local branch there, which might take a while.
> >=20
> > Can I ask you to Cc me with the pull request when you'll send the
> > patch upstream?
>=20
> Hi Pavel,
>=20
> To not forget your request, I've temporarily added you to the Cc list of=
=20
> any PRs I'm sending towards Linus.
>=20
> This means you'll be Cc'ed the unrelated fixes PRs too but there shouldn'=
t=20
> be that many of those until the next merge window (I'm sorry about the=20
> extra noise but I'd likely forget it otherwise). And if I forget to remov=
e=20
> you afterwards the CC list and you keep getting PRs Cc'ed, please just=20
> sent me a note then.

That works for me. Thank you!

Best regards,
									Pavel

--=20
I don't work for Nazis and criminals, and neither should you.
Boycott Putin, Trump, and Musk!

--fefvjMh9N0dESyqs
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iF0EABECAB0WIQRPfPO7r0eAhk010v0w5/Bqldv68gUCaBtJ1wAKCRAw5/Bqldv6
8tENAJ9hcsG/9Q9NAUHveO6DruKIlwVQxwCffs4d+lrY8xFisorFTCdmVsTnWCA=
=eyqx
-----END PGP SIGNATURE-----

--fefvjMh9N0dESyqs--

