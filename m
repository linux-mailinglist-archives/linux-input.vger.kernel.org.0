Return-Path: <linux-input+bounces-1369-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B4D4835430
	for <lists+linux-input@lfdr.de>; Sun, 21 Jan 2024 03:27:21 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 6CE341C212D4
	for <lists+linux-input@lfdr.de>; Sun, 21 Jan 2024 02:27:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 16BA53611E;
	Sun, 21 Jan 2024 02:27:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=altimeter.info header.i=@altimeter.info header.b="kfSADskk"
X-Original-To: linux-input@vger.kernel.org
Received: from hognose1.porkbun.com (hognose1.porkbun.com [35.82.102.206])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 25AE610FD;
	Sun, 21 Jan 2024 02:27:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=35.82.102.206
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1705804037; cv=none; b=OGyXm6pT9W1tPkVBXh/E1fJshn15t5OqyRojxOGqcLgj254V78BbXOLz5MC6I+rmy0hNYL8gaoUUPL88L7Yfm+z5M2tRaVIKBbF79QZ9E1KUtq22XM420qaUvoz+yl0a3BXGdo9kFGC88E7MZRlQttD478EuAJKauy6Kf+yQNHM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1705804037; c=relaxed/simple;
	bh=GlLSfdg6SEM8pbbwe0a19ta9m1tlZBaNcMRvmih8Yz8=;
	h=MIME-Version:Date:From:To:Cc:Subject:Message-ID:Content-Type; b=oaBclqxF1rZjJAtH2EYOz8/oGQkxdBSJ+6/TmZcYhACD5mxOsNWDo/OiafkFQXGKvMbMJfthk7STFGYVnS5/LDmlzKi2DCRZJcpgvcGTBXKJdbxUyVWLbUhP9lTvuOiHQ1ZBP6ZBU93xffTkeru0wLmSi7gDBw+suFLa4AsPvTU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=altimeter.info; spf=pass smtp.mailfrom=altimeter.info; dkim=pass (1024-bit key) header.d=altimeter.info header.i=@altimeter.info header.b=kfSADskk; arc=none smtp.client-ip=35.82.102.206
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=altimeter.info
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=altimeter.info
Received: from webmail.porkbun.com (unknown [35.86.129.66])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(Client did not present a certificate)
	(Authenticated sender: linux-kernel@altimeter.info)
	by hognose1.porkbun.com (Postfix) with ESMTPSA id AD70E448AA;
	Sun, 21 Jan 2024 02:27:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=altimeter.info;
	s=default; t=1705804028;
	bh=cPQpBSAUojnCOOh/lXp01TE9KjsI7ZgJIVqD39TL5JY=;
	h=Date:From:To:Cc:Subject;
	b=kfSADskkllm6oFs1Z1y0dbsfUs0UJQ1oehgXe3YJ5mIerUvjSyQC66Tn5xkfKkwRr
	 mCv3gjC8PifSwU04S6Dwhfk1X31eSYqU6oeMebL8TFak13FkxuO12bBZE0+rklInZQ
	 yf5dXqILeO/0qAQQ4BM0ny0UYQk+EkPsfvJag6no=
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Date: Sat, 20 Jan 2024 18:27:06 -0800
From: Ivan Gorinov <linux-kernel@altimeter.info>
To: jikos@kernel.org
Cc: linux-input@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH v2] Input: hid-winwing module
User-Agent: Roundcube Webmail/1.4.13
Message-ID: <e028ff107ed533627499abde6d197159@altimeter.info>
X-Sender: linux-kernel@altimeter.info
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit

Support for WinWing Orion2 throttle.

On the Orion 2 throttle, buttons 0 .. 63 are reserved for throttle grip;
the throttle base buttons have numbers 64 .. 110.

Linux kernel HID subsystem only supports up to 80 buttons.

This kernel module remaps throttle base buttons to numbers 32 .. 78,
reserving only numbers 0 .. 31 for buttons on the throttle grip.

Changes since v1:
   - Fixed formatting of descriptor byte array;
   - Using product codes of Winwing grips in config.

Signed-off-by: Ivan Gorinov <linux-kernel@altimeter.info>
---
  drivers/hid/Kconfig       |  16 +++
  drivers/hid/Makefile      |   1 +
  drivers/hid/hid-winwing.c | 227 ++++++++++++++++++++++++++++++++++++++
  3 files changed, 244 insertions(+)
  create mode 100644 drivers/hid/hid-winwing.c

