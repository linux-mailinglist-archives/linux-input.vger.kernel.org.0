Return-Path: <linux-input+bounces-4590-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 9265B914308
	for <lists+linux-input@lfdr.de>; Mon, 24 Jun 2024 08:54:15 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 146D41F238ED
	for <lists+linux-input@lfdr.de>; Mon, 24 Jun 2024 06:54:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 19D4D18AE4;
	Mon, 24 Jun 2024 06:54:10 +0000 (UTC)
X-Original-To: linux-input@vger.kernel.org
Received: from mail.loongson.cn (mail.loongson.cn [114.242.206.163])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1160A3B1A2
	for <linux-input@vger.kernel.org>; Mon, 24 Jun 2024 06:54:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=114.242.206.163
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719212050; cv=none; b=H5SXw3BbcetzIiiokYjrLm2a/TJiRK8SPg4HQ4Sbp+NkDX1CXpJbEeZy+rFHGkJY9Crs/5xAxtbzPNcSdzlGDiGMmYOpBSnD/mHDFDb2im7gc7kDvxCEBz7oPb7h9luzhQjG5kOFFrh4DhGnOrNSSA3GUjKDsmvVaFt1r7FWJ2A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719212050; c=relaxed/simple;
	bh=n/0KpZNq5y52oAFUzHeUx7g4v7KdwNA6NG302z2ckB0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=fj7LsBqothFBQVgtoaux1heYaTZcfstdg7Z3BRJnioQ7A6888/Ip0U1gY85SKyCrTnOHAeKlJHYSg8t0nQP2AMFIfYzdXIp0q1BpZzC9/LfNue+2qJ+VLRezTMNr+0KW2PpGDDjLpcO9eciESjClBDPA3mN+9kzweFHBwYk/FB4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn; spf=pass smtp.mailfrom=loongson.cn; arc=none smtp.client-ip=114.242.206.163
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=loongson.cn
Received: from loongson.cn (unknown [112.20.110.225])
	by gateway (Coremail) with SMTP id _____8Axz+sLGHlmAXAJAA--.22119S3;
	Mon, 24 Jun 2024 14:54:03 +0800 (CST)
Received: from localhost.localdomain (unknown [112.20.110.225])
	by localhost.localdomain (Coremail) with SMTP id AQAAf8CxZcUIGHlmOdUuAA--.35596S2;
	Mon, 24 Jun 2024 14:54:01 +0800 (CST)
From: Binbin Zhou <zhoubinbin@loongson.cn>
To: Binbin Zhou <zhoubb.aaron@gmail.com>,
	Huacai Chen <chenhuacai@loongson.cn>,
	Jon Xie <jon_xie@pixart.com>,
	Jay Lee <jay_lee@pixart.com>,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: Huacai Chen <chenhuacai@kernel.org>,
	loongson-kernel@lists.loongnix.cn,
	linux-input@vger.kernel.org,
	Xiaotian Wu <wuxiaotian@loongson.cn>,
	Binbin Zhou <zhoubinbin@loongson.cn>
Subject: [PATCH v2] Input: Add driver for PixArt PS/2 touchpad
Date: Mon, 24 Jun 2024 14:53:59 +0800
Message-ID: <20240624065359.2985060-1-zhoubinbin@loongson.cn>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:AQAAf8CxZcUIGHlmOdUuAA--.35596S2
X-CM-SenderInfo: p2kr3uplqex0o6or00hjvr0hdfq/
X-Coremail-Antispam: 1Uk129KBj9fXoW3Zr1fZFy5GF1rCrWxXF1rXwc_yoW8Jw1fCo
	WfArZIvw45tw13A3s8K3Wxt3W3WanFka93Zw4akrZ0vryUA34YgFyUtw1UJa13K34YqFs3
	Xrn3tr18Xr4fZrn5l-sFpf9Il3svdjkaLaAFLSUrUUUUbb8apTn2vfkv8UJUUUU8wcxFpf
	9Il3svdxBIdaVrn0xqx4xG64xvF2IEw4CE5I8CrVC2j2Jv73VFW2AGmfu7bjvjm3AaLaJ3
	UjIYCTnIWjp_UUUY17kC6x804xWl14x267AKxVWUJVW8JwAFc2x0x2IEx4CE42xK8VAvwI
	8IcIk0rVWrJVCq3wAFIxvE14AKwVWUXVWUAwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xG
	Y2AK021l84ACjcxK6xIIjxv20xvE14v26r1I6r4UM28EF7xvwVC0I7IYx2IY6xkF7I0E14
	v26r4j6F4UM28EF7xvwVC2z280aVAFwI0_Gr1j6F4UJwA2z4x0Y4vEx4A2jsIEc7CjxVAF
	wI0_Gr1j6F4UJwAS0I0E0xvYzxvE52x082IY62kv0487Mc804VCY07AIYIkI8VC2zVCFFI
	0UMc02F40EFcxC0VAKzVAqx4xG6I80ewAv7VC0I7IYx2IY67AKxVWUXVWUAwAv7VC2z280
	aVAFwI0_Jr0_Gr1lOx8S6xCaFVCjc4AY6r1j6r4UM4x0Y48IcxkI7VAKI48JMxAIw28Icx
	kI7VAKI48JMxC20s026xCaFVCjc4AY6r1j6r4UMI8I3I0E5I8CrVAFwI0_Jr0_Jr4lx2Iq
	xVCjr7xvwVAFwI0_JrI_JrWlx4CE17CEb7AF67AKxVWUtVW8ZwCIc40Y0x0EwIxGrwCI42
	IY6xIIjxv20xvE14v26r1j6r1xMIIF0xvE2Ix0cI8IcVCY1x0267AKxVWUJVW8JwCI42IY
	6xAIw20EY4v20xvaj40_Jr0_JF4lIxAIcVC2z280aVAFwI0_Jr0_Gr1lIxAIcVC2z280aV
	CY1x0267AKxVWUJVW8JbIYCTnIWIevJa73UjIFyTuYvjxU7_MaUUUUU

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
 drivers/input/mouse/pixart_ps2.c   | 267 +++++++++++++++++++++++++++++
 drivers/input/mouse/pixart_ps2.h   |  36 ++++
 drivers/input/mouse/psmouse-base.c |  17 ++
 drivers/input/mouse/psmouse.h      |   3 +-
 6 files changed, 335 insertions(+), 1 deletion(-)
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
index 000000000000..d1443a41a034
--- /dev/null
+++ b/drivers/input/mouse/pixart_ps2.c
@@ -0,0 +1,267 @@
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
index a2c9f7144864..5a4defe9cf32 100644
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


