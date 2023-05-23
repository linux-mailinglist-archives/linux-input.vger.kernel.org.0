Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9046670E020
	for <lists+linux-input@lfdr.de>; Tue, 23 May 2023 17:15:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233373AbjEWPOq (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 23 May 2023 11:14:46 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54734 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237478AbjEWPOT (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Tue, 23 May 2023 11:14:19 -0400
Received: from andre.telenet-ops.be (andre.telenet-ops.be [IPv6:2a02:1800:120:4::f00:15])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9151D188
        for <linux-input@vger.kernel.org>; Tue, 23 May 2023 08:13:59 -0700 (PDT)
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed30:b0ac:7afd:272:4cff])
        by andre.telenet-ops.be with bizsmtp
        id 0FDx2A0020Jkz7G01FDxrP; Tue, 23 May 2023 17:13:57 +0200
Received: from rox.of.borg ([192.168.97.57])
        by ramsan.of.borg with esmtp (Exim 4.95)
        (envelope-from <geert@linux-m68k.org>)
        id 1q1Thm-002swf-JF;
        Tue, 23 May 2023 17:13:57 +0200
Received: from geert by rox.of.borg with local (Exim 4.95)
        (envelope-from <geert@linux-m68k.org>)
        id 1q1Ti1-00CkQr-0X;
        Tue, 23 May 2023 17:13:57 +0200
From:   Geert Uytterhoeven <geert+renesas@glider.be>
To:     Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc:     linux-input@vger.kernel.org, linux-kernel@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH] [resend] Input: gpio-keys - Use input_report_key()
Date:   Tue, 23 May 2023 17:13:55 +0200
Message-Id: <185f3320e39000159d4bd843fd3119b94c30d607.1684854795.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.4 required=5.0 tests=BAYES_00,
        HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_LOW,SPF_HELO_NONE,SPF_NONE,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Use the input_report_key() helper instead of open-coding the same
operation.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
 drivers/input/keyboard/gpio_keys.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/input/keyboard/gpio_keys.c b/drivers/input/keyboard/gpio_keys.c
index 5e18ef01b0340f1b..7e8342ef7a79b17f 100644
--- a/drivers/input/keyboard/gpio_keys.c
+++ b/drivers/input/keyboard/gpio_keys.c
@@ -456,7 +456,7 @@ static enum hrtimer_restart gpio_keys_irq_timer(struct hrtimer *t)
 	struct input_dev *input = bdata->input;
 
 	if (bdata->key_pressed) {
-		input_event(input, EV_KEY, *bdata->code, 0);
+		input_report_key(input, *bdata->code, 0);
 		input_sync(input);
 		bdata->key_pressed = false;
 	}
@@ -478,11 +478,11 @@ static irqreturn_t gpio_keys_irq_isr(int irq, void *dev_id)
 		if (bdata->button->wakeup)
 			pm_wakeup_event(bdata->input->dev.parent, 0);
 
-		input_event(input, EV_KEY, *bdata->code, 1);
+		input_report_key(input, *bdata->code, 1);
 		input_sync(input);
 
 		if (!bdata->release_delay) {
-			input_event(input, EV_KEY, *bdata->code, 0);
+			input_report_key(input, *bdata->code, 0);
 			input_sync(input);
 			goto out;
 		}
-- 
2.34.1

