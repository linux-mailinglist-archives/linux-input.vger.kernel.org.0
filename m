Return-Path: <linux-input+bounces-7635-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 075809AC1DF
	for <lists+linux-input@lfdr.de>; Wed, 23 Oct 2024 10:38:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 272DF1C24DC8
	for <lists+linux-input@lfdr.de>; Wed, 23 Oct 2024 08:38:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1FB4E15852E;
	Wed, 23 Oct 2024 08:38:18 +0000 (UTC)
X-Original-To: linux-input@vger.kernel.org
Received: from mail.loongson.cn (mail.loongson.cn [114.242.206.163])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8134A155A4E
	for <linux-input@vger.kernel.org>; Wed, 23 Oct 2024 08:38:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=114.242.206.163
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729672698; cv=none; b=AsWoJkbCThQdGyGzDQ8WQlFTNbLA/8twwzcGNj8gRh1oO8yrJjl6CcHJnXBAsUj1lXAeqjgr9YUm2jUFFCG++Qf0HojAG+Wjf+VlKTOUETWsojQy1feXBj35Zt7CX3RCY4d8u4qsjkGVOimZJI1tkpDMsxy87I0OJsED91fEyjc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729672698; c=relaxed/simple;
	bh=fvcow2VD19rrivpaOLJbSJgJWjeKfotOB+8uLyKeNwY=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=W+fRfTzsLGHEWI8z6jHrRzL4fVGAukIVqiGMORswlbWsH55eMJi8jDGDwYNT4tDuoDTZ8crVtI/Uqo7rR3pJB4pwiuozMLS89WeH73AA6KQvnIJYhogCPD/88HEFNtL3EF+J2OA8ACDYsYdat3OLTZ4rJ6s9ybMRN+nk05xjMUo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn; spf=pass smtp.mailfrom=loongson.cn; arc=none smtp.client-ip=114.242.206.163
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=loongson.cn
Received: from loongson.cn (unknown [223.64.68.52])
	by gateway (Coremail) with SMTP id _____8DxmeHxtRhn_Y8HAA--.17690S3;
	Wed, 23 Oct 2024 16:38:09 +0800 (CST)
Received: from localhost.localdomain (unknown [223.64.68.52])
	by front1 (Coremail) with SMTP id qMiowMCxS+DutRhndx8LAA--.64249S2;
	Wed, 23 Oct 2024 16:38:07 +0800 (CST)
From: Binbin Zhou <zhoubinbin@loongson.cn>
To: Binbin Zhou <zhoubb.aaron@gmail.com>,
	Huacai Chen <chenhuacai@loongson.cn>,
	Jon Xie <jon_xie@pixart.com>,
	Jay Lee <jay_lee@pixart.com>,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: Huacai Chen <chenhuacai@kernel.org>,
	linux-input@vger.kernel.org,
	Xiaotian Wu <wuxiaotian@loongson.cn>,
	Benjamin Tissoires <bentiss@kernel.org>,
	Binbin Zhou <zhoubinbin@loongson.cn>,
	Kexy Biscuit <kexybiscuit@aosc.io>
