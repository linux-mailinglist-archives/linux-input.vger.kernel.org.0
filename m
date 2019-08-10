Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 8CDC58873F
	for <lists+linux-input@lfdr.de>; Sat, 10 Aug 2019 02:20:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730062AbfHJAUx (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Fri, 9 Aug 2019 20:20:53 -0400
Received: from mail-pg1-f196.google.com ([209.85.215.196]:38832 "EHLO
        mail-pg1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729998AbfHJAUw (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Fri, 9 Aug 2019 20:20:52 -0400
Received: by mail-pg1-f196.google.com with SMTP id z14so9387954pga.5;
        Fri, 09 Aug 2019 17:20:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=Py5izYYGYxK1r1UennYGykGXOqlT7wOmuazJC5NpGWA=;
        b=F2oN2us6LV0zwr1j++rHcQ4Q8BdvtjUPcW3K813UnHXm2nwZweAnWeOSoZyPNdOH6I
         u+l0HCwovi7sAETRfIWtE982RR+YsWW2OCHIhIr5UPVI3v24roi0XJe39CpTD37sVeP8
         CcyxYlTuHPo6l5Z9d8hpSAM5mRmUSCHH9ea/TEg4nkokGr4uTRrA3iqijETwup1IZkh0
         pnV1B8w4brz5Ha0aCDbt1JVdiDMUOEZMDNpVobNCw0HEENKNfqtmjolC2S2Ok0SU+4Kc
         ot0cJZP+WVf7cpoPXtg3O6poWC4lVGd5K1oajUtgQY29KdWdEt573Olp2t6cC64m3ojt
         8wEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=Py5izYYGYxK1r1UennYGykGXOqlT7wOmuazJC5NpGWA=;
        b=SDWEhzA4hWpc+DmJpsXAtYtsBLQjjWyh7m0lVMjtT1CPw9yZYs90yfPTaEtXd3wlOH
         wlazss6cUHQrnbu/rHw54FZNm/HXj3X5HFfS5OI9Ns9SynKBh7HCflQu1NK5CH65GQmb
         /J6MLnCYLiknpZHvjYEuDiHZxEZ9QnKLrTXlqWO+hHIXPj8pEfG7St9hlMRkuHVq+YiV
         q6binNnPJC9cALgiexMnVFY3KLvbF4+5F1FM2v4zO6yQH1s3aMp45p4J7BNBTczi9baz
         ZYR4OVFAMNepz8LxaE4cdcLFrKwC+SvkjPkMrQ4qn1mBQvleyxlfgT5YN4T8mOJl7NuZ
         re6g==
X-Gm-Message-State: APjAAAXqww5wqGglzQeCHaq+Z/xASdKBNoOwGCZMq/BX1fewUtMHFs7D
        rtxsB7QZI9ZY6ACBHDf50avV1d3r
X-Google-Smtp-Source: APXvYqyGmB/4sGoZ4tdiWgHlpEXLl3KoDu22JGpimzhQZGtTRm77csodoGA8mMNkJfMIHbobbZ0DgQ==
X-Received: by 2002:a65:68d9:: with SMTP id k25mr19942091pgt.337.1565396451204;
        Fri, 09 Aug 2019 17:20:51 -0700 (PDT)
Received: from dtor-ws.mtv.corp.google.com ([2620:15c:202:201:3adc:b08c:7acc:b325])
        by smtp.gmail.com with ESMTPSA id v185sm110701150pfb.14.2019.08.09.17.20.50
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Fri, 09 Aug 2019 17:20:50 -0700 (PDT)
From:   Dmitry Torokhov <dmitry.torokhov@gmail.com>
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     linux-input@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH 10/11] Input: bu21013_ts - switch to using MT-B (slotted) protocol
Date:   Fri,  9 Aug 2019 17:20:38 -0700
Message-Id: <20190810002039.95876-11-dmitry.torokhov@gmail.com>
X-Mailer: git-send-email 2.23.0.rc1.153.gdeed80330f-goog
In-Reply-To: <20190810002039.95876-1-dmitry.torokhov@gmail.com>
References: <20190810002039.95876-1-dmitry.torokhov@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

MT-B protocol is more efficient and everyone expects it. We use in-kernel
tracking to identify contacts.

Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
---
 drivers/input/touchscreen/bu21013_ts.c | 80 ++++++++++++++------------
 1 file changed, 43 insertions(+), 37 deletions(-)

diff --git a/drivers/input/touchscreen/bu21013_ts.c b/drivers/input/touchscreen/bu21013_ts.c
index d7e16e915743..2c534aa61687 100644
--- a/drivers/input/touchscreen/bu21013_ts.c
+++ b/drivers/input/touchscreen/bu21013_ts.c
@@ -9,6 +9,7 @@
 #include <linux/gpio/consumer.h>
 #include <linux/i2c.h>
 #include <linux/input.h>
+#include <linux/input/mt.h>
 #include <linux/interrupt.h>
 #include <linux/kernel.h>
 #include <linux/module.h>
@@ -181,11 +182,13 @@ static int bu21013_read_block_data(struct bu21013_ts *ts, u8 *buf)
 
 static int bu21013_do_touch_report(struct bu21013_ts *ts)
 {
-	u8	buf[LENGTH_OF_BUFFER];
-	unsigned int pos_x[2], pos_y[2];
-	bool	has_x_sensors, has_y_sensors;
-	int	finger_down_count = 0;
-	int	i;
+	struct input_dev *input = ts->in_dev;
+	struct input_mt_pos pos[MAX_FINGERS];
+	int slots[MAX_FINGERS];
+	u8 buf[LENGTH_OF_BUFFER];
+	bool has_x_sensors, has_y_sensors;
+	int finger_down_count = 0;
+	int i;
 
 	if (bu21013_read_block_data(ts, buf) < 0)
 		return -EINVAL;
@@ -197,39 +200,38 @@ static int bu21013_do_touch_report(struct bu21013_ts *ts)
 		return 0;
 
 	for (i = 0; i < MAX_FINGERS; i++) {
-		const u8 *p = &buf[4 * i + 3];
-		unsigned int x = p[0] << SHIFT_2 | (p[1] & MASK_BITS);
-		unsigned int y = p[2] << SHIFT_2 | (p[3] & MASK_BITS);
-		if (x == 0 || y == 0)
+		const u8 *data = &buf[4 * i + 3];
+		struct input_mt_pos *p = &pos[finger_down_count];
+
+		p->x = data[0] << SHIFT_2 | (data[1] & MASK_BITS);
+		p->y = data[2] << SHIFT_2 | (data[3] & MASK_BITS);
+		if (p->x == 0 || p->y == 0)
 			continue;
-		pos_x[finger_down_count] = x;
-		pos_y[finger_down_count] = y;
+
 		finger_down_count++;
+
+		if (ts->x_flip)
+			p->x = ts->touch_x_max - p->x;
+		if (ts->y_flip)
+			p->y = ts->touch_y_max - p->y;
 	}
 
-	if (finger_down_count) {
-		if (finger_down_count == 2 &&
-		    (abs(pos_x[0] - pos_x[1]) < DELTA_MIN ||
-		     abs(pos_y[0] - pos_y[1]) < DELTA_MIN)) {
-			return 0;
-		}
+	if (finger_down_count == 2 &&
+	    (abs(pos[0].x - pos[1].x) < DELTA_MIN ||
+	     abs(pos[0].y - pos[1].y) < DELTA_MIN)) {
+		return 0;
+	}
 
-		for (i = 0; i < finger_down_count; i++) {
-			if (ts->x_flip)
-				pos_x[i] = ts->touch_x_max - pos_x[i];
-			if (ts->y_flip)
-				pos_y[i] = ts->touch_y_max - pos_y[i];
-
-			input_report_abs(ts->in_dev,
-					 ABS_MT_POSITION_X, pos_x[i]);
-			input_report_abs(ts->in_dev,
-					 ABS_MT_POSITION_Y, pos_y[i]);
-			input_mt_sync(ts->in_dev);
-		}
-	} else
-		input_mt_sync(ts->in_dev);
+	input_mt_assign_slots(input, slots, pos, finger_down_count, DELTA_MIN);
+	for (i = 0; i < finger_down_count; i++) {
+		input_mt_slot(input, slots[i]);
+		input_mt_report_slot_state(input, MT_TOOL_FINGER, true);
+		input_report_abs(input, ABS_MT_POSITION_X, pos[i].x);
+		input_report_abs(input, ABS_MT_POSITION_Y, pos[i].y);
+	}
 
-	input_sync(ts->in_dev);
+	input_mt_sync_frame(input);
+	input_sync(input);
 
 	return 0;
 }
@@ -443,20 +445,24 @@ static int bu21013_probe(struct i2c_client *client,
 		return -ENOMEM;
 	}
 	ts->in_dev = in_dev;
+	input_set_drvdata(in_dev, ts);
 
 	/* register the device to input subsystem */
 	in_dev->name = DRIVER_TP;
 	in_dev->id.bustype = BUS_I2C;
 
-	__set_bit(EV_SYN, in_dev->evbit);
-	__set_bit(EV_KEY, in_dev->evbit);
-	__set_bit(EV_ABS, in_dev->evbit);
-
 	input_set_abs_params(in_dev, ABS_MT_POSITION_X,
 			     0, ts->touch_x_max, 0, 0);
 	input_set_abs_params(in_dev, ABS_MT_POSITION_Y,
 			     0, ts->touch_y_max, 0, 0);
-	input_set_drvdata(in_dev, ts);
+
+	error = input_mt_init_slots(in_dev, MAX_FINGERS,
+				    INPUT_MT_DIRECT | INPUT_MT_TRACK |
+					INPUT_MT_DROP_UNUSED);
+	if (error) {
+		dev_err(&client->dev, "failed to initialize MT slots");
+		return error;
+	}
 
 	ts->regulator = devm_regulator_get(&client->dev, "avdd");
 	if (IS_ERR(ts->regulator)) {
-- 
2.23.0.rc1.153.gdeed80330f-goog

