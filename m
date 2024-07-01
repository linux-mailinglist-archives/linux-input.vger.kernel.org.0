Return-Path: <linux-input+bounces-4767-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id B03C391E2A9
	for <lists+linux-input@lfdr.de>; Mon,  1 Jul 2024 16:42:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 5E2A31F21398
	for <lists+linux-input@lfdr.de>; Mon,  1 Jul 2024 14:42:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9121C16B3B7;
	Mon,  1 Jul 2024 14:42:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Es6ZvAts"
X-Original-To: linux-input@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5EF584696;
	Mon,  1 Jul 2024 14:42:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719844961; cv=none; b=Wv0lvCC11h8mD2kgsRvavWPyUbssqvskV/CTJRNfEq17z4Q2tc5GUNBiOq/phhVzFzZDj9txDS8oL2J3sqCV6TLV/HDGUueQc1vjXspD43v7Vhgs18qLXxKXGOxT9OyisHuKawqwN1U2koZ3z/NTw5OLki0tJHik+dEiGStxqlc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719844961; c=relaxed/simple;
	bh=oqreuN7Lmf3KZB06NiHnlq3XgvAne96Q0HZLnxU1cvA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=cetDsoaMvwzi8W9hhDbN5E8LUWMYgDwpGNmwtbde3BHQwDWiyciQo7/zZfC+4qqu6SkXmsAvcsmUylFs89e6r+CqYTrT+awDdsa1mGXvYem/dLPbFnKC+KBPJsi1zL4baVpUIFcQzk4uhe1/tFsgxYxnHmRx5x2WITq/v//Yu7k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Es6ZvAts; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3A929C116B1;
	Mon,  1 Jul 2024 14:42:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1719844961;
	bh=oqreuN7Lmf3KZB06NiHnlq3XgvAne96Q0HZLnxU1cvA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Es6ZvAtss93UUyTV0/C5Kq7xcHV2mMr7W2uHGzC8FpKbNdC+jdwp2ciIC5jj/WLlr
	 FyJlaV6yEroIgDjOJcuzd9aP6IUmM5Sp6czY1Awasc8IPqdGjj19lmJ1PoKJQekKjF
	 iO8Evf/hfcQCmvr2bAjQTBrWOLxgdGAf4UNc7gokAoLxG4XDH0ROZNiDmRHlstPjTK
	 RYuYX45Ln2d79925pclof5E9V0BwvtKu0XXZGfSh1PNR9rQGijypIVTJJfg19nB3Ou
	 eOYGsfaO+Ws94mFfXxKN7LCu/yzJU5xXxZNZxLrtd2oRTkk6rkoTKotFrck44To5RZ
	 tLuvqQyHCPFuA==
Date: Mon, 1 Jul 2024 15:42:37 +0100
From: Conor Dooley <conor@kernel.org>
To: Philipp Zabel <p.zabel@pengutronix.de>
Cc: Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, linux-input@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	kernel@pengutronix.de
Subject: Re: [PATCH v2 1/2] dt-bindings: input: touchscreen: exc3000: add
 EXC81W32
Message-ID: <20240701-evolve-unbutton-ef7d913ad69f@spud>
References: <20240628-input-exc3000-exc81w32-v2-0-c2b21a369c05@pengutronix.de>
 <20240628-input-exc3000-exc81w32-v2-1-c2b21a369c05@pengutronix.de>
 <20240628-agonizing-syrup-fcd55c441b3f@spud>
 <150055844b8af2017fa721ff08bbde473354b2da.camel@pengutronix.de>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="oXw+Hz09N3mxcR0V"
Content-Disposition: inline
In-Reply-To: <150055844b8af2017fa721ff08bbde473354b2da.camel@pengutronix.de>


--oXw+Hz09N3mxcR0V
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Jul 01, 2024 at 02:47:50PM +0200, Philipp Zabel wrote:
> Hi Conor,
>=20
> On Fr, 2024-06-28 at 17:21 +0100, Conor Dooley wrote:
> > On Fri, Jun 28, 2024 at 10:35:51AM +0200, Philipp Zabel wrote:
> > > Add compatible for EXC81W32 touchscreen controllers.
> >=20
> > Could you please mention in your commit messages what makes a fallback
> > compatible inappropriate here?
>=20
> thank for pointing this out. Actually, I'm not sure a fallback
> compatible is inappropriate at all. There just is none currently, even
> though EXC80H60 and EXC80H84 already look compatible to me.
>=20
> To my understanding, there's EXC80[WH]{32,46,60,84} models, that should
> only differ in ball pitch (W or H) and targeted display size (the last
> number).
> I don't know if there are actual relevant differences between what I
> assume are model generations, such as EXC80 to EXC81. At least the
> limited currently implemented feature set in the exc3000 driver is
> identical.
>=20
> Given that EXC80H60, EXC80H84, and now EXC81W32 all share the same 16K
> resolution and the same message format (possible differences in
> capability to measure touch area nonwithstanding), should I prepend
> this series with a patch:

If you're prepared to update the two users to avoid adding more
dtbs_check warnings, sure.

Thanks,
Conor.

>=20
> @@ -14,10 +14,13 @@
> =20
>  properties:
>    compatible:
> -    enum:
> -      - eeti,exc3000
> -      - eeti,exc80h60
> -      - eeti,exc80h84
> +    oneOf:
> +      - const: eeti,exc3000
> +      - items:
> +          - enum:
> +              - eeti,exc80h60
> +          - const: eeti,exc80h84
> +      - const: eeti,exc80h84
>    reg:
>      const: 0x2a
>    interrupts:
>=20
> regards
> Philipp

--oXw+Hz09N3mxcR0V
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHQEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZoLAXQAKCRB4tDGHoIJi
0kfdAPinlDksflI+CZ0V7RLLNE6TzTiZAcuSVA8xrHNj8sd+AP4/QgKGeSLOwa2n
NxYwmgWXdF5eK9yJeua4gyd0PjUSBg==
=eq1X
-----END PGP SIGNATURE-----

--oXw+Hz09N3mxcR0V--

