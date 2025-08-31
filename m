Return-Path: <linux-input+bounces-14399-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 28CE2B3D04A
	for <lists+linux-input@lfdr.de>; Sun, 31 Aug 2025 02:26:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 552147A80DD
	for <lists+linux-input@lfdr.de>; Sun, 31 Aug 2025 00:25:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9432035957;
	Sun, 31 Aug 2025 00:26:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=altimeter.info header.i=@altimeter.info header.b="RlWBM8vX"
X-Original-To: linux-input@vger.kernel.org
Received: from hognose1.porkbun.com (hognose1.porkbun.com [35.82.102.206])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9789B18027;
	Sun, 31 Aug 2025 00:26:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=35.82.102.206
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756599991; cv=none; b=P7xC60WBXyCo+fww2hMMq8nto9jFqBoNswBLE00nzxXCzQI34NFJGzzsJ0RKuAwfdhxsHoqHFX5UWkEjpWqYr4U5wzABnLHm386h6gZnI9QtLRS+LcMHPOqxQ7Pj2ozmbjqDZyupkCbSP1LHJZNsdEAaiQ0lHxpBogYvI3L7FvI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756599991; c=relaxed/simple;
	bh=LOljmXalR/Td6LiuBngLNX5VB5tnOox98G7C9TBcXSQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=sOY8BEcQuv4N5aOjnJj0aFA8Rizr1ZZZ3x/+yHdmL7QI5oFWUU5Kr98NyXW8WmuYhug7Cncep6oGYRFJr0fRf+eYtfkGHVh7WsTb/1bWBS1fP70aTExedW0/1A3YrfXa7r6MbzTeTpbSR/oVwggs9P9C8ihvYyXv3/wHSHiJeaA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=altimeter.info; spf=pass smtp.mailfrom=altimeter.info; dkim=pass (1024-bit key) header.d=altimeter.info header.i=@altimeter.info header.b=RlWBM8vX; arc=none smtp.client-ip=35.82.102.206
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=altimeter.info
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=altimeter.info
Received: from altimeter-info (unknown [45.55.225.183])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(Client did not present a certificate)
	(Authenticated sender: linux-kernel@altimeter.info)
	by hognose1.porkbun.com (Postfix) with ESMTPSA id 883CD45082;
	Sun, 31 Aug 2025 00:26:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=altimeter.info;
	s=default; t=1756599989;
	bh=msD7QUvgv9wB3RkK3yQyMftHpZiQLB+s0VtOXIlNXPw=;
	h=Date:From:To:Cc:Subject;
	b=RlWBM8vXvTXCL+oIOQL5JLtTJu8AWyksjTSO+CzO+5pTgYhuoRF9gKEIfGxSQb+12
	 DdwYA4Q7d/e3ubgUUzyd2enCruvNd3FWBNRdL9qNYkkczcp6njYX6IvxdBogsSkPtb
	 TwFWLkdXkSbiMwAYweEzTaYPcrQP9ZTwdl+fz/Ro=
Date: Sun, 31 Aug 2025 00:26:25 +0000
From: Ivan Gorinov <linux-kernel@altimeter.info>
To: Jiri Kosina <jikos@kernel.org>
Cc: linux-input@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH v2] Input: Improve WinWing Orion2 throttle support
Message-ID: <20250831002625.GA9516@altimeter-info>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
User-Agent: Mutt/1.5.24 (2015-08-30)

Add support for Orion2 throttle configurations with more than 32 buttons
on the grip handle (this means the device reports more than 80 buttons).

Map additional button codes to KEY_MACRO1 .. KEY_MACRO30.

Make the module simpler, removing report descriptor fixup.

Changes since v1:
   - Correct trivial coding style violations

Signed-off-by: Ivan Gorinov <linux-kernel@altimeter.info>
---
 drivers/hid/Kconfig       |   2 +
 drivers/hid/hid-winwing.c | 166 +++++++++++++++++++++++---------------
 2 files changed, 103 insertions(+), 65 deletions(-)

diff --git a/drivers/hid/Kconfig b/drivers/hid/Kconfig
index a57901203aeb..3317981e65dc 100644
--- a/drivers/hid/Kconfig
+++ b/drivers/hid/Kconfig
@@ -1309,6 +1309,8 @@ config HID_WINWING
 	help
 	  Support for WinWing Orion2 throttle base with the following grips:
 
