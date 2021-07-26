Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4D9C83D58ED
	for <lists+linux-input@lfdr.de>; Mon, 26 Jul 2021 13:58:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233669AbhGZLRy (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 26 Jul 2021 07:17:54 -0400
Received: from forward105o.mail.yandex.net ([37.140.190.183]:51199 "EHLO
        forward105o.mail.yandex.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S233522AbhGZLRx (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Mon, 26 Jul 2021 07:17:53 -0400
X-Greylist: delayed 407 seconds by postgrey-1.27 at vger.kernel.org; Mon, 26 Jul 2021 07:17:53 EDT
Received: from iva3-ba3089b2118c.qloud-c.yandex.net (iva3-ba3089b2118c.qloud-c.yandex.net [IPv6:2a02:6b8:c0c:4993:0:640:ba30:89b2])
        by forward105o.mail.yandex.net (Yandex) with ESMTP id E39864202166;
        Mon, 26 Jul 2021 14:52:07 +0300 (MSK)
Received: from iva6-2d18925256a6.qloud-c.yandex.net (iva6-2d18925256a6.qloud-c.yandex.net [2a02:6b8:c0c:7594:0:640:2d18:9252])
        by iva3-ba3089b2118c.qloud-c.yandex.net (mxback/Yandex) with ESMTP id aSfDkSCq5K-q7ICMHDo;
        Mon, 26 Jul 2021 14:52:07 +0300
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=maquefel.me; s=mail; t=1627300327;
        bh=/f16TkSDWKaFVScpovE48juScbrvw8/zLnDN5uaA/BY=;
        h=In-Reply-To:Message-Id:References:Date:Subject:To:From:Cc;
        b=ANEJBXnHtfAPGkhL3DP6wYPzAUVg0BxUvq16NH7UUF0ReW+nwpp+i5wnoqBhu98Pb
         zZv/N5tdt8paPdzZLKmRF0CAIiv2DmvgCDtTuLkFHHryJ0CGLJlTbJsnqcEZkxWMFF
         IC6rzlybbjmYCC+d3sxnHBQEyAB7XqUx4xkxWbJs=
Authentication-Results: iva3-ba3089b2118c.qloud-c.yandex.net; dkim=pass header.i=@maquefel.me
Received: by iva6-2d18925256a6.qloud-c.yandex.net (smtp/Yandex) with ESMTPSA id PIKatQa27D-q72S8Gts;
        Mon, 26 Jul 2021 14:52:07 +0300
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (Client certificate not present)
From:   Nikita Shubin <nikita.shubin@maquefel.me>
To:     Alexander Sverdlin <alexander.sverdlin@gmail.com>,
        Geert Uytterhoeven <geert@linux-m68k.org>
Cc:     Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Andrzej Pietrasiewicz <andrzej.p@collabora.com>,
        linux-input@vger.kernel.org (open list:INPUT (KEYBOARD, MOUSE, JOYSTICK
        , TOUCHSCREEN)...), linux-kernel@vger.kernel.org (open list)
Subject: [PATCH 3/8] Input: ep93xx_keypad: Prepare clock before using it
Date:   Mon, 26 Jul 2021 14:50:47 +0300
Message-Id: <20210726115058.23729-4-nikita.shubin@maquefel.me>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210726115058.23729-1-nikita.shubin@maquefel.me>
References: <20210726115058.23729-1-nikita.shubin@maquefel.me>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

From: Alexander Sverdlin <alexander.sverdlin@gmail.com>

Use clk_prepare_enable()/clk_disable_unprepare() in preparation for switch
to Common Clock Framework.

Signed-off-by: Alexander Sverdlin <alexander.sverdlin@gmail.com>
Acked-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
---
 drivers/input/keyboard/ep93xx_keypad.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/input/keyboard/ep93xx_keypad.c b/drivers/input/keyboard/ep93xx_keypad.c
index c8194333d612..e0e931e796fa 100644
--- a/drivers/input/keyboard/ep93xx_keypad.c
+++ b/drivers/input/keyboard/ep93xx_keypad.c
@@ -157,7 +157,7 @@ static int ep93xx_keypad_open(struct input_dev *pdev)
 
 	if (!keypad->enabled) {
 		ep93xx_keypad_config(keypad);
-		clk_enable(keypad->clk);
+		clk_prepare_enable(keypad->clk);
 		keypad->enabled = true;
 	}
 
@@ -169,7 +169,7 @@ static void ep93xx_keypad_close(struct input_dev *pdev)
 	struct ep93xx_keypad *keypad = input_get_drvdata(pdev);
 
 	if (keypad->enabled) {
-		clk_disable(keypad->clk);
+		clk_disable_unprepare(keypad->clk);
 		keypad->enabled = false;
 	}
 }
-- 
2.26.2

