Return-Path: <linux-input+bounces-6024-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id E10469663FF
	for <lists+linux-input@lfdr.de>; Fri, 30 Aug 2024 16:19:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 960E61F2137D
	for <lists+linux-input@lfdr.de>; Fri, 30 Aug 2024 14:19:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DAE631B2516;
	Fri, 30 Aug 2024 14:19:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Z8V50+bg"
X-Original-To: linux-input@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B106B1A3BCE;
	Fri, 30 Aug 2024 14:19:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725027541; cv=none; b=APIqWmE2POY3WEaMwirN7BXdaIiL0n7Stu9FyMt0pr0rpJ01SdGnrU16f7A/Ge/T0QozQNjzLQOjWGlY3PIN/rMN/Vv0a6/5aMHn6aeHgbDcTtShx6iu0oRPVFbvg40mKRBuW4qw7fMjeZsvj5aWg9FA4Jr+2kiM3GSxvfCp6YQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725027541; c=relaxed/simple;
	bh=0PsTYKN2GvvZElpzAP5zs7VbwqYLL9oA04VFW87K4tM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=TgjWsC8ij+dKSxelLU7UXqx+FF3sVCyif8odwdBHKDFoipWSYybKjIwEGWc2AekYgmw8n1v9eVXUqKVjHvX/a6fskQQkNqbpcPrZgWEWmEtB90c/ZuiOL7TdbGBXh9zzzvB7xMf/8vb+8Prj3p3v1qZnXFs2o8fbIHUBOtBluj0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Z8V50+bg; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6F563C4CEC2;
	Fri, 30 Aug 2024 14:18:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1725027541;
	bh=0PsTYKN2GvvZElpzAP5zs7VbwqYLL9oA04VFW87K4tM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Z8V50+bgFCQoicW4BZoHaYvsH27EvTP3pSRAwE0s+dfEhd5+jBlV9k2vuruk/RVJk
	 3UtUfZgq349yFZRauVtQttuHfJDWKp0B8z8OzEJDYloz+ViIy0GbsV/q7yr4571KH0
	 8B138c8eLzv67LkVl+5gP4hnPedhWxy62u2pXnAXvVvRd+viHEyyq1CNgguEQdNVUT
	 IYZBHNaeUzYFT5fFLhw1q2CM0hKYjCDxR1hPQFn+wymxIy2yNVnZxt68jqYjXtUmDS
	 toHqLtTfEpvBHqCF1/YGaAi96TsFkItYwmGfDmk03FyHiAuMwS9Oz9g5DDjoQr/BlE
	 cswSpQUwTQ60Q==
Date: Fri, 30 Aug 2024 15:18:57 +0100
From: Conor Dooley <conor@kernel.org>
To: Fabio Estevam <festevam@gmail.com>
Cc: dmitry.torokhov@gmail.com, robh@kernel.org, krzk+dt@kernel.org,
	conor+dt@kernel.org, linux-input@vger.kernel.org,
	devicetree@vger.kernel.org, Fabio Estevam <festevam@denx.de>
Subject: Re: [PATCH 1/2] dt-bindings: input: touchscreen: iqs7211: Use
 'touchscreen' as node name
Message-ID: <20240830-sibling-spool-51876fd62bb1@spud>
References: <20240829183051.3392443-1-festevam@gmail.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="uVMgVG3BATegWW92"
Content-Disposition: inline
In-Reply-To: <20240829183051.3392443-1-festevam@gmail.com>


--uVMgVG3BATegWW92
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Aug 29, 2024 at 03:30:50PM -0300, Fabio Estevam wrote:
> From: Fabio Estevam <festevam@denx.de>
>=20
> 'touchscreen' is the recommended node name, not 'touch'.
>=20
> Fix it accordingly.
>=20
> Signed-off-by: Fabio Estevam <festevam@denx.de>

Ultimately I feel acking this is pointless given how trivial it is, I
wouldn't want a trivial patch held up by the lack of one.
Acked-by: Conor Dooley <conor.dooley@microchip.com>

--uVMgVG3BATegWW92
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZtHU0QAKCRB4tDGHoIJi
0tkjAQDqVMXzE45CUR57tRuT+qPV5xin8Kdr+BcH0vbtQBs8GgD/T8csm3QYtdep
JMUe5s39uLeuBHB2VrryuuOdQYHGFwU=
=utj5
-----END PGP SIGNATURE-----

--uVMgVG3BATegWW92--

