Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 83402416CBA
	for <lists+linux-input@lfdr.de>; Fri, 24 Sep 2021 09:18:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S244379AbhIXHTj (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Fri, 24 Sep 2021 03:19:39 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51310 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S244374AbhIXHTi (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Fri, 24 Sep 2021 03:19:38 -0400
Received: from andre.telenet-ops.be (andre.telenet-ops.be [IPv6:2a02:1800:120:4::f00:15])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 19513C061757
        for <linux-input@vger.kernel.org>; Fri, 24 Sep 2021 00:18:05 -0700 (PDT)
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed10:5dd8:9bc4:3752:5710])
        by andre.telenet-ops.be with bizsmtp
        id xjJ42500L2gynNa01jJ468; Fri, 24 Sep 2021 09:18:04 +0200
Received: from rox.of.borg ([192.168.97.57])
        by ramsan.of.borg with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
        (Exim 4.93)
        (envelope-from <geert@linux-m68k.org>)
        id 1mTfTA-008Vhv-5e; Fri, 24 Sep 2021 09:18:04 +0200
Received: from geert by rox.of.borg with local (Exim 4.93)
        (envelope-from <geert@linux-m68k.org>)
        id 1mTfT9-007LXe-M2; Fri, 24 Sep 2021 09:18:03 +0200
From:   Geert Uytterhoeven <geert+renesas@glider.be>
To:     Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc:     linux-input@vger.kernel.org, linux-kernel@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH] Input: gpio-keys - print button label in IRQ button error messages
Date:   Fri, 24 Sep 2021 09:18:02 +0200
Message-Id: <f1728883a5bf4481eb1d45e7b7a71005e29e259a.1632467859.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

When an error message related to IRQ buttons is printed, no clue is
given about the actual button that caused the failure.  Fix this by
including the button label, to make it more obvious which button has an
incomplete or incorrect hardware description.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
 drivers/input/keyboard/gpio_keys.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/input/keyboard/gpio_keys.c b/drivers/input/keyboard/gpio_keys.c
index 0f2250c6aa4978d5..fc706918d7b103cb 100644
--- a/drivers/input/keyboard/gpio_keys.c
+++ b/drivers/input/keyboard/gpio_keys.c
@@ -617,14 +617,16 @@ static int gpio_keys_setup_key(struct platform_device *pdev,
 		}
 	} else {
 		if (!button->irq) {
-			dev_err(dev, "Found button without gpio or irq\n");
+			dev_err(dev, "Found button %s without gpio or irq\n",
+				desc);
 			return -EINVAL;
 		}
 
 		bdata->irq = button->irq;
 
 		if (button->type && button->type != EV_KEY) {
-			dev_err(dev, "Only EV_KEY allowed for IRQ buttons.\n");
+			dev_err(dev, "Only EV_KEY allowed for IRQ button %s\n",
+				desc);
 			return -EINVAL;
 		}
 
-- 
2.25.1

