Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 77AB432F354
	for <lists+linux-input@lfdr.de>; Fri,  5 Mar 2021 19:59:19 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229591AbhCES6r (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Fri, 5 Mar 2021 13:58:47 -0500
Received: from mail1.protonmail.ch ([185.70.40.18]:31870 "EHLO
        mail1.protonmail.ch" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229562AbhCES6V (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Fri, 5 Mar 2021 13:58:21 -0500
Date:   Fri, 05 Mar 2021 18:58:10 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=connolly.tech;
        s=protonmail; t=1614970699;
        bh=m3ZqDNA+mvjIH0KFFoNe9jlttB2rSnvubz0lZ/kEE/s=;
        h=Date:To:From:Cc:Reply-To:Subject:From;
        b=RraqwqbLum2w/1CU4IyPVMd0syvzK4qTXKMEYMjH7BY4Qz+GyBOuEfQvjrZ7OFWEv
         AU+J1BY/WPE+B7vy5mgnXD3CgUKbGXp4XuMuQv2iFjyTtdRIvwkU3P+WzYiMeFkSI8
         mvFGANSJDXmP2va9mh6DA7pw0ZePzuhhVosscm2Q=
To:     caleb@connolly.tech, andi@etezian.org,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Rob Herring <robh@kernel.org>
From:   Caleb Connolly <caleb@connolly.tech>
Cc:     ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
        linux-input@vger.kernel.org, linux-kernel@vger.kernel.org
Reply-To: Caleb Connolly <caleb@connolly.tech>
Subject: [PATCH v2] input: s6sy761: fix coordinate read bit shift
Message-ID: <20210305185710.225168-1-caleb@connolly.tech>
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

The touch coordinate register contains the following:

        byte 3             byte 2             byte 1
+--------+--------+ +-----------------+ +-----------------+
|        |        | |                 | |                 |
| X[3:0] | Y[3:0] | |     Y[11:4]     | |     X[11:4]     |
|        |        | |                 | |                 |
+--------+--------+ +-----------------+ +-----------------+

Bytes 2 and 1 need to be shifted left by 4 bits, the least significant
nibble of each is stored in byte 3. Currently they are only
being shifted by 3 causing the reported coordinates to be incorrect.

This matches downstream examples, and has been confirmed on my
device (OnePlus 7 Pro).

Fixes: 0145a7141e59 ("Input: add support for the Samsung S6SY761
touchscreen")
Signed-off-by: Caleb Connolly <caleb@connolly.tech>
---
Changes since v1:
 * Use Andi's explanation in the commit message
 * Add Fixes: tag

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


