Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C71272A3786
	for <lists+linux-input@lfdr.de>; Tue,  3 Nov 2020 01:13:18 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727122AbgKCANJ (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 2 Nov 2020 19:13:09 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55654 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725940AbgKCANI (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Mon, 2 Nov 2020 19:13:08 -0500
Received: from mail-pg1-x544.google.com (mail-pg1-x544.google.com [IPv6:2607:f8b0:4864:20::544])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 64753C0617A6
        for <linux-input@vger.kernel.org>; Mon,  2 Nov 2020 16:13:08 -0800 (PST)
Received: by mail-pg1-x544.google.com with SMTP id g12so12229595pgm.8
        for <linux-input@vger.kernel.org>; Mon, 02 Nov 2020 16:13:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=hsUR+IJfVilqvnHIzzYdaBtqA1fDgSipkH/UXQ1BFKs=;
        b=agVBUbm3+3pjD+GZcDiZO5GujBuzjLwBCryM5LYevPYck5UpPlOZqOKL1sQWhe/FhF
         KsVmsThU+206GzoOZevjmoEmtIe6XIQ1nKmMCruL9FgpMR+/2KuOYNRfjOhPoMAIr/Ah
         oM08BzHV8XeTNqmO9zxAJqLeC5zK++Scv/ijo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=hsUR+IJfVilqvnHIzzYdaBtqA1fDgSipkH/UXQ1BFKs=;
        b=FBMjV3erLEIfTj1TDPP/lR//+pOBgN8pS78biBe3dGkIel6bV+/h57qliLJFOgjEEX
         +n9yfh0ioi32QRlB9WzjZqcOk2fzhlViPOmSDnXKEuxLRzswO4fZVMQWYNZ7X774wsh6
         ifcIZ8PSYp2GVu8/ciREQaxjuSrz/zsPpHPUjLSxe02SXXbqFjYff5lzSbBzpJLeUzRL
         V0jf8rBl6SgA9S5m2sbB2MFkIlZ294H6c04BKIsMSUpu4FG1DhREpI8uei7dF91NZnrx
         ZOz60Ku3vaLYPmiEs2u1gSUkYB4kB6NuBK+olef9bkly3x/5PSOcmd3tOnxPFjSbyENo
         1WgQ==
X-Gm-Message-State: AOAM531w1MMUc3KY5iUOlyPeQ8l2leYGuUb+Ks50E3LXJeBU//GpBnHY
        XV8WslaLJy3eZ+tBLLJJEJhzvA==
X-Google-Smtp-Source: ABdhPJz1lBGe88mxRYFA8if5wEzy7QU/P/qRjYyGINKOvbcj7gWucSaldAbnfnaQCSs4WCfA472i2g==
X-Received: by 2002:a62:62c2:0:b029:164:563a:b2c with SMTP id w185-20020a6262c20000b0290164563a0b2cmr22912661pfb.16.1604362387909;
        Mon, 02 Nov 2020 16:13:07 -0800 (PST)
Received: from tictac2.mtv.corp.google.com ([2620:15c:202:1:42b0:34ff:fe3d:58e6])
        by smtp.gmail.com with ESMTPSA id v16sm13244295pgk.26.2020.11.02.16.13.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Nov 2020 16:13:07 -0800 (PST)
From:   Douglas Anderson <dianders@chromium.org>
To:     jkosina@suse.cz, benjamin.tissoires@redhat.com,
        gregkh@linuxfoundation.org,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc:     linux-input@vger.kernel.org, hdegoede@redhat.com,
        swboyd@chromium.org, kai.heng.feng@canonical.com,
        robh+dt@kernel.org, andrea@borgia.bo.it,
        Douglas Anderson <dianders@chromium.org>,
        Aaron Ma <aaron.ma@canonical.com>,
        Daniel Playfair Cal <daniel.playfair.cal@gmail.com>,
        Jiri Kosina <jikos@kernel.org>, Pavel Balan <admin@kryma.net>,
        You-Sheng Yang <vicamo.yang@canonical.com>,
        linux-kernel@vger.kernel.org
Subject: [PATCH v3 2/3] HID: i2c-hid: Allow subclasses of i2c-hid for power sequencing
Date:   Mon,  2 Nov 2020 16:12:40 -0800
Message-Id: <20201102161210.v3.2.Ied4ce10d229cd7c69abf13a0361ba0b8d82eb9c4@changeid>
X-Mailer: git-send-email 2.29.1.341.ge80a0c044ae-goog
In-Reply-To: <20201102161210.v3.1.Ibb28033c81d87fcc13a6ba28c6ea7ac154d65f93@changeid>
References: <20201102161210.v3.1.Ibb28033c81d87fcc13a6ba28c6ea7ac154d65f93@changeid>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

This exports some things from i2c-hid so that we can have a driver
that's effectively a subclass of it and that can do its own power
sequencing.

Signed-off-by: Douglas Anderson <dianders@chromium.org>
---

Changes in v3:
- Rework to use subclassing.

Changes in v2:
- Use a separate compatible string for this new touchscreen.
- Get timings based on the compatible string.

 drivers/hid/i2c-hid/i2c-hid-core.c    | 78 +++++++++++++++++----------
 include/linux/input/i2c-hid-core.h    | 19 +++++++
 include/linux/platform_data/i2c-hid.h |  9 ++++
 3 files changed, 79 insertions(+), 27 deletions(-)
 create mode 100644 include/linux/input/i2c-hid-core.h

diff --git a/drivers/hid/i2c-hid/i2c-hid-core.c b/drivers/hid/i2c-hid/i2c-hid-core.c
index 786e3e9af1c9..910e9089fcf8 100644
--- a/drivers/hid/i2c-hid/i2c-hid-core.c
+++ b/drivers/hid/i2c-hid/i2c-hid-core.c
@@ -22,6 +22,7 @@
 #include <linux/i2c.h>
 #include <linux/interrupt.h>
 #include <linux/input.h>
+#include <linux/input/i2c-hid-core.h>
 #include <linux/irq.h>
 #include <linux/delay.h>
 #include <linux/slab.h>
@@ -1007,8 +1008,33 @@ static void i2c_hid_fwnode_probe(struct i2c_client *client,
 		pdata->post_power_delay_ms = val;
 }
 
-static int i2c_hid_probe(struct i2c_client *client,
-			 const struct i2c_device_id *dev_id)
+static int i2c_hid_power_up_device(struct i2c_hid_platform_data *pdata)
+{
+	struct i2c_hid *ihid = container_of(pdata, struct i2c_hid, pdata);
+	struct hid_device *hid = ihid->hid;
+	int ret;
+
+	ret = regulator_bulk_enable(ARRAY_SIZE(pdata->supplies),
+				    pdata->supplies);
+	if (ret) {
+		if (hid)
+			hid_warn(hid, "Failed to enable supplies: %d\n", ret);
+		return ret;
+	}
+
+	if (pdata->post_power_delay_ms)
+		msleep(pdata->post_power_delay_ms);
+
+	return 0;
+}
+
+static void i2c_hid_power_down_device(struct i2c_hid_platform_data *pdata)
+{
+	regulator_bulk_disable(ARRAY_SIZE(pdata->supplies), pdata->supplies);
+}
+
+int i2c_hid_probe(struct i2c_client *client,
+		  const struct i2c_device_id *dev_id)
 {
 	int ret;
 	struct i2c_hid *ihid;
@@ -1035,6 +1061,9 @@ static int i2c_hid_probe(struct i2c_client *client,
 	if (!ihid)
 		return -ENOMEM;
 
+	if (platform_data)
+		ihid->pdata = *platform_data;
+
 	if (client->dev.of_node) {
 		ret = i2c_hid_of_probe(client, &ihid->pdata);
 		if (ret)
@@ -1043,13 +1072,16 @@ static int i2c_hid_probe(struct i2c_client *client,
 		ret = i2c_hid_acpi_pdata(client, &ihid->pdata);
 		if (ret)
 			return ret;
-	} else {
-		ihid->pdata = *platform_data;
 	}
 
 	/* Parse platform agnostic common properties from ACPI / device tree */
 	i2c_hid_fwnode_probe(client, &ihid->pdata);
 
+	if (!ihid->pdata.power_up_device)
+		ihid->pdata.power_up_device = i2c_hid_power_up_device;
+	if (!ihid->pdata.power_down_device)
+		ihid->pdata.power_down_device = i2c_hid_power_down_device;
+
 	ihid->pdata.supplies[0].supply = "vdd";
 	ihid->pdata.supplies[1].supply = "vddl";
 
@@ -1059,14 +1091,10 @@ static int i2c_hid_probe(struct i2c_client *client,
 	if (ret)
 		return ret;
 
-	ret = regulator_bulk_enable(ARRAY_SIZE(ihid->pdata.supplies),
-				    ihid->pdata.supplies);
-	if (ret < 0)
+	ret = ihid->pdata.power_up_device(&ihid->pdata);
+	if (ret)
 		return ret;
 
-	if (ihid->pdata.post_power_delay_ms)
-		msleep(ihid->pdata.post_power_delay_ms);
-
 	i2c_set_clientdata(client, ihid);
 
 	ihid->client = client;
@@ -1144,13 +1172,13 @@ static int i2c_hid_probe(struct i2c_client *client,
 	free_irq(client->irq, ihid);
 
 err_regulator:
-	regulator_bulk_disable(ARRAY_SIZE(ihid->pdata.supplies),
-			       ihid->pdata.supplies);
+	ihid->pdata.power_down_device(&ihid->pdata);
 	i2c_hid_free_buffers(ihid);
 	return ret;
 }
+EXPORT_SYMBOL_GPL(i2c_hid_probe);
 
-static int i2c_hid_remove(struct i2c_client *client)
+int i2c_hid_remove(struct i2c_client *client)
 {
 	struct i2c_hid *ihid = i2c_get_clientdata(client);
 	struct hid_device *hid;
@@ -1163,22 +1191,23 @@ static int i2c_hid_remove(struct i2c_client *client)
 	if (ihid->bufsize)
 		i2c_hid_free_buffers(ihid);
 
-	regulator_bulk_disable(ARRAY_SIZE(ihid->pdata.supplies),
-			       ihid->pdata.supplies);
+	ihid->pdata.power_down_device(&ihid->pdata);
 
 	return 0;
 }
+EXPORT_SYMBOL_GPL(i2c_hid_remove);
 
-static void i2c_hid_shutdown(struct i2c_client *client)
+void i2c_hid_shutdown(struct i2c_client *client)
 {
 	struct i2c_hid *ihid = i2c_get_clientdata(client);
 
 	i2c_hid_set_power(client, I2C_HID_PWR_SLEEP);
 	free_irq(client->irq, ihid);
 }
+EXPORT_SYMBOL_GPL(i2c_hid_shutdown);
 
 #ifdef CONFIG_PM_SLEEP
-static int i2c_hid_suspend(struct device *dev)
+int i2c_hid_suspend(struct device *dev)
 {
 	struct i2c_client *client = to_i2c_client(dev);
 	struct i2c_hid *ihid = i2c_get_clientdata(client);
@@ -1205,14 +1234,14 @@ static int i2c_hid_suspend(struct device *dev)
 			hid_warn(hid, "Failed to enable irq wake: %d\n",
 				wake_status);
 	} else {
-		regulator_bulk_disable(ARRAY_SIZE(ihid->pdata.supplies),
-				       ihid->pdata.supplies);
+		ihid->pdata.power_down_device(&ihid->pdata);
 	}
 
 	return 0;
 }
+EXPORT_SYMBOL_GPL(i2c_hid_suspend);
 
-static int i2c_hid_resume(struct device *dev)
+int i2c_hid_resume(struct device *dev)
 {
 	int ret;
 	struct i2c_client *client = to_i2c_client(dev);
@@ -1221,13 +1250,7 @@ static int i2c_hid_resume(struct device *dev)
 	int wake_status;
 
 	if (!device_may_wakeup(&client->dev)) {
-		ret = regulator_bulk_enable(ARRAY_SIZE(ihid->pdata.supplies),
-					    ihid->pdata.supplies);
-		if (ret)
-			hid_warn(hid, "Failed to enable supplies: %d\n", ret);
-
-		if (ihid->pdata.post_power_delay_ms)
-			msleep(ihid->pdata.post_power_delay_ms);
+		ihid->pdata.power_up_device(&ihid->pdata);
 	} else if (ihid->irq_wake_enabled) {
 		wake_status = disable_irq_wake(client->irq);
 		if (!wake_status)
@@ -1262,6 +1285,7 @@ static int i2c_hid_resume(struct device *dev)
 
 	return 0;
 }
+EXPORT_SYMBOL_GPL(i2c_hid_resume);
 #endif
 
 static const struct dev_pm_ops i2c_hid_pm = {
diff --git a/include/linux/input/i2c-hid-core.h b/include/linux/input/i2c-hid-core.h
new file mode 100644
index 000000000000..da7b0475f6f4
--- /dev/null
+++ b/include/linux/input/i2c-hid-core.h
@@ -0,0 +1,19 @@
+/* SPDX-License-Identifier: GPL-2.0+ */
+
+#ifndef I2C_HID_CORE_H
+#define I2C_HID_CORE_H
+
+#include <linux/i2c.h>
+
+int i2c_hid_probe(struct i2c_client *client,
+		  const struct i2c_device_id *dev_id);
+int i2c_hid_remove(struct i2c_client *client);
+
+void i2c_hid_shutdown(struct i2c_client *client);
+
+#ifdef CONFIG_PM_SLEEP
+int i2c_hid_suspend(struct device *dev);
+int i2c_hid_resume(struct device *dev);
+#endif
+
+#endif
diff --git a/include/linux/platform_data/i2c-hid.h b/include/linux/platform_data/i2c-hid.h
index c628bb5e1061..db567463d43e 100644
--- a/include/linux/platform_data/i2c-hid.h
+++ b/include/linux/platform_data/i2c-hid.h
@@ -21,6 +21,11 @@
  * @supplies: regulators for powering on the device.
  * @post_power_delay_ms: delay after powering on before device is usable.
  *
+ * @power_up_device: do sequencing to power up the device; may use the above
+ *                   supplies / post_power_delay_ms or ignore.
+ * @power_down_device: do sequencing to power down the device.
+ * @power_data: opaque pointer that power_up and power_down can use.
+ *
  * Note that it is the responsibility of the platform driver (or the acpi 5.0
  * driver, or the flattened device tree) to setup the irq related to the gpio in
  * the struct i2c_board_info.
@@ -36,6 +41,10 @@ struct i2c_hid_platform_data {
 	u16 hid_descriptor_address;
 	struct regulator_bulk_data supplies[2];
 	int post_power_delay_ms;
+
+	int (*power_up_device)(struct i2c_hid_platform_data *pdata);
+	void (*power_down_device)(struct i2c_hid_platform_data *pdata);
+	void *power_data;
 };
 
 #endif /* __LINUX_I2C_HID_H */
-- 
2.29.1.341.ge80a0c044ae-goog

