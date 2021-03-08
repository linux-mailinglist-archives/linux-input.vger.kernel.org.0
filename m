Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3A7BD331517
	for <lists+linux-input@lfdr.de>; Mon,  8 Mar 2021 18:43:21 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230200AbhCHRmt (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 8 Mar 2021 12:42:49 -0500
Received: from [139.28.40.42] ([139.28.40.42]:54286 "EHLO
        tarta.nabijaczleweli.xyz" rhost-flags-FAIL-FAIL-OK-OK)
        by vger.kernel.org with ESMTP id S230050AbhCHRmV (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Mon, 8 Mar 2021 12:42:21 -0500
Received: from tarta.nabijaczleweli.xyz (unknown [192.168.1.250])
        by tarta.nabijaczleweli.xyz (Postfix) with ESMTPSA id 7CA523602D8;
        Mon,  8 Mar 2021 18:42:19 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=nabijaczleweli.xyz;
        s=202006; t=1615225339;
        bh=O3opi9rvyEpgs9nlMtb3A5XUwC6OHkH6ahCapGdL/hs=;
        h=Date:From:Cc:Subject:References:In-Reply-To:From;
        b=SvwdSa3yVVW9ZP1ubMdmgBQmmi+ZhxESnXAc6EpAR2uqicG0VC850oEvsoimg9QXf
         lM4Y2S+xcTVYVjAoqCzfCyRIJ+9vVOb46onYgcoKyJFL0kxQOe1oIgacJVDr6fScFJ
         OKiEjbs+nF/CL0U241YHYE91ZEkmfzAe5nif4FGNGmZkqh0aE00g2YYsa2ADammlot
         GUIk66QxtRIWAunV8NMrFqhpoMO2JwW4e5/Pdn2L47f3cWmTp6l5YDgcohRVPPUUAl
         CPMB69qkBaa1zh2sPXbROOZ2Huty3/jYnpR/DL6CGr3draWJce1zlJ2vkFYTBHMyr6
         M7QQesQhqmtTg==
Date:   Mon, 8 Mar 2021 18:42:18 +0100
From:   Ahelenia =?utf-8?Q?Ziemia=C5=84ska?= 
        <nabijaczleweli@nabijaczleweli.xyz>
Cc:     Benjamin Tissoires <benjamin.tissoires@redhat.com>,
        Peter Hutterer <peter.hutterer@who-t.net>,
        Jiri Kosina <jikos@kernel.org>, linux-input@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH v2 4/4] HID: input: work around Win8 stylus-on-touchscreen
 reporting
Message-ID: <2ca91ac7cf92e3048a236db3cd519f04e12c1e61.1615224800.git.nabijaczleweli@nabijaczleweli.xyz>
References: <cover.1615224800.git.nabijaczleweli@nabijaczleweli.xyz>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="nuuyouwigtdbc5q2"
Content-Disposition: inline
In-Reply-To: <cover.1615224800.git.nabijaczleweli@nabijaczleweli.xyz>
User-Agent: NeoMutt/20210205
To:     unlisted-recipients:; (no To-header on input)
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org


--nuuyouwigtdbc5q2
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

With this, these devices now behave as tablets as expected by userspace

The search in hidinput_is_win8_touching() terminates at f=3D0, u=3D0
on Goodix screens (27C6:0111, 27C6:0113), but I expect it
to have negligible impact on devices that don't have TipSwitch
as the first report as well

Signed-off-by: Ahelenia Ziemia=C5=84ska <nabijaczleweli@nabijaczleweli.xyz>
---

Notes:
    changes in v2:
      * hidinput_fixup_win8_inrange() became hidinput_is_win8_touching()
      * BarrelSwitch now anded with TipSwitch

 drivers/hid/hid-input.c | 48 +++++++++++++++++++++++++++++++++++++++++
 1 file changed, 48 insertions(+)

diff --git a/drivers/hid/hid-input.c b/drivers/hid/hid-input.c
index a5ba92978473..aee1f1283c1d 100644
--- a/drivers/hid/hid-input.c
+++ b/drivers/hid/hid-input.c
@@ -1273,6 +1273,42 @@ static void hidinput_handle_scroll(struct hid_usage =
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
+ *
+ * Additionally, HID_DG_BARRELSWITCH corresponds directly to the button,
+ * regardless of the tip switch, making it borderline impossible to use pr=
ecisely.
+ */
+static bool hidinput_is_win8_touching(struct hid_device *hid, struct hid_f=
ield *field)
+{
+	unsigned f, u;
+	struct hid_field *rfield;
+
+	for (f =3D 0; f < field->report->maxfield; ++f) {
+		rfield =3D field->report->field[f];
+		for (u =3D 0; u < rfield->maxusage; ++u) {
+			if (rfield->usage[u].hid =3D=3D HID_DG_TIPSWITCH)
+				return rfield->value[u];
+		}
+	}
+
+	return false;
+}
+
 void hidinput_hid_event(struct hid_device *hid, struct hid_field *field, s=
truct hid_usage *usage, __s32 value)
 {
 	struct input_dev *input;
@@ -1306,7 +1342,13 @@ void hidinput_hid_event(struct hid_device *hid, stru=
ct hid_field *field, struct
 		return;
 	}
=20
+	if (usage->hid =3D=3D HID_DG_ERASER && value)
+		*quirks |=3D HID_QUIRK_INVERT;
+
 	if (usage->hid =3D=3D HID_DG_INRANGE) {
+		if (hid->group =3D=3D HID_GROUP_MULTITOUCH_WIN_8)
+			value =3D value || hidinput_is_win8_touching(hid, field);
+
 		if (value) {
 			input_event(input, usage->type, (*quirks & HID_QUIRK_INVERT) ? BTN_TOOL=
_RUBBER : usage->code, 1);
 			return;
@@ -1322,6 +1364,12 @@ void hidinput_hid_event(struct hid_device *hid, stru=
ct hid_field *field, struct
 		input_event(input, EV_KEY, BTN_TOUCH, value > a + ((b - a) >> 3));
 	}
=20
+	if (usage->hid =3D=3D HID_DG_BARRELSWITCH && hid->group =3D=3D HID_GROUP_=
MULTITOUCH_WIN_8) {
+		value =3D value && hidinput_is_win8_touching(hid, field);
+		input_event(input, usage->type, usage->code, value);
+		return;
+	}
+
 	if (usage->hid =3D=3D (HID_UP_PID | 0x83UL)) { /* Simultaneous Effects Ma=
x */
 		dbg_hid("Maximum Effects - %d\n",value);
 		return;
--=20
2.20.1

--nuuyouwigtdbc5q2
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEfWlHToQCjFzAxEFjvP0LAY0mWPEFAmBGYfoACgkQvP0LAY0m
WPGvFQ/9Hpkj+5o+tfpSEe8WHH2lZz62GYkyBREAdJn12m+5ps3MJzYd2/gOVwhZ
UtEwbU5bykW77FLCniyU6f8hKLkQJG8GhmhaA9qrpAT8F4XXoyJpy/U7MRhVDGZT
Q34jJSNf09Bs5OliHhmpbFm+MPEmPdiq6T/t6dz+NsqS4kI+37X5MJqMWBVMtGJi
8Jgv6J/Sy2rgjgjsta5sU8wqH4gISECbwbVl91ARWZbwtfUIuGoaf3qmCW6rwcQ4
gFgyOlll/zKX7dvUUre8FfQU5N2NsEQgpfLwVxqYXMsb187jkM2Ug4+gka1iSe5r
EtQEounro5T0Z8ynS5SSlNyXlnybBypWKjTEOBJXevtdHYc/H8LROBTc3qJ8UqVL
DTnfHqqK0x5tAsWOTQ7nJ9ENTR3Wwc957dBu4mEbqcnddFFLnF/DV25zjGbFYyOG
OqhxqZiS3ul0yKfElBICuNCBUBgnae+8qAw0OKHQHiYbEG93BRhXD/LYrq11sLMe
Cefs1VAgUxXyAMgtmADgYotBr31T2PRSRWBEtZv7jUdhyEvz+dkEw74wcfE1kBDP
PaLsQv1dc2ITllaoH67FAP8YRQKIUQCA0GQFHTgwLCjTkH7wA4Dvatx38TP60FpD
/F4yAuXAfyXUDliSxZX0M+9ZQLkKznjoc8vFdgWNe0gJWXePeGI=
=i1Fw
-----END PGP SIGNATURE-----

--nuuyouwigtdbc5q2--
