Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 53D25117C4B
	for <lists+linux-input@lfdr.de>; Tue, 10 Dec 2019 01:19:40 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727306AbfLJAT2 (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 9 Dec 2019 19:19:28 -0500
Received: from rere.qmqm.pl ([91.227.64.183]:32217 "EHLO rere.qmqm.pl"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727482AbfLJATV (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Mon, 9 Dec 2019 19:19:21 -0500
Received: from remote.user (localhost [127.0.0.1])
        by rere.qmqm.pl (Postfix) with ESMTPSA id 47X0wt2pK6zdj;
        Tue, 10 Dec 2019 01:16:46 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=rere.qmqm.pl; s=1;
        t=1575937006; bh=T1gZug2/VJEdTp0oAnSSiQbEfSyuZ5/gV2jO9/yESFc=;
        h=Date:In-Reply-To:References:From:Subject:To:Cc:From;
        b=qA1Xotucsx+GK/fmeDuWQchf4uMgx5Gc77oqyLa/fgDP0/NtkEiK/PoQg9P5hT247
         zvC8AqElzFAjpLLo+ML592Wotna3taRiRpdqRmkt31ZXYn+Hsnuxg1lJS6Xasc7gds
         br03bTPJ3FvfyRbXr5rk41jOnFmOBwzmc8X8Z6Lxk4Q7GoV8paLlycRyeyQwbSz0mU
         1kH+QEv1U8eWxb496a0kbgejacPK3bVC/rQTal7yUbZWHn1lfX+25eS0jAgS983vrA
         D7ZOV5uChITemLrvJcF+gjNmXTs4mt05OZmqgfFZYesx6HGR+N9E7rrjfjm1u+0USp
         6KviKi1dj/3bg==
X-Virus-Status: Clean
X-Virus-Scanned: clamav-milter 0.101.4 at mail
Date:   Tue, 10 Dec 2019 01:19:18 +0100
Message-Id: <06f20ed8e50fe634c59cf3c585d37f1175133533.1575936961.git.mirq-linux@rere.qmqm.pl>
In-Reply-To: <cover.1575936961.git.mirq-linux@rere.qmqm.pl>
References: <cover.1575936961.git.mirq-linux@rere.qmqm.pl>
From:   =?UTF-8?q?Micha=C5=82=20Miros=C5=82aw?= <mirq-linux@rere.qmqm.pl>
Subject: [PATCH 6/6] input: elants: read touchscreen size for EKTF3624
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
To:     linux-input@vger.kernel.org
Cc:     Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        linux-kernel@vger.kernel.org, Dmitry Osipenko <digetx@gmail.com>
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

EKTF3624 as present in Asus TF300T tablet has touchscreen size encoded
in different registers.

Signed-off-by: Michał Mirosław <mirq-linux@rere.qmqm.pl>
---
 drivers/input/touchscreen/elants_i2c.c | 77 ++++++++++++++++++++++++--
 1 file changed, 72 insertions(+), 5 deletions(-)

diff --git a/drivers/input/touchscreen/elants_i2c.c b/drivers/input/touchscreen/elants_i2c.c
index 27aca3971da5..e60a5eb9fb37 100644
--- a/drivers/input/touchscreen/elants_i2c.c
+++ b/drivers/input/touchscreen/elants_i2c.c
@@ -34,7 +34,7 @@
 #include <linux/input/touchscreen.h>
 #include <linux/input/mt.h>
 #include <linux/acpi.h>
-#include <linux/of.h>
+#include <linux/of_device.h>
 #include <linux/gpio/consumer.h>
 #include <linux/regulator/consumer.h>
 #include <asm/unaligned.h>
@@ -42,6 +42,10 @@
 /* Device, Driver information */
 #define DEVICE_NAME	"elants_i2c"
 
+/* Device IDs */
+#define EKTH3500	0
+#define EKTF3624	1
+
 /* Convert from rows or columns into resolution */
 #define ELAN_TS_RESOLUTION(n, m)   (((n) - 1) * (m))
 
@@ -160,6 +164,7 @@ struct elants_data {
 
 	bool wake_irq_enabled;
 	bool keep_power_in_suspend;
+	u8 chip_id;
 
 	/* Must be last to be used for DMA operations */
 	u8 buf[MAX_PACKET_SIZE] ____cacheline_aligned;
@@ -434,7 +439,53 @@ static int elants_i2c_query_bc_version(struct elants_data *ts)
 	return 0;
 }
 
-static int elants_i2c_query_ts_info(struct elants_data *ts)
+static int elants_i2c_query_ts_info_ektf(struct elants_data *ts)
+{
+	struct i2c_client *client = ts->client;
+	int error;
+	u8 resp[4];
+	u16 phy_x, phy_y;
+	const u8 get_xres_cmd[] = {
+		CMD_HEADER_READ, E_INFO_X_RES, 0x00, 0x00
+	};
+	const u8 get_yres_cmd[] = {
+		CMD_HEADER_READ, E_INFO_Y_RES, 0x00, 0x00
+	};
+
+	/* Get X/Y size in mm */
+	error = elants_i2c_execute_command(client, get_xres_cmd,
+					   sizeof(get_xres_cmd),
+					   resp, sizeof(resp), 1,
+					   "get X size");
+	if (error)
+		return error;
+
+	phy_x = resp[2] | ((resp[3] & 0xF0) << 4);
+
+	error = elants_i2c_execute_command(client, get_yres_cmd,
+					   sizeof(get_yres_cmd),
+					   resp, sizeof(resp), 1,
+					   "get Y size");
+	if (error)
+		return error;
+
+	phy_y = resp[2] | ((resp[3] & 0xF0) << 4);
+
+	/* calculate resolution from size */
+	if (!ts->prop.max_x)
+		ts->prop.max_x = 2240;
+	ts->x_res = DIV_ROUND_CLOSEST(ts->prop.max_x, phy_x);
+
+	if (!ts->prop.max_y)
+		ts->prop.max_y = 1408;
+	ts->y_res = DIV_ROUND_CLOSEST(ts->prop.max_y, phy_y);
+
+	dev_dbg(&client->dev, "phy_x=%d, phy_y=%d\n", phy_x, phy_y);
+
+	return 0;
+}
+
+static int elants_i2c_query_ts_info_ekth(struct elants_data *ts)
 {
 	struct i2c_client *client = ts->client;
 	int error;
@@ -587,8 +638,20 @@ static int elants_i2c_initialize(struct elants_data *ts)
 		error = elants_i2c_query_test_version(ts);
 	if (!error)
 		error = elants_i2c_query_bc_version(ts);
-	if (!error)
-		error = elants_i2c_query_ts_info(ts);
+
+	switch (ts->chip_id) {
+	case EKTH3500:
+		if (!error)
+			error = elants_i2c_query_ts_info_ekth(ts);
+		break;
+	case EKTF3624:
+		if (!error)
+			error = elants_i2c_query_ts_info_ektf(ts);
+		break;
+	default:
+		unreachable();
+		break;
+	}
 
 	if (error)
 		ts->iap_mode = ELAN_IAP_RECOVERY;
@@ -1185,6 +1248,9 @@ static int elants_i2c_probe(struct i2c_client *client,
 	ts->client = client;
 	i2c_set_clientdata(client, ts);
 
+	if (client->dev.of_node)
+		ts->chip_id = (uintptr_t)of_device_get_match_data(&client->dev);
+
 	ts->vcc33 = devm_regulator_get(&client->dev, "vcc33");
 	if (IS_ERR(ts->vcc33)) {
 		error = PTR_ERR(ts->vcc33);
@@ -1422,7 +1488,8 @@ MODULE_DEVICE_TABLE(acpi, elants_acpi_id);
 
 #ifdef CONFIG_OF
 static const struct of_device_id elants_of_match[] = {
-	{ .compatible = "elan,ekth3500" },
+	{ .compatible = "elan,ekth3500", .data = (void *)EKTH3500 },
+	{ .compatible = "elan,ektf3624", .data = (void *)EKTF3624 },
 	{ /* sentinel */ }
 };
 MODULE_DEVICE_TABLE(of, elants_of_match);
-- 
2.20.1

