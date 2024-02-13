Return-Path: <linux-input+bounces-1892-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 49918853BB2
	for <lists+linux-input@lfdr.de>; Tue, 13 Feb 2024 20:56:06 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id F2BAA1F2332A
	for <lists+linux-input@lfdr.de>; Tue, 13 Feb 2024 19:56:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3AF236088F;
	Tue, 13 Feb 2024 19:56:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="sI6Ay+Fi"
X-Original-To: linux-input@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0BBC960885;
	Tue, 13 Feb 2024 19:56:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707854161; cv=none; b=I01lbYL7qk9BswQN99Xn7MiFHMlKzLW38mwtBrkpjD6iAicGbRqDaPCoHGQXVqxxlpDqTkyc6o3u+8n2mzDgEJA3/Iv5i6i0LhMPAs+FjfOzawGAA6QhUHO4Z7lohR0SzuND7uniOH1jNx1YUDc0NWxP4RZf5PdKaEEa6I4A9pU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707854161; c=relaxed/simple;
	bh=JbDi2so13IXuNMzobsgV6oJhiET/FBG0pFLl8iib4Q4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Xj7HPjltgvD0WgDGdL9mfY/E8M51dJXLB8+8UWTIiqP+ZayXBs6ud+dWExrBknjOQpMXGFYY0b86g0WHNWDJGTDIk+/qSYYvQD0XKeoBFI4BeuSaH13IE85Vb/60dkWDSYWEGwEG9EdO6zLG5uySTQS3VXe/+xPlDrPemY6aOYs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=sI6Ay+Fi; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 075A8C433F1;
	Tue, 13 Feb 2024 19:55:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1707854160;
	bh=JbDi2so13IXuNMzobsgV6oJhiET/FBG0pFLl8iib4Q4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=sI6Ay+FixXlPKGrjdHtLGfd1Yc/jUTlYrZMTDv7TmEAnHJ/AI3OrciU/aRA22vO5n
	 3x/h0kFjKE7qpRhMPYlGay4djeujMAadMDxVwIook2WtVTLorsPJWtZBXkC9LOzLo3
	 0qaL8P8sdXJmGO/RqMvf4vfv5ixL39ahgTz43eO4HncXAPev1cxLnIdLHB5v42bIEy
	 z3E1pK5meTEYOdyvtkrm5LCitfZnpEvTcEqfhKxN2CMj5n4OXtgJRR6QsbzCbzPsfb
	 Xag1hUGhFosjhqZTB2oHnQY7I54mgpc5Sk8nQ9bgI1y8APIQj60T69ZuP28sLdn2Pw
	 pHGSUqaykuwcg==
Date: Tue, 13 Feb 2024 19:55:54 +0000
From: Mark Brown <broonie@kernel.org>
To: James Ogletree <jogletre@opensource.cirrus.com>
Cc: dmitry.torokhov@gmail.com, robh+dt@kernel.org,
	krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org,
	lee@kernel.org, jeff@labundy.com, patches@opensource.cirrus.com,
	linux-sound@vger.kernel.org, linux-input@vger.kernel.org,
	devicetree@vger.kernel.org
Subject: Re: [PATCH v7 5/5] ASoC: cs40l50: Support I2S streaming to CS40L50
Message-ID: <2e22f00a-fbf4-4e6d-8aed-dc78f423c735@sirena.org.uk>
References: <20240212173111.771107-1-jogletre@opensource.cirrus.com>
 <20240212173111.771107-6-jogletre@opensource.cirrus.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="wrai+nMFUwI6KUQf"
Content-Disposition: inline
In-Reply-To: <20240212173111.771107-6-jogletre@opensource.cirrus.com>
X-Cookie: Does not include installation.


--wrai+nMFUwI6KUQf
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Feb 12, 2024 at 05:31:11PM +0000, James Ogletree wrote:

> @@ -0,0 +1,311 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * CS40L50 Advanced Haptic Driver with waveform memory,

Please use C++ style for the whole comment to make things look more
intentional.

> +#define CS40L50_PLL_CLK_FRQ_32768	32768
> +#define CS40L50_PLL_CLK_FRQ_1536000	1536000
> +#define CS40L50_PLL_CLK_FRQ_3072000	3072000
> +#define CS40L50_PLL_CLK_FRQ_6144000	6144000
> +#define CS40L50_PLL_CLK_FRQ_9600000	9600000
> +#define CS40L50_PLL_CLK_FRQ_12288000	12288000

I'm not sure these defines add greatly to legibility, indeed they make
me wonder where the translation function is when we take a directly
specified clock value in...

> +	switch (clk_src) {
> +	case CS40L50_PLL_REFCLK_BCLK:
> +		ret = cs40l50_get_clk_config(codec->sysclk_rate, &clk_cfg);
> +		if (ret)
> +			return ret;
> +		break;

We appear to have a set_sysclk() operation but this is saying the sysclk
is BCLK?  Should the driver be using the bclk_ratio() interface rather
than set_sysclk(), especially given that the device only appears to
support either 32.768kHz with no audio or 48kHz and a rather restrictive
set of multiples of that for the clock?

> +	case CS40L50_PLL_REFCLK_MCLK:
> +		clk_cfg = CS40L50_PLL_CLK_CFG_32768;
> +		break;

MCLK is always 32.768kHz?

> +static int cs40l50_set_dai_fmt(struct snd_soc_dai *codec_dai, unsigned int fmt)
> +{
> +	struct cs40l50_codec *codec = snd_soc_component_get_drvdata(codec_dai->component);
> +
> +	if ((fmt & SND_SOC_DAIFMT_MASTER_MASK) != SND_SOC_DAIFMT_CBS_CFS)
> +		return -EINVAL;

Please use the modern names, the device is a clock consumer (it would be
nice if someone from Cirrus could update your drivers...).

> +static struct platform_driver cs40l50_codec_driver = {
> +	.probe = cs40l50_codec_driver_probe,
> +	.driver = {
> +		.name = "cs40l50-codec",
> +	},
> +};
> +module_platform_driver(cs40l50_codec_driver);
> +
> +MODULE_DESCRIPTION("ASoC CS40L50 driver");
> +MODULE_AUTHOR("James Ogletree <james.ogletree@cirrus.com>");
> +MODULE_LICENSE("GPL");

There's nothing here that ensures the driver autoloads, you need to
either a MODULE_DEVICE_TABLE or a MODULE_ALIAS.

--wrai+nMFUwI6KUQf
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmXLyUoACgkQJNaLcl1U
h9BvnAf+OUvtPK0FIEzxx0lWqdFm8SX2xBXfZuhID6vsBzvBncqEv3x0iT0yWtZW
kYmPdTUmJJ9A3+HkUIFeBnSmNcf6v1sEuW7uk7m77QU0y5PldT2nu3F7mqDaVXUB
34dS0X0FLQNGoxX3Oe1VCDopoWaRPUKmv4d1zSEZ9tKT+Z+a3/FMjnC5045ezHF8
IqiPCWIVi/CQpXsmhnLnkN9tRBKE8ADvY1yWP6UFBLW8HU1E7N2fJEVyFo2xvVnV
9kpOtTajVqCqgH7LhOI2taMDvaXOLLeuQqgqs1p8tQqf7toqznuXbnN3w1rILDVV
3+QcQXQK7nj/CCNnQKmn2Kf1w8c3Nw==
=WcOy
-----END PGP SIGNATURE-----

--wrai+nMFUwI6KUQf--

