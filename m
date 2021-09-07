Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7591A402F6E
	for <lists+linux-input@lfdr.de>; Tue,  7 Sep 2021 22:13:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1346350AbhIGUO3 (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 7 Sep 2021 16:14:29 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37958 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1346364AbhIGUOX (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Tue, 7 Sep 2021 16:14:23 -0400
Received: from mail.bugwerft.de (mail.bugwerft.de [IPv6:2a03:6000:1011::59])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 52677C061757
        for <linux-input@vger.kernel.org>; Tue,  7 Sep 2021 13:13:16 -0700 (PDT)
Received: from hq-00021.Speedport_W_724V_01011603_07_006 (p200300d83f0164a4ac70ae0545232a4f.dip0.t-ipconnect.de [IPv6:2003:d8:3f01:64a4:ac70:ae05:4523:2a4f])
        by mail.bugwerft.de (Postfix) with ESMTPSA id 55D9632E70B;
        Tue,  7 Sep 2021 20:07:34 +0000 (UTC)
From:   Daniel Mack <daniel@zonque.org>
To:     linux-input@vger.kernel.org
Cc:     dmitry.torokhov@gmail.com, m.felsch@pengutronix.de,
        Daniel Mack <daniel@zonque.org>
Subject: [PATCH v5 3/3] Input: ads7846: Switch to devm initialization
Date:   Tue,  7 Sep 2021 22:07:26 +0200
Message-Id: <20210907200726.2034962-4-daniel@zonque.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210907200726.2034962-1-daniel@zonque.org>
References: <20210907200726.2034962-1-daniel@zonque.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

This simplies the code a lot and fixes some potential resource leaks in
the error return paths.

Signed-off-by: Daniel Mack <daniel@zonque.org>
---
 drivers/input/touchscreen/ads7846.c | 125 ++++++++++------------------
 1 file changed, 46 insertions(+), 79 deletions(-)

diff --git a/drivers/input/touchscreen/ads7846.c b/drivers/input/touchscreen/ads7846.c
index b9c8496155b7..e49f7ee5342c 100644
--- a/drivers/input/touchscreen/ads7846.c
+++ b/drivers/input/touchscreen/ads7846.c
@@ -101,10 +101,6 @@ struct ads7846 {
 	struct spi_device	*spi;
 	struct regulator	*reg;
 
-#if IS_ENABLED(CONFIG_HWMON)
-	struct device		*hwmon;
-#endif
-
 	u16			model;
 	u16			vref_mv;
 	u16			vref_delay_usecs;
@@ -554,6 +550,8 @@ __ATTRIBUTE_GROUPS(ads7846_attr);
 
 static int ads784x_hwmon_register(struct spi_device *spi, struct ads7846 *ts)
 {
+	struct device *hwmon;
+
 	/* hwmon sensors need a reference voltage */
 	switch (ts->model) {
 	case 7846:
@@ -574,17 +572,11 @@ static int ads784x_hwmon_register(struct spi_device *spi, struct ads7846 *ts)
 		break;
 	}
 
-	ts->hwmon = hwmon_device_register_with_groups(&spi->dev, spi->modalias,
-						      ts, ads7846_attr_groups);
+	hwmon = devm_hwmon_device_register_with_groups(&spi->dev,
+						       spi->modalias, ts,
+						       ads7846_attr_groups);
 
-	return PTR_ERR_OR_ZERO(ts->hwmon);
-}
-
-static void ads784x_hwmon_unregister(struct spi_device *spi,
-				     struct ads7846 *ts)
-{
-	if (ts->hwmon)
-		hwmon_device_unregister(ts->hwmon);
+	return PTR_ERR_OR_ZERO(hwmon);
 }
 
 #else
@@ -593,11 +585,6 @@ static inline int ads784x_hwmon_register(struct spi_device *spi,
 {
 	return 0;
 }
-
-static inline void ads784x_hwmon_unregister(struct spi_device *spi,
-					    struct ads7846 *ts)
-{
-}
 #endif
 
 static ssize_t ads7846_pen_down_show(struct device *dev,
@@ -1019,8 +1006,8 @@ static int ads7846_setup_pendown(struct spi_device *spi,
 		ts->get_pendown_state = pdata->get_pendown_state;
 	} else if (gpio_is_valid(pdata->gpio_pendown)) {
 
-		err = gpio_request_one(pdata->gpio_pendown, GPIOF_IN,
-				       "ads7846_pendown");
+		err = devm_gpio_request_one(&spi->dev, pdata->gpio_pendown,
+					    GPIOF_IN, "ads7846_pendown");
 		if (err) {
 			dev_err(&spi->dev,
 				"failed to request/setup pendown GPIO%d: %d\n",
@@ -1217,6 +1204,11 @@ static const struct ads7846_platform_data *ads7846_probe_dt(struct device *dev)
 }
 #endif
 
+static void ads7846_regulator_disable(void *regulator)
+{
+	regulator_disable(regulator);
+}
+
 static int ads7846_probe(struct spi_device *spi)
 {
 	const struct ads7846_platform_data *pdata;
@@ -1251,13 +1243,17 @@ static int ads7846_probe(struct spi_device *spi)
 	if (err < 0)
 		return err;
 
-	ts = kzalloc(sizeof(struct ads7846), GFP_KERNEL);
-	packet = kzalloc(sizeof(struct ads7846_packet), GFP_KERNEL);
-	input_dev = input_allocate_device();
-	if (!ts || !packet || !input_dev) {
-		err = -ENOMEM;
-		goto err_free_mem;
-	}
+	ts = devm_kzalloc(dev, sizeof(struct ads7846), GFP_KERNEL);
+	if (!ts)
+		return -ENOMEM;
+
+	packet = devm_kzalloc(dev, sizeof(struct ads7846_packet), GFP_KERNEL);
+	if (!packet)
+		return -ENOMEM;
+
+	input_dev = devm_input_allocate_device(dev);
+	if (!input_dev)
+		return -ENOMEM;
 
 	spi_set_drvdata(spi, ts);
 
@@ -1271,10 +1267,8 @@ static int ads7846_probe(struct spi_device *spi)
 	pdata = dev_get_platdata(dev);
 	if (!pdata) {
 		pdata = ads7846_probe_dt(dev);
-		if (IS_ERR(pdata)) {
-			err = PTR_ERR(pdata);
-			goto err_free_mem;
-		}
+		if (IS_ERR(pdata))
+			return PTR_ERR(pdata);
 	}
 
 	ts->model = pdata->model ? : 7846;
@@ -1296,7 +1290,7 @@ static int ads7846_probe(struct spi_device *spi)
 
 	err = ads7846_setup_pendown(spi, ts, pdata);
 	if (err)
-		goto err_free_mem;
+		return err;
 
 	if (pdata->penirq_recheck_delay_usecs)
 		ts->penirq_recheck_delay_usecs =
@@ -1343,41 +1337,47 @@ static int ads7846_probe(struct spi_device *spi)
 
 	ads7846_setup_spi_msg(ts, pdata);
 
-	ts->reg = regulator_get(dev, "vcc");
+	ts->reg = devm_regulator_get(dev, "vcc");
 	if (IS_ERR(ts->reg)) {
 		err = PTR_ERR(ts->reg);
 		dev_err(dev, "unable to get regulator: %d\n", err);
-		goto err_free_gpio;
+		return err;
 	}
 
 	err = regulator_enable(ts->reg);
 	if (err) {
 		dev_err(dev, "unable to enable regulator: %d\n", err);
-		goto err_put_regulator;
+		return err;
 	}
 
+	err = devm_add_action_or_reset(dev, ads7846_regulator_disable, ts->reg);
+	if (err)
+		return err;
+
 	irq_flags = pdata->irq_flags ? : IRQF_TRIGGER_FALLING;
 	irq_flags |= IRQF_ONESHOT;
 
-	err = request_threaded_irq(spi->irq, ads7846_hard_irq, ads7846_irq,
-				   irq_flags, dev->driver->name, ts);
+	err = devm_request_threaded_irq(dev, spi->irq,
+					ads7846_hard_irq, ads7846_irq,
+					irq_flags, dev->driver->name, ts);
 	if (err && !pdata->irq_flags) {
 		dev_info(dev,
 			"trying pin change workaround on irq %d\n", spi->irq);
 		irq_flags |= IRQF_TRIGGER_RISING;
-		err = request_threaded_irq(spi->irq,
-				  ads7846_hard_irq, ads7846_irq,
-				  irq_flags, dev->driver->name, ts);
+		err = devm_request_threaded_irq(dev, spi->irq,
+						ads7846_hard_irq, ads7846_irq,
+						irq_flags, dev->driver->name,
+						ts);
 	}
 
 	if (err) {
 		dev_dbg(dev, "irq %d busy?\n", spi->irq);
-		goto err_disable_regulator;
+		return err;
 	}
 
 	err = ads784x_hwmon_register(spi, ts);
 	if (err)
-		goto err_free_irq;
+		return err;
 
 	dev_info(dev, "touchscreen, irq %d\n", spi->irq);
 
@@ -1392,7 +1392,7 @@ static int ads7846_probe(struct spi_device *spi)
 
 	err = sysfs_create_group(&dev->kobj, &ads784x_attr_group);
 	if (err)
-		goto err_remove_hwmon;
+		return err;
 
 	err = input_register_device(input_dev);
 	if (err)
@@ -1411,21 +1411,7 @@ static int ads7846_probe(struct spi_device *spi)
 
  err_remove_attr_group:
 	sysfs_remove_group(&dev->kobj, &ads784x_attr_group);
- err_remove_hwmon:
-	ads784x_hwmon_unregister(spi, ts);
- err_free_irq:
-	free_irq(spi->irq, ts);
- err_disable_regulator:
-	regulator_disable(ts->reg);
- err_put_regulator:
-	regulator_put(ts->reg);
- err_free_gpio:
-	if (!ts->get_pendown_state)
-		gpio_free(ts->gpio_pendown);
- err_free_mem:
-	input_free_device(input_dev);
-	kfree(packet);
-	kfree(ts);
+
 	return err;
 }
 
@@ -1434,26 +1420,7 @@ static int ads7846_remove(struct spi_device *spi)
 	struct ads7846 *ts = spi_get_drvdata(spi);
 
 	sysfs_remove_group(&spi->dev.kobj, &ads784x_attr_group);
-
-	ads7846_disable(ts);
-	free_irq(ts->spi->irq, ts);
-
-	input_unregister_device(ts->input);
-
-	ads784x_hwmon_unregister(spi, ts);
-
-	regulator_put(ts->reg);
-
-	if (!ts->get_pendown_state) {
-		/*
-		 * If we are not using specialized pendown method we must
-		 * have been relying on gpio we set up ourselves.
-		 */
-		gpio_free(ts->gpio_pendown);
-	}
-
-	kfree(ts->packet);
-	kfree(ts);
+	ads7846_stop(ts);
 
 	dev_dbg(&spi->dev, "unregistered touchscreen\n");
 
-- 
2.31.1

