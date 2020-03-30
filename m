Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4BEE01974CE
	for <lists+linux-input@lfdr.de>; Mon, 30 Mar 2020 09:02:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729344AbgC3HCn (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 30 Mar 2020 03:02:43 -0400
Received: from mail-pl1-f195.google.com ([209.85.214.195]:38753 "EHLO
        mail-pl1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729067AbgC3HCn (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Mon, 30 Mar 2020 03:02:43 -0400
Received: by mail-pl1-f195.google.com with SMTP id w3so6360618plz.5;
        Mon, 30 Mar 2020 00:02:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id;
        bh=WSdIM68tHzXnLZUsgjyCMVOpl5rBtPh7gWtcNiSwSsk=;
        b=QyasPbmmPxerMFArkA1gDdpKEP41IocDlkn9N7Jc+iF5d15WDnjeT283rEGTaE2ctJ
         r/dZwD/O9knVv8XQnyUroAALQYsBYDAstv06HRCErgGsFIxdw97NOAP/JR+v1Y6hgSWw
         QigDXiODhqBMco9nlVLVdPpiV3SubitgfXAf8Vql1A2F0yVJyvt9xDaf+WYpWB1aNEuq
         MMl+1JhZXKWMNPX7hpv6uHV8t+uKD9q5/coDf9i1LyTUJvGUqquxMqi4ROJfWEsgjzIT
         n0S5hkjoRVwP2n1LLNPyZk6jB4mY4DnYTgIjLV3thwdZ+OuVz3+OMo+hKwJRVUEH0Pm7
         ymLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=WSdIM68tHzXnLZUsgjyCMVOpl5rBtPh7gWtcNiSwSsk=;
        b=JzovIn57/i4DYu2V+kJCBchYa7ufeuaz8eiTSVqEspa1BpKQ/fbpg7AhFu7rXTLNsp
         LdNzqjTDR6Z0k0A1qX+ScQmAhcwjgYMweqjPtxhCpTSeRnzF19Fi9RPWia/BQrgbS5WC
         oaeVexRVCBgZxlU72+8Ppvg8FvmVMxNG5Uy2hdm6V4YqsblYvBpPeJTpqLhZdVpiN6Da
         3rgne3bVe97Ezg7vTciwSE8O1NdTTSL7lYiLDwPxAXj7osTlECK5JrsCRXzxxpihfN7W
         wCHR8yvZqRN/blhfZOBBQolSP/ana70ce3TqlGwveAC7BaGaclkywUYhzlJiaCQZSOX9
         70Fg==
X-Gm-Message-State: ANhLgQ1uhOhSIIq3cVi+lDYhJvDETnojRVERzawE9mYWou9L5iSskGfw
        EH3uguXf6TfErjf6BIGsjII=
X-Google-Smtp-Source: ADFU+vsD6jXFSfAjV+dy/g3D8rHYB80TTTxdHjXDxn+8JmS6ZIz0amKobPYbCB+UU/ax01VI6cMnHA==
X-Received: by 2002:a17:902:ee93:: with SMTP id a19mr11574832pld.258.1585551762617;
        Mon, 30 Mar 2020 00:02:42 -0700 (PDT)
Received: from localhost.localdomain ([2401:e180:8810:336b:8876:e9fa:cdda:cda2])
        by smtp.gmail.com with ESMTPSA id r14sm9566861pjj.48.2020.03.30.00.02.38
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
        Mon, 30 Mar 2020 00:02:42 -0700 (PDT)
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
Subject: [PATCH v2] Input: elants_i2c - support palm detection
Date:   Mon, 30 Mar 2020 15:02:36 +0800
Message-Id: <1585551756-29066-1-git-send-email-johnny.chuang.emc@gmail.com>
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
Changes in v2:
	- Modify MT_TOOL_MAX to MT_TOOL_PALM

 drivers/input/touchscreen/elants_i2c.c | 11 ++++++++++-
 1 file changed, 10 insertions(+), 1 deletion(-)

diff --git a/drivers/input/touchscreen/elants_i2c.c b/drivers/input/touchscreen/elants_i2c.c
index 14c577c..93211fe 100644
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
+	input_set_abs_params(ts->input, ABS_MT_TOOL_TYPE, 0, MT_TOOL_PALM, 0, 0);
 	input_abs_set_res(ts->input, ABS_MT_POSITION_X, ts->x_res);
 	input_abs_set_res(ts->input, ABS_MT_POSITION_Y, ts->y_res);
 	input_abs_set_res(ts->input, ABS_MT_TOUCH_MAJOR, 1);
-- 
2.7.4

