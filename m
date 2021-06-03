Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 242F8399930
	for <lists+linux-input@lfdr.de>; Thu,  3 Jun 2021 06:37:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229620AbhFCEjX (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 3 Jun 2021 00:39:23 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55554 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229487AbhFCEjX (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Thu, 3 Jun 2021 00:39:23 -0400
Received: from mail-pj1-x102b.google.com (mail-pj1-x102b.google.com [IPv6:2607:f8b0:4864:20::102b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 344AEC061760;
        Wed,  2 Jun 2021 21:37:39 -0700 (PDT)
Received: by mail-pj1-x102b.google.com with SMTP id d5-20020a17090ab305b02901675357c371so4403045pjr.1;
        Wed, 02 Jun 2021 21:37:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=g/gMhdEoqowTYEWix8YSTA+qLiDKomFphX1/sf/ZHqo=;
        b=Tt033Y3HybZ6JX3NcnD8iLIqHctigtwCUC21/EVel/aQIvwGc5rO4YVZEP/TSBlNLH
         sT6jEe2NM5nG+2IyeCicwgP9UMhwXc3Lli6yKcY2o0IIR9tnhr9JLVkNhlPR71k/Pooc
         WiVkjxY4g2VZdYYEaG8JEOQinp23xLYnZ5j0HkeoqbQ6/u5tXzBHq5IL7/DzxMIhkb/L
         NwggF8BTh0sMoooCG7OyjBT3vvGih5sIshZXHwHOLiNc9TyWWJUcgxoIWusOvcFxwc/Y
         wi7nmxmM43Oh2/UjmDH+Jovc4rfCH509oKCdOvxyrhcQ6p1lra7i0GTQvSW5L3QCA8UG
         9OIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=g/gMhdEoqowTYEWix8YSTA+qLiDKomFphX1/sf/ZHqo=;
        b=Hfkt5GfrOEEv8uMsYZ6t3fvOIxgwUNhG0VCYKbm8+oGc61di6g2s7bN9XjNgpvj/lj
         t89iYhyjFxKjUgshhqFl1FQhCyqXwiNrlRCQy64Wz842xC41rqBEiOpUYs/T/DSK7znO
         4S6i2AvoqhTw+iqzafZUGIljGXLaKF7PAB9ZDDbF7iVeNNYEwerGzYS61ZBMuYlsc8pW
         6aWjVRrsnAg1iJIhNzxMRVW4BrTqTEumB9K6W3cC2tSBF+cdAKGO7q+Ndx8bctTvaHAk
         Hv2JGWMnj3tr84dz7EPd45ZPlNtowl/s9CjIHt1nYuBaeEBgZYbMATkJ6tnSGj1Y7tz9
         4sxQ==
X-Gm-Message-State: AOAM533nwYmLlrME47md0k2A77/+uONJukLOBSweTayDa6BFF46gb1dm
        so/UjgNU7gqEc8TTJPC5F9tErr4m454=
X-Google-Smtp-Source: ABdhPJybJ7tvroqV9M4LP/TCHYgHuz+ThXZJnBHGrVYKSqgGAJxYR4g1VnFu2050+ZHhHYiHhDMljA==
X-Received: by 2002:a17:90a:668d:: with SMTP id m13mr30013638pjj.144.1622695058088;
        Wed, 02 Jun 2021 21:37:38 -0700 (PDT)
Received: from dtor-ws.mtv.corp.google.com ([2620:15c:202:201:fc6a:97ca:f00c:8377])
        by smtp.gmail.com with ESMTPSA id f28sm1132414pgb.12.2021.06.02.21.37.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Jun 2021 21:37:37 -0700 (PDT)
From:   Dmitry Torokhov <dmitry.torokhov@gmail.com>
To:     linux-input@vger.kernel.org
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        linux-kernel@vger.kernel.org
Subject: [PATCH 6/7] Input: cy8ctmg110_ts - switch to using managed resources
Date:   Wed,  2 Jun 2021 21:37:25 -0700
Message-Id: <20210603043726.3793876-6-dmitry.torokhov@gmail.com>
X-Mailer: git-send-email 2.32.0.rc0.204.g9fa02ecfa5-goog
In-Reply-To: <20210603043726.3793876-1-dmitry.torokhov@gmail.com>
References: <20210603043726.3793876-1-dmitry.torokhov@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

This simplifies error handling paths and allows to get rid of
cy8ctmg110_remove() method.

Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
---
 drivers/input/touchscreen/cy8ctmg110_ts.c | 74 +++++++++--------------
 1 file changed, 28 insertions(+), 46 deletions(-)

diff --git a/drivers/input/touchscreen/cy8ctmg110_ts.c b/drivers/input/touchscreen/cy8ctmg110_ts.c
index 33c1360a251c..33ccb31cad52 100644
--- a/drivers/input/touchscreen/cy8ctmg110_ts.c
+++ b/drivers/input/touchscreen/cy8ctmg110_ts.c
@@ -161,6 +161,14 @@ static irqreturn_t cy8ctmg110_irq_thread(int irq, void *dev_id)
 	return IRQ_HANDLED;
 }
 
+static void cy8ctmg110_shut_off(void *_ts)
+{
+	struct cy8ctmg110 *ts = _ts;
+
+	cy8ctmg110_set_sleepmode(ts, true);
+	cy8ctmg110_power(ts, false);
+}
+
 static int cy8ctmg110_probe(struct i2c_client *client,
 					const struct i2c_device_id *id)
 {
@@ -179,12 +187,13 @@ static int cy8ctmg110_probe(struct i2c_client *client,
 					I2C_FUNC_SMBUS_READ_WORD_DATA))
 		return -EIO;
 
-	ts = kzalloc(sizeof(struct cy8ctmg110), GFP_KERNEL);
-	input_dev = input_allocate_device();
-	if (!ts || !input_dev) {
-		err = -ENOMEM;
-		goto err_free_mem;
-	}
+	ts = devm_kzalloc(&client->dev, sizeof(*ts), GFP_KERNEL);
+	if (!ts)
+		return -ENOMEM;
+
+	input_dev = devm_input_allocate_device(&client->dev);
+	if (!input_dev)
+		return -ENOMEM;
 
 	ts->client = client;
 	ts->input = input_dev;
@@ -196,56 +205,46 @@ static int cy8ctmg110_probe(struct i2c_client *client,
 	input_dev->name = CY8CTMG110_DRIVER_NAME " Touchscreen";
 	input_dev->phys = ts->phys;
 	input_dev->id.bustype = BUS_I2C;
-	input_dev->dev.parent = &client->dev;
-
-	input_dev->evbit[0] = BIT_MASK(EV_KEY) | BIT_MASK(EV_ABS);
-	input_dev->keybit[BIT_WORD(BTN_TOUCH)] = BIT_MASK(BTN_TOUCH);
 
+	input_set_capability(input_dev, EV_KEY, BTN_TOUCH);
 	input_set_abs_params(input_dev, ABS_X,
 			CY8CTMG110_X_MIN, CY8CTMG110_X_MAX, 4, 0);
 	input_set_abs_params(input_dev, ABS_Y,
 			CY8CTMG110_Y_MIN, CY8CTMG110_Y_MAX, 4, 0);
 
 	if (ts->reset_pin) {
-		err = gpio_request(ts->reset_pin, NULL);
+		err = devm_gpio_request(&client->dev, ts->reset_pin, NULL);
 		if (err) {
 			dev_err(&client->dev,
 				"Unable to request GPIO pin %d.\n",
 				ts->reset_pin);
-			goto err_free_mem;
+			return err;
 		}
 	}
 
 	cy8ctmg110_power(ts, true);
 	cy8ctmg110_set_sleepmode(ts, false);
 
-	err = request_threaded_irq(client->irq, NULL, cy8ctmg110_irq_thread,
-				   IRQF_ONESHOT, "touch_reset_key", ts);
-	if (err < 0) {
+	err = devm_add_action_or_reset(&client->dev, cy8ctmg110_shut_off, ts);
+	if (err)
+		return err;
+
+	err = devm_request_threaded_irq(&client->dev, client->irq,
+					NULL, cy8ctmg110_irq_thread,
+					IRQF_ONESHOT, "touch_reset_key", ts);
+	if (err) {
 		dev_err(&client->dev,
 			"irq %d busy? error %d\n", client->irq, err);
-		goto err_shutoff_device;
+		return err;
 	}
 
 	err = input_register_device(input_dev);
 	if (err)
-		goto err_free_irq;
+		return err;
 
 	i2c_set_clientdata(client, ts);
 
 	return 0;
-
-err_free_irq:
-	free_irq(client->irq, ts);
-err_shutoff_device:
-	cy8ctmg110_set_sleepmode(ts, true);
-	cy8ctmg110_power(ts, false);
-	if (ts->reset_pin)
-		gpio_free(ts->reset_pin);
-err_free_mem:
-	input_free_device(input_dev);
-	kfree(ts);
-	return err;
 }
 
 static int __maybe_unused cy8ctmg110_suspend(struct device *dev)
@@ -276,22 +275,6 @@ static int __maybe_unused cy8ctmg110_resume(struct device *dev)
 
 static SIMPLE_DEV_PM_OPS(cy8ctmg110_pm, cy8ctmg110_suspend, cy8ctmg110_resume);
 
-static int cy8ctmg110_remove(struct i2c_client *client)
-{
-	struct cy8ctmg110 *ts = i2c_get_clientdata(client);
-
-	cy8ctmg110_set_sleepmode(ts, true);
-	cy8ctmg110_power(ts, false);
-
-	free_irq(client->irq, ts);
-	input_unregister_device(ts->input);
-	if (ts->reset_pin)
-		gpio_free(ts->reset_pin);
-	kfree(ts);
-
-	return 0;
-}
-
 static const struct i2c_device_id cy8ctmg110_idtable[] = {
 	{ CY8CTMG110_DRIVER_NAME, 1 },
 	{ }
@@ -306,7 +289,6 @@ static struct i2c_driver cy8ctmg110_driver = {
 	},
 	.id_table	= cy8ctmg110_idtable,
 	.probe		= cy8ctmg110_probe,
-	.remove		= cy8ctmg110_remove,
 };
 
 module_i2c_driver(cy8ctmg110_driver);
-- 
2.32.0.rc0.204.g9fa02ecfa5-goog

