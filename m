Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 387C1E0CE7
	for <lists+linux-input@lfdr.de>; Tue, 22 Oct 2019 21:57:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388921AbfJVT4h (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 22 Oct 2019 15:56:37 -0400
Received: from mail-pl1-f194.google.com ([209.85.214.194]:32952 "EHLO
        mail-pl1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2388843AbfJVT4g (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Tue, 22 Oct 2019 15:56:36 -0400
Received: by mail-pl1-f194.google.com with SMTP id y8so330929plk.0;
        Tue, 22 Oct 2019 12:56:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=cDkndy0FNxa9CBg8H+skhv6JC+slFkOzGwJOrt8DmjE=;
        b=PddPwk0iVzgAN4OagHPAMekQDXdSR6+WSsD+PPeOKkyMjCMEatHhgo4kVO5it/fNhb
         IpfZK2SyIpA61/a5uxRuXAZbB57ViwDq9kPwz/7x6FJ9815suPsmVS1adPTxrxpownED
         bc4qB4M1EA04f8Tn2UBiYFiMl479yjnFjFvNKOL7RZnCBSboinL+Uha/yjzZmjoAsRpA
         8l9DCCdLKXTrnMmXLXLYyO7wTxOCRUa0YnXz1PNdAtoRQZYB4cYK/SV15wPQK3Qysgna
         xAmZQWNlVV92VIxUZNKMxb0l45GmIv96nnCnfq4RpvGEK+x5P1ftViNUEzsFG+PwuDuZ
         isAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=cDkndy0FNxa9CBg8H+skhv6JC+slFkOzGwJOrt8DmjE=;
        b=fhk90CP2F0y5Df3JvG03K2j8NeDXRocGErkac4wmPieijxH+iMMCRuSa/Y6Zmc2VTh
         obrZuWMvl8uXww0/mAcWssTCghW1/le0heG+BnOdA2ooBjR7lKm7G/bKDNI4UxROXSoX
         MMvsYZd7tqgVyGfdvHu7AxJD+7sHYzqXitOXIEpMLDlCtiAMHjtIuKXBQYZwsFdbSLYB
         q7/EIG6oy3zK8yhbL/HIP36kb6P5OGR/nHIvHk4T+Za0KpDBBp80+M99GspkrT2n1JBF
         stf8ZJrqFcAl+HsJqniHi+suTRAS1bKH2i6Sw0c6WmG9hUPOXOw8NcjHnvEH/eGpO/3+
         C3RQ==
X-Gm-Message-State: APjAAAUVGFcS5Htl/p+yHS4/3TFUU+8Ps+c9+UF3baAAAf5swYTxIyOD
        D0BRrq4um2kL4z0nRFja2kQ=
X-Google-Smtp-Source: APXvYqzAnKSLNYeB8RmInNKMmGD4U31BE1EOTx4zm4dUb0wjTRQ3sRz+hlaBbAXjQ9PTYuEf2ihRhQ==
X-Received: by 2002:a17:902:244:: with SMTP id 62mr5720735plc.14.1571774195135;
        Tue, 22 Oct 2019 12:56:35 -0700 (PDT)
Received: from dtor-ws.mtv.corp.google.com ([2620:15c:202:201:3adc:b08c:7acc:b325])
        by smtp.gmail.com with ESMTPSA id c34sm20212715pgb.35.2019.10.22.12.56.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Oct 2019 12:56:34 -0700 (PDT)
From:   Dmitry Torokhov <dmitry.torokhov@gmail.com>
To:     Martin Kepplinger <martink@posteo.de>
Cc:     Dixit Parmar <dixitparmar19@gmail.com>,
        Henrik Rydberg <rydberg@bitmath.org>,
        Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
        Matthias Fend <matthias.fend@wolfvision.net>,
        linux-input@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH 8/8] Input: st1232 - switch to using MT-B protocol
Date:   Tue, 22 Oct 2019 12:56:22 -0700
Message-Id: <20191022195622.66976-9-dmitry.torokhov@gmail.com>
X-Mailer: git-send-email 2.23.0.866.gb869b98d4c-goog
In-Reply-To: <20191022195622.66976-1-dmitry.torokhov@gmail.com>
References: <20191022195622.66976-1-dmitry.torokhov@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Switch the driver to the slotted variant of multitouch protocol (MT-B)
with in-kernel tracking of the contacts.

Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>

---

 drivers/input/touchscreen/st1232.c | 110 +++++++++++++++--------------
 1 file changed, 56 insertions(+), 54 deletions(-)

diff --git a/drivers/input/touchscreen/st1232.c b/drivers/input/touchscreen/st1232.c
index a4a3b82ee69d..63b29c7279e2 100644
--- a/drivers/input/touchscreen/st1232.c
+++ b/drivers/input/touchscreen/st1232.c
@@ -14,23 +14,19 @@
 #include <linux/gpio/consumer.h>
 #include <linux/i2c.h>
 #include <linux/input.h>
+#include <linux/input/mt.h>
+#include <linux/input/touchscreen.h>
 #include <linux/interrupt.h>
 #include <linux/module.h>
 #include <linux/of.h>
 #include <linux/pm_qos.h>
 #include <linux/slab.h>
 #include <linux/types.h>
-#include <linux/input/touchscreen.h>
 
 #define ST1232_TS_NAME	"st1232-ts"
 #define ST1633_TS_NAME	"st1633-ts"
 
-struct st1232_ts_finger {
-	u16 x;
-	u16 y;
-	u8 t;
-	bool is_valid;
-};
+#define ST_TS_MAX_FINGERS	10
 
 struct st_chip_info {
 	bool	have_z;
@@ -50,12 +46,10 @@ struct st1232_ts_data {
 	const struct st_chip_info *chip_info;
 	int read_buf_len;
 	u8 *read_buf;
-	struct st1232_ts_finger fingers[];
 };
 
 static int st1232_ts_read_data(struct st1232_ts_data *ts)
 {
-	struct st1232_ts_finger *finger = ts->fingers;
 	struct i2c_client *client = ts->client;
 	u8 start_reg = ts->chip_info->start_reg;
 	struct i2c_msg msg[] = {
@@ -72,59 +66,69 @@ static int st1232_ts_read_data(struct st1232_ts_data *ts)
 		}
 	};
 	int ret;
-	int i;
-	u8 *buf;
 
 	ret = i2c_transfer(client->adapter, msg, ARRAY_SIZE(msg));
 	if (ret != ARRAY_SIZE(msg))
 		return ret < 0 ? ret : -EIO;
 
+	return 0;
+}
+
+static int st1232_ts_parse_and_report(struct st1232_ts_data *ts)
+{
+	struct input_dev *input = ts->input_dev;
+	struct input_mt_pos pos[ST_TS_MAX_FINGERS];
+	u8 z[ST_TS_MAX_FINGERS];
+	int slots[ST_TS_MAX_FINGERS];
+	int n_contacts = 0;
+	int i;
+
 	for (i = 0; i < ts->chip_info->max_fingers; i++) {
-		buf = &ts->read_buf[i * 4];
-		finger[i].is_valid = buf[0] >> 7;
-		if (finger[i].is_valid) {
-			finger[i].x = ((buf[0] & 0x70) << 4) | buf[1];
-			finger[i].y = ((buf[0] & 0x07) << 8) | buf[2];
+		u8 *buf = &ts->read_buf[i * 4];
+
+		if (buf[0] & BIT(7)) {
+			unsigned int x = ((buf[0] & 0x70) << 4) | buf[1];
+			unsigned int y = ((buf[0] & 0x07) << 8) | buf[2];
+
+			touchscreen_set_mt_pos(&pos[n_contacts],
+					       &ts->prop, x, y);
 
 			/* st1232 includes a z-axis / touch strength */
 			if (ts->chip_info->have_z)
-				finger[i].t = ts->read_buf[i + 6];
+				z[n_contacts] = ts->read_buf[i + 6];
+
+			n_contacts++;
 		}
 	}
 
-	return 0;
+	input_mt_assign_slots(input, slots, pos, n_contacts, 0);
+	for (i = 0; i < n_contacts; i++) {
+		input_mt_slot(input, slots[i]);
+		input_mt_report_slot_state(input, MT_TOOL_FINGER, true);
+		input_report_abs(input, ABS_MT_POSITION_X, pos[i].x);
+		input_report_abs(input, ABS_MT_POSITION_Y, pos[i].y);
+		if (ts->chip_info->have_z)
+			input_report_abs(input, ABS_MT_TOUCH_MAJOR, z[i]);
+	}
+
+	input_mt_sync_frame(input);
+	input_sync(input);
+
+	return n_contacts;
 }
 
 static irqreturn_t st1232_ts_irq_handler(int irq, void *dev_id)
 {
 	struct st1232_ts_data *ts = dev_id;
-	struct st1232_ts_finger *finger = ts->fingers;
-	struct input_dev *input_dev = ts->input_dev;
-	int count = 0;
-	int i, ret;
-
-	ret = st1232_ts_read_data(ts);
-	if (ret < 0)
-		goto end;
-
-	/* multi touch protocol */
-	for (i = 0; i < ts->chip_info->max_fingers; i++) {
-		if (!finger[i].is_valid)
-			continue;
+	int count;
+	int error;
 
-		if (ts->chip_info->have_z)
-			input_report_abs(input_dev, ABS_MT_TOUCH_MAJOR,
-					 finger[i].t);
+	error = st1232_ts_read_data(ts);
+	if (error)
+		goto out;
 
-		touchscreen_report_pos(input_dev, &ts->prop,
-					finger[i].x, finger[i].y, true);
-		input_mt_sync(input_dev);
-		count++;
-	}
-
-	/* SYN_MT_REPORT only if no contact */
+	count = st1232_ts_parse_and_report(ts);
 	if (!count) {
-		input_mt_sync(input_dev);
 		if (ts->low_latency_req.dev) {
 			dev_pm_qos_remove_request(&ts->low_latency_req);
 			ts->low_latency_req.dev = NULL;
@@ -136,10 +140,7 @@ static irqreturn_t st1232_ts_irq_handler(int irq, void *dev_id)
 						DEV_PM_QOS_RESUME_LATENCY, 100);
 	}
 
-	/* SYN_REPORT */
-	input_sync(input_dev);
-
-end:
+out:
 	return IRQ_HANDLED;
 }
 
@@ -198,9 +199,7 @@ static int st1232_ts_probe(struct i2c_client *client,
 		return -EINVAL;
 	}
 
-	ts = devm_kzalloc(&client->dev,
-			  struct_size(ts, fingers, match->max_fingers),
-			  GFP_KERNEL);
+	ts = devm_kzalloc(&client->dev, sizeof(*ts), GFP_KERNEL);
 	if (!ts)
 		return -ENOMEM;
 
@@ -240,11 +239,6 @@ static int st1232_ts_probe(struct i2c_client *client,
 	input_dev->name = "st1232-touchscreen";
 	input_dev->id.bustype = BUS_I2C;
 
-	__set_bit(INPUT_PROP_DIRECT, input_dev->propbit);
-	__set_bit(EV_SYN, input_dev->evbit);
-	__set_bit(EV_KEY, input_dev->evbit);
-	__set_bit(EV_ABS, input_dev->evbit);
-
 	if (ts->chip_info->have_z)
 		input_set_abs_params(input_dev, ABS_MT_TOUCH_MAJOR, 0,
 				     ts->chip_info->max_area, 0, 0);
@@ -256,6 +250,14 @@ static int st1232_ts_probe(struct i2c_client *client,
 
 	touchscreen_parse_properties(input_dev, true, &ts->prop);
 
+	error = input_mt_init_slots(input_dev, ts->chip_info->max_fingers,
+				    INPUT_MT_DIRECT | INPUT_MT_TRACK |
+					INPUT_MT_DROP_UNUSED);
+	if (error) {
+		dev_err(&client->dev, "failed to initialize MT slots\n");
+		return error;
+	}
+
 	error = devm_request_threaded_irq(&client->dev, client->irq,
 					  NULL, st1232_ts_irq_handler,
 					  IRQF_ONESHOT,
-- 
2.23.0.866.gb869b98d4c-goog

