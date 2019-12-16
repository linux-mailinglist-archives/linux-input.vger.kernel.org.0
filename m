Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0227111FCA7
	for <lists+linux-input@lfdr.de>; Mon, 16 Dec 2019 02:48:14 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726426AbfLPBsN (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Sun, 15 Dec 2019 20:48:13 -0500
Received: from orion.archlinux.org ([88.198.91.70]:40560 "EHLO
        orion.archlinux.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726299AbfLPBsM (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Sun, 15 Dec 2019 20:48:12 -0500
Received: from orion.archlinux.org (localhost [127.0.0.1])
        by orion.archlinux.org (Postfix) with ESMTP id 89C2017444CE4F;
        Mon, 16 Dec 2019 01:48:10 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.3 (2019-12-06) on orion.archlinux.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.7 required=5.0 tests=ALL_TRUSTED=-1,BAYES_00=-1,
        DMARC_FAIL_NONE=0.25,T_DMARC_POLICY_NONE=0.01,T_DMARC_TESTS_FAIL=0.01
        autolearn=no autolearn_force=no version=3.4.3
X-Spam-BL-Results: 
Received: from genesis (unknown [IPv6:2001:8a0:f254:2300:dad6:8c60:8394:88da])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-384) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        (Authenticated sender: ffy00)
        by orion.archlinux.org (Postfix) with ESMTPSA;
        Mon, 16 Dec 2019 01:48:10 +0000 (UTC)
Message-ID: <92d802d928be1ce6c4c64394ee5775f56806d064.camel@archlinux.org>
Subject: Re: hid-logitech-hidpp / hid-logitech-dj driver hiding inputs and
 breaking Logitech G700s buttons
From:   Filipe =?ISO-8859-1?Q?La=EDns?= <lains@archlinux.org>
To:     Hamza Attak <hamza@attak.fr>
Cc:     nlopezcasad@logitech.com, benjamin.tissoires@gmail.com,
        linux-input@vger.kernel.org
In-Reply-To: <1576458752.26677.0@auth.smtp.1and1.fr>
References: <1576438494.7054.3@auth.smtp.1and1.fr>
         <895e66cf60a022a01701d03d8b873321aebcc30a.camel@archlinux.org>
         <1576458752.26677.0@auth.smtp.1and1.fr>
Organization: Archlinux
Content-Type: multipart/signed; micalg="pgp-sha256";
        protocol="application/pgp-signature"; boundary="=-8T2OofBd7TkRDJXR/RO0"
Date:   Mon, 16 Dec 2019 01:48:08 +0000
MIME-Version: 1.0
User-Agent: Evolution 3.34.2 
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org


--=-8T2OofBd7TkRDJXR/RO0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, 2019-12-16 at 01:12 +0000, Hamza Attak wrote:
> Hi Filipe,
>=20
> I'm on the latest 5.4.3 from kernel from kernel.org git repository. Only
> a few security options are tweaked in the kconfig.
> For your information, I am also facing the same issue on untouched=20
> Ubuntu
> built kernels,
>=20
> I never followed linux-input before and don't know how active was the=20
> code
> taking care of the G700s, but do you think there might have been a=20
> regression
> since you say that it was a fixed issue?
>=20
> Unfortunately, I didn't keep track on when it happened, ie after a=20
> kernel
> upgrade or if it was always there and I only noticed after trying the=20
> mouse
> wirelessly.
>=20
> Thanks,
> Hamza ATTAK.
>=20

Okay. Do the logs show anything interesting?

I don't have the mouse but I think Benjamin does. Let's see if he knows
what's going on.

Filipe La=C3=ADns

--=-8T2OofBd7TkRDJXR/RO0
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEE0jW0leqs33gyftiw+JPGdIFqqV0FAl324lEACgkQ+JPGdIFq
qV1yphAArXJjv0qkn4Z8FG917aie1ehGZGfne1+GghpQLP8c5QGIHdoViq2lM/1B
UvYI7+IFgiLCTEG+T7jlkSciv4N/4Ai4b93z3xCsYXXrWYLUyPQzWOClonGW4LaL
TJSIA1UuFH6u80mzBeh9+ZnHJvJEpa+26qv+0vXOgCP/MdeIGQjiEOfNlE2Z6u2z
XSBcCLft5OAVrYJnUQxFXLBIvMAy0PosoScDMQbzWHY7BSHe1jF5yEuZnKGE9e9s
+EfvO64mzLB7kwk07PIOsBzqPkY8Eoqm4kWvs0bemRxWESDn6RliL70epITPoAn0
EUdOZQlTY1ToEoSvjm65xagdR+Y0rIxEMZUTgz9jm+Jw0QtUrUPsQkbNijgKMYxf
nUlBAy7Efory8SnKjrkgrJLb/r4MohXr4iaMsmPKnnaJyULlLOf00JxB9dI313CO
Ufd8jpzKl1NTro70pJQ6xRa/k0yUuVFadi99yuGOlN8KLnj+Eow9f6xIrZVJp+R+
rygJfBMkvDO7W5mohLdU81nzL9DODACN0ASMLDX+t4uzkpgvnIIjOicfGlGln/u7
yr/lM7TiA/7Hg/3ILOuZtI481AyjCEgEW5Hna5iPsl8xFOAQsePLnFPw1BTe8Dax
uGJfCBWODonbBLWBgZLoG6MwlqOsPNXrNAE9UMQL3oNapLUV7aE=
=4tmZ
-----END PGP SIGNATURE-----

--=-8T2OofBd7TkRDJXR/RO0--
