Return-Path: <linux-input+bounces-4476-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 329B990F5BB
	for <lists+linux-input@lfdr.de>; Wed, 19 Jun 2024 20:09:15 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 9F97B285BD6
	for <lists+linux-input@lfdr.de>; Wed, 19 Jun 2024 18:09:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EA362156F21;
	Wed, 19 Jun 2024 18:09:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="VfznPObf"
X-Original-To: linux-input@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF81082495;
	Wed, 19 Jun 2024 18:09:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718820550; cv=none; b=RYUH5fFulrzqdNYP8yLOwuC5tCW9L949RnwS0cE/T/+97fGM3tZrOej0isbR1ZQHBkJe0NJqdeAUxUpd+ESTjNcx7SYuHwVfftuWogbvUQwk8Wq3a5Y9l1PjihmsfRrmeaAYRin6KTu2AH3rPD1Dy+O6Ajzr8ICqp6PvgF6QzzM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718820550; c=relaxed/simple;
	bh=xQUMdfGptqNCoM+PXtRPaJVHRXrzeIqBVJkn4+hGA+c=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=qyPSw771dcq2miKHtL1Q6Yt7h/A/0tuWHbb5m1ptJKLlMjbED/ka4fzqL58JfvqlOAtp5FZCSo4jrSG6AyfGeF3FFOl61p2YpB5XFwWUYPSPU6C93SEaXbGRSaUhrCMoZ8vs2kAZeJPhU/jXGt4uO+1eMHEMuNJYRyoj2etrjoY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=VfznPObf; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CA8F1C2BBFC;
	Wed, 19 Jun 2024 18:09:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1718820550;
	bh=xQUMdfGptqNCoM+PXtRPaJVHRXrzeIqBVJkn4+hGA+c=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=VfznPObfU1O+XE2wsjaB+US4qnXrGLQxqSQzoJqJiNHYh84SCUSx5A157KA2aEgbg
	 tks4zp0jMGBXQjWphplwlp3Eb2FW/6kPmLqwJeDj7Z49O6PynncBus5hS7JPJJgYQ4
	 k7RNZlM8XqlJIw5QuZ38pji5SATwk4uUOHnszMYVgecw05x/s8pOZx8HtAnGZJ7+Hn
	 e0W+0IibcO0hpwAxkc2TXs+5yxU3il4o0f+UMyvwzhVG15YWTEkTLn8mXYi4Rj6pUQ
	 nFZx4Z9PLzYdbV+FBsW3T6k2Bn3mJkL4Ixtr4D925FsErqPdAU3oCTJ9YK1kMFrnHP
	 rrYPzrdnKtAPw==
Date: Wed, 19 Jun 2024 19:09:05 +0100
From: Conor Dooley <conor@kernel.org>
To: Charles Wang <charles.goodix@gmail.com>
Cc: dmitry.torokhov@gmail.com, dan.carpenter@linaro.org, robh@kernel.org,
	dianders@chromium.org, krzk+dt@kernel.org, jikos@kernel.org,
	bentiss@kernel.org, hbarnor@chromium.org,
	linux-input@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v5 2/2] dt-bindings: input: Goodix SPI HID Touchscreen
Message-ID: <20240619-browsing-discount-cee3b686f505@spud>
References: <20240618084455.1451461-1-charles.goodix@gmail.com>
 <20240618084455.1451461-3-charles.goodix@gmail.com>
 <20240618-affluent-unroasted-e6d5d34d1ea2@spud>
 <ZnI_kt3APuF6NWvR@ux-UP-WHL01>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="0Eg8AtMpp+Soaosq"
Content-Disposition: inline
In-Reply-To: <ZnI_kt3APuF6NWvR@ux-UP-WHL01>


--0Eg8AtMpp+Soaosq
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Jun 19, 2024 at 10:16:50AM +0800, Charles Wang wrote:
> Hi Conor,
>=20
> On Tue, Jun 18, 2024 at 06:43:18PM +0100, Conor Dooley wrote:
> > On Tue, Jun 18, 2024 at 04:44:54PM +0800, Charles Wang wrote:

> > > +  reset-gpios:
> > > +    maxItems: 1
> > > +    description: reset gpio the chip is connected to.
> >=20
> > The description here isn't needed, it's obvious :)
> >
>=20
> Ack.
>=20
> > > +  goodix,hid-report-addr:
> > > +    $ref: /schemas/types.yaml#/definitions/uint32
> > > +    description: |
> >=20
> > This | is not needed, there's no formatting to preserve.
> >=20
> > Those are nits:
> > Reviewed-by: Conor Dooley <conor.dooley@microchip.com>
> >=20
>=20
> Thank you. If there is a next version, I will fix these.

Sounds good, thank you!

--0Eg8AtMpp+Soaosq
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZnMewQAKCRB4tDGHoIJi
0le3AP9V2KpfI8sEVe0Lj4eV/WlOwTZ3i1T60Q6aoOIM0o349wEA1xOgCzFo9Us4
PJiiCKh8fY1RQAcX+Jdd57pq6DCh5Qk=
=WtQJ
-----END PGP SIGNATURE-----

--0Eg8AtMpp+Soaosq--

