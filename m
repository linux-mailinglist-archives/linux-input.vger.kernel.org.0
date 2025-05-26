Return-Path: <linux-input+bounces-12574-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 70137AC3F92
	for <lists+linux-input@lfdr.de>; Mon, 26 May 2025 14:53:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 64BBF16A644
	for <lists+linux-input@lfdr.de>; Mon, 26 May 2025 12:52:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EC17020C000;
	Mon, 26 May 2025 12:51:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="FDNtQJF6"
X-Original-To: linux-input@vger.kernel.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 73CC9207A18;
	Mon, 26 May 2025 12:51:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748263918; cv=none; b=glCxKxNTbgsrYjvfj9J8TK6bMNENROFhqJSKDrzVqr5MUkwPJsp+Hj8eLdOhjMxMj8bDoGb2AXC7D5qyjiaWa7yiFEUBwbkBfSOxr2CfSSp8msQDtrHeTlwBl3x6LPIS84k8R1BYqYhVhhmf5mUkph1OTnFZn2ftLSDVY3L9hyU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748263918; c=relaxed/simple;
	bh=D6Zh6qwiZnu0F8NoTTUTar7/LLtI4Sj3UCd8uQ5ovw8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=HeXlPgXCsS01EUoXyLRMvGi+2WwOiJG4AeyDkRyNbdtZPsvZzKn6p4LP/rFUmMv1+Tx3H+9HAHd/GbwISCHU5pf8AJRlmRsm5WpvLPpjoIL5J+bOc3Rd8bjevBFcbB0K7RDa/937bBRmmqRi1OX+83yCA8dM5z3OBF6UQte9CDw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=FDNtQJF6; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1748263914;
	bh=D6Zh6qwiZnu0F8NoTTUTar7/LLtI4Sj3UCd8uQ5ovw8=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=FDNtQJF6vuIXhOmgy3lueQ1fgUuqEoP80bVqvq+Dmgy219LDVzDaQM+4Sf1C3kGr+
	 0Btr66Xv7W3OndUc/kQHeTQV+b0ZlCBq6ZcWuwyZItLKyYF9/w6fCrUvCgUPNa4yOC
	 l7iJSAyO3Bt8GTDTrrZRNlVEuwREK9p0KRDCQQ34yPfYeL/hfJiJK0oriXawpppi8w
	 tPRRqBX3qmj3E0psEPxa1RQRSy3AsHUWnQ2FmEB2qEN23/kcCAzFNm/ObWWY73iUfx
	 kjgfy1sYV9Qd4qKyEdCEWUh63Tg2YiVdyCU5sZbg9lka9Pj/koVgnupDgmKMztr+rV
	 O2JqS98oqCcLA==
Received: from localhost (unknown [82.76.59.134])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: cristicc)
	by bali.collaboradmins.com (Postfix) with UTF8SMTPSA id 783F617E36AC;
	Mon, 26 May 2025 14:51:54 +0200 (CEST)
From: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
Date: Mon, 26 May 2025 15:51:26 +0300
Subject: [PATCH 03/11] HID: playstation: Simplify locking with guard() and
 scoped_guard()
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250526-dualsense-hid-jack-v1-3-a65fee4a60cc@collabora.com>
References: <20250526-dualsense-hid-jack-v1-0-a65fee4a60cc@collabora.com>
In-Reply-To: <20250526-dualsense-hid-jack-v1-0-a65fee4a60cc@collabora.com>
To: Roderick Colenbrander <roderick.colenbrander@sony.com>, 
 Jiri Kosina <jikos@kernel.org>, Benjamin Tissoires <bentiss@kernel.org>, 
 Henrik Rydberg <rydberg@bitmath.org>
Cc: kernel@collabora.com, linux-input@vger.kernel.org, 
 linux-kernel@vger.kernel.org
X-Mailer: b4 0.14.2

