Return-Path: <linux-input+bounces-644-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B18C80B3D3
	for <lists+linux-input@lfdr.de>; Sat,  9 Dec 2023 11:58:34 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id D84B31F21144
	for <lists+linux-input@lfdr.de>; Sat,  9 Dec 2023 10:58:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D68FE13AD8;
	Sat,  9 Dec 2023 10:58:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="OEqb5mZY"
X-Original-To: linux-input@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AFAA05671;
	Sat,  9 Dec 2023 10:58:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9FE68C433C8;
	Sat,  9 Dec 2023 10:58:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1702119507;
	bh=shMP58WBd4mK4VRt80ZFFRHtI8Ye/dBzaRFSsMTjqDw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=OEqb5mZYrDLrOdAlPG2lCYwcYIMg8S6cPlRrWy/l/8nK7b/8GHcmYKieiichGGNXS
	 aFi8TqjM8GFWA2USvCryR45vGpiJEOeZ5PhD1VoHyWrvQB3jctuxQ3DswAeu10owhI
	 wvu/GfzVkllpGtzi5FC86agD+1tMKlVBmnNKPX82vTAkPfdHUkQNCaEAbp8yJ+1BiY
	 wwFomvcW8DUqOXIXuekQi8A6NlqRr/3fKVingsgR0w9My/Ih7n1zTEIOITaRg4wdeE
	 lb/XNdQ2aHGeBdhTsyAWcZu5ve6Gmku3Xzo7VMjDiQsthR/fKl55f2GYY1ieZpU260
	 LwRKLN0r8ASZg==
Date: Sat, 9 Dec 2023 10:58:22 +0000
From: Conor Dooley <conor@kernel.org>
To: Karel Balej <karelb@gimli.ms.mff.cuni.cz>
Cc: Conor Dooley <conor.dooley@microchip.com>,
	Markuss Broks <markuss.broks@gmail.com>,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Henrik Rydberg <rydberg@bitmath.org>, linux-input@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	Duje =?utf-8?Q?Mihanovi=C4=87?= <duje.mihanovic@skole.hr>,
	~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
	Karel Balej <balejk@matfyz.cz>
Subject: Re: [PATCH v3 2/5] dt-bindings: input/touchscreen: Add compatible
 for IST3038B
Message-ID: <20231209-casing-music-bded1c7b5475@spud>
References: <20231202125948.10345-1-karelb@gimli.ms.mff.cuni.cz>
 <20231202125948.10345-3-karelb@gimli.ms.mff.cuni.cz>
 <20231203-outskirts-reformat-e0a833903841@spud>
 <0a035c62-9d35-4f85-b1f3-bcb7dea17d52@gmail.com>
 <20231204-stooge-impotent-fe8d2d9177e4@wendy>
 <CXJOLS2I8WH7.1IMVJGPUNG4VB@gimli.ms.mff.cuni.cz>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="CZZDMln35Xfb6FgC"
Content-Disposition: inline
In-Reply-To: <CXJOLS2I8WH7.1IMVJGPUNG4VB@gimli.ms.mff.cuni.cz>


--CZZDMln35Xfb6FgC
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sat, Dec 09, 2023 at 10:05:27AM +0100, Karel Balej wrote:
> On Mon Dec 4, 2023 at 1:52 PM CET, Conor Dooley wrote:
> > On Mon, Dec 04, 2023 at 02:40:44PM +0200, Markuss Broks wrote:
> > > On 12/3/23 13:20, Conor Dooley wrote:
> > > > On Sat, Dec 02, 2023 at 01:48:33PM +0100, Karel Balej wrote:
> > > > > From: Markuss Broks <markuss.broks@gmail.com>
> > > > >=20
> > > > > Imagis IST3038B is a variant (firmware?) of Imagis IST3038 IC,
> > > > > add the compatible for it to the IST3038C bindings.
> > > > This one is better, but would be well served by mentioning what
> > > > specifically is different (register addresses or firmware commands?)
> > >=20
> > > I don't think anyone knows this other than Imagis itself. I would gue=
ss it's
> > > different hardware, since register addresses are indeed different, bu=
t on
> > > the other hand, there is a possibility that firmware on the MCU could=
 be
> > > responding to those commands. I suppose "... IST3038B is a hardware v=
ariant
> > > of ... IST3038" would be more correct.
> >
> > Only Imagis might know the specifics, but you (plural) have made driver
> > changes so you know what is different in terms of the programming model.
> > I'm just asking for you to mention how the programming model varies in
> > the commit message. Otherwise I can't know whether you should have added
> > a fallback compatible, without going and reading your driver change. The
> > commit message for the bindings should stand on its own merit in that
> > regard.
> > "Variant" alone does not suffice, as many variants of devices have a
> > compatible programming model, be that for a subset of features or
> > complete compatibility.
> >
> > > The reason why I think it could be firmware-defined is because we hav=
e a lot
> > > of variants (30xxA, 30xxB, 30xxC, plain 30xx), and the numbers usuall=
y mean
> > > feature level/completeness, e.g. some don't support the touch pressur=
e or
> > > touchkeys, and we don't know what A/B/C/none means.
> >
> > Ultimately whether it is due to firmware or the hardware isn't
> > particular important, just mention what is incompatibly different.
>=20
> I propose to update the commit description as such:
>=20
> 	Imagis IST3038B is a variant (firmware?) of Imagis IST3038 IC
> 	differing from IST3038C in its register interface. Add the
> 	compatible for it to the IST3038C bindings.


SGTM. You can add
Acked-by: Conor Dooley <conor.dooley@microchip.com>
with that commit message update.

Thanks,
Conor.

--CZZDMln35Xfb6FgC
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZXRITgAKCRB4tDGHoIJi
0mKTAP0RiHYmJl2KkMmHaJTsYwSOJtsQ2l0qxVgrHUXBtSYHCAD/eA8UQ6V5QmRy
ZRugsrwMlJ2vJ8azdUm9Anq90NWd7wE=
=g/yN
-----END PGP SIGNATURE-----

--CZZDMln35Xfb6FgC--

