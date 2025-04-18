Return-Path: <linux-input+bounces-11834-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 06D0FA93B77
	for <lists+linux-input@lfdr.de>; Fri, 18 Apr 2025 18:57:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 2BCE31782A6
	for <lists+linux-input@lfdr.de>; Fri, 18 Apr 2025 16:57:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2667521764B;
	Fri, 18 Apr 2025 16:57:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=denx.de header.i=@denx.de header.b="dHGfvd+a"
X-Original-To: linux-input@vger.kernel.org
Received: from mx.denx.de (mx.denx.de [89.58.32.78])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 49DD71A8F68;
	Fri, 18 Apr 2025 16:57:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=89.58.32.78
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744995442; cv=none; b=TneKCFjROgLZe9LGs/OpOBbNo529lU3fR0rEDoYfQMmFrrOExj4Bc2zs2zDliRJ6lBVkLcQhs4+v3oyv6PZXPvclHc+Iihjtu7W2BebedR0N7vTyWwx3pwK4jRxcjgLHkdvc1Tjimde2G0AMFqowtUowgVsDb8S55WUftlRtWlM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744995442; c=relaxed/simple;
	bh=TDuKAiO/Ql1pcO7Mfl5k5VKkVM7MYI46i4hq6UPJUVM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=uq4HrjlqKQ7RFpY40b1aYZx6YzJChGJgJG1WpIbfdRlszsqKN9lAgYtz022ZZk/EKe3To9MNHY32uz1X+2GQd9X4NvKSoRHw0356jJrsZv25KzCiDtjzxPJFertvqx2wqn9TMh1kpNF1L3J8Bq0lQGMuCs5H0YDwXLGtfcRGa6c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=denx.de; spf=pass smtp.mailfrom=denx.de; dkim=pass (2048-bit key) header.d=denx.de header.i=@denx.de header.b=dHGfvd+a; arc=none smtp.client-ip=89.58.32.78
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=denx.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=denx.de
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id E0ABF102E6336;
	Fri, 18 Apr 2025 18:57:13 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de; s=mx-20241105;
	t=1744995437; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 in-reply-to:references; bh=pNwV8wF/f0cfEaYXtGKzXaf9WE3h64XoNFuFJfyDHNU=;
	b=dHGfvd+aI3PWFI4S72fOF2+mh7dLV8lxtdiaWzoc0nyeJOqFGAocnEvxxyWK/lgoI+SVWj
	/b9IK8t2OmLL6MsuVouhqpTUaGt7orcHTaMwXQnHKUUskStuE10gXl5WntPmVxvACYhkRS
	p2UQqMHePKhQqI3ND0sARlRUSedeN1Vs87lmaqOYdFiZuIFARFkYv2ajX8xFx+dtwkNPyH
	LeoiAMyRhNFV9Hg/MaGd3tVf56YY5gDjOk7sofsXLk9e6Ft+CtyXKPH+YXPia3/uDXXypS
	meVJ38ej6R8uZbOqA4DEodK1NqDVNtOUGIRblvAJm6XU9SCYSznr9+ay6uwVkA==
Date: Fri, 18 Apr 2025 18:57:11 +0200
From: Pavel Machek <pavel@denx.de>
To: Sasha Levin <sashal@kernel.org>
Cc: linux-kernel@vger.kernel.org, stable@vger.kernel.org,
	Tomasz =?utf-8?Q?Paku=C5=82a?= <forest10pl@gmail.com>,
	Nolan Nicholson <nolananicholson@gmail.com>,
	Tomasz =?utf-8?Q?Paku=C5=82a?= <tomasz.pakula.oficjalny@gmail.com>,
	=?utf-8?B?TWljaGHFgiBLb3BlxIc=?= <michal@nozomi.space>,
	Paul Dino Jones <paul@spacefreak18.xyz>,
	=?iso-8859-1?Q?Crist=F3ferson?= Bueno <cbueno81@gmail.com>,
	Pablo Cisneros <patchkez@protonmail.com>,
	Jiri Kosina <jkosina@suse.com>, jikos@kernel.org,
	bentiss@kernel.org, linux-usb@vger.kernel.org,
	linux-input@vger.kernel.org
Subject: Re: [PATCH AUTOSEL 5.10 3/5] HID: pidff: Fix null pointer
 dereference in pidff_find_fields
Message-ID: <aAKEZwyixI01sJmk@duo.ucw.cz>
References: <20250331145716.1706253-1-sashal@kernel.org>
 <20250331145716.1706253-3-sashal@kernel.org>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="z0qow5r4EomdxsV3"
Content-Disposition: inline
In-Reply-To: <20250331145716.1706253-3-sashal@kernel.org>
X-Last-TLS-Session-Version: TLSv1.3


--z0qow5r4EomdxsV3
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi!

> From: Tomasz Paku=C5=82a <forest10pl@gmail.com>
>=20
> [ Upstream commit 22a05462c3d0eee15154faf8d13c49e6295270a5 ]
>=20
> This function triggered a null pointer dereference if used to search for
> a report that isn't implemented on the device. This happened both for
> optional and required reports alike.

Ok.

> +++ b/drivers/hid/usbhid/hid-pidff.c
> @@ -770,6 +770,11 @@ static void pidff_set_autocenter(struct input_dev *d=
ev, u16 magnitude)
>  static int pidff_find_fields(struct pidff_usage *usage, const u8 *table,
>  			     struct hid_report *report, int count, int strict)
>  {
> +	if (!report) {
> +		pr_debug("pidff_find_fields, null report\n");
> +		return -1;
> +	}
> +
>  	int i, j, k, found;
> =20
>  	for (k =3D 0; k < count; k++) {
> @@ -883,6 +888,11 @@ static int pidff_reports_ok(struct pidff_device *pid=
ff)
>  static struct hid_field *pidff_find_special_field(struct hid_report *rep=
ort,
>  						  int usage, int enforce_min)
>  {
> +	if (!report) {
> +		pr_debug("pidff_find_special_field, null report\n");
> +		return NULL;
> +	}
> +
>  	int i;


But this is quite strange. Normally declarations go first. Not sure if
old compilers can handle this?

Best regards,
								Pavel
--=20
DENX Software Engineering GmbH,        Managing Director: Erika Unter
HRB 165235 Munich, Office: Kirchenstr.5, D-82194 Groebenzell, Germany

--z0qow5r4EomdxsV3
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iF0EABECAB0WIQRPfPO7r0eAhk010v0w5/Bqldv68gUCaAKEZwAKCRAw5/Bqldv6
8tJBAKCBurItwDdwVzRZ7HmySaIoV8YiWACghrPsYdQt5Vdys1Al1ITKXM7SOrs=
=nFy1
-----END PGP SIGNATURE-----

--z0qow5r4EomdxsV3--

