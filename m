Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4D878331512
	for <lists+linux-input@lfdr.de>; Mon,  8 Mar 2021 18:42:51 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230173AbhCHRmQ (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 8 Mar 2021 12:42:16 -0500
Received: from [139.28.40.42] ([139.28.40.42]:54258 "EHLO
        tarta.nabijaczleweli.xyz" rhost-flags-FAIL-FAIL-OK-OK)
        by vger.kernel.org with ESMTP id S229813AbhCHRmF (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Mon, 8 Mar 2021 12:42:05 -0500
Received: from tarta.nabijaczleweli.xyz (unknown [192.168.1.250])
        by tarta.nabijaczleweli.xyz (Postfix) with ESMTPSA id 78CBF360009;
        Mon,  8 Mar 2021 18:42:04 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=nabijaczleweli.xyz;
        s=202006; t=1615225324;
        bh=YnOwl8+70YJN74o6JcKP3I+Z0kVB3n4CoIz0cKVjjB4=;
        h=Date:From:Cc:Subject:References:In-Reply-To:From;
        b=bOJP0EJmXK7FTiFBUBMaJTRDlbwQBsWkQfRJyMGY1/fBQW/eZIK5G6RF+mvEeuAOl
         DpwK6GLuy94+v9H9mDVcX3ycSwHBXdPSUIBxMRz3UKAYKbSQp5nua88MD0c/J50fBQ
         A56xmiWk9icDIWBNcHzJaFDzOmxeDau8IWJKk1VV9SIIoHK4JO8+Qt/MZuEK8gxT/G
         5D1ALmtVgoml6jT1Lg9FpNCJnJ5ypE7e7G3VBnGEW5oiDE3/z7F4FJNZGoZBs8IYab
         Cn1Y/DnVkEnWiGF6mkF3fQc6j5FjVPQinPVo6d9ogMC6iivWiF4g63e/T611gMOyx5
         Vauh6lSR0lpcA==
Date:   Mon, 8 Mar 2021 18:42:03 +0100
From:   Ahelenia =?utf-8?Q?Ziemia=C5=84ska?= 
        <nabijaczleweli@nabijaczleweli.xyz>
Cc:     Benjamin Tissoires <benjamin.tissoires@redhat.com>,
        Peter Hutterer <peter.hutterer@who-t.net>,
        Jiri Kosina <jikos@kernel.org>, linux-input@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH v2 1/4] HID: multitouch: require Finger field to mark Win8
 reports as MT
Message-ID: <019fd182fe7358b14a2f9427572635e518cdb868.1615224800.git.nabijaczleweli@nabijaczleweli.xyz>
References: <cover.1615224800.git.nabijaczleweli@nabijaczleweli.xyz>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="42d7o7g7hk3f6ppw"
Content-Disposition: inline
In-Reply-To: <cover.1615224800.git.nabijaczleweli@nabijaczleweli.xyz>
User-Agent: NeoMutt/20210205
To:     unlisted-recipients:; (no To-header on input)
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org


--42d7o7g7hk3f6ppw
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

This effectively changes collection_is_mt from
  contact ID in report->field
to
  (device is Win8 =3D> collection is finger) && contact ID in report->field

Some devices erroneously report Pen for fingers,
and Win8 stylus-on-touchscreen devices report contact ID,
but mark the accompanying touchscreen device's collection correctly

Signed-off-by: Ahelenia Ziemia=C5=84ska <nabijaczleweli@nabijaczleweli.xyz>
---
 drivers/hid/hid-multitouch.c | 10 +++++++---
 1 file changed, 7 insertions(+), 3 deletions(-)

diff --git a/drivers/hid/hid-multitouch.c b/drivers/hid/hid-multitouch.c
index 8429ebe7097e..8580ace596c2 100644
--- a/drivers/hid/hid-multitouch.c
+++ b/drivers/hid/hid-multitouch.c
@@ -604,9 +604,13 @@ static struct mt_report_data *mt_allocate_report_data(=
struct mt_device *td,
 		if (!(HID_MAIN_ITEM_VARIABLE & field->flags))
 			continue;
=20
-		for (n =3D 0; n < field->report_count; n++) {
-			if (field->usage[n].hid =3D=3D HID_DG_CONTACTID)
-				rdata->is_mt_collection =3D true;
+		if (field->logical =3D=3D HID_DG_FINGER || td->hdev->group !=3D HID_GROU=
P_MULTITOUCH_WIN_8) {
+			for (n =3D 0; n < field->report_count; n++) {
+				if (field->usage[n].hid =3D=3D HID_DG_CONTACTID) {
+					rdata->is_mt_collection =3D true;
+					break;
+				}
+			}
 		}
 	}
=20
--=20
2.20.1


--42d7o7g7hk3f6ppw
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEfWlHToQCjFzAxEFjvP0LAY0mWPEFAmBGYesACgkQvP0LAY0m
WPGBtA//QR2l3O2LKgDBxp63HTpF1uzjT082nbZKdP5iAeVjK4++VBfHUthy9Vq/
7ZCDEohhsS+TkAWF99r72bCJg3gRTpxORDEeHZNA6ZicqyCzOHxoIJTV/SP7MIXL
CQlATX6WopBXuDzfB9t0uvsE5awOHdOckfgDRz/X/BklgFsk+3p5cnET2gpKE7Gb
5pq5GHTaPh9dDX3eLRF8GFuRdHDhNIp9futXhFx6jZV8nEkK1BiLuSluIEJyYPpJ
I1naSpa2ihK2clwzfIpXE9zNS8qjAYSgpqQNp2hNaSvnWgYvb5vTkrppDFxmoVfR
ZOQoCRunLoYNyqEfyLYmImFqizJ8oiBAsgy0Ws7tQVmAmWHkOP5lYOCHsQQbFbQL
Nx2yo+Klqkjh2jg58AyVyydRujcq1wQwllBs9xES0a0XaGf+AxXVymt1fMX74FvU
AwGLYrBtngJGw0Ckfl8z9CIba9vkJzkDP1CkWx3WGjCXDlRO415cOznVNYSkrH2O
ICWIN0oo8RBnzzWlD3VfHOHqoWDG4e0pmvWb+GlTKpI0LJHRKlxqLtHSpnKL8e99
Ek/A1nelutojh2ZfoG2VOU3iuokPxik/GnnTaRILKcrH7l4JmmjzXgwRxktRH+tw
692e31NdJcGaPCSD9ct342mCr0CoqhKn1jVGzQGLqWln0xMLiK4=
=ogHs
-----END PGP SIGNATURE-----

--42d7o7g7hk3f6ppw--