diff --git a/drivers/hid/Kconfig b/drivers/hid/Kconfig
index 4c682c650704..9c8fea72b05d 100644
--- a/drivers/hid/Kconfig
+++ b/drivers/hid/Kconfig
@@ -1236,6 +1236,22 @@ config HID_WIIMOTE
  	To compile this driver as a module, choose M here: the
  	module will be called hid-wiimote.

+config HID_WINWING
+	tristate "WinWing Orion2 throttle support"
+	depends on USB_HID
+	depends on NEW_LEDS
+	depends on LEDS_CLASS
+	help
+	  Support for WinWing Orion2 throttle base with the following grips:
+
+	    * TGRIP-16EX
+	    * TGRIP-18
+
+	  This driver enables all buttons and switches on the throttle base.
+
+	  To compile this driver as a module, choose M here: the
+	  module will be called hid-winwing.
+
  config HID_XINMO
  	tristate "Xin-Mo non-fully compliant devices"
  	help
diff --git a/drivers/hid/Makefile b/drivers/hid/Makefile
index 082a728eac60..ce71b53ea6c5 100644
--- a/drivers/hid/Makefile
+++ b/drivers/hid/Makefile
@@ -150,6 +150,7 @@ wacom-objs			:= wacom_wac.o wacom_sys.o
  obj-$(CONFIG_HID_WACOM)		+= wacom.o
  obj-$(CONFIG_HID_WALTOP)	+= hid-waltop.o
  obj-$(CONFIG_HID_WIIMOTE)	+= hid-wiimote.o
+obj-$(CONFIG_HID_WINWING)	+= hid-winwing.o
  obj-$(CONFIG_HID_SENSOR_HUB)	+= hid-sensor-hub.o
  obj-$(CONFIG_HID_SENSOR_CUSTOM_SENSOR)	+= hid-sensor-custom.o

