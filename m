Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 820F52EF822
	for <lists+linux-input@lfdr.de>; Fri,  8 Jan 2021 20:30:33 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728667AbhAHT34 (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Fri, 8 Jan 2021 14:29:56 -0500
Received: from mo4-p01-ob.smtp.rzone.de ([85.215.255.50]:32470 "EHLO
        mo4-p01-ob.smtp.rzone.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728539AbhAHT34 (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Fri, 8 Jan 2021 14:29:56 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1610134023;
        s=strato-dkim-0002; d=gerhold.net;
        h=References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:From:
        Subject:Sender;
        bh=bNKLbSpgNS8e9sTXlbrgcuXkmZP8Tz6ceHms9qB/3s4=;
        b=LHOhqLrLEQiBYsjtHeTZdLbDdhbqjZi4c+yJzGZotci8wLUQmJaZ+0J6Z+BYhGuAhK
        z1ZWbzr1qf0NuAmXEy/F0DjOUv7LPsWZVEg+LfJGpKGBSJiEs1/H0HJJWbSKhYnjy6Oh
        1/zWiyNZdek6CyWHjX5/vS6yDWsHnEtiM8bGDD0Zw2cR4o2QdepsZQd4BKZdKOoGqCZ6
        gkwTNKXKNQHD0zkKYmLrMdtpfBrSyV+L7qJYtdjQ8566TUfbU4+PEuiyriLUE+fe/wz7
        a+QnO4xoXPub8bsOqMeV0ehVxzFc/dGZt0X73wKDv9Cek431AySRknjE88NbjF/aYWzG
        /MsQ==
X-RZG-AUTH: ":P3gBZUipdd93FF5ZZvYFPugejmSTVR2nRPhVORvLd4SsytBXS7IYBkLahKxB6m6Efvw="
X-RZG-CLASS-ID: mo00
Received: from droid..
        by smtp.strato.de (RZmta 47.12.1 DYNA|AUTH)
        with ESMTPSA id R0a218x08JNqLk8
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
        (Client did not present a certificate);
        Fri, 8 Jan 2021 20:23:52 +0100 (CET)
From:   Stephan Gerhold <stephan@gerhold.net>
To:     Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc:     linux-input@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
        devicetree@vger.kernel.org,
        Simon Budig <simon.budig@kernelconcepts.de>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Stephan Gerhold <stephan@gerhold.net>,
        Ondrej Jirman <megous@megous.com>,
        Marco Felsch <m.felsch@pengutronix.de>
Subject: [PATCH 2/2] Input: edt-ft5x06 - add support for iovcc-supply
Date:   Fri,  8 Jan 2021 20:23:37 +0100
Message-Id: <20210108192337.563679-2-stephan@gerhold.net>
X-Mailer: git-send-email 2.30.0
In-Reply-To: <20210108192337.563679-1-stephan@gerhold.net>
References: <20210108192337.563679-1-stephan@gerhold.net>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

At the moment, the edt-ft5x06 driver can control a single regulator
("vcc"). However, some FocalTech touch controllers have an additional
IOVCC pin that should be supplied with the digital I/O voltage.

The I/O voltage might be provided by another regulator that should also
be kept on. Otherwise, the touchscreen can randomly stop functioning if
the regulator is turned off because no other components still require it.

Implement (optional) support for also enabling an "iovcc-supply".
IOVCC is needed whenever VCC is needed, so switch to the regulator bulk
APIs to request/enable/disable both when appropriate.

Cc: Ondrej Jirman <megous@megous.com>
Cc: Marco Felsch <m.felsch@pengutronix.de>
Signed-off-by: Stephan Gerhold <stephan@gerhold.net>
---
 drivers/input/touchscreen/edt-ft5x06.c | 35 ++++++++++++++------------
 1 file changed, 19 insertions(+), 16 deletions(-)

diff --git a/drivers/input/touchscreen/edt-ft5x06.c b/drivers/input/touchscreen/edt-ft5x06.c
index 2eefbc2485bc..bf2e208112fe 100644
--- a/drivers/input/touchscreen/edt-ft5x06.c
+++ b/drivers/input/touchscreen/edt-ft5x06.c
@@ -103,7 +103,7 @@ struct edt_ft5x06_ts_data {
 	struct touchscreen_properties prop;
 	u16 num_x;
 	u16 num_y;
-	struct regulator *vcc;
+	struct regulator_bulk_data regulators[2];
 
 	struct gpio_desc *reset_gpio;
 	struct gpio_desc *wake_gpio;
@@ -1066,7 +1066,7 @@ static void edt_ft5x06_disable_regulator(void *arg)
 {
 	struct edt_ft5x06_ts_data *data = arg;
 
-	regulator_disable(data->vcc);
+	regulator_bulk_disable(ARRAY_SIZE(data->regulators), data->regulators);
 }
 
 static int edt_ft5x06_ts_probe(struct i2c_client *client,
@@ -1098,18 +1098,19 @@ static int edt_ft5x06_ts_probe(struct i2c_client *client,
 
 	tsdata->max_support_points = chip_data->max_support_points;
 
-	tsdata->vcc = devm_regulator_get(&client->dev, "vcc");
-	if (IS_ERR(tsdata->vcc)) {
-		error = PTR_ERR(tsdata->vcc);
-		if (error != -EPROBE_DEFER)
-			dev_err(&client->dev,
-				"failed to request regulator: %d\n", error);
-		return error;
-	}
+	tsdata->regulators[0].supply = "vcc";
+	tsdata->regulators[1].supply = "iovcc";
+	error = devm_regulator_bulk_get(&client->dev,
+					ARRAY_SIZE(tsdata->regulators),
+					tsdata->regulators);
+	if (error)
+		return dev_err_probe(&client->dev, error,
+				     "failed to request regulators\n");
 
-	error = regulator_enable(tsdata->vcc);
+	error = regulator_bulk_enable(ARRAY_SIZE(tsdata->regulators),
+				      tsdata->regulators);
 	if (error < 0) {
-		dev_err(&client->dev, "failed to enable vcc: %d\n", error);
+		dev_err(&client->dev, "failed to enable regulators: %d\n", error);
 		return error;
 	}
 
@@ -1286,9 +1287,10 @@ static int __maybe_unused edt_ft5x06_ts_suspend(struct device *dev)
 	gpiod_set_value_cansleep(reset_gpio, 1);
 	usleep_range(1000, 2000);
 
-	ret = regulator_disable(tsdata->vcc);
+	ret = regulator_bulk_disable(ARRAY_SIZE(tsdata->regulators),
+				     tsdata->regulators);
 	if (ret)
-		dev_warn(dev, "Failed to disable vcc\n");
+		dev_warn(dev, "Failed to disable regulators\n");
 
 	return 0;
 }
@@ -1319,9 +1321,10 @@ static int __maybe_unused edt_ft5x06_ts_resume(struct device *dev)
 		gpiod_set_value_cansleep(reset_gpio, 1);
 		usleep_range(5000, 6000);
 
-		ret = regulator_enable(tsdata->vcc);
+		ret = regulator_bulk_enable(ARRAY_SIZE(tsdata->regulators),
+					    tsdata->regulators);
 		if (ret) {
-			dev_err(dev, "Failed to enable vcc\n");
+			dev_err(dev, "Failed to enable regulators\n");
 			return ret;
 		}
 
-- 
2.30.0

