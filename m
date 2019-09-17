Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D792FB4B07
	for <lists+linux-input@lfdr.de>; Tue, 17 Sep 2019 11:42:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729130AbfIQJmk (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 17 Sep 2019 05:42:40 -0400
Received: from esa4.mentor.iphmx.com ([68.232.137.252]:22250 "EHLO
        esa4.mentor.iphmx.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729031AbfIQJmj (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Tue, 17 Sep 2019 05:42:39 -0400
IronPort-SDR: oO8viVRlg6tcSdGEsphuqyWao532FBUR3ib9iZ8iM7rS+miBZ2Eq52SjtLDiUcNMlJzNqkZ1K1
 ENySNEstwLGkWlnvofBHLeKnv/pvWfE+LnLpXNg0rYRilBlatZy4DZ429lLWgrTJjHCfIcfgbo
 B6RwC3fVIWYnl42l2trVvL0mHaAxQKc70dVSESqYPLSkynjViYc5/Z4JFatbw7YhHNNQSwaYNh
 lm6dk2fEt/RloqtFXShiBaXTZ8x3vwuSmmOkwpBDBfJd/K4sFwVe1xszZY1d8N/mPIKl+c4Dvv
 /cg=
X-IronPort-AV: E=Sophos;i="5.64,515,1559548800"; 
   d="scan'208";a="41423272"
Received: from orw-gwy-01-in.mentorg.com ([192.94.38.165])
  by esa4.mentor.iphmx.com with ESMTP; 17 Sep 2019 01:42:39 -0800
IronPort-SDR: AsbjNxVso8FFMfLC+WHo9qWjZOwBZ8clKMGJDllOAn59SsGo0OMhaDYqaHly49bdJszKGhY8mG
 K/BTYD1aWU2nxXOclxioC45B85Crlr3f9k9NNgierjy91NNVKD7t/29qhvaZPwNa1+Dq1rc5RY
 15YI15yuUH8KBK/yaPlKQxMRPaKCiiD0cmvnPPXH1JsH/+tDHz0W4aepKYYLeOp0Bn7qNSXK3N
 8FHsFukqPe+TSTTEo6o6kfLBlo6DWedEa1idF3PXXovvdnUAQy3jko18o6c/6NQxVX9BWeNvhl
 3k0=
From:   Jiada Wang <jiada_wang@mentor.com>
To:     <nick@shmanahar.org>, <dmitry.torokhov@gmail.com>,
        <jikos@kernel.org>, <benjamin.tissoires@redhat.com>,
        <rydberg@bitmath.org>
CC:     <linux-input@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <jiada_wang@mentor.com>
Subject: [PATCH v3 39/49] Input: Atmel: improve error handling in mxt_start()
Date:   Tue, 17 Sep 2019 18:42:15 +0900
Message-ID: <20190917094225.18927-1-jiada_wang@mentor.com>
X-Mailer: git-send-email 2.19.2
MIME-Version: 1.0
Content-Transfer-Encoding: 7BIT
Content-Type:   text/plain; charset=US-ASCII
X-ClientProxiedBy: svr-orw-mbx-03.mgc.mentorg.com (147.34.90.203) To
 svr-orw-mbx-03.mgc.mentorg.com (147.34.90.203)
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
index f2fa62289577..2fac43da0a2b 100644
--- a/drivers/input/touchscreen/atmel_mxt_ts.c
+++ b/drivers/input/touchscreen/atmel_mxt_ts.c
@@ -3974,12 +3974,13 @@ static int mxt_start(struct mxt_data *data)
 
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
@@ -3993,27 +3994,26 @@ static int mxt_start(struct mxt_data *data)
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
@@ -4334,6 +4334,7 @@ static int __maybe_unused mxt_resume(struct device *dev)
 	struct i2c_client *client = to_i2c_client(dev);
 	struct mxt_data *data = i2c_get_clientdata(client);
 	struct input_dev *input_dev = data->input_dev;
+	int ret = 0;
 
 	if (!input_dev)
 		return 0;
@@ -4341,11 +4342,11 @@ static int __maybe_unused mxt_resume(struct device *dev)
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
2.19.2

