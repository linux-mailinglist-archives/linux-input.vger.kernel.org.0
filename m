Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BB15C1C0450
	for <lists+linux-input@lfdr.de>; Thu, 30 Apr 2020 20:02:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726404AbgD3SC6 (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 30 Apr 2020 14:02:58 -0400
Received: from mail.bugwerft.de ([46.23.86.59]:40872 "EHLO mail.bugwerft.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726377AbgD3SC6 (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Thu, 30 Apr 2020 14:02:58 -0400
X-Greylist: delayed 565 seconds by postgrey-1.27 at vger.kernel.org; Thu, 30 Apr 2020 14:02:55 EDT
Received: from zenbar.fritz.box (pD95EF368.dip0.t-ipconnect.de [217.94.243.104])
        by mail.bugwerft.de (Postfix) with ESMTPSA id 85B28402AAC;
        Thu, 30 Apr 2020 17:50:55 +0000 (UTC)
From:   Daniel Mack <daniel@zonque.org>
To:     linux-input@vger.kernel.org
Cc:     dmitry.torokhov@gmail.com, m.felsch@pengutronix.de,
        kstewart@linuxfoundation.org, Daniel Mack <daniel@zonque.org>
Subject: [PATCH] input: touch: ads7846: switch to devm initialization
Date:   Thu, 30 Apr 2020 19:53:23 +0200
Message-Id: <20200430175323.187870-1-daniel@zonque.org>
X-Mailer: git-send-email 2.25.2
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
 drivers/input/touchscreen/ads7846.c | 137 +++++++++-------------------
 1 file changed, 45 insertions(+), 92 deletions(-)

diff --git a/drivers/input/touchscreen/ads7846.c b/drivers/input/touchscreen/ads7846.c
index 8fd7fc39c4fd..acf736f5ddab 100644
--- a/drivers/input/touchscreen/ads7846.c
+++ b/drivers/input/touchscreen/ads7846.c
@@ -528,30 +528,19 @@ static int ads784x_hwmon_register(struct spi_device *spi, struct ads7846 *ts)
 		break;
 	}
 
-	ts->hwmon = hwmon_device_register_with_groups(&spi->dev, spi->modalias,
-						      ts, ads7846_attr_groups);
+	ts->hwmon = devm_hwmon_device_register_with_groups(&spi->dev,
+							   spi->modalias, ts,
+							   ads7846_attr_groups);
 
 	return PTR_ERR_OR_ZERO(ts->hwmon);
 }
 
