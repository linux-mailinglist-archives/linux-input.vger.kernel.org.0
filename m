Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 7A56D15A381
	for <lists+linux-input@lfdr.de>; Wed, 12 Feb 2020 09:44:23 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728457AbgBLIoW (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 12 Feb 2020 03:44:22 -0500
Received: from esa3.mentor.iphmx.com ([68.232.137.180]:18894 "EHLO
        esa3.mentor.iphmx.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728435AbgBLIoW (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Wed, 12 Feb 2020 03:44:22 -0500
IronPort-SDR: EOt7E0tLBd2uYMpugb7uP/qYtF3FZPAB6ZMihgVZwUMOqVUh2/j1XQeBVwwH/l90y73CbHc0Io
 +6YS70rzBH4wVS/CHK+RwfM5D4Jm5hLHDEr4BNj4AanOEoXnnVB8Dro1HvhUWL8Rnn/D5lY0Pd
 7MHnDPE1s26nokWCtsSr8uCzIWc1z4Ch3o9wzCub1g1ouDbFUddJM+QbIm3SNkGC8NeaRJjvll
 xBvgwLYSt5s0c8EaG4kQai6CTW0Wy+QkbQf80wNx9ySIBRTrsvVB5GuCC2+GpE/8jIe4xVMAlB
 rnc=
X-IronPort-AV: E=Sophos;i="5.70,428,1574150400"; 
   d="scan'208";a="45742531"
Received: from orw-gwy-02-in.mentorg.com ([192.94.38.167])
  by esa3.mentor.iphmx.com with ESMTP; 12 Feb 2020 00:44:21 -0800
IronPort-SDR: R4QeEbk/juN4Di0T2tCaI1fLAS/KKstm3+eLlqiTf00WJGhtuQk2PDMeLYU3Q/4diuK7bQXest
 1Aifi5FaIckUagnESz0gwDFoKixoaLG4vuGuhHh1pbXgssR5nH4aS+3/sqwydUNojs3rUh7k7F
 x9UbS546irWxUG3kSBbCc2xoefYny799EJEFlfdvHh9xK9E0UqnbtYURoKZq/IkidjrXR3v4A/
 bwrPPSgcBR5ilnvo0tA9sz3nyU7WoEam4HmHTNYCyMycXNYar8WgOBH3ca4IzxY+7/YosFvc33
 PJ0=
From:   Jiada Wang <jiada_wang@mentor.com>
To:     <jikos@kernel.org>, <benjamin.tissoires@redhat.com>,
        <rydberg@bitmath.org>, <dmitry.torokhov@gmail.com>,
        <nick@shmanahar.org>, <bsz@semihalf.com>
CC:     <linux-input@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <erosca@de.adit-jv.com>, <Andrew_Gabbasov@mentor.com>,
        <jiada_wang@mentor.com>
Subject: [PATCH v7 14/48] Input: atmel_mxt_ts - report failures in suspend/resume
Date:   Wed, 12 Feb 2020 00:41:44 -0800
Message-ID: <20200212084218.32344-15-jiada_wang@mentor.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200212084218.32344-1-jiada_wang@mentor.com>
References: <20200212084218.32344-1-jiada_wang@mentor.com>
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
index 7b2c62d46ef8..8cac4debb505 100644
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

