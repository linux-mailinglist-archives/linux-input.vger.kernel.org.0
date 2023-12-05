Return-Path: <linux-input+bounces-499-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 8AF20805AA0
	for <lists+linux-input@lfdr.de>; Tue,  5 Dec 2023 18:01:53 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 3D73F1F21714
	for <lists+linux-input@lfdr.de>; Tue,  5 Dec 2023 17:01:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0E54C63DFF;
	Tue,  5 Dec 2023 17:01:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="fR2Hc/Os"
X-Original-To: linux-input@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE15763DF8;
	Tue,  5 Dec 2023 17:01:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 438B8C433C8;
	Tue,  5 Dec 2023 17:01:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1701795708;
	bh=hvoZmvi5kVxk0mKJg/p4H7TFldJx6GDXwB6b10p0uR4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=fR2Hc/OslizATX35uwXnI7Yz3TsBy2irvFrhCksyJFJeKU7QY3Pv6S1TiijifowEi
	 NKF9D7AFAqoMoxJ7sCnsaylG3pihVGZiJUGDjsxpb2QAI5MkLTZ1pjLTyWW0CbMcXd
	 ivXTpjZKGhOD9bJ7pOPudMirLdpL6WP6rZPx9VKjM0kdtFfeaVpZlakvloRnIHNXYl
	 PIG6C6EAgDcIR6PIhfJbGpxhMGIxHNbyXmqORzU4Y1w4hAZ0wkaAuvBEWXLcCVTGl5
	 DMmPmopRNYUVpWEWMZeJLZnTfbpnhUTd2DgGsXiDOV7ms2Ax9WmPUD4I48Y0uXlIS9
	 A1eFJEWJsvpKA==
Date: Tue, 5 Dec 2023 17:01:43 +0000
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
Subject: Re: [PATCH v3.1 5/8] dt-bindings: input: Convert da906{1,2,3} onkey
 to json-schema
Message-ID: <20231205-mobilize-eldercare-868f30da5018@spud>
References: <20231204172510.35041-1-biju.das.jz@bp.renesas.com>
 <20231204172510.35041-6-biju.das.jz@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="EOW+nDDhcTc8iYm6"
Content-Disposition: inline
In-Reply-To: <20231204172510.35041-6-biju.das.jz@bp.renesas.com>


--EOW+nDDhcTc8iYm6
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Dec 04, 2023 at 05:25:07PM +0000, Biju Das wrote:
> Convert the da906{1,2,3} onkey device tree binding documentation to
> json-schema.
>=20
> Update MAINTAINERS entries, description and onkey property by
> referring to dlg,da9062-onkey binding file.
>=20
> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
> ---
> v3->v3.1:
>  * Squashed with patch#6 and patch#9 from v2.
>  * Replaced enum->const for dlg,da9061-onkey and its fallback.
>  * Dropped example

I think this looks good
Reviewed-by: Conor Dooley <conor.dooley@microchip.com>

Cheers,
Conor.

--EOW+nDDhcTc8iYm6
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZW9XdwAKCRB4tDGHoIJi
0lIGAQDo5aN83IrA9nHWbyIhxaqc8rLOnl9ey0qNKRcC3jTXUgEAwFsn3VUZCK8j
2YPZeSTnjUf6JZtL0DDYVPkgf56P9g0=
=h6KR
-----END PGP SIGNATURE-----

--EOW+nDDhcTc8iYm6--