Use guard() and scoped_guard() infrastructure instead of explicitly
acquiring and releasing spinlocks and mutexes to simplify the code and
ensure that all locks are released properly.

Signed-off-by: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
---
 drivers/hid/hid-playstation.c | 216 ++++++++++++++++++------------------------
 1 file changed, 93 insertions(+), 123 deletions(-)

diff --git a/drivers/hid/hid-playstation.c b/drivers/hid/hid-playstation.c
index a82174a21dcce6523a69a8ec374a72504614cedc..16c576cc74284cc680cc7fc17e1bbe6bbcf84177 100644
--- a/drivers/hid/hid-playstation.c
+++ b/drivers/hid/hid-playstation.c
@@ -7,6 +7,7 @@
 
 #include <linux/bitfield.h>
 #include <linux/bits.h>
+#include <linux/cleanup.h>
 #include <linux/crc32.h>
 #include <linux/device.h>
 #include <linux/hid.h>
@@ -567,26 +568,25 @@ static int ps_devices_list_add(struct ps_device *dev)
 {
 	struct ps_device *entry;
 
-	mutex_lock(&ps_devices_lock);
+	guard(mutex)(&ps_devices_lock);
+
 	list_for_each_entry(entry, &ps_devices_list, list) {
 		if (!memcmp(entry->mac_address, dev->mac_address, sizeof(dev->mac_address))) {
 			hid_err(dev->hdev, "Duplicate device found for MAC address %pMR.\n",
 					dev->mac_address);
-			mutex_unlock(&ps_devices_lock);
 			return -EEXIST;
 		}
 	}
 
 	list_add_tail(&dev->list, &ps_devices_list);
-	mutex_unlock(&ps_devices_lock);
 	return 0;
 }
 
 static int ps_devices_list_remove(struct ps_device *dev)
 {
-	mutex_lock(&ps_devices_lock);
+	guard(mutex)(&ps_devices_lock);
+
 	list_del(&dev->list);
-	mutex_unlock(&ps_devices_lock);
 	return 0;
 }
 
