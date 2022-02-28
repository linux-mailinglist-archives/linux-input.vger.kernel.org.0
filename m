Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D7A554C7E6F
	for <lists+linux-input@lfdr.de>; Tue,  1 Mar 2022 00:32:29 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229842AbiB1XdH (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 28 Feb 2022 18:33:07 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42204 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229477AbiB1XdG (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Mon, 28 Feb 2022 18:33:06 -0500
Received: from mail-lf1-x133.google.com (mail-lf1-x133.google.com [IPv6:2a00:1450:4864:20::133])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B73E2CE8
        for <linux-input@vger.kernel.org>; Mon, 28 Feb 2022 15:32:25 -0800 (PST)
Received: by mail-lf1-x133.google.com with SMTP id u20so24088505lff.2
        for <linux-input@vger.kernel.org>; Mon, 28 Feb 2022 15:32:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=IHIyf4q8CtWW0/IMWl+9UyMwASgvrLQI1t9HTkwJcHc=;
        b=hDsDDySJT9tP+js6wYyvlxvasx6icl2oTnxnacnw7X8P1STpiaXAfKvanhDKyCwkqe
         BAAP5iIeLvLUri1zauZtWW7y+FmxIF5DNZ9TYpdfOJjqUWKOIjt32lczMcnKVgQJEcTk
         nwvzgT41WFPmOGix+sKJDKM3qewsZ9sMrVjS/GEfb6rvwysmk45mYRbSUKfsMjW8e/Qy
         XtQlaeMiK/k8Ye03PW3L4B+NY2xA8XYcO8s22+3m1JZ40u+wm6oVDo7AF6ImaNhBeRfB
         X15Z0enCmrmHiD0bUNF5FTfSX+QOTheEg5cNMmvf4AH/C9S5esnY2WRcICD3571CajXt
         AgrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=IHIyf4q8CtWW0/IMWl+9UyMwASgvrLQI1t9HTkwJcHc=;
        b=WzdtpQ9GagI80h2CL7MSkzoav0abq2aVmFS6A679R2w4CiNbqQUt3/cPaG3TDQ8Tuy
         j1enquIOpg5l6wM2P5Jg/zCvAZ1Z24/Uxf9CQoSXr9Rg2xoeoKFF/XkE4cO9wuePbxtc
         /RossYWurJaHSlJ+iiLcvl6iGFXZGZNMw/phTVweB+B8IBvnzJ7BigNiYqXSlpCbEYL1
         qnm2o6o0GwhmzNf5pq4htccOnUVae/Wt+9cpIBwCKRC49Y/Y3vRL9tDAqFjmI3TD+N8r
         09UQuP18YDDSzLPnfxr7/ZCxpDwJhtTZD/t1Zqk5F8qrzeJdrUGFO64pPAbcneGh17F6
         hkKA==
X-Gm-Message-State: AOAM533BwRg7qKr7iRuda1lk71XD5P2plufhEG8nEFxP8G68e3iPOaI/
        JK4bUxpxCpmADxTpwmoY8DIpQA==
X-Google-Smtp-Source: ABdhPJzWeHHlSUZ2RZUd96Nc2nyr26C7k4+k0/r0bu1N9j/yNwwjrMRgFBIlwM3J/nGf8mX6STNcAg==
X-Received: by 2002:a05:6512:1194:b0:443:7cf1:9033 with SMTP id g20-20020a056512119400b004437cf19033mr14302755lfr.417.1646091144060;
        Mon, 28 Feb 2022 15:32:24 -0800 (PST)
Received: from localhost.localdomain (c-fdcc225c.014-348-6c756e10.bbcust.telenor.se. [92.34.204.253])
        by smtp.gmail.com with ESMTPSA id p6-20020a05651238c600b00443de9cdc48sm1186974lft.226.2022.02.28.15.32.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Feb 2022 15:32:23 -0800 (PST)
From:   Linus Walleij <linus.walleij@linaro.org>
To:     Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        linux-input@vger.kernel.org
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Michael Srba <Michael.Srba@seznam.cz>,
        Nikita Travkin <nikita@trvn.ru>,
        Dan Carpenter <dan.carpenter@oracle.com>
Subject: [PATCH v3] Input: zinitix - Do not report shadow fingers
Date:   Tue,  1 Mar 2022 00:30:17 +0100
Message-Id: <20220228233017.2270599-1-linus.walleij@linaro.org>
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
Cc: Dan Carpenter <dan.carpenter@oracle.com>
Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
ChangeLog v2->v3:
- Fix a !() parenthesing issue reported by Dan Carpenter and the
  kernel test robot. Incorporated as a review comment as the patch
  is not yet upstream.
ChangeLog v1->v2:
- Rewrite to use the mask of active fingers after Dmitry's
  observation that there is this field in the struct touch_event
  that is unused (also in the vendor driver).
---
 drivers/input/touchscreen/zinitix.c | 60 ++++++++++++++++++++++-------
 1 file changed, 47 insertions(+), 13 deletions(-)

diff --git a/drivers/input/touchscreen/zinitix.c b/drivers/input/touchscreen/zinitix.c
index 129ebc810de8..49794a545c64 100644
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
+		if (!(p->sub_status & SUB_BIT_EXIST))
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

