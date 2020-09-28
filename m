Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2ACED27A7FA
	for <lists+linux-input@lfdr.de>; Mon, 28 Sep 2020 08:59:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726500AbgI1G7N (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 28 Sep 2020 02:59:13 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54972 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725290AbgI1G7N (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Mon, 28 Sep 2020 02:59:13 -0400
Received: from mail-wm1-x343.google.com (mail-wm1-x343.google.com [IPv6:2a00:1450:4864:20::343])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E3DCBC0613CE;
        Sun, 27 Sep 2020 23:59:12 -0700 (PDT)
Received: by mail-wm1-x343.google.com with SMTP id q9so5596118wmj.2;
        Sun, 27 Sep 2020 23:59:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=HAcKz0ZkWckShHlODCCEHfQsuhZwtsoiUi0+f1UriJM=;
        b=EdsFLCC3PzYwwJYiBVpAUtUDt+MB/f+9BjWy9+9rKM5pdtBZiw1UBflUsh97OfB3Kx
         Nfxy0TXGOeEpDpNIpy3V+dWS0fCwNlJlgSJ/4I6fB9DZQKotlogNMzwzFiUlO0TyCadu
         9CdEEhlOLySxAL3njhRJ6Kfz9xp19U5QrgxT6wxackywHxxZqHNx/wMiInpPhAd8oh8c
         VPVPy6HgTGwOMXs+8xHmw5kpIG/pIC2QVlRBGxwuSo9JhGTmvnOh395sTgtL1Nntmir8
         zS5QjiNYUJrThQWcRvVp+8pOMQ38f/lr3wMpd6AvXjASD1kxHJLlUFOVLuq7IiUPAz19
         4oYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=HAcKz0ZkWckShHlODCCEHfQsuhZwtsoiUi0+f1UriJM=;
        b=U+0nTTv5vkGkgquRkaHIslf/MY7AMKryPcu+BKDDboT3yaiW4knH54JBRfSosTur0Q
         fvrOfRoNu0JxIOULil+/AyVP9xhZ4SCV9KRaqpxm0e2uJuF7Q4h7N0wsKiC2qfBzVeLI
         dn6B8gZVGrtpRY/Xv9P6Nbuvfy7dIqZwQTbrejC+br9bAqnqihl1mAd1jrX6fGwRR1sq
         zYkxp6Uxtj+8x6aJc3j9pgM4JSHttpqS+KjGnVkNzgNS13nOlErYeSnGjWdQwwAvsI+A
         5dNUN5YStR024MZpIxJ8rxBuf6R/PGwbl5vjnhnOc+9K2LgSZyq5nzYXCNes/vLn8oW0
         t/tA==
X-Gm-Message-State: AOAM532yYNTQ9dZnTomktMxIe9BHge1s4cyl7Sym7S7htapw2Kw0F+d7
        914km2SuvGMVKVRDMCUCCSQ=
X-Google-Smtp-Source: ABdhPJxMwzqXEi96CPX5Vd5urp1B8ZXJY4e1ADyljyqs2dRpwLKYu5wseZVqSFOTTTbcoxdG3+VOIg==
X-Received: by 2002:a7b:c255:: with SMTP id b21mr13754wmj.17.1601276351650;
        Sun, 27 Sep 2020 23:59:11 -0700 (PDT)
Received: from localhost ([217.111.27.204])
        by smtp.gmail.com with ESMTPSA id d23sm7832796wmb.6.2020.09.27.23.59.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 27 Sep 2020 23:59:10 -0700 (PDT)
Date:   Mon, 28 Sep 2020 08:59:09 +0200
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Jiada Wang <jiada_wang@mentor.com>
Cc:     dmitry.torokhov@gmail.com, robh+dt@kernel.org, digetx@gmail.com,
        jonathanh@nvidia.com, nick@shmanahar.org,
        linux-input@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-tegra@vger.kernel.org, erosca@de.adit-jv.com,
        andrew_gabbasov@mentor.com
Subject: Re: [PATCH v2 1/3] dt-bindings: input: atmel: add compatible for
 mXT1386
Message-ID: <20200928065909.GC2837573@ulmo>
References: <20200925135257.21138-1-jiada_wang@mentor.com>
 <20200925135257.21138-2-jiada_wang@mentor.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="+nBD6E3TurpgldQp"
Content-Disposition: inline
In-Reply-To: <20200925135257.21138-2-jiada_wang@mentor.com>
User-Agent: Mutt/1.14.7 (2020-08-29)
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org


--+nBD6E3TurpgldQp
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Sep 25, 2020 at 10:52:55PM +0900, Jiada Wang wrote:
> Document the mXT1386 compatible string.
>=20
> Signed-off-by: Jiada Wang <jiada_wang@mentor.com>
> ---
>  Documentation/devicetree/bindings/input/atmel,maxtouch.txt | 1 +
>  1 file changed, 1 insertion(+)
>=20
> diff --git a/Documentation/devicetree/bindings/input/atmel,maxtouch.txt b=
/Documentation/devicetree/bindings/input/atmel,maxtouch.txt
> index c88919480d37..c13fc0f3f00b 100644
> --- a/Documentation/devicetree/bindings/input/atmel,maxtouch.txt
> +++ b/Documentation/devicetree/bindings/input/atmel,maxtouch.txt
> @@ -3,6 +3,7 @@ Atmel maXTouch touchscreen/touchpad
>  Required properties:
>  - compatible:
>      atmel,maxtouch
> +    atmel,mXT1386

Compatible strings are preferred to be all lowercase.

Thierry

--+nBD6E3TurpgldQp
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAl9xibwACgkQ3SOs138+
s6HkyhAAo0eI2n8ZwD9jwmAxzQX/tfPLmJTjLr9OD0J+r0OHOf/fiMWkoZMIes84
MsCyadQ8az8zFqJO5g8LBU7i2TSjSd5N8JylYgPvamMWYyP9R84yPnkiAbfRksjk
vP1XOQAZ2dZBFcJsjIg3xR9OBoJgNT4BdYwY3/3KqhiAsF1XUQ4MjGssDhYwJO8F
4YbpTk4gCF8DO7GAkNjjd0zpHcyYN27uL79KTQaZUcUPQww3Q9WXgHl6cqYCy2PB
HmWCNBT6cjRN8tEqQsY2alEhmuSmvj4U36PywBgmYc23mPk5qzKI+W/M3V5s7xCu
M9R7Wx6vAavYyvuo5+d1h8RDqjBlnPyFRRrxDp+xbAzYojFOP7NqpkbjCQAlsmo2
lNiS6/tnyPGQXh+ZfRATCDODARV2TmTPSw3FaukEUt73ss4cb3N+FLV+tjJYVVhU
9KhBnIV7XtpMkB2UwG3MXz/VxkvTAPh33W4e7cf5eRvKxjAk87LgYp/wtsUn/gPs
xehD8442UXZtYQlSism0zULnRbj4Ydgv49KrHMCjYcuNq00kkYEBPwcbgwZU0V/q
RXXnyDg66ABT/e9Ad9OA658vij0aqYRIytA/c8e/TJt1AjeFLMJ4jy35vIKwDyBI
eYV2rwz3T9wv37cTq7VciyVes50gmE43PZ8G8x/PovjynBHRXu0=
=71/K
-----END PGP SIGNATURE-----

--+nBD6E3TurpgldQp--
