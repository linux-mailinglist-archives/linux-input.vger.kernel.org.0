Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2C9EB31DE3E
	for <lists+linux-input@lfdr.de>; Wed, 17 Feb 2021 18:33:31 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233782AbhBQRcx (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 17 Feb 2021 12:32:53 -0500
Received: from [139.28.40.42] ([139.28.40.42]:46874 "EHLO
        tarta.nabijaczleweli.xyz" rhost-flags-FAIL-FAIL-OK-OK)
        by vger.kernel.org with ESMTP id S234141AbhBQRcl (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Wed, 17 Feb 2021 12:32:41 -0500
X-Greylist: delayed 563 seconds by postgrey-1.27 at vger.kernel.org; Wed, 17 Feb 2021 12:32:26 EST
Received: from tarta.nabijaczleweli.xyz (unknown [192.168.1.250])
        by tarta.nabijaczleweli.xyz (Postfix) with ESMTPSA id 838B3360135;
        Wed, 17 Feb 2021 18:22:31 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=nabijaczleweli.xyz;
        s=202006; t=1613582551;
        bh=Hf4nKRB8+MGr3EN3mWaLIlVmQ4/HMM8ISiBIcOu0J2s=;
        h=Date:From:Cc:Subject:References:In-Reply-To:From;
        b=TuSDx0HPyiuDxVlHcQJD4nnMUgLXHlBEizchqtaG25OUAe22XxQWtUOSD8hV+L5YV
         C57GZyr8gdXCJOqXv/r1m4DPRblI2bedTggIWAg0EAjRbDxgrt/ZFD50+za9l1HyKq
         jfO8MrYK9UqvR5aIc/LRLpsx75TZcDzLRymPx6iUdUHdltxycu1Gnt0kLHDnfzatW7
         ZfGPjNI4zLdU/ZZT92PLsXl9tWQdFUw+10LkaagL9x0WKtd6g/rMFsnCxC4VBgL49T
         P663JFO/6fJl9tL382KzuAEfnhGQs20OTHg6WFCexhhI/h2kcbT2qQSW+3dQmcbuwQ
         71p01ntMqa+Pw==
Date:   Wed, 17 Feb 2021 18:22:30 +0100
From:   Ahelenia =?utf-8?Q?Ziemia=C5=84ska?= 
        <nabijaczleweli@nabijaczleweli.xyz>
Cc:     Benjamin Tissoires <benjamin.tissoires@redhat.com>,
        Peter Hutterer <peter.hutterer@who-t.net>,
        Jiri Kosina <jikos@kernel.org>, linux-input@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH 1/4] HID: multitouch: require Finger field to mark Win8
 reports as MT
Message-ID: <bb1a5f4e2dc57c4fffdf29f25c52324fb0eed0dd.1613582014.git.nabijaczleweli@nabijaczleweli.xyz>
References: <cover.1613582014.git.nabijaczleweli@nabijaczleweli.xyz>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="eakd3eys7z4o23tq"
Content-Disposition: inline
In-Reply-To: <cover.1613582014.git.nabijaczleweli@nabijaczleweli.xyz>
User-Agent: NeoMutt/20210205
To:     unlisted-recipients:; (no To-header on input)
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org


--eakd3eys7z4o23tq
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


--eakd3eys7z4o23tq
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEfWlHToQCjFzAxEFjvP0LAY0mWPEFAmAtUNYACgkQvP0LAY0m
WPHPSA//YsRvCRQI513wn8lHJTTH7OoAnEBwukjx/BMXL/rZ1TqN1Eh+bh0h5q8z
yMvWkWW0A8hp+Me8rZr0FTC30xTvgdsdmy9mO+0SpvBE2AL9S7zaD3LZMYcaSYUo
6dNK3H4aF6FSiXTER4HoYJ0OIF8zrmtzLvk5xrWccruGbZBcubd226DhY8OFkYzq
Fm3GuRDihlyu4oH9lv4/ocvfL5KEhfTaijq/LZOkhlBEU0b/ELl0hr9tIsOpvt3u
GJsqA2ILPNJXk1tfi3QCruPCQLh6oi6YAuE0ZOpE2sdqf3WaL1qMVmEjbG/W3ttF
SnMtw8s4vKWGyCZbvX63rS7v1cz+om4wlc70nkqcFfr833I9B0RlVLZNuZeUo5eG
8UH7I+4SM/mWyDwL0FN3zYsibLi3AjUb5a33NYgEPpkFz/JFi8cCZ56WW4QH8P2U
JTioJGrAy1LyTRpL2AG/gkBixBmKxilYEo04+Q6Xt0ZcxqbUUKqgvRkaBjibQN9f
HghLEtKo6Rmz7OXXS/NLyZxDRDAWCaAAsJZC8N8VV+A/2tFOJPzWahpye/j4zYpt
4KLVsBvtlqHqFbzTQMprginpCfEaGkfqk7FCBF67iaXB+eQVASZS7Y7tK8QN144a
dMHBJrThqDJnqD4jN0EjOlPRJKJBpwzo5CuyPYemhGxmtaVLeOI=
=wP0s
-----END PGP SIGNATURE-----

--eakd3eys7z4o23tq--
