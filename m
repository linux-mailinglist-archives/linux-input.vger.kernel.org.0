Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2049C32DF69
	for <lists+linux-input@lfdr.de>; Fri,  5 Mar 2021 03:03:54 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229478AbhCECDx (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 4 Mar 2021 21:03:53 -0500
Received: from mail2.protonmail.ch ([185.70.40.22]:27720 "EHLO
        mail2.protonmail.ch" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229436AbhCECDw (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Thu, 4 Mar 2021 21:03:52 -0500
Date:   Fri, 05 Mar 2021 02:03:47 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=connolly.tech;
        s=protonmail; t=1614909830;
        bh=GduqeEmhvsNKh/mBiEjO2HT/vpt87Bd8VyVcvhIY1Kg=;
        h=Date:To:From:Cc:Reply-To:Subject:From;
        b=m8FWBaot3PepJ8Y03N2zE0ipJkigXZ3Gu2W+gCse4GH9nPPBQs2egIhMo+f75sHW4
         vaZK1XBwEVPsq/8O17MdAdyrKs4kR6S8fkkkpGhDSeaX6smO3T1eMHXsq3MawsqpDb
         ySXux0ch/J2ktTseMbVJi/SJ8ZpXA7mjXlEKWCc4=
To:     caleb@connolly.tech, andi@etezian.org,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>
From:   Caleb Connolly <caleb@connolly.tech>
Cc:     ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
        linux-input@vger.kernel.org, linux-kernel@vger.kernel.org
Reply-To: Caleb Connolly <caleb@connolly.tech>
Subject: [PATCH] input: s6sy761: fix coordinate read bit shift
Message-ID: <20210305020310.550527-1-caleb@connolly.tech>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-1.2 required=10.0 tests=ALL_TRUSTED,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF shortcircuit=no
        autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on
        mailout.protonmail.ch
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA256

The touch coordinates are read by shifting a value left by 3,
this is incorrect and effectively causes the coordinates to
be half of the correct value.

Shift by 4 bits instead to report the correct value.

This matches downstream examples, and has been confirmed on my
device (OnePlus 7 Pro).

Signed-off-by: Caleb Connolly <caleb@connolly.tech>
---
 drivers/input/touchscreen/s6sy761.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/input/touchscreen/s6sy761.c b/drivers/input/touchscree=
n/s6sy761.c
index b63d7fdf0cd2..85a1f465c097 100644
--- a/drivers/input/touchscreen/s6sy761.c
+++ b/drivers/input/touchscreen/s6sy761.c
@@ -145,8 +145,8 @@ static void s6sy761_report_coordinates(struct s6sy761_d=
ata *sdata,
 =09u8 major =3D event[4];
 =09u8 minor =3D event[5];
 =09u8 z =3D event[6] & S6SY761_MASK_Z;
-=09u16 x =3D (event[1] << 3) | ((event[3] & S6SY761_MASK_X) >> 4);
-=09u16 y =3D (event[2] << 3) | (event[3] & S6SY761_MASK_Y);
+=09u16 x =3D (event[1] << 4) | ((event[3] & S6SY761_MASK_X) >> 4);
+=09u16 y =3D (event[2] << 4) | (event[3] & S6SY761_MASK_Y);
=20
 =09input_mt_slot(sdata->input, tid);
=20
--=20
2.29.2


-----BEGIN PGP SIGNATURE-----
Version: ProtonMail

wsFmBAEBCAAQBQJgQZF1CRAFgzErGV9ktgAKCRAFgzErGV9ktroYD/9RVSpG
TNuHm0cz8tS/oPFxPxO6Y35p3IF7I77hv0/Qy8CDBgyiJ2pZYP5dOgMPp7NV
MbIYMlN0sjXsAhcm81eho4qp7r5Fnv5YdRoe8QaueRaBVqG5xeip//sdYsdP
lkSLLJqM7caXOZ2QaVZp4w9v7PpZvyGTdDeBtyhVwrRpuEcZraFBGhyfv4Xf
WvU/hKj+0cnKt+WpmnEtwBkkX4PDqm2yXQASm5HrHli5z8XSlaTO55jFcQRP
+PcV/uBEVm9yhi4qYGEZYFZ526IpIcB4vKJi5h3fYro3ye66GfT+zb4HHwA/
cRoEFfRQ6TX1NUBeawi5l7LnAXP3w/RMQ9HnULjiFgLI1a63EsucXGnan2gt
N0Ig0nnbD/c0UG9dsm5u7POM1JhDrX184Bvh3WPb4t0XfYRCIQVB4S+ElG3n
KoPLMWjOzfSxFQcEK4axpOYePDGfbqMYTNy+g+m/aQa40OnYem2Tp6koIpz4
tzzHgpKlrUuMe571jZFO+eIwIxuu/5yaE1qBANfaCIemDWxX2dXEeaoFCTtu
LdqkxaQuxqPaZORlbuRHFkaFEsk2iWZ6eOSNo6dBQ+qxbIHFj8xYqYkZh5Hn
g7zP0UpHbcTEggFgGB0AM6n3+qQXVR+EwtKr7vBWiSAR6p2T87MNflFWbvk5
1fCR4mi79Teaafgunw=3D=3D
=3DhTKj
-----END PGP SIGNATURE-----

