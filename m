Return-Path: <linux-input+bounces-13117-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 5BC79AEACD4
	for <lists+linux-input@lfdr.de>; Fri, 27 Jun 2025 04:33:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 19E7E7A3F76
	for <lists+linux-input@lfdr.de>; Fri, 27 Jun 2025 02:32:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 02EE822EE5;
	Fri, 27 Jun 2025 02:33:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Az5GSdU4"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-pf1-f182.google.com (mail-pf1-f182.google.com [209.85.210.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 595AE3C01;
	Fri, 27 Jun 2025 02:33:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750991601; cv=none; b=UBEJAm5hy1g7cbbfLxmVi0nt9Kz+t0P1cqzxCv+3Ri5JP9s15OdGoL6ae11TJAaFM87Lx9lYRa8FU0uFaZPVxds6suXvXZNQcaw8GTD7tq5XKqrDvjXk9y1wBOZk0zq+X5a1SJFz66A3TicKTd3Rhz0H+UPC2h/Q6xCVq0d1p6I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750991601; c=relaxed/simple;
	bh=JeDvWOF1XyNZlVbSRkKg62AXuM9cfneLs6TPaSfZpr4=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=c32HbuvFh6ME9wyI5DrPz3W4nrQMMdQbUjBELuVZSlXNRv6hojsT17JDy2XPUIjP6H/L+ubSlRK6H4F9se0WNC8iNFelVNyXEFFCPCsmiPKzkamvFmiAb11WvAmuf1ZUEbEm1/OdEuk+ao8SyLTeOrlqh0eK8asIbvJSb92sSNI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Az5GSdU4; arc=none smtp.client-ip=209.85.210.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f182.google.com with SMTP id d2e1a72fcca58-7399a2dc13fso2132753b3a.2;
        Thu, 26 Jun 2025 19:33:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750991597; x=1751596397; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=mzGMUD5FoQ+Qma22SIVK819nPdr7pYinoircpLfGQJY=;
        b=Az5GSdU4jXt9EBpiLFgVDCPuqDp/gAnc7qFKU7GChE8gnxhRgRB7fi2xsBxhyF4fcU
         cVOH0F5EcI74Zf2sU85I7Z/HuAuEVqJvp1mIp66RRpfJ6i2gIMIMiZCEGuO8CPXWp+y/
         KXjdxEJGmKfhbHPvC9LyMmE29bDU9U+gbn3kq1HGORrKVu0L6YIcSh3CR8ATfl4w7ITu
         XgITJXMSPr8aWXLou9qPK+tdePdIhw3xfKV7+5kxay6hjKtdFGtWsiRd1dTWWGvbZvdp
         ipSOW2XUWji9AB4OFPBXLdIjEDZRXFJXPGdXTVQW6RLkLohyH4tPzt9QJwHi+yObklMh
         ZWSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750991597; x=1751596397;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=mzGMUD5FoQ+Qma22SIVK819nPdr7pYinoircpLfGQJY=;
        b=s+4ADPeZMsheQOeULonRgalWUVO7Y5jzTsojbJqW5HG8PNBdnR/ZBB70yZL4/uemDq
         n7YoW4lUQJCKeiM9qLZlXkNjuypc3slAMG7xPK+wvlcZUhEGKrZZp95EGJzcrQoXNhj7
         N9OODwRxLxrdOFA74dLrpU5dM8b9wMM9sgyxRrpFY/n87DWDdHGvwWPZnZ68SXFL59ef
         lwAWfpPXYaYFax9X9h0QPQh8I071rDcpxJQARxuU9mhZm0gkSCqrZ1RL8s8vW7dQhL6y
         SpwZ7+Fvv7BouQMOjT7UVarEXxsUJZSFiG0SQlWettGDsHiKoyCnAQ72jO2374L2JwcO
         9l4g==
