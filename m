Return-Path: <linux-input+bounces-4754-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8DDC391DBBE
	for <lists+linux-input@lfdr.de>; Mon,  1 Jul 2024 11:50:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id B10331C21527
	for <lists+linux-input@lfdr.de>; Mon,  1 Jul 2024 09:50:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6194B4F606;
	Mon,  1 Jul 2024 09:50:16 +0000 (UTC)
X-Original-To: linux-input@vger.kernel.org
Received: from mail.loongson.cn (mail.loongson.cn [114.242.206.163])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1F92C2C859
	for <linux-input@vger.kernel.org>; Mon,  1 Jul 2024 09:50:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=114.242.206.163
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719827416; cv=none; b=oBO9X5yk0vWkLWuCY9EY9Qb5870p23z109CJhh08WWKYxRv8wd+IxlF5xOTp1cL9440EEIqJ6mzF9shBxLCS5Ab0HeeJNBqhcQvrAZV1VvPw5XT/s5TPhgEW1kQrQeW9KwiheJwf8FVEwaI+iLQysftMSaB9aR6P1csxfTXaD24=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719827416; c=relaxed/simple;
	bh=BZkFzLCJpLC/uMxm6UNIRTiwk+8oHo+9LO8RxGxmvcE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=JIRrMeL313uEJt3lMWE4GvIqtDRE8VBYUvSuF8m4v27s3dasYWdSRgevGj7YEJwj1IkCyHn/DfkAYIJHhpU1Zzl+ub2MuwAdtSPKpf6ZnrnyvGrYIYLPUVR4NceXcBBjdoOGsEkSsbMqEuClJBurwa51cM9B4gSt1vam7VVPiak=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn; spf=pass smtp.mailfrom=loongson.cn; arc=none smtp.client-ip=114.242.206.163
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=loongson.cn
Received: from loongson.cn (unknown [223.64.68.45])
	by gateway (Coremail) with SMTP id _____8DxDevPe4Jmr9oLAA--.45737S3;
	Mon, 01 Jul 2024 17:50:08 +0800 (CST)
Received: from localhost.localdomain (unknown [223.64.68.45])
	by localhost.localdomain (Coremail) with SMTP id AQAAf8Axw8TMe4JmS1s3AA--.52601S2;
	Mon, 01 Jul 2024 17:50:05 +0800 (CST)
From: Binbin Zhou <zhoubinbin@loongson.cn>
To: Binbin Zhou <zhoubb.aaron@gmail.com>,
	Huacai Chen <chenhuacai@loongson.cn>,
	Jon Xie <jon_xie@pixart.com>,
	Jay Lee <jay_lee@pixart.com>,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: Huacai Chen <chenhuacai@kernel.org>,
	linux-input@vger.kernel.org,
	Xiaotian Wu <wuxiaotian@loongson.cn>,
	Binbin Zhou <zhoubinbin@loongson.cn>
