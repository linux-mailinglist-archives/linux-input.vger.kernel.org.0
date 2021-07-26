Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 048093D5AE2
	for <lists+linux-input@lfdr.de>; Mon, 26 Jul 2021 16:01:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234304AbhGZNVA (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 26 Jul 2021 09:21:00 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50960 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234266AbhGZNU6 (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Mon, 26 Jul 2021 09:20:58 -0400
Received: from forward100o.mail.yandex.net (forward100o.mail.yandex.net [IPv6:2a02:6b8:0:1a2d::600])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7DD2DC061760;
        Mon, 26 Jul 2021 07:01:27 -0700 (PDT)
Received: from myt6-ecec3fffc7db.qloud-c.yandex.net (myt6-ecec3fffc7db.qloud-c.yandex.net [IPv6:2a02:6b8:c12:4681:0:640:ecec:3fff])
        by forward100o.mail.yandex.net (Yandex) with ESMTP id 077544AC1E32;
        Mon, 26 Jul 2021 17:01:25 +0300 (MSK)
Received: from myt3-07a4bd8655f2.qloud-c.yandex.net (myt3-07a4bd8655f2.qloud-c.yandex.net [2a02:6b8:c12:693:0:640:7a4:bd86])
        by myt6-ecec3fffc7db.qloud-c.yandex.net (mxback/Yandex) with ESMTP id c7W0V4RLrH-1OIaRTta;
        Mon, 26 Jul 2021 17:01:24 +0300
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=maquefel.me; s=mail; t=1627308084;
        bh=O+NG9QH+QGtOt+8BNj0NbkeX29nT73RXhJybkefgHcY=;
        h=In-Reply-To:References:Date:Subject:To:From:Message-Id:Cc;
        b=olu0qxvnpqKjgN7kTG71lhJy2UtgCnMcOsEjGr2mYsRLWOMCWqwU8Ea2THUqMfGej
         KTl4nhzc0HnAL3FSFIx2lC/FyAVfs0g2W/pamhf2plRUlGCK193nxak4XZ4YK0bkaW
         6H0v9ABbr68mdzWHt/anhT2WpNKrig4+hYfgi2Gw=
Authentication-Results: myt6-ecec3fffc7db.qloud-c.yandex.net; dkim=pass header.i=@maquefel.me
Received: by myt3-07a4bd8655f2.qloud-c.yandex.net (smtp/Yandex) with ESMTPSA id olJ9yWy468-1O2itV9b;
        Mon, 26 Jul 2021 17:01:24 +0300
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (Client certificate not present)
From:   Nikita Shubin <nikita.shubin@maquefel.me>
To:     Alexander Sverdlin <alexander.sverdlin@gmail.com>,
        Geert Uytterhoeven <geert@linux-m68k.org>
Cc:     Nikita Shubin <nikita.shubin@maquefel.me>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Andrzej Pietrasiewicz <andrzej.p@collabora.com>,
        linux-input@vger.kernel.org (open list:INPUT (KEYBOARD, MOUSE, JOYSTICK
        , TOUCHSCREEN)...), linux-kernel@vger.kernel.org (open list)
Subject: [PATCH v2 3/8] Input: ep93xx_keypad: Prepare clock before using it
Date:   Mon, 26 Jul 2021 16:59:51 +0300
Message-Id: <20210726140001.24820-4-nikita.shubin@maquefel.me>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210726140001.24820-1-nikita.shubin@maquefel.me>
References: <20210726115058.23729-1-nikita.shubin@maquefel.me>
 <20210726140001.24820-1-nikita.shubin@maquefel.me>
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
Signed-off-by: Nikita Shubin <nikita.shubin@maquefel.me>
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

