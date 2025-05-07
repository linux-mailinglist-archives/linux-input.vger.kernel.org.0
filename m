Return-Path: <linux-input+bounces-12193-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B90BAADD6D
	for <lists+linux-input@lfdr.de>; Wed,  7 May 2025 13:33:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id BDEFA7A4F56
	for <lists+linux-input@lfdr.de>; Wed,  7 May 2025 11:32:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 97E0E2153EF;
	Wed,  7 May 2025 11:33:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ucw.cz header.i=@ucw.cz header.b="MefdPJe3"
X-Original-To: linux-input@vger.kernel.org
Received: from jabberwock.ucw.cz (jabberwock.ucw.cz [46.255.230.98])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C872AD2C;
	Wed,  7 May 2025 11:33:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=46.255.230.98
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746617627; cv=none; b=HNybeK7ik0T132ll1KhIFM0guRIcx1DRdf2Y45XQcAfpxXOtoFSNf0+D7aqthr8wrLYzLXuJta2G3gMWIkBKuE1A+Lyh/TcZSoxU8KdGykiB+WpzN0ZUXXIyRFEf/RHJ+9kJuNY3VFk+uiuxnqOhwSZlFAsVoou+4/xG8lKf2lI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746617627; c=relaxed/simple;
	bh=TdXUW3s/bibHixgCtL5pScTc/TC3t4TyB1NBSk5rNaA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=WhLeN0kNZkbVBJOJYkOZRZaYeMhxnx6CjnqrhXdD6AjG1RTtrGN8XbXz8G5AE1A3KxjQKUH36gWVtHyYdF4j5CFM0mZxyzquSWokHt9neH55/rtBARipIZfOBKeBn3Vm1lpSGmZY82zd6WLS4+QwpHdCoa8zBapN+hJ3CVharRo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ucw.cz; spf=pass smtp.mailfrom=ucw.cz; dkim=pass (1024-bit key) header.d=ucw.cz header.i=@ucw.cz header.b=MefdPJe3; arc=none smtp.client-ip=46.255.230.98
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ucw.cz
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ucw.cz
Received: by jabberwock.ucw.cz (Postfix, from userid 1017)
	id 1102A1C0082; Wed,  7 May 2025 13:33:36 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ucw.cz; s=gen1;
	t=1746617616;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=wpW6+F8wuTVSutm9gp06d9+r4fH5ttNuTrzJur8hwKA=;
	b=MefdPJe3cHf2ywUxB3nHsVrBuG4R1zqlBRhNaq63wBme60pHlvBbyEOc+Fu9WPLSSa3SlH
	rYaNwvZSpWlrFGXN1SzoZ55gYiEtl3Magca+bl6FJFJ5Ed11GxkEteppl6h86D/lNbygkU
	tFlh01ohP04ldUs1ZiNW+URRF2MH3Ok=
Date: Wed, 7 May 2025 13:33:35 +0200
From: Pavel Machek <pavel@ucw.cz>
To: Ilpo =?iso-8859-1?Q?J=E4rvinen?= <ilpo.jarvinen@linux.intel.com>
Cc: hdegoede@redhat.com, bentiss@kernel.org,
	Werner Sembach <wse@tuxedocomputers.com>,
	linux-input@vger.kernel.org, linux-kernel@vger.kernel.org,
	platform-driver-x86@vger.kernel.org
Subject: Re: [PATCH v9 0/1] platform/x86/tuxedo: Add virtual LampArray for
 TUXEDO NB04 devices
Message-ID: <aBtFDy+Qu3RvAHur@duo.ucw.cz>
References: <20250425210043.342288-1-wse@tuxedocomputers.com>
 <174645314692.23202.56309255974182976.b4-ty@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="W+JKsxFKyzAcxaI8"
Content-Disposition: inline
In-Reply-To: <174645314692.23202.56309255974182976.b4-ty@linux.intel.com>


--W+JKsxFKyzAcxaI8
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi!

> Thank you for your contribution, it has been applied to my local
> review-ilpo-next branch. Note it will show up in the public
> platform-drivers-x86/review-ilpo-next branch only once I've pushed my
> local branch there, which might take a while.

Can I ask you to Cc me with the pull request when you'll send the
patch upstream?

Thank you,
								Pavel
--=20
I don't work for Nazis and criminals, and neither should you.
Boycott Putin, Trump, and Musk!

--W+JKsxFKyzAcxaI8
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iF0EABECAB0WIQRPfPO7r0eAhk010v0w5/Bqldv68gUCaBtFDwAKCRAw5/Bqldv6
8ukgAJ9JPWN3q/5HPzCCEUVl6BYLgOg3/gCgnvYxOMvokW+b/2GOGUyhDWujzq8=
=Cote
-----END PGP SIGNATURE-----

--W+JKsxFKyzAcxaI8--

