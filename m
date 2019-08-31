Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 671EFA44FA
	for <lists+linux-input@lfdr.de>; Sat, 31 Aug 2019 17:25:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726705AbfHaPZF (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Sat, 31 Aug 2019 11:25:05 -0400
Received: from mail-wr1-f68.google.com ([209.85.221.68]:36842 "EHLO
        mail-wr1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726354AbfHaPZF (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Sat, 31 Aug 2019 11:25:05 -0400
Received: by mail-wr1-f68.google.com with SMTP id y19so9783373wrd.3;
        Sat, 31 Aug 2019 08:25:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=k25MOk7BOWPBFNnisijsXHS1mqf7Rp4KqkEnt9CsSGE=;
        b=YJhlWeQzJpvO+RhGSsZ9l1YFjRR2EvmI1hmxLcGfXz4MOnUmRi3/GizZjvWZqqr4bv
         bhXp/2Ulz7KoCwWq1SQlpxNxjadWO3Q5I4UqSP2UaVTAKsCn7v89p9BWEVDcxwBfMbXG
         VX2j6JlukxUsiPUpMWAd6v8pGwXE3bYT5myNNvNfXrtFj48zpruuuGTmWdaYvCuQFJ1V
         sQDIr3Ec9XlOuCr9Bd9LfRvYE4QXZOsK2sSnDSWbsltspIoB5TqT1TlqB9hYzjEnmo6S
         60BeBx9HQfeIK/v3eJGQvpv8x35+l1FoeTuJ9aTBcX35kLP2JHoXCCsS+DBjCksbL1xA
         7V5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=k25MOk7BOWPBFNnisijsXHS1mqf7Rp4KqkEnt9CsSGE=;
        b=g9mEXqaCvqE2FII+ENOSZGXhhlujXn30nqTw0r844oflB2Qt0NRIOw7AvyXoUndvwa
         e1xVfwLSlL8H3ndSEXkS8nnRbvdZw3dmkRKEVyKeaHOc/wPfK7fd688xaR/lSOCe2d1Q
         +Ec9Q+bXVpGh+i6NKfdqy1wji4J1zCZ9beDS/HsrDNGBT5Ni+PCVyu4u/IVL71D09DG9
         ADOn/nVbUAlzM38ZW1h+NhnZbBWYpvpNjlxNC3ylP+9dXmkr5UlXD6FPPFUPGxIoZzxc
         UX0G+2JxcQghgHPNJ3IhCeIB5SZ2QpC1cie2LZrFn2fKJgxLe/tFhMoUoNBbJrtkNuSt
         XLoA==
X-Gm-Message-State: APjAAAWHPh4hQkLyuaZA+4z1+GMoxXra6v/wKwm3Ocl/lePTHV9hHqmU
        6aJ4gdRxnyRh4JI6OSWHBME=
X-Google-Smtp-Source: APXvYqwOHRHMb49iMaBn39bn+79g+BX0KA90yia2PdVU8C/rWtHVAJNXlrfK5a9034BCpZeKhhxwWg==
X-Received: by 2002:adf:f584:: with SMTP id f4mr24335864wro.160.1567265102640;
        Sat, 31 Aug 2019 08:25:02 -0700 (PDT)
Received: from pali ([2a02:2b88:2:1::5cc6:2f])
        by smtp.gmail.com with ESMTPSA id m7sm20346388wmi.18.2019.08.31.08.25.01
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Sat, 31 Aug 2019 08:25:01 -0700 (PDT)
Date:   Sat, 31 Aug 2019 17:25:00 +0200
From:   Pali =?utf-8?B?Um9ow6Fy?= <pali.rohar@gmail.com>
To:     Denis Efremov <efremov@linux.com>
Cc:     Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        linux-kernel@vger.kernel.org, Joe Perches <joe@perches.com>,
        Andrew Morton <akpm@linux-foundation.org>,
        linux-input@vger.kernel.org
Subject: Re: [PATCH v3 09/11] Input: alps - remove unlikely() from IS_ERR*()
 condition
Message-ID: <20190831152500.eg7xqo5ace6wu427@pali>
References: <20190829165025.15750-1-efremov@linux.com>
 <20190829165025.15750-9-efremov@linux.com>
 <20190829175039.GA187474@dtor-ws>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
        protocol="application/pgp-signature"; boundary="p6pa6tjr5e2zkulj"
Content-Disposition: inline
In-Reply-To: <20190829175039.GA187474@dtor-ws>
User-Agent: NeoMutt/20170113 (1.7.2)
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org


--p6pa6tjr5e2zkulj
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thursday 29 August 2019 10:50:39 Dmitry Torokhov wrote:
> On Thu, Aug 29, 2019 at 07:50:23PM +0300, Denis Efremov wrote:
> > "unlikely(IS_ERR_OR_NULL(x))" is excessive. IS_ERR_OR_NULL() already us=
es
> > unlikely() internally.
>=20
> The keyword here is _internally_.
>=20
> https://lore.kernel.org/lkml/20190821174857.GD76194@dtor-ws/
>=20
> So please no.

Dmitry and I already rejected this patch, see also linked-list:
https://lore.kernel.org/lkml/20190820111719.7blyk5jstgwde2ae@pali/

> >=20
> > Signed-off-by: Denis Efremov <efremov@linux.com>
> > Cc: "Pali Roh=C3=A1r" <pali.rohar@gmail.com>
> > Cc: Dmitry Torokhov <dmitry.torokhov@gmail.com>
> > Cc: Joe Perches <joe@perches.com>
> > Cc: Andrew Morton <akpm@linux-foundation.org>
> > Cc: linux-input@vger.kernel.org
> > ---
> >  drivers/input/mouse/alps.c | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >=20
> > diff --git a/drivers/input/mouse/alps.c b/drivers/input/mouse/alps.c
> > index 34700eda0429..ed1661434899 100644
> > --- a/drivers/input/mouse/alps.c
> > +++ b/drivers/input/mouse/alps.c
> > @@ -1476,7 +1476,7 @@ static void alps_report_bare_ps2_packet(struct ps=
mouse *psmouse,
> >  		/* On V2 devices the DualPoint Stick reports bare packets */
> >  		dev =3D priv->dev2;
> >  		dev2 =3D psmouse->dev;
> > -	} else if (unlikely(IS_ERR_OR_NULL(priv->dev3))) {
> > +	} else if (IS_ERR_OR_NULL(priv->dev3)) {
> >  		/* Register dev3 mouse if we received PS/2 packet first time */
> >  		if (!IS_ERR(priv->dev3))
> >  			psmouse_queue_work(psmouse, &priv->dev3_register_work,
> > --=20
> > 2.21.0
> >=20
>=20

--=20
Pali Roh=C3=A1r
pali.rohar@gmail.com

--p6pa6tjr5e2zkulj
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iF0EABECAB0WIQS4VrIQdKium2krgIWL8Mk9A+RDUgUCXWqRSgAKCRCL8Mk9A+RD
Umu+AKChsaP4CSHyL95PY6h8qfvy9VLlVgCgsJJM0b0+JaCmO8UiIbZc/5SHjz4=
=btDG
-----END PGP SIGNATURE-----

--p6pa6tjr5e2zkulj--
