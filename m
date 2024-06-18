Return-Path: <linux-input+bounces-4407-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 8641C90C796
	for <lists+linux-input@lfdr.de>; Tue, 18 Jun 2024 12:48:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 4D87228573D
	for <lists+linux-input@lfdr.de>; Tue, 18 Jun 2024 10:48:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 093CD15530C;
	Tue, 18 Jun 2024 09:06:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ucw.cz header.i=@ucw.cz header.b="eKYT/zhq"
X-Original-To: linux-input@vger.kernel.org
Received: from jabberwock.ucw.cz (jabberwock.ucw.cz [46.255.230.98])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A88A13A401;
	Tue, 18 Jun 2024 09:06:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=46.255.230.98
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718701594; cv=none; b=F89o/nxjS303Y1RCaO1+tVkHQoimOyErRrBg5JGu1v1tZUisyawAM+qMhfcJ9eVAx+qAslwrfmhXE2SujVNqnJUMNBIsjZnkvg3Yzq1DLybVMALsLUFphs/LOgrFBm6rPbKajGgiPA9D8VQ7LGslKq8yURTSKRFLn2UwdUpz8k8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718701594; c=relaxed/simple;
	bh=1xvnTLcwUC/wXSbK0hHWiovGjdpeba1dJ2R9GFpGru0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ERvK3TloFw0mjH7IbyT+RLi2iC2hKqvl3nqTwmxJONGQu2k4j2TDQbr9WId626N3MqilumQM7QJQe4Qfq7tZfm7Ph+x4/0Y8MEBfBjr8kcRggL7IwdI4MCN/u/pm8XBK7NfZmZxvqZjfJHRXwScmAdKdYERVKe6SgrSzCdTazSg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ucw.cz; spf=pass smtp.mailfrom=ucw.cz; dkim=pass (1024-bit key) header.d=ucw.cz header.i=@ucw.cz header.b=eKYT/zhq; arc=none smtp.client-ip=46.255.230.98
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ucw.cz
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ucw.cz
Received: by jabberwock.ucw.cz (Postfix, from userid 1017)
	id 6499A1C0082; Tue, 18 Jun 2024 11:06:28 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ucw.cz; s=gen1;
	t=1718701588;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=xtv9e/zean9YtwVbvYLt9HowqzS0Av+9M4FJjz/aoWY=;
	b=eKYT/zhqu3DOr0M3GNkrbWzbrhYnGE/w0ZNoD0esRMh4xs7MUkkMRHJU4mshDx+jVxGa2+
	2+E/k2oxlwylVe5v0+X2v/zl+zOkorCPrGyJsD8RClnTEEf/6nER+7qmK4/RaftY/1cSb3
	y93jcBKfIDQOxvqXgFm3yjIhCQ8xT80=
Date: Tue, 18 Jun 2024 11:06:27 +0200
From: Pavel Machek <pavel@ucw.cz>
To: Sasha Levin <sashal@kernel.org>
Cc: linux-kernel@vger.kernel.org, stable@vger.kernel.org,
	Hans de Goede <hdegoede@redhat.com>,
	Gregor Riepl <onitake@gmail.com>, corbet@lwn.net,
	ilpo.jarvinen@linux.intel.com, paulmck@kernel.org,
	jpoimboe@kernel.org, tglx@linutronix.de, bp@alien8.de,
	xiongwei.song@windriver.com, linux-doc@vger.kernel.org,
	linux-input@vger.kernel.org, platform-driver-x86@vger.kernel.org
Subject: Re: [PATCH AUTOSEL 5.10 4/8] platform/x86: touchscreen_dmi: Add
 support for setting touchscreen properties from cmdline
Message-ID: <ZnFOE5LcN2R9/zXc@duo.ucw.cz>
References: <20240605120554.2968012-1-sashal@kernel.org>
 <20240605120554.2968012-4-sashal@kernel.org>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="S/N03PCznFK76NlG"
Content-Disposition: inline
In-Reply-To: <20240605120554.2968012-4-sashal@kernel.org>


--S/N03PCznFK76NlG
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi!

> [ Upstream commit 0b178b02673998f5acca5a0365a8858ca45beedb ]
>=20
> On x86/ACPI platforms touchscreens mostly just work without needing any
> device/model specific configuration. But in some cases (mostly with Silead
> and Goodix touchscreens) it is still necessary to manually specify various
> touchscreen-properties on a per model basis.
>=20
> touchscreen_dmi is a special place for DMI quirks for this, but it can be
> challenging for users to figure out the right property values, especially
> for Silead touchscreens where non of these can be read back from
> the touchscreen-controller.
>=20
> ATM users can only test touchscreen properties by editing touchscreen_dmi=
=2Ec
> and then building a completely new kernel which makes it unnecessary
> difficult for users to test and submit properties when necessary for their
> laptop / tablet model.
>=20
> Add support for specifying properties on the kernel commandline to allow
> users to easily figure out the right settings. See the added documentation
> in kernel-parameters.txt for the commandline syntax.

I don't believe this is suitable for stable.

Best regards,
								Pavel
--=20
People of Russia, stop Putin before his war on Ukraine escalates.

--S/N03PCznFK76NlG
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iF0EABECAB0WIQRPfPO7r0eAhk010v0w5/Bqldv68gUCZnFOEwAKCRAw5/Bqldv6
8uj9AKCsdtNtMZUOkf6ks4neub3NXKRZfACfcuiNamMXquKiK+ws/iD2l1txxRM=
=HPHn
-----END PGP SIGNATURE-----

--S/N03PCznFK76NlG--

