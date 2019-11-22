Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 5FC58106806
	for <lists+linux-input@lfdr.de>; Fri, 22 Nov 2019 09:27:06 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727071AbfKVI0u (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Fri, 22 Nov 2019 03:26:50 -0500
Received: from esa4.mentor.iphmx.com ([68.232.137.252]:62619 "EHLO
        esa4.mentor.iphmx.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727020AbfKVI0t (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Fri, 22 Nov 2019 03:26:49 -0500
IronPort-SDR: pHJYfNGhEFg1ri6F6ezk2XGXXR3ZQz7TzrLpx6gf6l1Ufa+AtuF6p+Z2JS3prhaht9UR3n8nwp
 sqC3G+z861jY0XptT6+I3WbkEQpFabL6Al88pgBD/998dl+RkVyGr+zhHNOOEV6ACN6f3lxpE8
 rDGfoS5Ns+VZptEQT6tZIMSENUErjreik8b2dwCtfWJV/ZlyeVpNR8ijI87X7J8f6HhelRExIp
 ACUUtCzGBSbuMlS+0Wc1rGwF9YuFS9lONExrjQDjs8whAM5NwmI48lNV6aEXXAPSVwmEzUlo8H
 wYo=
X-IronPort-AV: E=Sophos;i="5.69,229,1571731200"; 
   d="scan'208";a="43457653"
Received: from orw-gwy-02-in.mentorg.com ([192.94.38.167])
  by esa4.mentor.iphmx.com with ESMTP; 22 Nov 2019 00:26:46 -0800
IronPort-SDR: y7Xm8bc6Q1e8ExsbyeO81oiuXSlPMCboYZgkj/R83sYwM7K9DqgPgPDoF3m7o5reQc6kunpscn
 1bkrZbfjJsKlfsG7gHMjSi2mXpZkFn3iRsDQjVd+g9EQjjQRp33dgrGhfxvaO606Q1zY92Sm2X
 b7sQQoMTWlrimyoD7/siZ+WxERUxaNPKl+uQH7IighXownZIJSupn3Cpx5Jk8ZRi9SWMiVnoE0
 m2Ro+t1Ulix06lCP6psACcSW4vCTlwOtYt0upvwFKa4ecDORc8i71KOUprWE+jMavsk4VbgxQf
 sLI=
From:   Jiada Wang <jiada_wang@mentor.com>
To:     <jikos@kernel.org>, <benjamin.tissoires@redhat.com>,
        <rydberg@bitmath.org>, <dmitry.torokhov@gmail.com>,
        <nick@shmanahar.org>
CC:     <linux-input@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <erosca@de.adit-jv.com>, <Andrew_Gabbasov@mentor.com>,
        <jiada_wang@mentor.com>
Subject: [PATCH v6 43/48] Input: Atmel: use T44 object to process T5 messages
Date:   Fri, 22 Nov 2019 17:23:57 +0900
Message-ID: <20191122082402.18173-44-jiada_wang@mentor.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20191122082402.18173-1-jiada_wang@mentor.com>
References: <20191122082402.18173-1-jiada_wang@mentor.com>
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
index 8d6478834fd8..0e4a870fafa5 100644
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
 		if (data->flash)
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

