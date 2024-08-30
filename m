Return-Path: <linux-input+bounces-6025-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B937966402
	for <lists+linux-input@lfdr.de>; Fri, 30 Aug 2024 16:19:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id A8265B248B8
	for <lists+linux-input@lfdr.de>; Fri, 30 Aug 2024 14:19:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 81F4F1B14F4;
	Fri, 30 Aug 2024 14:19:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="jlMWYHa4"
X-Original-To: linux-input@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 58BD2190674;
	Fri, 30 Aug 2024 14:19:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725027556; cv=none; b=ZU6AS1wbnMpET4G4SQyECUQzaBy6q98b8YNhWFptrWGZLy/z6sf3vGw93b2pYNOqgyWnjhLiSoNRr7dUQBOJW1HtG/XYvXiGOiH4oJUffkMPGKT1Q5Ag+dGXYF9eKbtmC70ROD1gFIToWvNExE9Rq4SUh3qUkozhu1TPyyd+H+k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725027556; c=relaxed/simple;
	bh=sZFNbETcojyLYUDrsp7qeFCrKosskSFTBvc3U697p08=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Pj0cOwMKyOpTK38d/PpMRwSjYSf1Q8p3nQLbTRCje6yogRHSqJjFHEIlK07sZKrisvTf2Gvad1oRYZCq7dRuQxjpK0FDlT3O4tT2VZipX9suhK2QmZY9ANvSsDy2+zTDCpUeZusA0G2X8taHimeEfivbT8yi+i0b3DfIkjomXKk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=jlMWYHa4; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 45029C4CEC2;
	Fri, 30 Aug 2024 14:19:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1725027556;
	bh=sZFNbETcojyLYUDrsp7qeFCrKosskSFTBvc3U697p08=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=jlMWYHa4RYaxkafSF0ikTgB92RBMl+/Z9RWW3JpayX0fnrs+vtEa1R+yuL16mbQAs
	 9EcCAaFSn8+g7UEmmVTn+P7M7+9Xarq0ga2FCqbaYp4g0hfnZ1wC/d5Tf1b81r31MU
	 dori13HAPMn1MF+7vSLiLJbuZJyQbjZTTjY5HWKpJBKB105XGyGfwmi9xeg0lLY0wy
	 U5kxKcufwP98cy5NILJUjwhcRtV3neJftKRoiTULPro9Rs7LXzhTenj65a0Exeo4Bb
	 d5PzxMAtFeFoJY6+e0gWqqsFm3MFov0iFZp0FiyFOon8RBA3dC9oHNEIh1V93ruJnM
	 2Yq2tT5VWZCDQ==
Date: Fri, 30 Aug 2024 15:19:12 +0100
From: Conor Dooley <conor@kernel.org>
To: Fabio Estevam <festevam@gmail.com>
Cc: dmitry.torokhov@gmail.com, robh@kernel.org, krzk+dt@kernel.org,
	conor+dt@kernel.org, linux-input@vger.kernel.org,
	devicetree@vger.kernel.org, Fabio Estevam <festevam@denx.de>
Subject: Re: [PATCH 2/2] dt-bindings: input: touchscreen: goodix: Use generic
 node name
Message-ID: <20240830-dastardly-angelfish-2e0bf41564f4@spud>
References: <20240829183051.3392443-1-festevam@gmail.com>
 <20240829183051.3392443-2-festevam@gmail.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="O/sraEtSrBkiNbde"
Content-Disposition: inline
In-Reply-To: <20240829183051.3392443-2-festevam@gmail.com>


--O/sraEtSrBkiNbde
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Aug 29, 2024 at 03:30:51PM -0300, Fabio Estevam wrote:
> From: Fabio Estevam <festevam@denx.de>
>=20
> Node names should be generic.
>=20
> Improve the binding example by using 'touchscreen' as the node name.
>=20
> Signed-off-by: Fabio Estevam <festevam@denx.de>

Acked-by: Conor Dooley <conor.dooley@microchip.com>

--O/sraEtSrBkiNbde
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZtHU4AAKCRB4tDGHoIJi
0o5AAQDr8NR+usi/73G4xQ3sZThsc2tcTnCoLjGRMXdfx3LnSwEAkau6uBLlrnQS
X988fv52mDTTKCj+gORuGUO8FnNRZQQ=
=5P/k
-----END PGP SIGNATURE-----

--O/sraEtSrBkiNbde--

