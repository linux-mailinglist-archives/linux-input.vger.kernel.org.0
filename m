Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 22D17E7DB3
	for <lists+linux-input@lfdr.de>; Tue, 29 Oct 2019 01:58:27 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727532AbfJ2A6V (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 28 Oct 2019 20:58:21 -0400
Received: from vps.xff.cz ([195.181.215.36]:51614 "EHLO vps.xff.cz"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727447AbfJ2A6Q (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Mon, 28 Oct 2019 20:58:16 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=megous.com; s=mail;
        t=1572310693; bh=ti3Sk/6TB5q7r+RFOeAHsTKYq7LvJhhN9uE/t8+qFwI=;
        h=From:To:Cc:Subject:Date:References:From;
        b=mvHrNhcjSP83n3YV1+Oadkf1d0GZxaqQFq6D9A9X4b4SHBnyjFxRsU9EkebJNX+0C
         RM9tRvqOUcexIQIq3/1el2WgchOV9N1W/yiGlG1V+/ejb0W3tHAVuLOrtAOoawGQYF
         ev2KAsPhbWaa/QEnidHdfH77PLlk7oXw42Jw1P/o=
From:   Ondrej Jirman <megous@megous.com>
To:     linux-sunxi@googlegroups.com,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Maxime Ripard <mripard@kernel.org>,
        Chen-Yu Tsai <wens@csie.org>,
        Marco Felsch <m.felsch@pengutronix.de>,
        Ondrej Jirman <megous@megous.com>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        =?UTF-8?q?Myl=C3=A8ne=20Josserand?= <mylene.josserand@bootlin.com>
Cc:     linux-input@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: [PATCH 1/3] input: edt-ft5x06: Add support for regulator
Date:   Tue, 29 Oct 2019 01:58:04 +0100
Message-Id: <20191029005806.3577376-2-megous@megous.com>
In-Reply-To: <20191029005806.3577376-1-megous@megous.com>
References: <20191029005806.3577376-1-megous@megous.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

From: Mylène Josserand <mylene.josserand@bootlin.com>

Add the support for enabling optional regulator that may be used as VCC
source.

Signed-off-by: Ondrej Jirman <megous@megous.com>
Signed-off-by: Mylène Josserand <mylene.josserand@bootlin.com>
---
 drivers/input/touchscreen/edt-ft5x06.c | 30 ++++++++++++++++++++++++++
 1 file changed, 30 insertions(+)

diff --git a/drivers/input/touchscreen/edt-ft5x06.c b/drivers/input/touchscreen/edt-ft5x06.c
index 5525f1fb1526..d61731c0037d 100644
--- a/drivers/input/touchscreen/edt-ft5x06.c
+++ b/drivers/input/touchscreen/edt-ft5x06.c
@@ -28,6 +28,7 @@
 #include <linux/input/mt.h>
 #include <linux/input/touchscreen.h>
 #include <asm/unaligned.h>
+#include <linux/regulator/consumer.h>
 
 #define WORK_REGISTER_THRESHOLD		0x00
 #define WORK_REGISTER_REPORT_RATE	0x08
@@ -88,6 +89,7 @@ struct edt_ft5x06_ts_data {
 	struct touchscreen_properties prop;
 	u16 num_x;
 	u16 num_y;
+	struct regulator *vcc;
 
 	struct gpio_desc *reset_gpio;
 	struct gpio_desc *wake_gpio;
@@ -1036,6 +1038,13 @@ edt_ft5x06_ts_set_regs(struct edt_ft5x06_ts_data *tsdata)
 	}
 }
 
+static void edt_ft5x06_disable_regulator(void *arg)
+{
+	struct edt_ft5x06_ts_data *data = arg;
+
+	regulator_disable(data->vcc);
+}
+
 static int edt_ft5x06_ts_probe(struct i2c_client *client,
 					 const struct i2c_device_id *id)
 {
@@ -1064,6 +1073,27 @@ static int edt_ft5x06_ts_probe(struct i2c_client *client,
 
 	tsdata->max_support_points = chip_data->max_support_points;
 
+	tsdata->vcc = devm_regulator_get(&client->dev, "vcc");
+	if (IS_ERR(tsdata->vcc)) {
+		error = PTR_ERR(tsdata->vcc);
+		if (error != -EPROBE_DEFER)
+			dev_err(&client->dev,
+				"failed to request regulator: %d\n", error);
+		return error;
+	}
+
+	error = regulator_enable(tsdata->vcc);
+	if (error < 0) {
+		dev_err(&client->dev, "failed to enable vcc: %d\n", error);
+		return error;
+	}
+
+	error = devm_add_action_or_reset(&client->dev,
+					 edt_ft5x06_disable_regulator,
+					 tsdata);
+	if (error)
+		return error;
+
 	tsdata->reset_gpio = devm_gpiod_get_optional(&client->dev,
 						     "reset", GPIOD_OUT_HIGH);
 	if (IS_ERR(tsdata->reset_gpio)) {
-- 
2.23.0

