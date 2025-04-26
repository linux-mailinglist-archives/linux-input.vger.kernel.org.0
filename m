Return-Path: <linux-input+bounces-12013-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id DA3A1A9D94C
	for <lists+linux-input@lfdr.de>; Sat, 26 Apr 2025 10:18:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 0ED6F1BC7C9E
	for <lists+linux-input@lfdr.de>; Sat, 26 Apr 2025 08:18:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1017121D58E;
	Sat, 26 Apr 2025 08:18:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ucw.cz header.i=@ucw.cz header.b="hg6YPb07"
X-Original-To: linux-input@vger.kernel.org
Received: from jabberwock.ucw.cz (jabberwock.ucw.cz [46.255.230.98])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 464E67A13A;
	Sat, 26 Apr 2025 08:17:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=46.255.230.98
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745655481; cv=none; b=eMyB7ucCeJVVGkhkKqDCo/56Gg3utIloHpYTkC+EBc4riBmRFJTat0hhGr8nybbDBOq0ulOgAxMfBnEeGbwObGORPW6cMzCBDNIzTZwC5Yw1GL9Xhaqe9KHM0OLxGCTOPLb6orWFGXOQrMESxBCAVurLLKOFTSpQbII4i65on4I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745655481; c=relaxed/simple;
	bh=V8rXVnQBFMOuvbQCwxCpqt8lVtCV9UxgAO97EewSuxI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ZphfJki2y5AcaF4pa9U7r+9e4je/Ddj+hLcFFnX7xwpYLssTOhAdrU3udQRVFB3VF/znQqRZCtEygjJhPCLthR/lw/JAiU7/7hAo5xGE1SQtTI7OHrdqkg76ykZGZDs/NVblBVi03gCuFOXRNw157KZh1kS0AvFTMBrfvMYrYY0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ucw.cz; spf=pass smtp.mailfrom=ucw.cz; dkim=pass (1024-bit key) header.d=ucw.cz header.i=@ucw.cz header.b=hg6YPb07; arc=none smtp.client-ip=46.255.230.98
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ucw.cz
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ucw.cz
Received: by jabberwock.ucw.cz (Postfix, from userid 1017)
	id 0C4B11C00B2; Sat, 26 Apr 2025 10:17:56 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ucw.cz; s=gen1;
	t=1745655476;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=zpSb/OzFjM7DCGmtwaDp97ospmMcrmI2Zn6F65g37Pc=;
	b=hg6YPb07zVg6n+MlMCSypzqI7ZNgU6SyiAx8EeulKeRV5sjUPkmL8k878i3CvNg9r5QTau
	JnK8MGMq1i4UFIWGxG4rVa1hi1fthrMmowkthEjyN9Dsm3Oo1drpMaMIZRi1t+txsGM57g
	NXqmchYFiNDoyy/JLVoamqUpNsgzyHg=
Date: Sat, 26 Apr 2025 10:17:55 +0200
From: Pavel Machek <pavel@ucw.cz>
To: Werner Sembach <wse@tuxedocomputers.com>
Cc: hdegoede@redhat.com, ilpo.jarvinen@linux.intel.com, bentiss@kernel.org,
	linux-input@vger.kernel.org, linux-kernel@vger.kernel.org,
	platform-driver-x86@vger.kernel.org
Subject: Re: [PATCH v8 0/1] platform/x86/tuxedo: Add virtual LampArray for
 TUXEDO NB04 devices
Message-ID: <aAyWs6XJXc4g1lDb@duo.ucw.cz>
References: <20250423153804.64395-1-wse@tuxedocomputers.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="aShk3lLC9/M7nOg1"
Content-Disposition: inline
In-Reply-To: <20250423153804.64395-1-wse@tuxedocomputers.com>


--aShk3lLC9/M7nOg1
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed 2025-04-23 17:33:09, Werner Sembach wrote:
> @Ilpos you can ignore my small question from my last e-mail. The spec file
> of the firmware wants the struct to be zeroed (albeit it does also work if
> not) so I implemented it like that.

You forgot to cc me.

Anyway, lets not do this. Kernel should have real interfaces, not
crazy tables to emulate Microsoft interface noone else uses.

NAK.

									Pavel
--=20
I don't work for Nazis and criminals, and neither should you.
Boycott Putin, Trump, and Musk!

--aShk3lLC9/M7nOg1
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iF0EABECAB0WIQRPfPO7r0eAhk010v0w5/Bqldv68gUCaAyWswAKCRAw5/Bqldv6
8oH+AJ99zpXT/sIs4mKnCgxXBJobRfbLJwCgqqRc4NWCRqywmMOmpM3mxG558hQ=
=8yPr
-----END PGP SIGNATURE-----

--aShk3lLC9/M7nOg1--

