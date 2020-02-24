Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 53E3716A13A
	for <lists+linux-input@lfdr.de>; Mon, 24 Feb 2020 10:11:42 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727857AbgBXJLR (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 24 Feb 2020 04:11:17 -0500
Received: from new3-smtp.messagingengine.com ([66.111.4.229]:36727 "EHLO
        new3-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1727794AbgBXJLD (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Mon, 24 Feb 2020 04:11:03 -0500
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
        by mailnew.nyi.internal (Postfix) with ESMTP id 34D407698;
        Mon, 24 Feb 2020 04:11:02 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
  by compute3.internal (MEProxy); Mon, 24 Feb 2020 04:11:02 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
        date:from:to:cc:subject:message-id:references:mime-version
        :content-type:in-reply-to; s=fm2; bh=P6NSWkrKZ4ycnvFOSuy67yShL4e
        kMBsFHiAL05968xc=; b=lZ4OE2YE954qYDC16RXXOtM/qnFZraFfeQ0BPlrNAQt
        GXa5BRrgjuoMXO09Hj3a+SRn3OWbiJfp1i7iHeX49HvPtvYKGj2ka60gIk6QygsS
        xOedDCFBmF5v3PSXS+L3NxwVtIqE9RznUlMhphBxtmlaexBZKMCsLbsXEtmnyWFY
        pEHkRiCnYtzef/iZ9FYqOK2PmauywfwotGSDS2ZUzSt7Y+pIb5q+qAQYlq5a9+4S
        4EP5CiPaANupbgvtbAquupThLnPHIfavvUMjae8bB/oPE3uGTWNm4571hPnqzcdV
        tIp44pxnFoVzlNbG6lpp5aNwDIpEsxcIGB/g47CMCuw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:content-type:date:from:in-reply-to
        :message-id:mime-version:references:subject:to:x-me-proxy
        :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=P6NSWk
        rKZ4ycnvFOSuy67yShL4ekMBsFHiAL05968xc=; b=r57KjA79/p5plmAAJXNv/J
        hnoNbfH/Fm5PIKdb1WwapcoQy4JZwmrTAKiYdDrU1xmPe7YO7cg67fWW48x/8Fg0
        W26pjrXMh+5qpMVxoKbHogk903GtPfV8zMhdIYPCRS2I4WRgLVL9zN0dmtKVcK+i
        +nFZkhg/lAgAR/F4y/hcFeDm10hT/erEAES/h79aAY8bMLzzV6UcDsBWX01txzKi
        9J3KqrQ01PWX26AWkYE4nz7E7TgV/YUQHv3e2RlERTMoj0olsRWysMp3i+g4zilC
        ikqMBqw87Ow0nRPMkSim4j0vTFLFbDC0hjG/xkHYH/Scm6XVExWWXkLkrNQgbz8w
        ==
X-ME-Sender: <xms:JJNTXoeASscD0ZE79XXdYIUaj_4HERRURm8t60DN_w_LZdOkXgefiQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedugedrledtucetufdoteggodetrfdotffvucfrrh
    hofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgenuceurghi
    lhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurh
    epfffhvffukfhfgggtuggjsehgtderredttddvnecuhfhrohhmpeforgigihhmvgcutfhi
    phgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecukfhppeeltddrkeelrd
    eikedrjeeinecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhho
    mhepmhgrgihimhgvsegtvghrnhhordhtvggthh
X-ME-Proxy: <xmx:JJNTXluWuPtuGN1waXd_JiswnG4e7u-fVcy7PczKJAgHSvNxt3tqQg>
    <xmx:JJNTXv_wMhB5XVyVpuBZBac9XmYEjBsod6Y6Tlf2Dk6TfKZoM0gR_w>
    <xmx:JJNTXo1zXyyBSNGeEc12xnIp9_AK21g3yWfN8SJAGvtSF8hQMAa4Sg>
    <xmx:JpNTXugmknZ6EKgtv52oiyQ9y3cZAT18nBrpAmieETp8hBTU8RsCag>
Received: from localhost (lfbn-tou-1-1502-76.w90-89.abo.wanadoo.fr [90.89.68.76])
        by mail.messagingengine.com (Postfix) with ESMTPA id 421BA328005A;
        Mon, 24 Feb 2020 04:11:00 -0500 (EST)
Date:   Mon, 24 Feb 2020 10:10:59 +0100
From:   Maxime Ripard <maxime@cerno.tech>
To:     Ondrej Jirman <megous@megous.com>
Cc:     linux-sunxi@googlegroups.com,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Rob Herring <robh+dt@kernel.org>, Chen-Yu Tsai <wens@csie.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Luca Weiss <luca@z3ntu.xyz>, Tomas Novotny <tomas@novotny.cz>,
        linux-input@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 3/4] ARM: dts: sun8i-a83t-tbs-a711: Add support for the
 vibrator motor
Message-ID: <20200224091059.lljffogofbexhudt@gilmour.lan>
References: <20200222231428.233621-1-megous@megous.com>
 <20200222231428.233621-4-megous@megous.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="rf2uuzktvcqtstk3"
Content-Disposition: inline
In-Reply-To: <20200222231428.233621-4-megous@megous.com>
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org


--rf2uuzktvcqtstk3
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi,

On Sun, Feb 23, 2020 at 12:14:27AM +0100, Ondrej Jirman wrote:
> The board has a vibrator mottor. Hook it to the input subsystem.
>
> Signed-off-by: Ondrej Jirman <megous@megous.com>
> ---
>  arch/arm/boot/dts/sun8i-a83t-tbs-a711.dts | 5 +++++
>  1 file changed, 5 insertions(+)
>
> diff --git a/arch/arm/boot/dts/sun8i-a83t-tbs-a711.dts b/arch/arm/boot/dts/sun8i-a83t-tbs-a711.dts
> index 2fd31a0a0b344..a22920275e99b 100644
> --- a/arch/arm/boot/dts/sun8i-a83t-tbs-a711.dts
> +++ b/arch/arm/boot/dts/sun8i-a83t-tbs-a711.dts
> @@ -99,6 +99,11 @@ panel_input: endpoint {
>  		};
>  	};
>
> +	vibrator {
> +		compatible = "gpio-vibrator";
> +		vcc-supply = <&reg_ldo_io1>;
> +	};
> +

LDO IO1 can also be muxed in as a GPIO iirc, why did you choose the
regulator instead?

Maxime

--rf2uuzktvcqtstk3
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCXlOTIwAKCRDj7w1vZxhR
xVFTAQDQJHOWWsog4Y0l4mRxEOjNKPwakKZYlCWd4M50UL9jDAEArb1p2WwTIOaO
jt5TR3xH+He9Bb3uaRGhWtWZpIcV9Aw=
=/rlr
-----END PGP SIGNATURE-----

--rf2uuzktvcqtstk3--
