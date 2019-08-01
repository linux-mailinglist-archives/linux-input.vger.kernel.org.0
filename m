Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A96C97D9B8
	for <lists+linux-input@lfdr.de>; Thu,  1 Aug 2019 12:56:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727540AbfHAK4y (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 1 Aug 2019 06:56:54 -0400
Received: from mx2.suse.de ([195.135.220.15]:45040 "EHLO mx1.suse.de"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726783AbfHAK4y (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Thu, 1 Aug 2019 06:56:54 -0400
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
        by mx1.suse.de (Postfix) with ESMTP id 573ACB01C;
        Thu,  1 Aug 2019 10:56:53 +0000 (UTC)
Message-ID: <cd69abeb3883ff7c7e2ff8dbe4db722f4e981875.camel@suse.de>
Subject: Re: [PATCH v2] HID: input: fix a4tech horizontal wheel custom usage
From:   Nicolas Saenz Julienne <nsaenzjulienne@suse.de>
To:     Jiri Kosina <jikos@kernel.org>,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>
Cc:     dmitry.torokhov@gmail.com, wbauer@tmo.at,
        linux-input@vger.kernel.org, linux-kernel@vger.kernel.org
Date:   Thu, 01 Aug 2019 12:56:51 +0200
In-Reply-To: <20190611121320.30267-1-nsaenzjulienne@suse.de>
References: <20190611121320.30267-1-nsaenzjulienne@suse.de>
Content-Type: multipart/signed; micalg="pgp-sha256";
        protocol="application/pgp-signature"; boundary="=-UfwihCv2OFuftwo/Kw1F"
User-Agent: Evolution 3.32.4 
MIME-Version: 1.0
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org


--=-UfwihCv2OFuftwo/Kw1F
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, 2019-06-11 at 14:13 +0200, Nicolas Saenz Julienne wrote:
> Some a4tech mice use the 'GenericDesktop.00b8' usage to inform whether
> the previous wheel report was horizontal or vertical. Before
> c01908a14bf73 ("HID: input: add mapping for "Toggle Display" key") this
> usage was being mapped to 'Relative.Misc'. After the patch it's simply
> ignored (usage->type =3D=3D 0 & usage->code =3D=3D 0). Which ultimately m=
akes
> hid-a4tech ignore the WHEEL/HWHEEL selection event, as it has no
> usage->type.
>=20
> We shouldn't rely on a mapping for that usage as it's nonstandard and
> doesn't really map to an input event. So we bypass the mapping and make
> sure the custom event handling properly handles both reports.
>=20
> Fixes: c01908a14bf73 ("HID: input: add mapping for "Toggle Display" key")
> Signed-off-by: Nicolas Saenz Julienne <nsaenzjulienne@suse.de>
> ---

It would be nice for this patch not to get lost. It fixes issues both repot=
ed
on opensuse and fedora.

I can resubmit it if needed.

Regards,
Nicolas


--=-UfwihCv2OFuftwo/Kw1F
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iQEzBAABCAAdFiEErOkkGDHCg2EbPcGjlfZmHno8x/4FAl1CxXMACgkQlfZmHno8
x/5dTQf/fVEdcSkvGY8ltv5SMW+Rvg6bs5uwo/3S0Z1XQ8irP/Agxrykvnur8qPh
CkVbsTRUFZQnTDI1nKojAyzHHIkKqGaDAi9+PO/vAuPrcBmuNeAgTQRtCJj+PSxe
UfkdqjPyHSLkLrlPLCX4MCvWku4Oy8Bs+JnOvYSYoZkSmKT2x+wGNFmDaUCYj7bG
o3n/DJHejomEvPHnVAp1TRhCOaQ8bcMD25wR/YftW1Mu6niCrrveXg5tNFPWEswo
5XylfZ0KblcuZQTvtvp22MJiat1BGdNzYbJs8cGMzGtjWtocP/NCU48RlGkxFWN5
9Emby6PRbBBji460QnxUpt5RD8HDPQ==
=xtev
-----END PGP SIGNATURE-----

--=-UfwihCv2OFuftwo/Kw1F--

