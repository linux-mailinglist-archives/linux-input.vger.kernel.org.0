Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 7701615A9BC
	for <lists+linux-input@lfdr.de>; Wed, 12 Feb 2020 14:09:29 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727054AbgBLNJ3 (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 12 Feb 2020 08:09:29 -0500
Received: from orion.archlinux.org ([88.198.91.70]:58284 "EHLO
        orion.archlinux.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726728AbgBLNJ2 (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Wed, 12 Feb 2020 08:09:28 -0500
Received: from orion.archlinux.org (localhost [127.0.0.1])
        by orion.archlinux.org (Postfix) with ESMTP id B2B4C18E485AA2;
        Wed, 12 Feb 2020 13:09:24 +0000 (UTC)
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
        Wed, 12 Feb 2020 13:09:24 +0000 (UTC)
Message-ID: <134b6748318f5cc2b50584e58da58e43c99db5b6.camel@archlinux.org>
Subject: Re: [BUG] Kernel log flooded by message "logitech-djreceiver
 0003:046D:C53A.000C: logi_dj_hidpp_event: invalid device index:7"
From:   Filipe =?ISO-8859-1?Q?La=EDns?= <lains@archlinux.org>
To:     Mikhail Gavrilov <mikhail.v.gavrilov@gmail.com>
Cc:     Linux List Kernel Mailing <linux-kernel@vger.kernel.org>,
        linux-input@vger.kernel.org
In-Reply-To: <CABXGCsPYaXYFqQfnYWeeOKYq-SCjBvixo-Mme-fGLSB8Kw5H+g@mail.gmail.com>
References: <CABXGCsMfzj+mpjvuZifzWEKbX7X36v7iMVPampSS6kOc2Hzoow@mail.gmail.com>
         <2405a741abf0d5fe8f55b5d3de8488e3054cc5e1.camel@archlinux.org>
         <CABXGCsPYaXYFqQfnYWeeOKYq-SCjBvixo-Mme-fGLSB8Kw5H+g@mail.gmail.com>
Organization: Archlinux
Content-Type: multipart/signed; micalg="pgp-sha256";
        protocol="application/pgp-signature"; boundary="=-OiDey6S+lvi/aW/6yKbk"
Date:   Wed, 12 Feb 2020 13:09:22 +0000
MIME-Version: 1.0
User-Agent: Evolution 3.34.3 
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org


--=-OiDey6S+lvi/aW/6yKbk
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, 2020-02-12 at 17:53 +0500, Mikhail Gavrilov wrote:
> On Mon, 10 Feb 2020 at 17:38, Filipe La=C3=ADns <lains@archlinux.org>
> wrote:
> > On Mon, 2020-02-10 at 13:21 +0500, Mikhail Gavrilov wrote:
> > > Kernel log flooded by message
> > > logitech-djreceiver 0003:046D:C53A.000C: logi_dj_hidpp_event:
> > > invalid
> > > device index:7
> > > This happens when the mouse is idle.
> > > And it started since I begin using the mouse pad with Power Play
> > > technology.
> > >=20
> > >=20
> > > Kernel ver: 5.6 pre RC
> > > --
> > > Best Regards,
> > > Mike Gavrilov.
> >=20
> > Hello Mike,
> >=20
> > Yes, the Powerplay mat exports a static HID++ 2.0 device with index
> > 7
> > to configure the led on the mat. The current code expects devices
> > to
> > have a maximum index of 6, which is the maximum index of pairable
> > devices.
> >=20
> > I already submitted a patch adding support for the Logitech G
> > Powerplay
> > mat but it wasn't been upstreamed it. I will attach it in case you
> > want
> > to try it.
> >=20
>=20
> Thanks, I tested the patch for a day and "logitech-djreceiver"
> messages was not appear anymore and no other regressions are noted.
> Why this patch wasn't been upstreamed?

Lack of time I guess.

> Also would be good if "logitech-djreceiver" provides information for
> upower daemon as how did it happening with unifying receiver and my
> previous mouse Logitech Zone Touch Mouse T400.
>=20
> For example:
>=20
> $ upower --dump
> Device: /org/freedesktop/UPower/devices/mouse_hidpp_battery_0
>   native-path:          hidpp_battery_0
>   model:                Zone Touch Mouse T400
>   serial:               4026-cf-15-61-0d
>   power supply:         no
>   updated:              Sun 22 Dec 2019 02:41:30 PM +05 (89 seconds
> ago)
>   has history:          yes
>   has statistics:       yes
>   mouse
>     present:             yes
>     rechargeable:        yes
>     state:               discharging
>     warning-level:       none
>     battery-level:       normal
>     percentage:          55% (should be ignored)
>     icon-name:          'battery-low-symbolic'
>=20
> Device: /org/freedesktop/UPower/devices/DisplayDevice
>   power supply:         no
>   updated:              Sun 22 Dec 2019 10:58:54 AM +05 (13445
> seconds ago)
>   has history:          no
>   has statistics:       no
>   unknown
>     warning-level:       none
>     icon-name:          'battery-missing-symbolic'
>=20
> Daemon:
>   daemon-version:  0.99.11
>   on-battery:      no
>   lid-is-closed:   no
>   lid-is-present:  no
>   critical-action: HybridSleep
>=20
> https://user-images.githubusercontent.com/200750/71320201-d8a5ea80-24c9-1=
1ea-9ea9-97100545d294.png
>=20
> Currently, only sensors show the power charge level, but without
> "upower" daemon user-friendly indication not available in DE.
>=20
> $ sensors
> hidpp_battery_0-hid-3-9
> Adapter: HID adapter
> in0:           4.08 V

The new devices only export the battery voltage. We will need to
calculate the charge level with the charging curve. I tried getting in
touch with the upower upstream to figure out exactly what is needed in
upower's side but without luck.

https://gitlab.freedesktop.org/upower/upower/issues/110

Regards,
Filipe La=C3=ADns

--=-OiDey6S+lvi/aW/6yKbk
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEE0jW0leqs33gyftiw+JPGdIFqqV0FAl5D+QEACgkQ+JPGdIFq
qV3HMBAArKGAIW6he3UG3r7F90a7B4O6RQtvj7LeHo88H32bCwTIjt17eIbYgcSK
/1boM5vA6sj+KgD/yNWVHO45KAI2eq4HPVqE219hRgDHmGKn72575ulKdCVJ7o/o
x8kHEdQASsd44//GzNiaNm9i98n4K4Wq80opDfkSolnkExxPhZQUQWlcbVexDjrs
+IaL6S9AWs1TPL1oxFZBwwUW6m4ZQDFJCNI+ZI8gGseMvP4K1FN00auO+fSmZqP7
C/hLMkiYbxrX+QNJMl7eMHBHgv9xbUcIltCKUGtGzcvJjmwW4xpqVGjI1627EDAD
0Z619vGsRzkOfK/px/3PjTPQiIf1NhRn+5o/LcprRGwIIKW12oGyXmD6RXoiVt7e
0D1GnIoNCeEczqLJ5920muraFpDseiy7HJGe5Q/PYMZf7jJkL0WLfbSB9ku5wEct
NdUbM31QHajBwIGctFoUHEQHK8tlwTzhu+udqQWOQtGINH8sS18Wr1PsiJAdawBX
jAyXK31Ic+LkJD0gIIgbahyIRo9U575m087lAOf0/kBBFu0tPT3vpT2pwNsYpJlU
DfZYDRNn0ki6ypvbVCIK/ppg42/pi1ufiIPa8davQqXroLidUM2CV+RYsHQjE0Re
l/Yt9E1mJSvc7LTg5WOHkI+MHOMYPCnOvLiDZ+2PMn/F8LmQau8=
=wu9z
-----END PGP SIGNATURE-----

--=-OiDey6S+lvi/aW/6yKbk--
