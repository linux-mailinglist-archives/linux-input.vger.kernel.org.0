Return-Path: <linux-input+bounces-3681-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id DFCB58C314A
	for <lists+linux-input@lfdr.de>; Sat, 11 May 2024 14:38:21 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 5B8D9B211B8
	for <lists+linux-input@lfdr.de>; Sat, 11 May 2024 12:38:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5E8081D54F;
	Sat, 11 May 2024 12:38:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="RXnNF6XQ"
X-Original-To: linux-input@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F90AC8DE;
	Sat, 11 May 2024 12:38:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715431095; cv=none; b=ppAG8MTf7UxzlryUdjTX1LVLbD50pXKha599VGWaooJ189feXrz7y3DI/RQx1H5aZOpm7TY0JxcmFxphPb2nZh5JzEfKishONJDmCa1mvVrgovSCzDif57BVoh+WEFmZZrFOiyAKaAXJ86vDnnsdu5rhr+ObEMJ5iahEtufkg3A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715431095; c=relaxed/simple;
	bh=pTtfjAhGNdNkddBKTzttOYaB1OFfxS0HrYE/Kf0RfO4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=YUCf6q4CJ+3no+7i8+02wPiNialNLvII4ArFU5+G1BmYaaJ+wtEOaW5FZVJbgUd0VGEvNRExpLHAeo9kp7hz+foyAUgHpNWv2fVIvz3bRoIMOJkH9EUbXy+su3Qcu3vZVyRwpIS+ZTwbqy4boPXcYRK/lxpWi2c1lpFYAmQojJo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=RXnNF6XQ; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CDCA4C2BBFC;
	Sat, 11 May 2024 12:38:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1715431094;
	bh=pTtfjAhGNdNkddBKTzttOYaB1OFfxS0HrYE/Kf0RfO4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=RXnNF6XQRpkbClGeUmn57PI5Mey0MfPVNW/YeSs1ls+g4gnMZ1onx8X0pUWBmRyHI
	 Tz8DMEm9A0limyW4/H7FTWs19r006d/XtTgX80mToPIntL2fZ4iiySalI8yXaGOK51
	 JPAtBUZpv/Zfhto88y7rsvn1Hel/KLLapGc4lmBYNWS1Ug+aO0yODnl2c5E/+e/MfH
	 s6wTTNxWl2djpDZucUcPisoFg/SZmmk2ljSfBF6QBDyyM/BiTRkYttey9oK7GR7ass
	 qB5NLHrvRJEVdE41k4u45epV6XvCzzGnu7YAYkO4D5wsa3bGPWkVXCEGA5Zy8BBDei
	 UpVtNOmRSdGRw==
Date: Sat, 11 May 2024 13:38:10 +0100
From: Conor Dooley <conor@kernel.org>
To: Felix Kaechele <felix@kaechele.ca>
Cc: Job Noorman <job@noorman.info>,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>, linux-input@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 1/5] dt-bindings: input: touchscreen: himax,hx83112b:
 add HX83100A
Message-ID: <20240511-passage-obstruct-70e4c3b37dbd@spud>
References: <20240511121245.109644-1-felix@kaechele.ca>
 <20240511121245.109644-2-felix@kaechele.ca>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="A7xsnz4pJUUJkkL2"
Content-Disposition: inline
In-Reply-To: <20240511121245.109644-2-felix@kaechele.ca>


--A7xsnz4pJUUJkkL2
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sat, May 11, 2024 at 08:12:22AM -0400, Felix Kaechele wrote:
> Add a compatible string for the Himax HX83100A touch controller.
>=20
> Signed-off-by: Felix Kaechele <felix@kaechele.ca>

Commit message should mention what makes this device incompatible with
the existing device.

Thanks,
Conor.

> ---
>  .../devicetree/bindings/input/touchscreen/himax,hx83112b.yaml    | 1 +
>  1 file changed, 1 insertion(+)
>=20
> diff --git a/Documentation/devicetree/bindings/input/touchscreen/himax,hx=
83112b.yaml b/Documentation/devicetree/bindings/input/touchscreen/himax,hx8=
3112b.yaml
> index f42b23d532eb..f5cfacb5e966 100644
> --- a/Documentation/devicetree/bindings/input/touchscreen/himax,hx83112b.=
yaml
> +++ b/Documentation/devicetree/bindings/input/touchscreen/himax,hx83112b.=
yaml
> @@ -15,6 +15,7 @@ allOf:
>  properties:
>    compatible:
>      enum:
> +      - himax,hx83100a
>        - himax,hx83112b
> =20
>    reg:
> --=20
> 2.45.0
>=20

--A7xsnz4pJUUJkkL2
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZj9msgAKCRB4tDGHoIJi
0sU2AP4x75uROqsCf5hAItzPs1a76FLSU36pSc9PIX2QsE81wAD/W4rTYtFPzR4J
iFfHxIoONo99+mqF11MlcofK2Zy6Kws=
=DVSB
-----END PGP SIGNATURE-----

--A7xsnz4pJUUJkkL2--

