Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AA4BA1F7B60
	for <lists+linux-input@lfdr.de>; Fri, 12 Jun 2020 18:05:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726108AbgFLQF1 (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Fri, 12 Jun 2020 12:05:27 -0400
Received: from bhuna.collabora.co.uk ([46.235.227.227]:36564 "EHLO
        bhuna.collabora.co.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726053AbgFLQF0 (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Fri, 12 Jun 2020 12:05:26 -0400
Received: from [127.0.0.1] (localhost [127.0.0.1])
        (Authenticated sender: sre)
        with ESMTPSA id 7E5FC2A56A5
Received: by earth.universe (Postfix, from userid 1000)
        id C11383C08C7; Fri, 12 Jun 2020 18:05:21 +0200 (CEST)
Date:   Fri, 12 Jun 2020 18:05:21 +0200
From:   Sebastian Reichel <sebastian.reichel@collabora.com>
To:     Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org
Cc:     linux-input@vger.kernel.org, linux-kernel@vger.kernel.org,
        kernel@collabora.com
Subject: Re: [PATCHv3 1/5] dt-bindings: touchscreen: Convert EETI EXC3000
 touchscreen to json-schema
Message-ID: <20200612160521.gneedgeu4x4ml27c@earth.universe>
References: <20200520153936.46869-1-sebastian.reichel@collabora.com>
 <20200520153936.46869-2-sebastian.reichel@collabora.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="xnevn6eizwjclo62"
Content-Disposition: inline
In-Reply-To: <20200520153936.46869-2-sebastian.reichel@collabora.com>
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org


--xnevn6eizwjclo62
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Rob,

I justed noticed, that I forgot to have you in To/Cc. Can you please
have a look at the patch? The full thread is available via Lore,
please tell me if you need a resend.

https://lore.kernel.org/linux-input/20200520153936.46869-1-sebastian.reiche=
l@collabora.com/

Sorry for the inconvenience,

-- Sebastian

On Wed, May 20, 2020 at 05:39:32PM +0200, Sebastian Reichel wrote:
> Convert the EETI EXC3000 binding to DT schema format using json-schema
>=20
> Signed-off-by: Sebastian Reichel <sebastian.reichel@collabora.com>
> ---
>  .../input/touchscreen/eeti,exc3000.yaml       | 53 +++++++++++++++++++
>  .../bindings/input/touchscreen/exc3000.txt    | 26 ---------
>  2 files changed, 53 insertions(+), 26 deletions(-)
>  create mode 100644 Documentation/devicetree/bindings/input/touchscreen/e=
eti,exc3000.yaml
>  delete mode 100644 Documentation/devicetree/bindings/input/touchscreen/e=
xc3000.txt
>=20
> diff --git a/Documentation/devicetree/bindings/input/touchscreen/eeti,exc=
3000.yaml b/Documentation/devicetree/bindings/input/touchscreen/eeti,exc300=
0.yaml
> new file mode 100644
> index 000000000000..022aa69a5dfe
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/input/touchscreen/eeti,exc3000.ya=
ml
> @@ -0,0 +1,53 @@
> +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/input/touchscreen/eeti,exc3000.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: EETI EXC3000 series touchscreen controller
> +
> +maintainers:
> +  - Dmitry Torokhov <dmitry.torokhov@gmail.com>
> +
> +allOf:
> +  - $ref: touchscreen.yaml#
> +
> +properties:
> +  compatible:
> +    const: eeti,exc3000
> +  reg:
> +    const: 0x2a
> +  interrupts:
> +    maxItems: 1
> +  touchscreen-size-x: true
> +  touchscreen-size-y: true
> +  touchscreen-inverted-x: true
> +  touchscreen-inverted-y: true
> +  touchscreen-swapped-x-y: true
> +
> +required:
> +  - compatible
> +  - reg
> +  - interrupts
> +  - touchscreen-size-x
> +  - touchscreen-size-y
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    #include "dt-bindings/interrupt-controller/irq.h"
> +    i2c {
> +        #address-cells =3D <1>;
> +        #size-cells =3D <0>;
> +        touchscreen@2a {
> +                compatible =3D "eeti,exc3000";
> +                reg =3D <0x2a>;
> +                interrupt-parent =3D <&gpio1>;
> +                interrupts =3D <9 IRQ_TYPE_LEVEL_LOW>;
> +                touchscreen-size-x =3D <4096>;
> +                touchscreen-size-y =3D <4096>;
> +                touchscreen-inverted-x;
> +                touchscreen-swapped-x-y;
> +        };
> +    };
> diff --git a/Documentation/devicetree/bindings/input/touchscreen/exc3000.=
txt b/Documentation/devicetree/bindings/input/touchscreen/exc3000.txt
> deleted file mode 100644
> index 68291b94fec2..000000000000
> --- a/Documentation/devicetree/bindings/input/touchscreen/exc3000.txt
> +++ /dev/null
> @@ -1,26 +0,0 @@
> -* EETI EXC3000 Multiple Touch Controller
> -
> -Required properties:
> -- compatible: must be "eeti,exc3000"
> -- reg: i2c slave address
> -- interrupts: touch controller interrupt
> -- touchscreen-size-x: See touchscreen.txt
> -- touchscreen-size-y: See touchscreen.txt
> -
> -Optional properties:
> -- touchscreen-inverted-x: See touchscreen.txt
> -- touchscreen-inverted-y: See touchscreen.txt
> -- touchscreen-swapped-x-y: See touchscreen.txt
> -
> -Example:
> -
> -	touchscreen@2a {
> -		compatible =3D "eeti,exc3000";
> -		reg =3D <0x2a>;
> -		interrupt-parent =3D <&gpio1>;
> -		interrupts =3D <9 IRQ_TYPE_LEVEL_LOW>;
> -		touchscreen-size-x =3D <4096>;
> -		touchscreen-size-y =3D <4096>;
> -		touchscreen-inverted-x;
> -		touchscreen-swapped-x-y;
> -	};
> --=20
> 2.26.2
>=20

--xnevn6eizwjclo62
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCgAdFiEE72YNB0Y/i3JqeVQT2O7X88g7+poFAl7jp7sACgkQ2O7X88g7
+pp9EQ/7BhIOTvcurDFoYgC8ux4KZktjk79cpt9MTDeBQ1hlNEq0X0U4GeEbJTkO
dl7CIGHs8J8rR+uHL7qRMPKkrW13pN1Uy4syd1dsWRl3ukO5uNrQvKU3x8InCWev
sb/+AsSxMMU7hdum7qZqTNrKIGoXrQ+E0CWEE4Pvrujho1iU4o0eV/f7Z8N3Xg6/
r7F0eip2UMBZDMkYjbtU7oWUJyYPIJRcXkS1c/jmHMAfQR2qxDJLblwL+c1QtLLM
DyawUfDlf5XOAq0LNvy86lnZNi16v4yqrfy1zDVy654z3j2KwveiSTTG4L4i+sbR
w/0MFQZav2hxBeDQYOIuMciis6G1+632N6J13g2wVbn5OYV1LNa4XvMkUc4YHv06
QVyrSRPPvfDAnWtBexPeX76sm3/XnnoBfEmM7UKtHSTF7VLpNeN5F37MirkX5//V
84HU9Orseqa8ymqdvgY0cc+7E80jVHe4OKfYVc57EMoT9v5+eUxSJcOpI9O34g4W
zoR19VPVvTHXzHY/lClP8mA3c5Tg+CWIR8le+592RmUmPBcr/qg13+ee0TBEgkqN
2vTOQhbtg2+E9x+Qe8iifxwjdj9jZgWl7oyAhO3y2f3Q9kx5u08wqw4ScKmZCyAg
hJLzFNqPHUBp0QxVOU/wMFMzbHGe/C/0fsTH6W3zabRDSgxGofg=
=+YBY
-----END PGP SIGNATURE-----

--xnevn6eizwjclo62--
