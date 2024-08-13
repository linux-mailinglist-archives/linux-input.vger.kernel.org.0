Return-Path: <linux-input+bounces-5550-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 94A5C950917
	for <lists+linux-input@lfdr.de>; Tue, 13 Aug 2024 17:28:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id DF91DB22354
	for <lists+linux-input@lfdr.de>; Tue, 13 Aug 2024 15:28:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7B4171A01D5;
	Tue, 13 Aug 2024 15:28:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="u8enr/xb"
X-Original-To: linux-input@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4CD1F19E831;
	Tue, 13 Aug 2024 15:28:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723562881; cv=none; b=jzoqadqo+foAvgKcP31FWJI6TG/7baqIN1jTh9CHgqrVSao1t6km8fUDWQGDMaygsh2NFhUl0+OkG9H9SSkoatVaG28lXYIJb5GZlljjJXhCYA+1ju9pJx/OfOvUgTTsGNfQ1P9RB8WlBrMPUf2/tSWoLVT4/i00eTVXzsAcIoA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723562881; c=relaxed/simple;
	bh=lSaC+RGCNUD3mMS/A24X19ve7lg70vhrG0nTFJ/Kvh8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=TierUZiTZdhKE3PTmB689gT+ydZxK2oBoZ678AH0YaGupgoek8oXL0yVySP1BnXAJYgWTSsiPdRpO3jyBGgxAZ7D5t7CFXMiWTNh0gXQGU5c1ibVChKGeN7uJGE8EKRAq2MgjQDVdBFpoMx2AqLdcTLA5+4/pMK8CFSGaBUh7Bg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=u8enr/xb; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 02178C4AF09;
	Tue, 13 Aug 2024 15:27:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1723562880;
	bh=lSaC+RGCNUD3mMS/A24X19ve7lg70vhrG0nTFJ/Kvh8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=u8enr/xbdSosS9TaP1PddYNKhtRrxJEB4uSbk1paDNP0a06nIorLqOENMzklWeP2u
	 IRjLdRmAB/2SQ9bm8XNuV+N9lDmO2smxmBjRjtVY534AZm6t5FlZVE6VC6uD8tUkIg
	 IlIoKM6jTWrbWdt/reNDlzkilPPHt3AwlYlN0uyPHW4h9vfbHy65WQLFsXPPNq16W3
	 IHHvHTealwqZ2cWYI0qD70kdqiP7wn2f8iJLuJ14tDRdtUazinLTteEHFFa+BCIJbC
	 WTGNYubVE0kpJCT0bv+uSy2K24+phKcC8S2Gym7Svfa0yDMON1EO39AcdYbC/SGGAE
	 uipzkxUcD6SZw==
Date: Tue, 13 Aug 2024 16:27:55 +0100
From: Conor Dooley <conor@kernel.org>
To: "Agarwal, Utsav" <Utsav.Agarwal@analog.com>
Cc: "Rob Herring (Arm)" <robh@kernel.org>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"Hennerich, Michael" <Michael.Hennerich@analog.com>,
	"Gaskell, Oliver" <Oliver.Gaskell@analog.com>,
	Conor Dooley <conor+dt@kernel.org>, "Sa, Nuno" <Nuno.Sa@analog.com>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"Bimpikas, Vasileios" <Vasileios.Bimpikas@analog.com>,
	Conor Dooley <conor.dooley@microchip.com>,
	"Artamonovs, Arturs" <Arturs.Artamonovs@analog.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	"linux-input@vger.kernel.org" <linux-input@vger.kernel.org>,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>
Subject: Re: [PATCH v10 3/3] dt-bindings: input: pure gpio support for adp5588
Message-ID: <20240813-talon-uproar-f27c6f194d59@spud>
References: <20240813-adp5588_gpio_support-v10-0-aab3c52cc8bf@analog.com>
 <20240813-adp5588_gpio_support-v10-3-aab3c52cc8bf@analog.com>
 <172354752239.384988.5705833300903132689.robh@kernel.org>
 <SJ0PR03MB634347015AE14A06A3837E199B862@SJ0PR03MB6343.namprd03.prod.outlook.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="UaxSKSzzvZNZC0gh"
Content-Disposition: inline
In-Reply-To: <SJ0PR03MB634347015AE14A06A3837E199B862@SJ0PR03MB6343.namprd03.prod.outlook.com>