Subject: [PATCH v5] Input: Add driver for PixArt PS/2 touchpad
Date: Wed, 23 Oct 2024 16:38:05 +0800
Message-ID: <20241023083805.2164641-1-zhoubinbin@loongson.cn>
X-Mailer: git-send-email 2.43.5
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:qMiowMCxS+DutRhndx8LAA--.64249S2
X-CM-SenderInfo: p2kr3uplqex0o6or00hjvr0hdfq/
X-Coremail-Antispam: 1Uk129KBj9fXoWfJw1xXr1rZry5Kry3Cw15trc_yoW8Xr1Duo
	WfZrZxtw48tw1xA3s0k3Wxt3W3XanFka93Zw4YkrZ0vF10yryYgFyjyw1UJa13KrWYqFs3
	Jrn3tF48Xr4furn3l-sFpf9Il3svdjkaLaAFLSUrUUUUbb8apTn2vfkv8UJUUUU8wcxFpf
	9Il3svdxBIdaVrn0xqx4xG64xvF2IEw4CE5I8CrVC2j2Jv73VFW2AGmfu7bjvjm3AaLaJ3
	UjIYCTnIWjp_UUUY17kC6x804xWl14x267AKxVWUJVW8JwAFc2x0x2IEx4CE42xK8VAvwI
	8IcIk0rVWrJVCq3wAFIxvE14AKwVWUXVWUAwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xG
	Y2AK021l84ACjcxK6xIIjxv20xvE14v26r4j6ryUM28EF7xvwVC0I7IYx2IY6xkF7I0E14
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
Tested-by: Kexy Biscuit <kexybiscuit@aosc.io>
---
V5:
 - Rebased on input/for-linus;
 - Fix wide PixArt TP type judgment in pixart_read_tp_type().
   Each type has a unique FW return value to avoid non-pixart touchpads
   being misjudged.
 - Thanks to Kexy for testing on non-pixart devices.
   The List of tested touchpad devices:
     - TPPS/2(broken on V4)
     - SynPS/2 Synaptics TouchPad

Link to V4:
https://lore.kernel.org/all/20240704125243.3633569-1-zhoubinbin@loongson.cn/

V4:
 - Thanks Dmitry for the review.
   - Just return what ps2_command() reports, instead of replacing it with
     -EIO;
   - Refact pixart_read_tp_mode/pixart_read_tp_type(), to separate mode
     value and errors/success;
   - Pass the INPUT_MT_POINTER flag to input_mt_init_slots() and remove
     some redundant code, like the call to input_mt_report_finger_count()
     and the setting of bits in the touchpad section.

