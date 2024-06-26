Return-Path: <linux-input+bounces-4649-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id DCE599187EE
	for <lists+linux-input@lfdr.de>; Wed, 26 Jun 2024 18:52:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 1AC121C21D7F
	for <lists+linux-input@lfdr.de>; Wed, 26 Jun 2024 16:52:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AA4CA18FC69;
	Wed, 26 Jun 2024 16:52:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="N96ji7Kd"
X-Original-To: linux-input@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7AA831F94C;
	Wed, 26 Jun 2024 16:52:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719420747; cv=none; b=V3BN61QqIA/xmRKhVHrYgsMnPw23u225ZH4fw9haUDWNdHTXPp+OJNQ77NZ4fPhPoFL/b8qUFivFylAC9KXNPmBtx9A9Pe7aYIBAPk55LV/vwMu/3dJgdZmNNzLaEGi5T1T9LAxG+6bFMPGWUCGXvzVkUWmtb4IXbLAZYLI9Cj0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719420747; c=relaxed/simple;
	bh=TIdk8ih+rwEk8JlU1qtpiYVbRilhcyOwVTxspbFsrmc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=e9qbCPMkvzk1/rAUSEvl2QDuduYJWRxQlpBA5xoyEv1oLAkygx/xWlpI+xO7WYi7s8nSpXmVrPJsil+i9Q7EF2p7S/fP2QhFQMk7GcrdJDKzz0TF1JNINNBigdzG+v2ha4TlhCkOzYB22b+FAbhXqcqR3E2ckEDHqW8928tDrd4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=N96ji7Kd; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 40F61C116B1;
	Wed, 26 Jun 2024 16:52:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1719420747;
	bh=TIdk8ih+rwEk8JlU1qtpiYVbRilhcyOwVTxspbFsrmc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=N96ji7KdDWcZdM48mx0LYQwdEd1axKSICgEAlt74lu4GC8n4ImV+WJSFtOC1dLBke
	 YusjogJYa2p6WbXXklTT5UJofBG/4CRlDz0BI+qQ+DbIYQG5Zf5RIC7RFOMKgr220l
	 Xq+ZxUSdYTCq7mzxpS8PNM4y+iG3bg0x3M1ju9N6YqQdiOlJGyr2LccLVdMgecjOuI
	 svn6cRCTtvKNNdk8BPA/5y8LBz3ZGGc6ui5QZzjTIT09yDx3G2RFEoiRiwFqoeWvv9
	 iIFSsOqh8Px01sXK7bORRdWLNDsJ1RTBaL8n94DJLknaZl5lGTw4HjEjhLeSEuJAEx
	 oYBrHbMgrhC1g==
Date: Wed, 26 Jun 2024 17:52:21 +0100
From: Mark Brown <broonie@kernel.org>
To: Karel Balej <balejk@matfyz.cz>
Cc: Lee Jones <lee@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Liam Girdwood <lgirdwood@gmail.com>, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-input@vger.kernel.org,
	Duje =?utf-8?Q?Mihanovi=C4=87?= <duje.mihanovic@skole.hr>,
	~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org
Subject: Re: [PATCH v7 3/5] regulator: add regulators driver for Marvell
 88PM886 PMIC
Message-ID: <84d91f93-9547-4462-9189-c8dd160269d4@sirena.org.uk>
References: <20240531175109.15599-1-balejk@matfyz.cz>
 <20240531175109.15599-4-balejk@matfyz.cz>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="Z7NQMbjQCTOn95WC"
Content-Disposition: inline
In-Reply-To: <20240531175109.15599-4-balejk@matfyz.cz>
X-Cookie: Results vary by individual.


--Z7NQMbjQCTOn95WC
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, May 31, 2024 at 07:34:58PM +0200, Karel Balej wrote:
> Support the LDO and buck regulators of the Marvell 88PM886 PMIC.

Reviewed-by: Mark Brown <broonie@kernel.org>

--Z7NQMbjQCTOn95WC
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmZ8R0QACgkQJNaLcl1U
h9AF2wf9EkJSUPrlYCeih/pCpLFDO3sKqUhJkUW3jYPysJUmw1f7fibeSSvwU6Qd
riynk8oIYSe+A5A6yT26DtQXrHYzeSEKB6CBS0JkBqBPNZpVJIkauHju1y8UYxDm
E7B88k6XFhd2US1yrufzm2G3xf1/f7oxf7idkrglQP+7d7KH9+UQ0OGreBVro+9P
wkPn4zLr+hPsjpken4szF9lFGw350edjDCyepVhPLAgCM0KYZIdNchFIySCS2gHI
QPFYwLkgqpmKWtO1D3MFh/1N7aN38MX6JgEoiAx6ljt7PxcT8onIhXpcjFDnPY3Q
DwNmUx7uq4k/36rLrYv1xid0h8qUEw==
=cdFk
-----END PGP SIGNATURE-----

--Z7NQMbjQCTOn95WC--

