Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BFED32F819D
	for <lists+linux-input@lfdr.de>; Fri, 15 Jan 2021 18:08:51 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728577AbhAORHs (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Fri, 15 Jan 2021 12:07:48 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42008 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726519AbhAORHr (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Fri, 15 Jan 2021 12:07:47 -0500
Received: from mail-pg1-x534.google.com (mail-pg1-x534.google.com [IPv6:2607:f8b0:4864:20::534])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5AF0FC061793
        for <linux-input@vger.kernel.org>; Fri, 15 Jan 2021 09:07:07 -0800 (PST)
Received: by mail-pg1-x534.google.com with SMTP id g15so6376595pgu.9
        for <linux-input@vger.kernel.org>; Fri, 15 Jan 2021 09:07:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=kF/EX3rADuSBhQs7FupVhWgldAHVyaUkRqYmNCeENbA=;
        b=eIADZE0UduTMd8SrX5mqWW3g+JhvyY0mzEHTeKZQvM+3G4xfzsXSKr/lRyHRFR8QeE
         xkYp8u8sgcfIuEkwM2Z1BYmXw1Fy12hw1uDoLNvCvt7k0y7kaA/xY1t8ReOvh1UlDNN3
         Mm09pb5dR2OuxvXrBdYIXiFuMQrvMpRfJFvr4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=kF/EX3rADuSBhQs7FupVhWgldAHVyaUkRqYmNCeENbA=;
        b=fUpjAfbuIKjG/hZldx9bbK9EtA3hQuVOWkxen33286EsRW5z5hJrGuembmkb1AtZRp
         19y6i9Cu/eN/526XFb+hSkmeR6WDOkifybDBHWTVOZqSPqQ+eizVRsDge//VUt2osk0j
         MvRZindZXXgdWdozz87if+JdHOhX5etb7/IBf1EyEiWSf7KdLvoe/hItf8a0h5ShvFPj
         DAbess8wi+dv1xqySxJOgwhFIGKRnGfmYIp6saYdEW2+bq9djGecYYZqIDvgDLrhN9zO
         apmQjEPFUepv9X3/tqFGMduwXv9SYwSlLKfeod4RPzdhmxAQ45jdabDaOY5MS1lcuUVk
         s0xA==
X-Gm-Message-State: AOAM532rvfcQ6V0Jt9q/UizBjOFvENI7AX0UsmtGwJMDJ4PV/1ICmUcp
        9WLx664Ls4RRKbsS+pI5/Iu6Xw==
X-Google-Smtp-Source: ABdhPJyYYJNaQHmtYrnJPyt0SSku95PjH1Ldwoh4HfCrVFdTjZUzSmilL6Zkpjxh+xGbiWaNomnJ+w==
X-Received: by 2002:a63:5f12:: with SMTP id t18mr13734314pgb.308.1610730426794;
        Fri, 15 Jan 2021 09:07:06 -0800 (PST)
Received: from tictac2.mtv.corp.google.com ([2620:15c:202:1:42b0:34ff:fe3d:58e6])
        by smtp.gmail.com with ESMTPSA id t23sm8813329pfc.0.2021.01.15.09.07.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 15 Jan 2021 09:07:06 -0800 (PST)
From:   Douglas Anderson <dianders@chromium.org>
To:     jkosina@suse.cz, benjamin.tissoires@redhat.com,
        gregkh@linuxfoundation.org,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc:     swboyd@chromium.org, linux-input@vger.kernel.org,
        hdegoede@redhat.com, andrea@borgia.bo.it,
        kai.heng.feng@canonical.com, robh+dt@kernel.org,
        Douglas Anderson <dianders@chromium.org>,
        Coiby Xu <coiby.xu@gmail.com>,
        Daniel Playfair Cal <daniel.playfair.cal@gmail.com>,
        Jiri Kosina <jikos@kernel.org>,
        Masahiro Yamada <masahiroy@kernel.org>,
        linux-kernel@vger.kernel.org
Subject: [PATCH v9 1/4] HID: i2c-hid: Reorganize so ACPI and OF are separate modules
Date:   Fri, 15 Jan 2021 09:06:37 -0800
Message-Id: <20210115090518.v9.1.Ied4ce10d229cd7c69abf13a0361ba0b8d82eb9c4@changeid>
X-Mailer: git-send-email 2.30.0.284.gd98b1dd5eaa7-goog
In-Reply-To: <20210115170641.903392-1-dianders@chromium.org>
References: <20210115170641.903392-1-dianders@chromium.org>
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
Reviewed-by: Hans de Goede <hdegoede@redhat.com>
---

Changes in v9:
- Local variable in ACPI code "ihid_of" => "ihid_acpi".
- Squash Benjamin's change for ACPI power on.

Changes in v8:
- Mark suspend/resume as static as per patches robot.

Changes in v7:
- Rebase atop commit afdd34c5fa40 ("HID: i2c-hid: show the error ...")

Changes in v6:
- ACPI probe function should have been "static"
- Don't export suspend/resume, just export dev_pm_ops from core.
- Fixed crash in ACPI module (missing init of "client")
- No need for regulator include in the core.
- Removed i2c_device_id table from ACPI module.

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
 drivers/hid/i2c-hid/i2c-hid-acpi.c    | 143 +++++++++++++++
 drivers/hid/i2c-hid/i2c-hid-core.c    | 252 ++++----------------------
 drivers/hid/i2c-hid/i2c-hid-of.c      | 143 +++++++++++++++
 drivers/hid/i2c-hid/i2c-hid.h         |  22 +++
 include/linux/platform_data/i2c-hid.h |  41 -----
 8 files changed, 379 insertions(+), 261 deletions(-)
 create mode 100644 drivers/hid/i2c-hid/i2c-hid-acpi.c
 create mode 100644 drivers/hid/i2c-hid/i2c-hid-of.c
 delete mode 100644 include/linux/platform_data/i2c-hid.h

diff --git a/drivers/hid/Makefile b/drivers/hid/Makefile
index 014d21fe7dac..a0621a4a65cd 100644
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
index 000000000000..bb8c00e6be78
--- /dev/null
+++ b/drivers/hid/i2c-hid/i2c-hid-acpi.c
@@ -0,0 +1,143 @@
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
+static void i2c_hid_acpi_shutdown_tail(struct i2chid_ops *ops)
+{
+	struct i2c_hid_acpi *ihid_acpi =
+		container_of(ops, struct i2c_hid_acpi, ops);
+	struct device *dev = &ihid_acpi->client->dev;
+	acpi_device_set_power(ACPI_COMPANION(dev), ACPI_STATE_D3_COLD);
+}
+
+static int i2c_hid_acpi_probe(struct i2c_client *client,
+			      const struct i2c_device_id *dev_id)
+{
+	struct device *dev = &client->dev;
+	struct i2c_hid_acpi *ihid_acpi;
+	struct acpi_device *adev;
+	u16 hid_descriptor_address;
+	int ret;
+
+	ihid_acpi = devm_kzalloc(&client->dev, sizeof(*ihid_acpi), GFP_KERNEL);
+	if (!ihid_acpi)
+		return -ENOMEM;
+
+	ihid_acpi->client = client;
+	ihid_acpi->ops.shutdown_tail = i2c_hid_acpi_shutdown_tail;
+
+	ret = i2c_hid_acpi_get_descriptor(client);
+	if (ret < 0)
+		return ret;
+	hid_descriptor_address = ret;
+
+	adev = ACPI_COMPANION(dev);
+	if (adev)
+		acpi_device_fix_up_power(adev);
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
+static const struct acpi_device_id i2c_hid_acpi_match[] = {
+	{"ACPI0C50", 0 },
+	{"PNP0C50", 0 },
+	{ },
+};
+MODULE_DEVICE_TABLE(acpi, i2c_hid_acpi_match);
+
+static struct i2c_driver i2c_hid_acpi_driver = {
+	.driver = {
+		.name	= "i2c_hid_acpi",
+		.pm	= &i2c_hid_core_pm,
+		.probe_type = PROBE_PREFER_ASYNCHRONOUS,
+		.acpi_match_table = ACPI_PTR(i2c_hid_acpi_match),
+	},
+
+	.probe		= i2c_hid_acpi_probe,
+	.remove		= i2c_hid_core_remove,
+	.shutdown	= i2c_hid_core_shutdown,
+};
+
+module_i2c_driver(i2c_hid_acpi_driver);
+
+MODULE_DESCRIPTION("HID over I2C ACPI driver");
+MODULE_AUTHOR("Benjamin Tissoires <benjamin.tissoires@gmail.com>");
+MODULE_LICENSE("GPL");
diff --git a/drivers/hid/i2c-hid/i2c-hid-core.c b/drivers/hid/i2c-hid/i2c-hid-core.c
index bfe716d7ea44..b64441db29a8 100644
--- a/drivers/hid/i2c-hid/i2c-hid-core.c
+++ b/drivers/hid/i2c-hid/i2c-hid-core.c
@@ -35,11 +35,6 @@
 #include <linux/kernel.h>
 #include <linux/hid.h>
 #include <linux/mutex.h>
-#include <linux/acpi.h>
-#include <linux/of.h>
-#include <linux/regulator/consumer.h>
-
-#include <linux/platform_data/i2c-hid.h>
 
 #include "../hid-ids.h"
 #include "i2c-hid.h"
@@ -156,10 +151,10 @@ struct i2c_hid {
 
 	wait_queue_head_t	wait;		/* For waiting the interrupt */
 
-	struct i2c_hid_platform_data pdata;
-
 	bool			irq_wake_enabled;
 	struct mutex		reset_lock;
+
+	struct i2chid_ops	*ops;
 };
 
 static const struct i2c_hid_quirks {
@@ -884,144 +879,36 @@ static int i2c_hid_fetch_hid_descriptor(struct i2c_hid *ihid)
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
+static int i2c_hid_core_power_up(struct i2c_hid *ihid)
 {
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
 
@@ -1042,44 +929,17 @@ static int i2c_hid_probe(struct i2c_client *client,
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
-
-	ihid->pdata.supplies[0].supply = "vdd";
-	ihid->pdata.supplies[1].supply = "vddl";
+	ihid->ops = ops;
 
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
@@ -1089,11 +949,7 @@ static int i2c_hid_probe(struct i2c_client *client,
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
 
@@ -1102,19 +958,19 @@ static int i2c_hid_probe(struct i2c_client *client,
 	if (ret < 0) {
 		dev_dbg(&client->dev, "nothing at this address: %d\n", ret);
 		ret = -ENXIO;
-		goto err_regulator;
+		goto err_powered;
 	}
 
 	ret = i2c_hid_fetch_hid_descriptor(ihid);
 	if (ret < 0) {
 		dev_err(&client->dev,
 			"Failed to fetch the HID Descriptor\n");
-		goto err_regulator;
+		goto err_powered;
 	}
 
 	ret = i2c_hid_init_irq(client);
 	if (ret < 0)
-		goto err_regulator;
+		goto err_powered;
 
 	hid = hid_allocate_device();
 	if (IS_ERR(hid)) {
@@ -1153,14 +1009,14 @@ static int i2c_hid_probe(struct i2c_client *client,
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
@@ -1173,24 +1029,25 @@ static int i2c_hid_remove(struct i2c_client *client)
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
+static int i2c_hid_core_suspend(struct device *dev)
 {
 	struct i2c_client *client = to_i2c_client(dev);
 	struct i2c_hid *ihid = i2c_get_clientdata(client);
@@ -1217,14 +1074,13 @@ static int i2c_hid_suspend(struct device *dev)
 			hid_warn(hid, "Failed to enable irq wake: %d\n",
 				wake_status);
 	} else {
-		regulator_bulk_disable(ARRAY_SIZE(ihid->pdata.supplies),
-				       ihid->pdata.supplies);
+		i2c_hid_core_power_down(ihid);
 	}
 
 	return 0;
 }
 
-static int i2c_hid_resume(struct device *dev)
+static int i2c_hid_core_resume(struct device *dev)
 {
 	int ret;
 	struct i2c_client *client = to_i2c_client(dev);
@@ -1233,13 +1089,7 @@ static int i2c_hid_resume(struct device *dev)
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
@@ -1276,34 +1126,10 @@ static int i2c_hid_resume(struct device *dev)
 }
 #endif
 
-static const struct dev_pm_ops i2c_hid_pm = {
-	SET_SYSTEM_SLEEP_PM_OPS(i2c_hid_suspend, i2c_hid_resume)
+const struct dev_pm_ops i2c_hid_core_pm = {
+	SET_SYSTEM_SLEEP_PM_OPS(i2c_hid_core_suspend, i2c_hid_core_resume)
 };
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
+EXPORT_SYMBOL_GPL(i2c_hid_core_pm);
 
 MODULE_DESCRIPTION("HID over I2C core driver");
 MODULE_AUTHOR("Benjamin Tissoires <benjamin.tissoires@gmail.com>");
diff --git a/drivers/hid/i2c-hid/i2c-hid-of.c b/drivers/hid/i2c-hid/i2c-hid-of.c
new file mode 100644
index 000000000000..4bf7cea92637
--- /dev/null
+++ b/drivers/hid/i2c-hid/i2c-hid-of.c
@@ -0,0 +1,143 @@
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
+		.pm	= &i2c_hid_core_pm,
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
index a8c19aef5824..05a7827d211a 100644
--- a/drivers/hid/i2c-hid/i2c-hid.h
+++ b/drivers/hid/i2c-hid/i2c-hid.h
@@ -3,6 +3,7 @@
 #ifndef I2C_HID_H
 #define I2C_HID_H
 
+#include <linux/i2c.h>
 
 #ifdef CONFIG_DMI
 struct i2c_hid_desc *i2c_hid_get_dmi_i2c_hid_desc_override(uint8_t *i2c_name);
@@ -17,4 +18,25 @@ static inline char *i2c_hid_get_dmi_hid_report_desc_override(uint8_t *i2c_name,
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
+extern const struct dev_pm_ops i2c_hid_core_pm;
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
2.30.0.284.gd98b1dd5eaa7-goog

