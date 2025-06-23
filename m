Return-Path: <linux-input+bounces-13001-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id AA3D1AE495E
	for <lists+linux-input@lfdr.de>; Mon, 23 Jun 2025 17:55:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C93073A4BA6
	for <lists+linux-input@lfdr.de>; Mon, 23 Jun 2025 15:55:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9413726F44F;
	Mon, 23 Jun 2025 15:55:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="OqFjGO1R"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-pf1-f178.google.com (mail-pf1-f178.google.com [209.85.210.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EDA3C1F94A;
	Mon, 23 Jun 2025 15:55:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750694126; cv=none; b=dWhfkk5Fq+zWGp5tTWxTVZ2g9YlF7KBagN/hr1J4udXUDZrthHLM0b+nITrRzB7ig4pt/GdATesnYvuv2bcvFzaADFrO8hQltUgYnbR1OVZECghiS7Gs+8HSmdNkfICFOYPwZQ7GxEOiJsS1TCdDb7OOQ9yIHcXy/b2BBivL6iE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750694126; c=relaxed/simple;
	bh=KRPEZQmQ3fX2XnM7Sg6ZggmDVi0Tk5svtmjpiaYr+7A=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=S2edXy3Vhm5beXEcdeqnPyIwnkw2CN/BOqRb1WiIcfrEBAh/km905q9tFB2wVEGHCYfrtO2vgYCLOGyL0GdklyctTa1bk2YThjR9wO4I2JgZfkhqhhyIskhRMYjx3AIk9p6VL092QGeTvSYkccAsv9w4CONT/kTVMvIgPOHdbd8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=OqFjGO1R; arc=none smtp.client-ip=209.85.210.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f178.google.com with SMTP id d2e1a72fcca58-7399a2dc13fso5098112b3a.2;
        Mon, 23 Jun 2025 08:55:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750694124; x=1751298924; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=dd5VacvJszpPl8QEKyX3YzYdAjPr0pKyQfjuRcJwbPw=;
        b=OqFjGO1R2xckAhSUzRejNwJbNHdWXWNg/66qeL4pLxySJvQJ62GjNFRXjhDEgD6Iti
         e8UjNol/4h3+kD6lMHt7OL5UOkTV3CgyJ55zCoovkMgAk71D6CJjsXDOEVDx0T0zF5fw
         kZilNhQjjUnxwrIVdRd1Xrh+HcVDPaQ0xeSR4EoP+Yttf1fHwFZ5zwF4NEg0nd8HnOPk
         EWrt6N1c//4sfjZ7shX/4KzZDP4ubY+oFaPoZTCvwtnTu8s/kc+tovot7No5amOUDtDg
         CUaCrQVr2w2+kjgE34iQTnnp2Crw/9pzdnGtPd0VjraED2SyRoVKRmfTj13xKzylEq00
         yA1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750694124; x=1751298924;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=dd5VacvJszpPl8QEKyX3YzYdAjPr0pKyQfjuRcJwbPw=;
        b=NNvG0mM/0busfoie0b1slji4le5/ZWM/bhwjzrqjKo8zr7VQRZc6NouZoc0EdqJq5i
         YihvSRbK8mrFGSwDLye8u0VmbALAgU6qZPVtBAc2rSi//EGOfhExzC7c26hY9A0iqTDs
         xTH4BNSOqVaEemJ1NIhy3NUBaXRdqQAPhM8C5XnHnyIvvGgSApZdWZpCfryWTDr6dtYB
         /qzveY2shoinsiUla7azdswdV/rrap49840om6IkZhJZ+v3LSLOfcpDWxsTBUI8bvFTd
         GY8qjwvDHLoMNBZ5sNqnrhUuUKN5rZMl0hIxc6FTTSPs/3bO5+oIOISPpnRTK5ReGC1u
         OjjA==
X-Forwarded-Encrypted: i=1; AJvYcCXI7qzdqsv5fUoYXf8j+FhPUyHXS6WHC3l1CFIBQoPNs8DoReHYm5jIo5t39WkS3xC4615lXDqyHGEnM7I=@vger.kernel.org
X-Gm-Message-State: AOJu0YyuC/zNe6zVgGUD625EookRuGf4G0HVCvnCVzeFt3+M9pAL4goW
	X/W+dmKUD2jhJ0G8MSoWTpbzEOvUaD/06WRqMCtmOZ3Y+6nCG1n9/qcKpRclnTyx
X-Gm-Gg: ASbGncv+Ve9vfR7SBxED6Legn6ts8E9Yrus9CLZb+WxvEbpZ8px61r8HIaSdxGLjlz6
	5DelS4nNErkDVPxOoAm+Nk4K5qqgM8tQX8xwEgHIr5nEK7fRGAL9gZmG2HLC7ojfOxf8uQ3pnez
	vvHTZ8B8gLOrtIOx/0fFY7r7FfhPnz9RbhImCWUnGyjZEpYTkv6rXydb6Du7GJ7E35LF1DKVhQ8
	mdcBofDW2ZiNojWAihVPP9r0TqAJDZ9OKMklz/P6H9WBQLEBCgbjV2SEkGl8xTT32YMj0cmwZZQ
	u4VACXAvmYOIL+pKC9oxLGjxJrBLzdFd1KwB+DakXwn3eosqBHS7pA1dL3/JIPRcQ+x+SDAYoTI
	V0S9bfKB+Ug==
X-Google-Smtp-Source: AGHT+IErb510KTg/UQz//d3NDqJqylGlZZhnZ2yloIf9jft80Y6NswguJG4aDiPsdprhbtgt5/DqwQ==
X-Received: by 2002:a05:6300:8e04:b0:220:2742:1c41 with SMTP id adf61e73a8af0-22027421cd6mr13509549637.16.1750694124079;
        Mon, 23 Jun 2025 08:55:24 -0700 (PDT)
Received: from danascape.tail34aafc.ts.net ([2402:e280:218d:2e5:7949:b195:766f:55f8])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b31f1258932sm8257816a12.64.2025.06.23.08.55.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Jun 2025 08:55:23 -0700 (PDT)
From: Saalim Quadri <danascape@gmail.com>
To: jikos@kernel.org,
	bentiss@kernel.org
Cc: linux-input@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Saalim Quadri <danascape@gmail.com>
Subject: [PATCH] HID: Xinmeng: Add driver for Xinmeng M71 Keyboard
Date: Mon, 23 Jun 2025 21:25:17 +0530
Message-Id: <20250623155517.492051-1-danascape@gmail.com>
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
 drivers/hid/Kconfig       |  12 +++
 drivers/hid/Makefile      |   1 +
 drivers/hid/hid-ids.h     |   3 +
 drivers/hid/hid-xinmeng.c | 168 ++++++++++++++++++++++++++++++++++++++
 4 files changed, 184 insertions(+)
 create mode 100644 drivers/hid/hid-xinmeng.c

diff --git a/drivers/hid/Kconfig b/drivers/hid/Kconfig
index 43859fc75747..534d5ca151f0 100644
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
+		module will be called hid-icade.
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


