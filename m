Return-Path: <linux-input+bounces-6442-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 2DF03976F88
	for <lists+linux-input@lfdr.de>; Thu, 12 Sep 2024 19:29:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id ABAAA1F243F4
	for <lists+linux-input@lfdr.de>; Thu, 12 Sep 2024 17:29:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 711271BF7FB;
	Thu, 12 Sep 2024 17:29:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Q374CKmY"
X-Original-To: linux-input@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3BC221BF7F3;
	Thu, 12 Sep 2024 17:29:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726162171; cv=none; b=J8SqRLYWYuncKUpSw8QYuUt2OO/5Ri3IKE6hGN5KKb3d81UstFsTiaDh6GUPtbl7v7P++VR3zCo7tJUCjq7o/ple8SJJTDLcKRcwlOxpnoMnHveIyr3liG84GAlsEyslDf6UqtHioXDUsg89Xo7dKV5DS6XXky7VCkoipXne3Cs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726162171; c=relaxed/simple;
	bh=xhqvjqpyA8cnq3v8vl+ABjg4kZgip/Nh7LoOnqQc2dc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=l1Au8BofRANTuRf0UqzAu/oUK1ZgxZ+aYPsHdx3JKx/sqqWtqiYf0iNWEw6LOIfMQolEAU1pPCunSi5HCBKltriqC5oL570AF1qPfCvJQCVaiRt/UrtWTWuGYbHhp1++7K1HIGkfLpIlumlCDSHbRgLiPr03u4RHZauxzu8P8Y4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Q374CKmY; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5AA61C4CEC3;
	Thu, 12 Sep 2024 17:29:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1726162170;
	bh=xhqvjqpyA8cnq3v8vl+ABjg4kZgip/Nh7LoOnqQc2dc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Q374CKmYTcGVFqGo9pu6FX1jPHBZ+AwGn1oXN+hqRkJTcDWZ3AYsXYYmJ9zvTWJS9
	 SCBJkUjoz3vyEpmHbwD3AIqBavWCvuISoN+PN1FeQiATm7sP1oJTiGH+KbmxXTSvdX
	 zGhXPr5hfT/0XyI8hXBoo4DqPwziTqi/zWm2IolMX3YH134dlRA8KVg1s6fm78aQ1E
	 Jyh5fBDQiu91kWq7uZ8h7rKo10dnQKklkcsLENH3usZ6twyz7Exy4hjSgIoSNFIlpW
	 vdrVJSPGqcmZCvEIHPAqnGRNHbviIoN1kzQ/wTPnX5/cekxkBCzbEOHVJayHI2eFZ0
	 BnNyOzOVD3CMw==
Date: Thu, 12 Sep 2024 18:29:26 +0100
From: Conor Dooley <conor@kernel.org>
To: Oleh Kuzhylnyi <kuzhylol@gmail.com>
Cc: Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, linux-input@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	Conor Dooley <conor.dooley@microchip.com>, igor.opaniuk@gmail.com,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Jeff LaBundy <jeff@labundy.com>
Subject: Re: [PATCH v7 1/2] dt-bindings: input: touchscreen: add Hynitron
 CST816X
Message-ID: <20240912-strenuous-shame-57e15e34437b@spud>
References: <20240912132823.123409-1-kuzhylol@gmail.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="4cecQjSG5/Xg/ZJA"
Content-Disposition: inline
In-Reply-To: <20240912132823.123409-1-kuzhylol@gmail.com>