+	    * TGRIP-15E
+	    * TGRIP-15EX
 	    * TGRIP-16EX
 	    * TGRIP-18
 
diff --git a/drivers/hid/hid-winwing.c b/drivers/hid/hid-winwing.c
index d4afbbd27807..705e59f263a5 100644
--- a/drivers/hid/hid-winwing.c
+++ b/drivers/hid/hid-winwing.c
@@ -37,6 +37,7 @@ struct winwing_drv_data {
 	struct hid_device *hdev;
 	__u8 *report_buf;
 	struct mutex lock;
+	int map_more_buttons;
 	unsigned int num_leds;
 	struct winwing_led leds[];
 };
@@ -81,12 +82,10 @@ static int winwing_init_led(struct hid_device *hdev,
 	int ret;
 	int i;
 
-	size_t data_size = struct_size(data, leds, 3);
-
-	data = devm_kzalloc(&hdev->dev, data_size, GFP_KERNEL);
+	data = hid_get_drvdata(hdev);
 
 	if (!data)
-		return -ENOMEM;
+		return -EINVAL;
 
 	data->report_buf = devm_kmalloc(&hdev->dev, MAX_REPORT, GFP_KERNEL);
 
@@ -106,6 +105,7 @@ static int winwing_init_led(struct hid_device *hdev,
 						"%s::%s",
 						dev_name(&input->dev),
 						info->led_name);
+
 		if (!led->cdev.name)
 			return -ENOMEM;
 
@@ -114,14 +114,95 @@ static int winwing_init_led(struct hid_device *hdev,
 			return ret;
 	}
 
-	hid_set_drvdata(hdev, data);
-
 	return ret;
 }
 
