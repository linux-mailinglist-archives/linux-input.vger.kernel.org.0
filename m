Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6449B3074EC
	for <lists+linux-input@lfdr.de>; Thu, 28 Jan 2021 12:38:41 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231202AbhA1Lh1 (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 28 Jan 2021 06:37:27 -0500
Received: from mail.kernel.org ([198.145.29.99]:44168 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229597AbhA1Lh1 (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Thu, 28 Jan 2021 06:37:27 -0500
Received: by mail.kernel.org (Postfix) with ESMTPSA id B53D964DDA;
        Thu, 28 Jan 2021 11:36:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1611833806;
        bh=a1pl4yZDX8FPvw3cpwyHg1r7e84wJZBNZdKVzm8x6K4=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=TUC2K8gPUvmnzKZQzzuf+PemNlviY14vMimTRMCzM4brTI0nQP4x5OIE9V9p5ZxvU
         xZZscGYS89XTN/DIus3DgPKThBI9XoePeCP0qIvrD5uBj81hBq7RmjxtgTJNMw2Ryv
         PnUdUOLca2rxgHqu3hfq3iTkLjw6+WfJJVHRG1Ls8P7ZaQv1uOGJQp7OdtYVK3+Bak
         +al6UiQEUNoE6Q4mXGnVZ/SDO9Nok/gFL/q0RFKAc5N8dYiuL9kcyBSx7lurwNk1a3
         JOINsJRXSKTq4OIu0d7NY0w600qY0OtFV5diGt4tc82qeGvumhmgb9dkq59naSCJGa
         7AfUi6VWUindQ==
Date:   Thu, 28 Jan 2021 11:36:01 +0000
From:   Mark Brown <broonie@kernel.org>
To:     Andre Przywara <andre.przywara@arm.com>
Cc:     Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Maxime Ripard <mripard@kernel.org>,
        Chen-Yu Tsai <wens@csie.org>,
        Jernej Skrabec <jernej.skrabec@siol.net>,
        Samuel Holland <samuel@sholland.org>,
        Icenowy Zheng <icenowy@aosc.io>, Rob Herring <robh@kernel.org>,
        =?iso-8859-1?Q?Cl=E9ment_P=E9ron?= <peron.clem@gmail.com>,
        Shuosheng Huang <huangshuosheng@allwinnertech.com>,
        Yangtao Li <tiny.windzz@gmail.com>,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-sunxi@googlegroups.com, Lee Jones <lee.jones@linaro.org>,
        linux-input@vger.kernel.org
Subject: Re: [PATCH v5 05/20] Input: axp20x-pek: Bail out if AXP has no
 interrupt line connected
Message-ID: <20210128113601.GA4537@sirena.org.uk>
References: <20210127172500.13356-1-andre.przywara@arm.com>
 <20210127172500.13356-6-andre.przywara@arm.com>
 <YBHCF2tWIX4MeMia@google.com>
 <20210128104627.76b35a5c@slackpad.fritz.box>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="cNdxnHkX5QqsyA0e"
Content-Disposition: inline
In-Reply-To: <20210128104627.76b35a5c@slackpad.fritz.box>
X-Cookie: Do not pick the flowers.
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org


--cNdxnHkX5QqsyA0e
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Jan 28, 2021 at 11:11:28AM +0000, Andre Przywara wrote:
> Dmitry Torokhov <dmitry.torokhov@gmail.com> wrote:
> > On Wed, Jan 27, 2021 at 05:24:45PM +0000, Andre Przywara wrote:

> > > Check for the regmap_irqc member to be not NULL before proceeding with
> > > probe. This gets normally filled by the call to regmap_add_irq_chip(),
> > > which we allow to skip now, when the DT node lacks an interrupt
> > > property. =20

It sounds like you're trying to register an IRQ chip with a somehow
bogus configuration?

> > No, the driver is not the right place to patch this; regmap should be
> > fixed so it does not crash instead.

> I am not sure this is the right approach, those regmap functions look
> more like an internal interface to me, with lots of wrapper functions
> happily dereferencing pointers and reaching into structs. Moving
> NULL checks into those does not sound like the right thing. CC:ing Mark
> for more opinions on this.

Without having seen the actual issue if you're trying to register an
interrupt controller with a known broken hardware configuration that
does seem like something the caller just shouldn't be doing, it's not
something that's going to transiently happen at runtime and we're very
much trusting that the caller got things right.

> A more general solution would be to not instantiate this driver here
> at all, when we don't have an interrupt line.
> However at the moment the AXP MFD driver uses a const struct to hold
> all MFD cells, so there is no easy way of omitting the power key
> device dynamically. And even then it would hard code the requirement
> for an interrupt into the MFD driver, when this could be considered an
> implementation detail of the axp20x-pek driver.

Another approach is to just register the optional device separately.

--cNdxnHkX5QqsyA0e
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmASoaEACgkQJNaLcl1U
h9AQ/gf+MpX0pegJATN0VStaUHumZY023d5JzzKt3eqw1qf+/tSf8NdJGJTV9CZa
+91FikW/5M23AyOw2SxaT3waW9sm7ruTRIv0koHv3/G+XKzxrO9EUvulpDElhyHz
qTXmW1e8JXWhyGji473Ki4e/1CaBRbTpSj440I6gc0ZiY4DVNE2/uJPeDPOJ4ijG
gCk6s8H915DkQZnmHHzwbrXhz7uFXu3rXtq5PQ3ActDMJK1qQuPJW/KVq1mnpSLo
G3U1+ydOhvHZ2jd68kfP12TKXDKEP8h+oGF+YBMVJYUWvNh1swtlFNwNsP6qrnq/
aStCaC8z4Kf+6B3v0jksH+nUjXFFUw==
=ODfU
-----END PGP SIGNATURE-----

--cNdxnHkX5QqsyA0e--
