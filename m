Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AFA001C4303
	for <lists+linux-input@lfdr.de>; Mon,  4 May 2020 19:37:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730049AbgEDRh4 (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 4 May 2020 13:37:56 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53418 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1730039AbgEDRhz (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Mon, 4 May 2020 13:37:55 -0400
X-Greylist: delayed 27966 seconds by postgrey-1.37 at lindbergh.monkeyblade.net; Mon, 04 May 2020 10:37:55 PDT
Received: from mail.bugwerft.de (mail.bugwerft.de [IPv6:2a03:6000:1011::59])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 7C622C061A0E
        for <linux-input@vger.kernel.org>; Mon,  4 May 2020 10:37:55 -0700 (PDT)
Received: from zenbar.fritz.box (pD95EF30E.dip0.t-ipconnect.de [217.94.243.14])
        by mail.bugwerft.de (Postfix) with ESMTPSA id 9809F403F4C;
        Mon,  4 May 2020 17:35:14 +0000 (UTC)
From:   Daniel Mack <daniel@zonque.org>
To:     linux-input@vger.kernel.org
Cc:     dmitry.torokhov@gmail.com, m.felsch@pengutronix.de,
        Daniel Mack <daniel@zonque.org>
Subject: [PATCH v2 1/3] input: touch: ads7846: add short-hand for spi->dev in probe() function
Date:   Mon,  4 May 2020 19:37:43 +0200
Message-Id: <20200504173745.1246505-1-daniel@zonque.org>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

This will make the code a bit more terse.
No functional change intended.

Signed-off-by: Daniel Mack <daniel@zonque.org>
---
 drivers/input/touchscreen/ads7846.c | 45 +++++++++++++++--------------
 1 file changed, 23 insertions(+), 22 deletions(-)

diff --git a/drivers/input/touchscreen/ads7846.c b/drivers/input/touchscreen/ads7846.c
index 8fd7fc39c4fd..a1033b06f031 100644
--- a/drivers/input/touchscreen/ads7846.c
+++ b/drivers/input/touchscreen/ads7846.c
@@ -1265,20 +1265,21 @@ static int ads7846_probe(struct spi_device *spi)
 {
 	const struct ads7846_platform_data *pdata;
 	struct ads7846 *ts;
+	struct device *dev = &spi->dev;
 	struct ads7846_packet *packet;
 	struct input_dev *input_dev;
 	unsigned long irq_flags;
 	int err;
 
 	if (!spi->irq) {
-		dev_dbg(&spi->dev, "no IRQ?\n");
+		dev_dbg(dev, "no IRQ?\n");
 		return -EINVAL;
 	}
 
 	/* don't exceed max specified sample rate */
 	if (spi->max_speed_hz > (125000 * SAMPLE_BITS)) {
-		dev_err(&spi->dev, "f(sample) %d KHz?\n",
-				(spi->max_speed_hz/SAMPLE_BITS)/1000);
+		dev_err(dev, "f(sample) %d KHz?\n",
+			     (spi->max_speed_hz/SAMPLE_BITS)/1000);
 		return -EINVAL;
 	}
 
@@ -1310,9 +1311,9 @@ static int ads7846_probe(struct spi_device *spi)
 	mutex_init(&ts->lock);
 	init_waitqueue_head(&ts->wait);
 
-	pdata = dev_get_platdata(&spi->dev);
+	pdata = dev_get_platdata(dev);
 	if (!pdata) {
-		pdata = ads7846_probe_dt(&spi->dev);
+		pdata = ads7846_probe_dt(dev);
 		if (IS_ERR(pdata)) {
 			err = PTR_ERR(pdata);
 			goto err_free_mem;
@@ -1354,12 +1355,12 @@ static int ads7846_probe(struct spi_device *spi)
 
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
@@ -1393,16 +1394,16 @@ static int ads7846_probe(struct spi_device *spi)
 
 	ads7846_setup_spi_msg(ts, pdata);
 
-	ts->reg = regulator_get(&spi->dev, "vcc");
+	ts->reg = regulator_get(dev, "vcc");
 	if (IS_ERR(ts->reg)) {
 		err = PTR_ERR(ts->reg);
-		dev_err(&spi->dev, "unable to get regulator: %d\n", err);
+		dev_err(dev, "unable to get regulator: %d\n", err);
 		goto err_free_gpio;
 	}
 
 	err = regulator_enable(ts->reg);
 	if (err) {
-		dev_err(&spi->dev, "unable to enable regulator: %d\n", err);
+		dev_err(dev, "unable to enable regulator: %d\n", err);
 		goto err_put_regulator;
 	}
 
@@ -1410,18 +1411,18 @@ static int ads7846_probe(struct spi_device *spi)
 	irq_flags |= IRQF_ONESHOT;
 
 	err = request_threaded_irq(spi->irq, ads7846_hard_irq, ads7846_irq,
-				   irq_flags, spi->dev.driver->name, ts);
+				   irq_flags, dev->driver->name, ts);
 	if (err && !pdata->irq_flags) {
-		dev_info(&spi->dev,
+		dev_info(dev,
 			"trying pin change workaround on irq %d\n", spi->irq);
 		irq_flags |= IRQF_TRIGGER_RISING;
 		err = request_threaded_irq(spi->irq,
 				  ads7846_hard_irq, ads7846_irq,
-				  irq_flags, spi->dev.driver->name, ts);
+				  irq_flags, dev->driver->name, ts);
 	}
 
 	if (err) {
-		dev_dbg(&spi->dev, "irq %d busy?\n", spi->irq);
+		dev_dbg(dev, "irq %d busy?\n", spi->irq);
 		goto err_disable_regulator;
 	}
 
@@ -1429,18 +1430,18 @@ static int ads7846_probe(struct spi_device *spi)
 	if (err)
 		goto err_free_irq;
 
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
 		goto err_remove_hwmon;
 
@@ -1448,19 +1449,19 @@ static int ads7846_probe(struct spi_device *spi)
 	if (err)
 		goto err_remove_attr_group;
 
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
 
  err_remove_attr_group:
-	sysfs_remove_group(&spi->dev.kobj, &ads784x_attr_group);
+	sysfs_remove_group(&dev->kobj, &ads784x_attr_group);
  err_remove_hwmon:
 	ads784x_hwmon_unregister(spi, ts);
  err_free_irq:
-- 
2.26.2