Link to V3:
https://lore.kernel.org/all/20240701094953.3195501-1-zhoubinbin@loongson.cn/

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
 drivers/input/mouse/pixart_ps2.c   | 310 +++++++++++++++++++++++++++++
 drivers/input/mouse/pixart_ps2.h   |  36 ++++
 drivers/input/mouse/psmouse-base.c |  17 ++
 drivers/input/mouse/psmouse.h      |   3 +-
 6 files changed, 378 insertions(+), 1 deletion(-)
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
index 000000000000..d5cd00936171
--- /dev/null
+++ b/drivers/input/mouse/pixart_ps2.c
@@ -0,0 +1,310 @@
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
+#include <linux/bitfield.h>
+#include <linux/delay.h>
+#include <linux/device.h>
+#include <linux/input.h>
+#include <linux/input/mt.h>
+#include <linux/libps2.h>
+#include <linux/serio.h>
+#include <linux/slab.h>
+
+#include "pixart_ps2.h"
+
+static int pixart_read_tp_mode(struct ps2dev *ps2dev, u8 *mode)
+{
+	int error;
+	u8 param[1] = { 0 };
+
+	error = ps2_command(ps2dev, param, PIXART_CMD_REPORT_FORMAT);
+	if (error)
+		return error;
+
+	*mode = param[0] == 1 ? PIXART_MODE_ABS : PIXART_MODE_REL;
+
+	return 0;
+}
+
+static int pixart_read_tp_type(struct ps2dev *ps2dev, u8 *type)
+{
+	int error;
+	u8 param[3] = { 0 };
+
+	param[0] = 0xa;
+	error = ps2_command(ps2dev, param, PSMOUSE_CMD_SETRATE);
+	if (error)
+		return error;
+
+	param[0] = 0x0;
+	error = ps2_command(ps2dev, param, PSMOUSE_CMD_SETRES);
+	if (error)
+		return error;
+
+	error = ps2_command(ps2dev, param, PSMOUSE_CMD_SETRES);
+	if (error)
+		return error;
+
+	error = ps2_command(ps2dev, param, PSMOUSE_CMD_SETRES);
+	if (error)
+		return error;
+
+	param[0] = 0x3;
+	error = ps2_command(ps2dev, param, PSMOUSE_CMD_SETRES);
+	if (error)
+		return error;
+
+	error = ps2_command(ps2dev, param, PSMOUSE_CMD_GETINFO);
+	if (error)
+		return error;
+
+	switch (param[0]) {
+	case 0xc:
+		*type = PIXART_TYPE_CLICKPAD;
+		break;
+	case 0xe:
+		*type = PIXART_TYPE_TOUCHPAD;
+		break;
+	default:
+		return -EIO;
+	}
+
+	return 0;
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
+	const u8 *pkt = psmouse->packet;
+	unsigned int contact_cnt = FIELD_GET(CONTACT_CNT_MASK, pkt[0]);
+	unsigned int i, id, abs_x, abs_y;
+	bool tip;
+
+	for (i = 0; i < contact_cnt; i++) {
+		const u8 *p = &pkt[i * 3];
+
+		id = FIELD_GET(SLOT_ID_MASK, p[3]);
+		abs_y = FIELD_GET(ABS_Y_MASK, p[3]) << 8 | p[1];
+		abs_x = FIELD_GET(ABS_X_MASK, p[3]) << 8 | p[2];
+
+		if (i == PIXART_MAX_FINGERS - 1)
+			tip = pkt[14] & BIT(1);
+		else
+			tip = pkt[3 * contact_cnt + 1] & BIT(2 * i + 1);
+
+		input_mt_slot(dev, id);
+		if (input_mt_report_slot_state(dev, MT_TOOL_FINGER, tip)) {
+			input_report_abs(dev, ABS_MT_POSITION_Y, abs_y);
+			input_report_abs(dev, ABS_MT_POSITION_X, abs_x);
+		}
+	}
+
+	input_mt_sync_frame(dev);
+
+	if (priv->type == PIXART_TYPE_CLICKPAD) {
+		input_report_key(dev, BTN_LEFT, pkt[0] & 0x03);
+	} else {
+		input_report_key(dev, BTN_LEFT, pkt[0] & BIT(0));
+		input_report_key(dev, BTN_RIGHT, pkt[0] & BIT(1));
+	}
+
+	input_sync(dev);
+}
+
+static psmouse_ret_t pixart_protocol_handler(struct psmouse *psmouse)
+{
+	u8 *pkt = psmouse->packet;
+	u8 contact_cnt;
+
+	if ((pkt[0] & 0x8c) != 0x80)
+		return PSMOUSE_BAD_DATA;
+
+	contact_cnt = FIELD_GET(CONTACT_CNT_MASK, pkt[0]);
+	if (contact_cnt > PIXART_MAX_FINGERS)
+		return PSMOUSE_BAD_DATA;
+
+	if (contact_cnt == PIXART_MAX_FINGERS &&
+	    psmouse->pktcnt < psmouse->pktsize) {
+		return PSMOUSE_GOOD_DATA;
+	}
+
+	if (contact_cnt == 0 && psmouse->pktcnt < 5)
+		return PSMOUSE_GOOD_DATA;
+
+	if (psmouse->pktcnt < 3 * contact_cnt + 2)
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
+	struct ps2dev *ps2dev = &psmouse->ps2dev;
+	u8 mode;
+	int error;
+
+	pixart_reset(psmouse);
+
+	error = pixart_read_tp_mode(ps2dev, &mode);
+	if (error)
+		return error;
+
+	if (mode != PIXART_MODE_ABS)
+		return -EIO;
+
+	error = ps2_command(ps2dev, NULL, PIXART_CMD_SWITCH_PROTO);
+	if (error)
+		return error;
+
+	return 0;
+}
+
+static int pixart_set_input_params(struct input_dev *dev,
+				   struct pixart_data *priv)
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
+	/* Absolute position */
+	input_set_abs_params(dev, ABS_X, 0, PIXART_PAD_WIDTH, 0, 0);
+	input_set_abs_params(dev, ABS_Y, 0, PIXART_PAD_HEIGHT, 0, 0);
+
+	input_set_abs_params(dev, ABS_MT_POSITION_X,
+			     0, PIXART_PAD_WIDTH, 0, 0);
+	input_set_abs_params(dev, ABS_MT_POSITION_Y,
+			     0, PIXART_PAD_HEIGHT, 0, 0);
+
+	return input_mt_init_slots(dev, PIXART_MAX_FINGERS,
+				   INPUT_MT_POINTER | INPUT_MT_DROP_UNUSED);
+}
+
+static int pixart_query_hardware(struct ps2dev *ps2dev, u8 *mode, u8 *type)
+{
+	int error;
+
+	error = pixart_read_tp_type(ps2dev, type);
+	if (error)
+		return error;
+
+	error = pixart_read_tp_mode(ps2dev, mode);
+	if (error)
+		return error;
+
+	return 0;
+}
+
+int pixart_detect(struct psmouse *psmouse, bool set_properties)
+{
+	u8 type;
+	int error;
+
+	pixart_reset(psmouse);
+
+	error = pixart_read_tp_type(&psmouse->ps2dev, &type);
+	if (error)
+		return error;
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
+	int error;
+	struct pixart_data *priv;
+
+	priv = kzalloc(sizeof(*priv), GFP_KERNEL);
+	if (!priv)
+		return -ENOMEM;
+
+	psmouse->private = priv;
+	pixart_reset(psmouse);
+
+	error = pixart_query_hardware(&psmouse->ps2dev,
+				      &priv->mode, &priv->type);
+	if (error) {
+		psmouse_err(psmouse, "init: Unable to query PixArt touchpad hardware.\n");
+		goto err_exit;
+	}
+
+	/* Relative mode follows standard PS/2 mouse protocol */
+	if (priv->mode != PIXART_MODE_ABS) {
+		error = -EIO;
+		goto err_exit;
+	}
+
+	/* Set absolute mode */
+	error = ps2_command(&psmouse->ps2dev, NULL, PIXART_CMD_SWITCH_PROTO);
+	if (error) {
+		psmouse_err(psmouse, "init: Unable to initialize PixArt absolute mode.\n");
+		goto err_exit;
+	}
+
+	error = pixart_set_input_params(psmouse->dev, priv);
+	if (error) {
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
+	return error;
+}
diff --git a/drivers/input/mouse/pixart_ps2.h b/drivers/input/mouse/pixart_ps2.h
new file mode 100644
index 000000000000..47a1d040f2d1
--- /dev/null
+++ b/drivers/input/mouse/pixart_ps2.h
@@ -0,0 +1,36 @@
+/* SPDX-License-Identifier: GPL-2.0-or-later */
+#ifndef _PIXART_PS2_H
+#define _PIXART_PS2_H
+
+#include "psmouse.h"
+
+#define PIXART_PAD_WIDTH		1023
+#define PIXART_PAD_HEIGHT		579
+#define PIXART_MAX_FINGERS		4
+
+#define PIXART_CMD_REPORT_FORMAT	0x01d8
+#define PIXART_CMD_SWITCH_PROTO		0x00de
+
+#define PIXART_MODE_REL			0
+#define PIXART_MODE_ABS			1
+
+#define PIXART_TYPE_CLICKPAD		0
+#define PIXART_TYPE_TOUCHPAD		1
+
+#define CONTACT_CNT_MASK		GENMASK(6, 4)
+
+#define SLOT_ID_MASK			GENMASK(2, 0)
+#define ABS_Y_MASK			GENMASK(5, 4)
+#define ABS_X_MASK			GENMASK(7, 6)
+
+struct pixart_data {
+	u8 mode;
+	u8 type;
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

base-commit: 2de01e0e57f3ebe7f90b08f6bca5ce0f3da3829f
-- 
2.43.5


