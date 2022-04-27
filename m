Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 00EE5512577
	for <lists+linux-input@lfdr.de>; Thu, 28 Apr 2022 00:46:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234412AbiD0WtY (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 27 Apr 2022 18:49:24 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48370 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235178AbiD0WtW (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Wed, 27 Apr 2022 18:49:22 -0400
Received: from endrift.com (endrift.com [173.255.198.10])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 920562AE05
        for <linux-input@vger.kernel.org>; Wed, 27 Apr 2022 15:46:09 -0700 (PDT)
Received: from localhost.localdomain (unknown [50.106.20.54])
        by endrift.com (Postfix) with ESMTPSA id 5DAA7A289;
        Wed, 27 Apr 2022 15:46:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=endrift.com; s=2020;
        t=1651099568; bh=8PTQ970/Utp5Hq6RweQvDROvSdomgPPb3BgBQZ09gYI=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=vCLt3hv3ZIUk/8gssrPnS0VPtJG+xKxpQKV5Kz/pTcA3lXjOHO5qlLUn2dFXGuCue
         ebnIRFIAzRahDxiZS2kXoqld/7jgiAA2+VA0FpaE75luauOdYBcjuLjpYNk3jis9Fy
         b/Ow8oZ7w+1LY70IaG3Vk+dvEFZzNqXqs7pGsfTwKx2xDxZOHhWHTwRGpiTdkcEUdN
         tLCyvDnP6YK+JoAm+dh1giRZTt2lByCDYYaFqm3+wHhj4MZAkGRkOP4SPJTkF5VKnf
         cjo4IVL2iI7A3SWma3WOfqfL881h7QAqd9Wkc87Z7WDLI3sjQFyKUa8Zy+osUo99/B
         orbKrzXqkpjow==
From:   Vicki Pfau <vi@endrift.com>
To:     linux-input@vger.kernel.org
Cc:     Roderick Colenbrander <roderick.colenbrander@sony.com>,
        Jiri Kosina <jikos@kernel.org>,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Vicki Pfau <vi@endrift.com>
Subject: [PATCH 4/6] HID: hid-sony: Allow removal of touchpad
Date:   Wed, 27 Apr 2022 15:45:24 -0700
Message-Id: <20220427224526.35657-4-vi@endrift.com>
X-Mailer: git-send-email 2.36.0
In-Reply-To: <20220427224526.35657-1-vi@endrift.com>
References: <20220427224526.35657-1-vi@endrift.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

This allows the touchpad input_dev to be removed and have the driver remain
functional without its presence. This will be used to allow the touchpad to
be disabled, e.g. by a module parameter.

Signed-off-by: Vicki Pfau <vi@endrift.com>
---
 drivers/hid/hid-sony.c | 163 +++++++++++++++++++++++++++--------------
 1 file changed, 110 insertions(+), 53 deletions(-)

diff --git a/drivers/hid/hid-sony.c b/drivers/hid/hid-sony.c
index 8319b0ce385a..1c347b3ca992 100644
--- a/drivers/hid/hid-sony.c
+++ b/drivers/hid/hid-sony.c
@@ -39,6 +39,7 @@
 #include <linux/crc32.h>
 #include <linux/usb.h>
 #include <linux/timer.h>
+#include <linux/rcupdate.h>
 #include <asm/unaligned.h>
 
 #include "hid-ids.h"
@@ -556,7 +557,7 @@ struct sony_sc {
 	spinlock_t lock;
 	struct list_head list_node;
 	struct hid_device *hdev;
-	struct input_dev *touchpad;
+	struct input_dev __rcu *touchpad;
 	struct input_dev *sensor_dev;
 	struct led_classdev *leds[MAX_LEDS];
 	unsigned long quirks;
@@ -565,6 +566,7 @@ struct sony_sc {
 	void (*send_output_report)(struct sony_sc *);
 	struct power_supply *battery;
 	struct power_supply_desc battery_desc;
+	struct mutex mutex;
 	int device_id;
 	unsigned fw_version;
 	bool fw_version_created;
@@ -1041,6 +1043,7 @@ static void dualshock4_parse_report(struct sony_sc *sc, u8 *rd, int size)
 	struct hid_input *hidinput = list_entry(sc->hdev->inputs.next,
 						struct hid_input, list);
 	struct input_dev *input_dev = hidinput->input;
+	struct input_dev *touchpad = NULL;
 	unsigned long flags;
 	int n, m, offset, num_touch_data, max_touch_data;
 	u8 cable_state, battery_capacity;
@@ -1050,9 +1053,15 @@ static void dualshock4_parse_report(struct sony_sc *sc, u8 *rd, int size)
 	/* When using Bluetooth the header is 2 bytes longer, so skip these. */
 	int data_offset = (sc->quirks & DUALSHOCK4_CONTROLLER_BT) ? 2 : 0;
 
+	rcu_read_lock();
+	touchpad = rcu_dereference(sc->touchpad);
+	rcu_read_unlock();
+
 	/* Second bit of third button byte is for the touchpad button. */
-	offset = data_offset + DS4_INPUT_REPORT_BUTTON_OFFSET;
-	input_report_key(sc->touchpad, BTN_LEFT, rd[offset+2] & 0x2);
+	if (touchpad) {
+		offset = data_offset + DS4_INPUT_REPORT_BUTTON_OFFSET;
+		input_report_key(touchpad, BTN_LEFT, rd[offset+2] & 0x2);
+	}
 
 	/*
 	 * The default behavior of the Dualshock 4 is to send reports using
@@ -1197,6 +1206,9 @@ static void dualshock4_parse_report(struct sony_sc *sc, u8 *rd, int size)
 	sc->battery_status = battery_status;
 	spin_unlock_irqrestore(&sc->lock, flags);
 
+	if (!touchpad)
+		return;
+
 	/*
 	 * The Dualshock 4 multi-touch trackpad data starts at offset 33 on USB
 	 * and 35 on Bluetooth.
@@ -1231,24 +1243,25 @@ static void dualshock4_parse_report(struct sony_sc *sc, u8 *rd, int size)
 			y = ((rd[offset+2] & 0xF0) >> 4) | (rd[offset+3] << 4);
 
 			active = !(rd[offset] >> 7);
-			input_mt_slot(sc->touchpad, n);
-			input_mt_report_slot_state(sc->touchpad, MT_TOOL_FINGER, active);
+			input_mt_slot(touchpad, n);
+			input_mt_report_slot_state(touchpad, MT_TOOL_FINGER, active);
 
 			if (active) {
-				input_report_abs(sc->touchpad, ABS_MT_POSITION_X, x);
-				input_report_abs(sc->touchpad, ABS_MT_POSITION_Y, y);
+				input_report_abs(touchpad, ABS_MT_POSITION_X, x);
+				input_report_abs(touchpad, ABS_MT_POSITION_Y, y);
 			}
 
 			offset += 4;
 		}
-		input_mt_sync_frame(sc->touchpad);
-		input_sync(sc->touchpad);
+		input_mt_sync_frame(touchpad);
+		input_sync(touchpad);
 	}
 }
 
 static void nsg_mrxu_parse_report(struct sony_sc *sc, u8 *rd, int size)
 {
 	int n, offset, relx, rely;
+	struct input_dev *touchpad;
 	u8 active;
 
 	/*
@@ -1271,7 +1284,13 @@ static void nsg_mrxu_parse_report(struct sony_sc *sc, u8 *rd, int size)
 	 */
 	offset = 1;
 
-	input_report_key(sc->touchpad, BTN_LEFT, rd[offset] & 0x0F);
+	rcu_read_lock();
+	touchpad = rcu_dereference(sc->touchpad);
+	rcu_read_unlock();
+	if (!touchpad)
+		return;
+
+	input_report_key(touchpad, BTN_LEFT, rd[offset] & 0x0F);
 	active = (rd[offset] >> 4);
 	relx = (s8) rd[offset+5];
 	rely = ((s8) rd[offset+10]) * -1;
@@ -1285,20 +1304,20 @@ static void nsg_mrxu_parse_report(struct sony_sc *sc, u8 *rd, int size)
 		x = rd[offset] | ((rd[offset+1] & 0x0F) << 8);
 		y = ((rd[offset+1] & 0xF0) >> 4) | (rd[offset+2] << 4);
 
-		input_mt_slot(sc->touchpad, n);
-		input_mt_report_slot_state(sc->touchpad, MT_TOOL_FINGER, active & 0x03);
+		input_mt_slot(touchpad, n);
+		input_mt_report_slot_state(touchpad, MT_TOOL_FINGER, active & 0x03);
 
 		if (active & 0x03) {
 			contactx = rd[offset+3] & 0x0F;
 			contacty = rd[offset+3] >> 4;
-			input_report_abs(sc->touchpad, ABS_MT_TOUCH_MAJOR,
+			input_report_abs(touchpad, ABS_MT_TOUCH_MAJOR,
 				max(contactx, contacty));
-			input_report_abs(sc->touchpad, ABS_MT_TOUCH_MINOR,
+			input_report_abs(touchpad, ABS_MT_TOUCH_MINOR,
 				min(contactx, contacty));
-			input_report_abs(sc->touchpad, ABS_MT_ORIENTATION,
+			input_report_abs(touchpad, ABS_MT_ORIENTATION,
 				(bool) (contactx > contacty));
-			input_report_abs(sc->touchpad, ABS_MT_POSITION_X, x);
-			input_report_abs(sc->touchpad, ABS_MT_POSITION_Y,
+			input_report_abs(touchpad, ABS_MT_POSITION_X, x);
+			input_report_abs(touchpad, ABS_MT_POSITION_Y,
 				NSG_MRXU_MAX_Y - y);
 			/*
 			 * The relative coordinates belong to the first touch
@@ -1306,8 +1325,8 @@ static void nsg_mrxu_parse_report(struct sony_sc *sc, u8 *rd, int size)
 			 * when the first is not active.
 			 */
 			if ((n == 0) || ((n == 1) && (active & 0x01))) {
-				input_report_rel(sc->touchpad, REL_X, relx);
-				input_report_rel(sc->touchpad, REL_Y, rely);
+				input_report_rel(touchpad, REL_X, relx);
+				input_report_rel(touchpad, REL_Y, rely);
 			}
 		}
 
@@ -1315,9 +1334,9 @@ static void nsg_mrxu_parse_report(struct sony_sc *sc, u8 *rd, int size)
 		active >>= 2;
 	}
 
-	input_mt_sync_frame(sc->touchpad);
+	input_mt_sync_frame(touchpad);
 
-	input_sync(sc->touchpad);
+	input_sync(touchpad);
 }
 
 static int sony_raw_event(struct hid_device *hdev, struct hid_report *report,
@@ -1496,19 +1515,20 @@ static int sony_register_touchpad(struct sony_sc *sc, int touch_count,
 	size_t name_sz;
 	char *name;
 	int ret;
+	struct input_dev *touchpad;
 
-	sc->touchpad = devm_input_allocate_device(&sc->hdev->dev);
-	if (!sc->touchpad)
+	touchpad = devm_input_allocate_device(&sc->hdev->dev);
+	if (!touchpad)
 		return -ENOMEM;
 
-	input_set_drvdata(sc->touchpad, sc);
-	sc->touchpad->dev.parent = &sc->hdev->dev;
-	sc->touchpad->phys = sc->hdev->phys;
-	sc->touchpad->uniq = sc->hdev->uniq;
-	sc->touchpad->id.bustype = sc->hdev->bus;
-	sc->touchpad->id.vendor = sc->hdev->vendor;
-	sc->touchpad->id.product = sc->hdev->product;
-	sc->touchpad->id.version = sc->hdev->version;
+	input_set_drvdata(touchpad, sc);
+	touchpad->dev.parent = &sc->hdev->dev;
+	touchpad->phys = sc->hdev->phys;
+	touchpad->uniq = sc->hdev->uniq;
+	touchpad->id.bustype = sc->hdev->bus;
+	touchpad->id.vendor = sc->hdev->vendor;
+	touchpad->id.product = sc->hdev->product;
+	touchpad->id.version = sc->hdev->version;
 
 	/* Append a suffix to the controller name as there are various
 	 * DS4 compatible non-Sony devices with different names.
@@ -1518,39 +1538,41 @@ static int sony_register_touchpad(struct sony_sc *sc, int touch_count,
 	if (!name)
 		return -ENOMEM;
 	snprintf(name, name_sz, "%s" DS4_TOUCHPAD_SUFFIX, sc->hdev->name);
-	sc->touchpad->name = name;
+	touchpad->name = name;
 
 	/* We map the button underneath the touchpad to BTN_LEFT. */
-	__set_bit(EV_KEY, sc->touchpad->evbit);
-	__set_bit(BTN_LEFT, sc->touchpad->keybit);
-	__set_bit(INPUT_PROP_BUTTONPAD, sc->touchpad->propbit);
+	__set_bit(EV_KEY, touchpad->evbit);
+	__set_bit(BTN_LEFT, touchpad->keybit);
+	__set_bit(INPUT_PROP_BUTTONPAD, touchpad->propbit);
 
-	input_set_abs_params(sc->touchpad, ABS_MT_POSITION_X, 0, w, 0, 0);
-	input_set_abs_params(sc->touchpad, ABS_MT_POSITION_Y, 0, h, 0, 0);
+	input_set_abs_params(touchpad, ABS_MT_POSITION_X, 0, w, 0, 0);
+	input_set_abs_params(touchpad, ABS_MT_POSITION_Y, 0, h, 0, 0);
 
 	if (touch_major > 0) {
-		input_set_abs_params(sc->touchpad, ABS_MT_TOUCH_MAJOR, 
+		input_set_abs_params(touchpad, ABS_MT_TOUCH_MAJOR, 
 			0, touch_major, 0, 0);
 		if (touch_minor > 0)
-			input_set_abs_params(sc->touchpad, ABS_MT_TOUCH_MINOR, 
+			input_set_abs_params(touchpad, ABS_MT_TOUCH_MINOR, 
 				0, touch_minor, 0, 0);
 		if (orientation > 0)
-			input_set_abs_params(sc->touchpad, ABS_MT_ORIENTATION, 
+			input_set_abs_params(touchpad, ABS_MT_ORIENTATION, 
 				0, orientation, 0, 0);
 	}
 
 	if (sc->quirks & NSG_MRXU_REMOTE) {
-		__set_bit(EV_REL, sc->touchpad->evbit);
+		__set_bit(EV_REL, touchpad->evbit);
 	}
 
-	ret = input_mt_init_slots(sc->touchpad, touch_count, INPUT_MT_POINTER);
+	ret = input_mt_init_slots(touchpad, touch_count, INPUT_MT_POINTER);
 	if (ret < 0)
 		return ret;
 
-	ret = input_register_device(sc->touchpad);
+	ret = input_register_device(touchpad);
 	if (ret < 0)
 		return ret;
 
+	rcu_assign_pointer(sc->touchpad, touchpad);
+
 	return 0;
 }
 
@@ -1627,6 +1649,48 @@ static int sony_register_sensors(struct sony_sc *sc)
 	return 0;
 }
 
+static void sony_unregister_touchpad(struct sony_sc *sc)
+{
+	struct input_dev *touchpad;
+
+	rcu_read_lock();
+	touchpad = rcu_dereference(sc->touchpad);
+	rcu_read_unlock();
+
+	if (!touchpad)
+		return;
+
+	RCU_INIT_POINTER(sc->touchpad, NULL);
+	synchronize_rcu();
+	input_unregister_device(touchpad);
+}
+
+static int sony_register_ds4_touchpad(struct sony_sc *sc)
+{
+	struct input_dev *touchpad;
+	int ret;
+
+	rcu_read_lock();
+	touchpad = rcu_dereference(sc->touchpad);
+	rcu_read_unlock();
+
+	if (touchpad)
+		return 0;
+
+	/*
+	 * The Dualshock 4 touchpad supports 2 touches and has a
+	 * resolution of 1920x942 (44.86 dots/mm).
+	 */
+	ret = sony_register_touchpad(sc, 2, 1920, 942, 0, 0, 0);
+	if (ret) {
+		hid_err(sc->hdev,
+		"Unable to initialize multi-touch slots: %d\n",
+		ret);
+	}
+
+	return ret;
+}
+
 /*
  * Sending HID_REQ_GET_REPORT changes the operation mode of the ps3 controller
  * to "operational".  Without this, the ps3 controller will not report any
@@ -2876,17 +2940,9 @@ static int sony_input_configured(struct hid_device *hdev,
 		}
 		sc->hw_version_created = true;
 
-		/*
-		 * The Dualshock 4 touchpad supports 2 touches and has a
-		 * resolution of 1920x942 (44.86 dots/mm).
-		 */
-		ret = sony_register_touchpad(sc, 2, 1920, 942, 0, 0, 0);
-		if (ret) {
-			hid_err(sc->hdev,
-			"Unable to initialize multi-touch slots: %d\n",
-			ret);
+		ret = sony_register_ds4_touchpad(sc);
+		if (ret)
 			goto err_stop;
-		}
 
 		ret = sony_register_sensors(sc);
 		if (ret) {
@@ -2996,6 +3052,7 @@ static int sony_probe(struct hid_device *hdev, const struct hid_device_id *id)
 	}
 
 	spin_lock_init(&sc->lock);
+	mutex_init(&sc->mutex);
 
 	sc->quirks = quirks;
 	hid_set_drvdata(hdev, sc);
-- 
2.36.0

