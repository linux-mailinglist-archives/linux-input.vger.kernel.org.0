Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 069B115793F
	for <lists+linux-input@lfdr.de>; Mon, 10 Feb 2020 14:14:06 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729179AbgBJMij (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 10 Feb 2020 07:38:39 -0500
Received: from orion.archlinux.org ([88.198.91.70]:38070 "EHLO
        orion.archlinux.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728158AbgBJMii (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Mon, 10 Feb 2020 07:38:38 -0500
Received: from orion.archlinux.org (localhost [127.0.0.1])
        by orion.archlinux.org (Postfix) with ESMTP id BC39418CCD29EA;
        Mon, 10 Feb 2020 12:38:34 +0000 (UTC)
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
        Mon, 10 Feb 2020 12:38:34 +0000 (UTC)
Message-ID: <2405a741abf0d5fe8f55b5d3de8488e3054cc5e1.camel@archlinux.org>
Subject: Re: [BUG] Kernel log flooded by message "logitech-djreceiver
 0003:046D:C53A.000C: logi_dj_hidpp_event: invalid device index:7"
From:   Filipe =?ISO-8859-1?Q?La=EDns?= <lains@archlinux.org>
To:     Mikhail Gavrilov <mikhail.v.gavrilov@gmail.com>,
        Linux List Kernel Mailing <linux-kernel@vger.kernel.org>,
        linux-input@vger.kernel.org
In-Reply-To: <CABXGCsMfzj+mpjvuZifzWEKbX7X36v7iMVPampSS6kOc2Hzoow@mail.gmail.com>
References: <CABXGCsMfzj+mpjvuZifzWEKbX7X36v7iMVPampSS6kOc2Hzoow@mail.gmail.com>
Organization: Archlinux
Content-Type: multipart/signed; micalg="pgp-sha256";
        protocol="application/pgp-signature"; boundary="=-CC7fhrLK0x2ihemV6EOD"
Date:   Mon, 10 Feb 2020 12:38:32 +0000
MIME-Version: 1.0
User-Agent: Evolution 3.34.3 
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org


--=-CC7fhrLK0x2ihemV6EOD
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, 2020-02-10 at 13:21 +0500, Mikhail Gavrilov wrote:
> Kernel log flooded by message
> logitech-djreceiver 0003:046D:C53A.000C: logi_dj_hidpp_event: invalid
> device index:7
> This happens when the mouse is idle.
> And it started since I begin using the mouse pad with Power Play
> technology.
>=20
>=20
> Kernel ver: 5.6 pre RC
> --
> Best Regards,
> Mike Gavrilov.

Hello Mike,

Yes, the Powerplay mat exports a static HID++ 2.0 device with index 7
to configure the led on the mat. The current code expects devices to
have a maximum index of 6, which is the maximum index of pairable
devices.=20

I already submitted a patch adding support for the Logitech G Powerplay
mat but it wasn't been upstreamed it. I will attach it in case you want
to try it.

Cheers,
Filipe La=C3=ADns

---
Author: Filipe La=C3=ADns <lains@archlinux.org>
Date:   Sun Jan 12 20:15:41 2020 +0000

    HID: logitech-dj: add support for the static device in the Powerplay ma=
t/receiver

    The Logitech G Powerplay has a lightspeed receiver with a static HID++
    device with ID 7 attached to it to. It is used to configure the led on
    the mat. For this reason I increased the max number of devices.

    Signed-off-by: Filipe La=C3=ADns <lains@archlinux.org>

diff --git a/drivers/hid/hid-logitech-dj.c b/drivers/hid/hid-logitech-dj.c
index bb50d6e7745b..79294b873057 100644
--- a/drivers/hid/hid-logitech-dj.c
+++ b/drivers/hid/hid-logitech-dj.c
@@ -16,11 +16,11 @@
 #include <asm/unaligned.h>
 #include "hid-ids.h"

-#define DJ_MAX_PAIRED_DEVICES                  6
+#define DJ_MAX_PAIRED_DEVICES                  7
 #define DJ_MAX_NUMBER_NOTIFS                   8
 #define DJ_RECEIVER_INDEX                      0
 #define DJ_DEVICE_INDEX_MIN                    1
-#define DJ_DEVICE_INDEX_MAX                    6
+#define DJ_DEVICE_INDEX_MAX                    7

 #define DJREPORT_SHORT_LENGTH                  15
 #define DJREPORT_LONG_LENGTH                   32
@@ -980,6 +980,11 @@ static void logi_hidpp_recv_queue_notif(struct hid_dev=
ice *hdev,
                break;
        }

+       /* custom receiver device (eg. powerplay) */
+       if (hidpp_report->device_index =3D=3D 7) {
+               workitem.reports_supported |=3D HIDPP;
+       }
+
        if (workitem.type =3D=3D WORKITEM_TYPE_EMPTY) {
                hid_warn(hdev,
                         "unusable device of type %s (0x%02x) connected on =
slot %d",

--=-CC7fhrLK0x2ihemV6EOD
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEE0jW0leqs33gyftiw+JPGdIFqqV0FAl5BTsQACgkQ+JPGdIFq
qV2o1BAArnqS+PoUWAyJOVrP4wEmyHC0lyB5osiGEehXtMvhd2pDWwl9P8U8nYdj
TusgiebYY4F9lrZu00g7ggqD5iQQA1uyOvOGkV91sYez4YdKYU8lpUfGS+jTgTOo
gIWlGntJi/qjbYkHqz5zeI+K0mvCpmUyinn2/WkV7y5ErPvgdiXPsTIzQq9geSJn
i2syAUY0fTwDMe60AQ/2MhIXRiUCvMyMH8TLbDUFz2uzbzwhzBZH6tRY1tlPM0ow
mtUPCEHWNTazfd56317QHDGMVne8/bWd4z+Gsyd2WqZVXNBvDAoX58aMxNH2FTtG
jN6TjA01SAb9/yKcRdOe4hb7wstmjX9744ClGmueQNCPJyvjuWuGOBj/eMNVRk7p
2PTAoR+ijTdHkUghZ3i+aGnzQVFpbgyistvNj1XajIhusHTMlHWep8f4IKPVS7zb
5HGx6HF/ThBALxFUAOQjdpITzBF605I4b0XjOrx5UnZiYokCwVIulJrKFMwggUos
UHNJrVbIx4fmjBvolMLAx9zmf9Hsd0BCj17ToECPXQpnZsV1K80q2K4XmzS5Zpx8
gHvZlMsjq92JS4pnebyJIjeS22S8AnHESe6TBQyqelVlYJnKaiQ2eZVbQkO3QbqI
6XEAShG/PJ1HIcHur1l23aEoYvu0cgzP+FyRQ5oucNwhuuLdcmI=
=t81+
-----END PGP SIGNATURE-----

--=-CC7fhrLK0x2ihemV6EOD--