@@ -650,13 +650,12 @@ static int ps_battery_get_property(struct power_supply *psy,
 	struct ps_device *dev = power_supply_get_drvdata(psy);
 	uint8_t battery_capacity;
 	int battery_status;
-	unsigned long flags;
 	int ret = 0;
 
-	spin_lock_irqsave(&dev->lock, flags);
-	battery_capacity = dev->battery_capacity;
-	battery_status = dev->battery_status;
-	spin_unlock_irqrestore(&dev->lock, flags);
+	scoped_guard(spinlock_irqsave, &dev->lock) {
+		battery_capacity = dev->battery_capacity;
+		battery_status = dev->battery_status;
+	}
 
 	switch (psp) {
 	case POWER_SUPPLY_PROP_STATUS:
@@ -1174,19 +1173,17 @@ static int dualsense_player_led_set_brightness(struct led_classdev *led, enum le
 {
 	struct hid_device *hdev = to_hid_device(led->dev->parent);
 	struct dualsense *ds = hid_get_drvdata(hdev);
-	unsigned long flags;
 	unsigned int led_index;
 
-	spin_lock_irqsave(&ds->base.lock, flags);
-
-	led_index = led - ds->player_leds;
-	if (value == LED_OFF)
-		ds->player_leds_state &= ~BIT(led_index);
-	else
-		ds->player_leds_state |= BIT(led_index);
+	scoped_guard(spinlock_irqsave, &ds->base.lock) {
+		led_index = led - ds->player_leds;
+		if (value == LED_OFF)
+			ds->player_leds_state &= ~BIT(led_index);
+		else
+			ds->player_leds_state |= BIT(led_index);
 
-	ds->update_player_leds = true;
-	spin_unlock_irqrestore(&ds->base.lock, flags);
+		ds->update_player_leds = true;
+	}
 
 	dualsense_schedule_work(ds);
 
@@ -1235,12 +1232,9 @@ static void dualsense_init_output_report(struct dualsense *ds, struct dualsense_
 
 static inline void dualsense_schedule_work(struct dualsense *ds)
 {
-	unsigned long flags;
-
-	spin_lock_irqsave(&ds->base.lock, flags);
+	guard(spinlock_irqsave)(&ds->base.lock);
 	if (ds->output_worker_initialized)
 		schedule_work(&ds->output_worker);
-	spin_unlock_irqrestore(&ds->base.lock, flags);
 }
 
 /*
@@ -1338,7 +1332,6 @@ static int dualsense_parse_report(struct ps_device *ps_dev, struct hid_report *r
 	int battery_status;
 	uint32_t sensor_timestamp;
 	bool btn_mic_state;
-	unsigned long flags;
 	int i;
 
 	/*
@@ -1400,10 +1393,10 @@ static int dualsense_parse_report(struct ps_device *ps_dev, struct hid_report *r
 	 */
 	btn_mic_state = !!(ds_report->buttons[2] & DS_BUTTONS2_MIC_MUTE);
 	if (btn_mic_state && !ds->last_btn_mic_state) {
-		spin_lock_irqsave(&ps_dev->lock, flags);
-		ds->update_mic_mute = true;
-		ds->mic_muted = !ds->mic_muted; /* toggle */
-		spin_unlock_irqrestore(&ps_dev->lock, flags);
+		scoped_guard(spinlock_irqsave, &ps_dev->lock) {
+			ds->update_mic_mute = true;
+			ds->mic_muted = !ds->mic_muted; /* toggle */
+		}
 
 		/* Schedule updating of microphone state at hardware level. */
 		dualsense_schedule_work(ds);
@@ -1496,10 +1489,10 @@ static int dualsense_parse_report(struct ps_device *ps_dev, struct hid_report *r
 		battery_status = POWER_SUPPLY_STATUS_UNKNOWN;
 	}
 
-	spin_lock_irqsave(&ps_dev->lock, flags);
-	ps_dev->battery_capacity = battery_capacity;
-	ps_dev->battery_status = battery_status;
-	spin_unlock_irqrestore(&ps_dev->lock, flags);
+	scoped_guard(spinlock_irqsave, &ps_dev->lock) {
+		ps_dev->battery_capacity = battery_capacity;
+		ps_dev->battery_status = battery_status;
+	}
 
 	return 0;
 }
@@ -1508,16 +1501,15 @@ static int dualsense_play_effect(struct input_dev *dev, void *data, struct ff_ef
 {
 	struct hid_device *hdev = input_get_drvdata(dev);
 	struct dualsense *ds = hid_get_drvdata(hdev);
-	unsigned long flags;
 
 	if (effect->type != FF_RUMBLE)
 		return 0;
 
-	spin_lock_irqsave(&ds->base.lock, flags);
-	ds->update_rumble = true;
-	ds->motor_left = effect->u.rumble.strong_magnitude / 256;
-	ds->motor_right = effect->u.rumble.weak_magnitude / 256;
-	spin_unlock_irqrestore(&ds->base.lock, flags);
+	scoped_guard(spinlock_irqsave, &ds->base.lock) {
+		ds->update_rumble = true;
+		ds->motor_left = effect->u.rumble.strong_magnitude / 256;
+		ds->motor_right = effect->u.rumble.weak_magnitude / 256;
+	}
 
 	dualsense_schedule_work(ds);
 	return 0;
@@ -1526,11 +1518,9 @@ static int dualsense_play_effect(struct input_dev *dev, void *data, struct ff_ef
 static void dualsense_remove(struct ps_device *ps_dev)
 {
 	struct dualsense *ds = container_of(ps_dev, struct dualsense, base);
-	unsigned long flags;
 
-	spin_lock_irqsave(&ds->base.lock, flags);
-	ds->output_worker_initialized = false;
-	spin_unlock_irqrestore(&ds->base.lock, flags);
+	scoped_guard(spinlock_irqsave, &ds->base.lock)
+		ds->output_worker_initialized = false;
 
 	cancel_work_sync(&ds->output_worker);
 }
@@ -1562,14 +1552,12 @@ static int dualsense_reset_leds(struct dualsense *ds)
 
 static void dualsense_set_lightbar(struct dualsense *ds, uint8_t red, uint8_t green, uint8_t blue)
 {
-	unsigned long flags;
-
-	spin_lock_irqsave(&ds->base.lock, flags);
-	ds->update_lightbar = true;
-	ds->lightbar_red = red;
-	ds->lightbar_green = green;
-	ds->lightbar_blue = blue;
-	spin_unlock_irqrestore(&ds->base.lock, flags);
+	scoped_guard(spinlock_irqsave, &ds->base.lock) {
+		ds->update_lightbar = true;
+		ds->lightbar_red = red;
+		ds->lightbar_green = green;
+		ds->lightbar_blue = blue;
+	}
 
 	dualsense_schedule_work(ds);
 }
@@ -1756,7 +1744,6 @@ static struct ps_device *dualsense_create(struct hid_device *hdev)
 static void dualshock4_dongle_calibration_work(struct work_struct *work)
 {
 	struct dualshock4 *ds4 = container_of(work, struct dualshock4, dongle_hotplug_worker);
-	unsigned long flags;
 	enum dualshock4_dongle_state dongle_state;
 	int ret;
 
@@ -1775,9 +1762,8 @@ static void dualshock4_dongle_calibration_work(struct work_struct *work)
 		dongle_state = DONGLE_CONNECTED;
 	}
 
-	spin_lock_irqsave(&ds4->base.lock, flags);
-	ds4->dongle_state = dongle_state;
-	spin_unlock_irqrestore(&ds4->base.lock, flags);
+	scoped_guard(spinlock_irqsave, &ds4->base.lock)
+		ds4->dongle_state = dongle_state;
 }
 
 static int dualshock4_get_calibration_data(struct dualshock4 *ds4)
@@ -2049,26 +2035,23 @@ static int dualshock4_led_set_blink(struct led_classdev *led, unsigned long *del
 {
 	struct hid_device *hdev = to_hid_device(led->dev->parent);
 	struct dualshock4 *ds4 = hid_get_drvdata(hdev);
-	unsigned long flags;
 
-	spin_lock_irqsave(&ds4->base.lock, flags);
+	scoped_guard(spinlock_irqsave, &ds4->base.lock) {
+		if (!*delay_on && !*delay_off) {
+			/* Default to 1 Hz (50 centiseconds on, 50 centiseconds off). */
+			ds4->lightbar_blink_on = 50;
+			ds4->lightbar_blink_off = 50;
+		} else {
+			/* Blink delays in centiseconds. */
+			ds4->lightbar_blink_on = min_t(unsigned long, *delay_on / 10,
+						       DS4_LIGHTBAR_MAX_BLINK);
+			ds4->lightbar_blink_off = min_t(unsigned long, *delay_off / 10,
+							DS4_LIGHTBAR_MAX_BLINK);
+		}
 
-	if (!*delay_on && !*delay_off) {
-		/* Default to 1 Hz (50 centiseconds on, 50 centiseconds off). */
-		ds4->lightbar_blink_on = 50;
-		ds4->lightbar_blink_off = 50;
-	} else {
-		/* Blink delays in centiseconds. */
-		ds4->lightbar_blink_on = min_t(unsigned long, *delay_on / 10,
-					       DS4_LIGHTBAR_MAX_BLINK);
-		ds4->lightbar_blink_off = min_t(unsigned long, *delay_off / 10,
-						DS4_LIGHTBAR_MAX_BLINK);
+		ds4->update_lightbar_blink = true;
 	}
 
-	ds4->update_lightbar_blink = true;
-
-	spin_unlock_irqrestore(&ds4->base.lock, flags);
-
 	dualshock4_schedule_work(ds4);
 
 	/* Report scaled values back to LED subsystem */
@@ -2082,36 +2065,33 @@ static int dualshock4_led_set_brightness(struct led_classdev *led, enum led_brig
 {
 	struct hid_device *hdev = to_hid_device(led->dev->parent);
 	struct dualshock4 *ds4 = hid_get_drvdata(hdev);
-	unsigned long flags;
 	unsigned int led_index;
 
-	spin_lock_irqsave(&ds4->base.lock, flags);
-
-	led_index = led - ds4->lightbar_leds;
-	switch (led_index) {
-	case 0:
-		ds4->lightbar_red = value;
-		break;
-	case 1:
-		ds4->lightbar_green = value;
-		break;
-	case 2:
-		ds4->lightbar_blue = value;
-		break;
-	case 3:
-		ds4->lightbar_enabled = !!value;
-
-		/* brightness = 0 also cancels blinking in Linux. */
-		if (!ds4->lightbar_enabled) {
-			ds4->lightbar_blink_off = 0;
-			ds4->lightbar_blink_on = 0;
-			ds4->update_lightbar_blink = true;
+	scoped_guard(spinlock_irqsave, &ds4->base.lock) {
+		led_index = led - ds4->lightbar_leds;
+		switch (led_index) {
+		case 0:
+			ds4->lightbar_red = value;
+			break;
+		case 1:
+			ds4->lightbar_green = value;
+			break;
+		case 2:
+			ds4->lightbar_blue = value;
+			break;
+		case 3:
+			ds4->lightbar_enabled = !!value;
+
+			/* brightness = 0 also cancels blinking in Linux. */
+			if (!ds4->lightbar_enabled) {
+				ds4->lightbar_blink_off = 0;
+				ds4->lightbar_blink_on = 0;
+				ds4->update_lightbar_blink = true;
+			}
 		}
-	}
-
-	ds4->update_lightbar = true;
 
-	spin_unlock_irqrestore(&ds4->base.lock, flags);
+		ds4->update_lightbar = true;
+	}
 
 	dualshock4_schedule_work(ds4);
 
@@ -2243,7 +2223,6 @@ static int dualshock4_parse_report(struct ps_device *ps_dev, struct hid_report *
 	uint8_t battery_capacity, num_touch_reports, value;
 	int battery_status, i, j;
 	uint16_t sensor_timestamp;
-	unsigned long flags;
 	bool is_minimal = false;
 
 	/*
@@ -2421,10 +2400,10 @@ static int dualshock4_parse_report(struct ps_device *ps_dev, struct hid_report *
 		battery_status = POWER_SUPPLY_STATUS_DISCHARGING;
 	}
 
-	spin_lock_irqsave(&ps_dev->lock, flags);
-	ps_dev->battery_capacity = battery_capacity;
-	ps_dev->battery_status = battery_status;
-	spin_unlock_irqrestore(&ps_dev->lock, flags);
+	scoped_guard(spinlock_irqsave, &ps_dev->lock) {
+		ps_dev->battery_capacity = battery_capacity;
+		ps_dev->battery_status = battery_status;
+	}
 
 	return 0;
 }
@@ -2442,7 +2421,6 @@ static int dualshock4_dongle_parse_report(struct ps_device *ps_dev, struct hid_r
 	 */
 	if (data[0] == DS4_INPUT_REPORT_USB && size == DS4_INPUT_REPORT_USB_SIZE) {
 		struct dualshock4_input_report_common *ds4_report = (struct dualshock4_input_report_common *)&data[1];
-		unsigned long flags;
 
 		connected = ds4_report->status[1] & DS4_STATUS1_DONGLE_STATE ? false : true;
 
@@ -2451,9 +2429,8 @@ static int dualshock4_dongle_parse_report(struct ps_device *ps_dev, struct hid_r
 
 			dualshock4_set_default_lightbar_colors(ds4);
 
-			spin_lock_irqsave(&ps_dev->lock, flags);
-			ds4->dongle_state = DONGLE_CALIBRATING;
-			spin_unlock_irqrestore(&ps_dev->lock, flags);
+			scoped_guard(spinlock_irqsave, &ps_dev->lock)
+				ds4->dongle_state = DONGLE_CALIBRATING;
 
 			schedule_work(&ds4->dongle_hotplug_worker);
 
@@ -2465,9 +2442,8 @@ static int dualshock4_dongle_parse_report(struct ps_device *ps_dev, struct hid_r
 			    ds4->dongle_state == DONGLE_DISABLED) && !connected) {
 			hid_info(ps_dev->hdev, "DualShock 4 USB dongle: controller disconnected\n");
 
-			spin_lock_irqsave(&ps_dev->lock, flags);
-			ds4->dongle_state = DONGLE_DISCONNECTED;
-			spin_unlock_irqrestore(&ps_dev->lock, flags);
+			scoped_guard(spinlock_irqsave, &ps_dev->lock)
+				ds4->dongle_state = DONGLE_DISCONNECTED;
 
 			/* Return 0, so hidraw can get the report. */
 			return 0;
@@ -2489,16 +2465,15 @@ static int dualshock4_play_effect(struct input_dev *dev, void *data, struct ff_e
 {
 	struct hid_device *hdev = input_get_drvdata(dev);
 	struct dualshock4 *ds4 = hid_get_drvdata(hdev);
-	unsigned long flags;
 
 	if (effect->type != FF_RUMBLE)
 		return 0;
 
-	spin_lock_irqsave(&ds4->base.lock, flags);
-	ds4->update_rumble = true;
-	ds4->motor_left = effect->u.rumble.strong_magnitude / 256;
-	ds4->motor_right = effect->u.rumble.weak_magnitude / 256;
-	spin_unlock_irqrestore(&ds4->base.lock, flags);
+	scoped_guard(spinlock_irqsave, &ds4->base.lock) {
+		ds4->update_rumble = true;
+		ds4->motor_left = effect->u.rumble.strong_magnitude / 256;
+		ds4->motor_right = effect->u.rumble.weak_magnitude / 256;
+	}
 
 	dualshock4_schedule_work(ds4);
 	return 0;
@@ -2507,11 +2482,9 @@ static int dualshock4_play_effect(struct input_dev *dev, void *data, struct ff_e
 static void dualshock4_remove(struct ps_device *ps_dev)
 {
 	struct dualshock4 *ds4 = container_of(ps_dev, struct dualshock4, base);
-	unsigned long flags;
 
-	spin_lock_irqsave(&ds4->base.lock, flags);
-	ds4->output_worker_initialized = false;
-	spin_unlock_irqrestore(&ds4->base.lock, flags);
+	scoped_guard(spinlock_irqsave, &ds4->base.lock)
+		ds4->output_worker_initialized = false;
 
 	cancel_work_sync(&ds4->output_worker);
 
@@ -2521,12 +2494,9 @@ static void dualshock4_remove(struct ps_device *ps_dev)
 
 static inline void dualshock4_schedule_work(struct dualshock4 *ds4)
 {
-	unsigned long flags;
-
-	spin_lock_irqsave(&ds4->base.lock, flags);
+	guard(spinlock_irqsave)(&ds4->base.lock);
 	if (ds4->output_worker_initialized)
 		schedule_work(&ds4->output_worker);
-	spin_unlock_irqrestore(&ds4->base.lock, flags);
 }
 
 static void dualshock4_set_bt_poll_interval(struct dualshock4 *ds4, uint8_t interval)

-- 
2.49.0


