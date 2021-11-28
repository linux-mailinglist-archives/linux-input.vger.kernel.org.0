Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 423A946092E
	for <lists+linux-input@lfdr.de>; Sun, 28 Nov 2021 20:02:43 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1344596AbhK1TFy (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Sun, 28 Nov 2021 14:05:54 -0500
Received: from ams.source.kernel.org ([145.40.68.75]:49614 "EHLO
        ams.source.kernel.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234909AbhK1TDv (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Sun, 28 Nov 2021 14:03:51 -0500
Received: from mail.kernel.org (unknown [198.145.29.99])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id DFCEAB80D40;
        Sun, 28 Nov 2021 19:00:33 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 337D36023B;
        Sun, 28 Nov 2021 19:00:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1638126032;
        bh=MSDCHGakKkL1gr+V/6bolOSkApKmJia5VBfiuWQLcys=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=gdYKjQzvdaTxu1m7D7sedt5Y2Z2tgtr73usTxGcXTVB79nKqDryh6iHUDXU6328TG
         Isdj5wZdsSXFR32cYB0fbmuOU4R9L0fvmASmD7IRvQLPFq5aF45JwhvYKAzWLVkj9Z
         fmRpYihVkOvrQIA5s2EjGlVTgivIKcW8NJ1K37wFB8y5agSCe2W0sgJMT2YLbljKG7
         MEoP/doz7YLjHk9eCn5f5i02qFn4XUXE281Uhqrp/P5lLs3lmeSuX5olr6jTgNMJOW
         PExmmgx5GlKXcevuh1GEntMjd6XEysIycGepSTTKMinwdAL7/8qgrMz7FQ8bhxccdz
         leXsKeMXj/gfg==
Received: by earth.universe (Postfix, from userid 1000)
        id 1191A3C0CA7; Sun, 28 Nov 2021 20:00:30 +0100 (CET)
Date:   Sun, 28 Nov 2021 20:00:30 +0100
From:   Sebastian Reichel <sre@kernel.org>
To:     David Heidelberg <david@ixit.cz>
Cc:     Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        ~okias/devicetree@lists.sr.ht, linux-input@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] dt-bindings: input: pwm-vibrator: Convert txt bindings
 to yaml
Message-ID: <20211128190030.do7h4s6zqkulggm7@earth.universe>
References: <20211127130941.38684-1-david@ixit.cz>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="xxlwdmoetk3ytw6o"
Content-Disposition: inline
In-Reply-To: <20211127130941.38684-1-david@ixit.cz>
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org


--xxlwdmoetk3ytw6o
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,

On Sat, Nov 27, 2021 at 02:09:40PM +0100, David Heidelberg wrote:
> Converts txt binding to new YAML format and simplify example.
>=20
> Signed-off-by: David Heidelberg <david@ixit.cz>
> ---

Reviewed-by: Sebastian Reichel <sre@kernel.org>

-- Sebastian

>  .../bindings/input/pwm-vibrator.txt           | 66 -------------------
>  .../bindings/input/pwm-vibrator.yaml          | 59 +++++++++++++++++
>  2 files changed, 59 insertions(+), 66 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/input/pwm-vibrator.=
txt
>  create mode 100644 Documentation/devicetree/bindings/input/pwm-vibrator.=
yaml
>=20
> diff --git a/Documentation/devicetree/bindings/input/pwm-vibrator.txt b/D=
ocumentation/devicetree/bindings/input/pwm-vibrator.txt
> deleted file mode 100644
> index 88c775a3fe21..000000000000
> --- a/Documentation/devicetree/bindings/input/pwm-vibrator.txt
> +++ /dev/null
> @@ -1,66 +0,0 @@
> -* PWM vibrator device tree bindings
> -
> -Registers a PWM device as vibrator. It is expected, that the vibrator's
> -strength increases based on the duty cycle of the enable PWM channel
> -(100% duty cycle meaning strongest vibration, 0% meaning no vibration).
> -
> -The binding supports an optional direction PWM channel, that can be
> -driven at fixed duty cycle. If available this is can be used to increase
> -the vibration effect of some devices.
> -
> -Required properties:
> -- compatible: should contain "pwm-vibrator"
> -- pwm-names: Should contain "enable" and optionally "direction"
> -- pwms: Should contain a PWM handle for each entry in pwm-names
> -
> -Optional properties:
> -- vcc-supply: Phandle for the regulator supplying power
> -- direction-duty-cycle-ns: Duty cycle of the direction PWM channel in
> -                           nanoseconds, defaults to 50% of the channel's
> -			   period.
> -
> -Example from Motorola Droid 4:
> -
> -&omap4_pmx_core {
> -	vibrator_direction_pin: pinmux_vibrator_direction_pin {
> -		pinctrl-single,pins =3D <
> -		OMAP4_IOPAD(0x1ce, PIN_OUTPUT | MUX_MODE1) /* dmtimer8_pwm_evt (gpio_2=
7) */
> -		>;
> -	};
> -
> -	vibrator_enable_pin: pinmux_vibrator_enable_pin {
> -		pinctrl-single,pins =3D <
> -		OMAP4_IOPAD(0X1d0, PIN_OUTPUT | MUX_MODE1) /* dmtimer9_pwm_evt (gpio_2=
8) */
> -		>;
> -	};
> -};
> -
> -/ {
> -	pwm8: dmtimer-pwm {
> -		pinctrl-names =3D "default";
> -		pinctrl-0 =3D <&vibrator_direction_pin>;
> -
> -		compatible =3D "ti,omap-dmtimer-pwm";
> -		#pwm-cells =3D <3>;
> -		ti,timers =3D <&timer8>;
> -		ti,clock-source =3D <0x01>;
> -	};
> -
> -	pwm9: dmtimer-pwm {
> -		pinctrl-names =3D "default";
> -		pinctrl-0 =3D <&vibrator_enable_pin>;
> -
> -		compatible =3D "ti,omap-dmtimer-pwm";
> -		#pwm-cells =3D <3>;
> -		ti,timers =3D <&timer9>;
> -		ti,clock-source =3D <0x01>;
> -	};
> -
> -	vibrator {
> -		compatible =3D "pwm-vibrator";
> -		pwms =3D <&pwm9 0 1000000000 0>,
> -                       <&pwm8 0 1000000000 0>;
> -		pwm-names =3D "enable", "direction";
> -		direction-duty-cycle-ns =3D <1000000000>;
> -	};
> -};
> diff --git a/Documentation/devicetree/bindings/input/pwm-vibrator.yaml b/=
Documentation/devicetree/bindings/input/pwm-vibrator.yaml
> new file mode 100644
> index 000000000000..ec2466c63fe6
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/input/pwm-vibrator.yaml
> @@ -0,0 +1,59 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: "http://devicetree.org/schemas/input/pwm-vibrator.yaml#"
> +$schema: "http://devicetree.org/meta-schemas/core.yaml#"
> +
> +title: PWM vibrator
> +
> +maintainers:
> +  - Sebastian Reichel <sre@kernel.org>
> +
> +description: >
> +  Registers a PWM device as vibrator. It is expected, that the vibrator's
> +  strength increases based on the duty cycle of the enable PWM channel
> +  (100% duty cycle meaning strongest vibration, 0% meaning no vibration).
> +
> +  The binding supports an optional direction PWM channel, that can be
> +  driven at fixed duty cycle. If available this is can be used to increa=
se
> +  the vibration effect of some devices.
> +
> +properties:
> +  compatible:
> +    const: pwm-vibrator
> +
> +  pwm-names:
> +    anyOf:
> +      - items:
> +          - const: enable
> +      - items:
> +          - const: enable
> +          - const: direction
> +
> +  pwms:
> +    minItems: 1
> +    maxItems: 2
> +
> +  vcc-supply: true
> +
> +  direction-duty-cycle-ns:
> +    description: >
> +      Duty cycle of the direction PWM channel in nanoseconds,
> +      defaults to 50% of the channel's period.
> +
> +required:
> +  - compatible
> +  - pwm-names
> +  - pwms
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    vibrator {
> +        compatible =3D "pwm-vibrator";
> +        pwms =3D <&pwm9 0 1000000000 0>,
> +               <&pwm8 0 1000000000 0>;
> +        pwm-names =3D "enable", "direction";
> +        direction-duty-cycle-ns =3D <1000000000>;
> +    };
> --=20
> 2.33.0
>=20

--xxlwdmoetk3ytw6o
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEE72YNB0Y/i3JqeVQT2O7X88g7+poFAmGj0cQACgkQ2O7X88g7
+pqCqw//d/VgY2G4K6HJzqdpE5/tczGzDUnxOPdQthktXtv5WFDiBXFZA4qE3rQl
WBkd+gF2UzRzXeEasptSy6mphbr+31Vdc0Lb/6kAKMM6Skn5CJcOaSEYf6PCsSOF
k4/BnEhr44ceHWq+YfcnTN3xlgXYJonhfAiXc25ufqoY2JTjVJqgH92piWoDKNtz
pf9UQvtbRB3WYZVJ1QVqHvf365Z3jDueWKwWIFjPMTWTQPzBgQxl4fM+HmMHR7rV
QZYB3msd9V/fiAwkpMgDEvMYtDmToro+C02BaA2EGw1Bg760mkyR/nHLkgc6jUSf
Hg+MTmWcLVSn04+jpdyctMV/uPiFh8tWHP29j3T77TzjNMvpp0CAQEI58zjl8SWe
kKAQy7hTz/np9IbojrupzNBcIMVhpjBk7Mp8R4QfXosyrk/VtM/nXvotKnN3Cnwc
L7ZhAAGl9qz3cclNPlp5ZKOPdMbrbBwlJ0E4ZizK2h7kk4AxgGDOBLumfXpyDkie
1s04l0rX/7y309bYZRbVWtZjIgbwmR/GgMODcYzEUqHVDQ7h8tGD+NpCncoX/SCk
/SYEGP2sP5ZRCx2k3W1ogyVfae50IZzc6l728QIhcJXzdvwOYniXajDcPpQWYt7M
ln7z0wBeC6SpTItlXvc8LD7At9L5boKecXvskobVkaMa7lKZ86M=
=09Nd
-----END PGP SIGNATURE-----

--xxlwdmoetk3ytw6o--
