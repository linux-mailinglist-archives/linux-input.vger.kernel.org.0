Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A48BB7C8D65
	for <lists+linux-input@lfdr.de>; Fri, 13 Oct 2023 21:01:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229518AbjJMTBi (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Fri, 13 Oct 2023 15:01:38 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33778 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229958AbjJMTBh (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Fri, 13 Oct 2023 15:01:37 -0400
Received: from mout.gmx.net (mout.gmx.net [212.227.15.19])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1864783
        for <linux-input@vger.kernel.org>; Fri, 13 Oct 2023 12:01:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.de; s=s31663417;
 t=1697223693; x=1697828493; i=matthias_berndt@gmx.de;
 bh=68Z63dq1JynYJNWvTljUAuSX+Vwp7un62tDcI8229ew=;
 h=X-UI-Sender-Class:From:To:Subject:Date;
 b=DV5vIwHuCiaTRPjBrMvGGHohAWHvVcTNDMmiplDo4M16jW0EStviF8jE7sHo7dx2heJU4ugsQBh
 oA0xx2KtNiEfqTDRQ/Vln83qlE5gUGJxzpZldKyH+g5Hdvdc3pP7BRZ/UfzydYFe1NVJHn25z9xyY
 E4jhDx8y9/HHRrBojdSDRH/AMSYtO0MU9fKisoOgPkowGbT19Bzh02vfzRfocVRvVzOUmvTgBUc4P
 u6WmASnuNVykSLVBeWd0Xszw53uYN7FDXEAkIznJWCFWSHVsTze7873dQg5T/v/XLn+A9SmjTqKNO
 WJgpKwQF2tufaReeq4PAbMJRSI1EzWFgkGuw==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from fedora.localnet ([89.1.217.222]) by mail.gmx.net (mrgmx004
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MsHns-1rgSxj1ijy-00tnio for
 <linux-input@vger.kernel.org>; Fri, 13 Oct 2023 21:01:33 +0200
From:   Matthias Berndt <matthias_berndt@gmx.de>
To:     linux-input@vger.kernel.org
Subject: [PATCH v2] Input: xpad - add PXN V900 support
Date:   Fri, 13 Oct 2023 21:01:33 +0200
Message-ID: <4932699.31r3eYUQgx@fedora>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="nextPart4583486.LvFx2qVVIh"
Content-Transfer-Encoding: 7Bit
X-Provags-ID: V03:K1:gkMD6jBnZUEsr/WCSQ4sqlbGTxlVa8hRLxT2Pr8Tj9HszEl7iPO
 3hK8dm53h1LbYMhDFW/crErAG0n0MyV1vaqsD3wVLksyuan74WhiUPXjxpyYnfBbU01n/UV
 lDEhutFwmVqDImVYkT8oJTvDukfwWbWzADhx416aF03RL1s+B18/v2KfzuW4jQMO5g2xVoj
 Fp5K5H2a7Oh2jFB0FjEmQ==
UI-OutboundReport: notjunk:1;M01:P0:/I9uzKK5UAU=;qHVwYt9pudC7pWaS4UobypjZkTO
 JeZ1Xp+dteiEnhIRr7cphGRWndt9isk3Ug6eXrwjgLFKiH1rz7TgpnidqApjjSmlzczjkfL3P
 Rj2zOxWTFhPViWQX3Thx3t4b+0Bt1NyCyL5To3xyoEzqY9lgYXyu+lL9T8L012MMnyPtKPG0u
 Vu7CKWicwi395PH46Gg+qQTDxCW5UHsAx4tvZHROFZ4IhvAwvbhwLVY8QmgJKZEWrBmzwnZ2/
 QGHuFW6/cf+01CLWE0lsyjV6ymjrcjBkz5fZwgEBmpRuFkwfzg+QbkEJ77MCI4EVzYm8lRK7l
 xvgBk2uQJWFntJ7zCUHEMemWnqURAYYVGLIgMFPxOs3WcLyrAfA8j98jO15xQIpOT3cJbiB2q
 lPaelIMK8ae249uSbU80VDetVzv50b6PP0OXcNAquOWBGYj6oo0py959C5eKq1uPioOZoRLFP
 vsE5DQQxBWlyJB6f/4+DyOd3ZYu+lw7xGxvpLPeIMbJEb8WqXCdOshIcbRtyOh8PeDvVzKucq
 ztaNnH3M85u1C8yiPgeye5IZUp68zHfK9zD5T96mYrIwZLxvs4pqANaf9RF5CRaT6rSdIrDHg
 Cnm58n1eM6TPEgNSNPR3RklIzX2DvgYD5+myEiizi5RRQ16OP1Aylxi2s5vfOCOLMUK1hAftV
 XvVtoL2c50Cx702QZB8Vz2ME/2Z5sGRkA/qDoDIQyfQEU82lttWEF2O02TiMXDpzoji9IJfLg
 CfdeYLBui1t9FdwtqRvyX0IRXfchxbnAReDO5ktQjfGCB8DpqY09qes0IMgaMNh8XbTHS6E5c
 MFkF5PVnC8no1bmucsvgliTrs2+8IJk8NLyBfu5r1DQGI9YIJ0ePAbPN0NzkLvBh5H+oxhCxH
 QOeEZRpIBj6NeVdpxZQ4wrAXmOduqqsiAjxZNuJYoICjkZmbms90CFKQMD2lLT8lRta/IxsjY
 wcA3tw0X5WPROlR2FxSRgTnvzMk=
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        RCVD_IN_DNSWL_BLOCKED,RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

This is a multi-part message in MIME format.

--nextPart4583486.LvFx2qVVIh
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="UTF-8"

Hey,

I'd like to submit again my patch to enable support for the PXN V900 steeri=
ng=20
wheel in the xpad driver. It now contains the necessary Signed-off-by line =
=E2=80=93=20
thank you Dmitry for pointing that out.

All the best,
Matthias

--nextPart4583486.LvFx2qVVIh
Content-Disposition: attachment;
 filename="0001-Input-xpad-add-PXN-V900-support.patch"
Content-Transfer-Encoding: quoted-printable
Content-Type: text/x-patch; charset="x-UTF_8J";
 name="0001-Input-xpad-add-PXN-V900-support.patch"

=46rom 79080b54a269071eeb9896ade7bb609c1b88c527 Mon Sep 17 00:00:00 2001
From: Matthias Berndt <matthias_berndt@gmx.de>
Date: Mon, 25 Sep 2023 17:54:13 +0200
Subject: [PATCH] Input: xpad - add PXN V900 support

Add VID and PID to the xpad_device table to allow driver
to use the PXN V900 steering wheel, which is
XTYPE_XBOX360 compatible in xinput mode.

Signed-off-by: Matthias Berndt <matthias_berndt@gmx.de>
=2D--
 drivers/input/joystick/xpad.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/input/joystick/xpad.c b/drivers/input/joystick/xpad.c
index ede380551e55..478bf657efc2 100644
=2D-- a/drivers/input/joystick/xpad.c
+++ b/drivers/input/joystick/xpad.c
@@ -272,6 +272,7 @@ static const struct xpad_device {
 	{ 0x1038, 0x1430, "SteelSeries Stratus Duo", 0, XTYPE_XBOX360 },
 	{ 0x1038, 0x1431, "SteelSeries Stratus Duo", 0, XTYPE_XBOX360 },
 	{ 0x11c9, 0x55f0, "Nacon GC-100XF", 0, XTYPE_XBOX360 },
+	{ 0x11ff, 0x0511, "PXN V900", 0, XTYPE_XBOX360 },
 	{ 0x1209, 0x2882, "Ardwiino Controller", 0, XTYPE_XBOX360 },
 	{ 0x12ab, 0x0004, "Honey Bee Xbox360 dancepad", MAP_DPAD_TO_BUTTONS, XTY=
PE_XBOX360 },
 	{ 0x12ab, 0x0301, "PDP AFTERGLOW AX.1", 0, XTYPE_XBOX360 },
@@ -503,6 +504,7 @@ static const struct usb_device_id xpad_table[] =3D {
 	XPAD_XBOX360_VENDOR(0x3285),		/* Nacon GC-100 */
 	XPAD_XBOX360_VENDOR(0x3537),		/* GameSir Controllers */
 	XPAD_XBOXONE_VENDOR(0x3537),		/* GameSir Controllers */
+	XPAD_XBOX360_VENDOR(0x11ff),		/* PXN V900 */
 	{ }
 };

=2D-
2.41.0


--nextPart4583486.LvFx2qVVIh--



