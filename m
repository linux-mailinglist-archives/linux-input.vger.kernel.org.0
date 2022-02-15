Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A1F064B5EE9
	for <lists+linux-input@lfdr.de>; Tue, 15 Feb 2022 01:15:03 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230355AbiBOAPK (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 14 Feb 2022 19:15:10 -0500
Received: from mxb-00190b01.gslb.pphosted.com ([23.128.96.19]:42652 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229729AbiBOAPI (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Mon, 14 Feb 2022 19:15:08 -0500
Received: from mail-lf1-x129.google.com (mail-lf1-x129.google.com [IPv6:2a00:1450:4864:20::129])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C36F8106CBE
        for <linux-input@vger.kernel.org>; Mon, 14 Feb 2022 16:14:58 -0800 (PST)
Received: by mail-lf1-x129.google.com with SMTP id bu29so28538437lfb.0
        for <linux-input@vger.kernel.org>; Mon, 14 Feb 2022 16:14:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=Sm+NkAnvjTJ+GyQim2QJKbpM+LFfFX/sUR0ExkT5qyg=;
        b=MurDkgQQ78VcK2NGrN/es2Bki1JQoez8mKMrrhmG0ZN9tArRIAmL/G9SuUZV0/SRJe
         n0LBXdDjYsfEu7HS13N0KRgERSb51EzkU9MhuWo/+HfNU+WygGQgxKQfFTK67ERaXJJU
         ekIgpN+VUt3wrgR/W/xhPFxgHkyRaAkKI/LYIli5HaYtI40dXYkOSRP/tDtBCXkmF8z4
         OMnMIjZYbVbIp4hmXxVT7TuLiVeR9hZafqvsV07gGcSVkMYbnSXvPZWcVEjkSkktHC/k
         3J8uJHJDUa3itLCsLd0rWXf66RGUP+LNWLjp4Ngkwqp++E2WXsMGPbFS9tt7IeKFb8TG
         qfvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=Sm+NkAnvjTJ+GyQim2QJKbpM+LFfFX/sUR0ExkT5qyg=;
        b=k6lKso//RWjKoUD8EIOPOGFIPz6qa1R2+Zt80qht/r8A11Strb5Ecm+dFbp+3anOJZ
         AFXO/yBOZRJCiIqTa2T0LCwi6dvl9TFmrxJjYK7xSB1gGgdBVTCzU0vxQsOK5RtTNuYL
         ZSePoHYp4bFhm5J/sHAeN/jqSWiajzPpmIBgcxNmmhB6wybLBw07YMzszn+Q09NnWYtu
         1RcJeXwqnEmC4wVUVdda3buUoJC1wVDELcydydQgo6NCsOOzSvaWUhGRY5tj2IxeNN1R
         Tq1vbkHin9e4ylentdmaQUA8Sd+N2acuB5AiUYosZtL49vfZbi6LV7jhZrW3Aj9eZ02G
         iWbQ==
X-Gm-Message-State: AOAM532wn2EBVhZ7dK8dlyWxgxPktCFz+bRTFZwt60bZAlEVq2PdrLCT
        t7aPSYXyyaD/P2aAijPtVaweiA==
X-Google-Smtp-Source: ABdhPJyQszEWnrgiOtVNFbPF2HffveVMy3yaPdFiUqNnpLlHJHk7gxLZUoAhdO9gJpeiT40gVg86Hg==
X-Received: by 2002:a05:6512:15a2:: with SMTP id bp34mr725369lfb.75.1644884097086;
        Mon, 14 Feb 2022 16:14:57 -0800 (PST)
Received: from localhost.localdomain (c-fdcc225c.014-348-6c756e10.bbcust.telenor.se. [92.34.204.253])
        by smtp.gmail.com with ESMTPSA id o12sm625394lfo.69.2022.02.14.16.14.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Feb 2022 16:14:56 -0800 (PST)
From:   Linus Walleij <linus.walleij@linaro.org>
To:     Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        linux-input@vger.kernel.org
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Michael Srba <Michael.Srba@seznam.cz>,
        Nikita Travkin <nikita@trvn.ru>
Subject: [PATCH] Input: zinitix - Do not report shadow fingers
Date:   Tue, 15 Feb 2022 01:12:53 +0100
Message-Id: <20220215001253.1109876-1-linus.walleij@linaro.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

I observed the following problem with the BT404 touch pad
running the Phosh UI:

When e.g. typing on the virtual keyboard pressing "g" would
produce "ggg".

After some analysis it turns out the firmware reports that three
fingers hit that coordinate at the same time, finger 0, 2 and
4 (of the five available 0,1,2,3,4).

DOWN
  Zinitix-TS 3-0020: finger 0 down (246, 395)
  Zinitix-TS 3-0020: finger 1 up (0, 0)
  Zinitix-TS 3-0020: finger 2 down (246, 395)
  Zinitix-TS 3-0020: finger 3 up (0, 0)
  Zinitix-TS 3-0020: finger 4 down (246, 395)
UP
  Zinitix-TS 3-0020: finger 0 up (246, 395)
  Zinitix-TS 3-0020: finger 2 up (246, 395)
  Zinitix-TS 3-0020: finger 4 up (246, 395)

This is one touch and release: i.e. this is all reported on
touch (down) and release.

After augmenting the driver to remember all fingers we report in
a single touch event and filter out any duplicates we get this
debug print:

DOWN
  Zinitix-TS 3-0020: finger 0 down (257, 664)
  Zinitix-TS 3-0020: finger 1 up (0, 0)
  Zinitix-TS 3-0020: ignore shadow finger 2 at (257, 664)
  Zinitix-TS 3-0020: ignore shadow finger 3 at (0, 0)
  Zinitix-TS 3-0020: ignore shadow finger 4 at (257, 664)
UP
  Zinitix-TS 3-0020: finger 0 up (257, 664)
  Zinitix-TS 3-0020: ignore shadow finger 2 at (257, 664)
  Zinitix-TS 3-0020: ignore shadow finger 4 at (257, 664)

As it is physically impossible to place two fingers at the same
point at the screen this seems safe to do.

The "finger 1 up (0, 0)" type messages of releaseing ghost
fingers does not go away, and even though this is mostly
incorrect too, we cannot rule out some finger being released
at (0, 0) in the generic case, so it needs to stay.

Notice that the ghostly release of fingers 1 and 3 only
happens on finger down events, not on finger up.

This appears to me as the best we can do. After this my
screen is nicely interactive.

Cc: Michael Srba <Michael.Srba@seznam.cz>
Cc: Nikita Travkin <nikita@trvn.ru>
Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
 drivers/input/touchscreen/zinitix.c | 78 ++++++++++++++++++++++++-----
 1 file changed, 66 insertions(+), 12 deletions(-)

diff --git a/drivers/input/touchscreen/zinitix.c b/drivers/input/touchscreen/zinitix.c
index 129ebc810de8..7655a09b65bc 100644
--- a/drivers/input/touchscreen/zinitix.c
+++ b/drivers/input/touchscreen/zinitix.c
@@ -319,14 +319,72 @@ static int zinitix_send_power_on_sequence(struct bt541_ts_data *bt541)
 	return 0;
 }
 
-static void zinitix_report_finger(struct bt541_ts_data *bt541, int slot,
-				  const struct point_coord *p)
+static void zinitix_report_fingers(struct bt541_ts_data *bt541, struct touch_event *te)
 {
-	input_mt_slot(bt541->input_dev, slot);
-	input_mt_report_slot_state(bt541->input_dev, MT_TOOL_FINGER, true);
-	touchscreen_report_pos(bt541->input_dev, &bt541->prop,
-			       le16_to_cpu(p->x), le16_to_cpu(p->y), true);
-	input_report_abs(bt541->input_dev, ABS_MT_TOUCH_MAJOR, p->width);
+	struct point_coord *p;
+	u16 reported_x[MAX_SUPPORTED_FINGER_NUM];
+	u16 reported_y[MAX_SUPPORTED_FINGER_NUM];
+	u16 x, y;
+	int i, j;
+	int ridx = 0;
+	bool ignore;
+
+	for (i = 0; i < MAX_SUPPORTED_FINGER_NUM; i++) {
+		p = &te->point_coord[i];
+
+		/* Skip nonexisting fingers */
+		if (!p->sub_status & SUB_BIT_EXIST)
+			continue;
+
+		x = le16_to_cpu(p->x);
+		y = le16_to_cpu(p->y);
+
+		/*
+		 * Check if this has already been reported and is just a shadow
+		 * finger
+		 */
+		ignore = false;
+		for (j = 0; j < ridx; j++) {
+			if (x == reported_x[j] && y == reported_y[j]) {
+				ignore = true;
+				break;
+			}
+		}
+
+		if (ignore) {
+			dev_dbg(&bt541->client->dev,
+				"ignore shadow finger %d at (%u, %u)\n", i, x, y);
+			continue;
+		}
+
+		input_mt_slot(bt541->input_dev, i);
+
+		if (p->sub_status & BIT_DOWN) {
+			/* Finger down */
+			input_mt_report_slot_state(bt541->input_dev, MT_TOOL_FINGER, true);
+			touchscreen_report_pos(bt541->input_dev, &bt541->prop, x, y, true);
+			input_report_abs(bt541->input_dev, ABS_MT_TOUCH_MAJOR, p->width);
+			dev_dbg(&bt541->client->dev, "finger %d down (%u, %u)\n", i, x, y);
+		} else if (p->sub_status & BIT_UP) {
+			/* Release finger */
+			input_mt_report_slot_state(bt541->input_dev, MT_TOOL_FINGER, false);
+			touchscreen_report_pos(bt541->input_dev, &bt541->prop, x, y, true);
+			input_report_abs(bt541->input_dev, ABS_MT_TOUCH_MAJOR, 0);
+			dev_dbg(&bt541->client->dev, "finger %d up (%u, %u)\n", i, x, y);
+		} else if (p->sub_status & BIT_MOVE) {
+			/* Finger moves while pressed down */
+			input_mt_report_slot_state(bt541->input_dev, MT_TOOL_FINGER, true);
+			touchscreen_report_pos(bt541->input_dev, &bt541->prop, x, y, true);
+			input_report_abs(bt541->input_dev, ABS_MT_TOUCH_MAJOR, p->width);
+			dev_dbg(&bt541->client->dev, "finger %d move (%u, %u)\n", i, x, y);
+		} else {
+			dev_dbg(&bt541->client->dev, "unknown finger event\n");
+		}
+
+		reported_x[ridx] = x;
+		reported_y[ridx] = y;
+		ridx++;
+	}
 }
 
 static irqreturn_t zinitix_ts_irq_handler(int irq, void *bt541_handler)
@@ -335,7 +393,6 @@ static irqreturn_t zinitix_ts_irq_handler(int irq, void *bt541_handler)
 	struct i2c_client *client = bt541->client;
 	struct touch_event touch_event;
 	int error;
-	int i;
 
 	memset(&touch_event, 0, sizeof(struct touch_event));
 
@@ -346,10 +403,7 @@ static irqreturn_t zinitix_ts_irq_handler(int irq, void *bt541_handler)
 		goto out;
 	}
 
-	for (i = 0; i < MAX_SUPPORTED_FINGER_NUM; i++)
-		if (touch_event.point_coord[i].sub_status & SUB_BIT_EXIST)
-			zinitix_report_finger(bt541, i,
-					      &touch_event.point_coord[i]);
+	zinitix_report_fingers(bt541, &touch_event);
 
 	input_mt_sync_frame(bt541->input_dev);
 	input_sync(bt541->input_dev);
-- 
2.34.1

