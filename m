Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A34A5309B33
	for <lists+linux-input@lfdr.de>; Sun, 31 Jan 2021 10:05:25 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229785AbhAaJFB (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Sun, 31 Jan 2021 04:05:01 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49298 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229684AbhAaJE3 (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Sun, 31 Jan 2021 04:04:29 -0500
Received: from mail-wm1-x330.google.com (mail-wm1-x330.google.com [IPv6:2a00:1450:4864:20::330])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 36A2BC061573
        for <linux-input@vger.kernel.org>; Sun, 31 Jan 2021 01:03:47 -0800 (PST)
Received: by mail-wm1-x330.google.com with SMTP id m1so7284897wml.2
        for <linux-input@vger.kernel.org>; Sun, 31 Jan 2021 01:03:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=uxGJH8OUYgLJcxPtIgo6zXfVEgCiyF6r+fYUX6O7+Eo=;
        b=GfBabG8Pgbhm7pzUGiymsNE46mRmYWn9NNM/my6muymSkwrX75Lw1yciRESu96c37U
         rZV0M4yN1dkZU39DwNLeCk+Da1BFD83AX7NyWJ/3Y5xzIFTMwGtEjL6rnvBt/l4w3AyU
         RktF1i4AQqNajCCuJvPvTclrmghZATHQ/8Sivr76TFTt62nopbC0g3shDCho8swKv+Za
         oTehrdiJfMMOxlF1njqgu7OLtcRr4UoUuFyPwEWBJbMMqXWeSeSxUzp0mUqRloNCZM3g
         POzFhUBGlNBnqYjgpLFjT9dRby5iKpdGimNDXajLedtdbAb8qhTWMmIzH/LTT0W8oUZL
         lgag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=uxGJH8OUYgLJcxPtIgo6zXfVEgCiyF6r+fYUX6O7+Eo=;
        b=BsRdZVDhxr0NUJxcEUnJX6iXMqE6PjKuxOSWldoV2+YuNz+D2+mCRG87PXwnju6pue
         IDpv6ce/Ye+DWECXXrBQXuOa2dnx3KsIhGFkNhAc5UNlO5lVpw0WOpuN0Ezh4GnKdCPF
         66Cr/QcA3Hn1RSfVqyqgtEHhrWLI2f3q+6bx9UUjYf8L/c+3scHHMiXe3LiB/IS6uP3G
         TffqWq1roEgnmgoFI/ghrjphYtkHGP+CuW/FvZqYoi1ak0AZKAQM2f/hJx+6hwQNER4W
         HKLkVvmGlD2ZDEJ/JxVKE2z/Muea18S+BmuqBVXomTER6MmCjVhfsixZ+KaBcLz/xMXN
         QQ+g==
X-Gm-Message-State: AOAM531ecxoJrkYAWfsU/FBiE9E/QLTgbbT80uCOaWBPYSR3NdtBCR2+
        Dh/4VrYZJ4hX+G7Rki24E1c3XKOlMFsajg==
X-Google-Smtp-Source: ABdhPJzoYr2ZvxGOOi1UxUWjqi2nBXJJNgCVv08G/R6WeDi/XzEG5Yr/0GJYOg/1nmPjGcQzyMH0vA==
X-Received: by 2002:a1c:dd83:: with SMTP id u125mr10331445wmg.93.1612083825331;
        Sun, 31 Jan 2021 01:03:45 -0800 (PST)
Received: from localhost.localdomain ([82.84.83.134])
        by smtp.gmail.com with ESMTPSA id z1sm17271152wrp.62.2021.01.31.01.03.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 31 Jan 2021 01:03:44 -0800 (PST)
From:   Dario Pagani <dario.pagani.146@gmail.com>
To:     jikos@kernel.org
Cc:     linux-input@vger.kernel.org, kimi.h.kuparinen@gmail.com,
        Dario Pagani <dario.pagani.146@gmail.com>
Subject: [PATCH] HID: support for initialization of some Thrustmaster wheels
Date:   Sun, 31 Jan 2021 10:00:45 +0100
Message-Id: <20210131090045.10636-1-dario.pagani.146@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Add support for proper initialization of some Thrustmaster wheels that
appear like a "Thrustmaster FFB Wheel" (044f:b65d) to the host. When the
device is connected a special usb request is sent, this request makes the
wheel disconnect and reappear to the host as the "real wheel".
For example: a T150 will re-appear as 044f:b677 and a T300 as 044f:b66e

Link: https://github.com/scarburato/hid-tminit
Signed-off-by: Dario Pagani <dario.pagani.146@gmail.com>
Co-developed-by: Kim Kuparinen <kimi.h.kuparinen@gmail.com>
Signed-off-by: Kim Kuparinen <kimi.h.kuparinen@gmail.com>
---
 drivers/hid/Kconfig      |  14 ++
 drivers/hid/Makefile     |   1 +
 drivers/hid/hid-quirks.c |   3 +
 drivers/hid/hid-tminit.c | 370 +++++++++++++++++++++++++++++++++++++++
 4 files changed, 388 insertions(+)
 create mode 100644 drivers/hid/hid-tminit.c

diff --git a/drivers/hid/Kconfig b/drivers/hid/Kconfig
index 09fa75a2b289..6af8e38a43bd 100644
--- a/drivers/hid/Kconfig
+++ b/drivers/hid/Kconfig
@@ -1037,6 +1037,20 @@ config THRUSTMASTER_FF
 	  a THRUSTMASTER Dual Trigger 3-in-1 or a THRUSTMASTER Ferrari GT
 	  Rumble Force or Force Feedback Wheel.
 
+config HID_TMINIT
+	tristate "Thrustmaster FFB Wheel initialization"
+	depends on USB_HID
+	help
+	  Say Y here if you want to enable support to properly initialize some
+	  Thrustmaster wheels that appear like a "Thrustmaster FFB Wheel"
+	  (044f:b65d) to the host.
+
+	  Currently supporting:
+	  - T150RS
+	  - T300RS
+	  - T300 Ferrari Alcantara Edition
+	  - T500RS
+
 config HID_UDRAW_PS3
 	tristate "THQ PS3 uDraw tablet"
 	depends on HID
diff --git a/drivers/hid/Makefile b/drivers/hid/Makefile
index 014d21fe7dac..ab48332b166e 100644
--- a/drivers/hid/Makefile
+++ b/drivers/hid/Makefile
@@ -112,6 +112,7 @@ obj-$(CONFIG_HID_STEELSERIES)	+= hid-steelseries.o
 obj-$(CONFIG_HID_SUNPLUS)	+= hid-sunplus.o
 obj-$(CONFIG_HID_GREENASIA)	+= hid-gaff.o
 obj-$(CONFIG_HID_THRUSTMASTER)	+= hid-tmff.o
+obj-$(CONFIG_HID_TMINIT)	+= hid-tminit.o
 obj-$(CONFIG_HID_TIVO)		+= hid-tivo.o
 obj-$(CONFIG_HID_TOPSEED)	+= hid-topseed.o
 obj-$(CONFIG_HID_TWINHAN)	+= hid-twinhan.o
diff --git a/drivers/hid/hid-quirks.c b/drivers/hid/hid-quirks.c
index d9ca874dffac..5b97fa2ebb9e 100644
--- a/drivers/hid/hid-quirks.c
+++ b/drivers/hid/hid-quirks.c
@@ -662,6 +662,9 @@ static const struct hid_device_id hid_have_special_driver[] = {
 	{ HID_USB_DEVICE(USB_VENDOR_ID_THRUSTMASTER, 0xb654) },
 	{ HID_USB_DEVICE(USB_VENDOR_ID_THRUSTMASTER, 0xb65a) },
 #endif
+#if IS_ENABLED(CONFIG_HID_TMINIT)
+	{ HID_USB_DEVICE(USB_VENDOR_ID_THRUSTMASTER, 0xb65d) },
+#endif
 #if IS_ENABLED(CONFIG_HID_TIVO)
 	{ HID_BLUETOOTH_DEVICE(USB_VENDOR_ID_TIVO, USB_DEVICE_ID_TIVO_SLIDE_BT) },
 	{ HID_USB_DEVICE(USB_VENDOR_ID_TIVO, USB_DEVICE_ID_TIVO_SLIDE) },
diff --git a/drivers/hid/hid-tminit.c b/drivers/hid/hid-tminit.c
new file mode 100644
index 000000000000..4c897449def6
--- /dev/null
+++ b/drivers/hid/hid-tminit.c
@@ -0,0 +1,370 @@
+// SPDX-License-Identifier: GPL-2.0
+/**
+ * When connected to the machine, the Thrustmaster wheels appear as
+ * a «generic» hid gamepad called "Thrustmaster FFB Wheel".
+ *
+ * When in this mode not every functionality of the wheel, like the force feedback,
+ * are available. To enable all functionalities of a Thrustmaster wheel we have to send
+ * to it a specific USB CONTROL request with a code different for each wheel.
+ *
+ * This driver tries to understand which model of Thrustmaster wheel the generic
+ * "Thrustmaster FFB Wheel" really is and then sends the appropriate control code.
+ *
+ * Copyright (c) 2020-2021 Dario Pagani <dario.pagani.146+linuxk@gmail.com>
+ * Copyright (c) 2020-2021 Kim Kuparinen <kimi.h.kuparinen@gmail.com>
+ */
+#include <linux/hid.h>
+#include <linux/usb.h>
+#include <linux/input.h>
+#include <linux/slab.h>
+#include <linux/module.h>
+
+/**
+ * These interrupts are used to prevent a nasty crash when initializing the
+ * T300RS. Used in tminit_interrupts().
+ */
+static const u8 setup_0[] = { 0x42, 0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00 };
+static const u8 setup_1[] = { 0x0a, 0x04, 0x90, 0x03, 0x00, 0x00, 0x00, 0x00 };
+static const u8 setup_2[] = { 0x0a, 0x04, 0x00, 0x0c, 0x00, 0x00, 0x00, 0x00 };
+static const u8 setup_3[] = { 0x0a, 0x04, 0x12, 0x10, 0x00, 0x00, 0x00, 0x00 };
+static const u8 setup_4[] = { 0x0a, 0x04, 0x00, 0x06, 0x00, 0x00, 0x00, 0x00 };
+static const u8 *const setup_arr[] = { setup_0, setup_1, setup_2, setup_3, setup_4 };
+static const unsigned int setup_arr_sizes[] = {
+	ARRAY_SIZE(setup_0),
+	ARRAY_SIZE(setup_1),
+	ARRAY_SIZE(setup_2),
+	ARRAY_SIZE(setup_3),
+	ARRAY_SIZE(setup_4)
+};
+/**
+ * This struct contains for each type of
+ * Thrustmaster wheel
+ *
+ * Note: The values are stored in the CPU
+ * endianness, the USB protocols always use
+ * little endian; the macro cpu_to_le[BIT]()
+ * must be used when preparing USB packets
+ * and vice-versa
+ */
+struct tm_wheel_info {
+	uint16_t wheel_type;
+
+	/**
+	 * See when the USB control out packet is prepared...
+	 * @TODO The TMX seems to require multiple control codes to switch.
+	 */
+	uint16_t switch_value;
+
+	char const *const wheel_name;
+};
+
+/**
+ * Known wheels.
+ * Note: TMX does not work as it requires 2 control packets
+ */
+static const struct tm_wheel_info tm_wheels_infos[] = {
+	{0x0306, 0x0006, "Thrustmaster T150RS"},
+	{0x0206, 0x0005, "Thrustmaster T300RS"},
+	{0x0204, 0x0005, "Thrustmaster T300 Ferrari Alcantara Edition"},
+	{0x0002, 0x0002, "Thrustmaster T500RS"}
+	//{0x0407, 0x0001, "Thrustmaster TMX"}
+};
+
+static const uint8_t tm_wheels_infos_length = 4;
+
+/**
+ * This structs contains (in little endian) the response data
+ * of the wheel to the request 73
+ *
+ * A sufficient research to understand what each field does is not
+ * beign conducted yet. The position and meaning of fields are a
+ * just a very optimistic guess based on instinct....
+ */
+struct __packed tm_wheel_response
+{
+	/**
+	 * Seems to be the type of packet
+	 * - 0x0049 if is data.a (15 bytes)
+	 * - 0x0047 if is data.b (7 bytes)
+	 */
+	uint16_t type;
+
+	union {
+		struct __packed {
+			uint16_t field0;
+			uint16_t field1;
+			/**
+			 * Seems to be the model code of the wheel
+			 * Read table thrustmaster_wheels to values
+			 */
+			uint16_t model;
+
+			uint16_t field2;
+			uint16_t field3;
+			uint16_t field4;
+			uint16_t field5;
+		} a;
+		struct __packed {
+			uint16_t field0;
+			uint16_t field1;
+			uint16_t model;
+		} b;
+	} data;
+};
+
+struct tm_wheel {
+	struct usb_device *usb_dev;
+	struct urb *urb;
+
+	struct usb_ctrlrequest *model_request;
+	struct tm_wheel_response *response;
+
+	struct usb_ctrlrequest *change_request;
+};
+
+/** The control packet to send to wheel */
+static const struct usb_ctrlrequest model_request = {
+	.bRequestType = 0xc1,
+	.bRequest = 73,
+	.wValue = 0,
+	.wIndex = 0,
+	.wLength = cpu_to_le16(0x0010)
+};
+
+static const struct usb_ctrlrequest change_request = {
+	.bRequestType = 0x41,
+	.bRequest = 83,
+	.wValue = 0, // Will be filled by the driver
+	.wIndex = 0,
+	.wLength = 0
+};
+
+/**
+ * On some setups initializing the T300RS crashes the kernel,
+ * these interrupts fix that particular issue. So far they haven't caused any
+ * adverse effects in other wheels.
+ */
+static void tminit_interrupts(struct hid_device *hdev)
+{
+	int ret, trans, i, b_ep;
+	u8 *send_buf = kmalloc(256, GFP_KERNEL);
+	struct usb_host_endpoint *ep;
+	struct device *dev = &hdev->dev;
+	struct usb_interface *usbif = to_usb_interface(dev->parent);
+	struct usb_device *usbdev = interface_to_usbdev(usbif);
+
+	if (!send_buf) {
+		hid_err(hdev, "failed allocating send buffer\n");
+		return;
+	}
+
+	ep = &usbif->cur_altsetting->endpoint[1];
+	b_ep = ep->desc.bEndpointAddress;
+
+	for (i = 0; i < ARRAY_SIZE(setup_arr); ++i) {
+		memcpy(send_buf, setup_arr[i], setup_arr_sizes[i]);
+
+		ret = usb_interrupt_msg(usbdev,
+			usb_sndintpipe(usbdev, b_ep),
+			send_buf,
+			setup_arr_sizes[i],
+			&trans,
+			USB_CTRL_SET_TIMEOUT);
+
+		if (ret) {
+			hid_err(hdev, "setup data couldn't be sent\n");
+			return;
+		}
+	}
+
+	kfree(send_buf);
+}
+
+static void tminit_change_handler(struct urb *urb)
+{
+	struct hid_device *hdev = urb->context;
+
+	// The wheel seems to kill himself before answering the host and therefore is violating the USB protocol...
+	if (urb->status == 0 || urb->status == -EPROTO || urb->status == -EPIPE)
+		hid_info(hdev, "Success?! The wheel should have been initialized!\n");
+	else
+		hid_warn(hdev, "URB to change wheel mode seems to have failed with error %d\n", urb->status);
+}
+
+/**
+ * Called by the USB subsystem when the wheel responses to our request
+ * to get [what it seems to be] the wheel's model.
+ *
+ * If the model id is recognized then we send an opportune USB CONTROL REQUEST
+ * to switch the wheel to its full capabilities
+ */
+static void tminit_model_handler(struct urb *urb)
+{
+	struct hid_device *hdev = urb->context;
+	struct tm_wheel *tm_wheel = hid_get_drvdata(hdev);
+	uint16_t model = 0;
+	int i, ret;
+	const struct tm_wheel_info *twi = 0;
+
+	if (urb->status) {
+		hid_err(hdev, "URB to get model id failed with error %d\n", urb->status);
+		return;
+	}
+
+	if (tm_wheel->response->type == cpu_to_le16(0x49))
+		model = le16_to_cpu(tm_wheel->response->data.a.model);
+	else if (tm_wheel->response->type == cpu_to_le16(0x47))
+		model = le16_to_cpu(tm_wheel->response->data.b.model);
+	else {
+		hid_err(hdev, "Unknown packet type 0x%x, unable to proceed further with wheel init\n", tm_wheel->response->type);
+		return;
+	}
+
+	for (i = 0; i < tm_wheels_infos_length && !twi; i++)
+		if (tm_wheels_infos[i].wheel_type == model)
+			twi = tm_wheels_infos + i;
+
+	if (twi)
+		hid_info(hdev, "Wheel with model id 0x%x is a %s\n", model, twi->wheel_name);
+	else {
+		hid_err(hdev, "Unknown wheel's model id 0x%x, unable to proceed further with wheel init\n", model);
+		return;
+	}
+
+	tm_wheel->change_request->wValue = cpu_to_le16(twi->switch_value);
+	usb_fill_control_urb(
+		tm_wheel->urb,
+		tm_wheel->usb_dev,
+		usb_sndctrlpipe(tm_wheel->usb_dev, 0),
+		(char *)tm_wheel->change_request,
+		0, 0, // We do not expect any response from the wheel
+		tminit_change_handler,
+		hdev
+	);
+
+	ret = usb_submit_urb(tm_wheel->urb, GFP_ATOMIC);
+	if (ret)
+		hid_err(hdev, "Error %d while submitting the change URB. I am unable to initialize this wheel...\n", ret);
+}
+
+static void tminit_remove(struct hid_device *hdev)
+{
+	struct tm_wheel *tm_wheel = hid_get_drvdata(hdev);
+
+	usb_kill_urb(tm_wheel->urb);
+
+	kfree(tm_wheel->response);
+	kfree(tm_wheel->model_request);
+	usb_free_urb(tm_wheel->urb);
+	kfree(tm_wheel);
+
+	hid_hw_stop(hdev);
+}
+
+/**
+ * Function called by HID when a hid Thrustmaster FFB wheel is connected to the host.
+ * This function starts the hid dev, tries to allocate the tm_wheel data structure and
+ * finally send an USB CONTROL REQUEST to the wheel to get [what it seems to be] its
+ * model type.
+ */
+static int tminit_probe(struct hid_device *hdev, const struct hid_device_id *id)
+{
+	int ret = 0;
+	struct tm_wheel *tm_wheel = 0;
+
+	ret = hid_parse(hdev);
+	if (ret) {
+		hid_err(hdev, "parse failed with error %d\n", ret);
+		goto error0;
+	}
+
+	ret = hid_hw_start(hdev, HID_CONNECT_DEFAULT & ~HID_CONNECT_FF);
+	if (ret) {
+		hid_err(hdev, "hw start failed with error %d\n", ret);
+		goto error0;
+	}
+
+	// Now we allocate the tm_wheel
+	tm_wheel = kzalloc(sizeof(struct tm_wheel), GFP_KERNEL);
+	if (!tm_wheel) {
+		ret = -ENOMEM;
+		goto error1;
+	}
+
+	tm_wheel->urb = usb_alloc_urb(0, GFP_ATOMIC);
+	if (!tm_wheel->urb) {
+		ret = -ENOMEM;
+		goto error2;
+	}
+
+	tm_wheel->model_request = kzalloc(sizeof(struct usb_ctrlrequest), GFP_KERNEL);
+	if (!tm_wheel->model_request) {
+		ret = -ENOMEM;
+		goto error3;
+	}
+	memcpy(tm_wheel->model_request, &model_request, sizeof(struct usb_ctrlrequest));
+
+	tm_wheel->response = kzalloc(sizeof(struct tm_wheel_response), GFP_KERNEL);
+	if (!tm_wheel->response) {
+		ret = -ENOMEM;
+		goto error4;
+	}
+
+	tm_wheel->change_request = kzalloc(sizeof(struct usb_ctrlrequest), GFP_KERNEL);
+	if (!tm_wheel->model_request) {
+		ret = -ENOMEM;
+		goto error5;
+	}
+	memcpy(tm_wheel->change_request, &change_request, sizeof(struct usb_ctrlrequest));
+
+	tm_wheel->usb_dev = interface_to_usbdev(to_usb_interface(hdev->dev.parent));
+	hid_set_drvdata(hdev, tm_wheel);
+
+	tminit_interrupts(hdev);
+
+	usb_fill_control_urb(
+		tm_wheel->urb,
+		tm_wheel->usb_dev,
+		usb_rcvctrlpipe(tm_wheel->usb_dev, 0),
+		(char *)tm_wheel->model_request,
+		tm_wheel->response,
+		sizeof(struct tm_wheel_response),
+		tminit_model_handler,
+		hdev
+	);
+
+	ret = usb_submit_urb(tm_wheel->urb, GFP_ATOMIC);
+	if (ret)
+		hid_err(hdev, "Error %d while submitting the URB. I am unable to initialize this wheel...\n", ret);
+
+	return ret;
+
+error5: kfree(tm_wheel->response);
+error4: kfree(tm_wheel->model_request);
+error3: usb_free_urb(tm_wheel->urb);
+error2: kfree(tm_wheel);
+error1: hid_hw_stop(hdev);
+error0:
+	return ret;
+}
+
+static const struct hid_device_id tminit_devices[] = {
+	{ HID_USB_DEVICE(0x044f, 0xb65d)},
+	{}
+};
+
+MODULE_DEVICE_TABLE(hid, tminit_devices);
+
+static struct hid_driver tminit_driver = {
+	.name = "hid-tminit",
+	.id_table = tminit_devices,
+	.probe = tminit_probe,
+	.remove = tminit_remove,
+};
+
+module_hid_driver(tminit_driver);
+
+MODULE_AUTHOR("Dario Pagani <dario.pagani.146+linuxk@gmail.com>");
+MODULE_LICENSE("GPL");
+MODULE_DESCRIPTION("Driver to initialize some steering wheel joysticks from Thrustmaster");
+
-- 
2.25.1

