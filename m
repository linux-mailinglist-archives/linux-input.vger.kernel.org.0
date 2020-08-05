Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A25FE23D257
	for <lists+linux-input@lfdr.de>; Wed,  5 Aug 2020 22:11:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727772AbgHEULj (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 5 Aug 2020 16:11:39 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42982 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726844AbgHEQ1m (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Wed, 5 Aug 2020 12:27:42 -0400
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk [IPv6:2a00:1098:0:82:1000:25:2eeb:e3e3])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7EE1AC001FD6;
        Wed,  5 Aug 2020 09:05:26 -0700 (PDT)
Received: from [127.0.0.1] (localhost [127.0.0.1])
        (Authenticated sender: sre)
        with ESMTPSA id 76749299000
Received: by jupiter.universe (Postfix, from userid 1000)
        id 3D506480119; Wed,  5 Aug 2020 18:05:21 +0200 (CEST)
From:   Sebastian Reichel <sebastian.reichel@collabora.com>
To:     Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Ahmet Inan <inan@distec.de>,
        Martin Fuzzey <martin.fuzzey@flowbird.group>,
        Rob Herring <robh+dt@kernel.org>
Cc:     linux-input@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, kernel@collabora.com,
        Sebastian Reichel <sebastian.reichel@collabora.com>
Subject: [PATCHv4 2/4] Input: EXC3000: add EXC80H60 and EXC80H84 support
Date:   Wed,  5 Aug 2020 18:05:18 +0200
Message-Id: <20200805160520.456570-3-sebastian.reichel@collabora.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20200805160520.456570-1-sebastian.reichel@collabora.com>
References: <20200805160520.456570-1-sebastian.reichel@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

This adds support for EXC80H60 and EXCH84 controllers, which
use a different event type id and have two extra bits for the
resolution (so the maximum is 16K instead of 4K).

Signed-off-by: Sebastian Reichel <sebastian.reichel@collabora.com>
---
 .../input/touchscreen/eeti,exc3000.yaml       |  5 +-
 drivers/input/touchscreen/exc3000.c           | 80 +++++++++++++++----
 2 files changed, 70 insertions(+), 15 deletions(-)

diff --git a/Documentation/devicetree/bindings/input/touchscreen/eeti,exc3000.yaml b/Documentation/devicetree/bindings/input/touchscreen/eeti,exc3000.yaml
index 022aa69a5dfe..7e6e23f8fa00 100644
--- a/Documentation/devicetree/bindings/input/touchscreen/eeti,exc3000.yaml
+++ b/Documentation/devicetree/bindings/input/touchscreen/eeti,exc3000.yaml
@@ -14,7 +14,10 @@ allOf:
 
 properties:
   compatible:
-    const: eeti,exc3000
+    enum:
+      - eeti,exc3000
+      - eeti,exc80h60
+      - eeti,exc80h84
   reg:
     const: 0x2a
   interrupts:
diff --git a/drivers/input/touchscreen/exc3000.c b/drivers/input/touchscreen/exc3000.c
index 555a14305cd4..b497bd2ae41d 100644
--- a/drivers/input/touchscreen/exc3000.c
+++ b/drivers/input/touchscreen/exc3000.c
@@ -16,6 +16,7 @@
 #include <linux/interrupt.h>
 #include <linux/module.h>
 #include <linux/of.h>
+#include <linux/sizes.h>
 #include <linux/timer.h>
 #include <asm/unaligned.h>
 
@@ -23,11 +24,43 @@
 #define EXC3000_SLOTS_PER_FRAME		5
 #define EXC3000_LEN_FRAME		66
 #define EXC3000_LEN_POINT		10
-#define EXC3000_MT_EVENT		6
+
+#define EXC3000_MT1_EVENT		0x06
+#define EXC3000_MT2_EVENT		0x18
+
 #define EXC3000_TIMEOUT_MS		100
 
+static const struct i2c_device_id exc3000_id[];
+
+struct eeti_dev_info {
+	const char *name;
+	int max_xy;
+};
+
+enum eeti_dev_id {
+	EETI_EXC3000,
+	EETI_EXC80H60,
+	EETI_EXC80H84,
+};
+
+static struct eeti_dev_info exc3000_info[] = {
+	[EETI_EXC3000] = {
+		.name = "EETI EXC3000 Touch Screen",
+		.max_xy = SZ_4K - 1,
+	},
+	[EETI_EXC80H60] = {
+		.name = "EETI EXC80H60 Touch Screen",
+		.max_xy = SZ_16K - 1,
+	},
+	[EETI_EXC80H84] = {
+		.name = "EETI EXC80H84 Touch Screen",
+		.max_xy = SZ_16K - 1,
+	},
+};
+
 struct exc3000_data {
 	struct i2c_client *client;
+	const struct eeti_dev_info *info;
 	struct input_dev *input;
 	struct touchscreen_properties prop;
 	struct timer_list timer;
@@ -58,10 +91,15 @@ static void exc3000_timer(struct timer_list *t)
 	input_sync(data->input);
 }
 
-static int exc3000_read_frame(struct i2c_client *client, u8 *buf)
+static int exc3000_read_frame(struct exc3000_data *data, u8 *buf)
 {
+	struct i2c_client *client = data->client;
+	u8 expected_event = EXC3000_MT1_EVENT;
 	int ret;
 
+	if (data->info->max_xy == SZ_16K - 1)
+		expected_event = EXC3000_MT2_EVENT;
+
 	ret = i2c_master_send(client, "'", 2);
 	if (ret < 0)
 		return ret;
@@ -76,19 +114,21 @@ static int exc3000_read_frame(struct i2c_client *client, u8 *buf)
 	if (ret != EXC3000_LEN_FRAME)
 		return -EIO;
 
-	if (get_unaligned_le16(buf) != EXC3000_LEN_FRAME ||
-			buf[2] != EXC3000_MT_EVENT)
+	if (get_unaligned_le16(buf) != EXC3000_LEN_FRAME)
+		return -EINVAL;
+
+	if (buf[2] != expected_event)
 		return -EINVAL;
 
 	return 0;
 }
 
-static int exc3000_read_data(struct i2c_client *client,
+static int exc3000_read_data(struct exc3000_data *data,
 			     u8 *buf, int *n_slots)
 {
 	int error;
 
-	error = exc3000_read_frame(client, buf);
+	error = exc3000_read_frame(data, buf);
 	if (error)
 		return error;
 
@@ -98,7 +138,7 @@ static int exc3000_read_data(struct i2c_client *client,
 
 	if (*n_slots > EXC3000_SLOTS_PER_FRAME) {
 		/* Read 2nd frame to get the rest of the contacts. */
-		error = exc3000_read_frame(client, buf + EXC3000_LEN_FRAME);
+		error = exc3000_read_frame(data, buf + EXC3000_LEN_FRAME);
 		if (error)
 			return error;
 
@@ -118,7 +158,7 @@ static irqreturn_t exc3000_interrupt(int irq, void *dev_id)
 	int slots, total_slots;
 	int error;
 
-	error = exc3000_read_data(data->client, buf, &total_slots);
+	error = exc3000_read_data(data, buf, &total_slots);
 	if (error) {
 		/* Schedule a timer to release "stuck" contacts */
 		mod_timer(&data->timer,
@@ -149,13 +189,19 @@ static int exc3000_probe(struct i2c_client *client)
 {
 	struct exc3000_data *data;
 	struct input_dev *input;
-	int error;
+	int error, max_xy;
 
 	data = devm_kzalloc(&client->dev, sizeof(*data), GFP_KERNEL);
 	if (!data)
 		return -ENOMEM;
 
 	data->client = client;
+	data->info = device_get_match_data(&client->dev);
+	if (!data->info) {
+		enum eeti_dev_id eeti_dev_id =
+			i2c_match_id(exc3000_id, client)->driver_data;
+		data->info = &exc3000_info[eeti_dev_id];
+	}
 	timer_setup(&data->timer, exc3000_timer, 0);
 
 	input = devm_input_allocate_device(&client->dev);
@@ -164,11 +210,13 @@ static int exc3000_probe(struct i2c_client *client)
 
 	data->input = input;
 
-	input->name = "EETI EXC3000 Touch Screen";
+	input->name = data->info->name;
 	input->id.bustype = BUS_I2C;
 
-	input_set_abs_params(input, ABS_MT_POSITION_X, 0, 4095, 0, 0);
-	input_set_abs_params(input, ABS_MT_POSITION_Y, 0, 4095, 0, 0);
+	max_xy = data->info->max_xy;
+	input_set_abs_params(input, ABS_MT_POSITION_X, 0, max_xy, 0, 0);
+	input_set_abs_params(input, ABS_MT_POSITION_Y, 0, max_xy, 0, 0);
+
 	touchscreen_parse_properties(input, true, &data->prop);
 
 	error = input_mt_init_slots(input, EXC3000_NUM_SLOTS,
@@ -190,14 +238,18 @@ static int exc3000_probe(struct i2c_client *client)
 }
 
 static const struct i2c_device_id exc3000_id[] = {
-	{ "exc3000", 0 },
+	{ "exc3000", EETI_EXC3000 },
+	{ "exc80h60", EETI_EXC80H60 },
+	{ "exc80h84", EETI_EXC80H84 },
 	{ }
 };
 MODULE_DEVICE_TABLE(i2c, exc3000_id);
 
 #ifdef CONFIG_OF
 static const struct of_device_id exc3000_of_match[] = {
-	{ .compatible = "eeti,exc3000" },
+	{ .compatible = "eeti,exc3000", .data = &exc3000_info[EETI_EXC3000] },
+	{ .compatible = "eeti,exc80h60", .data = &exc3000_info[EETI_EXC80H60] },
+	{ .compatible = "eeti,exc80h84", .data = &exc3000_info[EETI_EXC80H84] },
 	{ }
 };
 MODULE_DEVICE_TABLE(of, exc3000_of_match);
-- 
2.27.0

