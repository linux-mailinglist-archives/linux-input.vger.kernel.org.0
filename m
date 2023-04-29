Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2F1426F25E6
	for <lists+linux-input@lfdr.de>; Sat, 29 Apr 2023 20:46:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230346AbjD2Sqk (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Sat, 29 Apr 2023 14:46:40 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55072 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229512AbjD2Sqj (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Sat, 29 Apr 2023 14:46:39 -0400
X-Greylist: delayed 315 seconds by postgrey-1.37 at lindbergh.monkeyblade.net; Sat, 29 Apr 2023 11:46:38 PDT
Received: from rere.qmqm.pl (rere.qmqm.pl [91.227.64.183])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6657C1BC9
        for <linux-input@vger.kernel.org>; Sat, 29 Apr 2023 11:46:38 -0700 (PDT)
Received: from remote.user (localhost [127.0.0.1])
        by rere.qmqm.pl (Postfix) with ESMTPSA id 4Q7yww25PTzDB;
        Sat, 29 Apr 2023 20:41:20 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=rere.qmqm.pl; s=1;
        t=1682793680; bh=sO1d5LBMOIws7nj2i/fxKmUdZv9F5Vw+ui8oqSHWF0k=;
        h=Date:From:Subject:Cc:To:From;
        b=Zw5zGBh2eb58sjtWy2j/iS3o/3dB5cYTNIpGMHfWAAwwV3BT436ltfoednFaBRaJM
         F54IFJZsD8RqCYGoo+KLyhaiDLzoin6Pp+D0EcxYj9pLR2zChedV0wYwc0a7P9xo51
         +5oe6JG/T3oPZ07RLB05lDasalyfBCxMZIvDDlsG7M1mJWunp3ENxpDNra4AB4N/h0
         dGtC+uYIRaVgNLcq4CYYGKNTfpu3HlSi5XPx4Fsqe9BeP/LUOTo/Fox/+CsRGkb4V+
         eO8o9vrEDXZGqGEGB/b5a4RF76YIAVxife+NO4o6Bf0veoQlEpYwEOwYLE07798Czs
         ZNpBWPUiUcBiw==
X-Virus-Status: Clean
X-Virus-Scanned: clamav-milter 0.103.8 at mail
Date:   Sat, 29 Apr 2023 20:41:19 +0200
Message-Id: <1ec25bf991f576a98bd8fdc58264a92ee268eba9.1682793592.git.mirq-linux@rere.qmqm.pl>
From:   =?UTF-8?q?Micha=C5=82=20Miros=C5=82aw?= <mirq-linux@rere.qmqm.pl>
Subject: [PATCH] Input: synaptics-rmi4: Use %pe for error codes.
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Cc:     linux-input@vger.kernel.org
To:     Dmitry Torokhov <dmitry.torokhov@gmail.com> (maintainer:INPUT
        (KEYBOARD, MOUSE, JOYSTICK, TOUCHSCREEN)...)
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,SPF_HELO_PASS,SPF_PASS,T_SCC_BODY_TEXT_LINE,
        URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Make the error messages a bit easier to understand by showing
error names where that's enabled.

Signed-off-by: Michał Mirosław <mirq-linux@rere.qmqm.pl>
---
 drivers/input/rmi4/rmi_driver.c | 66 +++++++++++++++++----------------
 1 file changed, 34 insertions(+), 32 deletions(-)

diff --git a/drivers/input/rmi4/rmi_driver.c b/drivers/input/rmi4/rmi_driver.c
index 258d5fe3d395..82d85c02a873 100644
--- a/drivers/input/rmi4/rmi_driver.c
+++ b/drivers/input/rmi4/rmi_driver.c
@@ -69,8 +69,8 @@ static int reset_one_function(struct rmi_function *fn)
 	if (fh->reset) {
 		retval = fh->reset(fn);
 		if (retval < 0)
-			dev_err(&fn->dev, "Reset failed with code %d.\n",
-				retval);
+			dev_err(&fn->dev, "Reset failed: %pe\n",
+				ERR_PTR(retval));
 	}
 
 	return retval;
@@ -88,8 +88,8 @@ static int configure_one_function(struct rmi_function *fn)
 	if (fh->config) {
 		retval = fh->config(fn);
 		if (retval < 0)
-			dev_err(&fn->dev, "Config failed with code %d.\n",
-				retval);
+			dev_err(&fn->dev, "Config failed: %pe\n",
+				ERR_PTR(retval));
 	}
 
 	return retval;
@@ -140,7 +140,7 @@ static int rmi_process_interrupt_requests(struct rmi_device *rmi_dev)
 				data->f01_container->fd.data_base_addr + 1,
 				data->irq_status, data->num_of_irq_regs);
 		if (error < 0) {
-			dev_err(dev, "Failed to read irqs, code=%d\n", error);
+			dev_err(dev, "Failed to read irqs: %pe\n", ERR_PTR(error));
 			return error;
 		}
 	}
