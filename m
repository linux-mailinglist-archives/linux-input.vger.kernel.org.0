Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 761034591B8
	for <lists+linux-input@lfdr.de>; Mon, 22 Nov 2021 16:54:11 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240090AbhKVP5P (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 22 Nov 2021 10:57:15 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37086 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240085AbhKVP5O (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Mon, 22 Nov 2021 10:57:14 -0500
Received: from baptiste.telenet-ops.be (baptiste.telenet-ops.be [IPv6:2a02:1800:120:4::f00:13])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 27245C061574
        for <linux-input@vger.kernel.org>; Mon, 22 Nov 2021 07:54:08 -0800 (PST)
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed20:e4da:38c:79e9:48bf])
        by baptiste.telenet-ops.be with bizsmtp
        id MTu72600g4yPVd601Tu7vy; Mon, 22 Nov 2021 16:54:07 +0100
Received: from rox.of.borg ([192.168.97.57])
        by ramsan.of.borg with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
        (Exim 4.93)
        (envelope-from <geert@linux-m68k.org>)
        id 1mpBdv-00EL2W-GZ; Mon, 22 Nov 2021 16:54:07 +0100
Received: from geert by rox.of.borg with local (Exim 4.93)
        (envelope-from <geert@linux-m68k.org>)
        id 1mpBdu-00HGrL-Rq; Mon, 22 Nov 2021 16:54:06 +0100
From:   Geert Uytterhoeven <geert+renesas@glider.be>
To:     Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc:     linux-input@vger.kernel.org, linux-kernel@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH] Input: palmas-pwrbutton - use bitfield helpers
Date:   Mon, 22 Nov 2021 16:54:06 +0100
Message-Id: <f8831b88346b36fc6e01e0910d0db6c94287d2b4.1637593297.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <a1445d3abb45cfc95cb1b03180fd53caf122035b.1637593297.git.geert+renesas@glider.be>
References: <a1445d3abb45cfc95cb1b03180fd53caf122035b.1637593297.git.geert+renesas@glider.be>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Use the FIELD_PREP() helper, instead of open-coding the same operation.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
Compile-tested only.

See "[PATCH 00/17] Non-const bitfield helper conversions"
(https://lore.kernel.org/r/cover.1637592133.git.geert+renesas@glider.be)
for background and more conversions.
---
 drivers/input/misc/palmas-pwrbutton.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/input/misc/palmas-pwrbutton.c b/drivers/input/misc/palmas-pwrbutton.c
index f9b05cf09ff53a7e..1e71336f5cf9271a 100644
--- a/drivers/input/misc/palmas-pwrbutton.c
+++ b/drivers/input/misc/palmas-pwrbutton.c
@@ -15,6 +15,7 @@
  * GNU General Public License for more details.
  */
 
+#include <linux/bitfield.h>
 #include <linux/init.h>
 #include <linux/input.h>
 #include <linux/interrupt.h>
@@ -192,8 +193,8 @@ static int palmas_pwron_probe(struct platform_device *pdev)
 	 * Setup default hardware shutdown option (long key press)
 	 * and debounce.
 	 */
-	val = config.long_press_time_val << __ffs(PALMAS_LPK_TIME_MASK);
-	val |= config.pwron_debounce_val << __ffs(PALMAS_PWRON_DEBOUNCE_MASK);
+	val = FIELD_PREP(PALMAS_LPK_TIME_MASK, config.long_press_time_val) |
+	      FIELD_PREP(PALMAS_PWRON_DEBOUNCE_MASK, config.pwron_debounce_val);
 	error = palmas_update_bits(palmas, PALMAS_PMU_CONTROL_BASE,
 				   PALMAS_LONG_PRESS_KEY,
 				   PALMAS_LPK_TIME_MASK |
-- 
2.25.1

