Return-Path: <linux-input+bounces-14943-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C77FAB8D140
	for <lists+linux-input@lfdr.de>; Sat, 20 Sep 2025 22:44:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 8005A17FFC0
	for <lists+linux-input@lfdr.de>; Sat, 20 Sep 2025 20:44:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 74C6A2D7DE8;
	Sat, 20 Sep 2025 20:40:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=collabora.com header.i=sebastian.reichel@collabora.com header.b="gxLroDBm"
X-Original-To: linux-input@vger.kernel.org
Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com [136.143.188.112])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F1DFD2D7D41;
	Sat, 20 Sep 2025 20:40:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.112
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758400803; cv=pass; b=qEUkmCsLc7P4ElCCrwcSvLIsIzhP+iUNdpCJyd9mjrui+IMr29NwRvtCLXLfgfSullHkqbjy4/tY8t5hBDgLew1DC/UqOP+l8c1T+qlvkDo50RMgTQhc3aXfjaq/GY+KgzJv4mBl5YnmxYe+QbV/lI6pMhb7HFj5n1vl1TRKv44=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758400803; c=relaxed/simple;
	bh=uWI4/qj6thpZ0Tc19jhX4B24Cqj4vytw6faAdyXa6JI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=kKxiJbeG6Yf7VzIU+sNNNw1AKuJOPH5riMlkuDisfH9AhrrG/44MFDaW8UkM24JApcW2rmq00tb2URDe1XXXh4pb3yCAUGOXFxmTsTVE1/AWaxBY8YeqXbODr2OUic3WTFGObbUi4n1X8U/rpB3TF5wowlyJF0vrNI0EG6SJZws=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (1024-bit key) header.d=collabora.com header.i=sebastian.reichel@collabora.com header.b=gxLroDBm; arc=pass smtp.client-ip=136.143.188.112
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
ARC-Seal: i=1; a=rsa-sha256; t=1758400792; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=B2DhV/vuRbct8iVI7PfPT7kIvwrPnUtI9ADKXQmxsXeiqkoN9F6hbWdeZp7L8tJ9gMxqB8JbK/f8a8d4CSeB5vYdifaWx3tpRaaDmmZZVc1WoSkyfD+Aiky0GNIyyjDJMLIAWOhgmkVIfRF+OMk34diGEQHu3ylYlECa1Pz9axw=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1758400792; h=Content-Type:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=i3CZ8I6hMfZuqlYG/R7kbbW2PmgdFbuMEuk5EuX4U84=; 
	b=i1t1yVng4DEvL3QkBqhkZfOc9rokg5DBdduqJgUhwvxQ1sZeVn6kDMgqRngRKhiimKO1AiC9RDjBb9jkzZ6ft3QhIj4y1TTM2QjmRnuLi4iGb/gPn42Pm2S2S8JbfgRU72FaOzKVHZgIdNbsz8gCJB6fyUUswSU5rC4nrEd+eN0=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=sebastian.reichel@collabora.com;
	dmarc=pass header.from=<sebastian.reichel@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1758400792;
	s=zohomail; d=collabora.com; i=sebastian.reichel@collabora.com;
	h=Date:Date:From:From:To:To:Cc:Cc:Subject:Subject:Message-ID:References:MIME-Version:Content-Type:In-Reply-To:Message-Id:Reply-To;
	bh=i3CZ8I6hMfZuqlYG/R7kbbW2PmgdFbuMEuk5EuX4U84=;
	b=gxLroDBmdYYuzJnigHmahDbH+flW97oQv1ZEih0+klSpSHuzK20m+EoxJo2izzau
	SV8Vy72qx/x0FyMXxjkteMHRkMXpKHUcq54JAeTOtYCzNlumXF5UL2WYoaD7Uj4yGlt
	XF2YrY6I3HmOPURBDBK7qkosUY/23k67BjDf6ZDA=
Received: by mx.zohomail.com with SMTPS id 1758400790928789.1689767088144;
	Sat, 20 Sep 2025 13:39:50 -0700 (PDT)
Received: by venus (Postfix, from userid 1000)
	id 52ACA1805CD; Sat, 20 Sep 2025 22:39:43 +0200 (CEST)
Date: Sat, 20 Sep 2025 22:39:43 +0200
From: Sebastian Reichel <sebastian.reichel@collabora.com>
To: Dario Binacchi <dario.binacchi@amarulasolutions.com>
Cc: linux-kernel@vger.kernel.org, linux-amarula@amarulasolutions.com, 
	Conor Dooley <conor+dt@kernel.org>, Dmitry Torokhov <dmitry.torokhov@gmail.com>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Rob Herring <robh@kernel.org>, devicetree@vger.kernel.org, 
	linux-input@vger.kernel.org
