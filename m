Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id EEC404B6A26
	for <lists+linux-input@lfdr.de>; Tue, 15 Feb 2022 12:02:48 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229729AbiBOLCz (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 15 Feb 2022 06:02:55 -0500
Received: from mxb-00190b01.gslb.pphosted.com ([23.128.96.19]:45618 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233453AbiBOLCz (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Tue, 15 Feb 2022 06:02:55 -0500
Received: from mail-lf1-x133.google.com (mail-lf1-x133.google.com [IPv6:2a00:1450:4864:20::133])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3587C10780A
        for <linux-input@vger.kernel.org>; Tue, 15 Feb 2022 03:02:45 -0800 (PST)
Received: by mail-lf1-x133.google.com with SMTP id o2so36138602lfd.1
        for <linux-input@vger.kernel.org>; Tue, 15 Feb 2022 03:02:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=JDWjiPtt7skY7B98WPQRJVVo9ZvVMkXGhmUjt/tjKn4=;
        b=LlzEw7hX4iP171lkTy4WRc0XFeDxhJC34Z0ylPC2923Z6dZBrgE9Y9J3RsjWOugSBr
         dlA8PVOaXV4EqIzlHCt1YrYZpEdW0jS4PxnJczSfC+K2c67VNPQVLsSej2cQaXo5ujLM
         DA34XqODUhpJe4FTt965r7p2u4uDTy+EBvp2JgjXRTgo7KtnF3YtvuH0um1wAy0qKQfE
         5lC0OQRNfjaza2M7e9Am9yTK8L76iDILRcfBbwvQTbbFvUPXGykM/XZEmwRNZgzTEV/K
         STVmzKZacj1oW/Nku/tk9rK5y1ASO06rI47CwTDquDrvgBNtZp+a2JlJkB5pGl1zzxy3
         b5nQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=JDWjiPtt7skY7B98WPQRJVVo9ZvVMkXGhmUjt/tjKn4=;
        b=tXQIEs6cPYVUS1f1O3SWIS1sGa0BGdA8jE7Mufgpr1ovkaCXMLfqqVlph+lvH2bcIV
         c2LKY2LT2Gz1ky0ghsMRvaKoxOFNu9XYqe22zDizisWKfHkBSdU7IZL6g+CFCtu+jzUe
         NNL12lRByLhgBK7fHjcVtEbNX8ekok63KnpsdWZJ0PAShwfv73zEUO5Gv3aWn6c110PF
         SQRY+0aOmmmpHWFe1kZp11vGeAsEUhRkQYR3SwwH8jdn2CtUhJzlOad8ktVWmai9sILF
         DfA+ZYQEIuMPh78Pvrql9L3pPlq5UEIKuhlpPE/BO0RZ8utHIpZOw97BjJebc9+my6tp
         PxIg==
X-Gm-Message-State: AOAM533JK7c6eCUHSdE9lJYgtkhfh0/FODJPrwlQdeqQYXG7gqez03P1
        6F0cV9JRTapiD9o3LW3oKpaF7BvGLRnbEzO5
X-Google-Smtp-Source: ABdhPJzNcgzja49Yf1rtiR40nyFT+P/Aus3pFQtlWHG0ZumxGVS/T3TveTxS2e4LYgoStxFbykC5xA==
X-Received: by 2002:a05:6512:3188:: with SMTP id i8mr758583lfe.230.1644922963460;
        Tue, 15 Feb 2022 03:02:43 -0800 (PST)
Received: from localhost.localdomain (c-fdcc225c.014-348-6c756e10.bbcust.telenor.se. [92.34.204.253])
        by smtp.gmail.com with ESMTPSA id a24sm4489046lff.97.2022.02.15.03.02.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Feb 2022 03:02:42 -0800 (PST)
From:   Linus Walleij <linus.walleij@linaro.org>
To:     Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        linux-input@vger.kernel.org
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Michael Srba <Michael.Srba@seznam.cz>,
        Nikita Travkin <nikita@trvn.ru>
Subject: [PATCH v2] Input: zinitix - Do not report shadow fingers
Date:   Tue, 15 Feb 2022 12:00:40 +0100
Message-Id: <20220215110040.1160143-1-linus.walleij@linaro.org>
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

There is a field in the struct touch_event called finger_cnt
which is actually a bitmask of the fingers active in the
event.

Rename this field finger_mask as this matches the use contents
better, then use for_each_set_bit() to iterate over just the
fingers that are actally active.

Factor out a finger reporting function zinitix_report_fingers()
to handle all fingers.

Also be more careful in reporting finger down/up: we were
reporting every event with input_mt_report_slot_state(..., true);
but this should only be reported on finger down or move,
not on finger up, so also add code to check p->sub_status
to see what is happening and report correctly.

After this my Zinitix BT404 touchscreen report fingers
flawlessly.

The vendor drive I have notably does not use the "finger_cnt"
and contains obviously incorrect code like this:

  if (touch_dev->touch_info.finger_cnt > MAX_SUPPORTED_FINGER_NUM)
      touch_dev->touch_info.finger_cnt = MAX_SUPPORTED_FINGER_NUM;

As MAX_SUPPORTED_FINGER_NUM is an ordinal and the field is
a bitmask this seems quite confused.

Cc: Michael Srba <Michael.Srba@seznam.cz>
Cc: Nikita Travkin <nikita@trvn.ru>
Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
ChangeLog v1->v2:
- Rewrite to use the mask of active fingers after Dmitry's
  observation that there is this field in the struct touch_event
  that is unused (also in the vendor driver).
---
 drivers/input/touchscreen/zinitix.c | 60 ++++++++++++++++++++++-------
 1 file changed, 47 insertions(+), 13 deletions(-)

diff --git a/drivers/input/touchscreen/zinitix.c b/drivers/input/touchscreen/zinitix.c
index 129ebc810de8..5fb1492aa68a 100644
--- a/drivers/input/touchscreen/zinitix.c
+++ b/drivers/input/touchscreen/zinitix.c
@@ -135,7 +135,7 @@ struct point_coord {
 
 struct touch_event {
 	__le16	status;
-	u8	finger_cnt;
+	u8	finger_mask;
 	u8	time_stamp;
 	struct point_coord point_coord[MAX_SUPPORTED_FINGER_NUM];
 };
@@ -319,14 +319,52 @@ static int zinitix_send_power_on_sequence(struct bt541_ts_data *bt541)
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
+	u16 x, y;
+	unsigned long fmask;
+	int i;
+
+	/*
+	 * If the corresponding finger is not active, do not report
+	 * what is happening on it.
+	 */
+	fmask = te->finger_mask;
+	for_each_set_bit(i, &fmask, MAX_SUPPORTED_FINGER_NUM) {
+		p = &te->point_coord[i];
+
+		/* Skip nonexisting fingers */
+		if (!p->sub_status & SUB_BIT_EXIST)
+			continue;
+
+		x = le16_to_cpu(p->x);
+		y = le16_to_cpu(p->y);
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
+	}
 }
 
 static irqreturn_t zinitix_ts_irq_handler(int irq, void *bt541_handler)
@@ -335,7 +373,6 @@ static irqreturn_t zinitix_ts_irq_handler(int irq, void *bt541_handler)
 	struct i2c_client *client = bt541->client;
 	struct touch_event touch_event;
 	int error;
-	int i;
 
 	memset(&touch_event, 0, sizeof(struct touch_event));
 
@@ -346,10 +383,7 @@ static irqreturn_t zinitix_ts_irq_handler(int irq, void *bt541_handler)
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

