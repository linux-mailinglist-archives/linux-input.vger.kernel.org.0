Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E793D4033F1
	for <lists+linux-input@lfdr.de>; Wed,  8 Sep 2021 07:51:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238723AbhIHFwt (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 8 Sep 2021 01:52:49 -0400
Received: from wnew3-smtp.messagingengine.com ([64.147.123.17]:41449 "EHLO
        wnew3-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S233916AbhIHFwt (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Wed, 8 Sep 2021 01:52:49 -0400
Received: from compute2.internal (compute2.nyi.internal [10.202.2.42])
        by mailnew.west.internal (Postfix) with ESMTP id 048AA2B00283;
        Wed,  8 Sep 2021 01:51:40 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
  by compute2.internal (MEProxy); Wed, 08 Sep 2021 01:51:41 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
        date:from:to:cc:subject:message-id:references:mime-version
        :content-type:in-reply-to; s=fm3; bh=60L7gSawCRjRSO6rv6WF7jd8HL/
        UOBIL33p5VtmELSw=; b=WYpNJOJ0KkBlLIpR7Dj/+QZ3veNkMTkFvczME3BPyUS
        6+GwGAw0n4Js7kC6AB49NWDfA+ukodwp1jeBrl/fPX8khHoNFf3k+3jiqBA3n75l
        o2Cjiqf1qG/X92NTqIRdWf7jnjgRvwnbILrO0Zy+s0BzPtl4RH3/I9ILYYpIfsMW
        9DK456iRc/mRGpst2iL+FCQw031ula3snupQU8fmrH4gs9xSjqMxCrBBpqGP/16z
        3ozUSQuOREZkUPQQ8XeY70FstGyRQ4IjwLNsUN5ZEaTx/luPMDVKbHQ6Owvcp21l
        mVJQVAhNt5KiwaikNTow9SjAwMCbG+Z9E1vxiwyWDqg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:content-type:date:from:in-reply-to
        :message-id:mime-version:references:subject:to:x-me-proxy
        :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; bh=60L7gS
        awCRjRSO6rv6WF7jd8HL/UOBIL33p5VtmELSw=; b=cHD28nxDpBZGJ9OW98+qoT
        3JrOq+rRepH0HiodvstcOQ3MJg3nzej/0oQc9PoHtevxz9VOG/X4u4Eu+41nZ7HG
        m6u2XDQvQg+rX/Q+EWH2Eufki0wmBalYMVV6MaAskrXHNqBqEsez+A5GG34Eh/34
        2eVhV4eecAdIRPj8qb96kVO3/48wrwJkpPE27RjQjWkcxv3OZOIq3paeQhhKM3n/
        BBD9wlkPVbe+YyzXb60uHE0Q9l8yT0JYnux5/5gTG6gLyvZZWOjcDp17KfHMBBoB
        H5NrDaa69YFnflwegKDRQUT0FNDm6OaW4aLsHlRVPhYUjP6f7v7VM4lP/+epXM9Q
        ==
X-ME-Sender: <xms:a084YblgeD9Yh35f2sWxbT_uRF4Fo9s8OhCt_TJ4s07XP0aHqyROug>
    <xme:a084Ye2AqQ0jl0CZh0X9nCU3E0RcR4iBVmNZYhswpgVjaJ5_szzyJgWfT8E2zgIQJ
    hTYDQjaOgs2M1FAJk4>
X-ME-Received: <xmr:a084YRor3XILlQhQz6Dyp5LvhKTxEV2e3QKzKxiferprYpsidZdyyfAAgFLfMfsmy88Z-4qQZwgXWlmJB2IhvkU-Zd6FE-yAGuLt>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvtddrudefiedgleeiucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepfffhvffukfhfgggtuggjsehgtderredttddvnecuhfhrohhmpeforgigihhm
    vgcutfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecuggftrfgrth
    htvghrnhepleekgeehhfdutdeljefgleejffehfffgieejhffgueefhfdtveetgeehieeh
    gedunecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepmh
    grgihimhgvsegtvghrnhhordhtvggthh
X-ME-Proxy: <xmx:a084YTkiwCmOFhpnCPT22w6PYO2qGEtLe6Ptf02hHpbgkF9BwNl_CQ>
    <xmx:a084YZ2MXZyOkIuykMxMORfo8NWHTQDXbhKB9lNlQdn38xxZME4E-w>
    <xmx:a084YSuJzOclRZYOYrlc0Rtqg39qa9dhWetVGOEKFoH-6-QxTme1jg>
    <xmx:bE84YSuAZJbwHGawZ9d9obvN-waEPxMZ3an2f-z9sGA_RI74jtk-zLIpTGM>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 8 Sep 2021 01:51:38 -0400 (EDT)
Date:   Wed, 8 Sep 2021 07:51:37 +0200
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
Subject: Re: [PATCH 1/3] dt-bindings: input: sun4i-lradc-keys: Add R329 and
 D1 compatibles
Message-ID: <20210908055137.bhlgacvoytwyaxkf@gilmour>
References: <20210908034016.24119-1-samuel@sholland.org>
 <20210908034016.24119-2-samuel@sholland.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="av3evqvm62blkzv7"
Content-Disposition: inline
In-Reply-To: <20210908034016.24119-2-samuel@sholland.org>
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org


--av3evqvm62blkzv7
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Sep 07, 2021 at 10:40:14PM -0500, Samuel Holland wrote:
> The R329 and D1 SoCs each contain an LRADC with a programming interface
> compatible to earlier LRADCs. However, the LRADC now has its own clock
> gate and reset line, instead of being always active.
>=20
> To support this, add clock/reset properties to the binding, and require
> them for the variant in the new SoCs.
>=20
> Signed-off-by: Samuel Holland <samuel@sholland.org>

Acked-by: Maxime Ripard <maxime@cerno.tech>

Maxime

--av3evqvm62blkzv7
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCYThPaQAKCRDj7w1vZxhR
xWgBAQCR6MOJPt5KqOPcf0CSq+dHJmmPtiDUyXMqK0pTVhcqVQEAkjG9l7QwxgmS
WXmuqGxAjFvXdvBbaMJ8oKO0ysEsJAs=
=3pfG
-----END PGP SIGNATURE-----

--av3evqvm62blkzv7--
