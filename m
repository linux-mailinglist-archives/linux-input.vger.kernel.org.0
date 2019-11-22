Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 685D910681B
	for <lists+linux-input@lfdr.de>; Fri, 22 Nov 2019 09:27:32 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727262AbfKVIY6 (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Fri, 22 Nov 2019 03:24:58 -0500
Received: from esa1.mentor.iphmx.com ([68.232.129.153]:60532 "EHLO
        esa1.mentor.iphmx.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727149AbfKVIY5 (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Fri, 22 Nov 2019 03:24:57 -0500
IronPort-SDR: JZN7us3t5pneTXfKaJZccCFFs/FfmwQDZRWjjThcGrcjtFJekDhqn5AQISz58H2na05skMHyv6
 XNTYNQiCgU75+Sxt9ZB+ANF5X/XLtfdEFQUYciOp1EgVlRUnoYP+r6t2eEp3kaOQROR7hyHKa6
 ws9cRJkDh5brc3Pti2xWbWRycc2P2B+rMiDYfxVfPa7E9Fkx4qgMNtAYzrPEnqxW/qrf9/aIkt
 yZLf6KO++T5le5i8MXkAyieCgWInH/A2HKAJg/W8f000kR0yUXE/BJHcLmq6+CwHGPzGaf03Kc
 bDM=
X-IronPort-AV: E=Sophos;i="5.69,229,1571731200"; 
   d="scan'208";a="45291110"
Received: from orw-gwy-01-in.mentorg.com ([192.94.38.165])
  by esa1.mentor.iphmx.com with ESMTP; 22 Nov 2019 00:24:56 -0800
IronPort-SDR: kx440i/9WV89SDmCQGkqYPHvP6EDT/KyHEQAxRfbdOKscq/xfxC55AD5Dkd4U2I3Y83Kmsn/RI
 vG16hZCkq5rQh5qrhlX4EYrtYOV5jMfKWVLLVYDzqiNXZSIvD8cyn649mREc4/LIdpJpNkymkZ
 v0mO+qAD/f6AqiohDQNBgw7307EDhZ435rys3JFizQiS7gbQ8bEIMPAsnRMxQfx5mKbdb2H+gj
 /u83tQ3BglhyYxlnkfs3cTKayIxZLLRu+7FciJg1KNq2qGQJ1BJcPF9XCaZ6sMEUe4zIUNa3Zj
 o4Q=
From:   Jiada Wang <jiada_wang@mentor.com>
To:     <jikos@kernel.org>, <benjamin.tissoires@redhat.com>,
        <rydberg@bitmath.org>, <dmitry.torokhov@gmail.com>,
        <nick@shmanahar.org>
CC:     <linux-input@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <erosca@de.adit-jv.com>, <Andrew_Gabbasov@mentor.com>,
        <jiada_wang@mentor.com>
Subject: [PATCH v6 14/48] Input: atmel_mxt_ts - report failures in suspend/resume
Date:   Fri, 22 Nov 2019 17:23:28 +0900
Message-ID: <20191122082402.18173-15-jiada_wang@mentor.com>
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
index 031ba48b6e71..c551ec93ca54 100644
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
2.17.1

