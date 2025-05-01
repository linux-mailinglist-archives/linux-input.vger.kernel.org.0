Return-Path: <linux-input+bounces-12093-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 920B1AA5AAB
	for <lists+linux-input@lfdr.de>; Thu,  1 May 2025 07:49:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 513D33AC99C
	for <lists+linux-input@lfdr.de>; Thu,  1 May 2025 05:48:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7461B230BD2;
	Thu,  1 May 2025 05:48:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="hxpKIOeF"
X-Original-To: linux-input@vger.kernel.org
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 04B8C22FAF8
	for <linux-input@vger.kernel.org>; Thu,  1 May 2025 05:48:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746078537; cv=none; b=H7r68alrrqBtfLHuAsppwDsDg93x6BhcLy+QERcpYs6DYTxY53xMXZxHBHjYuZ7Cy1lGIeBW91IMzHOgqaIl0hTNsMn3PKTqQCAaNQTDZmn4eHOCt9NadZ0Ey/3lCaR+qKcCiZnQ0Ji+UPboEzjCrO8NIMqnRbZFKEinCcH2QTo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746078537; c=relaxed/simple;
	bh=ygl78VUf3BhZ5rR7EvJhvjvETyc4gdw0Jmlo9BCLMzo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ouVONIFt1CFPQKuVFMhCVxgOhpaKdtgQvfGu2qd0oYl29DbJDKXYhai995DJEqy9OqGYcleApXx3gT7BMdWe9X/fVsXeG+k/sIrcFyiBAAd7Sl60SGtBlfBJpIsYrt5s5Ybd2BV0CYI9Ev55A0prxgbI1AVshEAvz4jV1Rd4g64=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=hxpKIOeF; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=date:from:to:cc:subject:message-id
	:references:mime-version:content-type:in-reply-to; s=k1; bh=ygl7
	8VUf3BhZ5rR7EvJhvjvETyc4gdw0Jmlo9BCLMzo=; b=hxpKIOeFYv7T7xJgtsM1
	eeLihxqqj6V6ZvChwVRXEsvTgbJNnuL9uBGBbg3H6b4ro+I/4UMXIpH2mrUAmluC
	VIx/73s3pOa5NuwgBxkVUo0WTWfPYLtJfJBIP5Ps/QcwWBRoqmEYdQBAypzNcwTp
	3SCQ99iOblrHfSXzKcKYfByg2fhsMCESlQCUTniXD4D3fwiEbeK3LLvsmEBT+G1x
	U0KU8y8EFStUcys7QWok0OLqv3up2SLW11A9qPcZIag+EODYhMiADvzl+i7/Z88a
	LW8vZV664tq9IrBNet3PbUzxTSLh5pnIoN6NTJiH3eFEWXOl9mWpzKqrFkc2LgI9
	pQ==
Received: (qmail 945843 invoked from network); 1 May 2025 07:48:48 +0200
Received: by mail.zeus03.de with UTF8SMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 1 May 2025 07:48:48 +0200
X-UD-Smtp-Session: l3s3148p1@wrRwlgw0Frsujnsd
Date: Thu, 1 May 2025 07:48:48 +0200
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: linux-renesas-soc@vger.kernel.org, Jonathan Corbet <corbet@lwn.net>,
	linux-input@vger.kernel.org, linux-doc@vger.kernel.org
Subject: Re: [RFC PATCH] Input: edt-ft5x06 - use per-client debugfs directory
Message-ID: <aBMLQLv2cm1RXgTq@shikoro>
Mail-Followup-To: Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	linux-renesas-soc@vger.kernel.org, Jonathan Corbet <corbet@lwn.net>,
	linux-input@vger.kernel.org, linux-doc@vger.kernel.org
References: <20250318091904.22468-1-wsa+renesas@sang-engineering.com>
 <6rid4lbtyisgchnl4grnwzysrbw2wtd4lrkjmw5tcs4xyggafo@tondbi5jhl5w>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="meaJVmIwwVPdQmWE"
Content-Disposition: inline
In-Reply-To: <6rid4lbtyisgchnl4grnwzysrbw2wtd4lrkjmw5tcs4xyggafo@tondbi5jhl5w>


--meaJVmIwwVPdQmWE
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Apr 30, 2025 at 08:13:08PM -0700, Dmitry Torokhov wrote:
> Hi Wolfram,
>=20
> On Tue, Mar 18, 2025 at 10:17:41AM +0100, Wolfram Sang wrote:
> > The I2C core now provides a debugfs entry for each client. Let this
> > driver use it instead of the custom directory in debugfs root. Further
> > improvements by this change: support of multiple instances.
> >=20
> > Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
> > ---
> >=20
> > Build tested only, by me and buildbots. Trying to cleanup the debugfs a
> > little. But not sure if this is too complicated for users. Opinions?
>=20
> This looks nice and nobody is yelling. Any reason why I shouldn't simply
> apply it?

Not really. I marked this as RFC because the path changed from

/sys/kernel/debug/edt_ft5x06

to

/sys/kernel/debug/i2c/<i2c-bus>/<i2c-device>/

so people have to deal with bus and device numbers now. I usually think
debugfs is mostly for developers, so they can handle that. I wasn't so
sure with this driver for some reason...


--meaJVmIwwVPdQmWE
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmgTCzwACgkQFA3kzBSg
KbZbzA//QDJxy449JmMwFgnwfYph17R6cmhPdM0siWjGS11mbcwR7R0A2oGbRRcT
bMvb8TQYK3dsCa/AL8JyBG4d8r+928NqaLH74hiRvFLF1RjKsI4F+Drco8t4nzag
BHt8PyYzauDhSDxAQ0CfG/K/EDkK2Pif2il5m3/94OJgatPTJc+nJn1H6xCssszb
FkkTPIpYekS8+OezFsX3oNHc8sDSsnM+chVM+NNam+MMOmQssaSER+/NqitMWDhx
WSQJ5Rcj0n7DTp/Q+TXYwqIxgSjjf2qjqJTaH4CQSN13VuM4k5OROXyaIf/Eex16
mPE2RINT2+kEcpe1Alj98j0h1bf1cu07tS8dw5DWfkcxisQVW+cmxeCHrLoU9asD
Oe0uagkQm3oU9OaKv1sl9lxjWc4UWwJr386n/EcZ02HuEjj9ULTZqSsbb+scGT/v
/PATiEhZPCuR14V/b+6hVe4S+ztGdqB06dktgeFOkYFtvJm8ASuNfGuyPcoYMmZ6
HSw7LDZDgp9N5eVrDS/yAfH2eb3i/fm8zu3RnOyCu0Dc3mfTa5pZ7i77worbtJc7
3Whwwufd9avTfVVlWxbaB5zXAvU2xLvR3CSxVmnVx9eGNeAKj+6LX0jkE/2hmUZm
fKhLqVUBz9vcSfcF2dwGbDi8YX/VFgvvw/5/ez50jioS6nj18Dc=
=YbSy
-----END PGP SIGNATURE-----

--meaJVmIwwVPdQmWE--

