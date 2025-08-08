Return-Path: <linux-input+bounces-13862-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D13F3B1E148
	for <lists+linux-input@lfdr.de>; Fri,  8 Aug 2025 06:32:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 006C816489A
	for <lists+linux-input@lfdr.de>; Fri,  8 Aug 2025 04:32:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CD36F1DB95E;
	Fri,  8 Aug 2025 04:32:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=endrift.com header.i=@endrift.com header.b="ByrqbJcz"
X-Original-To: linux-input@vger.kernel.org
Received: from endrift.com (endrift.com [173.255.198.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0CA381C3BEB
	for <linux-input@vger.kernel.org>; Fri,  8 Aug 2025 04:32:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=173.255.198.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754627537; cv=none; b=r1C4IDJZv9hlpfojDP0co98ObIxm7v6/2OkvswV6hMLrx8cBu1GjlLTqTY74pExegeYYYrvhGRoCXQluOB0Td0NVRcDis7OFYxv09JuM6zImWCwpnyYbc40lUJHzyTxd/W9GG25lXYvVAwsV3TWG5MYaHcZzDywprfhj3z0lfDI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754627537; c=relaxed/simple;
	bh=hE2nbM9euRAu1xQkKR+wKOytZJqwscD7rFx8m6XAeH0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=eW1TRO7MRQMKrOoHPhyrLJ5UkevWInUOMYdT174SH0sonzwLEUgcWEDNy8BPa1tOl05RMqdlCbH0p9hD0Gm5blR04Cr9zVY+qNAHCzNuiyTus5EB0y6cy2dIWmsLxpZCzvyjAMaZ6ed+zWlkcoHSSVwN0K9oIFkX1EYtzVSL9HQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=endrift.com; spf=pass smtp.mailfrom=endrift.com; dkim=pass (2048-bit key) header.d=endrift.com header.i=@endrift.com header.b=ByrqbJcz; arc=none smtp.client-ip=173.255.198.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=endrift.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=endrift.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=endrift.com; s=2020;
	t=1754627529; bh=hE2nbM9euRAu1xQkKR+wKOytZJqwscD7rFx8m6XAeH0=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=ByrqbJczL5ZIyyOLwUkLVPTdMOnEFLuEHS7Q93h4kdvbRDSO8+chfnePUJLq3XLt2
	 /XVMtH/iCykB6Rj3jAHb8pnVteJbF5KVe4Kh/B9cONGYdExcuyqd6dkmi+auk7hHoB
	 MLefN96FPewfdaLUHSmDhtrG5y3htgxlqZBCzpGSecCGHUs7eturioyHBQgyV+aPjB
	 bhTJf6vO6plC8wpS6lrYOKaGoCdCSM+2ex1L8hzew3SvBvlkFSnaw8Y5dg5AIHf9pC
	 plaKmXExWVeSp6HjTQRAt7scfbb9AZCdJXCvBWbSYpV53aHUKgqj9c4dajS4+HmeKC
	 PeobDqaQf8Raw==
Received: from nebulosa.vulpes.eutheria.net (71-212-74-234.tukw.qwest.net [71.212.74.234])
	by endrift.com (Postfix) with ESMTPSA id 33F4513208A;
	Thu,  7 Aug 2025 21:32:09 -0700 (PDT)
From: Vicki Pfau <vi@endrift.com>
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	linux-input@vger.kernel.org
Cc: Vicki Pfau <vi@endrift.com>
Subject: [PATCH 6/6] Input: xbox_gip - Add flight stick support
Date: Thu,  7 Aug 2025 21:30:13 -0700
Message-ID: <20250808043017.1953101-7-vi@endrift.com>
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

This adds preliminary flight stick support, with a few caveats:

- Flight sticks support up to 64 extra buttons. This only exposes the first
  50, as there isn't any good place to map the remainder.
- Flight sticks support up to 12 extra axes. This picks a fairly abritrary
  mapping for them, as there's again no good place to map them.

Flight sticks also have addressible LEDs, but I don't have a device that
supports them so I can't test them yet.

Signed-off-by: Vicki Pfau <vi@endrift.com>
---
 drivers/input/joystick/xbox_gip.c | 126 +++++++++++++++++++++++++++++-
 1 file changed, 123 insertions(+), 3 deletions(-)

diff --git a/drivers/input/joystick/xbox_gip.c b/drivers/input/joystick/xbox_gip.c
index 874705a9b6bfb..36611ba8d038e 100644
--- a/drivers/input/joystick/xbox_gip.c
+++ b/drivers/input/joystick/xbox_gip.c
@@ -11,9 +11,10 @@
  * - Sending fragmented messages
  * - Raw character device
  * - Wheel force feedback
- * - Flight stick support
  * - More arcade stick testing
  * - Arcade stick extra buttons
+ * - More flight stick testing
+ * - Flight stick LEDs
  *
  * This driver is based on the Microsoft GIP spec at:
  * https://aka.ms/gipdocs
@@ -37,6 +38,9 @@
 #define MAX_MESSAGE_LENGTH 0x4000
 #define MAX_ATTACHMENTS 8
 
+#define MAX_GIP_FLIGHT_STICK_BUTTONS 64
+#define MAX_GIP_FLIGHT_STICK_AXES 12
+
 #define MAX_IN_MESSAGES 8
 #define MAX_OUT_MESSAGES 8
 
@@ -377,6 +381,21 @@ static const struct gip_audio_format gip_audio_format_table[MAX_GIP_AUDIO_FORMAT
 	[GIP_AUDIO_FORMAT_48000HZ_8CH] = { .rate = 48000, .channels = 8 },
 };
 
+static const unsigned int gip_flight_stick_extra_axes[MAX_GIP_FLIGHT_STICK_AXES] = {
+	ABS_RUDDER,
+	ABS_WHEEL,
+	ABS_GAS,
+	ABS_BRAKE,
+	ABS_CLUTCH,
+	ABS_HANDBRAKE,
+	ABS_HAT1X,
+	ABS_HAT1Y,
+	ABS_HAT2X,
+	ABS_HAT2Y,
+	ABS_HAT3X,
+	ABS_HAT3Y,
+};
+
 struct gip_wheel_info {
 	uint8_t connections;
 	uint8_t shifter_type: 3;
@@ -1564,6 +1583,7 @@ static bool gip_send_set_device_state(struct gip_attachment *attachment, uint8_t
 static int gip_setup_input_device(struct gip_attachment *attachment)
 {
 	struct input_dev *input;
+	int i;
 	int rc;
 
 	input = input_allocate_device();
@@ -1616,6 +1636,24 @@ static int gip_setup_input_device(struct gip_attachment *attachment)
 		input_set_capability(input, EV_KEY, BTN_THUMBR);
 		input_set_capability(input, EV_KEY, BTN_THUMBL);
 		break;
+	case GIP_TYPE_FLIGHT_STICK:
+		input_set_capability(input, EV_KEY, BTN_TOP);
+		input_set_capability(input, EV_KEY, BTN_TOP2);
+		for (i = 0; i < attachment->extra_buttons && i < 10; i++)
+			input_set_capability(input, EV_KEY, BTN_0 + i);
+		for (i = 10; i < attachment->extra_buttons && i - 10 < 40; i++)
+			input_set_capability(input, EV_KEY, BTN_TRIGGER_HAPPY + i - 10);
+		if (attachment->extra_buttons > 50)
+			dev_info(GIP_DEV(attachment),
+				"Device has too many extra buttons, 51 through %i ignored\n",
+				attachment->extra_buttons);
+		input_set_abs_params(input, ABS_X, -32768, 32767, 0, 0);
+		input_set_abs_params(input, ABS_Y, -32768, 32767, 0, 0);
+		input_set_abs_params(input, ABS_Z, -32768, 32767, 0, 0);
+		input_set_abs_params(input, ABS_THROTTLE, 0, 65535, 0, 0);
+		for (i = 0; i < attachment->extra_axes && i < MAX_GIP_FLIGHT_STICK_AXES; i++)
+			input_set_abs_params(input, gip_flight_stick_extra_axes[i], 0, 65535, 0, 0);
+		break;
 	case GIP_TYPE_WHEEL:
 		input_set_abs_params(input, ABS_WHEEL,
 			-attachment->wheel.max_angle - 1,
@@ -1653,7 +1691,6 @@ static int gip_setup_input_device(struct gip_attachment *attachment)
 		break;
 	case GIP_TYPE_UNKNOWN:
 	case GIP_TYPE_NAVIGATION_CONTROLLER:
-	case GIP_TYPE_FLIGHT_STICK:
 		break;
 	case GIP_TYPE_CHATPAD:
 	case GIP_TYPE_HEADSET:
@@ -1770,6 +1807,12 @@ static int gip_send_init_sequence(struct gip_attachment *attachment)
 			sizeof(request));
 	}
 
+	if (attachment->attachment_type == GIP_TYPE_FLIGHT_STICK
+		&& gip_supports_vendor_message(attachment,
+		GIP_CMD_DEVICE_CAPABILITIES, false))
+		gip_send_vendor_message(attachment,
+			GIP_CMD_DEVICE_CAPABILITIES, 0, NULL, 0);
+
 	usb_make_path(attachment->device->udev, attachment->phys,
 		sizeof(attachment->phys));
 	len = strlen(attachment->phys);
@@ -1779,7 +1822,8 @@ static int gip_send_init_sequence(struct gip_attachment *attachment)
 			attachment->attachment_index);
 
 	if (gip_attachment_is_controller(attachment) && !attachment->input
-		&& attachment->attachment_type != GIP_TYPE_WHEEL) {
+		&& attachment->attachment_type != GIP_TYPE_WHEEL
+		&& attachment->attachment_type != GIP_TYPE_FLIGHT_STICK) {
 		rc = gip_setup_input_device(attachment);
 		if (rc == -ENODEV)
 			return 0;
@@ -2242,6 +2286,22 @@ static int gip_handle_command_firmware(struct gip_attachment *attachment,
 	return -ENOTSUPP;
 }
 
+static int gip_handle_device_capabilities(struct gip_attachment *attachment,
+	const struct gip_header *header, const void *bytes, int num_bytes)
+{
+	const struct gip_device_capabilities_response *response = bytes;
+
+	if (attachment->input)
+		return 0;
+
+	if (num_bytes < 4)
+		return -EINVAL;
+
+	attachment->extra_axes = response->extra_axis_count;
+	attachment->extra_buttons = response->extra_button_count;
+	return gip_setup_input_device(attachment);
+}
+
 static int gip_handle_command_raw_report(struct gip_attachment *attachment,
 	const struct gip_header *header, const uint8_t *bytes, int num_bytes)
 {
@@ -2405,6 +2465,58 @@ static void gip_handle_arcade_stick_report(struct gip_attachment *attachment,
 	}
 }
 
+static void gip_handle_flight_stick_report(struct gip_attachment *attachment,
+	struct input_dev *dev, const uint8_t *bytes, int num_bytes)
+{
+	int32_t axis;
+	int i;
+
+	if (num_bytes < 19)
+		return;
+
+	/* Fire 1 and 2 */
+	input_report_key(dev, BTN_TOP, bytes[2] & BIT(0));
+	input_report_key(dev, BTN_TOP2, bytes[2] & BIT(1));
+
+	for (i = 0; i < attachment->extra_buttons && i < 10; i++) {
+		input_report_key(dev, BTN_0 + i,
+			bytes[i / 8 + 3] & BIT(i));
+	}
+	for (i = 10; i < attachment->extra_buttons && i - 10 < 40; i++) {
+		input_report_key(dev, BTN_TRIGGER_HAPPY + i - 10,
+			bytes[i / 8 + 3] & BIT(i));
+	}
+
+	/*
+	 * Roll, pitch and yaw are signed. Throttle and any
+	 * extra axes are unsigned. All values are full-range.
+	 */
+	axis = bytes[11];
+	axis |= bytes[12] << 8;
+	input_report_abs(dev, ABS_X, (int16_t) axis);
+
+	axis = bytes[13];
+	axis |= bytes[14] << 8;
+	input_report_abs(dev, ABS_Y, (int16_t) axis);
+
+	axis = bytes[15];
+	axis |= bytes[16] << 8;
+	input_report_abs(dev, ABS_Z, (int16_t) axis);
+
+	axis = bytes[17];
+	axis |= bytes[18] << 8;
+	input_report_abs(dev, ABS_THROTTLE, axis);
+
+	for (i = 0; i < attachment->extra_axes && i < MAX_GIP_FLIGHT_STICK_AXES; i++) {
+		if (20 + i * 2 >= num_bytes)
+			return;
+
+		axis = bytes[19 + i * 2];
+		axis |= bytes[20 + i * 2] << 8;
+		input_report_abs(dev, gip_flight_stick_extra_axes[i], axis);
+	}
+}
+
 static void gip_handle_wheel_report(struct gip_attachment *attachment,
 	struct input_dev *dev, const uint8_t *bytes, int num_bytes)
 {
@@ -2508,6 +2620,9 @@ static int gip_handle_ll_input_report(struct gip_attachment *attachment,
 	case GIP_TYPE_ARCADE_STICK:
 		gip_handle_arcade_stick_report(attachment, dev, bytes, num_bytes);
 		break;
+	case GIP_TYPE_FLIGHT_STICK:
+		gip_handle_flight_stick_report(attachment, dev, bytes, num_bytes);
+		break;
 	case GIP_TYPE_WHEEL:
 		gip_handle_wheel_report(attachment, dev, bytes, num_bytes);
 		break;
@@ -2723,6 +2838,11 @@ static int gip_handle_message(struct gip_attachment *attachment,
 			num_bytes);
 
 	switch (header->message_type) {
+	case GIP_CMD_DEVICE_CAPABILITIES:
+		if (attachment->attachment_type == GIP_TYPE_FLIGHT_STICK)
+			return gip_handle_device_capabilities(attachment,
+				header, bytes, num_bytes);
+		break;
 	case GIP_CMD_RAW_REPORT:
 		if (attachment->features & GIP_FEATURE_ELITE_BUTTONS)
 			return gip_handle_command_raw_report(attachment,
-- 
2.50.1