Subject: [PATCH v3] Input: Add driver for PixArt PS/2 touchpad
Date: Mon,  1 Jul 2024 17:49:53 +0800
Message-ID: <20240701094953.3195501-1-zhoubinbin@loongson.cn>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:AQAAf8Axw8TMe4JmS1s3AA--.52601S2
X-CM-SenderInfo: p2kr3uplqex0o6or00hjvr0hdfq/
X-Coremail-Antispam: 1Uk129KBj9fXoWfJw1xXr1rZry5tF15KrWkKrX_yoW8Gr45Zo
	WfArZIvw45tw13A3s8K3Wxt3W3WanFka93Zw4akrZ0vryUAryYgFyUtw1UJa13K34YqFs3
	Xrn3tr18XF4fZrn5l-sFpf9Il3svdjkaLaAFLSUrUUUU1b8apTn2vfkv8UJUUUU8wcxFpf
	9Il3svdxBIdaVrn0xqx4xG64xvF2IEw4CE5I8CrVC2j2Jv73VFW2AGmfu7bjvjm3AaLaJ3
	UjIYCTnIWjp_UUUYA7kC6x804xWl14x267AKxVWUJVW8JwAFc2x0x2IEx4CE42xK8VAvwI
	8IcIk0rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xG
	Y2AK021l84ACjcxK6xIIjxv20xvE14v26r4j6ryUM28EF7xvwVC0I7IYx2IY6xkF7I0E14
	v26r4j6F4UM28EF7xvwVC2z280aVAFwI0_Gr1j6F4UJwA2z4x0Y4vEx4A2jsIEc7CjxVAF
	wI0_Gr1j6F4UJwAaw2AFwI0_Jrv_JF1le2I262IYc4CY6c8Ij28IcVAaY2xG8wAqjxCEc2
	xF0cIa020Ex4CE44I27wAqx4xG64xvF2IEw4CE5I8CrVC2j2WlYx0E2Ix0cI8IcVAFwI0_
	Jrv_JF1lYx0Ex4A2jsIE14v26r1j6r4UMcvjeVCFs4IE7xkEbVWUJVW8JwACjcxG0xvY0x
	0EwIxGrwCY1x0262kKe7AKxVWUAVWUtwCF04k20xvY0x0EwIxGrwCFx2IqxVCFs4IE7xkE
	bVWUJVW8JwCFI7km07C267AKxVWUXVWUAwC20s026c02F40E14v26r1j6r18MI8I3I0E74
	80Y4vE14v26r106r1rMI8E67AF67kF1VAFwI0_Jw0_GFylIxkGc2Ij64vIr41lIxAIcVC0
	I7IYx2IY67AKxVWUJVWUCwCI42IY6xIIjxv20xvEc7CjxVAFwI0_Jr0_Gr1lIxAIcVCF04
	k26cxKx2IYs7xG6r1j6r1xMIIF0xvEx4A2jsIE14v26r1j6r4UMIIF0xvEx4A2jsIEc7Cj
	xVAFwI0_Jr0_GrUvcSsGvfC2KfnxnUUI43ZEXa7IU8zyIUUUUUU==

This patch introduces a driver for the PixArt PS/2 touchpad, which
supports both clickpad and touchpad types.

At the same time, we extended the single data packet length to 16,
because according to the current PixArt hardware and FW design, we need
11 bytes/15 bytes to represent the complete three-finger/four-finger data.

Co-developed-by: Jon Xie <jon_xie@pixart.com>
Signed-off-by: Jon Xie <jon_xie@pixart.com>
Co-developed-by: Jay Lee <jay_lee@pixart.com>
Signed-off-by: Jay Lee <jay_lee@pixart.com>
Signed-off-by: Binbin Zhou <zhoubinbin@loongson.cn>
---
V3:
 - Rebased on input/next;
 - Added comment to msleep() in pixart_reset() as suggested by Aseda, no
functional change, thanks.

Link to V2:
https://lore.kernel.org/all/20240624065359.2985060-1-zhoubinbin@loongson.cn/

V2:
 - Rebased on input/next;
 - Merge two patches from the V1 patchset;
 - Initialize local variables to prevent random garbage;
 - Remove some noisy debug message;
 - Check ps2_command() return value;
 - Use macros to represent bit operations for better readability, such
   as abs_x;
 - Remove the code related to rel packets, for the normal
   intellimouse detection is well in PixArt.

Link to V1:
https://lore.kernel.org/all/cover.1715224143.git.zhoubinbin@loongson.cn/

 drivers/input/mouse/Kconfig        |  12 ++
 drivers/input/mouse/Makefile       |   1 +
 drivers/input/mouse/pixart_ps2.c   | 269 +++++++++++++++++++++++++++++
 drivers/input/mouse/pixart_ps2.h   |  36 ++++
 drivers/input/mouse/psmouse-base.c |  17 ++
 drivers/input/mouse/psmouse.h      |   3 +-
 6 files changed, 337 insertions(+), 1 deletion(-)
 create mode 100644 drivers/input/mouse/pixart_ps2.c
 create mode 100644 drivers/input/mouse/pixart_ps2.h

diff --git a/drivers/input/mouse/Kconfig b/drivers/input/mouse/Kconfig
index 833b643f0616..8a27a20d04b0 100644
--- a/drivers/input/mouse/Kconfig
+++ b/drivers/input/mouse/Kconfig
@@ -69,6 +69,18 @@ config MOUSE_PS2_LOGIPS2PP
 
 	  If unsure, say Y.
 