+static int winwing_map_button(int button, int map_more_buttons)
+{
+	if (button < 1)
+		return KEY_RESERVED;
+
+	if (button > 112)
+		return KEY_RESERVED;
+
+	if (button <= 16) {
+		/*
+		 * Grip buttons [1 .. 16] are mapped to
+		 * key codes BTN_TRIGGER .. BTN_DEAD
+		 */
+		return (button - 1) + BTN_JOYSTICK;
+	}
+
+	if (button >= 65) {
+		/*
+		 * Base buttons [65 .. 112] are mapped to
+		 * key codes BTN_TRIGGER_HAPPY17 .. KEY_MAX
+		 */
+		return (button - 65) + BTN_TRIGGER_HAPPY17;
+	}
+
+	if (!map_more_buttons) {
+		/* Not mapping numbers [33 .. 64] */
+		if (button >= 33)
+			return KEY_RESERVED;
+		/*
+		 * Grip buttons [17 .. 32] are mapped to
+		 * BTN_TRIGGER_HAPPY1 .. BTN_TRIGGER_HAPPY16
+		 */
+		return (button - 17) + BTN_TRIGGER_HAPPY1;
+	}
+
+	if (button >= 49) {
+		/*
+		 * Grip buttons [49 .. 64] are mapped to
+		 * BTN_TRIGGER_HAPPY1 .. BTN_TRIGGER_HAPPY16
+		 */
+		return (button - 49) + BTN_TRIGGER_HAPPY1;
+	}
+
+	/*
+	 * Grip buttons [17 .. 44] are mapped to
+	 * key codes KEY_MACRO1 .. KEY_MACRO28;
+	 * also mapping numbers [45 .. 48] which
+	 * are not assigned to any real buttons.
+	 */
+	return (button - 17) + KEY_MACRO1;
+}
+
+static int winwing_input_mapping(struct hid_device *hdev,
+	struct hid_input *hi, struct hid_field *field, struct hid_usage *usage,
+	unsigned long **bit, int *max)
+{
+	struct winwing_drv_data *data;
+	int code = KEY_RESERVED;
+	int button = 0;
+
+	data = hid_get_drvdata(hdev);
+
+	if (!data)
+		return -EINVAL;
+
+	if ((usage->hid & HID_USAGE_PAGE) != HID_UP_BUTTON)
+		return 0;
+
+	if (field->application != HID_GD_JOYSTICK)
+		return 0;
+
+	/* Button numbers start with 1 */
+	button = usage->hid & HID_USAGE;
+
+	code = winwing_map_button(button, data->map_more_buttons);
+
+	hid_map_usage(hi, usage, bit, max, EV_KEY, code);
+
+	return 1;
+}
+
 static int winwing_probe(struct hid_device *hdev,
 		const struct hid_device_id *id)
 {
+	struct winwing_drv_data *data;
+	size_t data_size = struct_size(data, leds, 3);
 	int ret;
 
 	ret = hid_parse(hdev);
@@ -130,6 +211,15 @@ static int winwing_probe(struct hid_device *hdev,
 		return ret;
 	}
 
+	data = devm_kzalloc(&hdev->dev, data_size, GFP_KERNEL);
+
+	if (!data)
+		return -ENOMEM;
+
+	data->map_more_buttons = id->driver_data;
+
+	hid_set_drvdata(hdev, data);
+
 	ret = hid_hw_start(hdev, HID_CONNECT_DEFAULT);
 	if (ret) {
 		hid_err(hdev, "hw start failed\n");
@@ -152,64 +242,11 @@ static int winwing_input_configured(struct hid_device *hdev,
 	return ret;
 }
 
-static const __u8 original_rdesc_buttons[] = {
-	0x05, 0x09, 0x19, 0x01, 0x29, 0x6F,
-	0x15, 0x00, 0x25, 0x01, 0x35, 0x00,
-	0x45, 0x01, 0x75, 0x01, 0x95, 0x6F,
-	0x81, 0x02, 0x75, 0x01, 0x95, 0x01,
-	0x81, 0x01
-};
-
-/*
- * HID report descriptor shows 111 buttons, which exceeds maximum
- * number of buttons (80) supported by Linux kernel HID subsystem.
- *
- * This module skips numbers 32-63, unused on some throttle grips.
- */
-
-static const __u8 *winwing_report_fixup(struct hid_device *hdev, __u8 *rdesc,
-		unsigned int *rsize)
-{
-	int sig_length = sizeof(original_rdesc_buttons);
-	int unused_button_numbers = 32;
-
-	if (*rsize < 34)
-		return rdesc;
-
-	if (memcmp(rdesc + 8, original_rdesc_buttons, sig_length) == 0) {
-
-		/* Usage Maximum */
-		rdesc[13] -= unused_button_numbers;
-
-		/*  Report Count for buttons */
-		rdesc[25] -= unused_button_numbers;
-
-		/*  Report Count for padding [HID1_11, 6.2.2.9] */
-		rdesc[31] += unused_button_numbers;
-
-		hid_info(hdev, "winwing descriptor fixed\n");
-	}
-
-	return rdesc;
-}
-
-static int winwing_raw_event(struct hid_device *hdev,
-		struct hid_report *report, u8 *raw_data, int size)
-{
-	if (size >= 15) {
-		/* Skip buttons 32 .. 63 */
-		memmove(raw_data + 5, raw_data + 9, 6);
-
-		/* Clear the padding */
-		memset(raw_data + 11, 0, 4);
-	}
-
-	return 0;
-}
-
 static const struct hid_device_id winwing_devices[] = {
-	{ HID_USB_DEVICE(0x4098, 0xbe62) },  /* TGRIP-18 */
-	{ HID_USB_DEVICE(0x4098, 0xbe68) },  /* TGRIP-16EX */
+	{ HID_USB_DEVICE(0x4098, 0xbd65), .driver_data = 1 },  /* TGRIP-15E  */
+	{ HID_USB_DEVICE(0x4098, 0xbd64), .driver_data = 1 },  /* TGRIP-15EX */
+	{ HID_USB_DEVICE(0x4098, 0xbe68), .driver_data = 0 },  /* TGRIP-16EX */
+	{ HID_USB_DEVICE(0x4098, 0xbe62), .driver_data = 0 },  /* TGRIP-18   */
 	{}
 };
 
@@ -218,10 +255,9 @@ MODULE_DEVICE_TABLE(hid, winwing_devices);
 static struct hid_driver winwing_driver = {
 	.name = "winwing",
 	.id_table = winwing_devices,
+	.input_mapping = winwing_input_mapping,
 	.probe = winwing_probe,
 	.input_configured = winwing_input_configured,
-	.report_fixup = winwing_report_fixup,
-	.raw_event = winwing_raw_event,
 };
 module_hid_driver(winwing_driver);
 
-- 
2.34.1


