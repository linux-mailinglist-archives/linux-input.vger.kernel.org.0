Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 8488915A3C3
	for <lists+linux-input@lfdr.de>; Wed, 12 Feb 2020 09:47:46 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728546AbgBLIrm (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 12 Feb 2020 03:47:42 -0500
Received: from esa4.mentor.iphmx.com ([68.232.137.252]:19935 "EHLO
        esa4.mentor.iphmx.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728516AbgBLIrm (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Wed, 12 Feb 2020 03:47:42 -0500
X-Greylist: delayed 300 seconds by postgrey-1.27 at vger.kernel.org; Wed, 12 Feb 2020 03:47:41 EST
IronPort-SDR: +rUH2bqzuA/8uo96vtkjXcs0X86bSI4KiasoTqKLnRCZpqIfiJ7YuaVMPcOmIA1hN3pL9zlQ2t
 Kx8/y9xLuAcbJtOOYu0lKJBsX+BqCgR11QBJLfGXYCGMbcigR+QESLOrTGdxo2bFWPL13anhUW
 iRTLl8iSUYsdMgf3sQVyfpwp2P0D4wMi3BPAjd0o9mpuIO1PrrioHlfKLNY+1jhFdF4w0t/xwo
 +ZZfTT33pJ0l3s3Esh41xHU8dAF7VjuuSpYbLy9m6uvKu4wSLys5JVSqyg3z23slRdmxTQS6IU
 7g8=
X-IronPort-AV: E=Sophos;i="5.70,428,1574150400"; 
   d="scan'208";a="45799420"
Received: from orw-gwy-02-in.mentorg.com ([192.94.38.167])
  by esa4.mentor.iphmx.com with ESMTP; 12 Feb 2020 00:47:41 -0800
IronPort-SDR: uirdXztlx3o0WV3ad37n+sp8XC9X5NeRU26otPRGvP4Iv4k29+SfERPnXpvpMzxnnhNPfnDL/B
 T+wtzzcCCN2CP2kn3NxBnUr0LM0+fwjyUZAWMcT9OK0vK+IgRizN7BR1wHU6ikG2EKVM42tkM8
 ByJW03Ibn1cD+M7L0dwb22Tb3wjk6UADQGBien3C+sQzboGz3dLvXuHLkaUEIgogRGAN9iQ1Ad
 lTH6GcUSPdsAl8Sk/QH4N3RC6mJ9sIFOqDReLkbaFLFEzVgwNUdXZ9BiYVsLP9F2SlrNW3mCph
 kAs=
From:   Jiada Wang <jiada_wang@mentor.com>
To:     <jikos@kernel.org>, <benjamin.tissoires@redhat.com>,
        <rydberg@bitmath.org>, <dmitry.torokhov@gmail.com>,
        <nick@shmanahar.org>, <bsz@semihalf.com>
CC:     <linux-input@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <erosca@de.adit-jv.com>, <Andrew_Gabbasov@mentor.com>,
        <jiada_wang@mentor.com>
Subject: [PATCH v7 43/48] Input: Atmel: use T44 object to process T5 messages
Date:   Wed, 12 Feb 2020 00:42:13 -0800
Message-ID: <20200212084218.32344-44-jiada_wang@mentor.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200212084218.32344-1-jiada_wang@mentor.com>
References: <20200212084218.32344-1-jiada_wang@mentor.com>
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
index 9e6e916c8d96..fb0941b5bd47 100644
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
2.17.1

