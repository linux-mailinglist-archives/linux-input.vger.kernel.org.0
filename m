Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AE54D3DCC23
	for <lists+linux-input@lfdr.de>; Sun,  1 Aug 2021 16:43:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231961AbhHAOoC (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Sun, 1 Aug 2021 10:44:02 -0400
Received: from mout.gmx.net ([212.227.15.15]:50505 "EHLO mout.gmx.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231940AbhHAOoB (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Sun, 1 Aug 2021 10:44:01 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
        s=badeba3b8450; t=1627829027;
        bh=klt86JV7wMteD/UIiHSWBT8y4jnTNfeS3Qqd0niWM4M=;
        h=X-UI-Sender-Class:From:To:Cc:Subject:Date;
        b=gnNAXN7EUbPAt3K0GHl7Ab+qlC/eyVjncpxkjdKOBWROtJaZcVNFuJS/yLTE7N90a
         q/3/ph5mDGt+lwt48MOI5CYFoJ+Ihu5KyF+b49/YjAkkT8gxqtuL3J/Yfk69GSTaoT
         zNwNdk4rNaAUQQ/Y/KrZ4t0gRx5rSvMP4IhV17Mo=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from localhost.localdomain ([79.150.72.99]) by mail.gmx.net
 (mrgmx004 [212.227.17.184]) with ESMTPSA (Nemesis) id
 1MZktZ-1mde4L39E7-00WnVA; Sun, 01 Aug 2021 16:43:46 +0200
From:   Len Baker <len.baker@gmx.com>
To:     Kees Cook <keescook@chromium.org>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc:     Len Baker <len.baker@gmx.com>, Lee Jones <lee.jones@linaro.org>,
        Russell King <rmk+kernel@armlinux.org.uk>,
        =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= 
        <u.kleine-koenig@pengutronix.de>, linux-hardening@vger.kernel.org,
        linux-input@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH] drivers/input: Remove all strcpy() uses in favor of strscpy()
Date:   Sun,  1 Aug 2021 16:43:16 +0200
Message-Id: <20210801144316.12841-1-len.baker@gmx.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:dXGu540LziWus88Pw77iOUvFvazpmIoNZsFoVoEqrQuIOiOmjeZ
 B+gFU2Wt6DHdTZgdZHzs42kbV7Ed13wQBwgZZgOGN/eNk6+LFA3aNJ0uEShjRWTAmQ+NxA2
 YLsn3ceaMhXlx7QqmVVNjYougcO4vXcvtKl1wnbFBvxb5IKGwQaYzxawnRiIaBSGvDx50yc
 AnjlsDTFxo1qBhwoOcovA==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:Gk8rBXZWuOc=:RIWVpVBj4frqLgZLTamcGO
 p95bYD3J2cJsQHIrh6rol5Ej36v+CldKhmwG0Sv4Hx/a5AoNY/b1fOqMAu//fmC8YLTgiwRQC
 pR8kwuYCemmvAhsmw7c2Hl5p/KhGjYItnHSeMEFsbyoDyxbfveOCDe54ci2Gf/uvyUYcbNnTq
 UqknHfBfVqL3jYamNFZSoLNB9g3UxiZq2A4SL5uqOWRYGPTZurxYjf5Yxw2Vua2CD2gwfoYvq
 dxvc0w70XL8pE8nr063u1lmzsLG97WuwhbFZ239tkhRWXiOnwZs1oLarG1Y2JlOOtbzwayxpr
 S1pejZVE0HQaBVdjCG1o96Oy17G+PvP6KXJ6J2pzUDL4wn1Wwfwavv8SFP85yPF/qgoi+d8RK
 loeAuiQGaF5f4oWgoOZIY59MSfULi704c+wtYYIk9HJ3gdVhw+J90oSH2eSUH0Icn0EkoYUqI
 5rUm5UplGz0xO9GvQCc5SpeG9jP+6rLqPlTs7kmEUFEiQdzUBnhwu8dlV9SUUNRz117/5yVKh
 a4iDLq/H8HxF3Bkv5QNpe9Pfw+/k9sklOqF4YSGqDv4bCIekRo5LT7DKYzSdKC05os5exDRdO
 Qazr5gnQjQAaQLVYLVADBcdgXZ+nQqulgzttYeQhvVruOUSBuAJW484lyJaRq98X1/HHgGGU1
 C3CNxmKvft/uVv54ThNRGy4egclT/3MHITGNiyAUzDnrYQMDAP925F0ry8uFKnBtJyhxOpwmk
 V7Dngl2J7tqtHMNXMZm/84N4W+7DgugucU8Xg9Fy80OZFuX72y9rYhE5kNIFHUPkcQ72KLPoK
 VTJ7lGF9LQ+ut9EnlfTj3nNWjn+KZ6fobYG/bUTTbLqOcdO26fT4VnU/WldsaWknoIT7i+iAs
 hoB6B3LrDRBJpMk7Ha0q8dvSsKPH4my3tCCWEPVlDRtI3Hmclot2U+XdwWUnR1suOTJrmUrPD
 l8pqm3IZj26AwAF3CXGCJDgkAXVxaybLb16x+eM94Zlo9fzCynxZMyDfh26zx7yCMTG8IcsBk
 Br2RYMN10BYjiV0iULCVy8VtxjVkMuSIDj/5dOaCb/ySNst8pO5RcvA4Nmce/jRvubbYrT8SV
 4a2PPhv/JxMVIprX+G6Q4fCsbBZoAfMwK1j
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

strcpy() performs no bounds checking on the destination buffer. This
could result in linear overflows beyond the end of the buffer, leading
to all kinds of misbehaviors. The safe replacement is strscpy().

Signed-off-by: Len Baker <len.baker@gmx.com>
=2D--
This is a task of the KSPP [1]

[1] https://github.com/KSPP/linux/issues/88

 drivers/input/keyboard/locomokbd.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/input/keyboard/locomokbd.c b/drivers/input/keyboard/l=
ocomokbd.c
index dae053596572..dbb3dc48df12 100644
=2D-- a/drivers/input/keyboard/locomokbd.c
+++ b/drivers/input/keyboard/locomokbd.c
@@ -254,7 +254,7 @@ static int locomokbd_probe(struct locomo_dev *dev)
 	locomokbd->suspend_jiffies =3D jiffies;

 	locomokbd->input =3D input_dev;
-	strcpy(locomokbd->phys, "locomokbd/input0");
+	strscpy(locomokbd->phys, "locomokbd/input0", sizeof(locomokbd->phys));

 	input_dev->name =3D "LoCoMo keyboard";
 	input_dev->phys =3D locomokbd->phys;
=2D-
2.25.1

