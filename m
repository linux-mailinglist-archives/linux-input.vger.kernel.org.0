Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A52A934A709
	for <lists+linux-input@lfdr.de>; Fri, 26 Mar 2021 13:22:31 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230041AbhCZMV6 (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Fri, 26 Mar 2021 08:21:58 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52134 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229982AbhCZMVa (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Fri, 26 Mar 2021 08:21:30 -0400
Received: from mail-ej1-x632.google.com (mail-ej1-x632.google.com [IPv6:2a00:1450:4864:20::632])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6B215C0613AA;
        Fri, 26 Mar 2021 05:21:29 -0700 (PDT)
Received: by mail-ej1-x632.google.com with SMTP id u5so8102387ejn.8;
        Fri, 26 Mar 2021 05:21:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=nbQsoryEk92rLekDHSfut3bgAyGsVyag4LxOglKoE94=;
        b=ookfuc199rsjHG+T5xjkFH7iy6zEQnRkp+QXK8eZliunXE0WfOhVnlaoMLktYVwzMc
         P4IaHcCo8s8QNLCkH2edI7eKrwWroxWArPZn+QI0jPbeGQV7rYVVVRzGRvHTFiwBliRg
         HZjK9k5Aq+x7EiGYMvjKR3uggJcsvf/Ey1nEhzSI8x5pKQARNGA5GYQaPFTqTe5vgpIc
         NqwS0UNkZ8FieQKLCt5ABldhh7Z9TEy7tYyZpTnG64Q61ToFZy/P0zfpFkDpPR70/avI
         9YCIgO5hzngp9qtaH3ETB9+JmmLOUMUzJm5EWoCzVjJuOSQggwvRkt+6yP9KoIo6HYFK
         F01g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=nbQsoryEk92rLekDHSfut3bgAyGsVyag4LxOglKoE94=;
        b=V+0hq9D/j7scefo0k5wIhxEsqG2aJd+YoMo5qNAsDAz3WIJ4FWJpFyVMxIPsXPgIdF
         BuTUsJiM/FQefk8OOcZ5QHjpqpHyrims3brincSvI1yt6yAvNi+iU3ZBVhxvE1+f4CRb
         vUlGMOqPeck1dyn1S7tHyZC8tjPiZyxtgdk+Hv5RBjrPjih3Cy9cS315m82Znk9Y8nRI
         lGq3BUA+G9L8QMG8bViSwJdPdPws1jUfjqXYSTCMQiha85iKKttAcZ1ztVFpqp+1ViXj
         qB0nNE9pA0EHeH6hC+PLqLJ1fMtcW/yRPVYqkDJ9L/MZya2fHZ+gY/oVHcHxAu4F4jbG
         667w==
X-Gm-Message-State: AOAM532APoYlQAhfOqI1lvY9kpkqLEJAXwHLy1sST7ZuwAVsOyLKXk0d
        zweQIvCE/kjlrQ4C81LC1YA=
X-Google-Smtp-Source: ABdhPJxZTzgokw3RmwK20GRb6fjH4x+c/u/JZEMfB94uORdnCdqAScVxZOBsHrXaTE+rk1MtdwSvbQ==
X-Received: by 2002:a17:907:211b:: with SMTP id qn27mr14893910ejb.203.1616761288185;
        Fri, 26 Mar 2021 05:21:28 -0700 (PDT)
Received: from localhost ([62.96.65.119])
        by smtp.gmail.com with ESMTPSA id d5sm3767522ejc.98.2021.03.26.05.21.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 26 Mar 2021 05:21:26 -0700 (PDT)
Date:   Fri, 26 Mar 2021 13:21:48 +0100
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
Message-ID: <YF3R3JYOvMVhugD/@orome.fritz.box>
References: <20210302102158.10533-1-digetx@gmail.com>
 <20210302102158.10533-4-digetx@gmail.com>
 <YFfLXLDIuRdj2bWs@google.com>
 <YFyZ0ejrSxWc3JZT@orome.fritz.box>
 <YFzTWuUZbdXvnpHC@google.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="6dKXrJS0aK0RfFDp"
Content-Disposition: inline
In-Reply-To: <YFzTWuUZbdXvnpHC@google.com>
User-Agent: Mutt/2.0.6 (98f8cb83) (2021-03-06)
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org


--6dKXrJS0aK0RfFDp
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Mar 25, 2021 at 11:15:54AM -0700, Dmitry Torokhov wrote:
> On Thu, Mar 25, 2021 at 03:10:25PM +0100, Thierry Reding wrote:
> > On Sun, Mar 21, 2021 at 03:40:28PM -0700, Dmitry Torokhov wrote:
> > > On Tue, Mar 02, 2021 at 01:21:58PM +0300, Dmitry Osipenko wrote:
> > > > Acer A500 uses Atmel Maxtouch 1386 touchscreen controller. This con=
troller
> > > > has WAKE line which could be connected to I2C clock lane, dedicated=
 GPIO
> > > > or fixed to HIGH level. Controller wakes up from a deep sleep when =
WAKE
> > > > line is asserted low. Acer A500 has WAKE line connected to I2C cloc=
k and
> > > > Linux device driver doesn't work property without knowing what wake=
up
> > > > method is used by h/w.
> > > >=20
> > > > Add atmel,wakeup-method property to the touchscreen node.
> > > >=20
> > > > Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
> > >=20
> > > Applied, thank you.
> >=20
> > I noticed that you had applied this as I was applying a different patch
> > that touches the same area and it causes a conflict. In general I prefer
> > to pick up all device tree changes into the Tegra tree, specifically to
> > avoid such conflicts.
> >=20
> > That said, I didn't see an email from Stephen about this causing a
> > conflict in linux-next, so perhaps it's fine. If this pops up again it
> > might be worth considering to drop this from your tree so that I can
> > resolve the conflict in the Tegra tree.
>=20
> Sorry about that, I went ahead and dropped the patch from my branch.

Applied to the Tegra tree now.

Thanks,
Thierry

--6dKXrJS0aK0RfFDp
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAmBd0dkACgkQ3SOs138+
s6FNXw/8C3M9TrBiS8Rj/hZlPOHZcvXOu7JIqiQUFgSZAWm8KNTg8F1MxoU0Olvd
qnL/qiB8qX7deTEIJgUONJ7GVRh2BRLaFFGHtJoIaXOMIOWhZ1zYOt8SrpG0ULIW
KNXU2p6yY5rbUWFwhiGUAIVKBZFA/AdMsTAsu+XM5J5Lk2GHiVgBNS+SwmPwlW3V
LzUzRtj9x+MygSb76uGZ7WwFoZX1BFA+zAghV987+YO6jwUHXAbh0/6OGqCEAYpa
MId/GXCkOzoEWpVPKhvIrwTSJPVOrLXQqvQFZh/kgt9z0Y5saBsPGsRXgrqHRqmV
4E+jENCp88UsMi3XPQnhgQHJb4RibgWmgkcrzAmSycgariOnMiVkb4TkHiqUnx7o
QCew2Tsfn+zNCmDWOk/5+byF5IBqd2b1M1r3poUBa6Vcfsw+zcSY7KR+EFkQZuO8
jo7vqA9L4j9k9XHgT6UAV4NTjNTmlhbned15ara4ggT4PWjYH234QhcwWz9i68kD
WT/CzVMljPhntMlAcfIOimL4W6Bo5DNtCWyIJrGKiujV9pu5qlRk1umQ+l4E3Bmv
RPLSXADES6H0bFFmvs35njpbKvpzZUc4N/TYVFE7LzDajs4pzbqtBn3fDX4wvRD7
XJqP0171uNzyp/RtPdt68xRFZ7HY/lwa4esO9YD1gPZR9yHMTqA=
=JvNV
-----END PGP SIGNATURE-----

--6dKXrJS0aK0RfFDp--
