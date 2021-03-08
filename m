Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CC158331511
	for <lists+linux-input@lfdr.de>; Mon,  8 Mar 2021 18:42:50 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229730AbhCHRmR (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 8 Mar 2021 12:42:17 -0500
Received: from [139.28.40.42] ([139.28.40.42]:54264 "EHLO
        tarta.nabijaczleweli.xyz" rhost-flags-FAIL-FAIL-OK-OK)
        by vger.kernel.org with ESMTP id S230002AbhCHRmK (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Mon, 8 Mar 2021 12:42:10 -0500
Received: from tarta.nabijaczleweli.xyz (unknown [192.168.1.250])
        by tarta.nabijaczleweli.xyz (Postfix) with ESMTPSA id 68EB6360009;
        Mon,  8 Mar 2021 18:42:09 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=nabijaczleweli.xyz;
        s=202006; t=1615225329;
        bh=E2cljsSdwKNhgTqJ7vTZuMRapHpY07TKEviawUFQTN4=;
        h=Date:From:Cc:Subject:References:In-Reply-To:From;
        b=eMgvfMUbaqR2ghNitae983xZnm+7vCXZaeBGrIkdeRGXiuyzOprXfllIMRZlvpa7x
         gJIgcjpMJabPZY11CPXlaMptEb1BUQJfH6i4lcE1Xyr1EIQ+PMf08/y2UbyCVAWcIS
         5SNsO+HSjec/5tIbxJ5wAYg4IaHotHom7p+yboI1AqGpLXAi0DdgRAZUi722HDrY0L
         1Aj5CidgPZL4EBKhkrCe7ZmZ/4OIJGOuk72Nqq/gGaxDg96fCEIxsSMvSissxOxwIc
         xabHxSIQBAJZqEalF3CaVO/zxXaTyZ+GkWJnyOkTNQNBKXO7cF5rgcVP412QdZFVzy
         2j//KVI+IG+MQ==
Date:   Mon, 8 Mar 2021 18:42:08 +0100
From:   Ahelenia =?utf-8?Q?Ziemia=C5=84ska?= 
        <nabijaczleweli@nabijaczleweli.xyz>
Cc:     Benjamin Tissoires <benjamin.tissoires@redhat.com>,
        Peter Hutterer <peter.hutterer@who-t.net>,
        Jiri Kosina <jikos@kernel.org>, linux-input@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH v2 2/4] HID: multitouch: set Stylus suffix for
 Stylus-application devices, too
Message-ID: <c2f23ec1cc06fabfa9e6732e08a827bdfe0c21d1.1615224800.git.nabijaczleweli@nabijaczleweli.xyz>
References: <cover.1615224800.git.nabijaczleweli@nabijaczleweli.xyz>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="jao4bsaa26ioyfu6"
Content-Disposition: inline
In-Reply-To: <cover.1615224800.git.nabijaczleweli@nabijaczleweli.xyz>
User-Agent: NeoMutt/20210205
To:     unlisted-recipients:; (no To-header on input)
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org


--jao4bsaa26ioyfu6
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

This re-adds the suffix to Win8 stylus-on-touchscreen devices,
now that they aren't erroneously marked as MT

Signed-off-by: Ahelenia Ziemia=C5=84ska <nabijaczleweli@nabijaczleweli.xyz>
---
 drivers/hid/hid-multitouch.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/hid/hid-multitouch.c b/drivers/hid/hid-multitouch.c
index 8580ace596c2..e5a3704b9fe8 100644
--- a/drivers/hid/hid-multitouch.c
+++ b/drivers/hid/hid-multitouch.c
@@ -1580,13 +1580,13 @@ static int mt_input_configured(struct hid_device *h=
dev, struct hid_input *hi)
 		/* we do not set suffix =3D "Touchscreen" */
 		hi->input->name =3D hdev->name;
 		break;
-	case HID_DG_STYLUS:
-		/* force BTN_STYLUS to allow tablet matching in udev */
-		__set_bit(BTN_STYLUS, hi->input->keybit);
-		break;
 	case HID_VD_ASUS_CUSTOM_MEDIA_KEYS:
 		suffix =3D "Custom Media Keys";
 		break;
+	case HID_DG_STYLUS:
+		/* force BTN_STYLUS to allow tablet matching in udev */
+		__set_bit(BTN_STYLUS, hi->input->keybit);
+		fallthrough;
 	case HID_DG_PEN:
 		suffix =3D "Stylus";
 		break;
--=20
2.20.1


--jao4bsaa26ioyfu6
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEfWlHToQCjFzAxEFjvP0LAY0mWPEFAmBGYfAACgkQvP0LAY0m
WPEHBg//dj15rXXWbyFR1jwbvHxoQvzSoKfCWFXvBxiTG92hHpY7wJHuFyqyz1sB
+3mAByN2va171eqEmuPEplf44QuwxRwaVJFsTCG8uSRwaVkk2lvUWdn3mtB4U3i1
ML218VI8liRlnxmLAqasmcA37ILk3vEsuo8hU4hwFUZ6iS64mKnEXknCB/voka4N
EM/UoZC1kAQ9gcLjbrEpNpJFYqPozziI3ljtyN3dEZ1ZFu8+bJJ3Y+FL4O344Hsv
5LFtO3zp7iyN5NSXtjQZTlCo5qhhwgtdzkEeVozwSomXzrdxBcZodpKixIdH3q/m
oM+bzQTBipM3H79bdPiceUuFakZfifVwqkZsnGqjnrtbvWhcyAmwbcqdPXs1q1RR
BDz7+hElZMbuo5q8jSY84VkjcjcXgfEvwwtAER94PbYX3bXaFmirp5dSNshXrGCs
ITDN6q1XCe5dge/GpM0GDDjD8Wk8+9kp+z7T6mUrQgY17luWyJzdT/VuLpLU+Y6g
IounbqnxQttz8WNVj1SLawuXCc9XQlU5/7/FzaydRUHcAybH4VDm6kIvYYdNMVE+
AuuAwfsZ/5FAaDSmUYAV5F5dJ/SSxtX9yOuUqDgSVW7fS9YZXBt3oMBrIl2sDRgb
yPE7bxjKa7IcHu9g3ZOHpI66hslMoMlHASGG9WBhD/C71M8Te04=
=QJmW
-----END PGP SIGNATURE-----

--jao4bsaa26ioyfu6--
