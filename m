Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 9C046D2209
	for <lists+linux-input@lfdr.de>; Thu, 10 Oct 2019 09:44:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1733215AbfJJHmu (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 10 Oct 2019 03:42:50 -0400
Received: from mx2.suse.de ([195.135.220.15]:53236 "EHLO mx1.suse.de"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1733068AbfJJHmu (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Thu, 10 Oct 2019 03:42:50 -0400
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
        by mx1.suse.de (Postfix) with ESMTP id 234C8AC5B;
        Thu, 10 Oct 2019 07:42:48 +0000 (UTC)
Message-ID: <9c7526b57ca330a686439921a0672d50553f4d2d.camel@suse.de>
Subject: Re: [PATCH v2] HID: core: check whether usage page item is after
 usage id item
From:   Nicolas Saenz Julienne <nsaenzjulienne@suse.de>
To:     Candle Sun <candlesea@gmail.com>
Cc:     Jiri Kosina <jikos@kernel.org>,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>,
        orson.zhai@unisoc.com,
        "open list:HID CORE LAYER" <linux-input@vger.kernel.org>,
        lkml <linux-kernel@vger.kernel.org>,
        Candle Sun <candle.sun@unisoc.com>,
        Nianfu Bai <nianfu.bai@unisoc.com>
Date:   Thu, 10 Oct 2019 09:42:45 +0200
In-Reply-To: <CAPnx3XPDA_n_yjyiAqwX05ee0ez3tUrJz=2tQ95VeiA_dRA-xA@mail.gmail.com>
References: <1570625609-11083-1-git-send-email-candlesea@gmail.com>
         <d739f691b677fb3ed88a23476d221527a87c363d.camel@suse.de>
         <CAPnx3XPDA_n_yjyiAqwX05ee0ez3tUrJz=2tQ95VeiA_dRA-xA@mail.gmail.com>
Content-Type: multipart/signed; micalg="pgp-sha256";
        protocol="application/pgp-signature"; boundary="=-5jhaCDq01xP+MKyVBEDl"
User-Agent: Evolution 3.32.4 
MIME-Version: 1.0
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org


--=-5jhaCDq01xP+MKyVBEDl
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, 2019-10-10 at 11:05 +0800, Candle Sun wrote:
> > > -static void hid_concatenate_usage_page(struct hid_parser *parser)
> > > +static void hid_concatenate_last_usage_page(struct hid_parser *parse=
r)
> > >  {
> > >       int i;
> > > +     unsigned int usage;
> > > +     unsigned int usage_page =3D parser->global.usage_page;
> > > +
> > > +     if (!parser->local.usage_page_last)
> > > +             return;
> > >=20
> > >       for (i =3D 0; i < parser->local.usage_index; i++)
> >=20
> > Technically correct but it's preferred if you use braces here.
> >=20
>=20
> Nicolas, do you mean this:
>=20
> @@ -563,12 +563,13 @@ static void
> hid_concatenate_last_usage_page(struct hid_parser *parser)
>         if (!parser->local.usage_page_last)
>                 return;
>=20
> -       for (i =3D 0; i < parser->local.usage_index; i++)
> +       for (i =3D 0; i < parser->local.usage_index; i++) {
>                 if (parser->local.usage_size[i] <=3D 2) {
>                         usage =3D parser->local.usage[i];
>                         parser->local.usage[i] =3D
>                                 GET_COMPLETE_USAGE(usage_page, usage);
>                 }
> +       }
>  }

Yes, thanks!

Regards,
Nicolas


--=-5jhaCDq01xP+MKyVBEDl
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iQEzBAABCAAdFiEErOkkGDHCg2EbPcGjlfZmHno8x/4FAl2e4PUACgkQlfZmHno8
x/69vwgAjR8aeJo21xhyQKJHYyPaFmT+yloEpKJegfetDk817eWMx1SVaaGxTFLv
JJ9hiehw004r1WtZcwHiSAI6f2+D4LdjOVUtIhb9Osw9Qj+Zf5nLdBDuKhQJwuAz
rVPYNLHr8WUB4x1VW1Y3wa5j1ydD0rohmH2XneiqsuWylFxr/8oQl1UqRTGRsmxC
R9WF5HSU49SXE7r7Vm/7JYw+jL07r8ac1EK55PR5p85DxfSmDUYUmw6Rzptq0bT/
JNMzdE5h1bQSi+xQbiCJwCSTN3VAd/5+Rni1ZJeMS8k1jXkU2exNZ6BNN46DG+KY
eejOJVdCuVF93W5COr2E/PHkn4mpAg==
=8Prm
-----END PGP SIGNATURE-----

--=-5jhaCDq01xP+MKyVBEDl--

