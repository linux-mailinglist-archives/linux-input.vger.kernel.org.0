Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D155D31DE42
	for <lists+linux-input@lfdr.de>; Wed, 17 Feb 2021 18:33:34 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234467AbhBQRdD (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 17 Feb 2021 12:33:03 -0500
Received: from [139.28.40.42] ([139.28.40.42]:46860 "EHLO
        tarta.nabijaczleweli.xyz" rhost-flags-FAIL-FAIL-OK-OK)
        by vger.kernel.org with ESMTP id S234397AbhBQRcs (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Wed, 17 Feb 2021 12:32:48 -0500
Received: from tarta.nabijaczleweli.xyz (unknown [192.168.1.250])
        by tarta.nabijaczleweli.xyz (Postfix) with ESMTPSA id 4CB7136015E;
        Wed, 17 Feb 2021 18:22:44 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=nabijaczleweli.xyz;
        s=202006; t=1613582564;
        bh=dwHu+sdeHIKyUfCS/scRSx02f3iaHYUimdvjlNSpccM=;
        h=Date:From:Cc:Subject:References:In-Reply-To:From;
        b=evr3z80W83GUYD2f9mLHoZBgTi/kkMo+NJwI8ez2dQGpQKCU3HtMoqicGg4LTtKSx
         I/Fk42oy7dQI1vj9B0tXm93jZmRwhkLO40gfzT4Nbxeq+sulKoPtFzlb2g71HsXcZc
         jEoj5QNgbDRRyDUNpIdpEBTtWiOSLU+NlYPUYrXM8gxP9bQNSAhtcdkG6uorKkO8hX
         9BgGJ3NBrYZJTbK7CkgSZVxKl0jK0/tdExCMzTAD2CPjRl15Snoy+sLnO8XFxfRClV
         jKWswq5f2iVR2EW73Sf9UH6bT+NXrYrYvIz9LQ3N+Pv8zhh4cSzRTVXv/qDXmWwjyK
         N6eXk54ZiahWw==
Date:   Wed, 17 Feb 2021 18:22:43 +0100
From:   Ahelenia =?utf-8?Q?Ziemia=C5=84ska?= 
        <nabijaczleweli@nabijaczleweli.xyz>
Cc:     Benjamin Tissoires <benjamin.tissoires@redhat.com>,
        Peter Hutterer <peter.hutterer@who-t.net>,
        Jiri Kosina <jikos@kernel.org>, linux-input@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH 3/4] HID: input: replace outdated HID numbers+comments with
 macros
Message-ID: <394d6b11ae029c64a0bb44a00bef902069087d03.1613582014.git.nabijaczleweli@nabijaczleweli.xyz>
References: <cover.1613582014.git.nabijaczleweli@nabijaczleweli.xyz>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="t7xev2pzdwa4xwj2"
Content-Disposition: inline
In-Reply-To: <cover.1613582014.git.nabijaczleweli@nabijaczleweli.xyz>
User-Agent: NeoMutt/20210205
To:     unlisted-recipients:; (no To-header on input)
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org


--t7xev2pzdwa4xwj2
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

These were untouched since 2.3.99-pre3, and the explanatory comment for
HID_DG_TIPPRESSURE is TipPressure on other places

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


--t7xev2pzdwa4xwj2
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEfWlHToQCjFzAxEFjvP0LAY0mWPEFAmAtUOIACgkQvP0LAY0m
WPGffg//Yvm3Km1j1Z7r5bjBxfQaQVgrWPt/FiI5goP0r+sQE1IBcCTxp09SdZGR
Uc/TnWJbkiujFG8ZSLeR1g2giup7H0hEw3b6D2Esyd682wNNoty7p3GLv49814CJ
FL4RsBbLMN5bJiIss7lvumcE4C702twd41Rw+u08w1S45iKMEIoYGWTwvhTaeo9T
ZWbhzs7ulmgI9dzLQRDKz9g8qei1bSpfVpBHZVOScIBnzyZ77L/Mob96USEMbZF0
xVNhbqp1FOmz2ovTdQ5C1yRtmfG67LotQ8D1sj96hw1ChmafDRvyZ7KeYr7cZOCQ
Yrc19/wcOIugSnBVAc7BowmVoTAs1iT56QoHd6821iAebahHfy4E6cGWVaMlJRJh
GfT6MeWNdEeXb2xdkq0eAqxEtTVfIIzGAE0VJr0z3qnLAtr3LdvulyAmpYLyCAFW
ATgU8/U0fYfXl1dKOZGapBeTQrvYFYzejcDiNl9w4LDLZc8mTBtXp6qCstrcp22t
tKxz90uZEMsePhzLHU2rVoQ8nrT/mnAMa+3kM7YeA5d7SHrHjY/njL60aF+USsRW
Fk7yGXqumSFmNOJGPVgB2dhD9w/pfQr3JNp9GMZoorcC1yYMZfDrOXYOabVTtyXY
T0RoeC59ba+qKSA/di3yTXsLR2caY1VBjU/rea6QYCiaCNX8o+s=
=TIq5
-----END PGP SIGNATURE-----

--t7xev2pzdwa4xwj2--
