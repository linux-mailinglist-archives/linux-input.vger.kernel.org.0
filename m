Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8CFA62AC75C
	for <lists+linux-input@lfdr.de>; Mon,  9 Nov 2020 22:37:38 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730482AbgKIVh2 (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 9 Nov 2020 16:37:28 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45004 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730331AbgKIVh1 (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Mon, 9 Nov 2020 16:37:27 -0500
Received: from mail-pf1-x42a.google.com (mail-pf1-x42a.google.com [IPv6:2607:f8b0:4864:20::42a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 358C5C0613D3
        for <linux-input@vger.kernel.org>; Mon,  9 Nov 2020 13:37:26 -0800 (PST)
Received: by mail-pf1-x42a.google.com with SMTP id w14so6780549pfd.7
        for <linux-input@vger.kernel.org>; Mon, 09 Nov 2020 13:37:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=/h7p2KaVutiztzb9T8bbkTG62PDcDAR9yl+k61UDDsU=;
        b=WzXkQQFXR74rGMkWlzDxnbPBnNdjrg8+zSWA7nBi6RHr3vY+WILTjFxU6vhZd3yfe4
         AML8+c6/UGaAIkpQlKSm8o8WzcEt0ONSyqCUmx6O2VNhXsQXl4LMCUkBOjOT6xkODqkA
         +MgKSMCKIZGltTcI9yKuXG06q8HQQ20HVE0ZQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=/h7p2KaVutiztzb9T8bbkTG62PDcDAR9yl+k61UDDsU=;
        b=Ghalh2H5wA1gLBDKeAyE1FmmEiCkVia3jrxZFc8VNp6g1qhoFlkbf5mYx8xooMnzPB
         JvUiK8+FOfZ0dR/Qu5tpw0WKOHaIoAZgBUBGCL/lUdepL6Cdv47X4AU3AZC5ZoSt2cct
         K9T45QN19udPUbdVW6v8hMLIsR7sB2HVGYsh+OVd9WdfQKKyc7rrbh5HSGdSiABtX5Py
         NzeS+hJS0GqUKFkWnGO0W628J4nAPtNF+joHciJkjWWx5gCHlvaPgDmN17DFq7zrGqfo
         QnOExxo8PQcVLCJ0r7Ae4ooWlykpkjfVeQnn+enFXtxwbq6gXoVVzz72Fn+vnISnofxb
         XoHg==
X-Gm-Message-State: AOAM533qxCHOfAzTLzpw7so7YfyLyBz+BtoVQ4CRbL5LW0NFDV13+OuP
        C0B1Ab0F//8+YOgLEnbfN2sElg==
X-Google-Smtp-Source: ABdhPJxcCwVwbo0mJiTP5ncrjrLbVyhlF3qFVnhgG5/U9j94uHimNmAB4dOFgcjAFrv2opJb0lcR0A==
X-Received: by 2002:a17:90b:30d2:: with SMTP id hi18mr1287580pjb.186.1604957845563;
        Mon, 09 Nov 2020 13:37:25 -0800 (PST)
Received: from tictac2.mtv.corp.google.com ([2620:15c:202:1:42b0:34ff:fe3d:58e6])
        by smtp.gmail.com with ESMTPSA id i10sm11895444pfd.60.2020.11.09.13.37.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Nov 2020 13:37:24 -0800 (PST)
From:   Douglas Anderson <dianders@chromium.org>
To:     jkosina@suse.cz, benjamin.tissoires@redhat.com,
        gregkh@linuxfoundation.org,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc:     kai.heng.feng@canonical.com, hdegoede@redhat.com,
        robh+dt@kernel.org, linux-input@vger.kernel.org,
        swboyd@chromium.org, andrea@borgia.bo.it,
        Douglas Anderson <dianders@chromium.org>,
        Jiri Kosina <jikos@kernel.org>,
        Masahiro Yamada <masahiroy@kernel.org>,
        Pavel Balan <admin@kryma.net>,
        Xiaofei Tan <tanxiaofei@huawei.com>,
        You-Sheng Yang <vicamo.yang@canonical.com>,
        linux-kernel@vger.kernel.org
Subject: [PATCH v5 1/4] HID: i2c-hid: Reorganize so ACPI and OF are separate modules
Date:   Mon,  9 Nov 2020 13:36:33 -0800
Message-Id: <20201109133526.v5.1.Ied4ce10d229cd7c69abf13a0361ba0b8d82eb9c4@changeid>
X-Mailer: git-send-email 2.29.2.222.g5d2a92d10f8-goog
In-Reply-To: <20201109213636.1267536-1-dianders@chromium.org>
References: <20201109213636.1267536-1-dianders@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

This patch rejiggers the i2c-hid code so that the OF (Open Firmware
aka Device Tree) and ACPI support is separated out a bit.  The OF and
ACPI drivers are now separate modules that wrap the core module.

Essentially, what we're doing here:
* Make "power up" and "power down" a function that can be (optionally)
  implemented by a given user of the i2c-hid core.
* The OF and ACPI modules are drivers on their own, so they implement
  probe / remove / suspend / resume / shutdown.  The core code
  provides implementations that OF and ACPI can call into.

We'll organize this so that we now have 3 modules: the old i2c-hid
module becomes the "core" module and two new modules will depend on
it, handling probing the specific device.

As part of this work, we'll remove the i2c-hid "platform data"
concept since it's not needed.

Signed-off-by: Douglas Anderson <dianders@chromium.org>
---

Changes in v5:
- Add shutdown_tail op and use it in ACPI.
- i2chid_subclass_data => i2chid_ops.
- power_up_device => power_up (same with power_down).
- subclass => ops.

Changes in v4:
- Fully rejigger so ACPI and OF are full subclasses.

Changes in v3:
- Rework to use subclassing.

Changes in v2:
- Get timings based on the compatible string.
- Use a separate compatible string for this new touchscreen.

 drivers/hid/Makefile                  |   2 +-
 drivers/hid/i2c-hid/Kconfig           |  32 +++-
 drivers/hid/i2c-hid/Makefile          |   5 +-
 drivers/hid/i2c-hid/i2c-hid-acpi.c    | 170 +++++++++++++++++
 drivers/hid/i2c-hid/i2c-hid-core.c    | 252 ++++----------------------
 drivers/hid/i2c-hid/i2c-hid-of.c      | 147 +++++++++++++++
 drivers/hid/i2c-hid/i2c-hid.h         |  25 +++
 include/linux/platform_data/i2c-hid.h |  41 -----
 8 files changed, 412 insertions(+), 262 deletions(-)
 create mode 100644 drivers/hid/i2c-hid/i2c-hid-acpi.c
 create mode 100644 drivers/hid/i2c-hid/i2c-hid-of.c
 delete mode 100644 include/linux/platform_data/i2c-hid.h

diff --git a/drivers/hid/Makefile b/drivers/hid/Makefile
index 4acb583c92a6..8d0c15a0d652 100644
--- a/drivers/hid/Makefile
+++ b/drivers/hid/Makefile
@@ -138,7 +138,7 @@ obj-$(CONFIG_USB_HID)		+= usbhid/
 obj-$(CONFIG_USB_MOUSE)		+= usbhid/
 obj-$(CONFIG_USB_KBD)		+= usbhid/
 
-obj-$(CONFIG_I2C_HID)		+= i2c-hid/
+obj-$(CONFIG_I2C_HID_CORE)	+= i2c-hid/
 
 obj-$(CONFIG_INTEL_ISH_HID)	+= intel-ish-hid/
 obj-$(INTEL_ISH_FIRMWARE_DOWNLOADER)	+= intel-ish-hid/
diff --git a/drivers/hid/i2c-hid/Kconfig b/drivers/hid/i2c-hid/Kconfig
index c4e5dfeab2bd..819b7521c182 100644
--- a/drivers/hid/i2c-hid/Kconfig
+++ b/drivers/hid/i2c-hid/Kconfig
@@ -2,18 +2,40 @@
 menu "I2C HID support"
 	depends on I2C
 
-config I2C_HID
-	tristate "HID over I2C transport layer"
+config I2C_HID_ACPI
+	tristate "HID over I2C transport layer ACPI driver"
 	default n
-	depends on I2C && INPUT
-	select HID
+	depends on I2C && INPUT && ACPI
+	help
+	  Say Y here if you use a keyboard, a touchpad, a touchscreen, or any
+	  other HID based devices which is connected to your computer via I2C.
+	  This driver supports ACPI-based systems.
+
+	  If unsure, say N.
+
+	  This support is also available as a module.  If so, the module
+	  will be called i2c-hid-acpi.  It will also build/depend on the
+	  module i2c-hid.
+
+config I2C_HID_OF
+	tristate "HID over I2C transport layer Open Firmware driver"
+	default n
+	depends on I2C && INPUT && OF
 	help
 	  Say Y here if you use a keyboard, a touchpad, a touchscreen, or any
 	  other HID based devices which is connected to your computer via I2C.
+	  This driver supports Open Firmware (Device Tree)-based systems.
 
 	  If unsure, say N.
 
 	  This support is also available as a module.  If so, the module
-	  will be called i2c-hid.
+	  will be called i2c-hid-of.  It will also build/depend on the
+	  module i2c-hid.
 
 endmenu
+
+config I2C_HID_CORE
+	tristate
+	default y if I2C_HID_ACPI=y || I2C_HID_OF=y
+	default m if I2C_HID_ACPI=m || I2C_HID_OF=m
+	select HID
diff --git a/drivers/hid/i2c-hid/Makefile b/drivers/hid/i2c-hid/Makefile
index 681b3896898e..9b4a73446841 100644
--- a/drivers/hid/i2c-hid/Makefile
+++ b/drivers/hid/i2c-hid/Makefile
@@ -3,7 +3,10 @@
 # Makefile for the I2C input drivers
 #
 
-obj-$(CONFIG_I2C_HID)				+= i2c-hid.o
+obj-$(CONFIG_I2C_HID_CORE)			+= i2c-hid.o
 
 i2c-hid-objs					=  i2c-hid-core.o
 i2c-hid-$(CONFIG_DMI)				+= i2c-hid-dmi-quirks.o
+
+obj-$(CONFIG_I2C_HID_ACPI)			+= i2c-hid-acpi.o
+obj-$(CONFIG_I2C_HID_OF)			+= i2c-hid-of.o
diff --git a/drivers/hid/i2c-hid/i2c-hid-acpi.c b/drivers/hid/i2c-hid/i2c-hid-acpi.c
new file mode 100644
index 000000000000..5f09635d00ce
--- /dev/null
+++ b/drivers/hid/i2c-hid/i2c-hid-acpi.c
@@ -0,0 +1,170 @@
+/*
+ * HID over I2C ACPI Subclass
+ *
+ * Copyright (c) 2012 Benjamin Tissoires <benjamin.tissoires@gmail.com>
+ * Copyright (c) 2012 Ecole Nationale de l'Aviation Civile, France
+ * Copyright (c) 2012 Red Hat, Inc
+ *
+ * This code was forked out of the core code, which was partly based on
+ * "USB HID support for Linux":
+ *
+ *  Copyright (c) 1999 Andreas Gal
+ *  Copyright (c) 2000-2005 Vojtech Pavlik <vojtech@suse.cz>
+ *  Copyright (c) 2005 Michael Haboustak <mike-@cinci.rr.com> for Concept2, Inc
+ *  Copyright (c) 2007-2008 Oliver Neukum
+ *  Copyright (c) 2006-2010 Jiri Kosina
+ *
+ * This file is subject to the terms and conditions of the GNU General Public
+ * License.  See the file COPYING in the main directory of this archive for
+ * more details.
+ */
+
+#include <linux/acpi.h>
+#include <linux/device.h>
+#include <linux/i2c.h>
+#include <linux/kernel.h>
+#include <linux/module.h>
+#include <linux/pm.h>
+
+#include "i2c-hid.h"
+
+struct i2c_hid_acpi {
+	struct i2chid_ops ops;
+	struct i2c_client *client;
+	bool power_fixed;
+};
+
+static const struct acpi_device_id i2c_hid_acpi_blacklist[] = {
+	/*
+	 * The CHPN0001 ACPI device, which is used to describe the Chipone
+	 * ICN8505 controller, has a _CID of PNP0C50 but is not HID compatible.
+	 */
+	{"CHPN0001", 0 },
+	{ },
+};
+
+static int i2c_hid_acpi_get_descriptor(struct i2c_client *client)
+{
+	static guid_t i2c_hid_guid =
+		GUID_INIT(0x3CDFF6F7, 0x4267, 0x4555,
+			  0xAD, 0x05, 0xB3, 0x0A, 0x3D, 0x89, 0x38, 0xDE);
+	union acpi_object *obj;
+	struct acpi_device *adev;
+	acpi_handle handle;
+	u16 hid_descriptor_address;
+
+	handle = ACPI_HANDLE(&client->dev);
+	if (!handle || acpi_bus_get_device(handle, &adev)) {
+		dev_err(&client->dev, "Error could not get ACPI device\n");
+		return -ENODEV;
+	}
+
+	if (acpi_match_device_ids(adev, i2c_hid_acpi_blacklist) == 0)
+		return -ENODEV;
+
+	obj = acpi_evaluate_dsm_typed(handle, &i2c_hid_guid, 1, 1, NULL,
+				      ACPI_TYPE_INTEGER);
+	if (!obj) {
+		dev_err(&client->dev, "Error _DSM call to get HID descriptor address failed\n");
+		return -ENODEV;
+	}
+
+	hid_descriptor_address = obj->integer.value;
+	ACPI_FREE(obj);
+
+	return hid_descriptor_address;
+}
+
+static int i2c_hid_acpi_power_up(struct i2chid_ops *ops)
+{
+	struct i2c_hid_acpi *ihid_of =
+		container_of(ops, struct i2c_hid_acpi, ops);
+	struct device *dev = &ihid_of->client->dev;
+	struct acpi_device *adev;
+
+	/* Only need to call acpi_device_fix_up_power() the first time */
+	if (ihid_of->power_fixed)
+		return 0;
+	ihid_of->power_fixed = true;
+
+	adev = ACPI_COMPANION(dev);
+	if (adev)
+		acpi_device_fix_up_power(adev);
+
+	return 0;
+}
+
+static void i2c_hid_acpi_shutdown_tail(struct i2chid_ops *ops)
+{
+	struct i2c_hid_acpi *ihid_of =
+		container_of(ops, struct i2c_hid_acpi, ops);
+	struct device *dev = &ihid_of->client->dev;
+	acpi_device_set_power(ACPI_COMPANION(dev), ACPI_STATE_D3_COLD);
+}
+
+int i2c_hid_acpi_probe(struct i2c_client *client,
+		       const struct i2c_device_id *dev_id)
+{
+	struct device *dev = &client->dev;
+	struct i2c_hid_acpi *ihid_acpi;
+	u16 hid_descriptor_address;
+	int ret;
+
+	ihid_acpi = devm_kzalloc(&client->dev, sizeof(*ihid_acpi), GFP_KERNEL);
+	if (!ihid_acpi)
+		return -ENOMEM;
+
+	ihid_acpi->ops.power_up = i2c_hid_acpi_power_up;
+	ihid_acpi->ops.shutdown_tail = i2c_hid_acpi_shutdown_tail;
+
+	ret = i2c_hid_acpi_get_descriptor(client);
+	if (ret < 0)
+		return ret;
+	hid_descriptor_address = ret;
+
+	if (acpi_gbl_FADT.flags & ACPI_FADT_LOW_POWER_S0) {
+		device_set_wakeup_capable(dev, true);
+		device_set_wakeup_enable(dev, false);
+	}
+
+	return i2c_hid_core_probe(client, &ihid_acpi->ops,
+				  hid_descriptor_address);
+}
+
+static const struct dev_pm_ops i2c_hid_acpi_pm = {
+	SET_SYSTEM_SLEEP_PM_OPS(i2c_hid_core_suspend, i2c_hid_core_resume)
+};
+
+static const struct acpi_device_id i2c_hid_acpi_match[] = {
+	{"ACPI0C50", 0 },
+	{"PNP0C50", 0 },
+	{ },
+};
+MODULE_DEVICE_TABLE(acpi, i2c_hid_acpi_match);
+
+static const struct i2c_device_id i2c_hid_acpi_id_table[] = {
+	{ "hid", 0 },
+	{ "hid-over-i2c", 0 },
+	{ },
+};
+MODULE_DEVICE_TABLE(i2c, i2c_hid_acpi_id_table);
+
+static struct i2c_driver i2c_hid_acpi_driver = {
+	.driver = {
+		.name	= "i2c_hid_acpi",
+		.pm	= &i2c_hid_acpi_pm,
+		.probe_type = PROBE_PREFER_ASYNCHRONOUS,
+		.acpi_match_table = ACPI_PTR(i2c_hid_acpi_match),
+	},
+
+	.probe		= i2c_hid_acpi_probe,
+	.remove		= i2c_hid_core_remove,
+	.shutdown	= i2c_hid_core_shutdown,
+	.id_table	= i2c_hid_acpi_id_table,
+};
+
+module_i2c_driver(i2c_hid_acpi_driver);
+
+MODULE_DESCRIPTION("HID over I2C ACPI driver");
+MODULE_AUTHOR("Benjamin Tissoires <benjamin.tissoires@gmail.com>");
+MODULE_LICENSE("GPL");
diff --git a/drivers/hid/i2c-hid/i2c-hid-core.c b/drivers/hid/i2c-hid/i2c-hid-core.c
index aeff1ffb0c8b..9551ba96dc49 100644
--- a/drivers/hid/i2c-hid/i2c-hid-core.c
+++ b/drivers/hid/i2c-hid/i2c-hid-core.c
@@ -35,12 +35,8 @@
 #include <linux/kernel.h>
 #include <linux/hid.h>
 #include <linux/mutex.h>
-#include <linux/acpi.h>
-#include <linux/of.h>
 #include <linux/regulator/consumer.h>
 
-#include <linux/platform_data/i2c-hid.h>
-
 #include "../hid-ids.h"
 #include "i2c-hid.h"
 
@@ -156,10 +152,10 @@ struct i2c_hid {
 
 	wait_queue_head_t	wait;		/* For waiting the interrupt */
 
-	struct i2c_hid_platform_data pdata;
-
 	bool			irq_wake_enabled;
 	struct mutex		reset_lock;
+
+	struct i2chid_ops	*ops;
 };
 
 static const struct i2c_hid_quirks {
@@ -884,144 +880,36 @@ static int i2c_hid_fetch_hid_descriptor(struct i2c_hid *ihid)
 	return 0;
 }
 
-#ifdef CONFIG_ACPI
-static const struct acpi_device_id i2c_hid_acpi_blacklist[] = {
-	/*
-	 * The CHPN0001 ACPI device, which is used to describe the Chipone
-	 * ICN8505 controller, has a _CID of PNP0C50 but is not HID compatible.
-	 */
-	{"CHPN0001", 0 },
-	{ },
-};
-
-static int i2c_hid_acpi_pdata(struct i2c_client *client,
-		struct i2c_hid_platform_data *pdata)
+static int i2c_hid_core_power_up(struct i2c_hid *ihid)
 {
-	static guid_t i2c_hid_guid =
-		GUID_INIT(0x3CDFF6F7, 0x4267, 0x4555,
-			  0xAD, 0x05, 0xB3, 0x0A, 0x3D, 0x89, 0x38, 0xDE);
-	union acpi_object *obj;
-	struct acpi_device *adev;
-	acpi_handle handle;
-
-	handle = ACPI_HANDLE(&client->dev);
-	if (!handle || acpi_bus_get_device(handle, &adev)) {
-		dev_err(&client->dev, "Error could not get ACPI device\n");
-		return -ENODEV;
-	}
-
-	if (acpi_match_device_ids(adev, i2c_hid_acpi_blacklist) == 0)
-		return -ENODEV;
-
-	obj = acpi_evaluate_dsm_typed(handle, &i2c_hid_guid, 1, 1, NULL,
-				      ACPI_TYPE_INTEGER);
-	if (!obj) {
-		dev_err(&client->dev, "Error _DSM call to get HID descriptor address failed\n");
-		return -ENODEV;
-	}
-
-	pdata->hid_descriptor_address = obj->integer.value;
-	ACPI_FREE(obj);
-
-	return 0;
-}
-
-static void i2c_hid_acpi_fix_up_power(struct device *dev)
-{
-	struct acpi_device *adev;
-
-	adev = ACPI_COMPANION(dev);
-	if (adev)
-		acpi_device_fix_up_power(adev);
-}
-
-static void i2c_hid_acpi_enable_wakeup(struct device *dev)
-{
-	if (acpi_gbl_FADT.flags & ACPI_FADT_LOW_POWER_S0) {
-		device_set_wakeup_capable(dev, true);
-		device_set_wakeup_enable(dev, false);
-	}
-}
-
-static void i2c_hid_acpi_shutdown(struct device *dev)
-{
-	acpi_device_set_power(ACPI_COMPANION(dev), ACPI_STATE_D3_COLD);
-}
+	if (!ihid->ops->power_up)
+		return 0;
 
-static const struct acpi_device_id i2c_hid_acpi_match[] = {
-	{"ACPI0C50", 0 },
-	{"PNP0C50", 0 },
-	{ },
-};
-MODULE_DEVICE_TABLE(acpi, i2c_hid_acpi_match);
-#else
-static inline int i2c_hid_acpi_pdata(struct i2c_client *client,
-		struct i2c_hid_platform_data *pdata)
-{
-	return -ENODEV;
+	return ihid->ops->power_up(ihid->ops);
 }
 
-static inline void i2c_hid_acpi_fix_up_power(struct device *dev) {}
-
-static inline void i2c_hid_acpi_enable_wakeup(struct device *dev) {}
-
-static inline void i2c_hid_acpi_shutdown(struct device *dev) {}
-#endif
-
-#ifdef CONFIG_OF
-static int i2c_hid_of_probe(struct i2c_client *client,
-		struct i2c_hid_platform_data *pdata)
+static void i2c_hid_core_power_down(struct i2c_hid *ihid)
 {
-	struct device *dev = &client->dev;
-	u32 val;
-	int ret;
-
-	ret = of_property_read_u32(dev->of_node, "hid-descr-addr", &val);
-	if (ret) {
-		dev_err(&client->dev, "HID register address not provided\n");
-		return -ENODEV;
-	}
-	if (val >> 16) {
-		dev_err(&client->dev, "Bad HID register address: 0x%08x\n",
-			val);
-		return -EINVAL;
-	}
-	pdata->hid_descriptor_address = val;
-
-	return 0;
-}
+	if (!ihid->ops->power_down)
+		return;
 
-static const struct of_device_id i2c_hid_of_match[] = {
-	{ .compatible = "hid-over-i2c" },
-	{},
-};
-MODULE_DEVICE_TABLE(of, i2c_hid_of_match);
-#else
-static inline int i2c_hid_of_probe(struct i2c_client *client,
-		struct i2c_hid_platform_data *pdata)
-{
-	return -ENODEV;
+	ihid->ops->power_down(ihid->ops);
 }
-#endif
 
-static void i2c_hid_fwnode_probe(struct i2c_client *client,
-				 struct i2c_hid_platform_data *pdata)
+static void i2c_hid_core_shutdown_tail(struct i2c_hid *ihid)
 {
-	u32 val;
+	if (!ihid->ops->shutdown_tail)
+		return;
 
-	if (!device_property_read_u32(&client->dev, "post-power-on-delay-ms",
-				      &val))
-		pdata->post_power_delay_ms = val;
+	ihid->ops->shutdown_tail(ihid->ops);
 }
 
-static int i2c_hid_probe(struct i2c_client *client,
-			 const struct i2c_device_id *dev_id)
+int i2c_hid_core_probe(struct i2c_client *client, struct i2chid_ops *ops,
+		       u16 hid_descriptor_address)
 {
 	int ret;
 	struct i2c_hid *ihid;
 	struct hid_device *hid;
-	__u16 hidRegister;
-	struct i2c_hid_platform_data *platform_data = client->dev.platform_data;
 
 	dbg_hid("HID probe called for i2c 0x%02x\n", client->addr);
 
@@ -1042,44 +930,17 @@ static int i2c_hid_probe(struct i2c_client *client,
 	if (!ihid)
 		return -ENOMEM;
 
-	if (client->dev.of_node) {
-		ret = i2c_hid_of_probe(client, &ihid->pdata);
-		if (ret)
-			return ret;
-	} else if (!platform_data) {
-		ret = i2c_hid_acpi_pdata(client, &ihid->pdata);
-		if (ret)
-			return ret;
-	} else {
-		ihid->pdata = *platform_data;
-	}
-
-	/* Parse platform agnostic common properties from ACPI / device tree */
-	i2c_hid_fwnode_probe(client, &ihid->pdata);
+	ihid->ops = ops;
 
-	ihid->pdata.supplies[0].supply = "vdd";
-	ihid->pdata.supplies[1].supply = "vddl";
-
-	ret = devm_regulator_bulk_get(&client->dev,
-				      ARRAY_SIZE(ihid->pdata.supplies),
-				      ihid->pdata.supplies);
+	ret = i2c_hid_core_power_up(ihid);
 	if (ret)
 		return ret;
 
-	ret = regulator_bulk_enable(ARRAY_SIZE(ihid->pdata.supplies),
-				    ihid->pdata.supplies);
-	if (ret < 0)
-		return ret;
-
-	if (ihid->pdata.post_power_delay_ms)
-		msleep(ihid->pdata.post_power_delay_ms);
-
 	i2c_set_clientdata(client, ihid);
 
 	ihid->client = client;
 
-	hidRegister = ihid->pdata.hid_descriptor_address;
-	ihid->wHIDDescRegister = cpu_to_le16(hidRegister);
+	ihid->wHIDDescRegister = cpu_to_le16(hid_descriptor_address);
 
 	init_waitqueue_head(&ihid->wait);
 	mutex_init(&ihid->reset_lock);
@@ -1089,11 +950,7 @@ static int i2c_hid_probe(struct i2c_client *client,
 	 * real computation later. */
 	ret = i2c_hid_alloc_buffers(ihid, HID_MIN_BUFFER_SIZE);
 	if (ret < 0)
-		goto err_regulator;
-
-	i2c_hid_acpi_fix_up_power(&client->dev);
-
-	i2c_hid_acpi_enable_wakeup(&client->dev);
+		goto err_powered;
 
 	device_enable_async_suspend(&client->dev);
 
@@ -1102,16 +959,16 @@ static int i2c_hid_probe(struct i2c_client *client,
 	if (ret < 0) {
 		dev_dbg(&client->dev, "nothing at this address: %d\n", ret);
 		ret = -ENXIO;
-		goto err_regulator;
+		goto err_powered;
 	}
 
 	ret = i2c_hid_fetch_hid_descriptor(ihid);
 	if (ret < 0)
-		goto err_regulator;
+		goto err_powered;
 
 	ret = i2c_hid_init_irq(client);
 	if (ret < 0)
-		goto err_regulator;
+		goto err_powered;
 
 	hid = hid_allocate_device();
 	if (IS_ERR(hid)) {
@@ -1150,14 +1007,14 @@ static int i2c_hid_probe(struct i2c_client *client,
 err_irq:
 	free_irq(client->irq, ihid);
 
-err_regulator:
-	regulator_bulk_disable(ARRAY_SIZE(ihid->pdata.supplies),
-			       ihid->pdata.supplies);
+err_powered:
+	i2c_hid_core_power_down(ihid);
 	i2c_hid_free_buffers(ihid);
 	return ret;
 }
+EXPORT_SYMBOL_GPL(i2c_hid_core_probe);
 
-static int i2c_hid_remove(struct i2c_client *client)
+int i2c_hid_core_remove(struct i2c_client *client)
 {
 	struct i2c_hid *ihid = i2c_get_clientdata(client);
 	struct hid_device *hid;
@@ -1170,24 +1027,25 @@ static int i2c_hid_remove(struct i2c_client *client)
 	if (ihid->bufsize)
 		i2c_hid_free_buffers(ihid);
 
-	regulator_bulk_disable(ARRAY_SIZE(ihid->pdata.supplies),
-			       ihid->pdata.supplies);
+	i2c_hid_core_power_down(ihid);
 
 	return 0;
 }
+EXPORT_SYMBOL_GPL(i2c_hid_core_remove);
 
-static void i2c_hid_shutdown(struct i2c_client *client)
+void i2c_hid_core_shutdown(struct i2c_client *client)
 {
 	struct i2c_hid *ihid = i2c_get_clientdata(client);
 
 	i2c_hid_set_power(client, I2C_HID_PWR_SLEEP);
 	free_irq(client->irq, ihid);
 
-	i2c_hid_acpi_shutdown(&client->dev);
+	i2c_hid_core_shutdown_tail(ihid);
 }
+EXPORT_SYMBOL_GPL(i2c_hid_core_shutdown);
 
 #ifdef CONFIG_PM_SLEEP
-static int i2c_hid_suspend(struct device *dev)
+int i2c_hid_core_suspend(struct device *dev)
 {
 	struct i2c_client *client = to_i2c_client(dev);
 	struct i2c_hid *ihid = i2c_get_clientdata(client);
@@ -1214,14 +1072,14 @@ static int i2c_hid_suspend(struct device *dev)
 			hid_warn(hid, "Failed to enable irq wake: %d\n",
 				wake_status);
 	} else {
-		regulator_bulk_disable(ARRAY_SIZE(ihid->pdata.supplies),
-				       ihid->pdata.supplies);
+		i2c_hid_core_power_down(ihid);
 	}
 
 	return 0;
 }
+EXPORT_SYMBOL_GPL(i2c_hid_core_suspend);
 
-static int i2c_hid_resume(struct device *dev)
+int i2c_hid_core_resume(struct device *dev)
 {
 	int ret;
 	struct i2c_client *client = to_i2c_client(dev);
@@ -1230,13 +1088,7 @@ static int i2c_hid_resume(struct device *dev)
 	int wake_status;
 
 	if (!device_may_wakeup(&client->dev)) {
-		ret = regulator_bulk_enable(ARRAY_SIZE(ihid->pdata.supplies),
-					    ihid->pdata.supplies);
-		if (ret)
-			hid_warn(hid, "Failed to enable supplies: %d\n", ret);
-
-		if (ihid->pdata.post_power_delay_ms)
-			msleep(ihid->pdata.post_power_delay_ms);
+		i2c_hid_core_power_up(ihid);
 	} else if (ihid->irq_wake_enabled) {
 		wake_status = disable_irq_wake(client->irq);
 		if (!wake_status)
@@ -1271,37 +1123,9 @@ static int i2c_hid_resume(struct device *dev)
 
 	return 0;
 }
+EXPORT_SYMBOL_GPL(i2c_hid_core_resume);
 #endif
 
-static const struct dev_pm_ops i2c_hid_pm = {
-	SET_SYSTEM_SLEEP_PM_OPS(i2c_hid_suspend, i2c_hid_resume)
-};
-
-static const struct i2c_device_id i2c_hid_id_table[] = {
-	{ "hid", 0 },
-	{ "hid-over-i2c", 0 },
-	{ },
-};
-MODULE_DEVICE_TABLE(i2c, i2c_hid_id_table);
-
-
-static struct i2c_driver i2c_hid_driver = {
-	.driver = {
-		.name	= "i2c_hid",
-		.pm	= &i2c_hid_pm,
-		.probe_type = PROBE_PREFER_ASYNCHRONOUS,
-		.acpi_match_table = ACPI_PTR(i2c_hid_acpi_match),
-		.of_match_table = of_match_ptr(i2c_hid_of_match),
-	},
-
-	.probe		= i2c_hid_probe,
-	.remove		= i2c_hid_remove,
-	.shutdown	= i2c_hid_shutdown,
-	.id_table	= i2c_hid_id_table,
-};
-
-module_i2c_driver(i2c_hid_driver);
-
 MODULE_DESCRIPTION("HID over I2C core driver");
 MODULE_AUTHOR("Benjamin Tissoires <benjamin.tissoires@gmail.com>");
 MODULE_LICENSE("GPL");
diff --git a/drivers/hid/i2c-hid/i2c-hid-of.c b/drivers/hid/i2c-hid/i2c-hid-of.c
new file mode 100644
index 000000000000..15d533be2b24
--- /dev/null
+++ b/drivers/hid/i2c-hid/i2c-hid-of.c
@@ -0,0 +1,147 @@
+/*
+ * HID over I2C Open Firmware Subclass
+ *
+ * Copyright (c) 2012 Benjamin Tissoires <benjamin.tissoires@gmail.com>
+ * Copyright (c) 2012 Ecole Nationale de l'Aviation Civile, France
+ * Copyright (c) 2012 Red Hat, Inc
+ *
+ * This code was forked out of the core code, which was partly based on
+ * "USB HID support for Linux":
+ *
+ *  Copyright (c) 1999 Andreas Gal
+ *  Copyright (c) 2000-2005 Vojtech Pavlik <vojtech@suse.cz>
+ *  Copyright (c) 2005 Michael Haboustak <mike-@cinci.rr.com> for Concept2, Inc
+ *  Copyright (c) 2007-2008 Oliver Neukum
+ *  Copyright (c) 2006-2010 Jiri Kosina
+ *
+ * This file is subject to the terms and conditions of the GNU General Public
+ * License.  See the file COPYING in the main directory of this archive for
+ * more details.
+ */
+
+#include <linux/delay.h>
+#include <linux/device.h>
+#include <linux/i2c.h>
+#include <linux/kernel.h>
+#include <linux/module.h>
+#include <linux/of.h>
+#include <linux/pm.h>
+#include <linux/regulator/consumer.h>
+
+#include "i2c-hid.h"
+
+struct i2c_hid_of {
+	struct i2chid_ops ops;
+
+	struct i2c_client *client;
+	struct regulator_bulk_data supplies[2];
+	int post_power_delay_ms;
+};
+
+static int i2c_hid_of_power_up(struct i2chid_ops *ops)
+{
+	struct i2c_hid_of *ihid_of = container_of(ops, struct i2c_hid_of, ops);
+	struct device *dev = &ihid_of->client->dev;
+	int ret;
+
+	ret = regulator_bulk_enable(ARRAY_SIZE(ihid_of->supplies),
+				    ihid_of->supplies);
+	if (ret) {
+		dev_warn(dev, "Failed to enable supplies: %d\n", ret);
+		return ret;
+	}
+
+	if (ihid_of->post_power_delay_ms)
+		msleep(ihid_of->post_power_delay_ms);
+
+	return 0;
+}
+
+static void i2c_hid_of_power_down(struct i2chid_ops *ops)
+{
+	struct i2c_hid_of *ihid_of = container_of(ops, struct i2c_hid_of, ops);
+
+	regulator_bulk_disable(ARRAY_SIZE(ihid_of->supplies),
+			       ihid_of->supplies);
+}
+
+static int i2c_hid_of_probe(struct i2c_client *client,
+			    const struct i2c_device_id *dev_id)
+{
+	struct device *dev = &client->dev;
+	struct i2c_hid_of *ihid_of;
+	u16 hid_descriptor_address;
+	int ret;
+	u32 val;
+
+	ihid_of = devm_kzalloc(&client->dev, sizeof(*ihid_of), GFP_KERNEL);
+	if (!ihid_of)
+		return -ENOMEM;
+
+	ihid_of->ops.power_up = i2c_hid_of_power_up;
+	ihid_of->ops.power_down = i2c_hid_of_power_down;
+
+	ret = of_property_read_u32(dev->of_node, "hid-descr-addr", &val);
+	if (ret) {
+		dev_err(&client->dev, "HID register address not provided\n");
+		return -ENODEV;
+	}
+	if (val >> 16) {
+		dev_err(&client->dev, "Bad HID register address: 0x%08x\n",
+			val);
+		return -EINVAL;
+	}
+	hid_descriptor_address = val;
+
+	if (!device_property_read_u32(&client->dev, "post-power-on-delay-ms",
+				      &val))
+		ihid_of->post_power_delay_ms = val;
+
+	ihid_of->supplies[0].supply = "vdd";
+	ihid_of->supplies[1].supply = "vddl";
+	ret = devm_regulator_bulk_get(&client->dev,
+				      ARRAY_SIZE(ihid_of->supplies),
+				      ihid_of->supplies);
+	if (ret)
+		return ret;
+
+	return i2c_hid_core_probe(client, &ihid_of->ops,
+				  hid_descriptor_address);
+}
+
+static const struct dev_pm_ops i2c_hid_of_pm = {
+	SET_SYSTEM_SLEEP_PM_OPS(i2c_hid_core_suspend, i2c_hid_core_resume)
+};
+
+static const struct of_device_id i2c_hid_of_match[] = {
+	{ .compatible = "hid-over-i2c" },
+	{},
+};
+MODULE_DEVICE_TABLE(of, i2c_hid_of_match);
+
+static const struct i2c_device_id i2c_hid_of_id_table[] = {
+	{ "hid", 0 },
+	{ "hid-over-i2c", 0 },
+	{ },
+};
+MODULE_DEVICE_TABLE(i2c, i2c_hid_of_id_table);
+
+static struct i2c_driver i2c_hid_of_driver = {
+	.driver = {
+		.name	= "i2c_hid_of",
+		.pm	= &i2c_hid_of_pm,
+		.probe_type = PROBE_PREFER_ASYNCHRONOUS,
+		.of_match_table = of_match_ptr(i2c_hid_of_match),
+	},
+
+	.probe		= i2c_hid_of_probe,
+	.remove		= i2c_hid_core_remove,
+	.shutdown	= i2c_hid_core_shutdown,
+	.id_table	= i2c_hid_of_id_table,
+};
+
+module_i2c_driver(i2c_hid_of_driver);
+
+MODULE_DESCRIPTION("HID over I2C OF driver");
+MODULE_AUTHOR("Benjamin Tissoires <benjamin.tissoires@gmail.com>");
+MODULE_LICENSE("GPL");
diff --git a/drivers/hid/i2c-hid/i2c-hid.h b/drivers/hid/i2c-hid/i2c-hid.h
index a8c19aef5824..13e666ec366c 100644
--- a/drivers/hid/i2c-hid/i2c-hid.h
+++ b/drivers/hid/i2c-hid/i2c-hid.h
@@ -3,6 +3,7 @@
 #ifndef I2C_HID_H
 #define I2C_HID_H
 
+#include <linux/i2c.h>
 
 #ifdef CONFIG_DMI
 struct i2c_hid_desc *i2c_hid_get_dmi_i2c_hid_desc_override(uint8_t *i2c_name);
@@ -17,4 +18,28 @@ static inline char *i2c_hid_get_dmi_hid_report_desc_override(uint8_t *i2c_name,
 { return NULL; }
 #endif
 
+/**
+ * struct i2chid_ops - Ops provided to the core.
+ *
+ * @power_up: do sequencing to power up the device.
+ * @power_down: do sequencing to power down the device.
+ * @shutdown_tail: called at the end of shutdown.
+ */
+struct i2chid_ops {
+	int (*power_up)(struct i2chid_ops *ops);
+	void (*power_down)(struct i2chid_ops *ops);
+	void (*shutdown_tail)(struct i2chid_ops *ops);
+};
+
+int i2c_hid_core_probe(struct i2c_client *client, struct i2chid_ops *ops,
+		       u16 hid_descriptor_address);
+int i2c_hid_core_remove(struct i2c_client *client);
+
+void i2c_hid_core_shutdown(struct i2c_client *client);
+
+#ifdef CONFIG_PM_SLEEP
+int i2c_hid_core_suspend(struct device *dev);
+int i2c_hid_core_resume(struct device *dev);
+#endif
+
 #endif
diff --git a/include/linux/platform_data/i2c-hid.h b/include/linux/platform_data/i2c-hid.h
deleted file mode 100644
index c628bb5e1061..000000000000
--- a/include/linux/platform_data/i2c-hid.h
+++ /dev/null
@@ -1,41 +0,0 @@
-/*
- * HID over I2C protocol implementation
- *
- * Copyright (c) 2012 Benjamin Tissoires <benjamin.tissoires@gmail.com>
- * Copyright (c) 2012 Ecole Nationale de l'Aviation Civile, France
- *
- * This file is subject to the terms and conditions of the GNU General Public
- * License.  See the file COPYING in the main directory of this archive for
- * more details.
- */
-
-#ifndef __LINUX_I2C_HID_H
-#define __LINUX_I2C_HID_H
-
-#include <linux/regulator/consumer.h>
-#include <linux/types.h>
-
-/**
- * struct i2chid_platform_data - used by hid over i2c implementation.
- * @hid_descriptor_address: i2c register where the HID descriptor is stored.
- * @supplies: regulators for powering on the device.
- * @post_power_delay_ms: delay after powering on before device is usable.
- *
- * Note that it is the responsibility of the platform driver (or the acpi 5.0
- * driver, or the flattened device tree) to setup the irq related to the gpio in
- * the struct i2c_board_info.
- * The platform driver should also setup the gpio according to the device:
- *
- * A typical example is the following:
- *	irq = gpio_to_irq(intr_gpio);
- *	hkdk4412_i2c_devs5[0].irq = irq; // store the irq in i2c_board_info
- *	gpio_request(intr_gpio, "elan-irq");
- *	s3c_gpio_setpull(intr_gpio, S3C_GPIO_PULL_UP);
- */
-struct i2c_hid_platform_data {
-	u16 hid_descriptor_address;
-	struct regulator_bulk_data supplies[2];
-	int post_power_delay_ms;
-};
-
-#endif /* __LINUX_I2C_HID_H */
-- 
2.29.2.222.g5d2a92d10f8-goog

