Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 38F578FE46
	for <lists+linux-input@lfdr.de>; Fri, 16 Aug 2019 10:40:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727556AbfHPIja (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Fri, 16 Aug 2019 04:39:30 -0400
Received: from esa2.mentor.iphmx.com ([68.232.141.98]:1996 "EHLO
        esa2.mentor.iphmx.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727551AbfHPIj3 (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Fri, 16 Aug 2019 04:39:29 -0400
IronPort-SDR: jMTWSYKwTv+f/59+vjidh3lihfWO/lsWosTIrGUHjQ+PaEIwbJcNytz2JlU8/lQ82kUL9l1Uzs
 m9PP5xTTWTi7rVff7yJ1Nfcxdfbs7oNOLt2jkfvyPZc8KE6oCuItGgEv5ltnN9ZKj+NsS2N/Kj
 hYtDkmBM+vAtq8F3BBCgq/aPJJbu90XdhjMX9mxrwDwW1O7uHrjkYbAn3enNqhYKzbO3ui9zyA
 7dgCbilla+q3qOHzj6cDNvSpUSXBJniIZ+YRJX9SOD95+3orik8EFs2q7yPCHaRK0XHZ8hQ7RM
 80w=
X-IronPort-AV: E=Sophos;i="5.64,391,1559548800"; 
   d="scan'208";a="40484230"
Received: from orw-gwy-02-in.mentorg.com ([192.94.38.167])
  by esa2.mentor.iphmx.com with ESMTP; 16 Aug 2019 00:32:22 -0800
IronPort-SDR: M0eyjM8QbXZ/wqXkpIuo27hWWluIZ0SBC1aXTl80/qi+I+T6yM5EFIeKUoaROsrx63JiXMkte+
 3/Swi7HTnNPHG1NDJY/BKfgw7nOaGUo9VPFeAuHQiplu7xtoftM9BQAK7YCRPwCdp7F7710xI2
 LOuSuJ12we+UwbdCpPI/thlU3HqM24bl7a1PVw4cGMVHD3M0FqLH/p2vO/uQ+ZND4ZFqq1xcGX
 ierdBkRCoMKWS7ardo8QLnq0uqs+JWygJYjxbVpCq82R1MbTdkuvg0vIiZWIpL+NuQXSXZZLd+
 cnY=
From:   Jiada Wang <jiada_wang@mentor.com>
To:     <nick@shmanahar.org>, <dmitry.torokhov@gmail.com>
CC:     <linux-input@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <jiada_wang@mentor.com>, <george_davis@mentor.com>
Subject: [PATCH v1 14/63] Input: atmel_mxt_ts - report failures in suspend/resume
Date:   Fri, 16 Aug 2019 17:31:29 +0900
Message-ID: <20190816083218.18402-5-jiada_wang@mentor.com>
X-Mailer: git-send-email 2.19.2
In-Reply-To: <20190816083218.18402-1-jiada_wang@mentor.com>
References: <20190816083218.18402-1-jiada_wang@mentor.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7BIT
Content-Type:   text/plain; charset=US-ASCII
X-ClientProxiedBy: svr-orw-mbx-03.mgc.mentorg.com (147.34.90.203) To
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
index 907eebeff465..a54c595c76b9 100644
--- a/drivers/input/touchscreen/atmel_mxt_ts.c
+++ b/drivers/input/touchscreen/atmel_mxt_ts.c
@@ -3421,10 +3421,12 @@ static void mxt_reset_slots(struct mxt_data *data)
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
@@ -3449,28 +3451,42 @@ static void mxt_start(struct mxt_data *data)
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
@@ -3483,29 +3499,40 @@ static void mxt_stop(struct mxt_data *data)
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

