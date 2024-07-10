Return-Path: <linux-input+bounces-4948-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E52392D11C
	for <lists+linux-input@lfdr.de>; Wed, 10 Jul 2024 13:55:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id C916AB26E4B
	for <lists+linux-input@lfdr.de>; Wed, 10 Jul 2024 11:55:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E8671191F91;
	Wed, 10 Jul 2024 11:55:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ucw.cz header.i=@ucw.cz header.b="JNBOyG+V"
X-Original-To: linux-input@vger.kernel.org
Received: from jabberwock.ucw.cz (jabberwock.ucw.cz [46.255.230.98])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E189190688;
	Wed, 10 Jul 2024 11:55:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=46.255.230.98
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720612511; cv=none; b=SS317B7JNOP7r9J0LuyvfFm+Hb3xqxmD8KwkZ4ys1/cH6yrZmh4wCCGtKMgoY67FwaohzxMZyhNy1WoG7ADug0bLI2AFkviGjmXagpq3SA0zsKe/UOhZx8pagb80jjPAKvI3XWhQ9ndO95tp4DYXnsOMZ2bjhUdb74UgUz8iWR4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720612511; c=relaxed/simple;
	bh=rg5ASVGRrj0CbRfB6zWhQi1ZSfmq2w18dOiDw1+SAk4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=cxEU1ah8wmGPKMiueMsCeHKJNM+Ds4KTQ/0AKE3/uPN9LJV8sC0eWQ8lt5own8YQZpMFzBk5xl2fuf321cGINZVAmMgT/wmm4bExQIuB8yBGMbfeLZGSEqpzVqsBebaZhDRaBqFn+lMq3ex7dmzeo8GYmXQmK/g8FjZZkiaj1aM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ucw.cz; spf=pass smtp.mailfrom=ucw.cz; dkim=pass (1024-bit key) header.d=ucw.cz header.i=@ucw.cz header.b=JNBOyG+V; arc=none smtp.client-ip=46.255.230.98
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ucw.cz
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ucw.cz
Received: by jabberwock.ucw.cz (Postfix, from userid 1017)
	id 8010A1C0082; Wed, 10 Jul 2024 13:55:07 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ucw.cz; s=gen1;
	t=1720612507;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=C/o5re6zdBSaQzgNUxv5d+aQxD1Iy3QC/+L83tjX/gU=;
	b=JNBOyG+VygboICYNcmYPUmRv1sazBKGzZwl8n3/258ZYUjQPd328AQhNmeg6epqRUApyVx
	bA2e1qt8T9b3emMgqDdeG5OXe/MjemJkUr0WwbFTnXCMHpV+Vizq4BOGT1jN+WWspD2c6T
	b2CwRF/jw4Jqj6vq31rcEWPVwa3mlzk=
Date: Wed, 10 Jul 2024 13:55:07 +0200
From: Pavel Machek <pavel@ucw.cz>
To: Hans de Goede <hdegoede@redhat.com>
Cc: Sasha Levin <sashal@kernel.org>, linux-kernel@vger.kernel.org,
	stable@vger.kernel.org, Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	linux-input@vger.kernel.org, platform-driver-x86@vger.kernel.org
Subject: Re: [PATCH AUTOSEL 6.1 23/29] Input: silead - Always support 10
 fingers
Message-ID: <Zo52mxIlrZmeeAzP@duo.ucw.cz>
References: <20240618124018.3303162-1-sashal@kernel.org>
 <20240618124018.3303162-23-sashal@kernel.org>
 <Zo5bML7Q2ke/CsG/@duo.ucw.cz>
 <3fece177-f6b4-41e4-a781-7c4c923ff7d9@redhat.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="107I8a1RkMZoKLQL"
Content-Disposition: inline
In-Reply-To: <3fece177-f6b4-41e4-a781-7c4c923ff7d9@redhat.com>


--107I8a1RkMZoKLQL
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed 2024-07-10 11:59:48, Hans de Goede wrote:
> Hi Pavel,
>=20
> On 7/10/24 11:58 AM, Pavel Machek wrote:
> > Hi!
> >=20
> >> From: Hans de Goede <hdegoede@redhat.com>
> >>
> >> [ Upstream commit 38a38f5a36da9820680d413972cb733349400532 ]
> >>
> >> When support for Silead touchscreens was orginal added some touchscree=
ns
> >> with older firmware versions only supported 5 fingers and this was made
> >> the default requiring the setting of a "silead,max-fingers=3D10" uint32
> >> device-property for all touchscreen models which do support 10 fingers.
> >>
> >> There are very few models with the old 5 finger fw, so in practice the
> >> setting of the "silead,max-fingers=3D10" is boilerplate which needs to
> >> be copy and pasted to every touchscreen config.
> >>
> >> Reporting that 10 fingers are supported on devices which only support
> >> 5 fingers doesn't cause any problems for userspace in practice, since
> >> at max 4 finger gestures are supported anyways. Drop the max_fingers
> >> configuration and simply always assume 10 fingers.
> >=20
> > This does not fix a serious bug, should not be in stable.
>=20
> This patch is necessary for clean backporting of new DMI quirks added
> to drivers/platform/x86/touchscreen_dmi.c, so IMHO it does make sense
> as a stable series patch.

That's likely not reason it ended up it autosel, but why
not. "Stable-dep-of" tag would be nice in that case.

Best regards,
								Pavel
--=20
People of Russia, stop Putin before his war on Ukraine escalates.

--107I8a1RkMZoKLQL
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iF0EABECAB0WIQRPfPO7r0eAhk010v0w5/Bqldv68gUCZo52mwAKCRAw5/Bqldv6
8mHwAJ9crQzmyi9a6Ne43Y5DaOS3Pm8k0gCdHd55sQIf/XIWf5wSiZS2PsFxpZs=
=reBZ
-----END PGP SIGNATURE-----

--107I8a1RkMZoKLQL--

