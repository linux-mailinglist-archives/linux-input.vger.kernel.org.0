Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A12A61A6703
	for <lists+linux-input@lfdr.de>; Mon, 13 Apr 2020 15:32:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729926AbgDMNca (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 13 Apr 2020 09:32:30 -0400
Received: from rere.qmqm.pl ([91.227.64.183]:7133 "EHLO rere.qmqm.pl"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1729911AbgDMNc2 (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Mon, 13 Apr 2020 09:32:28 -0400
Received: from remote.user (localhost [127.0.0.1])
        by rere.qmqm.pl (Postfix) with ESMTPSA id 4918gG0tSvz1yh;
        Mon, 13 Apr 2020 15:32:26 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=rere.qmqm.pl; s=1;
        t=1586784746; bh=l+BjuCUbTOswk0K/K4hEwJMsEZstBairNk+nO2X5aKg=;
        h=Date:In-Reply-To:References:From:Subject:To:Cc:From;
        b=H3ufMK7zAL9psEYz+DaNKN7ymsrCrMCxn1ksFuKMIk0NZhgwLBVBCxqElaCN9HkcP
         IoTNCcjgEoxCTiFk/GLQ++c3t5iT+dSpBAtZhGwXo1TOdlbJiK6foCdXgluSIdYfoD
         wZd5SdlirSF7x616vl60Z00u1GHezh2FD5D4F5DmdvZvJEnNVWBOdz2hjZYpk/QDx5
         2LvBjOYEC7wMygFjpphEj7V0zz42KAXQb2q9DHUHZiLDievhgimcz1jwVqH/3EmJjR
         KuWjgKvN9lnyxKkdJWq4IXyucQcuY7biZ3RoqEsnCBrtv/2+gvs2mKH6zSQ0KCfYxR
         EIeN8tGVkpe1w==
X-Virus-Status: Clean
X-Virus-Scanned: clamav-milter 0.102.2 at mail
Date:   Mon, 13 Apr 2020 15:32:25 +0200
Message-Id: <d9cbc59382496172555bcbbb4044813b60534374.1586784389.git.mirq-linux@rere.qmqm.pl>
In-Reply-To: <cover.1586784389.git.mirq-linux@rere.qmqm.pl>
References: <cover.1586784389.git.mirq-linux@rere.qmqm.pl>
From:   =?UTF-8?q?Micha=C5=82=20Miros=C5=82aw?= <mirq-linux@rere.qmqm.pl>
Subject: [PATCH v3 6/9] input: elants: read touchscreen size for EKTF3624
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
To:     Dmitry Osipenko <digetx@gmail.com>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Henrik Rydberg <rydberg@bitmath.org>,
        James Chen <james.chen@emc.com.tw>,
        Johnny Chuang <johnny.chuang@emc.com.tw>,
        Rob Herring <robh+dt@kernel.org>,
        Scott Liu <scott.liu@emc.com.tw>,
        David Heidelberg <david@ixit.cz>
Cc:     linux-input@vger.kernel.org, linux-kernel@vger.kernel.org
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

EKTF3624 as present in Asus TF300T tablet has touchscreen size encoded
in different registers.

Signed-off-by: Michał Mirosław <mirq-linux@rere.qmqm.pl>
Reviewed-by: Dmitry Osipenko <digetx@gmail.com>
Tested-by: Dmitry Osipenko <digetx@gmail.com>
---
 drivers/input/touchscreen/elants_i2c.c | 82 ++++++++++++++++++++++++--
 1 file changed, 77 insertions(+), 5 deletions(-)

diff --git a/drivers/input/touchscreen/elants_i2c.c b/drivers/input/touchscreen/elants_i2c.c
index b0f083f7f2a9..2b936e920874 100644
--- a/drivers/input/touchscreen/elants_i2c.c
+++ b/drivers/input/touchscreen/elants_i2c.c
@@ -34,7 +34,7 @@
 #include <linux/input/mt.h>
 #include <linux/input/touchscreen.h>
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
 
@@ -164,6 +168,7 @@ struct elants_data {
 
 	bool wake_irq_enabled;
 	bool keep_power_in_suspend;
+	u8 chip_id;
 
 	/* Must be last to be used for DMA operations */
 	u8 buf[MAX_PACKET_SIZE] ____cacheline_aligned;
@@ -442,7 +447,58 @@ static int elants_i2c_query_bc_version(struct elants_data *ts)
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
+	if (!phy_x || !phy_y) {
+		dev_warn(&client->dev,
+			 "invalid size data: %d x %d mm\n",
+			 phy_x, phy_y);
+		return 0;
+	}
+
+	dev_dbg(&client->dev, "phy_x=%d, phy_y=%d\n", phy_x, phy_y);
+
+	/* calculate resolution from size */
+	ts->x_max = 2240-1;
+	ts->x_res = DIV_ROUND_CLOSEST(ts->prop.max_x, phy_x);
+
+	ts->y_max = 1408-1;
+	ts->y_res = DIV_ROUND_CLOSEST(ts->prop.max_y, phy_y);
+
+	return 0;
+}
+
+static int elants_i2c_query_ts_info_ekth(struct elants_data *ts)
 {
 	struct i2c_client *client = ts->client;
 	int error;
@@ -593,8 +649,20 @@ static int elants_i2c_initialize(struct elants_data *ts)
 		error = elants_i2c_query_fw_version(ts);
 	if (!error)
 		error = elants_i2c_query_test_version(ts);
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
@@ -1245,6 +1313,9 @@ static int elants_i2c_probe(struct i2c_client *client,
 	ts->client = client;
 	i2c_set_clientdata(client, ts);
 
+	if (client->dev.of_node)
+		ts->chip_id = (uintptr_t)of_device_get_match_data(&client->dev);
+
 	ts->vcc33 = devm_regulator_get(&client->dev, "vcc33");
 	if (IS_ERR(ts->vcc33)) {
 		error = PTR_ERR(ts->vcc33);
@@ -1470,7 +1541,8 @@ MODULE_DEVICE_TABLE(acpi, elants_acpi_id);
 
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

