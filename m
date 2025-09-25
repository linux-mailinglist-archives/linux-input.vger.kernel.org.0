Return-Path: <linux-input+bounces-15112-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 796EBBA1427
	for <lists+linux-input@lfdr.de>; Thu, 25 Sep 2025 21:46:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id B6E6E1BC6FB4
	for <lists+linux-input@lfdr.de>; Thu, 25 Sep 2025 19:47:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 023FC31BC9E;
	Thu, 25 Sep 2025 19:46:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="HHJPWf6N"
X-Original-To: linux-input@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C2EA552F88;
	Thu, 25 Sep 2025 19:46:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758829602; cv=none; b=oOhPWxqtxdF8CdzEZ096LMQYjUvz//GBPoTJYCmIJxZ8JUr23UFOrPXs43YdYj1zCnPwtBvTG4H9QVh8ARRXCBBnP2kwaPaPZWC1lD15NGa2Skqz1Ck1r+F7GFAAKhbfppj01C6ej1I+ZBxKh1qR47lnT3pfBLeOkJXKXBEIJ0U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758829602; c=relaxed/simple;
	bh=1CMpelpJPOQG59n98d4hwrAEWkj5zityT4djB5jxbMU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=cRniG9Uv5jVM77GUbopC+GXGZtlIO2uNsu0W6Dve2maBs+McUH+AlsmnX+RAcfQZSaEZvgiSpmiVa4xPwkhF6o1w4tHprJ1PSf9DdSsMU8yQktHsv0ctyy49YUkopNbbwHgRrFfJuHQNBDYh8ULhWwSx1HOkVELqWNMbWcye2eM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=HHJPWf6N; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 83338C4CEF0;
	Thu, 25 Sep 2025 19:46:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1758829602;
	bh=1CMpelpJPOQG59n98d4hwrAEWkj5zityT4djB5jxbMU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=HHJPWf6NyAQeEXhR0uY501tp12VdDzgSTEKCAEpQzkrnrOM/os2TYggiPWPyejJNt
	 AC2wCCv3piz/Qf/cxnb3SbiAxcg0Jhy3q1+EeO7aT+xLmjwpafIQqv7dsia0/QE1IY
	 bzdpCd+LStyXKHxBJcAaOkNk6BZcaE2GT/RvhuNQ+wTj0p8DhxxH6XikN9SIQe7nZt
	 1YfrO9n3zOx2Z9VzNyVNpSIU+Fnc+B4FR8mhcQKnT6iUX4yPnnapqKbZDYfHz9rGSn
	 eypAyvSS5xdPUsAPGrHGaEtDqYxELibaxRRxTPKQuUqlL7J8kxrNi6mN3lhyPh5p9p
	 xz6ec1mBUpaZg==
Date: Thu, 25 Sep 2025 20:46:38 +0100
From: Conor Dooley <conor@kernel.org>
To: Frank Li <Frank.li@nxp.com>
Cc: Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	"open list:INPUT (KEYBOARD, MOUSE, JOYSTICK, TOUCHSCREEN)..." <linux-input@vger.kernel.org>,
	"open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>,
	open list <linux-kernel@vger.kernel.org>, imx@lists.linux.dev
Subject: Re: [PATCH 1/1] dt-bindings: touchscreen: move ar1021.txt to
 maxim,max11801.yaml
Message-ID: <20250925-swimming-overspend-ddf7ab4a252c@spud>
References: <20250925185653.298246-1-Frank.Li@nxp.com>
 <20250925-boundless-announcer-007f08404112@spud>
 <aNWX+DxUOXlOvsmo@lizhi-Precision-Tower-5810>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="WV+/qNvvVSDWWLA1"
Content-Disposition: inline
In-Reply-To: <aNWX+DxUOXlOvsmo@lizhi-Precision-Tower-5810>


--WV+/qNvvVSDWWLA1
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Sep 25, 2025 at 03:28:56PM -0400, Frank Li wrote:
> On Thu, Sep 25, 2025 at 08:20:02PM +0100, Conor Dooley wrote:
> > On Thu, Sep 25, 2025 at 02:56:47PM -0400, Frank Li wrote:
> > > ar1021 have only reg and interrupts property beside touch common
> > > properties. So move context of ar1021.txt into maxim,max11801.yaml.
> >
> > Are these devices even remotely related, other than both being touch
> > devices?
>=20
> No, just properties is the same. There are many binding files, which bund=
le
> similar properties's yaml to one file.
>=20
> we may create trivial-touch.yaml, which similar with trivial-rtc.yaml.

I think putting trivial devices that are completely unrelated into one
file is confusing. It makes it seem like these devices are similar in
programming model etc.
Merging them into a explicitly designated trivial-touch binding would be
an improvement, if there are lots of very similar devices that could
also be merged in together.

--WV+/qNvvVSDWWLA1
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaNWcHgAKCRB4tDGHoIJi
0kjRAP9QfSjE6qkn0yqyazy04cUhyWgyeJm0x1LmKrRPXJALdwD/f/7AkBsO1Odt
i8cZvFn404CDFdbXMPMJ/dLkfhTWFAg=
=FRwh
-----END PGP SIGNATURE-----

--WV+/qNvvVSDWWLA1--

