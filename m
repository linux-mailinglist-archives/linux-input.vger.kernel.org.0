Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 531F9B4AD4
	for <lists+linux-input@lfdr.de>; Tue, 17 Sep 2019 11:39:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728344AbfIQJiw (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 17 Sep 2019 05:38:52 -0400
Received: from esa1.mentor.iphmx.com ([68.232.129.153]:59351 "EHLO
        esa1.mentor.iphmx.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726250AbfIQJiw (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Tue, 17 Sep 2019 05:38:52 -0400
IronPort-SDR: aSRxolACfm3VuJWVLSNYsRHYqp6PgPBA3gWRRUXtGy8xEc+qPLU2AKFxC5LyQG68+h60C6WMYO
 39T5PRdQNCuzBfaEB32Tt3bIWsXAqNL2Bv0NXxIJEmifV3ru3hi34kj1Te6ViUsZI0DwQn9Alv
 bG+m8ap1AHiM/VRYyxKFfzbjs7F/ZvuPRkwJLK0IhlP5WLddiraiLY0qRJ3JksSaojq/ACKNKL
 wKAuYuvuUobnpx15qxKgUGMT6hEcgcs0bM1ZonfwOCrEoPVx6hbafEPcSv4ITMMu68UzAbFtGN
 JEw=
X-IronPort-AV: E=Sophos;i="5.64,515,1559548800"; 
   d="scan'208";a="43223063"
Received: from orw-gwy-01-in.mentorg.com ([192.94.38.165])
  by esa1.mentor.iphmx.com with ESMTP; 17 Sep 2019 01:38:50 -0800
IronPort-SDR: nhOAf4W6trN3hckbU1s1OdvyB4LlMTntwmC1h2i5OTcrr5TmMlSTLY3S7nd8Hehcz3gdegFwb7
 Chzk9mHZMJq8FhTDcgd/MryDLdFjXu8WQMZwOfltps3z4Q32jeHSkkXNwAdlUPalRSPC3WIP1E
 WBeHnGbTAigiElPkbxEw2VSY2jFOiadgXZsMAI5AIenr/rU4i0UDbaT/98xyFHbLBzImfNPNyZ
 pmREYPYuFoKDmN9ZUQq4JW1GhI3DvNA0zv6wqbeUpWxfngFHaldn6IQKrrfka/S941zDMbAwfK
 0jM=
From:   Jiada Wang <jiada_wang@mentor.com>
To:     <nick@shmanahar.org>, <dmitry.torokhov@gmail.com>,
        <jikos@kernel.org>, <benjamin.tissoires@redhat.com>,
        <rydberg@bitmath.org>
CC:     <linux-input@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <jiada_wang@mentor.com>
Subject: [PATCH v3 15/49] Input: atmel_mxt_ts - report failures in suspend/resume
Date:   Tue, 17 Sep 2019 18:37:32 +0900
Message-ID: <20190917093806.18538-1-jiada_wang@mentor.com>
X-Mailer: git-send-email 2.19.2
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

(cherry picked from ndyer/linux/for-upstream commit 93a57575403de4dd07cd64807d3c2ed7f2cca262)
[gdavis: Resolve forward port conflicts due to applying upstream
	 commit 96a938aa214e ("Input: atmel_mxt_ts - remove platform
	 data support").]
Signed-off-by: George G. Davis <george_davis@mentor.com>
[jiada: Fix compilation warning]
Signed-off-by: Jiada Wang <jiada_wang@mentor.com>
---
 drivers/input/touchscreen/atmel_mxt_ts.c | 51 ++++++++++++++++++------
 1 file changed, 39 insertions(+), 12 deletions(-)

diff --git a/drivers/input/touchscreen/atmel_mxt_ts.c b/drivers/input/touchscreen/atmel_mxt_ts.c
index 25ac42967bc7..4615e1591af4 100644
--- a/drivers/input/touchscreen/atmel_mxt_ts.c
+++ b/drivers/input/touchscreen/atmel_mxt_ts.c
@@ -3425,10 +3425,12 @@ static void mxt_reset_slots(struct mxt_data *data)
 	mxt_input_sync(data);
 }
 
-static void mxt_start(struct mxt_data *data)
+static int mxt_start(struct mxt_data *data)
 {
+	int ret = 0;
+
 	if (!data->suspended || data->in_bootloader)
-		return;
+		return 0;
 
 	switch (data->suspend_mode) {
 	case MXT_SUSPEND_T9_CTRL:
@@ -3453,28 +3455,42 @@ static void mxt_start(struct mxt_data *data)
 		 */
 		mxt_process_messages_until_invalid(data);
 
-		mxt_set_t7_power_cfg(data, MXT_POWER_CFG_RUN);
+		ret = mxt_set_t7_power_cfg(data, MXT_POWER_CFG_RUN);
+		if (ret)
+			return ret;
 
 		/* Recalibrate since chip has been in deep sleep */
-		mxt_t6_command(data, MXT_COMMAND_CALIBRATE, 1, false);
+		ret = mxt_t6_command(data, MXT_COMMAND_CALIBRATE, 1, false);
+		if (ret)
+			return ret;
+
+		ret = mxt_acquire_irq(data);
+		if (ret)
+			return ret;
 
-		mxt_acquire_irq(data);
 		break;
 	}
 
 	data->suspended = false;
+
+	return 0;
 }
 
-static void mxt_stop(struct mxt_data *data)
+static int mxt_stop(struct mxt_data *data)
 {
+	int ret;
+
 	if (data->suspended || data->in_bootloader)
-		return;
+		return 0;
 
 	switch (data->suspend_mode) {
 	case MXT_SUSPEND_T9_CTRL:
 		/* Touch disable */
-		mxt_write_object(data,
+		ret = mxt_write_object(data,
 				MXT_TOUCH_MULTI_T9, MXT_T9_CTRL, 0);
+		if (ret)
+			return ret;
+
 		break;
 
 	case MXT_SUSPEND_REGULATOR:
@@ -3487,29 +3503,40 @@ static void mxt_stop(struct mxt_data *data)
 	default:
 		disable_irq(data->irq);
 
-		mxt_set_t7_power_cfg(data, MXT_POWER_CFG_DEEPSLEEP);
+		ret = mxt_set_t7_power_cfg(data, MXT_POWER_CFG_DEEPSLEEP);
+		if (ret)
+			return ret;
 
 		mxt_reset_slots(data);
 		break;
 	}
 
 	data->suspended = true;
+	return 0;
 }
 
 static int mxt_input_open(struct input_dev *dev)
 {
 	struct mxt_data *data = input_get_drvdata(dev);
+	int ret;
 
-	mxt_start(data);
+	ret = mxt_start(data);
 
-	return 0;
+	if (ret)
+		dev_err(&data->client->dev, "%s failed rc=%d\n", __func__, ret);
+
+	return ret;
 }
 
 static void mxt_input_close(struct input_dev *dev)
 {
 	struct mxt_data *data = input_get_drvdata(dev);
+	int ret;
 
-	mxt_stop(data);
+	ret = mxt_stop(data);
+
+	if (ret)
+		dev_err(&data->client->dev, "%s failed rc=%d\n", __func__, ret);
 }
 
 static int mxt_parse_device_properties(struct mxt_data *data)
-- 
2.19.2

