Return-Path: <linux-input+bounces-894-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A3BD381973B
	for <lists+linux-input@lfdr.de>; Wed, 20 Dec 2023 04:39:07 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id D63EEB23CD3
	for <lists+linux-input@lfdr.de>; Wed, 20 Dec 2023 03:39:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6BA12BE76;
	Wed, 20 Dec 2023 03:38:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=endrift.com header.i=@endrift.com header.b="K/xWmKdE"
X-Original-To: linux-input@vger.kernel.org
Received: from endrift.com (endrift.com [173.255.198.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F33D18F71
	for <linux-input@vger.kernel.org>; Wed, 20 Dec 2023 03:38:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=endrift.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=endrift.com
Received: from nebulosa.vulpes.eutheria.net (71-212-26-68.tukw.qwest.net [71.212.26.68])
	by endrift.com (Postfix) with ESMTPSA id 165E6A44F;
	Tue, 19 Dec 2023 19:38:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=endrift.com; s=2020;
	t=1703043532; bh=8bCOUzUrQg9elX2FEtn+dfNwylvEX/QEcxzQDCLy9YM=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=K/xWmKdEFtVq68G2Pa4O53H0lOsZ7P5KL7g9U3aNmjptqn3s39+oG7IsTN8vWvN3K
	 60MIjAt7kA/jKsD0uWZUIKV6OtYzo4pCW0w+rhzOBXRDKUuva5HdWVLTSXfsX151s2
	 UcxlPkmDT0XafHTMxIzZYsi8oRR2rMT33Nvi7hkhqEVS950B/7oely67rI0x7gP+ai
	 eUPARqodhqbNHVO6GPFowj/jj2HNJZ/hju0u+ja9rHADMn+aMw8g+6VcGEthFxQTsc
	 eFohiflUu42Jf6YFAkw6YSjvlTcLaWE4a375y1A/Mm1cj7Y9/aHmup3yUWW5rt8368
	 yDebWzDopSwvw==
From: Vicki Pfau <vi@endrift.com>
To: Jiri Kosina <jikos@kernel.org>,
	Benjamin Tissoires <benjamin.tissoires@redhat.com>,
	linux-input@vger.kernel.org
Cc: Vicki Pfau <vi@endrift.com>
Subject: [PATCH 7/7] HID: hid-steam: Add gamepad-only mode switched to by holding options
Date: Tue, 19 Dec 2023 19:38:37 -0800
Message-ID: <20231220033837.2135194-7-vi@endrift.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20231220033837.2135194-1-vi@endrift.com>
References: <20231220033609.2132033-1-vi@endrift.com>
 <20231220033837.2135194-1-vi@endrift.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This commit adds a hotkey to switch between "gamepad" mode (mouse and keyboard
disabled) and "desktop" mode (gamepad disabled) by holding down the options
button (mapped here as the start button). This mirrors the behavior of the
official Steam client.

This also adds and uses a function for generating haptic pulses, as Steam also
does when engaging this hotkey.

Signed-off-by: Vicki Pfau <vi@endrift.com>
---
 drivers/hid/hid-steam.c | 113 ++++++++++++++++++++++++++++++++++++----
 1 file changed, 103 insertions(+), 10 deletions(-)

diff --git a/drivers/hid/hid-steam.c b/drivers/hid/hid-steam.c
index a0ed8812e7ea..b3c4e50e248a 100644
--- a/drivers/hid/hid-steam.c
+++ b/drivers/hid/hid-steam.c
@@ -273,6 +273,11 @@ enum {
 	TRACKPAD_GESTURE_KEYBOARD,
 };
 
+/* Pad identifiers for the deck */
+#define STEAM_PAD_LEFT 0
+#define STEAM_PAD_RIGHT 1
+#define STEAM_PAD_BOTH 2
+
 /* Other random constants */
 #define STEAM_SERIAL_LEN 0x15
 
@@ -291,6 +296,9 @@ struct steam_device {
 	struct power_supply __rcu *battery;
 	u8 battery_charge;
 	u16 voltage;
+	struct delayed_work mode_switch;
+	bool did_mode_switch;
+	bool gamepad_mode;
 	struct work_struct rumble_work;
 	u16 rumble_left;
 	u16 rumble_right;
@@ -460,6 +468,37 @@ static inline int steam_request_conn_status(struct steam_device *steam)
 	return ret;
 }
 
+/*
+ * Send a haptic pulse to the trackpads
+ * Duration and interval are measured in microseconds, count is the number
+ * of pulses to send for duration time with interval microseconds between them
+ * and gain is measured in decibels, ranging from -24 to +6
+ */
+static inline int steam_haptic_pulse(struct steam_device *steam, u8 pad,
+				u16 duration, u16 interval, u16 count, u8 gain)
+{
+	int ret;
+	u8 report[10] = {ID_TRIGGER_HAPTIC_PULSE, 8};
+
+	/* Left and right are swapped on this report for legacy reasons */
+	if (pad < STEAM_PAD_BOTH)
+		pad ^= 1;
+
+	report[2] = pad;
+	report[3] = duration & 0xFF;
+	report[4] = duration >> 8;
+	report[5] = interval & 0xFF;
+	report[6] = interval >> 8;
+	report[7] = count & 0xFF;
+	report[8] = count >> 8;
+	report[9] = gain;
+
+	mutex_lock(&steam->report_mutex);
+	ret = steam_send_report(steam, report, sizeof(report));
+	mutex_unlock(&steam->report_mutex);
+	return ret;
+}
+
 static inline int steam_haptic_rumble(struct steam_device *steam,
 				u16 intensity, u16 left_speed, u16 right_speed,
 				u8 left_gain, u8 right_gain)
@@ -505,6 +544,9 @@ static int steam_play_effect(struct input_dev *dev, void *data,
 
 static void steam_set_lizard_mode(struct steam_device *steam, bool enable)
 {
+	if (steam->gamepad_mode)
+		enable = false;
+
 	if (enable) {
 		mutex_lock(&steam->report_mutex);
 		/* enable esc, enter, cursors */
@@ -542,11 +584,18 @@ static int steam_input_open(struct input_dev *dev)
 	unsigned long flags;
 	bool set_lizard_mode;
 
-	spin_lock_irqsave(&steam->lock, flags);
-	set_lizard_mode = !steam->client_opened && lizard_mode;
-	spin_unlock_irqrestore(&steam->lock, flags);
-	if (set_lizard_mode)
-		steam_set_lizard_mode(steam, false);
+	/*
+	 * Disabling lizard mode automatically is only done on the Steam
+	 * Controller. On the Steam Deck, this is toggled manually by holding
+	 * the options button instead, handled by steam_mode_switch_cb.
+	 */
+	if (!(steam->quirks & STEAM_QUIRK_DECK)) {
+		spin_lock_irqsave(&steam->lock, flags);
+		set_lizard_mode = !steam->client_opened && lizard_mode;
+		spin_unlock_irqrestore(&steam->lock, flags);
+		if (set_lizard_mode)
+			steam_set_lizard_mode(steam, false);
+	}
 
 	return 0;
 }
@@ -557,11 +606,13 @@ static void steam_input_close(struct input_dev *dev)
 	unsigned long flags;
 	bool set_lizard_mode;
 
-	spin_lock_irqsave(&steam->lock, flags);
-	set_lizard_mode = !steam->client_opened && lizard_mode;
-	spin_unlock_irqrestore(&steam->lock, flags);
-	if (set_lizard_mode)
-		steam_set_lizard_mode(steam, true);
+	if (!(steam->quirks & STEAM_QUIRK_DECK)) {
+		spin_lock_irqsave(&steam->lock, flags);
+		set_lizard_mode = !steam->client_opened && lizard_mode;
+		spin_unlock_irqrestore(&steam->lock, flags);
+		if (set_lizard_mode)
+			steam_set_lizard_mode(steam, true);
+	}
 }
 
 static enum power_supply_property steam_battery_props[] = {
@@ -886,6 +937,34 @@ static void steam_work_connect_cb(struct work_struct *work)
 	}
 }
 
+static void steam_mode_switch_cb(struct work_struct *work)
+{
+	struct steam_device *steam = container_of(to_delayed_work(work),
+							struct steam_device, mode_switch);
+	unsigned long flags;
+	bool client_opened;
+	steam->gamepad_mode = !steam->gamepad_mode;
+	if (!lizard_mode)
+		return;
+
+	if (steam->gamepad_mode)
+		steam_set_lizard_mode(steam, false);
+	else {
+		spin_lock_irqsave(&steam->lock, flags);
+		client_opened = steam->client_opened;
+		spin_unlock_irqrestore(&steam->lock, flags);
+		if (!client_opened)
+			steam_set_lizard_mode(steam, lizard_mode);
+	}
+
+	steam_haptic_pulse(steam, STEAM_PAD_RIGHT, 0x190, 0, 1, 0);
+	if (steam->gamepad_mode) {
+		steam_haptic_pulse(steam, STEAM_PAD_LEFT, 0x14D, 0x14D, 0x2D, 0);
+	} else {
+		steam_haptic_pulse(steam, STEAM_PAD_LEFT, 0x1F4, 0x1F4, 0x1E, 0);
+	}
+}
+
 static bool steam_is_valve_interface(struct hid_device *hdev)
 {
 	struct hid_report_enum *rep_enum;
@@ -1040,6 +1119,7 @@ static int steam_probe(struct hid_device *hdev,
 	mutex_init(&steam->report_mutex);
 	steam->quirks = id->driver_data;
 	INIT_WORK(&steam->work_connect, steam_work_connect_cb);
+	INIT_DELAYED_WORK(&steam->mode_switch, steam_mode_switch_cb);
 	INIT_LIST_HEAD(&steam->list);
 	INIT_WORK(&steam->rumble_work, steam_haptic_rumble_cb);
 
@@ -1097,6 +1177,7 @@ static int steam_probe(struct hid_device *hdev,
 hid_hw_open_fail:
 hid_hw_start_fail:
 	cancel_work_sync(&steam->work_connect);
+	cancel_delayed_work_sync(&steam->mode_switch);
 	cancel_work_sync(&steam->rumble_work);
 steam_alloc_fail:
 	hid_err(hdev, "%s: failed with error %d\n",
@@ -1113,6 +1194,7 @@ static void steam_remove(struct hid_device *hdev)
 		return;
 	}
 
+	cancel_delayed_work_sync(&steam->mode_switch);
 	cancel_work_sync(&steam->work_connect);
 	hid_destroy_device(steam->client_hdev);
 	steam->client_hdev = NULL;
@@ -1398,6 +1480,17 @@ static void steam_do_deck_input_event(struct steam_device *steam,
 	b13 = data[13];
 	b14 = data[14];
 
+	if (!(b9 & BIT(6)) && steam->did_mode_switch) {
+		steam->did_mode_switch = false;
+		cancel_delayed_work_sync(&steam->mode_switch);
+	} else if (!steam->client_opened && (b9 & BIT(6)) && !steam->did_mode_switch) {
+		steam->did_mode_switch = true;
+		schedule_delayed_work(&steam->mode_switch, 45 * HZ / 100);
+	}
+
+	if (!steam->gamepad_mode)
+		return;
+
 	lpad_touched = b10 & BIT(3);
 	rpad_touched = b10 & BIT(4);
 
-- 
2.42.0


