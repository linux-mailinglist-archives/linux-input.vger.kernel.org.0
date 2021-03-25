Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 65A053493C3
	for <lists+linux-input@lfdr.de>; Thu, 25 Mar 2021 15:11:20 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231409AbhCYOKq (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 25 Mar 2021 10:10:46 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46728 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231362AbhCYOKj (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Thu, 25 Mar 2021 10:10:39 -0400
Received: from mail-wm1-x32e.google.com (mail-wm1-x32e.google.com [IPv6:2a00:1450:4864:20::32e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6012AC06174A;
        Thu, 25 Mar 2021 07:10:38 -0700 (PDT)
Received: by mail-wm1-x32e.google.com with SMTP id r10-20020a05600c35cab029010c946c95easo1253533wmq.4;
        Thu, 25 Mar 2021 07:10:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=0mydIUmMhYaLpC0TGBq89wR0dneeiZBlHKPe/4EHYHQ=;
        b=a3ElJQirlWF+dI7K4n4nvo1sQoIkDsrGHGpI4TzD8Q5dkBmsANAOjtijDLR8aeCdWR
         8tCnfIctyLhIYTyi3nRP9xBG++vnW4KpmYe2cgU6/VrlpGHn5kxHvkc1nbEHx9+IkLTu
         JX9Y+Y5VZzMWpX7/slK0YHqJa3j3akJd/6q2EPGBfY/7cZ7cgtAluRg/XaAEKd0NoI6W
         vcQqcDUErX9vXyhoqOIN57vWwpAiRFPR1Ow9C8kpGsTD5pnMZ/Ti5FEyDF3bsu2/CFEw
         uGUDIfA+7kVWW73Trqoqcs51olgm+RdQndp1ISFmn5oQyOaWauPmg3Gj+uP1LiMloreC
         md8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=0mydIUmMhYaLpC0TGBq89wR0dneeiZBlHKPe/4EHYHQ=;
        b=e9pF3P3xjno5Q22mUYEuydk4vbUDmOl3EzxH3dAx/bT0/2LI8H7mC8UZ2G2GIbYvxr
         jfWDhVySvFkD86MGc1oKJ+2WRAR4ghIPemODrtRHusetV3oLFNPkA5sC5hYcb/AyB0Ia
         bPqylkTbKWMlXN4RR/fSLdtr0rEn7vbJhfa4LO+xzpK7j0doTEiQlcF+0TI4kvFuuJOL
         jSuDu9V/z4zVhiO4bF3BvDMzEFaFchhUKk8oRM0J/GgBWtm7lEuitERt5j3WBTSuDUJw
         nfZWSFWfLEOZmjnD4WgreDss8VOFNzoXEw3IQefnq399iUzylzNU+QH52fox9NWs0doV
         asaA==
X-Gm-Message-State: AOAM532f3/LLmUpm3jW61oIQq5uehWXklqpKek2f+tI2RkfBnngU6HLB
        vVgMZ9wev1D07ZsY+kPlyPc=
X-Google-Smtp-Source: ABdhPJwbRUVbk/fkcAVvW+Lw1raZb6rUBMJ2PSvmm+rVzBFiu8qDlP16L2ma9KZzOWdSnZHxzfPaBg==
X-Received: by 2002:a1c:22c2:: with SMTP id i185mr8179035wmi.99.1616681437080;
        Thu, 25 Mar 2021 07:10:37 -0700 (PDT)
Received: from localhost ([62.96.65.119])
        by smtp.gmail.com with ESMTPSA id v14sm7684745wrd.48.2021.03.25.07.10.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 25 Mar 2021 07:10:17 -0700 (PDT)
Date:   Thu, 25 Mar 2021 15:10:25 +0100
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc:     Dmitry Osipenko <digetx@gmail.com>, Nick Dyer <nick@shmanahar.org>,
        Rob Herring <robh+dt@kernel.org>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Jiada Wang <jiada_wang@mentor.com>,
        linux-input@vger.kernel.org, devicetree@vger.kernel.org,
        linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v6 3/3] ARM: tegra: acer-a500: Add atmel,wakeup-method
 property
Message-ID: <YFyZ0ejrSxWc3JZT@orome.fritz.box>
References: <20210302102158.10533-1-digetx@gmail.com>
 <20210302102158.10533-4-digetx@gmail.com>
 <YFfLXLDIuRdj2bWs@google.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="JZH7iAiIxO3WXnjv"
Content-Disposition: inline
In-Reply-To: <YFfLXLDIuRdj2bWs@google.com>
User-Agent: Mutt/2.0.6 (98f8cb83) (2021-03-06)
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org


--JZH7iAiIxO3WXnjv
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sun, Mar 21, 2021 at 03:40:28PM -0700, Dmitry Torokhov wrote:
> On Tue, Mar 02, 2021 at 01:21:58PM +0300, Dmitry Osipenko wrote:
> > Acer A500 uses Atmel Maxtouch 1386 touchscreen controller. This control=
ler
> > has WAKE line which could be connected to I2C clock lane, dedicated GPIO
> > or fixed to HIGH level. Controller wakes up from a deep sleep when WAKE
> > line is asserted low. Acer A500 has WAKE line connected to I2C clock and
> > Linux device driver doesn't work property without knowing what wakeup
> > method is used by h/w.
> >=20
> > Add atmel,wakeup-method property to the touchscreen node.
> >=20
> > Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
>=20
> Applied, thank you.

I noticed that you had applied this as I was applying a different patch
that touches the same area and it causes a conflict. In general I prefer
to pick up all device tree changes into the Tegra tree, specifically to
avoid such conflicts.

That said, I didn't see an email from Stephen about this causing a
conflict in linux-next, so perhaps it's fine. If this pops up again it
might be worth considering to drop this from your tree so that I can
resolve the conflict in the Tegra tree.

Thierry

--JZH7iAiIxO3WXnjv
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAmBcmdEACgkQ3SOs138+
s6HM1hAAv6/5w7f5FRWHIHF5G+bDGgIf2T9Bf6XOXEaLGpXdXYQjypKwmY9bZ2tg
ksZQ5Bo4Yf0lFKOfFRVJq8yrxYXGzrA2lj28RHOAgs8H6+KKw04/WIAv+/ySLeUl
w2fYrmlTlu6SEdMC0mpEhtB1nZcJFIZNOs2Yb1wBeh3bfUDcSt14vDcYxryUn57r
KV3jt5+djsRYkpp+uf6vQe1/YGoSnqSbWjKb4zpaF0YTK/FkHZfq3/p91F2YbiEi
3Ru+tB2W1AGoP+z5t/HL0qW2bnCssosm6vfZkO78L/zjagSVSIYshIYMLjVyczKv
4axWH0LRIcEKben0NczDyXjU+oN2gbDAeay7RYmpLM11HzjSpVWVmhHT27z1lIw1
tMKMCceERaqWJclInwv/62mv8rLs3QsyefzZEUQe039MgMzFTZBT4WYt+42qG6Fs
ZseZ/2ujdvXsTnwiMbjqxD1jBQCUchStvKLcXH8rHWE82QrwjulTxElAyAJ6LGJw
u3dN85bhfYQdry7TR9V5+zDHPabkJddVzb8BaHrJbjbbH2mLsk8RZOeJ6LjhKfDK
z6TnRacuY1E7li6BDaHbgCayUqRiDbhxfi90l88+Y7qIT2fPvlpwe4+gpp8llIsM
7jd6hNl19c6C66EsO9vAD5xBUz7ub283rbp1umk3vol8LbToUOc=
=RvcD
-----END PGP SIGNATURE-----

--JZH7iAiIxO3WXnjv--
