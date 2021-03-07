Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0E3FF3304F8
	for <lists+linux-input@lfdr.de>; Sun,  7 Mar 2021 23:24:00 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231265AbhCGWX0 (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Sun, 7 Mar 2021 17:23:26 -0500
Received: from aposti.net ([89.234.176.197]:34036 "EHLO aposti.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231388AbhCGWWv (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Sun, 7 Mar 2021 17:22:51 -0500
From:   Paul Cercueil <paul@crapouillou.net>
To:     Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc:     od@zcrc.me, linux-input@vger.kernel.org,
        linux-kernel@vger.kernel.org, Paul Cercueil <paul@crapouillou.net>
Subject: [PATCH v3 1/3] input: gpio-keys: Remove extra call to input_sync
Date:   Sun,  7 Mar 2021 22:22:38 +0000
Message-Id: <20210307222240.380583-1-paul@crapouillou.net>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

The input_sync() function is already called after the loop in
gpio_keys_report_state(), so it does not need to be called after each
iteration within gpio_keys_gpio_report_event().

Signed-off-by: Paul Cercueil <paul@crapouillou.net>
---

Notes:
    v2: Keep the input_sync() within gpio_keys_report_state() so that it's
        not called at every iteration of the loop.
    
    v3: No change

 drivers/input/keyboard/gpio_keys.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/input/keyboard/gpio_keys.c b/drivers/input/keyboard/gpio_keys.c
index 77bac4ddf324..7fcb2c35c5cc 100644
--- a/drivers/input/keyboard/gpio_keys.c
+++ b/drivers/input/keyboard/gpio_keys.c
@@ -373,7 +373,6 @@ static void gpio_keys_gpio_report_event(struct gpio_button_data *bdata)
 	} else {
 		input_event(input, type, *bdata->code, state);
 	}
-	input_sync(input);
 }
 
 static void gpio_keys_gpio_work_func(struct work_struct *work)
@@ -382,6 +381,7 @@ static void gpio_keys_gpio_work_func(struct work_struct *work)
 		container_of(work, struct gpio_button_data, work.work);
 
 	gpio_keys_gpio_report_event(bdata);
+	input_sync(bdata->input);
 
 	if (bdata->button->wakeup)
 		pm_relax(bdata->input->dev.parent);
-- 
2.30.1

