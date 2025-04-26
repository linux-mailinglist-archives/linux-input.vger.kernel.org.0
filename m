Return-Path: <linux-input+bounces-12014-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id C6AB8A9D94F
	for <lists+linux-input@lfdr.de>; Sat, 26 Apr 2025 10:22:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 10F631BC7C9C
	for <lists+linux-input@lfdr.de>; Sat, 26 Apr 2025 08:22:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9C9A623F412;
	Sat, 26 Apr 2025 08:22:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ucw.cz header.i=@ucw.cz header.b="CsIqNmuk"
X-Original-To: linux-input@vger.kernel.org
Received: from jabberwock.ucw.cz (jabberwock.ucw.cz [46.255.230.98])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 11F887A13A;
	Sat, 26 Apr 2025 08:21:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=46.255.230.98
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745655720; cv=none; b=rXlvoCanXfsIWTwkMcEsESu8uNkunwdJ1MNssKpVWmCwO2sfdV8c1plzZ200RnSQtWiuKhvWwjv9GZ+IBLpjgVLVd6QdFmrWPFDk54sOcYXbHy1zWUy/q9fZ70IQm5y9fTcqVl+zJyfGfYtNvboQXsO3aOREftIDQhpwI5jo2iU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745655720; c=relaxed/simple;
	bh=fzKR/ufsieUr8oxDbrm52cAQXJCN5hqEVmsE660kjTY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=rgIScswQbd/V+h6jgdJSbJ4fgcKk/kOuH5+5ljoupzbps9w2WbwZWOjijGAMZjLPqnCZSlAZOPxe42CNZA6RYfEnrPopuzRG3BneXFDcSMB6e6p1TkVV7i/u8YxmRuEeFFdcgnUewhDEtA9Ft+hrYpLbG17Tdkp4/8DQRFVegT0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ucw.cz; spf=pass smtp.mailfrom=ucw.cz; dkim=pass (1024-bit key) header.d=ucw.cz header.i=@ucw.cz header.b=CsIqNmuk; arc=none smtp.client-ip=46.255.230.98
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ucw.cz
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ucw.cz
Received: by jabberwock.ucw.cz (Postfix, from userid 1017)
	id B08771C00B2; Sat, 26 Apr 2025 10:21:55 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ucw.cz; s=gen1;
	t=1745655715;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=LApoH+hql5fj1iVHW98H1KX0KFIlCyUgfPPdG8y5U20=;
	b=CsIqNmuk+1cL+vSLFfS8Yo8Df+lDCHwfh2SLlM9P9vUO1YUyMNgI9tUrg34KbVHm94j5bk
	Z/yCELdKcV8u+6UVEsgTHHudiVA/0lwXIzC/ACMqgLWj+eKgB1QfmDynLS0rTUybrzPrnt
	GoYJ8w0KtzzkJuNNlfFecfODwwUcFQY=
Date: Sat, 26 Apr 2025 10:21:55 +0200
From: Pavel Machek <pavel@ucw.cz>
To: Werner Sembach <wse@tuxedocomputers.com>
Cc: hdegoede@redhat.com, ilpo.jarvinen@linux.intel.com, bentiss@kernel.org,
	linux-input@vger.kernel.org, linux-kernel@vger.kernel.org,
	platform-driver-x86@vger.kernel.org
Subject: Re: [PATCH v9 0/1] platform/x86/tuxedo: Add virtual LampArray for
 TUXEDO NB04 devices
Message-ID: <aAyXo7m8pvJc258V@duo.ucw.cz>
References: <20250425210043.342288-1-wse@tuxedocomputers.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="hIDcK2E21PriQdgi"
Content-Disposition: inline
In-Reply-To: <20250425210043.342288-1-wse@tuxedocomputers.com>


--hIDcK2E21PriQdgi
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri 2025-04-25 22:53:28, Werner Sembach wrote:
> Note that I'm away from my work PC for the next week so expect my next
> response the monday after.

Forgot to cc LED lists. NAK.
								Pavel
--=20
I don't work for Nazis and criminals, and neither should you.
Boycott Putin, Trump, and Musk!

--hIDcK2E21PriQdgi
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iF0EABECAB0WIQRPfPO7r0eAhk010v0w5/Bqldv68gUCaAyXowAKCRAw5/Bqldv6
8gUEAKDBAqA2i2qckGriCTQPP5bcc13XwQCgreLCTnH1AIIW6wFVtURQfyXmj3o=
=ns29
-----END PGP SIGNATURE-----

--hIDcK2E21PriQdgi--

