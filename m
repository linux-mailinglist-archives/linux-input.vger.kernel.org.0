Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A9E8C40A75C
	for <lists+linux-input@lfdr.de>; Tue, 14 Sep 2021 09:28:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240665AbhINH3t (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 14 Sep 2021 03:29:49 -0400
Received: from wnew3-smtp.messagingengine.com ([64.147.123.17]:52461 "EHLO
        wnew3-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S239257AbhINH3t (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Tue, 14 Sep 2021 03:29:49 -0400
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
        by mailnew.west.internal (Postfix) with ESMTP id 93C8D2B01223;
        Tue, 14 Sep 2021 03:28:31 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
  by compute5.internal (MEProxy); Tue, 14 Sep 2021 03:28:32 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
        date:from:to:cc:subject:message-id:references:mime-version
        :content-type:in-reply-to; s=fm3; bh=hvVjVrfSs4NfbZwUvsxZ1AIAjiN
        Kf/AxOnqlfzcIO3w=; b=BNjOx/AihmBs1wdMnZUt41zDND5dmoq3ZZKrl4HnHY2
        n4O9g5pag6oJ5V5QTKYLEopFcFit8H4TZpnDTVDpL6VCgV4U7+oH2Pu31fZx8rkL
        H7O0p086NO9gxYhsy5J980A8m8Tmc0skb3jPLDf5qgpfd7vS4mT3NxTZ/f5KlcDj
        pomU3VcA+wl/EPKshVIA9geMP8YSY+dSL+VVBMO5Kpnkht1EhyymvYP4mV008bL7
        VK10llKYavsHEi2yfYrQO4E06d8mvcr2m9WHeHPUKVDfb6cnnwfxT1eIjS/hzWiz
        zbEhlhpGpuC4U85fOFt8M60mcKl5BkEJnSvlM2VKQGQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:content-type:date:from:in-reply-to
        :message-id:mime-version:references:subject:to:x-me-proxy
        :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; bh=hvVjVr
        fSs4NfbZwUvsxZ1AIAjiNKf/AxOnqlfzcIO3w=; b=ZC1956DSICswdAdl2s0Ol1
        cA7e+CBNDk1Pe+3u0UpevfVh8x4SC7ROXTDG1g+0eEdpaWnR0oDrxx9YkFNhmISp
        fO9taT451Y4czoXjFCK/47IbIFNaqe4LaruKbhcIR5yGsQ5QoJensUbi+iZjDyMV
        xV07pzZYHUNz1d26YDYTj17ylP+yJGksyaWVcUdjhT4zPrqlzrt8STXlyzvSBtJM
        ZJbEnF7PEO/8yI6I9GiBN073gSJN4YXheFSrM1xb1UgCykV+fKzWiv90XbT5j+ld
        SS228t1xyl/HHB96yVTUXYvHZlxjQhq1+3vCyzf2dvZDwCU5ZAbrl2jF1mCgZW9Q
        ==
X-ME-Sender: <xms:HU9AYef3U-RIC9y5UMJXVQDgp6GwACAnL9bFdJKWVbNm6XCesVxx8A>
    <xme:HU9AYYMzZMv9xngwQxW2XtondmcytEqbhiXn67vX8EwijZLrCCybw3oWW12cinPku
    5kKLflr030C3dKSouA>
X-ME-Received: <xmr:HU9AYfj4Fa436Mt463OO35qwTb4G206LYAEpeXoZEtFQgAl0ZyyER5JWvs6lLpaHX1LnYLe5_V0jKVENXBMcTuQwrvhlYOHxEsst>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvtddrudegkedguddujecutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
    necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
    enucfjughrpeffhffvuffkfhggtggujgesghdtreertddtvdenucfhrhhomhepofgrgihi
    mhgvucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrg
    htthgvrhhnpeelkeeghefhuddtleejgfeljeffheffgfeijefhgfeufefhtdevteegheei
    heegudenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpe
    hmrgigihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:HU9AYb89jbYfEMiRLB27f6ah2wxdrgVe6xQBt1xW-b9ygm7bZ1Ag2Q>
    <xmx:HU9AYauo9Gmhe6oLA--TfbPTayoL6BGjfOpkeeEYVVxuSaMZIwkgPA>
    <xmx:HU9AYSEPQDVeDCIBk96VQNnoljKa3Bi_ij8ZkfL6uCoprz6Er5LSuQ>
    <xmx:Hk9AYbm7Uu7EYHSgYlF5jyfWU6sqGOvsA9aibli3ShHeUz_Yq-CJVH-exBQ>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 14 Sep 2021 03:28:29 -0400 (EDT)
Date:   Tue, 14 Sep 2021 09:28:27 +0200
From:   Maxime Ripard <maxime@cerno.tech>
To:     Samuel Holland <samuel@sholland.org>
Cc:     Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Hans de Goede <hdegoede@redhat.com>,
        Rob Herring <robh+dt@kernel.org>, Chen-Yu Tsai <wens@csie.org>,
        Jernej Skrabec <jernej.skrabec@gmail.com>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-input@vger.kernel.org, linux-sunxi@lists.linux.dev,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/3] Input: sun4i-lradc-keys: Add optional clock/reset
 support
Message-ID: <20210914072827.jgv6piny47veacig@gilmour>
References: <20210908034016.24119-1-samuel@sholland.org>
 <20210908034016.24119-3-samuel@sholland.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="rzmx22vvpwfmbzkv"
Content-Disposition: inline
In-Reply-To: <20210908034016.24119-3-samuel@sholland.org>
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org


--rzmx22vvpwfmbzkv
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Samuel,

On Tue, Sep 07, 2021 at 10:40:15PM -0500, Samuel Holland wrote:
> Until the R329, the LRADC hardware was always active. Now it requires
> enabling a clock gate and deasserting a reset line. Do this if the clock
> and reset are provided in the device tree, but keep them optional to
> maintain support for the existing binding.
>=20
> Signed-off-by: Samuel Holland <samuel@sholland.org>
> ---
>  drivers/input/keyboard/sun4i-lradc-keys.c | 29 +++++++++++++++++++++++
>  1 file changed, 29 insertions(+)
>=20
> diff --git a/drivers/input/keyboard/sun4i-lradc-keys.c b/drivers/input/ke=
yboard/sun4i-lradc-keys.c
> index 4a796bed48ac..50fc18052829 100644
> --- a/drivers/input/keyboard/sun4i-lradc-keys.c
> +++ b/drivers/input/keyboard/sun4i-lradc-keys.c
> @@ -14,6 +14,7 @@
>   * there are no boards known to use channel 1.
>   */
> =20
> +#include <linux/clk.h>
>  #include <linux/err.h>
>  #include <linux/init.h>
>  #include <linux/input.h>
> @@ -23,6 +24,7 @@
>  #include <linux/of_platform.h>
>  #include <linux/platform_device.h>
>  #include <linux/regulator/consumer.h>
> +#include <linux/reset.h>
>  #include <linux/slab.h>
> =20
>  #define LRADC_CTRL		0x00
> @@ -83,6 +85,8 @@ struct sun4i_lradc_data {
>  	struct device *dev;
>  	struct input_dev *input;
>  	void __iomem *base;
> +	struct clk *clk;
> +	struct reset_control *reset;
>  	struct regulator *vref_supply;
>  	struct sun4i_lradc_keymap *chan0_map;
>  	const struct lradc_variant *variant;
> @@ -140,6 +144,14 @@ static int sun4i_lradc_open(struct input_dev *dev)
>  	if (error)
>  		return error;
> =20
> +	error =3D reset_control_deassert(lradc->reset);
> +	if (error)
> +		goto err_disable_reg;
> +
> +	error =3D clk_prepare_enable(lradc->clk);
> +	if (error)
> +		goto err_assert_reset;
> +
>  	lradc->vref =3D regulator_get_voltage(lradc->vref_supply) *
>  		      lradc->variant->divisor_numerator /
>  		      lradc->variant->divisor_denominator;
> @@ -153,6 +165,13 @@ static int sun4i_lradc_open(struct input_dev *dev)
>  	writel(CHAN0_KEYUP_IRQ | CHAN0_KEYDOWN_IRQ, lradc->base + LRADC_INTC);
> =20
>  	return 0;
> +
> +err_assert_reset:
> +	reset_control_assert(lradc->reset);
> +err_disable_reg:
> +	regulator_disable(lradc->vref_supply);
> +
> +	return error;
>  }
> =20
>  static void sun4i_lradc_close(struct input_dev *dev)
> @@ -164,6 +183,8 @@ static void sun4i_lradc_close(struct input_dev *dev)
>  		SAMPLE_RATE(2), lradc->base + LRADC_CTRL);
>  	writel(0, lradc->base + LRADC_INTC);
> =20
> +	clk_disable_unprepare(lradc->clk);
> +	reset_control_assert(lradc->reset);
>  	regulator_disable(lradc->vref_supply);
>  }
> =20
> @@ -243,6 +264,14 @@ static int sun4i_lradc_probe(struct platform_device =
*pdev)
>  		return -EINVAL;
>  	}
> =20
> +	lradc->clk =3D devm_clk_get_optional(dev, NULL);
> +	if (IS_ERR(lradc->clk))
> +		return PTR_ERR(lradc->clk);
> +
> +	lradc->reset =3D devm_reset_control_get_optional_exclusive(dev, NULL);
> +	if (IS_ERR(lradc->reset))
> +		return PTR_ERR(lradc->reset);
> +

This wouldn't report an error if the clocks are missing on the R329 (and
D1), even though they are required. The way we usually deal with this is
through a flag in the variant structure (at least to guard clk_get /
reset_control_get)

Maxime

--rzmx22vvpwfmbzkv
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCYUBPGwAKCRDj7w1vZxhR
xQPqAP9LGRvPenYpVtWJ7qukgVZrUVeqfttxeSmMC5gIPT+hLwEA+33NIDCBUsS5
hzuRkA1uLpYHY1fKdfQpdP+Kvb8XhQM=
=KI02
-----END PGP SIGNATURE-----

--rzmx22vvpwfmbzkv--
