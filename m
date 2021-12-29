Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5C5A748170A
	for <lists+linux-input@lfdr.de>; Wed, 29 Dec 2021 22:27:06 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232409AbhL2V1E (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 29 Dec 2021 16:27:04 -0500
Received: from smtp03.smtpout.orange.fr ([80.12.242.125]:54491 "EHLO
        smtp.smtpout.orange.fr" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232406AbhL2V1D (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Wed, 29 Dec 2021 16:27:03 -0500
Received: from pop-os.home ([86.243.171.122])
        by smtp.orange.fr with ESMTPA
        id 2gTKn0c7fPNph2gTKnkEL6; Wed, 29 Dec 2021 22:27:01 +0100
X-ME-Helo: pop-os.home
X-ME-Auth: YWZlNiIxYWMyZDliZWIzOTcwYTEyYzlhMmU3ZiQ1M2U2MzfzZDfyZTMxZTBkMTYyNDBjNDJlZmQ3ZQ==
X-ME-Date: Wed, 29 Dec 2021 22:27:01 +0100
X-ME-IP: 86.243.171.122
From:   Christophe JAILLET <christophe.jaillet@wanadoo.fr>
To:     dmitry.torokhov@gmail.com, paul@crapouillou.net
Cc:     linux-input@vger.kernel.org, linux-kernel@vger.kernel.org,
        kernel-janitors@vger.kernel.org,
        Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Subject: [PATCH] Input: gpio-keys: Avoid clearing twice some memory
Date:   Wed, 29 Dec 2021 22:26:56 +0100
Message-Id: <d6ee621b9dd75b92f8831db365cee58dc2025322.1640813136.git.christophe.jaillet@wanadoo.fr>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

bitmap_parselist() already clears the 'bits' bitmap, so there is no need
to clear it when it is allocated. This just wastes some cycles.

Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
---
 drivers/input/keyboard/gpio_keys.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/input/keyboard/gpio_keys.c b/drivers/input/keyboard/gpio_keys.c
index 8dbf1e69c90a..d75a8b179a8a 100644
--- a/drivers/input/keyboard/gpio_keys.c
+++ b/drivers/input/keyboard/gpio_keys.c
@@ -247,7 +247,7 @@ static ssize_t gpio_keys_attr_store_helper(struct gpio_keys_drvdata *ddata,
 	ssize_t error;
 	int i;
 
-	bits = bitmap_zalloc(n_events, GFP_KERNEL);
+	bits = bitmap_alloc(n_events, GFP_KERNEL);
 	if (!bits)
 		return -ENOMEM;
 
-- 
2.32.0