+config MOUSE_PS2_PIXART
+	bool "PixArt PS/2 touchpad protocol extension" if EXPERT
+	default y
+	depends on MOUSE_PS2
+	help
+	  This driver supports the PixArt PS/2 touchpad found in some
+	  laptops.
+	  Say Y here if you have a PixArt PS/2 TouchPad connected to
+	  your system.
+
+	  If unsure, say Y.
+
 config MOUSE_PS2_SYNAPTICS
 	bool "Synaptics PS/2 mouse protocol extension" if EXPERT
 	default y
diff --git a/drivers/input/mouse/Makefile b/drivers/input/mouse/Makefile
index a1336d5bee6f..563029551529 100644
--- a/drivers/input/mouse/Makefile
+++ b/drivers/input/mouse/Makefile
@@ -32,6 +32,7 @@ psmouse-$(CONFIG_MOUSE_PS2_ELANTECH)	+= elantech.o
 psmouse-$(CONFIG_MOUSE_PS2_OLPC)	+= hgpk.o
 psmouse-$(CONFIG_MOUSE_PS2_LOGIPS2PP)	+= logips2pp.o
 psmouse-$(CONFIG_MOUSE_PS2_LIFEBOOK)	+= lifebook.o
+psmouse-$(CONFIG_MOUSE_PS2_PIXART)	+= pixart_ps2.o
 psmouse-$(CONFIG_MOUSE_PS2_SENTELIC)	+= sentelic.o
 psmouse-$(CONFIG_MOUSE_PS2_TRACKPOINT)	+= trackpoint.o
 psmouse-$(CONFIG_MOUSE_PS2_TOUCHKIT)	+= touchkit_ps2.o
