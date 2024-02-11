Return-Path: <linux-input+bounces-1835-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 6BCA6850892
	for <lists+linux-input@lfdr.de>; Sun, 11 Feb 2024 11:02:41 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id E94BC1F218E3
	for <lists+linux-input@lfdr.de>; Sun, 11 Feb 2024 10:02:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 504DD5A0FD;
	Sun, 11 Feb 2024 10:02:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bernhard-seibold.de header.i=@bernhard-seibold.de header.b="O1qbzf5C"
X-Original-To: linux-input@vger.kernel.org
Received: from mout-p-102.mailbox.org (mout-p-102.mailbox.org [80.241.56.152])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A3B25917F
	for <linux-input@vger.kernel.org>; Sun, 11 Feb 2024 10:02:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.241.56.152
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707645744; cv=none; b=RBj5CQeT5V0PH5/2DIq7Dm5UAspMYPyvoHxBK1nJ5wW1GZZfy1bfuyX9sHo7SSY98TENTPHXyEQcVHxvrJzAgFpX/BIpGQ5wxF6WzVGNGYEHa0EBFscvWHxCnXKObke80kfDmuHS/7aIpQ95tMjRL4JRtr9C2RL6BvGMjnvDLeU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707645744; c=relaxed/simple;
	bh=Dxwbxfi1x689DpDaB9WV14PvnzHZUP/eUwAyMuCi0Gw=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=TKiQK6QY7zA3I+0P0kzp+Z3gs2mMvX6qKqnar4GOaJZG5Fw/dagMPg06YnckHII27E/FgAbjMOmuADbUBP8UTylnkfNm3bXGCBNqXWHut4swp07cf8ExNVW2Koik8bKzVvIFJhCNd/QyakPDxQ9jKpLi42NIVlvXhKXLXAig9JY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bernhard-seibold.de; spf=pass smtp.mailfrom=bernhard-seibold.de; dkim=pass (2048-bit key) header.d=bernhard-seibold.de header.i=@bernhard-seibold.de header.b=O1qbzf5C; arc=none smtp.client-ip=80.241.56.152
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bernhard-seibold.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bernhard-seibold.de
Received: from smtp202.mailbox.org (smtp202.mailbox.org [10.196.197.202])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-102.mailbox.org (Postfix) with ESMTPS id 4TXjmy5rp5z9sPq;
	Sun, 11 Feb 2024 11:02:10 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bernhard-seibold.de;
	s=MBO0001; t=1707645730;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=RUmp4+jZdfj8Z1/r8c6v2XBy8bOJbwrQcNp842YtrB4=;
	b=O1qbzf5CXygRjqEPIm+BzQUfS/WONRpbXv89rCDGDILnlAagw4LBqEAimelinDaaYi8Xvh
	osSIf22hSmYj79sAH6a7NpPHg/rNS3s13h5WZSmDreYgpuW7cB0d5YRjV0OdlHK3LoHbde
	YKguMBAAIt2jlH+ihfsa9vb3R+w+xHDZO/mCyTG7IrrkXrBaz0RwTwXKYK9jUk8EsZI0A9
	z3Q1kxCRgCvMgyTqJO5ojNRPY1tQcFs3q7SoOvUKIjd2SruMlXYiSFxODFb4LpRt7ZOZlB
	BXu1iJhMpcvLt/SqGBvK5Zrb8Q1cM1KO7UBUxTDRIoEtnBKlvfOaQao1vkBvSQ==
From: Bernhard Seibold <mail@bernhard-seibold.de>
To: linux-input@vger.kernel.org
Cc: Jiri Kosina <jikos@kernel.org>,
	Benjamin Tissoires <benjamin.tissoires@redhat.com>,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Hans de Goede <hdegoede@redhat.com>,
	Jamie Lentin <jm@lentin.co.uk>,
	Bernhard Seibold <mail@bernhard-seibold.de>
Subject: [PATCH RESEND v2] HID: input: Add support for micmute LED
Date: Sun, 11 Feb 2024 11:01:58 +0100
Message-ID: <20240211100158.148593-1-mail@bernhard-seibold.de>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The USB HID spec describes a number of LEDs that are currently
unsupported. For now, add only the micmute LED since this one is proven
to exist in actual devices. Since LED support via input-leds is
grandfathered, the new LED is added directly in hid-input.

Signed-off-by: Bernhard Seibold <mail@bernhard-seibold.de>
---
 drivers/hid/Kconfig     | 11 +++++
 drivers/hid/hid-input.c | 92 +++++++++++++++++++++++++++++++++++++++++
 include/linux/hid.h     |  1 +
 3 files changed, 104 insertions(+)

diff --git a/drivers/hid/Kconfig b/drivers/hid/Kconfig
index 4c682c650704..f8ed13d9740a 100644
--- a/drivers/hid/Kconfig
+++ b/drivers/hid/Kconfig
@@ -42,6 +42,17 @@ config HID_BATTERY_STRENGTH
 	that support this feature) through power_supply class so that userspace
 	tools, such as upower, can display it.
 
+config HID_LEDS
+	bool "LED support for HID devices"
+	select LEDS_CLASS
+	default y
+	help
+	This option adds support for LEDs on HID devices. Currently, the
+	only supported LED is microphone mute. For all other LEDs,
+	enable CONFIG_INPUT_LEDS.
+
+	If unsure, say Y.
+
 config HIDRAW
 	bool "/dev/hidraw raw HID device support"
 	help