--UaxSKSzzvZNZC0gh
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Aug 13, 2024 at 11:50:41AM +0000, Agarwal, Utsav wrote:
>=20
>=20
> > -----Original Message-----
> > From: Rob Herring (Arm) <robh@kernel.org>
> > Sent: Tuesday, August 13, 2024 12:12 PM
> > To: Agarwal, Utsav <Utsav.Agarwal@analog.com>
> > Cc: devicetree@vger.kernel.org; Hennerich, Michael
> > <Michael.Hennerich@analog.com>; Gaskell, Oliver
> > <Oliver.Gaskell@analog.com>; Conor Dooley <conor+dt@kernel.org>; Sa, Nu=
no
> > <Nuno.Sa@analog.com>; linux-kernel@vger.kernel.org; Bimpikas, Vasileios
> > <Vasileios.Bimpikas@analog.com>; Conor Dooley
> > <conor.dooley@microchip.com>; Artamonovs, Arturs
> > <Arturs.Artamonovs@analog.com>; Krzysztof Kozlowski <krzk+dt@kernel.org=
>;
> > linux-input@vger.kernel.org; Dmitry Torokhov <dmitry.torokhov@gmail.com>
> > Subject: Re: [PATCH v10 3/3] dt-bindings: input: pure gpio support for =
adp5588
> >=20
> > [External]
> >=20
> >=20
> > On Tue, 13 Aug 2024 10:51:33 +0100, Utsav Agarwal wrote:
> > > Adding software support for enabling the pure gpio capability of the
> > > device - which allows all I/O to be used as GPIO. Previously, I/O
> > > configuration was limited by software to partial GPIO support only.
> > >
> > > When working in a pure gpio mode, the device does not require the
> > > certain properties and hence, the following are now made optional:
> > > 	- interrupts
> > > 	- keypad,num-rows
> > > 	- keypad,num-columns
> > > 	- linux,keymap
> > >
> > > However, note that the above are required to be specified when
> > > configuring the device as a keypad, for which dependencies have been =
added
> > > such that specifying either one requires the remaining as well.
> > >
> > > Also, note that interrupts are made optional, but required when the d=
evice
> > > has either been configured in keypad mode or as an interrupt controll=
er.
> > > This has been done since they may not necessarily be used when levera=
ging
> > > the device purely for GPIO.
> > >
> > > Acked-by: Conor Dooley <conor.dooley@microchip.com>
> > > Signed-off-by: Utsav Agarwal <utsav.agarwal@analog.com>
> > > ---
> > >  .../devicetree/bindings/input/adi,adp5588.yaml     | 40 ++++++++++++=
++++++-
> > ---
> > >  1 file changed, 34 insertions(+), 6 deletions(-)
> > >
> >=20
> > My bot found errors running 'make dt_binding_check' on your patch:
> >=20
> > yamllint warnings/errors:
> > ./Documentation/devicetree/bindings/input/adi,adp5588.yaml:140:1: [erro=
r]
> > syntax error: could not find expected ':' (syntax)
> >=20
> > dtschema/dtc warnings/errors:
> > /builds/robherring/dt-review-
> > ci/linux/Documentation/devicetree/bindings/input/adi,adp5588.yaml: igno=
ring,
> > error parsing file
> > ./Documentation/devicetree/bindings/input/adi,adp5588.yaml:140:1: could=
 not
> > find expected ':'
> > make[2]: *** Deleting file
> > 'Documentation/devicetree/bindings/input/adi,adp5588.example.dts'
> > Documentation/devicetree/bindings/input/adi,adp5588.yaml:140:1: could n=
ot
> > find expected ':'
> > make[2]: *** [Documentation/devicetree/bindings/Makefile:26:
> > Documentation/devicetree/bindings/input/adi,adp5588.example.dts] Error 1
> > make[2]: *** Waiting for unfinished jobs....
> > make[1]: *** [/builds/robherring/dt-review-ci/linux/Makefile:1432:
> > dt_binding_check] Error 2
> > make: *** [Makefile:224: __sub-make] Error 2
> >=20
>=20
> Apologies, it seems like I accidently deleted the characters towards the =
end=20
> of the yaml file when making changes...

If you make any changes, particularly to an already reviewed binding,
please be sure to run the tests again before sending.

Thanks,
Conor.

--UaxSKSzzvZNZC0gh
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZrt7ewAKCRB4tDGHoIJi
0p8/AQDjN3yyk7fx+hDY5Wx3AXRyeMU9MulyUrmVqHY9obTKEAEAvpWCf+REWN74
6JVkj0utXBG+pqf8RMBacwhLLnwZ2Aw=
=KW6c
-----END PGP SIGNATURE-----

--UaxSKSzzvZNZC0gh--

