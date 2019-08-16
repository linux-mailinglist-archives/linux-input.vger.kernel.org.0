Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 68CAB8FE42
	for <lists+linux-input@lfdr.de>; Fri, 16 Aug 2019 10:40:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727536AbfHPIjX (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Fri, 16 Aug 2019 04:39:23 -0400
Received: from esa2.mentor.iphmx.com ([68.232.141.98]:1996 "EHLO
        esa2.mentor.iphmx.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727533AbfHPIjW (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Fri, 16 Aug 2019 04:39:22 -0400
IronPort-SDR: X0FCrFFjgNuzHFsqsny/Ydr5FtjKoMxYY2W+p7odMDk5Ew21UllshHYnrAgSJfg/KFAz518lNk
 iBUpvTycJbSDS+lxi7DUH1Yfmk548bl2SPH79YZRsS6UndYB/BaVpb3C4Omp1gwk4aC09tQUdk
 lX3K9x3/MR+Gqf23f9y8ss4bvF2D0RgWcJ2Og1rOfHYLTlj4neQhfb4NQc+bnAliYvneyUjJz+
 +InV/g9HGcjnFYF395G7kYpjMbyZUVjV00inNL0OPbP2kqSW06jrqYZPqkOQt24rrZtlsiNSlp
 66A=
X-IronPort-AV: E=Sophos;i="5.64,391,1559548800"; 
   d="scan'208";a="40484220"
Received: from orw-gwy-02-in.mentorg.com ([192.94.38.167])
  by esa2.mentor.iphmx.com with ESMTP; 16 Aug 2019 00:32:16 -0800
IronPort-SDR: 5U55ITH8BqutNbmluY/ffXup0OqEclZpA4b+GkHc/8wGLBCTJvZZA8eT48MQHTqdrs8dmSaNbL
 DAm0dfiHRsOKZ74yWEbscX/fie4FvrtB9G1a4F8is3DmeU2XoRWE0tSOQT8Ir3Ex6VOk27yWmA
 u03FpNLOKGzx+jur3CarKww7W7rvqIrOt5t+F6XYeq7BB1ZVuzXnwmhska8ejW85XfmWI4x6rJ
 8E6f43i+tosCzmsChNlQcsgC/66ghGpXU7tXLalOJdvGjHaVEyw04p9Ld+KrKhGdWvYFZmh512
 UZM=
From:   Jiada Wang <jiada_wang@mentor.com>
To:     <nick@shmanahar.org>, <dmitry.torokhov@gmail.com>
CC:     <linux-input@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <jiada_wang@mentor.com>, <george_davis@mentor.com>
Subject: [PATCH v1 12/63] Input: atmel_mxt_ts - release touch state during suspend
Date:   Fri, 16 Aug 2019 17:31:27 +0900
Message-ID: <20190816083218.18402-3-jiada_wang@mentor.com>
X-Mailer: git-send-email 2.19.2
In-Reply-To: <20190816083218.18402-1-jiada_wang@mentor.com>
References: <20190816083218.18402-1-jiada_wang@mentor.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7BIT
Content-Type:   text/plain; charset=US-ASCII
X-ClientProxiedBy: svr-orw-mbx-03.mgc.mentorg.com (147.34.90.203) To
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
index 8f7e1aa01f39..515882df5509 100644
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
@@ -1150,10 +1153,10 @@ static int mxt_proc_message(struct mxt_data *data, u8 *message)
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
@@ -3131,6 +3134,11 @@ static int mxt_load_fw(struct device *dev, const char *fn)
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
@@ -3302,8 +3310,27 @@ static void mxt_sysfs_remove(struct mxt_data *data)
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
@@ -3316,16 +3343,29 @@ static void mxt_start(struct mxt_data *data)
 
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
@@ -3335,9 +3375,15 @@ static void mxt_stop(struct mxt_data *data)
 
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

