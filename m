Return-Path: <linux-input+bounces-3473-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 071A28BC4FD
	for <lists+linux-input@lfdr.de>; Mon,  6 May 2024 03:05:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id B717B282242
	for <lists+linux-input@lfdr.de>; Mon,  6 May 2024 01:05:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 610813C489;
	Mon,  6 May 2024 01:04:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="G2AatS4j"
X-Original-To: linux-input@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E2C23C488;
	Mon,  6 May 2024 01:04:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714957494; cv=none; b=SxDIFr01A8RoXu09pd0F6Pw2SGCRXt0guKtPgXFlkVbojdv5prqAR/VDYCtT4B3O3bDljaTu4gGCPQkjpGZEwKyi5Xq9gKLq3cLJ+NzEPTnhK093YuTsNmRabjDFqaKU0pACLOVvI1ZA/4pLg9CePh+KKrCPpFnLPClro4tDADM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714957494; c=relaxed/simple;
	bh=NHpCtIQwlM8cTic9kDCzoYH7Ozy85pD0cgtWUe/JlBc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=G88Nwp704pZAjHqauS1nhHLml6YdjhIsI1Eoza59z6LT7Y3T5oUD4P9uOiKibdgrfiCeWK9hnqELdaWcGFbHEert+xQKWQSLT/JoFPL1F5wyVNHwGXR+ZIA1eosfj3Nn8cExG/POMBzlvfqpEY1MtPiiYlUrjBolo1Umm/KD8O0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=G2AatS4j; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A18C3C116B1;
	Mon,  6 May 2024 01:04:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1714957493;
	bh=NHpCtIQwlM8cTic9kDCzoYH7Ozy85pD0cgtWUe/JlBc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=G2AatS4jrOUuwjZfRRhzOsClKeTGAxhmLhfZ4ZkK+UgD5FLjeWvNZO76Ikd/z9YNy
	 LdxgvkucwMP4BcLOI6mmC9UEZBbuxIcYwKsv7oQ61lsPvPe/c/Ld37nKTG4XNIbzMy
	 gasUZsbpdrPMeSMdPiwE7bfvKkB1lSwlVpBk41nZIZ/s+yvprmpGQ6XgZ8wWgreJBD
	 fldg++lf99e8IGEjfzlepgfcLJxvziF8CD83XYBCwUYOLEbMZsfyDDf8vtn/TW/jZg
	 lUUF9zENzSBfXxi0pFp5O6EU/wdB/34iwBDBJjAWqVdSyX36gY+ulTmCu/GdN4n1uo
	 Ke7a0V5GPwrTA==
Date: Mon, 6 May 2024 10:04:51 +0900
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
Subject: Re: [PATCH v6 3/5] regulator: add regulators driver for Marvell
 88PM886 PMIC
Message-ID: <ZjgssyGgidbZqnTq@finisterre.sirena.org.uk>
References: <20240504194632.2456-1-balejk@matfyz.cz>
 <20240504194632.2456-4-balejk@matfyz.cz>
 <ZjeidfoIbjvejphU@finisterre.sirena.org.uk>
 <D11XRKUAK8EM.20N91SDPCH584@matfyz.cz>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="3sMa8WqmsYkuK1l8"
Content-Disposition: inline
In-Reply-To: <D11XRKUAK8EM.20N91SDPCH584@matfyz.cz>
X-Cookie: lisp, v.:


--3sMa8WqmsYkuK1l8
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Sun, May 05, 2024 at 08:52:06PM +0200, Karel Balej wrote:

> Should I then drop this op and the max_uA values from all the
> regulators?

Probably, yes.

--3sMa8WqmsYkuK1l8
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmY4LLIACgkQJNaLcl1U
h9DOggf/VcOuHet4VFmvhvOFwQndK0oQrqMFCq2ZtZBU9GcZ453a9whAwaWfG0O4
LHmkL2EDofgCsIp7ZLcg3tIZ5EGb992TpwUwfy6VbZapG1YtZGhtkwQcm0mW5+XQ
G5gLILDLpBXW3s6c1d/4uCfxS7ynLpY3tr82JsActg7Rdwa4NIkn6JKY7QkfZAZF
rExf3g379ciwPUH2EBT1i6GmYOvrDXDfsksgXoPnudT0DCVFCU9foQP6X+RTK0pB
6iOEpTSlgIT3kvAjltqElSPtC0z0WUuuk6RRQommTC2q6gn2DjBMeiWFIqkbKY3X
qKQRZI5iav3QLk5U5xxSo8TwbeUljg==
=hD35
-----END PGP SIGNATURE-----

--3sMa8WqmsYkuK1l8--