Subject: Re: [PATCH v5 1/3] dt-bindings: touchscreen: convert eeti bindings
 to json schema
Message-ID: <iqfvpacnymzckd3vi7mxgzbljomwkww3mpuupn5mhy3rtlwebv@2vf346kfqpno>
References: <20250919075823.2557865-1-dario.binacchi@amarulasolutions.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="2hqg7mcrxxpxuwym"
Content-Disposition: inline
In-Reply-To: <20250919075823.2557865-1-dario.binacchi@amarulasolutions.com>
X-Zoho-Virus-Status: 1
X-Zoho-Virus-Status: 1
X-Zoho-AV-Stamp: zmail-av-1.4.3/258.384.42
X-ZohoMailClient: External


--2hqg7mcrxxpxuwym
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH v5 1/3] dt-bindings: touchscreen: convert eeti bindings
 to json schema
MIME-Version: 1.0

Hi,

On Fri, Sep 19, 2025 at 09:58:09AM +0200, Dario Binacchi wrote:
> Convert EETI touchscreen controller device tree binding to json-schema.
>=20
> Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
> ---
>=20
> Changes in v5:
> - Move bindings into eeti,exc3000.yaml
> - Remove eeti.yaml
>=20
> Changes in v2:
> - Added in v2
>=20
>  .../input/touchscreen/eeti,exc3000.yaml       | 41 ++++++++++++++++---
>  .../bindings/input/touchscreen/eeti.txt       | 30 --------------
>  2 files changed, 36 insertions(+), 35 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/input/touchscreen/e=
eti.txt
>=20
> diff --git a/Documentation/devicetree/bindings/input/touchscreen/eeti,exc=
3000.yaml b/Documentation/devicetree/bindings/input/touchscreen/eeti,exc300=
0.yaml
> index 1c7ae05a8c15..13b865d3ee58 100644
> --- a/Documentation/devicetree/bindings/input/touchscreen/eeti,exc3000.ya=
ml
> +++ b/Documentation/devicetree/bindings/input/touchscreen/eeti,exc3000.ya=
ml
> @@ -9,15 +9,13 @@ title: EETI EXC3000 series touchscreen controller
>  maintainers:
>    - Dmitry Torokhov <dmitry.torokhov@gmail.com>
> =20
> -allOf:
> -  - $ref: touchscreen.yaml#
> -
>  properties:
>    compatible:
>      oneOf:
>        - const: eeti,exc3000
>        - const: eeti,exc80h60
>        - const: eeti,exc80h84
> +      - const: eeti,exc3000-i2c

I think this should be

- const: eeti,exc3000-i2c
  deprecated: true

The compatible is obviously not something that should be used
anymore.

>        - items:
>            - enum:
>                - eeti,exc81w32
> @@ -30,18 +28,34 @@ properties:
>      maxItems: 1
>    vdd-supply:
>      description: Power supply regulator for the chip
> +  attn-gpios:
> +    maxItems: 1
> +    description: Phandle to a GPIO to check whether interrupt is still
> +                 latched. This is necessary for platforms that lack
> +                 support for level-triggered IRQs.

  deprecated: true

(see below)

>    touchscreen-size-x: true
>    touchscreen-size-y: true
>    touchscreen-inverted-x: true
>    touchscreen-inverted-y: true
>    touchscreen-swapped-x-y: true
> =20
> +allOf:
> +  - $ref: touchscreen.yaml#
> +  - if:
> +      not:
> +        properties:
> +          compatible:
> +            contains:
> +              const: eeti,exc3000-i2c
> +    then:
> +      required:
> +        - touchscreen-size-x
> +        - touchscreen-size-y

And I think it makes sense to add this to disallow using this ugly
hack with the normal compatibles:

else:
  attn-gpios: false

Looking at the only user (pxa300-raumfeld-controller), it supplies
the same GPIO as IRQ and as GPIO, so it is actually a software
limitation. Instead of implementing the software level based IRQ
handling in the gpio driver, it was hacked into the EETI driver.

Looks like this legacy platform is pretty much dead, otherwise I
would have suggested to simply switch it to the new binding/driver.

Greetings,

-- Sebastian

