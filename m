Return-Path: <linux-input+bounces-417-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 60B5F802330
	for <lists+linux-input@lfdr.de>; Sun,  3 Dec 2023 12:36:15 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 04B33B209DA
	for <lists+linux-input@lfdr.de>; Sun,  3 Dec 2023 11:36:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9635C28F0;
	Sun,  3 Dec 2023 11:36:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="o/T9rqPY"
X-Original-To: linux-input@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6639FBE7D;
	Sun,  3 Dec 2023 11:36:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 39C74C433C9;
	Sun,  3 Dec 2023 11:36:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1701603366;
	bh=rOl3WitgjUdVwLzNkBaYN+t3eo93eA+dE6XBog1igRI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=o/T9rqPYKpE2uHK6Q1Cw8dRVuoFCZ3HIRyeOR4rG1fHlxptLuHpce34ufIYmbpqtW
	 UPEOiOAk9OORoootqZt0l8YKFqmgGbZHV5XkJccZfFIFY30DGO+vr380FxNOKLMXeH
	 jFmq+QssYpGJ0yYqAAngwVaroaP37nc63f8UQx7e/pUymhWYUFomLfkMrbp/m0XyQC
	 25gAG+ZiBRYdbU+YTprzMwbDMFYP9JxsuDqO2E2CEITsvNFsxfECEz9B0GD6z1KRZI
	 +/yiNvEwBBYruPkvxBIEVHH0IcbQ64rWZ0EUigAC44Ki2nuNu2EOVwLiPYAkpmTLME
	 oZFWm6GAYYeoQ==
Date: Sun, 3 Dec 2023 11:36:00 +0000
From: Conor Dooley <conor@kernel.org>
To: Biju Das <biju.das.jz@bp.renesas.com>
Cc: Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Support Opensource <support.opensource@diasemi.com>,
	linux-input@vger.kernel.org, devicetree@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Biju Das <biju.das.au@gmail.com>, linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH v2 03/11] dt-bindings: input: Convert da906{1,2,3} onkey
 to json-schema
Message-ID: <20231203-protozoan-degrease-432575e9dc1d@spud>
References: <20231202192536.266885-1-biju.das.jz@bp.renesas.com>
 <20231202192536.266885-4-biju.das.jz@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="K72JVjBk9/KxsZN8"
Content-Disposition: inline
In-Reply-To: <20231202192536.266885-4-biju.das.jz@bp.renesas.com>


--K72JVjBk9/KxsZN8
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sat, Dec 02, 2023 at 07:25:27PM +0000, Biju Das wrote:
> diff --git a/Documentation/devicetree/bindings/input/dlg,da9062-onkey.yam=
l b/Documentation/devicetree/bindings/input/dlg,da9062-onkey.yaml
> new file mode 100644
> index 000000000000..34f2e00cf045
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/input/dlg,da9062-onkey.yaml
> @@ -0,0 +1,61 @@
> +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/input/dlg,da9062-onkey.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Dialog DA9061/62/63 OnKey Module
> +
> +maintainers:
> +  - Biju Das <biju.das.jz@bp.renesas.com>
> +
> +description: |
> +  This module is part of the DA9061/DA9062/DA9063. For more details abou=
t entire
> +  DA9062 and DA9061 chips see Documentation/devicetree/bindings/mfd/da90=
62.txt
> +  For DA906{1,2,3} see Documentation/devicetree/bindings/mfd/dlg,da9063.=
yaml
> +
> +  This module provides the KEY_POWER event.
> +
> +properties:
> +  compatible:
> +    oneOf:
> +      - items:
> +          - enum:
> +              - dlg,da9062-onkey
> +              - dlg,da9063-onkey
> +      - items:
> +          - enum:
> +              - dlg,da9061-onkey
> +          - const: dlg,da9062-onkey # da9062-onkey fallback

Same comments here.

Cheers,
Conor.

> +  dlg,disable-key-power:
> +    type: boolean
> +    description:
> +      Disable power-down using a long key-press. If this entry exists
> +      the OnKey driver will remove support for the KEY_POWER key press
> +      when triggered using a long press of the OnKey.
> +
> +required:
> +  - compatible
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    #include <dt-bindings/interrupt-controller/irq.h>
> +    i2c {
> +      #address-cells =3D <1>;
> +      #size-cells =3D <0>;
> +      pmic@58 {
> +        compatible =3D "dlg,da9063";
> +        reg =3D <0x58>;
> +        interrupt-parent =3D <&gpio6>;
> +        interrupts =3D <11 IRQ_TYPE_LEVEL_LOW>;
> +        interrupt-controller;
> +
> +        onkey {
> +          compatible =3D "dlg,da9063-onkey";
> +          dlg,disable-key-power;
> +        };
> +      };
> +    };
> --=20
> 2.39.2
>=20

--K72JVjBk9/KxsZN8
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZWxoIAAKCRB4tDGHoIJi
0tz6AP4mtudWsVEas/2QjR8TZsTNWM0FnHR6Sclfbp69bQuskAD+PbqzaPURR6Oy
I/5izLjrJjSpmalS7oAAreZlpPBPFwg=
=6d1Q
-----END PGP SIGNATURE-----

--K72JVjBk9/KxsZN8--

