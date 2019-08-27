Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 050B79DE10
	for <lists+linux-input@lfdr.de>; Tue, 27 Aug 2019 08:31:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725874AbfH0Gbg (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 27 Aug 2019 02:31:36 -0400
Received: from esa3.mentor.iphmx.com ([68.232.137.180]:48291 "EHLO
        esa3.mentor.iphmx.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728490AbfH0Gbc (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Tue, 27 Aug 2019 02:31:32 -0400
IronPort-SDR: EEOWEAhF8Tz+4xsocjXZxObBJMhC1juwF7w8Y8BX5zbbWpeqtkTVxdxoEZhaxmtAljx+PhAB4t
 w3WZsHsHVWgT7WIRaUQJN4StDfrg0gfJdsWzMSoXZQDmg+pBdMrn9ZbGWzt9bmhMTW0IM9ULGh
 j9JK85OVEp74YxzOqOcIxAV9Dh4ZpH+5EcPPI5s0x6kUZxY1OdbW8epXaqBhXuSEQYcvXkeT9+
 aYcyuqBkW46kjHYn9clTrIgLnivR9/QnXWboA/QF38hJ5VoOBebwL5tJRgeG1aDxUk1HR15ob+
 bCo=
X-IronPort-AV: E=Sophos;i="5.64,436,1559548800"; 
   d="scan'208";a="40784649"
Received: from orw-gwy-02-in.mentorg.com ([192.94.38.167])
  by esa3.mentor.iphmx.com with ESMTP; 26 Aug 2019 22:31:31 -0800
IronPort-SDR: QHAUXMWDp/WUtbslHI+JxrxNvt5oCb4sTZQJa/PL24TiEF/5wMJku4CtF263hTUnvlqtVcfEWJ
 TE54F+xojfHJu4rxvw91+LgUus4NJc5QoCeqpqD2ZnXM8yyvjWJKZeUXIWk5qJbbm4YIKTzhUw
 TPuMHnk5+A38qNACpA+/bfBqvfpVV3zYFJlKSjY069vloI9joIfFv4O2IppQPQxDwiKSlVsA9W
 L2lG0QaskE7PvQuxKae3sic+wwah2bv4vsgt3AUSe8hnJuP7kvmrvzFbjIDKB09Wq0t+qET6Ru
 4no=
From:   Jiada Wang <jiada_wang@mentor.com>
To:     <nick@shmanahar.org>, <dmitry.torokhov@gmail.com>
CC:     <linux-input@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <jiada_wang@mentor.com>, <george_davis@mentor.com>
Subject: [PATCH v2 44/49] Input: Atmel: use T44 object to process T5 messages
Date:   Tue, 27 Aug 2019 15:31:25 +0900
Message-ID: <20190827063130.20969-5-jiada_wang@mentor.com>
X-Mailer: git-send-email 2.19.2
In-Reply-To: <20190827063130.20969-1-jiada_wang@mentor.com>
References: <20190827063130.20969-1-jiada_wang@mentor.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7BIT
Content-Type:   text/plain; charset=US-ASCII
X-ClientProxiedBy: SVR-ORW-MBX-09.mgc.mentorg.com (147.34.90.209) To
 svr-orw-mbx-03.mgc.mentorg.com (147.34.90.203)
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

From: Deepak Das <deepak_das@mentor.com>

T44 object returns the count of valid T5 messages in the buffer. According
to atmel, this count should be the main criteria to read the number of T5
messages.

Following is the statement from atmel confirming the same :-
"For the readout of messages we recommend to stop after the last message
is read out from the buffer. One way to identify the amount of new messages
is to read T44. The other way is to monitor the /CHG line which indicates
independent of mode 0 or mode 1 if there are still data in the buffer.
0xFF indicates that there is no message pending anymore, but it is not
recommended to use this as the main criteria to control the
data transfer."

This commit modifies the logic to readout the T5 messages on the basis
of T44 object.

Signed-off-by: Deepak Das <deepak_das@mentor.com>
Signed-off-by: Sanjeev Chugh <sanjeev_chugh@mentor.com>
Signed-off-by: George G. Davis <george_davis@mentor.com>
Signed-off-by: Jiada Wang <jiada_wang@mentor.com>
---
 drivers/input/touchscreen/atmel_mxt_ts.c | 55 +++++++++++++++---------
 1 file changed, 35 insertions(+), 20 deletions(-)

diff --git a/drivers/input/touchscreen/atmel_mxt_ts.c b/drivers/input/touchscreen/atmel_mxt_ts.c
index b6f50fee3695..58e54eb45cf0 100644
--- a/drivers/input/touchscreen/atmel_mxt_ts.c
+++ b/drivers/input/touchscreen/atmel_mxt_ts.c
@@ -1486,7 +1486,7 @@ static u8 mxt_max_msg_read_count(struct mxt_data *data, u8 max_T5_msg_count)
 	return min(T5_msg_count_limit, max_T5_msg_count);
 }
 
-static irqreturn_t mxt_process_messages_t44(struct mxt_data *data)
+static int mxt_process_messages_t44(struct mxt_data *data)
 {
 	struct device *dev = &data->client->dev;
 	int ret;
@@ -1499,7 +1499,7 @@ static irqreturn_t mxt_process_messages_t44(struct mxt_data *data)
 		data->T5_msg_size + 1, data->msg_buf);
 	if (ret) {
 		dev_err(dev, "Failed to read T44 and T5 (%d)\n", ret);
-		return IRQ_NONE;
+		return ret;
 	}
 
 	T5_msg_count = data->msg_buf[0];
@@ -1509,7 +1509,7 @@ static irqreturn_t mxt_process_messages_t44(struct mxt_data *data)
 	 * Mode 0. It results in unnecessary I2C operations but it is benign.
 	 */
 	if (!T5_msg_count)
-		return IRQ_NONE;
+		return processed_valid;
 
 	if (T5_msg_count > data->max_reportid) {
 		dev_warn(dev, "T44 count %d exceeded max report id\n",
@@ -1521,12 +1521,14 @@ static irqreturn_t mxt_process_messages_t44(struct mxt_data *data)
 	ret = mxt_proc_message(data, data->msg_buf + 1);
 	if (ret < 0) {
 		dev_warn(dev, "Unexpected invalid message\n");
-		return IRQ_NONE;
+		return ret;
 	}
 
 	total_pending = T5_msg_count - 1;
-	if (!total_pending)
+	if (!total_pending) {
+		processed_valid = 1;
 		goto end;
+	}
 
 	/* Process remaining messages if necessary */
 	T5_msg_count = mxt_max_msg_read_count(data, total_pending);
@@ -1550,7 +1552,7 @@ static irqreturn_t mxt_process_messages_t44(struct mxt_data *data)
 		data->update_input = false;
 	}
 
-	return IRQ_HANDLED;
+	return processed_valid;
 }
 
 static int mxt_process_messages_until_invalid(struct mxt_data *data)
@@ -1580,7 +1582,7 @@ static int mxt_process_messages_until_invalid(struct mxt_data *data)
 	return -EBUSY;
 }
 
-static irqreturn_t mxt_process_messages(struct mxt_data *data)
+static int mxt_process_messages(struct mxt_data *data)
 {
 	int total_handled, num_handled;
 	u8 count = data->last_message_count;
@@ -1591,7 +1593,7 @@ static irqreturn_t mxt_process_messages(struct mxt_data *data)
 	/* include final invalid message */
 	total_handled = mxt_read_and_process_messages(data, count + 1);
 	if (total_handled < 0)
-		return IRQ_NONE;
+		return total_handled;
 	/* if there were invalid messages, then we are done */
 	else if (total_handled <= count)
 		goto update_count;
@@ -1600,7 +1602,7 @@ static irqreturn_t mxt_process_messages(struct mxt_data *data)
 	do {
 		num_handled = mxt_read_and_process_messages(data, 2);
 		if (num_handled < 0)
-			return IRQ_NONE;
+			return num_handled;
 
 		total_handled += num_handled;
 
@@ -1616,12 +1618,13 @@ static irqreturn_t mxt_process_messages(struct mxt_data *data)
 		data->update_input = false;
 	}
 
-	return IRQ_HANDLED;
+	return total_handled;
 }
 
 static irqreturn_t mxt_interrupt(int irq, void *dev_id)
 {
 	struct mxt_data *data = dev_id;
+	int ret;
 
 	if (data->in_bootloader) {
 		complete(&data->chg_completion);
@@ -1629,17 +1632,22 @@ static irqreturn_t mxt_interrupt(int irq, void *dev_id)
 		if (data->flash && &data->flash->work)
 			cancel_delayed_work_sync(&data->flash->work);
 
-		return IRQ_RETVAL(mxt_check_bootloader(data));
+		ret = mxt_check_bootloader(data);
+		return IRQ_RETVAL(ret);
 	}
 
 	if (!data->object_table)
 		return IRQ_HANDLED;
 
-	if (data->T44_address) {
-		return mxt_process_messages_t44(data);
-	} else {
-		return mxt_process_messages(data);
-	}
+	if (data->T44_address)
+		ret = mxt_process_messages_t44(data);
+	else
+		ret = mxt_process_messages(data);
+
+	if (ret <= 0)
+		return IRQ_NONE;
+	else
+		return IRQ_HANDLED;
 }
 
 static int mxt_t6_command(struct mxt_data *data, u16 cmd_offset,
@@ -1774,8 +1782,11 @@ static int mxt_acquire_irq(struct mxt_data *data)
 	}
 
 	if (data->object_table && data->use_retrigen_workaround) {
-		error = mxt_process_messages_until_invalid(data);
-		if (error)
+		if (data->T44_address)
+			error = mxt_process_messages_t44(data);
+		else
+			error = mxt_process_messages_until_invalid(data);
+		if (error < 0)
 			return error;
 	}
 
@@ -4029,8 +4040,12 @@ static int mxt_start(struct mxt_data *data)
 		 * Discard any touch messages still in message buffer
 		 * from before chip went to sleep
 		 */
-		ret = mxt_process_messages_until_invalid(data);
-		if (ret)
+
+		if (data->T44_address)
+			ret = mxt_process_messages_t44(data);
+		else
+			ret = mxt_process_messages_until_invalid(data);
+		if (ret < 0)
 			break;
 
 		ret = mxt_set_t7_power_cfg(data, MXT_POWER_CFG_RUN);
-- 
2.19.2

