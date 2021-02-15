Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 732D031C426
	for <lists+linux-input@lfdr.de>; Mon, 15 Feb 2021 23:50:57 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229708AbhBOWul (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 15 Feb 2021 17:50:41 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48170 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229702AbhBOWuk (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Mon, 15 Feb 2021 17:50:40 -0500
Received: from mail-wm1-x336.google.com (mail-wm1-x336.google.com [IPv6:2a00:1450:4864:20::336])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DA01CC061756;
        Mon, 15 Feb 2021 14:49:59 -0800 (PST)
Received: by mail-wm1-x336.google.com with SMTP id w4so7415132wmi.4;
        Mon, 15 Feb 2021 14:49:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=QN1eO6+5uOlzlnYpw4yWwU4h0m7rl0IyUszzyiWdwK8=;
        b=ux6sXN+9ivxi+hMw/0QXr13n5rHu0OqevNiJsWoPzAsNCOClBAIXOcLpcvkRLGcmZS
         gcDQdHfHdHTb10OuAvw+MWtJ9oyaeg0SKGrO1wOmLLBa1rVlSz7Cb6LwhOmpMdTwygO6
         jveOGsdbgrll0NmCt5fK1vA1iWr+CbwxOKxKyHcdsewf00MRYQ1T2z1nNSaelA/WwOEl
         /GS+1s3L/tNRNAIrT0gRvbzoutonHLC4QtkEJjn+2XDh8z7DX+41fwanPkG0iaBQuVzQ
         iMtbwnDl10qH5b2Ps1WaOV8QqGEnhl0w8Ahs1X2UNtvVPjJ5WL568fAV5kdrTpr4fmML
         31JA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=QN1eO6+5uOlzlnYpw4yWwU4h0m7rl0IyUszzyiWdwK8=;
        b=twzrd+5lVWodioiARbCUV5dAuS8Ed1QdYWXrOzpDl53VA7v8ii8S5aiMQ3e/vfXRiz
         eI0DJKQlDVksbjeHxNETECj1rJe1k6PCg5PUKC+TZGoB5XwbvdXrxO6xForJ0j1J3APM
         XjTfHrbITEBx9Hfix6rm/iLdjvL+66cOGGuw1o4jynCfCEoRxDB/X879PvZF5CafMAGk
         3Wl1VthqR/fV9K4DMG2BYxGil/liLDwwUkJEsbrz+o3rroS5cFrCIVR3KpOb19u2Xmfv
         5UCQrAF7+t19nUMI0QxTzzLv5x5ukeXAKVUC9wxTO3BaQF0vp2QN7EkT59gCw+Zm5EVO
         k7QA==
X-Gm-Message-State: AOAM533msbcjFI5hF3gpWGQE+RalGDqaeDvLuycydachpMuPwp4GI4MA
        Mysm4LEiFZp97dpqb5QfEd6shR25Bz8ohw==
X-Google-Smtp-Source: ABdhPJy3AJmOkYrLwv307AWR3HsLpivVUZfZ3mF81vhE64F3wue5/oZgV0714CqZb5O9X1wIpOcVfg==
X-Received: by 2002:a1c:f312:: with SMTP id q18mr821052wmq.79.1613429398610;
        Mon, 15 Feb 2021 14:49:58 -0800 (PST)
Received: from localhost.localdomain ([39.40.112.112])
        by smtp.googlemail.com with ESMTPSA id x10sm849934wmg.6.2021.02.15.14.49.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Feb 2021 14:49:58 -0800 (PST)
From:   Hamza Farooq <0xa6c4@gmail.com>
X-Google-Original-From: Hamza Farooq <0xA6C4@gmail.com>
Cc:     kbuild-all@lists.01.org, Hamza Farooq <0xA6C4@gmail.com>,
        kernel test robot <lkp@intel.com>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Henrik Rydberg <rydberg@bitmath.org>,
        linux-kernel@vger.kernel.org, linux-input@vger.kernel.org
Subject: [PATCH v2] Input: psmouse - add support for FocalTech PS/2 Protocol v2
Date:   Tue, 16 Feb 2021 03:49:28 +0500
Message-Id: <20210215224933.23632-1-0xA6C4@gmail.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <202102111817.sPo0m4ak-lkp@intel.com>
References: <202102111817.sPo0m4ak-lkp@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
To:     unlisted-recipients:; (no To-header on input)
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Haier Y11C Laptop have FocalTech PS/2 Touchpad, BIOS Device Name is FTE0001.
This device have different protocol than exisiting FocalTech PS/2 Driver.

This commit adds a basic multitouch-capable driver.

Some of the protcol is still unknown (just like the other FocalTech driver)
Device can only be identified with PNP ID.

Signed-off-by: Hamza Farooq <0xA6C4@gmail.com>
Reported-by: kernel test robot <lkp@intel.com>
---
Changes in v2:
- Fixed compilation issue

 drivers/input/mouse/Kconfig        |  10 ++
 drivers/input/mouse/Makefile       |   2 +-
 drivers/input/mouse/focaltech_v2.c | 265 +++++++++++++++++++++++++++++
 drivers/input/mouse/focaltech_v2.h |  57 +++++++
 drivers/input/mouse/psmouse-base.c |  32 ++++
 drivers/input/mouse/psmouse.h      |   1 +
 6 files changed, 366 insertions(+), 1 deletion(-)
 create mode 100644 drivers/input/mouse/focaltech_v2.c
 create mode 100644 drivers/input/mouse/focaltech_v2.h

diff --git a/drivers/input/mouse/Kconfig b/drivers/input/mouse/Kconfig
index 63c9cda55..843509c01 100644
--- a/drivers/input/mouse/Kconfig
+++ b/drivers/input/mouse/Kconfig
@@ -184,6 +184,16 @@ config MOUSE_PS2_FOCALTECH
 
 	  If unsure, say Y.
 
+config MOUSE_PS2_FOCALTECH_V2
+	bool "FocalTech-v2 PS/2 mouse protocol extension" if EXPERT
+	default y
+	depends on MOUSE_PS2
+	help
+	  Say Y here if you have a FocalTech-V2 PS/2 TouchPad connected to
+	  your system.
+
+	  If unsure, say Y.
+
 config MOUSE_PS2_VMMOUSE
 	bool "Virtual mouse (vmmouse)"
 	depends on MOUSE_PS2 && X86 && HYPERVISOR_GUEST
diff --git a/drivers/input/mouse/Makefile b/drivers/input/mouse/Makefile
index e49f08565..31673ea8d 100644
--- a/drivers/input/mouse/Makefile
+++ b/drivers/input/mouse/Makefile
@@ -26,7 +26,7 @@ obj-$(CONFIG_MOUSE_SYNAPTICS_USB)	+= synaptics_usb.o
 obj-$(CONFIG_MOUSE_VSXXXAA)		+= vsxxxaa.o
 
 cyapatp-objs := cyapa.o cyapa_gen3.o cyapa_gen5.o cyapa_gen6.o
-psmouse-objs := psmouse-base.o synaptics.o focaltech.o
+psmouse-objs := psmouse-base.o synaptics.o focaltech.o focaltech_v2.o
 
 psmouse-$(CONFIG_MOUSE_PS2_ALPS)	+= alps.o
 psmouse-$(CONFIG_MOUSE_PS2_BYD)		+= byd.o
diff --git a/drivers/input/mouse/focaltech_v2.c b/drivers/input/mouse/focaltech_v2.c
new file mode 100644
index 000000000..c07c6fb65
--- /dev/null
+++ b/drivers/input/mouse/focaltech_v2.c
@@ -0,0 +1,265 @@
+/* SPDX-License-Identifier: GPL-2.0-or-later */
+/*
+ * Focaltech v2 TouchPad PS/2 mouse driver
+ *
+ * Copyright (c) 2021 Hamza Farooq <0xA6C4@gmail.com>
+ */
+
+
+#include <linux/device.h>
+#include <linux/libps2.h>
+#include <linux/input/mt.h>
+#include <linux/serio.h>
+#include <linux/slab.h>
+#include "psmouse.h"
+#include "focaltech_v2.h"
+
+static const struct fte_command switch_protocol[] = {
+	{PSMOUSE_CMD_SETRATE,	0xea},
+	{PSMOUSE_CMD_SETRATE,	0xed},
+	{PSMOUSE_CMD_ENABLE,	0x00},
+};
+
+static const char *const focaltech_pnp_ids[] = {
+	"FTE0001",
+	NULL};
+
+int focaltech_v2_detect(struct psmouse *psmouse, bool set_properties)
+{
+	if (!psmouse_matches_pnp_id(psmouse, focaltech_pnp_ids))
+		return -ENODEV;
+
+	if (set_properties) {
+		psmouse->vendor = "FocalTech";
+		psmouse->name = "Touchpad V2";
+	}
+
+	return 0;
+}
+
+#ifdef CONFIG_MOUSE_PS2_FOCALTECH_V2
+
+static void focaltech_report_state(struct psmouse *psmouse)
+{
+	struct focaltech_data *priv = psmouse->private;
+	struct focaltech_hw_state *state = &priv->state;
+	struct input_dev *dev = psmouse->dev;
+	int i;
+
+	for (i = 0; i < FOCALTECH_MAX_FINGERS; i++) {
+		struct focaltech_finger_state *finger = &state->fingers[i];
+
+		input_mt_slot(dev, i);
+		input_mt_report_slot_state(dev, MT_TOOL_FINGER, finger->valid);
+		if (finger->valid) {
+			input_report_abs(dev, ABS_MT_POSITION_X, finger->x);
+			input_report_abs(dev, ABS_MT_POSITION_Y, finger->y);
+			input_report_abs(dev, ABS_MT_TOUCH_MAJOR, finger->major);
+			input_report_abs(dev, ABS_MT_TOUCH_MINOR, finger->minor);
+			input_report_abs(dev, ABS_MT_PRESSURE, finger->pressure);
+		}
+	}
+	input_mt_sync_frame(dev);
+	input_report_key(dev, BTN_LEFT, state->left);
+	input_report_key(dev, BTN_RIGHT, state->right);
+	input_mt_report_finger_count(dev, state->fingerCount);
+	input_sync(dev);
+}
+
+static void focaltech_process_packet(struct psmouse *psmouse)
+{
+	unsigned char *packet = psmouse->packet;
+	struct focaltech_data *priv = psmouse->private;
+	struct focaltech_hw_state *state = &priv->state;
+	int i, j;
+
+	if (!priv->isReadNext) {
+		for (i = 0; i < 8; i++)
+			priv->lastDeviceData[i] = packet[i];
+		for (i = 8; i < 16; i++)
+			priv->lastDeviceData[i] = 0xff;
+		state->fingerCount = (int)(packet[4] & 3) + ((packet[4] & 48) >> 2);
+		if ((state->fingerCount > 2) && (packet[0] != 0xff && packet[1] != 0xff && packet[2] != 0xff && packet[3] != 0xff) && (packet[0] & 48) != 32)
+			priv->isReadNext = true;
+	} else {
+		priv->isReadNext = false;
+		for (i = 8; i < 16; i++)
+			priv->lastDeviceData[i] = packet[i - 8];
+	}
+	if (!priv->isReadNext) {
+		if (!((priv->lastDeviceData[0] == 0xff) && (priv->lastDeviceData[1] == 0xff) && (priv->lastDeviceData[2] == 0xff) && (priv->lastDeviceData[3] == 0xff))) {
+			if ((priv->lastDeviceData[0] & 1) == 1)
+				state->left = true;
+			else
+				state->left = false;
+			if ((priv->lastDeviceData[0] & 2) == 2)
+				state->right = true;
+			else
+				state->right = false;
+			if ((priv->lastDeviceData[0] & 48) == 16) {
+				for (i = 0; i < 4; i++) {
+					j = i * 4;
+					if (!((priv->lastDeviceData[j + 1] == 0xff) && (priv->lastDeviceData[j + 2] == 0xff) && (priv->lastDeviceData[j + 3] == 0xff))) {
+						state->fingers[i].minor = priv->lastDeviceData[j + 1];
+						state->fingers[i].major = priv->lastDeviceData[j + 2];
+						state->fingers[i].pressure = priv->lastDeviceData[j + 3] * 2;
+						if (state->fingers[i].pressure > MAX_PRESSURE)
+							state->fingers[i].pressure = MAX_PRESSURE;
+					}
+				}
+			} else {
+				for (i = 0; i < 4; i++) {
+					j = i * 4;
+					if (!((priv->lastDeviceData[j + 1] == 0xff) && (priv->lastDeviceData[j + 2] == 0xff) && (priv->lastDeviceData[j + 3] == 0xff))) {
+						state->fingers[i].valid = true;
+						state->fingers[i].x = (priv->lastDeviceData[j + 1] << 4) + ((priv->lastDeviceData[j + 3] & 240) >> 4);
+						state->fingers[i].y = (priv->lastDeviceData[j + 2] << 4) + (priv->lastDeviceData[j + 3] & 15);
+					} else
+						state->fingers[i].valid = false;
+				}
+			}
+			if (state->fingerCount == 0)
+				for (i = 0; i < 4; i++)
+					state->fingers[i].valid = false;
+		}
+	}
+	focaltech_report_state(psmouse);
+}
+
+static psmouse_ret_t focaltech_process_byte(struct psmouse *psmouse)
+{
+	if (psmouse->pktcnt >= 8) { /* packet received */
+		focaltech_process_packet(psmouse);
+		return PSMOUSE_FULL_PACKET;
+	}
+	return PSMOUSE_GOOD_DATA;
+}
+
+static int focaltech_switch_protocol(struct psmouse *psmouse)
+{
+	struct ps2dev *ps2dev = &psmouse->ps2dev;
+	unsigned char param[4];
+	size_t i;
+
+	for (i = 0; i < ARRAY_SIZE(switch_protocol); ++i) {
+		memset(param, 0, sizeof(param));
+		param[0] = switch_protocol[i].data;
+		if (ps2_command(ps2dev, param, switch_protocol[i].command))
+			return -EIO;
+	}
+
+	return 0;
+}
+
+static void focaltech_reset(struct psmouse *psmouse)
+{
+	ps2_command(&psmouse->ps2dev, NULL, PSMOUSE_CMD_RESET_DIS);
+	psmouse_reset(psmouse);
+}
+
+static void focaltech_disconnect(struct psmouse *psmouse)
+{
+	focaltech_reset(psmouse);
+	kfree(psmouse->private);
+	psmouse->private = NULL;
+}
+
+static int focaltech_reconnect(struct psmouse *psmouse)
+{
+	int error;
+
+	focaltech_reset(psmouse);
+
+	error = focaltech_switch_protocol(psmouse);
+	if (error) {
+		psmouse_err(psmouse, "Unable to initialize the device\n");
+		return error;
+	}
+
+	return 0;
+}
+
+static void focaltech_set_input_params(struct psmouse *psmouse)
+{
+	struct input_dev *dev = psmouse->dev;
+
+	/*
+	 * Undo part of setup done for us by psmouse core since touchpad
+	 * is not a relative device.
+	 */
+	__clear_bit(EV_REL, dev->evbit);
+	__clear_bit(REL_X, dev->relbit);
+	__clear_bit(REL_Y, dev->relbit);
+
+	/*
+	 * Now set up our capabilities.
+	 */
+	__set_bit(EV_ABS, dev->evbit);
+	input_set_abs_params(dev, ABS_MT_POSITION_X, 0, MAX_X, 0, 0);
+	input_set_abs_params(dev, ABS_MT_POSITION_Y, 0, MAX_Y, 0, 0);
+	input_set_abs_params(dev, ABS_MT_PRESSURE, 0, MAX_PRESSURE, 0, 0);
+	input_set_abs_params(dev, ABS_MT_TOUCH_MINOR, 0, MAX_MAJOR, 0, 0);
+	input_set_abs_params(dev, ABS_MT_TOUCH_MAJOR, 0, MAX_MINOR, 0, 0);
+	input_abs_set_res(dev, ABS_MT_POSITION_X, RESOLUTION);
+	input_abs_set_res(dev, ABS_MT_POSITION_Y, RESOLUTION);
+	input_mt_init_slots(dev, FOCALTECH_MAX_FINGERS, INPUT_MT_POINTER);
+}
+
+static void focaltech_set_resolution(struct psmouse *psmouse, unsigned int resolution)
+{
+	/* not supported yet */
+}
+
+static void focaltech_set_rate(struct psmouse *psmouse, unsigned int rate)
+{
+	/* not supported yet */
+}
+
+static void focaltech_set_scale(struct psmouse *psmouse, enum psmouse_scale scale)
+{
+	/* not supported yet */
+}
+
+int focaltech_v2_init(struct psmouse *psmouse)
+{
+	struct focaltech_data *priv;
+	int error;
+
+	psmouse->private = priv = kzalloc(sizeof(struct focaltech_data), GFP_KERNEL);
+	if (!priv)
+		return -ENOMEM;
+
+	focaltech_reset(psmouse);
+
+	error = focaltech_switch_protocol(psmouse);
+	if (error) {
+		psmouse_err(psmouse, "Unable to initialize the device\n");
+		goto fail;
+	}
+
+	focaltech_set_input_params(psmouse);
+
+	psmouse->protocol_handler = focaltech_process_byte;
+	psmouse->pktsize = 8;
+	psmouse->disconnect = focaltech_disconnect;
+	psmouse->reconnect = focaltech_reconnect;
+	psmouse->cleanup = focaltech_reset;
+	/* resync is not supported yet */
+	psmouse->resync_time = 0;
+	/*
+	 * rate/resolution/scale changes are not supported yet, and
+	 * the generic implementations of these functions seem to
+	 * confuse some touchpads
+	 */
+	psmouse->set_resolution = focaltech_set_resolution;
+	psmouse->set_rate = focaltech_set_rate;
+	psmouse->set_scale = focaltech_set_scale;
+
+	return 0;
+
+fail:
+	focaltech_reset(psmouse);
+	kfree(priv);
+	return error;
+}
+#endif /* CONFIG_MOUSE_PS2_FOCALTECH_V2 */
diff --git a/drivers/input/mouse/focaltech_v2.h b/drivers/input/mouse/focaltech_v2.h
new file mode 100644
index 000000000..2206ab14c
--- /dev/null
+++ b/drivers/input/mouse/focaltech_v2.h
@@ -0,0 +1,57 @@
+/* SPDX-License-Identifier: GPL-2.0-or-later */
+/*
+ * Focaltech v2 TouchPad PS/2 mouse driver
+ *
+ * Copyright (c) 2021 Hamza Farooq <0xA6C4@gmail.com>
+ */
+
+#ifndef _FOCALTECH_V2_H
+#define _FOCALTECH_V2_H
+
+#define FOCALTECH_MAX_FINGERS 4
+#define MAX_X			0x08E0  /* 2272 */
+#define MAX_Y			0x03E0  /* 992 */
+#define RESOLUTION		26	/* 87mm x 38mm */
+#define MAX_MAJOR		10
+#define MAX_MINOR		10
+#define MAX_PRESSURE	127
+
+struct fte_command {
+	int command;
+	unsigned char data;
+};
+
+struct focaltech_finger_state {
+	int x;
+	int y;
+	int major;
+	int minor;
+	int pressure;
+	bool valid;
+};
+
+struct focaltech_hw_state {
+	struct focaltech_finger_state fingers[FOCALTECH_MAX_FINGERS];
+	int fingerCount;
+	bool left;
+	bool right;
+};
+
+struct focaltech_data {
+	bool isReadNext;
+	int lastDeviceData[16];
+	struct focaltech_hw_state state;
+};
+
+int focaltech_v2_detect(struct psmouse *psmouse, bool set_properties);
+
+#ifdef CONFIG_MOUSE_PS2_FOCALTECH_V2
+int focaltech_v2_init(struct psmouse *psmouse);
+#else
+static inline int focaltech_v2_init(struct psmouse *psmouse)
+{
+	return -ENOSYS;
+}
+#endif
+
+#endif
diff --git a/drivers/input/mouse/psmouse-base.c b/drivers/input/mouse/psmouse-base.c
index 0b4a3039f..5f720af51 100644
--- a/drivers/input/mouse/psmouse-base.c
+++ b/drivers/input/mouse/psmouse-base.c
@@ -34,6 +34,7 @@
 #include "sentelic.h"
 #include "cypress_ps2.h"
 #include "focaltech.h"
+#include "focaltech_v2.h"
 #include "vmmouse.h"
 #include "byd.h"
 
@@ -891,6 +892,15 @@ static const struct psmouse_protocol psmouse_protocols[] = {
 		.init		= focaltech_init,
 	},
 #endif
+#ifdef CONFIG_MOUSE_PS2_FOCALTECH_V2
+	{
+		.type		= PSMOUSE_FOCALTECH_V2,
+		.name		= "FocalTechPS/2",
+		.alias		= "focaltech-v2",
+		.detect		= focaltech_detect,
+		.init		= focaltech_init,
+	},
+#endif
 #ifdef CONFIG_MOUSE_PS2_VMMOUSE
 	{
 		.type		= PSMOUSE_VMMOUSE,
@@ -1072,6 +1082,28 @@ static int psmouse_extensions(struct psmouse *psmouse,
 		psmouse_max_proto = max_proto = PSMOUSE_PS2;
 	}
 
+	/*
+	 * Always check for focaltech-v2, this is safe as it uses pnp-id
+	 * matching.
+	 */
+	if (psmouse_do_detect(focaltech_v2_detect,
+			      psmouse, false, set_properties)) {
+		if (max_proto > PSMOUSE_IMEX &&
+		    IS_ENABLED(CONFIG_MOUSE_PS2_FOCALTECH_V2) &&
+		    (!set_properties || focaltech_v2_init(psmouse) == 0)) {
+			return PSMOUSE_FOCALTECH_V2;
+		}
+		/*
+		 * Restrict psmouse_max_proto so that psmouse_initialize()
+		 * does not try to reset rate and resolution, because even
+		 * that upsets the device.
+		 * This also causes us to basically fall through to basic
+		 * protocol detection, where we fully reset the mouse,
+		 * and set it up as bare PS/2 protocol device.
+		 */
+		psmouse_max_proto = max_proto = PSMOUSE_PS2;
+	}
+
 	/*
 	 * We always check for LifeBook because it does not disturb mouse
 	 * (it only checks DMI information).
diff --git a/drivers/input/mouse/psmouse.h b/drivers/input/mouse/psmouse.h
index 64c3a5d3f..68e06aaac 100644
--- a/drivers/input/mouse/psmouse.h
+++ b/drivers/input/mouse/psmouse.h
@@ -65,6 +65,7 @@ enum psmouse_type {
 	PSMOUSE_SYNAPTICS_RELATIVE,
 	PSMOUSE_CYPRESS,
 	PSMOUSE_FOCALTECH,
+	PSMOUSE_FOCALTECH_V2,
 	PSMOUSE_VMMOUSE,
 	PSMOUSE_BYD,
 	PSMOUSE_SYNAPTICS_SMBUS,
-- 
2.27.0

