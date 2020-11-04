Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D17112A5BEB
	for <lists+linux-input@lfdr.de>; Wed,  4 Nov 2020 02:29:58 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725769AbgKDB35 (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 3 Nov 2020 20:29:57 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37586 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729827AbgKDB34 (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Tue, 3 Nov 2020 20:29:56 -0500
Received: from mail-pg1-x532.google.com (mail-pg1-x532.google.com [IPv6:2607:f8b0:4864:20::532])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1FFB6C0401C1
        for <linux-input@vger.kernel.org>; Tue,  3 Nov 2020 17:29:56 -0800 (PST)
Received: by mail-pg1-x532.google.com with SMTP id i26so15148108pgl.5
        for <linux-input@vger.kernel.org>; Tue, 03 Nov 2020 17:29:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=dEdk6Ehi+Ukym8zP3df486LdMSloM9CLjuSnih9+3ug=;
        b=DB40jptUP7S1dHJ6V2JVDA24BXNbrRWrr4SXzjrlNAo/WXypBS/+kC4TwN4UbVYH5f
         AyBDSKDaUS0JYYqTPl3mf/KBaTtGaBbdJL6lUwXvLujU0K+fZfOs996fz9m1/9u6vLZ4
         pYu3Org1o1pmYLcl5pA93DBUfu0hpvO8e/MaY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=dEdk6Ehi+Ukym8zP3df486LdMSloM9CLjuSnih9+3ug=;
        b=GU0JfzuE78DNlCOyPA+6uIjeZ8Vcn+UG2AwDxJzfyYiemX34W4Pw0ocoXUlGVkJDol
         ekf5DQmgqIfpG7o+omHZvuN3EIxtEVj8f7mmqx+8+HVaN6D4fQTkbrVxUkXbi3PIAuYP
         tFpRAb8rdY0N1qCsKxtEN8YeABqD0qmy/Fzn5ajqGK+i7gbkobtto1CWrUkVk+ZOGV6j
         sX8I7G+54mtldBc0WCAJerQHz1vDSdLA9mdoKrPOEhugvaUv4waNpCQe0u/zXZTjy9rD
         VRRhfCZKxM0FEuas303Vzbu6exLR3LS9/2LEYv/A/ZP7hosXsrnH9TWaeuOTkV+Nd91L
         G6Dw==
X-Gm-Message-State: AOAM532LYMRK/O0NrfcgnkMDfQ+elCm7RFsbir8c1wkfN2AtbFpdgD9r
        qusr8FXx1YBa7jWE8qxXmomxLQ==
X-Google-Smtp-Source: ABdhPJx3vYASCGUHi1a5Zp9yYPPPZwHA/+ZuEUrSwnB9RiBKFOk3kV4CwpBZtVWH2Lq+n0QR8DBPOQ==
X-Received: by 2002:a17:90a:5884:: with SMTP id j4mr1962873pji.7.1604453395333;
        Tue, 03 Nov 2020 17:29:55 -0800 (PST)
Received: from tictac2.mtv.corp.google.com ([2620:15c:202:1:42b0:34ff:fe3d:58e6])
        by smtp.gmail.com with ESMTPSA id m3sm347424pjv.52.2020.11.03.17.29.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Nov 2020 17:29:54 -0800 (PST)
From:   Douglas Anderson <dianders@chromium.org>
To:     jkosina@suse.cz, benjamin.tissoires@redhat.com,
        gregkh@linuxfoundation.org,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc:     linux-input@vger.kernel.org, swboyd@chromium.org,
        andrea@borgia.bo.it, kai.heng.feng@canonical.com,
        hdegoede@redhat.com, robh+dt@kernel.org,
        Douglas Anderson <dianders@chromium.org>,
        Aaron Ma <aaron.ma@canonical.com>,
        Jiri Kosina <jikos@kernel.org>,
        Masahiro Yamada <masahiroy@kernel.org>,
        Pavel Balan <admin@kryma.net>,
        Xiaofei Tan <tanxiaofei@huawei.com>,
        You-Sheng Yang <vicamo.yang@canonical.com>,
        linux-kernel@vger.kernel.org
Subject: [PATCH v4 1/4] HID: i2c-hid: Reorganize so ACPI and OF are subclasses
Date:   Tue,  3 Nov 2020 17:29:26 -0800
Message-Id: <20201103172824.v4.1.Ied4ce10d229cd7c69abf13a0361ba0b8d82eb9c4@changeid>
X-Mailer: git-send-email 2.29.1.341.ge80a0c044ae-goog
In-Reply-To: <20201104012929.3850691-1-dianders@chromium.org>
References: <20201104012929.3850691-1-dianders@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

This patch rejiggers the i2c-hid code so that the OF (Device Tree) and
ACPI support is separated out a bit.  The OF and ACPI drivers are now
effectively "subclasses" of the generic code.

Essentially, what we're doing here:
* Make "power up" and "power down" a virtual function that can be
  (optionally) implemented by subclasses.
* Each subclass is a drive on its own, so it implements probe / remove
  / suspend / resume / shutdown.  The core code provides
  implementations that the subclasses can call into, or fully use for
  their implementation if they don't have special needs.

We'll organize this so that we now have 3 modules: the old i2c-hid
module becomes the "core" module and two new modules will depend on
it, handling probing the specific device.

As part of this work, we'll remove the i2c-hid "platform data"
concept since it's not needed.

Signed-off-by: Douglas Anderson <dianders@chromium.org>
---

Changes in v4:
- Fully rejigger so ACPI and OF are full subclasses.

Changes in v3:
- Rework to use subclassing.

Changes in v2:
- Use a separate compatible string for this new touchscreen.
- Get timings based on the compatible string.

 drivers/hid/Makefile                  |   2 +-
 drivers/hid/i2c-hid/Kconfig           |  32 +++-
 drivers/hid/i2c-hid/Makefile          |   5 +-
 drivers/hid/i2c-hid/i2c-hid-acpi.c    | 167 +++++++++++++++++
 drivers/hid/i2c-hid/i2c-hid-core.c    | 253 ++++----------------------
 drivers/hid/i2c-hid/i2c-hid-of.c      | 149 +++++++++++++++
 drivers/hid/i2c-hid/i2c-hid.h         |  24 +++
 include/linux/platform_data/i2c-hid.h |  41 -----
 8 files changed, 406 insertions(+), 267 deletions(-)
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
index 000000000000..d4c29dc62297
--- /dev/null
+++ b/drivers/hid/i2c-hid/i2c-hid-acpi.c
@@ -0,0 +1,167 @@
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
+	struct i2chid_subclass_data subclass;
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
+static int i2c_hid_acpi_power_up_device(struct i2chid_subclass_data *subclass)
+{
+	struct i2c_hid_acpi *ihid_of =
+		container_of(subclass, struct i2c_hid_acpi, subclass);
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
+	ihid_acpi->subclass.power_up_device = i2c_hid_acpi_power_up_device;
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
+	return i2c_hid_core_probe(client, &ihid_acpi->subclass,
+				  hid_descriptor_address);
+}
+
+static void i2c_hid_acpi_shutdown(struct i2c_client *client)
+{
+	i2c_hid_core_shutdown(client);
+	acpi_device_set_power(ACPI_COMPANION(&client->dev), ACPI_STATE_D3_COLD);
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
+	.shutdown	= i2c_hid_acpi_shutdown,
+	.id_table	= i2c_hid_acpi_id_table,
+};
+
+module_i2c_driver(i2c_hid_acpi_driver);
+
+MODULE_DESCRIPTION("HID over I2C ACPI driver");
+MODULE_AUTHOR("Benjamin Tissoires <benjamin.tissoires@gmail.com>");
+MODULE_LICENSE("GPL");
diff --git a/drivers/hid/i2c-hid/i2c-hid-core.c b/drivers/hid/i2c-hid/i2c-hid-core.c
index aeff1ffb0c8b..7e7303c2a45e 100644
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
+	struct i2chid_subclass_data *subclass;
 };
 
 static const struct i2c_hid_quirks {
@@ -884,144 +880,29 @@ static int i2c_hid_fetch_hid_descriptor(struct i2c_hid *ihid)
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
-{
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
-
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
-}
-
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
+static int i2c_hid_core_power_up(struct i2c_hid *ihid)
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
+	if (!ihid->subclass->power_up_device)
+		return 0;
 
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
+	return ihid->subclass->power_up_device(ihid->subclass);
 }
-#endif
 
-static void i2c_hid_fwnode_probe(struct i2c_client *client,
-				 struct i2c_hid_platform_data *pdata)
+static void i2c_hid_core_power_down(struct i2c_hid *ihid)
 {
-	u32 val;
+	if (!ihid->subclass->power_down_device)
+		return;
 
-	if (!device_property_read_u32(&client->dev, "post-power-on-delay-ms",
-				      &val))
-		pdata->post_power_delay_ms = val;
+	ihid->subclass->power_down_device(ihid->subclass);
 }
 
-static int i2c_hid_probe(struct i2c_client *client,
-			 const struct i2c_device_id *dev_id)
+int i2c_hid_core_probe(struct i2c_client *client,
+		       struct i2chid_subclass_data *subclass,
+		       u16 hid_descriptor_address)
 {
 	int ret;
 	struct i2c_hid *ihid;
 	struct hid_device *hid;
-	__u16 hidRegister;
-	struct i2c_hid_platform_data *platform_data = client->dev.platform_data;
 
 	dbg_hid("HID probe called for i2c 0x%02x\n", client->addr);
 
@@ -1042,44 +923,17 @@ static int i2c_hid_probe(struct i2c_client *client,
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
+	ihid->subclass = subclass;
 
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
@@ -1089,11 +943,7 @@ static int i2c_hid_probe(struct i2c_client *client,
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
 
@@ -1102,16 +952,16 @@ static int i2c_hid_probe(struct i2c_client *client,
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
@@ -1150,14 +1000,14 @@ static int i2c_hid_probe(struct i2c_client *client,
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
@@ -1170,24 +1020,23 @@ static int i2c_hid_remove(struct i2c_client *client)
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
-
-	i2c_hid_acpi_shutdown(&client->dev);
 }
+EXPORT_SYMBOL_GPL(i2c_hid_core_shutdown);
 
 #ifdef CONFIG_PM_SLEEP
-static int i2c_hid_suspend(struct device *dev)
+int i2c_hid_core_suspend(struct device *dev)
 {
 	struct i2c_client *client = to_i2c_client(dev);
 	struct i2c_hid *ihid = i2c_get_clientdata(client);
@@ -1214,14 +1063,14 @@ static int i2c_hid_suspend(struct device *dev)
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
@@ -1230,13 +1079,7 @@ static int i2c_hid_resume(struct device *dev)
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
@@ -1271,37 +1114,9 @@ static int i2c_hid_resume(struct device *dev)
 
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
index 000000000000..e1838cdef0aa
--- /dev/null
+++ b/drivers/hid/i2c-hid/i2c-hid-of.c
@@ -0,0 +1,149 @@
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
+	struct i2chid_subclass_data subclass;
+
+	struct i2c_client *client;
+	struct regulator_bulk_data supplies[2];
+	int post_power_delay_ms;
+};
+
+static int i2c_hid_of_power_up_device(struct i2chid_subclass_data *subclass)
+{
+	struct i2c_hid_of *ihid_of =
+		container_of(subclass, struct i2c_hid_of, subclass);
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
+static void i2c_hid_of_power_down_device(struct i2chid_subclass_data *subclass)
+{
+	struct i2c_hid_of *ihid_of = container_of(subclass, struct i2c_hid_of,
+						  subclass);
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
+	ihid_of->subclass.power_up_device = i2c_hid_of_power_up_device;
+	ihid_of->subclass.power_down_device = i2c_hid_of_power_down_device;
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
+	return i2c_hid_core_probe(client, &ihid_of->subclass,
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
index a8c19aef5824..e5665224fe2b 100644
--- a/drivers/hid/i2c-hid/i2c-hid.h
+++ b/drivers/hid/i2c-hid/i2c-hid.h
@@ -3,6 +3,7 @@
 #ifndef I2C_HID_H
 #define I2C_HID_H
 
+#include <linux/i2c.h>
 
 #ifdef CONFIG_DMI
 struct i2c_hid_desc *i2c_hid_get_dmi_i2c_hid_desc_override(uint8_t *i2c_name);
@@ -17,4 +18,27 @@ static inline char *i2c_hid_get_dmi_hid_report_desc_override(uint8_t *i2c_name,
 { return NULL; }
 #endif
 
+/**
+ * struct i2chid_subclass_data - Data passed from subclass to the core.
+ *
+ * @power_up_device: do sequencing to power up the device.
+ * @power_down_device: do sequencing to power down the device.
+ */
+struct i2chid_subclass_data {
+	int (*power_up_device)(struct i2chid_subclass_data *subclass);
+	void (*power_down_device)(struct i2chid_subclass_data *subclass);
+};
+
+int i2c_hid_core_probe(struct i2c_client *client,
+		       struct i2chid_subclass_data *subclass,
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
2.29.1.341.ge80a0c044ae-goog

