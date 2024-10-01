Return-Path: <linux-input+bounces-6944-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D11E98BD1F
	for <lists+linux-input@lfdr.de>; Tue,  1 Oct 2024 15:13:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 419A01F22920
	for <lists+linux-input@lfdr.de>; Tue,  1 Oct 2024 13:13:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1E7441C32E7;
	Tue,  1 Oct 2024 13:13:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="PxpYomJt"
X-Original-To: linux-input@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E9AEC1C2330;
	Tue,  1 Oct 2024 13:13:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727788393; cv=none; b=m8ibiAVRwwaftviJpqnNmL/Ed0FcVOro7ZAvFqQ/EqBcGg8U/hZYw2eU0eeYncddVGLNCFbNUxpdw8YWRpOic+MbojEbMHwdyzjX1tjxBHCf45xahmUey0irrqLbI3JTsCqU9vpLRaljRqH/BkJyQcENHXRphhzYxBW5tMrXuy0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727788393; c=relaxed/simple;
	bh=W8ghwVwmar4eOYUmX5B9j0WuQw2VG2mdttchaRv44xU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=PyMTkI6xweGIq12E5LMMKSUIiJTOtLVcyzvLbeDEefn5mmw47QjQl3i4l1Th+4ngi/WXtAvs61IQHe9Y1uGlvyP+VS62QqwPhoq825btkmB9jVNSlyzuF5JecBffCa6iP0BWLsNndWMb/tjHFj87mzeqPOOrsPIRUyzk5jutlwY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=PxpYomJt; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7127BC4CEC6;
	Tue,  1 Oct 2024 13:13:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1727788392;
	bh=W8ghwVwmar4eOYUmX5B9j0WuQw2VG2mdttchaRv44xU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=PxpYomJtpwFkooPJYd7Fo0Lp9iPFH52dAgKNq9dZqG1cZA0yozuf8Oo4dWMVVF15V
	 ytb/19KCDZtrHFJjKlJh+nh1YtMcn6r/nYKOmJoS1ZH4BvaElLf8smTA776xMwUYtr
	 91iAcC9xzSmpaU6NBF06Dc6/fm8HOdzlP1ikx7Ra8H5jGT6Yc1gwrkJpg+wyI8XlHh
	 9T0LyCcpgY3Bkq9ubCbehhT1eZbv328o9VJc9W0yeJXCaG9pkhkSYlIOqcTS7lJHa8
	 wMJS1zh0N0SibhckRZY+NrOgOwIpTfWUrUabQET2kdcrmvuApxAxXPKk72zMI/Aq84
	 vQDiwb2Ay06yw==
Date: Tue, 1 Oct 2024 14:13:08 +0100
From: Mark Brown <broonie@kernel.org>
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: Chen-Yu Tsai <wenst@chromium.org>, linux-input@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Subject: Re: [PATCH] Input: elan_i2c - Wait for initialization after enabling
 regulator supply
Message-ID: <6626b1f3-7c3a-4531-b006-9e29155025f0@sirena.org.uk>
References: <20241001093815.2481899-1-wenst@chromium.org>
 <ZvvHdlD6E5bzsWwV@google.com>
 <ZvvX5KcKaVBLedD1@finisterre.sirena.org.uk>
 <ZvvyEux8f2ylRQOn@google.com>
 <7db1299f-f925-4689-806f-f1ea4191fd4c@sirena.org.uk>
 <Zvv1FuXBZpjDefb8@google.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="h3gsj/MN+E0Fcf3v"
Content-Disposition: inline
In-Reply-To: <Zvv1FuXBZpjDefb8@google.com>
X-Cookie: Even a hawk is an eagle among crows.


--h3gsj/MN+E0Fcf3v
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Oct 01, 2024 at 06:11:50AM -0700, Dmitry Torokhov wrote:
> On Tue, Oct 01, 2024 at 02:06:19PM +0100, Mark Brown wrote:

> > Yeah, but that's got to get washed through the individual system
> > firmwares to get deployed and my confidence in vendors is not high.

> I think native Elan is only used in Chromebooks where firmware is
> decent, the rest are I2C-HID.

Ah, OK - in that case I agree there should be no problems with ACPI.

--h3gsj/MN+E0Fcf3v
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmb79WQACgkQJNaLcl1U
h9C0gAf/UvWgb06F4oVn6jHF+ko908f4HFveFOTbNiT6raI8r4DoVrYGq9fTi17E
ukCv2sW9PCBsw8jRiKgKMnCagMiBcPV1gbJbKqv3k48LMGp7pRK7st4IVApVaW8G
kK7HoOjYCKRtH/MRujrUrEXLUD2UM1AH2pP0ZmDki3nKe31iKCgZA+0A4vbiFV3h
SWjX0oT9cLS+wN0jrZ29bZ33UfTMNBoZPSJS1f2pURn331VLiHslp8FvRhThRB7A
rp/18eqr0fclvuxaCxI6LFwjpd2h3HppbrrrSj+bDgwNvP7uul6py40MPjwjriMT
jSPXKK09gDwGMau1Ya3ErIslX4NofA==
=n6ix
-----END PGP SIGNATURE-----

--h3gsj/MN+E0Fcf3v--

