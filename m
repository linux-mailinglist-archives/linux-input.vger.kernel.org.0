Return-Path: <linux-input+bounces-13720-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 1611CB15E8C
	for <lists+linux-input@lfdr.de>; Wed, 30 Jul 2025 12:56:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id C4A627B333D
	for <lists+linux-input@lfdr.de>; Wed, 30 Jul 2025 10:54:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CFBC1286D71;
	Wed, 30 Jul 2025 10:56:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ucw.cz header.i=@ucw.cz header.b="nga9U8PT"
X-Original-To: linux-input@vger.kernel.org
Received: from jabberwock.ucw.cz (jabberwock.ucw.cz [46.255.230.98])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4FAB426B74E;
	Wed, 30 Jul 2025 10:56:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=46.255.230.98
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753872963; cv=none; b=Qi5xKFGxdZ+DVKKw36f9IUy51ho+Is6fG2qKeVx2aL5PD0YVZKkmh1L9JdYkuIpCR/sS6jlyhGb53bXsZPntXTmdPf66Chvtl/66XqBY0c0gtX7zF3SCpPh8Pp656SbuqiV1xswd2cyEeOW9gykzz06porOY5x2M0WWBnSVIeNU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753872963; c=relaxed/simple;
	bh=MyDrTWu1OyyQfo8M8XUZ50u7CuEnGcNggXpZ3Noz1cM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=dyKIc4BzsW88pbK9mFz/crN/zGsf/hqe74P5NVeg1XkvfED6jmnkdptQhSWlgcR9PgX94TpAcjd/rbC4ZKKBY8g4jgt/s1fCQDXZlNcoA2OUOL3YWsXTNHx5hVPoCdrMpKP/9jc4NUgUuzTF/W9Y1HxsnbV0/udxspmOlYERh2E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ucw.cz; spf=pass smtp.mailfrom=ucw.cz; dkim=pass (1024-bit key) header.d=ucw.cz header.i=@ucw.cz header.b=nga9U8PT; arc=none smtp.client-ip=46.255.230.98
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ucw.cz
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ucw.cz
Received: by jabberwock.ucw.cz (Postfix, from userid 1017)
	id 364E81C008E; Wed, 30 Jul 2025 12:55:58 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ucw.cz; s=gen1;
	t=1753872958;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=IUvziGVwPj14oumL8T3Pp/fyePDtYX7fnby8+7xW4+E=;
	b=nga9U8PTDAG/6BnC8pbaiLzmd+rkzLie3LnDO/2YvL2bB/s6KdCUyd9rWradFH3fnZK8FT
	Tqy9uBFaE5pvxekhb0PL7F7cK+s2ebtImnGm3T8Qr+qyvjODM/vsNGhxP2lgakG9N+P59E
	yJ019R7gtYK+uHI8fXbbs6eXn5qCNW0=
Date: Wed, 30 Jul 2025 12:55:57 +0200
From: Pavel Machek <pavel@ucw.cz>
To: Vishnu Sankar <vishnuocv@gmail.com>
Cc: pali@kernel.org, dmitry.torokhov@gmail.com, hmh@hmh.eng.br,
	hansg@kernel.org, ilpo.jarvinen@linux.intel.com, tglx@linutronix.de,
	mingo@kernel.org, jon_xie@pixart.com, jay_lee@pixart.com,
	zhoubinbin@loongson.cn, linux-input@vger.kernel.org,
	linux-kernel@vger.kernel.org, ibm-acpi-devel@lists.sourceforge.net,
	platform-driver-x86@vger.kernel.org, vsankar@lenovo.com,
	Mark Pearson <mpearson-lenovo@squebb.ca>
Subject: Re: [PATCH] x86/Mouse: thinkpad_acpi/Trackpoint: Trackpoint
 Doubletap handling
Message-ID: <aIn6PdZREQzNVR74@duo.ucw.cz>
References: <20250620004209.28250-1-vishnuocv@gmail.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="vN9KMWUX9mIMbmXC"
Content-Disposition: inline
In-Reply-To: <20250620004209.28250-1-vishnuocv@gmail.com>


--vN9KMWUX9mIMbmXC
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri 2025-06-20 09:42:08, Vishnu Sankar wrote:
> Newer ThinkPads have a doubletap feature that needs to be turned
> ON/OFF via the trackpoint registers.
> Systems released from 2023 have doubletap disabled by default and
> need the feature enabling to be useful.
>=20
> This patch introduces support for exposing and controlling the
> trackpoint doubletap feature via a sysfs attribute.
> /sys/devices/platform/thinkpad_acpi/tp_doubletap
> This can be toggled by an "enable" or a "disable".

sysfs attributes need documentation.
							Pavel
						=09
--=20
I don't work for Nazis and criminals, and neither should you.
Boycott Putin, Trump, and Musk!

--vN9KMWUX9mIMbmXC
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iF0EABECAB0WIQRPfPO7r0eAhk010v0w5/Bqldv68gUCaIn6PQAKCRAw5/Bqldv6
8phYAKCBVMI8dDqskaiFv96hJ2CjEFqcJACgsHeaCzYOHLDeqLpyta7Y01fR+v8=
=da38
-----END PGP SIGNATURE-----

--vN9KMWUX9mIMbmXC--

