Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id CE1F81939F8
	for <lists+linux-input@lfdr.de>; Thu, 26 Mar 2020 08:58:53 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726332AbgCZH6x (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 26 Mar 2020 03:58:53 -0400
Received: from mail-pl1-f193.google.com ([209.85.214.193]:38024 "EHLO
        mail-pl1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726279AbgCZH6x (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Thu, 26 Mar 2020 03:58:53 -0400
Received: by mail-pl1-f193.google.com with SMTP id w3so1834487plz.5;
        Thu, 26 Mar 2020 00:58:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id;
        bh=kpesQAb1EfvXtxtfV/ThTPpjKNkxOztwAVy2KkYtRQs=;
        b=jzAIRaqUHbJdHcBmYlTiQwxR7p6qtDzRAZq18vVuoq/WS8xJYMme88GfJsqrf0q9zA
         GZ98OOXWvIn/4CY3U/VSxm0DgQU1U7v2X1CImXiqUZ4GjcSUkWZS0Uo/alo+Qhy92W01
         LkEhlCDUdT59m6UWtRiwiG6BL6+k7NXc4go1GF/fDJLJ4LzFTIPHp2k1JAquhtT7Lkz/
         LRmep1QLA/+xOyqiCCW41O27ByxoKpx1d4u/JGrHGn6QVWRZRMMRbD1T+dJws9kxrEC1
         QVB9CrLshT97eFW+o8mxQ457lkevhUUY+dBWLephD0e5wiCeWNjWm2wuLZiQcn2sBiRf
         eJTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=kpesQAb1EfvXtxtfV/ThTPpjKNkxOztwAVy2KkYtRQs=;
        b=t45X+4OfJ7hxemEF+OZgjXZ43JOlCZkhb3HNvs8KR0D2FFvLGmWDX31/zKNYHAKccC
         beDA8ya77vdNQjD6f6xlqGer8/gyUK7+sp9DO7uFSYtbPzHl+z8gaJ8DkMbX0hwND+UN
         O9oiggMxya9dCrgJnwY1UovJ6zlb5RI9VPP72Ay2Vkyc8ONEMO4Me+2xpq8FJDrShd3a
         qGn+wdQ+frdtE+GiHVKsqj/2SEftqx+BPmXHK45DBFm1Moad2DDXSZgqHXfo4bGiWXP5
         A0zGOOUvqGv0UxK1lBYVEZjmzjZWSkAKOgVjN6PxGijq0b1fPEIDB1VYFWu3q5gXrTY/
         U07A==
X-Gm-Message-State: ANhLgQ2YXQvtcJPx5phrNqz0WS7l5l1CqUNrzg6RX4leryhKVkX9aZc6
        JTbWrgdCVJA9EdfU9Rq8h34=
X-Google-Smtp-Source: ADFU+vu56+99aFARGE8a5QmN/kZSODsnm4TPg+HH+ts6prsTBPuNX0IH5gkjvDVPnJEJbrvniXpTpQ==
X-Received: by 2002:a17:90a:37ea:: with SMTP id v97mr1825249pjb.26.1585209531605;
        Thu, 26 Mar 2020 00:58:51 -0700 (PDT)
Received: from localhost.localdomain ([2401:e180:8844:1606:8876:e9fa:cdda:cda2])
        by smtp.gmail.com with ESMTPSA id 144sm1011804pgd.29.2020.03.26.00.58.48
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
        Thu, 26 Mar 2020 00:58:51 -0700 (PDT)
From:   Johnny Chuang <johnny.chuang.emc@gmail.com>
To:     Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>,
        Peter Hutterer <peter.hutterer@who-t.net>,
        linux-kernel@vger.kernel.org, linux-input@vger.kernel.org,
        Rob Schonberger <robsc@google.com>,
        Johnny Chuang <johnny.chuang@emc.com.tw>
Cc:     James Chen <james.chen@emc.com.tw>,
        Jennifer Tsai <jennifer.tsai@emc.com.tw>,
        Paul Liang <paul.liang@emc.com.tw>,
        Jeff Chuang <jeff.chuang@emc.com.tw>
Subject: [PATCH] Input: elants_i2c - support palm detection
Date:   Thu, 26 Mar 2020 15:58:45 +0800
Message-Id: <1585209525-6047-1-git-send-email-johnny.chuang.emc@gmail.com>
X-Mailer: git-send-email 2.7.4
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

From: Johnny Chuang <johnny.chuang@emc.com.tw>

Elan define finger/palm detection on the least significant bit of byte 33.
The default value is 1 for all firmwares, which report as MT_TOOL_FINGER.
If firmware support palm detection, the bit will change to 0 and
report as MT_TOOL_PALM when firmware detecting palm.

Signed-off-by: Johnny Chuang <johnny.chuang@emc.com.tw>
---
 drivers/input/touchscreen/elants_i2c.c | 11 ++++++++++-
 1 file changed, 10 insertions(+), 1 deletion(-)

diff --git a/drivers/input/touchscreen/elants_i2c.c b/drivers/input/touchscreen/elants_i2c.c
index 14c577c..3b4d9eb3 100644
--- a/drivers/input/touchscreen/elants_i2c.c
+++ b/drivers/input/touchscreen/elants_i2c.c
@@ -73,6 +73,7 @@
 #define FW_POS_STATE		1
 #define FW_POS_TOTAL		2
 #define FW_POS_XY		3
+#define FW_POS_TOOL_TYPE	33
 #define FW_POS_CHECKSUM		34
 #define FW_POS_WIDTH		35
 #define FW_POS_PRESSURE		45
@@ -842,6 +843,7 @@ static void elants_i2c_mt_event(struct elants_data *ts, u8 *buf)
 {
 	struct input_dev *input = ts->input;
 	unsigned int n_fingers;
+	unsigned int tool_type;
 	u16 finger_state;
 	int i;
 
@@ -852,6 +854,12 @@ static void elants_i2c_mt_event(struct elants_data *ts, u8 *buf)
 	dev_dbg(&ts->client->dev,
 		"n_fingers: %u, state: %04x\n",  n_fingers, finger_state);
 
+	/* Note: all fingers have the same tool type */
+	if (buf[FW_POS_TOOL_TYPE] & 0x01)
+		tool_type = MT_TOOL_FINGER;
+	else
+		tool_type = MT_TOOL_PALM;
+
 	for (i = 0; i < MAX_CONTACT_NUM && n_fingers; i++) {
 		if (finger_state & 1) {
 			unsigned int x, y, p, w;
@@ -867,7 +875,7 @@ static void elants_i2c_mt_event(struct elants_data *ts, u8 *buf)
 				i, x, y, p, w);
 
 			input_mt_slot(input, i);
-			input_mt_report_slot_state(input, MT_TOOL_FINGER, true);
+			input_mt_report_slot_state(input, tool_type, true);
 			input_event(input, EV_ABS, ABS_MT_POSITION_X, x);
 			input_event(input, EV_ABS, ABS_MT_POSITION_Y, y);
 			input_event(input, EV_ABS, ABS_MT_PRESSURE, p);
@@ -1307,6 +1315,7 @@ static int elants_i2c_probe(struct i2c_client *client,
 	input_set_abs_params(ts->input, ABS_MT_POSITION_Y, 0, ts->y_max, 0, 0);
 	input_set_abs_params(ts->input, ABS_MT_TOUCH_MAJOR, 0, 255, 0, 0);
 	input_set_abs_params(ts->input, ABS_MT_PRESSURE, 0, 255, 0, 0);
+	input_set_abs_params(ts->input, ABS_MT_TOOL_TYPE, 0, MT_TOOL_MAX, 0, 0);
 	input_abs_set_res(ts->input, ABS_MT_POSITION_X, ts->x_res);
 	input_abs_set_res(ts->input, ABS_MT_POSITION_Y, ts->y_res);
 	input_abs_set_res(ts->input, ABS_MT_TOUCH_MAJOR, 1);
-- 
2.7.4

