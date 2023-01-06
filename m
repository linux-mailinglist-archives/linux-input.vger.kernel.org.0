Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 922B26608A4
	for <lists+linux-input@lfdr.de>; Fri,  6 Jan 2023 22:14:36 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229686AbjAFVOe (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Fri, 6 Jan 2023 16:14:34 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52968 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229552AbjAFVOd (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Fri, 6 Jan 2023 16:14:33 -0500
Received: from mail-pl1-x62f.google.com (mail-pl1-x62f.google.com [IPv6:2607:f8b0:4864:20::62f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4CDDA736E8
        for <linux-input@vger.kernel.org>; Fri,  6 Jan 2023 13:14:30 -0800 (PST)
Received: by mail-pl1-x62f.google.com with SMTP id n4so2986163plp.1
        for <linux-input@vger.kernel.org>; Fri, 06 Jan 2023 13:14:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gaikai-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=F1aP1pYnERsuKtmKmrW0SUn+SCDFoUbl3SbzmaUcW6M=;
        b=HrVjgeVXzdyF0Di56Fc6tC+ydYFeedweU14bZbSRuJu3jT6gQduxxZn6VTAuNInoEh
         Hn5CI1mJ9d6l//MeSMBM3L24RPbZ1t5jLX9oPYeKrWeJsVTQHQdG7WywQ1Ik9FjDYUv/
         cv8xf8yuxfwYdbf5+71xgpdgaVSajTLeTyZ1U3HHMnYAG2T0NelfbUvmG3iX42mKofiL
         mnW9/43qAzt/WbirEeLmLXI+i907KahXk6pbX//K3US6rTHIJbUbJDILpxxqIIWqb20C
         he76kq71YaEY6fWPnayiSjQbsNoGRMfGBqUGJPNcL7MVr5ZKuD49embLbdXXn9W/DYrQ
         3dEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=F1aP1pYnERsuKtmKmrW0SUn+SCDFoUbl3SbzmaUcW6M=;
        b=49K6j+RanC6Q7mG+rzoxviQeEITLcSGe3hzrF5olSmF1IjvFx5EgWtWUrSCsiEiRKB
         z/QE/jqVKAfvA2eDNa8n8cZrpssv4duuYp0fzxaq7k5Klsi48PmmYK944MuXeA5taW4b
         ztB1uiPgbJU6MX2RF+0CLgIkxpAFs6lETknGVJ+mtoyP6ENmeZ7vx24gOetUv1K0s1+z
         v7MdC+Rw18yIv4JQ4iSr1VIR7ziQy3OrG2lsCb257QpchqUStnyfTfAqFi85POhVGbj7
         gURiMJSv+S+hZMI4y6Oyz+jweSr/7WULi3FF20z5yDIrvxL2+sdpUCn9tmOQegB16yTw
         ERrQ==
X-Gm-Message-State: AFqh2koitw22323MAfkazrdUSHFivpIukaBrdXxL1ESTmT6vPFvHuYrn
        t92BL3JFUGgEeBE7S3GX9IUQsQ==
X-Google-Smtp-Source: AMrXdXtgRUhKJqdGX0cAfenX/yttH0V/s/IX37szS5OqfVaH8Ssgp+Sidy1yAywA0C/S91sbJTobiQ==
X-Received: by 2002:a17:902:ed84:b0:189:6bda:e98f with SMTP id e4-20020a170902ed8400b001896bdae98fmr53377322plj.58.1673039669517;
        Fri, 06 Jan 2023 13:14:29 -0800 (PST)
Received: from localhost.localdomain (23-122-157-100.lightspeed.irvnca.sbcglobal.net. [23.122.157.100])
        by smtp.gmail.com with ESMTPSA id a7-20020a1709027e4700b00192740bb02dsm48712pln.45.2023.01.06.13.14.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Jan 2023 13:14:28 -0800 (PST)
From:   Roderick Colenbrander <roderick@gaikai.com>
X-Google-Original-From: Roderick Colenbrander <roderick.colenbrander@sony.com>
To:     Jiri Kosina <jikos@kernel.org>,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>
Cc:     linux-input@vger.kernel.org,
        Roderick Colenbrander <roderick.colenbrander@sony.com>
Subject: [PATCH] HID: sony: remove DualShock4 support.
Date:   Fri,  6 Jan 2023 13:14:25 -0800
Message-Id: <20230106211425.3048993-1-roderick.colenbrander@sony.com>
X-Mailer: git-send-email 2.38.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Now that hid-playstation provides DualShock4 support, remove
DualShock4 support from hid-sony as it is redundant.

Signed-off-by: Roderick Colenbrander <roderick.colenbrander@sony.com>
---
 drivers/hid/hid-sony.c | 1021 ++--------------------------------------
 1 file changed, 40 insertions(+), 981 deletions(-)

diff --git a/drivers/hid/hid-sony.c b/drivers/hid/hid-sony.c
index 13125997ab5e..dd942061fd77 100644
--- a/drivers/hid/hid-sony.c
+++ b/drivers/hid/hid-sony.c
@@ -49,38 +49,28 @@
 #define SIXAXIS_CONTROLLER_BT     BIT(2)
 #define BUZZ_CONTROLLER           BIT(3)
 #define PS3REMOTE                 BIT(4)
-#define DUALSHOCK4_CONTROLLER_USB BIT(5)
-#define DUALSHOCK4_CONTROLLER_BT  BIT(6)
-#define DUALSHOCK4_DONGLE         BIT(7)
-#define MOTION_CONTROLLER_USB     BIT(8)
-#define MOTION_CONTROLLER_BT      BIT(9)
-#define NAVIGATION_CONTROLLER_USB BIT(10)
-#define NAVIGATION_CONTROLLER_BT  BIT(11)
-#define SINO_LITE_CONTROLLER      BIT(12)
-#define FUTUREMAX_DANCE_MAT       BIT(13)
-#define NSG_MR5U_REMOTE_BT        BIT(14)
-#define NSG_MR7U_REMOTE_BT        BIT(15)
-#define SHANWAN_GAMEPAD           BIT(16)
-#define GH_GUITAR_CONTROLLER      BIT(17)
-#define GHL_GUITAR_PS3WIIU        BIT(18)
-#define GHL_GUITAR_PS4            BIT(19)
+#define MOTION_CONTROLLER_USB     BIT(5)
+#define MOTION_CONTROLLER_BT      BIT(6)
+#define NAVIGATION_CONTROLLER_USB BIT(7)
+#define NAVIGATION_CONTROLLER_BT  BIT(8)
+#define SINO_LITE_CONTROLLER      BIT(9)
+#define FUTUREMAX_DANCE_MAT       BIT(10)
+#define NSG_MR5U_REMOTE_BT        BIT(11)
+#define NSG_MR7U_REMOTE_BT        BIT(12)
+#define SHANWAN_GAMEPAD           BIT(13)
+#define GH_GUITAR_CONTROLLER      BIT(14)
+#define GHL_GUITAR_PS3WIIU        BIT(15)
+#define GHL_GUITAR_PS4            BIT(16)
 
 #define SIXAXIS_CONTROLLER (SIXAXIS_CONTROLLER_USB | SIXAXIS_CONTROLLER_BT)
 #define MOTION_CONTROLLER (MOTION_CONTROLLER_USB | MOTION_CONTROLLER_BT)
 #define NAVIGATION_CONTROLLER (NAVIGATION_CONTROLLER_USB |\
 				NAVIGATION_CONTROLLER_BT)
-#define DUALSHOCK4_CONTROLLER (DUALSHOCK4_CONTROLLER_USB |\
-				DUALSHOCK4_CONTROLLER_BT | \
-				DUALSHOCK4_DONGLE)
 #define SONY_LED_SUPPORT (SIXAXIS_CONTROLLER | BUZZ_CONTROLLER |\
-				DUALSHOCK4_CONTROLLER | MOTION_CONTROLLER |\
-				NAVIGATION_CONTROLLER)
-#define SONY_BATTERY_SUPPORT (SIXAXIS_CONTROLLER | DUALSHOCK4_CONTROLLER |\
-				MOTION_CONTROLLER_BT | NAVIGATION_CONTROLLER)
-#define SONY_FF_SUPPORT (SIXAXIS_CONTROLLER | DUALSHOCK4_CONTROLLER |\
-				MOTION_CONTROLLER)
-#define SONY_BT_DEVICE (SIXAXIS_CONTROLLER_BT | DUALSHOCK4_CONTROLLER_BT |\
-			MOTION_CONTROLLER_BT | NAVIGATION_CONTROLLER_BT)
+				MOTION_CONTROLLER | NAVIGATION_CONTROLLER)
+#define SONY_BATTERY_SUPPORT (SIXAXIS_CONTROLLER | MOTION_CONTROLLER_BT | NAVIGATION_CONTROLLER)
+#define SONY_FF_SUPPORT (SIXAXIS_CONTROLLER | MOTION_CONTROLLER)
+#define SONY_BT_DEVICE (SIXAXIS_CONTROLLER_BT | MOTION_CONTROLLER_BT | NAVIGATION_CONTROLLER_BT)
 #define NSG_MRXU_REMOTE (NSG_MR5U_REMOTE_BT | NSG_MR7U_REMOTE_BT)
 
 #define MAX_LEDS 4