-static void ads784x_hwmon_unregister(struct spi_device *spi,
-				     struct ads7846 *ts)
-{
-	if (ts->hwmon)
-		hwmon_device_unregister(ts->hwmon);
-}
-
 #else
 static inline int ads784x_hwmon_register(struct spi_device *spi,
 					 struct ads7846 *ts)
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
@@ -944,8 +933,8 @@ static int ads7846_setup_pendown(struct spi_device *spi,
 		ts->get_pendown_state = pdata->get_pendown_state;
 	} else if (gpio_is_valid(pdata->gpio_pendown)) {
 
-		err = gpio_request_one(pdata->gpio_pendown, GPIOF_IN,
-				       "ads7846_pendown");
+		err = devm_gpio_request_one(&spi->dev, pdata->gpio_pendown,
+					    GPIOF_IN, "ads7846_pendown");
 		if (err) {
 			dev_err(&spi->dev,
 				"failed to request/setup pendown GPIO%d: %d\n",
@@ -1264,6 +1253,7 @@ static const struct ads7846_platform_data *ads7846_probe_dt(struct device *dev)
 static int ads7846_probe(struct spi_device *spi)
 {
 	const struct ads7846_platform_data *pdata;
+	struct device *dev = &spi->dev;
 	struct ads7846 *ts;
 	struct ads7846_packet *packet;
 	struct input_dev *input_dev;
@@ -1293,13 +1283,11 @@ static int ads7846_probe(struct spi_device *spi)
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
+	packet = devm_kzalloc(dev, sizeof(struct ads7846_packet), GFP_KERNEL);
+	input_dev = devm_input_allocate_device(dev);
+	if (!ts || !packet || !input_dev)
+		return -ENOMEM;
 
 	spi_set_drvdata(spi, ts);
 
@@ -1313,10 +1301,8 @@ static int ads7846_probe(struct spi_device *spi)
 	pdata = dev_get_platdata(&spi->dev);
 	if (!pdata) {
 		pdata = ads7846_probe_dt(&spi->dev);
-		if (IS_ERR(pdata)) {
-			err = PTR_ERR(pdata);
-			goto err_free_mem;
-		}
+		if (IS_ERR(pdata))
+			return PTR_ERR(pdata);
 	}
 
 	ts->model = pdata->model ? : 7846;
@@ -1328,7 +1314,7 @@ static int ads7846_probe(struct spi_device *spi)
 		if (pdata->filter_init != NULL) {
 			err = pdata->filter_init(pdata, &ts->filter_data);
 			if (err < 0)
-				goto err_free_mem;
+				return err;
 		}
 		ts->filter = pdata->filter;
 		ts->filter_cleanup = pdata->filter_cleanup;
@@ -1354,12 +1340,12 @@ static int ads7846_probe(struct spi_device *spi)
 
 	ts->wait_for_sync = pdata->wait_for_sync ? : null_wait_for_sync;
 
-	snprintf(ts->phys, sizeof(ts->phys), "%s/input0", dev_name(&spi->dev));
+	snprintf(ts->phys, sizeof(ts->phys), "%s/input0", dev_name(dev));
 	snprintf(ts->name, sizeof(ts->name), "ADS%d Touchscreen", ts->model);
 
 	input_dev->name = ts->name;
 	input_dev->phys = ts->phys;
-	input_dev->dev.parent = &spi->dev;
+	input_dev->dev.parent = dev;
 
 	input_dev->evbit[0] = BIT_MASK(EV_KEY) | BIT_MASK(EV_ABS);
 	input_dev->keybit[BIT_WORD(BTN_TOUCH)] = BIT_MASK(BTN_TOUCH);
@@ -1391,94 +1377,80 @@ static int ads7846_probe(struct spi_device *spi)
 		ts->core_prop.swap_x_y = true;
 	}
 
+	err = input_register_device(input_dev);
+	if (err)
+		goto err_cleanup_filter;
+
 	ads7846_setup_spi_msg(ts, pdata);
 
-	ts->reg = regulator_get(&spi->dev, "vcc");
+	ts->reg = devm_regulator_get(dev, "vcc");
 	if (IS_ERR(ts->reg)) {
 		err = PTR_ERR(ts->reg);
-		dev_err(&spi->dev, "unable to get regulator: %d\n", err);
-		goto err_free_gpio;
+		dev_err(dev, "unable to get regulator: %d\n", err);
+		goto err_cleanup_filter;
 	}
 
 	err = regulator_enable(ts->reg);
 	if (err) {
-		dev_err(&spi->dev, "unable to enable regulator: %d\n", err);
-		goto err_put_regulator;
+		dev_err(dev, "unable to enable regulator: %d\n", err);
+		goto err_cleanup_filter;
 	}
 
 	irq_flags = pdata->irq_flags ? : IRQF_TRIGGER_FALLING;
 	irq_flags |= IRQF_ONESHOT;
 
-	err = request_threaded_irq(spi->irq, ads7846_hard_irq, ads7846_irq,
-				   irq_flags, spi->dev.driver->name, ts);
+	err = devm_request_threaded_irq(dev, spi->irq,
+					ads7846_hard_irq, ads7846_irq,
+					irq_flags, dev->driver->name, ts);
 	if (err && !pdata->irq_flags) {
-		dev_info(&spi->dev,
+		dev_info(dev,
 			"trying pin change workaround on irq %d\n", spi->irq);
 		irq_flags |= IRQF_TRIGGER_RISING;
-		err = request_threaded_irq(spi->irq,
-				  ads7846_hard_irq, ads7846_irq,
-				  irq_flags, spi->dev.driver->name, ts);
+		err = devm_request_threaded_irq(dev, spi->irq,
+						ads7846_hard_irq, ads7846_irq,
+						irq_flags, dev->driver->name,
+						ts);
 	}
 
 	if (err) {
-		dev_dbg(&spi->dev, "irq %d busy?\n", spi->irq);
-		goto err_disable_regulator;
+		dev_dbg(dev, "irq %d busy?\n", spi->irq);
+		goto err_cleanup_filter;
 	}
 
 	err = ads784x_hwmon_register(spi, ts);
 	if (err)
-		goto err_free_irq;
+		goto err_cleanup_filter;
 
-	dev_info(&spi->dev, "touchscreen, irq %d\n", spi->irq);
+	dev_info(dev, "touchscreen, irq %d\n", spi->irq);
 
 	/*
 	 * Take a first sample, leaving nPENIRQ active and vREF off; avoid
 	 * the touchscreen, in case it's not connected.
 	 */
 	if (ts->model == 7845)
-		ads7845_read12_ser(&spi->dev, PWRDOWN);
+		ads7845_read12_ser(dev, PWRDOWN);
 	else
-		(void) ads7846_read12_ser(&spi->dev, READ_12BIT_SER(vaux));
+		(void) ads7846_read12_ser(dev, READ_12BIT_SER(vaux));
 
-	err = sysfs_create_group(&spi->dev.kobj, &ads784x_attr_group);
+	err = sysfs_create_group(&dev->kobj, &ads784x_attr_group);
 	if (err)
-		goto err_remove_hwmon;
-
-	err = input_register_device(input_dev);
-	if (err)
-		goto err_remove_attr_group;
+		goto err_cleanup_filter;
 
-	device_init_wakeup(&spi->dev, pdata->wakeup);
+	device_init_wakeup(dev, pdata->wakeup);
 
 	/*
 	 * If device does not carry platform data we must have allocated it
 	 * when parsing DT data.
 	 */
-	if (!dev_get_platdata(&spi->dev))
-		devm_kfree(&spi->dev, (void *)pdata);
+	if (!dev_get_platdata(dev))
+		devm_kfree(dev, (void *)pdata);
 
 	return 0;
 
- err_remove_attr_group:
-	sysfs_remove_group(&spi->dev.kobj, &ads784x_attr_group);
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
 
@@ -1487,30 +1459,11 @@ static int ads7846_remove(struct spi_device *spi)
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
2.25.2

