Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B5016156AF6
	for <lists+linux-input@lfdr.de>; Sun,  9 Feb 2020 16:20:29 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727698AbgBIPU2 (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Sun, 9 Feb 2020 10:20:28 -0500
Received: from mail.z3ntu.xyz ([128.199.32.197]:50494 "EHLO mail.z3ntu.xyz"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727514AbgBIPU2 (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Sun, 9 Feb 2020 10:20:28 -0500
Received: from localhost.localdomain (80-110-126-226.cgn.dynamic.surfer.at [80.110.126.226])
        by mail.z3ntu.xyz (Postfix) with ESMTPSA id 00E4DC1E6F;
        Sun,  9 Feb 2020 15:20:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=z3ntu.xyz; s=z3ntu;
        t=1581261625; bh=yU5+GbnKv24kCO8ScL2Ee8KtKAa6j8RtJf1mj6xw9tg=;
        h=From:To:Cc:Subject:Date;
        b=nvy5+HxvKgqPca59Ke/8b/MWJn6wdmZNuW45zMihRHDSVzKrRr2l7eisM5GsOaD6m
         h3YslYNtbyNyGdKHI5KohpQqil8G+WKNwaACejW/ZdfmXxJqlj8WrS9HXD1H55Tqls
         YtlyPJ8e8vq6Yj6WEp8fk16RMKBsLcbj9q/w+KRA=
From:   Luca Weiss <luca@z3ntu.xyz>
To:     linux-input@vger.kernel.org
Cc:     ~postmarketos/upstreaming@lists.sr.ht, Luca Weiss <luca@z3ntu.xyz>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Sven Van Asbroeck <thesven73@gmail.com>,
        Marek Vasut <marex@denx.de>,
        Thomas Gleixner <tglx@linutronix.de>,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH v2] Input: ili210x - add ili2120 support
Date:   Sun,  9 Feb 2020 16:19:03 +0100
Message-Id: <20200209151904.661210-1-luca@z3ntu.xyz>
X-Mailer: git-send-email 2.25.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

This adds support for the Ilitek ili2120 touchscreen found in the
Fairphone 2 smartphone.

Signed-off-by: Luca Weiss <luca@z3ntu.xyz>
---
Changes from v1:
- Rebase on master, adjust for upstream changes

 .../bindings/input/ilitek,ili2xxx.txt         |  3 +-
 drivers/input/touchscreen/ili210x.c           | 32 +++++++++++++++++++
 2 files changed, 34 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/input/ilitek,ili2xxx.txt b/Documentation/devicetree/bindings/input/ilitek,ili2xxx.txt
index dc194b2c151a..cdcaa3f52d25 100644
--- a/Documentation/devicetree/bindings/input/ilitek,ili2xxx.txt
+++ b/Documentation/devicetree/bindings/input/ilitek,ili2xxx.txt
@@ -1,9 +1,10 @@
-Ilitek ILI210x/ILI2117/ILI251x touchscreen controller
+Ilitek ILI210x/ILI2117/ILI2120/ILI251x touchscreen controller
 
 Required properties:
 - compatible:
     ilitek,ili210x for ILI210x
     ilitek,ili2117 for ILI2117
+    ilitek,ili2120 for ILI2120
     ilitek,ili251x for ILI251x
 
 - reg: The I2C address of the device
diff --git a/drivers/input/touchscreen/ili210x.c b/drivers/input/touchscreen/ili210x.c
index 84bf51d79888..199cf3daec10 100644
--- a/drivers/input/touchscreen/ili210x.c
+++ b/drivers/input/touchscreen/ili210x.c
@@ -167,6 +167,36 @@ static const struct ili2xxx_chip ili211x_chip = {
 	.resolution		= 2048,
 };
 
+static bool ili212x_touchdata_to_coords(const u8 *touchdata,
+					unsigned int finger,
+					unsigned int *x, unsigned int *y)
+{
+	u16 val;
+
+	val = get_unaligned_be16(touchdata + 3 + (finger * 5) + 0);
+	if (!(val & BIT(15)))	/* Touch indication */
+		return false;
+
+	*x = val & 0x3fff;
+	*y = get_unaligned_be16(touchdata + 3 + (finger * 5) + 2);
+
+	return true;
+}
+
+static bool ili212x_check_continue_polling(const u8 *data, bool touch)
+{
+	return touch;
+}
+
+static const struct ili2xxx_chip ili212x_chip = {
+	.read_reg		= ili210x_read_reg,
+	.get_touch_data		= ili210x_read_touch_data,
+	.parse_touch_data	= ili212x_touchdata_to_coords,
+	.continue_polling	= ili212x_check_continue_polling,
+	.max_touches		= 10,
+	.has_calibrate_reg	= true,
+};
+
 static int ili251x_read_reg(struct i2c_client *client,
 			    u8 reg, void *buf, size_t len)
 {
@@ -447,6 +477,7 @@ static int ili210x_i2c_probe(struct i2c_client *client,
 static const struct i2c_device_id ili210x_i2c_id[] = {
 	{ "ili210x", (long)&ili210x_chip },
 	{ "ili2117", (long)&ili211x_chip },
+	{ "ili2120", (long)&ili212x_chip },
 	{ "ili251x", (long)&ili251x_chip },
 	{ }
 };
@@ -455,6 +486,7 @@ MODULE_DEVICE_TABLE(i2c, ili210x_i2c_id);
 static const struct of_device_id ili210x_dt_ids[] = {
 	{ .compatible = "ilitek,ili210x", .data = &ili210x_chip },
 	{ .compatible = "ilitek,ili2117", .data = &ili211x_chip },
+	{ .compatible = "ilitek,ili2120", .data = &ili212x_chip },
 	{ .compatible = "ilitek,ili251x", .data = &ili251x_chip },
 	{ }
 };
-- 
2.25.0

