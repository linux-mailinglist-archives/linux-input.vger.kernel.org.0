Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2CFDCF0FCA
	for <lists+linux-input@lfdr.de>; Wed,  6 Nov 2019 08:05:24 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731429AbfKFHCm (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 6 Nov 2019 02:02:42 -0500
Received: from esa1.mentor.iphmx.com ([68.232.129.153]:18550 "EHLO
        esa1.mentor.iphmx.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726772AbfKFHCk (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Wed, 6 Nov 2019 02:02:40 -0500
IronPort-SDR: cuH4dcwme96P03232Xvbp/m4ejk92vYGxyUkikQRmP28GPNzLXotJUOJSaIZJJOCXvQcwIgMn8
 5B76kgErjxrF7MQwyosRbXD3CmBYMq0aCBVD+D92lvUF1Z/uouC+VkU/SSuMWAkq88elv17fyO
 OhMDECrZMQBuwZXCa/PJRvLYuvcjzgkqVNUe7NQ2ffvoPeBQMsUz28CxS+TyHDvPrTgxExRPwK
 SWvaq/NMIXHLwyg/SrcrrutBcA4xmwwQIABnmqmnxXCZpO545R+TQbfNBpqtBt6pNVWt1Wj11M
 98g=
X-IronPort-AV: E=Sophos;i="5.68,272,1569312000"; 
   d="scan'208";a="44759228"
Received: from orw-gwy-02-in.mentorg.com ([192.94.38.167])
  by esa1.mentor.iphmx.com with ESMTP; 05 Nov 2019 23:02:40 -0800
IronPort-SDR: rGMnjDOz7PJoZc3zDx+z20sngSKDMfELHn+doZXwtLR8jSd3N4Wrgev9xSXUisNJbbsMYuYVtW
 /g83S12WYmkA75He9Tty3xYCT4bFQsDTLSrgeAM7lSdKjIENc00SJlioCyQLLIfsykxof01igY
 JVkwq7a+BCG7tg7hZmbV6LtPqblkOAXuCyYdzcjiAIUcJ1e95Xm0ocj/MJcb3J2u7o4ccXxMxB
 swDMNn6wU0gsNtc9JzoVKSk/WvZe63k60fSy5SsVmG/8MK/iCBHU+lQRkVgkDapPHekbEt1yg1
 nwc=
From:   Jiada Wang <jiada_wang@mentor.com>
To:     <jikos@kernel.org>, <benjamin.tissoires@redhat.com>,
        <rydberg@bitmath.org>, <dmitry.torokhov@gmail.com>,
        <nick@shmanahar.org>
CC:     <linux-input@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <jiada_wang@mentor.com>, <erosca@de.adit-jv.com>,
        <Andrew_Gabbasov@mentor.com>
Subject: [PATCH v5 12/48] Input: atmel_mxt_ts - release touch state during suspend
Date:   Wed, 6 Nov 2019 16:01:10 +0900
Message-ID: <20191106070146.18759-13-jiada_wang@mentor.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20191106070146.18759-1-jiada_wang@mentor.com>
References: <20191106070146.18759-1-jiada_wang@mentor.com>
MIME-Version: 1.0
Content-Type: text/plain
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
index 1498342c3d98..cc4f0b5a0ae6 100644
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
2.17.1

