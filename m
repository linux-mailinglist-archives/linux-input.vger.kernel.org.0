Return-Path: <linux-input+bounces-3713-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id B36E68C6346
	for <lists+linux-input@lfdr.de>; Wed, 15 May 2024 11:00:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id D678B1C22612
	for <lists+linux-input@lfdr.de>; Wed, 15 May 2024 09:00:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 370535A7AB;
	Wed, 15 May 2024 08:59:23 +0000 (UTC)
X-Original-To: linux-input@vger.kernel.org
Received: from mail.loongson.cn (mail.loongson.cn [114.242.206.163])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AA93E5A4D1
	for <linux-input@vger.kernel.org>; Wed, 15 May 2024 08:59:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=114.242.206.163
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715763563; cv=none; b=ENZ0EAJLg94ND07r9x4Qom1b53PybZf4X4bOQUTpIga4qif00Rs0QJmNAXPwCtGJaktFmakq8+bQXnn377DKQC/SFrUcNStZeVOTOcX5RpJj8L/uuk6IDn03mEHah6tQAGq/BTe1ll/BsQcLqafGuazyIKEKXVL+guwntYaJP6U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715763563; c=relaxed/simple;
	bh=2/yYIWPsSGH2OZqPh/PkrHYnrpNTzy94dhgZnx28L3g=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=mWDpPKKKD8QBC+3qj0fx7dMECHB2iLCORItz4DTmRbfOBVfZ45wtBhU4PXxHzrEXaNCldpnKhwtpJ5FyFV0am1SxfuTqP3MKKo3yHjawOHNX1lbCVra7ha2W1sN6yLPlfcWQdMq02tL/ELKrlEGYIieBuNokCM18DIqSeqjZpIQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn; spf=pass smtp.mailfrom=loongson.cn; arc=none smtp.client-ip=114.242.206.163
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=loongson.cn
Received: from loongson.cn (unknown [112.20.112.247])
	by gateway (Coremail) with SMTP id _____8AxpOpjeURm9gANAA--.19029S3;
	Wed, 15 May 2024 16:59:15 +0800 (CST)
Received: from localhost.localdomain (unknown [112.20.112.247])
	by localhost.localdomain (Coremail) with SMTP id AQAAf8Cx67pceURmwn0gAA--.0S4;
	Wed, 15 May 2024 16:59:12 +0800 (CST)
From: Binbin Zhou <zhoubinbin@loongson.cn>
To: Binbin Zhou <zhoubb.aaron@gmail.com>,
	Huacai Chen <chenhuacai@loongson.cn>,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: Huacai Chen <chenhuacai@kernel.org>,
	loongson-kernel@lists.loongnix.cn,
	linux-input@vger.kernel.org,
	Xiaotian Wu <wuxiaotian@loongson.cn>,
	Binbin Zhou <zhoubinbin@loongson.cn>,
	Jon Xie <jon_xie@pixart.com>,
	Jay Lee <jay_lee@pixart.com>
