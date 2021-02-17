Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E407A31DE40
	for <lists+linux-input@lfdr.de>; Wed, 17 Feb 2021 18:33:33 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234462AbhBQRc7 (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 17 Feb 2021 12:32:59 -0500
Received: from [139.28.40.42] ([139.28.40.42]:46858 "EHLO
        tarta.nabijaczleweli.xyz" rhost-flags-FAIL-FAIL-OK-OK)
        by vger.kernel.org with ESMTP id S233885AbhBQRcq (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Wed, 17 Feb 2021 12:32:46 -0500
Received: from tarta.nabijaczleweli.xyz (unknown [192.168.1.250])
        by tarta.nabijaczleweli.xyz (Postfix) with ESMTPSA id 3CCEE3601D2;
        Wed, 17 Feb 2021 18:22:49 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=nabijaczleweli.xyz;
        s=202006; t=1613582569;
        bh=ziY0iXdxwSWXFOzoXNDOFn5JohGhP3IMScquKcj790E=;
        h=Date:From:Cc:Subject:References:In-Reply-To:From;
        b=dBtD6W7ffddYH3UpRpeMSIBASbBvDE0f49x3J5KBtcCW6VsP4BcwMFuR6FL1oFJxa
         bqy4Kh7A5puaWJgQ8kP2TKCLApSB4rerNuVZ4gMfWmndAyFpk3d334E71H9rjJzRl5
         kQWbdinoT448hsAqOqRcfuC3JfpZjslvphls0uDvUvLu5Mx/RVHjPqF4lqqnsDjrUb
         2Qo/pEWxJ9ftZzVYC0HTmnGc+kfwQMV6SsCE236BBZA2i1yrD9Ze42LrOeMxjUtqfE
         50x014EZIDuKlnOIH7k5GyTSo1HNe+F9IIeCSLXik4PDut/m/NHDuIIlfTTzkxhr8w
         ZhTU12bo9duHQ==
Date:   Wed, 17 Feb 2021 18:22:48 +0100
From:   Ahelenia =?utf-8?Q?Ziemia=C5=84ska?= 
        <nabijaczleweli@nabijaczleweli.xyz>
Cc:     Benjamin Tissoires <benjamin.tissoires@redhat.com>,
        Peter Hutterer <peter.hutterer@who-t.net>,
        Jiri Kosina <jikos@kernel.org>, linux-input@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH 4/4] HID: input: work around Win8 stylus-on-touchscreen
 reporting
Message-ID: <b0cb2d0ee8743263608284e0e5112c446e3cb2ee.1613582014.git.nabijaczleweli@nabijaczleweli.xyz>
References: <cover.1613582014.git.nabijaczleweli@nabijaczleweli.xyz>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="ebko57ktge7ctid7"
Content-Disposition: inline
In-Reply-To: <cover.1613582014.git.nabijaczleweli@nabijaczleweli.xyz>
User-Agent: NeoMutt/20210205
To:     unlisted-recipients:; (no To-header on input)
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org


--ebko57ktge7ctid7
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

With this, these devices now behave as tablets as expected by userspace

Signed-off-by: Ahelenia Ziemia=C5=84ska <nabijaczleweli@nabijaczleweli.xyz>
---
 drivers/hid/hid-input.c | 41 +++++++++++++++++++++++++++++++++++++++++
 1 file changed, 41 insertions(+)

diff --git a/drivers/hid/hid-input.c b/drivers/hid/hid-input.c
index a5ba92978473..b8813fc3e9d2 100644
--- a/drivers/hid/hid-input.c
+++ b/drivers/hid/hid-input.c
@@ -1273,6 +1273,41 @@ static void hidinput_handle_scroll(struct hid_usage =
*usage,
 	input_event(input, EV_REL, usage->code, hi_res);
 }
=20
+/*
+ * Win8 tablet stylus devices send, in order:
+ *   HID_DG_TIPSWITCH (BTN_TOUCH)
+ *   HID_DG_INVERT    (BTN_TOOL_RUBBER)
+ *   HID_DG_ERASER    (BTN_TOUCH)
+ *   HID_DG_INRANGE   (BTN_TOOL_PEN)
+ *
+ * For each of these states:
+ *   hover     :                         INRANGE
+ *   touching  : TIPSWITCH
+ *   hover+2   :           INVERT        INRANGE
+ *   touching+2:                  ERASER INRANGE
+ *
+ * Which means we'd send BTN_TOUCH=3D0 + BTN_TOOL_PEN=3D1 on proximity,
+ * then BTN_TOUCH=3D1 and BTN_TOOL_PEN=3D0 in consecutive groups when touc=
hed,
+ * indicating the stylus leaving the screen as soon as the two meet.
+ */
+static void hidinput_fixup_win8_inrange(struct hid_device *hid, struct hid=
_field *field, __s32 *value)
+{
+	unsigned f, u;
+	struct hid_field *rfield;
+
+	if (!*value) {
+		for (f =3D 0; f < field->report->maxfield; ++f) {
+			rfield =3D field->report->field[f];
+			for (u =3D 0; u < rfield->maxusage; ++u) {
+				if (rfield->usage[u].hid =3D=3D HID_DG_TIPSWITCH) {
+					*value =3D rfield->value[u];
+					return;
+				}
+			}
+		}
+	}
+}
+
 void hidinput_hid_event(struct hid_device *hid, struct hid_field *field, s=
truct hid_usage *usage, __s32 value)
 {
 	struct input_dev *input;
@@ -1306,7 +1341,13 @@ void hidinput_hid_event(struct hid_device *hid, stru=
ct hid_field *field, struct
 		return;
 	}
=20
+	if (usage->hid =3D=3D HID_DG_ERASER && value)
+		*quirks |=3D HID_QUIRK_INVERT;
+
 	if (usage->hid =3D=3D HID_DG_INRANGE) {
+		if (hid->group =3D=3D HID_GROUP_MULTITOUCH_WIN_8)
+			hidinput_fixup_win8_inrange(hid, field, &value);
+
 		if (value) {
 			input_event(input, usage->type, (*quirks & HID_QUIRK_INVERT) ? BTN_TOOL=
_RUBBER : usage->code, 1);
 			return;
--=20
2.20.1

--ebko57ktge7ctid7
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEfWlHToQCjFzAxEFjvP0LAY0mWPEFAmAtUOcACgkQvP0LAY0m
WPEsSw/9FOl8WYpFD9PhApLY7h33XSD93qqJ/fUAxl2Ev4X5DjB2ASd/ghtwbDWm
rEkPnwWyyvKwQeBc11EEggP4U2lWghBthwxhWycCuLBiUw/J9L4XVi4sLWhdfBBm
PyjP7CPSo22y3vk4S94ATB8GeCMIde8unJFugoIyW7aP0esspAsfKukv9Tk4grGR
fPrv3Sxeq5sHEZPtwE4jL0z872EvqZTQewncN39TJK6BNqOvNwLHntS8UsYrZtSS
j8aGuY6t9c9MUEm1+iFkGS0m5zZ1ULEZ/LSo7zLHqIJTEIRFjaoD57DRxiICGEIF
Jkq+SC72F14/cWBRwRWt/6sX7q7QXRG0qNE/Ksc/aanOyMJgIQVsPtkVP2OMF/sv
DwEp5LTRGPp+ilUdn5mRFOavT2uHADYqTjS65s04CZpWMFsTV8TqGlydOoZbHSX6
uFxVGY3e4rOz64Kp6o69XU0oNE+AV5xg8mkefFTYzm0zjWrJMl0RJYmgvGQlEfS8
wPJ6uApzDdP+MkJAEVDBm2YPTUVP5/7tjvxt+zBz9ARon+i+cziApiVkpOcXDmSb
eABvttue6lP7J8fjyP909u8YptS3CoKfOMXXVSzLQyI/XwQHMDfBYuZPjOXNQgua
9uVrkoiIY1xrunkIHkAqORmUtqa/N8ORWtV9f+on08MVBmZgH+c=
=3kSe
-----END PGP SIGNATURE-----

--ebko57ktge7ctid7--
