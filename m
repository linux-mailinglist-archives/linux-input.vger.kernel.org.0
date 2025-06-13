Return-Path: <linux-input+bounces-12880-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 07939AD8ACF
	for <lists+linux-input@lfdr.de>; Fri, 13 Jun 2025 13:42:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 37E9D1897C5E
	for <lists+linux-input@lfdr.de>; Fri, 13 Jun 2025 11:42:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E7DD32D5C78;
	Fri, 13 Jun 2025 11:41:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ccZIF71k"
X-Original-To: linux-input@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C36782D8798
	for <linux-input@vger.kernel.org>; Fri, 13 Jun 2025 11:41:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749814912; cv=none; b=aeIn6dPOuPzT/Rr/+4izoAfxc9ugOihep4tIJPcOeEw1J1ifw2ZBeoBRcU2cl/QoqELAK9u8pKdn00no7IijWcV91uHUzM8Jq8b/CXnZ4hgM88KJTr9shyzn0OdJKufbCa9f4M7OLZBfG5JRxubeFlCHittfQbeJaSbFQFCEmLI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749814912; c=relaxed/simple;
	bh=JvxHgvcB3nSzEaxgXfB8FDGba7pU6EqFJIcHGkn1D5c=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=kbItLN3KnTZESgG4DI5ozbK5cOrBj6AwTJIKQSaCvfyi7q44Niamm78AL+kd5zEsgWTMXDTLfa7u69ue4iOq3D3K4a+285Oq00BxGq/ExVRz6xmQhzD+/1dZi71gixbPtW6900isfK0eSnQWFWSECWZ61l8VcsoEk98QxmPoW8I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ccZIF71k; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5B2D7C4CEE3;
	Fri, 13 Jun 2025 11:41:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1749814912;
	bh=JvxHgvcB3nSzEaxgXfB8FDGba7pU6EqFJIcHGkn1D5c=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ccZIF71k8IBmO0Q45U2sstfKWzo0ZqQENFy10tLm39pRfRjPoijGUcj0qYCOTgEIK
	 rdZDNlUXXL5iryimJnOK5vb8T69Ky/TZpzkTTARj+S2Gs/IxV7sn9wgB6W1VRcTr3t
	 3kGw7zOSbHg1Ng187C9Dy6qngr+qZmIK4gddDb3+LSYnWetJJB4WLJJ36Tw70r74GP
	 pckQZtkCRQdk0XkE71P7/zu5O8pPihjOqcKCAlUnvjrTuUUL3sSmS7Y0xEwJDq97Uo
	 3P2BSYky/WPpQmUaMFZ9f2pcMyH2hY3J1iSWGQhDXLiqaEpCriPVhOVxq44WLcxo3x
	 mjTX6yEgYrxGQ==
Date: Fri, 13 Jun 2025 12:41:47 +0100
From: Mark Brown <broonie@kernel.org>
To: shumingf@realtek.com
Cc: jikos@kernel.org, bentiss@kernel.org, linux-input@vger.kernel.org,
	flove@realtek.com, oder_chiou@realtek.com, jack.yu@realtek.com,
	derek.fang@realtek.com, ckeepax@opensource.cirrus.com,
	bard.liao@intel.com
Subject: Re: [PATCH 2/3] HID: core: Add bus define for SoundWire bus
Message-ID: <b83b96db-b577-41db-8cf6-d7b3b75739b5@sirena.org.uk>
References: <20250611102650.563137-1-shumingf@realtek.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="uMiW5rtzqRS/pkjU"
Content-Disposition: inline
In-Reply-To: <20250611102650.563137-1-shumingf@realtek.com>
X-Cookie: Use extra care when cleaning on stairs.


--uMiW5rtzqRS/pkjU
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Jun 11, 2025 at 06:26:50PM +0800, shumingf@realtek.com wrote:
> From: Charles Keepax <ckeepax@opensource.cirrus.com>
>=20
> SDCA (SoundWire Device Class for Audio) uses HID to convey
> input events from peripheral devices. Add a bus define for the
> SoundWire bus to prepare support for this.

Patch 3 depends on this one and it seems fairly straightforward - it
seems like it'd make sense to take it through the ASoC tree?

--uMiW5rtzqRS/pkjU
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmhMDnoACgkQJNaLcl1U
h9CK8Af+LIGm0FYKUUpCWBnX/J4QiAeYBVtOfpcR09HfGGfHb7CIUR7K8tq66UyA
lzt5l10KQb6GnrjmavcyIUB+XfwQ9xJaj5xlt+K7LqfpC9qSzubRWRc8Qv61fk+S
5a05yU/pGRgIrsp9ixw3KSZiS0Ew+Vf6CcxA8/3+bQdO4Cx2cQp1exwBt0Ixeko3
h6B1uzu1HCUTgPv2FiJfNRAnGXu71sNO1RF9gwwOZBBPP2ya9KT+3ljz1AnsoXXF
hWmabfH0I2MD1KQ74LdIuuGp88ZrcfTLwS1kmss1GxJ+602ExINJJbmE7hx1GjHg
JWEuVmY3tp8gmwpUz9DZTj7rkJqZxw==
=x/Pb
-----END PGP SIGNATURE-----

--uMiW5rtzqRS/pkjU--

