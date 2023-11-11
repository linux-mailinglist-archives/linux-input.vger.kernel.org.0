Return-Path: <linux-input+bounces-15-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E85C47E8B9F
	for <lists+linux-input@lfdr.de>; Sat, 11 Nov 2023 17:29:59 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 6C25AB20AF0
	for <lists+linux-input@lfdr.de>; Sat, 11 Nov 2023 16:29:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7277019BD0;
	Sat, 11 Nov 2023 16:29:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="fw0uxGpy"
X-Original-To: linux-input@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 519B614271;
	Sat, 11 Nov 2023 16:29:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E24C4C433C7;
	Sat, 11 Nov 2023 16:29:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1699720191;
	bh=hDeok4VwtGBImKqmRhCT3wLseQRJ3N3dIiy/AHeJ2jE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=fw0uxGpyLZFw4H1OobtInNXkdaJKsmTa3oW1GHxOusZI+voU54E5nAOX7PiCvAWmQ
	 0hWGkAzcaHokATBEZ8qM4IV2+zAlwyb+sWSwVbY4ZAhFbkvNv7KjAWIICJcPi7f5oF
	 gmJNarWQpcxUurPoeAsNZjkLDinttnXnebAjaVXRSWK+l+ApxyWUzxIJ3Hp/raMuFk
	 l40E/zSSHdg39zmQuooEFznADdSL5zwLZq5HLwWoBNxGfPrpaxJ4eTuGFT+bWN5Dme
	 n3LWbbgGJGkmou2nMh5j5w0DWQY0EjAsm/WE8Jy+vghnWafjAuRFIP4pv7Eqp0dD+5
	 Td0wQq4W8CDyw==
Date: Sat, 11 Nov 2023 16:29:49 +0000
From: Conor Dooley <conor@kernel.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Andi Shyti <andi.shyti@kernel.org>, linux-input@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] dt-bindings: input: samsung,s6sy761: convert to DT schema
Message-ID: <20231111-mothball-diploma-c034c0622bc6@squawk>
References: <20231111143221.55452-1-krzysztof.kozlowski@linaro.org>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="TOjGpG9yBBBwqB/s"
Content-Disposition: inline
In-Reply-To: <20231111143221.55452-1-krzysztof.kozlowski@linaro.org>


--TOjGpG9yBBBwqB/s
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sat, Nov 11, 2023 at 03:32:21PM +0100, Krzysztof Kozlowski wrote:
> Convert Samsung  S6SY761 touchscreen controller bindings to DT schema.
>=20
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Reviewed-by: Conor Dooley <conor.dooley@microchip.com>

Thanks,
Conor.

--TOjGpG9yBBBwqB/s
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEARYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZU+r+QAKCRB4tDGHoIJi
0pVoAQDtJ7zs05y0VmoVNpU0At08PqscThaQzG3jxWGhVKIWoAD/U203WC0BIUDe
Ctz+H0qBWmNRkoteTxxc/5qYk1pNsAA=
=8GRI
-----END PGP SIGNATURE-----

--TOjGpG9yBBBwqB/s--

