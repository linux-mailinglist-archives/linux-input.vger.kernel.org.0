Return-Path: <linux-input+bounces-13863-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A47DDB1E14A
	for <lists+linux-input@lfdr.de>; Fri,  8 Aug 2025 06:32:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 995633B91BC
	for <lists+linux-input@lfdr.de>; Fri,  8 Aug 2025 04:32:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E79871DC98C;
	Fri,  8 Aug 2025 04:32:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=endrift.com header.i=@endrift.com header.b="w/drWrnz"
X-Original-To: linux-input@vger.kernel.org
Received: from endrift.com (endrift.com [173.255.198.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0CA891C5D72
	for <linux-input@vger.kernel.org>; Fri,  8 Aug 2025 04:32:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=173.255.198.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754627537; cv=none; b=oNAQ1MqItFzNxP4StpsSFlIp3Gtyh/CVzURq1Bd5sqyjREj1KK+vOB6IRDOSQbVpNCf8E+7aL+9secPC1ask24AA6dl9SzXnQr2ENaBqpH5nBXsG+SN4enCwFvPGWD4yCFvJ+UcAB+xE1cRVKIlJT080oGREYZOSctKF/rjSE/g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754627537; c=relaxed/simple;
	bh=kNBAskOENIObQq4+4C+x45WGxfUAczrDoiqIrzpOTdY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=DnLihULVIziOW21WOpxEsBdw9f3zyF7zbzHNgq8dzVwBjNE0vaHWHI9cehSOIXjizmpu7/ZVCLyZdbFq6GCRLTJolNa1tQTNdXf3BWCBQBoGEZaS13Gp99H5urIlKOYqFA+Bl+S+FkbMJQiVZ+WfQAhrP072nuNf0y20s3Zrmnw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=endrift.com; spf=pass smtp.mailfrom=endrift.com; dkim=pass (2048-bit key) header.d=endrift.com header.i=@endrift.com header.b=w/drWrnz; arc=none smtp.client-ip=173.255.198.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=endrift.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=endrift.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=endrift.com; s=2020;
	t=1754627529; bh=kNBAskOENIObQq4+4C+x45WGxfUAczrDoiqIrzpOTdY=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=w/drWrnzyk5ksS3ImtpVnZJSPxxMz3MWk17JUxagdkda2HF2Bd5+OAECQe3GV+Eww
	 IouQ1qCmZZr8jqPtz9sjCczbV7qnl/8YGak0qhUASa2TrmFSPtRgZJnhCTI1nnhWV7
	 ocaiEJH4h0Hm9maVG5tTey9uMauHON3cOy3MdwF/zaS8it3Thd844JTxNXCEHSuiHb
	 ob1giNbVjU3J2pAwnIegiUuCBpGCxDPCtB1ZVS5neyMbnK+1Jf5c9ys09jO6bRpKhu
	 9KM7ygRN/Anhjc0dcGLlLJ8fbyXoJ+PMpnCqPrM/T6uLOBL6K7+fqnGxNXkmF4gcXE
	 wjhpUR8Rh3CGw==
Received: from nebulosa.vulpes.eutheria.net (71-212-74-234.tukw.qwest.net [71.212.74.234])
	by endrift.com (Postfix) with ESMTPSA id D8BF2A264;
	Thu,  7 Aug 2025 21:32:08 -0700 (PDT)
From: Vicki Pfau <vi@endrift.com>
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	linux-input@vger.kernel.org
Cc: Vicki Pfau <vi@endrift.com>
Subject: [PATCH 5/6] Input: xbox_gip - Add wheel support
Date: Thu,  7 Aug 2025 21:30:12 -0700
Message-ID: <20250808043017.1953101-6-vi@endrift.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250808043017.1953101-1-vi@endrift.com>
References: <20250808043017.1953101-1-vi@endrift.com>
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
index afb70311c064e..874705a9b6bfb 100644
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
@@ -219,6 +219,22 @@
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
@@ -234,6 +250,8 @@
 
 #define GIP_QUIRK_NO_HELLO		BIT(0)
 #define GIP_QUIRK_NO_IMPULSE_VIBRATION	BIT(1)
+#define GIP_QUIRK_FORCE_GAMEPAD_SB	BIT(2)
+#define GIP_QUIRK_WHEEL_FORCE_HANDBRAKE	BIT(31)
 
 #define GIP_LED_GUIDE_MAX_BRIGHTNESS	100 /* Spec says 47, but larger values work */
 #define GIP_LED_GUIDE_INIT_BRIGHTNESS	20
@@ -276,6 +294,11 @@ enum gip_elite_button_format {
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
@@ -354,6 +377,18 @@ static const struct gip_audio_format gip_audio_format_table[MAX_GIP_AUDIO_FORMAT
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
@@ -370,6 +405,11 @@ struct gip_quirks {
 };
 
 static const struct gip_quirks quirks[] = {
+	/* Thrustmaster T128X GIP Racing Wheel */
+	{ 0x044f, 0xb69c, 0,
+		.quirks = GIP_QUIRK_FORCE_GAMEPAD_SB | GIP_QUIRK_WHEEL_FORCE_HANDBRAKE,
+		.device_type = GIP_TYPE_WHEEL },
+
 	/* Xbox One Controller (model 1573) */
 	{ 0x045e, 0x02d1, 0, .override_name = "Xbox One Controller" },
 
@@ -497,11 +537,14 @@ struct gip_attachment {
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
 
@@ -1573,10 +1616,44 @@ static int gip_setup_input_device(struct gip_attachment *attachment)
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
@@ -1601,6 +1678,11 @@ static int gip_setup_input_device(struct gip_attachment *attachment)
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
@@ -1680,6 +1762,14 @@ static int gip_send_init_sequence(struct gip_attachment *attachment)
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
@@ -1688,7 +1778,8 @@ static int gip_send_init_sequence(struct gip_attachment *attachment)
 			sizeof(attachment->phys) - len, "/input%d",
 			attachment->attachment_index);
 
-	if (gip_attachment_is_controller(attachment) && !attachment->input) {
+	if (gip_attachment_is_controller(attachment) && !attachment->input
+		&& attachment->attachment_type != GIP_TYPE_WHEEL) {
 		rc = gip_setup_input_device(attachment);
 		if (rc == -ENODEV)
 			return 0;
@@ -2005,6 +2096,13 @@ static int gip_handle_command_metadata_respose(struct gip_attachment *attachment
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
@@ -2307,13 +2405,87 @@ static void gip_handle_arcade_stick_report(struct gip_attachment *attachment,
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
@@ -2336,6 +2508,14 @@ static int gip_handle_ll_input_report(struct gip_attachment *attachment,
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
@@ -2413,9 +2593,22 @@ static int gip_handle_ll_input_report(struct gip_attachment *attachment,
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
2.50.1


