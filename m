Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 77D71102B83
	for <lists+linux-input@lfdr.de>; Tue, 19 Nov 2019 19:13:06 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726825AbfKSSNF (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 19 Nov 2019 13:13:05 -0500
Received: from mail.z3ntu.xyz ([128.199.32.197]:41552 "EHLO mail.z3ntu.xyz"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726620AbfKSSNF (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Tue, 19 Nov 2019 13:13:05 -0500
X-Greylist: delayed 315 seconds by postgrey-1.27 at vger.kernel.org; Tue, 19 Nov 2019 13:13:04 EST
Received: from localhost.localdomain (80-110-127-196.cgn.dynamic.surfer.at [80.110.127.196])
        by mail.z3ntu.xyz (Postfix) with ESMTPSA id 066B3DE610;
        Tue, 19 Nov 2019 18:07:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=z3ntu.xyz; s=z3ntu;
        t=1574186867; bh=vX9Z3hazzpYKkIuT58NuZuER7WoMridQbUFkjy2mD+k=;
        h=From:To:Cc:Subject:Date;
        b=H/5HfE1BUYslvjr+YCbopGdzzuCGq15m6w4gQFwXAUv5Yw/dz58BUaGAyTFVfPTzJ
         7lb2lOogpGGeFjM4TJ8N0BOeeoM7ZT/yTzOJWNXEeuf95K596rR1gqGNEn8vaaGBrR
         yKMnNw2DxxqGiNBuk2wQhg4Uzo9FpJ0zpvJ9VcSA=
From:   Luca Weiss <luca@z3ntu.xyz>
To:     linux-input@vger.kernel.org
Cc:     Luca Weiss <luca@z3ntu.xyz>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Marek Vasut <marex@denx.de>,
        Thomas Gleixner <tglx@linutronix.de>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH] Input: ili210x - add ili2120 support
Date:   Tue, 19 Nov 2019 19:05:43 +0100
Message-Id: <20191119180543.120362-1-luca@z3ntu.xyz>
X-Mailer: git-send-email 2.24.0
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
From some testing, the touchscreen works fine with this patch but I'm
not sure it's 100% correct.
I've uploaded the data the panel produces onto pastebin [1], maybe
someone who knows more can take a look at the packets.

Additionally, I know that the code in the driver for querying the
firmware version doesn't work on this panel. The downstream driver
uses some code which I don't really understand, see [2] ; but as the
version string is only used for a dev_dbg statement, I didn't spend
more time with that.

If wanted, I can split out the dt-binding changes to a separate
commit but looking at the git log, many patches are touching both
dt-bindings and driver.

[1] https://pastebin.com/raw/LPeAske5
[2] https://github.com/FairphoneMirrors/android_kernel_fairphone_msm8974/blob/fp2-m-sibon/drivers/input/touchscreen/ilitek/ilitek_aim.c#L850-L861

 .../bindings/input/ilitek,ili2xxx.txt         |  3 +-
 drivers/input/touchscreen/ili210x.c           | 34 +++++++++++++++++--
 2 files changed, 34 insertions(+), 3 deletions(-)

diff --git a/Documentation/devicetree/bindings/input/ilitek,ili2xxx.txt b/Documentation/devicetree/bindings/input/ilitek,ili2xxx.txt
index b2a76301e632..045d1587d17a 100644
--- a/Documentation/devicetree/bindings/input/ilitek,ili2xxx.txt
+++ b/Documentation/devicetree/bindings/input/ilitek,ili2xxx.txt
@@ -1,8 +1,9 @@
-Ilitek ILI210x/ILI251x touchscreen controller
+Ilitek ILI210x/ILI212x/ILI251x touchscreen controller
 
 Required properties:
 - compatible:
     ilitek,ili210x for ILI210x
+    ilitek,ili212x for ILI212x
     ilitek,ili251x for ILI251x
 
 - reg: The I2C address of the device
diff --git a/drivers/input/touchscreen/ili210x.c b/drivers/input/touchscreen/ili210x.c
index e9006407c9bc..8331286ac950 100644
--- a/drivers/input/touchscreen/ili210x.c
+++ b/drivers/input/touchscreen/ili210x.c
@@ -13,6 +13,7 @@
 #include <asm/unaligned.h>
 
 #define ILI210X_TOUCHES		2
+#define ILI212X_TOUCHES		10
 #define ILI251X_TOUCHES		10
 #define DEFAULT_POLL_PERIOD	20
 
@@ -30,6 +31,7 @@ struct firmware_version {
 
 enum ili2xxx_model {
 	MODEL_ILI210X,
+	MODEL_ILI212X,
 	MODEL_ILI251X,
 };
 
@@ -118,6 +120,23 @@ static bool ili210x_touchdata_to_coords(struct ili210x *priv, u8 *touchdata,
 	return true;
 }
 
+static bool ili212x_touchdata_to_coords(struct ili210x *priv, u8 *touchdata,
+					unsigned int finger,
+					unsigned int *x, unsigned int *y)
+{
+	if (finger >= ILI212X_TOUCHES)
+		return false;
+
+	*x = get_unaligned_be16(touchdata + 3 + (finger * 5) + 0);
+	if (!(*x & BIT(15)))	/* Touch indication */
+		return false;
+
+	*x &= 0x3fff;
+	*y = get_unaligned_be16(touchdata + 3 + (finger * 5) + 2);
+
+	return true;
+}
+
 static bool ili251x_touchdata_to_coords(struct ili210x *priv, u8 *touchdata,
 					unsigned int finger,
 					unsigned int *x, unsigned int *y)
@@ -146,6 +165,12 @@ static bool ili210x_report_events(struct ili210x *priv, u8 *touchdata)
 		if (priv->model == MODEL_ILI210X) {
 			touch = ili210x_touchdata_to_coords(priv, touchdata,
 							    i, &x, &y);
+		} else if (priv->model == MODEL_ILI212X) {
+			touch = ili212x_touchdata_to_coords(priv, touchdata,
+							    i, &x, &y);
+
+			if (touch)
+				contact = true;
 		} else if (priv->model == MODEL_ILI251X) {
 			touch = ili251x_touchdata_to_coords(priv, touchdata,
 							    i, &x, &y);
@@ -179,7 +204,8 @@ static void ili210x_work(struct work_struct *work)
 	bool touch;
 	int error = -EINVAL;
 
-	if (priv->model == MODEL_ILI210X) {
+	if (priv->model == MODEL_ILI210X ||
+	    priv->model == MODEL_ILI212X) {
 		error = ili210x_read_reg(client, REG_TOUCHDATA,
 					 touchdata, sizeof(touchdata));
 	} else if (priv->model == MODEL_ILI251X) {
@@ -311,7 +337,9 @@ static int ili210x_i2c_probe(struct i2c_client *client,
 	priv->model = model;
 	if (model == MODEL_ILI210X)
 		priv->max_touches = ILI210X_TOUCHES;
-	if (model == MODEL_ILI251X)
+	else if (model == MODEL_ILI212X)
+		priv->max_touches = ILI212X_TOUCHES;
+	else if (model == MODEL_ILI251X)
 		priv->max_touches = ILI251X_TOUCHES;
 
 	i2c_set_clientdata(client, priv);
@@ -395,6 +423,7 @@ static SIMPLE_DEV_PM_OPS(ili210x_i2c_pm,
 
 static const struct i2c_device_id ili210x_i2c_id[] = {
 	{ "ili210x", MODEL_ILI210X },
+	{ "ili212x", MODEL_ILI212X },
 	{ "ili251x", MODEL_ILI251X },
 	{ }
 };
@@ -402,6 +431,7 @@ MODULE_DEVICE_TABLE(i2c, ili210x_i2c_id);
 
 static const struct of_device_id ili210x_dt_ids[] = {
 	{ .compatible = "ilitek,ili210x", .data = (void *)MODEL_ILI210X },
+	{ .compatible = "ilitek,ili212x", .data = (void *)MODEL_ILI212X },
 	{ .compatible = "ilitek,ili251x", .data = (void *)MODEL_ILI251X },
 	{ },
 };
-- 
2.24.0

