Return-Path: <linux-input+bounces-3798-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 7570B8CD624
	for <lists+linux-input@lfdr.de>; Thu, 23 May 2024 16:51:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 1941CB21101
	for <lists+linux-input@lfdr.de>; Thu, 23 May 2024 14:51:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B1EA95680;
	Thu, 23 May 2024 14:51:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="cELGUhTJ"
X-Original-To: linux-input@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 86B4A5227;
	Thu, 23 May 2024 14:51:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716475867; cv=none; b=raDJjMWl3i7mgg87azCBeQbIA3hJcI8EXvkcB+ngkxbwApyUkNpUe+D6ZdNMr1c5gM8pAJBTn0L0Np5FVaSazZWiVcX/gVSsSJwXxjeFGsiF3ezjSQiCpEtXKD+iKM3xJZV2qWVdenf9QGPKL88hUznTgGoCyMFU8kttCRB3rGU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716475867; c=relaxed/simple;
	bh=KXr+O49jgY3DWM6OLjKqbbwipuCBHbRBENFht4rZ6iY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=iTOwgts3cU22oOzgGq8i36AAQqBXal2ukaZSnIBEQavy0kbt8TpezXdBzQN6oc0zvy+BIopqF//hnYRPMJHzGhpiRm5PS4stv6LfeE6Z2s8r02E+HmICZ5W7zFIMTXUuCUKFLDSyin7Km+NlLEHW+l7qov9xqxhMB3gFbx4AVWg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=cELGUhTJ; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EA5D7C2BD10;
	Thu, 23 May 2024 14:51:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1716475867;
	bh=KXr+O49jgY3DWM6OLjKqbbwipuCBHbRBENFht4rZ6iY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=cELGUhTJByfteAzCn7jYhjQ9L+H2tm2L98G08fQVHP5rZuDBlapct1p2yKI0bgnCu
	 LjQKuvZd9RVrMx9JqMxlU/ttymX2Uh54hnQoGTFqGjVlUUgRHd4AMbJvnDwFDfJtml
	 /M8LxC8oap72j60cMJnypX77k/xK7pCK1SdWD8e/+b6pzjgxMT9yHfEieRf2ufH9M/
	 kpikBeA3Jvcc+jSOfgtA2IEG6NuyHNzcGuWcEup8MDx789FfnnYCOdsyzEcwgwWfTE
	 JTQrHC+4fZuSD1BTtrbBidV3jxga4TGuTOQ6cMsPX6JEGl9ktqhNCK/9A8oBKeiQhQ
	 VqyuYEmNPnnOw==
Date: Thu, 23 May 2024 15:51:01 +0100
From: Conor Dooley <conor@kernel.org>
To: Oleh Kuzhylnyi <kuzhylol@gmail.com>
Cc: linux-input@vger.kernel.org, dmitry.torokhov@gmail.com,
	jeff@labundy.com, neil.armstrong@linaro.org, schnelle@linux.ibm.com,
	arnd@kernel.org, hdegoede@redhat.com, linux-kernel@vger.kernel.org,
	robh@kernel.org, krzysztof.kozlowski+dt@linaro.org,
	conor+dt@kernel.org, devicetree@vger.kernel.org,
	artur.serhiienko@gmail.com, igor.opaniuk@gmail.com
Subject: Re: [PATCH v2 1/2] dt-bindings: input: touchscreen: add Hynitron
 CST816X
Message-ID: <20240523-hulk-sake-da52a7545ab5@spud>
References: <20240522203347.2263425-1-kuzhylol@gmail.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="0lfDBifo+k1uqAPQ"
Content-Disposition: inline
In-Reply-To: <20240522203347.2263425-1-kuzhylol@gmail.com>


--0lfDBifo+k1uqAPQ
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, May 22, 2024 at 05:33:46PM -0300, Oleh Kuzhylnyi wrote:
> Add documentation for the Hynitron CST816X touchscreen bindings.
>=20
> Signed-off-by: Oleh Kuzhylnyi <kuzhylol@gmail.com>
> ---
>=20
> Changes in v2:
>  - Apply pin definitions and DT headers
>  - Use generic name for DT node
>  - Drop status field
>=20
>  .../input/touchscreen/hynitron,cst816x.yaml   | 56 +++++++++++++++++++
>  1 file changed, 56 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/input/touchscreen/h=
ynitron,cst816x.yaml
>=20
> diff --git a/Documentation/devicetree/bindings/input/touchscreen/hynitron=
,cst816x.yaml b/Documentation/devicetree/bindings/input/touchscreen/hynitro=
n,cst816x.yaml
> new file mode 100644
> index 000000000000..22bd145db5ee
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/input/touchscreen/hynitron,cst816=
x.yaml
> @@ -0,0 +1,56 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/input/touchscreen/hynitron,cst816x.ya=
ml#

Filename matching compatible please, so s/cst816x/cst816s/.

> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Hynitron CST816X series touchscreen controller
> +
> +description: |

The | here is not needed & you can drop the "Bindings for" below.

Maybe add a link to a datasheet if you don't want title =3D=3D description.

Otherwise,
Reviewed-by: Conor Dooley <conor.dooley@microchip.com>

Cheers,
Conor.

--0lfDBifo+k1uqAPQ
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZk9X1QAKCRB4tDGHoIJi
0iLcAQCd9wA6lC/r6uoaFfC4d+Rr6zRitp2mhqDJZ9AH+SEkrQEAoNlgRPmKtt1o
BhQXnP0f3PcfwbvBrmiadI8uHUh8BwE=
=eJC5
-----END PGP SIGNATURE-----

--0lfDBifo+k1uqAPQ--

