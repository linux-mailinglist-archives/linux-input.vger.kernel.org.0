Return-Path: <linux-input+bounces-7099-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 06C949916A4
	for <lists+linux-input@lfdr.de>; Sat,  5 Oct 2024 14:04:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id BDB312822B3
	for <lists+linux-input@lfdr.de>; Sat,  5 Oct 2024 12:04:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5FD5514EC77;
	Sat,  5 Oct 2024 12:03:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lodewillems.com header.i=@lodewillems.com header.b="smeFAYyL"
X-Original-To: linux-input@vger.kernel.org
Received: from mout-p-201.mailbox.org (mout-p-201.mailbox.org [80.241.56.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 90A9C1553BC;
	Sat,  5 Oct 2024 12:03:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.241.56.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728129834; cv=none; b=smahH2rsc7f+va45qJo/v2MM3yvLgdoHv0HFJyjTqd85fLQqUrt3jes9V31ktH/wVjo3GVrqau5OTbVWYgNpWzzKwj2+TnnX4/+zCIu1oCHDmWUJuxaOPzb5ihc1qYvBO895Qs0XiYO8w/T0YLNbxybUqdeY9YnXmQ/6vesB7Ok=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728129834; c=relaxed/simple;
	bh=AHbl1M0PKa4qlOqRbPcd+FqsIhQGu8AVRZGUvPXC6V0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ssDWZkAMlu2Y3WuiQP061Wx5fZ7JQUUSlZKwiIddtHtEscDXvQCBac4pwhJb7WLCsTOJ2pUHHPNQctul7NEBTRrZLLl97NKLAGxuzq2HsDSv0GOVd7hNEytXFS4GvpHi3/Ikf4+2pKL4wqLUGVzhbSPmp7pcIacrGpDNbnDqk1w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lodewillems.com; spf=pass smtp.mailfrom=lodewillems.com; dkim=pass (2048-bit key) header.d=lodewillems.com header.i=@lodewillems.com header.b=smeFAYyL; arc=none smtp.client-ip=80.241.56.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lodewillems.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lodewillems.com
Received: from smtp102.mailbox.org (smtp102.mailbox.org [IPv6:2001:67c:2050:b231:465::102])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-201.mailbox.org (Postfix) with ESMTPS id 4XLPFq0xSYz9sd5;
	Sat,  5 Oct 2024 14:03:43 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lodewillems.com;
	s=MBO0001; t=1728129823;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=33jmOsnNcAO1avfPTWzl0cE9y4C5TXL327mIibaeIhg=;
	b=smeFAYyLyvwIuku4gPw3/Ge25eMlmin+RlgjVhBQEEInQyXhBDBUPyandPOXokfw9OCld+
	I8jdv8GWIZoAYRDa23sOLB44lR5AcMhQWEIPzwBmsMsULxfwo7DnCdkTSyE42D2aacUPoz
	s4bXm2HE7N2qygVpzbbNJq+DB/uC9qlJa7TOsqgQw74jqthoo0/u6EFIZSUBOUNe1evG38
	nxrb3Ld7qBaWWR2RCUSn5l92oKQuOsDLiA+KWRVXVe8ehjMMYAdDPXx7PN96lxzpSOYHan
	9hkVkg7SzT9Jrd6euqPpYOgJkzFTw5VuwryjqfgpRrksicOLvqBgQlvLaBLU+w==
From: Lode Willems <me@lodewillems.com>
To: linux-input@vger.kernel.org
Cc: jikos@kernel.org,
	bentiss@kernel.org,
	linux-kernel@vger.kernel.org,
	Lode Willems <me@lodewillems.com>
Subject: [PATCH 2/4] HID: Kysona: Add basic battery reporting for Kysona M600
Date: Sat,  5 Oct 2024 13:57:04 +0200
Message-ID: <20241005120256.13847-3-me@lodewillems.com>
In-Reply-To: <20241005120256.13847-1-me@lodewillems.com>
References: <20241005120256.13847-1-me@lodewillems.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: 4XLPFq0xSYz9sd5

In this initial the battery is only probed once, a following patch will add
periodic checking.

Signed-off-by: Lode Willems <me@lodewillems.com>
---
 drivers/hid/Kconfig      |   9 ++
 drivers/hid/Makefile     |   1 +
 drivers/hid/hid-kysona.c | 208 +++++++++++++++++++++++++++++++++++++++
 3 files changed, 218 insertions(+)
 create mode 100644 drivers/hid/hid-kysona.c

diff --git a/drivers/hid/Kconfig b/drivers/hid/Kconfig
index 08446c89eff6..541dbee4fa00 100644
--- a/drivers/hid/Kconfig
+++ b/drivers/hid/Kconfig
@@ -459,6 +459,15 @@ config HID_KYE
 	- MousePen i608X tablet
 	- EasyPen M610X tablet
 
+config HID_KYSONA
+	tristate "Kysona devices"
+	depends on USB_HID
+	help
+	Support for Kysona mice.
+
+	Say Y here if you have a Kysona M600 mouse
+	and want to be able to read its battery capacity.
+
 config HID_UCLOGIC
 	tristate "UC-Logic"
 	depends on USB_HID
diff --git a/drivers/hid/Makefile b/drivers/hid/Makefile
index e40f1ddebbb7..c39ef074ac66 100644
--- a/drivers/hid/Makefile
+++ b/drivers/hid/Makefile
@@ -69,6 +69,7 @@ obj-$(CONFIG_HID_JABRA)		+= hid-jabra.o
 obj-$(CONFIG_HID_KENSINGTON)	+= hid-kensington.o
 obj-$(CONFIG_HID_KEYTOUCH)	+= hid-keytouch.o
 obj-$(CONFIG_HID_KYE)		+= hid-kye.o
+obj-$(CONFIG_HID_KYSONA)	+= hid-kysona.o
 obj-$(CONFIG_HID_LCPOWER)	+= hid-lcpower.o
 obj-$(CONFIG_HID_LENOVO)	+= hid-lenovo.o
 obj-$(CONFIG_HID_LETSKETCH)	+= hid-letsketch.o
diff --git a/drivers/hid/hid-kysona.c b/drivers/hid/hid-kysona.c
new file mode 100644
index 000000000000..91e359c31fa1
--- /dev/null
+++ b/drivers/hid/hid-kysona.c
@@ -0,0 +1,208 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+/*
+ *  USB HID driver for Kysona
+ *  Kysona M600 mice.
+ *
+ *  Copyright (c) 2024 Lode Willems <me@lodewillems.com>
+ */
+
+#include <linux/device.h>
+#include <linux/hid.h>
+#include <linux/usb.h>
+
+#include "hid-ids.h"
+
+#define BATTERY_REPORT_ID 4
+
+struct kysona_drvdata {
+	struct hid_device *hdev;
+	struct power_supply_desc battery_desc;
+	struct power_supply *battery;
+	u8 battery_capacity;
+	bool battery_charging;
+	u16 battery_voltage;
+};
+
+static enum power_supply_property kysona_battery_props[] = {
+	POWER_SUPPLY_PROP_STATUS,
+	POWER_SUPPLY_PROP_PRESENT,
+	POWER_SUPPLY_PROP_CAPACITY,
+	POWER_SUPPLY_PROP_SCOPE,
+	POWER_SUPPLY_PROP_MODEL_NAME,
+	POWER_SUPPLY_PROP_VOLTAGE_NOW
+};
+
+static int kysona_battery_get_property(struct power_supply *psy,
+				       enum power_supply_property psp,
+				       union power_supply_propval *val)
+{
+	struct kysona_drvdata *drv_data = power_supply_get_drvdata(psy);
+	int ret = 0;
+
+	switch (psp) {
+	case POWER_SUPPLY_PROP_PRESENT:
+		val->intval = 1;
+		break;
+	case POWER_SUPPLY_PROP_STATUS:
+		// TODO: check if device is online
+		val->intval = drv_data->battery_charging ?
+			POWER_SUPPLY_STATUS_CHARGING :
+			POWER_SUPPLY_STATUS_DISCHARGING;
+		break;
+	case POWER_SUPPLY_PROP_SCOPE:
+		val->intval = POWER_SUPPLY_SCOPE_DEVICE;
+		break;
+	case POWER_SUPPLY_PROP_CAPACITY:
+		val->intval = drv_data->battery_capacity;
+		break;
+	case POWER_SUPPLY_PROP_VOLTAGE_NOW:
+		/* hardware reports voltage in mV. sysfs expects uV */
+		val->intval = drv_data->battery_voltage * 1000;
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
+static const char kysona_battery_request[] = {
+	0x08, BATTERY_REPORT_ID, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
+	0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x49
+};
+
+static int kysona_m600_fetch_battery(struct hid_device *hdev)
+{
+	u8 *write_buf;
+	int ret;
+
+	/* Request battery information */
+	write_buf = kmemdup(kysona_battery_request, sizeof(kysona_battery_request), GFP_KERNEL);
+	if (!write_buf)
+		return -ENOMEM;
+
+	ret = hid_hw_raw_request(hdev, kysona_battery_request[0],
+				 write_buf, sizeof(kysona_battery_request),
+				 HID_OUTPUT_REPORT, HID_REQ_SET_REPORT);
+	if (ret < (int)sizeof(kysona_battery_request)) {
+		hid_err(hdev, "hid_hw_raw_request() failed with %d\n", ret);
+		ret = -ENODATA;
+	}
+	kfree(write_buf);
+	return ret;
+}
+
+static void kysona_fetch_battery(struct hid_device *hdev)
+{
+	int ret = kysona_m600_fetch_battery(hdev);
+
+	if (ret < 0)
+		hid_dbg(hdev,
+			"Battery query failed (err: %d)\n", ret);
+}
+
+static int kysona_battery_probe(struct hid_device *hdev)
+{
+	struct kysona_drvdata *drv_data = hid_get_drvdata(hdev);
+	struct power_supply_config pscfg = { .drv_data = drv_data };
+	int ret = 0;
+
+	drv_data->battery_capacity = 100;
+
+	drv_data->battery_desc.properties = kysona_battery_props;
+	drv_data->battery_desc.num_properties = ARRAY_SIZE(kysona_battery_props);
+	drv_data->battery_desc.get_property = kysona_battery_get_property;
+	drv_data->battery_desc.type = POWER_SUPPLY_TYPE_BATTERY;
+	drv_data->battery_desc.use_for_apm = 0;
+	drv_data->battery_desc.name = devm_kasprintf(&hdev->dev, GFP_KERNEL,
+						     "kysona-%s-battery",
+						     strlen(hdev->uniq) ?
+						     hdev->uniq : dev_name(&hdev->dev));
+	if (!drv_data->battery_desc.name)
+		return -ENOMEM;
+
+	drv_data->battery = devm_power_supply_register(&hdev->dev,
+						       &drv_data->battery_desc, &pscfg);
+	if (IS_ERR(drv_data->battery)) {
+		ret = PTR_ERR(drv_data->battery);
+		drv_data->battery = NULL;
+		hid_err(hdev, "Unable to register battery device\n");
+		return ret;
+	}
+
+	power_supply_powers(drv_data->battery, &hdev->dev);
+	kysona_fetch_battery(hdev);
+
+	return ret;
+}
+
+static int kysona_probe(struct hid_device *hdev, const struct hid_device_id *id)
+{
+	int ret;
+	struct kysona_drvdata *drv_data;
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
+		if (kysona_battery_probe(hdev) < 0)
+			hid_err(hdev, "Kysona hid battery_probe failed: %d\n", ret);
+	}
+
+	return 0;
+}
+
+static int kysona_raw_event(struct hid_device *hdev,
+			    struct hid_report *report, u8 *data, int size)
+{
+	struct kysona_drvdata *drv_data = hid_get_drvdata(hdev);
+
+	if (drv_data->battery && size == sizeof(kysona_battery_request) &&
+	    data[0] == 8 && data[1] == BATTERY_REPORT_ID) {
+		drv_data->battery_capacity = data[6];
+		drv_data->battery_charging = data[7];
+		drv_data->battery_voltage = (data[8] << 8) | data[9];
+	}
+
+	return 0;
+}
+
+static const struct hid_device_id kysona_devices[] = {
+	{ HID_USB_DEVICE(USB_VENDOR_ID_KYSONA, USB_DEVICE_ID_KYSONA_M600_DONGLE) },
+	{ HID_USB_DEVICE(USB_VENDOR_ID_KYSONA, USB_DEVICE_ID_KYSONA_M600_WIRED) },
+	{ }
+};
+MODULE_DEVICE_TABLE(hid, kysona_devices);
+
+static struct hid_driver kysona_driver = {
+	.name			= "kysona",
+	.id_table		= kysona_devices,
+	.probe			= kysona_probe,
+	.raw_event		= kysona_raw_event
+};
+module_hid_driver(kysona_driver);
+
+MODULE_LICENSE("GPL");
+MODULE_DESCRIPTION("HID driver for Kysona devices");
+MODULE_AUTHOR("Lode Willems <me@lodewillems.com>");
-- 
2.46.1


