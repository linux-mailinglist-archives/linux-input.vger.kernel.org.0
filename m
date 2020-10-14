Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7E1BA28DD36
	for <lists+linux-input@lfdr.de>; Wed, 14 Oct 2020 11:25:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727449AbgJNJXN (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 14 Oct 2020 05:23:13 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39930 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730260AbgJNJWw (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Wed, 14 Oct 2020 05:22:52 -0400
Received: from mail-wr1-x443.google.com (mail-wr1-x443.google.com [IPv6:2a00:1450:4864:20::443])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 547DAC004587
        for <linux-input@vger.kernel.org>; Tue, 13 Oct 2020 18:31:12 -0700 (PDT)
Received: by mail-wr1-x443.google.com with SMTP id h5so1719625wrv.7
        for <linux-input@vger.kernel.org>; Tue, 13 Oct 2020 18:31:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=/qnA6TsLeJ3slKwLJeRhi1ABn3AFGdo1ueua7nAEJ6k=;
        b=Zk8EoBRDO1dbkQPHbnVgNIJF9SQCmht42Boyc7ZcV/IvUlZK2PkWMowLUGo1UxpV3L
         57AzD7x8NZd15gZqCgNb3oYn/pDizhXt9qHav+vTickX2HzT0ZtOTwtDuOGhs1aYA8Pv
         D1xCtTamR6dCANRB3LLSsQdb2Xx4Iwu+GxX4LuFeMFV2mD71qc9VxMvapH7tCOPnis4W
         Psi/WkEkhnnx+o3PVqUOJZh+YSVu31efg+Ewe+2An1IAHJN0Ev59rqAEDnxfcsiDKX0Z
         h/BACSQpsU8Oi73XFOcTAqmXVt1aN5kLbQa+jwHUusFLDUDRWoNjP59lPbVTBakbPw+g
         g2uA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=/qnA6TsLeJ3slKwLJeRhi1ABn3AFGdo1ueua7nAEJ6k=;
        b=ECzAcsfxRaKFlWLzDH2DF/dixr9K0GNUaBpUDW2l0Oy5gg7QAupnIIxhO+c0SQdhJX
         Cb8W+T3ZWpM0fP4r7rsly9d6A03/x/AMpl/mLSh2X7tUHoTpOasGSpnz3fpNP8LxGGJR
         Nz4qPUJJBjvri3TI3a+lebcU3YGhMdsEnMULIL5599m6fwDUemryt0Uno/++Hw9yKEd+
         ou1OX3lGBU6LfIY6E1Rk3a5nqDYTmTYrqHxfJCCU1rTXMbr8WEoLNNpg8H46tqx8dYUB
         FZkBpUTpjlliZVi5WvSgxN8pXMlXuWk2LzVO7wi+mxvWnm9UKLJfz5wuSyu8A2pxaMJo
         JYoQ==
X-Gm-Message-State: AOAM530wSmGfDKNQMEFIsX9+4613UDDeKP1zI1uvidVZLZ3qCnjLK+2e
        LfrSJoo1RPxMK+IQ2CWABesDlvRCHJG0Dolh
X-Google-Smtp-Source: ABdhPJzExeTbWAnXuwC0b6XmAthtVYin+8V7z2Wa2iUo3pOvaAv5GmNoHZGkHLXOh7ilAMiyx/CSZQ==
X-Received: by 2002:adf:fd82:: with SMTP id d2mr2521015wrr.304.1602639070654;
        Tue, 13 Oct 2020 18:31:10 -0700 (PDT)
Received: from localhost (242.19.86.79.rev.sfr.net. [79.86.19.242])
        by smtp.gmail.com with ESMTPSA id f14sm2096873wrt.53.2020.10.13.18.31.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Oct 2020 18:31:10 -0700 (PDT)
From:   =?UTF-8?q?Fran=C3=A7ois-Xavier=20Carton?= <fx.carton91@gmail.com>
To:     linux-input@vger.kernel.org, Jiri Kosina <jikos@kernel.org>,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>
Cc:     =?UTF-8?q?Fran=C3=A7ois-Xavier=20Carton?= <fx.carton91@gmail.com>,
        Ethan Lee <flibitijibibo@gmail.com>,
        Bastien Nocera <hadess@hadess.net>
Subject: [PATCH v3 1/4] HID: gamecube-adapter: add nintendo gamecube adapter
Date:   Wed, 14 Oct 2020 03:30:20 +0200
Message-Id: <20201014013023.23078-2-fx.carton91@gmail.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20201014013023.23078-1-fx.carton91@gmail.com>
References: <20201014013023.23078-1-fx.carton91@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

The hid-gamecube-adapter driver supports Nintendo Gamecube Controller
Adapters. They are USB devices on which up to four Nintendo Gamecube
Controllers can be plugged. The driver creates independent input devices
as controllers are connected.

Signed-off-by: François-Xavier Carton <fx.carton91@gmail.com>
---
 MAINTAINERS                        |   6 +
 drivers/hid/Kconfig                |  10 +
 drivers/hid/Makefile               |   1 +
 drivers/hid/hid-gamecube-adapter.c | 394 +++++++++++++++++++++++++++++
 drivers/hid/hid-ids.h              |   1 +
 5 files changed, 412 insertions(+)
 create mode 100644 drivers/hid/hid-gamecube-adapter.c

diff --git a/MAINTAINERS b/MAINTAINERS
index d5b1878f2815..a4ff6219f84a 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -7025,6 +7025,12 @@ F:	scripts/gcc-plugin.sh
 F:	scripts/Makefile.gcc-plugins
 F:	Documentation/kbuild/gcc-plugins.rst
 
+GAMECUBE ADAPTER HID DRIVER
+M:	François-Xavier Carton <fx.carton91@gmail.com>
+L:	linux-input@vger.kernel.org
+S:	Maintained
+F:	drivers/hid/hid-gamecube-adapter*
+
 GASKET DRIVER FRAMEWORK
 M:	Rob Springer <rspringer@google.com>
 M:	Todd Poynor <toddpoynor@google.com>
diff --git a/drivers/hid/Kconfig b/drivers/hid/Kconfig
index 7c89edbd6c5a..c2bb95bda44d 100644
--- a/drivers/hid/Kconfig
+++ b/drivers/hid/Kconfig
@@ -350,6 +350,16 @@ config HID_EZKEY
 	---help---
 	Support for Ezkey BTC 8193 keyboard.
 
+config HID_GAMECUBE_ADAPTER
+	tristate "Nintendo Gamecube Controller Adapter support"
+	depends on HID
+	depends on USB_HID
+	help
+	  Support for the Nintendo Gamecube Controller Adapter.
+
+	  To compile this driver as a module, choose M here: the
+	  module will be called hid-gamecube-adapter.
+
 config HID_GEMBIRD
 	tristate "Gembird Joypad"
 	depends on HID
diff --git a/drivers/hid/Makefile b/drivers/hid/Makefile
index d8ea4b8c95af..9cddc4d48db8 100644
--- a/drivers/hid/Makefile
+++ b/drivers/hid/Makefile
@@ -46,6 +46,7 @@ obj-$(CONFIG_HID_ELAN)		+= hid-elan.o
 obj-$(CONFIG_HID_ELECOM)	+= hid-elecom.o
 obj-$(CONFIG_HID_ELO)		+= hid-elo.o
 obj-$(CONFIG_HID_EZKEY)		+= hid-ezkey.o
+obj-$(CONFIG_HID_GAMECUBE_ADAPTER)	+= hid-gamecube-adapter.o
 obj-$(CONFIG_HID_GEMBIRD)	+= hid-gembird.o
 obj-$(CONFIG_HID_GFRM)		+= hid-gfrm.o
 obj-$(CONFIG_HID_GLORIOUS)  += hid-glorious.o
diff --git a/drivers/hid/hid-gamecube-adapter.c b/drivers/hid/hid-gamecube-adapter.c
new file mode 100644
index 000000000000..7193db1a0782
--- /dev/null
+++ b/drivers/hid/hid-gamecube-adapter.c
@@ -0,0 +1,394 @@
+// SPDX-License-Identifier: GPL-2.0+
+/*
+ * HID driver for Nintendo Gamecube Controller Adapters
+ *
+ * Copyright (c) 2020 François-Xavier Carton <fx.carton91@gmail.com>
+ *
+ * This driver is based on:
+ *   https://github.com/ToadKing/wii-u-gc-adapter
+ *   drivers/hid/hid-wiimote-core.c
+ *   drivers/hid/hid-steam.c
+ *
+ */
+
+#include "hid-ids.h"
+#include <linux/device.h>
+#include <linux/hid.h>
+#include <linux/module.h>
+#include <linux/rcupdate.h>
+#include <linux/usb.h>
+#include "usbhid/usbhid.h"
+
+enum gamecube_output {
+	GC_CMD_INIT = 0x13
+};
+
+enum gamecube_input {
+	GC_INPUT_REPORT = 0x21
+};
+
+#define GC_INPUT_REPORT_SIZE 37
+
+enum gamecube_ctrl_flags {
+	GC_FLAG_EXTRAPOWER = BIT(2),
+	GC_TYPE_NORMAL = BIT(4),
+	GC_TYPE_WAVEBIRD = BIT(5),
+	GC_TYPES = GC_TYPE_NORMAL | GC_TYPE_WAVEBIRD
+};
+
+enum gamecube_btn {
+	GC_BTN_START = BIT(0),
+	GC_BTN_Z = BIT(1),
+	GC_BTN_R = BIT(2),
+	GC_BTN_L = BIT(3),
+	GC_BTN_A = BIT(8),
+	GC_BTN_B = BIT(9),
+	GC_BTN_X = BIT(10),
+	GC_BTN_Y = BIT(11),
+	GC_BTN_DPAD_LEFT = BIT(12),
+	GC_BTN_DPAD_RIGHT = BIT(13),
+	GC_BTN_DPAD_DOWN = BIT(14),
+	GC_BTN_DPAD_UP = BIT(15),
+};
+
+struct gamecube_ctrl {
+	struct input_dev __rcu *input;
+	struct gamecube_adpt *adpt;
+	enum gamecube_ctrl_flags flags;
+	struct work_struct work_connect;
+	spinlock_t flags_lock;
+};
+
+struct gamecube_adpt {
+	struct gamecube_ctrl ctrls[4];
+	struct hid_device *hdev;
+};
+
+static int gamecube_hid_send(struct hid_device *hdev, const u8 *data, size_t n)
+{
+	u8 *buf;
+	int ret;
+
+	buf = kmemdup(data, n, GFP_KERNEL);
+	if (!buf)
+		return -ENOMEM;
+	ret = hid_hw_output_report(hdev, buf, n);
+	kfree(buf);
+	return ret;
+}
+
+static int gamecube_send_cmd_init(struct hid_device *hdev)
+{
+	const u8 initcmd[] = {GC_CMD_INIT};
+
+	return gamecube_hid_send(hdev, initcmd, sizeof(initcmd));
+}
+
+static const unsigned int gamecube_buttons[] = {
+	BTN_START, BTN_TR2, BTN_TR, BTN_TL,
+	BTN_SOUTH, BTN_WEST, BTN_EAST, BTN_NORTH,
+	BTN_DPAD_LEFT, BTN_DPAD_RIGHT, BTN_DPAD_DOWN, BTN_DPAD_UP
+};
+
+static const unsigned int gamecube_axes[] = {
+	ABS_X, ABS_Y, ABS_RX, ABS_RY, ABS_Z, ABS_RZ
+};
+
+static const char *gamecube_ctrl_name(u8 type)
+{
+	switch (type) {
+	case GC_TYPE_NORMAL:
+		return "Standard Gamecube Controller";
+	case GC_TYPE_WAVEBIRD:
+		return "Wavebird Gamecube Controller";
+	}
+	return NULL;
+}
+
+static int gamecube_ctrl_create(struct gamecube_ctrl *ctrl, u8 type)
+{
+	struct input_dev *input;
+	struct hid_device *hdev = ctrl->adpt->hdev;
+	const char *name;
+	unsigned int i;
+	int ret;
+
+	name = gamecube_ctrl_name(type);
+	if (!name) {
+		unsigned int num = ctrl - ctrl->adpt->ctrls + 1U;
+
+		hid_warn(hdev, "port %u: unknown controller plugged in\n", num);
+		return -EINVAL;
+	}
+
+	input = input_allocate_device();
+	if (!input)
+		return -ENOMEM;
+
+	input_set_drvdata(input, ctrl);
+	input->id.bustype = hdev->bus;
+	input->id.vendor = hdev->vendor;
+	input->id.product = hdev->product;
+	input->id.version = hdev->version;
+	input->name = name;
+
+	for (i = 0; i < ARRAY_SIZE(gamecube_buttons); i++)
+		input_set_capability(input, EV_KEY, gamecube_buttons[i]);
+	for (i = 0; i < ARRAY_SIZE(gamecube_axes); i++)
+		input_set_abs_params(input, gamecube_axes[i], 0, 255, 0, 0);
+
+	ret = input_register_device(input);
+	if (ret)
+		goto err_free_device;
+
+	rcu_assign_pointer(ctrl->input, input);
+	return 0;
+
+err_free_device:
+	input_free_device(input);
+	return ret;
+}
+
+static void gamecube_ctrl_destroy(struct gamecube_ctrl *ctrl)
+{
+	struct input_dev *input;
+
+	rcu_read_lock();
+	input = rcu_dereference(ctrl->input);
+	rcu_read_unlock();
+	if (!input)
+		return;
+	RCU_INIT_POINTER(ctrl->input, NULL);
+	synchronize_rcu();
+	input_unregister_device(input);
+}
+
+static void gamecube_work_connect_cb(struct work_struct *work)
+{
+	struct gamecube_ctrl *ctrl = container_of(work, struct gamecube_ctrl,
+						work_connect);
+	struct input_dev *input;
+	unsigned long irq_flags;
+	unsigned int num = ctrl - ctrl->adpt->ctrls + 1U;
+	u8 type;
+
+	spin_lock_irqsave(&ctrl->flags_lock, irq_flags);
+	type = ctrl->flags & GC_TYPES;
+	spin_unlock_irqrestore(&ctrl->flags_lock, irq_flags);
+
+	rcu_read_lock();
+	input = rcu_dereference(ctrl->input);
+	rcu_read_unlock();
+
+	if (type && input) {
+		hid_info(ctrl->adpt->hdev, "port %u: already connected\n", num);
+	} else if (type) {
+		hid_info(ctrl->adpt->hdev, "port %u: controller plugged in\n", num);
+		gamecube_ctrl_create(ctrl, type);
+	} else if (input) {
+		hid_info(ctrl->adpt->hdev, "port %u: controller unplugged\n", num);
+		gamecube_ctrl_destroy(ctrl);
+	}
+}
+
+static void gamecube_ctrl_handle_report(struct gamecube_ctrl *ctrl, u8 *data)
+{
+	struct input_dev *dev;
+	u16 btns = data[1] << 8 | data[2];
+	u8 old_flags, new_flags = data[0];
+	unsigned long irq_flags;
+
+	spin_lock_irqsave(&ctrl->flags_lock, irq_flags);
+	old_flags = ctrl->flags;
+	ctrl->flags = new_flags;
+	spin_unlock_irqrestore(&ctrl->flags_lock, irq_flags);
+
+	if ((new_flags & GC_TYPES) != (old_flags & GC_TYPES)) {
+		schedule_work(&ctrl->work_connect);
+		return;
+	}
+	if (!(new_flags & GC_TYPES))
+		return;
+
+	rcu_read_lock();
+	dev = rcu_dereference(ctrl->input);
+	if (!dev)
+		goto unlock;
+
+	input_report_key(dev, BTN_START, btns & GC_BTN_START);
+	input_report_key(dev, BTN_TR2, btns & GC_BTN_Z);
+	input_report_key(dev, BTN_TR, btns & GC_BTN_R);
+	input_report_key(dev, BTN_TL, btns & GC_BTN_L);
+	input_report_key(dev, BTN_SOUTH, btns & GC_BTN_A);
+	input_report_key(dev, BTN_WEST, btns & GC_BTN_B);
+	input_report_key(dev, BTN_EAST, btns & GC_BTN_X);
+	input_report_key(dev, BTN_NORTH, btns & GC_BTN_Y);
+	input_report_key(dev, BTN_DPAD_LEFT, btns & GC_BTN_DPAD_LEFT);
+	input_report_key(dev, BTN_DPAD_RIGHT, btns & GC_BTN_DPAD_RIGHT);
+	input_report_key(dev, BTN_DPAD_DOWN, btns & GC_BTN_DPAD_DOWN);
+	input_report_key(dev, BTN_DPAD_UP, btns & GC_BTN_DPAD_UP);
+	input_report_abs(dev, ABS_X, data[3]);
+	input_report_abs(dev, ABS_Y, 255 - data[4]);
+	input_report_abs(dev, ABS_RX, data[5]);
+	input_report_abs(dev, ABS_RY, 255 - data[6]);
+	input_report_abs(dev, ABS_Z, data[7]);
+	input_report_abs(dev, ABS_RZ, data[8]);
+	input_sync(dev);
+
+unlock:
+	rcu_read_unlock();
+}
+
+static int gamecube_hid_event(struct hid_device *hdev,
+			struct hid_report *report, u8 *raw_data, int size)
+{
+	struct gamecube_adpt *adpt = hid_get_drvdata(hdev);
+	u8 *ctrl_data;
+	unsigned int i;
+
+	if (size < 1)
+		return -EINVAL;
+	if (size == GC_INPUT_REPORT_SIZE && raw_data[0] == GC_INPUT_REPORT) {
+		for (i = 0; i < 4; i++) {
+			ctrl_data = raw_data + 1 + 9 * i;
+			gamecube_ctrl_handle_report(adpt->ctrls + i, ctrl_data);
+		}
+	} else {
+		hid_warn(hdev, "unhandled event\n");
+	}
+
+	return 0;
+}
+
+static struct gamecube_adpt *gamecube_adpt_create(struct hid_device *hdev)
+{
+	struct gamecube_adpt *adpt;
+	struct gamecube_ctrl *ctrl;
+	unsigned int i;
+
+	adpt = kzalloc(sizeof(*adpt), GFP_KERNEL);
+	if (!adpt)
+		return NULL;
+
+	adpt->hdev = hdev;
+	hid_set_drvdata(hdev, adpt);
+
+	for (i = 0; i < 4; i++) {
+		ctrl = adpt->ctrls + i;
+		ctrl->adpt = adpt;
+		INIT_WORK(&ctrl->work_connect, gamecube_work_connect_cb);
+		spin_lock_init(&ctrl->flags_lock);
+	}
+
+	return adpt;
+}
+
+static void gamecube_adpt_destroy(struct gamecube_adpt *adpt)
+{
+	unsigned int i;
+
+	for (i = 0; i < 4; i++)
+		gamecube_ctrl_destroy(adpt->ctrls + i);
+	hid_hw_close(adpt->hdev);
+	hid_hw_stop(adpt->hdev);
+	kfree(adpt);
+}
+
+/* This is needed, as by default the URB buffer size is set to 38, which is
+ * one byte too long and will result in EOVERFLOW failures.
+ */
+static int gamecube_fixup_urb_in(struct gamecube_adpt *adpt)
+{
+	struct hid_device *hdev = adpt->hdev;
+	struct usbhid_device *usbhid;
+
+	if (!hid_is_using_ll_driver(hdev, &usb_hid_driver))
+		return -EINVAL;
+	usbhid = hdev->driver_data;
+	if (usbhid->urbin->transfer_buffer_length < GC_INPUT_REPORT_SIZE)
+		return -EINVAL;
+	usbhid->urbin->transfer_buffer_length = GC_INPUT_REPORT_SIZE;
+	return 0;
+}
+
+static int gamecube_hid_probe(struct hid_device *hdev,
+				const struct hid_device_id *id)
+{
+	struct gamecube_adpt *adpt;
+	int ret;
+
+	adpt = gamecube_adpt_create(hdev);
+	if (!adpt) {
+		hid_err(hdev, "Can't alloc device\n");
+		return -ENOMEM;
+	}
+
+	ret = hid_parse(hdev);
+	if (ret) {
+		hid_err(hdev, "HID parse failed\n");
+		goto err;
+	}
+
+	ret = hid_hw_start(hdev, HID_CONNECT_HIDRAW);
+	if (ret) {
+		hid_err(hdev, "HW start failed\n");
+		goto err;
+	}
+
+	ret = hid_hw_open(hdev);
+	if (ret) {
+		hid_err(hdev, "cannot start hardware I/O\n");
+		goto err_stop;
+	}
+
+	ret = gamecube_fixup_urb_in(adpt);
+	if (ret) {
+		hid_err(hdev, "failed to fix input URB\n");
+		goto err_close;
+	}
+
+	ret = gamecube_send_cmd_init(hdev);
+	if (ret < 0) {
+		hid_err(hdev, "failed to send init command\n");
+		goto err_close;
+	}
+
+	hid_info(hdev, "new adapter registered\n");
+	return 0;
+
+err_close:
+	hid_hw_close(hdev);
+err_stop:
+	hid_hw_stop(hdev);
+err:
+	kfree(adpt);
+	return ret;
+}
+
+static void gamecube_hid_remove(struct hid_device *hdev)
+{
+	struct gamecube_adpt *adpt = hid_get_drvdata(hdev);
+
+	hid_info(hdev, "adapter removed\n");
+	gamecube_adpt_destroy(adpt);
+}
+
+static const struct hid_device_id gamecube_hid_devices[] = {
+	{ HID_USB_DEVICE(USB_VENDOR_ID_NINTENDO,
+			 USB_DEVICE_ID_NINTENDO_GAMECUBE_ADAPTER) },
+	{ }
+};
+MODULE_DEVICE_TABLE(hid, gamecube_hid_devices);
+
+static struct hid_driver gamecube_hid_driver = {
+	.name		= "gamecube-adapter",
+	.id_table	= gamecube_hid_devices,
+	.probe		= gamecube_hid_probe,
+	.remove		= gamecube_hid_remove,
+	.raw_event	= gamecube_hid_event,
+};
+module_hid_driver(gamecube_hid_driver);
+
+MODULE_LICENSE("GPL");
+MODULE_AUTHOR("François-Xavier Carton <fx.carton91@gmail.com>");
+MODULE_DESCRIPTION("Driver for Nintendo Gamecube Controller Adapters");
diff --git a/drivers/hid/hid-ids.h b/drivers/hid/hid-ids.h
index b18b13147a6f..1ebea811ea3b 100644
--- a/drivers/hid/hid-ids.h
+++ b/drivers/hid/hid-ids.h
@@ -882,6 +882,7 @@
 #define USB_VENDOR_ID_NINTENDO		0x057e
 #define USB_DEVICE_ID_NINTENDO_WIIMOTE	0x0306
 #define USB_DEVICE_ID_NINTENDO_WIIMOTE2	0x0330
+#define USB_DEVICE_ID_NINTENDO_GAMECUBE_ADAPTER	0x0337
 
 #define USB_VENDOR_ID_NOVATEK		0x0603
 #define USB_DEVICE_ID_NOVATEK_PCT	0x0600
-- 
2.26.2

