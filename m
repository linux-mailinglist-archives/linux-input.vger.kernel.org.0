Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DCB2C402F70
	for <lists+linux-input@lfdr.de>; Tue,  7 Sep 2021 22:13:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1346456AbhIGUOa (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 7 Sep 2021 16:14:30 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37956 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1346362AbhIGUOX (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Tue, 7 Sep 2021 16:14:23 -0400
X-Greylist: delayed 340 seconds by postgrey-1.37 at lindbergh.monkeyblade.net; Tue, 07 Sep 2021 13:13:16 PDT
Received: from mail.bugwerft.de (mail.bugwerft.de [IPv6:2a03:6000:1011::59])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 4C439C061575
        for <linux-input@vger.kernel.org>; Tue,  7 Sep 2021 13:13:16 -0700 (PDT)
Received: from hq-00021.Speedport_W_724V_01011603_07_006 (p200300d83f0164a4ac70ae0545232a4f.dip0.t-ipconnect.de [IPv6:2003:d8:3f01:64a4:ac70:ae05:4523:2a4f])
        by mail.bugwerft.de (Postfix) with ESMTPSA id AFE6032E708;
        Tue,  7 Sep 2021 20:07:33 +0000 (UTC)
From:   Daniel Mack <daniel@zonque.org>
To:     linux-input@vger.kernel.org
Cc:     dmitry.torokhov@gmail.com, m.felsch@pengutronix.de,
        Daniel Mack <daniel@zonque.org>
Subject: [PATCH v5 1/3] Input: ads7846: Add short-hand for spi->dev in probe() function
Date:   Tue,  7 Sep 2021 22:07:24 +0200
Message-Id: <20210907200726.2034962-2-daniel@zonque.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210907200726.2034962-1-daniel@zonque.org>
References: <20210907200726.2034962-1-daniel@zonque.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

This will make the code a bit more terse.
No functional change intended.

Signed-off-by: Daniel Mack <daniel@zonque.org>
Reviewed-by: Marco Felsch <m.felsch@pengutronix.de>
---
 drivers/input/touchscreen/ads7846.c | 45 +++++++++++++++--------------
 1 file changed, 23 insertions(+), 22 deletions(-)

diff --git a/drivers/input/touchscreen/ads7846.c b/drivers/input/touchscreen/ads7846.c
index f113a27aeb1e..ce2e14816af5 100644
--- a/drivers/input/touchscreen/ads7846.c
+++ b/drivers/input/touchscreen/ads7846.c
@@ -1216,20 +1216,21 @@ static int ads7846_probe(struct spi_device *spi)
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
+			(spi->max_speed_hz/SAMPLE_BITS)/1000);
 		return -EINVAL;
 	}
 
@@ -1262,9 +1263,9 @@ static int ads7846_probe(struct spi_device *spi)
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
@@ -1306,12 +1307,12 @@ static int ads7846_probe(struct spi_device *spi)
 
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
@@ -1345,16 +1346,16 @@ static int ads7846_probe(struct spi_device *spi)
 
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
 
@@ -1362,18 +1363,18 @@ static int ads7846_probe(struct spi_device *spi)
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
 
@@ -1381,18 +1382,18 @@ static int ads7846_probe(struct spi_device *spi)
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
 
@@ -1400,19 +1401,19 @@ static int ads7846_probe(struct spi_device *spi)
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
2.31.1

