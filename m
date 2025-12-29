Return-Path: <linux-input+bounces-16715-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C198CE5D19
	for <lists+linux-input@lfdr.de>; Mon, 29 Dec 2025 04:18:12 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id AD57030047B4
	for <lists+linux-input@lfdr.de>; Mon, 29 Dec 2025 03:18:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EE376274650;
	Mon, 29 Dec 2025 03:18:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="aK4zOQXm"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-dl1-f43.google.com (mail-dl1-f43.google.com [74.125.82.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD207258CE7
	for <linux-input@vger.kernel.org>; Mon, 29 Dec 2025 03:18:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766978283; cv=none; b=dktd8K0XMsDcTlytiPizVCCmrJBdzeS+93iAcE7Wgyrq2s5a4RfCiDrfTl3RQ5dxT3M5aUQJrf8vMiqyI+3oyVFb1F0qEfBqODsEp25Y63XkMXqFUDqN+LvvrKSRXJH3BByFKdNmpMwJKC6/J26yM9c30QBF4qvp6wqH4tUSYkE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766978283; c=relaxed/simple;
	bh=VJRHLoH/I2SgffmsYbYbeS8A0U0iuJzaGjBajIKJnf4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Oj7g+tpWzqo/WaotX4kMKhLnOeRtT2bI0DN/CSgpB5RDa0Jn3LEk3wwHbAtxmLNtiwDidyXMAyx657VIJ1tuarTpWwwJBLDRMppn7BemTfjPXAnmdCMluTdZNQ3bwIb5H+CpANVGbXwam7PnQO8h+TwHrsB2F9UyBFqULESD1aE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=aK4zOQXm; arc=none smtp.client-ip=74.125.82.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-dl1-f43.google.com with SMTP id a92af1059eb24-11beb0a7bd6so12807580c88.1
        for <linux-input@vger.kernel.org>; Sun, 28 Dec 2025 19:18:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1766978280; x=1767583080; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qfbbtlHikLQOWZ/xeRNJiGTjXM9W91zKXMxinu1OeII=;
        b=aK4zOQXmdfUimdm4CWLJTWdA2T9ql/zb+WKo/n36nItl9dRX1jXh9xWuv/czXOZzTf
         2Bgw/gI1LcTIjTYpE+BMfY9v5bcH7ki/X6Zs5oekkJ541OXGvEZ3bK11qVqwb8TJ7eIa
         c7yVVj0PGladNADbx8L8Y6KiijVWM21YajaNOGXq5If+Qlkb77HKqEMrBLNKMY9Pxhmc
         IcPJgNjCzv/k55K8NdXiDKZLax6mYBioxqCCmX7Jk6ldjAm17v8uM8udsj6FPBHSyBHx
         8AidkBl6BMA79hkcJ1mb2J+QaUfWy5m8dY5wCChbVr0XcqhelJ1AetoCNQo/sfJx2yEg
         CdAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766978280; x=1767583080;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=qfbbtlHikLQOWZ/xeRNJiGTjXM9W91zKXMxinu1OeII=;
        b=mkgfXYmdN7Ji4Hl5XCp7P2q4epv87gyb85c9r+J2qLtvubvs5xGOmuwP4LwqczGijv
         N7m5rBo8YIADSNvXXTc8L6/mWpeSgXUWBsgICrKX/0Amub4i26+Zqr1t3leCM/VScPuR
         shaoOi/QGgVs1V5JM58S2qqjjcC4O8M53zMBHkl8CN8SNDUGorlWM+v9IuXY40fRiA5/
         DaiPmr+oA+rXa/4j9qk1K/HNMZQiQk1g4s4weeWmNH8O25TfqEAWVdLG1i8wu/VCjhKb
         AOih8z/43YW5rsvgOAbNHt/N/YMs2RBqe0+M127I2/prd/qLlQIJC3CgoBS/UnQIi5TO
         C8NA==
X-Forwarded-Encrypted: i=1; AJvYcCUjpXPSu0V/5iQC6nESdw6ZrprKnZfVk44hYLMcqK4Ga5o89Pm6xGKm20DyMSuEisPPv1Q1dyDdsIH6Fg==@vger.kernel.org
X-Gm-Message-State: AOJu0YzgbUpIwFY6U5JgUUB9sMsIRPVMaq1cSiZRRUFk0dQs+8iB9PCO
	eOT9cqmQ9k5gFVHpnUUvyJu2OGdxNbFuJVroe9AerySBYmBdPaI6xcsp
X-Gm-Gg: AY/fxX7qOIER5loegaCfzptQs3YJIwZxLse6w4Bi4aYUl6qDRcvAOqD8NwqEfmjCLyT
	nqvHQjJjNa5LQ6MOEKm7l6NMYoRZsveudCkE2MixRyR7tTKbdcgIw1fOETLqUeWDa3w+/99wLUw
	lxuPlv64bpYbkCfS5BfYpjUIf62Y4f+HotJYeiwV62JzxNhcaeZHP1V4F+nnjRxSZUrvmyyLgWE
	6xg5ODMSQUJPgDl/7nnEb7r8wkFSMQTTOzxx8lwIPUb0wJNep282lXmAyi72QHw2HhksFFQS0vX
	HC/i6lJwqMkLe6IAJNElZd0gYGyk3XIK6kQxDBd1EoN6MSPxjHCjQ7A/X+Jwzf56ypx8ZZr0+kR
	qdRaOUoAraIEyJu0Vid5BSjEnMiWa1Ty6gVsqvioBtYW/oO2D2vO2OX6gIqZWV+1qObUo0pGGt1
	vNyk41wv8g9OAlJBtfSgvR1fljxashLl47etUffguVcdoP4z2ev5VWM3SeV0uctao=
X-Google-Smtp-Source: AGHT+IHP/FuPIGvu5ySQpe2cB4z5xiMGdSG5/JRvpjcmeXIO5NMQBSlQA6GVAalZgjzeldq4cYQT4A==
X-Received: by 2002:a05:7022:f401:b0:11f:2c69:3b with SMTP id a92af1059eb24-12061942691mr32013078c88.10.1766978279571;
        Sun, 28 Dec 2025 19:17:59 -0800 (PST)
Received: from lappy (108-228-232-20.lightspeed.sndgca.sbcglobal.net. [108.228.232.20])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-121724dd7f5sm112992785c88.5.2025.12.28.19.17.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 28 Dec 2025 19:17:59 -0800 (PST)
From: "Derek J. Clark" <derekjohn.clark@gmail.com>
To: Jiri Kosina <jikos@kernel.org>,
	Benjamin Tissoires <bentiss@kernel.org>
Cc: Mario Limonciello <mario.limonciello@amd.com>,
	Zhixin Zhang <zhangzx36@lenovo.com>,
	Mia Shao <shaohz1@lenovo.com>,
	Mark Pearson <mpearson-lenovo@squebb.ca>,
	"Pierre-Loup A . Griffais" <pgriffais@valvesoftware.com>,
	"Derek J . Clark" <derekjohn.clark@gmail.com>,
	linux-input@vger.kernel.org,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 02/16] HID: hid-lenovo-go: Add Lenovo Legion Go Series HID Driver
Date: Mon, 29 Dec 2025 03:17:39 +0000
Message-ID: <20251229031753.581664-3-derekjohn.clark@gmail.com>
X-Mailer: git-send-email 2.51.2
In-Reply-To: <20251229031753.581664-1-derekjohn.clark@gmail.com>
References: <20251229031753.581664-1-derekjohn.clark@gmail.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Adds initial framework for a new HID driver, hid-lenovo-go, along with
attributes that report the firmware and hardware version for each
component of the HID device, of which there are 4 parts: The MCU, the
transmission dongle, the left "handle" controller half, and the right
"handle" controller half. Each of these devices are provided an attribute
group to contain its device specific attributes. Additionally, the touchpad
device attributes are logically separated from the other components in
another attribute group.

This driver primarily provides access to the configurable settings of the
Lenovo Legion Go and Lenovo Legion Go 2 controllers running the latest
firmware. As previously noted, the Legion Go controllers recently had a
firmware update[1] which switched from the original "SepentiaUSB" protocol
to a brand new protocol for the Go 2, primarily to ensure backwards and
forwards compatibility between the Go and Go 2 devices. As part of that
update the PIDs for the controllers were changed, so there is no risk of
this driver attaching to controller firmware that it doesn't support.

Signed-off-by: Derek J. Clark <derekjohn.clark@gmail.com>
---
 MAINTAINERS                 |   6 +
 drivers/hid/Kconfig         |  12 +
 drivers/hid/Makefile        |   1 +
 drivers/hid/hid-ids.h       |   3 +
 drivers/hid/hid-lenovo-go.c | 734 ++++++++++++++++++++++++++++++++++++
 5 files changed, 756 insertions(+)
 create mode 100644 drivers/hid/hid-lenovo-go.c

diff --git a/MAINTAINERS b/MAINTAINERS
index 9ed6d11a7746..b5ad29d24e3e 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -14135,6 +14135,12 @@ L:	platform-driver-x86@vger.kernel.org
 S:	Maintained
 F:	drivers/platform/x86/lenovo/wmi-hotkey-utilities.c
 
+LENOVO HID drivers
+M:	Derek J. Clark <derekjohn.clark@gmail.com>
+L:	linux-input@vger.kernel.org
+S:	Maintained
+F:	drivers/hid/hid-lenovo-go.c
+
 LETSKETCH HID TABLET DRIVER
 M:	Hans de Goede <hansg@kernel.org>
 L:	linux-input@vger.kernel.org
diff --git a/drivers/hid/Kconfig b/drivers/hid/Kconfig
index 04420a713be0..74ac6793b29a 100644
--- a/drivers/hid/Kconfig
+++ b/drivers/hid/Kconfig
@@ -621,6 +621,18 @@ config HID_LENOVO
 	- ThinkPad Compact Bluetooth Keyboard with TrackPoint (supports Fn keys)
 	- ThinkPad Compact USB Keyboard with TrackPoint (supports Fn keys)
 
+config HID_LENOVO_GO
+	tristate "HID Driver for Lenovo Legion Go Series Controllers"
+	depends on USB_HID
+	select LEDS_CLASS
+	select LEDS_CLASS_MULTICOLOR
+	help
+	Support for Lenovo Legion Go devices with detachable controllers.
+
+	Say Y here to include configuration interface support for the Lenovo Legion Go
+	and Legion Go 2 Handheld Console Controllers. Say M here to compile this
+	driver as a module. The module will be called hid-lenovo-go.
+
 config HID_LETSKETCH
 	tristate "Letsketch WP9620N tablets"
 	depends on USB_HID
diff --git a/drivers/hid/Makefile b/drivers/hid/Makefile
index 361a7daedeb8..11435bce4e47 100644
--- a/drivers/hid/Makefile
+++ b/drivers/hid/Makefile
@@ -76,6 +76,7 @@ obj-$(CONFIG_HID_KYE)		+= hid-kye.o
 obj-$(CONFIG_HID_KYSONA)	+= hid-kysona.o
 obj-$(CONFIG_HID_LCPOWER)	+= hid-lcpower.o
 obj-$(CONFIG_HID_LENOVO)	+= hid-lenovo.o
+obj-$(CONFIG_HID_LENOVO_GO)	+= hid-lenovo-go.o
 obj-$(CONFIG_HID_LETSKETCH)	+= hid-letsketch.o
 obj-$(CONFIG_HID_LOGITECH)	+= hid-logitech.o
 obj-$(CONFIG_HID_LOGITECH)	+= hid-lg-g15.o
diff --git a/drivers/hid/hid-ids.h b/drivers/hid/hid-ids.h
index c4589075a5ed..309e15580a38 100644
--- a/drivers/hid/hid-ids.h
+++ b/drivers/hid/hid-ids.h
@@ -841,7 +841,10 @@
 #define USB_DEVICE_ID_LENOVO_PIXART_USB_MOUSE_602E	0x602e
 #define USB_DEVICE_ID_LENOVO_PIXART_USB_MOUSE_6093	0x6093
 #define USB_DEVICE_ID_LENOVO_LEGION_GO_DUAL_DINPUT	0x6184
+#define USB_DEVICE_ID_LENOVO_LEGION_GO2_XINPUT		0x61eb
+#define USB_DEVICE_ID_LENOVO_LEGION_GO2_DINPUT		0x61ec
 #define USB_DEVICE_ID_LENOVO_LEGION_GO2_DUAL_DINPUT	0x61ed
+#define USB_DEVICE_ID_LENOVO_LEGION_GO2_FPS		0x61ee
 
 #define USB_VENDOR_ID_LETSKETCH		0x6161
 #define USB_DEVICE_ID_WP9620N		0x4d15
diff --git a/drivers/hid/hid-lenovo-go.c b/drivers/hid/hid-lenovo-go.c
new file mode 100644
index 000000000000..6380434b2d89
--- /dev/null
+++ b/drivers/hid/hid-lenovo-go.c
@@ -0,0 +1,734 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+/*
+ *  HID driver for Lenovo Legion Go series gamepads.
+ *
+ *  Copyright (c) 2025 Valve Corporation
+ */
+
+#define pr_fmt(fmt) KBUILD_MODNAME ": " fmt
+
+#include <linux/array_size.h>
+#include <linux/cleanup.h>
+#include <linux/completion.h>
+#include <linux/delay.h>
+#include <linux/dev_printk.h>
+#include <linux/device.h>
+#include <linux/device/devres.h>
+#include <linux/hid.h>
+#include <linux/jiffies.h>
+#include <linux/kstrtox.h>
+#include <linux/mutex.h>
+#include <linux/printk.h>
+#include <linux/sysfs.h>
+#include <linux/types.h>
+#include <linux/unaligned.h>
+#include <linux/usb.h>
+
+#include "hid-ids.h"
+
+#define GO_GP_INTF_IN		0x83
+#define GO_OUTPUT_REPORT_ID	0x05
+#define GO_GP_RESET_SUCCESS	0x01
+#define GO_PACKET_SIZE		64
+
+struct hid_go_cfg {
+	unsigned char *buf;
+	struct completion send_cmd_complete;
+	struct hid_device *hdev;
+	struct mutex cfg_mutex; /*ensure single synchronous output report*/
+	u32 gp_left_version_firmware;
+	u8 gp_left_version_gen;
+	u32 gp_left_version_hardware;
+	u32 gp_left_version_product;
+	u32 gp_left_version_protocol;
+	u32 gp_right_version_firmware;
+	u8 gp_right_version_gen;
+	u32 gp_right_version_hardware;
+	u32 gp_right_version_product;
+	u32 gp_right_version_protocol;
+	u32 mcu_version_firmware;
+	u8 mcu_version_gen;
+	u32 mcu_version_hardware;
+	u32 mcu_version_product;
+	u32 mcu_version_protocol;
+	u32 tx_dongle_version_firmware;
+	u8 tx_dongle_version_gen;
+	u32 tx_dongle_version_hardware;
+	u32 tx_dongle_version_product;
+	u32 tx_dongle_version_protocol;
+} drvdata;
+
+struct go_cfg_attr {
+	u8 index;
+};
+
+struct command_report {
+	u8 report_id;
+	u8 id;
+	u8 cmd;
+	u8 sub_cmd;
+	u8 device_type;
+	u8 data[59];
+} __packed;
+
+enum command_id {
+	MCU_CONFIG_DATA = 0x00,
+	OS_MODE_DATA = 0x06,
+	GAMEPAD_DATA = 0x3c,
+};
+
+enum mcu_command_index {
+	GET_VERSION_DATA = 0x02,
+	GET_FEATURE_STATUS,
+	SET_FEATURE_STATUS,
+	GET_MOTOR_CFG,
+	SET_MOTOR_CFG,
+	GET_DPI_CFG,
+	SET_DPI_CFG,
+	SET_TRIGGER_CFG = 0x0a,
+	SET_JOYSTICK_CFG = 0x0c,
+	SET_GYRO_CFG = 0x0e,
+	GET_RGB_CFG,
+	SET_RGB_CFG,
+	GET_DEVICE_STATUS = 0xa0,
+
+};
+
+enum dev_type {
+	UNSPECIFIED,
+	USB_MCU,
+	TX_DONGLE,
+	LEFT_CONTROLLER,
+	RIGHT_CONTROLLER,
+};
+
+enum version_data_index {
+	PRODUCT_VERSION = 0x02,
+	PROTOCOL_VERSION,
+	FIRMWARE_VERSION,
+	HARDWARE_VERSION,
+	HARDWARE_GENERATION,
+};
+
+static int hid_go_version_event(struct command_report *cmd_rep)
+{
+	switch (cmd_rep->sub_cmd) {
+	case PRODUCT_VERSION:
+		switch (cmd_rep->device_type) {
+		case USB_MCU:
+			drvdata.mcu_version_product =
+				get_unaligned_le32(cmd_rep->data);
+			return 0;
+		case TX_DONGLE:
+			drvdata.tx_dongle_version_product =
+				get_unaligned_le32(cmd_rep->data);
+			return 0;
+		case LEFT_CONTROLLER:
+			drvdata.gp_left_version_product =
+				get_unaligned_le32(cmd_rep->data);
+			return 0;
+		case RIGHT_CONTROLLER:
+			drvdata.gp_right_version_product =
+				get_unaligned_le32(cmd_rep->data);
+			return 0;
+		default:
+			return -EINVAL;
+		}
+	case PROTOCOL_VERSION:
+		switch (cmd_rep->device_type) {
+		case USB_MCU:
+			drvdata.mcu_version_protocol =
+				get_unaligned_le32(cmd_rep->data);
+			return 0;
+		case TX_DONGLE:
+			drvdata.tx_dongle_version_protocol =
+				get_unaligned_le32(cmd_rep->data);
+			return 0;
+		case LEFT_CONTROLLER:
+			drvdata.gp_left_version_protocol =
+				get_unaligned_le32(cmd_rep->data);
+			return 0;
+		case RIGHT_CONTROLLER:
+			drvdata.gp_right_version_protocol =
+				get_unaligned_le32(cmd_rep->data);
+			return 0;
+		default:
+			return -EINVAL;
+		}
+	case FIRMWARE_VERSION:
+		switch (cmd_rep->device_type) {
+		case USB_MCU:
+			drvdata.mcu_version_firmware =
+				get_unaligned_le32(cmd_rep->data);
+			return 0;
+		case TX_DONGLE:
+			drvdata.tx_dongle_version_firmware =
+				get_unaligned_le32(cmd_rep->data);
+			return 0;
+		case LEFT_CONTROLLER:
+			drvdata.gp_left_version_firmware =
+				get_unaligned_le32(cmd_rep->data);
+			return 0;
+		case RIGHT_CONTROLLER:
+			drvdata.gp_right_version_firmware =
+				get_unaligned_le32(cmd_rep->data);
+			return 0;
+		default:
+			return -EINVAL;
+		}
+	case HARDWARE_VERSION:
+		switch (cmd_rep->device_type) {
+		case USB_MCU:
+			drvdata.mcu_version_hardware =
+				get_unaligned_le32(cmd_rep->data);
+			return 0;
+		case TX_DONGLE:
+			drvdata.tx_dongle_version_hardware =
+				get_unaligned_le32(cmd_rep->data);
+			return 0;
+		case LEFT_CONTROLLER:
+			drvdata.gp_left_version_hardware =
+				get_unaligned_le32(cmd_rep->data);
+			return 0;
+		case RIGHT_CONTROLLER:
+			drvdata.gp_right_version_hardware =
+				get_unaligned_le32(cmd_rep->data);
+			return 0;
+		default:
+			return -EINVAL;
+		}
+	case HARDWARE_GENERATION:
+		switch (cmd_rep->device_type) {
+		case USB_MCU:
+			drvdata.mcu_version_gen = cmd_rep->data[0];
+			return 0;
+		case TX_DONGLE:
+			drvdata.tx_dongle_version_gen = cmd_rep->data[0];
+			return 0;
+		case LEFT_CONTROLLER:
+			drvdata.gp_left_version_gen = cmd_rep->data[0];
+			return 0;
+		case RIGHT_CONTROLLER:
+			drvdata.gp_right_version_gen = cmd_rep->data[0];
+			return 0;
+		default:
+			return -EINVAL;
+		}
+	default:
+		return -EINVAL;
+	}
+}
+
+static int get_endpoint_address(struct hid_device *hdev)
+{
+	struct usb_interface *intf = to_usb_interface(hdev->dev.parent);
+	struct usb_host_endpoint *ep;
+
+	if (!intf)
+		return -ENODEV;
+
+	ep = intf->cur_altsetting->endpoint;
+	if (!ep)
+		return -ENODEV;
+
+	return ep->desc.bEndpointAddress;
+}
+
+static int hid_go_raw_event(struct hid_device *hdev, struct hid_report *report,
+			    u8 *data, int size)
+{
+	struct command_report *cmd_rep;
+	int ep, ret;
+
+	if (size != GO_PACKET_SIZE)
+		goto passthrough;
+
+	ep = get_endpoint_address(hdev);
+	if (ep != GO_GP_INTF_IN)
+		goto passthrough;
+
+	cmd_rep = (struct command_report *)data;
+
+	switch (cmd_rep->id) {
+	case MCU_CONFIG_DATA:
+		switch (cmd_rep->cmd) {
+		case GET_VERSION_DATA:
+			ret = hid_go_version_event(cmd_rep);
+			break;
+		default:
+			ret = -EINVAL;
+			break;
+		};
+		break;
+	default:
+		goto passthrough;
+	};
+	dev_dbg(&hdev->dev, "Rx data as raw input report: [%*ph]\n",
+		GO_PACKET_SIZE, data);
+
+	complete(&drvdata.send_cmd_complete);
+	return ret;
+
+passthrough:
+	/* Forward other HID reports so they generate events */
+	hid_input_report(hdev, HID_INPUT_REPORT, data, size, 1);
+	return 0;
+}
+
+static int mcu_property_out(struct hid_device *hdev, u8 id, u8 command,
+			    u8 index, enum dev_type device, u8 *data, size_t len)
+{
+	u8 header[] = { GO_OUTPUT_REPORT_ID, id, command, index, device };
+	size_t header_size = ARRAY_SIZE(header);
+	size_t total_size = header_size + len;
+	int timeout = 50;
+	int ret;
+
+	guard(mutex)(&drvdata.cfg_mutex);
+	memcpy(drvdata.buf, header, header_size);
+	memcpy(drvdata.buf + header_size, data, len);
+	memset(drvdata.buf + total_size, 0, GO_PACKET_SIZE - total_size);
+
+	dev_dbg(&hdev->dev, "Send data as raw output report: [%*ph]\n",
+		GO_PACKET_SIZE, drvdata.buf);
+
+	ret = hid_hw_output_report(hdev, drvdata.buf, GO_PACKET_SIZE);
+	if (ret < 0)
+		return ret;
+
+	ret = ret == GO_PACKET_SIZE ? 0 : -EINVAL;
+	if (ret)
+		return ret;
+
+	ret = wait_for_completion_interruptible_timeout(&drvdata.send_cmd_complete,
+							msecs_to_jiffies(timeout));
+
+	if (ret == 0) /* timeout occurred */
+		ret = -EBUSY;
+	if (ret > 0) /* timeout/interrupt didn't occur */
+		ret = 0;
+
+	reinit_completion(&drvdata.send_cmd_complete);
+	return ret;
+}
+
+static ssize_t version_show(struct device *dev, struct device_attribute *attr,
+			    char *buf, enum version_data_index index,
+			    enum dev_type device_type)
+{
+	ssize_t count = 0;
+	int ret;
+
+	ret = mcu_property_out(drvdata.hdev, MCU_CONFIG_DATA, GET_VERSION_DATA,
+			       index, device_type, 0, 0);
+	if (ret)
+		return ret;
+
+	switch (index) {
+	case PRODUCT_VERSION:
+		switch (device_type) {
+		case USB_MCU:
+			count = sysfs_emit(buf, "%u\n",
+					   drvdata.mcu_version_product);
+			break;
+		case TX_DONGLE:
+			count = sysfs_emit(buf, "%u\n",
+					   drvdata.tx_dongle_version_product);
+			break;
+		case LEFT_CONTROLLER:
+			count = sysfs_emit(buf, "%u\n",
+					   drvdata.gp_left_version_product);
+			break;
+		case RIGHT_CONTROLLER:
+			count = sysfs_emit(buf, "%u\n",
+					   drvdata.gp_right_version_product);
+			break;
+		default:
+			return -EINVAL;
+		}
+		break;
+	case PROTOCOL_VERSION:
+		switch (device_type) {
+		case USB_MCU:
+			count = sysfs_emit(buf, "%u\n",
+					   drvdata.mcu_version_protocol);
+			break;
+		case TX_DONGLE:
+			count = sysfs_emit(buf, "%u\n",
+					   drvdata.tx_dongle_version_protocol);
+			break;
+		case LEFT_CONTROLLER:
+			count = sysfs_emit(buf, "%u\n",
+					   drvdata.gp_left_version_protocol);
+			break;
+		case RIGHT_CONTROLLER:
+			count = sysfs_emit(buf, "%u\n",
+					   drvdata.gp_right_version_protocol);
+			break;
+		default:
+			return -EINVAL;
+		}
+		break;
+	case FIRMWARE_VERSION:
+		switch (device_type) {
+		case USB_MCU:
+			count = sysfs_emit(buf, "%u\n",
+					   drvdata.mcu_version_firmware);
+			break;
+		case TX_DONGLE:
+			count = sysfs_emit(buf, "%u\n",
+					   drvdata.tx_dongle_version_firmware);
+			break;
+		case LEFT_CONTROLLER:
+			count = sysfs_emit(buf, "%u\n",
+					   drvdata.gp_left_version_firmware);
+			break;
+		case RIGHT_CONTROLLER:
+			count = sysfs_emit(buf, "%u\n",
+					   drvdata.gp_right_version_firmware);
+			break;
+		default:
+			return -EINVAL;
+		}
+		break;
+	case HARDWARE_VERSION:
+		switch (device_type) {
+		case USB_MCU:
+			count = sysfs_emit(buf, "%u\n",
+					   drvdata.mcu_version_hardware);
+			break;
+		case TX_DONGLE:
+			count = sysfs_emit(buf, "%u\n",
+					   drvdata.tx_dongle_version_hardware);
+			break;
+		case LEFT_CONTROLLER:
+			count = sysfs_emit(buf, "%u\n",
+					   drvdata.gp_left_version_hardware);
+			break;
+		case RIGHT_CONTROLLER:
+			count = sysfs_emit(buf, "%u\n",
+					   drvdata.gp_right_version_hardware);
+			break;
+		default:
+			return -EINVAL;
+		}
+		break;
+	case HARDWARE_GENERATION:
+		switch (device_type) {
+		case USB_MCU:
+			count = sysfs_emit(buf, "%u\n",
+					   drvdata.mcu_version_gen);
+			break;
+		case TX_DONGLE:
+			count = sysfs_emit(buf, "%u\n",
+					   drvdata.tx_dongle_version_gen);
+			break;
+		case LEFT_CONTROLLER:
+			count = sysfs_emit(buf, "%u\n",
+					   drvdata.gp_left_version_gen);
+			break;
+		case RIGHT_CONTROLLER:
+			count = sysfs_emit(buf, "%u\n",
+					   drvdata.gp_right_version_gen);
+			break;
+		default:
+			return -EINVAL;
+		}
+		break;
+	}
+
+	return count;
+}
+
+#define LEGO_DEVICE_ATTR_RW(_name, _attrname, _dtype, _rtype, _group)         \
+	static ssize_t _name##_store(struct device *dev,                      \
+				     struct device_attribute *attr,           \
+				     const char *buf, size_t count)           \
+	{                                                                     \
+		return _group##_store(dev, attr, buf, count, _name.index,     \
+				      _dtype);                                \
+	}                                                                     \
+	static ssize_t _name##_show(struct device *dev,                       \
+				    struct device_attribute *attr, char *buf) \
+	{                                                                     \
+		return _group##_show(dev, attr, buf, _name.index, _dtype);    \
+	}                                                                     \
+	static ssize_t _name##_##_rtype##_show(                               \
+		struct device *dev, struct device_attribute *attr, char *buf) \
+	{                                                                     \
+		return _group##_options(dev, attr, buf, _name.index);         \
+	}                                                                     \
+	static DEVICE_ATTR_RW_NAMED(_name, _attrname)
+
+#define LEGO_DEVICE_ATTR_WO(_name, _attrname, _dtype, _group)             \
+	static ssize_t _name##_store(struct device *dev,                  \
+				     struct device_attribute *attr,       \
+				     const char *buf, size_t count)       \
+	{                                                                 \
+		return _group##_store(dev, attr, buf, count, _name.index, \
+				      _dtype);                            \
+	}                                                                 \
+	static DEVICE_ATTR_WO_NAMED(_name, _attrname)
+
+#define LEGO_DEVICE_ATTR_RO(_name, _attrname, _dtype, _group)                 \
+	static ssize_t _name##_show(struct device *dev,                       \
+				    struct device_attribute *attr, char *buf) \
+	{                                                                     \
+		return _group##_show(dev, attr, buf, _name.index, _dtype);    \
+	}                                                                     \
+	static DEVICE_ATTR_RO_NAMED(_name, _attrname)
+
+/* Gamepad - MCU */
+struct go_cfg_attr version_product_mcu = { PRODUCT_VERSION };
+LEGO_DEVICE_ATTR_RO(version_product_mcu, "product_version", USB_MCU, version);
+
+struct go_cfg_attr version_protocol_mcu = { PROTOCOL_VERSION };
+LEGO_DEVICE_ATTR_RO(version_protocol_mcu, "protocol_version", USB_MCU, version);
+
+struct go_cfg_attr version_firmware_mcu = { FIRMWARE_VERSION };
+LEGO_DEVICE_ATTR_RO(version_firmware_mcu, "firmware_version", USB_MCU, version);
+
+struct go_cfg_attr version_hardware_mcu = { HARDWARE_VERSION };
+LEGO_DEVICE_ATTR_RO(version_hardware_mcu, "hardware_version", USB_MCU, version);
+
+struct go_cfg_attr version_gen_mcu = { HARDWARE_GENERATION };
+LEGO_DEVICE_ATTR_RO(version_gen_mcu, "hardware_generation", USB_MCU, version);
+
+static struct attribute *mcu_attrs[] = {
+	&dev_attr_version_firmware_mcu.attr,
+	&dev_attr_version_gen_mcu.attr,
+	&dev_attr_version_hardware_mcu.attr,
+	&dev_attr_version_product_mcu.attr,
+	&dev_attr_version_protocol_mcu.attr,
+	NULL,
+};
+
+static const struct attribute_group mcu_attr_group = {
+	.attrs = mcu_attrs,
+};
+
+/* Gamepad - TX Dongle */
+struct go_cfg_attr version_product_tx_dongle = { PRODUCT_VERSION };
+LEGO_DEVICE_ATTR_RO(version_product_tx_dongle, "product_version", TX_DONGLE, version);
+
+struct go_cfg_attr version_protocol_tx_dongle = { PROTOCOL_VERSION };
+LEGO_DEVICE_ATTR_RO(version_protocol_tx_dongle, "protocol_version", TX_DONGLE, version);
+
+struct go_cfg_attr version_firmware_tx_dongle = { FIRMWARE_VERSION };
+LEGO_DEVICE_ATTR_RO(version_firmware_tx_dongle, "firmware_version", TX_DONGLE, version);
+
+struct go_cfg_attr version_hardware_tx_dongle = { HARDWARE_VERSION };
+LEGO_DEVICE_ATTR_RO(version_hardware_tx_dongle, "hardware_version", TX_DONGLE, version);
+
+struct go_cfg_attr version_gen_tx_dongle = { HARDWARE_GENERATION };
+LEGO_DEVICE_ATTR_RO(version_gen_tx_dongle, "hardware_generation", TX_DONGLE, version);
+
+static struct attribute *tx_dongle_attrs[] = {
+	&dev_attr_version_hardware_tx_dongle.attr,
+	&dev_attr_version_firmware_tx_dongle.attr,
+	&dev_attr_version_gen_tx_dongle.attr,
+	&dev_attr_version_product_tx_dongle.attr,
+	&dev_attr_version_protocol_tx_dongle.attr,
+	NULL,
+};
+
+static const struct attribute_group tx_dongle_attr_group = {
+	.name = "tx_dongle",
+	.attrs = tx_dongle_attrs,
+};
+
+/* Gamepad - Left */
+struct go_cfg_attr version_product_left = { PRODUCT_VERSION };
+LEGO_DEVICE_ATTR_RO(version_product_left, "product_version", LEFT_CONTROLLER, version);
+
+struct go_cfg_attr version_protocol_left = { PROTOCOL_VERSION };
+LEGO_DEVICE_ATTR_RO(version_protocol_left, "protocol_version", LEFT_CONTROLLER, version);
+
+struct go_cfg_attr version_firmware_left = { FIRMWARE_VERSION };
+LEGO_DEVICE_ATTR_RO(version_firmware_left, "firmware_version", LEFT_CONTROLLER, version);
+
+struct go_cfg_attr version_hardware_left = { HARDWARE_VERSION };
+LEGO_DEVICE_ATTR_RO(version_hardware_left, "hardware_version", LEFT_CONTROLLER, version);
+
+struct go_cfg_attr version_gen_left = { HARDWARE_GENERATION };
+LEGO_DEVICE_ATTR_RO(version_gen_left, "hardware_generation", LEFT_CONTROLLER, version);
+
+static struct attribute *left_gamepad_attrs[] = {
+	&dev_attr_version_hardware_left.attr,
+	&dev_attr_version_firmware_left.attr,
+	&dev_attr_version_gen_left.attr,
+	&dev_attr_version_product_left.attr,
+	&dev_attr_version_protocol_left.attr,
+	NULL,
+};
+
+static const struct attribute_group left_gamepad_attr_group = {
+	.name = "left_handle",
+	.attrs = left_gamepad_attrs,
+};
+
+/* Gamepad - Right */
+struct go_cfg_attr version_product_right = { PRODUCT_VERSION };
+LEGO_DEVICE_ATTR_RO(version_product_right, "product_version", RIGHT_CONTROLLER, version);
+
+struct go_cfg_attr version_protocol_right = { PROTOCOL_VERSION };
+LEGO_DEVICE_ATTR_RO(version_protocol_right, "protocol_version", RIGHT_CONTROLLER, version);
+
+struct go_cfg_attr version_firmware_right = { FIRMWARE_VERSION };
+LEGO_DEVICE_ATTR_RO(version_firmware_right, "firmware_version", RIGHT_CONTROLLER, version);
+
+struct go_cfg_attr version_hardware_right = { HARDWARE_VERSION };
+LEGO_DEVICE_ATTR_RO(version_hardware_right, "hardware_version", RIGHT_CONTROLLER, version);
+
+struct go_cfg_attr version_gen_right = { HARDWARE_GENERATION };
+LEGO_DEVICE_ATTR_RO(version_gen_right, "hardware_generation", RIGHT_CONTROLLER, version);
+
+static struct attribute *right_gamepad_attrs[] = {
+	&dev_attr_version_hardware_right.attr,
+	&dev_attr_version_firmware_right.attr,
+	&dev_attr_version_gen_right.attr,
+	&dev_attr_version_product_right.attr,
+	&dev_attr_version_protocol_right.attr,
+	NULL,
+};
+
+static const struct attribute_group right_gamepad_attr_group = {
+	.name = "right_handle",
+	.attrs = right_gamepad_attrs,
+};
+
+/* Touchpad */
+static struct attribute *touchpad_attrs[] = {
+	NULL,
+};
+
+static const struct attribute_group touchpad_attr_group = {
+	.name = "touchpad",
+	.attrs = touchpad_attrs,
+};
+
+static const struct attribute_group *top_level_attr_groups[] = {
+	&mcu_attr_group,	  &tx_dongle_attr_group,
+	&left_gamepad_attr_group, &right_gamepad_attr_group,
+	&touchpad_attr_group,	  NULL,
+};
+
+static int hid_go_cfg_probe(struct hid_device *hdev,
+			    const struct hid_device_id *_id)
+{
+	unsigned char *buf;
+	int ret;
+
+	buf = devm_kzalloc(&hdev->dev, GO_PACKET_SIZE, GFP_KERNEL);
+	if (!buf)
+		return -ENOMEM;
+
+	hid_set_drvdata(hdev, &drvdata);
+	drvdata.buf = buf;
+	drvdata.hdev = hdev;
+	mutex_init(&drvdata.cfg_mutex);
+
+	ret = sysfs_create_groups(&hdev->dev.kobj, top_level_attr_groups);
+	if (ret) {
+		dev_err_probe(&hdev->dev, ret,
+			      "Failed to create gamepad configuration attributes\n");
+		return ret;
+	}
+
+	init_completion(&drvdata.send_cmd_complete);
+
+	return 0;
+}
+
+static void hid_go_cfg_remove(struct hid_device *hdev)
+{
+	guard(mutex)(&drvdata.cfg_mutex);
+	sysfs_remove_groups(&hdev->dev.kobj, top_level_attr_groups);
+	hid_hw_close(hdev);
+	hid_hw_stop(hdev);
+	hid_set_drvdata(hdev, NULL);
+}
+
+static int hid_go_probe(struct hid_device *hdev, const struct hid_device_id *id)
+{
+	int ret, ep;
+
+	hdev->quirks |= HID_QUIRK_INPUT_PER_APP | HID_QUIRK_MULTI_INPUT;
+
+	ret = hid_parse(hdev);
+	if (ret) {
+		hid_err(hdev, "Parse failed\n");
+		return ret;
+	}
+
+	ret = hid_hw_start(hdev, HID_CONNECT_DEFAULT);
+	if (ret) {
+		hid_err(hdev, "Failed to start HID device\n");
+		return ret;
+	}
+
+	ret = hid_hw_open(hdev);
+	if (ret) {
+		hid_err(hdev, "Failed to open HID device\n");
+		hid_hw_stop(hdev);
+		return ret;
+	}
+
+	ep = get_endpoint_address(hdev);
+	if (ep != GO_GP_INTF_IN) {
+		dev_dbg(&hdev->dev, "Started interface %x as generic HID device\n", ep);
+		return 0;
+	}
+
+	ret = hid_go_cfg_probe(hdev, id);
+	if (ret)
+		dev_err_probe(&hdev->dev, ret, "Failed to start configuration interface\n");
+
+	dev_dbg(&hdev->dev, "Started Legion Go HID Device: %x\n", ep);
+
+	return ret;
+}
+
+static void hid_go_remove(struct hid_device *hdev)
+{
+	int ep = get_endpoint_address(hdev);
+
+	if (ep <= 0)
+		return;
+
+	switch (ep) {
+	case GO_GP_INTF_IN:
+		hid_go_cfg_remove(hdev);
+		break;
+	default:
+		hid_hw_close(hdev);
+		hid_hw_stop(hdev);
+		break;
+	}
+}
+
+static const struct hid_device_id hid_go_devices[] = {
+	{ HID_USB_DEVICE(USB_VENDOR_ID_LENOVO,
+			 USB_DEVICE_ID_LENOVO_LEGION_GO2_XINPUT) },
+	{ HID_USB_DEVICE(USB_VENDOR_ID_LENOVO,
+			 USB_DEVICE_ID_LENOVO_LEGION_GO2_DINPUT) },
+	{ HID_USB_DEVICE(USB_VENDOR_ID_LENOVO,
+			 USB_DEVICE_ID_LENOVO_LEGION_GO2_DUAL_DINPUT) },
+	{ HID_USB_DEVICE(USB_VENDOR_ID_LENOVO,
+			 USB_DEVICE_ID_LENOVO_LEGION_GO2_FPS) },
+	{}
+};
+MODULE_DEVICE_TABLE(hid, hid_go_devices);
+
+static struct hid_driver hid_lenovo_go = {
+	.name = "hid-lenovo-go",
+	.id_table = hid_go_devices,
+	.probe = hid_go_probe,
+	.remove = hid_go_remove,
+	.raw_event = hid_go_raw_event,
+};
+module_hid_driver(hid_lenovo_go);
+
+MODULE_AUTHOR("Derek J. Clark");
+MODULE_DESCRIPTION("HID Driver for Lenovo Legion Go Series Gamepads.");
+MODULE_LICENSE("GPL");
-- 
2.51.2


