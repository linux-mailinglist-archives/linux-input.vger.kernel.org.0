Return-Path: <linux-input+bounces-664-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 2EF7180BC57
	for <lists+linux-input@lfdr.de>; Sun, 10 Dec 2023 18:28:39 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id B7ABA1F20F35
	for <lists+linux-input@lfdr.de>; Sun, 10 Dec 2023 17:28:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7C9211863E;
	Sun, 10 Dec 2023 17:28:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=wanadoo.fr header.i=@wanadoo.fr header.b="ZXZ1qU84"
X-Original-To: linux-input@vger.kernel.org
X-Greylist: delayed 450 seconds by postgrey-1.37 at lindbergh.monkeyblade.net; Sun, 10 Dec 2023 09:28:30 PST
Received: from smtp.smtpout.orange.fr (smtp-13.smtpout.orange.fr [80.12.242.13])
	by lindbergh.monkeyblade.net (Postfix) with ESMTP id 88927E1
	for <linux-input@vger.kernel.org>; Sun, 10 Dec 2023 09:28:30 -0800 (PST)
Received: from pop-os.home ([92.140.202.140])
	by smtp.orange.fr with ESMTPA
	id CNUArclegsaM8CNUArtR4j; Sun, 10 Dec 2023 18:20:58 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wanadoo.fr;
	s=t20230301; t=1702228858;
	bh=C9fceqXzVbndKoQVbdNeb4fI05XCiHfbkjzq+6X8Vgs=;
	h=From:To:Cc:Subject:Date;
	b=ZXZ1qU84Kqhmmpjwh13l6+ke0Q+qqj6pYHCmQRR7hz/4ewZcYXMbXIk4YMBQStOba
	 eulTp9iEgrpKwz/Riqco8pu2ldMMsSAAp4/JKsl3i7jjNoD27NBsc7kqTi74tXxZm7
	 xEkXtLUd9eFVscbfNz2sIHIPtTarLP+R5alTvyM6MhpykCYm+e2t7awfX26ltO5qYz
	 9lNeS+xPaDOGAh7tRHUeaN3gcm0vHGSdzLWoVOdUSDiI6mKkILj2VPq4CcW4ABL0lq
	 elw1cb0gc3Y9rSOWQui2SAy6D6e+QyKq0QqKUt5e6R4WAO0uk66jnEmBI05MDsREff
	 INJCogq9xnosQ==
X-ME-Helo: pop-os.home
X-ME-Auth: Y2hyaXN0b3BoZS5qYWlsbGV0QHdhbmFkb28uZnI=
X-ME-Date: Sun, 10 Dec 2023 18:20:58 +0100
X-ME-IP: 92.140.202.140
From: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: linux-kernel@vger.kernel.org,
	kernel-janitors@vger.kernel.org,
	Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
	linux-input@vger.kernel.org
Subject: [PATCH] Input: xpad - Remove usage of the deprecated ida_simple_xx() API
Date: Sun, 10 Dec 2023 18:20:57 +0100
Message-Id: <a3e30e30f18cc5d6f032c8013ce9d900c8e223e5.1702228806.git.christophe.jaillet@wanadoo.fr>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

ida_alloc() and ida_free() should be preferred to the deprecated
ida_simple_get() and ida_simple_remove().

This is less verbose.

Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
---
 drivers/input/joystick/xpad.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/input/joystick/xpad.c b/drivers/input/joystick/xpad.c
index f5c21565bb3c..00c77e906744 100644
--- a/drivers/input/joystick/xpad.c
+++ b/drivers/input/joystick/xpad.c
@@ -1669,7 +1669,7 @@ static int xpad_led_probe(struct usb_xpad *xpad)
 	if (!led)
 		return -ENOMEM;
 
-	xpad->pad_nr = ida_simple_get(&xpad_pad_seq, 0, 0, GFP_KERNEL);
+	xpad->pad_nr = ida_alloc(&xpad_pad_seq, GFP_KERNEL);
 	if (xpad->pad_nr < 0) {
 		error = xpad->pad_nr;
 		goto err_free_mem;
@@ -1692,7 +1692,7 @@ static int xpad_led_probe(struct usb_xpad *xpad)
 	return 0;
 
 err_free_id:
-	ida_simple_remove(&xpad_pad_seq, xpad->pad_nr);
+	ida_free(&xpad_pad_seq, xpad->pad_nr);
 err_free_mem:
 	kfree(led);
 	xpad->led = NULL;
@@ -1705,7 +1705,7 @@ static void xpad_led_disconnect(struct usb_xpad *xpad)
 
 	if (xpad_led) {
 		led_classdev_unregister(&xpad_led->led_cdev);
-		ida_simple_remove(&xpad_pad_seq, xpad->pad_nr);
+		ida_free(&xpad_pad_seq, xpad->pad_nr);
 		kfree(xpad_led);
 	}
 }
-- 
2.34.1