@@ -201,7 +201,7 @@ static irqreturn_t rmi_irq_fn(int irq, void *dev_id)
 	ret = rmi_process_interrupt_requests(rmi_dev);
 	if (ret)
 		rmi_dbg(RMI_DEBUG_CORE, &rmi_dev->dev,
-			"Failed to process interrupt request: %d\n", ret);
+			"Failed to process interrupt request: %pe\n", ERR_PTR(ret));
 
 	if (count) {
 		kfree(attn_data.data);
@@ -229,8 +229,8 @@ static int rmi_irq_init(struct rmi_device *rmi_dev)
 					dev_driver_string(rmi_dev->xport->dev),
 					rmi_dev);
 	if (ret < 0) {
-		dev_err(&rmi_dev->dev, "Failed to register interrupt %d\n",
-			pdata->irq);
+		dev_err(&rmi_dev->dev, "Failed to register interrupt %d: %pe\n",
+			pdata->irq, ERR_PTR(ret));
 
 		return ret;
 	}
@@ -265,8 +265,8 @@ static int suspend_one_function(struct rmi_function *fn)
 	if (fh->suspend) {
 		retval = fh->suspend(fn);
 		if (retval < 0)
-			dev_err(&fn->dev, "Suspend failed with code %d.\n",
-				retval);
+			dev_err(&fn->dev, "Suspend failed: %pe\n",
+				ERR_PTR(retval));
 	}
 
 	return retval;
@@ -299,8 +299,8 @@ static int resume_one_function(struct rmi_function *fn)
 	if (fh->resume) {
 		retval = fh->resume(fn);
 		if (retval < 0)
-			dev_err(&fn->dev, "Resume failed with code %d.\n",
-				retval);
+			dev_err(&fn->dev, "Resume failed: %pe\n",
+				ERR_PTR(retval));
 	}
 
 	return retval;
@@ -464,8 +464,8 @@ static int rmi_read_pdt_entry(struct rmi_device *rmi_dev,
 
 	error = rmi_read_block(rmi_dev, pdt_address, buf, RMI_PDT_ENTRY_SIZE);
 	if (error) {
-		dev_err(&rmi_dev->dev, "Read PDT entry at %#06x failed, code: %d.\n",
-				pdt_address, error);
+		dev_err(&rmi_dev->dev, "Read PDT entry at %#06x failed: %pe\n",
+				pdt_address, ERR_PTR(error));
 		return error;
 	}
 
@@ -752,7 +752,8 @@ static int rmi_check_bootloader_mode(struct rmi_device *rmi_dev,
 		ret = rmi_read(rmi_dev, pdt->data_base_addr, &status);
 		if (ret) {
 			dev_err(&rmi_dev->dev,
-				"Failed to read F34 status: %d.\n", ret);
+				"Failed to read F34 status: %pe\n",
+				ERR_PTR(ret));
 			return ret;
 		}
 
@@ -762,7 +763,8 @@ static int rmi_check_bootloader_mode(struct rmi_device *rmi_dev,
 		ret = rmi_read(rmi_dev, pdt->data_base_addr, &status);
 		if (ret) {
 			dev_err(&rmi_dev->dev,
-				"Failed to read F01 status: %d.\n", ret);
+				"Failed to read F01 status: %pe\n",
+				ERR_PTR(ret));
 			return ret;
 		}
 
@@ -812,7 +814,7 @@ int rmi_initial_reset(struct rmi_device *rmi_dev, void *ctx,
 		error = rmi_write_block(rmi_dev, cmd_addr, &cmd_buf, 1);
 		if (error) {
 			dev_err(&rmi_dev->dev,
-				"Initial reset failed. Code = %d.\n", error);
+				"Initial reset failed: %pe\n", ERR_PTR(error));
 			return error;
 		}
 
@@ -892,8 +894,8 @@ void rmi_enable_irq(struct rmi_device *rmi_dev, bool clear_wake)
 		retval = disable_irq_wake(irq);
 		if (retval)
 			dev_warn(&rmi_dev->dev,
-				 "Failed to disable irq for wake: %d\n",
-				 retval);
+				 "Failed to disable irq for wake: %pe\n",
+				 ERR_PTR(retval));
 	}
 
 	/*
@@ -927,8 +929,8 @@ void rmi_disable_irq(struct rmi_device *rmi_dev, bool enable_wake)
 		retval = enable_irq_wake(irq);
 		if (retval)
 			dev_warn(&rmi_dev->dev,
-				 "Failed to enable irq for wake: %d\n",
-				 retval);
+				 "Failed to enable irq for wake: %pe\n",
+				 ERR_PTR(retval));
 	}
 
 	/* make sure the fifo is clean */
