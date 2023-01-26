Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C8A3267C2FE
	for <lists+linux-input@lfdr.de>; Thu, 26 Jan 2023 04:01:50 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229458AbjAZDBt (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 25 Jan 2023 22:01:49 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41134 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234493AbjAZDBs (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Wed, 25 Jan 2023 22:01:48 -0500
Received: from endrift.com (endrift.com [173.255.198.10])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3C7C0646B7
        for <linux-input@vger.kernel.org>; Wed, 25 Jan 2023 19:01:46 -0800 (PST)
Received: from nebulosa.vulpes.eutheria.net (unknown [50.47.218.115])
        by endrift.com (Postfix) with ESMTPSA id 253F6A2AE;
        Wed, 25 Jan 2023 19:01:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=endrift.com; s=2020;
        t=1674702105; bh=2hobGEuOnBd7bO8oQdHKENEEVLZhsXdvXPSyjnIVj7I=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=NQ5tRGsorQG+oOsLjFSKBErUH8T47pWWds8i57Kmsyfr6SdUMTJpFQBI25/iy+2Wc
         XfobWU9uz/24LLP9g6sAtc8lP0Nk/G4K/eCtragAVmeDVJnVnh5p1CY+fzH5LB70PX
         4uFxdqd+C+Y4pHM11Gouo4eJC1wBziH82Nbqt+m/zO9wQdqN+nt3sb74R1NAd8J0af
         HC7iRqywu0D1+qi7QIq1TH7E28sdHNwwJtrhMuYrLfA5jBrxR/2l6FaZ9TQdZB+MCf
         m9B1ls7YdsOfdbEKcqSFiefwztHwDbin0xC5BhJZuqeZJlmLgAt7qTr6avi5FsEd6+
         IiAQDr25b3VKA==
From:   Vicki Pfau <vi@endrift.com>
To:     Jiri Kosina <jikos@kernel.org>,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>,
        Lyude Paul <lyude@redhat.com>, linux-input@vger.kernel.org
Cc:     Vicki Pfau <vi@endrift.com>
Subject: [PATCH v2 1/2] HID: hid-steam: Add Steam Deck support
Date:   Wed, 25 Jan 2023 19:01:25 -0800
Message-Id: <20230126030126.895670-2-vi@endrift.com>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230111012336.2915827-2-vi@endrift.com>
References: <20230111012336.2915827-2-vi@endrift.com>
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

Add preliminary support for the Steam Deck's controller interface. Currently,
this only supports the controller inputs and toggling lizard mode (Valve's name
for a hardware kb/m emulation mode). It does not support any of the advanced
features, such as the motion sensors or force-feedback.

The Steam Deck also includes a heartbeat for lizard mode that switches it back
on if no reports have been received within a few milliseconds. The official
Steam client handles this by sending a handful of configuration reports every
few ms, so we copy this behavior by sending configuration reports to disable
the mouse and reset the digital mappings every 5ms. As this isn't needed for
the older Steam Controller, this is only done on the Steam Deck.

Signed-off-by: Vicki Pfau <vi@endrift.com>
Reviewed-by: Lyude Paul <lyude@redhat.com>
---
 drivers/hid/Kconfig     |   4 +-
 drivers/hid/hid-ids.h   |   1 +
 drivers/hid/hid-steam.c | 329 ++++++++++++++++++++++++++++++++++++----
 3 files changed, 306 insertions(+), 28 deletions(-)

diff --git a/drivers/hid/Kconfig b/drivers/hid/Kconfig
index e2a5d30c8895..20402d0a7eab 100644
--- a/drivers/hid/Kconfig
+++ b/drivers/hid/Kconfig
@@ -1018,10 +1018,10 @@ config HID_SPEEDLINK
 	Support for Speedlink Vicious and Divine Cezanne mouse.
 
 config HID_STEAM
-	tristate "Steam Controller support"
+	tristate "Steam Controller/Deck support"
 	select POWER_SUPPLY
 	help
-	Say Y here if you have a Steam Controller if you want to use it
+	Say Y here if you have a Steam Controller or Deck if you want to use it
 	without running the Steam Client. It supports both the wired and
 	the wireless adaptor.
 
diff --git a/drivers/hid/hid-ids.h b/drivers/hid/hid-ids.h
index 82713ef3aaa6..33269113acc7 100644
--- a/drivers/hid/hid-ids.h
+++ b/drivers/hid/hid-ids.h
@@ -1183,6 +1183,7 @@
 #define USB_VENDOR_ID_VALVE			0x28de
 #define USB_DEVICE_ID_STEAM_CONTROLLER		0x1102
 #define USB_DEVICE_ID_STEAM_CONTROLLER_WIRELESS	0x1142
+#define USB_DEVICE_ID_STEAM_DECK	0x1205
 
 #define USB_VENDOR_ID_STEELSERIES	0x1038
 #define USB_DEVICE_ID_STEELSERIES_SRWS1	0x1410
diff --git a/drivers/hid/hid-steam.c b/drivers/hid/hid-steam.c
index 8ee43cb225fc..09330d9bfee3 100644
--- a/drivers/hid/hid-steam.c
+++ b/drivers/hid/hid-steam.c
@@ -3,6 +3,7 @@
  * HID driver for Valve Steam Controller
  *
  * Copyright (c) 2018 Rodrigo Rivas Costa <rodrigorivascosta@gmail.com>
+ * Copyright (c) 2022 Valve Software
  *
  * Supports both the wired and wireless interfaces.
  *
@@ -53,6 +54,7 @@ static DEFINE_MUTEX(steam_devices_lock);
 static LIST_HEAD(steam_devices);
 
 #define STEAM_QUIRK_WIRELESS		BIT(0)
+#define STEAM_QUIRK_DECK		BIT(1)
 
 /* Touch pads are 40 mm in diameter and 65535 units */
 #define STEAM_PAD_RESOLUTION 1638
@@ -60,6 +62,10 @@ static LIST_HEAD(steam_devices);
 #define STEAM_TRIGGER_RESOLUTION 51
 /* Joystick runs are about 5 mm and 256 units */
 #define STEAM_JOYSTICK_RESOLUTION 51
+/* Trigger runs are about 6 mm and 32768 units */
+#define STEAM_DECK_TRIGGER_RESOLUTION 5461
+/* Joystick runs are about 5 mm and 32768 units */
+#define STEAM_DECK_JOYSTICK_RESOLUTION 6553
 
 #define STEAM_PAD_FUZZ 256
 
@@ -92,11 +98,14 @@ static LIST_HEAD(steam_devices);
 #define STEAM_REG_RPAD_MARGIN		0x18
 #define STEAM_REG_LED			0x2d
 #define STEAM_REG_GYRO_MODE		0x30
+#define STEAM_REG_LPAD_CLICK_PRESSURE	0x34
+#define STEAM_REG_RPAD_CLICK_PRESSURE	0x35
 
 /* Raw event identifiers */
 #define STEAM_EV_INPUT_DATA		0x01
 #define STEAM_EV_CONNECT		0x03
 #define STEAM_EV_BATTERY		0x04
+#define STEAM_EV_DECK_INPUT_DATA	0x09
 
 /* Values for GYRO_MODE (bitmask) */
 #define STEAM_GYRO_MODE_OFF		0x0000
@@ -124,6 +133,7 @@ struct steam_device {
 	struct power_supply __rcu *battery;
 	u8 battery_charge;
 	u16 voltage;
+	struct delayed_work heartbeat;
 };
 
 static int steam_recv_report(struct steam_device *steam,
@@ -193,7 +203,7 @@ static int steam_send_report(struct steam_device *steam,
 	 */
 	do {
 		ret = hid_hw_raw_request(steam->hdev, 0,
-				buf, size + 1,
+				buf, max(size, 64) + 1,
 				HID_FEATURE_REPORT, HID_REQ_SET_REPORT);
 		if (ret != -EPIPE)
 			break;
@@ -219,6 +229,7 @@ static int steam_write_registers(struct steam_device *steam,
 	u8 reg;
 	u16 val;
 	u8 cmd[64] = {STEAM_CMD_WRITE_REGISTER, 0x00};
+	int ret;
 	va_list args;
 
 	va_start(args, steam);
@@ -234,7 +245,16 @@ static int steam_write_registers(struct steam_device *steam,
 	}
 	va_end(args);
 
-	return steam_send_report(steam, cmd, 2 + cmd[1]);
+	ret = steam_send_report(steam, cmd, 2 + cmd[1]);
+	if (ret < 0)
+		return ret;
+
+	/*
+	 * Sometimes a lingering report for this command can
+	 * get read back instead of the last set report if
+	 * this isn't explicitly queried
+	 */
+	return steam_recv_report(steam, cmd, 2 + cmd[1]);
 }
 
 static int steam_get_serial(struct steam_device *steam)
@@ -280,13 +300,33 @@ static void steam_set_lizard_mode(struct steam_device *steam, bool enable)
 		steam_write_registers(steam,
 			STEAM_REG_RPAD_MARGIN, 0x01, /* enable margin */
 			0);
+
+		cancel_delayed_work_sync(&steam->heartbeat);
 	} else {
 		/* disable esc, enter, cursor */
 		steam_send_report_byte(steam, STEAM_CMD_CLEAR_MAPPINGS);
-		steam_write_registers(steam,
-			STEAM_REG_RPAD_MODE, 0x07, /* disable mouse */
-			STEAM_REG_RPAD_MARGIN, 0x00, /* disable margin */
-			0);
+
+		if (steam->quirks & STEAM_QUIRK_DECK) {
+			steam_write_registers(steam,
+				STEAM_REG_RPAD_MARGIN, 0x00, /* disable margin */
+				STEAM_REG_LPAD_MODE, 0x07, /* disable mouse */
+				STEAM_REG_RPAD_MODE, 0x07, /* disable mouse */
+				STEAM_REG_LPAD_CLICK_PRESSURE, 0xFFFF, /* disable clicky pad */
+				STEAM_REG_RPAD_CLICK_PRESSURE, 0xFFFF, /* disable clicky pad */
+				0);
+			/*
+			 * The Steam Deck has a watchdog that automatically enables
+			 * lizard mode if it doesn't see any traffic for too long
+			 */
+			if (!work_busy(&steam->heartbeat.work))
+				schedule_delayed_work(&steam->heartbeat, 5 * HZ);
+		} else {
+			steam_write_registers(steam,
+				STEAM_REG_RPAD_MARGIN, 0x00, /* disable margin */
+				STEAM_REG_LPAD_MODE, 0x07, /* disable mouse */
+				STEAM_REG_RPAD_MODE, 0x07, /* disable mouse */
+				0);
+		}
 	}
 }
 
@@ -413,8 +453,8 @@ static int steam_input_register(struct steam_device *steam)
 	input->open = steam_input_open;
 	input->close = steam_input_close;
 
-	input->name = (steam->quirks & STEAM_QUIRK_WIRELESS) ?
-		"Wireless Steam Controller" :
+	input->name = (steam->quirks & STEAM_QUIRK_WIRELESS) ? "Wireless Steam Controller" :
+		(steam->quirks & STEAM_QUIRK_DECK) ? "Steam Deck" :
 		"Steam Controller";
 	input->phys = hdev->phys;
 	input->uniq = steam->serial_no;
@@ -438,33 +478,67 @@ static int steam_input_register(struct steam_device *steam)
 	input_set_capability(input, EV_KEY, BTN_SELECT);
 	input_set_capability(input, EV_KEY, BTN_MODE);
 	input_set_capability(input, EV_KEY, BTN_START);
-	input_set_capability(input, EV_KEY, BTN_GEAR_DOWN);
-	input_set_capability(input, EV_KEY, BTN_GEAR_UP);
 	input_set_capability(input, EV_KEY, BTN_THUMBR);
 	input_set_capability(input, EV_KEY, BTN_THUMBL);
 	input_set_capability(input, EV_KEY, BTN_THUMB);
 	input_set_capability(input, EV_KEY, BTN_THUMB2);
+	if (steam->quirks & STEAM_QUIRK_DECK) {
+		input_set_capability(input, EV_KEY, BTN_BASE);
+		input_set_capability(input, EV_KEY, BTN_TRIGGER_HAPPY1);
+		input_set_capability(input, EV_KEY, BTN_TRIGGER_HAPPY2);
+		input_set_capability(input, EV_KEY, BTN_TRIGGER_HAPPY3);
+		input_set_capability(input, EV_KEY, BTN_TRIGGER_HAPPY4);
+	} else {
+		input_set_capability(input, EV_KEY, BTN_GEAR_DOWN);
+		input_set_capability(input, EV_KEY, BTN_GEAR_UP);
+	}
 
-	input_set_abs_params(input, ABS_HAT2Y, 0, 255, 0, 0);
-	input_set_abs_params(input, ABS_HAT2X, 0, 255, 0, 0);
 	input_set_abs_params(input, ABS_X, -32767, 32767, 0, 0);
 	input_set_abs_params(input, ABS_Y, -32767, 32767, 0, 0);
-	input_set_abs_params(input, ABS_RX, -32767, 32767,
-			STEAM_PAD_FUZZ, 0);
-	input_set_abs_params(input, ABS_RY, -32767, 32767,
-			STEAM_PAD_FUZZ, 0);
+
 	input_set_abs_params(input, ABS_HAT0X, -32767, 32767,
 			STEAM_PAD_FUZZ, 0);
 	input_set_abs_params(input, ABS_HAT0Y, -32767, 32767,
 			STEAM_PAD_FUZZ, 0);
-	input_abs_set_res(input, ABS_X, STEAM_JOYSTICK_RESOLUTION);
-	input_abs_set_res(input, ABS_Y, STEAM_JOYSTICK_RESOLUTION);
-	input_abs_set_res(input, ABS_RX, STEAM_PAD_RESOLUTION);
-	input_abs_set_res(input, ABS_RY, STEAM_PAD_RESOLUTION);
+
+	if (steam->quirks & STEAM_QUIRK_DECK) {
+		input_set_abs_params(input, ABS_HAT2Y, 0, 32767, 0, 0);
+		input_set_abs_params(input, ABS_HAT2X, 0, 32767, 0, 0);
+
+		input_set_abs_params(input, ABS_RX, -32767, 32767, 0, 0);
+		input_set_abs_params(input, ABS_RY, -32767, 32767, 0, 0);
+
+		input_set_abs_params(input, ABS_HAT1X, -32767, 32767,
+				STEAM_PAD_FUZZ, 0);
+		input_set_abs_params(input, ABS_HAT1Y, -32767, 32767,
+				STEAM_PAD_FUZZ, 0);
+
+		input_abs_set_res(input, ABS_X, STEAM_DECK_JOYSTICK_RESOLUTION);
+		input_abs_set_res(input, ABS_Y, STEAM_DECK_JOYSTICK_RESOLUTION);
+		input_abs_set_res(input, ABS_RX, STEAM_DECK_JOYSTICK_RESOLUTION);
+		input_abs_set_res(input, ABS_RY, STEAM_DECK_JOYSTICK_RESOLUTION);
+		input_abs_set_res(input, ABS_HAT1X, STEAM_PAD_RESOLUTION);
+		input_abs_set_res(input, ABS_HAT1Y, STEAM_PAD_RESOLUTION);
+		input_abs_set_res(input, ABS_HAT2Y, STEAM_DECK_TRIGGER_RESOLUTION);
+		input_abs_set_res(input, ABS_HAT2X, STEAM_DECK_TRIGGER_RESOLUTION);
+	} else {
+		input_set_abs_params(input, ABS_HAT2Y, 0, 255, 0, 0);
+		input_set_abs_params(input, ABS_HAT2X, 0, 255, 0, 0);
+
+		input_set_abs_params(input, ABS_RX, -32767, 32767,
+				STEAM_PAD_FUZZ, 0);
+		input_set_abs_params(input, ABS_RY, -32767, 32767,
+				STEAM_PAD_FUZZ, 0);
+
+		input_abs_set_res(input, ABS_X, STEAM_JOYSTICK_RESOLUTION);
+		input_abs_set_res(input, ABS_Y, STEAM_JOYSTICK_RESOLUTION);
+		input_abs_set_res(input, ABS_RX, STEAM_PAD_RESOLUTION);
+		input_abs_set_res(input, ABS_RY, STEAM_PAD_RESOLUTION);
+		input_abs_set_res(input, ABS_HAT2Y, STEAM_TRIGGER_RESOLUTION);
+		input_abs_set_res(input, ABS_HAT2X, STEAM_TRIGGER_RESOLUTION);
+	}
 	input_abs_set_res(input, ABS_HAT0X, STEAM_PAD_RESOLUTION);
 	input_abs_set_res(input, ABS_HAT0Y, STEAM_PAD_RESOLUTION);
-	input_abs_set_res(input, ABS_HAT2Y, STEAM_TRIGGER_RESOLUTION);
-	input_abs_set_res(input, ABS_HAT2X, STEAM_TRIGGER_RESOLUTION);
 
 	ret = input_register_device(input);
 	if (ret)
@@ -612,6 +686,22 @@ static bool steam_is_valve_interface(struct hid_device *hdev)
 	return !list_empty(&rep_enum->report_list);
 }
 
+static void steam_lizard_mode_heartbeat(struct work_struct *work)
+{
+	struct steam_device *steam = container_of(work, struct steam_device,
+							heartbeat.work);
+
+	mutex_lock(&steam->mutex);
+	if (!steam->client_opened && steam->client_hdev) {
+		steam_send_report_byte(steam, STEAM_CMD_CLEAR_MAPPINGS);
+		steam_write_registers(steam,
+			STEAM_REG_RPAD_MODE, 0x07, /* disable mouse */
+			0);
+		schedule_delayed_work(&steam->heartbeat, 5 * HZ);
+	}
+	mutex_unlock(&steam->mutex);
+}
+
 static int steam_client_ll_parse(struct hid_device *hdev)
 {
 	struct steam_device *steam = hdev->driver_data;
@@ -750,6 +840,7 @@ static int steam_probe(struct hid_device *hdev,
 	steam->quirks = id->driver_data;
 	INIT_WORK(&steam->work_connect, steam_work_connect_cb);
 	INIT_LIST_HEAD(&steam->list);
+	INIT_DEFERRABLE_WORK(&steam->heartbeat, steam_lizard_mode_heartbeat);
 
 	steam->client_hdev = steam_create_client_hid(hdev);
 	if (IS_ERR(steam->client_hdev)) {
@@ -805,6 +896,7 @@ static int steam_probe(struct hid_device *hdev,
 	hid_destroy_device(steam->client_hdev);
 client_hdev_fail:
 	cancel_work_sync(&steam->work_connect);
+	cancel_delayed_work_sync(&steam->heartbeat);
 steam_alloc_fail:
 	hid_err(hdev, "%s: failed with error %d\n",
 			__func__, ret);
@@ -821,7 +913,11 @@ static void steam_remove(struct hid_device *hdev)
 	}
 
 	hid_destroy_device(steam->client_hdev);
+	mutex_lock(&steam->mutex);
+	steam->client_hdev = NULL;
 	steam->client_opened = false;
+	cancel_delayed_work_sync(&steam->heartbeat);
+	mutex_unlock(&steam->mutex);
 	cancel_work_sync(&steam->work_connect);
 	if (steam->quirks & STEAM_QUIRK_WIRELESS) {
 		hid_info(hdev, "Steam wireless receiver disconnected");
@@ -906,10 +1002,10 @@ static inline s16 steam_le16(u8 *data)
  *  8.5  | BTN_B      | button B
  *  8.6  | BTN_X      | button X
  *  8.7  | BTN_A      | button A
- *  9.0  | BTN_DPAD_UP    | lef-pad up
- *  9.1  | BTN_DPAD_RIGHT | lef-pad right
- *  9.2  | BTN_DPAD_LEFT  | lef-pad left
- *  9.3  | BTN_DPAD_DOWN  | lef-pad down
+ *  9.0  | BTN_DPAD_UP    | left-pad up
+ *  9.1  | BTN_DPAD_RIGHT | left-pad right
+ *  9.2  | BTN_DPAD_LEFT  | left-pad left
+ *  9.3  | BTN_DPAD_DOWN  | left-pad down
  *  9.4  | BTN_SELECT | menu left
  *  9.5  | BTN_MODE   | steam logo
  *  9.6  | BTN_START  | menu right
@@ -993,6 +1089,172 @@ static void steam_do_input_event(struct steam_device *steam,
 	input_sync(input);
 }
 
+/*
+ * The size for this message payload is 56.
+ * The known values are:
+ *  Offset| Type  | Mapped to |Meaning
+ * -------+-------+-----------+--------------------------
+ *  4-7   | u32   | --        | sequence number
+ *  8-15  | u64   | see below | buttons
+ *  16-17 | s16   | ABS_HAT0X | left-pad X value
+ *  18-19 | s16   | ABS_HAT0Y | left-pad Y value
+ *  20-21 | s16   | ABS_HAT1X | right-pad X value
+ *  22-23 | s16   | ABS_HAT1Y | right-pad Y value
+ *  24-25 | s16   | --        | accelerometer X value
+ *  26-27 | s16   | --        | accelerometer Y value
+ *  28-29 | s16   | --        | accelerometer Z value
+ *  30-31 | s16   | --        | gyro X value
+ *  32-33 | s16   | --        | gyro Y value
+ *  34-35 | s16   | --        | gyro Z value
+ *  36-37 | s16   | --        | quaternion W value
+ *  38-39 | s16   | --        | quaternion X value
+ *  40-41 | s16   | --        | quaternion Y value
+ *  42-43 | s16   | --        | quaternion Z value
+ *  44-45 | u16   | ABS_HAT2Y | left trigger (uncalibrated)
+ *  46-47 | u16   | ABS_HAT2X | right trigger (uncalibrated)
+ *  48-49 | s16   | ABS_X     | left joystick X
+ *  50-51 | s16   | ABS_Y     | left joystick Y
+ *  52-53 | s16   | ABS_RX    | right joystick X
+ *  54-55 | s16   | ABS_RY    | right joystick Y
+ *  56-57 | u16   | --        | left pad pressure
+ *  58-59 | u16   | --        | right pad pressure
+ *
+ * The buttons are:
+ *  Bit  | Mapped to  | Description
+ * ------+------------+--------------------------------
+ *  8.0  | BTN_TR2    | right trigger fully pressed
+ *  8.1  | BTN_TL2    | left trigger fully pressed
+ *  8.2  | BTN_TR     | right shoulder
+ *  8.3  | BTN_TL     | left shoulder
+ *  8.4  | BTN_Y      | button Y
+ *  8.5  | BTN_B      | button B
+ *  8.6  | BTN_X      | button X
+ *  8.7  | BTN_A      | button A
+ *  9.0  | BTN_DPAD_UP    | left-pad up
+ *  9.1  | BTN_DPAD_RIGHT | left-pad right
+ *  9.2  | BTN_DPAD_LEFT  | left-pad left
+ *  9.3  | BTN_DPAD_DOWN  | left-pad down
+ *  9.4  | BTN_SELECT | menu left
+ *  9.5  | BTN_MODE   | steam logo
+ *  9.6  | BTN_START  | menu right
+ *  9.7  | BTN_TRIGGER_HAPPY3 | left bottom grip button
+ *  10.0 | BTN_TRIGGER_HAPPY4 | right bottom grip button
+ *  10.1 | BTN_THUMB  | left pad pressed
+ *  10.2 | BTN_THUMB2 | right pad pressed
+ *  10.3 | --         | left pad touched
+ *  10.4 | --         | right pad touched
+ *  10.5 | --         | unknown
+ *  10.6 | BTN_THUMBL | left joystick clicked
+ *  10.7 | --         | unknown
+ *  11.0 | --         | unknown
+ *  11.1 | --         | unknown
+ *  11.2 | BTN_THUMBR | right joystick clicked
+ *  11.3 | --         | unknown
+ *  11.4 | --         | unknown
+ *  11.5 | --         | unknown
+ *  11.6 | --         | unknown
+ *  11.7 | --         | unknown
+ *  12.0 | --         | unknown
+ *  12.1 | --         | unknown
+ *  12.2 | --         | unknown
+ *  12.3 | --         | unknown
+ *  12.4 | --         | unknown
+ *  12.5 | --         | unknown
+ *  12.6 | --         | unknown
+ *  12.7 | --         | unknown
+ *  13.0 | --         | unknown
+ *  13.1 | BTN_TRIGGER_HAPPY1 | left top grip button
+ *  13.2 | BTN_TRIGGER_HAPPY2 | right top grip button
+ *  13.3 | --         | unknown
+ *  13.4 | --         | unknown
+ *  13.5 | --         | unknown
+ *  13.6 | --         | left joystick touched
+ *  13.7 | --         | right joystick touched
+ *  14.0 | --         | unknown
+ *  14.1 | --         | unknown
+ *  14.2 | BTN_BASE   | quick access button
+ *  14.3 | --         | unknown
+ *  14.4 | --         | unknown
+ *  14.5 | --         | unknown
+ *  14.6 | --         | unknown
+ *  14.7 | --         | unknown
+ *  15.0 | --         | unknown
+ *  15.1 | --         | unknown
+ *  15.2 | --         | unknown
+ *  15.3 | --         | unknown
+ *  15.4 | --         | unknown
+ *  15.5 | --         | unknown
+ *  15.6 | --         | unknown
+ *  15.7 | --         | unknown
+ */
+static void steam_do_deck_input_event(struct steam_device *steam,
+		struct input_dev *input, u8 *data)
+{
+	u8 b8, b9, b10, b11, b13, b14;
+	bool lpad_touched, rpad_touched;
+
+	b8 = data[8];
+	b9 = data[9];
+	b10 = data[10];
+	b11 = data[11];
+	b13 = data[13];
+	b14 = data[14];
+
+	lpad_touched = b10 & BIT(3);
+	rpad_touched = b10 & BIT(4);
+
+	if (lpad_touched) {
+		input_report_abs(input, ABS_HAT0X, steam_le16(data + 16));
+		input_report_abs(input, ABS_HAT0Y, steam_le16(data + 18));
+	} else {
+		input_report_abs(input, ABS_HAT0X, 0);
+		input_report_abs(input, ABS_HAT0Y, 0);
+	}
+
+	if (rpad_touched) {
+		input_report_abs(input, ABS_HAT1X, steam_le16(data + 20));
+		input_report_abs(input, ABS_HAT1Y, steam_le16(data + 22));
+	} else {
+		input_report_abs(input, ABS_HAT1X, 0);
+		input_report_abs(input, ABS_HAT1Y, 0);
+	}
+
+	input_report_abs(input, ABS_X, steam_le16(data + 48));
+	input_report_abs(input, ABS_Y, -steam_le16(data + 50));
+	input_report_abs(input, ABS_RX, steam_le16(data + 52));
+	input_report_abs(input, ABS_RY, -steam_le16(data + 54));
+
+	input_report_abs(input, ABS_HAT2Y, steam_le16(data + 44));
+	input_report_abs(input, ABS_HAT2X, steam_le16(data + 46));
+
+	input_event(input, EV_KEY, BTN_TR2, !!(b8 & BIT(0)));
+	input_event(input, EV_KEY, BTN_TL2, !!(b8 & BIT(1)));
+	input_event(input, EV_KEY, BTN_TR, !!(b8 & BIT(2)));
+	input_event(input, EV_KEY, BTN_TL, !!(b8 & BIT(3)));
+	input_event(input, EV_KEY, BTN_Y, !!(b8 & BIT(4)));
+	input_event(input, EV_KEY, BTN_B, !!(b8 & BIT(5)));
+	input_event(input, EV_KEY, BTN_X, !!(b8 & BIT(6)));
+	input_event(input, EV_KEY, BTN_A, !!(b8 & BIT(7)));
+	input_event(input, EV_KEY, BTN_SELECT, !!(b9 & BIT(4)));
+	input_event(input, EV_KEY, BTN_MODE, !!(b9 & BIT(5)));
+	input_event(input, EV_KEY, BTN_START, !!(b9 & BIT(6)));
+	input_event(input, EV_KEY, BTN_TRIGGER_HAPPY3, !!(b9 & BIT(7)));
+	input_event(input, EV_KEY, BTN_TRIGGER_HAPPY4, !!(b10 & BIT(0)));
+	input_event(input, EV_KEY, BTN_THUMBL, !!(b10 & BIT(6)));
+	input_event(input, EV_KEY, BTN_THUMBR, !!(b11 & BIT(2)));
+	input_event(input, EV_KEY, BTN_DPAD_UP, !!(b9 & BIT(0)));
+	input_event(input, EV_KEY, BTN_DPAD_RIGHT, !!(b9 & BIT(1)));
+	input_event(input, EV_KEY, BTN_DPAD_LEFT, !!(b9 & BIT(2)));
+	input_event(input, EV_KEY, BTN_DPAD_DOWN, !!(b9 & BIT(3)));
+	input_event(input, EV_KEY, BTN_THUMB, !!(b10 & BIT(1)));
+	input_event(input, EV_KEY, BTN_THUMB2, !!(b10 & BIT(2)));
+	input_event(input, EV_KEY, BTN_TRIGGER_HAPPY1, !!(b13 & BIT(1)));
+	input_event(input, EV_KEY, BTN_TRIGGER_HAPPY2, !!(b13 & BIT(2)));
+	input_event(input, EV_KEY, BTN_BASE, !!(b14 & BIT(2)));
+
+	input_sync(input);
+}
+
 /*
  * The size for this message payload is 11.
  * The known values are:
@@ -1052,6 +1314,7 @@ static int steam_raw_event(struct hid_device *hdev,
 	 *  0x01: input data (60 bytes)
 	 *  0x03: wireless connect/disconnect (1 byte)
 	 *  0x04: battery status (11 bytes)
+	 *  0x09: Steam Deck input data (56 bytes)
 	 */
 
 	if (size != 64 || data[0] != 1 || data[1] != 0)
@@ -1067,6 +1330,15 @@ static int steam_raw_event(struct hid_device *hdev,
 			steam_do_input_event(steam, input, data);
 		rcu_read_unlock();
 		break;
+	case STEAM_EV_DECK_INPUT_DATA:
+		if (steam->client_opened)
+			return 0;
+		rcu_read_lock();
+		input = rcu_dereference(steam->input);
+		if (likely(input))
+			steam_do_deck_input_event(steam, input, data);
+		rcu_read_unlock();
+		break;
 	case STEAM_EV_CONNECT:
 		/*
 		 * The payload of this event is a single byte:
@@ -1141,6 +1413,11 @@ static const struct hid_device_id steam_controllers[] = {
 		USB_DEVICE_ID_STEAM_CONTROLLER_WIRELESS),
 	  .driver_data = STEAM_QUIRK_WIRELESS
 	},
+	{ /* Steam Deck */
+	  HID_USB_DEVICE(USB_VENDOR_ID_VALVE,
+		USB_DEVICE_ID_STEAM_DECK),
+	  .driver_data = STEAM_QUIRK_DECK
+	},
 	{}
 };
 
-- 
2.39.1

