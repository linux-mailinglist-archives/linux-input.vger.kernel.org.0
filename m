Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E65C06195C
	for <lists+linux-input@lfdr.de>; Mon,  8 Jul 2019 04:49:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727485AbfGHCtg (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Sun, 7 Jul 2019 22:49:36 -0400
Received: from mout.gmx.net ([212.227.17.21]:50211 "EHLO mout.gmx.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726105AbfGHCtf (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Sun, 7 Jul 2019 22:49:35 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
        s=badeba3b8450; t=1562554169;
        bh=ZtGBScPjCu9HZHQ98skuGByJ/vmdQxhdFquScTVHRFc=;
        h=X-UI-Sender-Class:From:To:Cc:Subject:Date;
        b=hukWQOmlJpWSu0+y3BB2ntttZa4WUoDttsOrxT+yE0eUtEvjG9fZgA69VSCe8erj7
         tGUdj49kyxWXLKs3dWKIbktfJV2lcW8V9ZHc6+OTOPOKsroRVmrux0U/c6+XIWhr/4
         IAoSCytnOXGLPzRNEs7CEC/nHqRRGsVQqDq4XYuM=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from b450.lan ([79.213.219.209]) by mail.gmx.com (mrgmx102
 [212.227.17.168]) with ESMTPSA (Nemesis) id 0M1zFf-1icxVL3CuZ-00txWx; Mon, 08
 Jul 2019 04:49:28 +0200
From:   Tim Schumacher <timschumi@gmx.de>
To:     linux-input@vger.kernel.org
Cc:     linux-kernel@vger.kernel.org, tglx@linutronix.de, timschumi@gmx.de
Subject: [PATCH] Input: iforce - Remove empty multiline comments
Date:   Mon,  8 Jul 2019 04:50:10 +0200
Message-Id: <20190708025010.9318-1-timschumi@gmx.de>
X-Mailer: git-send-email 2.22.0
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:p2GCja4Y0AryXGAGDE44xvtP/xyumAVh6rZRPOF7GZ3j8BAd2Ll
 M1N1hHZ4X+ZVX0P+bL4xXY+fotzTV87BHy9Ke3tYV6o1tmOlEK4zMpL7RusMcPrhLsX2CIe
 /EThCdc/HRb6CH0DgSrbK6+mkD2Nd7zEHAFQN3mSuKTPlO9a5xOfQSchOG1+GKNqCXc+HC8
 wJKS025JBKnW47RKsH4fA==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:wwBnvjGwdnA=:NnAWSEOSq8siykEELUDl1k
 pTAPJt3dGYH4EugPFqndD4xWnJi35JWVxd9ypjnvlnZon3Iwxoj7n5STba2Li8Vv+/iQjwtZp
 69syOMjYPbZ7QU0+VHUOcZTns/WjpuMUGFyUUuW5gBfskTJxn4meiLrw3rLUc6tWkg1IbjwQx
 JPgKl3fZvYNRQ14Pr2iZDNTKQwtoNjAQtBNreRhthakqHiZiTQLUUMUd/AEKwlUtki4gMHUuN
 O1O1qV+jWFNqnW/EbirmqKqK4ttCYsUu2bBJQ8R9/AqP9tURgbEVkdrAsKtuHZyJKE3D9AGZA
 gTdDZ2YCz8zq/LmUCCqCEc//GIlJ4k2A1TihcpolDyeKv2Y3eAaq6RlMypm7tII49yc95GHpf
 Zl3mGhdVC6n82hXcz0vLIigo54vFL0BESnP0hdA3IhHNhZP6tT5K9R5/1FPTNe4zdj7mwsaZJ
 LFctVgcYJO1jR00w+YZ5NFaIK19MwaWgpl3aJ7DlbLA8He3lvjA+6CqhaJrkyH47UZ/fMakeR
 4Ftcq8SoKIclKQXcpoYOSeQcqlfPgGN2Ftvn1nIXBspZCpcbGNkbvSla4bqJm1UY/AB5tN/bX
 h8bJJgCZk1c9Kx096fE2iH0krSNSoZ7mTnu0dWq/pibhcAbJ0DPleeJXhLDgLbz6dhWy3xzQI
 jPy9V7IATo+tCynZKFJbIoSv/AFbI+iAiZ6AKT5usNh01KnF1/+6p+PEimBO9fYF+EKcLZFNg
 9eWNStn2v6KNKh3uDIs4J4OtxGMXrX8WlyHYRGo46y+MAVSAS1J0bxAwO1fsWr/tU07aLVnIS
 O9/seyOp3oHhyEGhzSUe2zg6i+ErSunWv7fc1p+aTscjWup6IfIM2hjGwgINwbGJqKHx0IUXs
 nA49NCe1S7/GFHyf6SoxXJlfvrlvytjf4yV1B8pWIbxr1Jh/3dg78g9zMdL0auTTrmCGoeVsM
 T6SMNDqYW/SJ+xrWqusAOVJVyEmwxfCGN6X8IELEMCLsCMEPdoH+kKeVzek84T/Wk+0y0bfy8
 jvSU4NaKwpKO9161eB24/+kWGX/iFpHK2g6MX6dJrmR6vt09njSV8rtYKbcBalEYrCNb5SBx9
 /R2v0u2GfmdFts=
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Those are remnants of the SPDX identifier migration, which haven't been
removed properly.

Signed-off-by: Tim Schumacher <timschumi@gmx.de>
=2D--
This is probably the highest level of cosmetic-only that a patch
can achieve, sorry for the noise.

CCing Thomas Gleixner, since the tool (is it a tool?) that makes
those SPDX changes would have room for improvement in that regard.
It seems to expect that all of the license information is contained
within the same comment block, which wasn't the case for the iforce
driver.
=2D--
 drivers/input/joystick/iforce/iforce-ff.c      | 3 ---
 drivers/input/joystick/iforce/iforce-main.c    | 3 ---
 drivers/input/joystick/iforce/iforce-packets.c | 3 ---
 drivers/input/joystick/iforce/iforce-serio.c   | 3 ---
 drivers/input/joystick/iforce/iforce-usb.c     | 3 ---
 drivers/input/joystick/iforce/iforce.h         | 3 ---
 6 files changed, 18 deletions(-)

diff --git a/drivers/input/joystick/iforce/iforce-ff.c b/drivers/input/joy=
stick/iforce/iforce-ff.c
index 2ed7da7d1f3e..4350927f7781 100644
=2D-- a/drivers/input/joystick/iforce/iforce-ff.c
+++ b/drivers/input/joystick/iforce/iforce-ff.c
@@ -6,9 +6,6 @@
  *  USB/RS232 I-Force joysticks and wheels.
  */

-/*
- */
-
 #include "iforce.h"

 /*
diff --git a/drivers/input/joystick/iforce/iforce-main.c b/drivers/input/j=
oystick/iforce/iforce-main.c
index 55f5b7bb4cac..8c2ffa43ce89 100644
=2D-- a/drivers/input/joystick/iforce/iforce-main.c
+++ b/drivers/input/joystick/iforce/iforce-main.c
@@ -6,9 +6,6 @@
  *  USB/RS232 I-Force joysticks and wheels.
  */

-/*
- */
-
 #include "iforce.h"

 MODULE_AUTHOR("Vojtech Pavlik <vojtech@ucw.cz>, Johann Deneux <johann.den=
eux@gmail.com>");
diff --git a/drivers/input/joystick/iforce/iforce-packets.c b/drivers/inpu=
t/joystick/iforce/iforce-packets.c
index 42cd9730e4cc..677a7773059d 100644
=2D-- a/drivers/input/joystick/iforce/iforce-packets.c
+++ b/drivers/input/joystick/iforce/iforce-packets.c
@@ -6,9 +6,6 @@
  *  USB/RS232 I-Force joysticks and wheels.
  */

-/*
- */
-
 #include "iforce.h"

 static struct {
diff --git a/drivers/input/joystick/iforce/iforce-serio.c b/drivers/input/=
joystick/iforce/iforce-serio.c
index 65a4fe26324f..b3fff64d92dd 100644
=2D-- a/drivers/input/joystick/iforce/iforce-serio.c
+++ b/drivers/input/joystick/iforce/iforce-serio.c
@@ -6,9 +6,6 @@
  *  USB/RS232 I-Force joysticks and wheels.
  */

-/*
- */
-
 #include "iforce.h"

 void iforce_serial_xmit(struct iforce *iforce)
diff --git a/drivers/input/joystick/iforce/iforce-usb.c b/drivers/input/jo=
ystick/iforce/iforce-usb.c
index f1569ae8381b..ec5058e05317 100644
=2D-- a/drivers/input/joystick/iforce/iforce-usb.c
+++ b/drivers/input/joystick/iforce/iforce-usb.c
@@ -6,9 +6,6 @@
  *  USB/RS232 I-Force joysticks and wheels.
  */

-/*
- */
-
 #include "iforce.h"

 void iforce_usb_xmit(struct iforce *iforce)
diff --git a/drivers/input/joystick/iforce/iforce.h b/drivers/input/joysti=
ck/iforce/iforce.h
index f1681706f526..32e91baf63f5 100644
=2D-- a/drivers/input/joystick/iforce/iforce.h
+++ b/drivers/input/joystick/iforce/iforce.h
@@ -6,9 +6,6 @@
  *  USB/RS232 I-Force joysticks and wheels.
  */

-/*
- */
-
 #include <linux/kernel.h>
 #include <linux/slab.h>
 #include <linux/input.h>
=2D-
2.22.0

