Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DBFC01CA378
	for <lists+linux-input@lfdr.de>; Fri,  8 May 2020 08:00:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727094AbgEHGAn (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Fri, 8 May 2020 02:00:43 -0400
Received: from esa4.mentor.iphmx.com ([68.232.137.252]:47211 "EHLO
        esa4.mentor.iphmx.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728267AbgEHF74 (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Fri, 8 May 2020 01:59:56 -0400
IronPort-SDR: 8IuJZ72TIJkLVef6RgI8jWHKClON2hKO4lB/nME31KXuA12W6+SIqT/I16ybOKEEDxMZe4GfY9
 U3GF/eV4v95cR7a703WPpQgc04iibko/MIJJlawKvMIK1BSBVsMht0+S9peUpK2oGjO4RkyTYZ
 EhrTv0PBUCfpnA3v+yRjn9Q2052XSoNHHkRulyDNzu8/2ljBP0j6yuH9yZkKgHBIguXs8KeJ6X
 ofQ4CwDVmZnpnM/6wrRp9l5HHCtxywXiCrdsHCK+jM7Ps1xOE0vnrvBD1dTgp95bqBfpa0mO1M
 Mmo=
X-IronPort-AV: E=Sophos;i="5.73,366,1583222400"; 
   d="scan'208";a="48710673"
Received: from orw-gwy-01-in.mentorg.com ([192.94.38.165])
  by esa4.mentor.iphmx.com with ESMTP; 07 May 2020 21:59:55 -0800
IronPort-SDR: 5n5LpbM3gAISoEMlV7TIuHjP7CMnuN2RfLE/uJYYimVpDrMAzZP6G+BUPZYTf3t4Wt5eihcQE4
 4/waqlYmYdpzuIxjZGM/uqr1J9yrfmR8AmaZTwJ/ZFwouNQ3PQx1ZCgNvXSZ8DHBCUPxoPGuCp
 Ql/eZo5nxkhN7v38m2/lXitBVwp5dl4ywJnrYUfWTCAT/4PB7i+lfW6OJMp1nX6LEXUFVCn8kj
 l5Kc0wkUBPnVR6h6mwXS6YNOulL3Iy7pUg5v9YWn7FUF0YLW9+1OafhClnIgk8dpd2LrSmCyrt
 hLc=
From:   Jiada Wang <jiada_wang@mentor.com>
To:     <nick@shmanahar.org>, <dmitry.torokhov@gmail.com>,
        <jikos@kernel.org>, <benjamin.tissoires@redhat.com>,
        <bsz@semihalf.com>
CC:     <linux-input@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <erosca@de.adit-jv.com>, <Andrew_Gabbasov@mentor.com>,
        <jiada_wang@mentor.com>
Subject: [PATCH v11 46/56] Input: Atmel: improve error handling in mxt_start()
Date:   Thu, 7 May 2020 22:56:46 -0700
Message-ID: <20200508055656.96389-47-jiada_wang@mentor.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200508055656.96389-1-jiada_wang@mentor.com>
References: <20200508055656.96389-1-jiada_wang@mentor.com>
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
index 7c530ffac1ba..906da438d5e8 100644
--- a/drivers/input/touchscreen/atmel_mxt_ts.c
+++ b/drivers/input/touchscreen/atmel_mxt_ts.c
@@ -3961,12 +3961,13 @@ static int mxt_start(struct mxt_data *data)
 
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
@@ -3980,27 +3981,26 @@ static int mxt_start(struct mxt_data *data)
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
@@ -4327,6 +4327,7 @@ static int __maybe_unused mxt_resume(struct device *dev)
 	struct i2c_client *client = to_i2c_client(dev);
 	struct mxt_data *data = i2c_get_clientdata(client);
 	struct input_dev *input_dev = data->input_dev;
+	int ret = 0;
 
 	if (!input_dev)
 		return 0;
@@ -4336,11 +4337,11 @@ static int __maybe_unused mxt_resume(struct device *dev)
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

