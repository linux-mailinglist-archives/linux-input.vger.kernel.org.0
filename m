Return-Path: <linux-input+bounces-1227-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 5178B82CBE7
	for <lists+linux-input@lfdr.de>; Sat, 13 Jan 2024 11:38:13 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id AD2E91F21D9F
	for <lists+linux-input@lfdr.de>; Sat, 13 Jan 2024 10:38:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 21C837FF;
	Sat, 13 Jan 2024 10:38:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bernhard-seibold.de header.i=@bernhard-seibold.de header.b="CPbXd+HG"
X-Original-To: linux-input@vger.kernel.org
Received: from mout-p-101.mailbox.org (mout-p-101.mailbox.org [80.241.56.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BCEA920B2C
	for <linux-input@vger.kernel.org>; Sat, 13 Jan 2024 10:38:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bernhard-seibold.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bernhard-seibold.de
Received: from smtp2.mailbox.org (smtp2.mailbox.org [IPv6:2001:67c:2050:b231:465::2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-101.mailbox.org (Postfix) with ESMTPS id 4TBvxb3rs6z9s7D;
	Sat, 13 Jan 2024 11:37:55 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bernhard-seibold.de;
	s=MBO0001; t=1705142275;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=E43ppK7YbqCHtSlBxMzX1CEhB0qIe2BKmNJMGjr3RuA=;
	b=CPbXd+HGpfT/q463xnDA0bitu7AUcJA9mjJZwpNcONZ2vgKNCzcqTCqxXraugmrSeKvk1d
	5n4BWBnwpfZV0XfL3KTzT8T3EyF1hgWk8o5bJP+CKxSFFhEfvgDuQKrdrzdbkrCTnaACAb
	K/OJJHe6Byy8jhv5CJdC1VcaxLsYel8LEBOfAQj9SS3wEGE6DgqtTPd6bwQjmn/YwmJAly
	+KOBdVwRVR+f7IwjBwFFkZqwANCjj6Hv69YEh+svC6t0EDLbbD5HPDvv8pBfVZ9im0gp5d
	UbIXuSkTgI29dl2JcEjCRWb6ORJi6o17M8nv+fCq2x9oupRIQBaVAD389NQgKA==
From: Bernhard Seibold <mail@bernhard-seibold.de>
To: linux-input@vger.kernel.org
Cc: Jiri Kosina <jikos@kernel.org>,
	Benjamin Tissoires <benjamin.tissoires@redhat.com>,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Hans de Goede <hdegoede@redhat.com>,
	Jamie Lentin <jm@lentin.co.uk>,
	Bernhard Seibold <mail@bernhard-seibold.de>
Subject: [PATCH v2 2/2] HID: input: add support for micmute LED
Date: Sat, 13 Jan 2024 11:37:43 +0100
Message-ID: <20240113103743.97205-2-mail@bernhard-seibold.de>
In-Reply-To: <20240113103743.97205-1-mail@bernhard-seibold.de>
References: <ZZbxHpibdyNY_zUt@google.com>
 <20240113103743.97205-1-mail@bernhard-seibold.de>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: 4TBvxb3rs6z9s7D

Since LED support via input-leds is grandfathered, the new LED is added
directly in hid-input.

Signed-off-by: Bernhard Seibold <mail@bernhard-seibold.de>
---
 drivers/hid/Kconfig     | 11 +++++
 drivers/hid/hid-input.c | 92 +++++++++++++++++++++++++++++++++++++++++
 include/linux/hid.h     |  1 +
 3 files changed, 104 insertions(+)

diff --git a/drivers/hid/Kconfig b/drivers/hid/Kconfig
index 4ce74af79657..71de0af8f460 100644
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
index bf43f3ff6664..d7cea5476979 100644
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


