Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DC1062B8C41
	for <lists+linux-input@lfdr.de>; Thu, 19 Nov 2020 08:26:56 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725937AbgKSHYo (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 19 Nov 2020 02:24:44 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54726 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725648AbgKSHYn (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Thu, 19 Nov 2020 02:24:43 -0500
Received: from mail-pf1-x42c.google.com (mail-pf1-x42c.google.com [IPv6:2607:f8b0:4864:20::42c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AFB37C0613CF;
        Wed, 18 Nov 2020 23:24:43 -0800 (PST)
Received: by mail-pf1-x42c.google.com with SMTP id w14so3604113pfd.7;
        Wed, 18 Nov 2020 23:24:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:mime-version:content-disposition;
        bh=/eBdrO7bYyRYe7szj2qIYVBbFCCjGwpHth1+5TUwWBE=;
        b=XYl2b9RamSgaiq3XTVG/eWk4XF7pG1BS5TkNE6SliYsRUxXqKDw36BNw+96f+m2Q+Q
         OwnWP6W5622UeJ2OUZjx/LCa83Kj9ng+tgLYZle2HveyY+dOjAe2eIsZM0aEgj/gmL//
         yzu35FWeKG9JrdgPwtRKTmI27F4qdwftlrUzoGCA1YbLIhMrFj2Umt+jEsMIf0x4Hqvb
         J8nZsUVA28grdbOQZk3vaOV/kfoEsptbZ+2mjvGhbt590lm5xc7UeXtvy9StfXY0ZzfD
         qeYlDkiqarkuTBpnsGCOqNadixMjbRW9XeTRcYaQq7TEc7uHXQhQp0h4Fc4onv+Vc2kZ
         YXVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:mime-version
         :content-disposition;
        bh=/eBdrO7bYyRYe7szj2qIYVBbFCCjGwpHth1+5TUwWBE=;
        b=K7uhYhGapd9Oj/ocogKkJeSQqnnQleHn5esO24OovhCldOIp+YxCNUsPQyV+xtp0E8
         Us2KTe43OqWKbOtwtutYmMeTYrckiaRzwMhd/DrvN88TA+vdFNEBmNQgc8RdyK/05Z8Y
         l/K8w+VO8VHi2MwrfWacKCRPfiQM0phfzXQlI93pLc6RyJhGtfbQOy4UURykM41w54rU
         YeTAZ601Kiv0qhK15s91BJW/JoX5f9cwtMaecbRXcxEvP1XRT7u4SAEgwtPkr5+BlFRM
         d9SiTYrUDJXSnUkwYX0rChM0fD/9uvxT2MCaRf2jChUxD0EX+DjlCbRwWnuEae5FFn65
         22lg==
X-Gm-Message-State: AOAM532t/QK1ZUhI16gA8im4zl9OsScFVaoDUF0VBaR3WbQHuN6q0QST
        IN5ITSk/Ipaa1T0inRF9KS3yQhnoKkA=
X-Google-Smtp-Source: ABdhPJxMz0vYNC6uXSQ9jkXhnsrMDEteJnydMeLK/smydZH7itMLiHqSaUOFOmeZp2uSEgZ7KLzIdg==
X-Received: by 2002:a17:90a:5309:: with SMTP id x9mr3005234pjh.98.1605770683033;
        Wed, 18 Nov 2020 23:24:43 -0800 (PST)
Received: from dtor-ws ([2620:15c:202:201:a6ae:11ff:fe11:fcc3])
        by smtp.gmail.com with ESMTPSA id t12sm28067731pfq.79.2020.11.18.23.24.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Nov 2020 23:24:42 -0800 (PST)
Date:   Wed, 18 Nov 2020 23:24:40 -0800
From:   Dmitry Torokhov <dmitry.torokhov@gmail.com>
To:     linux-input@vger.kernel.org
Cc:     Alexandru Ardelean <alexandru.ardelean@analog.com>,
        linux-kernel@vger.kernel.org
Subject: [PATCH] Input: adp5589-keys - use BIT()
Message-ID: <20201119072440.GA116840@dtor-ws>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Let's use BIT() macro instead of explicitly shifting '1'.

Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
---
 drivers/input/keyboard/adp5589-keys.c | 69 ++++++++++++++-------------
 1 file changed, 35 insertions(+), 34 deletions(-)

diff --git a/drivers/input/keyboard/adp5589-keys.c b/drivers/input/keyboard/adp5589-keys.c
index a9b69a268c09..70c8d1c298ee 100644
--- a/drivers/input/keyboard/adp5589-keys.c
+++ b/drivers/input/keyboard/adp5589-keys.c
@@ -7,6 +7,7 @@
  * Copyright (C) 2010-2011 Analog Devices Inc.
  */
 
+#include <linux/bitops.h>
 #include <linux/module.h>
 #include <linux/interrupt.h>
 #include <linux/irq.h>
@@ -153,48 +154,48 @@
 #define ADP5589_5_MAN_ID		0x02
 
 /* GENERAL_CFG Register */
-#define OSC_EN		(1 << 7)
+#define OSC_EN		BIT(7)
 #define CORE_CLK(x)	(((x) & 0x3) << 5)
-#define LCK_TRK_LOGIC	(1 << 4)	/* ADP5589 only */
-#define LCK_TRK_GPI	(1 << 3)	/* ADP5589 only */
-#define INT_CFG		(1 << 1)
-#define RST_CFG		(1 << 0)
+#define LCK_TRK_LOGIC	BIT(4)		/* ADP5589 only */
+#define LCK_TRK_GPI	BIT(3)		/* ADP5589 only */
+#define INT_CFG		BIT(1)
+#define RST_CFG		BIT(0)
 
 /* INT_EN Register */
-#define LOGIC2_IEN	(1 << 5)	/* ADP5589 only */
-#define LOGIC1_IEN	(1 << 4)
-#define LOCK_IEN	(1 << 3)	/* ADP5589 only */
-#define OVRFLOW_IEN	(1 << 2)
-#define GPI_IEN		(1 << 1)
-#define EVENT_IEN	(1 << 0)
+#define LOGIC2_IEN	BIT(5)		/* ADP5589 only */
+#define LOGIC1_IEN	BIT(4)
+#define LOCK_IEN	BIT(3)		/* ADP5589 only */
+#define OVRFLOW_IEN	BIT(2)
+#define GPI_IEN		BIT(1)
+#define EVENT_IEN	BIT(0)
 
 /* Interrupt Status Register */
-#define LOGIC2_INT	(1 << 5)	/* ADP5589 only */
-#define LOGIC1_INT	(1 << 4)
-#define LOCK_INT	(1 << 3)	/* ADP5589 only */
-#define OVRFLOW_INT	(1 << 2)
-#define GPI_INT		(1 << 1)
-#define EVENT_INT	(1 << 0)
+#define LOGIC2_INT	BIT(5)		/* ADP5589 only */
+#define LOGIC1_INT	BIT(4)
+#define LOCK_INT	BIT(3)		/* ADP5589 only */
+#define OVRFLOW_INT	BIT(2)
+#define GPI_INT		BIT(1)
+#define EVENT_INT	BIT(0)
 
 /* STATUS Register */
-#define LOGIC2_STAT	(1 << 7)	/* ADP5589 only */
-#define LOGIC1_STAT	(1 << 6)
-#define LOCK_STAT	(1 << 5)	/* ADP5589 only */
+#define LOGIC2_STAT	BIT(7)		/* ADP5589 only */
+#define LOGIC1_STAT	BIT(6)
+#define LOCK_STAT	BIT(5)		/* ADP5589 only */
 #define KEC		0x1F
 
 /* PIN_CONFIG_D Register */
-#define C4_EXTEND_CFG	(1 << 6)	/* RESET2 */
-#define R4_EXTEND_CFG	(1 << 5)	/* RESET1 */
+#define C4_EXTEND_CFG	BIT(6)		/* RESET2 */
+#define R4_EXTEND_CFG	BIT(5)		/* RESET1 */
 
 /* LOCK_CFG */
-#define LOCK_EN		(1 << 0)
+#define LOCK_EN		BIT(0)
 
 #define PTIME_MASK	0x3
 #define LTIME_MASK	0x3		/* ADP5589 only */
 
 /* Key Event Register xy */
-#define KEY_EV_PRESSED		(1 << 7)
-#define KEY_EV_MASK		(0x7F)
+#define KEY_EV_PRESSED	BIT(7)
+#define KEY_EV_MASK	0x7F
 
 #define KEYP_MAX_EVENT		16
 #define ADP5589_MAXGPIO		19
@@ -472,7 +473,7 @@ static int adp5589_build_gpiomap(struct adp5589_kpad *kpad,
 	memset(pin_used, false, sizeof(pin_used));
 
 	for (i = 0; i < kpad->var->maxgpio; i++)
-		if (pdata->keypad_en_mask & (1 << i))
+		if (pdata->keypad_en_mask & BIT(i))
 			pin_used[i] = true;
 
 	for (i = 0; i < kpad->gpimapsize; i++)
@@ -651,13 +652,13 @@ static int adp5589_setup(struct adp5589_kpad *kpad)
 		unsigned short pin = pdata->gpimap[i].pin;
 
 		if (pin <= kpad->var->gpi_pin_row_end) {
-			evt_mode1 |= (1 << (pin - kpad->var->gpi_pin_row_base));
+			evt_mode1 |= BIT(pin - kpad->var->gpi_pin_row_base);
 		} else {
 			evt_mode2 |=
-			    ((1 << (pin - kpad->var->gpi_pin_col_base)) & 0xFF);
+			    BIT(pin - kpad->var->gpi_pin_col_base) & 0xFF;
 			if (!kpad->is_adp5585)
-				evt_mode3 |= ((1 << (pin -
-					kpad->var->gpi_pin_col_base)) >> 8);
+				evt_mode3 |=
+				    BIT(pin - kpad->var->gpi_pin_col_base) >> 8;
 		}
 	}
 
@@ -677,7 +678,7 @@ static int adp5589_setup(struct adp5589_kpad *kpad)
 		dev_warn(&client->dev, "Conflicting pull resistor config\n");
 
 	for (i = 0; i <= kpad->var->max_row_num; i++) {
-		unsigned val = 0, bit = (1 << i);
+		unsigned val = 0, bit = BIT(i);
 		if (pdata->pullup_en_300k & bit)
 			val = 0;
 		else if (pdata->pulldown_en_300k & bit)
@@ -697,7 +698,7 @@ static int adp5589_setup(struct adp5589_kpad *kpad)
 	}
 
 	for (i = 0; i <= kpad->var->max_col_num; i++) {
-		unsigned val = 0, bit = 1 << (i + kpad->var->col_shift);
+		unsigned val = 0, bit = BIT(i + kpad->var->col_shift);
 		if (pdata->pullup_en_300k & bit)
 			val = 0;
 		else if (pdata->pulldown_en_300k & bit)
@@ -813,7 +814,7 @@ static void adp5589_report_switch_state(struct adp5589_kpad *kpad)
 
 		input_report_switch(kpad->input,
 				    kpad->gpimap[i].sw_evt,
-				    !(gpi_stat_tmp & (1 << pin_loc)));
+				    !(gpi_stat_tmp & BIT(pin_loc)));
 	}
 
 	input_sync(kpad->input);
@@ -859,7 +860,7 @@ static int adp5589_keypad_add(struct adp5589_kpad *kpad, unsigned int revid)
 			return -EINVAL;
 		}
 
-		if ((1 << (pin - kpad->var->gpi_pin_row_base)) &
+		if (BIT(pin - kpad->var->gpi_pin_row_base) &
 				pdata->keypad_en_mask) {
 			dev_err(&client->dev, "invalid gpi row/col data\n");
 			return -EINVAL;
-- 
2.29.2.299.gdc1121823c-goog


-- 
Dmitry