diff --git a/drivers/hid/hid-input.c b/drivers/hid/hid-input.c
index c8b20d44b147..32d3e6a2ac44 100644
--- a/drivers/hid/hid-input.c
+++ b/drivers/hid/hid-input.c
@@ -16,6 +16,7 @@
 #include <linux/module.h>
 #include <linux/slab.h>
 #include <linux/kernel.h>
+#include <linux/leds.h>
 
 #include <linux/hid.h>
 #include <linux/hid-debug.h>
@@ -104,6 +105,9 @@ static const struct usage_priority hidinput_usages_priorities[] = {
 #define map_key_clear(c)	hid_map_usage_clear(hidinput, usage, &bit, \
 		&max, EV_KEY, (c))
 
+#define setup_led(name, trigger) \
+	hidinput_setup_led(device, field, usage_index, name, trigger)
+
 static bool match_scancode(struct hid_usage *usage,
 			   unsigned int cur_idx, unsigned int scancode)
 {
@@ -674,6 +678,88 @@ static bool hidinput_set_battery_charge_status(struct hid_device *dev,
 }
 #endif	/* CONFIG_HID_BATTERY_STRENGTH */
 
+#ifdef CONFIG_HID_LEDS
+
+struct hid_led {
+	struct list_head list;
+	struct led_classdev cdev;
+	struct hid_field *field;
+	unsigned int offset;
+	char *name;
+};
+
+static int hidinput_led_brightness_set(struct led_classdev *cdev,
+		enum led_brightness value)
+{
+	struct device *dev = cdev->dev->parent;
+	struct hid_device *device = to_hid_device(dev);
+	struct hid_led *led = container_of(cdev, struct hid_led, cdev);
+
+	hid_set_field(led->field, led->offset, !!value);
+	schedule_work(&device->led_work);
+
+	return 0;
+}
+
+static void hidinput_setup_led(struct hid_device *device,
+		struct hid_field *field, unsigned int offset,
+		const char *name, const char *trigger)
+{
+	struct hid_led *led;
+	struct device *dev = &device->dev;
+	struct device *idev = &field->hidinput->input->dev;
+
+	led = kzalloc(sizeof(*led), GFP_KERNEL);
+	if (!led)
+		return;
+
+	led->name = kasprintf(GFP_KERNEL, "%s::%s", dev_name(idev), name);
+	if (!led->name) {
+		kfree(led);
+		return;
+	}
+
+	led->cdev.name = led->name;
+	led->cdev.default_trigger = trigger;
+	led->cdev.max_brightness = 1;
+	led->cdev.brightness_set_blocking = hidinput_led_brightness_set;
+	led->field = field;
+	led->offset = offset;
+
+	if (led_classdev_register(dev, &led->cdev)) {
+		kfree(name);
+		kfree(led);
+		return;
+	}
+
+	list_add_tail(&led->list, &device->leds);
+}
+
+static void hidinput_cleanup_leds(struct hid_device *device)
+{
+	struct hid_led *led, *tmp;
+
+	list_for_each_entry_safe(led, tmp, &device->leds, list) {
+		led_classdev_unregister(&led->cdev);
+		kfree(led->name);
+		kfree(led);
+	}
+}
+
+#else  /* !CONFIG_HID_LEDS */
+
+static void hidinput_setup_led(struct hid_device *device,
+		struct hid_field *field, unsigned int offset,
+		const char *name, const char *trigger)
+{
+}
+
+static void hidinput_cleanup_leds(struct hid_device *device)
+{
+}
+
+#endif  /* CONFIG_HID_LEDS */
+
 static bool hidinput_field_in_collection(struct hid_device *device, struct hid_field *field,
 					 unsigned int type, unsigned int usage)
 {
@@ -935,6 +1021,10 @@ static void hidinput_configure_usage(struct hid_input *hidinput, struct hid_fiel
 		case 0x19:  map_led (LED_MAIL);     break;    /*   "Message Waiting"          */
 		case 0x4d:  map_led (LED_CHARGING); break;    /*   "External Power Connected" */
 
+		case 0x21:  /* "Microphone" */
+			setup_led("micmute", "audio-micmute");
+			break;
+
 		default: goto ignore;
 		}
 		break;
@@ -2282,6 +2372,7 @@ int hidinput_connect(struct hid_device *hid, unsigned int force)
 	int i, k;
 
 	INIT_LIST_HEAD(&hid->inputs);
+	INIT_LIST_HEAD(&hid->leds);
 	INIT_WORK(&hid->led_work, hidinput_led_worker);
 
 	hid->status &= ~HID_STAT_DUP_DETECTED;
@@ -2380,6 +2471,7 @@ void hidinput_disconnect(struct hid_device *hid)
 {
 	struct hid_input *hidinput, *next;
 
+	hidinput_cleanup_leds(hid);
 	hidinput_cleanup_battery(hid);
 
 	list_for_each_entry_safe(hidinput, next, &hid->inputs, list) {
diff --git a/include/linux/hid.h b/include/linux/hid.h
index 7c26db874ff0..7c0e2789755f 100644
--- a/include/linux/hid.h
+++ b/include/linux/hid.h
@@ -617,6 +617,7 @@ struct hid_device {							/* device report descriptor */
 	unsigned country;						/* HID country */
 	struct hid_report_enum report_enum[HID_REPORT_TYPES];
 	struct work_struct led_work;					/* delayed LED worker */
+	struct list_head leds;						/* List of associated LEDs */
 
 	struct semaphore driver_input_lock;				/* protects the current driver */
 	struct device dev;						/* device */
-- 
2.43.0