>  required:
>    - compatible
>    - reg
>    - interrupts
> -  - touchscreen-size-x
> -  - touchscreen-size-y
> =20
>  additionalProperties: false
> =20
> @@ -51,6 +65,7 @@ examples:
>      i2c {
>          #address-cells =3D <1>;
>          #size-cells =3D <0>;
> +
>          touchscreen@2a {
>                  compatible =3D "eeti,exc3000";
>                  reg =3D <0x2a>;
> @@ -62,3 +77,19 @@ examples:
>                  touchscreen-swapped-x-y;
>          };
>      };
> +
> +  - |
> +    #include <dt-bindings/gpio/gpio.h>
> +    #include "dt-bindings/interrupt-controller/irq.h"
> +    i2c {
> +        #address-cells =3D <1>;
> +        #size-cells =3D <0>;
> +
> +        touchscreen@2a {
> +            compatible =3D "eeti,exc3000-i2c";
> +            reg =3D <0x2a>;
> +            interrupt-parent =3D <&gpio>;
> +            interrupts =3D <123 IRQ_TYPE_EDGE_RISING>;
> +            attn-gpios =3D <&gpio 123 GPIO_ACTIVE_HIGH>;
> +        };
> +    };

I would also drop the example, nobody should use this :)

> diff --git a/Documentation/devicetree/bindings/input/touchscreen/eeti.txt=
 b/Documentation/devicetree/bindings/input/touchscreen/eeti.txt
> deleted file mode 100644
> index 32b3712c916e..000000000000
> --- a/Documentation/devicetree/bindings/input/touchscreen/eeti.txt
> +++ /dev/null
> @@ -1,30 +0,0 @@
> -Bindings for EETI touchscreen controller
> -
> -Required properties:
> -- compatible:	should be "eeti,exc3000-i2c"
> -- reg:		I2C address of the chip. Should be set to <0xa>
> -- interrupts:	interrupt to which the chip is connected
> -
> -Optional properties:
> -- attn-gpios:	A handle to a GPIO to check whether interrupt is still
> -		latched. This is necessary for platforms that lack
> -		support for level-triggered IRQs.
> -
> -The following optional properties described in touchscreen.txt are
> -also supported:
> -
> -- touchscreen-inverted-x
> -- touchscreen-inverted-y
> -- touchscreen-swapped-x-y
> -
> -Example:
> -
> -i2c-master {
> -	touchscreen@a {
> -		compatible =3D "eeti,exc3000-i2c";
> -		reg =3D <0xa>;
> -		interrupt-parent =3D <&gpio>;
> -		interrupts =3D <123 IRQ_TYPE_EDGE_RISING>;
> -		attn-gpios =3D <&gpio 123 GPIO_ACTIVE_HIGH>;
> -	};
> -};
> --=20
> 2.43.0
>=20
> base-commit: 8b789f2b7602a818e7c7488c74414fae21392b63
> branch: drop-touchscreen.txt
>=20

--2hqg7mcrxxpxuwym
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEE72YNB0Y/i3JqeVQT2O7X88g7+poFAmjPEQsACgkQ2O7X88g7
+powtw/+MsgxaegIJFTpRlr69ZjoUlOE5KEOAnbPdA6CIJKOvScUU/qSVxX2njiH
FsBi4e4kndKsrc5jvHmtTtNcif9xMKPq8Ik/p6PbxqCh474EB+uYIBejfxkpK2rF
HVn5P5gFtS4b2uRxVOGddkAe/1KZexqcpYatlEpISeyGCh4FhcHG6vzb5Np2zniX
Wrc3TK2h3K3BVrzWEFO/+XYOcjlv6XoMZ6HTbOhgwmYn6n3u1n8t550OmskPaxXd
pki8zkLZFNCeOkFoBCWPYFLt6AkoQIAlW1Lt4VIrrMfx9JLskcjft1jALTqSKS6+
TqFqdmCeA9gY/KH2BxNiCixIdjcJRET3B9lzHYMUa3BvLjQMAaa9bjSeH0NDfOzO
3vXg+uNqW0C8kUSW5Mq2y5Ag1/1Gfc5GMqaS8Zbo8/wvT/e2YrWlYQFWIJyrui0e
/RzFei2C1Eyf10EFXF2v+3y/oatFvSB+VXESU3UNUoD0UPo76mPxDEfyd2zEIHsI
AViP7O7An698cg3vKNoeKB+O7F0DNuMDz4LdD86k3RSxb+2g5ZguF5GTeFygotiA
8iytG/WO+kP/ZeP2UvCligtZyZVPC4xB6JscedldxjFr0WxYfwo4RPa4I/0Tag9j
SxosTR/+N8mT5139PFF58AdHmDoGZeuTVU/KZNV1DAI/Ym+iGxI=
=9UZq
-----END PGP SIGNATURE-----

--2hqg7mcrxxpxuwym--