diff --git a/drivers/input/mouse/pixart_ps2.c b/drivers/input/mouse/pixart_ps2.c
new file mode 100644
index 000000000000..a089beb2b00e
--- /dev/null
+++ b/drivers/input/mouse/pixart_ps2.c
@@ -0,0 +1,269 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+/*
+ * Pixart Touchpad Controller 1336U PS2 driver
+ *
+ * Author: Jon Xie <jon_xie@pixart.com>
+ *         Jay Lee <jay_lee@pixart.com>
+ * Further cleanup and restructuring by:
+ *         Binbin Zhou <zhoubinbin@loongson.cn>
+ *
+ * Copyright (C) 2021-2024 Pixart Imaging.
+ * Copyright (C) 2024 Loongson Technology Corporation Limited.
+ *
+ */
+
+#include <linux/delay.h>
+#include <linux/device.h>
+#include <linux/libps2.h>
+#include <linux/input/mt.h>
+#include <linux/serio.h>
+#include <linux/slab.h>
+
+#include "pixart_ps2.h"
+
+static int pixart_read_tp_mode(struct psmouse *psmouse)
+{
+	struct ps2dev *ps2dev = &psmouse->ps2dev;
+	u8 param[1] = { 0 };
+
+	if (ps2_command(ps2dev, param, PIXART_CMD_REPORT_FORMAT))
+		return -EIO;
+
+	return (param[0] == 1) ? PIXART_MODE_ABS : PIXART_MODE_REL;
+}
+
+static int pixart_read_tp_type(struct psmouse *psmouse)
+{
+	struct ps2dev *ps2dev = &psmouse->ps2dev;
+	u8 param[3] = { 0 };
+
+	param[0] = 0x0a;
+	if (ps2_command(ps2dev, param, PSMOUSE_CMD_SETRATE))
+		return -EIO;
+
+	param[0] = 0x0;
+	if (ps2_command(ps2dev, param, PSMOUSE_CMD_SETRES))
+		return -EIO;
+	if (ps2_command(ps2dev, param, PSMOUSE_CMD_SETRES))
+		return -EIO;
+	if (ps2_command(ps2dev, param, PSMOUSE_CMD_SETRES))
+		return -EIO;
+
+	param[0] = 0x03;
+	if (ps2_command(ps2dev, param, PSMOUSE_CMD_SETRES))
+		return -EIO;
+
+	if (ps2_command(ps2dev, param, PSMOUSE_CMD_GETINFO))
+		return -EIO;
+
+	return (param[0] == 0x0e) ? PIXART_TYPE_TOUCHPAD : PIXART_TYPE_CLICKPAD;
+}
+
+static void pixart_reset(struct psmouse *psmouse)
+{
+	ps2_command(&psmouse->ps2dev, NULL, PSMOUSE_CMD_RESET_DIS);
+
+	/* according to PixArt, 100ms is required for the upcoming reset */
+	msleep(100);
+	psmouse_reset(psmouse);
+}
+
+static void pixart_process_packet(struct psmouse *psmouse)
+{
+	struct pixart_data *priv = psmouse->private;
+	struct input_dev *dev = psmouse->dev;
+	int i, id, fingers = 0, abs_x, abs_y;
+	u8 *pkt = psmouse->packet;
+	u8 contact_cnt = CONTACT_CNT(pkt[0]);
+	bool tip;
+
+	for (i = 0; i < contact_cnt; i++) {
+		id = SLOT_ID_MASK(pkt[3 * i + 3]);
+		abs_y = ABS_Y_MASK(pkt[3 * i + 3]) | pkt[3 * i + 1];
+		abs_x = ABS_X_MASK(pkt[3 * i + 3]) | pkt[3 * i + 2];
+
+		if (i == PIXART_MAX_FINGERS - 1)
+			tip = pkt[14] & BIT(1);
+		else
+			tip = pkt[3 * contact_cnt + 1] & (0x01 << (2 * i + 1));
+
+		input_mt_slot(dev, id);
+		if (input_mt_report_slot_state(dev, MT_TOOL_FINGER, tip)) {
+			fingers++;
+			input_report_abs(dev, ABS_MT_POSITION_Y, abs_y);
+			input_report_abs(dev, ABS_MT_POSITION_X, abs_x);
+		}
+	}
+
+	input_mt_sync_frame(dev);
+	input_mt_report_finger_count(dev, fingers);
+
+	if (priv->type == PIXART_TYPE_CLICKPAD) {
+		input_report_key(dev, BTN_LEFT, pkt[0] & 0x03);
+	} else {
+		input_report_key(dev, BTN_LEFT, pkt[0] & 0x01);
+		input_report_key(dev, BTN_RIGHT, pkt[0] & 0x02);
+	}
+
+	input_sync(dev);
+}
+
+static psmouse_ret_t pixart_protocol_handler(struct psmouse *psmouse)
+{
+	u8 *pkt = psmouse->packet;
+	u8 contact_cnt = CONTACT_CNT(pkt[0]);
+
+	if (contact_cnt > PIXART_MAX_FINGERS || ((pkt[0] & 0x8c) != 0x80))
+		return PSMOUSE_BAD_DATA;
+
+	if (contact_cnt == PIXART_MAX_FINGERS && psmouse->pktcnt < psmouse->pktsize)
+		return PSMOUSE_GOOD_DATA;
+
+	if (contact_cnt == 0 && psmouse->pktcnt < 5)
+		return PSMOUSE_GOOD_DATA;
+
+	if (psmouse->pktcnt < (3 * contact_cnt + 2))
+		return PSMOUSE_GOOD_DATA;
+
+	pixart_process_packet(psmouse);
+
+	return PSMOUSE_FULL_PACKET;
+}
+
+static void pixart_disconnect(struct psmouse *psmouse)
+{
+	pixart_reset(psmouse);
+	kfree(psmouse->private);
+	psmouse->private = NULL;
+}
+
+static int pixart_reconnect(struct psmouse *psmouse)
+{
+	int mode;
+
+	pixart_reset(psmouse);
+	mode = pixart_read_tp_mode(psmouse);
+	if (mode != PIXART_MODE_ABS)
+		return mode;
+
+	if (ps2_command(&psmouse->ps2dev, NULL, PIXART_CMD_SWITCH_PROTO))
+		return -EIO;
+
+	return 0;
+}
+
+static int pixart_set_input_params(struct input_dev *dev, struct pixart_data *priv)
+{
+	/* No relative support */
+	__clear_bit(EV_REL, dev->evbit);
+	__clear_bit(REL_X, dev->relbit);
+	__clear_bit(REL_Y, dev->relbit);
+	__clear_bit(BTN_MIDDLE, dev->keybit);
+
+	/* Buttons */
+	__set_bit(EV_KEY, dev->evbit);
+	__set_bit(BTN_LEFT, dev->keybit);
+	if (priv->type == PIXART_TYPE_CLICKPAD)
+		__set_bit(INPUT_PROP_BUTTONPAD, dev->propbit);
+	else
+		__set_bit(BTN_RIGHT, dev->keybit);
+
+	/* Touchpad */
+	__set_bit(BTN_TOUCH, dev->keybit);
+	__set_bit(BTN_TOOL_FINGER, dev->keybit);
+	__set_bit(BTN_TOOL_DOUBLETAP, dev->keybit);
+	__set_bit(BTN_TOOL_TRIPLETAP, dev->keybit);
+	__set_bit(BTN_TOOL_QUADTAP, dev->keybit);
+	__set_bit(INPUT_PROP_POINTER, dev->propbit);
+
+	/* Absolute position */
+	__set_bit(EV_ABS, dev->evbit);
+	input_set_abs_params(dev, ABS_X, 0, PIXART_PAD_WIDTH, 0, 0);
+	input_set_abs_params(dev, ABS_Y, 0, PIXART_PAD_HEIGHT, 0, 0);
+
+	input_set_abs_params(dev, ABS_MT_POSITION_X, 0, PIXART_PAD_WIDTH, 0, 0);
+	input_set_abs_params(dev, ABS_MT_POSITION_Y, 0, PIXART_PAD_HEIGHT, 0, 0);
+
+	return input_mt_init_slots(dev, PIXART_SLOTS_NUM, 0);
+}
+
+static int pixart_query_hardware(struct psmouse *psmouse)
+{
+	struct pixart_data *priv = psmouse->private;
+
+	priv->type = pixart_read_tp_type(psmouse);
+	if (priv->type < 0)
+		return -EIO;
+
+	priv->mode = pixart_read_tp_mode(psmouse);
+	if (priv->mode < 0)
+		return -EIO;
+
+	return 0;
+}
+
+int pixart_detect(struct psmouse *psmouse, bool set_properties)
+{
+	int type;
+
+	pixart_reset(psmouse);
+	type = pixart_read_tp_type(psmouse);
+	if (type < 0)
+		return -EIO;
+
+	if (set_properties) {
+		psmouse->vendor = "PixArt";
+		psmouse->name = (type == PIXART_TYPE_TOUCHPAD) ?
+				"touchpad" : "clickpad";
+	}
+
+	return 0;
+}
+
+int pixart_init(struct psmouse *psmouse)
+{
+	struct pixart_data *priv;
+
+	priv = kzalloc(sizeof(*priv), GFP_KERNEL);
+	if (!priv)
+		return -ENOMEM;
+
+	psmouse->private = priv;
+	pixart_reset(psmouse);
+
+	if (pixart_query_hardware(psmouse)) {
+		psmouse_err(psmouse, "Unable to query PixArt touchpad hardware.\n");
+		goto err_exit;
+	}
+
+	/* Relative mode follows standard PS/2 mouse protocol */
+	if (priv->mode != PIXART_MODE_ABS)
+		goto err_exit;
+
+	/* Set absolute mode */
+	if (ps2_command(&psmouse->ps2dev, NULL, PIXART_CMD_SWITCH_PROTO)) {
+		psmouse_err(psmouse, "init: Unable to initialize PixArt absolute mode.\n");
+		goto err_exit;
+	}
+
+	if (pixart_set_input_params(psmouse->dev, priv) < 0) {
+		psmouse_err(psmouse, "init: Unable to set input params.\n");
+		goto err_exit;
+	}
+
+	psmouse->pktsize = 15;
+	psmouse->protocol_handler = pixart_protocol_handler;
+	psmouse->disconnect = pixart_disconnect;
+	psmouse->reconnect = pixart_reconnect;
+	psmouse->cleanup = pixart_reset;
+	/* resync is not supported yet */
+	psmouse->resync_time = 0;
+
+	return 0;
+
+err_exit:
+	pixart_reset(psmouse);
+	kfree(priv);
+	psmouse->private = NULL;
+	return -EIO;
+}
diff --git a/drivers/input/mouse/pixart_ps2.h b/drivers/input/mouse/pixart_ps2.h
new file mode 100644
index 000000000000..f7f16cb9fbb0
--- /dev/null
+++ b/drivers/input/mouse/pixart_ps2.h
@@ -0,0 +1,36 @@
+/* SPDX-License-Identifier: GPL-2.0-or-later */
+#ifndef _PIXART_PS2_H
+#define _PIXART_PS2_H
+
+#include "psmouse.h"
+
+#define PIXART_PAD_WIDTH	1023
+#define PIXART_PAD_HEIGHT	579
+#define PIXART_MAX_FINGERS	4
+#define PIXART_SLOTS_NUM	PIXART_MAX_FINGERS
+
+#define PIXART_CMD_REPORT_FORMAT	0x01d8
+#define PIXART_CMD_SWITCH_PROTO		0x00de
+
+#define PIXART_MODE_REL	0
+#define PIXART_MODE_ABS	1
+
+#define PIXART_TYPE_CLICKPAD	0
+#define PIXART_TYPE_TOUCHPAD	1
+
+#define CONTACT_CNT(m)	(((m) & GENMASK(6, 4)) >> 4)
+#define SLOT_ID_MASK(m)	((m) & GENMASK(2, 0))
+#define ABS_Y_MASK(m)	(((m) & GENMASK(5, 4)) << 4)
+#define ABS_X_MASK(m)	(((m) & GENMASK(7, 6)) << 2)
+
+struct pixart_data {
+	int mode;
+	int type;
+	int x_max;
+	int y_max;
+};
+
+int pixart_detect(struct psmouse *psmouse, bool set_properties);
+int pixart_init(struct psmouse *psmouse);
+
+#endif  /* _PIXART_PS2_H */
diff --git a/drivers/input/mouse/psmouse-base.c b/drivers/input/mouse/psmouse-base.c
index a0aac76b1e41..41af3460077d 100644
--- a/drivers/input/mouse/psmouse-base.c
+++ b/drivers/input/mouse/psmouse-base.c
@@ -36,6 +36,7 @@
 #include "focaltech.h"
 #include "vmmouse.h"
 #include "byd.h"
