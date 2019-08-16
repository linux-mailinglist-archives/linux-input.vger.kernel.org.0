Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C21CD8FDFB
	for <lists+linux-input@lfdr.de>; Fri, 16 Aug 2019 10:37:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726899AbfHPIhQ (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Fri, 16 Aug 2019 04:37:16 -0400
Received: from esa2.mentor.iphmx.com ([68.232.141.98]:1919 "EHLO
        esa2.mentor.iphmx.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726810AbfHPIhQ (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Fri, 16 Aug 2019 04:37:16 -0400
X-Greylist: delayed 306 seconds by postgrey-1.27 at vger.kernel.org; Fri, 16 Aug 2019 04:37:16 EDT
IronPort-SDR: VmNrKHCByHWrkM4V4KRDR4+Hxrqu1hMZI6D/4tWcIwqjmiavILAkaZ2jHnmYJHNjz1ZpyTsisq
 SmoYDTD46b9e+oXHKfJKLOc/lPP6LoGNz2i2NwDi93mfXFbrEaKn5mARIcKR3Iuce2gYDg5mXT
 OjXQcQr6Zsow7mQNmDob6U8FwR3p2QsdQ1s7Ll+8prOh94gs+d50GvIiDlbdj/mcsx/ghaVbWV
 lwuu17zglNbPB63CJv+8kUdTjaDbD0hm0tXEuk3oJGc1i0u/eCb4IWGAxDpwYfzskErfK+twVS
 ilY=
X-IronPort-AV: E=Sophos;i="5.64,391,1559548800"; 
   d="scan'208";a="40484352"
Received: from orw-gwy-02-in.mentorg.com ([192.94.38.167])
  by esa2.mentor.iphmx.com with ESMTP; 16 Aug 2019 00:37:15 -0800
IronPort-SDR: Tt9VHoDr4caUaTTUn3oLYZMU5Y8pWis5x0HIUll2oqUXLzbUMJ6ZlDxogSs3WpLnYS5fRTF0st
 yL1ZdOK8cPObsZdEkVuxBWCbRqUtdy7o5/OHGMTGZutUX9Kt3TugbLSfFRRs5Ad3/NNF2sFMsD
 OlaWlx2BiMjncRA2btmXng8F4pfd6Z+D0YeuFgy25Eu8bwGVLEucJ2pLDjXNeiRDbktIhWmc1T
 zVBKbcYxxob1yCwAN/gpZKJFbykxnwFKeJyk/qJthvakCxmBSqFVTiVYMQw5JRc4ly6gYP/OMX
 Z3w=
From:   Jiada Wang <jiada_wang@mentor.com>
To:     <nick@shmanahar.org>, <dmitry.torokhov@gmail.com>
CC:     <linux-input@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <jiada_wang@mentor.com>, <george_davis@mentor.com>
Subject: [PATCH v1 45/63] Input: Atmel: improve error handling in mxt_start()
Date:   Fri, 16 Aug 2019 17:37:06 +0900
Message-ID: <20190816083724.19341-1-jiada_wang@mentor.com>
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
index ed5b98c067e8..232262736029 100644
--- a/drivers/input/touchscreen/atmel_mxt_ts.c
+++ b/drivers/input/touchscreen/atmel_mxt_ts.c
@@ -4043,12 +4043,13 @@ static int mxt_start(struct mxt_data *data)
 
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
@@ -4062,27 +4063,26 @@ static int mxt_start(struct mxt_data *data)
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
@@ -4511,6 +4511,7 @@ static int __maybe_unused mxt_resume(struct device *dev)
 	struct i2c_client *client = to_i2c_client(dev);
 	struct mxt_data *data = i2c_get_clientdata(client);
 	struct input_dev *input_dev = data->input_dev;
+	int ret = 0;
 
 	if (!input_dev)
 		return 0;
@@ -4518,11 +4519,11 @@ static int __maybe_unused mxt_resume(struct device *dev)
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

