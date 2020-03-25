Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 1F535192A1F
	for <lists+linux-input@lfdr.de>; Wed, 25 Mar 2020 14:38:00 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727796AbgCYNgm (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 25 Mar 2020 09:36:42 -0400
Received: from esa3.mentor.iphmx.com ([68.232.137.180]:53281 "EHLO
        esa3.mentor.iphmx.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727752AbgCYNgl (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Wed, 25 Mar 2020 09:36:41 -0400
IronPort-SDR: SUQYK1CD/gYn7+E2YoH4oL2OVKUnHK5rI/Wh+gR1Nu25tNW7Wlap57LeljCx5a3DvwfCIjIzEZ
 Cyuv2tU1RbUYM6oMdCTY0VkC31MbTlvDu1LvW1D5uShpRLoByq2aMzsVAoxjBwp/v9mdlEYhZG
 8hDhQVLAEER2M7Zrap4UM0aSOodUY0VyyecKmxjKr2cQ/YyyWfbEnSZxBwsYZIamlVQQE0o/ON
 rGakEEO+zKhsyo2dkj7A+RgBTe110D9Cy/pNF80HBA3FLa9kTQJyOQtZ1H16iDm4pfEvjHaCuC
 i38=
X-IronPort-AV: E=Sophos;i="5.72,304,1580803200"; 
   d="scan'208";a="47099812"
Received: from orw-gwy-01-in.mentorg.com ([192.94.38.165])
  by esa3.mentor.iphmx.com with ESMTP; 25 Mar 2020 05:36:40 -0800
IronPort-SDR: KYvoPt8e31cy50S60otH4zrcWH0H50cQVc9pNsrOOMDjgQBI88/vBe8aSnb6S2vRhW2rT9i+f1
 9+Nj78X4NuWkiiw1uZd2XxT6CqTOZfUbgCMdwpeZo4YOx+PfjGvEFGJiBlYH4k3Yoz4RZr+WG+
 L5BudcflHSwG8A7BmMdSlLOP4xis5DPDu2SOM21yYLohnAcyeAwainkgswaGB5J5TBEOh6KGag
 KcJ8eywOSBqa4AZlJInJziloFf/CgpbKSRM48UXGxrGCN9U64rwk3j3lxr8PNHv+fD4z3mKGcv
 reg=
From:   Jiada Wang <jiada_wang@mentor.com>
To:     <nick@shmanahar.org>, <dmitry.torokhov@gmail.com>,
        <jikos@kernel.org>, <benjamin.tissoires@redhat.com>,
        <bsz@semihalf.com>, <rydberg@bitmath.org>
CC:     <linux-input@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <erosca@de.adit-jv.com>, <Andrew_Gabbasov@mentor.com>,
        <jiada_wang@mentor.com>
Subject: [PATCH v9 45/55] Input: Atmel: improve error handling in mxt_start()
Date:   Wed, 25 Mar 2020 06:33:24 -0700
Message-ID: <20200325133334.19346-46-jiada_wang@mentor.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200325133334.19346-1-jiada_wang@mentor.com>
References: <20200325133334.19346-1-jiada_wang@mentor.com>
MIME-Version: 1.0
Content-Type: text/plain
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

From: Deepak Das <deepak_das@mentor.com>

mxt_start() does not return error in any of
the failure cases which will allow input_dev->open()
to return success even in case of any failure.

This commit modifies mxt_start() to return error
in failure cases.

Signed-off-by: Deepak Das <deepak_das@mentor.com>
Signed-off-by: George G. Davis <george_davis@mentor.com>
Signed-off-by: Jiada Wang <jiada_wang@mentor.com>
---
 drivers/input/touchscreen/atmel_mxt_ts.c | 31 ++++++++++++------------
 1 file changed, 16 insertions(+), 15 deletions(-)

diff --git a/drivers/input/touchscreen/atmel_mxt_ts.c b/drivers/input/touchscreen/atmel_mxt_ts.c
index bbec5a8e0bb6..0f7ee987a9c5 100644
--- a/drivers/input/touchscreen/atmel_mxt_ts.c
+++ b/drivers/input/touchscreen/atmel_mxt_ts.c
@@ -3981,12 +3981,13 @@ static int mxt_start(struct mxt_data *data)
 
 	switch (data->suspend_mode) {
 	case MXT_SUSPEND_T9_CTRL:
-		mxt_soft_reset(data);
-
+		ret = mxt_soft_reset(data);
+		if (ret)
+			break;
 		/* Touch enable */
 		/* 0x83 = SCANEN | RPTEN | ENABLE */
-		mxt_write_object(data,
-				MXT_TOUCH_MULTI_T9, MXT_T9_CTRL, 0x83);
+		ret = mxt_write_object(data,
+				       MXT_TOUCH_MULTI_T9, MXT_T9_CTRL, 0x83);
 		break;
 
 	case MXT_SUSPEND_REGULATOR:
@@ -4000,27 +4001,26 @@ static int mxt_start(struct mxt_data *data)
 		 * Discard any touch messages still in message buffer
 		 * from before chip went to sleep
 		 */
-		mxt_process_messages_until_invalid(data);
+		ret = mxt_process_messages_until_invalid(data);
+		if (ret)
+			break;
 
 		ret = mxt_set_t7_power_cfg(data, MXT_POWER_CFG_RUN);
 		if (ret)
-			return ret;
+			break;
 
 		/* Recalibrate since chip has been in deep sleep */
 		ret = mxt_t6_command(data, MXT_COMMAND_CALIBRATE, 1, false);
 		if (ret)
-			return ret;
+			break;
 
 		ret = mxt_acquire_irq(data);
-		if (ret)
-			return ret;
-
-		break;
 	}
 
-	data->suspended = false;
+	if (!ret)
+		data->suspended = false;
 
-	return 0;
+	return ret;
 }
 
 static int mxt_stop(struct mxt_data *data)
@@ -4343,6 +4343,7 @@ static int __maybe_unused mxt_resume(struct device *dev)
 	struct i2c_client *client = to_i2c_client(dev);
 	struct mxt_data *data = i2c_get_clientdata(client);
 	struct input_dev *input_dev = data->input_dev;
+	int ret = 0;
 
 	if (!input_dev)
 		return 0;
@@ -4352,11 +4353,11 @@ static int __maybe_unused mxt_resume(struct device *dev)
 	mutex_lock(&input_dev->mutex);
 
 	if (input_dev->users)
-		mxt_start(data);
+		ret = mxt_start(data);
 
 	mutex_unlock(&input_dev->mutex);
 
-	return 0;
+	return ret;
 }
 
 static SIMPLE_DEV_PM_OPS(mxt_pm_ops, mxt_suspend, mxt_resume);
-- 
2.17.1

