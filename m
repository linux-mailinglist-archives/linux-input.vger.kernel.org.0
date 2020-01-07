Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id BD543132CCF
	for <lists+linux-input@lfdr.de>; Tue,  7 Jan 2020 18:17:43 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728358AbgAGRRm (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 7 Jan 2020 12:17:42 -0500
Received: from metis.ext.pengutronix.de ([85.220.165.71]:32883 "EHLO
        metis.ext.pengutronix.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728211AbgAGRRm (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Tue, 7 Jan 2020 12:17:42 -0500
Received: from dude02.hi.pengutronix.de ([2001:67c:670:100:1d::28] helo=dude02.pengutronix.de.)
        by metis.ext.pengutronix.de with esmtp (Exim 4.92)
        (envelope-from <l.stach@pengutronix.de>)
        id 1iosU9-00057y-AG; Tue, 07 Jan 2020 18:17:41 +0100
From:   Lucas Stach <l.stach@pengutronix.de>
To:     Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc:     linux-input@vger.kernel.org, patchwork-lst@pengutronix.de,
        kernel@pengutronix.de, Chris Healy <cphealy@gmail.com>
Subject: [PATCH 1/4] Input: exc3000: split MT event handling from IRQ handler
Date:   Tue,  7 Jan 2020 18:17:37 +0100
Message-Id: <20200107171741.10856-1-l.stach@pengutronix.de>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2001:67c:670:100:1d::28
X-SA-Exim-Mail-From: l.stach@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-input@vger.kernel.org
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Split out the multitouch event handling into its own function to allow other
events to be handled in the IRQ handler without disturbing the MT handling.

Signed-off-by: Lucas Stach <l.stach@pengutronix.de>
---
 drivers/input/touchscreen/exc3000.c | 92 +++++++++++++++++------------
 1 file changed, 54 insertions(+), 38 deletions(-)

diff --git a/drivers/input/touchscreen/exc3000.c b/drivers/input/touchscreen/exc3000.c
index e007e2e8f626..3458d02310dd 100644
--- a/drivers/input/touchscreen/exc3000.c
+++ b/drivers/input/touchscreen/exc3000.c
@@ -58,6 +58,11 @@ static void exc3000_timer(struct timer_list *t)
 	input_sync(data->input);
 }
 
+static inline void exc3000_schedule_timer(struct exc3000_data *data)
+{
+	mod_timer(&data->timer, jiffies + msecs_to_jiffies(EXC3000_TIMEOUT_MS));
+}
+
 static int exc3000_read_frame(struct i2c_client *client, u8 *buf)
 {
 	int ret;
@@ -76,54 +81,35 @@ static int exc3000_read_frame(struct i2c_client *client, u8 *buf)
 	if (ret != EXC3000_LEN_FRAME)
 		return -EIO;
 
-	if (get_unaligned_le16(buf) != EXC3000_LEN_FRAME ||
-			buf[2] != EXC3000_MT_EVENT)
+	if (get_unaligned_le16(buf) != EXC3000_LEN_FRAME)
 		return -EINVAL;
 
 	return 0;
 }
 
-static int exc3000_read_data(struct i2c_client *client,
-			     u8 *buf, int *n_slots)
+static int exc3000_handle_mt_event(struct exc3000_data *data)
 {
-	int error;
-
-	error = exc3000_read_frame(client, buf);
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
-		error = exc3000_read_frame(client, buf + EXC3000_LEN_FRAME);
-		if (error)
-			return error;
+		ret = exc3000_read_frame(data->client, buf + EXC3000_LEN_FRAME);
+		if (ret)
+			goto out_fail;
 
 		/* 2nd chunk must have number of contacts set to 0. */
-		if (buf[EXC3000_LEN_FRAME + 3] != 0)
-			return -EINVAL;
-	}
-
-	return 0;
-}
-
-static irqreturn_t exc3000_interrupt(int irq, void *dev_id)
-{
-	struct exc3000_data *data = dev_id;
-	struct input_dev *input = data->input;
-	u8 *buf = data->buf;
-	int slots, total_slots;
-	int error;
-
-	error = exc3000_read_data(data->client, buf, &total_slots);
-	if (error) {
-		/* Schedule a timer to release "stuck" contacts */
-		mod_timer(&data->timer,
-			  jiffies + msecs_to_jiffies(EXC3000_TIMEOUT_MS));
-		goto out;
+		if (buf[EXC3000_LEN_FRAME + 3] != 0) {
+			ret = -EINVAL;
+			goto out_fail;
+		}
 	}
 
 	/*
@@ -132,7 +118,7 @@ static irqreturn_t exc3000_interrupt(int irq, void *dev_id)
 	del_timer_sync(&data->timer);
 
 	while (total_slots > 0) {
-		slots = min(total_slots, EXC3000_SLOTS_PER_FRAME);
+		int slots = min(total_slots, EXC3000_SLOTS_PER_FRAME);
 		exc3000_report_slots(input, &data->prop, buf + 4, slots);
 		total_slots -= slots;
 		buf += EXC3000_LEN_FRAME;
@@ -141,6 +127,36 @@ static irqreturn_t exc3000_interrupt(int irq, void *dev_id)
 	input_mt_sync_frame(input);
 	input_sync(input);
 
+	return 0;
+
+out_fail:
+	/* Schedule a timer to release "stuck" contacts */
+	exc3000_schedule_timer(data);
+
+	return ret;
+}
+
+static irqreturn_t exc3000_interrupt(int irq, void *dev_id)
+{
+	struct exc3000_data *data = dev_id;
+	u8 *buf = data->buf;
+	int ret;
+
+	ret = exc3000_read_frame(data->client, buf);
+	if (ret) {
+		/* Schedule a timer to release "stuck" contacts */
+		exc3000_schedule_timer(data);
+		goto out;
+	}
+
+	switch (buf[2]) {
+		case EXC3000_MT_EVENT:
+			exc3000_handle_mt_event(data);
+			break;
+		default:
+			break;
+	}
+
 out:
 	return IRQ_HANDLED;
 }
-- 
2.20.1

