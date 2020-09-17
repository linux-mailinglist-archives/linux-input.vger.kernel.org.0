Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6D46A26D8D3
	for <lists+linux-input@lfdr.de>; Thu, 17 Sep 2020 12:23:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726705AbgIQKW7 (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 17 Sep 2020 06:22:59 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48778 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726658AbgIQKWz (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Thu, 17 Sep 2020 06:22:55 -0400
Received: from mail-wm1-x341.google.com (mail-wm1-x341.google.com [IPv6:2a00:1450:4864:20::341])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 36209C06174A;
        Thu, 17 Sep 2020 03:22:55 -0700 (PDT)
Received: by mail-wm1-x341.google.com with SMTP id l15so4123602wmh.1;
        Thu, 17 Sep 2020 03:22:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=wqlie8EFOYHLM9Tep6zCT0u3ufvIqmdBeSQ+iF05o/k=;
        b=kdF0FOLaM8oPwGpYMI2arvofCqA+eyS4XrmIcvizl/nd5IshZNOENGXytbPR6mgSoF
         xndxRKwiq+WbF9Duj8JUz+jI+RzsVnVNZozHyTRcjce58dbIT6ii+xWPO8bnZinwT60A
         2d+FiIamtYbNy7QHWsUtcUwsn3NjYwkx7F+nwzZ7hZZkQsLIo9ao46FguPzk/mCm7trc
         LRv0FvHMLse23VQgyMhzUAjtMfZNT2lZAT1JWnmvK9LRQCgplEdwg9aOta0RLlvJKDmT
         0FWLIXQCuGPSItI+wWoYF41eT/ENLL3s5bP1ve3dcuzpIo73XpTlHyKJvFf0GotPxuZJ
         ziLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=wqlie8EFOYHLM9Tep6zCT0u3ufvIqmdBeSQ+iF05o/k=;
        b=F8ZD03JbLjUDXA5gqETt4XJubnP8qUglwWxx1lTZVI7X5HUDg5F17f6Y62YrF+/+Z+
         DHgd2SFaYdUxOzezzzQ4VNp7IT6gabbqXjm5qXTE2WbTSg8LDxGuv/1GVaeDhT1kGkF6
         ZX1XopFVU7XYaO2rdLUdoTYb54wmaIwbS9rr6CH8I+Y736LgklGZjXurfK84hrywkQ3h
         J6bcckFTMc/Tl5eCkQh2kkTjfCQ5mitlHN1aZhi4z23ROZ2SyN0z5r2csvdL4O9sYdou
         vCBH2uvAYR4acXmYgyFtwz64LldDfft5D6Q6Ay4yBcM/1lLldZXoEW6YlIZXCpQ8vZdv
         RaBQ==
X-Gm-Message-State: AOAM533K2AiU8IUtSqOUXRNedHpxyFdLOe8yzddVADtAmf8+N+g8XjWp
        81PVwQX/kGf0Fb3EhoOQejo=
X-Google-Smtp-Source: ABdhPJygMkCt6FkVUlglGZsRFLgKEPZIwFRNzFDuplgHssjjteWsH/QsEwVuB+uNQnhxt0OcvSkl2w==
X-Received: by 2002:a7b:c5c6:: with SMTP id n6mr9055494wmk.120.1600338173932;
        Thu, 17 Sep 2020 03:22:53 -0700 (PDT)
Received: from localhost ([217.111.27.204])
        by smtp.gmail.com with ESMTPSA id n21sm10142585wmi.21.2020.09.17.03.22.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Sep 2020 03:22:52 -0700 (PDT)
Date:   Thu, 17 Sep 2020 12:22:51 +0200
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Dmitry Osipenko <digetx@gmail.com>
Cc:     Jonathan Hunter <jonathanh@nvidia.com>,
        =?utf-8?B?TWljaGHFgiBNaXJvc8WCYXc=?= <mirq-linux@rere.qmqm.pl>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        David Heidelberg <david@ixit.cz>, linux-input@vger.kernel.org,
        linux-tegra@vger.kernel.org
Subject: Re: [PATCH v1] ARM: tegra: nexus7: Add touchscreen
Message-ID: <20200917102251.GE3515672@ulmo>
References: <20200814002138.12312-1-digetx@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="TD8GDToEDw0WLGOL"
Content-Disposition: inline
In-Reply-To: <20200814002138.12312-1-digetx@gmail.com>
User-Agent: Mutt/1.14.6 (2020-07-11)
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org


--TD8GDToEDw0WLGOL
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Aug 14, 2020 at 03:21:38AM +0300, Dmitry Osipenko wrote:
> Nexus 7 2012 has Elantech EKTF3624 touchscreen, this patch adds TS node to
> the device-tree.
>=20
> Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
> ---
>=20
> Please note that EKTF3624 is already supported by the elan,elants_i2c.yaml
> binding, but elants_i2c driver doesn't support it yet becasue some of the
> patches [1] are still under review.
>=20
> [1] https://patchwork.kernel.org/project/linux-input/list/?series=3D316905
>=20
>  .../tegra30-asus-nexus7-grouper-common.dtsi    | 18 ++++++++++++++++++
>  1 file changed, 18 insertions(+)

Applied to for-5.10/arm/dt, thanks.

Thierry

--TD8GDToEDw0WLGOL
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAl9jOPsACgkQ3SOs138+
s6EgPw/6A7Zax2fL+gbhAAUuC8zPwX/+S94hE7LTaSmrXU0VqOKDZkYjgR/idj+E
3TLkH7x4934HOfZhIvfR4ZJVxB7Az8/BUzbIgVG7BHbS73u5e6hb13m3Zoa6Xu87
teA/cCpiXSJu4zhMu2bbhGXyyvzwiQzbhMjf24cwx5SN9kgjKJKx3ojfriO673ne
w3bOJLEiK5izJMkabK7jEwUhfybT5ION46GlRpNztFMPibXBXNFj92OZw0D7NHaX
p9YSuyfJ3xcBwrPDzpXIXMnKDSH315d1gq2H9mDQZPq8W4WA54Vr4A+1mIXF2yVr
hmh7Y/3v4KD95qLOZ/V296EvUELxb3zThRb+eRW7xK1F2E4HjNTGtlvtWRtRC6Qh
jaAxFwXZ9zAhRlVAiNMnCs0uAOESEPzh0dhJ6NBXiY1aKZCt6aAX69hLTRghasS3
i5x0QcHZCAQoWMUXI77jonqiYWUrZW0RGZMfAM9DYWZ7dEsrjrA83oK5tbXQ+Nzc
rJmseZuJR9PEanylt3rVbhDldHgVh2MyQl1H6TAJIsIYkuNptnvT4U5GV1dxYPr3
o3ybAFzLYJ3+/BQicnWMFuaQC3Isn4qR6KQ9PKpuzwqy/nbZ6VjLxVxas4NPIYfn
0INcpVxVRnwe+S1rSuTIbkZuzpzcjhpPOQZ1O08s3skjOUagGPQ=
=SELD
-----END PGP SIGNATURE-----

--TD8GDToEDw0WLGOL--
