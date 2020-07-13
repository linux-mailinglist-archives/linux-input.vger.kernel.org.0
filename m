Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0420121CC66
	for <lists+linux-input@lfdr.de>; Mon, 13 Jul 2020 02:25:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728720AbgGMAY5 (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Sun, 12 Jul 2020 20:24:57 -0400
Received: from rere.qmqm.pl ([91.227.64.183]:42511 "EHLO rere.qmqm.pl"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728454AbgGMAY5 (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Sun, 12 Jul 2020 20:24:57 -0400
Received: from remote.user (localhost [127.0.0.1])
        by rere.qmqm.pl (Postfix) with ESMTPSA id 4B4ktZ6THTzbg;
        Mon, 13 Jul 2020 02:24:54 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=rere.qmqm.pl; s=1;
        t=1594599895; bh=Yc1vLHFmVPmy/CjuM6EnoVAG4BHzdf5+1VHpHmaXcu4=;
        h=Date:In-Reply-To:References:From:Subject:To:Cc:From;
        b=m/yJLDZ1tGI1rbI1v1t19Af3dGlDaCHR0GRugyWVorDLJTo553q2wjOF9VUvAbNgT
         qGkmSys9SNlZyS6IsnSojRXHCsUzTEeIOJD1K2j1tWnkvh+jC4NBDJemSaUInEqIwq
         /BJRW07wodV7MH3JsoeV13Pn+A/M6tO/wGtq/v1JY1LKI+SYg2cej9fS94GxtoZ4Ou
         6y/YaKG975GzkhLHxCnyGN0CNGLG9elmtkYi8WYdGCYbWQjzLu9AgLKRP3WtCpZBiO
         /suLmvSPF9BRDc5o78l5NzFejT52GiMogIl93WCRkoxfEwaOgJW6PNoGF8VlsVEO8H
         Gv63ffji+AFfw==
X-Virus-Status: Clean
X-Virus-Scanned: clamav-milter 0.102.3 at mail
Date:   Mon, 13 Jul 2020 02:24:54 +0200
Message-Id: <2f42bab5fc45d41bdac2a07a67b49c34b55eab0b.1594599118.git.mirq-linux@rere.qmqm.pl>
In-Reply-To: <cover.1594599118.git.mirq-linux@rere.qmqm.pl>
References: <cover.1594599118.git.mirq-linux@rere.qmqm.pl>
From:   =?UTF-8?q?Micha=C5=82=20Miros=C5=82aw?= <mirq-linux@rere.qmqm.pl>
Subject: [PATCH v6 3/5] input: elants: read touchscreen size for EKTF3624
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
To:     Dmitry Osipenko <digetx@gmail.com>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Henrik Rydberg <rydberg@bitmath.org>,
        James Chen <james.chen@emc.com.tw>,
        Johnny Chuang <johnny.chuang@emc.com.tw>,
        Scott Liu <scott.liu@emc.com.tw>
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
 drivers/input/touchscreen/elants_i2c.c | 84 ++++++++++++++++++++++++--
 1 file changed, 79 insertions(+), 5 deletions(-)

diff --git a/drivers/input/touchscreen/elants_i2c.c b/drivers/input/touchscreen/elants_i2c.c
index ba1816d08530..d4c60c9fc38b 100644
--- a/drivers/input/touchscreen/elants_i2c.c
+++ b/drivers/input/touchscreen/elants_i2c.c
@@ -35,7 +35,7 @@
 #include <linux/input/mt.h>
 #include <linux/input/touchscreen.h>
 #include <linux/acpi.h>
-#include <linux/of.h>
+#include <linux/of_device.h>
 #include <linux/gpio/consumer.h>
 #include <linux/regulator/consumer.h>
 #include <asm/unaligned.h>
@@ -43,6 +43,10 @@
 /* Device, Driver information */
 #define DEVICE_NAME	"elants_i2c"
 
+/* Device IDs */
+#define EKTH3500	0
+#define EKTF3624	1
+
 /* Convert from rows or columns into resolution */
 #define ELAN_TS_RESOLUTION(n, m)   (((n) - 1) * (m))
 
@@ -94,6 +98,8 @@
 #define E_ELAN_INFO_REK		0xE0
 #define E_ELAN_INFO_TEST_VER	0xE0
 #define E_ELAN_INFO_FW_ID	0xF0
+#define E_INFO_X_RES		0x60
+#define E_INFO_Y_RES		0x63
 #define E_INFO_OSR		0xD6
 #define E_INFO_PHY_SCAN		0xD7
 #define E_INFO_PHY_DRIVER	0xD8
@@ -156,6 +162,7 @@ struct elants_data {
 
 	bool wake_irq_enabled;
 	bool keep_power_in_suspend;
+	u8 chip_id;
 
 	/* Must be last to be used for DMA operations */
 	u8 buf[MAX_PACKET_SIZE] ____cacheline_aligned;
@@ -433,7 +440,58 @@ static int elants_i2c_query_bc_version(struct elants_data *ts)
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
@@ -584,8 +642,20 @@ static int elants_i2c_initialize(struct elants_data *ts)
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
@@ -1262,6 +1332,9 @@ static int elants_i2c_probe(struct i2c_client *client,
 	ts->client = client;
 	i2c_set_clientdata(client, ts);
 
+	if (client->dev.of_node)
+		ts->chip_id = (uintptr_t)of_device_get_match_data(&client->dev);
+
 	ts->vcc33 = devm_regulator_get(&client->dev, "vcc33");
 	if (IS_ERR(ts->vcc33)) {
 		error = PTR_ERR(ts->vcc33);
@@ -1489,7 +1562,8 @@ MODULE_DEVICE_TABLE(acpi, elants_acpi_id);
 
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