+#include "pixart_ps2.h"
 
 #define DRIVER_DESC	"PS/2 mouse driver"
 
@@ -905,6 +906,15 @@ static const struct psmouse_protocol psmouse_protocols[] = {
 		.detect		= byd_detect,
 		.init		= byd_init,
 	},
+#endif
+#ifdef CONFIG_MOUSE_PS2_PIXART
+	{
+		.type		= PSMOUSE_PIXART,
+		.name		= "PixArtPS/2",
+		.alias		= "pixart",
+		.detect		= pixart_detect,
+		.init		= pixart_init,
+	},
 #endif
 	{
 		.type		= PSMOUSE_AUTO,
@@ -1172,6 +1182,13 @@ static int psmouse_extensions(struct psmouse *psmouse,
 			return ret;
 	}
 
+	/* Try PixArt touchpad */
+	if (max_proto > PSMOUSE_IMEX &&
+	    psmouse_try_protocol(psmouse, PSMOUSE_PIXART, &max_proto,
+				 set_properties, true)) {
+		return PSMOUSE_PIXART;
+	}
+
 	if (max_proto > PSMOUSE_IMEX) {
 		if (psmouse_try_protocol(psmouse, PSMOUSE_GENPS,
 					 &max_proto, set_properties, true))
diff --git a/drivers/input/mouse/psmouse.h b/drivers/input/mouse/psmouse.h
index 4d8acfe0d82a..23f7fa7243cb 100644
--- a/drivers/input/mouse/psmouse.h
+++ b/drivers/input/mouse/psmouse.h
@@ -69,6 +69,7 @@ enum psmouse_type {
 	PSMOUSE_BYD,
 	PSMOUSE_SYNAPTICS_SMBUS,
 	PSMOUSE_ELANTECH_SMBUS,
+	PSMOUSE_PIXART,
 	PSMOUSE_AUTO		/* This one should always be last */
 };
 
@@ -94,7 +95,7 @@ struct psmouse {
 	const char *vendor;
 	const char *name;
 	const struct psmouse_protocol *protocol;
-	unsigned char packet[8];
+	unsigned char packet[16];
 	unsigned char badbyte;
 	unsigned char pktcnt;
 	unsigned char pktsize;
-- 
2.43.0


