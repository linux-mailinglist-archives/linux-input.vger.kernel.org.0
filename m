Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 28454340A87
	for <lists+linux-input@lfdr.de>; Thu, 18 Mar 2021 17:49:31 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232083AbhCRQs7 (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 18 Mar 2021 12:48:59 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56442 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232153AbhCRQso (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Thu, 18 Mar 2021 12:48:44 -0400
Received: from mail-qt1-x82e.google.com (mail-qt1-x82e.google.com [IPv6:2607:f8b0:4864:20::82e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EEAB3C06175F
        for <linux-input@vger.kernel.org>; Thu, 18 Mar 2021 09:48:43 -0700 (PDT)
Received: by mail-qt1-x82e.google.com with SMTP id l13so4549081qtu.9
        for <linux-input@vger.kernel.org>; Thu, 18 Mar 2021 09:48:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=protocubo.io; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=go937LLnZW5HDcz+iob8chtDcMhGyIqXFyWrzOfCv+M=;
        b=SwFjSxAdQscCN6pjbiw89BjSMDCo1tjMmNEMbycAfG/TJ1cBkNApUvUrAgIme5oxhV
         ilUNXVCyWJAQ4E/LnwHHREjYNgQf594y4n9+ktkhe7zjafQq78YFJwcozFGOslXo06W9
         R+EsZdS3RK3OT9F63fXNikfZDCvaIGxLTMiI8AoC0MTzzFPAiCvk+eFTyR17PRLQiU8Q
         dIKvEn9C8DIpjyX3wIHQn5i4yO7JFVEj8WpgqGkfvIWJO1oWM7r+8oL5YGP3GYO3CN7n
         w7LK60pcfCK0SXEWe2qwpm4X9QD8997tKDbAvmcU+10wTaHhdLc3dS+0wJsD9O4L943Z
         w7Xw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=go937LLnZW5HDcz+iob8chtDcMhGyIqXFyWrzOfCv+M=;
        b=T7stZr891FdLtHukZ7ZPHPBin7bon8RTncBh90gVhAN9ktDDNnwN05919UZUi3ESfH
         xFpHKpwBBux0q8c8zr+yzWofpoLSOj/yF9bpQAFpJVYmfjLPtTH9EHy4FbXDbpQBk4K6
         oWK0OctxVQUEswFicCLYb/hsNTYQyd3puKnQg5NbYDYsGC39UUK4y6U6Ji+w3wpVIbDw
         UuNpKGF32iASFpGIq3j0h+c7/XeKcDZPOAiDn1sS+/eW0hO4Wih4gR5YLU/vNK0id8bx
         lS7Rrn/ndteXQil9kfPkrqGX3A7dtMJ5Pu425wppiZI2rKbAZVR69VWzpmwEcKR+CfRQ
         aK3g==
X-Gm-Message-State: AOAM532BEF45np57NPYEvkg+HlBrGGVg/Os4kVDsEnUsSZ0wNDT8XpNm
        nvPm48xPEO0g4qsorlZeaKfLxA==
X-Google-Smtp-Source: ABdhPJyai7k/5jC4WFCtE5NFb5Bzpu0bldblbflvkWy3O0SOyfppRYCPuFXJEOOxGZLaG0CyOiHu4w==
X-Received: by 2002:ac8:1302:: with SMTP id e2mr4666962qtj.151.1616086122996;
        Thu, 18 Mar 2021 09:48:42 -0700 (PDT)
Received: from calvin.localdomain ([2804:14d:5c5a:802e:bdc9:ded9:cc08:a4e9])
        by smtp.gmail.com with ESMTPSA id 79sm2236378qki.37.2021.03.18.09.48.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 18 Mar 2021 09:48:40 -0700 (PDT)
From:   Jonas Malaco <jonas@protocubo.io>
To:     linux-hwmon@vger.kernel.org
Cc:     Guenter Roeck <linux@roeck-us.net>,
        Jean Delvare <jdelvare@suse.com>, linux-input@vger.kernel.org,
        linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
        Jonas Malaco <jonas@protocubo.io>
Subject: [PATCH] hwmon: add driver for NZXT Kraken X42/X52/X62/X72
Date:   Thu, 18 Mar 2021 13:48:24 -0300
Message-Id: <20210318164824.21374-1-jonas@protocubo.io>
X-Mailer: git-send-email 2.31.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

These are "all-in-one" CPU liquid coolers that can be monitored and
controlled through a proprietary USB HID protocol.

While the models have differently sized radiators and come with varying
numbers of fans, they are all indistinguishable at the software level.

The driver exposes fan/pump speeds and coolant temperature through the
standard hwmon sysfs interface.

Fan and pump control, while supported by the devices, are not currently
exposed.  The firmware accepts up to 61 trip points per channel
(fan/pump), but the same set of trip temperatures has to be maintained
for both; with pwmX_auto_point_Y_temp attributes, users would need to
maintain this invariant themselves.

Instead, fan and pump control, as well as LED control (which the device
also supports for 9 addressable RGB LEDs on the CPU water block) are
left for existing and already mature user-space tools, which can still
be used alongside the driver, thanks to hidraw.  A link to one, which I
also maintain, is provided in the documentation.

The implementation is based on USB traffic analysis.  It has been
runtime tested on x86_64, both as a built-in driver and as a module.

Signed-off-by: Jonas Malaco <jonas@protocubo.io>
---

I was not sure whether to exhaustively check type, attr and channel in
_is_visible/_read/_read_string.  Would it be preferred if those
functions assumed that they would never be called for unsupported
combinations, since that would be a programming error?

In practice, should kraken2_is_visible be simplified into

	static umode_t kraken2_is_visible(...)
	{
		return 0444;
	}

and should _read/_read_string go through similar (but not as effective)
simplifications?

On another note, the copyright dates back to 2019 because this driver
was left to mature (and then was mostly forgotten about) in an
out-of-tree repository.[1]

[1] https://github.com/liquidctl/liquidtux

 Documentation/hwmon/index.rst        |   1 +
 Documentation/hwmon/nzxt-kraken2.rst |  42 ++++
 MAINTAINERS                          |   7 +
 drivers/hwmon/Kconfig                |  10 +
 drivers/hwmon/Makefile               |   1 +
 drivers/hwmon/nzxt-kraken2.c         | 279 +++++++++++++++++++++++++++
 6 files changed, 340 insertions(+)
 create mode 100644 Documentation/hwmon/nzxt-kraken2.rst
 create mode 100644 drivers/hwmon/nzxt-kraken2.c

diff --git a/Documentation/hwmon/index.rst b/Documentation/hwmon/index.rst
index d4b422edbe3a..48bfa7887dd4 100644
--- a/Documentation/hwmon/index.rst
+++ b/Documentation/hwmon/index.rst
@@ -143,6 +143,7 @@ Hardware Monitoring Kernel Drivers
    npcm750-pwm-fan
    nsa320
    ntc_thermistor
+   nzxt-kraken2
    occ
    pc87360
    pc87427
diff --git a/Documentation/hwmon/nzxt-kraken2.rst b/Documentation/hwmon/nzxt-kraken2.rst
new file mode 100644
index 000000000000..94025de65a81
--- /dev/null
+++ b/Documentation/hwmon/nzxt-kraken2.rst
@@ -0,0 +1,42 @@
+.. SPDX-License-Identifier: GPL-2.0-or-later
+
+Kernel driver nzxt-kraken2
+==========================
+
+Supported devices:
+
+* NZXT Kraken X42
+* NZXT Kraken X52
+* NZXT Kraken X62
+* NZXT Kraken X72
+
+Author: Jonas Malaco
+
+Description
+-----------
+
+This driver enables hardware monitoring support for NZXT Kraken X42/X52/X62/X72
+all-in-one CPU liquid coolers.  Three sensors are available: fan speed, pump
+speed and coolant temperature.
+
+Fan and pump control, while supported by the firmware, are not currently
+exposed.  The addressable RGB LEDs, present in the integrated CPU water block
+and pump head, are not supported either.  But both features can be found in
+existing user-space tools (e.g. `liquidctl`_).
+
+.. _liquidctl: https://github.com/liquidctl/liquidctl
+
+Usage Notes
+-----------
+
+As these are USB HIDs, the driver can be loaded automatically by the kernel and
+supports hot swapping.
+
+Sysfs entries
+-------------
+
+=======================	========================================================
+fan1_input		Fan speed (in rpm)
+fan2_input		Pump speed (in rpm)
+temp1_input		Coolant temperature (in millidegrees Celsius)
+=======================	========================================================
diff --git a/MAINTAINERS b/MAINTAINERS
index 0635b30e467c..b8f9fc5eaf08 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -12911,6 +12911,13 @@ L:	linux-nfc@lists.01.org (moderated for non-subscribers)
 S:	Supported
 F:	drivers/nfc/nxp-nci
 
+NZXT-KRAKEN2 HARDWARE MONITORING DRIVER
+M:	Jonas Malaco <jonas@protocubo.io>
+L:	linux-hwmon@vger.kernel.org
+S:	Maintained
+F:	Documentation/hwmon/nzxt-kraken2.rst
+F:	drivers/hwmon/nzxt-kraken2.c
+
 OBJAGG
 M:	Jiri Pirko <jiri@nvidia.com>
 L:	netdev@vger.kernel.org
diff --git a/drivers/hwmon/Kconfig b/drivers/hwmon/Kconfig
index 54f04e61fb83..0ddc974b102e 100644
--- a/drivers/hwmon/Kconfig
+++ b/drivers/hwmon/Kconfig
@@ -1492,6 +1492,16 @@ config SENSORS_NSA320
 	  This driver can also be built as a module. If so, the module
 	  will be called nsa320-hwmon.
 
+config SENSORS_NZXT_KRAKEN2
+	tristate "NZXT Kraken X42/X51/X62/X72 liquid coolers"
+	depends on USB_HID
+	help
+	  If you say yes here you get support for hardware monitoring for the
+	  NZXT Kraken X42/X52/X62/X72 all-in-one CPU liquid coolers.
+
+	  This driver can also be built as a module. If so, the module
+	  will be called nzxt-kraken2.
+
 source "drivers/hwmon/occ/Kconfig"
 
 config SENSORS_PCF8591
diff --git a/drivers/hwmon/Makefile b/drivers/hwmon/Makefile
index fe38e8a5c979..59e78bc212cf 100644
--- a/drivers/hwmon/Makefile
+++ b/drivers/hwmon/Makefile
@@ -155,6 +155,7 @@ obj-$(CONFIG_SENSORS_NCT7904)	+= nct7904.o
 obj-$(CONFIG_SENSORS_NPCM7XX)	+= npcm750-pwm-fan.o
 obj-$(CONFIG_SENSORS_NSA320)	+= nsa320-hwmon.o
 obj-$(CONFIG_SENSORS_NTC_THERMISTOR)	+= ntc_thermistor.o
+obj-$(CONFIG_SENSORS_NZXT_KRAKEN2) += nzxt-kraken2.o
 obj-$(CONFIG_SENSORS_PC87360)	+= pc87360.o
 obj-$(CONFIG_SENSORS_PC87427)	+= pc87427.o
 obj-$(CONFIG_SENSORS_PCF8591)	+= pcf8591.o
diff --git a/drivers/hwmon/nzxt-kraken2.c b/drivers/hwmon/nzxt-kraken2.c
new file mode 100644
index 000000000000..1426310d6965
--- /dev/null
+++ b/drivers/hwmon/nzxt-kraken2.c
@@ -0,0 +1,279 @@
+// SPDX-License-Identifier: GPL-2.0+
+/*
+ * nzxt-kraken2.c - hwmon driver for NZXT Kraken X42/X52/X62/X72 coolers
+ *
+ * Copyright 2019  Jonas Malaco <jonas@protocubo.io>
+ */
+
+#include <asm/unaligned.h>
+#include <linux/hid.h>
+#include <linux/hwmon.h>
+#include <linux/module.h>
+#include <linux/spinlock.h>
+
+#define STATUS_REPORT_ID	0x04
+#define STATUS_USEFUL_SIZE	8
+
+static const char *const kraken2_temp_label[] = {
+	"Coolant",
+};
+
+static const char *const kraken2_fan_label[] = {
+	"Fan",
+	"Pump",
+};
+
+struct kraken2_priv_data {
+	struct hid_device *hid_dev;
+	struct device *hwmon_dev;
+
+	spinlock_t lock; /* protects the last received status */
+	u8 status[STATUS_USEFUL_SIZE];
+};
+
+static umode_t kraken2_is_visible(const void *data,
+				  enum hwmon_sensor_types type,
+				  u32 attr, int channel)
+{
+	switch (type) {
+	case hwmon_temp:
+		switch (attr) {
+		case hwmon_temp_input:
+		case hwmon_temp_label:
+			if (channel == 0)
+				return 0444;
+			return 0;
+		}
+		break;
+	case hwmon_fan:
+		switch (attr) {
+		case hwmon_fan_input:
+		case hwmon_fan_label:
+			if (channel >= 0 && channel < 2)
+				return 0444;
+			return 0;
+		}
+		break;
+	default:
+		break;
+	}
+	return 0;
+}
+
+static int kraken2_read(struct device *dev, enum hwmon_sensor_types type,
+			u32 attr, int channel, long *val)
+{
+	struct kraken2_priv_data *priv = dev_get_drvdata(dev);
+	unsigned long flags;
+
+	switch (type) {
+	case hwmon_temp:
+		switch (attr) {
+		case hwmon_temp_input:
+			if (channel != 0)
+				return -EOPNOTSUPP;
+			/*
+			 * The fractional byte has been observed to be in the
+			 * interval [1,9], but some of these steps are also
+			 * consistently skipped for certain integer parts.
+			 *
+			 * For the lack of a better idea, assume that the
+			 * resolution is 0.1°C, and that the missing steps are
+			 * artifacts of how the firmware processes the raw
+			 * sensor data.
+			 */
+			spin_lock_irqsave(&priv->lock, flags);
+			*val = priv->status[1] * 1000 + priv->status[2] * 100;
+			spin_unlock_irqrestore(&priv->lock, flags);
+			break;
+		default:
+			return -EOPNOTSUPP;
+		}
+		break;
+	case hwmon_fan:
+		switch (attr) {
+		case hwmon_fan_input:
+			if (channel < 0 || channel >= 2)
+				return -EOPNOTSUPP;
+			spin_lock_irqsave(&priv->lock, flags);
+			*val = get_unaligned_be16(priv->status + 3 + channel * 2);
+			spin_unlock_irqrestore(&priv->lock, flags);
+			break;
+		default:
+			return -EOPNOTSUPP;
+		}
+		break;
+	default:
+		return -EOPNOTSUPP;
+	}
+
+	return 0;
+}
+
+static int kraken2_read_string(struct device *dev, enum hwmon_sensor_types type,
+			       u32 attr, int channel, const char **str)
+{
+	switch (type) {
+	case hwmon_temp:
+		switch (attr) {
+		case hwmon_temp_label:
+			if (channel != 0)
+				return -EOPNOTSUPP;
+			*str = kraken2_temp_label[channel];
+			break;
+		default:
+			return -EOPNOTSUPP;
+		}
+		break;
+	case hwmon_fan:
+		switch (attr) {
+		case hwmon_fan_label:
+			if (channel < 0 || channel >= 2)
+				return -EOPNOTSUPP;
+			*str = kraken2_fan_label[channel];
+			break;
+		default:
+			return -EOPNOTSUPP;
+		}
+		break;
+	default:
+		return -EOPNOTSUPP;
+	}
+	return 0;
+}
+
+static const struct hwmon_ops kraken2_hwmon_ops = {
+	.is_visible = kraken2_is_visible,
+	.read = kraken2_read,
+	.read_string = kraken2_read_string,
+};
+
+static const struct hwmon_channel_info *kraken2_info[] = {
+	HWMON_CHANNEL_INFO(temp,
+			   HWMON_T_INPUT | HWMON_T_LABEL),
+	HWMON_CHANNEL_INFO(fan,
+			   HWMON_F_INPUT | HWMON_F_LABEL,
+			   HWMON_F_INPUT | HWMON_F_LABEL),
+	NULL
+};
+
+static const struct hwmon_chip_info kraken2_chip_info = {
+	.ops = &kraken2_hwmon_ops,
+	.info = kraken2_info,
+};
+
+static int kraken2_raw_event(struct hid_device *hdev,
+			     struct hid_report *report, u8 *data, int size)
+{
+	struct kraken2_priv_data *priv;
+	unsigned long flags;
+
+	if (size < STATUS_USEFUL_SIZE || report->id != STATUS_REPORT_ID)
+		return 0;
+
+	priv = hid_get_drvdata(hdev);
+
+	spin_lock_irqsave(&priv->lock, flags);
+	memcpy(priv->status, data, STATUS_USEFUL_SIZE);
+	spin_unlock_irqrestore(&priv->lock, flags);
+
+	return 0;
+}
+
+static int kraken2_probe(struct hid_device *hdev,
+			 const struct hid_device_id *id)
+{
+	struct kraken2_priv_data *priv;
+	int ret;
+
+	priv = devm_kzalloc(&hdev->dev, sizeof(*priv), GFP_KERNEL);
+	if (!priv)
+		return -ENOMEM;
+
+	priv->hid_dev = hdev;
+	spin_lock_init(&priv->lock);
+	hid_set_drvdata(hdev, priv);
+
+	ret = hid_parse(hdev);
+	if (ret) {
+		hid_err(hdev, "hid parse failed with %d\n", ret);
+		return ret;
+	}
+
+	/*
+	 * Enable hidraw so existing user-space tools can continue to work.
+	 */
+	ret = hid_hw_start(hdev, HID_CONNECT_HIDRAW);
+	if (ret) {
+		hid_err(hdev, "hid hw start failed with %d\n", ret);
+		goto fail_and_stop;
+	}
+
+	ret = hid_hw_open(hdev);
+	if (ret) {
+		hid_err(hdev, "hid hw open failed with %d\n", ret);
+		goto fail_and_close;
+	}
+
+	priv->hwmon_dev = hwmon_device_register_with_info(&hdev->dev, "kraken2",
+							  priv, &kraken2_chip_info,
+							  NULL);
+	if (IS_ERR(priv->hwmon_dev)) {
+		ret = PTR_ERR(priv->hwmon_dev);
+		hid_err(hdev, "hwmon registration failed with %d\n", ret);
+		goto fail_and_close;
+	}
+
+	return 0;
+
+fail_and_close:
+	hid_hw_close(hdev);
+fail_and_stop:
+	hid_hw_stop(hdev);
+	return ret;
+}
+
+static void kraken2_remove(struct hid_device *hdev)
+{
+	struct kraken2_priv_data *priv = hid_get_drvdata(hdev);
+
+	hwmon_device_unregister(priv->hwmon_dev);
+
+	hid_hw_close(hdev);
+	hid_hw_stop(hdev);
+}
+
+static const struct hid_device_id kraken2_table[] = {
+	{ HID_USB_DEVICE(0x1e71, 0x170e) }, /* NZXT Kraken X42/X52/X62/X72 */
+	{ }
+};
+
+MODULE_DEVICE_TABLE(hid, kraken2_table);
+
+static struct hid_driver kraken2_driver = {
+	.name = "nzxt-kraken2",
+	.id_table = kraken2_table,
+	.probe = kraken2_probe,
+	.remove = kraken2_remove,
+	.raw_event = kraken2_raw_event,
+};
+
+static int __init kraken2_init(void)
+{
+	return hid_register_driver(&kraken2_driver);
+}
+
+static void __exit kraken2_exit(void)
+{
+	hid_unregister_driver(&kraken2_driver);
+}
+
+/*
+ * When compiled into the kernel, initialize after the hid bus.
+ */
+late_initcall(kraken2_init);
+module_exit(kraken2_exit);
+
+MODULE_LICENSE("GPL");
+MODULE_AUTHOR("Jonas Malaco <jonas@protocubo.io>");
+MODULE_DESCRIPTION("Hwmon driver for NZXT Kraken X42/X52/X62/X72 coolers");

base-commit: d8a08585259268e7b5305d04422a59d713719ccb
-- 
2.31.0

