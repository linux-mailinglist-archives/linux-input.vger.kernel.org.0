Return-Path: <linux-input+bounces-15374-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 20DA9BD0C6A
	for <lists+linux-input@lfdr.de>; Sun, 12 Oct 2025 23:00:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 372721896BE4
	for <lists+linux-input@lfdr.de>; Sun, 12 Oct 2025 21:00:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BB624239E7D;
	Sun, 12 Oct 2025 21:00:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=altimeter.info header.i=@altimeter.info header.b="SPukf1/7"
X-Original-To: linux-input@vger.kernel.org
Received: from hognose1.porkbun.com (hognose1.porkbun.com [35.82.102.206])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 934AE2367CE;
	Sun, 12 Oct 2025 21:00:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=35.82.102.206
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760302804; cv=none; b=tZeR37Qp60XCruyMrNaKkgrRe5RIVMS2sW5dp2p/WgssuIWtEYLXuFzB9wbF4KGC79LfE/BeE6wBXXxO+LYOl15epmyEjDryBj9pwSWPvjziDogA5VwakqxHmJgdTPBGSAWozinUqd+JfWQ/BKxDD2qL3veYhSLNTlr/BCBbrFc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760302804; c=relaxed/simple;
	bh=TNx8wdYdVc6iRxB3OjozPXhWnXUOR0PBRHbcnPKDxfg=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=kKLS72e5QGxabB9xMwyiL3csWz85P5Sx1H0qll6Bpx4/lFIpkeKvV6h+a8kOEATtqJre0uGPUv2hjaNFe4AfaqguMxvx5WJ+8uDE9+nnrunnuMb63UVsPzJSsdiz5kmswav9G4uIr/xdTbXvwr8b9pyUAZVSCVfI3zql4WvpXts=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=altimeter.info; spf=pass smtp.mailfrom=altimeter.info; dkim=pass (1024-bit key) header.d=altimeter.info header.i=@altimeter.info header.b=SPukf1/7; arc=none smtp.client-ip=35.82.102.206
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=altimeter.info
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=altimeter.info
Received: from altimeter-info (unknown [45.55.225.183])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(Client did not present a certificate)
	(Authenticated sender: linux-kernel@altimeter.info)
	by hognose1.porkbun.com (Postfix) with ESMTPSA id CB505451B6;
	Sun, 12 Oct 2025 20:50:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=altimeter.info;
	s=default; t=1760302265;
	bh=c1QJIKfniShFpR+XKky09xXeAscMqkXSHrvKN+Sn6C8=;
	h=Date:From:To:Cc:Subject;
	b=SPukf1/7kQiCrWW0BXIdasCesbRvn86tE8djN5dm5mcfLAY2XV8NIRc01ABOFkdao
	 asW9rHpcmjXlFU0iXV6JuosooblZfaDSUV/+PAG/XLUVX8cOhgsRPVI5UTEUIy5r9e
	 sXFRqP4faRFJQuC8oC+i62WXaO5UqwimyKzEK6W4=
Date: Sun, 12 Oct 2025 20:50:54 +0000
From: Ivan Gorinov <linux-kernel@altimeter.info>
To: Jiri Kosina <jikos@kernel.org>
Cc: linux-input@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH RESEND v3] Input: Improve WinWing Orion2 throttle support
Message-ID: <20251012205054.GA15885@altimeter-info>
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

Map additional button codes to KEY_MACRO1 .. KEY_MACRO28.

Make the module simpler, removing report descriptor fixup.

Changes since v2:
   - Add more comments about button mapping

Changes since v1:
   - Correct trivial coding style violations

Signed-off-by: Ivan Gorinov <linux-kernel@altimeter.info>
---
 drivers/hid/Kconfig       |   2 +
 drivers/hid/hid-winwing.c | 169 +++++++++++++++++++++++---------------
 2 files changed, 106 insertions(+), 65 deletions(-)

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
index d4afbbd27807..775609d0e35a 100644
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
 
@@ -114,14 +114,98 @@ static int winwing_init_led(struct hid_device *hdev,
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
+		/*
+		 * Not mapping numbers [33 .. 64] which
+		 * are not assigned to any real buttons
+		 */
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
@@ -130,6 +214,15 @@ static int winwing_probe(struct hid_device *hdev,
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
@@ -152,64 +245,11 @@ static int winwing_input_configured(struct hid_device *hdev,
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
 
@@ -218,10 +258,9 @@ MODULE_DEVICE_TABLE(hid, winwing_devices);
 static struct hid_driver winwing_driver = {
 	.name = "winwing",
 	.id_table = winwing_devices,
+	.input_configured = winwing_input_configured,
+	.input_mapping = winwing_input_mapping,
 	.probe = winwing_probe,
-	.input_configured = winwing_input_configured,
-	.report_fixup = winwing_report_fixup,
-	.raw_event = winwing_raw_event,
 };
 module_hid_driver(winwing_driver);
 
-- 
2.34.1


