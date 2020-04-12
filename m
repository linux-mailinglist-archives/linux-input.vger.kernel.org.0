Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (unknown [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6824C1A60C4
	for <lists+linux-input@lfdr.de>; Sun, 12 Apr 2020 23:47:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727400AbgDLVrL (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Sun, 12 Apr 2020 17:47:11 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.18]:51162 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727388AbgDLVrL (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Sun, 12 Apr 2020 17:47:11 -0400
Received: from smtp.smtpout.orange.fr (smtp10.smtpout.orange.fr [80.12.242.132])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id C93C4C0A88B5
        for <linux-input@vger.kernel.org>; Sun, 12 Apr 2020 14:47:11 -0700 (PDT)
Received: from localhost.localdomain ([90.126.162.40])
        by mwinf5d33 with ME
        id Rxff220080scBcy03xffJe; Sun, 12 Apr 2020 23:39:40 +0200
X-ME-Helo: localhost.localdomain
X-ME-Auth: Y2hyaXN0b3BoZS5qYWlsbGV0QHdhbmFkb28uZnI=
X-ME-Date: Sun, 12 Apr 2020 23:39:40 +0200
X-ME-IP: 90.126.162.40
From:   Christophe JAILLET <christophe.jaillet@wanadoo.fr>
To:     linus.walleij@linaro.org, dmitry.torokhov@gmail.com,
        robh@kernel.org
Cc:     linux-input@vger.kernel.org, linux-kernel@vger.kernel.org,
        kernel-janitors@vger.kernel.org,
        Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Subject: [PATCH] Input: dlink-dir685-touchkeys: Fix a typo in driver name
Date:   Sun, 12 Apr 2020 23:39:37 +0200
Message-Id: <20200412213937.5287-1-christophe.jaillet@wanadoo.fr>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

According to the file name and Kconfig, a 'k' is missing in this driver
name. It should be "dlink-dir685-touchkeys".

Fixes: 131b3de7016b ("Input: add D-Link DIR-685 touchkeys driver")
Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
---
 drivers/input/keyboard/dlink-dir685-touchkeys.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/input/keyboard/dlink-dir685-touchkeys.c b/drivers/input/keyboard/dlink-dir685-touchkeys.c
index b0ead7199c40..a69dcc3bd30c 100644
--- a/drivers/input/keyboard/dlink-dir685-touchkeys.c
+++ b/drivers/input/keyboard/dlink-dir685-touchkeys.c
@@ -143,7 +143,7 @@ MODULE_DEVICE_TABLE(of, dir685_tk_of_match);
 
 static struct i2c_driver dir685_tk_i2c_driver = {
 	.driver = {
-		.name	= "dlin-dir685-touchkeys",
+		.name	= "dlink-dir685-touchkeys",
 		.of_match_table = of_match_ptr(dir685_tk_of_match),
 	},
 	.probe		= dir685_tk_probe,
-- 
2.20.1

