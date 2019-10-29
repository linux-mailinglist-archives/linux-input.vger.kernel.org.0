Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0B8B1E8263
	for <lists+linux-input@lfdr.de>; Tue, 29 Oct 2019 08:25:15 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387635AbfJ2HWv (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 29 Oct 2019 03:22:51 -0400
Received: from esa1.mentor.iphmx.com ([68.232.129.153]:7825 "EHLO
        esa1.mentor.iphmx.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729031AbfJ2HWu (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Tue, 29 Oct 2019 03:22:50 -0400
IronPort-SDR: AOKHmGCsuXQCe2SCcVgGOX1GXG5kNolUw3FoifWkF2qZ4pAJcsxfsm78TdAbnMQ/2zz/9oH8eJ
 3L4SVVObeBSWnLFdb9+kPDFt2+oyiqLuthumFi2drhQucgcs/vFS72XJ5789gUZdYBJflll62A
 r4wEoXsnEzMrS+As9ALwyavC0ygD6w/JBUWcFDa423CW3v81BbPNW1W1oE6CJ2WNpYTze5JKfo
 B7uMkFJT37e5envScFUB3/dYNRcsxa9Pu4EPruMNLGfIgzc7YMgcDUDbyaEvYYyoX76V9xMwjI
 hVA=
X-IronPort-AV: E=Sophos;i="5.68,243,1569312000"; 
   d="scan'208";a="44509454"
Received: from orw-gwy-01-in.mentorg.com ([192.94.38.165])
  by esa1.mentor.iphmx.com with ESMTP; 28 Oct 2019 23:22:49 -0800
IronPort-SDR: +Wp8Cec/arNWvPmqcY3afo59jpyyL4fSRjfxa0vpj402rAar2gTv/CmAbHKfxR0yKnxsZUkeES
 7+bDkGCvHxJ4WGgkRXkTxjl+MoPICZei1Gqfu3l7UuW18Jr/y5mWod6XvD24/vxxJCZAKNeeWy
 ntBEwtVMdj0Xgf4DxMDukviicXW948hU72c2o33CjykW0+wGJriK/zeVhIUPgPv9EQf+Mzc1cN
 LNm6Pq18KTRbdaUT7P/l67t3GCRz89ojA8M0eT8BSgfGDnS8ZMQrMuQwvVHWosIixSWiE7gn6x
 Pos=
From:   Jiada Wang <jiada_wang@mentor.com>
To:     <jikos@kernel.org>, <benjamin.tissoires@redhat.com>,
        <rydberg@bitmath.org>, <dmitry.torokhov@gmail.com>
CC:     <linux-input@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <jiada_wang@mentor.com>, <erosca@de.adit-jv.com>,
        <Andrew_Gabbasov@mentor.com>
Subject: [PATCH v4 43/48] Input: Atmel: use T44 object to process T5 messages
Date:   Tue, 29 Oct 2019 16:20:05 +0900
Message-ID: <20191029072010.8492-44-jiada_wang@mentor.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20191029072010.8492-1-jiada_wang@mentor.com>
References: <20191029072010.8492-1-jiada_wang@mentor.com>
MIME-Version: 1.0
Content-Type: text/plain
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
index 7a5b0bd4b82e..700b7228e133 100644
--- a/drivers/input/touchscreen/atmel_mxt_ts.c
+++ b/drivers/input/touchscreen/atmel_mxt_ts.c
@@ -1489,7 +1489,7 @@ static u8 mxt_max_msg_read_count(struct mxt_data *data, u8 max_T5_msg_count)
 	return min(T5_msg_count_limit, max_T5_msg_count);
 }
 
-static irqreturn_t mxt_process_messages_t44(struct mxt_data *data)
+static int mxt_process_messages_t44(struct mxt_data *data)
 {
 	struct device *dev = &data->client->dev;
 	int ret;
@@ -1502,7 +1502,7 @@ static irqreturn_t mxt_process_messages_t44(struct mxt_data *data)
 		data->T5_msg_size + 1, data->msg_buf);
 	if (ret) {
 		dev_err(dev, "Failed to read T44 and T5 (%d)\n", ret);
-		return IRQ_NONE;
+		return ret;
 	}
 
 	T5_msg_count = data->msg_buf[0];
@@ -1512,7 +1512,7 @@ static irqreturn_t mxt_process_messages_t44(struct mxt_data *data)
 	 * Mode 0. It results in unnecessary I2C operations but it is benign.
 	 */
 	if (!T5_msg_count)
-		return IRQ_NONE;
+		return processed_valid;
 
 	if (T5_msg_count > data->max_reportid) {
 		dev_warn(dev, "T44 count %d exceeded max report id\n",
@@ -1524,12 +1524,14 @@ static irqreturn_t mxt_process_messages_t44(struct mxt_data *data)
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
@@ -1553,7 +1555,7 @@ static irqreturn_t mxt_process_messages_t44(struct mxt_data *data)
 		data->update_input = false;
 	}
 
-	return IRQ_HANDLED;
+	return processed_valid;
 }
 
 static int mxt_process_messages_until_invalid(struct mxt_data *data)
@@ -1583,7 +1585,7 @@ static int mxt_process_messages_until_invalid(struct mxt_data *data)
 	return -EBUSY;
 }
 
-static irqreturn_t mxt_process_messages(struct mxt_data *data)
+static int mxt_process_messages(struct mxt_data *data)
 {
 	int total_handled, num_handled;
 	u8 count = data->last_message_count;
@@ -1594,7 +1596,7 @@ static irqreturn_t mxt_process_messages(struct mxt_data *data)
 	/* include final invalid message */
 	total_handled = mxt_read_and_process_messages(data, count + 1);
 	if (total_handled < 0)
-		return IRQ_NONE;
+		return total_handled;
 	/* if there were invalid messages, then we are done */
 	else if (total_handled <= count)
 		goto update_count;
@@ -1603,7 +1605,7 @@ static irqreturn_t mxt_process_messages(struct mxt_data *data)
 	do {
 		num_handled = mxt_read_and_process_messages(data, 2);
 		if (num_handled < 0)
-			return IRQ_NONE;
+			return num_handled;
 
 		total_handled += num_handled;
 
@@ -1619,12 +1621,13 @@ static irqreturn_t mxt_process_messages(struct mxt_data *data)
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
@@ -1632,17 +1635,22 @@ static irqreturn_t mxt_interrupt(int irq, void *dev_id)
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
@@ -1777,8 +1785,11 @@ static int mxt_acquire_irq(struct mxt_data *data)
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
 
@@ -4032,8 +4043,12 @@ static int mxt_start(struct mxt_data *data)
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
2.17.1

