Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id AE7111067CA
	for <lists+linux-input@lfdr.de>; Fri, 22 Nov 2019 09:25:04 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726968AbfKVIYv (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Fri, 22 Nov 2019 03:24:51 -0500
Received: from esa3.mentor.iphmx.com ([68.232.137.180]:4406 "EHLO
        esa3.mentor.iphmx.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725999AbfKVIYu (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Fri, 22 Nov 2019 03:24:50 -0500
IronPort-SDR: sLaOKttonXZz0CT7HM4LdCbcT78SqTG5SwbyNb1pF1FfG5wKNFS1Dejac4CLmfA0zFKhZl0dQX
 SkyAcWkL9f11JI/Mre/Y6MkMM9S91308Smhp8d/d3YgI6k3Z5RbrwNMQWsHPnhJ8oe+2sR6klO
 45CLOAv0+xBfcvLg0ORat6aZcahie2Ou5jx0DCvgrw/AeGVyRPg9aRSA3CzYTMLX75Z/nPO8Qs
 AbcFpQcCiiA0RaEgazCz6JifiJqheGy7VwS4kq0IQLIO5DomiixXC+wZ27ZMBES+afIfZG3STB
 eiw=
X-IronPort-AV: E=Sophos;i="5.69,229,1571731200"; 
   d="scan'208";a="43419424"
Received: from orw-gwy-02-in.mentorg.com ([192.94.38.167])
  by esa3.mentor.iphmx.com with ESMTP; 22 Nov 2019 00:24:49 -0800
IronPort-SDR: UxeGFQRLuhC23Gwz+f1Ni6ZIGvM8gofvv3hQyUjVGj6idiDSj4Ehxo/KLx6A14II1pMrEZSN4N
 azeVvOXOqflxFTR/roPRq8tMuUhvLYEV7g+GHyRNFLJMeRDSHY8WrBS8Rb1a9/oPnTrm9iBV2n
 vj/gmXoU45dIbVSMwwNNndN9Sqqz49ma4SJqhsv5lJ0Z20qMzBHTI9KCDIv+1kA4M05l2RkB6X
 KsVGf/tXEBQAU79DdZhlSHVf0ZMif+/5VP6PslzCcMbjn5s5hJAyjJ0QM1CcEwZORVaRjtPJTf
 DH8=
From:   Jiada Wang <jiada_wang@mentor.com>
To:     <jikos@kernel.org>, <benjamin.tissoires@redhat.com>,
        <rydberg@bitmath.org>, <dmitry.torokhov@gmail.com>,
        <nick@shmanahar.org>
CC:     <linux-input@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <erosca@de.adit-jv.com>, <Andrew_Gabbasov@mentor.com>,
        <jiada_wang@mentor.com>
Subject: [PATCH v6 12/48] Input: atmel_mxt_ts - release touch state during suspend
Date:   Fri, 22 Nov 2019 17:23:26 +0900
Message-ID: <20191122082402.18173-13-jiada_wang@mentor.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20191122082402.18173-1-jiada_wang@mentor.com>
References: <20191122082402.18173-1-jiada_wang@mentor.com>
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

