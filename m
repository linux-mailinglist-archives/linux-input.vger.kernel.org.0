Return-Path: <linux-input+bounces-3703-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id BF0A98C4F02
	for <lists+linux-input@lfdr.de>; Tue, 14 May 2024 12:29:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 4EEED1F216B1
	for <lists+linux-input@lfdr.de>; Tue, 14 May 2024 10:29:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E44B313443C;
	Tue, 14 May 2024 09:47:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ebZtsB3+"
X-Original-To: linux-input@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B791453E15;
	Tue, 14 May 2024 09:47:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715680022; cv=none; b=jqHH/7jmU+f+ZdwvLmGDwILedoMarpOTTnSBk5r4ITgya/SqCi3hGvODHuPtZxr7AP6o1VvyDryeVO8PVR/5Dd9a2v6GQ5hWPP7kfDWK+Q9Rqm8DVDK9YXcl79xbZlukxfTv9l9ekPOLKBLuUk/hSv6PIcMjIiosHNoHcD66+lo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715680022; c=relaxed/simple;
	bh=1Zdh3I3iV5/PfBYzP95f6ESpwYqR9hmPaBqIdpc80Os=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=aQwGGz1wpWjABiWddG3EVHrr3hsQ2zKWx10tjPiCvogagutcdnP+7IQoW0riLuMXdIysRIv68SGnIEE9/05JODV/HeDcxo1FXjBchtORTwJIOj3p6AxJWRzrLpSZYVXZXf5FFpzkP6ZHwCJcpeYSRNylU5SE7uX39v+2bzccGYw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ebZtsB3+; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BA5B1C32782;
	Tue, 14 May 2024 09:46:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1715680022;
	bh=1Zdh3I3iV5/PfBYzP95f6ESpwYqR9hmPaBqIdpc80Os=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ebZtsB3+Hv9eriC+r0eJ/3356apxrIQaXbLiyLZDcevp1g7Iff2R1fc8/pmU8Tcfh
	 4X+M6GKQzy35r38ADhYUL+zcUr23n/XXrk8plj4BDhjELOyfIPZ+7EFtdbvp4XtBCr
	 PZ0L5bgmeSryggK2PorkIuIpafdY4jLfrL7TTFwSU3WiMI1LbTskVbNjgfCL536dHW
	 F1DoJMaaZUAenqkPy9hWgxSvcQUoz8579hYES7RyrtqPMdkIMB/r2Ip51eHTIBbRHW
	 YgySYldZaPQrSy/Rd3CUDKyfpTm6mZr0ebRukPpjFMO1B7pf+iKNB9eObAYbeMpgEC
	 qcSG80+KWxkbA==
Date: Tue, 14 May 2024 10:46:29 +0100
From: Mark Brown <broonie@kernel.org>
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: Felix Kaechele <felix@kaechele.ca>, Job Noorman <job@noorman.info>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>, linux-input@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 3/5] input: himax_hx83112b: implement MCU register
 reading
Message-ID: <44570cd2-9540-47f8-a409-26220b0812fb@sirena.org.uk>
References: <20240511121245.109644-1-felix@kaechele.ca>
 <20240511121245.109644-4-felix@kaechele.ca>
 <ZkKb5_SRNwG1pRou@google.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="qIPUr/BZPS1Qo9uv"
Content-Disposition: inline
In-Reply-To: <ZkKb5_SRNwG1pRou@google.com>
X-Cookie: In the war of wits, he's unarmed.


--qIPUr/BZPS1Qo9uv
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, May 13, 2024 at 04:01:59PM -0700, Dmitry Torokhov wrote:
> On Sat, May 11, 2024 at 08:12:24AM -0400, Felix Kaechele wrote:
> > Implement reading from the MCU in a more universal fashion. This allows
> > properly handling reads of more than 4 bytes using the AHB FIFO
> > implemented in the chip.

> Mark, do we have anything in regmap to support this better or having a
> wrapper is the best solution here?

No, I've not seen something that explicitly requires toggling a burst
mode on and off to do a bulk operation.  Off the top of my head I'd
suggest just always leaving the burst mode enabled but I assume there's
some downside to doing that.  We could add something but I'm not sure if
it's worth it without having seen any other devices with the same need.

--qIPUr/BZPS1Qo9uv
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmZDMvUACgkQJNaLcl1U
h9CCogf/eDQCdhAa8JoQL0uKEvCPgYIHa+U0n7N0kt6REwUn7vSgK8Wiy9Z4wfyE
FqwL1PXqrv3pHNi9xn8/L+QhpAM2s2TEnVcAp7O4M2m5AlKIJPfzdg2hVBNCkBhu
1L/idQLya58JGKcrQn4/ukNdf37o9ZE9FyY0s1h8/SBmLQEGUQGVOuCbgQR4QXAU
/axeuus9qA+pbqmqhdV0vVJPrfwkLZxmOlwkTIbx6wbAodYY3KYV3z0z7onG7Hyo
wcZys6QN37X7UnZWwyMF57YMXDxVcYv4FoRASc1ILRwMv6ooBHlEA7Pw5MMHm1tr
m8lhLOwy3MPSOaiuufcJdRHR3py7fw==
=0n8h
-----END PGP SIGNATURE-----

--qIPUr/BZPS1Qo9uv--

