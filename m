Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 12900F36AF
	for <lists+linux-input@lfdr.de>; Thu,  7 Nov 2019 19:10:40 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725912AbfKGSKX (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 7 Nov 2019 13:10:23 -0500
Received: from bhuna.collabora.co.uk ([46.235.227.227]:51898 "EHLO
        bhuna.collabora.co.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725930AbfKGSKX (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Thu, 7 Nov 2019 13:10:23 -0500
Received: from [127.0.0.1] (localhost [127.0.0.1])
        (Authenticated sender: sre)
        with ESMTPSA id 4696B29036F
Received: by jupiter.universe (Postfix, from userid 1000)
        id 41BBC48009C; Thu,  7 Nov 2019 19:10:17 +0100 (CET)
From:   Sebastian Reichel <sebastian.reichel@collabora.com>
To:     Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Ahmet Inan <inan@distec.de>
Cc:     linux-input@vger.kernel.org, linux-kernel@vger.kernel.org,
        kernel@collabora.com,
        Sebastian Reichel <sebastian.reichel@collabora.com>
Subject: [PATCHv1 1/2] Input: EXC3000: add EXC80Hxx support
Date:   Thu,  7 Nov 2019 19:10:09 +0100
Message-Id: <20191107181010.17211-1-sebastian.reichel@collabora.com>
X-Mailer: git-send-email 2.24.0.rc1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

This adds support for EXC80Hxx controllers, which uses
a different event type id and has two extra bits for the
resolution (so the maximum is 16384 instead of 4096).

The patch has been tested with EXC80H60 and EXC80H84.

Signed-off-by: Sebastian Reichel <sebastian.reichel@collabora.com>
---
 .../bindings/input/touchscreen/exc3000.txt    |  6 ++--
 drivers/input/touchscreen/exc3000.c           | 34 ++++++++++++++-----
 2 files changed, 30 insertions(+), 10 deletions(-)

diff --git a/Documentation/devicetree/bindings/input/touchscreen/exc3000.txt b/Documentation/devicetree/bindings/input/touchscreen/exc3000.txt
index 68291b94fec2..057b680f0420 100644
--- a/Documentation/devicetree/bindings/input/touchscreen/exc3000.txt
+++ b/Documentation/devicetree/bindings/input/touchscreen/exc3000.txt
@@ -1,7 +1,9 @@
-* EETI EXC3000 Multiple Touch Controller
+* EETI EXC3000 and EXC80Hxx Multiple Touch Controller
 
 Required properties:
-- compatible: must be "eeti,exc3000"
+- compatible: must be one of
+ * "eeti,exc3000"
+ * "eeti,exc80hxx"
 - reg: i2c slave address
 - interrupts: touch controller interrupt
 - touchscreen-size-x: See touchscreen.txt
diff --git a/drivers/input/touchscreen/exc3000.c b/drivers/input/touchscreen/exc3000.c
index e007e2e8f626..7d695022082c 100644
--- a/drivers/input/touchscreen/exc3000.c
+++ b/drivers/input/touchscreen/exc3000.c
@@ -23,11 +23,20 @@
 #define EXC3000_SLOTS_PER_FRAME		5
 #define EXC3000_LEN_FRAME		66
 #define EXC3000_LEN_POINT		10
-#define EXC3000_MT_EVENT		6
+
+#define EXC3000_MT1_EVENT		0x06
+#define EXC3000_MT2_EVENT		0x18
+
 #define EXC3000_TIMEOUT_MS		100
 
+enum exc3000_device_type {
+	EETI_EXC3000,
+	EETI_EXC80Hxx
+};
+
 struct exc3000_data {
 	struct i2c_client *client;
+	enum exc3000_device_type type;
 	struct input_dev *input;
 	struct touchscreen_properties prop;
 	struct timer_list timer;
@@ -76,8 +85,10 @@ static int exc3000_read_frame(struct i2c_client *client, u8 *buf)
 	if (ret != EXC3000_LEN_FRAME)
 		return -EIO;
 
-	if (get_unaligned_le16(buf) != EXC3000_LEN_FRAME ||
-			buf[2] != EXC3000_MT_EVENT)
+	if (get_unaligned_le16(buf) != EXC3000_LEN_FRAME)
+		return -EINVAL;
+
+	if (buf[2] != EXC3000_MT1_EVENT && buf[2] != EXC3000_MT2_EVENT)
 		return -EINVAL;
 
 	return 0;
@@ -157,6 +168,7 @@ static int exc3000_probe(struct i2c_client *client,
 		return -ENOMEM;
 
 	data->client = client;
+	data->type = id->driver_data;
 	timer_setup(&data->timer, exc3000_timer, 0);
 
 	input = devm_input_allocate_device(&client->dev);
@@ -168,8 +180,13 @@ static int exc3000_probe(struct i2c_client *client,
 	input->name = "EETI EXC3000 Touch Screen";
 	input->id.bustype = BUS_I2C;
 
-	input_set_abs_params(input, ABS_MT_POSITION_X, 0, 4095, 0, 0);
-	input_set_abs_params(input, ABS_MT_POSITION_Y, 0, 4095, 0, 0);
+	if (data->type == EETI_EXC80Hxx) {
+		input_set_abs_params(input, ABS_MT_POSITION_X, 0, 16383, 0, 0);
+		input_set_abs_params(input, ABS_MT_POSITION_Y, 0, 16383, 0, 0);
+	} else {
+		input_set_abs_params(input, ABS_MT_POSITION_X, 0, 4095, 0, 0);
+		input_set_abs_params(input, ABS_MT_POSITION_Y, 0, 4095, 0, 0);
+	}
 	touchscreen_parse_properties(input, true, &data->prop);
 
 	error = input_mt_init_slots(input, EXC3000_NUM_SLOTS,
@@ -191,14 +208,15 @@ static int exc3000_probe(struct i2c_client *client,
 }
 
 static const struct i2c_device_id exc3000_id[] = {
-	{ "exc3000", 0 },
-	{ }
+	{ "exc3000", EETI_EXC3000 },
+	{ "exc80hxx", EETI_EXC80Hxx }
 };
 MODULE_DEVICE_TABLE(i2c, exc3000_id);
 
 #ifdef CONFIG_OF
 static const struct of_device_id exc3000_of_match[] = {
-	{ .compatible = "eeti,exc3000" },
+	{ .compatible = "eeti,exc3000", .data = (const void*) EETI_EXC3000 },
+	{ .compatible = "eeti,exc80hxx", .data = (const void*) EETI_EXC80Hxx },
 	{ }
 };
 MODULE_DEVICE_TABLE(of, exc3000_of_match);
-- 
2.24.0.rc1

