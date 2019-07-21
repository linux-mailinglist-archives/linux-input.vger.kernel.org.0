Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3F2376F33E
	for <lists+linux-input@lfdr.de>; Sun, 21 Jul 2019 14:41:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726190AbfGUMlQ (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Sun, 21 Jul 2019 08:41:16 -0400
Received: from mout.kundenserver.de ([212.227.126.135]:43647 "EHLO
        mout.kundenserver.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726188AbfGUMlP (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Sun, 21 Jul 2019 08:41:15 -0400
Received: from localhost.localdomain ([46.5.7.218]) by
 mrelayeu.kundenserver.de (mreue010 [212.227.15.167]) with ESMTPSA (Nemesis)
 id 1MQuwR-1i20uG459r-00NzAq; Sun, 21 Jul 2019 14:41:12 +0200
From:   Markus Koch <markus@notsyncing.net>
To:     dmitry.torokhov@gmail.com
Cc:     linux-input@vger.kernel.org, Markus Koch <markus@notsyncing.net>
Subject: [PATCH v2] Input: add support for the FlySky FS-iA6B RC receiver
Date:   Sun, 21 Jul 2019 14:37:59 +0200
Message-Id: <20190721123756.10046-1-markus@notsyncing.net>
X-Mailer: git-send-email 2.22.0
In-Reply-To: <20190721072303.GA607@penguin>
References: <20190721072303.GA607@penguin>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:5xQrMIIKSPt50farzw1oMTusXIJlDZiQwR0vEDpq8Iio0M3wJy7
 MB1WEZJUDEbIEGJo/sshpAC6ih2bIanK3Y4xX+rEGUiS8g96uWNQCnyQ6bamXV9V85ta7i2
 XscTV4NFxK+7PcIDx+hRcmjsKLcwmV5tv2+XjArCPEoqdC/cAZXGpNZSn0muKFjri5x402V
 a/bxfKpp6IN9AWy/Zie3A==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:t+bpV2mbs2U=:7fcqeQsVXcIslvtmYPQfKr
 jSVC/MKXACXDJRfXnYPnbfV1nO3txD1l/XOo14kQg0ByZIiH16dCEibg5NDI/OrBA6GvbVCBu
 HdgX48J4naMe6xmLScS75H7u3LZnDcEY82WUmasPcI44NAiWiygbol88fjgP17fbYYR7EXzKX
 QDqjRLXeWQO6fHtwt2uO736koPe+KJWEkH9rQgqjZvIctb4XHC2kkOft9cuPBcyrAsxl3PIof
 uVhtOcgdbe5K0l5UXnDhPLbBxI9rBDIJ0MpZIFnmK8RYsRRE+yFqyldqKGs05cTrtZP1rUIZF
 jP0wK44vnaZY2t/wB6+8m3Tf8MKitUbhFna9EtO+WjCUUMAHF6uWqoGmLLmZ0ZygA8Uyqu9C+
 LeHHo8oy/QYsnrd7UcEUlKh4h7xJPbPQ4fhOGyKmprZa+4QEeinCuviUHnUqtLcMQ0Pl1YWc+
 JOGJ6/5VWizFS9N43J1uRLL53XNMlx8ekkEIzlfLut+vzQBtFvJIO4xzIhubJspWW38uo7T/a
 Wt/2iFBfD59KRnLSPM9W+x9XQmpA4KoSs5fJe+mg9ojgMJhaQpX3mezWySBW1OZdZRh2qklwK
 iNx9mBSh+bEL04FaM+6TcRui+BJlJxju/B3wQBOY3BkdHqk+fUVbLoo7sN5AtffJp6K9HXYMh
 Iqg02PK+nqHjyJrbGAX+LYEtiI5/UcXl8aBAKjyaUY4vDyILkkZkFAlXz1HEm8t9b3F7KVlm/
 4g1YU3IsFi1ZCXviILELWS34apjJMLGAcl5jyg==
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

This patch adds support for the FlySky FS-iA6B RC receiver (serial IBUS).

It allows the usage of the FlySky FS-i6 and other AFHDS compliant remote
controls as a joystick input device.

To use it, a patch to inputattach which adds the FS-iA6B as a 115200 baud
serial device is required. I will upstream it after this patch is merged.

More information about the hardware can be found here:

https://notsyncing.net/?p=blog&b=2018.linux-fsia6b

Signed-off-by: Markus Koch <markus@notsyncing.net>
---
 Changes in v2:
   Remove license boilerplate.
   Sorted includes.
   Using u16 instead of uint16_t, added corresponding include.
   Use sizeof(*fsia6b) instead of sizeof(struct ...).
   Return proper error code, and set err only on error for
     input_allocate_device.
   Use input_set_capability() intead of accessing struct directly.
 Thank you for your comments!

 MAINTAINERS                     |   6 +
 drivers/input/joystick/Kconfig  |  10 ++
 drivers/input/joystick/Makefile |   1 +
 drivers/input/joystick/fsia6b.c | 238 ++++++++++++++++++++++++++++++++
 include/uapi/linux/serio.h      |   1 +
 5 files changed, 256 insertions(+)
 create mode 100644 drivers/input/joystick/fsia6b.c

diff --git a/MAINTAINERS b/MAINTAINERS
index 677ef41cb012..cdd25b0a1218 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -12394,6 +12394,12 @@ S:	Maintained
 F:	Documentation/input/devices/pxrc.rst
 F:	drivers/input/joystick/pxrc.c
 
+FLYSKY FSIA6B RC RECEIVER
+M:	Markus Koch <markus@notsyncing.net>
+L:	linux-input@vger.kernel.org
+S:	Maintained
+F:	drivers/input/joystick/fsia6b.c
+
 PHONET PROTOCOL
 M:	Remi Denis-Courmont <courmisch@gmail.com>
 S:	Supported
diff --git a/drivers/input/joystick/Kconfig b/drivers/input/joystick/Kconfig
index 72b932901d00..312b854b5506 100644
--- a/drivers/input/joystick/Kconfig
+++ b/drivers/input/joystick/Kconfig
@@ -362,4 +362,14 @@ config JOYSTICK_PXRC
 	  To compile this driver as a module, choose M here: the
 	  module will be called pxrc.
 
+config JOYSTICK_FSIA6B
+	tristate "FlySky FS-iA6B RC Receiver"
+	select SERIO
+	help
+	  Say Y here if you use a FlySky FS-i6 RC remote control along with the
+	  FS-iA6B RC receiver as a joystick input device.
+
+	  To compile this driver as a module, choose M here: the
+	  module will be called fsia6b.
+
 endif
diff --git a/drivers/input/joystick/Makefile b/drivers/input/joystick/Makefile
index dd0492ebbed7..aae4477a92a9 100644
--- a/drivers/input/joystick/Makefile
+++ b/drivers/input/joystick/Makefile
@@ -35,4 +35,5 @@ obj-$(CONFIG_JOYSTICK_WARRIOR)		+= warrior.o
 obj-$(CONFIG_JOYSTICK_XPAD)		+= xpad.o
 obj-$(CONFIG_JOYSTICK_ZHENHUA)		+= zhenhua.o
 obj-$(CONFIG_JOYSTICK_WALKERA0701)	+= walkera0701.o
+obj-$(CONFIG_JOYSTICK_FSIA6B)		+= fsia6b.o
 
diff --git a/drivers/input/joystick/fsia6b.c b/drivers/input/joystick/fsia6b.c
new file mode 100644
index 000000000000..1d0fa8abc066
--- /dev/null
+++ b/drivers/input/joystick/fsia6b.c
@@ -0,0 +1,238 @@
+// SPDX-License-Identifier: GPL-2.0
+
+/*
+ * FS-iA6B iBus RC receiver driver
+ *
+ * This driver provides all 14 channels of the FlySky FS-ia6B RC receiver
+ * as analog values.
+ *
+ * Additionally, the channels can be converted to discrete switch values.
+ * By default, it is configured for the offical FS-i6 remote control.
+ * If you use a different hardware configuration, you can configure it
+ * using the `switch_config` parameter.
+ *
+ */
+
+#include <linux/device.h>
+#include <linux/input.h>
+#include <linux/kernel.h>
+#include <linux/module.h>
+#include <linux/serio.h>
+#include <linux/slab.h>
+#include <linux/types.h>
+
+#define DRIVER_DESC	"FS-iA6B iBus RC receiver"
+
+MODULE_AUTHOR("Markus Koch <markus@notsyncing.net>");
+MODULE_DESCRIPTION(DRIVER_DESC);
+MODULE_LICENSE("GPL");
+
+#define IBUS_SERVO_COUNT 14
+
+static char *switch_config = "00000022320000";
+module_param(switch_config, charp, 0444);
+MODULE_PARM_DESC(switch_config,
+		 "Amount of switch positions per channel (14 characters, 0-3)");
+
+static int fsia6b_axes[IBUS_SERVO_COUNT] = {
+	ABS_X, ABS_Y,
+	ABS_Z, ABS_RX,
+	ABS_RY, ABS_RZ,
+	ABS_HAT0X, ABS_HAT0Y,
+	ABS_HAT1X, ABS_HAT1Y,
+	ABS_HAT2X, ABS_HAT2Y,
+	ABS_HAT3X, ABS_HAT3Y
+};
+
+enum ibus_state {SYNC, COLLECT, PROCESS};
+
+struct ibus_packet {
+	enum ibus_state state;
+
+	int offset;
+	u16 ibuf;
+	u16 channel[IBUS_SERVO_COUNT];
+};
+
+struct fsia6b {
+	struct input_dev *dev;
+	struct ibus_packet packet;
+
+	char phys[32];
+};
+
+static irqreturn_t fsia6b_serio_irq(struct serio *serio,
+				    unsigned char data, unsigned int flags)
+{
+	struct fsia6b *fsia6b = serio_get_drvdata(serio);
+	int i;
+	int sw_state;
+	int sw_id = BTN_0;
+
+	fsia6b->packet.ibuf = (data << 8) | ((fsia6b->packet.ibuf >> 8) & 0xFF);
+
+	switch (fsia6b->packet.state) {
+	case SYNC:
+		if (fsia6b->packet.ibuf == 0x4020)
+			fsia6b->packet.state = COLLECT;
+		break;
+
+	case COLLECT:
+		fsia6b->packet.state = PROCESS;
+		break;
+
+	case PROCESS:
+		fsia6b->packet.channel[fsia6b->packet.offset] =
+				fsia6b->packet.ibuf;
+		fsia6b->packet.offset++;
+
+		if (fsia6b->packet.offset == IBUS_SERVO_COUNT) {
+			fsia6b->packet.offset = 0;
+			fsia6b->packet.state = SYNC;
+			for (i = 0; i < IBUS_SERVO_COUNT; ++i) {
+				input_report_abs(fsia6b->dev, fsia6b_axes[i],
+						 fsia6b->packet.channel[i]);
+
+				sw_state = 0;
+				if (fsia6b->packet.channel[i] > 1900)
+					sw_state = 1;
+				else if (fsia6b->packet.channel[i] < 1100)
+					sw_state = 2;
+
+				switch (switch_config[i]) {
+				case '3':
+					input_report_key(fsia6b->dev,
+							 sw_id++,
+							 sw_state == 0);
+					/* fall-through */
+				case '2':
+					input_report_key(fsia6b->dev,
+							 sw_id++,
+							 sw_state == 1);
+					/* fall-through */
+				case '1':
+					input_report_key(fsia6b->dev,
+							 sw_id++,
+							 sw_state == 2);
+				}
+			}
+			input_sync(fsia6b->dev);
+		} else {
+			fsia6b->packet.state = COLLECT;
+		}
+		break;
+	}
+
+	return IRQ_HANDLED;
+}
+
+static int fsia6b_serio_connect(struct serio *serio, struct serio_driver *drv)
+{
+	struct fsia6b *fsia6b;
+	struct input_dev *input_dev;
+	int err;
+	int i, j;
+	int sw_id = 0;
+
+	fsia6b = kzalloc(sizeof(*fsia6b), GFP_KERNEL);
+	if (!fsia6b)
+		return -ENOMEM;
+
+	fsia6b->packet.ibuf = 0;
+	fsia6b->packet.offset = 0;
+	fsia6b->packet.state = SYNC;
+
+	serio_set_drvdata(serio, fsia6b);
+
+	err = serio_open(serio, drv);
+	if (err)
+		goto fail1;
+
+
+	input_dev = input_allocate_device();
+	if (!input_dev) {
+		err = -ENOMEM;
+		goto fail2;
+	}
+	fsia6b->dev = input_dev;
+
+	snprintf(fsia6b->phys, sizeof(fsia6b->phys), "%s/input0", serio->phys);
+
+	input_dev->name = DRIVER_DESC;
+	input_dev->phys = fsia6b->phys;
+	input_dev->id.bustype = BUS_RS232;
+	input_dev->id.vendor = SERIO_FSIA6B;
+	input_dev->id.product = serio->id.id;
+	input_dev->id.version = 0x0100;
+	input_dev->dev.parent = &serio->dev;
+
+	for (i = 0; i < IBUS_SERVO_COUNT; ++i) {
+		input_set_abs_params(input_dev, fsia6b_axes[i],
+				     1000, 2000, 2, 2);
+	}
+
+	// Register switch configuration
+	for (i = 0; i < IBUS_SERVO_COUNT; ++i) {
+		if (((switch_config[i] == '\0') && (i != IBUS_SERVO_COUNT)) ||
+				(switch_config[i] < '0') ||
+				(switch_config[i] > '3')) {
+			dev_err(&fsia6b->dev->dev,
+				"Invalid switch configuration supplied for fsia6b.\n");
+			err = -EINVAL;
+			goto fail3;
+		}
+
+		for (j = '1'; j <= switch_config[i]; ++j) {
+			input_set_capability(input_dev, EV_KEY, BTN_0 + sw_id);
+			sw_id++;
+		}
+
+	}
+
+	err = input_register_device(fsia6b->dev);
+	if (err)
+		goto fail3;
+
+	return 0;
+
+fail3:	input_free_device(input_dev);
+fail2:	serio_close(serio);
+fail1:	serio_set_drvdata(serio, NULL);
+	kfree(fsia6b);
+	return err;
+}
+
+static void fsia6b_serio_disconnect(struct serio *serio)
+{
+	struct fsia6b *fsia6b = serio_get_drvdata(serio);
+
+	serio_close(serio);
+	serio_set_drvdata(serio, NULL);
+	input_unregister_device(fsia6b->dev);
+	kfree(fsia6b);
+}
+
+static const struct serio_device_id fsia6b_serio_ids[] = {
+{
+	.type	= SERIO_RS232,
+	.proto	= SERIO_FSIA6B,
+	.id	= SERIO_ANY,
+	.extra	= SERIO_ANY,
+},
+{ 0 }
+};
+
+MODULE_DEVICE_TABLE(serio, fsia6b_serio_ids);
+
+struct serio_driver fsia6b_serio_drv = {
+	.driver		= {
+		.name	= "fsia6b"
+	},
+	.description	= DRIVER_DESC,
+	.id_table	= fsia6b_serio_ids,
+	.interrupt	= fsia6b_serio_irq,
+	.connect	= fsia6b_serio_connect,
+	.disconnect	= fsia6b_serio_disconnect
+};
+
+module_serio_driver(fsia6b_serio_drv)
diff --git a/include/uapi/linux/serio.h b/include/uapi/linux/serio.h
index a0cac1d8670d..50e991952c97 100644
--- a/include/uapi/linux/serio.h
+++ b/include/uapi/linux/serio.h
@@ -82,5 +82,6 @@
 #define SERIO_EGALAX	0x3f
 #define SERIO_PULSE8_CEC	0x40
 #define SERIO_RAINSHADOW_CEC	0x41
+#define SERIO_FSIA6B	0x42
 
 #endif /* _UAPI_SERIO_H */
-- 
2.22.0

