Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CDA7C331515
	for <lists+linux-input@lfdr.de>; Mon,  8 Mar 2021 18:42:52 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230250AbhCHRmR (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 8 Mar 2021 12:42:17 -0500
Received: from [139.28.40.42] ([139.28.40.42]:54276 "EHLO
        tarta.nabijaczleweli.xyz" rhost-flags-FAIL-FAIL-OK-OK)
        by vger.kernel.org with ESMTP id S230050AbhCHRmP (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Mon, 8 Mar 2021 12:42:15 -0500
Received: from tarta.nabijaczleweli.xyz (unknown [192.168.1.250])
        by tarta.nabijaczleweli.xyz (Postfix) with ESMTPSA id 5F75C360009;
        Mon,  8 Mar 2021 18:42:14 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=nabijaczleweli.xyz;
        s=202006; t=1615225334;
        bh=BYaCJkUhOQoa5P9mbJc0BTz9QByHDKu5+BcbBE3FaPk=;
        h=Date:From:Cc:Subject:References:In-Reply-To:From;
        b=P6DptIHR+1gLikE+wsuxmKyIwCg+FhMgWgKfcv5jdmRH8XRFd9aKffS8xEygcqYtT
         Vc28+aZrHepEg9lFeXk/xy5GVj7EtR0DZ3Vz+neOZB57iEsknpXaR3zNWr/EgxiyO7
         IpzoiTuUBnm/Y0pH0kV4xRh24t5GbX9S61lzh2X+IIoyioTG+MoKGF/nKT8MQ94ju/
         9fcLO2/BU9efkfCe8yJV3pAq1KfAJ0ZaEgvkOhpwaX2WBLwkm/h8DC0RIYDtGvztQH
         E7jIdJN5EjDZYjQH8ZZz31HyTk/nk//D033PcLHevFWyW40raLvEpfgdVYeIJFOcRY
         Pew0GQeju0knQ==
Date:   Mon, 8 Mar 2021 18:42:13 +0100
From:   Ahelenia =?utf-8?Q?Ziemia=C5=84ska?= 
        <nabijaczleweli@nabijaczleweli.xyz>
Cc:     Benjamin Tissoires <benjamin.tissoires@redhat.com>,
        Peter Hutterer <peter.hutterer@who-t.net>,
        Jiri Kosina <jikos@kernel.org>, linux-input@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH v2 3/4] HID: input: replace outdated HID numbers+comments
 with macros
Message-ID: <78bb4e254edc8a7c99b5e9991e84145dbe7407fb.1615224800.git.nabijaczleweli@nabijaczleweli.xyz>
References: <cover.1615224800.git.nabijaczleweli@nabijaczleweli.xyz>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="u2xbho7rlrlkrtzk"
Content-Disposition: inline
In-Reply-To: <cover.1615224800.git.nabijaczleweli@nabijaczleweli.xyz>
User-Agent: NeoMutt/20210205
To:     unlisted-recipients:; (no To-header on input)
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org


--u2xbho7rlrlkrtzk
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

These were untouched since 2.3.99-pre3, and the explanatory comment for
HID_DG_TIPPRESSURE is TipPressure in other places

Signed-off-by: Ahelenia Ziemia=C5=84ska <nabijaczleweli@nabijaczleweli.xyz>
---
 drivers/hid/hid-input.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/hid/hid-input.c b/drivers/hid/hid-input.c
index f23027d2795b..a5ba92978473 100644
--- a/drivers/hid/hid-input.c
+++ b/drivers/hid/hid-input.c
@@ -1301,12 +1301,12 @@ void hidinput_hid_event(struct hid_device *hid, str=
uct hid_field *field, struct
 		return;
 	}
=20
-	if (usage->hid =3D=3D (HID_UP_DIGITIZER | 0x003c)) { /* Invert */
+	if (usage->hid =3D=3D HID_DG_INVERT) {
 		*quirks =3D value ? (*quirks | HID_QUIRK_INVERT) : (*quirks & ~HID_QUIRK=
_INVERT);
 		return;
 	}
=20
-	if (usage->hid =3D=3D (HID_UP_DIGITIZER | 0x0032)) { /* InRange */
+	if (usage->hid =3D=3D HID_DG_INRANGE) {
 		if (value) {
 			input_event(input, usage->type, (*quirks & HID_QUIRK_INVERT) ? BTN_TOOL=
_RUBBER : usage->code, 1);
 			return;
@@ -1316,7 +1316,7 @@ void hidinput_hid_event(struct hid_device *hid, struc=
t hid_field *field, struct
 		return;
 	}
=20
-	if (usage->hid =3D=3D (HID_UP_DIGITIZER | 0x0030) && (*quirks & HID_QUIRK=
_NOTOUCH)) { /* Pressure */
+	if (usage->hid =3D=3D HID_DG_TIPPRESSURE && (*quirks & HID_QUIRK_NOTOUCH)=
) {
 		int a =3D field->logical_minimum;
 		int b =3D field->logical_maximum;
 		input_event(input, EV_KEY, BTN_TOUCH, value > a + ((b - a) >> 3));
--=20
2.20.1


--u2xbho7rlrlkrtzk
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEfWlHToQCjFzAxEFjvP0LAY0mWPEFAmBGYfQACgkQvP0LAY0m
WPEyXw//Ti/KMtRtiINBuS04q0QkWrb05mM4SMiVkJCDAbPSuI16LUyeHkdR7r7w
Vw3OsbFBcPXtVnYPcSjjwa3HfsgvVc/fBpPCx+Sr5KJaA1Bub9BFAJtSNINCtbjE
b61q45k79lELEgViEtrtWzXZ1S4LmH5gqdrYHoh8GXt+KLZcNPb7XSeSwjiG19BC
uDRMbMavSpAmuYGvQGnPtskOQksctRD5h87W72J+OjZP+DfZIWYT3KTcDmU+4J4o
+98p50gbLAWS/6v2jkoAT9PG1VOQms8eM0uV+kEetEEl+r2Zb73pSQL5kp6rmzoT
8gtu62CQU0tApy9/WXgZF0jk04mnH2D8EbtkuqscjQ8hts0WWls490FJyd15AC3/
6kQP7TablzHR9qpN/nXIupz5b2yoBRiavbThinTN19gVnbouR6AdKgFBNw0KyN1q
KD2cbbn/QcwlOhjb1M7Vuu8oNCxTZKDQ5oRj4Veaj1ftAnZEJI3EKgQ9pEySnKtG
GpFRGhJAQTQIArJvisot/ikdfyp0Gekx/TVB+DMW+7StC08CP24ToRlY7T3nuqqQ
CsA+E3lHSMkt63+2L4EiyTUApwaufgfGUwHgRH02MXF4Wo2SO81dloVYvjXIE9fv
cmVyY2yvJOfeUFZweWUZ0irbVPoybC0nbX59Btda8ULql2RqczY=
=iWir
-----END PGP SIGNATURE-----

--u2xbho7rlrlkrtzk--