@@ -428,36 +418,6 @@ static const unsigned int sixaxis_keymap[] = {
 	[0x11] = BTN_MODE, /* PS */
 };
 
-static const unsigned int ds4_absmap[] = {
-	[0x30] = ABS_X,
-	[0x31] = ABS_Y,
-	[0x32] = ABS_RX, /* right stick X */
-	[0x33] = ABS_Z, /* L2 */
-	[0x34] = ABS_RZ, /* R2 */
-	[0x35] = ABS_RY, /* right stick Y */
-};
-
-static const unsigned int ds4_keymap[] = {
-	[0x1] = BTN_WEST, /* Square */
-	[0x2] = BTN_SOUTH, /* Cross */
-	[0x3] = BTN_EAST, /* Circle */
-	[0x4] = BTN_NORTH, /* Triangle */
-	[0x5] = BTN_TL, /* L1 */
-	[0x6] = BTN_TR, /* R1 */
-	[0x7] = BTN_TL2, /* L2 */
-	[0x8] = BTN_TR2, /* R2 */
-	[0x9] = BTN_SELECT, /* Share */
-	[0xa] = BTN_START, /* Options */
-	[0xb] = BTN_THUMBL, /* L3 */
-	[0xc] = BTN_THUMBR, /* R3 */
-	[0xd] = BTN_MODE, /* PS */
-};
-
-static const struct {int x; int y; } ds4_hat_mapping[] = {
-	{0, -1}, {1, -1}, {1, 0}, {1, 1}, {0, 1}, {-1, 1}, {-1, 0}, {-1, -1},
-	{0, 0}
-};
-
 static enum power_supply_property sony_battery_props[] = {
 	POWER_SUPPLY_PROP_PRESENT,
 	POWER_SUPPLY_PROP_CAPACITY,
@@ -502,35 +462,12 @@ struct motion_output_report_02 {
 	u8 rumble;
 };
 
-#define DS4_FEATURE_REPORT_0x02_SIZE 37
-#define DS4_FEATURE_REPORT_0x05_SIZE 41
-#define DS4_FEATURE_REPORT_0x81_SIZE 7
-#define DS4_FEATURE_REPORT_0xA3_SIZE 49
-#define DS4_INPUT_REPORT_0x11_SIZE 78
-#define DS4_OUTPUT_REPORT_0x05_SIZE 32
-#define DS4_OUTPUT_REPORT_0x11_SIZE 78
 #define SIXAXIS_REPORT_0xF2_SIZE 17
 #define SIXAXIS_REPORT_0xF5_SIZE 8
 #define MOTION_REPORT_0x02_SIZE 49
 
-/* Offsets relative to USB input report (0x1). Bluetooth (0x11) requires an
- * additional +2.
- */
-#define DS4_INPUT_REPORT_AXIS_OFFSET      1
-#define DS4_INPUT_REPORT_BUTTON_OFFSET    5
-#define DS4_INPUT_REPORT_TIMESTAMP_OFFSET 10
-#define DS4_INPUT_REPORT_GYRO_X_OFFSET   13
-#define DS4_INPUT_REPORT_BATTERY_OFFSET  30
-#define DS4_INPUT_REPORT_TOUCHPAD_OFFSET 33
-
 #define SENSOR_SUFFIX " Motion Sensors"
-#define DS4_TOUCHPAD_SUFFIX " Touchpad"
-
-/* Default to 4ms poll interval, which is same as USB (not adjustable). */
-#define DS4_BT_DEFAULT_POLL_INTERVAL_MS 4
-#define DS4_BT_MAX_POLL_INTERVAL_MS 62
-#define DS4_GYRO_RES_PER_DEG_S 1024
-#define DS4_ACC_RES_PER_G      8192
+#define TOUCHPAD_SUFFIX " Touchpad"
 
 #define SIXAXIS_INPUT_REPORT_ACC_X_OFFSET 41
 #define SIXAXIS_ACC_RES_PER_G 113
@@ -539,28 +476,8 @@ static DEFINE_SPINLOCK(sony_dev_list_lock);
 static LIST_HEAD(sony_device_list);
 static DEFINE_IDA(sony_device_id_allocator);
 
-/* Used for calibration of DS4 accelerometer and gyro. */
-struct ds4_calibration_data {
-	int abs_code;
-	short bias;
-	/* Calibration requires scaling against a sensitivity value, which is a
-	 * float. Store sensitivity as a fraction to limit floating point
-	 * calculations until final calibration.
-	 */
-	int sens_numer;
-	int sens_denom;
-};
-
-enum ds4_dongle_state {
-	DONGLE_DISCONNECTED,
-	DONGLE_CALIBRATING,
-	DONGLE_CONNECTED,
-	DONGLE_DISABLED
-};
-
 enum sony_worker {
-	SONY_WORKER_STATE,
-	SONY_WORKER_HOTPLUG
+	SONY_WORKER_STATE
 };
 
 struct sony_sc {
@@ -571,16 +488,11 @@ struct sony_sc {
 	struct input_dev *sensor_dev;
 	struct led_classdev *leds[MAX_LEDS];
 	unsigned long quirks;
-	struct work_struct hotplug_worker;
 	struct work_struct state_worker;
 	void (*send_output_report)(struct sony_sc *);
 	struct power_supply *battery;
 	struct power_supply_desc battery_desc;
 	int device_id;
-	unsigned fw_version;
-	bool fw_version_created;
-	unsigned hw_version;
-	bool hw_version_created;
 	u8 *output_report_dmabuf;
 
 #ifdef CONFIG_SONY_FF
@@ -589,7 +501,6 @@ struct sony_sc {
 #endif
 
 	u8 mac_address[6];
-	u8 hotplug_worker_initialized;
 	u8 state_worker_initialized;
 	u8 defer_initialization;
 	u8 battery_capacity;
@@ -599,14 +510,6 @@ struct sony_sc {
 	u8 led_delay_off[MAX_LEDS];
 	u8 led_count;
 
-	bool timestamp_initialized;
-	u16 prev_timestamp;
-	unsigned int timestamp_us;
-
-	u8 ds4_bt_poll_interval;
-	enum ds4_dongle_state ds4_dongle_state;
-	/* DS4 calibration data */
-	struct ds4_calibration_data ds4_calib_data[6];
 	/* GH Live */
 	struct urb *ghl_urb;
 	struct timer_list ghl_poke_timer;
@@ -626,10 +529,6 @@ static inline void sony_schedule_work(struct sony_sc *sc,
 			schedule_work(&sc->state_worker);
 		spin_unlock_irqrestore(&sc->lock, flags);
 		break;
-	case SONY_WORKER_HOTPLUG:
-		if (sc->hotplug_worker_initialized)
-			schedule_work(&sc->hotplug_worker);
-		break;
 	}
 }
 
@@ -700,67 +599,6 @@ static int guitar_mapping(struct hid_device *hdev, struct hid_input *hi,
 	return 0;
 }
 
-static ssize_t ds4_show_poll_interval(struct device *dev,
-				struct device_attribute
-				*attr, char *buf)
-{
-	struct hid_device *hdev = to_hid_device(dev);
-	struct sony_sc *sc = hid_get_drvdata(hdev);
-
-	return snprintf(buf, PAGE_SIZE, "%i\n", sc->ds4_bt_poll_interval);
-}
-
-static ssize_t ds4_store_poll_interval(struct device *dev,
-				struct device_attribute *attr,
-				const char *buf, size_t count)
-{
-	struct hid_device *hdev = to_hid_device(dev);
-	struct sony_sc *sc = hid_get_drvdata(hdev);
-	unsigned long flags;
-	u8 interval;
-
-	if (kstrtou8(buf, 0, &interval))
-		return -EINVAL;
-
-	if (interval > DS4_BT_MAX_POLL_INTERVAL_MS)
-		return -EINVAL;
-
-	spin_lock_irqsave(&sc->lock, flags);
-	sc->ds4_bt_poll_interval = interval;
-	spin_unlock_irqrestore(&sc->lock, flags);
-
-	sony_schedule_work(sc, SONY_WORKER_STATE);
-
-	return count;
-}
-
-static DEVICE_ATTR(bt_poll_interval, 0644, ds4_show_poll_interval,
-		ds4_store_poll_interval);
-
-static ssize_t sony_show_firmware_version(struct device *dev,
-				struct device_attribute
-				*attr, char *buf)
-{
-	struct hid_device *hdev = to_hid_device(dev);
-	struct sony_sc *sc = hid_get_drvdata(hdev);
-
-	return snprintf(buf, PAGE_SIZE, "0x%04x\n", sc->fw_version);
-}
-
-static DEVICE_ATTR(firmware_version, 0444, sony_show_firmware_version, NULL);
-
-static ssize_t sony_show_hardware_version(struct device *dev,
-				struct device_attribute
-				*attr, char *buf)
-{
-	struct hid_device *hdev = to_hid_device(dev);
-	struct sony_sc *sc = hid_get_drvdata(hdev);
-
-	return snprintf(buf, PAGE_SIZE, "0x%04x\n", sc->hw_version);
-}
-
-static DEVICE_ATTR(hardware_version, 0444, sony_show_hardware_version, NULL);
-
 static u8 *motion_fixup(struct hid_device *hdev, u8 *rdesc,
 			     unsigned int *rsize)
 {
@@ -905,37 +743,6 @@ static int sixaxis_mapping(struct hid_device *hdev, struct hid_input *hi,
 	return -1;
 }
 
-static int ds4_mapping(struct hid_device *hdev, struct hid_input *hi,
-		       struct hid_field *field, struct hid_usage *usage,
-		       unsigned long **bit, int *max)
-{
-	if ((usage->hid & HID_USAGE_PAGE) == HID_UP_BUTTON) {
-		unsigned int key = usage->hid & HID_USAGE;
-
-		if (key >= ARRAY_SIZE(ds4_keymap))
-			return -1;
-
-		key = ds4_keymap[key];
-		hid_map_usage_clear(hi, usage, bit, max, EV_KEY, key);
-		return 1;
-	} else if ((usage->hid & HID_USAGE_PAGE) == HID_UP_GENDESK) {
-		unsigned int abs = usage->hid & HID_USAGE;
-
-		/* Let the HID parser deal with the HAT. */
-		if (usage->hid == HID_GD_HATSWITCH)
-			return 0;
-
-		if (abs >= ARRAY_SIZE(ds4_absmap))
-			return -1;
-
-		abs = ds4_absmap[abs];
-		hid_map_usage_clear(hi, usage, bit, max, EV_ABS, abs);
-		return 1;
-	}
-
-	return 0;
-}
-
 static u8 *sony_report_fixup(struct hid_device *hdev, u8 *rdesc,
 		unsigned int *rsize)
 {
@@ -1034,216 +841,6 @@ static void sixaxis_parse_report(struct sony_sc *sc, u8 *rd, int size)
 	}
 }
 
-static void dualshock4_parse_report(struct sony_sc *sc, u8 *rd, int size)
-{
-	struct hid_input *hidinput = list_entry(sc->hdev->inputs.next,
-						struct hid_input, list);
-	struct input_dev *input_dev = hidinput->input;
-	unsigned long flags;
-	int n, m, offset, num_touch_data, max_touch_data;
-	u8 cable_state, battery_capacity;
-	int battery_status;
-	u16 timestamp;
-
-	/* When using Bluetooth the header is 2 bytes longer, so skip these. */
-	int data_offset = (sc->quirks & DUALSHOCK4_CONTROLLER_BT) ? 2 : 0;
-
-	/* Second bit of third button byte is for the touchpad button. */
-	offset = data_offset + DS4_INPUT_REPORT_BUTTON_OFFSET;
-	input_report_key(sc->touchpad, BTN_LEFT, rd[offset+2] & 0x2);
-
-	/*
-	 * The default behavior of the Dualshock 4 is to send reports using
-	 * report type 1 when running over Bluetooth. However, when feature
-	 * report 2 is requested during the controller initialization it starts
-	 * sending input reports in report 17. Since report 17 is undefined
-	 * in the default HID descriptor, the HID layer won't generate events.
-	 * While it is possible (and this was done before) to fixup the HID
-	 * descriptor to add this mapping, it was better to do this manually.
-	 * The reason is there were various pieces software both open and closed
-	 * source, relying on the descriptors to be the same across various
-	 * operating systems. If the descriptors wouldn't match some
-	 * applications e.g. games on Wine would not be able to function due
-	 * to different descriptors, which such applications are not parsing.
-	 */
-	if (rd[0] == 17) {
-		int value;
-
-		offset = data_offset + DS4_INPUT_REPORT_AXIS_OFFSET;
-		input_report_abs(input_dev, ABS_X, rd[offset]);
-		input_report_abs(input_dev, ABS_Y, rd[offset+1]);
-		input_report_abs(input_dev, ABS_RX, rd[offset+2]);
-		input_report_abs(input_dev, ABS_RY, rd[offset+3]);
-
-		value = rd[offset+4] & 0xf;
-		if (value > 7)
-			value = 8; /* Center 0, 0 */
-		input_report_abs(input_dev, ABS_HAT0X, ds4_hat_mapping[value].x);
-		input_report_abs(input_dev, ABS_HAT0Y, ds4_hat_mapping[value].y);
-
-		input_report_key(input_dev, BTN_WEST, rd[offset+4] & 0x10);
-		input_report_key(input_dev, BTN_SOUTH, rd[offset+4] & 0x20);
-		input_report_key(input_dev, BTN_EAST, rd[offset+4] & 0x40);
-		input_report_key(input_dev, BTN_NORTH, rd[offset+4] & 0x80);
-
-		input_report_key(input_dev, BTN_TL, rd[offset+5] & 0x1);
-		input_report_key(input_dev, BTN_TR, rd[offset+5] & 0x2);
-		input_report_key(input_dev, BTN_TL2, rd[offset+5] & 0x4);
-		input_report_key(input_dev, BTN_TR2, rd[offset+5] & 0x8);
-		input_report_key(input_dev, BTN_SELECT, rd[offset+5] & 0x10);
-		input_report_key(input_dev, BTN_START, rd[offset+5] & 0x20);
-		input_report_key(input_dev, BTN_THUMBL, rd[offset+5] & 0x40);
-		input_report_key(input_dev, BTN_THUMBR, rd[offset+5] & 0x80);
-
-		input_report_key(input_dev, BTN_MODE, rd[offset+6] & 0x1);
-
-		input_report_abs(input_dev, ABS_Z, rd[offset+7]);
-		input_report_abs(input_dev, ABS_RZ, rd[offset+8]);
-
-		input_sync(input_dev);
-	}
-
-	/* Convert timestamp (in 5.33us unit) to timestamp_us */
-	offset = data_offset + DS4_INPUT_REPORT_TIMESTAMP_OFFSET;
-	timestamp = get_unaligned_le16(&rd[offset]);
-	if (!sc->timestamp_initialized) {
-		sc->timestamp_us = ((unsigned int)timestamp * 16) / 3;
-		sc->timestamp_initialized = true;
-	} else {
-		u16 delta;
-
-		if (sc->prev_timestamp > timestamp)
-			delta = (U16_MAX - sc->prev_timestamp + timestamp + 1);
-		else
-			delta = timestamp - sc->prev_timestamp;
-		sc->timestamp_us += (delta * 16) / 3;
-	}
-	sc->prev_timestamp = timestamp;
-	input_event(sc->sensor_dev, EV_MSC, MSC_TIMESTAMP, sc->timestamp_us);
-
-	offset = data_offset + DS4_INPUT_REPORT_GYRO_X_OFFSET;
-	for (n = 0; n < 6; n++) {
-		/* Store data in int for more precision during mult_frac. */
-		int raw_data = (short)((rd[offset+1] << 8) | rd[offset]);
-		struct ds4_calibration_data *calib = &sc->ds4_calib_data[n];
-
-		/* High precision is needed during calibration, but the
-		 * calibrated values are within 32-bit.
-		 * Note: we swap numerator 'x' and 'numer' in mult_frac for
-		 *       precision reasons so we don't need 64-bit.
-		 */
-		int calib_data = mult_frac(calib->sens_numer,
-					   raw_data - calib->bias,
-					   calib->sens_denom);
-
-		input_report_abs(sc->sensor_dev, calib->abs_code, calib_data);
-		offset += 2;
-	}
-	input_sync(sc->sensor_dev);
-
-	/*
-	 * The lower 4 bits of byte 30 (or 32 for BT) contain the battery level
-	 * and the 5th bit contains the USB cable state.
-	 */
-	offset = data_offset + DS4_INPUT_REPORT_BATTERY_OFFSET;
-	cable_state = (rd[offset] >> 4) & 0x01;
-
-	/*
-	 * Interpretation of the battery_capacity data depends on the cable state.
-	 * When no cable is connected (bit4 is 0):
-	 * - 0:10: percentage in units of 10%.
-	 * When a cable is plugged in:
-	 * - 0-10: percentage in units of 10%.
-	 * - 11: battery is full
-	 * - 14: not charging due to Voltage or temperature error
-	 * - 15: charge error
-	 */
-	if (cable_state) {
-		u8 battery_data = rd[offset] & 0xf;
-
-		if (battery_data < 10) {
-			/* Take the mid-point for each battery capacity value,
-			 * because on the hardware side 0 = 0-9%, 1=10-19%, etc.
-			 * This matches official platform behavior, which does
-			 * the same.
-			 */
-			battery_capacity = battery_data * 10 + 5;
-			battery_status = POWER_SUPPLY_STATUS_CHARGING;
-		} else if (battery_data == 10) {
-			battery_capacity = 100;
-			battery_status = POWER_SUPPLY_STATUS_CHARGING;
-		} else if (battery_data == 11) {
-			battery_capacity = 100;
-			battery_status = POWER_SUPPLY_STATUS_FULL;
-		} else { /* 14, 15 and undefined values */
-			battery_capacity = 0;
-			battery_status = POWER_SUPPLY_STATUS_UNKNOWN;
-		}
-	} else {
-		u8 battery_data = rd[offset] & 0xf;
-
-		if (battery_data < 10)
-			battery_capacity = battery_data * 10 + 5;
-		else /* 10 */
-			battery_capacity = 100;
-
-		battery_status = POWER_SUPPLY_STATUS_DISCHARGING;
-	}
-
-	spin_lock_irqsave(&sc->lock, flags);
-	sc->battery_capacity = battery_capacity;
-	sc->battery_status = battery_status;
-	spin_unlock_irqrestore(&sc->lock, flags);
-
-	/*
-	 * The Dualshock 4 multi-touch trackpad data starts at offset 33 on USB
-	 * and 35 on Bluetooth.
-	 * The first byte indicates the number of touch data in the report.
-	 * Trackpad data starts 2 bytes later (e.g. 35 for USB).
-	 */
-	offset = data_offset + DS4_INPUT_REPORT_TOUCHPAD_OFFSET;
-	max_touch_data = (sc->quirks & DUALSHOCK4_CONTROLLER_BT) ? 4 : 3;
-	if (rd[offset] > 0 && rd[offset] <= max_touch_data)
-		num_touch_data = rd[offset];
-	else
-		num_touch_data = 1;
-	offset += 1;
-
-	for (m = 0; m < num_touch_data; m++) {
-		/* Skip past timestamp */
-		offset += 1;
-
-		/*
-		 * The first 7 bits of the first byte is a counter and bit 8 is
-		 * a touch indicator that is 0 when pressed and 1 when not
-		 * pressed.
-		 * The next 3 bytes are two 12 bit touch coordinates, X and Y.
-		 * The data for the second touch is in the same format and
-		 * immediately follows the data for the first.
-		 */
-		for (n = 0; n < 2; n++) {
-			u16 x, y;
-			bool active;
-
-			x = rd[offset+1] | ((rd[offset+2] & 0xF) << 8);
-			y = ((rd[offset+2] & 0xF0) >> 4) | (rd[offset+3] << 4);
-
-			active = !(rd[offset] >> 7);
-			input_mt_slot(sc->touchpad, n);
-			input_mt_report_slot_state(sc->touchpad, MT_TOOL_FINGER, active);
-
-			if (active) {
-				input_report_abs(sc->touchpad, ABS_MT_POSITION_X, x);
-				input_report_abs(sc->touchpad, ABS_MT_POSITION_Y, y);
-			}
-
-			offset += 4;
-		}
-		input_mt_sync_frame(sc->touchpad);
-		input_sync(sc->touchpad);
-	}
-}
-
 static void nsg_mrxu_parse_report(struct sony_sc *sc, u8 *rd, int size)
 {
 	int n, offset, relx, rely;
@@ -1350,83 +947,6 @@ static int sony_raw_event(struct hid_device *hdev, struct hid_report *report,
 	} else if ((sc->quirks & NAVIGATION_CONTROLLER) && rd[0] == 0x01 &&
 			size == 49) {
 		sixaxis_parse_report(sc, rd, size);
-	} else if ((sc->quirks & DUALSHOCK4_CONTROLLER_USB) && rd[0] == 0x01 &&
-			size == 64) {
-		dualshock4_parse_report(sc, rd, size);
-	} else if (((sc->quirks & DUALSHOCK4_CONTROLLER_BT) && rd[0] == 0x11 &&
-			size == 78)) {
-		/* CRC check */
-		u8 bthdr = 0xA1;
-		u32 crc;
-		u32 report_crc;
-
-		crc = crc32_le(0xFFFFFFFF, &bthdr, 1);
-		crc = ~crc32_le(crc, rd, DS4_INPUT_REPORT_0x11_SIZE-4);
-		report_crc = get_unaligned_le32(&rd[DS4_INPUT_REPORT_0x11_SIZE-4]);
-		if (crc != report_crc) {
-			hid_dbg(sc->hdev, "DualShock 4 input report's CRC check failed, received crc 0x%0x != 0x%0x\n",
-				report_crc, crc);
-			return -EILSEQ;
-		}
-
-		dualshock4_parse_report(sc, rd, size);
-	} else if ((sc->quirks & DUALSHOCK4_DONGLE) && rd[0] == 0x01 &&
-			size == 64) {
-		unsigned long flags;
-		enum ds4_dongle_state dongle_state;
-
-		/*
-		 * In the case of a DS4 USB dongle, bit[2] of byte 31 indicates
-		 * if a DS4 is actually connected (indicated by '0').
-		 * For non-dongle, this bit is always 0 (connected).
-		 */
-		bool connected = (rd[31] & 0x04) ? false : true;
-
-		spin_lock_irqsave(&sc->lock, flags);
-		dongle_state = sc->ds4_dongle_state;
-		spin_unlock_irqrestore(&sc->lock, flags);
-
-		/*
-		 * The dongle always sends input reports even when no
-		 * DS4 is attached. When a DS4 is connected, we need to
-		 * obtain calibration data before we can use it.
-		 * The code below tracks dongle state and kicks of
-		 * calibration when needed and only allows us to process
-		 * input if a DS4 is actually connected.
-		 */
-		if (dongle_state == DONGLE_DISCONNECTED && connected) {
-			hid_info(sc->hdev, "DualShock 4 USB dongle: controller connected\n");
-			sony_set_leds(sc);
-
-			spin_lock_irqsave(&sc->lock, flags);
-			sc->ds4_dongle_state = DONGLE_CALIBRATING;
-			spin_unlock_irqrestore(&sc->lock, flags);
-
-			sony_schedule_work(sc, SONY_WORKER_HOTPLUG);
-
-			/* Don't process the report since we don't have
-			 * calibration data, but let hidraw have it anyway.
-			 */
-			return 0;
-		} else if ((dongle_state == DONGLE_CONNECTED ||
-			    dongle_state == DONGLE_DISABLED) && !connected) {
-			hid_info(sc->hdev, "DualShock 4 USB dongle: controller disconnected\n");
-
-			spin_lock_irqsave(&sc->lock, flags);
-			sc->ds4_dongle_state = DONGLE_DISCONNECTED;
-			spin_unlock_irqrestore(&sc->lock, flags);
-
-			/* Return 0, so hidraw can get the report. */
-			return 0;
-		} else if (dongle_state == DONGLE_CALIBRATING ||
-			   dongle_state == DONGLE_DISABLED ||
-			   dongle_state == DONGLE_DISCONNECTED) {
-			/* Return 0, so hidraw can get the report. */
-			return 0;
-		}
-
-		dualshock4_parse_report(sc, rd, size);
-
 	} else if ((sc->quirks & NSG_MRXU_REMOTE) && rd[0] == 0x02) {
 		nsg_mrxu_parse_report(sc, rd, size);
 		return 1;
@@ -1478,9 +998,6 @@ static int sony_mapping(struct hid_device *hdev, struct hid_input *hi,
 	if (sc->quirks & SIXAXIS_CONTROLLER)
 		return sixaxis_mapping(hdev, hi, field, usage, bit, max);
 
-	if (sc->quirks & DUALSHOCK4_CONTROLLER)
-		return ds4_mapping(hdev, hi, field, usage, bit, max);
-
 	if (sc->quirks & GH_GUITAR_CONTROLLER)
 		return guitar_mapping(hdev, hi, field, usage, bit, max);
 
@@ -1508,14 +1025,17 @@ static int sony_register_touchpad(struct sony_sc *sc, int touch_count,
 	sc->touchpad->id.product = sc->hdev->product;
 	sc->touchpad->id.version = sc->hdev->version;
 
-	/* Append a suffix to the controller name as there are various
-	 * DS4 compatible non-Sony devices with different names.
+	/* This suffix was originally apended when hid-sony also
+	 * supported DS4 devices. The DS4 was implemented using multiple
+	 * evdev nodes and hence had the need to separete them out using
+	 * a suffix. Other devices which were added later like Sony TV remotes
+	 * inhirited this suffix.
 	 */
-	name_sz = strlen(sc->hdev->name) + sizeof(DS4_TOUCHPAD_SUFFIX);
+	name_sz = strlen(sc->hdev->name) + sizeof(TOUCHPAD_SUFFIX);
 	name = devm_kzalloc(&sc->hdev->dev, name_sz, GFP_KERNEL);
 	if (!name)
 		return -ENOMEM;
-	snprintf(name, name_sz, "%s" DS4_TOUCHPAD_SUFFIX, sc->hdev->name);
+	snprintf(name, name_sz, "%s" TOUCHPAD_SUFFIX, sc->hdev->name);
 	sc->touchpad->name = name;
 
 	/* We map the button underneath the touchpad to BTN_LEFT. */
@@ -1557,7 +1077,6 @@ static int sony_register_sensors(struct sony_sc *sc)
 	size_t name_sz;
 	char *name;
 	int ret;
-	int range;
 
 	sc->sensor_dev = devm_input_allocate_device(&sc->hdev->dev);
 	if (!sc->sensor_dev)
@@ -1595,25 +1114,6 @@ static int sony_register_sensors(struct sony_sc *sc)
 		input_abs_set_res(sc->sensor_dev, ABS_X, SIXAXIS_ACC_RES_PER_G);
 		input_abs_set_res(sc->sensor_dev, ABS_Y, SIXAXIS_ACC_RES_PER_G);
 		input_abs_set_res(sc->sensor_dev, ABS_Z, SIXAXIS_ACC_RES_PER_G);
-	} else if (sc->quirks & DUALSHOCK4_CONTROLLER) {
-		range = DS4_ACC_RES_PER_G*4;
-		input_set_abs_params(sc->sensor_dev, ABS_X, -range, range, 16, 0);
-		input_set_abs_params(sc->sensor_dev, ABS_Y, -range, range, 16, 0);
-		input_set_abs_params(sc->sensor_dev, ABS_Z, -range, range, 16, 0);
-		input_abs_set_res(sc->sensor_dev, ABS_X, DS4_ACC_RES_PER_G);
-		input_abs_set_res(sc->sensor_dev, ABS_Y, DS4_ACC_RES_PER_G);
-		input_abs_set_res(sc->sensor_dev, ABS_Z, DS4_ACC_RES_PER_G);
-
-		range = DS4_GYRO_RES_PER_DEG_S*2048;
-		input_set_abs_params(sc->sensor_dev, ABS_RX, -range, range, 16, 0);
-		input_set_abs_params(sc->sensor_dev, ABS_RY, -range, range, 16, 0);
-		input_set_abs_params(sc->sensor_dev, ABS_RZ, -range, range, 16, 0);
-		input_abs_set_res(sc->sensor_dev, ABS_RX, DS4_GYRO_RES_PER_DEG_S);
-		input_abs_set_res(sc->sensor_dev, ABS_RY, DS4_GYRO_RES_PER_DEG_S);
-		input_abs_set_res(sc->sensor_dev, ABS_RZ, DS4_GYRO_RES_PER_DEG_S);
-
-		__set_bit(EV_MSC, sc->sensor_dev->evbit);
-		__set_bit(MSC_TIMESTAMP, sc->sensor_dev->mscbit);
 	}
 
 	__set_bit(INPUT_PROP_ACCELEROMETER, sc->sensor_dev->propbit);
@@ -1697,224 +1197,6 @@ static int sixaxis_set_operational_bt(struct hid_device *hdev)
 	return ret;
 }
 
-/*
- * Request DS4 calibration data for the motion sensors.
- * For Bluetooth this also affects the operating mode (see below).
- */
-static int dualshock4_get_calibration_data(struct sony_sc *sc)
-{
-	u8 *buf;
-	int ret;
-	short gyro_pitch_bias, gyro_pitch_plus, gyro_pitch_minus;
-	short gyro_yaw_bias, gyro_yaw_plus, gyro_yaw_minus;
-	short gyro_roll_bias, gyro_roll_plus, gyro_roll_minus;
-	short gyro_speed_plus, gyro_speed_minus;
-	short acc_x_plus, acc_x_minus;
-	short acc_y_plus, acc_y_minus;
-	short acc_z_plus, acc_z_minus;
-	int speed_2x;
-	int range_2g;
-
-	/* For Bluetooth we use a different request, which supports CRC.
-	 * Note: in Bluetooth mode feature report 0x02 also changes the state
-	 * of the controller, so that it sends input reports of type 0x11.
-	 */
-	if (sc->quirks & (DUALSHOCK4_CONTROLLER_USB | DUALSHOCK4_DONGLE)) {
-		int retries;
-
-		buf = kmalloc(DS4_FEATURE_REPORT_0x02_SIZE, GFP_KERNEL);
-		if (!buf)
-			return -ENOMEM;
-
-		/* We should normally receive the feature report data we asked
-		 * for, but hidraw applications such as Steam can issue feature
-		 * reports as well. In particular for Dongle reconnects, Steam
-		 * and this function are competing resulting in often receiving
-		 * data for a different HID report, so retry a few times.
-		 */
-		for (retries = 0; retries < 3; retries++) {
-			ret = hid_hw_raw_request(sc->hdev, 0x02, buf,
-						 DS4_FEATURE_REPORT_0x02_SIZE,
-						 HID_FEATURE_REPORT,
-						 HID_REQ_GET_REPORT);
-			if (ret < 0)
-				goto err_stop;
-
-			if (buf[0] != 0x02) {
-				if (retries < 2) {
-					hid_warn(sc->hdev, "Retrying DualShock 4 get calibration report (0x02) request\n");
-					continue;
-				} else {
-					ret = -EILSEQ;
-					goto err_stop;
-				}
-			} else {
-				break;
-			}
-		}
-	} else {
-		u8 bthdr = 0xA3;
-		u32 crc;
-		u32 report_crc;
-		int retries;
-
-		buf = kmalloc(DS4_FEATURE_REPORT_0x05_SIZE, GFP_KERNEL);
-		if (!buf)
-			return -ENOMEM;
-
-		for (retries = 0; retries < 3; retries++) {
-			ret = hid_hw_raw_request(sc->hdev, 0x05, buf,
-						 DS4_FEATURE_REPORT_0x05_SIZE,
-						 HID_FEATURE_REPORT,
-						 HID_REQ_GET_REPORT);
-			if (ret < 0)
-				goto err_stop;
-
-			/* CRC check */
-			crc = crc32_le(0xFFFFFFFF, &bthdr, 1);
-			crc = ~crc32_le(crc, buf, DS4_FEATURE_REPORT_0x05_SIZE-4);
-			report_crc = get_unaligned_le32(&buf[DS4_FEATURE_REPORT_0x05_SIZE-4]);
-			if (crc != report_crc) {
-				hid_warn(sc->hdev, "DualShock 4 calibration report's CRC check failed, received crc 0x%0x != 0x%0x\n",
-					report_crc, crc);
-				if (retries < 2) {
-					hid_warn(sc->hdev, "Retrying DualShock 4 get calibration report request\n");
-					continue;
-				} else {
-					ret = -EILSEQ;
-					goto err_stop;
-				}
-			} else {
-				break;
-			}
-		}
-	}
-
-	gyro_pitch_bias  = get_unaligned_le16(&buf[1]);
-	gyro_yaw_bias    = get_unaligned_le16(&buf[3]);
-	gyro_roll_bias   = get_unaligned_le16(&buf[5]);
-	if (sc->quirks & DUALSHOCK4_CONTROLLER_USB) {
-		gyro_pitch_plus  = get_unaligned_le16(&buf[7]);
-		gyro_pitch_minus = get_unaligned_le16(&buf[9]);
-		gyro_yaw_plus    = get_unaligned_le16(&buf[11]);
-		gyro_yaw_minus   = get_unaligned_le16(&buf[13]);
-		gyro_roll_plus   = get_unaligned_le16(&buf[15]);
-		gyro_roll_minus  = get_unaligned_le16(&buf[17]);
-	} else {
-		/* BT + Dongle */
-		gyro_pitch_plus  = get_unaligned_le16(&buf[7]);
-		gyro_yaw_plus    = get_unaligned_le16(&buf[9]);
-		gyro_roll_plus   = get_unaligned_le16(&buf[11]);
-		gyro_pitch_minus = get_unaligned_le16(&buf[13]);
-		gyro_yaw_minus   = get_unaligned_le16(&buf[15]);
-		gyro_roll_minus  = get_unaligned_le16(&buf[17]);
-	}
-	gyro_speed_plus  = get_unaligned_le16(&buf[19]);
-	gyro_speed_minus = get_unaligned_le16(&buf[21]);
-	acc_x_plus       = get_unaligned_le16(&buf[23]);
-	acc_x_minus      = get_unaligned_le16(&buf[25]);
-	acc_y_plus       = get_unaligned_le16(&buf[27]);
-	acc_y_minus      = get_unaligned_le16(&buf[29]);
-	acc_z_plus       = get_unaligned_le16(&buf[31]);
-	acc_z_minus      = get_unaligned_le16(&buf[33]);
-
-	/* Set gyroscope calibration and normalization parameters.
-	 * Data values will be normalized to 1/DS4_GYRO_RES_PER_DEG_S degree/s.
-	 */
-	speed_2x = (gyro_speed_plus + gyro_speed_minus);
-	sc->ds4_calib_data[0].abs_code = ABS_RX;
-	sc->ds4_calib_data[0].bias = gyro_pitch_bias;
-	sc->ds4_calib_data[0].sens_numer = speed_2x*DS4_GYRO_RES_PER_DEG_S;
-	sc->ds4_calib_data[0].sens_denom = gyro_pitch_plus - gyro_pitch_minus;
-
-	sc->ds4_calib_data[1].abs_code = ABS_RY;
-	sc->ds4_calib_data[1].bias = gyro_yaw_bias;
-	sc->ds4_calib_data[1].sens_numer = speed_2x*DS4_GYRO_RES_PER_DEG_S;
-	sc->ds4_calib_data[1].sens_denom = gyro_yaw_plus - gyro_yaw_minus;
-
-	sc->ds4_calib_data[2].abs_code = ABS_RZ;
-	sc->ds4_calib_data[2].bias = gyro_roll_bias;
-	sc->ds4_calib_data[2].sens_numer = speed_2x*DS4_GYRO_RES_PER_DEG_S;
-	sc->ds4_calib_data[2].sens_denom = gyro_roll_plus - gyro_roll_minus;
-
-	/* Set accelerometer calibration and normalization parameters.
-	 * Data values will be normalized to 1/DS4_ACC_RES_PER_G G.
-	 */
-	range_2g = acc_x_plus - acc_x_minus;
-	sc->ds4_calib_data[3].abs_code = ABS_X;
-	sc->ds4_calib_data[3].bias = acc_x_plus - range_2g / 2;
-	sc->ds4_calib_data[3].sens_numer = 2*DS4_ACC_RES_PER_G;
-	sc->ds4_calib_data[3].sens_denom = range_2g;
-
-	range_2g = acc_y_plus - acc_y_minus;
-	sc->ds4_calib_data[4].abs_code = ABS_Y;
-	sc->ds4_calib_data[4].bias = acc_y_plus - range_2g / 2;
-	sc->ds4_calib_data[4].sens_numer = 2*DS4_ACC_RES_PER_G;
-	sc->ds4_calib_data[4].sens_denom = range_2g;
-
-	range_2g = acc_z_plus - acc_z_minus;
-	sc->ds4_calib_data[5].abs_code = ABS_Z;
-	sc->ds4_calib_data[5].bias = acc_z_plus - range_2g / 2;
-	sc->ds4_calib_data[5].sens_numer = 2*DS4_ACC_RES_PER_G;
-	sc->ds4_calib_data[5].sens_denom = range_2g;
-
-err_stop:
-	kfree(buf);
-	return ret;
-}
-
-static void dualshock4_calibration_work(struct work_struct *work)
-{
-	struct sony_sc *sc = container_of(work, struct sony_sc, hotplug_worker);
-	unsigned long flags;
-	enum ds4_dongle_state dongle_state;
-	int ret;
-
-	ret = dualshock4_get_calibration_data(sc);
-	if (ret < 0) {
-		/* This call is very unlikely to fail for the dongle. When it
-		 * fails we are probably in a very bad state, so mark the
-		 * dongle as disabled. We will re-enable the dongle if a new
-		 * DS4 hotplug is detect from sony_raw_event as any issues
-		 * are likely resolved then (the dongle is quite stupid).
-		 */
-		hid_err(sc->hdev, "DualShock 4 USB dongle: calibration failed, disabling device\n");
-		dongle_state = DONGLE_DISABLED;
-	} else {
-		hid_info(sc->hdev, "DualShock 4 USB dongle: calibration completed\n");
-		dongle_state = DONGLE_CONNECTED;
-	}
-
-	spin_lock_irqsave(&sc->lock, flags);
-	sc->ds4_dongle_state = dongle_state;
-	spin_unlock_irqrestore(&sc->lock, flags);
-}
-
-static int dualshock4_get_version_info(struct sony_sc *sc)
-{
-	u8 *buf;
-	int ret;
-
-	buf = kmalloc(DS4_FEATURE_REPORT_0xA3_SIZE, GFP_KERNEL);
-	if (!buf)
-		return -ENOMEM;
-
-	ret = hid_hw_raw_request(sc->hdev, 0xA3, buf,
-				 DS4_FEATURE_REPORT_0xA3_SIZE,
-				 HID_FEATURE_REPORT,
-				 HID_REQ_GET_REPORT);
-	if (ret < 0) {
-		kfree(buf);
-		return ret;
-	}
-
-	sc->hw_version = get_unaligned_le16(&buf[35]);
-	sc->fw_version = get_unaligned_le16(&buf[41]);
-
-	kfree(buf);
-	return 0;
-}
-
 static void sixaxis_set_leds_from_id(struct sony_sc *sc)
 {
 	static const u8 sixaxis_leds[10][4] = {
@@ -1941,30 +1223,6 @@ static void sixaxis_set_leds_from_id(struct sony_sc *sc)
 	memcpy(sc->led_state, sixaxis_leds[id], sizeof(sixaxis_leds[id]));
 }
 
-static void dualshock4_set_leds_from_id(struct sony_sc *sc)
-{
-	/* The first 4 color/index entries match what the PS4 assigns */
-	static const u8 color_code[7][3] = {
-			/* Blue   */	{ 0x00, 0x00, 0x40 },
-			/* Red	  */	{ 0x40, 0x00, 0x00 },
-			/* Green  */	{ 0x00, 0x40, 0x00 },
-			/* Pink   */	{ 0x20, 0x00, 0x20 },
-			/* Orange */	{ 0x02, 0x01, 0x00 },
-			/* Teal   */	{ 0x00, 0x01, 0x01 },
-			/* White  */	{ 0x01, 0x01, 0x01 }
-	};
-
-	int id = sc->device_id;
-
-	BUILD_BUG_ON(MAX_LEDS < ARRAY_SIZE(color_code[0]));
-
-	if (id < 0)
-		return;
-
-	id %= 7;
-	memcpy(sc->led_state, color_code[id], sizeof(color_code[id]));
-}
-
 static void buzz_set_leds(struct sony_sc *sc)
 {
 	struct hid_device *hdev = sc->hdev;
@@ -2110,13 +1368,13 @@ static int sony_leds_init(struct sony_sc *sc)
 {
 	struct hid_device *hdev = sc->hdev;
 	int n, ret = 0;
-	int use_ds4_names;
+	int use_color_names;
 	struct led_classdev *led;
 	size_t name_sz;
 	char *name;
 	size_t name_len;
 	const char *name_fmt;
-	static const char * const ds4_name_str[] = { "red", "green", "blue",
+	static const char * const color_name_str[] = { "red", "green", "blue",
 						  "global" };
 	u8 max_brightness[MAX_LEDS] = { [0 ... (MAX_LEDS - 1)] = 1 };
 	u8 use_hw_blink[MAX_LEDS] = { 0 };
@@ -2125,25 +1383,16 @@ static int sony_leds_init(struct sony_sc *sc)
 
 	if (sc->quirks & BUZZ_CONTROLLER) {
 		sc->led_count = 4;
-		use_ds4_names = 0;
+		use_color_names = 0;
 		name_len = strlen("::buzz#");
 		name_fmt = "%s::buzz%d";
 		/* Validate expected report characteristics. */
 		if (!hid_validate_values(hdev, HID_OUTPUT_REPORT, 0, 0, 7))
 			return -ENODEV;
-	} else if (sc->quirks & DUALSHOCK4_CONTROLLER) {
-		dualshock4_set_leds_from_id(sc);
-		sc->led_state[3] = 1;
-		sc->led_count = 4;
-		memset(max_brightness, 255, 3);
-		use_hw_blink[3] = 1;
-		use_ds4_names = 1;
-		name_len = 0;
-		name_fmt = "%s:%s";
 	} else if (sc->quirks & MOTION_CONTROLLER) {
 		sc->led_count = 3;
 		memset(max_brightness, 255, 3);
-		use_ds4_names = 1;
+		use_color_names = 1;
 		name_len = 0;
 		name_fmt = "%s:%s";
 	} else if (sc->quirks & NAVIGATION_CONTROLLER) {
@@ -2152,14 +1401,14 @@ static int sony_leds_init(struct sony_sc *sc)
 		memcpy(sc->led_state, navigation_leds, sizeof(navigation_leds));
 		sc->led_count = 1;
 		memset(use_hw_blink, 1, 4);
-		use_ds4_names = 0;
+		use_color_names = 0;
 		name_len = strlen("::sony#");
 		name_fmt = "%s::sony%d";
 	} else {
 		sixaxis_set_leds_from_id(sc);
 		sc->led_count = 4;
 		memset(use_hw_blink, 1, 4);
-		use_ds4_names = 0;
+		use_color_names = 0;
 		name_len = strlen("::sony#");
 		name_fmt = "%s::sony%d";
 	}
@@ -2175,8 +1424,8 @@ static int sony_leds_init(struct sony_sc *sc)
 
 	for (n = 0; n < sc->led_count; n++) {
 
-		if (use_ds4_names)
-			name_sz = strlen(dev_name(&hdev->dev)) + strlen(ds4_name_str[n]) + 2;
+		if (use_color_names)
+			name_sz = strlen(dev_name(&hdev->dev)) + strlen(color_name_str[n]) + 2;
 
 		led = devm_kzalloc(&hdev->dev, sizeof(struct led_classdev) + name_sz, GFP_KERNEL);
 		if (!led) {
@@ -2185,9 +1434,9 @@ static int sony_leds_init(struct sony_sc *sc)
 		}
 
 		name = (void *)(&led[1]);
-		if (use_ds4_names)
+		if (use_color_names)
 			snprintf(name, name_sz, name_fmt, dev_name(&hdev->dev),
-			ds4_name_str[n]);
+			color_name_str[n]);
 		else
 			snprintf(name, name_sz, name_fmt, dev_name(&hdev->dev), n + 1);
 		led->name = name;
@@ -2273,68 +1522,6 @@ static void sixaxis_send_output_report(struct sony_sc *sc)
 				HID_OUTPUT_REPORT, HID_REQ_SET_REPORT);
 }
 
-static void dualshock4_send_output_report(struct sony_sc *sc)
-{
-	struct hid_device *hdev = sc->hdev;
-	u8 *buf = sc->output_report_dmabuf;
-	int offset;
-
-	/*
-	 * NOTE: The lower 6 bits of buf[1] field of the Bluetooth report
-	 * control the interval at which Dualshock 4 reports data:
-	 * 0x00 - 1ms
-	 * 0x01 - 1ms
-	 * 0x02 - 2ms
-	 * 0x3E - 62ms
-	 * 0x3F - disabled
-	 */
-	if (sc->quirks & (DUALSHOCK4_CONTROLLER_USB | DUALSHOCK4_DONGLE)) {
-		memset(buf, 0, DS4_OUTPUT_REPORT_0x05_SIZE);
-		buf[0] = 0x05;
-		buf[1] = 0x07; /* blink + LEDs + motor */
-		offset = 4;
-	} else {
-		memset(buf, 0, DS4_OUTPUT_REPORT_0x11_SIZE);
-		buf[0] = 0x11;
-		buf[1] = 0xC0 /* HID + CRC */ | sc->ds4_bt_poll_interval;
-		buf[3] = 0x07; /* blink + LEDs + motor */
-		offset = 6;
-	}
-
-#ifdef CONFIG_SONY_FF
-	buf[offset++] = sc->right;
-	buf[offset++] = sc->left;
-#else
-	offset += 2;
-#endif
-
-	/* LED 3 is the global control */
-	if (sc->led_state[3]) {
-		buf[offset++] = sc->led_state[0];
-		buf[offset++] = sc->led_state[1];
-		buf[offset++] = sc->led_state[2];
-	} else {
-		offset += 3;
-	}
-
-	/* If both delay values are zero the DualShock 4 disables blinking. */
-	buf[offset++] = sc->led_delay_on[3];
-	buf[offset++] = sc->led_delay_off[3];
-
-	if (sc->quirks & (DUALSHOCK4_CONTROLLER_USB | DUALSHOCK4_DONGLE))
-		hid_hw_output_report(hdev, buf, DS4_OUTPUT_REPORT_0x05_SIZE);
-	else {
-		/* CRC generation */
-		u8 bthdr = 0xA2;
-		u32 crc;
-
-		crc = crc32_le(0xFFFFFFFF, &bthdr, 1);
-		crc = ~crc32_le(crc, buf, DS4_OUTPUT_REPORT_0x11_SIZE-4);
-		put_unaligned_le32(crc, &buf[74]);
-		hid_hw_output_report(hdev, buf, DS4_OUTPUT_REPORT_0x11_SIZE);
-	}
-}
-
 static void motion_send_output_report(struct sony_sc *sc)
 {
 	struct hid_device *hdev = sc->hdev;
@@ -2378,14 +1565,6 @@ static int sony_allocate_output_report(struct sony_sc *sc)
 			devm_kmalloc(&sc->hdev->dev,
 				sizeof(union sixaxis_output_report_01),
 				GFP_KERNEL);
-	else if (sc->quirks & DUALSHOCK4_CONTROLLER_BT)
-		sc->output_report_dmabuf = devm_kmalloc(&sc->hdev->dev,
-						DS4_OUTPUT_REPORT_0x11_SIZE,
-						GFP_KERNEL);
-	else if (sc->quirks & (DUALSHOCK4_CONTROLLER_USB | DUALSHOCK4_DONGLE))
-		sc->output_report_dmabuf = devm_kmalloc(&sc->hdev->dev,
-						DS4_OUTPUT_REPORT_0x05_SIZE,
-						GFP_KERNEL);
 	else if (sc->quirks & MOTION_CONTROLLER)
 		sc->output_report_dmabuf = devm_kmalloc(&sc->hdev->dev,
 						MOTION_REPORT_0x02_SIZE,
@@ -2600,8 +1779,7 @@ static int sony_check_add(struct sony_sc *sc)
 	u8 *buf = NULL;
 	int n, ret;
 
-	if ((sc->quirks & DUALSHOCK4_CONTROLLER_BT) ||
-	    (sc->quirks & MOTION_CONTROLLER_BT) ||
+	if ((sc->quirks & MOTION_CONTROLLER_BT) ||
 	    (sc->quirks & NAVIGATION_CONTROLLER_BT) ||
 	    (sc->quirks & SIXAXIS_CONTROLLER_BT)) {
 		/*
@@ -2614,30 +1792,6 @@ static int sony_check_add(struct sony_sc *sc)
 			hid_warn(sc->hdev, "UNIQ does not contain a MAC address; duplicate check skipped\n");
 			return 0;
 		}
-	} else if (sc->quirks & (DUALSHOCK4_CONTROLLER_USB | DUALSHOCK4_DONGLE)) {
-		buf = kmalloc(DS4_FEATURE_REPORT_0x81_SIZE, GFP_KERNEL);
-		if (!buf)
-			return -ENOMEM;
-
-		/*
-		 * The MAC address of a DS4 controller connected via USB can be
-		 * retrieved with feature report 0x81. The address begins at
-		 * offset 1.
-		 */
-		ret = hid_hw_raw_request(sc->hdev, 0x81, buf,
-				DS4_FEATURE_REPORT_0x81_SIZE, HID_FEATURE_REPORT,
-				HID_REQ_GET_REPORT);
-
-		if (ret != DS4_FEATURE_REPORT_0x81_SIZE) {
-			hid_err(sc->hdev, "failed to retrieve feature report 0x81 with the DualShock 4 MAC address\n");
-			ret = ret < 0 ? ret : -EINVAL;
-			goto out_free;
-		}
-
-		memcpy(sc->mac_address, &buf[1], sizeof(sc->mac_address));
-
-		snprintf(sc->hdev->uniq, sizeof(sc->hdev->uniq),
-			 "%pMR", sc->mac_address);
 	} else if ((sc->quirks & SIXAXIS_CONTROLLER_USB) ||
 			(sc->quirks & NAVIGATION_CONTROLLER_USB)) {
 		buf = kmalloc(SIXAXIS_REPORT_0xF2_SIZE, GFP_KERNEL);
@@ -2686,11 +1840,10 @@ static int sony_set_device_id(struct sony_sc *sc)
 	int ret;
 
 	/*
-	 * Only DualShock 4 or Sixaxis controllers get an id.
+	 * Only Sixaxis controllers get an id.
 	 * All others are set to -1.
 	 */
-	if ((sc->quirks & SIXAXIS_CONTROLLER) ||
-	    (sc->quirks & DUALSHOCK4_CONTROLLER)) {
+	if (sc->quirks & SIXAXIS_CONTROLLER) {
 		ret = ida_simple_get(&sony_device_id_allocator, 0, 0,
 					GFP_KERNEL);
 		if (ret < 0) {
@@ -2728,8 +1881,6 @@ static inline void sony_cancel_work_sync(struct sony_sc *sc)
 {
 	unsigned long flags;
 
-	if (sc->hotplug_worker_initialized)
-		cancel_work_sync(&sc->hotplug_worker);
 	if (sc->state_worker_initialized) {
 		spin_lock_irqsave(&sc->lock, flags);
 		sc->state_worker_initialized = 0;
@@ -2849,68 +2000,6 @@ static int sony_input_configured(struct hid_device *hdev,
 		}
 
 		sony_init_output_report(sc, sixaxis_send_output_report);
-	} else if (sc->quirks & DUALSHOCK4_CONTROLLER) {
-		ret = dualshock4_get_calibration_data(sc);
-		if (ret < 0) {
-			hid_err(hdev, "Failed to get calibration data from Dualshock 4\n");
-			goto err_stop;
-		}
-
-		ret = dualshock4_get_version_info(sc);
-		if (ret < 0) {
-			hid_err(sc->hdev, "Failed to get version data from Dualshock 4\n");
-			goto err_stop;
-		}
-
-		ret = device_create_file(&sc->hdev->dev, &dev_attr_firmware_version);
-		if (ret) {
-			hid_err(sc->hdev, "can't create sysfs firmware_version attribute err: %d\n", ret);
-			goto err_stop;
-		}
-		sc->fw_version_created = true;
-
-		ret = device_create_file(&sc->hdev->dev, &dev_attr_hardware_version);
-		if (ret) {
-			hid_err(sc->hdev, "can't create sysfs hardware_version attribute err: %d\n", ret);
-			goto err_stop;
-		}
-		sc->hw_version_created = true;
-
-		/*
-		 * The Dualshock 4 touchpad supports 2 touches and has a
-		 * resolution of 1920x942 (44.86 dots/mm).
-		 */
-		ret = sony_register_touchpad(sc, 2, 1920, 942, 0, 0, 0);
-		if (ret) {
-			hid_err(sc->hdev,
-			"Unable to initialize multi-touch slots: %d\n",
-			ret);
-			goto err_stop;
-		}
-
-		ret = sony_register_sensors(sc);
-		if (ret) {
-			hid_err(sc->hdev,
-			"Unable to initialize motion sensors: %d\n", ret);
-			goto err_stop;
-		}
-
-		if (sc->quirks & DUALSHOCK4_CONTROLLER_BT) {
-			sc->ds4_bt_poll_interval = DS4_BT_DEFAULT_POLL_INTERVAL_MS;
-			ret = device_create_file(&sc->hdev->dev, &dev_attr_bt_poll_interval);
-			if (ret)
-				hid_warn(sc->hdev,
-				 "can't create sysfs bt_poll_interval attribute err: %d\n",
-				 ret);
-		}
-
-		if (sc->quirks & DUALSHOCK4_DONGLE) {
-			INIT_WORK(&sc->hotplug_worker, dualshock4_calibration_work);
-			sc->hotplug_worker_initialized = 1;
-			sc->ds4_dongle_state = DONGLE_DISCONNECTED;
-		}
-
-		sony_init_output_report(sc, dualshock4_send_output_report);
 	} else if (sc->quirks & NSG_MRXU_REMOTE) {
 		/*
 		 * The NSG-MRxU touchpad supports 2 touches and has a
@@ -2960,16 +2049,6 @@ static int sony_input_configured(struct hid_device *hdev,
 err_close:
 	hid_hw_close(hdev);
 err_stop:
-	/* Piggy back on the default ds4_bt_ poll_interval to determine
-	 * if we need to remove the file as we don't know for sure if we
-	 * executed that logic.
-	 */
-	if (sc->ds4_bt_poll_interval)
-		device_remove_file(&sc->hdev->dev, &dev_attr_bt_poll_interval);
-	if (sc->fw_version_created)
-		device_remove_file(&sc->hdev->dev, &dev_attr_firmware_version);
-	if (sc->hw_version_created)
-		device_remove_file(&sc->hdev->dev, &dev_attr_hardware_version);
 	sony_cancel_work_sync(sc);
 	sony_remove_dev_list(sc);
 	sony_release_device_id(sc);
@@ -3014,13 +2093,13 @@ static int sony_probe(struct hid_device *hdev, const struct hid_device_id *id)
 	else if (sc->quirks & SIXAXIS_CONTROLLER)
 		connect_mask |= HID_CONNECT_HIDDEV_FORCE;
 
-	/* Patch the hw version on DS3/4 compatible devices, so applications can
+	/* Patch the hw version on DS3 compatible devices, so applications can
 	 * distinguish between the default HID mappings and the mappings defined
 	 * by the Linux game controller spec. This is important for the SDL2
 	 * library, which has a game controller database, which uses device ids
 	 * in combination with version as a key.
 	 */
-	if (sc->quirks & (SIXAXIS_CONTROLLER | DUALSHOCK4_CONTROLLER))
+	if (sc->quirks & SIXAXIS_CONTROLLER)
 		hdev->version |= 0x8000;
 
 	ret = hid_hw_start(hdev, connect_mask);
@@ -3091,15 +2170,6 @@ static void sony_remove(struct hid_device *hdev)
 
 	hid_hw_close(hdev);
 
-	if (sc->quirks & DUALSHOCK4_CONTROLLER_BT)
-		device_remove_file(&sc->hdev->dev, &dev_attr_bt_poll_interval);
-
-	if (sc->fw_version_created)
-		device_remove_file(&sc->hdev->dev, &dev_attr_firmware_version);
-
-	if (sc->hw_version_created)
-		device_remove_file(&sc->hdev->dev, &dev_attr_hardware_version);
-
 	sony_cancel_work_sync(sc);
 
 	sony_remove_dev_list(sc);
@@ -3180,17 +2250,6 @@ static const struct hid_device_id sony_devices[] = {
 	/* SMK-Link PS3 BD Remote Control */
 	{ HID_BLUETOOTH_DEVICE(USB_VENDOR_ID_SMK, USB_DEVICE_ID_SMK_PS3_BDREMOTE),
 		.driver_data = PS3REMOTE },
-	/* Sony Dualshock 4 controllers for PS4 */
-	{ HID_USB_DEVICE(USB_VENDOR_ID_SONY, USB_DEVICE_ID_SONY_PS4_CONTROLLER),
-		.driver_data = DUALSHOCK4_CONTROLLER_USB },
-	{ HID_BLUETOOTH_DEVICE(USB_VENDOR_ID_SONY, USB_DEVICE_ID_SONY_PS4_CONTROLLER),
-		.driver_data = DUALSHOCK4_CONTROLLER_BT },
-	{ HID_USB_DEVICE(USB_VENDOR_ID_SONY, USB_DEVICE_ID_SONY_PS4_CONTROLLER_2),
-		.driver_data = DUALSHOCK4_CONTROLLER_USB },
-	{ HID_BLUETOOTH_DEVICE(USB_VENDOR_ID_SONY, USB_DEVICE_ID_SONY_PS4_CONTROLLER_2),
-		.driver_data = DUALSHOCK4_CONTROLLER_BT },
-	{ HID_USB_DEVICE(USB_VENDOR_ID_SONY, USB_DEVICE_ID_SONY_PS4_CONTROLLER_DONGLE),
-		.driver_data = DUALSHOCK4_DONGLE },
 	/* Nyko Core Controller for PS3 */
 	{ HID_USB_DEVICE(USB_VENDOR_ID_SINO_LITE, USB_DEVICE_ID_SINO_LITE_CONTROLLER),
 		.driver_data = SIXAXIS_CONTROLLER_USB | SINO_LITE_CONTROLLER },
-- 
2.38.1

