Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 244482884F1
	for <lists+linux-input@lfdr.de>; Fri,  9 Oct 2020 10:11:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732451AbgJIILL (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Fri, 9 Oct 2020 04:11:11 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51350 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1732337AbgJIILK (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Fri, 9 Oct 2020 04:11:10 -0400
Received: from mail-pl1-x644.google.com (mail-pl1-x644.google.com [IPv6:2607:f8b0:4864:20::644])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2555BC0613D2;
        Fri,  9 Oct 2020 01:11:09 -0700 (PDT)
Received: by mail-pl1-x644.google.com with SMTP id d6so4079459plo.13;
        Fri, 09 Oct 2020 01:11:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=vkCv+bp/FrfI2HKWKx1Tww6cQhDH3EWEn1gwkV8Cg1I=;
        b=T2V/ftxCmwcqj8mOsikkMgN9z4zZoUidPnfRwe42UDq05MXXofRSl69ii78YryxkaI
         NFe5rzQuamr1/PPX/MXet7xMS8iWJYfr8CtLsIdL0XEgltd7fVr5ndUI32Dr/hgqrylV
         SgnISJqsGeYp1i4A8rUxITf/UkCkM+lRuWfsU4ea04l9fzN5jN4MLU/N8XRJ575ufNgI
         pcFf/7KxTjn7PfpGZtQupy65qIGbXKvB19BSGSijSAiEsxnfXSqs85eDdN0bqtP+vILs
         ZWe2/NeYs6ICotIvHJoh4a44bFy4tQxvOUy94dkT0xBhU+Un4Xzwym6i44a7207ubhRo
         ROIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=vkCv+bp/FrfI2HKWKx1Tww6cQhDH3EWEn1gwkV8Cg1I=;
        b=J0DIH+oPsJXkQEGT0LuGD4fBK5eDEqDvjtgOHpHdJKnzz4Ykn/Jhm7QJw2XDeoEBQg
         bGaQixxweSxTVRO4TUPIiFZNbATDHO3FzcSOht9tE4tHBkimLUwNuWu8PyHbFpFoF4I4
         fh6PcPGoKJFxv8k3i97LSm2Szu7OYlopXzY7WjI3w+a9O1TDoy2iHw+0Gw6TBhZ8By7s
         TUiC+FvGO3jb5fhj9iRheJvOEQSasj8atk3jYHTkvpM0REPuOMnuKOBKqxi8adBqVQZc
         1tEP6sgtIrAm14DZ/yVNpys6coktGpB3rM6Di0cO1NbCfls8rwgBjGjE/AeXEqjVe+MD
         8Z0g==
X-Gm-Message-State: AOAM531zVyrE0nSNt8m2cSIHOsdFQuicViTZAi+O1ocSwBjzTgpmJuYw
        RxN6d73XuXykmVL+syqbqi7PnpTf1l5WN2i/
X-Google-Smtp-Source: ABdhPJxvIIE97qi/nL7QdFuS79SJh9C4Jdjr4dbIHvuca7vf0rsfz7InDmd7Iw+PDMRiulJevRqLzA==
X-Received: by 2002:a17:902:bf4b:b029:d1:e5e7:bddd with SMTP id u11-20020a170902bf4bb02900d1e5e7bdddmr10979173pls.61.1602231068306;
        Fri, 09 Oct 2020 01:11:08 -0700 (PDT)
Received: from localhost ([2001:e42:102:1532:160:16:113:140])
        by smtp.gmail.com with ESMTPSA id c9sm9531637pgl.92.2020.10.09.01.11.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Oct 2020 01:11:07 -0700 (PDT)
From:   Coiby Xu <coiby.xu@gmail.com>
To:     linux-input@vger.kernel.org
Cc:     Jiri Kosina <jikos@kernel.org>,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>,
        linux-kernel@vger.kernel.org (open list)
Subject: [PATCH] HID: i2c-hid: add polling mode based on connected GPIO chip's pin status
Date:   Fri,  9 Oct 2020 16:11:00 +0800
Message-Id: <20201009081100.3154-1-coiby.xu@gmail.com>
X-Mailer: git-send-email 2.28.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

For a broken touchpad, it may take several months or longer to be fixed.
Polling mode could be a fallback solution for enthusiastic Linux users
when they have a new laptop. It also acts like a debugging feature. If
polling mode works for a broken touchpad, we can almost be certain
the root cause is related to the interrupt.

Two module parameters are added to i2c-hid,
    - polling_mode: by default set to 0, i.e., polling is disabled
    - polling_interval (ms): user can change this runtime parameter by
      writing to /sys/module/i2c_hid/parameters/polling_interval

Signed-off-by: Coiby Xu <coiby.xu@gmail.com>
---
 drivers/hid/i2c-hid/i2c-hid-core.c | 127 +++++++++++++++++++++++++++--
 1 file changed, 119 insertions(+), 8 deletions(-)

diff --git a/drivers/hid/i2c-hid/i2c-hid-core.c b/drivers/hid/i2c-hid/i2c-hid-core.c
index dbd04492825d..c7af127959f6 100644
--- a/drivers/hid/i2c-hid/i2c-hid-core.c
+++ b/drivers/hid/i2c-hid/i2c-hid-core.c
@@ -36,6 +36,8 @@
 #include <linux/hid.h>
 #include <linux/mutex.h>
 #include <linux/acpi.h>
+#include <linux/kthread.h>
+#include <linux/gpio/driver.h>
 #include <linux/of.h>
 #include <linux/regulator/consumer.h>

@@ -60,6 +62,18 @@
 #define I2C_HID_PWR_ON		0x00
 #define I2C_HID_PWR_SLEEP	0x01

+/* polling mode */
+#define I2C_POLLING_DISABLED 0
+#define I2C_POLLING_GPIO_PIN 1
+#define POLLING_INTERVAL 10
+
+static u8 polling_mode;
+module_param(polling_mode, byte, 0444);
+MODULE_PARM_DESC(polling_mode, "How to poll - 0 disabled; 1 based on GPIO pin's status");
+
+static unsigned int polling_interval = 10;
+module_param(polling_interval, uint, 0644);
+MODULE_PARM_DESC(polling_interval, "Poll every {polling_interval} ms. Default to 10 ms");
 /* debug option */
 static bool debug;
 module_param(debug, bool, 0444);
@@ -158,6 +172,8 @@ struct i2c_hid {

 	struct i2c_hid_platform_data pdata;

+	struct task_struct *polling_thread;
+
 	bool			irq_wake_enabled;
 	struct mutex		reset_lock;
 };
@@ -772,7 +788,9 @@ static int i2c_hid_start(struct hid_device *hid)
 		i2c_hid_free_buffers(ihid);

 		ret = i2c_hid_alloc_buffers(ihid, bufsize);
-		enable_irq(client->irq);
+
+		if (polling_mode == I2C_POLLING_DISABLED)
+			enable_irq(client->irq);

 		if (ret)
 			return ret;
@@ -814,6 +832,83 @@ struct hid_ll_driver i2c_hid_ll_driver = {
 };
 EXPORT_SYMBOL_GPL(i2c_hid_ll_driver);

+static int get_gpio_pin_state(struct irq_desc *irq_desc)
+{
+	struct gpio_chip *gc = irq_data_get_irq_chip_data(&irq_desc->irq_data);
+
+	return gc->get(gc, irq_desc->irq_data.hwirq);
+}
+
+static bool interrupt_line_active(struct i2c_client *client)
+{
+	unsigned long trigger_type = irq_get_trigger_type(client->irq);
+	struct irq_desc *irq_desc = irq_to_desc(client->irq);
+
+	/*
+	 * According to Windows Precsiontion Touchpad's specs
+	 * https://docs.microsoft.com/en-us/windows-hardware/design/component-guidelines/windows-precision-touchpad-device-bus-connectivity,
+	 * GPIO Interrupt Assertion Leve could be either ActiveLow or
+	 * ActiveHigh.
+	 */
+	if (trigger_type & IRQF_TRIGGER_LOW)
+		return !get_gpio_pin_state(irq_desc);
+
+	return get_gpio_pin_state(irq_desc);
+}
+
+static int i2c_hid_polling_thread(void *i2c_hid)
+{
+	struct i2c_hid *ihid = i2c_hid;
+	struct i2c_client *client = ihid->client;
+	unsigned int polling_interval_ms;
+
+	while (1) {
+		polling_interval_ms = polling_interval*1000;
+		if (test_bit(I2C_HID_READ_PENDING, &ihid->flags))
+			usleep_range(50000, 100000);
+
+		if (kthread_should_stop())
+			break;
+
+		while (interrupt_line_active(client)) {
+			i2c_hid_get_input(ihid);
+			/*
+			 * keeping polling for new data at a rate of ~200Hz
+			 * until the interrupt line becomes inactive
+			 */
+			usleep_range(4000, 6000);
+		}
+
+		usleep_range(polling_interval_ms, polling_interval_ms);
+	}
+
+	do_exit(0);
+	return 0;
+}
+
+static int i2c_hid_init_polling(struct i2c_hid *ihid)
+{
+	struct i2c_client *client = ihid->client;
+
+	if (!irq_get_trigger_type(client->irq)) {
+		dev_warn(&client->dev,
+			 "Failed to get GPIO Interrupt Assertion Level, could not enable polling mode for %s",
+			 client->name);
+		return -1;
+	}
+
+	ihid->polling_thread = kthread_create(i2c_hid_polling_thread, ihid,
+					      "I2C HID polling thread");
+
+	if (ihid->polling_thread) {
+		pr_info("I2C HID polling thread");
+		wake_up_process(ihid->polling_thread);
+		return 0;
+	}
+
+	return -1;
+}
+
 static int i2c_hid_init_irq(struct i2c_client *client)
 {
 	struct i2c_hid *ihid = i2c_get_clientdata(client);
@@ -997,6 +1092,16 @@ static void i2c_hid_fwnode_probe(struct i2c_client *client,
 		pdata->post_power_delay_ms = val;
 }

+static void free_irq_or_stop_polling(struct i2c_client *client,
+				     struct i2c_hid *ihid)
+{
+
+	if (polling_mode != I2C_POLLING_DISABLED)
+		kthread_stop(ihid->polling_thread);
+	else
+		free_irq(client->irq, ihid);
+}
+
 static int i2c_hid_probe(struct i2c_client *client,
 			 const struct i2c_device_id *dev_id)
 {
@@ -1090,7 +1195,11 @@ static int i2c_hid_probe(struct i2c_client *client,
 	if (ret < 0)
 		goto err_regulator;

-	ret = i2c_hid_init_irq(client);
+	if (polling_mode != I2C_POLLING_DISABLED)
+		ret = i2c_hid_init_polling(ihid);
+	else
+		ret = i2c_hid_init_irq(client);
+
 	if (ret < 0)
 		goto err_regulator;

@@ -1129,7 +1238,7 @@ static int i2c_hid_probe(struct i2c_client *client,
 	hid_destroy_device(hid);

 err_irq:
-	free_irq(client->irq, ihid);
+	free_irq_or_stop_polling(client, ihid);

 err_regulator:
 	regulator_bulk_disable(ARRAY_SIZE(ihid->pdata.supplies),
@@ -1146,7 +1255,7 @@ static int i2c_hid_remove(struct i2c_client *client)
 	hid = ihid->hid;
 	hid_destroy_device(hid);

-	free_irq(client->irq, ihid);
+	free_irq_or_stop_polling(client, ihid);

 	if (ihid->bufsize)
 		i2c_hid_free_buffers(ihid);
@@ -1162,7 +1271,7 @@ static void i2c_hid_shutdown(struct i2c_client *client)
 	struct i2c_hid *ihid = i2c_get_clientdata(client);

 	i2c_hid_set_power(client, I2C_HID_PWR_SLEEP);
-	free_irq(client->irq, ihid);
+	free_irq_or_stop_polling(client, ihid);
 }

 #ifdef CONFIG_PM_SLEEP
@@ -1183,7 +1292,8 @@ static int i2c_hid_suspend(struct device *dev)
 	/* Save some power */
 	i2c_hid_set_power(client, I2C_HID_PWR_SLEEP);

-	disable_irq(client->irq);
+	if (polling_mode == I2C_POLLING_DISABLED)
+		disable_irq(client->irq);

 	if (device_may_wakeup(&client->dev)) {
 		wake_status = enable_irq_wake(client->irq);
@@ -1216,7 +1326,7 @@ static int i2c_hid_resume(struct device *dev)

 		if (ihid->pdata.post_power_delay_ms)
 			msleep(ihid->pdata.post_power_delay_ms);
-	} else if (ihid->irq_wake_enabled) {
+	} else if (ihid->irq_wake_enabled && polling_mode != I2C_POLLING_DISABLED) {
 		wake_status = disable_irq_wake(client->irq);
 		if (!wake_status)
 			ihid->irq_wake_enabled = false;
@@ -1225,7 +1335,8 @@ static int i2c_hid_resume(struct device *dev)
 				wake_status);
 	}

-	enable_irq(client->irq);
+	if (polling_mode != I2C_POLLING_DISABLED)
+		enable_irq(client->irq);

 	/* Instead of resetting device, simply powers the device on. This
 	 * solves "incomplete reports" on Raydium devices 2386:3118 and
--
2.28.0

