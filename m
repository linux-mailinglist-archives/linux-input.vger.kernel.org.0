Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 15AB01A5DE6
	for <lists+linux-input@lfdr.de>; Sun, 12 Apr 2020 11:57:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726614AbgDLJ5P (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Sun, 12 Apr 2020 05:57:15 -0400
Received: from smtp02.smtpout.orange.fr ([80.12.242.124]:50451 "EHLO
        smtp.smtpout.orange.fr" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725909AbgDLJ5P (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Sun, 12 Apr 2020 05:57:15 -0400
Received: from localhost.localdomain ([90.126.162.40])
        by mwinf5d55 with ME
        id RlxC2200C0scBcy03lxC7H; Sun, 12 Apr 2020 11:57:13 +0200
X-ME-Helo: localhost.localdomain
X-ME-Auth: Y2hyaXN0b3BoZS5qYWlsbGV0QHdhbmFkb28uZnI=
X-ME-Date: Sun, 12 Apr 2020 11:57:13 +0200
X-ME-IP: 90.126.162.40
From:   Christophe JAILLET <christophe.jaillet@wanadoo.fr>
To:     dmitry.torokhov@gmail.com, tglx@linutronix.de
Cc:     linux-input@vger.kernel.org, linux-kernel@vger.kernel.org,
        kernel-janitors@vger.kernel.org,
        Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Subject: [PATCH] Input: Fix a typo in a module name in Kconfig
Date:   Sun, 12 Apr 2020 11:57:11 +0200
Message-Id: <20200412095711.9107-1-christophe.jaillet@wanadoo.fr>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

A 'y' is missing in spear-keyboard.

Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
---
 drivers/input/keyboard/Kconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/input/keyboard/Kconfig b/drivers/input/keyboard/Kconfig
index 28de965a08d5..793ecbbda32c 100644
--- a/drivers/input/keyboard/Kconfig
+++ b/drivers/input/keyboard/Kconfig
@@ -701,7 +701,7 @@ config KEYBOARD_SPEAR
 	  Say Y here if you want to use the SPEAR keyboard.
 
 	  To compile this driver as a module, choose M here: the
-	  module will be called spear-keboard.
+	  module will be called spear-keyboard.
 
 config KEYBOARD_TC3589X
 	tristate "TC3589X Keypad support"
-- 
2.20.1

