Return-Path: <linux-input+bounces-13002-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id A1022AE498D
	for <lists+linux-input@lfdr.de>; Mon, 23 Jun 2025 18:03:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 6E8B27AAC9C
	for <lists+linux-input@lfdr.de>; Mon, 23 Jun 2025 16:01:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B85B22F24;
	Mon, 23 Jun 2025 16:02:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="TowIWCgv"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-pf1-f179.google.com (mail-pf1-f179.google.com [209.85.210.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0981D46BF;
	Mon, 23 Jun 2025 16:02:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750694540; cv=none; b=ubFk/SFyr+wqSoGeVFW1MHalrXZtLfT124QKA6fDtET6p1gb7yhw1Wo9QsEWmT5nNUlsVOj2ehlZhjTDGuqvsqCFylc+I2K/nArd+A0ioiqPjzhRtxkdOxiM6n2o1YOcxi131/1JPRTXAeNWqvi/8K6TDbWTaYCEj320VvJSKLs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750694540; c=relaxed/simple;
	bh=PfF2m70dV1KAG+p6ivtxeRb7jAqv0EoAWuRTRDMPuOY=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=hdkzUtrIYuJR9Jkk5Ch6uMJOX11FAsEF8NI9PMzafnH0ssS13Y0fFjBaYobxjYnoruseIk+ilWPFufIh7a8EzkzrsCN370KOOW6iwYNNzZjKB4kTZm+E4uDxl8iKxOze1xEfY2ccG50Y/6XCVz5t2WZj1rH4vwaX8SUGA3jAqVg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=TowIWCgv; arc=none smtp.client-ip=209.85.210.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f179.google.com with SMTP id d2e1a72fcca58-7406c6dd2b1so3408910b3a.0;
        Mon, 23 Jun 2025 09:02:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750694536; x=1751299336; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Ub7A566iAel36VJ2cHq7qft91G9xYawgSu9tRpOG63I=;
        b=TowIWCgvyCUtH9YZ/pI+X8EV/0tRG/3KT+hOsHQxRuluXXA81TG/5hftjJo7h6MEfM
         BkJaxZUMv7eOSzJtdDJgiQPiiKc7N8sBpIDPiDyKVB8nXZK1HmzT8VBilHVAit5ntLhK
         gi9QMwmez0MYzVv9D3uddzwiBBqa6Qo8s35LDvGNN3WGwFxrmbevgmdLLI6CwNggSQJG
         pw1B3UzVIUi2QOPYPfeqaVJSjRNKTdAsXQtqgHEOtJ4+6wBA6UCqMlNkb6pk3ChVp5FV
         A6pe4EL9TiMJ9Xw5/JHCBW0gfd+7Hrzj4qVl/+xf06Mr829kh1tEo7WJeF/KhMqQCpB/
         /sug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750694536; x=1751299336;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Ub7A566iAel36VJ2cHq7qft91G9xYawgSu9tRpOG63I=;
        b=iwIYpR31Lq1SVeVqwJhKGyXX8uzeiFGC1MA/aWcpuFmi0LxXMdoUthfRQYqPVTfq8c
         6yqz6y7PBgDeJvwisjMnNveuYFP6mAYlz92FSlHIQ+AVHjQ/gPNKhgPVu6SNVTV5r1bo
         L2cFoSgkIoryMa7esMw6ksd6LGVaeA1K6JPz3F6cg6YHwjc5p/cLmWE4LGxzXYjHHJvk
         Kg8Ph80o2hho9HwoEGlN/JNHFxIBjW++dO40Mfl+GKHJsE37ivS6L40qbej9gyC2io+7
         t0MUZ+k60Cl7qiUyagOXTxLYNRaf8SlMjL1aW1/V10pDk1cPXsQPG7f6aZhk1fzGYJhg
         Gz4g==
X-Forwarded-Encrypted: i=1; AJvYcCX0uYiXwP9PGqtw9pYTc1M6QlSAGXcuHSIo/0LuA2ymyvFFhFrv8O2j6TFWVJPETN9F7f39DfnJYjrYqaA=@vger.kernel.org
X-Gm-Message-State: AOJu0YzLypZaRf1Wn4T5fK0qchoYg2kune6K7PmgLMIuyXuFG4GnJpdd
	GHP7BoDVHYNZYCUFXWLdIP7ECIP2VMp0Zcp8SnrtU0EO3EsME48oxS3yLjPSByQN
X-Gm-Gg: ASbGncuLChKTTVjRyP/opXIoy1ZJvD9rluBLYeMqjS8PIRukjgF0FP5KTfmAN49AhNV
	dlHp4MYAa731GSu3+XG75upcrxKJOlxwXvpyjGUU9ztd8yF4EUT0HtLN6c2nTTtioRXu7RaEz22
	zdgLqa6lHqASgbt6OxBgGogsUeQlbUTMEM6TfLI6LGe7K+ED5Awn9dDwTAllmlpNokmUJaR0uBc
	+NFItNYnS0hIXeULGCjDDUx5yJDgddM9xNzLSg9n2c695PZgj007W/ptK9p9ANEVt6VS1h54dGZ
	02TBLPk451s8VPGvGCnOYG7S7DqOYBKZa5/VVlpwsxqIDrSVo+FWFsHOunKRwZsynHRIc8hBwxf
	bpL9u59pJQaNFgg6jJ6u6
X-Google-Smtp-Source: AGHT+IGgE53qcBeWG31PS3sx09h9YYv+BBQv6xY/r97gXHzt6BnsnAar7deThZhOL5nju1oNKrKwUw==
X-Received: by 2002:a05:6a20:1591:b0:218:17a2:4421 with SMTP id adf61e73a8af0-2206a12e7bbmr68554637.10.1750694535916;
        Mon, 23 Jun 2025 09:02:15 -0700 (PDT)
Received: from danascape.tail34aafc.ts.net ([2402:e280:218d:2e5:7949:b195:766f:55f8])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b31f119e820sm8187711a12.23.2025.06.23.09.02.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Jun 2025 09:02:15 -0700 (PDT)
From: Saalim Quadri <danascape@gmail.com>
To: jikos@kernel.org,
	bentiss@kernel.org
Cc: linux-input@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Saalim Quadri <danascape@gmail.com>
Subject: [PATCH v2] HID: Xinmeng: Add driver for Xinmeng M71 Keyboard
Date: Mon, 23 Jun 2025 21:32:10 +0530
Message-Id: <20250623160210.498570-1-danascape@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

In this driver, the battery is probed, and it checks the capacity
and charging status of the battery

Signed-off-by: Saalim Quadri <danascape@gmail.com>
---
v1 -> v2: Update Kconfig paragraph :/

 drivers/hid/Kconfig       |  12 +++
 drivers/hid/Makefile      |   1 +
 drivers/hid/hid-ids.h     |   3 +
 drivers/hid/hid-xinmeng.c | 168 ++++++++++++++++++++++++++++++++++++++
 4 files changed, 184 insertions(+)
 create mode 100644 drivers/hid/hid-xinmeng.c

diff --git a/drivers/hid/Kconfig b/drivers/hid/Kconfig
index 43859fc75747..1cc61ca63682 100644
--- a/drivers/hid/Kconfig
+++ b/drivers/hid/Kconfig
@@ -536,6 +536,18 @@ config HID_XIAOMI
 	  Adds support for side buttons of Xiaomi Mi Dual Mode Wireless
 	  Mouse Silent Edition.
 
+config HID_XINMENG
+	tristate "Xinmeng Keyboards"
+	depends on USB_HID
+	help
+		Support for Xinmeng Keyboard.
+
+		Say Y here if you have a Xinmeng M71 Keyboard
+		and want to be able to read its battery capacity.
+
+		To compile this driver as a module, choose M here: the
+		module will be called hid-xinmeng.
+
 config HID_GYRATION
 	tristate "Gyration remote control"
 	help
diff --git a/drivers/hid/Makefile b/drivers/hid/Makefile
index 10ae5dedbd84..e5c9d1276138 100644
--- a/drivers/hid/Makefile
+++ b/drivers/hid/Makefile
@@ -145,6 +145,7 @@ obj-$(CONFIG_HID_UDRAW_PS3)	+= hid-udraw-ps3.o
 obj-$(CONFIG_HID_UNIVERSAL_PIDFF)	+= hid-universal-pidff.o
 obj-$(CONFIG_HID_LED)		+= hid-led.o
 obj-$(CONFIG_HID_XIAOMI)	+= hid-xiaomi.o
+obj-$(CONFIG_HID_XINMENG)	+= hid-xinmeng.o
 obj-$(CONFIG_HID_XINMO)		+= hid-xinmo.o
 obj-$(CONFIG_HID_ZEROPLUS)	+= hid-zpff.o
 obj-$(CONFIG_HID_ZYDACRON)	+= hid-zydacron.o
diff --git a/drivers/hid/hid-ids.h b/drivers/hid/hid-ids.h
index e3fb4e2fe911..f649549bd58c 100644
--- a/drivers/hid/hid-ids.h
+++ b/drivers/hid/hid-ids.h
@@ -1471,6 +1471,9 @@
 #define USB_DEVICE_ID_XIN_MO_DUAL_ARCADE	0x05e1
 #define USB_DEVICE_ID_THT_2P_ARCADE		0x75e1
 
+#define USB_VENDOR_ID_XINMENG   0x3554
+#define USB_DEVICE_ID_XINMENG_M71_RECEIVER  0xfa09
+
 #define USB_VENDOR_ID_XIROKU		0x1477
 #define USB_DEVICE_ID_XIROKU_SPX	0x1006
 #define USB_DEVICE_ID_XIROKU_MPX	0x1007
diff --git a/drivers/hid/hid-xinmeng.c b/drivers/hid/hid-xinmeng.c
new file mode 100644
index 000000000000..53f0a96e7f3d
--- /dev/null
+++ b/drivers/hid/hid-xinmeng.c
@@ -0,0 +1,168 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+/*
+ *  HID driver for Xinmeng M71 Keyboard.
+ *
+ *  Copyright (c) 2025 Saalim Quadri <saalimquadri2@gmail.com>
+ */
+
+#include <linux/device.h>
+#include <linux/hid.h>
+#include <linux/module.h>
+#include <linux/usb.h>
+
+#include "hid-ids.h"
+
+#define	BATTERY_REPORT_ID	(0x13)
+
+struct xinmeng_drvdata {
+	struct hid_device *hdev;
+	bool online;
+
+	struct power_supply *battery;
+	struct power_supply_desc battery_desc;
+	u8 battery_capacity;
+	bool battery_charging;
+};
+
+static enum power_supply_property xinmeng_battery_props[] = {
+	POWER_SUPPLY_PROP_STATUS,
+	POWER_SUPPLY_PROP_PRESENT,
+	POWER_SUPPLY_PROP_CAPACITY,
+	POWER_SUPPLY_PROP_MODEL_NAME,
+	POWER_SUPPLY_PROP_ONLINE
+};
+
+static int xinmeng_battery_get_property(struct power_supply *psy,
+				       enum power_supply_property psp,
+				       union power_supply_propval *val)
+{
+	struct xinmeng_drvdata *drv_data = power_supply_get_drvdata(psy);
+	int ret = 0;
+
+	switch (psp) {
+	case POWER_SUPPLY_PROP_PRESENT:
+		val->intval = 1;
+		break;
+	case POWER_SUPPLY_PROP_ONLINE:
+		val->intval = drv_data->online;
+		break;
+	case POWER_SUPPLY_PROP_STATUS:
+		if (drv_data->online)
+			val->intval = drv_data->battery_charging ?
+					POWER_SUPPLY_STATUS_CHARGING :
+					POWER_SUPPLY_STATUS_DISCHARGING;
+		else
+			val->intval = POWER_SUPPLY_STATUS_UNKNOWN;
+		break;
+	case POWER_SUPPLY_PROP_CAPACITY:
+		val->intval = drv_data->battery_capacity;
+		break;
+	case POWER_SUPPLY_PROP_MODEL_NAME:
+		val->strval = drv_data->hdev->name;
+		break;
+	default:
+		ret = -EINVAL;
+		break;
+	}
+	return ret;
+}
+
+static int xinmeng_battery_probe(struct hid_device *hdev)
+{
+	struct xinmeng_drvdata *drv_data = hid_get_drvdata(hdev);
+	struct power_supply_config pscfg = { .drv_data = drv_data };
+	int ret = 0;
+
+	drv_data->online = false;
+	drv_data->battery_capacity = 0;
+
+	drv_data->battery_desc.name = "xinmeng-m71-battery";
+	drv_data->battery_desc.type = POWER_SUPPLY_TYPE_BATTERY;
+	drv_data->battery_desc.properties = xinmeng_battery_props;
+	drv_data->battery_desc.num_properties = ARRAY_SIZE(xinmeng_battery_props);
+	drv_data->battery_desc.get_property = xinmeng_battery_get_property;
+
+	drv_data->battery = devm_power_supply_register(&hdev->dev,
+						       &drv_data->battery_desc, &pscfg);
+
+	if (IS_ERR(drv_data->battery)) {
+		ret = PTR_ERR(drv_data->battery);
+		drv_data->battery = NULL;
+		hid_err(hdev, "Unable to register battery device\n");
+		return ret;
+	}
+
+	power_supply_powers(drv_data->battery, &hdev->dev);
+
+	return ret;
+}
+
+static int xinmeng_probe(struct hid_device *hdev, const struct hid_device_id *id)
+{
+	int ret;
+	struct xinmeng_drvdata *drv_data;
+	struct usb_interface *usbif;
+
+	if (!hid_is_usb(hdev))
+		return -EINVAL;
+
+	usbif = to_usb_interface(hdev->dev.parent);
+
+	drv_data = devm_kzalloc(&hdev->dev, sizeof(*drv_data), GFP_KERNEL);
+	if (!drv_data)
+		return -ENOMEM;
+
+	hid_set_drvdata(hdev, drv_data);
+	drv_data->hdev = hdev;
+
+	ret = hid_parse(hdev);
+	if (ret)
+		return ret;
+
+	ret = hid_hw_start(hdev, HID_CONNECT_DEFAULT);
+	if (ret)
+		return ret;
+
+	if (usbif->cur_altsetting->desc.bInterfaceNumber == 1) {
+		if (xinmeng_battery_probe(hdev) < 0)
+			hid_err(hdev, "Xinmeng hid battery_probe failed: %d\n", ret);
+	}
+
+	return 0;
+}
+
+static int xinmeng_raw_event(struct hid_device *hdev,
+	struct hid_report *report, u8 *data, int size)
+{
+
+	struct xinmeng_drvdata *drv_data = hid_get_drvdata(hdev);
+
+	if (drv_data->battery && data[0] == BATTERY_REPORT_ID) {
+		u8 charging_status = data[7];
+		bool is_charging = (charging_status == 0x11 || charging_status == 0x10);
+
+		drv_data->battery_capacity = data[6];
+		drv_data->battery_charging = is_charging;
+		drv_data->online = true;
+	}
+
+	return 0;
+}
+
+static const struct hid_device_id xinmeng_devices[] = {
+	{ HID_USB_DEVICE(USB_VENDOR_ID_XINMENG, USB_DEVICE_ID_XINMENG_M71_RECEIVER) },
+	{ }
+};
+MODULE_DEVICE_TABLE(hid, xinmeng_devices);
+
+static struct hid_driver xinmeng_driver = {
+	.name = "xinmeng",
+	.id_table = xinmeng_devices,
+	.probe = xinmeng_probe,
+	.raw_event = xinmeng_raw_event
+};
+module_hid_driver(xinmeng_driver);
+
+MODULE_LICENSE("GPL");
+MODULE_DESCRIPTION("HID driver for Xinmeng keyboards");
+MODULE_AUTHOR("Saalim Quadri <saalimquadri2@gmail.com>");
-- 
2.34.1


