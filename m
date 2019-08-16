Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 86B208FE0D
	for <lists+linux-input@lfdr.de>; Fri, 16 Aug 2019 10:38:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727205AbfHPIh4 (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Fri, 16 Aug 2019 04:37:56 -0400
Received: from esa4.mentor.iphmx.com ([68.232.137.252]:36144 "EHLO
        esa4.mentor.iphmx.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727181AbfHPIh4 (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Fri, 16 Aug 2019 04:37:56 -0400
IronPort-SDR: bgvJ/zGfzl/oD5lk5hK5EOqp8mZs+/bYW9qg0H29y3kEO2ZzmDbUigW93uY6NC6InZkaSjGiaJ
 pWUK+BuWAKoTEiu8zXzOpwEgubWh8o/TuCLxr0lxco5TZ/UVPpPP+k9iLeVNpWxrvJfYWE9V4i
 mtUCTvY8WPETPlf9MInE2pfFwbRC6S426sWR+4cLks0ji5tOAxg2tRdnQRWVuSULxhk5U5H54f
 vwNkFkHW27t7CVV1FT97BP4u6N2P/icNthXr6ymYdq/ORCQB8OaX/VRQAzj4EffBS9CkOiPL8P
 blg=
X-IronPort-AV: E=Sophos;i="5.64,391,1559548800"; 
   d="scan'208";a="40519181"
Received: from orw-gwy-02-in.mentorg.com ([192.94.38.167])
  by esa4.mentor.iphmx.com with ESMTP; 16 Aug 2019 00:37:55 -0800
IronPort-SDR: GPw+wC209HsqFyicUM27L+jSADY4Ixo4iZ6cDMomnkYofnscTVnPDaH2eUTFTKl5ydApy3umrD
 k6M1usY8O0K4vRBWjzG0cINkJ/ufZgQ0Is84dRP2JRO0XWEHZVnJAn4G1EAKipUHZZQboI2vJg
 FdQJ5FUOd7FZNtSAcFBIMFg1JPq3Q6fWHasKdb5aouZUzbYnyxquiLyOF3HnMMif9bgVNBP7Vv
 Lj8dj2akJJl2WNwAeWYaD/zj4VngDPxrRyknXtzUzQzIa+z47Gxkhffv/oOOywgcdiykq7g3fB
 jm4=
From:   Jiada Wang <jiada_wang@mentor.com>
To:     <nick@shmanahar.org>, <dmitry.torokhov@gmail.com>
CC:     <linux-input@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <jiada_wang@mentor.com>, <george_davis@mentor.com>
Subject: [PATCH v1 52/63] Input: Atmel: use T44 object to process T5 messages
Date:   Fri, 16 Aug 2019 17:37:46 +0900
Message-ID: <20190816083757.19449-3-jiada_wang@mentor.com>
X-Mailer: git-send-email 2.19.2
In-Reply-To: <20190816083757.19449-1-jiada_wang@mentor.com>
References: <20190816083757.19449-1-jiada_wang@mentor.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7BIT
Content-Type:   text/plain; charset=US-ASCII
X-ClientProxiedBy: svr-orw-mbx-02.mgc.mentorg.com (147.34.90.202) To
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
index 47c1e72152de..5c980e74e6b0 100644
--- a/drivers/input/touchscreen/atmel_mxt_ts.c
+++ b/drivers/input/touchscreen/atmel_mxt_ts.c
@@ -1491,7 +1491,7 @@ static u8 mxt_max_msg_read_count(struct mxt_data *data, u8 max_T5_msg_count)
 	return min(T5_msg_count_limit, max_T5_msg_count);
 }
 
-static irqreturn_t mxt_process_messages_t44(struct mxt_data *data)
+static int mxt_process_messages_t44(struct mxt_data *data)
 {
 	struct device *dev = &data->client->dev;
 	int ret;
@@ -1504,7 +1504,7 @@ static irqreturn_t mxt_process_messages_t44(struct mxt_data *data)
 		data->T5_msg_size + 1, data->msg_buf);
 	if (ret) {
 		dev_err(dev, "Failed to read T44 and T5 (%d)\n", ret);
-		return IRQ_NONE;
+		return ret;
 	}
 
 	T5_msg_count = data->msg_buf[0];
@@ -1514,7 +1514,7 @@ static irqreturn_t mxt_process_messages_t44(struct mxt_data *data)
 	 * Mode 0. It results in unnecessary I2C operations but it is benign.
 	 */
 	if (!T5_msg_count)
-		return IRQ_NONE;
+		return processed_valid;
 
 	if (T5_msg_count > data->max_reportid) {
 		dev_warn(dev, "T44 count %d exceeded max report id\n",
@@ -1526,12 +1526,14 @@ static irqreturn_t mxt_process_messages_t44(struct mxt_data *data)
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
@@ -1555,7 +1557,7 @@ static irqreturn_t mxt_process_messages_t44(struct mxt_data *data)
 		data->update_input = false;
 	}
 
-	return IRQ_HANDLED;
+	return processed_valid;
 }
 
 static int mxt_process_messages_until_invalid(struct mxt_data *data)
@@ -1585,7 +1587,7 @@ static int mxt_process_messages_until_invalid(struct mxt_data *data)
 	return -EBUSY;
 }
 
-static irqreturn_t mxt_process_messages(struct mxt_data *data)
+static int mxt_process_messages(struct mxt_data *data)
 {
 	int total_handled, num_handled;
 	u8 count = data->last_message_count;
@@ -1596,7 +1598,7 @@ static irqreturn_t mxt_process_messages(struct mxt_data *data)
 	/* include final invalid message */
 	total_handled = mxt_read_and_process_messages(data, count + 1);
 	if (total_handled < 0)
-		return IRQ_NONE;
+		return total_handled;
 	/* if there were invalid messages, then we are done */
 	else if (total_handled <= count)
 		goto update_count;
@@ -1605,7 +1607,7 @@ static irqreturn_t mxt_process_messages(struct mxt_data *data)
 	do {
 		num_handled = mxt_read_and_process_messages(data, 2);
 		if (num_handled < 0)
-			return IRQ_NONE;
+			return num_handled;
 
 		total_handled += num_handled;
 
@@ -1621,12 +1623,13 @@ static irqreturn_t mxt_process_messages(struct mxt_data *data)
 		data->update_input = false;
 	}
 
-	return IRQ_HANDLED;
+	return total_handled;
 }
 
 static irqreturn_t mxt_interrupt(int irq, void *dev_id)
 {
 	struct mxt_data *data = dev_id;
+	int ret;
 
 	complete(&data->chg_completion);
 
@@ -1634,17 +1637,22 @@ static irqreturn_t mxt_interrupt(int irq, void *dev_id)
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
@@ -1779,8 +1787,11 @@ static int mxt_acquire_irq(struct mxt_data *data)
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
 
@@ -4116,8 +4127,12 @@ static int mxt_start(struct mxt_data *data)
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

