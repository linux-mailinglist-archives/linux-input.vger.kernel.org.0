Return-Path: <linux-input+bounces-5520-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 7EEF594F2E3
	for <lists+linux-input@lfdr.de>; Mon, 12 Aug 2024 18:12:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 3B23E284CFB
	for <lists+linux-input@lfdr.de>; Mon, 12 Aug 2024 16:12:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AF1D6187FE9;
	Mon, 12 Aug 2024 16:11:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="YiOYfU1I"
X-Original-To: linux-input@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C3E4186E47;
	Mon, 12 Aug 2024 16:11:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723479080; cv=none; b=Tu6eIa+1UWv/UAP+axYRUM4m6dhomPnYHgOiQ1LxZczeTJTMWqIfxuOW7RGbnhIz9t+p4+J9ugW0AqljEfm4XoFweQzbrbWrDZC0aj8W4J7evgTmjmFdNVQoQgw4d8zUVDdtBMEiJCTY+jCUDmZDi92vYv44+QtRq8NQhjG/PBI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723479080; c=relaxed/simple;
	bh=4LGlDYfh9hnYMFH9HallVbetIIWElNY/SAddpwGbcKE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=DYR1klyy74eGu4gvGGm3jXyQkYsCrPhy+5IDfVAdIebX1xqvR7dPqbFlGdzv3poz99WDrNc8MOVu8cpJgUszwe8IvPIzMfN6qqYEqsDq1GPFwK2p/wiEVggZQXgT5Aw5gHag9PAlMAECLipx6cimoDenaSGOZGJhiXzJQTqqvGk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=YiOYfU1I; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 004B2C32782;
	Mon, 12 Aug 2024 16:11:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1723479080;
	bh=4LGlDYfh9hnYMFH9HallVbetIIWElNY/SAddpwGbcKE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=YiOYfU1Ij/i1jdXyGc8m98/EA7WtwNA41DwzsHqDSmtiyyPFtOzgwusn/AaHBqVmc
	 8MLwIv5/W9AnfLXql3jEa5B0C2CIcmS12uUwsXjbX+9R4rS7v/rSJyvmHgSnLhwLXt
	 tB0lGpaETVDV2vYQDbzIhRJksBIL4klb1d6EgAvh7ZXFU0PDxGvtwyHKB2NBLC+N+C
	 HV7yoKzZPj/aVYBHdejEG+YayVBKOmT9lKioYyWHfqQ+Vts4gl0PVXSM15ii/5opJQ
	 xX04n6Bu6aFCof+MOrkTBS1peejbyaSfRce56Q0Jx0xL7A1eQKaX+a/x6o+WUPrcZh
	 gCOlGR5gTEsbA==
Date: Mon, 12 Aug 2024 17:11:14 +0100
From: Conor Dooley <conor@kernel.org>
To: Heiko Stuebner <heiko@sntech.de>
Cc: lee@kernel.org, jdelvare@suse.com, linux@roeck-us.net,
	dmitry.torokhov@gmail.com, pavel@ucw.cz, robh@kernel.org,
	krzk+dt@kernel.org, conor+dt@kernel.org, ukleinek@debian.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org, linux-hwmon@vger.kernel.org,
	linux-input@vger.kernel.org, linux-leds@vger.kernel.org
Subject: Re: [PATCH v4 1/7] dt-bindings: mfd: add binding for qnap,ts433-mcu
 devices
Message-ID: <20240812-unlisted-cussed-ffa50b07a82d@spud>
References: <20240810184743.277248-1-heiko@sntech.de>
 <20240810184743.277248-2-heiko@sntech.de>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="cHN7OHm8jMQ3S5kz"
Content-Disposition: inline
In-Reply-To: <20240810184743.277248-2-heiko@sntech.de>


--cHN7OHm8jMQ3S5kz
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sat, Aug 10, 2024 at 08:47:37PM +0200, Heiko Stuebner wrote:
> These MCUs can be found in network attached storage devices made by QNAP.
> They are connected to a serial port of the host device and provide
> functionality like LEDs, power-control and temperature monitoring.
>=20
> LEDs, buttons, etc are all elements of the MCU firmware itself, so don't
> need devicetree input, though the fan gets its cooling settings from
> a fan-0 subnode.
>=20
> A binding for the LEDs for setting the linux-default-trigger may come
> later, once all the LEDs are understood and ATA controllers actually
> can address individual port-LEDs, but are really optional.
>=20
> Signed-off-by: Heiko Stuebner <heiko@sntech.de>
Reviewed-by: Conor Dooley <conor.dooley@microchip.com>

--cHN7OHm8jMQ3S5kz
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZro0IgAKCRB4tDGHoIJi
0tg7AQCS2xWrPC2UUU1meYRX0JcteDszsR77WU6wV+xQhG4KEwEAlYF2R80DyuEq
tvLDLFquMfbB3h6dMgWWxA51/UKOdQY=
=E5pg
-----END PGP SIGNATURE-----

--cHN7OHm8jMQ3S5kz--