@@ -948,8 +950,8 @@ int rmi_driver_suspend(struct rmi_device *rmi_dev, bool enable_wake)
 
 	retval = rmi_suspend_functions(rmi_dev);
 	if (retval)
-		dev_warn(&rmi_dev->dev, "Failed to suspend functions: %d\n",
-			retval);
+		dev_warn(&rmi_dev->dev, "Failed to suspend functions: %pe\n",
+			ERR_PTR(retval));
 
 	rmi_disable_irq(rmi_dev, enable_wake);
 	return retval;
@@ -964,8 +966,8 @@ int rmi_driver_resume(struct rmi_device *rmi_dev, bool clear_wake)
 
 	retval = rmi_resume_functions(rmi_dev);
 	if (retval)
-		dev_warn(&rmi_dev->dev, "Failed to suspend functions: %d\n",
-			retval);
+		dev_warn(&rmi_dev->dev, "Failed to resume functions: %pe\n",
+			ERR_PTR(retval));
 
 	return retval;
 }
@@ -1028,7 +1030,7 @@ int rmi_probe_interrupts(struct rmi_driver_data *data)
 
 	retval = rmi_scan_pdt(rmi_dev, &irq_count, rmi_count_irqs);
 	if (retval < 0) {
-		dev_err(dev, "IRQ counting failed with code %d.\n", retval);
+		dev_err(dev, "IRQ counting failed: %pe\n", ERR_PTR(retval));
 		return retval;
 	}
 
@@ -1072,8 +1074,8 @@ int rmi_init_functions(struct rmi_driver_data *data)
 	rmi_dbg(RMI_DEBUG_CORE, dev, "%s: Creating functions.\n", __func__);
 	retval = rmi_scan_pdt(rmi_dev, &irq_count, rmi_create_function);
 	if (retval < 0) {
-		dev_err(dev, "Function creation failed with code %d.\n",
-			retval);
+		dev_err(dev, "Function creation failed: %pe\n",
+			ERR_PTR(retval));
 		goto err_destroy_functions;
 	}
 
@@ -1166,8 +1168,8 @@ static int rmi_driver_probe(struct device *dev)
 		 * we'll print out a warning and continue since
 		 * failure to get the PDT properties is not a cause to fail
 		 */
-		dev_warn(dev, "Could not read PDT properties from %#06x (code %d). Assuming 0x00.\n",
-			 PDT_PROPERTIES_LOCATION, retval);
+		dev_warn(dev, "Could not read PDT properties from %#06x (%pe). Assuming 0x00.\n",
+			 PDT_PROPERTIES_LOCATION, ERR_PTR(retval));
 	}
 
 	mutex_init(&data->irq_mutex);
@@ -1265,8 +1267,8 @@ int __init rmi_register_physical_driver(void)
 
 	error = driver_register(&rmi_physical_driver.driver);
 	if (error) {
-		pr_err("%s: driver register failed, code=%d.\n", __func__,
-		       error);
+		pr_err("%s: driver register failed: %pe\n", __func__,
+		       ERR_PTR(error));
 		return error;
 	}
 
-- 
2.30.2

