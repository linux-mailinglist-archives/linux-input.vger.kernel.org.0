Return-Path: <linux-input+bounces-14533-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id DAF32B47AB7
	for <lists+linux-input@lfdr.de>; Sun,  7 Sep 2025 13:12:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 67F303C3B68
	for <lists+linux-input@lfdr.de>; Sun,  7 Sep 2025 11:12:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 878ED25D216;
	Sun,  7 Sep 2025 11:12:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="eHV/EzhV"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-pg1-f169.google.com (mail-pg1-f169.google.com [209.85.215.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D8E8B315D43;
	Sun,  7 Sep 2025 11:12:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757243575; cv=none; b=PnMZLHp7YfCzGlgg/qRJvVXPZePB2HpzVgYPCGnpunmnAKYxxqV6fDlNdmKPvrm0GNI+gnHd296aywbWWjE0Ud1MGX0vd+xJ1q2lU4vtCDg5EPiIEVqm1yCdK0atvZ10egUh5saJi3F3lAmiKIz40fXA9dBmF3YmQm7pqKnotmU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757243575; c=relaxed/simple;
	bh=JeDvWOF1XyNZlVbSRkKg62AXuM9cfneLs6TPaSfZpr4=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=S3xNSM6flSLU7lqjuXgOpRK5x04GH6mwYqKpoDSsAq7D0Mdfp7nhsvH6OiTvH6A5WTOFekHdv8dUy3HNUmVJwdn+S7zIaXtZf/eS1QkkeQepU8T6sTOS/oHWxvlwDLHc3MawmouUSUAxpyVLrg/X8TTCvC4nN2yswLatkmwXcfU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=eHV/EzhV; arc=none smtp.client-ip=209.85.215.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pg1-f169.google.com with SMTP id 41be03b00d2f7-b49b56a3f27so2107136a12.1;
        Sun, 07 Sep 2025 04:12:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1757243573; x=1757848373; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=mzGMUD5FoQ+Qma22SIVK819nPdr7pYinoircpLfGQJY=;
        b=eHV/EzhVICrbze+rMfEbd1WeMxS/zW+PUVvAJrj23s8LU9RQ5r4OrIUaQnUcIZHt3G
         BJbbIu4436Og8dXUcvdNu2zGSvQt6bQMzVafUyD4NPrfCdON8sNnrMJ5INmo93OP4VUO
         fd4UcSu7zniAxJX49uLzNS97p2Nt7oBiu0spN2H6uA1QMuB+/sd9CvN/tEp/oMGqILHP
         IkT6RSmUFUEJKrB0A4papwSTaqD7pWaayLWyhnICTdv7x99rAbPhnY6rrLsgIeQwzzG3
         6eTXg9N76o2PssnBmkPj68k4R1eT86vKLMlKROrMKBWSA+PHyOGk/wNThhozR7TE57on
         L/HA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757243573; x=1757848373;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=mzGMUD5FoQ+Qma22SIVK819nPdr7pYinoircpLfGQJY=;
        b=M2uhU7rP4rhTIKUyGVMVqru1qwWWx5DFrV8AxC5QD2JxD6n58o/1DSnLekE2zyKf1J
         GuO8UFMueg4KXJa2fzOv1ovP05IAKLnbUqStLwr5iggPgfEldrIbxqpatwlSuP8IwrKA
         S9zSFmSqfyXpO+Rrs4r8fYUf8/3X8xrM5Gfwes9ecKqG1TZfv6N600+s8qBIDuxo8rzd
         CYRy9XxY7+0Q7LgAltGm+JmbVleaooxuxvhjHfG5o4lgkLvQhQupA7ZljEmwXclcxlTy
         9Af1CB8i/kCiSJNfvisEfFtr/P/PKiLjPEa4V6RwGcUQ2TRiHJlibVi8/UwIx2Rgv0WN
         6eJQ==
X-Forwarded-Encrypted: i=1; AJvYcCUsN3+zmYrNsuaP16aGhRkdq2KJ0jf2b+ni0A8SKwxqlo5ab6wEZI93MqEgk65vjYuEZlyXu6cESXywyUM=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz9o690HYLV3Z2XRUJR+BfbNrLGMna5HKgM7xIi7dLnL91DmJ6K
	uUbrntuu0/FheQLnU9hCokiRn7KLXWN0Re1wTt2LGekglsPL6ndnlT0fUXPeLA==
X-Gm-Gg: ASbGncuhy2SKxFdYxrg2PFk5MEpJYn+Kh0gySTQsaKMZ2p6TUIjAPGX5hg8xDuoSGMB
	zO8u1RpXgXkqaWF2pIgCg1q9piIXzbQG5xgovbGrYPPcXolNbWKjrgsHcbVv7RhP5SZ1XoL8Uf/
	VF5DtNrJCab4mghVsK6qGP48PaElHP0ekm9fHY6+kC5EkAbjmIwnz8/GeRmZIwEcI2Vmtdzhn4q
	VmkYEvXI7szvWA3hD2Af99Css63E9WuSGVwCEhwEiXyE9XWiWFiZJ2kGVfugOSAOLLY5H6bCViB
	Uo62EIzS70PAeiWhsE99amdclApsg3F6obAOfnyMjAju530XEyx945Uumc2G9fa1cnmwPsUOTrP
	GURXUdno1b42oVzLeAg==
X-Google-Smtp-Source: AGHT+IGNtpnSkf4gNDwpSxa0SIKRTbgjTsBXoMDDHRiNfN4LWzIaTn/lePlLMopE8K+QB6yfvM7TFg==
X-Received: by 2002:a17:902:f607:b0:250:999f:31c6 with SMTP id d9443c01a7336-25170c414edmr50925805ad.32.1757243572995;
        Sun, 07 Sep 2025 04:12:52 -0700 (PDT)
Received: from danascape.. ([101.0.63.17])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-24b168157b6sm143580925ad.13.2025.09.07.04.12.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 07 Sep 2025 04:12:52 -0700 (PDT)
From: Saalim Quadri <danascape@gmail.com>
To: jikos@kernel.org,
	bentiss@kernel.org
Cc: linux-input@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Saalim Quadri <danascape@gmail.com>
Subject: [PATCH v3 RESEND] HID: Xinmeng: Add driver for Xinmeng M71 Keyboard
Date: Sun,  7 Sep 2025 16:42:46 +0530
Message-Id: <20250907111246.9733-1-danascape@gmail.com>
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


