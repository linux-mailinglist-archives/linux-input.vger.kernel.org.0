Return-Path: <linux-input+bounces-7613-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id D06869A9EA4
	for <lists+linux-input@lfdr.de>; Tue, 22 Oct 2024 11:37:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 88F702832C8
	for <lists+linux-input@lfdr.de>; Tue, 22 Oct 2024 09:37:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7465C1990C7;
	Tue, 22 Oct 2024 09:37:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ucw.cz header.i=@ucw.cz header.b="TtdUpEM2"
X-Original-To: linux-input@vger.kernel.org
Received: from jabberwock.ucw.cz (jabberwock.ucw.cz [46.255.230.98])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D0ED02209B;
	Tue, 22 Oct 2024 09:37:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=46.255.230.98
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729589836; cv=none; b=U7B/QI45gI52UAlITXUc3kb8LNHc2WmczNOahDzX7IKc18b3dcMIGrDt9krqAOMKqbJ08vac2VLLz0WZd4PQCmFgYJyC1Dk1yqp97rd/kFoNXm6mjD9K0iJ9xoMrkfUwa0O7Dw/hRMHLy+lEeOAVWLJuUkq9QppRVbtKW/KqDig=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729589836; c=relaxed/simple;
	bh=NSDmGApWvss+e1To8nYfA18QG6IZiPm3jYDBYZnXKC4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=UKGEeAIe9l8fS9DVLAEOOzQGMgrskScaR9sXMPUDnHrPgZqXbJDzcXyME5630xLW98YFdrl29o/4h9DYfvvuhPr0AAHHN9c4IH8DUzNqQY4MLk9uFP/kctpMjAF6GgKRsQP16CvegVts9KvTsvRDCJ3Fuv5cDPZCsAUu0ER/AX4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ucw.cz; spf=pass smtp.mailfrom=ucw.cz; dkim=pass (1024-bit key) header.d=ucw.cz header.i=@ucw.cz header.b=TtdUpEM2; arc=none smtp.client-ip=46.255.230.98
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ucw.cz
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ucw.cz
Received: by jabberwock.ucw.cz (Postfix, from userid 1017)
	id 911941C006B; Tue, 22 Oct 2024 11:37:04 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ucw.cz; s=gen1;
	t=1729589824;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=tg2JuoUmlo3RkSh7poLOzAG967fy1v68Nzs5uZWagZs=;
	b=TtdUpEM2NsQQkqyjZ5QPUNMkgEmk47bDRvWXJdC/klJF1FuaWUd1aruzDuGrtUz0qPE28n
	p4dLKJfD+Oa9bQLvi3ltDxy2gF7An3wHt5ycSsxCt/6O9/wy/DJ+sOOM9Q1eu2Ay9RZ/9k
	ul+0rTdi/e8GP06ajOiNdM+q2rH1qRo=
Date: Tue, 22 Oct 2024 11:37:04 +0200
From: Pavel Machek <pavel@ucw.cz>
To: Benjamin Tissoires <bentiss@kernel.org>
Cc: Hans de Goede <hdegoede@redhat.com>, Armin Wolf <W_Armin@gmx.de>,
	Werner Sembach <wse@tuxedocomputers.com>,
	Ilpo =?iso-8859-1?Q?J=E4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	dri-devel@lists.freedesktop.org, jelle@vdwaa.nl, jikos@kernel.org,
	lee@kernel.org, linux-input@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-leds@vger.kernel.org,
	miguel.ojeda.sandonis@gmail.com, ojeda@kernel.org,
	onitake@gmail.com, platform-driver-x86@vger.kernel.org
Subject: Re: [PATCH 1/1] platform/x86/tuxedo: Add virtual LampArray for
 TUXEDO NB04 devices
Message-ID: <ZxdyQFMRIRusMD6S@duo.ucw.cz>
References: <82a6eca1-728c-436f-8c4d-073d8a43ee27@tuxedocomputers.com>
 <5crqia4gecxg62n2m2lf6haiifue4wlxrr3g35dyoaa3svjyuj@cd5bhouz5rlh>
 <4a761cd0-611a-4245-8353-5c66ba133715@tuxedocomputers.com>
 <rszv4p34oivysoyi337dxwooebipiikzd3pyq7rof5r3agbzce@xejutpd4jcfv>
 <06c58141-4aa9-4b54-8ae4-e27069561ac9@tuxedocomputers.com>
 <48a8d62f-ea3f-4f17-b917-ff3aaa83e89c@gmx.de>
 <ZwlDpCPhieF3tezX@duo.ucw.cz>
 <a796f0e7-47a8-40fa-a64e-9dd56117bf78@gmx.de>
 <c52019d7-01b4-4585-a2d1-b44b0a773fc9@redhat.com>
 <kywhqw5ef6hioemoydwub57dcmfuu3bwqpz3vjur4pkabboydo@2hrqj3zy4txv>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="ZADFVpt7/0P2Ieq3"
Content-Disposition: inline
In-Reply-To: <kywhqw5ef6hioemoydwub57dcmfuu3bwqpz3vjur4pkabboydo@2hrqj3zy4txv>


--ZADFVpt7/0P2Ieq3
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi!

> > Personally I really like the idea to just emulate a HID LampArray device
> > for this instead or rolling our own API.  I believe there need to be
> > strong arguments to go with some alternative NIH API and I have not
> > heard such arguments yet.
>=20
> Agreed on everything Hans said.
>=20
> I'll personnaly fight against any new "illumination" API as long as we
> don't have committed users. This is the same policy the DRM folks
> > are

Well, and I'll personally fight against user<->kernel protocol as
crazy as HID LampArray is.

OpenRGB is not suitable hardware driver.
								Pavel
--=20
People of Russia, stop Putin before his war on Ukraine escalates.

--ZADFVpt7/0P2Ieq3
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iF0EABECAB0WIQRPfPO7r0eAhk010v0w5/Bqldv68gUCZxdyQAAKCRAw5/Bqldv6
8ts0AJ0bRyaE7ceSMozAGGusBFUkaEmLsgCeMq3NWA3DTE0v0CewLF/DIpXMt3c=
=kdQL
-----END PGP SIGNATURE-----

--ZADFVpt7/0P2Ieq3--

