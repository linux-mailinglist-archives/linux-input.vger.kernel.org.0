Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 56FEF407643
	for <lists+linux-input@lfdr.de>; Sat, 11 Sep 2021 13:27:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235697AbhIKL2r (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Sat, 11 Sep 2021 07:28:47 -0400
Received: from mout.gmx.net ([212.227.17.22]:50971 "EHLO mout.gmx.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230249AbhIKL2r (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Sat, 11 Sep 2021 07:28:47 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
        s=badeba3b8450; t=1631359652;
        bh=PhWfRPf31PepNWYNB76MkqMicEwzfnpoC3K7z7hIAVk=;
        h=X-UI-Sender-Class:From:To:Cc:Subject:Date;
        b=HneWRXlcWTKqLtex0Fe+OiCOEsgBBRJ0ryRhvEitmHtP0gb4TgESQk3J2BDL325ZQ
         7SHtwYLBSMB7dkasjll+6JGQPJ5nn526x1S0j3etvt0xU8QPOeY7ciOt4ZyqkzuxM0
         u180pQJt6iXgVcjcUw0nUH8WZnGN5BHyyMf/IAmA=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from localhost.localdomain ([79.150.72.99]) by mail.gmx.net
 (mrgmx105 [212.227.17.174]) with ESMTPSA (Nemesis) id
 1MdNcG-1my4s0091U-00ZS4c; Sat, 11 Sep 2021 13:27:32 +0200
From:   Len Baker <len.baker@gmx.com>
To:     Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc:     Len Baker <len.baker@gmx.com>, Kees Cook <keescook@chromium.org>,
        linux-hardening@vger.kernel.org, linux-input@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH] Input: omap-keypad - prefer struct_size over open coded arithmetic
Date:   Sat, 11 Sep 2021 13:27:16 +0200
Message-Id: <20210911112716.10067-1-len.baker@gmx.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:GKwmQlkYhmtlh9LkRWaTgXGoUoEhf8TnpxfaAe+WAcCCHqQg5zQ
 uw8hl40ouK9WZw0Y/obObHuibTH8egW4fL/Ki9NoWfSqy482RSn47leEkjGSJnb6yoUGtvy
 ZH2agJcMKxIAqylXpQIE8uq4UsaVaY7g7lI86z+Z+8VMOltLL1g+5sYqmj5POhgzjihZK1h
 QiTqFmbrP4FOL84sCr1jA==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:77agfypHFcU=:n5emUQls6dZ7KabUao+CTw
 MoyczOfuOGNMMg8CMg8TYmM2jlg7zcP5XpSGRkoKYX4B0YSW2TwBmBoQFbbp2ESfcoegWfg4w
 6HS7mFaip9b+mQEgs1GmgTN1zYaAnZDmR5CxVAYdvs9ZUmQVrqDSzF3Uw5GHWnJUuqd+gM75R
 NtQF1oPEVQ3WzVcu4TNq6tdMhVvJZ/4YrJXEc36F/soePFJSswrq6oxL7VAGnSgylIszFCBI3
 HWRVOnwHT78KrX/LDD2WVgZa4Hfl8s+65rUZUz48bTBh6aWVYCn9lOvsLQdaz6Scbav683k1B
 d3caGCe272soxwsRFdrhy9V/QzFridEtINrdd4MSy9ZP6t10O3qoZhbZeucCenx3ixdxqszSy
 VhJqFczRs9o+3WCK8/pB6716fuh7AcxsUuTIcavHWUrTBQYXGDCDFKYVm8xuPx54Ap57hhZr/
 SulxK03TRQSzb5SroIb/uauj8ftgy94K0iw+Oph3tHeG4Qio+WHG8Uv2NskJWVkVNxYiDx7Ci
 /8TcExWlfTdKoGC1F+zqcl5NYWZgijvgADurr2aIcqMjiAcnBKG07QIgYDt/d/4n2/QZ78Ncs
 lcVUnVSc+Q9WCVvDmV84H9FRARD//4jgpfuiVBdpRzPURhn6INHOSYcy6PIsYb6hJ2B6ur2c4
 lCWrZdooFLLaVLVTQyen5CUkUJFUNBLr6MYIvklwmNkqbC6smCXrua+guJ/aR04FIUEHhKXux
 CeoqyDu1LxmTiDPJ+4Su/lTNRW2HOslstCrQdTddaLQbzqsrY4oXXEdovX6C2yqnwfXuS5lIO
 PSiNS7umGnuBNtAJMfc6hCjKEhm8t++97jREOLmiIkUzfj11eZGTjvFyB4HQVtszUIdiy0i7k
 7BBBrBMTtBMtaQRc2ESQzHW4sae80cdj+vJ2bk4IQCJEXQmlZcx1Uvw7hdRjdvBiHHHXTa1Cg
 RshXBHJapeY+tK6WNlUPDxEBaID2BwC/QaDpY+GBHQUEcImssgwCZE4HhBKseQpiiFWh2zH7H
 OehR8WNwiAwj7JHq7C9FFzaVovWUt3AOXcm2sGANpb0SrQIXTH0iyPuwft7T0Hw191d+hljkE
 88wJSbxIk2K3NA=
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

As noted in the "Deprecated Interfaces, Language Features, Attributes,
and Conventions" documentation [1], size calculations (especially
multiplication) should not be performed in memory allocator (or similar)
function arguments due to the risk of them overflowing. This could lead
to values wrapping around and a smaller allocation being made than the
caller was expecting. Using those allocations could lead to linear
overflows of heap memory and other misbehaviors.

So, use the struct_size() helper to do the arithmetic instead of the
argument "size + count * size" in the kzalloc() function.

[1] https://www.kernel.org/doc/html/v5.14/process/deprecated.html#open-cod=
ed-arithmetic-in-allocator-arguments

Signed-off-by: Len Baker <len.baker@gmx.com>
=2D--
 drivers/input/keyboard/omap-keypad.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/input/keyboard/omap-keypad.c b/drivers/input/keyboard=
/omap-keypad.c
index dbe836c7ff47..eb3a687796e7 100644
=2D-- a/drivers/input/keyboard/omap-keypad.c
+++ b/drivers/input/keyboard/omap-keypad.c
@@ -190,8 +190,7 @@ static int omap_kp_probe(struct platform_device *pdev)
 	row_shift =3D get_count_order(pdata->cols);
 	keycodemax =3D pdata->rows << row_shift;

-	omap_kp =3D kzalloc(sizeof(struct omap_kp) +
-			keycodemax * sizeof(unsigned short), GFP_KERNEL);
+	omap_kp =3D kzalloc(struct_size(omap_kp, keymap, keycodemax), GFP_KERNEL=
);
 	input_dev =3D input_allocate_device();
 	if (!omap_kp || !input_dev) {
 		kfree(omap_kp);
=2D-
2.25.1

