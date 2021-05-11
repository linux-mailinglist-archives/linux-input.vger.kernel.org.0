Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4B4B137B005
	for <lists+linux-input@lfdr.de>; Tue, 11 May 2021 22:16:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229548AbhEKUR3 (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 11 May 2021 16:17:29 -0400
Received: from 82-65-109-163.subs.proxad.net ([82.65.109.163]:37966 "EHLO
        luna.linkmauve.fr" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229984AbhEKURX (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Tue, 11 May 2021 16:17:23 -0400
Received: by luna.linkmauve.fr (Postfix, from userid 1000)
        id D7217F4063D; Tue, 11 May 2021 22:16:14 +0200 (CEST)
From:   Emmanuel Gil Peyrot <linkmauve@linkmauve.fr>
To:     linux-input@vger.kernel.org
Cc:     Emmanuel Gil Peyrot <linkmauve@linkmauve.fr>,
        Ash Logan <ash@heyquark.com>,
        =?UTF-8?q?Jonathan=20Neusch=C3=A4fer?= <j.ne@posteo.net>,
        =?UTF-8?q?Barnab=C3=A1s=20P=C5=91cze?= <pobrn@protonmail.com>,
        Jiri Kosina <jikos@kernel.org>,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>,
        linux-kernel@vger.kernel.org
Subject: [PATCH v2 4/4] HID: wiiu-drc: Add battery reporting
Date:   Tue, 11 May 2021 22:16:04 +0200
Message-Id: <20210511201604.23204-5-linkmauve@linkmauve.fr>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210511201604.23204-1-linkmauve@linkmauve.fr>
References: <20210511201604.23204-1-linkmauve@linkmauve.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On my DRC the values only go between 142 (battery LED blinking red
before shutdown) and 178 (charge LED stopping), it seems to be the same
on other units according to other testers.  This might be the raw
voltage value as reported by an ADC, so adding a linear interpolation
between two common battery voltage values.

A spinlock is used to avoid the battery level and status from being
reported unsynchronised.

Signed-off-by: Emmanuel Gil Peyrot <linkmauve@linkmauve.fr>
---
 drivers/hid/hid-wiiu-drc.c | 123 +++++++++++++++++++++++++++++++++++++
 1 file changed, 123 insertions(+)

diff --git a/drivers/hid/hid-wiiu-drc.c b/drivers/hid/hid-wiiu-drc.c
index a631d405119e..c1c883641b67 100644
--- a/drivers/hid/hid-wiiu-drc.c
+++ b/drivers/hid/hid-wiiu-drc.c
@@ -17,6 +17,8 @@
 #include <linux/input.h>
 #include <linux/minmax.h>
 #include <linux/module.h>
+#include <linux/power_supply.h>
+#include <linux/spinlock.h>
 #include "hid-ids.h"
 
 #define DEVICE_NAME	"Nintendo Wii U gamepad (DRC)"
@@ -71,6 +73,13 @@
 #define MAGNET_MIN	-(1 << 15)
 #define MAGNET_MAX	((1 << 15) - 1)
 
+/* ADC constants for the battery */
+#define BATTERY_CHARGING_BIT	BIT(6)
+#define BATTERY_MIN	142
+#define BATTERY_MAX	178
+#define VOLTAGE_MIN	3270000
+#define VOLTAGE_MAX	4100000
+
 /*
  * The device is setup with multiple input devices:
  * - A joypad with the buttons and sticks.
@@ -83,6 +92,12 @@ struct drc {
 	struct input_dev *touch_input_dev;
 	struct input_dev *accel_input_dev;
 	struct hid_device *hdev;
+
+	struct power_supply *battery;
+	struct power_supply_desc battery_desc;
+	spinlock_t battery_lock;
+	u8 battery_energy;
+	int battery_status;
 };
 
 /*
@@ -99,6 +114,7 @@ static int drc_raw_event(struct hid_device *hdev, struct hid_report *report,
 	struct drc *drc = hid_get_drvdata(hdev);
 	int i, x, y, z, pressure, base;
 	u32 buttons;
+	unsigned long flags;
 
 	if (len != 128)
 		return -EINVAL;
@@ -217,6 +233,17 @@ static int drc_raw_event(struct hid_device *hdev, struct hid_report *report,
 	input_report_abs(drc->accel_input_dev, ABS_WHEEL, (int16_t)z);
 	input_sync(drc->accel_input_dev);
 
+	/* battery */
+	spin_lock_irqsave(&drc->battery_lock, flags);
+	drc->battery_energy = data[5];
+	if (drc->battery_energy == BATTERY_MAX)
+		drc->battery_status = POWER_SUPPLY_STATUS_FULL;
+	else if (data[4] & BATTERY_CHARGING_BIT)
+		drc->battery_status = POWER_SUPPLY_STATUS_CHARGING;
+	else
+		drc->battery_status = POWER_SUPPLY_STATUS_DISCHARGING;
+	spin_unlock_irqrestore(&drc->battery_lock, flags);
+
 	/* let hidraw and hiddev handle the report */
 	return 0;
 }
@@ -366,6 +393,96 @@ static bool drc_setup_accel(struct drc *drc,
 	return true;
 }
 
+static enum power_supply_property drc_battery_props[] = {
+	POWER_SUPPLY_PROP_STATUS,
+	POWER_SUPPLY_PROP_PRESENT,
+	POWER_SUPPLY_PROP_VOLTAGE_MAX,
+	POWER_SUPPLY_PROP_VOLTAGE_MIN,
+	POWER_SUPPLY_PROP_VOLTAGE_NOW,
+	POWER_SUPPLY_PROP_CAPACITY,
+	POWER_SUPPLY_PROP_SCOPE,
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
+	spin_lock_irqsave(&drc->battery_lock, flags);
+	battery_energy = drc->battery_energy;
+	battery_status = drc->battery_status;
+	spin_unlock_irqrestore(&drc->battery_lock, flags);
+
+	switch (psp) {
+	case POWER_SUPPLY_PROP_STATUS:
+		val->intval = battery_status;
+		break;
+	case POWER_SUPPLY_PROP_PRESENT:
+		val->intval = 1;
+		break;
+	case POWER_SUPPLY_PROP_VOLTAGE_MAX:
+		val->intval = VOLTAGE_MAX;
+		break;
+	case POWER_SUPPLY_PROP_VOLTAGE_MIN:
+		val->intval = VOLTAGE_MIN;
+		break;
+	case POWER_SUPPLY_PROP_VOLTAGE_NOW:
+		val->intval = fixp_linear_interpolate(BATTERY_MIN, VOLTAGE_MIN,
+						      BATTERY_MAX, VOLTAGE_MAX,
+						      battery_energy);
+		break;
+	case POWER_SUPPLY_PROP_CAPACITY:
+		val->intval = fixp_linear_interpolate(BATTERY_MIN, 0,
+						      BATTERY_MAX, 100,
+						      battery_energy);
+		break;
+	case POWER_SUPPLY_PROP_SCOPE:
+		val->intval = POWER_SUPPLY_SCOPE_DEVICE;
+		break;
+	default:
+		ret = -EINVAL;
+		break;
+	}
+	return ret;
+}
+
+static int drc_setup_battery(struct drc *drc,
+			     struct hid_device *hdev)
+{
+	struct power_supply_config psy_cfg = { .drv_data = drc, };
+	static atomic_t drc_num = ATOMIC_INIT(0);
+	int ret;
+
+	spin_lock_init(&drc->battery_lock);
+
+	drc->battery_desc.properties = drc_battery_props;
+	drc->battery_desc.num_properties = ARRAY_SIZE(drc_battery_props);
+	drc->battery_desc.get_property = drc_battery_get_property;
+	drc->battery_desc.type = POWER_SUPPLY_TYPE_BATTERY;
+	drc->battery_desc.use_for_apm = 0;
+
+	drc->battery_desc.name = devm_kasprintf(&hdev->dev, GFP_KERNEL,
+						"wiiu-drc-%i-battery", atomic_fetch_inc(&drc_num));
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
+	return 0;
+}
+
 static int drc_probe(struct hid_device *hdev, const struct hid_device_id *id)
 {
 	struct drc *drc;
@@ -392,6 +509,12 @@ static int drc_probe(struct hid_device *hdev, const struct hid_device_id *id)
 		return -ENOMEM;
 	}
 
+	ret = drc_setup_battery(drc, hdev);
+	if (ret) {
+		hid_err(hdev, "could not allocate battery interface\n");
+		return ret;
+	}
+
 	ret = hid_hw_start(hdev, HID_CONNECT_HIDRAW | HID_CONNECT_DRIVER);
 	if (ret) {
 		hid_err(hdev, "hw start failed\n");
-- 
2.31.1