X-Forwarded-Encrypted: i=1; AJvYcCU5ONnMMp/dEecCyNqtUaeMZPFTJExTfcXcqsquaKJcK22YLAkYaCj3tQfFRCbEaFKhgbucWnSWK8xLVaY=@vger.kernel.org
X-Gm-Message-State: AOJu0YwAud+XN9/IP2Po3oSEZsf6pQdf85hKTp1CNd3LpiZdtKyezYWy
	kmGzvC2CQvdsMnqK9pIUH5GfxYGLhyRCFl1juzzaURs4rZ+/8eGSVnR9
X-Gm-Gg: ASbGncs9R9wdXyHTp2xd58FpqJ9BcI+M/nJwJFk+hMliuxNZDABcrPCv2iAo1DN4S5i
	w0woOfJUobmj+iW1iAGsFM8yyAM2R1M8VuPECp5hlwSt5z0qd/b53wmB9cDTvnSt7B8/A7sXyZJ
	RjSnEizYZ5m40nJMQIBH2GmmhhwMKma7VHeA4fG3PvG0NLe7uiHvLlK2T5X0rcNreKGycRowP/O
	rYaCtnGvSYokt5gdpRg/CeaFU5x55aaeYTKpjune0oAFOmRjUShml8nl8ZhMcGIhYo1eXZ+LlWk
	kq2QPpv1PqlaGCSqtThtd2qqoLm1mTVgqBpU8nWABORJ30jhXk6KK3k3WCeIBjT7G6HOc5cOa2d
	jT4Hh2HI=
X-Google-Smtp-Source: AGHT+IE0KPJ87HsMv3dtTh+XWbECzdpVVXv6McTxOopZBlTno+x0ugWKzcRPa0Xer44he323810Vnw==
X-Received: by 2002:a05:6a20:2451:b0:21c:fc27:aee6 with SMTP id adf61e73a8af0-220a15857f3mr2183641637.22.1750991597365;
        Thu, 26 Jun 2025 19:33:17 -0700 (PDT)
Received: from danascape.tail34aafc.ts.net ([2402:e280:218d:2e5:925:fa94:e64:60ee])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-74af57dda03sm989250b3a.147.2025.06.26.19.33.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Jun 2025 19:33:16 -0700 (PDT)
From: Saalim Quadri <danascape@gmail.com>
To: jikos@kernel.org,
	bentiss@kernel.org
Cc: linux-input@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Saalim Quadri <danascape@gmail.com>
Subject: [PATCH v3] HID: Xinmeng: Add driver for Xinmeng M71 Keyboard
Date: Fri, 27 Jun 2025 08:03:11 +0530
Message-Id: <20250627023311.104045-1-danascape@gmail.com>
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
v2 -> v3:
	Match lore email to the driver
	assign ret val while probing battery
v1 -> v2: Update Kconfig paragraph :/

 drivers/hid/Kconfig       |  12 +++
 drivers/hid/Makefile      |   1 +
 drivers/hid/hid-ids.h     |   3 +
 drivers/hid/hid-xinmeng.c | 170 ++++++++++++++++++++++++++++++++++++++
 4 files changed, 186 insertions(+)
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
index 000000000000..a4f5b181bca4
--- /dev/null
+++ b/drivers/hid/hid-xinmeng.c
@@ -0,0 +1,170 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+/*
+ *  HID driver for Xinmeng M71 Keyboard.
+ *
+ *  Copyright (c) 2025 Saalim Quadri <danascape@gmail.com>
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
+					enum power_supply_property psp,
+					union power_supply_propval *val)
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
+		ret = xinmeng_battery_probe(hdev);
+		if (ret < 0) {
+			hid_err(hdev, "Xinmeng hid battery_probe failed: %d\n", ret);
+			return ret;
+		}
+	}
+
+	return 0;
+}
+
+static int xinmeng_raw_event(struct hid_device *hdev,
+				 struct hid_report *report, u8 *data, int size)
+{
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
+MODULE_AUTHOR("Saalim Quadri <danascape@gmail.com>");
-- 
2.34.1


