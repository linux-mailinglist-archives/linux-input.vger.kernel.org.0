Return-Path: <linux-input+bounces-12081-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 06206AA5062
	for <lists+linux-input@lfdr.de>; Wed, 30 Apr 2025 17:36:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id D54179E3E41
	for <lists+linux-input@lfdr.de>; Wed, 30 Apr 2025 15:35:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 79A4E253F32;
	Wed, 30 Apr 2025 15:35:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="r5ceQHyN"
X-Original-To: linux-input@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4AEF238FB9;
	Wed, 30 Apr 2025 15:35:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746027355; cv=none; b=coEk4eshj4fz8304smMJrhRD1HP7dcAxreadSnx0pBvdc+FcFyTlK6jnwIL+Tj6kQQMJRAsuFvGBzWy19Hx3CgSFyQjS14VNbkijSl70hGra9PyYlkGgPbeSdpTrlcq7+HLDM8B+foiXAbwjq8I4rYicK8ybQgZ+4jbHrEE/8C4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746027355; c=relaxed/simple;
	bh=E4eLF0gqeg015/VFrXyRmmvlnTyL9TgzOFYBD1S1a8s=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=rIOrC2hRq2QlJYLddjW+FgqZMrUiqnGJNga+iF+ns810bt9MxZ7VDH4pb7h0h8gq/6oIHuYwc28oky1B7oPQgGo1kRFCMs3gQ3uYbyY6ffZX8M3xDREyIQBkYnD0AGpKghWWkdpFeRLsG5DuK8p9RWbxRj6y5aMD0fjEQCBrPbY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=r5ceQHyN; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DEF86C4CEE7;
	Wed, 30 Apr 2025 15:35:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746027354;
	bh=E4eLF0gqeg015/VFrXyRmmvlnTyL9TgzOFYBD1S1a8s=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=r5ceQHyNhDZU73yWhuv9QXj1yTBEhFDK2vBtumT8Ihbf7G9eGcmLr+ONRu98LTaug
	 iPi1AxSIVR3X74sU54pBpaWHyqfkAf5UmlYvnA3Cx7fh861NViTqMv2lhWaBZYmtIl
	 YpPNcpznvxbf+GtWqrWd0gY4glqTCLff2cnsIHpHhcqdfULuqCblpVZOhOy85njOTO
	 UOo9eLdEVWrFA0csm1vLMqtsYuCQNtZ1Qwy/KzPn8zu027+a92E72ZVWwQHKBmsuw6
	 btBFAldBlFk17Mu+Dq7XF5x7y04Ku7qgLAoxeI/ExKf83QZ2H9l55NINYZZHMRG6a7
	 aIWBEPg9Abblw==
Date: Wed, 30 Apr 2025 16:35:50 +0100
From: Conor Dooley <conor@kernel.org>
To: Hans de Goede <hdegoede@redhat.com>
Cc: Esben Haabendal <esben@geanix.com>,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, linux-input@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 1/2] dt-bindings: input: touchscreen: goodix: Add
 no-reset-pull-up property
Message-ID: <20250430-gimmick-unreached-9910e383bb68@spud>
References: <20250429-goodix-no-reset-pull-up-v2-0-0687a4ad5a04@geanix.com>
 <20250429-goodix-no-reset-pull-up-v2-1-0687a4ad5a04@geanix.com>
 <20250429-effects-subscript-58eb41737816@spud>
 <67e9e989-b3e2-4a2c-9332-760b79f4fb15@redhat.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="pFVg0rIaerbpLnM8"
Content-Disposition: inline
In-Reply-To: <67e9e989-b3e2-4a2c-9332-760b79f4fb15@redhat.com>


--pFVg0rIaerbpLnM8
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Apr 29, 2025 at 05:42:46PM +0200, Hans de Goede wrote:
> Hi,
>=20
> On 29-Apr-25 17:31, Conor Dooley wrote:
> > On Tue, Apr 29, 2025 at 11:56:11AM +0200, Esben Haabendal wrote:
> >> This should be added for boards where there is no pull-up on the reset=
 pin,
> >> as the driver will otherwise switch the reset signal to high-impedance=
 to
> >> save power, which obviously not safe without pull-up.
> >>
> >> Signed-off-by: Esben Haabendal <esben@geanix.com>
> >> ---
> >>  Documentation/devicetree/bindings/input/touchscreen/goodix.yaml | 4 +=
+++
> >>  1 file changed, 4 insertions(+)
> >>
> >> diff --git a/Documentation/devicetree/bindings/input/touchscreen/goodi=
x.yaml b/Documentation/devicetree/bindings/input/touchscreen/goodix.yaml
> >> index eb4992f708b70fef93bd4b59b9565123f7c6ad5d..21ac13046b6e021eeb403d=
854aabc945801dd29f 100644
> >> --- a/Documentation/devicetree/bindings/input/touchscreen/goodix.yaml
> >> +++ b/Documentation/devicetree/bindings/input/touchscreen/goodix.yaml
> >> @@ -45,6 +45,10 @@ properties:
> >>    reset-gpios:
> >>      maxItems: 1
> >> =20
> >> +  goodix,no-reset-pull-up:
> >> +    type: boolean
> >> +    description: There is no pull-up on reset pin
> >=20
> > I have to wonder, why are these system using the reset property if the
> > reset is not usable? Shouldn't the property be omitted?
>=20
> The reset is usable, but it lacks an external pull-up resistor, so
> the driver cannot switch the gpio output on the CPU going to
> the touchscreen controller to input to save power as it does by default.

Ah, okay. The patch seems okay then.
Acked-by: Conor Dooley <conor.dooley@microchip.com>

--pFVg0rIaerbpLnM8
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaBJDVgAKCRB4tDGHoIJi
0i1HAQCcbDo4yETRhBL1Fw32PnKAwVdokORl5IDrgdrCPX6u7gEAwjmHnqwPs0ZS
fm/+26w3UZEEsO/I5ujG7z+COHjuIg0=
=qfB3
-----END PGP SIGNATURE-----

--pFVg0rIaerbpLnM8--

