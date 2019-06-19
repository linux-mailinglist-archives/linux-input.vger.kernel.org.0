Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 5BD7A4BF91
	for <lists+linux-input@lfdr.de>; Wed, 19 Jun 2019 19:23:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726628AbfFSRXb (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 19 Jun 2019 13:23:31 -0400
Received: from heliosphere.sirena.org.uk ([172.104.155.198]:34244 "EHLO
        heliosphere.sirena.org.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726197AbfFSRXb (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Wed, 19 Jun 2019 13:23:31 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=sirena.org.uk; s=20170815-heliosphere; h=In-Reply-To:Content-Type:
        MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
        Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
        Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
        List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
         bh=ZdyKJefKksJcZzzDwm+zQaX0WcoP2gis50R6eVF/GiE=; b=Eb8dSyDI6afHhDJ5b45O1Ymkz
        AIr8y+4euiGcmjwpoi6Lg/9p4TwYz+hXJLENHI5VvS9QghDTljESu4QRvRhE0K9SMPuiFEZU1hsIq
        IOOaGQrydiQ7QCxY0viFOHp9SqTah6Rn1dt1eWPkj/mPKMkKuKYms+r7BjiVmIc32wW2U=;
Received: from [2001:470:1f1d:6b5:7e7a:91ff:fede:4a45] (helo=finisterre.sirena.org.uk)
        by heliosphere.sirena.org.uk with esmtpsa (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.89)
        (envelope-from <broonie@sirena.org.uk>)
        id 1hdeIt-0007e8-HO; Wed, 19 Jun 2019 17:23:23 +0000
Received: by finisterre.sirena.org.uk (Postfix, from userid 1000)
        id BD76C440046; Wed, 19 Jun 2019 18:23:22 +0100 (BST)
Date:   Wed, 19 Jun 2019 18:23:22 +0100
From:   Mark Brown <broonie@kernel.org>
To:     Fabien Parent <fparent@baylibre.com>
Cc:     robh+dt@kernel.org, mark.rutland@arm.com, matthias.bgg@gmail.com,
        lee.jones@linaro.org, lgirdwood@gmail.com,
        dmitry.torokhov@gmail.com, linux-input@vger.kernel.org,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 5/7] regulator: mt6392: Add support for MT6392
 regulator
Message-ID: <20190619172322.GX5316@sirena.org.uk>
References: <20190619142013.20913-1-fparent@baylibre.com>
 <20190619142013.20913-6-fparent@baylibre.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="KGCJ2evWaA3eb4zZ"
Content-Disposition: inline
In-Reply-To: <20190619142013.20913-6-fparent@baylibre.com>
X-Cookie: Editing is a rewording activity.
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org


--KGCJ2evWaA3eb4zZ
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Jun 19, 2019 at 04:20:11PM +0200, Fabien Parent wrote:

> connectcts as a slave to a SoC using SPI, wrapped inside PWRAP.
>=20
> Signed-off-by: Fabien Parent <fparent@baylibre.com>

This has your signoff...

> +++ b/drivers/regulator/mt6392-regulator.c
> @@ -0,0 +1,490 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * Copyright (c) 2019 MediaTek Inc.
> + * Author: Chen Zhong <chen.zhong@mediatek.com>
> + */

=2E..but someone else from a different company wrote it?  Also please make
the entire header a C++ one so this looks more consistent.

> +static const u32 ldo_volt_table2[] =3D {
> +	3300000, 3400000, 3500000, 3600000,
> +};

This looks like a linear range?

> +static int mt6392_get_status(struct regulator_dev *rdev)
> +{
> +	int ret;
> +	u32 regval;
> +	struct mt6392_regulator_info *info =3D rdev_get_drvdata(rdev);
> +
> +	ret =3D regmap_read(rdev->regmap, info->desc.enable_reg, &regval);
> +	if (ret !=3D 0) {
> +		dev_err(&rdev->dev, "Failed to get enable reg: %d\n", ret);
> +		return ret;
> +	}
> +
> +	return (regval & info->qi) ? REGULATOR_STATUS_ON : REGULATOR_STATUS_OFF;
> +}

This appears to just be reading back the enable bit, the status
operation should only be implemented if it can check if the regulator
is actually working.

Please also don't use the ternery operator needlessly, just write normal
conditional statements to help people read the code.

> +static int mt6392_buck_set_mode(struct regulator_dev *rdev, unsigned int=
 mode)
> +{
> +	int ret, val =3D 0;
> +	struct mt6392_regulator_info *info =3D rdev_get_drvdata(rdev);
> +	u32 reg_value;
> +
> +	if (!info->modeset_mask) {
> +		dev_err(&rdev->dev, "regulator %s doesn't support set_mode\n",
> +			info->desc.name);
> +		return -EINVAL;
> +	}

If a regulator doesn't have support for set_mode() the operation
shouldn't be provided for it.

> +	ret =3D regmap_update_bits(rdev->regmap, info->modeset_reg,
> +				  info->modeset_mask, val);
> +
> +	if (regmap_read(rdev->regmap, info->modeset_reg, &reg_value) < 0) {
> +		dev_err(&rdev->dev, "Failed to read register value\n");
> +		return -EIO;
> +	}

Why are we doing this read?  It's not like anything even looks at the
value.

> +static int mt6392_set_buck_vosel_reg(struct platform_device *pdev)
> +{
> +	struct mt6397_chip *mt6392 =3D dev_get_drvdata(pdev->dev.parent);
> +	int i;
> +	u32 regval;
> +
> +	for (i =3D 0; i < MT6392_MAX_REGULATOR; i++) {
> +		if (mt6392_regulators[i].vselctrl_reg) {
> +			if (regmap_read(mt6392->regmap,
> +				mt6392_regulators[i].vselctrl_reg,
> +				&regval) < 0) {
> +				dev_err(&pdev->dev,
> +					"Failed to read buck ctrl\n");
> +				return -EIO;
> +			}

The indentation here is seriously messed up, parts of the conditional
statement are indented as far as the code block inside the conditional
statement - usually the continuation of the condition would align with
the (.

> +
> +			if (regval & mt6392_regulators[i].vselctrl_mask) {
> +				mt6392_regulators[i].desc.vsel_reg =3D
> +				mt6392_regulators[i].vselon_reg;
> +			}

Again here the indentation is weird, this is actually one statement in
the { } but the second line isn't indented.

I'm also not altogether clear why this function is doing what it's
doing, some comments or something would be good at least.

> +		/* Constrain board-specific capabilities according to what
> +		 * this driver and the chip itself can actually do.
> +		 */
> +		c =3D rdev->constraints;
> +		c->valid_modes_mask |=3D REGULATOR_MODE_NORMAL|
> +			REGULATOR_MODE_STANDBY | REGULATOR_MODE_FAST;
> +		c->valid_ops_mask |=3D REGULATOR_CHANGE_MODE;

This is broken, the driver should absolutely not modify constraints.
The driver isn't even doing what the comment says here, it's enabling
permissions regardless of if they were enabled by the machine.

> +static const struct of_device_id mt6392_of_match[] =3D {
> +	{ .compatible =3D "mediatek,mt6392-regulator", },
> +	{ /* sentinel */ },
> +};
> +MODULE_DEVICE_TABLE(of, mt6392_of_match);

There is no need for a compatible for this subfunction, it's specific to
a single chip so we should be able to enumerate it just by enumerating
that chip and this way of binding regulators is very Linux specific.
Just have the MFD register the regulator device.

--KGCJ2evWaA3eb4zZ
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl0Kb4kACgkQJNaLcl1U
h9BDsgf/X5MVZRM8oSqh+qbgXqtR8u6TkB8hkxu3TG/2mXnlhwdaiIX2HooEaSKf
dfdfsPf7Y7+qFGOVBryJXPfk+cn/JPZ5Ntb+oWgjbwpEfaMTKalm3xB9KmNPkZvD
S+RtdwyB4ynaXaNuzGOsOb/JW7t9HBDGHE8hUFfNFWcWh8Wny8oXkLAbwjYDoWFs
KcyScAOcNhFsQpnaVaZdM8S7kv5r2jBPsg6MCjD6gGhB527VxvJHtY3qQdxm1D55
RF28e3Bz3cVfDAjXivdsQgsONR0KlBcrKnbvvKxzlXpkaPWYb5DzNWqHa9IN5B3A
8DetMVMjgOYxfx74qGoBo3Wcpk5bRg==
=MKSc
-----END PGP SIGNATURE-----

--KGCJ2evWaA3eb4zZ--
