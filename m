Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6C061B4AC2
	for <lists+linux-input@lfdr.de>; Tue, 17 Sep 2019 11:38:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728231AbfIQJhp (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 17 Sep 2019 05:37:45 -0400
Received: from esa4.mentor.iphmx.com ([68.232.137.252]:22003 "EHLO
        esa4.mentor.iphmx.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725901AbfIQJhp (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Tue, 17 Sep 2019 05:37:45 -0400
IronPort-SDR: wr18YouDz7Re/+PQopFVlU7B3QEae4tUE+bfAWs9Ef4oqrvc93dLDB+6th1TwDuM+0d40l/NSu
 RVhQSw1AwJfKJ1VE+Ont2dxxHMe5o7I2lcd6LBT8wFo9KmEx2N1cYsA/VVHhYdi5G1Mc6sVoRM
 8RF9LAhikeR31vaukboneXl4x4Unr1bK6UHGv8euDPvIDl5ue6m7ja3YxnllhCAK9Lo2n0h7ou
 0UjlfirN4Bx9Erw7CYAi06MWar7ly1vM21Ja2do9A3N8awwwUd8YuBia4fXk62ueqNtAmOUprc
 epA=
X-IronPort-AV: E=Sophos;i="5.64,515,1559548800"; 
   d="scan'208";a="41423049"
Received: from orw-gwy-01-in.mentorg.com ([192.94.38.165])
  by esa4.mentor.iphmx.com with ESMTP; 17 Sep 2019 01:37:44 -0800
IronPort-SDR: bW9zARLfC4VtpkTPsQmeYP72+/xC617BnjeNFZ7nRNio36OWLbF9n8szpuP4sBvtvoLvyS/FZu
 dSSAl/UjpGkI9IYs4PqZMZuvSZiafBwRJa/Y6lK4hR4G54df9aoL5aGnxLT8ltbee7pbQ0jaDc
 GJHP9onjJGttaLR1FdZcbW1yhTegcmt39TFEOvMfNvhm1hjPkI8xqRRj0tMaCx2Ntb5QQ0WwX0
 VA9fypK5abe3NaX2fzMDXL3c5RHmzHEI0AvMNNcrvgIeUdhO/6I2nCCGL7IhVZtgCI/GsKaguJ
 nDQ=
From:   Jiada Wang <jiada_wang@mentor.com>
To:     <nick@shmanahar.org>, <dmitry.torokhov@gmail.com>,
        <jikos@kernel.org>, <benjamin.tissoires@redhat.com>,
        <rydberg@bitmath.org>
CC:     <linux-input@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <jiada_wang@mentor.com>
Subject: [PATCH v3 13/49] Input: atmel_mxt_ts - release touch state during suspend
Date:   Tue, 17 Sep 2019 18:36:28 +0900
Message-ID: <20190917093704.18439-4-jiada_wang@mentor.com>
X-Mailer: git-send-email 2.19.2
In-Reply-To: <20190917093704.18439-1-jiada_wang@mentor.com>
References: <20190917093704.18439-1-jiada_wang@mentor.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7BIT
Content-Type:   text/plain; charset=US-ASCII
X-ClientProxiedBy: SVR-ORW-MBX-09.mgc.mentorg.com (147.34.90.209) To
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
index 9dae1c2dd9d9..062383c3616a 100644
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

