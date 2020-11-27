Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3359E2C6C80
	for <lists+linux-input@lfdr.de>; Fri, 27 Nov 2020 21:19:33 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727952AbgK0USb (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Fri, 27 Nov 2020 15:18:31 -0500
Received: from mail.archlinux.org ([95.216.189.61]:43012 "EHLO
        mail.archlinux.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731345AbgK0ULx (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Fri, 27 Nov 2020 15:11:53 -0500
Received: from [IPv6:2001:8a0:f26a:7e00:d2bc:b624:5e5d:f425] (unknown [IPv6:2001:8a0:f26a:7e00:d2bc:b624:5e5d:f425])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-384) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        (Authenticated sender: ffy00)
        by mail.archlinux.org (Postfix) with ESMTPSA id 119362698D2;
        Fri, 27 Nov 2020 20:11:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=archlinux.org;
        s=dkim-rsa; t=1606507883;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=+Nd+12YLJx2eGe1V7mrolBrhx7LPs3QFZbXCwh8EZGY=;
        b=UrRbOENDHrA1uYJMmg2x2Xul+UU8j4dCjl6vnhtX9PRl/gqwI7GaKeuHekvxPxUqE+9h/N
        oI+PI89onnvtkwT0qm/471eQs5+EPfkMiJgjVhaUW0SakcVLM5X5gyQ3fFpn/qMtyD4+l9
        WNwa9fVKO86V9og9frZENjCO9efsv4w/Uvpm3Usmweab07FE6yHk8meuSMd13jZUJ1pGPm
        AlGZv3f+zraWOOpM+EHdDD/AxfFkeXCfhMLy4c9OKy5TlQHy4FsX1zW1ATKKNXV7WHwNT7
        5Anfsj/IShBFueeDBt+/txkGiFKgSd+W2QTtW2oBPVNJMVToRmLMxcCW+TIjJ+FU8WLGrr
        RwRaVxhfb/kWfAKVp8upABHEkxy/eZ4D7CDu3/PH4lxkGhx7jJn708ZwBA4Gi1yT5XB3ft
        g3a7PiYUNG0rKvwJztxE+cscl62f7gvt1gFM07++tKhUjD1iI0KWIvCsGhnUv8Czp0zTzU
        MDgzrKqYtu9LB2ciylJhRsv+Tpos4Mk8PB4VrISDByBrJ6cqOEtpQIaKFTo85RzCx1RBDp
        yGNlTm3V+ItqfX1Xl3Vd+JUEFYJTc+gFogDC+LZILHvaBKiea2JqSGYm+12+RuFlIRnZqV
        yIJpz4wXdDU+TWKcGltoe2GGtc5jtYUImMnKqYxp5g1TAiU6PMGPc=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=archlinux.org;
        s=dkim-ed25519; t=1606507883;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=+Nd+12YLJx2eGe1V7mrolBrhx7LPs3QFZbXCwh8EZGY=;
        b=pg/suGc2KlaudY/Gx4kH5J6SfrWemRiJz2M9HvfmdxmiBfYv5bgHgoGzov7UdRW+itYGfM
        jsBsLcdX5B8gdQBQ==
Message-ID: <877bfbede4d3bbf40a91c8392218eeab6672e98c.camel@archlinux.org>
Subject: Re: [V3, PATCH] Add additional hidraw input/output report ioctls.
From:   Filipe =?ISO-8859-1?Q?La=EDns?= <lains@archlinux.org>
To:     Dean Camera <dean@fourwalledcubicle.com>,
        linux-input@vger.kernel.org, jikos@kernel.org,
        benjamin.tissoires@redhat.com
In-Reply-To: <d295d0bf-9de7-9927-05b6-2897ada89c42@fourwalledcubicle.com>
References: <20201125223957.5921-1-dean@fourwalledcubicle.com>
         <2e19588821053914eebe30088b4590af51959409.camel@archlinux.org>
         <2c2bfd55-3a03-9839-22f5-16058ac24e35@fourwalledcubicle.com>
         <c8d4d17798e2c9fca417223d4edf5f4b1aebf75d.camel@archlinux.org>
         <d295d0bf-9de7-9927-05b6-2897ada89c42@fourwalledcubicle.com>
Organization: Archlinux
Content-Type: multipart/signed; micalg="pgp-sha256";
        protocol="application/pgp-signature"; boundary="=-Yo3460Ba4DuXoanmQ9Rb"
Date:   Fri, 27 Nov 2020 20:11:21 +0000
MIME-Version: 1.0
User-Agent: Evolution 3.38.2 
Authentication-Results: mail.archlinux.org;
        auth=pass smtp.auth=ffy00 smtp.mailfrom=lains@archlinux.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org


--=-Yo3460Ba4DuXoanmQ9Rb
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, 2020-11-27 at 15:05 +1100, Dean Camera wrote:
> Thank you for the review, Filipe!
>=20
> I'm still new to the kernel patch submission process, so I'm a little=20
> perplexed by the next steps. Who will decide if it is to be applied, and=
=20
> is there any further action I need to take?

No worries :)
That'd probably Benjamin Tissoires, co-maintainer of the HID subsystem.
There is no further action you need to take, just wait. Please understand t=
hat
these things can sometimes take a while as maintainer time is limited and t=
hey
may have a long backlog to fight through.

Also be aware that maintainers might be a bit conservative about adding new
features as they will be required to maintain them in the long run, so don'=
t
take it personally if they chose not to to merge some of your patches.

> I am obviously keen, but not impatient, to get this feature in. I'm=20
> happy to follow whatever process is required, I just haven't found=20
> anything beyond the initial "submitting your patch" documentation.

Yeah, I sympathize. The process essentially is to send the patch and wait :=
P

Just one thing, in the kernel mailing lists you are discouraged to top-post=
.

A: Because it messes up the order in which people normally read text.
Q: Why is top-posting such a bad thing?

A: Top-posting.
Q: What is the most annoying thing in e-mail?

A: No.
Q: Should I include quotations after my reply?

> Cheers!
> - Dean

Cheers,
Filipe La=C3=ADns

--=-Yo3460Ba4DuXoanmQ9Rb
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEE0jW0leqs33gyftiw+JPGdIFqqV0FAl/BXWQACgkQ+JPGdIFq
qV1vBA//QWMrbliu7HOGDXHCPE1Ent0kEvS3HG3VqdcUykfcFj07IO7/sa4EVJsj
tzbdBG8KCjBE3juOIMz7B4mYNR7AFZPKHuOBEkm579A7pa7SfWon/7veDEbd7TZ9
LmSilomOSr2xm2GkdEeGgYF9EtYGUtVgItO4k3q7b1/Ux3O7sGdhPIn9M9CID0Qq
hbdumPwEHEuTsw4LOjQRNDisxzTZvdxBXxw3PWnfVMrIaF0RBbOazWZa7nRg0Dpb
Gh/9kWPUW/HekMf37QN0rtSnOlYHuX3gp6MBdd+Un5scV0/ImynjoVU5DXZtFADs
qL2XLED5ce7qkEIOkSZu/qo4ZWFdgcfVXvV1L/70Vu8nB1hPNTmOqkWl9vK/eBqU
MWBZdxcGjXuFrXHejnQ/a5vKOiEgbk9UO4O/2zpLLhXpuQhMxnMn0jM7l5tdnIh4
Z95Y1RNPqlD44L7NmEHc3Q/RwNpcOJh86krzt2+6Pc6de4bk+243p1CMB6nzxC72
EJXPNslTRRFrX26DA0q08YVEfTyGdGAW5z2uS2phRUUfmHkJ/4dpC7P1WwVGmOrD
/5LdzbsQ196bqIy0MQVsHSEJpyUQATYa6s8HNb8ef5rysrMK3ARtUN3OipqFJLpx
DDZ7o/Gy8I2jcvNrfXM9VziIJQTD5A6lNI7UJbjmuZKb7Tw/MWM=
=ppUY
-----END PGP SIGNATURE-----

--=-Yo3460Ba4DuXoanmQ9Rb--

