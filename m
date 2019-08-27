Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 42F839DDCA
	for <lists+linux-input@lfdr.de>; Tue, 27 Aug 2019 08:28:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726392AbfH0G15 (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 27 Aug 2019 02:27:57 -0400
Received: from esa1.mentor.iphmx.com ([68.232.129.153]:11303 "EHLO
        esa1.mentor.iphmx.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726125AbfH0G1z (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Tue, 27 Aug 2019 02:27:55 -0400
IronPort-SDR: Pf1Z3TGykqhaR529ZsyhGBC+Fgi26M4TL+rCfu+7aRh9WM5yHTXMYmFjfxHfZzHCqoGdbTUmcB
 b38D/MWjRqTay9RMahEWlYwJUg+saYXJJc1f41YyuYH9M2cvSBoTJuWdTVPRyGpdEnTw0Y75QF
 2GUHAnL1WNq5g7zjE2Uo9MWnEUqMzwIxzQfO6CdocVt2ntBnbiUaG9jsYRvJT2bzTtHBpaAJt6
 NSbhxYkuavj69HdPkJ3TTmYFcwez5/Tjq4AUSr23GlfJgi2sNMCB3L1TmGBt6tBnlkOK1SVoZQ
 QjA=
X-IronPort-AV: E=Sophos;i="5.64,436,1559548800"; 
   d="scan'208";a="42589349"
Received: from orw-gwy-02-in.mentorg.com ([192.94.38.167])
  by esa1.mentor.iphmx.com with ESMTP; 26 Aug 2019 22:27:55 -0800
IronPort-SDR: 6UVFIl3CEmN1jkJ6tBLgiAZZ0MVWjCaEHmBwLsZDFz1LG9D7c1BK9/nvlRT89D2YC+m5wMt4YC
 Z8BVRJUsdxdkDtHcdpqWAL4BrWiccWouOd/1JlJCCq8t5bp1W0XsvlzqFPm8A3dzJx7c0K63Q5
 4NBWzrGI8O87YPPvPm09n7iiK8vH7T54Bz1vXaZFUDcsKWMqIeQ6O6DH1IYqJ2ag3sQ1iDFmUn
 7+cdGThhFeGf1Tk0OPKFWSXAM2IYZWxvLd/5OXcVc+xzVy5vl9GSnPvwczw/Oc00dwOlDSolbw
 FoI=
From:   Jiada Wang <jiada_wang@mentor.com>
To:     <nick@shmanahar.org>, <dmitry.torokhov@gmail.com>
CC:     <linux-input@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <jiada_wang@mentor.com>, <george_davis@mentor.com>
Subject: [PATCH v2 13/49] Input: atmel_mxt_ts - release touch state during suspend
Date:   Tue, 27 Aug 2019 15:27:20 +0900
Message-ID: <20190827062756.20380-4-jiada_wang@mentor.com>
X-Mailer: git-send-email 2.19.2
In-Reply-To: <20190827062756.20380-1-jiada_wang@mentor.com>
References: <20190827062756.20380-1-jiada_wang@mentor.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7BIT
Content-Type:   text/plain; charset=US-ASCII
X-ClientProxiedBy: svr-orw-mbx-08.mgc.mentorg.com (147.34.90.208) To
 svr-orw-mbx-03.mgc.mentorg.com (147.34.90.203)
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

From: Nick Dyer <nick.dyer@itdev.co.uk>

If fingers are down as the MXT chip goes into suspend it does not send a
lift message. In addition, it may not complete its final measurement cycle
immediately, which means touch messages may be received by the interrupt
handler after mxt_stop() has completed.

So:
- disable irq during suspend
- flush any messages created after suspend
- tell app layer that slots were released at suspend

Signed-off-by: Nick Dyer <nick.dyer@itdev.co.uk>
Acked-by: Benson Leung <bleung@chromium.org>
Acked-by: Yufeng Shen <miletus@chromium.org>
(cherry picked from ndyer/linux/for-upstream commit 26794433086dbc7dea18d2f6a1c8d61ab25bcfda)
[gdavis: Resolve forward port conflicts due to applying upstream
	 commit 96a938aa214e ("Input: atmel_mxt_ts - remove platform
	 data support").]
Signed-off-by: George G. Davis <george_davis@mentor.com>
[gdavis: Squash fix from Dirk Behme:
	 - Input: atmel_mxt_ts - remove superfluous data->suspended]
Signed-off-by: Dirk Behme <dirk.behme@de.bosch.com>
---
Notes:
- Squash fix from Dirk Behme:
  + Input: atmel_mxt_ts - remove superfluous data->suspended

    data->suspended is already set to false in mxt_load_fw(), so it's not
    needed here.

Signed-off-by: Jiada Wang <jiada_wang@mentor.com>
---
 drivers/input/touchscreen/atmel_mxt_ts.c | 52 ++++++++++++++++++++++--
 1 file changed, 49 insertions(+), 3 deletions(-)

diff --git a/drivers/input/touchscreen/atmel_mxt_ts.c b/drivers/input/touchscreen/atmel_mxt_ts.c
index 26861252c088..4d28b30c4f76 100644
--- a/drivers/input/touchscreen/atmel_mxt_ts.c
+++ b/drivers/input/touchscreen/atmel_mxt_ts.c
@@ -372,6 +372,9 @@ struct mxt_data {
 	unsigned int t19_num_keys;
 
 	enum mxt_suspend_mode suspend_mode;
+
+	/* Indicates whether device is in suspend */
+	bool suspended;
 };
 
 struct mxt_vb2_buffer {
@@ -1151,10 +1154,10 @@ static int mxt_proc_message(struct mxt_data *data, u8 *message)
 		mxt_proc_t42_messages(data, message);
 	} else if (report_id == data->T48_reportid) {
 		mxt_proc_t48_messages(data, message);
-	} else if (!data->input_dev) {
+	} else if (!data->input_dev || data->suspended) {
 		/*
-		 * Do not report events if input device
-		 * is not yet registered.
+		 * Do not report events if input device is not
+		 * yet registered or returning from suspend
 		 */
 		mxt_dump_message(data, message);
 	} else if (report_id >= data->T9_reportid_min &&
@@ -3135,6 +3138,11 @@ static int mxt_load_fw(struct device *dev, const char *fn)
 	if (ret)
 		goto release_firmware;
 
+	if (data->suspended) {
+		enable_irq(data->irq);
+		data->suspended = false;
+	}
+
 	if (!data->in_bootloader) {
 		/* Change to the bootloader mode */
 		data->in_bootloader = true;
@@ -3306,8 +3314,27 @@ static void mxt_sysfs_remove(struct mxt_data *data)
 	sysfs_remove_group(&client->dev.kobj, &mxt_attr_group);
 }
 
+static void mxt_reset_slots(struct mxt_data *data)
+{
+	struct input_dev *input_dev = data->input_dev;
+	int id;
+
+	if (!input_dev)
+		return;
+
+	for (id = 0; id < data->num_touchids; id++) {
+		input_mt_slot(input_dev, id);
+		input_mt_report_slot_state(input_dev, MT_TOOL_FINGER, 0);
+	}
+
+	mxt_input_sync(data);
+}
+
 static void mxt_start(struct mxt_data *data)
 {
+	if (!data->suspended || data->in_bootloader)
+		return;
+
 	switch (data->suspend_mode) {
 	case MXT_SUSPEND_T9_CTRL:
 		mxt_soft_reset(data);
@@ -3320,16 +3347,29 @@ static void mxt_start(struct mxt_data *data)
 
 	case MXT_SUSPEND_DEEP_SLEEP:
 	default:
+		/*
+		 * Discard any touch messages still in message buffer
+		 * from before chip went to sleep
+		 */
+		mxt_process_messages_until_invalid(data);
+
 		mxt_set_t7_power_cfg(data, MXT_POWER_CFG_RUN);
 
 		/* Recalibrate since chip has been in deep sleep */
 		mxt_t6_command(data, MXT_COMMAND_CALIBRATE, 1, false);
+
+		mxt_acquire_irq(data);
 		break;
 	}
+
+	data->suspended = false;
 }
 
 static void mxt_stop(struct mxt_data *data)
 {
+	if (data->suspended || data->in_bootloader)
+		return;
+
 	switch (data->suspend_mode) {
 	case MXT_SUSPEND_T9_CTRL:
 		/* Touch disable */
@@ -3339,9 +3379,15 @@ static void mxt_stop(struct mxt_data *data)
 
 	case MXT_SUSPEND_DEEP_SLEEP:
 	default:
+		disable_irq(data->irq);
+
 		mxt_set_t7_power_cfg(data, MXT_POWER_CFG_DEEPSLEEP);
+
+		mxt_reset_slots(data);
 		break;
 	}
+
+	data->suspended = true;
 }
 
 static int mxt_input_open(struct input_dev *dev)
-- 
2.19.2

