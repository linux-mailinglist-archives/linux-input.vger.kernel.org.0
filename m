Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D9E6D1C4304
	for <lists+linux-input@lfdr.de>; Mon,  4 May 2020 19:38:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730086AbgEDRh6 (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 4 May 2020 13:37:58 -0400
Received: from mail.bugwerft.de ([46.23.86.59]:37952 "EHLO mail.bugwerft.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1729386AbgEDRh5 (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Mon, 4 May 2020 13:37:57 -0400
Received: from zenbar.fritz.box (pD95EF30E.dip0.t-ipconnect.de [217.94.243.14])
        by mail.bugwerft.de (Postfix) with ESMTPSA id 284F2403F56;
        Mon,  4 May 2020 17:35:15 +0000 (UTC)
From:   Daniel Mack <daniel@zonque.org>
To:     linux-input@vger.kernel.org
Cc:     dmitry.torokhov@gmail.com, m.felsch@pengutronix.de,
        Daniel Mack <daniel@zonque.org>
Subject: [PATCH v2 2/3] input: touch: ads7846: switch to devm initialization
Date:   Mon,  4 May 2020 19:37:44 +0200
Message-Id: <20200504173745.1246505-2-daniel@zonque.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200504173745.1246505-1-daniel@zonque.org>
References: <20200504173745.1246505-1-daniel@zonque.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

This simplies the code a lot and fixes some potential resource leaks in
the error return paths. It also ensures the input device is registered
before the interrupt is requested, as the IRQ handler will commit events
when it fires.

Signed-off-by: Daniel Mack <daniel@zonque.org>
---
 drivers/input/touchscreen/ads7846.c | 127 ++++++++++------------------
 1 file changed, 46 insertions(+), 81 deletions(-)

diff --git a/drivers/input/touchscreen/ads7846.c b/drivers/input/touchscreen/ads7846.c
index a1033b06f031..7f4ead542a73 100644
--- a/drivers/input/touchscreen/ads7846.c
+++ b/drivers/input/touchscreen/ads7846.c
@@ -98,10 +98,6 @@ struct ads7846 {
 	struct spi_device	*spi;
 	struct regulator	*reg;
 
-#if IS_ENABLED(CONFIG_HWMON)
-	struct device		*hwmon;
-#endif
-
 	u16			model;
 	u16			vref_mv;
 	u16			vref_delay_usecs;
@@ -508,6 +504,8 @@ __ATTRIBUTE_GROUPS(ads7846_attr);
 
 static int ads784x_hwmon_register(struct spi_device *spi, struct ads7846 *ts)
 {
+	struct device *hwmon;
+
 	/* hwmon sensors need a reference voltage */
 	switch (ts->model) {
 	case 7846:
@@ -528,17 +526,11 @@ static int ads784x_hwmon_register(struct spi_device *spi, struct ads7846 *ts)
 		break;
 	}
 
-	ts->hwmon = hwmon_device_register_with_groups(&spi->dev, spi->modalias,
-						      ts, ads7846_attr_groups);
-
-	return PTR_ERR_OR_ZERO(ts->hwmon);
-}
+	hwmon = devm_hwmon_device_register_with_groups(&spi->dev,
+						       spi->modalias, ts,
+						       ads7846_attr_groups);
 
-static void ads784x_hwmon_unregister(struct spi_device *spi,
-				     struct ads7846 *ts)
-{
-	if (ts->hwmon)
-		hwmon_device_unregister(ts->hwmon);
+	return PTR_ERR_OR_ZERO(hwmon);
 }
 
 #else
@@ -547,11 +539,6 @@ static inline int ads784x_hwmon_register(struct spi_device *spi,
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
@@ -944,8 +931,8 @@ static int ads7846_setup_pendown(struct spi_device *spi,
 		ts->get_pendown_state = pdata->get_pendown_state;
 	} else if (gpio_is_valid(pdata->gpio_pendown)) {
 
-		err = gpio_request_one(pdata->gpio_pendown, GPIOF_IN,
-				       "ads7846_pendown");
+		err = devm_gpio_request_one(&spi->dev, pdata->gpio_pendown,
+					    GPIOF_IN, "ads7846_pendown");
 		if (err) {
 			dev_err(&spi->dev,
 				"failed to request/setup pendown GPIO%d: %d\n",
@@ -1261,6 +1248,11 @@ static const struct ads7846_platform_data *ads7846_probe_dt(struct device *dev)
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
@@ -1294,13 +1286,17 @@ static int ads7846_probe(struct spi_device *spi)
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
 
@@ -1314,10 +1310,8 @@ static int ads7846_probe(struct spi_device *spi)
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
@@ -1329,7 +1323,7 @@ static int ads7846_probe(struct spi_device *spi)
 		if (pdata->filter_init != NULL) {
 			err = pdata->filter_init(pdata, &ts->filter_data);
 			if (err < 0)
-				goto err_free_mem;
+				return err;
 		}
 		ts->filter = pdata->filter;
 		ts->filter_cleanup = pdata->filter_cleanup;
@@ -1394,41 +1388,47 @@ static int ads7846_probe(struct spi_device *spi)
 
 	ads7846_setup_spi_msg(ts, pdata);
 
-	ts->reg = regulator_get(dev, "vcc");
+	ts->reg = devm_regulator_get(dev, "vcc");
 	if (IS_ERR(ts->reg)) {
 		err = PTR_ERR(ts->reg);
 		dev_err(dev, "unable to get regulator: %d\n", err);
-		goto err_free_gpio;
+		goto err_cleanup_filter;
 	}
 
 	err = regulator_enable(ts->reg);
 	if (err) {
 		dev_err(dev, "unable to enable regulator: %d\n", err);
-		goto err_put_regulator;
+		goto err_cleanup_filter;
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
+		goto err_cleanup_filter;
 	}
 
 	err = ads784x_hwmon_register(spi, ts);
 	if (err)
-		goto err_free_irq;
+		goto err_cleanup_filter;
 
 	dev_info(dev, "touchscreen, irq %d\n", spi->irq);
 
@@ -1443,11 +1443,11 @@ static int ads7846_probe(struct spi_device *spi)
 
 	err = sysfs_create_group(&dev->kobj, &ads784x_attr_group);
 	if (err)
-		goto err_remove_hwmon;
+		goto err_cleanup_filter;
 
 	err = input_register_device(input_dev);
 	if (err)
-		goto err_remove_attr_group;
+		goto err_cleanup_filter;
 
 	device_init_wakeup(dev, pdata->wakeup);
 
@@ -1460,26 +1460,10 @@ static int ads7846_probe(struct spi_device *spi)
 
 	return 0;
 
- err_remove_attr_group:
-	sysfs_remove_group(&dev->kobj, &ads784x_attr_group);
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
  err_cleanup_filter:
 	if (ts->filter_cleanup)
 		ts->filter_cleanup(ts->filter_data);
- err_free_mem:
-	input_free_device(input_dev);
-	kfree(packet);
-	kfree(ts);
+
 	return err;
 }
 
@@ -1488,30 +1472,11 @@ static int ads7846_remove(struct spi_device *spi)
 	struct ads7846 *ts = spi_get_drvdata(spi);
 
 	sysfs_remove_group(&spi->dev.kobj, &ads784x_attr_group);
-
 	ads7846_disable(ts);
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
 
 	if (ts->filter_cleanup)
 		ts->filter_cleanup(ts->filter_data);
 
-	kfree(ts->packet);
-	kfree(ts);
-
 	dev_dbg(&spi->dev, "unregistered touchscreen\n");
 
 	return 0;
-- 
2.26.2

