Return-Path: <linux-input+bounces-5946-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A422964B68
	for <lists+linux-input@lfdr.de>; Thu, 29 Aug 2024 18:19:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 8CBA61C223CD
	for <lists+linux-input@lfdr.de>; Thu, 29 Aug 2024 16:19:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6E2501B5EB4;
	Thu, 29 Aug 2024 16:16:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Gu3vu998"
X-Original-To: linux-input@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 422301B3B1D;
	Thu, 29 Aug 2024 16:16:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724948195; cv=none; b=tFlbhrGNf4zD+si8Gy7rexgLSLHKyVipRG8WbpWNZjDh5i7v+D6tIlQw15USq+zH42bRVCd3RkjJSo7EWPla2d0XTNDnv7xLnt7qa8BJC09+KSDPiFixZ16yNw0LXD/+I4WnBMhcTKO+qud6gUrRFJNtqmva+zxbNKPSR+BJeVg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724948195; c=relaxed/simple;
	bh=HxPcbRMFcsJNqFKtugSZKtmx4npczuzpAat1MMw2FFk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Le+218cfn4IkN+BdAPEkXnDwKAXU29Z9/zlrZGZfezVEiaI97PZlZYbDtF9Y015rvQncZOyhOhGm5+NIwByRugwXhnQGBRUnA+C1fRUDz/q/De/LvXHy/g83Cv5a17fsWgS3Xo1hnw7sRvgVA7wY1eCFAC6GiKl8wcfVSsT+Ay8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Gu3vu998; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F1277C4CEC2;
	Thu, 29 Aug 2024 16:16:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1724948194;
	bh=HxPcbRMFcsJNqFKtugSZKtmx4npczuzpAat1MMw2FFk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Gu3vu9985tehBLLpWjFYDXPNeRGf5KzowUGu7XAR7vA1/jCUwgGlEU19/YOl75g6t
	 TMay80EKIq/vhlaQDBRu8Zta/68PuiZ7jjXSwGAFD+zjNI+sp1UoqflEcgRn8GcXOC
	 Qi7ERfy7GZzOuPi5BeLdmVHf/IVofWRwxIR/sHg+FbqZYhxsEzhpbp/twR+8K8EKSc
	 v7m4gKF/yFPx6rqhgMf28KhbMeFTqXgnGrRImgDsmSzYI0B8jL6GqWNcpUMn27gQTF
	 A25Ecd+fU+ewLBIBJAGIxt38zO0nGhg4Jj//W18xnJHZuPi9ZyA7kimFIMFHA+buhU
	 e65SI6ZOuuJKQ==
Date: Thu, 29 Aug 2024 17:16:30 +0100
From: Conor Dooley <conor@kernel.org>
To: Antoniu Miclaus <antoniu.miclaus@analog.com>
Cc: Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Michael Hennerich <michael.hennerich@analog.com>,
	linux-input@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/2] dt-bindings: touchscreen: ad7877: add bindings
Message-ID: <20240829-mossy-dispense-bab38650455f@spud>
References: <20240829092007.25850-1-antoniu.miclaus@analog.com>
 <20240829092007.25850-2-antoniu.miclaus@analog.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="hFaBAt629pkSLViP"
Content-Disposition: inline
In-Reply-To: <20240829092007.25850-2-antoniu.miclaus@analog.com>


--hFaBAt629pkSLViP
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Aug 29, 2024 at 12:19:36PM +0300, Antoniu Miclaus wrote:
> Add device tree bindings for the ad7877 driver.
>=20
> Signed-off-by: Antoniu Miclaus <antoniu.miclaus@analog.com>
> ---
>  .../input/touchscreen/adi,ad7877.yaml         | 58 +++++++++++++++++++
>  1 file changed, 58 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/input/touchscreen/a=
di,ad7877.yaml
>=20
> diff --git a/Documentation/devicetree/bindings/input/touchscreen/adi,ad78=
77.yaml b/Documentation/devicetree/bindings/input/touchscreen/adi,ad7877.ya=
ml
> new file mode 100644
> index 000000000000..5fc5124c5999
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/input/touchscreen/adi,ad7877.yaml
> @@ -0,0 +1,58 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/input/touchscreen/adi,ad7877.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Analog Devices AD7877 Touch Screen Controller
> +
> +maintainers:
> +  - Antoniu Miclaus <antoniu.miclaus@analog.com>
> +
> +description: |
> +  Analog Devices Touch Screen Controller
> +  https://www.analog.com/media/en/technical-documentation/data-sheets/AD=
7877.pdf
> +
> +allOf:
> +  - $ref: touchscreen.yaml#
> +  - $ref: /schemas/spi/spi-peripheral-props.yaml#

> +
> +unevaluatedProperties: false

So, all of the properties in those two files are valid for this
touchscreen controller?

--hFaBAt629pkSLViP
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZtCe3gAKCRB4tDGHoIJi
0iT8AP4pJ9a6awlbILTm7sxvIpWDpdBbhXEgx4ngjVqasbPQqAD8DQiAFH2A3p5f
JPd29psXBmpBvhIG+Xi2vJGMjOF+Cgs=
=mApE
-----END PGP SIGNATURE-----

--hFaBAt629pkSLViP--

