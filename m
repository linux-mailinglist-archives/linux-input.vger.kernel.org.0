Return-Path: <linux-input+bounces-4942-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id ADE8592CEA7
	for <lists+linux-input@lfdr.de>; Wed, 10 Jul 2024 11:58:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id DF2981C20B52
	for <lists+linux-input@lfdr.de>; Wed, 10 Jul 2024 09:58:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4A07018FA28;
	Wed, 10 Jul 2024 09:58:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ucw.cz header.i=@ucw.cz header.b="KPi4iJld"
X-Original-To: linux-input@vger.kernel.org
Received: from jabberwock.ucw.cz (jabberwock.ucw.cz [46.255.230.98])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1440317FD;
	Wed, 10 Jul 2024 09:58:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=46.255.230.98
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720605495; cv=none; b=S3ZgupljgLY3gYw5agXk9HdEttlcc+oYV7NA91rEiU6U+RuI9J6tjK2dV8FUAZ30lso59uovUIEjxHHONwLCK3DxyGH2Cr4w7ogv/5Bsl96nT563d0sbKVspUw3zGS7/xunxptwxh2GX2z4RBAMuX6EvLjPMUuT4bHDoV7ZddLM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720605495; c=relaxed/simple;
	bh=Fgo/dL37WaWAv/kxI1Qfn9zpEJJ4mcHWWiOXQT09UHA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=J381SNFrOmWmBKJnPe+rSGA2Jz7d8tTAj3BZADz4ff3xbmK+xUYLg30MkmhhuIV4+hpGwdUprprDneqfIBmxQlFwm6KI7ctVjvTx2uNpecm8Ix5ZHRCZ5T4IU+GmlsoiP/USwnNV9yz87ZgR8rH5HcDmOVjuEZUjmrot2NCDI+k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ucw.cz; spf=pass smtp.mailfrom=ucw.cz; dkim=pass (1024-bit key) header.d=ucw.cz header.i=@ucw.cz header.b=KPi4iJld; arc=none smtp.client-ip=46.255.230.98
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ucw.cz
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ucw.cz
Received: by jabberwock.ucw.cz (Postfix, from userid 1017)
	id BC6CC1C009E; Wed, 10 Jul 2024 11:58:08 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ucw.cz; s=gen1;
	t=1720605488;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=kSYfV6e8ywsQcWm7dEJtwcpAEr1tLcIYXhJLqJRJiXw=;
	b=KPi4iJlds+tK9sqvLphMHHvmClAiJ+THBIP+YDNkRsPVpKwwhu6sTr0WG1/GVMqbj/Fi0u
	rjn48XGKdzZf1kvnY2E0sjvukqb0n0joPMMUQ9jZAYWgThiqTWM7lYrFKpe4hgo+2gP3TF
	7aJgJqsgjKyj+yaUxsC0x0dGZwKF9Jo=
Date: Wed, 10 Jul 2024 11:58:08 +0200
From: Pavel Machek <pavel@ucw.cz>
To: Sasha Levin <sashal@kernel.org>
Cc: linux-kernel@vger.kernel.org, stable@vger.kernel.org,
	Hans de Goede <hdegoede@redhat.com>,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	linux-input@vger.kernel.org, platform-driver-x86@vger.kernel.org
Subject: Re: [PATCH AUTOSEL 6.1 23/29] Input: silead - Always support 10
 fingers
Message-ID: <Zo5bML7Q2ke/CsG/@duo.ucw.cz>
References: <20240618124018.3303162-1-sashal@kernel.org>
 <20240618124018.3303162-23-sashal@kernel.org>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="N0ar0n3qwQQ5J5EI"
Content-Disposition: inline
In-Reply-To: <20240618124018.3303162-23-sashal@kernel.org>


--N0ar0n3qwQQ5J5EI
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi!

> From: Hans de Goede <hdegoede@redhat.com>
>=20
> [ Upstream commit 38a38f5a36da9820680d413972cb733349400532 ]
>=20
> When support for Silead touchscreens was orginal added some touchscreens
> with older firmware versions only supported 5 fingers and this was made
> the default requiring the setting of a "silead,max-fingers=3D10" uint32
> device-property for all touchscreen models which do support 10 fingers.
>=20
> There are very few models with the old 5 finger fw, so in practice the
> setting of the "silead,max-fingers=3D10" is boilerplate which needs to
> be copy and pasted to every touchscreen config.
>=20
> Reporting that 10 fingers are supported on devices which only support
> 5 fingers doesn't cause any problems for userspace in practice, since
> at max 4 finger gestures are supported anyways. Drop the max_fingers
> configuration and simply always assume 10 fingers.

This does not fix a serious bug, should not be in stable.

Best regards,
								Pavel
--=20
People of Russia, stop Putin before his war on Ukraine escalates.

--N0ar0n3qwQQ5J5EI
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iF0EABECAB0WIQRPfPO7r0eAhk010v0w5/Bqldv68gUCZo5bMAAKCRAw5/Bqldv6
8krRAJ92R+9YaEAm3xNgyXUvQumjlYJtVQCgjLligfpgdqjXjQ7sg74TNpvBaSE=
=C4kN
-----END PGP SIGNATURE-----

--N0ar0n3qwQQ5J5EI--