Subject: [PATCH v1 2/2] Input: Add driver for PixArt PS/2 touchpad
Date: Wed, 15 May 2024 16:58:57 +0800
Message-ID: <c200b74b5db63ae544be2bc037e6afa12137aa98.1715224143.git.zhoubinbin@loongson.cn>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1715224143.git.zhoubinbin@loongson.cn>
References: <cover.1715224143.git.zhoubinbin@loongson.cn>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:AQAAf8Cx67pceURmwn0gAA--.0S4
X-CM-SenderInfo: p2kr3uplqex0o6or00hjvr0hdfq/
X-Coremail-Antispam: 1Uk129KBj9fXoWfJr45JryUGryDtw4DAr4UJrc_yoW8Gr17Ko
	W3JF9Ivws8tr13A395Kw1xJ3W3WanFka93Xw4akrWYvrWjyr1YgFy7tw1UAa13K34YvFs3
	Xrnxtr48Xr4rurn5l-sFpf9Il3svdjkaLaAFLSUrUUUU1b8apTn2vfkv8UJUUUU8wcxFpf
	9Il3svdxBIdaVrn0xqx4xG64xvF2IEw4CE5I8CrVC2j2Jv73VFW2AGmfu7bjvjm3AaLaJ3
	UjIYCTnIWjp_UUUYy7kC6x804xWl14x267AKxVWUJVW8JwAFc2x0x2IEx4CE42xK8VAvwI
	8IcIk0rVWrJVCq3wAFIxvE14AKwVWUXVWUAwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xG
	Y2AK021l84ACjcxK6xIIjxv20xvE14v26r4j6ryUM28EF7xvwVC0I7IYx2IY6xkF7I0E14
	v26r4j6F4UM28EF7xvwVC2z280aVAFwI0_Gr1j6F4UJwA2z4x0Y4vEx4A2jsIEc7CjxVAF
	wI0_Gr1j6F4UJwAaw2AFwI0_Jrv_JF1le2I262IYc4CY6c8Ij28IcVAaY2xG8wAqjxCEc2
	xF0cIa020Ex4CE44I27wAqx4xG64xvF2IEw4CE5I8CrVC2j2WlYx0E2Ix0cI8IcVAFwI0_
	Jw0_WrylYx0Ex4A2jsIE14v26r4j6F4UMcvjeVCFs4IE7xkEbVWUJVW8JwACjcxG0xvY0x
	0EwIxGrwCF04k20xvY0x0EwIxGrwCFx2IqxVCFs4IE7xkEbVWUJVW8JwCFI7km07C267AK
	xVWUXVWUAwC20s026c02F40E14v26r1j6r18MI8I3I0E7480Y4vE14v26r106r1rMI8E67
	AF67kF1VAFwI0_Jw0_GFylIxkGc2Ij64vIr41lIxAIcVC0I7IYx2IY67AKxVW8JVW5JwCI
	42IY6xIIjxv20xvEc7CjxVAFwI0_Gr0_Cr1lIxAIcVCF04k26cxKx2IYs7xG6r1j6r1xMI
	IF0xvEx4A2jsIE14v26r4j6F4UMIIF0xvEx4A2jsIEc7CjxVAFwI0_Gr0_Gr1UYxBIdaVF
	xhVjvjDU0xZFpf9x07jz2NtUUUUU=

This patch introduces a driver for the PixArt PS/2 touchpad, which
supports both clickpad and touchpad types.

