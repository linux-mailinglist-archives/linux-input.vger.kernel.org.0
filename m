Return-Path: <linux-input+bounces-16228-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B557C71DB7
	for <lists+linux-input@lfdr.de>; Thu, 20 Nov 2025 03:31:33 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id BD28C4E2DEB
	for <lists+linux-input@lfdr.de>; Thu, 20 Nov 2025 02:30:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6BC1CD531;
	Thu, 20 Nov 2025 02:30:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=endrift.com header.i=@endrift.com header.b="rHSp/ppY"
X-Original-To: linux-input@vger.kernel.org
Received: from endrift.com (endrift.com [173.255.198.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A9CEE13A3ED
	for <linux-input@vger.kernel.org>; Thu, 20 Nov 2025 02:30:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=173.255.198.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763605846; cv=none; b=hs0jyBOO8OGOwXHwPuADw9SrZ1ONUxnLcoaV3WoyFyEDaw/UEZBGzySaY0vKV/TBf8MKnVVWC0klrZFEreFuChhuugzlQYEKWnB/hYysQyjeCUUgQtqviiEAZ3E6XPbyJtzKQ40EQ8Ns87XENUjspab7i+Z1DvewESqel2sFXwk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763605846; c=relaxed/simple;
	bh=KDKxmX4Uu2BNIldUNlVw2dxe1GFLPzi65qVFRnONctY=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=sBesB79z+RwYEYJL0JYKoQg72esvY4oHtyu8y8htvjFF/CwdnwC9OQ40tRonOpVXYLZIo5FiiFF80IGECHRx4h4sPjrawRESkVFER7t+4OrqDasnhpw/hoeTi3jujU91vVJshO/QTZJ9PteA3/nnJdHS0a56X7w5YXNh85ehoes=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=endrift.com; spf=pass smtp.mailfrom=endrift.com; dkim=pass (2048-bit key) header.d=endrift.com header.i=@endrift.com header.b=rHSp/ppY; arc=none smtp.client-ip=173.255.198.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=endrift.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=endrift.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=endrift.com; s=2020;
	t=1763605531; bh=KDKxmX4Uu2BNIldUNlVw2dxe1GFLPzi65qVFRnONctY=;
	h=From:To:Cc:Subject:Date:From;
	b=rHSp/ppYePEipIHKOeBEo3yIK4QN90K+n0Qji52TsZWoUyBpOLUqiQEdajYs69Uip
	 wB89QX22U7PINBrQ5uRRLHMC4wH2tCeA0+w6CtHYqFYkJDerAyRm1+U4ROsQIHTx3N
	 CJImE7axPyAO3gpr+9PRVTs6r5Zg1XAJJYHxCPyetzIEf+FK7v4xkb/O6DzjKibze/
	 vRyGbI0eK9kIYuO1nr6USoyFgTgUKqyOPySU1jybhszEwwfAhU0CZSntOLD1v4HD8r
	 8cAJb1MUENDmrI3QclUx+zFId9X7Ovpgt7DxlSpCrlCU7lIRDgm/oXxAMHuxPVRS+z
	 jaROsY3T2xt9A==
Received: from microtis.vulpes.eutheria.net (71-212-14-89.tukw.qwest.net [71.212.14.89])
	by endrift.com (Postfix) with ESMTPSA id 7CA55A053;
	Wed, 19 Nov 2025 18:25:30 -0800 (PST)
From: Vicki Pfau <vi@endrift.com>
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Jiri Kosina <jikos@kernel.org>,
	Benjamin Tissoires <bentiss@kernel.org>,
	linux-input@vger.kernel.org
Cc: Luiz Augusto von Dentz <luiz.dentz@gmail.com>,
	Bastien Nocera <hadess@hadess.net>,
	Vicki Pfau <vi@endrift.com>
Subject: [PATCH] HID: switch2: Add preliminary Switch 2 controller driver
Date: Wed, 19 Nov 2025 18:24:57 -0800
Message-ID: <20251120022457.469342-1-vi@endrift.com>
X-Mailer: git-send-email 2.51.0
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This adds a new driver for the Switch 2 controllers. The Switch 2 uses an
unusual split-interface design such that input and rumble occur on the main
HID interface, but all other communication occurs over a "configuration"
interface. This is the case on both USB and Bluetooth, so this new driver
uses a split-driver design with the HID interface being the "main" driver
and the configuration interface is a secondary driver that looks up to the
configuration interface, sharing resources on a shared struct.

Due to using a non-standard pairing interface as well as Bluetooth
communications being extremely limited in the kernel, a custom interface
between userspace and the kernel will need to be design, along with bringup
in BlueZ. That is beyond the scope of this initial patch, which only
contains the generic HID and USB configuration interface drivers.

This initial work supports general input for the Joy-Con 2, Pro Controller
2, and GameCube NSO controllers, as well as basic rumble support. IMU
support is not yet present.

Signed-off-by: Vicki Pfau <vi@endrift.com>
---
 MAINTAINERS                          |   7 +
 drivers/hid/Kconfig                  |  18 +
 drivers/hid/Makefile                 |   1 +
 drivers/hid/hid-ids.h                |   4 +
 drivers/hid/hid-switch2.c            | 971 +++++++++++++++++++++++++++
 drivers/hid/hid-switch2.h            | 242 +++++++
 drivers/input/joystick/Kconfig       |   8 +
 drivers/input/joystick/Makefile      |   1 +
 drivers/input/joystick/switch2-usb.c | 355 ++++++++++
 9 files changed, 1607 insertions(+)
 create mode 100644 drivers/hid/hid-switch2.c
 create mode 100644 drivers/hid/hid-switch2.h
 create mode 100644 drivers/input/joystick/switch2-usb.c

diff --git a/MAINTAINERS b/MAINTAINERS
index e64b94e6b5a97..a5bacbfc86b5a 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -18290,6 +18290,13 @@ L:	linux-input@vger.kernel.org
 S:	Maintained
 F:	drivers/hid/hid-nintendo*
 
+NINTENDO SWITCH 2 CONTROLLER DRIVER
+M:	Vicki Pfau <vi@endrift.com>
+L:	linux-input@vger.kernel.org
+S:	Maintained
+F:	drivers/hid/hid-switch2*
+F:	drivers/input/joystick/switch2-usb.c
+
 NIOS2 ARCHITECTURE
 M:	Dinh Nguyen <dinguyen@kernel.org>
 S:	Maintained
diff --git a/drivers/hid/Kconfig b/drivers/hid/Kconfig
index 04420a713be08..7486212ff5d28 100644
--- a/drivers/hid/Kconfig
+++ b/drivers/hid/Kconfig
@@ -1141,6 +1141,24 @@ config HID_SUNPLUS
 	help
 	Support for Sunplus wireless desktop.
 
+config HID_SWITCH2
+	tristate "Nintendo Switch 2 controller support"
+	depends on HID
+	select USB_HID
+	help
+	Adds support for the Nintendo Switch 2 Controllers.
+
+	To compile this driver as a module, choose M here: the
+	module will be called hid-switch2.
+
+config SWITCH2_FF
+	bool "Nintendo Switch 2 force feedback support"
+	depends on HID_SWITCH2
+	select INPUT_FF_MEMLESS
+	help
+	Say Y here if you want to enable force feedback support for Nintendo
+	Switch 2 game controllers.
+
 config HID_RMI
 	tristate "Synaptics RMI4 device support"
 	select RMI4_CORE
diff --git a/drivers/hid/Makefile b/drivers/hid/Makefile
index 361a7daedeb85..74a3f82ed82f1 100644
--- a/drivers/hid/Makefile
+++ b/drivers/hid/Makefile
@@ -131,6 +131,7 @@ obj-$(CONFIG_HID_SPEEDLINK)	+= hid-speedlink.o
 obj-$(CONFIG_HID_STEAM)		+= hid-steam.o
 obj-$(CONFIG_HID_STEELSERIES)	+= hid-steelseries.o
 obj-$(CONFIG_HID_SUNPLUS)	+= hid-sunplus.o
+obj-$(CONFIG_HID_SWITCH2)	+= hid-switch2.o
 obj-$(CONFIG_HID_GREENASIA)	+= hid-gaff.o
 obj-$(CONFIG_HID_THRUSTMASTER)	+= hid-tmff.o hid-thrustmaster.o
 obj-$(CONFIG_HID_TIVO)		+= hid-tivo.o
diff --git a/drivers/hid/hid-ids.h b/drivers/hid/hid-ids.h
index c4589075a5ed6..eef152f7b55f7 100644
--- a/drivers/hid/hid-ids.h
+++ b/drivers/hid/hid-ids.h
@@ -1052,6 +1052,10 @@
 #define USB_DEVICE_ID_NINTENDO_SNESCON	0x2017
 #define USB_DEVICE_ID_NINTENDO_GENCON	0x201e
 #define USB_DEVICE_ID_NINTENDO_N64CON	0x2019
+#define USB_DEVICE_ID_NINTENDO_NS2_JOYCONR	0x2066
+#define USB_DEVICE_ID_NINTENDO_NS2_JOYCONL	0x2067
+#define USB_DEVICE_ID_NINTENDO_NS2_PROCON	0x2069
+#define USB_DEVICE_ID_NINTENDO_NS2_GCCON	0x2073
 
 #define USB_VENDOR_ID_NOVATEK		0x0603
 #define USB_DEVICE_ID_NOVATEK_PCT	0x0600
diff --git a/drivers/hid/hid-switch2.c b/drivers/hid/hid-switch2.c
new file mode 100644
index 0000000000000..a06d181e76cc7
--- /dev/null
+++ b/drivers/hid/hid-switch2.c
@@ -0,0 +1,971 @@
+// SPDX-License-Identifier: GPL-2.0+
+/*
+ * HID driver for Nintendo Switch controllers
+ *
+ * Copyright (c) 2025 Valve Software
+ *
+ * This driver is based on the following work:
+ *   https://gist.github.com/shinyquagsire23/66f006b46c56216acbaac6c1e2279b64
+ *   https://github.com/ndeadly/switch2_controller_research
+ *   hid-nintendo driver
+ */
+
+#include "hid-switch2.h"
+#include <linux/device.h>
+#include <linux/hid.h>
+#include <linux/idr.h>
+#include <linux/jiffies.h>
+#include <linux/kernel.h>
+#include <linux/module.h>
+#include <linux/usb.h>
+#include "usbhid/usbhid.h"
+
+#define NS2_BTNR_B	BIT(0)
+#define NS2_BTNR_A	BIT(1)
+#define NS2_BTNR_Y	BIT(2)
+#define NS2_BTNR_X	BIT(3)
+#define NS2_BTNR_R	BIT(4)
+#define NS2_BTNR_ZR	BIT(5)
+#define NS2_BTNR_PLUS	BIT(6)
+#define NS2_BTNR_RS	BIT(7)
+
+#define NS2_BTNL_DOWN	BIT(0)
+#define NS2_BTNL_RIGHT	BIT(1)
+#define NS2_BTNL_LEFT	BIT(2)
+#define NS2_BTNL_UP	BIT(3)
+#define NS2_BTNL_L	BIT(4)
+#define NS2_BTNL_ZL	BIT(5)
+#define NS2_BTNL_MINUS	BIT(6)
+#define NS2_BTNL_LS	BIT(7)
+
+#define NS2_BTN3_C	BIT(4)
+#define NS2_BTN3_SR	BIT(6)
+#define NS2_BTN3_SL	BIT(7)
+
+#define NS2_BTN_JCR_HOME	BIT(0)
+#define NS2_BTN_JCR_GR		BIT(2)
+#define NS2_BTN_JCR_C		NS2_BTN3_C
+#define NS2_BTN_JCR_SR		NS2_BTN3_SR
+#define NS2_BTN_JCR_SL		NS2_BTN3_SL
+
+#define NS2_BTN_JCL_CAPTURE	BIT(0)
+#define NS2_BTN_JCL_GL		BIT(2)
+#define NS2_BTN_JCL_SR		NS2_BTN3_SR
+#define NS2_BTN_JCL_SL		NS2_BTN3_SL
+
+#define NS2_BTN_PRO_HOME	BIT(0)
+#define NS2_BTN_PRO_CAPTURE	BIT(1)
+#define NS2_BTN_PRO_GR		BIT(2)
+#define NS2_BTN_PRO_GL		BIT(3)
+#define NS2_BTN_PRO_C		NS2_BTN3_C
+
+#define NS2_BTN_GC_HOME		BIT(0)
+#define NS2_BTN_GC_CAPTURE	BIT(1)
+#define NS2_BTN_GC_C		NS2_BTN3_C
+
+#define NS2_TRIGGER_RANGE	4095
+#define NS2_AXIS_MIN		-32768
+#define NS2_AXIS_MAX		32767
+
+#define NS2_MAX_PLAYER_ID	8
+
+enum gc_rumble {
+	GC_RUMBLE_OFF = 0,
+	GC_RUMBLE_ON = 1,
+	GC_RUMBLE_STOP = 2,
+};
+
+/*
+ * The highest rumble level for "HD Rumble" is strong enough to potentially damage the controller,
+ * and also leaves your hands feeling like melted jelly, so we set a semi-abitrary scaling factor
+ * to artificially limit the maximum for safety and comfort. It is currently unknown if the Switch
+ * 2 itself does something similar, but it's quite likely.
+ *
+ * This value must be between 0 and 1024, otherwise the math below will overflow.
+ */
+#define RUMBLE_MAX 450u
+
+/*
+ * Semi-arbitrary values used to simulate the "rumble" sensation of an eccentric rotating
+ * mass type haptic motor on the Switch 2 controllers' linear resonant actuator type haptics.
+ *
+ * The units used are unknown, but the values must be between 0 and 1023.
+ */
+#define RUMBLE_HI_FREQ 0x187
+#define RUMBLE_LO_FREQ 0x112
+
+static DEFINE_MUTEX(switch2_controllers_lock);
+static LIST_HEAD(switch2_controllers);
+
+struct switch2_ctlr_button_mapping {
+	uint32_t code;
+	int byte;
+	uint32_t bit;
+};
+
+static const struct switch2_ctlr_button_mapping left_joycon_button_mappings[] = {
+	{ BTN_TL,	0, NS2_BTNL_L,		},
+	{ BTN_TL2,	0, NS2_BTNL_ZL,		},
+	{ BTN_SELECT,	0, NS2_BTNL_MINUS,	},
+	{ BTN_THUMBL,	0, NS2_BTNL_LS,		},
+	{ BTN_GRIPL,	1, NS2_BTN_JCL_GL,	},
+	{ KEY_RECORD,	1, NS2_BTN_JCL_CAPTURE,	},
+	{ /* sentinel */ },
+};
+
+static const struct switch2_ctlr_button_mapping right_joycon_button_mappings[] = {
+	{ BTN_SOUTH,	0, NS2_BTNR_A,		},
+	{ BTN_EAST,	0, NS2_BTNR_B,		},
+	{ BTN_NORTH,	0, NS2_BTNR_X,		},
+	{ BTN_WEST,	0, NS2_BTNR_Y,		},
+	{ BTN_TR,	0, NS2_BTNR_R,		},
+	{ BTN_TR2,	0, NS2_BTNR_ZR,		},
+	{ BTN_START,	0, NS2_BTNR_PLUS,	},
+	{ BTN_THUMBR,	0, NS2_BTNR_RS,		},
+	{ BTN_C,	1, NS2_BTN_JCR_C,	},
+	{ BTN_GRIPR,	1, NS2_BTN_JCR_GR,	},
+	{ BTN_MODE,	1, NS2_BTN_JCR_HOME,	},
+	{ /* sentinel */ },
+};
+
+static const struct switch2_ctlr_button_mapping procon_mappings[] = {
+	{ BTN_SOUTH,	0, NS2_BTNR_A,		},
+	{ BTN_EAST,	0, NS2_BTNR_B,		},
+	{ BTN_NORTH,	0, NS2_BTNR_X,		},
+	{ BTN_WEST,	0, NS2_BTNR_Y,		},
+	{ BTN_TL,	1, NS2_BTNL_L,		},
+	{ BTN_TR,	0, NS2_BTNR_R,		},
+	{ BTN_TL2,	1, NS2_BTNL_ZL,		},
+	{ BTN_TR2,	0, NS2_BTNR_ZR,		},
+	{ BTN_SELECT,	1, NS2_BTNL_MINUS,	},
+	{ BTN_START,	0, NS2_BTNR_PLUS,	},
+	{ BTN_THUMBL,	1, NS2_BTNL_LS,		},
+	{ BTN_THUMBR,	0, NS2_BTNR_RS,		},
+	{ BTN_MODE,	2, NS2_BTN_PRO_HOME	},
+	{ KEY_RECORD,	2, NS2_BTN_PRO_CAPTURE	},
+	{ BTN_GRIPR,	2, NS2_BTN_PRO_GR	},
+	{ BTN_GRIPL,	2, NS2_BTN_PRO_GL	},
+	{ BTN_C,	2, NS2_BTN_PRO_C	},
+	{ /* sentinel */ },
+};
+
+static const struct switch2_ctlr_button_mapping gccon_mappings[] = {
+	{ BTN_SOUTH,	0, NS2_BTNR_A,		},
+	{ BTN_EAST,	0, NS2_BTNR_B,		},
+	{ BTN_NORTH,	0, NS2_BTNR_X,		},
+	{ BTN_WEST,	0, NS2_BTNR_Y,		},
+	{ BTN_TL,	1, NS2_BTNL_L,		},
+	{ BTN_TR,	0, NS2_BTNR_R,		},
+	{ BTN_TL2,	1, NS2_BTNL_ZL,		},
+	{ BTN_TR2,	0, NS2_BTNR_ZR,		},
+	{ BTN_SELECT,	1, NS2_BTNL_MINUS,	},
+	{ BTN_START,	0, NS2_BTNR_PLUS,	},
+	{ BTN_MODE,	2, NS2_BTN_GC_HOME	},
+	{ KEY_RECORD,	2, NS2_BTN_GC_CAPTURE	},
+	{ BTN_C,	2, NS2_BTN_GC_C		},
+	{ /* sentinel */ },
+};
+
+static const uint8_t switch2_init_cmd_data[] = {
+	/*
+	 * The last 6 bytes of this packet are the MAC address of
+	 * the console, but we don't need that for USB
+	 */
+	0x01, 0x00, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF
+};
+
+static const uint8_t switch2_one_data[] = { 0x01, 0x00, 0x00, 0x00 };
+#ifdef CONFIG_SWITCH2_FF
+static const uint8_t switch2_zero_data[] = { 0x00, 0x00, 0x00, 0x00 };
+#endif
+
+static const uint8_t switch2_player_pattern[] = { 0x1, 0x3, 0x7, 0xf, 0x9, 0x5, 0xd, 0x6 };
+
+static const uint8_t switch2_feature_mask[] = {
+	NS2_FEATURE_BUTTONS | NS2_FEATURE_ANALOG | NS2_FEATURE_IMU | NS2_FEATURE_RUMBLE,
+	0x00, 0x00, 0x00
+};
+
+static DEFINE_IDA(switch2_player_id_allocator);
+
+#ifdef CONFIG_SWITCH2_FF
+static void switch2_encode_rumble(struct switch2_hd_rumble *rumble, uint8_t buffer[5])
+{
+	buffer[0] = rumble->hi_freq;
+	buffer[1] = (rumble->hi_freq >> 8) | (rumble->hi_amp << 2);
+	buffer[2] = (rumble->hi_amp >> 6) | (rumble->lo_freq << 4);
+	buffer[3] = (rumble->lo_freq >> 4) | (rumble->lo_amp << 6);
+	buffer[4] = rumble->lo_amp >> 2;
+}
+
+static int switch2_play_effect(struct input_dev *dev, void *data, struct ff_effect *effect)
+{
+	struct switch2_controller *ns2 = input_get_drvdata(dev);
+
+	if (effect->type != FF_RUMBLE)
+		return 0;
+
+	guard(spinlock_irqsave)(&ns2->rumble_lock);
+	if (ns2->ctlr_type == NS2_CTLR_TYPE_GC) {
+		ns2->rumble.sd.amplitude = max(effect->u.rumble.strong_magnitude,
+			effect->u.rumble.weak_magnitude >> 1);
+	} else {
+		ns2->rumble.hd.hi_amp = effect->u.rumble.weak_magnitude * RUMBLE_MAX >> 16;
+		ns2->rumble.hd.lo_amp = effect->u.rumble.strong_magnitude * RUMBLE_MAX >> 16;
+	}
+
+	schedule_delayed_work(&ns2->rumble_work, 0);
+
+	return 0;
+}
+
+static void switch2_rumble_work(struct work_struct *work)
+{
+	struct switch2_controller *ns2 = container_of(to_delayed_work(work),
+						      struct switch2_controller, rumble_work);
+	unsigned long current_ms = jiffies_to_msecs(get_jiffies_64());
+	uint8_t *buffer = kzalloc(64, GFP_KERNEL);
+	unsigned long flags;
+	bool active;
+	int ret;
+
+	spin_lock_irqsave(&ns2->rumble_lock, flags);
+	buffer[0x1] = 0x50 | ns2->rumble_seq;
+	if (ns2->ctlr_type == NS2_CTLR_TYPE_GC) {
+		buffer[0] = 3;
+		if (ns2->rumble.sd.amplitude == 0) {
+			buffer[2] = GC_RUMBLE_STOP;
+			ns2->rumble.sd.error = 0;
+			active = false;
+		} else {
+			if (ns2->rumble.sd.error < ns2->rumble.sd.amplitude) {
+				buffer[2] = GC_RUMBLE_ON;
+				ns2->rumble.sd.error += U16_MAX - ns2->rumble.sd.amplitude;
+			} else {
+				buffer[2] = GC_RUMBLE_OFF;
+				ns2->rumble.sd.error -= ns2->rumble.sd.amplitude;
+			}
+			active = true;
+		}
+	} else {
+		buffer[0] = 1;
+		switch2_encode_rumble(&ns2->rumble.hd, &buffer[0x2]);
+		active = ns2->rumble.hd.hi_amp || ns2->rumble.hd.lo_amp;
+		if (ns2->ctlr_type == NS2_CTLR_TYPE_PRO) {
+			/*
+			 * The Pro Controller contains separate LRAs on each
+			 * side that can be controlled individually.
+			 */
+			buffer[0] = 2;
+			buffer[0x11] = 0x50 | ns2->rumble_seq;
+			switch2_encode_rumble(&ns2->rumble.hd, &buffer[0x12]);
+		}
+	}
+	ns2->rumble_seq = (ns2->rumble_seq + 1) & 0xF;
+
+	if (active) {
+		unsigned long interval = msecs_to_jiffies(4);
+
+		if (!ns2->last_rumble_work)
+			ns2->last_rumble_work = current_ms;
+		else
+			ns2->last_rumble_work += interval;
+		schedule_delayed_work(&ns2->rumble_work,
+			ns2->last_rumble_work + interval - current_ms);
+	} else {
+		ns2->last_rumble_work = 0;
+	}
+	spin_unlock_irqrestore(&ns2->rumble_lock, flags);
+
+	if (!ns2->hdev) {
+		cancel_delayed_work(&ns2->rumble_work);
+		ret = -ENODEV;
+	} else {
+		ret = hid_hw_output_report(ns2->hdev, buffer, 64);
+	}
+
+	kfree(buffer);
+	if (ret < 0)
+		hid_dbg(ns2->hdev, "Failed to send output report ret=%d\n", ret);
+}
+#endif
+
+struct switch2_controller *switch2_get_controller(const char *phys)
+{
+	struct switch2_controller *ns2;
+
+	guard(mutex)(&switch2_controllers_lock);
+	list_for_each_entry(ns2, &switch2_controllers, entry) {
+		if (strncmp(ns2->phys, phys, sizeof(ns2->phys)) == 0)
+			return ns2;
+	}
+	ns2 = kzalloc(sizeof(*ns2), GFP_KERNEL);
+	if (!ns2)
+		return ERR_PTR(-ENOMEM);
+
+	mutex_init(&ns2->lock);
+	INIT_LIST_HEAD(&ns2->entry);
+	list_add(&ns2->entry, &switch2_controllers);
+	strscpy(ns2->phys, phys, sizeof(ns2->phys));
+	return ns2;
+}
+EXPORT_SYMBOL_GPL(switch2_get_controller);
+
+void switch2_controller_put(struct switch2_controller *ns2)
+{
+	mutex_lock(&ns2->lock);
+	if (ns2->input) {
+		input_unregister_device(ns2->input);
+		ns2->input = NULL;
+	}
+	ns2->init_step = 0;
+	if (ns2->hdev || ns2->cfg) {
+		mutex_unlock(&ns2->lock);
+		return;
+	}
+	mutex_unlock(&ns2->lock);
+
+	mutex_lock(&switch2_controllers_lock);
+	list_del_init(&ns2->entry);
+	mutex_unlock(&switch2_controllers_lock);
+	kfree(ns2);
+}
+EXPORT_SYMBOL_GPL(switch2_controller_put);
+
+static bool switch2_parse_stick_calibration(struct switch2_stick_calibration *calib,
+	const uint8_t *data)
+{
+	static const uint8_t UNCALIBRATED[9] = {
+		0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF
+	};
+	if (memcmp(UNCALIBRATED, data, sizeof(UNCALIBRATED)) == 0)
+		return false;
+
+	calib->x.neutral = data[0];
+	calib->x.neutral |= (data[1] & 0x0F) << 8;
+
+	calib->y.neutral = data[1] >> 4;
+	calib->y.neutral |= data[2] << 4;
+
+	calib->x.positive = data[3];
+	calib->x.positive |= (data[4] & 0x0F) << 8;
+
+	calib->y.positive = data[4] >> 4;
+	calib->y.positive |= data[5] << 4;
+
+	calib->x.negative = data[6];
+	calib->x.negative |= (data[7] & 0x0F) << 8;
+
+	calib->y.negative = data[7] >> 4;
+	calib->y.negative |= data[8] << 4;
+
+	return true;
+}
+
+static void switch2_handle_flash_read(struct switch2_controller *ns2, uint8_t size,
+	uint32_t address, const uint8_t *data)
+{
+	bool ok;
+
+	switch (address) {
+	case NS2_FLASH_ADDR_SERIAL:
+		if (size != NS2_FLASH_SIZE_SERIAL)
+			return;
+		memcpy(ns2->serial, data, size);
+		break;
+	case NS2_FLASH_ADDR_FACTORY_PRIMARY_CALIB:
+		if (size != NS2_FLASH_SIZE_FACTORY_AXIS_CALIB)
+			return;
+		ok = switch2_parse_stick_calibration(&ns2->stick_calib[0], data);
+		if (ok) {
+			hid_dbg(ns2->hdev, "Got factory primary stick calibration:\n");
+			hid_dbg(ns2->hdev, "Left max: %i, neutral: %i, right max: %i\n",
+				ns2->stick_calib[0].x.negative,
+				ns2->stick_calib[0].x.neutral,
+				ns2->stick_calib[0].x.positive);
+			hid_dbg(ns2->hdev, "Down max: %i, neutral: %i, up max: %i\n",
+				ns2->stick_calib[0].y.negative,
+				ns2->stick_calib[0].y.neutral,
+				ns2->stick_calib[0].y.positive);
+		} else {
+			hid_dbg(ns2->hdev, "Factory primary stick calibration not present\n");
+		}
+		break;
+	case NS2_FLASH_ADDR_FACTORY_SECONDARY_CALIB:
+		if (size != NS2_FLASH_SIZE_FACTORY_AXIS_CALIB)
+			return;
+		ok = switch2_parse_stick_calibration(&ns2->stick_calib[1], data);
+		if (ok) {
+			hid_dbg(ns2->hdev, "Got factory secondary stick calibration:\n");
+			hid_dbg(ns2->hdev, "Left max: %i, neutral: %i, right max: %i\n",
+				ns2->stick_calib[1].x.negative,
+				ns2->stick_calib[1].x.neutral,
+				ns2->stick_calib[1].x.positive);
+			hid_dbg(ns2->hdev, "Down max: %i, neutral: %i, up max: %i\n",
+				ns2->stick_calib[1].y.negative,
+				ns2->stick_calib[1].y.neutral,
+				ns2->stick_calib[1].y.positive);
+		} else {
+			hid_dbg(ns2->hdev, "Factory secondary stick calibration not present\n");
+		}
+		break;
+	case NS2_FLASH_ADDR_FACTORY_TRIGGER_CALIB:
+		if (size != NS2_FLASH_SIZE_FACTORY_TRIGGER_CALIB)
+			return;
+		if (data[0] != 0xFF && data[1] != 0xFF) {
+			ns2->lt_zero = data[0];
+			ns2->rt_zero = data[1];
+
+			hid_dbg(ns2->hdev, "Got factory trigger calibration:\n");
+			hid_dbg(ns2->hdev, "Left zero point: %i\n", ns2->lt_zero);
+			hid_dbg(ns2->hdev, "Right zero point: %i\n", ns2->rt_zero);
+		} else {
+			hid_dbg(ns2->hdev, "Factory trigger calibration not present\n");
+		}
+		break;
+	case NS2_FLASH_ADDR_USER_PRIMARY_CALIB:
+		if (size != NS2_FLASH_SIZE_USER_AXIS_CALIB)
+			return;
+		if (__le16_to_cpu(*(__le16 *)data) != NS2_USER_CALIB_MAGIC) {
+			hid_dbg(ns2->hdev, "No user primary stick calibration present\n");
+			break;
+		}
+
+		ok = switch2_parse_stick_calibration(&ns2->stick_calib[0], &data[2]);
+		if (ok) {
+			hid_dbg(ns2->hdev, "Got user primary stick calibration:\n");
+			hid_dbg(ns2->hdev, "Left max: %i, neutral: %i, right max: %i\n",
+				ns2->stick_calib[0].x.negative,
+				ns2->stick_calib[0].x.neutral,
+				ns2->stick_calib[0].x.positive);
+			hid_dbg(ns2->hdev, "Down max: %i, neutral: %i, up max: %i\n",
+				ns2->stick_calib[0].y.negative,
+				ns2->stick_calib[0].y.neutral,
+				ns2->stick_calib[0].y.positive);
+		} else {
+			hid_dbg(ns2->hdev, "No user primary stick calibration present\n");
+		}
+		break;
+	case NS2_FLASH_ADDR_USER_SECONDARY_CALIB:
+		if (size != NS2_FLASH_SIZE_USER_AXIS_CALIB)
+			return;
+		if (__le16_to_cpu(*(__le16 *)data) != NS2_USER_CALIB_MAGIC) {
+			hid_dbg(ns2->hdev, "No user secondary stick calibration present\n");
+			break;
+		}
+
+		ok = switch2_parse_stick_calibration(&ns2->stick_calib[1], &data[2]);
+		if (ok) {
+			hid_dbg(ns2->hdev, "Got user secondary stick calibration:\n");
+			hid_dbg(ns2->hdev, "Left max: %i, neutral: %i, right max: %i\n",
+				ns2->stick_calib[1].x.negative,
+				ns2->stick_calib[1].x.neutral,
+				ns2->stick_calib[1].x.positive);
+			hid_dbg(ns2->hdev, "Down max: %i, neutral: %i, up max: %i\n",
+				ns2->stick_calib[1].y.negative,
+				ns2->stick_calib[1].y.neutral,
+				ns2->stick_calib[1].y.positive);
+		} else {
+			hid_dbg(ns2->hdev, "No user secondary stick calibration present\n");
+		}
+		break;
+	}
+}
+
+int switch2_receive_command(struct switch2_controller *ns2,
+	const uint8_t *message, size_t length)
+{
+	const struct switch2_cmd_header *header;
+
+	if (length < 8)
+		return -EINVAL;
+
+	print_hex_dump_debug("got cmd: ", DUMP_PREFIX_OFFSET, 16, 1, message, length, false);
+
+	guard(mutex)(&ns2->lock);
+	if (ns2->init_step < NS2_INIT_DONE)
+		switch2_init_controller(ns2);
+
+	header = (const struct switch2_cmd_header *)message;
+	message = &message[8];
+	switch (header->command) {
+	case NS2_CMD_FLASH:
+		if (header->subcommand == NS2_SUBCMD_FLASH_READ) {
+			uint8_t read_size;
+			uint32_t read_address;
+
+			if (length < 16)
+				return -EINVAL;
+			read_size = message[0];
+			read_address = __le32_to_cpu(*(__le32 *)&message[4]);
+			if (length < read_size + 16)
+				return -EINVAL;
+			switch2_handle_flash_read(ns2, read_size, read_address, &message[8]);
+		}
+		break;
+	case NS2_CMD_FW_INFO:
+		if (header->subcommand == NS2_SUBCMD_FW_INFO_GET) {
+			if (length < sizeof(ns2->version))
+				return -EINVAL;
+			memcpy(&ns2->version, message, sizeof(ns2->version));
+			ns2->ctlr_type = ns2->version.ctlr_type;
+		}
+		break;
+	default:
+		break;
+	}
+
+	return 0;
+}
+EXPORT_SYMBOL_GPL(switch2_receive_command);
+
+static int switch2_features_enable(struct switch2_controller *ns2, int features)
+{
+	__le32 feature_bits = __cpu_to_le32(features);
+
+	if (!ns2->cfg)
+		return -ENOTCONN;
+	return ns2->cfg->send_command(NS2_CMD_FEATSEL, NS2_SUBCMD_FEATSEL_ENABLE,
+		&feature_bits, sizeof(feature_bits),
+		ns2->cfg);
+}
+
+static int switch2_read_flash(struct switch2_controller *ns2, uint32_t address,
+	uint8_t size)
+{
+	uint8_t message[8] = { size, 0x7e };
+
+	if (!ns2->cfg)
+		return -ENOTCONN;
+	*(__le32 *)&message[4] = __cpu_to_le32(address);
+	return ns2->cfg->send_command(NS2_CMD_FLASH, NS2_SUBCMD_FLASH_READ, message,
+		sizeof(message), ns2->cfg);
+}
+
+static int switch2_set_player_id(struct switch2_controller *ns2, uint32_t player_id)
+{
+	player_id %= NS2_MAX_PLAYER_ID;
+	uint8_t message[8] = { switch2_player_pattern[player_id] };
+
+	if (!ns2->cfg)
+		return -ENOTCONN;
+	return ns2->cfg->send_command(NS2_CMD_LED, NS2_SUBCMD_LED_PATTERN,
+		&message, sizeof(message),
+		ns2->cfg);
+}
+
+static void switch2_config_buttons(struct input_dev *idev,
+		 const struct switch2_ctlr_button_mapping button_mappings[])
+{
+	const struct switch2_ctlr_button_mapping *button;
+
+	for (button = button_mappings; button->code; button++)
+		input_set_capability(idev, EV_KEY, button->code);
+}
+
+static int switch2_init_input(struct switch2_controller *ns2)
+{
+	struct input_dev *input;
+	struct hid_device *hdev = ns2->hdev;
+#ifdef CONFIG_SWITCH2_FF
+	int ret;
+#endif
+
+	rcu_read_lock();
+	input = rcu_dereference(ns2->input);
+	rcu_read_unlock();
+
+	if (input)
+		return 0;
+
+	input = devm_input_allocate_device(&hdev->dev);
+	if (!input)
+		return -ENOMEM;
+
+	input_set_drvdata(input, ns2);
+	input->dev.parent = &hdev->dev;
+	input->id.bustype = hdev->bus;
+	input->id.vendor = hdev->vendor;
+	input->id.product = hdev->product;
+	input->id.version = hdev->version;
+	input->uniq = ns2->serial;
+	input->name = hdev->name;
+	input->phys = hdev->phys;
+
+	switch (ns2->ctlr_type) {
+	case NS2_CTLR_TYPE_JCL:
+		input_set_abs_params(input, ABS_X, NS2_AXIS_MIN, NS2_AXIS_MAX, 32, 128);
+		input_set_abs_params(input, ABS_Y, NS2_AXIS_MIN, NS2_AXIS_MAX, 32, 128);
+		input_set_abs_params(input, ABS_HAT0X, -1, 1, 0, 0);
+		input_set_abs_params(input, ABS_HAT0Y, -1, 1, 0, 0);
+		switch2_config_buttons(input, left_joycon_button_mappings);
+		break;
+	case NS2_CTLR_TYPE_JCR:
+		input_set_abs_params(input, ABS_RX, NS2_AXIS_MIN, NS2_AXIS_MAX, 32, 128);
+		input_set_abs_params(input, ABS_RY, NS2_AXIS_MIN, NS2_AXIS_MAX, 32, 128);
+		switch2_config_buttons(input, right_joycon_button_mappings);
+		break;
+	case NS2_CTLR_TYPE_GC:
+		input_set_abs_params(input, ABS_X, NS2_AXIS_MIN, NS2_AXIS_MAX, 32, 128);
+		input_set_abs_params(input, ABS_Y, NS2_AXIS_MIN, NS2_AXIS_MAX, 32, 128);
+		input_set_abs_params(input, ABS_RX, NS2_AXIS_MIN, NS2_AXIS_MAX, 32, 128);
+		input_set_abs_params(input, ABS_RY, NS2_AXIS_MIN, NS2_AXIS_MAX, 32, 128);
+		input_set_abs_params(input, ABS_Z, 0, NS2_TRIGGER_RANGE, 32, 128);
+		input_set_abs_params(input, ABS_RZ, 0, NS2_TRIGGER_RANGE, 32, 128);
+		input_set_abs_params(input, ABS_HAT0X, -1, 1, 0, 0);
+		input_set_abs_params(input, ABS_HAT0Y, -1, 1, 0, 0);
+		switch2_config_buttons(input, gccon_mappings);
+		break;
+	case NS2_CTLR_TYPE_PRO:
+		input_set_abs_params(input, ABS_X, NS2_AXIS_MIN, NS2_AXIS_MAX, 32, 128);
+		input_set_abs_params(input, ABS_Y, NS2_AXIS_MIN, NS2_AXIS_MAX, 32, 128);
+		input_set_abs_params(input, ABS_RX, NS2_AXIS_MIN, NS2_AXIS_MAX, 32, 128);
+		input_set_abs_params(input, ABS_RY, NS2_AXIS_MIN, NS2_AXIS_MAX, 32, 128);
+		input_set_abs_params(input, ABS_HAT0X, -1, 1, 0, 0);
+		input_set_abs_params(input, ABS_HAT0Y, -1, 1, 0, 0);
+		switch2_config_buttons(input, procon_mappings);
+		break;
+	default:
+		input_free_device(input);
+		return -EINVAL;
+	}
+
+#ifdef CONFIG_SWITCH2_FF
+	input_set_capability(input, EV_FF, FF_RUMBLE);
+	ret = input_ff_create_memless(input, NULL, switch2_play_effect);
+	if (ret) {
+		input_free_device(input);
+		return ret;
+	}
+#endif
+
+	rcu_assign_pointer(ns2->input, input);
+
+	hid_info(ns2->hdev, "Firmware version %u.%u.%u (%i)\n", ns2->version.major,
+		ns2->version.minor, ns2->version.patch, ns2->version.ctlr_type);
+	if (ns2->version.dsp_type >= 0)
+		hid_info(ns2->hdev, "DSP version %u.%u.%u\n", ns2->version.dsp_major,
+			ns2->version.dsp_minor, ns2->version.dsp_patch);
+	return input_register_device(input);
+}
+
+int switch2_init_controller(struct switch2_controller *ns2)
+{
+	if (ns2->init_step == NS2_INIT_DONE)
+		return 0;
+
+	if (!ns2->cfg)
+		return -ENOTCONN;
+
+	while (ns2->init_step < NS2_INIT_DONE) {
+		ns2->init_step++;
+		/* TODO verify that the step completed successfully */
+		switch (ns2->init_step) {
+		case NS2_INIT_READ_SERIAL:
+			return switch2_read_flash(ns2, NS2_FLASH_ADDR_SERIAL,
+				NS2_FLASH_SIZE_SERIAL);
+		case NS2_INIT_GET_FIRMWARE_INFO:
+			return ns2->cfg->send_command(NS2_CMD_FW_INFO, NS2_SUBCMD_FW_INFO_GET,
+				NULL, 0, ns2->cfg);
+			break;
+		case NS2_INIT_READ_FACTORY_PRIMARY_CALIB:
+			return switch2_read_flash(ns2, NS2_FLASH_ADDR_FACTORY_PRIMARY_CALIB,
+				NS2_FLASH_SIZE_FACTORY_AXIS_CALIB);
+		case NS2_INIT_READ_FACTORY_SECONDARY_CALIB:
+			if (switch2_ctlr_is_joycon(ns2->ctlr_type))
+				break;
+			return switch2_read_flash(ns2, NS2_FLASH_ADDR_FACTORY_SECONDARY_CALIB,
+				NS2_FLASH_SIZE_FACTORY_AXIS_CALIB);
+		case NS2_INIT_READ_FACTORY_TRIGGER_CALIB:
+			if (ns2->ctlr_type != NS2_CTLR_TYPE_GC)
+				break;
+			return switch2_read_flash(ns2, NS2_FLASH_ADDR_FACTORY_TRIGGER_CALIB,
+				NS2_FLASH_SIZE_FACTORY_TRIGGER_CALIB);
+		case NS2_INIT_READ_USER_PRIMARY_CALIB:
+			return switch2_read_flash(ns2, NS2_FLASH_ADDR_USER_PRIMARY_CALIB,
+				NS2_FLASH_SIZE_USER_AXIS_CALIB);
+		case NS2_INIT_READ_USER_SECONDARY_CALIB:
+			if (switch2_ctlr_is_joycon(ns2->ctlr_type))
+				break;
+			return switch2_read_flash(ns2, NS2_FLASH_ADDR_USER_SECONDARY_CALIB,
+				NS2_FLASH_SIZE_USER_AXIS_CALIB);
+		case NS2_INIT_SET_FEATURE_MASK:
+			return ns2->cfg->send_command(NS2_CMD_FEATSEL, NS2_SUBCMD_FEATSEL_SET_MASK,
+				switch2_feature_mask, sizeof(switch2_feature_mask), ns2->cfg);
+			break;
+		case NS2_INIT_ENABLE_FEATURES:
+			return switch2_features_enable(ns2, NS2_FEATURE_BUTTONS |
+				NS2_FEATURE_ANALOG | NS2_FEATURE_RUMBLE);
+			break;
+#ifdef CONFIG_SWITCH2_FF
+		case NS2_INIT_ENABLE_RUMBLE:
+			return ns2->cfg->send_command(NS2_CMD_NFC, 1,
+				switch2_zero_data, sizeof(switch2_zero_data),
+				ns2->cfg);
+			break;
+#endif
+		case NS2_INIT_GRIP_BUTTONS:
+			if (!switch2_ctlr_is_joycon(ns2->ctlr_type))
+				break;
+			return ns2->cfg->send_command(NS2_CMD_GRIP, NS2_SUBCMD_GRIP_ENABLE_BUTTONS,
+				switch2_one_data, sizeof(switch2_one_data),
+				ns2->cfg);
+			break;
+		case NS2_INIT_SET_PLAYER_LEDS:
+			return switch2_set_player_id(ns2, ns2->player_id);
+		case NS2_INIT_INPUT:
+			return ns2->cfg->send_command(NS2_CMD_INIT, NS2_SUBCMD_INIT_USB,
+				switch2_init_cmd_data, sizeof(switch2_init_cmd_data), ns2->cfg);
+		case NS2_INIT_DONE:
+			if (ns2->hdev)
+				return switch2_init_input(ns2);
+			break;
+		default:
+			WARN_ON_ONCE(1);
+		}
+	}
+	return 0;
+}
+EXPORT_SYMBOL_GPL(switch2_init_controller);
+
+static void switch2_report_buttons(struct input_dev *input, const uint8_t *bytes,
+	const struct switch2_ctlr_button_mapping button_mappings[])
+{
+	const struct switch2_ctlr_button_mapping *button;
+
+	for (button = button_mappings; button->code; button++)
+		input_report_key(input, button->code, bytes[button->byte] & button->bit);
+}
+
+static void switch2_report_axis(struct input_dev *input, struct switch2_axis_calibration *calib,
+	int axis, int value, bool negate)
+{
+	if (calib && calib->neutral && calib->negative && calib->positive) {
+		value -= calib->neutral;
+		value *= NS2_AXIS_MAX + 1;
+		if (value < 0)
+			value /= calib->negative;
+		else
+			value /= calib->positive;
+	} else {
+		value = (value - 2048) * 16;
+	}
+
+	if (negate)
+		value = -value;
+	input_report_abs(input, axis,
+		clamp(value, NS2_AXIS_MIN, NS2_AXIS_MAX));
+}
+
+static void switch2_report_stick(struct input_dev *input, struct switch2_stick_calibration *calib,
+	int x, int y, const uint8_t *data)
+{
+	switch2_report_axis(input, &calib->x, x, data[0] | ((data[1] & 0x0F) << 8), false);
+	switch2_report_axis(input, &calib->y, y, (data[1] >> 4) | (data[2] << 4), true);
+}
+
+static void switch2_report_trigger(struct input_dev *input, uint8_t zero, int abs, uint8_t data)
+{
+	int value = (NS2_TRIGGER_RANGE + 1) * (data - zero) / (232 - zero);
+
+	input_report_abs(input, abs, clamp(value, 0, NS2_TRIGGER_RANGE));
+}
+
+static int switch2_event(struct hid_device *hdev, struct hid_report *report, uint8_t *raw_data,
+	int size)
+{
+	struct switch2_controller *ns2 = hid_get_drvdata(hdev);
+	struct input_dev *input;
+
+	if (report->type != HID_INPUT_REPORT)
+		return 0;
+
+	if (size < 15)
+		return -EINVAL;
+
+	rcu_read_lock();
+	input = rcu_dereference(ns2->input);
+	rcu_read_unlock();
+
+	if (!input)
+		return 0;
+
+	switch (report->id) {
+	case NS2_REPORT_UNIFIED:
+		/*
+		 * TODO
+		 * This won't be sent unless the report type gets changed via command
+		 * 03-0A, but we should support it at some point regardless.
+		 */
+		break;
+	case NS2_REPORT_JCL:
+		input_report_abs(input, ABS_HAT0X,
+			!!(raw_data[3] & NS2_BTNL_RIGHT) -
+			!!(raw_data[3] & NS2_BTNL_LEFT));
+		input_report_abs(input, ABS_HAT0Y,
+			!!(raw_data[3] & NS2_BTNL_DOWN) -
+			!!(raw_data[3] & NS2_BTNL_UP));
+		switch2_report_stick(input, &ns2->stick_calib[0], ABS_X, ABS_Y, &raw_data[6]);
+		switch2_report_buttons(input, &raw_data[3], left_joycon_button_mappings);
+		break;
+	case NS2_REPORT_JCR:
+		switch2_report_stick(input, &ns2->stick_calib[0], ABS_RX, ABS_RY, &raw_data[6]);
+		switch2_report_buttons(input, &raw_data[3], right_joycon_button_mappings);
+		break;
+	case NS2_REPORT_GC:
+		input_report_abs(input, ABS_HAT0X,
+			!!(raw_data[4] & NS2_BTNL_RIGHT) -
+			!!(raw_data[4] & NS2_BTNL_LEFT));
+		input_report_abs(input, ABS_HAT0Y,
+			!!(raw_data[4] & NS2_BTNL_DOWN) -
+			!!(raw_data[4] & NS2_BTNL_UP));
+		switch2_report_buttons(input, &raw_data[3], gccon_mappings);
+		switch2_report_stick(input, &ns2->stick_calib[0], ABS_X, ABS_Y, &raw_data[6]);
+		switch2_report_stick(input, &ns2->stick_calib[1], ABS_RX, ABS_RY, &raw_data[9]);
+		switch2_report_trigger(input, ns2->lt_zero, ABS_Z, raw_data[13]);
+		switch2_report_trigger(input, ns2->rt_zero, ABS_RZ, raw_data[14]);
+		break;
+	case NS2_REPORT_PRO:
+		input_report_abs(input, ABS_HAT0X,
+			!!(raw_data[4] & NS2_BTNL_RIGHT) -
+			!!(raw_data[4] & NS2_BTNL_LEFT));
+		input_report_abs(input, ABS_HAT0Y,
+			!!(raw_data[4] & NS2_BTNL_DOWN) -
+			!!(raw_data[4] & NS2_BTNL_UP));
+		switch2_report_buttons(input, &raw_data[3], procon_mappings);
+		switch2_report_stick(input, &ns2->stick_calib[0], ABS_X, ABS_Y, &raw_data[6]);
+		switch2_report_stick(input, &ns2->stick_calib[1], ABS_RX, ABS_RY, &raw_data[9]);
+		break;
+	default:
+		return -EINVAL;
+	}
+
+	input_sync(input);
+	return 0;
+}
+
+static int switch2_probe(struct hid_device *hdev, const struct hid_device_id *id)
+{
+	struct switch2_controller *ns2;
+	struct usb_device *udev;
+	char phys[64];
+	int ret;
+
+	if (!hid_is_usb(hdev))
+		return -ENODEV;
+
+	udev = hid_to_usb_dev(hdev);
+	if (usb_make_path(udev, phys, sizeof(phys)) < 0)
+		return -EINVAL;
+
+	ret = hid_parse(hdev);
+	if (ret) {
+		hid_err(hdev, "parse failed %d\n", ret);
+		return ret;
+	}
+
+	ret = hid_hw_start(hdev, HID_CONNECT_HIDRAW);
+	if (ret) {
+		hid_err(hdev, "hw_start failed %d\n", ret);
+		return ret;
+	}
+
+	ret = hid_hw_open(hdev);
+	if (ret) {
+		hid_err(hdev, "hw_open failed %d\n", ret);
+		goto err_stop;
+	}
+
+	ns2 = switch2_get_controller(phys);
+	if (!ns2) {
+		ret = -ENOMEM;
+		goto err_close;
+	}
+
+	guard(mutex)(&ns2->lock);
+	ns2->hdev = hdev;
+
+	ns2->player_id = U32_MAX;
+	ret = ida_alloc(&switch2_player_id_allocator, GFP_KERNEL);
+	if (ret < 0)
+		hid_warn(hdev, "Failed to allocate player ID, skipping; ret=%d\n", ret);
+	else
+		ns2->player_id = ret;
+#ifdef CONFIG_SWITCH2_FF
+	if (ns2->ctlr_type != NS2_CTLR_TYPE_GC) {
+		ns2->rumble.hd.hi_freq = RUMBLE_HI_FREQ;
+		ns2->rumble.hd.lo_freq = RUMBLE_LO_FREQ;
+	}
+	spin_lock_init(&ns2->rumble_lock);
+	INIT_DELAYED_WORK(&ns2->rumble_work, switch2_rumble_work);
+#endif
+	hid_set_drvdata(hdev, ns2);
+
+	if (ns2->cfg)
+		return switch2_init_controller(ns2);
+
+	return 0;
+
+err_close:
+	hid_hw_close(hdev);
+err_stop:
+	hid_hw_stop(hdev);
+
+	return ret;
+}
+
+static void switch2_remove(struct hid_device *hdev)
+{
+	struct switch2_controller *ns2 = hid_get_drvdata(hdev);
+#ifdef CONFIG_SWITCH2_FF
+	unsigned long flags;
+#endif
+
+#ifdef CONFIG_SWITCH2_FF
+	spin_lock_irqsave(&ns2->rumble_lock, flags);
+	cancel_delayed_work_sync(&ns2->rumble_work);
+	spin_unlock_irqrestore(&ns2->rumble_lock, flags);
+#endif
+	mutex_lock(&ns2->lock);
+	ns2->hdev = NULL;
+	mutex_unlock(&ns2->lock);
+	hid_hw_close(hdev);
+	ida_free(&switch2_player_id_allocator, ns2->player_id);
+	switch2_controller_put(ns2);
+	hid_hw_stop(hdev);
+}
+
+static const struct hid_device_id switch2_devices[] = {
+	{ HID_USB_DEVICE(USB_VENDOR_ID_NINTENDO, USB_DEVICE_ID_NINTENDO_NS2_JOYCONL) },
+	{ HID_USB_DEVICE(USB_VENDOR_ID_NINTENDO, USB_DEVICE_ID_NINTENDO_NS2_JOYCONR) },
+	{ HID_USB_DEVICE(USB_VENDOR_ID_NINTENDO, USB_DEVICE_ID_NINTENDO_NS2_PROCON) },
+	{ HID_USB_DEVICE(USB_VENDOR_ID_NINTENDO, USB_DEVICE_ID_NINTENDO_NS2_GCCON) },
+	{}
+};
+MODULE_DEVICE_TABLE(hid, switch2_devices);
+
+static struct hid_driver switch2_hid_driver = {
+	.name		= "switch2",
+	.id_table	= switch2_devices,
+	.probe		= switch2_probe,
+	.remove		= switch2_remove,
+	.raw_event	= switch2_event,
+};
+
+static int __init switch2_init(void)
+{
+	return hid_register_driver(&switch2_hid_driver);
+}
+
+static void __exit switch2_exit(void)
+{
+	hid_unregister_driver(&switch2_hid_driver);
+	ida_destroy(&switch2_player_id_allocator);
+}
+
+module_init(switch2_init);
+module_exit(switch2_exit);
+
+MODULE_LICENSE("GPL");
+MODULE_AUTHOR("Vicki Pfau <vi@endrift.com>");
+MODULE_DESCRIPTION("Driver for Nintendo Switch 2 Controllers");
diff --git a/drivers/hid/hid-switch2.h b/drivers/hid/hid-switch2.h
new file mode 100644
index 0000000000000..4b7b82da0c37f
--- /dev/null
+++ b/drivers/hid/hid-switch2.h
@@ -0,0 +1,242 @@
+/* SPDX-License-Identifier: GPL-2.0+ */
+/*
+ * HID driver for Nintendo Switch controllers
+ *
+ * Copyright (c) 2025 Valve Software
+ *
+ * This driver is based on the following work:
+ *   https://gist.github.com/shinyquagsire23/66f006b46c56216acbaac6c1e2279b64
+ *   https://github.com/ndeadly/switch2_controller_research
+ */
+
+#include <linux/bits.h>
+#include <linux/input.h>
+#include <linux/mutex.h>
+#include <linux/rcupdate.h>
+#include <linux/spinlock.h>
+#include "hid-ids.h"
+
+#define NS2_FLAG_OK	BIT(0)
+#define NS2_FLAG_NACK	BIT(2)
+
+#define NS2_FLASH_ADDR_SERIAL			0x13002
+#define NS2_FLASH_ADDR_FACTORY_PRIMARY_CALIB	0x130a8
+#define NS2_FLASH_ADDR_FACTORY_SECONDARY_CALIB	0x130e8
+#define NS2_FLASH_ADDR_FACTORY_TRIGGER_CALIB	0x13140
+#define NS2_FLASH_ADDR_USER_PRIMARY_CALIB	0x1fc040
+#define NS2_FLASH_ADDR_USER_SECONDARY_CALIB	0x1fc080
+
+#define NS2_FLASH_SIZE_SERIAL 0x10
+#define NS2_FLASH_SIZE_FACTORY_AXIS_CALIB 9
+#define NS2_FLASH_SIZE_FACTORY_TRIGGER_CALIB 2
+#define NS2_FLASH_SIZE_USER_AXIS_CALIB 11
+
+#define NS2_USER_CALIB_MAGIC 0xa1b2
+
+#define NS2_FEATURE_BUTTONS	BIT(0)
+#define NS2_FEATURE_ANALOG	BIT(1)
+#define NS2_FEATURE_IMU		BIT(2)
+#define NS2_FEATURE_MOUSE	BIT(4)
+#define NS2_FEATURE_RUMBLE	BIT(5)
+#define NS2_FEATURE_MAGNETO	BIT(7)
+
+enum switch2_cmd {
+	NS2_CMD_NFC = 0x01,
+	NS2_CMD_FLASH = 0x02,
+	NS2_CMD_INIT = 0x03,
+	NS2_CMD_GRIP = 0x08,
+	NS2_CMD_LED = 0x09,
+	NS2_CMD_VIBRATE = 0x0a,
+	NS2_CMD_BATTERY = 0x0b,
+	NS2_CMD_FEATSEL = 0x0c,
+	NS2_CMD_FW_UPD = 0x0d,
+	NS2_CMD_FW_INFO = 0x10,
+	NS2_CMD_BT_PAIR = 0x15,
+};
+
+enum switch2_direction {
+	NS2_DIR_IN = 0x00,
+	NS2_DIR_OUT = 0x90,
+};
+
+enum switch2_transport {
+	NS2_TRANS_USB = 0x00,
+	NS2_TRANS_BT = 0x01,
+};
+
+enum switch2_subcmd_flash {
+	NS2_SUBCMD_FLASH_READ_BLOCK = 0x01,
+	NS2_SUBCMD_FLASH_WRITE_BLOCK = 0x02,
+	NS2_SUBCMD_FLASH_ERASE_BLOCK = 0x03,
+	NS2_SUBCMD_FLASH_READ = 0x04,
+	NS2_SUBCMD_FLASH_WRITE = 0x05,
+};
+
+enum switch2_subcmd_init {
+	NS2_SUBCMD_INIT_SELECT_REPORT = 0xa,
+	NS2_SUBCMD_INIT_USB = 0xd,
+};
+
+enum switch2_subcmd_feature_select {
+	NS2_SUBCMD_FEATSEL_GET_INFO = 0x1,
+	NS2_SUBCMD_FEATSEL_SET_MASK = 0x2,
+	NS2_SUBCMD_FEATSEL_CLEAR_MASK = 0x3,
+	NS2_SUBCMD_FEATSEL_ENABLE = 0x4,
+	NS2_SUBCMD_FEATSEL_DISABLE = 0x5,
+};
+
+enum switch2_subcmd_grip {
+	NS2_SUBCMD_GRIP_GET_INFO = 0x1,
+	NS2_SUBCMD_GRIP_ENABLE_BUTTONS = 0x2,
+	NS2_SUBCMD_GRIP_GET_INFO_EXT = 0x3,
+};
+
+enum switch2_subcmd_led {
+	NS2_SUBCMD_LED_P1 = 0x1,
+	NS2_SUBCMD_LED_P2 = 0x2,
+	NS2_SUBCMD_LED_P3 = 0x3,
+	NS2_SUBCMD_LED_P4 = 0x4,
+	NS2_SUBCMD_LED_ALL_ON = 0x5,
+	NS2_SUBCMD_LED_ALL_OFF = 0x6,
+	NS2_SUBCMD_LED_PATTERN = 0x7,
+	NS2_SUBCMD_LED_BLINK = 0x8,
+};
+
+enum switch2_subcmd_fw_info {
+	NS2_SUBCMD_FW_INFO_GET = 0x1,
+};
+
+enum switch2_ctlr_type {
+	NS2_CTLR_TYPE_JCL = 0x00,
+	NS2_CTLR_TYPE_JCR = 0x01,
+	NS2_CTLR_TYPE_PRO = 0x02,
+	NS2_CTLR_TYPE_GC = 0x03,
+};
+
+enum switch2_report_id {
+	NS2_REPORT_UNIFIED = 0x05,
+	NS2_REPORT_JCL = 0x07,
+	NS2_REPORT_JCR = 0x08,
+	NS2_REPORT_PRO = 0x09,
+	NS2_REPORT_GC = 0x0a,
+};
+
+enum switch2_init_step {
+	NS2_INIT_STARTING,
+	NS2_INIT_READ_SERIAL,
+	NS2_INIT_READ_FACTORY_PRIMARY_CALIB,
+	NS2_INIT_READ_FACTORY_SECONDARY_CALIB,
+	NS2_INIT_READ_FACTORY_TRIGGER_CALIB,
+	NS2_INIT_READ_USER_PRIMARY_CALIB,
+	NS2_INIT_READ_USER_SECONDARY_CALIB,
+	NS2_INIT_SET_FEATURE_MASK,
+	NS2_INIT_ENABLE_FEATURES,
+	NS2_INIT_GET_FIRMWARE_INFO,
+#ifdef CONFIG_SWITCH2_FF
+	NS2_INIT_ENABLE_RUMBLE,
+#endif
+	NS2_INIT_GRIP_BUTTONS,
+	NS2_INIT_SET_PLAYER_LEDS,
+	NS2_INIT_INPUT,
+	NS2_INIT_DONE,
+};
+
+struct switch2_cmd_header {
+	uint8_t command;
+	uint8_t direciton;
+	uint8_t transport;
+	uint8_t subcommand;
+	uint8_t unk1;
+	uint8_t length;
+	uint16_t unk2;
+};
+static_assert(sizeof(struct switch2_cmd_header) == 8);
+
+struct switch2_controller;
+struct switch2_cfg_intf {
+	struct switch2_controller *parent;
+
+	int (*send_command)(enum switch2_cmd command, uint8_t subcommand,
+		const void *message, size_t length,
+		struct switch2_cfg_intf *intf);
+};
+
+struct switch2_version_info {
+	uint8_t major;
+	uint8_t minor;
+	uint8_t patch;
+	uint8_t ctlr_type;
+	__le32 unk;
+	int8_t dsp_major;
+	int8_t dsp_minor;
+	int8_t dsp_patch;
+	int8_t dsp_type;
+};
+
+struct switch2_axis_calibration {
+	uint16_t neutral;
+	uint16_t negative;
+	uint16_t positive;
+};
+
+struct switch2_stick_calibration {
+	struct switch2_axis_calibration x;
+	struct switch2_axis_calibration y;
+};
+
+struct switch2_hd_rumble {
+	uint16_t hi_freq : 10;
+	uint16_t hi_amp : 10;
+	uint16_t lo_freq : 10;
+	uint16_t lo_amp : 10;
+};
+
+struct switch2_erm_rumble {
+	uint16_t error;
+	uint16_t amplitude;
+};
+
+struct switch2_controller {
+	struct hid_device *hdev;
+	struct switch2_cfg_intf *cfg;
+
+	char phys[64];
+	struct list_head entry;
+	struct mutex lock;
+
+	enum switch2_ctlr_type ctlr_type;
+	enum switch2_init_step init_step;
+	struct input_dev __rcu *input;
+	char serial[NS2_FLASH_SIZE_SERIAL + 1];
+	struct switch2_version_info version;
+
+	struct switch2_stick_calibration stick_calib[2];
+	uint8_t lt_zero;
+	uint8_t rt_zero;
+
+	uint32_t player_id;
+
+#ifdef CONFIG_SWITCH2_FF
+	spinlock_t rumble_lock;
+	uint8_t rumble_seq;
+	union {
+		struct switch2_hd_rumble hd;
+		struct switch2_erm_rumble sd;
+	} rumble;
+	unsigned long last_rumble_work;
+	struct delayed_work rumble_work;
+#endif
+};
+
+struct switch2_controller *switch2_get_controller(const char *phys);
+void switch2_controller_put(struct switch2_controller *controller);
+
+int switch2_receive_command(struct switch2_controller *controller,
+	const uint8_t *message, size_t length);
+
+int switch2_init_controller(struct switch2_controller *controller);
+
+static inline bool switch2_ctlr_is_joycon(enum switch2_ctlr_type type)
+{
+	return type == NS2_CTLR_TYPE_JCL || type == NS2_CTLR_TYPE_JCR;
+}
diff --git a/drivers/input/joystick/Kconfig b/drivers/input/joystick/Kconfig
index 7755e5b454d2c..73b0e15205aee 100644
--- a/drivers/input/joystick/Kconfig
+++ b/drivers/input/joystick/Kconfig
@@ -422,4 +422,12 @@ config JOYSTICK_SEESAW
 	  To compile this driver as a module, choose M here: the module will be
 	  called adafruit-seesaw.
 
+config JOYSTICK_SWITCH2_USB
+	tristate "Wired Nintendo Switch 2 controller support"
+	depends on HID_SWITCH2
+	select USB
+	help
+	  To compile this driver as a module, choose M here: the
+	  module will be called switch2-usb.
+
 endif
diff --git a/drivers/input/joystick/Makefile b/drivers/input/joystick/Makefile
index 9976f596a9208..46feb7ef60ba0 100644
--- a/drivers/input/joystick/Makefile
+++ b/drivers/input/joystick/Makefile
@@ -34,6 +34,7 @@ obj-$(CONFIG_JOYSTICK_SIDEWINDER)	+= sidewinder.o
 obj-$(CONFIG_JOYSTICK_SPACEBALL)	+= spaceball.o
 obj-$(CONFIG_JOYSTICK_SPACEORB)		+= spaceorb.o
 obj-$(CONFIG_JOYSTICK_STINGER)		+= stinger.o
+obj-$(CONFIG_JOYSTICK_SWITCH2_USB)	+= switch2-usb.o
 obj-$(CONFIG_JOYSTICK_TMDC)		+= tmdc.o
 obj-$(CONFIG_JOYSTICK_TURBOGRAFX)	+= turbografx.o
 obj-$(CONFIG_JOYSTICK_TWIDJOY)		+= twidjoy.o
diff --git a/drivers/input/joystick/switch2-usb.c b/drivers/input/joystick/switch2-usb.c
new file mode 100644
index 0000000000000..2c8b09f4b98e9
--- /dev/null
+++ b/drivers/input/joystick/switch2-usb.c
@@ -0,0 +1,355 @@
+// SPDX-License-Identifier: GPL-2.0+
+/*
+ * HID driver for Nintendo Switch controllers
+ *
+ * Copyright (c) 2025 Valve Software
+ *
+ * This driver is based on the following work:
+ *   https://gist.github.com/shinyquagsire23/66f006b46c56216acbaac6c1e2279b64
+ *   https://github.com/ndeadly/switch2_controller_research
+ */
+
+#include "../../hid/hid-switch2.h"
+#include <linux/module.h>
+#include <linux/usb/input.h>
+
+#define NS2_BULK_SIZE 64
+#define NS2_IN_URBS 2
+#define NS2_OUT_URBS 4
+
+static struct usb_driver switch2_usb;
+
+struct switch2_urb {
+	struct urb *urb;
+	uint8_t *data;
+	bool active;
+};
+
+struct switch2_usb {
+	struct switch2_cfg_intf cfg;
+	struct usb_device *udev;
+
+	struct switch2_urb bulk_in[NS2_IN_URBS];
+	struct usb_anchor bulk_in_anchor;
+	spinlock_t bulk_in_lock;
+
+	struct switch2_urb bulk_out[NS2_OUT_URBS];
+	struct usb_anchor bulk_out_anchor;
+	spinlock_t bulk_out_lock;
+
+	int message_in;
+	struct work_struct message_in_work;
+};
+
+static void switch2_bulk_in(struct urb *urb)
+{
+	struct switch2_usb *ns2_usb = urb->context;
+	int i;
+	bool schedule = false;
+	unsigned long flags;
+
+	switch (urb->status) {
+	case 0:
+		schedule = true;
+		break;
+	case -ECONNRESET:
+	case -ENOENT:
+	case -ESHUTDOWN:
+		return;
+	default:
+		dev_dbg(&ns2_usb->udev->dev, "unknown urb status: %d\n",
+			urb->status);
+		break;
+	}
+
+	spin_lock_irqsave(&ns2_usb->bulk_in_lock, flags);
+	for (i = 0; i < NS2_IN_URBS; i++) {
+		int err;
+		struct switch2_urb *ns2_urb;
+
+		if (ns2_usb->bulk_in[i].urb == urb) {
+			ns2_usb->message_in = i;
+			continue;
+		}
+
+		if (ns2_usb->bulk_in[i].active)
+			continue;
+
+		ns2_urb = &ns2_usb->bulk_in[i];
+		usb_anchor_urb(ns2_urb->urb, &ns2_usb->bulk_out_anchor);
+		err = usb_submit_urb(ns2_urb->urb, GFP_ATOMIC);
+		if (err) {
+			usb_unanchor_urb(ns2_urb->urb);
+			dev_dbg(&ns2_usb->udev->dev, "failed to queue input urb: %d\n", err);
+		} else {
+			ns2_urb->active = true;
+		}
+	}
+	spin_unlock_irqrestore(&ns2_usb->bulk_in_lock, flags);
+
+	if (schedule)
+		schedule_work(&ns2_usb->message_in_work);
+}
+
+static void switch2_bulk_out(struct urb *urb)
+{
+	struct switch2_usb *ns2_usb = urb->context;
+	int i;
+
+	guard(spinlock_irqsave)(&ns2_usb->bulk_out_lock);
+
+	switch (urb->status) {
+	case 0:
+		break;
+	case -ECONNRESET:
+	case -ENOENT:
+	case -ESHUTDOWN:
+		return;
+	default:
+		dev_dbg(&ns2_usb->udev->dev, "unknown urb status: %d\n", urb->status);
+		return;
+	}
+
+	for (i = 0; i < NS2_OUT_URBS; i++) {
+		if (ns2_usb->bulk_out[i].urb != urb)
+			continue;
+
+		ns2_usb->bulk_out[i].active = false;
+		break;
+	}
+}
+
+static int switch2_usb_send_cmd(enum switch2_cmd command, uint8_t subcommand,
+	const void *message, size_t size, struct switch2_cfg_intf *cfg)
+{
+	struct switch2_usb *ns2_usb = (struct switch2_usb *)cfg;
+	struct switch2_urb *urb = NULL;
+	int i;
+	int ret;
+
+	struct switch2_cmd_header header = {
+		command, NS2_DIR_OUT | NS2_FLAG_OK, NS2_TRANS_USB, subcommand, 0, size
+	};
+
+	if (size > 56) {
+		WARN_ON(1);
+		return -EINVAL;
+	}
+
+	for (i = 0; i < NS2_OUT_URBS; i++) {
+		if (ns2_usb->bulk_out[i].active)
+			continue;
+
+		urb = &ns2_usb->bulk_out[i];
+		urb->active = true;
+		break;
+	}
+	if (!urb) {
+		dev_warn(&ns2_usb->udev->dev, "output queue full, dropping message\n");
+		return -ENOBUFS;
+	}
+
+	memcpy(urb->data, &header, sizeof(header));
+	if (message && size)
+		memcpy(&urb->data[8], message, size);
+	urb->urb->transfer_buffer_length = size + sizeof(header);
+
+	print_hex_dump_debug("sending cmd: ", DUMP_PREFIX_OFFSET, 16, 1, urb->data,
+		size + sizeof(header), false);
+
+	usb_anchor_urb(urb->urb, &ns2_usb->bulk_out_anchor);
+	ret = usb_submit_urb(urb->urb, GFP_ATOMIC);
+	if (ret) {
+		dev_warn(&ns2_usb->udev->dev, "failed to submit urb: %i", ret);
+		urb->active = false;
+		usb_unanchor_urb(urb->urb);
+		return ret;
+	}
+
+	return 0;
+}
+
+static void switch2_usb_message_in_work(struct work_struct *work)
+{
+	struct switch2_usb *ns2_usb = container_of(work, struct switch2_usb, message_in_work);
+	struct switch2_urb *urb;
+	int err;
+	unsigned long flags;
+
+	spin_lock_irqsave(&ns2_usb->bulk_in_lock, flags);
+	urb = &ns2_usb->bulk_in[ns2_usb->message_in];
+	spin_unlock_irqrestore(&ns2_usb->bulk_in_lock, flags);
+
+	err = switch2_receive_command(ns2_usb->cfg.parent, urb->urb->transfer_buffer,
+		urb->urb->actual_length);
+	if (err)
+		dev_dbg(&ns2_usb->udev->dev, "receive command failed: %d\n", err);
+
+	spin_lock_irqsave(&ns2_usb->bulk_in_lock, flags);
+	urb->active = false;
+	spin_unlock_irqrestore(&ns2_usb->bulk_in_lock, flags);
+}
+
+static int switch2_usb_probe(struct usb_interface *intf, const struct usb_device_id *id)
+{
+	struct switch2_controller *ns2;
+	struct switch2_usb *ns2_usb;
+	struct usb_device *udev;
+	struct usb_endpoint_descriptor *bulk_in, *bulk_out;
+	char phys[64];
+	int ret;
+	int i;
+
+	udev = interface_to_usbdev(intf);
+	if (usb_make_path(udev, phys, sizeof(phys)) < 0)
+		return -EINVAL;
+
+	ret = usb_find_common_endpoints(intf->cur_altsetting, &bulk_in, &bulk_out, NULL, NULL);
+	if (ret) {
+		dev_err(&intf->dev, "failed to find bulk EPs\n");
+		return ret;
+	}
+
+	ns2_usb = devm_kzalloc(&intf->dev, sizeof(*ns2_usb), GFP_KERNEL);
+	if (!ns2_usb)
+		return -ENOMEM;
+
+	ns2_usb->udev = udev;
+	for (i = 0; i < NS2_IN_URBS; i++) {
+		ns2_usb->bulk_in[i].urb = usb_alloc_urb(0, GFP_KERNEL);
+		if (!ns2_usb->bulk_in[i].urb) {
+			ret = -ENOMEM;
+			goto err_free_in;
+		}
+
+		ns2_usb->bulk_in[i].data = usb_alloc_coherent(udev, NS2_BULK_SIZE, GFP_KERNEL,
+			&ns2_usb->bulk_in[i].urb->transfer_dma);
+		if (!ns2_usb->bulk_in[i].data) {
+			ret = -ENOMEM;
+			goto err_free_in;
+		}
+
+		usb_fill_bulk_urb(ns2_usb->bulk_in[i].urb, udev,
+			usb_rcvbulkpipe(udev, bulk_in->bEndpointAddress),
+			ns2_usb->bulk_in[i].data, NS2_BULK_SIZE, switch2_bulk_in, ns2_usb);
+		ns2_usb->bulk_in[i].urb->transfer_flags |= URB_NO_TRANSFER_DMA_MAP;
+	}
+
+	for (i = 0; i < NS2_OUT_URBS; i++) {
+		ns2_usb->bulk_out[i].urb = usb_alloc_urb(0, GFP_KERNEL);
+		if (!ns2_usb->bulk_out[i].urb) {
+			ret = -ENOMEM;
+			goto err_free_out;
+		}
+
+		ns2_usb->bulk_out[i].data = usb_alloc_coherent(udev, NS2_BULK_SIZE, GFP_KERNEL,
+			&ns2_usb->bulk_out[i].urb->transfer_dma);
+		if (!ns2_usb->bulk_out[i].data) {
+			ret = -ENOMEM;
+			goto err_free_out;
+		}
+
+		usb_fill_bulk_urb(ns2_usb->bulk_out[i].urb, udev,
+			usb_sndbulkpipe(udev, bulk_out->bEndpointAddress),
+			ns2_usb->bulk_out[i].data, NS2_BULK_SIZE, switch2_bulk_out, ns2_usb);
+		ns2_usb->bulk_out[i].urb->transfer_flags |= URB_NO_TRANSFER_DMA_MAP;
+	}
+
+	ns2_usb->bulk_in[0].active = true;
+	ret = usb_submit_urb(ns2_usb->bulk_in[0].urb, GFP_ATOMIC);
+	if (ret < 0)
+		goto err_free_out;
+
+	ns2 = switch2_get_controller(phys);
+	if (IS_ERR(ns2)) {
+		ret = PTR_ERR(ns2);
+		goto err_kill_urb;
+	}
+
+	ns2_usb->cfg.parent = ns2;
+	ns2_usb->cfg.send_command = switch2_usb_send_cmd;
+
+	init_usb_anchor(&ns2_usb->bulk_out_anchor);
+	spin_lock_init(&ns2_usb->bulk_out_lock);
+	init_usb_anchor(&ns2_usb->bulk_in_anchor);
+	spin_lock_init(&ns2_usb->bulk_in_lock);
+	INIT_WORK(&ns2_usb->message_in_work, switch2_usb_message_in_work);
+
+	usb_set_intfdata(intf, ns2_usb);
+
+	guard(mutex)(&ns2->lock);
+	ns2->cfg = (struct switch2_cfg_intf *) ns2_usb;
+
+	if (ns2->hdev)
+		return switch2_init_controller(ns2);
+
+	return 0;
+
+err_kill_urb:
+	usb_kill_urb(ns2_usb->bulk_in[0].urb);
+err_free_out:
+	for (i = 0; i < NS2_OUT_URBS; i++) {
+		usb_free_coherent(ns2_usb->udev, NS2_BULK_SIZE, ns2_usb->bulk_out[i].data,
+			ns2_usb->bulk_out[i].urb->transfer_dma);
+		usb_free_urb(ns2_usb->bulk_out[i].urb);
+	}
+err_free_in:
+	for (i = 0; i < NS2_IN_URBS; i++) {
+		usb_free_coherent(ns2_usb->udev, NS2_BULK_SIZE, ns2_usb->bulk_in[i].data,
+			ns2_usb->bulk_in[i].urb->transfer_dma);
+		usb_free_urb(ns2_usb->bulk_in[i].urb);
+	}
+	devm_kfree(&intf->dev, ns2_usb);
+
+	return ret;
+}
+
+static void switch2_usb_disconnect(struct usb_interface *intf)
+{
+	struct switch2_usb *ns2_usb = usb_get_intfdata(intf);
+	struct switch2_controller *ns2 = ns2_usb->cfg.parent;
+	int i;
+
+	usb_kill_anchored_urbs(&ns2_usb->bulk_out_anchor);
+	for (i = 0; i < NS2_OUT_URBS; i++) {
+		usb_free_coherent(ns2_usb->udev, NS2_BULK_SIZE, ns2_usb->bulk_out[i].data,
+			ns2_usb->bulk_out[i].urb->transfer_dma);
+		usb_free_urb(ns2_usb->bulk_out[i].urb);
+	}
+
+	usb_kill_anchored_urbs(&ns2_usb->bulk_in_anchor);
+	for (i = 0; i < NS2_IN_URBS; i++) {
+		usb_free_coherent(ns2_usb->udev, NS2_BULK_SIZE, ns2_usb->bulk_in[i].data,
+			ns2_usb->bulk_in[i].urb->transfer_dma);
+		usb_free_urb(ns2_usb->bulk_in[i].urb);
+	}
+
+	mutex_lock(&ns2->lock);
+	ns2->cfg = NULL;
+	mutex_unlock(&ns2->lock);
+	switch2_controller_put(ns2);
+}
+
+#define SWITCH2_CONTROLLER(vend, prod) \
+	USB_DEVICE_AND_INTERFACE_INFO(vend, prod, USB_CLASS_VENDOR_SPEC, 0, 0)
+
+static const struct usb_device_id switch2_usb_devices[] = {
+	{ SWITCH2_CONTROLLER(USB_VENDOR_ID_NINTENDO, USB_DEVICE_ID_NINTENDO_NS2_JOYCONL) },
+	{ SWITCH2_CONTROLLER(USB_VENDOR_ID_NINTENDO, USB_DEVICE_ID_NINTENDO_NS2_JOYCONR) },
+	{ SWITCH2_CONTROLLER(USB_VENDOR_ID_NINTENDO, USB_DEVICE_ID_NINTENDO_NS2_PROCON) },
+	{ SWITCH2_CONTROLLER(USB_VENDOR_ID_NINTENDO, USB_DEVICE_ID_NINTENDO_NS2_GCCON) },
+	{ }
+};
+MODULE_DEVICE_TABLE(usb, switch2_usb_devices);
+
+static struct usb_driver switch2_usb = {
+	.name		= "switch2",
+	.id_table	= switch2_usb_devices,
+	.probe		= switch2_usb_probe,
+	.disconnect	= switch2_usb_disconnect,
+};
+module_usb_driver(switch2_usb);
+
+MODULE_LICENSE("GPL");
+MODULE_AUTHOR("Vicki Pfau <vi@endrift.com>");
+MODULE_DESCRIPTION("Driver for Nintendo Switch 2 Controllers");
-- 
2.51.0


