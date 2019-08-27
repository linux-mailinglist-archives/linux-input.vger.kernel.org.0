Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E62F59DDCF
	for <lists+linux-input@lfdr.de>; Tue, 27 Aug 2019 08:28:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728547AbfH0G23 (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 27 Aug 2019 02:28:29 -0400
Received: from esa3.mentor.iphmx.com ([68.232.137.180]:48162 "EHLO
        esa3.mentor.iphmx.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727999AbfH0G22 (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Tue, 27 Aug 2019 02:28:28 -0400
IronPort-SDR: v0Y50xQ2vwMJmgTtENHtrkMLPpQOPnl9v21c9W+mVYALVdBb4U7BVfTpfoHrj1nKHqEXEQzJAj
 WNJ7TUk2Ie0AHRJJlDfjSE2HVDmD68xPs3SKCiSlRN+c2v35fruG8H7T4pXAHNqbEpgPlJSOKl
 qEnl0UEhihZHRMkGNj8PsPmxYfgWAsNQ8KTOVE410X37xPC6SxwNFBmlXH7C3/dXazFPJ9LLCt
 5wT3F4Zh2OhRU1mY9I0ZgVNpaVS7iKKmccJUzHpkI8wGIJjMlYf3MeTecE3/d2jkcf42mk5moO
 ems=
X-IronPort-AV: E=Sophos;i="5.64,436,1559548800"; 
   d="scan'208";a="40784482"
Received: from orw-gwy-02-in.mentorg.com ([192.94.38.167])
  by esa3.mentor.iphmx.com with ESMTP; 26 Aug 2019 22:28:27 -0800
IronPort-SDR: S8TrJ10HVU9kf0C3t4bwfEnji6C2Z+7AiQ0ZUQNmc6oiL3IwKQTnkKRsFlH9XG6fi4vtWPWeqr
 ZBrMsw+19xnMvsyuIJpFLdAadlbCWaREzg+RUhGIBwT1cU2l7OIAUiiAy7wg5zhbQQ7JS4YSwF
 YqAvDTDcNABjyQfLjeMpqoWNp1GSaGBEMMnlyGluwxBOmz4vTyB9OzLzcwhxxzo7IBx24ureZX
 DkuEYhrj/4jdzkbwgKYRqlQpQ7M4iUAr3ziiGTYYEJfSitZbJhwB2+nJo4M7qSud6I8eXaSyE7
 YcY=
From:   Jiada Wang <jiada_wang@mentor.com>
To:     <nick@shmanahar.org>, <dmitry.torokhov@gmail.com>
CC:     <linux-input@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <jiada_wang@mentor.com>, <george_davis@mentor.com>
Subject: [PATCH v2 15/49] Input: atmel_mxt_ts - report failures in suspend/resume
Date:   Tue, 27 Aug 2019 15:28:00 +0900
Message-ID: <20190827062834.20494-1-jiada_wang@mentor.com>
X-Mailer: git-send-email 2.19.2
MIME-Version: 1.0
Content-Transfer-Encoding: 7BIT
Content-Type:   text/plain; charset=US-ASCII
X-ClientProxiedBy: svr-orw-mbx-04.mgc.mentorg.com (147.34.90.204) To
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
index 83ac2f1ba3be..641dd14489e1 100644
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

