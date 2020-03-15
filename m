Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 23416185BD3
	for <lists+linux-input@lfdr.de>; Sun, 15 Mar 2020 11:04:33 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728220AbgCOKEc (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Sun, 15 Mar 2020 06:04:32 -0400
Received: from outils.crapouillou.net ([89.234.176.41]:50322 "EHLO
        crapouillou.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728197AbgCOKEb (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Sun, 15 Mar 2020 06:04:31 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=crapouillou.net;
        s=mail; t=1584266662; h=from:from:sender:reply-to:subject:subject:date:date:
         message-id:message-id:to:to:cc:cc:mime-version:mime-version:
         content-type:content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=8K4at98VmVZ/sFGzndyiaIeGeVtmYp4j33U5NwycmlE=;
        b=XXxWrlPvXOPw8dW7Zjt0Mj2VJjdLgy7L/rL79sPujQA4p3Kw5LOsk6GmefWjmi6Y/W7EaQ
        AS4rdhpXZo6VXsaaiDQKlpFNrWS44lsEacQ6DjKK1nY6W73CA4tzAKm7iu1ckJl2MU6vNF
        5KrkOENWf1EGUI4ieLRvp5VxTfQtlvU=
From:   Paul Cercueil <paul@crapouillou.net>
To:     Nick Dyer <nick@shmanahar.org>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>
Cc:     linux-input@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        Paul Cercueil <paul@crapouillou.net>
Subject: [PATCH 2/2] input: atmel_mxt_ts: Add support for optional regulator
Date:   Sun, 15 Mar 2020 11:04:16 +0100
Message-Id: <20200315100416.14151-2-paul@crapouillou.net>
In-Reply-To: <20200315100416.14151-1-paul@crapouillou.net>
References: <20200315100416.14151-1-paul@crapouillou.net>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Add support for an optional "vdd" regulator, as some platforms require a
regulator to be enabled for the touchscreen to be enabled.

Signed-off-by: Paul Cercueil <paul@crapouillou.net>
---
 drivers/input/touchscreen/atmel_mxt_ts.c | 25 +++++++++++++++++++++++-
 1 file changed, 24 insertions(+), 1 deletion(-)

diff --git a/drivers/input/touchscreen/atmel_mxt_ts.c b/drivers/input/touchscreen/atmel_mxt_ts.c
index ae60442efda0..b3511dad475a 100644
--- a/drivers/input/touchscreen/atmel_mxt_ts.c
+++ b/drivers/input/touchscreen/atmel_mxt_ts.c
@@ -22,6 +22,7 @@
 #include <linux/interrupt.h>
 #include <linux/of.h>
 #include <linux/property.h>
+#include <linux/regulator/consumer.h>
 #include <linux/slab.h>
 #include <linux/gpio/consumer.h>
 #include <asm/unaligned.h>
@@ -308,6 +309,7 @@ struct mxt_data {
 	struct t7_config t7_cfg;
 	struct mxt_dbg dbg;
 	struct gpio_desc *reset_gpio;
+	struct regulator *vdd;
 
 	/* Cached parameters from object table */
 	u16 T5_address;
@@ -3103,6 +3105,22 @@ static int mxt_probe(struct i2c_client *client, const struct i2c_device_id *id)
 
 	disable_irq(client->irq);
 
+	data->vdd = devm_regulator_get_optional(&client->dev, "vdd");
+	if (IS_ERR(data->vdd)) {
+		error = PTR_ERR(data->vdd);
+		dev_err(&client->dev, "Failed to get regulator: %d\n", error);
+		return error;
+	}
+
+	if (data->vdd) {
+		error = regulator_enable(data->vdd);
+		if (error) {
+			dev_err(&client->dev,
+				"Failed to enable regulator: %d\n", error);
+			return error;
+		}
+	}
+
 	if (data->reset_gpio) {
 		msleep(MXT_RESET_GPIO_TIME);
 		gpiod_set_value(data->reset_gpio, 1);
@@ -3111,7 +3129,7 @@ static int mxt_probe(struct i2c_client *client, const struct i2c_device_id *id)
 
 	error = mxt_initialize(data);
 	if (error)
-		return error;
+		goto err_disable_regulator;
 
 	error = sysfs_create_group(&client->dev.kobj, &mxt_attr_group);
 	if (error) {
@@ -3125,6 +3143,9 @@ static int mxt_probe(struct i2c_client *client, const struct i2c_device_id *id)
 err_free_object:
 	mxt_free_input_device(data);
 	mxt_free_object_table(data);
+err_disable_regulator:
+	if (data->vdd)
+		regulator_disable(data->vdd);
 	return error;
 }
 
@@ -3136,6 +3157,8 @@ static int mxt_remove(struct i2c_client *client)
 	sysfs_remove_group(&client->dev.kobj, &mxt_attr_group);
 	mxt_free_input_device(data);
 	mxt_free_object_table(data);
+	if (data->vdd)
+		regulator_disable(data->vdd);
 
 	return 0;
 }
-- 
2.25.1

