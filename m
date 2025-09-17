Return-Path: <linux-input+bounces-14781-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id DFD37B7C4AC
	for <lists+linux-input@lfdr.de>; Wed, 17 Sep 2025 13:56:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 1464B16955D
	for <lists+linux-input@lfdr.de>; Wed, 17 Sep 2025 01:20:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ADCCB1E32B9;
	Wed, 17 Sep 2025 01:20:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=endrift.com header.i=@endrift.com header.b="I5/XFK3E"
X-Original-To: linux-input@vger.kernel.org
Received: from endrift.com (endrift.com [173.255.198.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B62B021C166
	for <linux-input@vger.kernel.org>; Wed, 17 Sep 2025 01:20:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=173.255.198.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758072009; cv=none; b=NwFpy8yS8cb1uVc+mrePfDi3+0UFCVJK/e03JkhFqGrby9nPYUQGMFjlv2PyJgpjjbCd+DVpcpEmnkbmspnlHyeEA1TvFtKrVXJfG5IpeerlaPR/t0cKSm8zCYeRHS4D5+JYK/qkjDI1MrULb8Ly0vfB8u6Z9aX9483j3q6j+Go=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758072009; c=relaxed/simple;
	bh=FpqAjcXDyT6QWLdSK0Vy03u6WrM9E/XiK/D9UP9mZs0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=XJTxPA0YGg6nsdA+usdd0L7Wjv+m4xo651vm7ZrxGBnAGEcOJrAvCWA71qt6UfFJw2ts8taA7bPN8EYaNyslP+6S5ltSPOOj0OfVISmRKxdC8B+BNRAi63ibJ3Lzm6VQvCsak/Kilz1lLTBWe1c/cMTeV387EKSrbYAlYZ4O3VM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=endrift.com; spf=pass smtp.mailfrom=endrift.com; dkim=pass (2048-bit key) header.d=endrift.com header.i=@endrift.com header.b=I5/XFK3E; arc=none smtp.client-ip=173.255.198.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=endrift.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=endrift.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=endrift.com; s=2020;
	t=1758071999; bh=FpqAjcXDyT6QWLdSK0Vy03u6WrM9E/XiK/D9UP9mZs0=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=I5/XFK3EWg/Iv/LjxIRUC/ElqMMD8AauIEyTN9zB4RwX+l23TjYTdYqMIyVPMPtFF
	 uhWkYjwFcDeWE5W7IMkpn/wsRSwNOAIbbqGoqkJV0pjqU4znQbmnsPEBlxmUla6c6u
	 iRQaYiJee91aFFvz1f5Geut3EQ6+hEOqpW0izt11xG9Cyylca2yA5cYmhs5MbXxbrx
	 3oqHvKmiXyhUXD43ya96ZDsG3Xx0ohiNzsb+vL/yt4GOQO4iG6O94B1W5gpwBtfhN6
	 mlvupdT5aH2KRmg7eHBpq4RTuN7OSicNgDLg3Ui6TzmGTWq40S5xts51W6j1/bhPt8
	 e3J2MqACE4VZw==
Received: from microtis.vulpes.eutheria.net (71-212-74-234.tukw.qwest.net [71.212.74.234])
	by endrift.com (Postfix) with ESMTPSA id 952F0A199;
	Tue, 16 Sep 2025 18:19:59 -0700 (PDT)
From: Vicki Pfau <vi@endrift.com>
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	linux-input@vger.kernel.org
Cc: Vicki Pfau <vi@endrift.com>
Subject: [PATCH v2 5/5] Input: xbox_gip - Add wheel support
Date: Tue, 16 Sep 2025 18:19:34 -0700
Message-ID: <20250917011937.1649481-6-vi@endrift.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20250917011937.1649481-1-vi@endrift.com>
References: <20250917011937.1649481-1-vi@endrift.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This adds preliminary support for racing wheel support in xbox_gip,
exposing them mapped to the newly added axes.

Signed-off-by: Vicki Pfau <vi@endrift.com>
---
 drivers/input/joystick/xbox_gip.c | 209 ++++++++++++++++++++++++++++--
 1 file changed, 201 insertions(+), 8 deletions(-)

diff --git a/drivers/input/joystick/xbox_gip.c b/drivers/input/joystick/xbox_gip.c
index 94e20ab4b672c..1be6ad0d6eb66 100644
--- a/drivers/input/joystick/xbox_gip.c
+++ b/drivers/input/joystick/xbox_gip.c
@@ -10,7 +10,7 @@
  * - Event logging
  * - Sending fragmented messages
  * - Raw character device
- * - Wheel support
+ * - Wheel force feedback
  * - Flight stick support
  * - More arcade stick testing
  * - Arcade stick extra buttons
@@ -220,6 +220,22 @@
 #define GIP_EXTENDED_STATUS_ACCESS_DENIED	3
 #define GIP_EXTENDED_STATUS_FAILED		4
 
+/* Wheel-specific flags */
+#define GIP_WHEEL_HAS_POWER		BIT(3)
+#define GIP_WHEEL_HANDBRAKE_CONN	BIT(4)
+#define GIP_WHEEL_CLUTCH_CONN		BIT(5)
+#define GIP_WHEEL_BRAKE_CONN		BIT(6)
+#define GIP_WHEEL_THROTTLE_CONN		BIT(7)
+
+#define GIP_HSHIFTER_NONE	0
+#define GIP_HSHIFTER_2POS	1 /* 2 position, no neutral */
+#define GIP_HSHIFTER_2POS_N	2 /* 2 position, neutral */
+#define GIP_HSHIFTER_RTL_1TL	3 /* Reverse top left, first top left */
+#define GIP_HSHIFTER_RTL_1BL	4 /* Reverse top left, first bottom left */
+#define GIP_HSHIFTER_RBL	5 /* Reverse bottom left */
+#define GIP_HSHIFTER_RTR	6 /* Reverse top right */
+#define GIP_HSHIFTER_RBR	7 /* Reverse bottom right */
+
 /* Internal constants, not part of protocol */
 #define GIP_DEFAULT_IN_SYSTEM_MESSAGES 0x5e
 #define GIP_DEFAULT_OUT_SYSTEM_MESSAGES 0x472
@@ -235,6 +251,8 @@
 
 #define GIP_QUIRK_NO_HELLO		BIT(0)
 #define GIP_QUIRK_NO_IMPULSE_VIBRATION	BIT(1)
+#define GIP_QUIRK_FORCE_GAMEPAD_SB	BIT(2)
+#define GIP_QUIRK_WHEEL_FORCE_HANDBRAKE	BIT(31)
 
 #define GIP_LED_GUIDE_MAX_BRIGHTNESS	100 /* Spec says 47, but larger values work */
 #define GIP_LED_GUIDE_INIT_BRIGHTNESS	20
@@ -277,6 +295,11 @@ enum gip_elite_button_format {
 	GIP_BTN_FMT_XBE2_5,
 };
 
+enum gip_vendor_type {
+	GIP_VENDOR_NONE = 0,
+	GIP_VENDOR_LOGI_TRUE_FORCE_WHEEL = 1,
+};
+
 static const guid_t guid_arcade_stick =
 	GUID_INIT(0x332054cc, 0xa34b, 0x41d5, 0xa3, 0x4a, 0xa6, 0xa6, 0x71, 0x1e, 0xc4, 0xb3);
 static const guid_t guid_console_function_map =
@@ -355,6 +378,18 @@ static const struct gip_audio_format gip_audio_format_table[MAX_GIP_AUDIO_FORMAT
 	[GIP_AUDIO_FORMAT_48000HZ_8CH] = { .rate = 48000, .channels = 8 },
 };
 
+struct gip_wheel_info {
+	uint8_t connections;
+	uint8_t shifter_type: 3;
+	uint8_t max_gear: 5;
+	uint16_t angle_setting;
+	uint16_t max_angle;
+	uint16_t max_throttle;
+	uint16_t max_brake;
+	uint16_t max_clutch;
+	uint8_t max_handbrake;
+};
+
 struct gip_quirks {
 	uint16_t vendor_id;
 	uint16_t product_id;
@@ -371,6 +406,11 @@ struct gip_quirks {
 };
 
 static const struct gip_quirks quirks[] = {
+	/* Thrustmaster T128X GIP Racing Wheel */
+	{ 0x044f, 0xb69c, 0,
+		.quirks = GIP_QUIRK_FORCE_GAMEPAD_SB | GIP_QUIRK_WHEEL_FORCE_HANDBRAKE,
+		.device_type = GIP_TYPE_WHEEL },
+
 	/* Xbox One Controller (model 1573) */
 	{ 0x045e, 0x02d1, 0, .override_name = "Xbox One Controller" },
 
@@ -498,11 +538,14 @@ struct gip_attachment {
 	enum gip_elite_button_format xbe_format;
 	uint32_t features;
 	uint32_t quirks;
+	enum gip_vendor_type vendor_type;
 
 	int extra_buttons;
 	int extra_axes;
 
 	bool dpad_as_buttons;
+	struct gip_wheel_info wheel;
+	int8_t logi_dial_state;
 	struct hid_device *hdev;
 };
 
@@ -1574,10 +1617,44 @@ static int gip_setup_input_device(struct gip_attachment *attachment)
 		input_set_capability(input, EV_KEY, BTN_THUMBR);
 		input_set_capability(input, EV_KEY, BTN_THUMBL);
 		break;
-	case GIP_TYPE_FLIGHT_STICK:
 	case GIP_TYPE_WHEEL:
+		input_set_abs_params(input, ABS_WHEEL,
+			-attachment->wheel.max_angle - 1,
+			attachment->wheel.max_angle, 0, 0);
+		input_abs_set_res(input, ABS_WHEEL, attachment->wheel.angle_setting);
+		if (attachment->wheel.max_throttle)
+			input_set_abs_params(input, ABS_GAS, 0,
+				attachment->wheel.max_throttle, 0, 0);
+
+		if (attachment->wheel.max_brake)
+			input_set_abs_params(input, ABS_BRAKE, 0,
+				attachment->wheel.max_brake, 0, 0);
+
+		if (attachment->wheel.max_clutch)
+			input_set_abs_params(input, ABS_CLUTCH, 0,
+				attachment->wheel.max_clutch, 0, 0);
+
+		if (attachment->wheel.max_handbrake)
+			input_set_abs_params(input, ABS_HANDBRAKE, 0,
+				attachment->wheel.max_handbrake, 0, 0);
+
+		if (attachment->wheel.shifter_type)
+			input_set_abs_params(input, ABS_SHIFTER, -1,
+				attachment->wheel.max_gear, 0, 0);
+
+
+		if (attachment->vendor_type == GIP_VENDOR_LOGI_TRUE_FORCE_WHEEL) {
+			input_set_capability(input, EV_KEY, BTN_THUMBL);
+			input_set_capability(input, EV_KEY, BTN_THUMBR);
+			input_set_capability(input, EV_KEY, KEY_KPPLUS);
+			input_set_capability(input, EV_KEY, KEY_KPMINUS);
+			input_set_capability(input, EV_KEY, KEY_KPENTER);
+			input_set_capability(input, EV_REL, REL_DIAL);
+		}
+		break;
 	case GIP_TYPE_UNKNOWN:
 	case GIP_TYPE_NAVIGATION_CONTROLLER:
+	case GIP_TYPE_FLIGHT_STICK:
 		break;
 	case GIP_TYPE_CHATPAD:
 	case GIP_TYPE_HEADSET:
@@ -1602,6 +1679,11 @@ static int gip_setup_input_device(struct gip_attachment *attachment)
 	if (attachment->vendor_id == 0x045e && attachment->product_id == 0x0b0a)
 		input_set_abs_params(input, ABS_PROFILE, 0, 3, 0, 0);
 
+	if (attachment->quirks & GIP_QUIRK_WHEEL_FORCE_HANDBRAKE) {
+		input_set_capability(input, EV_KEY, BTN_THUMBR);
+		input_set_capability(input, EV_KEY, BTN_THUMBL);
+	}
+
 #ifdef CONFIG_JOYSTICK_XBOX_GIP_FF
 	if (attachment->features & GIP_FEATURE_MOTOR_CONTROL) {
 		input_set_capability(input, EV_FF, FF_RUMBLE);
@@ -1681,6 +1763,14 @@ static int gip_send_init_sequence(struct gip_attachment *attachment)
 			return rc;
 	}
 
+	if (attachment->attachment_type == GIP_TYPE_WHEEL) {
+		struct gip_initial_reports_request request = { 0 };
+
+		gip_send_vendor_message(attachment,
+			GIP_CMD_INITIAL_REPORTS_REQUEST, 0, &request,
+			sizeof(request));
+	}
+
 	usb_make_path(attachment->device->udev, attachment->phys,
 		sizeof(attachment->phys));
 	len = strlen(attachment->phys);
@@ -1689,7 +1779,8 @@ static int gip_send_init_sequence(struct gip_attachment *attachment)
 			sizeof(attachment->phys) - len, "/input%d",
 			attachment->attachment_index);
 
-	if (gip_attachment_is_controller(attachment) && !attachment->input) {
+	if (gip_attachment_is_controller(attachment) && !attachment->input
+		&& attachment->attachment_type != GIP_TYPE_WHEEL) {
 		rc = gip_setup_input_device(attachment);
 		if (rc == -ENODEV)
 			return 0;
@@ -2006,6 +2097,13 @@ static int gip_handle_command_metadata_respose(struct gip_attachment *attachment
 			expected_guid = &guid_headset;
 			break;
 		}
+
+		if (strcmp(type, "Logi.Xbox.Input.TrueForceWheel") == 0) {
+			attachment->attachment_type = GIP_TYPE_WHEEL;
+			attachment->vendor_type = GIP_VENDOR_LOGI_TRUE_FORCE_WHEEL;
+			expected_guid = &guid_logi_true_force_wheel;
+			break;
+		}
 	}
 
 	found_expected_guid = !expected_guid;
@@ -2308,13 +2406,87 @@ static void gip_handle_arcade_stick_report(struct gip_attachment *attachment,
 	}
 }
 
+static void gip_handle_wheel_report(struct gip_attachment *attachment,
+	struct input_dev *dev, const uint8_t *bytes, int num_bytes)
+{
+	int32_t axis;
+
+	if (num_bytes < 16)
+		return;
+
+	axis = bytes[2];
+	axis |= bytes[3] << 8;
+	input_report_abs(dev, ABS_WHEEL, axis - 0x8000);
+
+	if (attachment->wheel.connections & GIP_WHEEL_THROTTLE_CONN) {
+		axis = bytes[4];
+		axis |= bytes[5] << 8;
+		input_report_abs(dev, ABS_GAS, axis);
+	}
+
+	if (attachment->wheel.connections & GIP_WHEEL_BRAKE_CONN) {
+		axis = bytes[6];
+		axis |= bytes[7] << 8;
+		input_report_abs(dev, ABS_BRAKE, axis);
+	}
+
+	if (attachment->wheel.connections & GIP_WHEEL_CLUTCH_CONN) {
+		axis = bytes[8];
+		axis |= bytes[9] << 8;
+		input_report_abs(dev, ABS_CLUTCH, axis);
+	}
+
+	if (attachment->wheel.connections & GIP_WHEEL_HANDBRAKE_CONN)
+		input_report_abs(dev, ABS_HANDBRAKE, bytes[10]);
+
+	if (attachment->wheel.shifter_type)
+		input_report_abs(dev, ABS_SHIFTER, (int8_t)bytes[12]);
+
+	if (attachment->vendor_type == GIP_VENDOR_LOGI_TRUE_FORCE_WHEEL && num_bytes >= 18) {
+		int dial = bytes[17] >> 5;
+
+		input_report_key(dev, BTN_THUMBL, bytes[17] & BIT(0));
+		input_report_key(dev, BTN_THUMBR, bytes[17] & BIT(1));
+		input_report_key(dev, KEY_KPPLUS, bytes[17] & BIT(2));
+		input_report_key(dev, KEY_KPMINUS, bytes[17] & BIT(3));
+		input_report_key(dev, KEY_KPENTER, bytes[17] & BIT(4));
+		if (dial == 0 && attachment->logi_dial_state == 7)
+			input_report_rel(dev, REL_DIAL, -1);
+		else if (dial == 7 && attachment->logi_dial_state == 0)
+			input_report_rel(dev, REL_DIAL, 1);
+		else
+			input_report_rel(dev, REL_DIAL,
+				attachment->logi_dial_state - dial);
+		attachment->logi_dial_state = dial;
+	}
+}
+
 static int gip_handle_ll_input_report(struct gip_attachment *attachment,
 	const struct gip_header *header, const uint8_t *bytes, int num_bytes)
 {
 	struct input_dev *dev = attachment->input;
 
-	if (!dev)
-		return -ENODEV;
+	if (!dev) {
+		if (attachment->attachment_type == GIP_TYPE_WHEEL) {
+			if (num_bytes < 17)
+				return -EINVAL;
+			attachment->wheel.max_gear = bytes[11] & 0x1F;
+			attachment->wheel.shifter_type = bytes[11] >> 5;
+			attachment->wheel.angle_setting = bytes[13];
+			attachment->wheel.angle_setting |= bytes[14] << 8;
+			attachment->wheel.connections = bytes[16];
+
+			if (attachment->quirks & GIP_QUIRK_WHEEL_FORCE_HANDBRAKE)
+				attachment->wheel.connections |= GIP_WHEEL_HANDBRAKE_CONN;
+
+			if (attachment->wheel.angle_setting && attachment->wheel.max_angle)
+				return gip_setup_input_device(attachment);
+			else
+				return 0;
+		} else {
+			return -ENODEV;
+		}
+	}
 
 	if (attachment->device_state != GIP_STATE_START) {
 		dev_dbg(GIP_DEV(attachment), "Discarding early input report\n");
@@ -2337,6 +2509,14 @@ static int gip_handle_ll_input_report(struct gip_attachment *attachment,
 	case GIP_TYPE_ARCADE_STICK:
 		gip_handle_arcade_stick_report(attachment, dev, bytes, num_bytes);
 		break;
+	case GIP_TYPE_WHEEL:
+		gip_handle_wheel_report(attachment, dev, bytes, num_bytes);
+		break;
+	}
+
+	if (attachment->quirks & GIP_QUIRK_FORCE_GAMEPAD_SB) {
+		input_report_key(dev, BTN_THUMBL, bytes[1] & BIT(6));
+		input_report_key(dev, BTN_THUMBR, bytes[1] & BIT(7));
 	}
 
 	if (attachment->features & GIP_FEATURE_ELITE_BUTTONS) {
@@ -2414,9 +2594,22 @@ static int gip_handle_ll_input_report(struct gip_attachment *attachment,
 static int gip_handle_ll_static_configuration(struct gip_attachment *attachment,
 	const struct gip_header *header, const uint8_t *bytes, int num_bytes)
 {
-	/* TODO */
-	dev_dbg(GIP_DEV(attachment), "Unimplemented Static Configuration message\n");
-	return -ENOTSUPP;
+	if (attachment->attachment_type == GIP_TYPE_WHEEL) {
+		if (num_bytes < 11)
+			return -EINVAL;
+		attachment->wheel.max_angle = BIT(bytes[0]) - 1;
+		attachment->wheel.max_throttle = BIT(bytes[1]) - 1;
+		attachment->wheel.max_brake = BIT(bytes[2]) - 1;
+		attachment->wheel.max_clutch = BIT(bytes[3]) - 1;
+		attachment->wheel.max_handbrake = BIT(bytes[4]) - 1;
+		if (attachment->wheel.angle_setting && attachment->wheel.max_angle)
+			return gip_setup_input_device(attachment);
+	} else {
+		/* TODO */
+		dev_dbg(GIP_DEV(attachment), "Unimplemented Static Configuration message\n");
+		return -ENOTSUPP;
+	}
+	return 0;
 }
 
 static int gip_handle_ll_button_info_report(struct gip_attachment *attachment,
-- 
2.51.0