Co-developed-by: Jon Xie <jon_xie@pixart.com>
Signed-off-by: Jon Xie <jon_xie@pixart.com>
Co-developed-by: Jay Lee <jay_lee@pixart.com>
Signed-off-by: Jay Lee <jay_lee@pixart.com>
Signed-off-by: Binbin Zhou <zhoubinbin@loongson.cn>
---
 drivers/input/mouse/Kconfig        |  12 ++
 drivers/input/mouse/Makefile       |   1 +
 drivers/input/mouse/pixart_ps2.c   | 294 +++++++++++++++++++++++++++++
 drivers/input/mouse/pixart_ps2.h   |  31 +++
 drivers/input/mouse/psmouse-base.c |  17 ++
 drivers/input/mouse/psmouse.h      |   1 +
 6 files changed, 356 insertions(+)
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
index 000000000000..532d84ab7654
--- /dev/null
+++ b/drivers/input/mouse/pixart_ps2.c
@@ -0,0 +1,294 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+/*
+ * Pixart Touchpad Controller 1336U PS2 driver
+ *
+ * Author: Jon Xie <jon_xie@pixart.com>
+ *         Jay Lee <jay_lee@pixart.com>
+ * Further cleanup and restructuring by:
+ *         Binbin Zhou <zhoubinbin@loongson.cn>
+ *
+ * Copyright (C) 2021-2024 Pixart Imaging
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
+#include "pixart_ps2.h"
+
+static int pixart_mode_detect(struct psmouse *psmouse)
+{
+	u8 param[1];
+
+	if (ps2_command(&psmouse->ps2dev, param, PIXART_CMD_REPORT_FORMAT))
+		return -EIO;
+
+	return (param[0] == 1) ? PIXART_MODE_ABS : PIXART_MODE_REL;
+}
+
+static int pixart_type_detect(struct psmouse *psmouse)
+{
+	struct ps2dev *ps2dev = &psmouse->ps2dev;
+	u8 param[3];
+
+	param[0] = 0x0a;
+	ps2_command(ps2dev, param, PSMOUSE_CMD_SETRATE);
+	param[0] = 0x0;
+	ps2_command(ps2dev, param, PSMOUSE_CMD_SETRES);
+	param[0] = 0x0;
+	ps2_command(ps2dev, param, PSMOUSE_CMD_SETRES);
+	param[0] = 0x0;
+	ps2_command(ps2dev, param, PSMOUSE_CMD_SETRES);
+	param[0] = 0x03;
+	ps2_command(ps2dev, param, PSMOUSE_CMD_SETRES);
+	ps2_command(ps2dev, param, PSMOUSE_CMD_GETINFO);
+
+	return (param[0] == 0x0e) ? PIXART_TYPE_TOUCHPAD : PIXART_TYPE_CLICKPAD;
+}
+
+static int pixart_intellimouse_detect(struct psmouse *psmouse)
+{
+	struct ps2dev *ps2dev = &psmouse->ps2dev;
+	u8 param[2];
+
+	param[0] = 200;
+	ps2_command(ps2dev, param, PSMOUSE_CMD_SETRATE);
+	param[0] = 100;
+	ps2_command(ps2dev, param, PSMOUSE_CMD_SETRATE);
+	param[0] = 80;
+	ps2_command(ps2dev, param, PSMOUSE_CMD_SETRATE);
+	ps2_command(ps2dev, param, PSMOUSE_CMD_GETID);
+
+	return (param[0] == 3) ? 0 : -1;
+}
+
+static void pixart_reset(struct psmouse *psmouse)
+{
+	ps2_command(&psmouse->ps2dev, NULL, PSMOUSE_CMD_RESET_DIS);
+	msleep(100);
+	psmouse_reset(psmouse);
+}
+
+static psmouse_ret_t pixart_process_abs_packet(struct psmouse *psmouse)
+{
+	struct pixart_data *priv = psmouse->private;
+	struct input_dev *dev = psmouse->dev;
+	u8 *packet = psmouse->packet;
+	u8 contact_cnt = (packet[0] >> 4) & 0x07;
+	unsigned int abs_x, abs_y;
+	int i, id, fingers = 0;
+	bool tip;
+
+	if (contact_cnt > MAX_FINGERS || ((packet[0] & 0x8c) != 0x80))
+		return PSMOUSE_BAD_DATA;
+
+	if (contact_cnt == MAX_FINGERS && psmouse->pktcnt < psmouse->pktsize)
+		return PSMOUSE_GOOD_DATA;
+	else if (contact_cnt == 0 && psmouse->pktcnt < 5)
+		return PSMOUSE_GOOD_DATA;
+	else if (psmouse->pktcnt < (3 * contact_cnt + 2))
+		return PSMOUSE_GOOD_DATA;
+
+	for (i = 0; i < contact_cnt; i++) {
+		id = packet[3 * i + 3] & 0x07;
+		abs_y = ((packet[3 * i + 3] & 0x30) << 4) | packet[3 * i + 1];
+		abs_x = ((packet[3 * i + 3] & 0xc0) << 2) | packet[3 * i + 2];
+
+		if (i == MAX_FINGERS - 1)
+			tip = packet[14] & (0x01 << 1);
+		else
+			tip = packet[3 * contact_cnt + 1] & (0x01 << (2 * i + 1));
+
+		input_mt_slot(dev, id);
+		input_mt_report_slot_state(dev, MT_TOOL_FINGER, tip);
+		if (tip) {
+			fingers++;
+			input_report_abs(dev, ABS_MT_POSITION_Y, abs_y);
+			input_report_abs(dev, ABS_MT_POSITION_X, abs_x);
+		}
+	}
+
+	input_mt_drop_unused(dev);
+	input_mt_report_pointer_emulation(dev, false);
+	input_mt_report_finger_count(dev, fingers);
+
+	if (priv->type == PIXART_TYPE_CLICKPAD) {
+		input_report_key(dev, BTN_LEFT, packet[0] & 0x03);
+	} else {
+		input_report_key(dev, BTN_LEFT, packet[0] & 0x01);
+		input_report_key(dev, BTN_RIGHT, packet[0] & 0x02);
+	}
+
+	input_mt_report_pointer_emulation(dev, true);
+	input_sync(dev);
+
+	return PSMOUSE_FULL_PACKET;
+}
+
+static psmouse_ret_t pixart_process_rel_packet(struct psmouse *psmouse)
+{
+	struct input_dev *dev = psmouse->dev;
+	u8 *packet = psmouse->packet;
+	int x = packet[1] ? packet[1] - ((packet[0] << 4) & 0x100) : 0;
+	int y = packet[2] ? ((packet[0] << 3) & 0x100) - packet[2] : 0;
+	int w = -(s8)packet[3];
+
+	if (psmouse->pktcnt < psmouse->pktsize)
+		return PSMOUSE_GOOD_DATA;
+
+	psmouse_report_standard_buttons(dev, packet[0]);
+	input_report_rel(dev, REL_X, x);
+	input_report_rel(dev, REL_Y, y);
+	input_report_rel(dev, REL_WHEEL, w);
+	input_sync(dev);
+
+	return PSMOUSE_FULL_PACKET;
+}
+
+static void pixart_disconnect(struct psmouse *psmouse)
+{
+	psmouse_info(psmouse, "Device disconnect");
+	pixart_reset(psmouse);
+	kfree(psmouse->private);
+	psmouse->private = NULL;
+}
+
+static int pixart_reconnect(struct psmouse *psmouse)
+{
+	struct pixart_data *priv = psmouse->private;
+
+	psmouse_info(psmouse, "Device reconnect");
+	pixart_reset(psmouse);
+
+	priv->mode = pixart_mode_detect(psmouse);
+	if (priv->mode < 0) {
+		psmouse_err(psmouse, "Unable to detect the PixArt device");
+		return -EIO;
+	}
+
+	if (priv->mode == PIXART_MODE_ABS)
+		ps2_command(&psmouse->ps2dev, NULL, PIXART_CMD_SWITCH_PROTO);
+
+	return 0;
+}
+
+static void pixart_set_abs_input_params(struct input_dev *dev, struct pixart_data *priv)
+{
+	__clear_bit(EV_REL, dev->evbit);
+	__clear_bit(REL_X, dev->relbit);
+	__clear_bit(REL_Y, dev->relbit);
+	__clear_bit(BTN_MIDDLE, dev->keybit);
+
+	__set_bit(EV_KEY, dev->evbit);
+	__set_bit(BTN_LEFT, dev->keybit);
+	__set_bit(BTN_RIGHT, dev->keybit);
+	if (priv->type == PIXART_TYPE_CLICKPAD) {
+		__set_bit(INPUT_PROP_BUTTONPAD, dev->propbit);
+		__clear_bit(BTN_RIGHT, dev->keybit);
+	}
+	__set_bit(BTN_TOUCH, dev->keybit);
+	__set_bit(BTN_TOOL_FINGER, dev->keybit);
+	__set_bit(BTN_TOOL_DOUBLETAP, dev->keybit);
+	__set_bit(BTN_TOOL_TRIPLETAP, dev->keybit);
+	__set_bit(BTN_TOOL_QUADTAP, dev->keybit);
+	__set_bit(INPUT_PROP_POINTER, dev->propbit);
+
+	__set_bit(EV_ABS, dev->evbit);
+	input_set_abs_params(dev, ABS_X, 0, ABS_MAX_X, 0, 0);
+	input_set_abs_params(dev, ABS_Y, 0, ABS_MAX_Y, 0, 0);
+
+	input_set_abs_params(dev, ABS_MT_POSITION_X, 0, ABS_MAX_X, 0, 0);
+	input_set_abs_params(dev, ABS_MT_POSITION_Y, 0, ABS_MAX_Y, 0, 0);
+
+	input_mt_init_slots(dev, SLOTS_NUMBER, 0);
+}
+
+static void pixart_set_rel_input_params(struct input_dev *dev, struct pixart_data *priv)
+{
+	__set_bit(EV_KEY, dev->evbit);
+	__set_bit(EV_REL, dev->evbit);
+	__set_bit(BTN_LEFT, dev->keybit);
+	__set_bit(BTN_RIGHT, dev->keybit);
+	__set_bit(REL_X, dev->relbit);
+	__set_bit(REL_Y, dev->relbit);
+	__set_bit(REL_WHEEL, dev->relbit);
+	__set_bit(INPUT_PROP_POINTER, dev->propbit);
+}
+
+int pixart_detect(struct psmouse *psmouse, bool set_properties)
+{
+	int mode, type;
+
+	pixart_reset(psmouse);
+
+	type = pixart_type_detect(psmouse);
+	if (type < 0)
+		return -ENODEV;
+
+	mode = pixart_mode_detect(psmouse);
+	if (mode < 0)
+		return -ENODEV;
+
+	psmouse_info(psmouse, "Detect PixArt Device.");
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
+	priv->type = pixart_type_detect(psmouse);
+	if (priv->type < 0)
+		goto fail;
+
+	priv->mode = pixart_mode_detect(psmouse);
+	if (priv->mode < 0) {
+		psmouse_err(psmouse, "Unable to initialize the PixArt device\n");
+		goto fail;
+	}
+
+	if (priv->mode == PIXART_MODE_ABS) {
+		ps2_command(&psmouse->ps2dev, NULL, PIXART_CMD_SWITCH_PROTO);
+		pixart_set_abs_input_params(psmouse->dev, priv);
+		psmouse->protocol_handler = pixart_process_abs_packet;
+		psmouse->pktsize = 15;
+	} else {
+		pixart_reset(psmouse);
+		pixart_intellimouse_detect(psmouse);
+		pixart_set_rel_input_params(psmouse->dev, priv);
+		psmouse->protocol_handler = pixart_process_rel_packet;
+		psmouse->pktsize = 4;
+	}
+
+	psmouse->disconnect = pixart_disconnect;
+	psmouse->reconnect = pixart_reconnect;
+	psmouse->cleanup = pixart_reset;
+	/* resync is not supported yet */
+	psmouse->resync_time = 0;
+
+	psmouse_info(psmouse, "Set device as Type: %x, mode: %x", priv->type, priv->mode);
+	return 0;
+
+fail:
+	pixart_reset(psmouse);
+	kfree(priv);
+	psmouse->private = NULL;
+	return -1;
+}
diff --git a/drivers/input/mouse/pixart_ps2.h b/drivers/input/mouse/pixart_ps2.h
new file mode 100644
index 000000000000..224ab3a4f739
--- /dev/null
+++ b/drivers/input/mouse/pixart_ps2.h
@@ -0,0 +1,31 @@
+/* SPDX-License-Identifier: GPL-2.0-or-later */
+#ifndef _PIXART_PS2_H
+#define _PIXART_PS2_H
+
+#include "psmouse.h"
+
+#define ABS_MAX_X	1023
+#define ABS_MAX_Y	579
+#define MAX_FINGERS	4
+#define SLOTS_NUMBER	MAX_FINGERS
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
index b05c6fbae7e3..23f7fa7243cb 100644
--- a/drivers/input/mouse/psmouse.h
+++ b/drivers/input/mouse/psmouse.h
@@ -69,6 +69,7 @@ enum psmouse_type {
 	PSMOUSE_BYD,
 	PSMOUSE_SYNAPTICS_SMBUS,
 	PSMOUSE_ELANTECH_SMBUS,
+	PSMOUSE_PIXART,
 	PSMOUSE_AUTO		/* This one should always be last */
 };
 
-- 
2.43.0


