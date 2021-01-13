Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A59BE2F467D
	for <lists+linux-input@lfdr.de>; Wed, 13 Jan 2021 09:30:41 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725998AbhAMI3q (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 13 Jan 2021 03:29:46 -0500
Received: from out1-smtp.messagingengine.com ([66.111.4.25]:42739 "EHLO
        out1-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1725834AbhAMI3q (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Wed, 13 Jan 2021 03:29:46 -0500
Received: from compute6.internal (compute6.nyi.internal [10.202.2.46])
        by mailout.nyi.internal (Postfix) with ESMTP id 292A55C003F;
        Wed, 13 Jan 2021 03:28:40 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
  by compute6.internal (MEProxy); Wed, 13 Jan 2021 03:28:40 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
        date:from:to:cc:subject:message-id:references:mime-version
        :content-type:in-reply-to; s=fm1; bh=TzU6WcM+BIQSy4nmgiJ5TPU0ge7
        8zp+Iupe9d0GMyic=; b=USIsB8FCx2ut10qMVZojg5teN6Z+OE1ivil6ojt/wkK
        Y61vL6i+vIoEWDZSUFXMsEjF6mGoOa9PEKzyjjVH4bdhe7KFTd2Fe7UMehPVH/z2
        yePIED3L08YQtQ5ndVKzED2WWtfxnB8zdfi5/o3R75FiIeMgLFCe2VXTTZ8JQrTt
        Ps8Q0AR1jyyyrs7pdUkwzNX7HcOg2dEXSW8j+xqfgizP2cKvTmYZHabmRE1nmqid
        lyrdF9yRbt+s13dhq+3ngVTy41zSMa6M5Y1lH471OPKjcZHSOCY4mv3JwYDNudZc
        Y+Ub8ZlGRsHTL7kA7nQ/LKoT4rpagMk8Gzjono8mDyQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:content-type:date:from:in-reply-to
        :message-id:mime-version:references:subject:to:x-me-proxy
        :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; bh=TzU6Wc
        M+BIQSy4nmgiJ5TPU0ge78zp+Iupe9d0GMyic=; b=f+eRvpzLwJiv1ros6GwI1F
        KUPPqbnHPYYIq5dId5jhyu/x+uzkRAnO65U6NNv1ouBlu5MLG8cWv1nF4xCqWold
        qt+rTIpo64E3Ml0wNXdezEhU5Oko7E9iy+sy1DbdKiB3HBFE/ZdSxxSbDnDa4d6K
        JnAArBuOtDn68xg1nkhEuq+htaxMjVv4F8q/Xnfqu0fOhgtgdGB038gtDzYqaV80
        NrD+QBxDdF9jQwnAem049EUG9bnDKU4RP3vLtwFi39QSKqfwrOmVekUBajwO12Yz
        twHvDSb2WRwuWrpacy7PckjNbSCcMnkqqMrAIhvCtVTwWq2AJlT63IphzI/wtEeA
        ==
X-ME-Sender: <xms:N6_-X3vfrWSJP2-GjWDl3GWKHyiZzUiNK9AWpBoB9mqd83fv6P_mmw>
    <xme:N6_-X4fFKgw2-ekt31CMg4unA4PjeDmOVNqhJbWDXSzVgaizCpZ70Nh369MpPs-5K
    7vvhgCEKgERjtEIIMg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedukedrtddugdduvdduucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepfffhvffukfhfgggtuggjsehgtderredttddvnecuhfhrohhmpeforgigihhm
    vgcutfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecuggftrfgrth
    htvghrnhepleekgeehhfdutdeljefgleejffehfffgieejhffgueefhfdtveetgeehieeh
    gedunecukfhppeeltddrkeelrdeikedrjeeinecuvehluhhsthgvrhfuihiivgepudenuc
    frrghrrghmpehmrghilhhfrhhomhepmhgrgihimhgvsegtvghrnhhordhtvggthh
X-ME-Proxy: <xmx:N6_-X6y8gb1ChGqa5OoN7HlW288uQCwa1-giZnfMcKA2x-odwQtdsg>
    <xmx:N6_-X2NJM5uHQrWrPfBWHD6W7rPKWBSAmKq3Z17avnLpZClcDCS-uQ>
    <xmx:N6_-X3_1TOblX_b6Ny3hfzmAaZfwflpF5A-vZvxqiiE2YbVFPymu1w>
    <xmx:OK_-X4O__H-k0tEDnNqoFEdy94wpaL6Jdwjb0Jg-7LeQqqrZ0KkEcA>
Received: from localhost (lfbn-tou-1-1502-76.w90-89.abo.wanadoo.fr [90.89.68.76])
        by mail.messagingengine.com (Postfix) with ESMTPA id 7D515108005F;
        Wed, 13 Jan 2021 03:28:39 -0500 (EST)
Date:   Wed, 13 Jan 2021 09:28:38 +0100
From:   Maxime Ripard <maxime@cerno.tech>
To:     Samuel Holland <samuel@sholland.org>
Cc:     Hans de Goede <hdegoede@redhat.com>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Rob Herring <robh+dt@kernel.org>, Chen-Yu Tsai <wens@csie.org>,
        Jernej Skrabec <jernej.skrabec@siol.net>,
        devicetree@vger.kernel.org, linux-input@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-sunxi@googlegroups.com
Subject: Re: [PATCH v2 0/3] PinePhone volume key (LRADC) wakeup support
Message-ID: <20210113082838.kwwekwwsnpobk7bg@gilmour>
References: <20210113040542.34247-1-samuel@sholland.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="vhpp6qqqfwdpuanf"
Content-Disposition: inline
In-Reply-To: <20210113040542.34247-1-samuel@sholland.org>
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org


--vhpp6qqqfwdpuanf
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Jan 12, 2021 at 10:05:39PM -0600, Samuel Holland wrote:
> This series allows the volume keys on the PinePhone to wake up the
> device. As pointed out for v1, wakeup should only be enabled when a
> "wakeup-source" property is present, so v2 requires DT and binding
> changes in addition to the driver change.
>=20
> Changes since v1:
>   - Add requisite DT binding change
>   - Only add wakeup capability if "wakeup-source" is present
>   - Warn but do not error out if setting the wake IRQ fails
>   - Add "wakeup-source" property to PinePhone device tree
>=20
> Ondrej Jirman (1):
>   input: sun4i-lradc-keys -  Add wakup support
>=20
> Samuel Holland (2):
>   dt-bindings: sun4i-a10-lradc-keys: Accept wakeup-source property
>   arm64: dts: allwinner: pinephone: Support volume key wakeup
>=20
>  .../input/allwinner,sun4i-a10-lradc-keys.yaml |  2 ++
>  .../dts/allwinner/sun50i-a64-pinephone.dtsi   |  1 +
>  drivers/input/keyboard/sun4i-lradc-keys.c     | 22 +++++++++++++++----
>  3 files changed, 21 insertions(+), 4 deletions(-)

Acked-by: Maxime Ripard <mripard@kernel.org>

I've applied patch 3

Maxime

--vhpp6qqqfwdpuanf
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCX/6vNgAKCRDj7w1vZxhR
xfMtAQDVdffEBMyH+3xfy28vcNPZ4l3C99AYGTCUmy62qTwl1QEA7N4GZ/dALQDD
c2AAwHc05QFZinkvyfVZbSBNmIVoqwE=
=qhju
-----END PGP SIGNATURE-----

--vhpp6qqqfwdpuanf--