diff --git a/drivers/hid/hid-winwing.c b/drivers/hid/hid-winwing.c
new file mode 100644
index 000000000000..f2badd78c194
--- /dev/null
+++ b/drivers/hid/hid-winwing.c
@@ -0,0 +1,227 @@
+// SPDX-License-Identifier: GPL-2.0
+
+/*
+ * HID driver for WinWing Orion 2 throttle
+ *
+ * Copyright (c) 2023 Ivan Gorinov
+ */
+
+#include <linux/device.h>
+#include <linux/hid.h>
+#include <linux/hidraw.h>
+#include <linux/kernel.h>
+#include <linux/module.h>
+#include <linux/mutex.h>
+
+#define MAX_REPORT 16
+
+struct winwing_led {
+	struct led_classdev cdev;
+	struct hid_device *hdev;
+	int number;
+};
+
+struct winwing_led_info {
+	int number;
+	int max_brightness;
+	const char *led_name;
+};
+
+static struct winwing_led_info led_info[3] = {
+	{ 0, 255, "backlight" },
+	{ 1, 1, "a-a" },
+	{ 2, 1, "a-g" },
+};
+
+struct winwing_drv_data {
+	struct hid_device *hdev;
+	__u8 *report_buf;
+	struct mutex lock;
+	unsigned int num_leds;
+	struct winwing_led leds[];
+};
+
+static int winwing_led_write(struct led_classdev *cdev, enum 
led_brightness br)
+{
+	struct winwing_led *led = (struct winwing_led *) cdev;
+	struct winwing_drv_data *data = hid_get_drvdata(led->hdev);
+	__u8 *buf = data->report_buf;
+	int ret;
+
+	mutex_lock(&data->lock);
+
+	buf[0] = 0x02;
+	buf[1] = 0x60;
+	buf[2] = 0xbe;
+	buf[3] = 0x00;
+	buf[4] = 0x00;
+	buf[5] = 0x03;
+	buf[6] = 0x49;
+	buf[7] = led->number;
+	buf[8] = br;
+	buf[9] = 0x00;
+	buf[10] = 0;
+	buf[11] = 0;
+	buf[12] = 0;
+	buf[13] = 0;
+
+	ret = hid_hw_output_report(led->hdev, buf, 14);
+
+	mutex_unlock(&data->lock);
+
+	return ret;
+}
+
+static int winwing_init_led(struct hid_device *hdev, struct input_dev 
*input)
+{
+	struct winwing_drv_data *data;
+	struct winwing_led *led;
+	int ret;
+	int i;
+
+	size_t data_size = struct_size(data, leds, 3);
+
+	data = devm_kzalloc(&hdev->dev, data_size, GFP_KERNEL);
+
+	if (!data)
+		return -ENOMEM;
+
+	data->report_buf = devm_kmalloc(&hdev->dev, MAX_REPORT, GFP_KERNEL);
+
+	if (!data->report_buf)
+		return -ENOMEM;
+
+	for (i = 0; i < 3; i += 1) {
+		struct winwing_led_info *info = &led_info[i];
+
+		led = &data->leds[i];
+		led->hdev = hdev;
+		led->number = info->number;
+		led->cdev.max_brightness = info->max_brightness;
+		led->cdev.brightness_set_blocking = winwing_led_write;
+		led->cdev.flags = LED_HW_PLUGGABLE;
+		led->cdev.name = devm_kasprintf(&hdev->dev, GFP_KERNEL,
+						"%s::%s",
+						dev_name(&input->dev),
+						info->led_name);
+
+		ret = devm_led_classdev_register(&hdev->dev, &led->cdev);
+		if (ret)
+			return ret;
+	}
+
+	hid_set_drvdata(hdev, data);
+
+	return ret;
+}
+
+static int winwing_probe(struct hid_device *hdev,
+			const struct hid_device_id *id)
+{
+	unsigned int minor;
+	int ret;
+
+	ret = hid_parse(hdev);
+	if (ret) {
+		hid_err(hdev, "parse failed\n");
+		return ret;
+	}
+
+	ret = hid_hw_start(hdev, HID_CONNECT_DEFAULT);
+	if (ret) {
+		hid_err(hdev, "hw start failed\n");
+		return ret;
+	}
+
+	minor = ((struct hidraw *) hdev->hidraw)->minor;
+
+	return 0;
+}
+
+static int winwing_input_configured(struct hid_device *hdev,
+			struct hid_input *hidinput)
+{
+	int ret;
+
+	ret = winwing_init_led(hdev, hidinput->input);
+
+	if (ret)
+		hid_err(hdev, "led init failed\n");
+
+	return ret;
+}
+
+static __u8 original_rdesc_buttons[] = {
+	0x05, 0x09, 0x19, 0x01, 0x29, 0x6F,
+	0x15, 0x00, 0x25, 0x01, 0x35, 0x00,
+	0x45, 0x01, 0x75, 0x01, 0x95, 0x6F,
+	0x81, 0x02, 0x75, 0x01, 0x95, 0x01,
+	0x81, 0x01
+};
+
+/*
+ * HID report descriptor shows 111 buttons, which exceeds maximum
+ * number of buttons (80) supported by Linux kernel HID subsystem.
+ *
+ * This module skips numbers 32-63, unused on some throttle grips.
+ */
+
+static __u8 *winwing_report_fixup(struct hid_device *hdev, __u8 *rdesc,
+		unsigned int *rsize)
+{
+	int sig_length = sizeof(original_rdesc_buttons);
+	int unused_button_numbers = 32;
+
+	if (*rsize < 34)
+		return rdesc;
+
+	if (memcmp(rdesc + 8, original_rdesc_buttons, sig_length) == 0) {
+
+		/* Usage Maximum */
+		rdesc[13] -= unused_button_numbers;
+
+		/*  Report Count for buttons */
+		rdesc[25] -= unused_button_numbers;
+
+		/*  Report Count for padding [HID1_11, 6.2.2.9] */
+		rdesc[31] += unused_button_numbers;
+
+		hid_info(hdev, "winwing descriptor fixed\n");
+	}
+
+	return rdesc;
+}
+
+static int winwing_raw_event(struct hid_device *hdev,
+		struct hid_report *report, u8 *raw_data, int size)
+{
+	if (size >= 15) {
+		/* Skip buttons 32 .. 63 */
+		memmove(raw_data + 5, raw_data + 9, 6);
+
+		/* Clear the padding */
+		memset(raw_data + 11, 0, 4);
+	}
+
+	return 0;
+}
+
+static const struct hid_device_id winwing_devices[] = {
+	{ HID_USB_DEVICE(0x4098, 0xbe62) },  /* TGRIP-18 */
+	{ HID_USB_DEVICE(0x4098, 0xbe68) },  /* TGRIP-16EX */
+	{}
+};
+
+MODULE_DEVICE_TABLE(hid, winwing_devices);
+
+static struct hid_driver winwing_driver = {
+	.name = "winwing",
+	.id_table = winwing_devices,
+	.probe = winwing_probe,
+	.input_configured = winwing_input_configured,
+	.report_fixup = winwing_report_fixup,
+	.raw_event = winwing_raw_event,
+};
+module_hid_driver(winwing_driver);
+
+MODULE_LICENSE("GPL");
-- 
2.25.1

