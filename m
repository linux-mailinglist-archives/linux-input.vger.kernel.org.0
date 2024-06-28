Return-Path: <linux-input+bounces-4708-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C13A91C3A8
	for <lists+linux-input@lfdr.de>; Fri, 28 Jun 2024 18:21:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id CD54A2844F3
	for <lists+linux-input@lfdr.de>; Fri, 28 Jun 2024 16:21:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 55B5E1C8FB1;
	Fri, 28 Jun 2024 16:21:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="iddrDdV2"
X-Original-To: linux-input@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 27BBC20DE8;
	Fri, 28 Jun 2024 16:21:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719591682; cv=none; b=ndEEmYyr253m0hmDf3eUn45Orh7yYCit3T7A/1XZMG+GQfD44FirNsyFbHjhn+1FDbIBwOiDHF37ocyRAxJkIABiFG3JxIGAFQbcgPU57Ff7bc5sgYTkHDlySDeScSpSy9SBHRSoSd1HXh46miFDffrqSfd12n0F79T5+SrwFbc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719591682; c=relaxed/simple;
	bh=w3NbMxbKmswnQ6oF33UmJfda5v4dc+Buf2Yr7Q3ZsRo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ugA0mndm51dDfdWn2wKc0WQL2Pl5QHvoJESF1RM8tsszzy2paL2KCz8Uau/EqQSvU5RDriCrE8bZ0Pe9cUv2I96x1JaoKGkra7KMxp5HF/przg7v1VFTpxRR/NukvkrDCdszllIf72g2Wnm4PTB3hq5Til95j+YLjygzhI0nQOk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=iddrDdV2; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C58BAC116B1;
	Fri, 28 Jun 2024 16:21:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1719591681;
	bh=w3NbMxbKmswnQ6oF33UmJfda5v4dc+Buf2Yr7Q3ZsRo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=iddrDdV2nW6yQRM+oe8uKXWgjGhedfHOTtgrWvIKh9GZ9mS8BgCXXoVkAUAfq9oaH
	 upgVP6x0ostRqGIk/7xhRzHs9mz06puGU+w2Fk3L/UulQP58qfKZ32ixuHRtb6hZiO
	 7BMNMyBlAE6wqB12PziVsBVllgyHHZFTc4bcu22mqA7NU9G5Skr7Sq4lJYJxIwtqeU
	 CxxTXWEezTOG5IT4E8vcZ9+J5KGzEn52KUZBaRg9Ik8YImMbr8dizJzxQS6rt9+9nH
	 ok9+GNVTI0McM3Iimsi/vr88jf4my1XkkDYsmTTV7zYSfio/S0FuZ5/Rs2dyIadZrK
	 XtZA+scDl0qWA==
Date: Fri, 28 Jun 2024 17:21:17 +0100
From: Conor Dooley <conor@kernel.org>
To: Philipp Zabel <p.zabel@pengutronix.de>
Cc: Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, linux-input@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	kernel@pengutronix.de
Subject: Re: [PATCH v2 1/2] dt-bindings: input: touchscreen: exc3000: add
 EXC81W32
Message-ID: <20240628-agonizing-syrup-fcd55c441b3f@spud>
References: <20240628-input-exc3000-exc81w32-v2-0-c2b21a369c05@pengutronix.de>
 <20240628-input-exc3000-exc81w32-v2-1-c2b21a369c05@pengutronix.de>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="t4gpnudAEY7ZnRQc"
Content-Disposition: inline
In-Reply-To: <20240628-input-exc3000-exc81w32-v2-1-c2b21a369c05@pengutronix.de>


--t4gpnudAEY7ZnRQc
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Jun 28, 2024 at 10:35:51AM +0200, Philipp Zabel wrote:
> Add compatible for EXC81W32 touchscreen controllers.

Could you please mention in your commit messages what makes a fallback
compatible inappropriate here?

Thanks,
Conor.

>=20
> Signed-off-by: Philipp Zabel <p.zabel@pengutronix.de>
> ---
> v2: new patch, split out of driver patch
> ---
>  Documentation/devicetree/bindings/input/touchscreen/eeti,exc3000.yaml | =
1 +
>  1 file changed, 1 insertion(+)
>=20
> diff --git a/Documentation/devicetree/bindings/input/touchscreen/eeti,exc=
3000.yaml b/Documentation/devicetree/bindings/input/touchscreen/eeti,exc300=
0.yaml
> index 9dc25d30a0a8..c299838e2680 100644
> --- a/Documentation/devicetree/bindings/input/touchscreen/eeti,exc3000.ya=
ml
> +++ b/Documentation/devicetree/bindings/input/touchscreen/eeti,exc3000.ya=
ml
> @@ -18,6 +18,7 @@ properties:
>        - eeti,exc3000
>        - eeti,exc80h60
>        - eeti,exc80h84
> +      - eeti,exc81w32
>    reg:
>      const: 0x2a
>    interrupts:
>=20
> --=20
> 2.39.2
>=20

--t4gpnudAEY7ZnRQc
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZn7i/QAKCRB4tDGHoIJi
0iYVAP4haTPIyIPx775CG7THzh7EA85NDpBkFZiK8q1fcOKOKQEA7USaUzVEMvzU
x6LtOV33uSeeEPAF2ygDFcjz/XL6+Qo=
=Twy1
-----END PGP SIGNATURE-----

--t4gpnudAEY7ZnRQc--

