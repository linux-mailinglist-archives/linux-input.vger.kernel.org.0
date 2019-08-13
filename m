Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2CB178BB5B
	for <lists+linux-input@lfdr.de>; Tue, 13 Aug 2019 16:21:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729342AbfHMOVc (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 13 Aug 2019 10:21:32 -0400
Received: from orion.archlinux.org ([88.198.91.70]:54934 "EHLO
        orion.archlinux.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727561AbfHMOVc (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Tue, 13 Aug 2019 10:21:32 -0400
Received: from orion.archlinux.org (localhost [127.0.0.1])
        by orion.archlinux.org (Postfix) with ESMTP id D29FB1477D7B20;
        Tue, 13 Aug 2019 14:21:29 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on orion.archlinux.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.7 required=5.0 tests=ALL_TRUSTED=-1,BAYES_00=-1,
        DMARC_FAIL_NONE=0.25,T_DMARC_POLICY_NONE=0.01,T_DMARC_TESTS_FAIL=0.01
        autolearn=no autolearn_force=no version=3.4.2
X-Spam-BL-Results: 
Received: from saetre (unknown [154.53.1.40])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-384) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        (Authenticated sender: ffy00)
        by orion.archlinux.org (Postfix) with ESMTPSA;
        Tue, 13 Aug 2019 14:21:29 +0000 (UTC)
Message-ID: <d558b953e88558b8d7955e591fefbe898edeb3ae.camel@archlinux.org>
Subject: Re: [PATCH 0/2] Fix support of a few Logitech devices broken in 5.3
From:   Filipe =?ISO-8859-1?Q?La=EDns?= <lains@archlinux.org>
To:     Benjamin Tissoires <benjamin.tissoires@redhat.com>,
        Jiri Kosina <jikos@kernel.org>
Cc:     linux-input@vger.kernel.org, linux-kernel@vger.kernel.org
In-Reply-To: <20190813133807.12384-1-benjamin.tissoires@redhat.com>
References: <20190813133807.12384-1-benjamin.tissoires@redhat.com>
Organization: Archlinux
Content-Type: multipart/signed; micalg="pgp-sha256";
        protocol="application/pgp-signature"; boundary="=-C0SorkiN9smqF35MFDat"
Date:   Tue, 13 Aug 2019 15:21:28 +0100
MIME-Version: 1.0
User-Agent: Evolution 3.32.4 
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org


--=-C0SorkiN9smqF35MFDat
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, 2019-08-13 at 15:38 +0200, Benjamin Tissoires wrote:
> Hi Jiri,
>=20
> another set of patches to send to Linus ASAP.
> It turns out that we have been breaking devices, so this should
> be sent before 5.3 final.
>=20
> Cheers,
> Benjamin
>=20
> Benjamin Tissoires (2):
>   Revert "HID: logitech-hidpp: add USB PID for a few more supported
>     mice"
>   HID: logitech-hidpp: remove support for the G700 over USB
>=20
>  drivers/hid/hid-logitech-hidpp.c | 22 ----------------------
>  1 file changed, 22 deletions(-)
>=20

Reviewed-by: Filipe La=C3=ADns <lains@archlinux.org>

Thanks,
Filipe La=C3=ADns

--=-C0SorkiN9smqF35MFDat
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEE0jW0leqs33gyftiw+JPGdIFqqV0FAl1Sx18ACgkQ+JPGdIFq
qV0PSBAAtHhcycfda272Ii5CyvMWH8Xh965T8lnde3yUPyiBb6Yr913OAx13DCqa
WWj4m+HTXVyrHR6ykuVwZhGX8M5WwCq5UnkIygup7+tHSzaPHtPmvOoJYqkjtsgp
IMeH7swN9o7nHpjHcyUyM5mimbBhn/qX4mhJ6GTpF1vMtlJcbBvlj6H/Kl1XbxGA
S2dc//wfJUOyxh6lp1Wxb4f/l87cZghX8meuWS3amzVkZm2LHcIIkzefs77Fj8P1
bnaBsn1eh7vFFs4H154RBHxUM4qDW/i6WWGEUXAuEAE51XbzQoZIrVofipky553U
/4We0roMJiOt423VG8tm90WuXFeDrPjW5CT/ud9x9Zc8NxXIP68tlrfDJsCZLaiI
YQsOopy2k7fDrNBFSXQ8Ak5D6N7WPuJ7DXCPOK2+zEaPb3R7iEL5eBTaFFLq/oEj
2GemuiWsHcXWo5SxhyeuMNlbVA9oZLtvLieG6tod8PI9r6c4H497N8+jfFQZohxO
f/3lAmHen3LILBmcZXmfgma2avGHRq1PChoEMAyn0+Ef6xBgwlipGFKTveZ8nc8S
7f1Sqp3H14oo/oS09NybkLgXHPaqTrmFTPDNR7qwuJxOA4ZwnE1l9r1sYYws9VTp
Ug36Lp+Mj7vDQraqrwi7kYrxIHf8AqZRbx/diGRKdWtaPSmB3VA=
=UHMC
-----END PGP SIGNATURE-----

--=-C0SorkiN9smqF35MFDat--
