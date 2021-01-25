Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2317E302A34
	for <lists+linux-input@lfdr.de>; Mon, 25 Jan 2021 19:29:32 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726424AbhAYS1w (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 25 Jan 2021 13:27:52 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39874 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726251AbhAYS0L (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Mon, 25 Jan 2021 13:26:11 -0500
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BD990C0613D6
        for <linux-input@vger.kernel.org>; Mon, 25 Jan 2021 10:25:30 -0800 (PST)
Received: from [2a0a:edc0:0:1101:1d::39] (helo=dude03.red.stw.pengutronix.de)
        by metis.ext.pengutronix.de with esmtp (Exim 4.92)
        (envelope-from <l.stach@pengutronix.de>)
        id 1l46YK-00041I-Ne; Mon, 25 Jan 2021 19:25:28 +0100
From:   Lucas Stach <l.stach@pengutronix.de>
To:     Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc:     Sebastian Reichel <sebastian.reichel@collabora.com>,
        linux-input@vger.kernel.org, kernel@pengutronix.de,
        patchwork-lst@pengutronix.de
Subject: [PATCH v3 1/5] Input: exc3000 - split MT event handling from IRQ handler
Date:   Mon, 25 Jan 2021 19:25:23 +0100
Message-Id: <20210125182527.1225245-2-l.stach@pengutronix.de>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210125182527.1225245-1-l.stach@pengutronix.de>
References: <20210125182527.1225245-1-l.stach@pengutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a0a:edc0:0:1101:1d::39
X-SA-Exim-Mail-From: l.stach@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-input@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Split out the multitouch event handling into its own function to allow other
events to be handled in the IRQ handler without disturbing the MT handling.
Now that things are separated a bit more, stop treating vendor data requests
special by cehcking for a locked mutex, but just look at the event ID to
figure out if the message is a MT report or a vendor data query reply.

Signed-off-by: Lucas Stach <l.stach@pengutronix.de>
---
 drivers/input/touchscreen/exc3000.c | 113 +++++++++++++++-------------
 1 file changed, 59 insertions(+), 54 deletions(-)

diff --git a/drivers/input/touchscreen/exc3000.c b/drivers/input/touchscreen/exc3000.c
index a6597f026980..c3fc78185793 100644
--- a/drivers/input/touchscreen/exc3000.c
+++ b/drivers/input/touchscreen/exc3000.c
@@ -30,6 +30,7 @@
 #define EXC3000_LEN_MODEL_NAME		16
 #define EXC3000_LEN_FW_VERSION		16
 
+#define EXC3000_VENDOR_EVENT		0x03
 #define EXC3000_MT1_EVENT		0x06
 #define EXC3000_MT2_EVENT		0x18
 
@@ -105,15 +106,16 @@ static void exc3000_timer(struct timer_list *t)
 	input_sync(data->input);
 }
 
+static inline void exc3000_schedule_timer(struct exc3000_data *data)
+{
+	mod_timer(&data->timer, jiffies + msecs_to_jiffies(EXC3000_TIMEOUT_MS));
+}
+
 static int exc3000_read_frame(struct exc3000_data *data, u8 *buf)
 {
 	struct i2c_client *client = data->client;
-	u8 expected_event = EXC3000_MT1_EVENT;
 	int ret;
 
-	if (data->info->max_xy == SZ_16K - 1)
-		expected_event = EXC3000_MT2_EVENT;
-
 	ret = i2c_master_send(client, "'", 2);
 	if (ret < 0)
 		return ret;
@@ -131,47 +133,61 @@ static int exc3000_read_frame(struct exc3000_data *data, u8 *buf)
 	if (get_unaligned_le16(buf) != EXC3000_LEN_FRAME)
 		return -EINVAL;
 
-	if (buf[2] != expected_event)
-		return -EINVAL;
-
 	return 0;
 }
 
-static int exc3000_read_data(struct exc3000_data *data,
-			     u8 *buf, int *n_slots)
+static int exc3000_handle_mt_event(struct exc3000_data *data)
 {
-	int error;
-
-	error = exc3000_read_frame(data, buf);
-	if (error)
-		return error;
+	struct input_dev *input = data->input;
+	int ret, total_slots;
+	u8 *buf = data->buf;
 
-	*n_slots = buf[3];
-	if (!*n_slots || *n_slots > EXC3000_NUM_SLOTS)
-		return -EINVAL;
+	total_slots = buf[3];
+	if (!total_slots || total_slots > EXC3000_NUM_SLOTS) {
+		ret = -EINVAL;
+		goto out_fail;
+	}
 
-	if (*n_slots > EXC3000_SLOTS_PER_FRAME) {
+	if (total_slots > EXC3000_SLOTS_PER_FRAME) {
 		/* Read 2nd frame to get the rest of the contacts. */
-		error = exc3000_read_frame(data, buf + EXC3000_LEN_FRAME);
-		if (error)
-			return error;
+		ret = exc3000_read_frame(data, buf + EXC3000_LEN_FRAME);
+		if (ret)
+			goto out_fail;
 
 		/* 2nd chunk must have number of contacts set to 0. */
-		if (buf[EXC3000_LEN_FRAME + 3] != 0)
-			return -EINVAL;
+		if (buf[EXC3000_LEN_FRAME + 3] != 0) {
+			ret = -EINVAL;
+			goto out_fail;
+		}
+	}
+
+	/*
+	 * We read full state successfully, no contacts will be "stuck".
+	 */
+	del_timer_sync(&data->timer);
+
+	while (total_slots > 0) {
+		int slots = min(total_slots, EXC3000_SLOTS_PER_FRAME);
+		exc3000_report_slots(input, &data->prop, buf + 4, slots);
+		total_slots -= slots;
+		buf += EXC3000_LEN_FRAME;
 	}
 
+	input_mt_sync_frame(input);
+	input_sync(input);
+
 	return 0;
+
+out_fail:
+	/* Schedule a timer to release "stuck" contacts */
+	exc3000_schedule_timer(data);
+
+	return ret;
 }
 
 static int exc3000_query_interrupt(struct exc3000_data *data)
 {
 	u8 *buf = data->buf;
-	int error;
-
-	error = i2c_master_recv(data->client, buf, EXC3000_LEN_FRAME);
-	if (error < 0)
-		return error;
 
 	if (buf[0] != 'B')
 		return -EPROTO;
@@ -189,40 +205,29 @@ static int exc3000_query_interrupt(struct exc3000_data *data)
 static irqreturn_t exc3000_interrupt(int irq, void *dev_id)
 {
 	struct exc3000_data *data = dev_id;
-	struct input_dev *input = data->input;
 	u8 *buf = data->buf;
-	int slots, total_slots;
-	int error;
-
-	if (mutex_is_locked(&data->query_lock)) {
-		data->query_result = exc3000_query_interrupt(data);
-		complete(&data->wait_event);
-		goto out;
-	}
+	int ret;
 
-	error = exc3000_read_data(data, buf, &total_slots);
-	if (error) {
+	ret = exc3000_read_frame(data, buf);
+	if (ret) {
 		/* Schedule a timer to release "stuck" contacts */
-		mod_timer(&data->timer,
-			  jiffies + msecs_to_jiffies(EXC3000_TIMEOUT_MS));
+		exc3000_schedule_timer(data);
 		goto out;
 	}
 
-	/*
-	 * We read full state successfully, no contacts will be "stuck".
-	 */
-	del_timer_sync(&data->timer);
-
-	while (total_slots > 0) {
-		slots = min(total_slots, EXC3000_SLOTS_PER_FRAME);
-		exc3000_report_slots(input, &data->prop, buf + 4, slots);
-		total_slots -= slots;
-		buf += EXC3000_LEN_FRAME;
+	switch (buf[2]) {
+		case EXC3000_VENDOR_EVENT:
+			data->query_result = exc3000_query_interrupt(data);
+			complete(&data->wait_event);
+			break;
+		case EXC3000_MT1_EVENT:
+		case EXC3000_MT2_EVENT:
+			exc3000_handle_mt_event(data);
+			break;
+		default:
+			break;
 	}
 
-	input_mt_sync_frame(input);
-	input_sync(input);
-
 out:
 	return IRQ_HANDLED;
 }
-- 
2.20.1