--4cecQjSG5/Xg/ZJA
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Sep 12, 2024 at 03:28:22PM +0200, Oleh Kuzhylnyi wrote:
> Add documentation for the Hynitron CST816X touchscreen bindings.
>=20
> Reviewed-by: Conor Dooley <conor.dooley@microchip.com>
> Signed-off-by: Oleh Kuzhylnyi <kuzhylol@gmail.com>
> ---
>=20
> Changes in v7:
>  - Introduce the gestures field along with its sub-fields
>  - Make reset-gpio property optional
>  - Extend main description
>  - Remove "touchscreen" reference
>=20
> Changes in v6:
>  - Fix minor tweak adviced by Krzysztof:
>  - Move additionalProperties field after required
>=20
> Changes in v5:
>  - No code changes
>=20
> Changes in v4:
>  - Add Conor's Dooley "Reviewed-by" tag
>=20
> Changes in v3:
>  - Rename filename to hynitron,cst816s.yaml
>  - Update description with display details
>=20
> Changes in v2:
>  - Apply pin definitions and DT headers
>  - Use generic name for DT node
>  - Drop status field
>=20
>  .../input/touchscreen/hynitron,cst816s.yaml   | 126 ++++++++++++++++++
>  1 file changed, 126 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/input/touchscreen/h=
ynitron,cst816s.yaml
>=20
> diff --git a/Documentation/devicetree/bindings/input/touchscreen/hynitron=
,cst816s.yaml b/Documentation/devicetree/bindings/input/touchscreen/hynitro=
n,cst816s.yaml
> new file mode 100644
> index 000000000000..99ac29da7a5a
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/input/touchscreen/hynitron,cst816=
s.yaml
> @@ -0,0 +1,126 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/input/touchscreen/hynitron,cst816s.ya=
ml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Hynitron CST816S Touchscreen controller
> +
> +description:
> +  The CST816S is a touchscreen controller from Hynitron, which supports =
gesture
> +  recognition for swipe directions, tap, and long-press actions. This bi=
nding
> +  document defines the necessary properties for integrating the CST816S =
with
> +  a Linux system.
> +
> +maintainers:
> +  - Oleh Kuzhylnyi <kuzhylol@gmail.com>
> +
> +properties:
> +  compatible:
> +    enum:
> +      - hynitron,cst816s
> +
> +  reg:
> +    maxItems: 1
> +
> +  interrupts:
> +    maxItems: 1
> +
> +  reset-gpios:
> +    maxItems: 1
> +    description:
> +      Optional GPIO line used to reset the touchscreen controller.
> +    optional: true
> +
> +  gestures:
> +    type: object
> +    description:
> +      A list of gestures supported by the CST816S touchscreen controller=
 and
> +      their associated Linux input event codes.
> +    optional: true
> +
> +    properties:
> +      "^.*$":

Did I really ack this with a .* regex? Surely there's a limit on what
kinds of gestures that it can recognise?

> +        type: object
> +        description:
> +          Each child node represents a gesture that the touchscreen cont=
roller
> +          can recognize.
> +
> +        properties:
> +          cst816x,gesture:

This isn't a valid vendor prefix. Please remove received acks/reviews if
you make non-trivial changes to a reviewed patch, I wouldn't have acked
this.

> +            description:
> +              Numeric value representing the gesture ID recognized by the
> +              CST816S touchscreen controller.
> +            $ref: /schemas/types.yaml#/definitions/uint32
> +
> +          linux,code:
> +            description:
> +              Linux input event code (from linux/input-event-codes.h) th=
at
> +              corresponds to the gesture.
> +            $ref: /schemas/types.yaml#/definitions/uint32
> +
> +        required:
> +          - cst816x,gesture
> +          - linux,code
> +
> +        additionalProperties: false
> +
> +required:
> +  - compatible
> +  - reg
> +  - interrupts
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    #include <dt-bindings/gpio/gpio.h>
> +    #include <dt-bindings/input/linux-event-codes.h>
> +    #include <dt-bindings/interrupt-controller/irq.h>
> +
> +    i2c {
> +      #address-cells =3D <1>;
> +      #size-cells =3D <0>;
> +
> +      touchscreen@15 {
> +        compatible =3D "hynitron,cst816s";
> +        reg =3D <0x15>;
> +        interrupt-parent =3D <&gpio0>;
> +        interrupts =3D <4 IRQ_TYPE_EDGE_RISING>;
> +        reset-gpios =3D <&gpio 17 GPIO_ACTIVE_LOW>;
> +
> +        gestures {
> +          swipe_up {
> +            cst816x,gesture =3D <0x1>;
> +            linux,code =3D <BTN_FORWARD>;
> +          };
> +
> +          swipe_down {
> +            cst816x,gesture =3D <0x2>;
> +            linux,code =3D <BTN_BACK>;
> +          };
> +
> +          swipe_left {
> +            cst816x,gesture =3D <0x3>;
> +            linux,code =3D <BTN_LEFT>;
> +          };
> +
> +          swipe_right {
> +            cst816x,gesture =3D <0x4>;
> +            linux,code =3D <BTN_RIGHT>;
> +          };
> +
> +          single_tap {
> +            cst816x,gesture =3D <0x5>;
> +            linux,code =3D <BTN_TOUCH>;
> +          };
> +
> +          long_press {
> +            cst816x,gesture =3D <0xC>;
> +            linux,code =3D <BTN_TOOL_TRIPLETAP>;
> +          };
> +        };
> +      };
> +    };
> +
> +...
> --=20
> 2.34.1
>=20

--4cecQjSG5/Xg/ZJA
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZuMk9gAKCRB4tDGHoIJi
0qjUAQCgNnfPtss2biRbBqzXpRehd+fQC7Gmt5tndEBCgNW+3QD9HL0xA2BSkcoh
AgofETkHOM7Qu2jJmpgB/18jrlpg9wM=
=51n/
-----END PGP SIGNATURE-----

--4cecQjSG5/Xg/ZJA--

