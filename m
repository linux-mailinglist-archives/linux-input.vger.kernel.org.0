Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C2DBE370FE7
	for <lists+linux-input@lfdr.de>; Mon,  3 May 2021 01:38:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232358AbhEBXjF (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Sun, 2 May 2021 19:39:05 -0400
Received: from 82-65-109-163.subs.proxad.net ([82.65.109.163]:55102 "EHLO
        luna.linkmauve.fr" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232374AbhEBXjD (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Sun, 2 May 2021 19:39:03 -0400
Received: by luna.linkmauve.fr (Postfix, from userid 1000)
        id AB16DF405DA; Mon,  3 May 2021 01:29:01 +0200 (CEST)
From:   Emmanuel Gil Peyrot <linkmauve@linkmauve.fr>
To:     linux-input@vger.kernel.org
Cc:     Emmanuel Gil Peyrot <linkmauve@linkmauve.fr>,
        Ash Logan <ash@heyquark.com>,
        =?UTF-8?q?Jonathan=20Neusch=C3=A4fer?= <j.ne@posteo.net>,
        Jiri Kosina <jikos@kernel.org>,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>,
        linux-kernel@vger.kernel.org
Subject: [PATCH 4/4] HID: wiiu-drc: Add battery reporting
Date:   Mon,  3 May 2021 01:28:35 +0200
Message-Id: <20210502232836.26134-5-linkmauve@linkmauve.fr>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210502232836.26134-1-linkmauve@linkmauve.fr>
References: <20210502232836.26134-1-linkmauve@linkmauve.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On my DRC the values only go between 142 (battery LED blinking red
before shutdown) and 178 (charge LED stopping), it seems to be the same
on other units according to other testers.

A spinlock is used to avoid the battery level and status from being
reported unsynchronised.

Signed-off-by: Emmanuel Gil Peyrot <linkmauve@linkmauve.fr>
---
 drivers/hid/hid-wiiu-drc.c | 107 +++++++++++++++++++++++++++++++++++++
 1 file changed, 107 insertions(+)

diff --git a/drivers/hid/hid-wiiu-drc.c b/drivers/hid/hid-wiiu-drc.c
index 80faaaad2bb5..119d55542e31 100644
--- a/drivers/hid/hid-wiiu-drc.c
+++ b/drivers/hid/hid-wiiu-drc.c
@@ -15,6 +15,8 @@
 #include <linux/device.h>
 #include <linux/hid.h>
 #include <linux/module.h>
+#include <linux/power_supply.h>
+#include <linux/spinlock.h>
 #include "hid-ids.h"
 
 #define DEVICE_NAME	"Nintendo Wii U gamepad"
@@ -69,6 +71,11 @@
 #define MAGNET_MIN	ACCEL_MIN
 #define MAGNET_MAX	ACCEL_MAX
 
+/* Battery constants */
+#define BATTERY_MIN	142
+#define BATTERY_MAX	178
+#define BATTERY_CAPACITY(val) ((val - BATTERY_MIN) * 100 / (BATTERY_MAX - BATTERY_MIN))
+
 /*
  * The device is setup with multiple input devices:
  * - A joypad with the buttons and sticks.
@@ -77,10 +84,17 @@
  */
 
 struct drc {
+	spinlock_t lock;
+
 	struct input_dev *joy_input_dev;
 	struct input_dev *touch_input_dev;
 	struct input_dev *accel_input_dev;
 	struct hid_device *hdev;
+	struct power_supply *battery;
+	struct power_supply_desc battery_desc;
+
+	u8 battery_energy;
+	int battery_status;
 };
 
 static int drc_raw_event(struct hid_device *hdev, struct hid_report *report,
@@ -89,6 +103,7 @@ static int drc_raw_event(struct hid_device *hdev, struct hid_report *report,
 	struct drc *drc = hid_get_drvdata(hdev);
 	int i, x, y, z, pressure, base;
 	u32 buttons;
+	unsigned long flags;
 
 	if (len != 128)
 		return 0;
@@ -206,6 +221,17 @@ static int drc_raw_event(struct hid_device *hdev, struct hid_report *report,
 	input_report_abs(drc->accel_input_dev, ABS_WHEEL, (int16_t)z);
 	input_sync(drc->accel_input_dev);
 
+	/* battery */
+	spin_lock_irqsave(&drc->lock, flags);
+	drc->battery_energy = data[5];
+	if (drc->battery_energy == BATTERY_MAX)
+		drc->battery_status = POWER_SUPPLY_STATUS_FULL;
+	else if ((data[4] & 0x40) != 0)
+		drc->battery_status = POWER_SUPPLY_STATUS_CHARGING;
+	else
+		drc->battery_status = POWER_SUPPLY_STATUS_DISCHARGING;
+	spin_unlock_irqrestore(&drc->lock, flags);
+
 	/* let hidraw and hiddev handle the report */
 	return 0;
 }
@@ -309,10 +335,67 @@ static bool drc_setup_accel(struct drc *drc,
 	return true;
 }
 
+static enum power_supply_property drc_battery_props[] = {
+	POWER_SUPPLY_PROP_PRESENT,
+	POWER_SUPPLY_PROP_CAPACITY,
+	POWER_SUPPLY_PROP_SCOPE,
+	POWER_SUPPLY_PROP_STATUS,
+	POWER_SUPPLY_PROP_ENERGY_NOW,
+	POWER_SUPPLY_PROP_ENERGY_EMPTY,
+	POWER_SUPPLY_PROP_ENERGY_FULL,
+};
+
+static int drc_battery_get_property(struct power_supply *psy,
+				    enum power_supply_property psp,
+				    union power_supply_propval *val)
+{
+	struct drc *drc = power_supply_get_drvdata(psy);
+	unsigned long flags;
+	int ret = 0;
+	u8 battery_energy;
+	int battery_status;
+
+	spin_lock_irqsave(&drc->lock, flags);
+	battery_energy = drc->battery_energy;
+	battery_status = drc->battery_status;
+	spin_unlock_irqrestore(&drc->lock, flags);
+
+	switch (psp) {
+	case POWER_SUPPLY_PROP_PRESENT:
+		val->intval = 1;
+		break;
+	case POWER_SUPPLY_PROP_SCOPE:
+		val->intval = POWER_SUPPLY_SCOPE_DEVICE;
+		break;
+	case POWER_SUPPLY_PROP_CAPACITY:
+		val->intval = BATTERY_CAPACITY(battery_energy);
+		break;
+	case POWER_SUPPLY_PROP_STATUS:
+		val->intval = battery_status;
+		break;
+	case POWER_SUPPLY_PROP_ENERGY_NOW:
+		val->intval = battery_energy;
+		break;
+	case POWER_SUPPLY_PROP_ENERGY_EMPTY:
+		val->intval = BATTERY_MIN;
+		break;
+	case POWER_SUPPLY_PROP_ENERGY_FULL:
+		val->intval = BATTERY_MAX;
+		break;
+	default:
+		ret = -EINVAL;
+		break;
+	}
+	return ret;
+}
+
 static bool drc_setup_joypad(struct drc *drc,
 		struct hid_device *hdev)
 {
 	struct input_dev *input_dev;
+	struct power_supply_config psy_cfg = { .drv_data = drc, };
+	int ret;
+	static uint8_t drc_num = 0;
 
 	input_dev = allocate_and_setup(hdev, DEVICE_NAME " Joypad");
 	if (!input_dev)
@@ -350,6 +433,30 @@ static bool drc_setup_joypad(struct drc *drc,
 
 	drc->joy_input_dev = input_dev;
 
+	drc->battery_desc.properties = drc_battery_props;
+	drc->battery_desc.num_properties = ARRAY_SIZE(drc_battery_props);
+	drc->battery_desc.get_property = drc_battery_get_property;
+	drc->battery_desc.type = POWER_SUPPLY_TYPE_BATTERY;
+	drc->battery_desc.use_for_apm = 0;
+
+	/*
+	 * TODO: It might be better to use the interface number as the drc_num,
+	 * but I don’t know how to fetch it from here.  In userland it is
+	 * /sys/devices/platform/latte/d140000.usb/usb3/3-1/3-1:1.?/bInterfaceNumber
+	 */
+	drc->battery_desc.name = devm_kasprintf(&hdev->dev, GFP_KERNEL, "wiiu-drc-%i-battery", drc_num++);
+	if (!drc->battery_desc.name)
+		return -ENOMEM;
+
+	drc->battery = devm_power_supply_register(&hdev->dev, &drc->battery_desc, &psy_cfg);
+	if (IS_ERR(drc->battery)) {
+		ret = PTR_ERR(drc->battery);
+		hid_err(hdev, "Unable to register battery device\n");
+		return ret;
+	}
+
+	power_supply_powers(drc->battery, &hdev->dev);
+
 	return true;
 }
 
-- 
2.31.1

