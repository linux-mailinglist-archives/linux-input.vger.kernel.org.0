Return-Path: <linux-input+bounces-5373-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 26775948AF5
	for <lists+linux-input@lfdr.de>; Tue,  6 Aug 2024 10:12:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 532721F24D54
	for <lists+linux-input@lfdr.de>; Tue,  6 Aug 2024 08:12:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 804BD1BA895;
	Tue,  6 Aug 2024 08:12:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ljones.dev header.i=@ljones.dev header.b="WgFqhRq/";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="RFzMzhdf"
X-Original-To: linux-input@vger.kernel.org
Received: from fout6-smtp.messagingengine.com (fout6-smtp.messagingengine.com [103.168.172.149])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 08A7B1BC9EE;
	Tue,  6 Aug 2024 08:12:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.149
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722931947; cv=none; b=PnKyNxXqzzEhk0BSOkVxn9MX+ZQfUFfSQAldaVD9HVJHE3LhxzqcXCh+5XDTLSmQtjeh6rjBnM7QAfgm+5OhskQ43Q5j0tNQfEQkkFQYFSXr/nWC53bezngRzhwJGeDlF3QqtfyNJoS3CZQC7l4FJiWz9AN9YiMDuIEto+DRIv4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722931947; c=relaxed/simple;
	bh=nb7bLDea/vUuyeJDixsutlyomVjwUPfJS0fKt43Kf8Y=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=JEb8JoxLlrM9aJua2nJNcxtsnMQ5q1gxvGPq1Wfxif8puxbpG2/+dWcuaUVgkT+KtLvit2zJoeJD4EsRBRUTf9P+rJf3v6L9OkfhHLKesSMxiLWovVtiD+focVNFdYhhLJ0FwWakIOldSVsgWoZPfiheJxubschqKzRSr3ffjRc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ljones.dev; spf=none smtp.mailfrom=ljones.dev; dkim=pass (2048-bit key) header.d=ljones.dev header.i=@ljones.dev header.b=WgFqhRq/; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=RFzMzhdf; arc=none smtp.client-ip=103.168.172.149
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ljones.dev
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=ljones.dev
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
	by mailfout.nyi.internal (Postfix) with ESMTP id 0C5A6138FB4C;
	Tue,  6 Aug 2024 04:12:21 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
  by compute1.internal (MEProxy); Tue, 06 Aug 2024 04:12:21 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ljones.dev; h=cc
	:cc:content-transfer-encoding:content-type:date:date:from:from
	:in-reply-to:message-id:mime-version:reply-to:subject:subject:to
	:to; s=fm1; t=1722931941; x=1723018341; bh=kyWRtVAVE8xKWPDNQMjSI
	I6nXgc+q90yejl6Ev9BE/k=; b=WgFqhRq/NbI8IhbNSY2aUsplYAoufctj94YTt
	DoSZiQ0dR95jHjJhc3whvp144/kxKL8vTOpHLNXElSkXC3gO8m+D6ZDkycuAjkIl
	DthE7f3BKv9DgZE5Fecl73sJ7X54tmejbitSX5fTeibfv3Eb5ItFKEN5j+/B9cys
	Z+31jeqDwXxafiPdN9DWRUMaopjW7jZNYHf9o3bZMVQr+p4f8SdIxTbYDAojUr/q
	Npzlj01HxhVHKH6V78wW2deH2kprE1KR3zWzJzNkTyx2WJEZIQVzCNO/DN27w6wH
	W1ghkgHsxQfY6cHdV1kJwZdIQ6c/qzq+d02pFGU5ja4HXtvDw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:message-id:mime-version:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
	fm3; t=1722931941; x=1723018341; bh=kyWRtVAVE8xKWPDNQMjSII6nXgc+
	q90yejl6Ev9BE/k=; b=RFzMzhdfFZvLB8bwWWJUUppfKa6yc6lq6OLAT7D76i9m
	UmaJDHNYRdV/rbF2VdSF+wUNtMg+EYHQdj8Z3++ACNCU/O+ja7RezZ4DtrEq/jIs
	MKjashCGFjqhu2nFThnsj7P7h7Ac3gluONxTiJGHE+f18HO4o5/aix6DLP9lE8UA
	4A78hLm2TPcPPBWy1xENJlx5HOLaWO9R/iFIrUl2BE/nD6vmWKmKjZJuwqHbaC2R
	X2BuMHnMmK2ZZpvKnvZiS4JnnK2RZqi3kQHvCMYgjeZ5YIE4a0v6pGtAxxNBhQn/
	PCgIkd6k8A9w1zZV5gH8WIxbVwhf/LDpeY223kUbow==
X-ME-Sender: <xms:5NqxZpHL4Q2K755jvHC2HzkMUtYWJPUq3n8deInlnUZx7c94mQ-NpA>
    <xme:5NqxZuUOqnUjS20pt05ZaulKk_QJk30rl27URLabT06x4YORUm5V6AAlwjx21KD-l
    Cj4ck7nIhMY519RfMs>
X-ME-Received: <xmr:5NqxZrJtRiuYC1pNVVBaeZfLd0kTfFFoDoPZeKgWKQt4GlHU8ltoAw1cFgvN>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeftddrkeejgddufedtucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucenucfjughrpefhvfevufffkffoggfgsedtkeertd
    ertddtnecuhfhrohhmpedfnfhukhgvucffrdculfhonhgvshdfuceolhhukhgvsehljhho
    nhgvshdruggvvheqnecuggftrfgrthhtvghrnhepgfdujedthfduudekffefkeeiffdttd
    dvhfegudduueffuefhfefggeefteevvdegnecuvehluhhsthgvrhfuihiivgeptdenucfr
    rghrrghmpehmrghilhhfrhhomheplhhukhgvsehljhhonhgvshdruggvvhdpnhgspghrtg
    hpthhtoheptd
X-ME-Proxy: <xmx:5NqxZvEMhnRWiuoELpr0MXFnx1HWpDFoNsb8ZAtdzthMCkU6TTCFbw>
    <xmx:5NqxZvXMIzU1g1ftBO9_a0MKfEnH-9VcH7hC-cVLXPhtVxN-Uum2zA>
    <xmx:5NqxZqP-JLMaZnpZbOXWkWfLxpcMGWW7v1myCNXLmXx57ytCmRJP4w>
    <xmx:5NqxZu1uaA76hCuyZ7bZ7p8bNvlptX4TbUhXyVdm3T-dtlZxoy8pFA>
    <xmx:5NqxZlwOjkggySFHjHBwIxARFPMsIUZK5FyxeaDxzAxm7SLWUhFbdVi6>
Feedback-ID: i5ec1447f:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 6 Aug 2024 04:12:17 -0400 (EDT)
From: "Luke D. Jones" <luke@ljones.dev>
To: linux-input@vger.kernel.org
Cc: linux-kernel@vger.kernel.org,
	bentiss@kernel.org,
	jikos@kernel.org,
	"Luke D. Jones" <luke@ljones.dev>
Subject: [PATCH] hid-asus-ally: Add full gamepad support
Date: Tue,  6 Aug 2024 20:12:12 +1200
Message-ID: <20240806081212.56860-1-luke@ljones.dev>
X-Mailer: git-send-email 2.45.2
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This driver adds full support of the ASUS ROG Ally X gamepad and support
for the Ally 1 xpad configuration options.

- dinput is translated to XBox controller (Ally-X only)
- default mode has the QAM buttons mapped (Ally-X only)
  * left is XBox button
  * right is an XBox + A combo for steam QAM
- force feedback is supported (Ally-X only)
- LED brightness control (0-3)
- LED multicolor class support
- Support all configuration

The configuration options available are:

- Gamepad mode (game, wasd, mouse)
- Remapping each button, plus macro map (hold macro btn and press other)
- Joystrick and trigger deadzones
- Gamepad vibration intensity
- Leds (using multicolor class)
- Button turbo abilities (per button)
- Joystick repsonse curves
- Joystick anti-deadzones

The attribute path tree looks like this:

- `./sys/../<USB HID>/`
  - `joystick_left/
    - `deadzone`
    - `mapping` (mouse, wasd, custom)
    - `anti_deadzone`
    - `response_curve`
    - `calibration`
    - `calibration_reset`
  - `trigger_left/
    - `deadzone`
    - `response_curve`
    - `calibration`
    - `calibration_reset`
  - `gamepad_mode`
  - `button_mapping`
    - `A`
    - `B`
    - `dpad_left`
    - etc

No settings are applied until `apply_all` is written to. The exception is
for calibrations.

While there is calibration ability, it can be difficult to get correct
and is heavily device dependent, as such it is set when written and not
when `apply_all` is written to. On driver load the set calibrations are
retrieved - this may be what you've set in Linux, Windows, or factory
defaults.

This patch provides an excellent default experience for the Ally X
device while the Ally 1 is a little more limited due to Xinput being
used.

Signed-off-by: Luke D. Jones <luke@ljones.dev>
---
 drivers/hid/Kconfig         |    9 +
 drivers/hid/Makefile        |    1 +
 drivers/hid/hid-asus-ally.c | 2281 +++++++++++++++++++++++++++++++++++
 drivers/hid/hid-asus-ally.h |  544 +++++++++
 drivers/hid/hid-asus.c      |   20 +-
 5 files changed, 2853 insertions(+), 2 deletions(-)
 create mode 100644 drivers/hid/hid-asus-ally.c
 create mode 100644 drivers/hid/hid-asus-ally.h

diff --git a/drivers/hid/Kconfig b/drivers/hid/Kconfig
index 08446c89eff6..ea0dbe9111c4 100644
--- a/drivers/hid/Kconfig
+++ b/drivers/hid/Kconfig
@@ -164,6 +164,15 @@ config HID_ASUS
 	- GL553V series
 	- GL753V series
 
+config HID_ASUS_ALLY
+    tristate "Asus Ally gamepad configuration support"
+    depends on USB_HID
+    depends on LEDS_CLASS
+    depends on LEDS_CLASS_MULTICOLOR
+    select POWER_SUPPLY
+    help
+    Support for configuring the Asus ROG Ally gamepad using attributes.
+
 config HID_AUREAL
 	tristate "Aureal"
 	help
diff --git a/drivers/hid/Makefile b/drivers/hid/Makefile
index e40f1ddebbb7..2b2aa8b6f828 100644
--- a/drivers/hid/Makefile
+++ b/drivers/hid/Makefile
@@ -31,6 +31,7 @@ obj-$(CONFIG_HID_APPLE)		+= hid-apple.o
 obj-$(CONFIG_HID_APPLEIR)	+= hid-appleir.o
 obj-$(CONFIG_HID_CREATIVE_SB0540)	+= hid-creative-sb0540.o
 obj-$(CONFIG_HID_ASUS)		+= hid-asus.o
+obj-$(CONFIG_HID_ASUS_ALLY)	+= hid-asus-ally.o
 obj-$(CONFIG_HID_AUREAL)	+= hid-aureal.o
 obj-$(CONFIG_HID_BELKIN)	+= hid-belkin.o
 obj-$(CONFIG_HID_BETOP_FF)	+= hid-betopff.o
diff --git a/drivers/hid/hid-asus-ally.c b/drivers/hid/hid-asus-ally.c
new file mode 100644
index 000000000000..9e8007fc3c19
--- /dev/null
+++ b/drivers/hid/hid-asus-ally.c
@@ -0,0 +1,2281 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+/*
+ *  HID driver for Asus ROG laptops and Ally
+ *
+ *  Copyright (c) 2023 Luke Jones <luke@ljones.dev>
+ */
+
+#include "linux/delay.h"
+#include "linux/device.h"
+#include "linux/err.h"
+#include "linux/input-event-codes.h"
+#include "linux/kstrtox.h"
+#include "linux/printk.h"
+#include "linux/slab.h"
+#include "linux/stddef.h"
+#include "linux/sysfs.h"
+#include <linux/hid.h>
+#include <linux/types.h>
+#include <linux/usb.h>
+#include <linux/leds.h>
+#include <linux/led-class-multicolor.h>
+
+#include "hid-ids.h"
+#include "hid-asus-ally.h"
+
+#define READY_MAX_TRIES 3
+#define FEATURE_REPORT_ID 0x0d
+#define FEATURE_ROG_ALLY_REPORT_ID 0x5a
+#define FEATURE_ROG_ALLY_CODE_PAGE 0xD1
+#define FEATURE_ROG_ALLY_REPORT_SIZE 64
+#define ALLY_X_INPUT_REPORT_USB 0x0B
+#define ALLY_X_INPUT_REPORT_USB_SIZE 16
+
+#define ALLY_CFG_INTF_IN_ADDRESS 0x83
+#define ALLY_CFG_INTF_OUT_ADDRESS 0x04
+#define ALLY_X_INTERFACE_ADDRESS 0x87
+
+#define FEATURE_KBD_LED_REPORT_ID1 0x5d
+#define FEATURE_KBD_LED_REPORT_ID2 0x5e
+
+enum ROG_ALLY_TYPE {
+	ROG_ALLY_TYPE,
+	ROG_ALLY_TYPE_X,
+};
+
+static const struct hid_device_id rog_ally_devices[] = {
+	{ HID_USB_DEVICE(USB_VENDOR_ID_ASUSTEK, USB_DEVICE_ID_ASUSTEK_ROG_NKEY_ALLY),
+	  .driver_data = ROG_ALLY_TYPE },
+	{ HID_USB_DEVICE(USB_VENDOR_ID_ASUSTEK, USB_DEVICE_ID_ASUSTEK_ROG_NKEY_ALLY_X),
+	  .driver_data = ROG_ALLY_TYPE_X },
+	{}
+};
+
+struct KeyCode {
+	const char *label;
+	u8 code;
+};
+
+static const struct KeyCode gamepad_codes[] = {
+	{ "PAD_A", 0x01 },	   { "PAD_B", 0x02 },	      { "PAD_X", 0x03 },
+	{ "PAD_Y", 0x04 },	   { "PAD_LB", 0x05 },	      { "PAD_RB", 0x06 },
+	{ "PAD_LS", 0x07 },	   { "PAD_RS", 0x08 },	      { "PAD_DPAD_UP", 0x09 },
+	{ "PAD_DPAD_DOWN", 0x0a }, { "PAD_DPAD_LEFT", 0x0b }, { "PAD_DPAD_RIGHT", 0x0c },
+	{ "PAD_VIEW", 0x11 },	   { "PAD_MENU", 0x12 },      { "PAD_XBOX", 0x13 }
+};
+
+static const struct KeyCode keyboard_codes[] = { { "KB_M1", 0x8f },
+						 { "KB_M2", 0x8e },
+						 { "KB_ESC", 0x76 },
+						 { "KB_F1", 0x50 },
+						 { "KB_F2", 0x60 },
+						 { "KB_F3", 0x40 },
+						 { "KB_F4", 0x0c },
+						 { "KB_F5", 0x03 },
+						 { "KB_F6", 0x0b },
+						 { "KB_F7", 0x80 },
+						 { "KB_F8", 0x0a },
+						 { "KB_F9", 0x01 },
+						 { "KB_F10", 0x09 },
+						 { "KB_F11", 0x78 },
+						 { "KB_F12", 0x07 },
+						 { "KB_F14", 0x10 },
+						 { "KB_F15", 0x18 },
+						 { "KB_BACKTICK", 0x0e },
+						 { "KB_1", 0x16 },
+						 { "KB_2", 0x1e },
+						 { "KB_3", 0x26 },
+						 { "KB_4", 0x25 },
+						 { "KB_5", 0x2e },
+						 { "KB_6", 0x36 },
+						 { "KB_7", 0x3d },
+						 { "KB_8", 0x3e },
+						 { "KB_9", 0x46 },
+						 { "KB_0", 0x45 },
+						 { "KB_HYPHEN", 0x4e },
+						 { "KB_EQUALS", 0x55 },
+						 { "KB_BACKSPACE", 0x66 },
+						 { "KB_TAB", 0x0d },
+						 { "KB_Q", 0x15 },
+						 { "KB_W", 0x1d },
+						 { "KB_E", 0x24 },
+						 { "KB_R", 0x2d },
+						 { "KB_T", 0x2d },
+						 { "KB_Y", 0x35 },
+						 { "KB_U", 0x3c },
+						 { "KB_I", 0x43 },
+						 { "KB_O", 0x44 },
+						 { "KB_P", 0x4d },
+						 { "KB_LBRACKET", 0x54 },
+						 { "KB_RBRACKET", 0x5b },
+						 { "KB_BACKSLASH", 0x5d },
+						 { "KB_CAPS", 0x58 },
+						 { "KB_A", 0x1c },
+						 { "KB_S", 0x1b },
+						 { "KB_D", 0x23 },
+						 { "KB_F", 0x2b },
+						 { "KB_G", 0x34 },
+						 { "KB_H", 0x33 },
+						 { "KB_J", 0x3b },
+						 { "KB_K", 0x42 },
+						 { "KB_L", 0x4b },
+						 { "KB_SEMI", 0x4c },
+						 { "KB_QUOTE", 0x52 },
+						 { "KB_RET", 0x5a },
+						 { "KB_LSHIFT", 0x88 },
+						 { "KB_Z", 0x1a },
+						 { "KB_X", 0x22 },
+						 { "KB_C", 0x21 },
+						 { "KB_V", 0x2a },
+						 { "KB_B", 0x32 },
+						 { "KB_N", 0x31 },
+						 { "KB_M", 0x3a },
+						 { "KB_COMMA", 0x41 },
+						 { "KB_PERIOD", 0x49 },
+						 { "KB_FWDSLASH", 0x4a },
+						 { "KB_RSHIFT", 0x89 },
+						 { "KB_LCTL", 0x8c },
+						 { "KB_META", 0x82 },
+						 { "KB_LALT", 0xba },
+						 { "KB_SPACE", 0x29 },
+						 { "KB_RALT", 0x8b },
+						 { "KB_MENU", 0x84 },
+						 { "KB_RCTL", 0x8d },
+						 { "KB_PRNTSCN", 0xc3 },
+						 { "KB_SCRLCK", 0x7e },
+						 { "KB_PAUSE", 0x91 },
+						 { "KB_INS", 0xc2 },
+						 { "KB_HOME", 0x94 },
+						 { "KB_PGUP", 0x96 },
+						 { "KB_DEL", 0xc0 },
+						 { "KB_END", 0x95 },
+						 { "KB_PGDWN", 0x97 },
+						 { "KB_UP_ARROW", 0x99 },
+						 { "KB_DOWN_ARROW", 0x98 },
+						 { "KB_LEFT_ARROW", 0x91 },
+						 { "KB_RIGHT_ARROW", 0x9b },
+						 { "NUMPAD_LOCK", 0x77 },
+						 { "NUMPAD_FWDSLASH", 0x90 },
+						 { "NUMPAD_ASTERISK", 0x7c },
+						 { "NUMPAD_HYPHEN", 0x7b },
+						 { "NUMPAD_0", 0x70 },
+						 { "NUMPAD_1", 0x69 },
+						 { "NUMPAD_2", 0x72 },
+						 { "NUMPAD_3", 0x7a },
+						 { "NUMPAD_4", 0x6b },
+						 { "NUMPAD_5", 0x73 },
+						 { "NUMPAD_6", 0x74 },
+						 { "NUMPAD_7", 0x6c },
+						 { "NUMPAD_8", 0x75 },
+						 { "NUMPAD_9", 0x7d },
+						 { "NUMPAD_PLUS", 0x79 },
+						 { "NUMPAD_ENTER", 0x81 },
+						 { "NUMPAD_PERIOD", 0x71 } };
+
+static const struct KeyCode mouse_codes[] = { { "MOUSE_LCLICK", 0x01 },
+					      { "MOUSE_RCLICK", 0x02 },
+					      { "MOUSE_MCLICK", 0x03 },
+					      { "MOUSE_WHEEL_UP", 0x04 },
+					      { "MOUSE_WHEEL_DOWN", 0x05 } };
+
+static const struct KeyCode media_codes[] = {
+	{ "MEDIA_SCREENSHOT", 0x16 },	{ "MEDIA_SHOW_KEYBOARD", 0x19 },
+	{ "MEDIA_SHOW_DESKTOP", 0x1c }, { "MEDIA_START_RECORDING", 0x1e },
+	{ "MEDIA_MIC_OFF", 0x01 },	{ "MEDIA_VOL_DOWN", 0x02 },
+	{ "MEDIA_VOL_UP", 0x03 }
+};
+
+/* The hatswitch outputs integers, we use them to index this X|Y pair */
+static const int hat_values[][2] = {
+	{ 0, 0 }, { 0, -1 }, { 1, -1 }, { 1, 0 },   { 1, 1 },
+	{ 0, 1 }, { -1, 1 }, { -1, 0 }, { -1, -1 },
+};
+
+/* rumble packet structure */
+struct ff_data {
+	u8 enable;
+	u8 magnitude_left;
+	u8 magnitude_right;
+	u8 magnitude_strong;
+	u8 magnitude_weak;
+	u8 pulse_sustain_10ms;
+	u8 pulse_release_10ms;
+	u8 loop_count;
+} __packed;
+
+struct ff_report {
+	u8 report_id;
+	struct ff_data ff;
+} __packed;
+
+struct ally_x_input_report {
+	uint16_t x, y;
+	uint16_t rx, ry;
+	uint16_t z, rz;
+	uint8_t buttons[4];
+} __packed;
+
+struct ally_x_device {
+	struct input_dev *input;
+	struct hid_device *hdev;
+	spinlock_t lock;
+
+	struct ff_report *ff_packet;
+	struct work_struct output_worker;
+	bool output_worker_initialized;
+	/* Prevent multiple queued event due to the enforced delay in worker */
+	bool update_qam_btn;
+	/* Set if the QAM and AC buttons emit Xbox and Xbox+A */
+	bool qam_btns_steam_mode;
+	bool update_ff;
+};
+
+struct ally_rgb_leds {
+	struct hid_device *hdev;
+	/* Need two dev here to enable the 3 step brightness */
+	struct led_classdev led_bright_dev;
+	struct led_classdev_mc led_rgb_dev;
+	struct work_struct work;
+	spinlock_t lock;
+
+	bool removed;
+
+	/* Update the main brightness 0-2 using a single raw write */
+	bool update_bright;
+	unsigned int brightness;
+
+	/* Update the RGB only to keep write efficient */
+	bool update_rgb;
+	uint8_t gamepad_red;
+	uint8_t gamepad_green;
+	uint8_t gamepad_blue;
+};
+
+/* ROG Ally has many settings related to the gamepad, all using the same n-key endpoint */
+struct ally_gamepad_cfg {
+	struct hid_device *hdev;
+	struct input_dev *input;
+
+	enum xpad_mode mode;
+	/*
+	 * index: [joysticks/triggers][left(2 bytes), right(2 bytes)]
+	 * joysticks: 2 bytes: inner, outer
+	 * triggers: 2 bytes: lower, upper
+	 * min/max: 0-64
+	 */
+	u8 deadzones[xpad_mode_mouse][2][4];
+	/*
+	 * index: left, right
+	 * max: 64
+	 */
+	u8 vibration_intensity[xpad_mode_mouse][2];
+	/*
+	 * index: [joysticks][2 byte stepping per point]
+	 * - 4 points of 2 bytes each
+	 * - byte 0 of pair = stick move %
+	 * - byte 1 of pair = stick response %
+	 * - min/max: 1-63
+	 */
+	bool supports_response_curves;
+	u8 response_curve[xpad_mode_mouse][2][8];
+	/*
+	 * left = byte 0, right = byte 1
+	 */
+	bool supports_anti_deadzones;
+	u8 anti_deadzones[xpad_mode_mouse][2];
+	/*
+	 * index: [mode][phys pair][b1, b1 secondary, b2, b2 secondary, blocks of 11]
+	 */
+	u8 key_mapping[xpad_mode_mouse][btn_pair_lt_rt][MAPPING_BLOCK_LEN];
+	/*
+	 * index: [mode][button index]
+	 */
+	u8 turbo_btns[xpad_mode_mouse][TURBO_BLOCK_LEN];
+	/*
+	 * index: [joystick side][Y-stable, Y-min, Y-max, X-stable, X-min, X-max]
+	 */
+	u32 js_calibrations[2][6];
+	/*
+	 * index: [trigger side][stable, max]
+	 */
+	u32 tr_calibrations[2][2];
+};
+
+static struct ally_drvdata {
+	struct hid_device *hdev;
+	struct ally_x_device *ally_x;
+	struct ally_gamepad_cfg *gamepad_cfg;
+	struct ally_rgb_leds *led_rgb;
+} drvdata;
+
+static int asus_dev_get_report(struct hid_device *hdev, u8 *out_buf, size_t out_buf_size)
+{
+	return hid_hw_raw_request(hdev, FEATURE_REPORT_ID, out_buf, out_buf_size,
+				  HID_FEATURE_REPORT, HID_REQ_GET_REPORT);
+}
+
+static int asus_dev_set_report(struct hid_device *hdev, const u8 *buf, size_t buf_size)
+{
+	unsigned char *dmabuf;
+	int ret;
+
+	dmabuf = kmemdup(buf, buf_size, GFP_KERNEL);
+	if (!dmabuf)
+		return -ENOMEM;
+
+	ret = hid_hw_raw_request(hdev, buf[0], dmabuf, buf_size, HID_FEATURE_REPORT,
+				 HID_REQ_SET_REPORT);
+	kfree(dmabuf);
+
+	return ret;
+}
+
+/**************************************************************************************************/
+/* ROG Ally gamepad i/o and force-feedback                                                        */
+/**************************************************************************************************/
+static int ally_x_raw_event(struct ally_x_device *ally_x, struct hid_report *report, u8 *data,
+			    int size)
+{
+	struct ally_x_input_report *in_report;
+	unsigned long flags;
+	u8 byte;
+
+	if (data[0] == 0x0B) {
+		in_report = (struct ally_x_input_report *)&data[1];
+
+		input_report_abs(ally_x->input, ABS_X, in_report->x);
+		input_report_abs(ally_x->input, ABS_Y, in_report->y);
+		input_report_abs(ally_x->input, ABS_RX, in_report->rx);
+		input_report_abs(ally_x->input, ABS_RY, in_report->ry);
+		input_report_abs(ally_x->input, ABS_Z, in_report->z);
+		input_report_abs(ally_x->input, ABS_RZ, in_report->rz);
+
+		byte = in_report->buttons[0];
+		input_report_key(ally_x->input, BTN_A, byte & BIT(0));
+		input_report_key(ally_x->input, BTN_B, byte & BIT(1));
+		input_report_key(ally_x->input, BTN_X, byte & BIT(2));
+		input_report_key(ally_x->input, BTN_Y, byte & BIT(3));
+		input_report_key(ally_x->input, BTN_TL, byte & BIT(4));
+		input_report_key(ally_x->input, BTN_TR, byte & BIT(5));
+		input_report_key(ally_x->input, BTN_SELECT, byte & BIT(6));
+		input_report_key(ally_x->input, BTN_START, byte & BIT(7));
+
+		byte = in_report->buttons[1];
+		input_report_key(ally_x->input, BTN_THUMBL, byte & BIT(0));
+		input_report_key(ally_x->input, BTN_THUMBR, byte & BIT(1));
+		input_report_key(ally_x->input, BTN_MODE, byte & BIT(2));
+
+		byte = in_report->buttons[2];
+		input_report_abs(ally_x->input, ABS_HAT0X, hat_values[byte][0]);
+		input_report_abs(ally_x->input, ABS_HAT0Y, hat_values[byte][1]);
+	}
+	/*
+	 * The MCU used on Ally provides many devices: gamepad, keyboord, mouse, other.
+	 * The AC and QAM buttons route through another interface making it difficult to
+	 * use the events unless we grab those and use them here. Only works for Ally X.
+	 */
+	else if (data[0] == 0x5A) {
+		if (ally_x->qam_btns_steam_mode) {
+			spin_lock_irqsave(&ally_x->lock, flags);
+			if (data[1] == 0x38 && !ally_x->update_qam_btn) {
+				ally_x->update_qam_btn = true;
+				if (ally_x->output_worker_initialized)
+					schedule_work(&ally_x->output_worker);
+			}
+			spin_unlock_irqrestore(&ally_x->lock, flags);
+			/* Left/XBox button. Long press does ctrl+alt+del which we can't catch */
+			input_report_key(ally_x->input, BTN_MODE, data[1] == 0xA6);
+		} else {
+			input_report_key(ally_x->input, KEY_F16, data[1] == 0xA6);
+			input_report_key(ally_x->input, KEY_PROG1, data[1] == 0x38);
+		}
+		/* QAM long press */
+		input_report_key(ally_x->input, KEY_F17, data[1] == 0xA7);
+		/* QAM long press released */
+		input_report_key(ally_x->input, KEY_F18, data[1] == 0xA8);
+	}
+
+	input_sync(ally_x->input);
+
+	return 0;
+}
+
+static struct input_dev *ally_x_alloc_input_dev(struct hid_device *hdev,
+						const char *name_suffix)
+{
+	struct input_dev *input_dev;
+
+	input_dev = devm_input_allocate_device(&hdev->dev);
+	if (!input_dev)
+		return ERR_PTR(-ENOMEM);
+
+	input_dev->id.bustype = hdev->bus;
+	input_dev->id.vendor = hdev->vendor;
+	input_dev->id.product = hdev->product;
+	input_dev->id.version = hdev->version;
+	input_dev->uniq = hdev->uniq;
+	input_dev->name = "ASUS ROG Ally X Gamepad";
+
+	input_set_drvdata(input_dev, hdev);
+
+	return input_dev;
+}
+
+static int ally_x_play_effect(struct input_dev *idev, void *data, struct ff_effect *effect)
+{
+	struct ally_x_device *ally_x = drvdata.ally_x;
+	unsigned long flags;
+
+	if (effect->type != FF_RUMBLE)
+		return 0;
+
+	spin_lock_irqsave(&ally_x->lock, flags);
+	ally_x->ff_packet->ff.magnitude_strong = effect->u.rumble.strong_magnitude / 512;
+	ally_x->ff_packet->ff.magnitude_weak = effect->u.rumble.weak_magnitude / 512;
+	ally_x->update_ff = true;
+	spin_unlock_irqrestore(&ally_x->lock, flags);
+
+	if (ally_x->output_worker_initialized)
+		schedule_work(&ally_x->output_worker);
+
+	return 0;
+}
+
+static void ally_x_work(struct work_struct *work)
+{
+	struct ally_x_device *ally_x = container_of(work, struct ally_x_device, output_worker);
+	struct ff_report *ff_report = NULL;
+	bool update_qam = false;
+	bool update_ff = false;
+	unsigned long flags;
+
+	spin_lock_irqsave(&ally_x->lock, flags);
+	update_ff = ally_x->update_ff;
+	if (ally_x->update_ff) {
+		ff_report = kmemdup(ally_x->ff_packet, sizeof(*ally_x->ff_packet), GFP_KERNEL);
+		ally_x->update_ff = false;
+	}
+	update_qam = ally_x->update_qam_btn;
+	spin_unlock_irqrestore(&ally_x->lock, flags);
+
+	if (update_ff && ff_report) {
+		ff_report->ff.magnitude_left = ff_report->ff.magnitude_strong;
+		ff_report->ff.magnitude_right = ff_report->ff.magnitude_weak;
+		asus_dev_set_report(ally_x->hdev, (u8 *)ff_report, sizeof(*ff_report));
+	}
+	kfree(ff_report);
+
+	if (update_qam) {
+		/*
+		 * The sleeps here are required to allow steam to register the button combo.
+		 */
+		usleep_range(1000, 2000);
+		input_report_key(ally_x->input, BTN_MODE, 1);
+		input_sync(ally_x->input);
+
+		msleep(80);
+		input_report_key(ally_x->input, BTN_A, 1);
+		input_sync(ally_x->input);
+
+		msleep(80);
+		input_report_key(ally_x->input, BTN_A, 0);
+		input_sync(ally_x->input);
+
+		msleep(80);
+		input_report_key(ally_x->input, BTN_MODE, 0);
+		input_sync(ally_x->input);
+
+		spin_lock_irqsave(&ally_x->lock, flags);
+		ally_x->update_qam_btn = false;
+		spin_unlock_irqrestore(&ally_x->lock, flags);
+	}
+}
+
+static struct input_dev *ally_x_setup_input(struct hid_device *hdev)
+{
+	int ret, abs_min = 0, js_abs_max = 65535, tr_abs_max = 1023;
+	struct input_dev *input;
+
+	input = ally_x_alloc_input_dev(hdev, NULL);
+	if (IS_ERR(input))
+		return ERR_CAST(input);
+
+	input_set_abs_params(input, ABS_X, abs_min, js_abs_max, 0, 0);
+	input_set_abs_params(input, ABS_Y, abs_min, js_abs_max, 0, 0);
+	input_set_abs_params(input, ABS_RX, abs_min, js_abs_max, 0, 0);
+	input_set_abs_params(input, ABS_RY, abs_min, js_abs_max, 0, 0);
+	input_set_abs_params(input, ABS_Z, abs_min, tr_abs_max, 0, 0);
+	input_set_abs_params(input, ABS_RZ, abs_min, tr_abs_max, 0, 0);
+	input_set_abs_params(input, ABS_HAT0X, -1, 1, 0, 0);
+	input_set_abs_params(input, ABS_HAT0Y, -1, 1, 0, 0);
+	input_set_capability(input, EV_KEY, BTN_A);
+	input_set_capability(input, EV_KEY, BTN_B);
+	input_set_capability(input, EV_KEY, BTN_X);
+	input_set_capability(input, EV_KEY, BTN_Y);
+	input_set_capability(input, EV_KEY, BTN_TL);
+	input_set_capability(input, EV_KEY, BTN_TR);
+	input_set_capability(input, EV_KEY, BTN_SELECT);
+	input_set_capability(input, EV_KEY, BTN_START);
+	input_set_capability(input, EV_KEY, BTN_MODE);
+	input_set_capability(input, EV_KEY, BTN_THUMBL);
+	input_set_capability(input, EV_KEY, BTN_THUMBR);
+
+	input_set_capability(input, EV_KEY, KEY_PROG1);
+	input_set_capability(input, EV_KEY, KEY_F16);
+	input_set_capability(input, EV_KEY, KEY_F17);
+	input_set_capability(input, EV_KEY, KEY_F18);
+
+	input_set_capability(input, EV_FF, FF_RUMBLE);
+	input_ff_create_memless(input, NULL, ally_x_play_effect);
+
+	ret = input_register_device(input);
+	if (ret)
+		return ERR_PTR(ret);
+
+	return input;
+}
+
+static ssize_t ally_x_qam_mode_show(struct device *dev, struct device_attribute *attr,
+				    char *buf)
+{
+	struct ally_x_device *ally_x = drvdata.ally_x;
+
+	return sysfs_emit(buf, "%d\n", ally_x->qam_btns_steam_mode);
+}
+
+static ssize_t ally_x_qam_mode_store(struct device *dev, struct device_attribute *attr,
+				     const char *buf, size_t count)
+{
+	struct ally_x_device *ally_x = drvdata.ally_x;
+	bool val;
+	int ret;
+
+	ret = kstrtobool(buf, &val);
+	if (ret < 0)
+		return ret;
+
+	ally_x->qam_btns_steam_mode = val;
+
+	return count;
+}
+ALLY_DEVICE_ATTR_RW(ally_x_qam_mode, qam_mode);
+
+static struct ally_x_device *ally_x_create(struct hid_device *hdev)
+{
+	uint8_t max_output_report_size;
+	struct ally_x_device *ally_x;
+	struct ff_report *report;
+	int ret;
+
+	ally_x = devm_kzalloc(&hdev->dev, sizeof(*ally_x), GFP_KERNEL);
+	if (!ally_x)
+		return ERR_PTR(-ENOMEM);
+
+	ally_x->hdev = hdev;
+	INIT_WORK(&ally_x->output_worker, ally_x_work);
+	spin_lock_init(&ally_x->lock);
+	ally_x->output_worker_initialized = true;
+	ally_x->qam_btns_steam_mode =
+		true; /* Always default to steam mode, it can be changed by userspace attr */
+
+	max_output_report_size = sizeof(struct ally_x_input_report);
+	report = devm_kzalloc(&hdev->dev, sizeof(*report), GFP_KERNEL);
+	if (!report) {
+		ret = -ENOMEM;
+		goto free_ally_x;
+	}
+
+	/* None of these bytes will change for the FF command for now */
+	report->report_id = 0x0D;
+	report->ff.enable = 0x0F; /* Enable all by default */
+	report->ff.pulse_sustain_10ms = 0xFF; /* Duration */
+	report->ff.pulse_release_10ms = 0x00; /* Start Delay */
+	report->ff.loop_count = 0xEB; /* Loop Count */
+	ally_x->ff_packet = report;
+
+	ally_x->input = ally_x_setup_input(hdev);
+	if (IS_ERR(ally_x->input)) {
+		ret = PTR_ERR(ally_x->input);
+		goto free_ff_packet;
+	}
+
+	if (sysfs_create_file(&hdev->dev.kobj, &dev_attr_ally_x_qam_mode.attr)) {
+		ret = -ENODEV;
+		goto unregister_input;
+	}
+
+	ally_x->update_ff = true;
+	if (ally_x->output_worker_initialized)
+		schedule_work(&ally_x->output_worker);
+
+	hid_info(hdev, "Registered Ally X controller using %s\n",
+		 dev_name(&ally_x->input->dev));
+	return ally_x;
+
+unregister_input:
+	input_unregister_device(ally_x->input);
+free_ff_packet:
+	kfree(ally_x->ff_packet);
+free_ally_x:
+	kfree(ally_x);
+	return ERR_PTR(ret);
+}
+
+static void ally_x_remove(struct hid_device *hdev)
+{
+	struct ally_x_device *ally_x = drvdata.ally_x;
+	unsigned long flags;
+
+	spin_lock_irqsave(&ally_x->lock, flags);
+	ally_x->output_worker_initialized = false;
+	spin_unlock_irqrestore(&ally_x->lock, flags);
+	cancel_work_sync(&ally_x->output_worker);
+	sysfs_remove_file(&hdev->dev.kobj, &dev_attr_ally_x_qam_mode.attr);
+}
+
+/**************************************************************************************************/
+/* ROG Ally configuration                                                                         */
+/**************************************************************************************************/
+static int __gamepad_write_all_to_mcu(struct hid_device *hdev,
+				      struct ally_gamepad_cfg *ally_cfg);
+
+static int process_key_code(const struct KeyCode *codes, int code_count, const char *buf_copy,
+			    u8 *out, int out_idx)
+{
+	for (int i = 0; i < code_count; i++) {
+		if (strcmp(buf_copy, codes[i].label) == 0) {
+			out[out_idx] = codes[i].code;
+			return 0; // Found
+		}
+	}
+	return -EINVAL; // Not found
+}
+
+static int __string_to_key_code(const char *buf, u8 *out, int out_len)
+{
+	char buf_copy[32];
+	u8 *save_buf;
+
+	if (out_len != BTN_CODE_LEN)
+		return -EINVAL;
+
+	save_buf = kzalloc(out_len, GFP_KERNEL);
+	if (!save_buf)
+		return -ENOMEM;
+	memcpy(save_buf, out, out_len);
+	memset(out, 0, out_len); /* always clear before adjusting */
+
+	strscpy(buf_copy, buf);
+	buf_copy[strcspn(buf_copy, "\n")] = 0;
+
+	/* Gamepad group */
+	out[0] = 0x01;
+	if (process_key_code(gamepad_codes, ARRAY_SIZE(gamepad_codes), buf_copy, out, 1) == 0)
+		goto success;
+
+	/* Keyboard group */
+	out[0] = 0x02;
+	if (process_key_code(keyboard_codes, ARRAY_SIZE(keyboard_codes), buf_copy, out, 2) == 0)
+		goto success;
+
+	/* Mouse group */
+	out[0] = 0x03;
+	if (process_key_code(mouse_codes, ARRAY_SIZE(mouse_codes), buf_copy, out, 4) == 0)
+		goto success;
+
+	/* Media group */
+	out[0] = 0x05;
+	if (process_key_code(media_codes, ARRAY_SIZE(media_codes), buf_copy, out, 3) == 0)
+		goto success;
+
+	/* Restore bytes if invalid input */
+	memcpy(out, save_buf, out_len);
+	kfree(save_buf);
+	return -EINVAL;
+
+success:
+	kfree(save_buf);
+	return 0;
+}
+
+static const char *key_code_to_string(const struct KeyCode *codes, int code_count, u8 code)
+{
+	for (int i = 0; i < code_count; i++) {
+		if (codes[i].code == code)
+			return codes[i].label;
+	}
+	return "";
+}
+
+static u8 *__get_btn_block(struct ally_gamepad_cfg *ally_cfg, enum btn_pair pair,
+			   enum btn_pair_side side, bool secondary)
+{
+	int offs;
+
+	offs = side ? MAPPING_BLOCK_LEN / 2 : 0;
+	offs = secondary ? offs + BTN_CODE_LEN : offs;
+	return ally_cfg->key_mapping[ally_cfg->mode - 1][pair - 1] + offs;
+}
+
+static const char *__btn_map_to_string(struct ally_gamepad_cfg *ally_cfg, enum btn_pair pair,
+				       enum btn_pair_side side, bool secondary)
+{
+	u8 *out_arg = __get_btn_block(ally_cfg, pair, side, secondary);
+
+	switch (out_arg[0]) {
+	case 0x01: // Gamepad buttons
+		return key_code_to_string(gamepad_codes, ARRAY_SIZE(gamepad_codes), out_arg[1]);
+	case 0x02: // Keyboard keys
+		return key_code_to_string(keyboard_codes, ARRAY_SIZE(keyboard_codes),
+					  out_arg[2]);
+	case 0x03: // Mouse buttons
+		return key_code_to_string(mouse_codes, ARRAY_SIZE(mouse_codes), out_arg[4]);
+	case 0x05: // Media controls
+		return key_code_to_string(media_codes, ARRAY_SIZE(media_codes), out_arg[3]);
+	default:
+		return "";
+	}
+}
+
+/* ASUS ROG Ally device specific attributes */
+
+/* This should be called before any attempts to set device functions */
+static int __gamepad_check_ready(struct hid_device *hdev)
+{
+	int ret, count;
+	u8 *hidbuf;
+
+	hidbuf = kzalloc(FEATURE_ROG_ALLY_REPORT_SIZE, GFP_KERNEL);
+	if (!hidbuf)
+		return -ENOMEM;
+
+	ret = 0;
+	for (count = 0; count < READY_MAX_TRIES; count++) {
+		hidbuf[0] = FEATURE_ROG_ALLY_REPORT_ID;
+		hidbuf[1] = FEATURE_ROG_ALLY_CODE_PAGE;
+		hidbuf[2] = xpad_cmd_check_ready;
+		hidbuf[3] = 01;
+		ret = asus_dev_set_report(hdev, hidbuf, FEATURE_ROG_ALLY_REPORT_SIZE);
+		if (ret < 0)
+			hid_warn(hdev, "ROG Ally check failed set report: %d\n", ret);
+
+		hidbuf[0] = hidbuf[1] = hidbuf[2] = hidbuf[3] = 0;
+		ret = asus_dev_get_report(hdev, hidbuf, FEATURE_ROG_ALLY_REPORT_SIZE);
+		if (ret < 0)
+			hid_warn(hdev, "ROG Ally check failed get report: %d\n", ret);
+
+		ret = hidbuf[2] == xpad_cmd_check_ready;
+		if (ret)
+			break;
+		usleep_range(
+			1000,
+			2000); /* don't spam the entire loop in less than USB response time */
+	}
+
+	if (count == READY_MAX_TRIES)
+		hid_warn(hdev, "ROG Ally never responded with a ready\n");
+
+	kfree(hidbuf);
+	return ret;
+}
+
+/* BUTTON REMAPPING *******************************************************************************/
+static void __btn_pair_to_pkt(struct ally_gamepad_cfg *ally_cfg, enum btn_pair pair, u8 *out,
+			      int out_len)
+{
+	out[0] = FEATURE_ROG_ALLY_REPORT_ID;
+	out[1] = FEATURE_ROG_ALLY_CODE_PAGE;
+	out[2] = xpad_cmd_set_mapping;
+	out[3] = pair;
+	out[4] = xpad_cmd_len_mapping;
+	memcpy(&out[5], &ally_cfg->key_mapping[ally_cfg->mode - 1][pair - 1],
+	       MAPPING_BLOCK_LEN);
+}
+
+/* Store the button setting in driver data. Does not apply to device until __gamepad_set_mapping */
+static int __gamepad_mapping_store(struct ally_gamepad_cfg *ally_cfg, const char *buf,
+				   enum btn_pair pair, int side, bool secondary)
+{
+	u8 *out_arg;
+
+	out_arg = __get_btn_block(ally_cfg, pair, side, secondary);
+
+	return __string_to_key_code(buf, out_arg, BTN_CODE_LEN);
+}
+
+/* Apply the mapping pair to the device */
+static int __gamepad_set_mapping(struct hid_device *hdev, struct ally_gamepad_cfg *ally_cfg,
+				 enum btn_pair pair)
+{
+	u8 *hidbuf;
+	int ret;
+
+	ret = __gamepad_check_ready(hdev);
+	if (ret < 0)
+		return ret;
+
+	hidbuf = kzalloc(FEATURE_ROG_ALLY_REPORT_SIZE, GFP_KERNEL);
+	if (!hidbuf)
+		return -ENOMEM;
+
+	__btn_pair_to_pkt(ally_cfg, pair, hidbuf, FEATURE_ROG_ALLY_REPORT_SIZE);
+	ret = asus_dev_set_report(hdev, hidbuf, FEATURE_ROG_ALLY_REPORT_SIZE);
+
+	kfree(hidbuf);
+
+	return ret;
+}
+
+static ssize_t btn_mapping_apply_store(struct device *dev, struct device_attribute *attr,
+				       const char *buf, size_t count)
+{
+	struct ally_gamepad_cfg *ally_cfg = drvdata.gamepad_cfg;
+	struct hid_device *hdev = to_hid_device(dev);
+	int ret;
+
+	if (!drvdata.gamepad_cfg)
+		return -ENODEV;
+
+	ret = __gamepad_write_all_to_mcu(hdev, ally_cfg);
+	if (ret < 0)
+		return ret;
+
+	return count;
+}
+ALLY_DEVICE_ATTR_WO(btn_mapping_apply, apply_all);
+
+/* BUTTON TURBO ***********************************************************************************/
+static int __btn_turbo_index(enum btn_pair pair, int side)
+{
+	return (pair - 1) * (2 * TURBO_BLOCK_STEP) + (side * TURBO_BLOCK_STEP);
+};
+
+static int __gamepad_turbo_show(struct device *dev, enum btn_pair pair, int side)
+{
+	struct ally_gamepad_cfg *ally_cfg = drvdata.gamepad_cfg;
+
+	if (!drvdata.gamepad_cfg)
+		return -ENODEV;
+
+	return ally_cfg->turbo_btns[ally_cfg->mode - 1][__btn_turbo_index(pair, side)];
+};
+
+static int __gamepad_turbo_store(struct device *dev, const char *buf, enum btn_pair pair,
+				 int side)
+{
+	struct ally_gamepad_cfg *ally_cfg = drvdata.gamepad_cfg;
+	int ret, val;
+
+	if (!drvdata.gamepad_cfg)
+		return -ENODEV;
+
+	ret = kstrtoint(buf, 0, &val);
+	if (ret)
+		return ret;
+	if (val < 0 || val > 16)
+		return -EINVAL;
+
+	ally_cfg->turbo_btns[ally_cfg->mode - 1][__btn_turbo_index(pair, side)] = val;
+
+	return 0;
+};
+
+/* button map attributes, regular and macro*/
+ALLY_BTN_MAPPING(m2, btn_pair_m1_m2, btn_pair_side_left);
+ALLY_BTN_MAPPING(m1, btn_pair_m1_m2, btn_pair_side_right);
+ALLY_BTN_MAPPING(a, btn_pair_a_b, btn_pair_side_left);
+ALLY_BTN_MAPPING(b, btn_pair_a_b, btn_pair_side_right);
+ALLY_BTN_MAPPING(x, btn_pair_x_y, btn_pair_side_left);
+ALLY_BTN_MAPPING(y, btn_pair_x_y, btn_pair_side_right);
+ALLY_BTN_MAPPING(lb, btn_pair_lb_rb, btn_pair_side_left);
+ALLY_BTN_MAPPING(rb, btn_pair_lb_rb, btn_pair_side_right);
+ALLY_BTN_MAPPING(ls, btn_pair_ls_rs, btn_pair_side_left);
+ALLY_BTN_MAPPING(rs, btn_pair_ls_rs, btn_pair_side_right);
+ALLY_BTN_MAPPING(lt, btn_pair_lt_rt, btn_pair_side_left);
+ALLY_BTN_MAPPING(rt, btn_pair_lt_rt, btn_pair_side_right);
+ALLY_BTN_MAPPING(dpad_u, btn_pair_dpad_u_d, btn_pair_side_left);
+ALLY_BTN_MAPPING(dpad_d, btn_pair_dpad_u_d, btn_pair_side_right);
+ALLY_BTN_MAPPING(dpad_l, btn_pair_dpad_l_r, btn_pair_side_left);
+ALLY_BTN_MAPPING(dpad_r, btn_pair_dpad_l_r, btn_pair_side_right);
+ALLY_BTN_MAPPING(view, btn_pair_view_menu, btn_pair_side_left);
+ALLY_BTN_MAPPING(menu, btn_pair_view_menu, btn_pair_side_right);
+
+static void __gamepad_mapping_xpad_default(struct ally_gamepad_cfg *ally_cfg)
+{
+	memcpy(&ally_cfg->key_mapping[0][0], &XPAD_DEF1, MAPPING_BLOCK_LEN);
+	memcpy(&ally_cfg->key_mapping[0][1], &XPAD_DEF2, MAPPING_BLOCK_LEN);
+	memcpy(&ally_cfg->key_mapping[0][2], &XPAD_DEF3, MAPPING_BLOCK_LEN);
+	memcpy(&ally_cfg->key_mapping[0][3], &XPAD_DEF4, MAPPING_BLOCK_LEN);
+	memcpy(&ally_cfg->key_mapping[0][4], &XPAD_DEF5, MAPPING_BLOCK_LEN);
+	memcpy(&ally_cfg->key_mapping[0][5], &XPAD_DEF6, MAPPING_BLOCK_LEN);
+	memcpy(&ally_cfg->key_mapping[0][6], &XPAD_DEF7, MAPPING_BLOCK_LEN);
+	memcpy(&ally_cfg->key_mapping[0][7], &XPAD_DEF8, MAPPING_BLOCK_LEN);
+	memcpy(&ally_cfg->key_mapping[0][8], &XPAD_DEF9, MAPPING_BLOCK_LEN);
+}
+
+static void __gamepad_mapping_wasd_default(struct ally_gamepad_cfg *ally_cfg)
+{
+	memcpy(&ally_cfg->key_mapping[1][0], &WASD_DEF1, MAPPING_BLOCK_LEN);
+	memcpy(&ally_cfg->key_mapping[1][1], &WASD_DEF2, MAPPING_BLOCK_LEN);
+	memcpy(&ally_cfg->key_mapping[1][2], &WASD_DEF3, MAPPING_BLOCK_LEN);
+	memcpy(&ally_cfg->key_mapping[1][3], &WASD_DEF4, MAPPING_BLOCK_LEN);
+	memcpy(&ally_cfg->key_mapping[1][4], &WASD_DEF5, MAPPING_BLOCK_LEN);
+	memcpy(&ally_cfg->key_mapping[1][5], &WASD_DEF6, MAPPING_BLOCK_LEN);
+	memcpy(&ally_cfg->key_mapping[1][6], &WASD_DEF7, MAPPING_BLOCK_LEN);
+	memcpy(&ally_cfg->key_mapping[1][7], &WASD_DEF8, MAPPING_BLOCK_LEN);
+	memcpy(&ally_cfg->key_mapping[1][8], &WASD_DEF9, MAPPING_BLOCK_LEN);
+}
+
+static ssize_t btn_mapping_reset_store(struct device *dev, struct device_attribute *attr,
+				       const char *buf, size_t count)
+{
+	struct ally_gamepad_cfg *ally_cfg = drvdata.gamepad_cfg;
+
+	if (!drvdata.gamepad_cfg)
+		return -ENODEV;
+
+	switch (ally_cfg->mode) {
+	case xpad_mode_game:
+		__gamepad_mapping_xpad_default(ally_cfg);
+		break;
+	case xpad_mode_wasd:
+		__gamepad_mapping_wasd_default(ally_cfg);
+		break;
+	default:
+		__gamepad_mapping_xpad_default(ally_cfg);
+		break;
+	}
+
+	return count;
+}
+
+ALLY_DEVICE_ATTR_WO(btn_mapping_reset, reset_btn_mapping);
+
+/* GAMEPAD MODE ***********************************************************************************/
+static ssize_t __gamepad_set_mode(struct hid_device *hdev, struct ally_gamepad_cfg *ally_cfg,
+				  int val)
+{
+	u8 *hidbuf;
+	int ret;
+
+	ret = __gamepad_check_ready(hdev);
+	if (ret < 0)
+		return ret;
+
+	hidbuf = kzalloc(FEATURE_ROG_ALLY_REPORT_SIZE, GFP_KERNEL);
+	if (!hidbuf)
+		return -ENOMEM;
+
+	hidbuf[0] = FEATURE_ROG_ALLY_REPORT_ID;
+	hidbuf[1] = FEATURE_ROG_ALLY_CODE_PAGE;
+	hidbuf[2] = xpad_cmd_set_mode;
+	hidbuf[3] = xpad_cmd_len_mode;
+	hidbuf[4] = val;
+
+	ret = __gamepad_check_ready(hdev);
+	if (ret < 0)
+		goto report_fail;
+
+	ret = asus_dev_set_report(hdev, hidbuf, FEATURE_ROG_ALLY_REPORT_SIZE);
+	if (ret < 0)
+		goto report_fail;
+
+	ret = __gamepad_write_all_to_mcu(hdev, ally_cfg);
+	if (ret < 0)
+		goto report_fail;
+
+report_fail:
+	kfree(hidbuf);
+	return ret;
+}
+
+static ssize_t gamepad_mode_show(struct device *dev, struct device_attribute *attr, char *buf)
+{
+	struct ally_gamepad_cfg *ally_cfg = drvdata.gamepad_cfg;
+
+	if (!drvdata.gamepad_cfg)
+		return -ENODEV;
+
+	return sysfs_emit(buf, "%d\n", ally_cfg->mode);
+}
+
+static ssize_t gamepad_mode_store(struct device *dev, struct device_attribute *attr,
+				  const char *buf, size_t count)
+{
+	struct hid_device *hdev = to_hid_device(dev);
+	struct ally_gamepad_cfg *ally_cfg = drvdata.gamepad_cfg;
+	int ret, val;
+
+	if (!drvdata.gamepad_cfg)
+		return -ENODEV;
+
+	ret = kstrtoint(buf, 0, &val);
+	if (ret)
+		return ret;
+
+	if (val < xpad_mode_game || val > xpad_mode_mouse)
+		return -EINVAL;
+
+	ally_cfg->mode = val;
+
+	ret = __gamepad_set_mode(hdev, ally_cfg, val);
+	if (ret < 0)
+		return ret;
+
+	return count;
+}
+
+DEVICE_ATTR_RW(gamepad_mode);
+
+/* VIBRATION INTENSITY ****************************************************************************/
+static ssize_t gamepad_vibration_intensity_index_show(struct device *dev,
+						      struct device_attribute *attr, char *buf)
+{
+	return sysfs_emit(buf, "left right\n");
+}
+
+ALLY_DEVICE_ATTR_RO(gamepad_vibration_intensity_index, vibration_intensity_index);
+
+static ssize_t __gamepad_write_vibe_intensity_to_mcu(struct hid_device *hdev,
+						     struct ally_gamepad_cfg *ally_cfg)
+{
+	u8 *hidbuf;
+	int ret;
+
+	ret = __gamepad_check_ready(hdev);
+	if (ret < 0)
+		return ret;
+
+	hidbuf = kzalloc(FEATURE_ROG_ALLY_REPORT_SIZE, GFP_KERNEL);
+	if (!hidbuf)
+		return -ENOMEM;
+
+	hidbuf[0] = FEATURE_ROG_ALLY_REPORT_ID;
+	hidbuf[1] = FEATURE_ROG_ALLY_CODE_PAGE;
+	hidbuf[2] = xpad_cmd_set_vibe_intensity;
+	hidbuf[3] = xpad_cmd_len_vibe_intensity;
+	hidbuf[4] = ally_cfg->vibration_intensity[ally_cfg->mode - 1][btn_pair_side_left];
+	hidbuf[5] = ally_cfg->vibration_intensity[ally_cfg->mode - 1][btn_pair_side_right];
+
+	ret = __gamepad_check_ready(hdev);
+	if (ret < 0)
+		goto report_fail;
+
+	ret = asus_dev_set_report(hdev, hidbuf, FEATURE_ROG_ALLY_REPORT_SIZE);
+	if (ret < 0)
+		goto report_fail;
+
+report_fail:
+	kfree(hidbuf);
+	return ret;
+}
+
+static ssize_t gamepad_vibration_intensity_show(struct device *dev,
+						struct device_attribute *attr, char *buf)
+{
+	struct ally_gamepad_cfg *ally_cfg = drvdata.gamepad_cfg;
+
+	if (!drvdata.gamepad_cfg)
+		return -ENODEV;
+
+	return sysfs_emit(
+		buf, "%d %d\n",
+		ally_cfg->vibration_intensity[ally_cfg->mode - 1][btn_pair_side_left],
+		ally_cfg->vibration_intensity[ally_cfg->mode - 1][btn_pair_side_right]);
+}
+
+static ssize_t gamepad_vibration_intensity_store(struct device *dev,
+						 struct device_attribute *attr, const char *buf,
+						 size_t count)
+{
+	struct hid_device *hdev = to_hid_device(dev);
+	struct ally_gamepad_cfg *ally_cfg = drvdata.gamepad_cfg;
+	u32 left, right;
+	int ret;
+
+	if (!drvdata.gamepad_cfg)
+		return -ENODEV;
+
+	if (sscanf(buf, "%d %d", &left, &right) != 2)
+		return -EINVAL;
+
+	if (left > 64 || right > 64)
+		return -EINVAL;
+
+	ally_cfg->vibration_intensity[ally_cfg->mode - 1][btn_pair_side_left] = left;
+	ally_cfg->vibration_intensity[ally_cfg->mode - 1][btn_pair_side_right] = right;
+
+	ret = __gamepad_write_vibe_intensity_to_mcu(hdev, ally_cfg);
+	if (ret < 0)
+		return ret;
+
+	return count;
+}
+
+ALLY_DEVICE_ATTR_RW(gamepad_vibration_intensity, vibration_intensity);
+
+/* ROOT LEVEL ATTRS *******************************************************************************/
+static struct attribute *gamepad_device_attrs[] = {
+	&dev_attr_gamepad_mode.attr,
+	&dev_attr_btn_mapping_reset.attr,
+	&dev_attr_btn_mapping_apply.attr,
+	&dev_attr_gamepad_vibration_intensity.attr,
+	&dev_attr_gamepad_vibration_intensity_index.attr,
+	NULL
+};
+
+static const struct attribute_group ally_controller_attr_group = {
+	.attrs = gamepad_device_attrs,
+};
+
+/* ANALOGUE DEADZONES *****************************************************************************/
+static ssize_t __gamepad_set_deadzones(struct hid_device *hdev,
+				       struct ally_gamepad_cfg *ally_cfg)
+{
+	u8 *hidbuf;
+	int ret;
+
+	ret = __gamepad_check_ready(hdev);
+	if (ret < 0)
+		return ret;
+
+	hidbuf = kzalloc(FEATURE_ROG_ALLY_REPORT_SIZE, GFP_KERNEL);
+	if (!hidbuf)
+		return -ENOMEM;
+
+	hidbuf[0] = FEATURE_ROG_ALLY_REPORT_ID;
+	hidbuf[1] = FEATURE_ROG_ALLY_CODE_PAGE;
+	hidbuf[2] = xpad_cmd_set_js_dz;
+	hidbuf[3] = xpad_cmd_len_deadzone;
+	hidbuf[4] = ally_cfg->deadzones[ally_cfg->mode - 1][0][0];
+	hidbuf[5] = ally_cfg->deadzones[ally_cfg->mode - 1][0][1];
+	hidbuf[6] = ally_cfg->deadzones[ally_cfg->mode - 1][0][2];
+	hidbuf[7] = ally_cfg->deadzones[ally_cfg->mode - 1][0][3];
+
+	ret = asus_dev_set_report(hdev, hidbuf, FEATURE_ROG_ALLY_REPORT_SIZE);
+	if (ret < 0)
+		goto end;
+
+	hidbuf[2] = xpad_cmd_set_tr_dz;
+	hidbuf[4] = ally_cfg->deadzones[ally_cfg->mode - 1][1][0];
+	hidbuf[5] = ally_cfg->deadzones[ally_cfg->mode - 1][1][1];
+	hidbuf[6] = ally_cfg->deadzones[ally_cfg->mode - 1][1][2];
+	hidbuf[7] = ally_cfg->deadzones[ally_cfg->mode - 1][1][3];
+
+	ret = asus_dev_set_report(hdev, hidbuf, FEATURE_ROG_ALLY_REPORT_SIZE);
+	if (ret < 0)
+		goto end;
+
+end:
+	kfree(hidbuf);
+	return ret;
+}
+
+static ssize_t __gamepad_store_deadzones(struct ally_gamepad_cfg *ally_cfg, enum xpad_axis axis,
+					 const char *buf)
+{
+	int cmd, side, is_tr;
+	u32 inner, outer;
+
+	if (sscanf(buf, "%d %d", &inner, &outer) != 2)
+		return -EINVAL;
+
+	if (inner > 64 || outer > 64 || inner > outer)
+		return -EINVAL;
+
+	is_tr = axis > xpad_axis_xy_right;
+	side = axis == xpad_axis_xy_right || axis == xpad_axis_z_right ? 2 : 0;
+	cmd = is_tr ? xpad_cmd_set_js_dz : xpad_cmd_set_tr_dz;
+
+	ally_cfg->deadzones[ally_cfg->mode - 1][is_tr][side] = inner;
+	ally_cfg->deadzones[ally_cfg->mode - 1][is_tr][side + 1] = outer;
+
+	return 0;
+}
+
+static ssize_t axis_xyz_deadzone_index_show(struct device *dev, struct device_attribute *attr,
+					    char *buf)
+{
+	return sysfs_emit(buf, "inner outer\n");
+}
+
+ALLY_DEVICE_ATTR_RO(axis_xyz_deadzone_index, deadzone_index);
+
+ALLY_AXIS_DEADZONE(xpad_axis_xy_left, deadzone);
+ALLY_AXIS_DEADZONE(xpad_axis_xy_right, deadzone);
+ALLY_AXIS_DEADZONE(xpad_axis_z_left, deadzone);
+ALLY_AXIS_DEADZONE(xpad_axis_z_right, deadzone);
+
+/* ANTI-DEADZONES *********************************************************************************/
+static ssize_t __gamepad_write_js_ADZ_to_mcu(struct hid_device *hdev,
+					     struct ally_gamepad_cfg *ally_cfg)
+{
+	u8 *hidbuf;
+	int ret;
+
+	ret = __gamepad_check_ready(hdev);
+	if (ret < 0)
+		return ret;
+
+	hidbuf = kzalloc(FEATURE_ROG_ALLY_REPORT_SIZE, GFP_KERNEL);
+	if (!hidbuf)
+		return -ENOMEM;
+
+	hidbuf[0] = FEATURE_ROG_ALLY_REPORT_ID;
+	hidbuf[1] = FEATURE_ROG_ALLY_CODE_PAGE;
+	hidbuf[2] = xpad_cmd_set_adz;
+	hidbuf[3] = xpad_cmd_len_adz;
+	hidbuf[4] = ally_cfg->anti_deadzones[ally_cfg->mode - 1][btn_pair_side_left];
+	hidbuf[5] = ally_cfg->anti_deadzones[ally_cfg->mode - 1][btn_pair_side_right];
+
+	ret = __gamepad_check_ready(hdev);
+	if (ret < 0)
+		goto report_fail;
+
+	ret = asus_dev_set_report(hdev, hidbuf, FEATURE_ROG_ALLY_REPORT_SIZE);
+	if (ret < 0)
+		goto report_fail;
+
+report_fail:
+	kfree(hidbuf);
+	return ret;
+}
+
+static ssize_t __gamepad_js_ADZ_store(struct device *dev, const char *buf,
+				      enum btn_pair_side side)
+{
+	struct ally_gamepad_cfg *ally_cfg = drvdata.gamepad_cfg;
+	int ret, val;
+
+	if (!drvdata.gamepad_cfg)
+		return -ENODEV;
+
+	ret = kstrtoint(buf, 0, &val);
+	if (ret)
+		return ret;
+
+	if (val < 0 || val > 32)
+		return -EINVAL;
+
+	ally_cfg->anti_deadzones[ally_cfg->mode - 1][side] = val;
+
+	return ret;
+}
+
+static ssize_t xpad_axis_xy_left_ADZ_show(struct device *dev, struct device_attribute *attr,
+					  char *buf)
+{
+	struct ally_gamepad_cfg *ally_cfg = drvdata.gamepad_cfg;
+
+	if (!drvdata.gamepad_cfg)
+		return -ENODEV;
+
+	return sysfs_emit(buf, "%d\n",
+			  ally_cfg->anti_deadzones[ally_cfg->mode - 1][btn_pair_side_left]);
+}
+
+static ssize_t xpad_axis_xy_left_ADZ_store(struct device *dev, struct device_attribute *attr,
+					   const char *buf, size_t count)
+{
+	int ret = __gamepad_js_ADZ_store(dev, buf, btn_pair_side_left);
+
+	if (ret)
+		return ret;
+
+	return count;
+}
+
+ALLY_DEVICE_ATTR_RW(xpad_axis_xy_left_ADZ, anti_deadzone);
+
+static ssize_t xpad_axis_xy_right_ADZ_show(struct device *dev, struct device_attribute *attr,
+					   char *buf)
+{
+	struct ally_gamepad_cfg *ally_cfg = drvdata.gamepad_cfg;
+
+	if (!drvdata.gamepad_cfg)
+		return -ENODEV;
+
+	return sysfs_emit(buf, "%d\n",
+			  ally_cfg->anti_deadzones[ally_cfg->mode - 1][btn_pair_side_right]);
+}
+
+static ssize_t xpad_axis_xy_right_ADZ_store(struct device *dev, struct device_attribute *attr,
+					    const char *buf, size_t count)
+{
+	int ret = __gamepad_js_ADZ_store(dev, buf, btn_pair_side_right);
+
+	if (ret)
+		return ret;
+
+	return count;
+}
+
+ALLY_DEVICE_ATTR_RW(xpad_axis_xy_right_ADZ, anti_deadzone);
+
+/* JS RESPONSE CURVES *****************************************************************************/
+static ssize_t rc_point_index_show(struct device *dev, struct device_attribute *attr, char *buf)
+{
+	return sysfs_emit(buf, "move response\n");
+}
+
+ALLY_DEVICE_ATTR_RO(rc_point_index, rc_point_index);
+
+static ssize_t __gamepad_write_response_curves_to_mcu(struct hid_device *hdev,
+						      struct ally_gamepad_cfg *ally_cfg)
+{
+	u8 *hidbuf;
+	int ret;
+
+	ret = __gamepad_check_ready(hdev);
+	if (ret < 0)
+		return ret;
+
+	hidbuf = kzalloc(FEATURE_ROG_ALLY_REPORT_SIZE, GFP_KERNEL);
+	if (!hidbuf)
+		return -ENOMEM;
+
+	hidbuf[0] = FEATURE_ROG_ALLY_REPORT_ID;
+	hidbuf[1] = FEATURE_ROG_ALLY_CODE_PAGE;
+	hidbuf[2] = xpad_cmd_set_response_curve;
+	hidbuf[3] = xpad_cmd_len_response_curve;
+	hidbuf[4] = 0x01;
+	memcpy(&hidbuf[5], &ally_cfg->response_curve[ally_cfg->mode - 1][btn_pair_side_left],
+	       8);
+
+	ret = __gamepad_check_ready(hdev);
+	if (ret < 0)
+		goto report_fail;
+
+	hidbuf[4] = 0x02;
+	memcpy(&hidbuf[5], &ally_cfg->response_curve[ally_cfg->mode - 1][btn_pair_side_right],
+	       8);
+
+	ret = __gamepad_check_ready(hdev);
+	if (ret < 0)
+		goto report_fail;
+
+	ret = asus_dev_set_report(hdev, hidbuf, FEATURE_ROG_ALLY_REPORT_SIZE);
+	if (ret < 0)
+		goto report_fail;
+
+report_fail:
+	kfree(hidbuf);
+	return ret;
+}
+
+static ssize_t __gamepad_store_response_curve(struct device *dev, const char *buf,
+					      enum btn_pair_side side, int point)
+{
+	struct ally_gamepad_cfg *ally_cfg = drvdata.gamepad_cfg;
+	u32 move, response;
+	int idx;
+
+	idx = (point - 1) * 2;
+
+	if (!drvdata.gamepad_cfg)
+		return -ENODEV;
+
+	if (sscanf(buf, "%d %d", &move, &response) != 2)
+		return -EINVAL;
+
+	if (move > 64 || response > 64)
+		return -EINVAL;
+
+	ally_cfg->response_curve[ally_cfg->mode - 1][side][idx] = move;
+	ally_cfg->response_curve[ally_cfg->mode - 1][side][idx + 1] = response;
+
+	return 0;
+}
+
+ALLY_JS_RC_POINT(left, 1, rc_point_);
+ALLY_JS_RC_POINT(left, 2, rc_point_);
+ALLY_JS_RC_POINT(left, 3, rc_point_);
+ALLY_JS_RC_POINT(left, 4, rc_point_);
+
+ALLY_JS_RC_POINT(right, 1, rc_point_);
+ALLY_JS_RC_POINT(right, 2, rc_point_);
+ALLY_JS_RC_POINT(right, 3, rc_point_);
+ALLY_JS_RC_POINT(right, 4, rc_point_);
+
+/* CALIBRATIONS ***********************************************************************************/
+static int __gamepad_get_calibration(struct hid_device *hdev)
+{
+	struct ally_gamepad_cfg *ally_cfg = drvdata.gamepad_cfg;
+	u8 *hidbuf;
+	int ret, i;
+
+	if (!drvdata.gamepad_cfg)
+		return -ENODEV;
+
+	hidbuf = kzalloc(FEATURE_ROG_ALLY_REPORT_SIZE, GFP_KERNEL);
+	if (!hidbuf)
+		return -ENOMEM;
+
+	for (i = 0; i < 2; i++) {
+		hidbuf[0] = FEATURE_ROG_ALLY_REPORT_ID;
+		hidbuf[1] = 0xD0;
+		hidbuf[2] = 0x03;
+		hidbuf[3] = i + 1; // 0x01 JS, 0x02 TR
+		hidbuf[4] = 0x20;
+
+		ret = asus_dev_set_report(hdev, hidbuf, FEATURE_ROG_ALLY_REPORT_SIZE);
+		if (ret < 0) {
+			hid_warn(hdev, "ROG Ally check failed set report: %d\n", ret);
+			goto cleanup;
+		}
+
+		memset(hidbuf, 0, FEATURE_ROG_ALLY_REPORT_SIZE);
+		ret = asus_dev_get_report(hdev, hidbuf, FEATURE_ROG_ALLY_REPORT_SIZE);
+		if (ret < 0 || hidbuf[5] != 1) {
+			hid_warn(hdev, "ROG Ally check failed get report: %d\n", ret);
+			goto cleanup;
+		}
+
+		if (i == 0) {
+			/* Joystick calibration */
+			/* [left][index] is Y: stable, min, max. X: stable, min, max */
+			ally_cfg->js_calibrations[0][3] = (hidbuf[6] << 8) | hidbuf[7];
+			ally_cfg->js_calibrations[0][4] = (hidbuf[8] << 8) | hidbuf[9];
+			ally_cfg->js_calibrations[0][5] = (hidbuf[10] << 8) | hidbuf[11];
+			ally_cfg->js_calibrations[0][0] = (hidbuf[12] << 8) | hidbuf[13];
+			ally_cfg->js_calibrations[0][1] = (hidbuf[14] << 8) | hidbuf[15];
+			ally_cfg->js_calibrations[0][2] = (hidbuf[16] << 8) | hidbuf[17];
+			/* [right][index] is Y: stable, min, max. X: stable, min, max */
+			ally_cfg->js_calibrations[1][0] = (hidbuf[24] << 8) | hidbuf[25];
+			ally_cfg->js_calibrations[1][1] = (hidbuf[26] << 8) | hidbuf[27];
+			ally_cfg->js_calibrations[1][2] = (hidbuf[28] << 8) | hidbuf[29];
+			ally_cfg->js_calibrations[1][3] = (hidbuf[18] << 8) | hidbuf[19];
+			ally_cfg->js_calibrations[1][4] = (hidbuf[20] << 8) | hidbuf[21];
+			ally_cfg->js_calibrations[1][5] = (hidbuf[22] << 8) | hidbuf[23];
+		} else {
+			/* Trigger calibration */
+			/* [left/right][stable/max] */
+			ally_cfg->tr_calibrations[0][0] = (hidbuf[6] << 8) | hidbuf[7];
+			ally_cfg->tr_calibrations[0][1] = (hidbuf[8] << 8) | hidbuf[9];
+			ally_cfg->tr_calibrations[1][0] = (hidbuf[10] << 8) | hidbuf[11];
+			ally_cfg->tr_calibrations[1][1] = (hidbuf[12] << 8) | hidbuf[13];
+		}
+	}
+
+cleanup:
+	kfree(hidbuf);
+	return ret;
+}
+
+static ssize_t __gamepad_write_cal_to_mcu(struct device *dev, enum xpad_axis axis)
+{
+	struct hid_device *hdev = to_hid_device(dev);
+	struct ally_gamepad_cfg *ally_cfg = drvdata.gamepad_cfg;
+	u8 *c, side, pkt_len, data_len;
+	int ret, cal, checksum = 0;
+	u8 *hidbuf;
+	int *head;
+
+	if (!drvdata.gamepad_cfg)
+		return -ENODEV;
+
+	ret = __gamepad_check_ready(hdev);
+	if (ret < 0)
+		return ret;
+
+	hidbuf = kzalloc(FEATURE_ROG_ALLY_REPORT_SIZE, GFP_KERNEL);
+	if (!hidbuf)
+		return -ENOMEM;
+
+	side = axis == xpad_axis_xy_right || axis == xpad_axis_z_right ? 1 : 0;
+	pkt_len = axis > xpad_axis_xy_right ? 0x06 : 0x0E;
+	data_len = axis > xpad_axis_xy_right ? 2 : 6;
+	head = axis > xpad_axis_xy_right ? ally_cfg->tr_calibrations[side] :
+					   ally_cfg->js_calibrations[side];
+
+	hidbuf[0] = FEATURE_ROG_ALLY_REPORT_ID;
+	hidbuf[1] = FEATURE_ROG_ALLY_CODE_PAGE;
+	hidbuf[2] = xpad_cmd_set_calibration;
+	hidbuf[3] = pkt_len;
+	hidbuf[4] = 0x01; /* second command (write calibration) */
+	hidbuf[5] = axis;
+	c = &hidbuf[6]; /* pointer to data start */
+
+	for (size_t i = 0; i < data_len; i++) {
+		cal = head[i];
+		*c = (u8)((cal & 0xff00) >> 8);
+		checksum += *c;
+		c += 1;
+		*c = (u8)(cal & 0xff);
+		checksum += *c;
+		c += 1;
+	}
+
+	hidbuf[6 + data_len * 2] = checksum;
+
+	ret = asus_dev_set_report(hdev, hidbuf, FEATURE_ROG_ALLY_REPORT_SIZE);
+	if (ret < 0)
+		goto report_fail;
+
+	memset(hidbuf, 0, FEATURE_ROG_ALLY_REPORT_SIZE);
+	hidbuf[0] = FEATURE_ROG_ALLY_REPORT_ID;
+	hidbuf[1] = FEATURE_ROG_ALLY_CODE_PAGE;
+	hidbuf[2] = xpad_cmd_set_calibration;
+	hidbuf[3] = xpad_cmd_len_calibration3;
+	hidbuf[4] = 0x03; /* second command (apply the calibration that was written) */
+
+	ret = asus_dev_set_report(hdev, hidbuf, FEATURE_ROG_ALLY_REPORT_SIZE);
+	if (ret < 0)
+		goto report_fail;
+
+report_fail:
+	kfree(hidbuf);
+	return ret;
+}
+
+static ssize_t __gamepad_cal_store(struct device *dev, const char *buf, enum xpad_axis axis)
+{
+	struct ally_gamepad_cfg *ally_cfg = drvdata.gamepad_cfg;
+	u32 x_stable, x_min, x_max, y_stable, y_min, y_max, side;
+
+	if (!drvdata.gamepad_cfg)
+		return -ENODEV;
+
+	if (axis == xpad_axis_xy_left || axis == xpad_axis_xy_right) {
+		if (sscanf(buf, "%d %d %d %d %d %d", &x_stable, &x_min, &x_max, &y_stable,
+			   &y_min, &y_max) != 6)
+			return -EINVAL;
+
+		side = axis == xpad_axis_xy_right || axis == xpad_axis_z_right ? 1 : 0;
+		/* stored in reverse order for easy copy to packet */
+		ally_cfg->js_calibrations[side][0] = y_stable;
+		ally_cfg->js_calibrations[side][1] = y_min;
+		ally_cfg->js_calibrations[side][2] = y_max;
+		ally_cfg->js_calibrations[side][3] = x_stable;
+		ally_cfg->js_calibrations[side][4] = x_min;
+		ally_cfg->js_calibrations[side][5] = x_max;
+
+		return __gamepad_write_cal_to_mcu(dev, axis);
+	}
+	if (sscanf(buf, "%d %d", &x_stable, &x_max) != 2)
+		return -EINVAL;
+
+	side = axis == xpad_axis_xy_right || axis == xpad_axis_z_right ? 1 : 0;
+	/* stored in reverse order for easy copy to packet */
+	ally_cfg->tr_calibrations[side][0] = x_stable;
+	ally_cfg->tr_calibrations[side][1] = x_max;
+
+	return __gamepad_write_cal_to_mcu(dev, axis);
+}
+
+static ssize_t __gamepad_cal_show(struct device *dev, char *buf, enum xpad_axis axis)
+{
+	struct ally_gamepad_cfg *ally_cfg = drvdata.gamepad_cfg;
+	int side = (axis == xpad_axis_xy_right || axis == xpad_axis_z_right) ? 1 : 0;
+
+	if (!drvdata.gamepad_cfg)
+		return -ENODEV;
+
+	if (axis == xpad_axis_xy_left || axis == xpad_axis_xy_right) {
+		return sysfs_emit(
+			buf, "%d %d %d %d %d %d\n", ally_cfg->js_calibrations[side][3],
+			ally_cfg->js_calibrations[side][4], ally_cfg->js_calibrations[side][5],
+			ally_cfg->js_calibrations[side][0], ally_cfg->js_calibrations[side][1],
+			ally_cfg->js_calibrations[side][2]);
+	}
+
+	return sysfs_emit(buf, "%d %d\n", ally_cfg->tr_calibrations[side][0],
+			  ally_cfg->tr_calibrations[side][1]);
+}
+
+ALLY_CAL_ATTR(xpad_axis_xy_left_cal, xpad_axis_xy_left, calibration);
+ALLY_CAL_ATTR(xpad_axis_xy_right_cal, xpad_axis_xy_right, calibration);
+ALLY_CAL_ATTR(xpad_axis_z_left_cal, xpad_axis_z_left, calibration);
+ALLY_CAL_ATTR(xpad_axis_z_right_cal, xpad_axis_z_right, calibration);
+
+static ssize_t xpad_axis_xy_cal_index_show(struct device *dev, struct device_attribute *attr,
+					   char *buf)
+{
+	return sysfs_emit(buf, "x_stable x_min x_max y_stable y_min y_max\n");
+}
+
+ALLY_DEVICE_ATTR_RO(xpad_axis_xy_cal_index, calibration_index);
+
+static ssize_t xpad_axis_z_cal_index_show(struct device *dev, struct device_attribute *attr,
+					  char *buf)
+{
+	return sysfs_emit(buf, "z_stable z_max\n");
+}
+
+ALLY_DEVICE_ATTR_RO(xpad_axis_z_cal_index, calibration_index);
+
+static ssize_t __gamepad_cal_reset(struct device *dev, const char *buf, enum xpad_axis axis)
+{
+	struct hid_device *hdev = to_hid_device(dev);
+	u8 *hidbuf;
+	int ret;
+
+	ret = __gamepad_check_ready(hdev);
+	if (ret < 0)
+		return ret;
+
+	hidbuf = kzalloc(FEATURE_ROG_ALLY_REPORT_SIZE, GFP_KERNEL);
+	if (!hidbuf)
+		return -ENOMEM;
+
+	/* Write the reset value, then apply it */
+	for (u8 cmd = 0x02; cmd <= 0x03; cmd++) {
+		memset(hidbuf, 0, FEATURE_ROG_ALLY_REPORT_SIZE);
+		hidbuf[0] = FEATURE_ROG_ALLY_REPORT_ID;
+		hidbuf[1] = FEATURE_ROG_ALLY_CODE_PAGE;
+		hidbuf[2] = xpad_cmd_set_calibration;
+		hidbuf[3] = (cmd == 0x02) ? xpad_cmd_len_calibration2 :
+					    xpad_cmd_len_calibration3;
+		hidbuf[4] = cmd;
+		hidbuf[5] = axis;
+
+		ret = asus_dev_set_report(hdev, hidbuf, FEATURE_ROG_ALLY_REPORT_SIZE);
+		if (ret < 0)
+			break;
+	}
+
+	__gamepad_get_calibration(hdev);
+
+	kfree(hidbuf);
+	return ret;
+}
+
+ALLY_CAL_RESET_ATTR(xpad_axis_xy_left_cal_reset, xpad_axis_xy_left, calibration_reset);
+ALLY_CAL_RESET_ATTR(xpad_axis_xy_right_cal_reset, xpad_axis_xy_right, calibration_reset);
+ALLY_CAL_RESET_ATTR(xpad_axis_z_left_cal_reset, xpad_axis_z_left, calibration_reset);
+ALLY_CAL_RESET_ATTR(xpad_axis_z_right_cal_reset, xpad_axis_z_right, calibration_reset);
+
+static struct attribute *gamepad_axis_xy_left_attrs[] = {
+	&dev_attr_xpad_axis_xy_left_deadzone.attr,
+	&dev_attr_axis_xyz_deadzone_index.attr,
+	&dev_attr_xpad_axis_xy_left_ADZ.attr,
+	&dev_attr_xpad_axis_xy_left_cal_reset.attr,
+	&dev_attr_xpad_axis_xy_left_cal.attr,
+	&dev_attr_xpad_axis_xy_cal_index.attr,
+	&dev_attr_rc_point_left_1.attr,
+	&dev_attr_rc_point_left_2.attr,
+	&dev_attr_rc_point_left_3.attr,
+	&dev_attr_rc_point_left_4.attr,
+	&dev_attr_rc_point_index.attr,
+	NULL
+};
+static const struct attribute_group ally_controller_axis_xy_left_attr_group = {
+	.name = "axis_xy_left",
+	.attrs = gamepad_axis_xy_left_attrs,
+};
+
+static struct attribute *gamepad_axis_xy_right_attrs[] = {
+	&dev_attr_xpad_axis_xy_right_deadzone.attr,
+	&dev_attr_axis_xyz_deadzone_index.attr,
+	&dev_attr_xpad_axis_xy_right_ADZ.attr,
+	&dev_attr_xpad_axis_xy_right_cal_reset.attr,
+	&dev_attr_xpad_axis_xy_right_cal.attr,
+	&dev_attr_xpad_axis_xy_cal_index.attr,
+	&dev_attr_rc_point_right_1.attr,
+	&dev_attr_rc_point_right_2.attr,
+	&dev_attr_rc_point_right_3.attr,
+	&dev_attr_rc_point_right_4.attr,
+	&dev_attr_rc_point_index.attr,
+	NULL
+};
+static const struct attribute_group ally_controller_axis_xy_right_attr_group = {
+	.name = "axis_xy_right",
+	.attrs = gamepad_axis_xy_right_attrs,
+};
+
+static struct attribute *gamepad_axis_z_left_attrs[] = {
+	&dev_attr_xpad_axis_z_left_deadzone.attr,  &dev_attr_axis_xyz_deadzone_index.attr,
+	&dev_attr_xpad_axis_z_left_cal.attr,	   &dev_attr_xpad_axis_z_cal_index.attr,
+	&dev_attr_xpad_axis_z_left_cal_reset.attr, NULL
+};
+static const struct attribute_group ally_controller_axis_z_left_attr_group = {
+	.name = "axis_z_left",
+	.attrs = gamepad_axis_z_left_attrs,
+};
+
+static struct attribute *gamepad_axis_z_right_attrs[] = {
+	&dev_attr_xpad_axis_z_right_deadzone.attr,  &dev_attr_axis_xyz_deadzone_index.attr,
+	&dev_attr_xpad_axis_z_right_cal.attr,	    &dev_attr_xpad_axis_z_cal_index.attr,
+	&dev_attr_xpad_axis_z_right_cal_reset.attr, NULL
+};
+static const struct attribute_group ally_controller_axis_z_right_attr_group = {
+	.name = "axis_z_right",
+	.attrs = gamepad_axis_z_right_attrs,
+};
+
+static const struct attribute_group *gamepad_device_attr_groups[] = {
+	&ally_controller_attr_group,
+	&ally_controller_axis_xy_left_attr_group,
+	&ally_controller_axis_xy_right_attr_group,
+	&ally_controller_axis_z_left_attr_group,
+	&ally_controller_axis_z_right_attr_group,
+	&btn_mapping_m1_attr_group,
+	&btn_mapping_m2_attr_group,
+	&btn_mapping_a_attr_group,
+	&btn_mapping_b_attr_group,
+	&btn_mapping_x_attr_group,
+	&btn_mapping_y_attr_group,
+	&btn_mapping_lb_attr_group,
+	&btn_mapping_rb_attr_group,
+	&btn_mapping_ls_attr_group,
+	&btn_mapping_rs_attr_group,
+	&btn_mapping_dpad_u_attr_group,
+	&btn_mapping_dpad_d_attr_group,
+	&btn_mapping_dpad_l_attr_group,
+	&btn_mapping_dpad_r_attr_group,
+	&btn_mapping_view_attr_group,
+	&btn_mapping_menu_attr_group,
+	NULL
+};
+
+static int __gamepad_write_all_to_mcu(struct hid_device *hdev,
+				      struct ally_gamepad_cfg *ally_cfg)
+{
+	u8 *hidbuf;
+	int ret;
+
+	ret = __gamepad_set_mapping(hdev, ally_cfg, btn_pair_dpad_u_d);
+	if (ret < 0)
+		return ret;
+	ret = __gamepad_set_mapping(hdev, ally_cfg, btn_pair_dpad_l_r);
+	if (ret < 0)
+		return ret;
+	ret = __gamepad_set_mapping(hdev, ally_cfg, btn_pair_ls_rs);
+	if (ret < 0)
+		return ret;
+	ret = __gamepad_set_mapping(hdev, ally_cfg, btn_pair_lb_rb);
+	if (ret < 0)
+		return ret;
+	ret = __gamepad_set_mapping(hdev, ally_cfg, btn_pair_a_b);
+	if (ret < 0)
+		return ret;
+	ret = __gamepad_set_mapping(hdev, ally_cfg, btn_pair_x_y);
+	if (ret < 0)
+		return ret;
+	ret = __gamepad_set_mapping(hdev, ally_cfg, btn_pair_view_menu);
+	if (ret < 0)
+		return ret;
+	ret = __gamepad_set_mapping(hdev, ally_cfg, btn_pair_m1_m2);
+	if (ret < 0)
+		return ret;
+	__gamepad_set_mapping(hdev, ally_cfg, btn_pair_lt_rt);
+	if (ret < 0)
+		return ret;
+	__gamepad_set_deadzones(hdev, ally_cfg);
+	if (ret < 0)
+		return ret;
+	__gamepad_write_js_ADZ_to_mcu(hdev, ally_cfg);
+	if (ret < 0)
+		return ret;
+	__gamepad_write_vibe_intensity_to_mcu(hdev, ally_cfg);
+	if (ret < 0)
+		return ret;
+	__gamepad_write_response_curves_to_mcu(hdev, ally_cfg);
+	if (ret < 0)
+		return ret;
+	ret = __gamepad_check_ready(hdev);
+	if (ret < 0)
+		return ret;
+
+	/* set turbo */
+	hidbuf = kzalloc(FEATURE_ROG_ALLY_REPORT_SIZE, GFP_KERNEL);
+	if (!hidbuf)
+		return -ENOMEM;
+	hidbuf[0] = FEATURE_ROG_ALLY_REPORT_ID;
+	hidbuf[1] = FEATURE_ROG_ALLY_CODE_PAGE;
+	hidbuf[2] = xpad_cmd_set_turbo;
+	hidbuf[3] = xpad_cmd_len_turbo;
+	memcpy(&hidbuf[4], ally_cfg->turbo_btns[ally_cfg->mode - 1], TURBO_BLOCK_LEN);
+	ret = asus_dev_set_report(hdev, hidbuf, FEATURE_ROG_ALLY_REPORT_SIZE);
+
+	kfree(hidbuf);
+	return ret;
+}
+
+static struct ally_gamepad_cfg *ally_gamepad_cfg_create(struct hid_device *hdev)
+{
+	struct ally_gamepad_cfg *ally_cfg;
+	struct input_dev *input_dev;
+	int i, err;
+
+	ally_cfg = devm_kzalloc(&hdev->dev, sizeof(*ally_cfg), GFP_KERNEL);
+	if (!ally_cfg)
+		return ERR_PTR(-ENOMEM);
+	ally_cfg->hdev = hdev;
+
+	input_dev = devm_input_allocate_device(&hdev->dev);
+	if (!input_dev) {
+		err = -ENOMEM;
+		goto free_ally_cfg;
+	}
+	ally_cfg->input = input_dev;
+
+	input_dev->id.bustype = hdev->bus;
+	input_dev->id.vendor = hdev->vendor;
+	input_dev->id.product = hdev->product;
+	input_dev->id.version = hdev->version;
+	input_dev->uniq = hdev->uniq;
+	input_dev->name = "ASUS ROG Ally Config";
+	input_set_capability(input_dev, EV_KEY, KEY_PROG1);
+	input_set_capability(input_dev, EV_KEY, KEY_F16);
+	input_set_capability(input_dev, EV_KEY, KEY_F17);
+	input_set_capability(input_dev, EV_KEY, KEY_F18);
+
+	input_set_drvdata(input_dev, hdev);
+
+	err = input_register_device(input_dev);
+	if (err)
+		goto free_input_dev;
+
+	ally_cfg->mode = xpad_mode_game;
+	for (i = 0; i < xpad_mode_mouse; i++) {
+		ally_cfg->deadzones[i][0][1] = 64;
+		ally_cfg->deadzones[i][0][3] = 64;
+		ally_cfg->deadzones[i][1][1] = 64;
+		ally_cfg->deadzones[i][1][3] = 64;
+		ally_cfg->response_curve[i][0][0] = 0x14;
+		ally_cfg->response_curve[i][0][1] = 0x14;
+		ally_cfg->response_curve[i][0][2] = 0x28;
+		ally_cfg->response_curve[i][0][3] = 0x28;
+		ally_cfg->response_curve[i][0][4] = 0x3c;
+		ally_cfg->response_curve[i][0][5] = 0x3c;
+		ally_cfg->response_curve[i][0][6] = 0x63;
+		ally_cfg->response_curve[i][0][7] = 0x63;
+		ally_cfg->response_curve[i][1][0] = 0x14;
+		ally_cfg->response_curve[i][1][1] = 0x14;
+		ally_cfg->response_curve[i][1][2] = 0x28;
+		ally_cfg->response_curve[i][1][3] = 0x28;
+		ally_cfg->response_curve[i][1][4] = 0x3c;
+		ally_cfg->response_curve[i][1][5] = 0x3c;
+		ally_cfg->response_curve[i][1][6] = 0x63;
+		ally_cfg->response_curve[i][1][7] = 0x63;
+		ally_cfg->vibration_intensity[i][0] = 64;
+		ally_cfg->vibration_intensity[i][1] = 64;
+	}
+	drvdata.gamepad_cfg = ally_cfg;
+
+	/* ignore all errors for this as they are related to USB HID I/O */
+	__gamepad_mapping_xpad_default(ally_cfg);
+	__gamepad_mapping_wasd_default(ally_cfg);
+	/* these calls will never error so ignore the return */
+	__gamepad_mapping_store(ally_cfg, KB_M2, btn_pair_m1_m2, btn_pair_side_left, false);
+	__gamepad_mapping_store(ally_cfg, KB_M1, btn_pair_m1_m2, btn_pair_side_right, false);
+	__gamepad_set_mode(hdev, ally_cfg, xpad_mode_game);
+	__gamepad_set_mapping(hdev, ally_cfg, btn_pair_m1_m2);
+	/* ensure we have data for users to start from */
+	__gamepad_get_calibration(hdev);
+
+	if (sysfs_create_groups(&hdev->dev.kobj, gamepad_device_attr_groups)) {
+		err = -ENODEV;
+		goto unregister_input_dev;
+	}
+
+	return ally_cfg;
+
+unregister_input_dev:
+	input_unregister_device(input_dev);
+	ally_cfg->input = NULL; // Prevent double free when kfree(ally_cfg) happens
+
+free_input_dev:
+	devm_kfree(&hdev->dev, input_dev);
+
+free_ally_cfg:
+	devm_kfree(&hdev->dev, ally_cfg);
+	return ERR_PTR(err);
+}
+
+static void ally_cfg_remove(struct hid_device *hdev)
+{
+	__gamepad_set_mode(hdev, drvdata.gamepad_cfg, xpad_mode_mouse);
+	sysfs_remove_groups(&hdev->dev.kobj, gamepad_device_attr_groups);
+}
+
+/**************************************************************************************************/
+/* ROG Ally LED control                                                                           */
+/**************************************************************************************************/
+static void ally_schedule_work(struct ally_rgb_leds *led)
+{
+	unsigned long flags;
+
+	spin_lock_irqsave(&led->lock, flags);
+	if (!led->removed)
+		schedule_work(&led->work);
+	spin_unlock_irqrestore(&led->lock, flags);
+	pr_warn("5");
+}
+
+static void ally_led_do_brightness(struct work_struct *work)
+{
+	struct ally_rgb_leds *led = container_of(work, struct ally_rgb_leds, work);
+	u8 buf[] = { FEATURE_ROG_ALLY_REPORT_ID, 0xba, 0xc5, 0xc4, 0x00 };
+	unsigned long flags;
+
+	spin_lock_irqsave(&led->lock, flags);
+	if (!led->update_bright) {
+		spin_unlock_irqrestore(&led->lock, flags);
+		return;
+	}
+	led->update_bright = false;
+	buf[4] = led->brightness;
+	spin_unlock_irqrestore(&led->lock, flags);
+
+	if (asus_dev_set_report(led->hdev, buf, sizeof(buf)) < 0)
+		hid_err(led->hdev, "Ally failed to set backlight\n");
+}
+
+static void ally_led_do_rgb(struct work_struct *work)
+{
+	struct ally_rgb_leds *led = container_of(work, struct ally_rgb_leds, work);
+	unsigned long flags;
+	int ret;
+
+	u8 buf[16] = { [0] = FEATURE_ROG_ALLY_REPORT_ID,
+		       [1] = FEATURE_ROG_ALLY_CODE_PAGE,
+		       [2] = xpad_cmd_set_leds,
+		       [3] = xpad_cmd_len_leds };
+
+	spin_lock_irqsave(&led->lock, flags);
+	if (!led->update_rgb) {
+		spin_unlock_irqrestore(&led->lock, flags);
+		return;
+	}
+	for (int i = 0; i < 4; i++) {
+		buf[4 + i * 3] = led->gamepad_red;
+		buf[5 + i * 3] = led->gamepad_green;
+		buf[6 + i * 3] = led->gamepad_blue;
+	}
+	led->update_rgb = false;
+	spin_unlock_irqrestore(&led->lock, flags);
+
+	ret = asus_dev_set_report(led->hdev, buf, sizeof(buf));
+	if (ret < 0)
+		hid_err(led->hdev, "Ally failed to set gamepad backlight: %d\n", ret);
+}
+
+static void ally_led_work(struct work_struct *work)
+{
+	ally_led_do_brightness(work);
+	ally_led_do_rgb(work);
+}
+
+static void ally_backlight_set(struct led_classdev *led_cdev, enum led_brightness brightness)
+{
+	struct ally_rgb_leds *led =
+		container_of(led_cdev, struct ally_rgb_leds, led_bright_dev);
+	unsigned long flags;
+
+	spin_lock_irqsave(&led->lock, flags);
+	led->update_bright = true;
+	led->brightness = brightness;
+	spin_unlock_irqrestore(&led->lock, flags);
+
+	ally_schedule_work(led);
+}
+
+static enum led_brightness ally_backlight_get(struct led_classdev *led_cdev)
+{
+	struct ally_rgb_leds *led =
+		container_of(led_cdev, struct ally_rgb_leds, led_bright_dev);
+	enum led_brightness brightness;
+	unsigned long flags;
+
+	spin_lock_irqsave(&led->lock, flags);
+	brightness = led->brightness;
+	spin_unlock_irqrestore(&led->lock, flags);
+
+	return brightness;
+}
+
+static void ally_set_rgb_brightness(struct led_classdev *cdev, enum led_brightness brightness)
+{
+	struct led_classdev_mc *mc_cdev = lcdev_to_mccdev(cdev);
+	struct ally_rgb_leds *led = container_of(mc_cdev, struct ally_rgb_leds, led_rgb_dev);
+	unsigned long flags;
+
+	led_mc_calc_color_components(mc_cdev, brightness);
+	spin_lock_irqsave(&led->lock, flags);
+	led->update_rgb = true;
+	led->gamepad_red = mc_cdev->subled_info[0].brightness;
+	led->gamepad_green = mc_cdev->subled_info[1].brightness;
+	led->gamepad_blue = mc_cdev->subled_info[2].brightness;
+	spin_unlock_irqrestore(&led->lock, flags);
+
+	ally_schedule_work(led);
+}
+
+static int ally_gamepad_register_brightness(struct hid_device *hdev,
+					    struct ally_rgb_leds *led_rgb)
+{
+	struct led_classdev *led_cdev;
+
+	led_cdev = &led_rgb->led_bright_dev;
+	led_cdev->name = "ally:kbd_backlight"; /* Let a desktop control it also */
+	led_cdev->max_brightness = 3;
+	led_cdev->brightness_set = ally_backlight_set;
+	led_cdev->brightness_get = ally_backlight_get;
+
+	return devm_led_classdev_register(&hdev->dev, &led_rgb->led_bright_dev);
+}
+
+static int ally_gamepad_register_rgb_leds(struct hid_device *hdev,
+					  struct ally_rgb_leds *led_rgb)
+{
+	struct mc_subled *mc_led_info;
+	struct led_classdev *led_cdev;
+
+	mc_led_info = devm_kmalloc_array(&hdev->dev, 3, sizeof(*mc_led_info),
+					 GFP_KERNEL | __GFP_ZERO);
+	if (!mc_led_info)
+		return -ENOMEM;
+
+	mc_led_info[0].color_index = LED_COLOR_ID_RED;
+	mc_led_info[1].color_index = LED_COLOR_ID_GREEN;
+	mc_led_info[2].color_index = LED_COLOR_ID_BLUE;
+
+	led_rgb->led_rgb_dev.subled_info = mc_led_info;
+	led_rgb->led_rgb_dev.num_colors = 3;
+
+	led_cdev = &led_rgb->led_rgb_dev.led_cdev;
+	led_cdev->name = "ally:rgb:gamepad";
+	led_cdev->brightness = 128;
+	led_cdev->max_brightness = 255;
+	led_cdev->brightness_set = ally_set_rgb_brightness;
+
+	return devm_led_classdev_multicolor_register(&hdev->dev, &led_rgb->led_rgb_dev);
+}
+
+static struct ally_rgb_leds *ally_gamepad_rgb_create(struct hid_device *hdev)
+{
+	struct ally_rgb_leds *led_rgb;
+	int ret;
+
+	led_rgb = devm_kzalloc(&hdev->dev, sizeof(struct ally_rgb_leds), GFP_KERNEL);
+	if (!led_rgb)
+		return ERR_PTR(-ENOMEM);
+
+	ret = ally_gamepad_register_rgb_leds(hdev, led_rgb);
+	if (ret < 0) {
+		cancel_work_sync(&led_rgb->work);
+		devm_kfree(&hdev->dev, led_rgb);
+		return ERR_PTR(ret);
+	}
+
+	ret = ally_gamepad_register_brightness(hdev, led_rgb);
+	if (ret < 0) {
+		cancel_work_sync(&led_rgb->work);
+		devm_kfree(&hdev->dev, led_rgb);
+		return ERR_PTR(ret);
+	}
+
+	led_rgb->hdev = hdev;
+	led_rgb->brightness = 3;
+	led_rgb->removed = false;
+
+	INIT_WORK(&led_rgb->work, ally_led_work);
+	spin_lock_init(&led_rgb->lock);
+
+	return led_rgb;
+}
+
+static void ally_rgb_remove(struct hid_device *hdev)
+{
+	struct ally_rgb_leds *led_rgb = drvdata.led_rgb;
+	unsigned long flags;
+
+	spin_lock_irqsave(&led_rgb->lock, flags);
+	led_rgb->removed = true;
+	spin_unlock_irqrestore(&led_rgb->lock, flags);
+	cancel_work_sync(&led_rgb->work);
+}
+
+/**************************************************************************************************/
+/* ROG Ally driver init                                                                           */
+/**************************************************************************************************/
+static int ally_raw_event(struct hid_device *hdev, struct hid_report *report, u8 *data,
+			  int size)
+{
+	struct ally_gamepad_cfg *cfg = drvdata.gamepad_cfg;
+	struct ally_x_device *ally_x = drvdata.ally_x;
+
+	if (ally_x) {
+		if ((hdev->bus == BUS_USB && report->id == ALLY_X_INPUT_REPORT_USB &&
+		     size == ALLY_X_INPUT_REPORT_USB_SIZE) ||
+		    (cfg && data[0] == 0x5A)) {
+			ally_x_raw_event(ally_x, report, data, size);
+		} else {
+			return -1;
+		}
+	}
+	if (cfg && !ally_x) {
+		input_report_key(cfg->input, KEY_PROG1, data[1] == 0x38);
+		input_report_key(cfg->input, KEY_F16, data[1] == 0xA6);
+		input_report_key(cfg->input, KEY_F17, data[1] == 0xA7);
+		input_report_key(cfg->input, KEY_F18, data[1] == 0xA8);
+		input_sync(cfg->input);
+	}
+
+	return 0;
+}
+
+static int ally_gamepad_init(struct hid_device *hdev, u8 report_id)
+{
+	const u8 buf[] = { report_id, 0x41, 0x53, 0x55, 0x53, 0x20, 0x54, 0x65,
+			   0x63,      0x68, 0x2e, 0x49, 0x6e, 0x63, 0x2e, 0x00 };
+	int ret;
+
+	ret = asus_dev_set_report(hdev, buf, sizeof(buf));
+	if (ret < 0)
+		hid_err(hdev, "Ally failed to send init command: %d\n", ret);
+
+	return ret;
+}
+
+static int ally_probe(struct hid_device *hdev, const struct hid_device_id *id)
+{
+	struct usb_interface *intf = to_usb_interface(hdev->dev.parent);
+	struct usb_host_endpoint *ep = intf->cur_altsetting->endpoint;
+	int ret;
+
+	if (ep->desc.bEndpointAddress != ALLY_CFG_INTF_IN_ADDRESS &&
+	    ep->desc.bEndpointAddress != ALLY_X_INTERFACE_ADDRESS)
+		return -ENODEV;
+
+	ret = hid_parse(hdev);
+	if (ret) {
+		hid_err(hdev, "Parse failed\n");
+		return ret;
+	}
+
+	ret = hid_hw_start(hdev, HID_CONNECT_HIDRAW);
+	if (ret) {
+		hid_err(hdev, "Failed to start HID device\n");
+		return ret;
+	}
+
+	ret = hid_hw_open(hdev);
+	if (ret) {
+		hid_err(hdev, "Failed to open HID device\n");
+		goto err_stop;
+	}
+
+	/* Initialize MCU even before alloc */
+	ret = ally_gamepad_init(hdev, FEATURE_REPORT_ID);
+	if (ret < 0)
+		return ret;
+
+	ret = ally_gamepad_init(hdev, FEATURE_KBD_LED_REPORT_ID1);
+	if (ret < 0)
+		return ret;
+
+	ret = ally_gamepad_init(hdev, FEATURE_KBD_LED_REPORT_ID2);
+	if (ret < 0)
+		return ret;
+
+	drvdata.hdev = hdev;
+	hid_set_drvdata(hdev, &drvdata);
+
+	/* This should almost always exist */
+	if (ep->desc.bEndpointAddress == ALLY_CFG_INTF_IN_ADDRESS) {
+		drvdata.led_rgb = ally_gamepad_rgb_create(hdev);
+		if (IS_ERR(drvdata.led_rgb))
+			hid_err(hdev, "Failed to create Ally gamepad LEDs.\n");
+		else
+			hid_info(hdev, "Created Ally RGB LED controls.\n");
+
+		ally_gamepad_cfg_create(hdev); // assigns self
+		if (IS_ERR(drvdata.gamepad_cfg))
+			hid_err(hdev, "Failed to create Ally gamepad attributes.\n");
+		else
+			hid_info(hdev, "Created Ally gamepad attributes.\n");
+
+		if (IS_ERR(drvdata.led_rgb) && IS_ERR(drvdata.gamepad_cfg))
+			goto err_close;
+	}
+
+	/* May or may not exist */
+	if (ep->desc.bEndpointAddress == ALLY_X_INTERFACE_ADDRESS) {
+		drvdata.ally_x = ally_x_create(hdev);
+		if (IS_ERR(drvdata.ally_x)) {
+			hid_err(hdev, "Failed to create Ally X gamepad.\n");
+			drvdata.ally_x = NULL;
+			goto err_close;
+		}
+		hid_info(hdev, "Created Ally X controller.\n");
+
+		// Not required since we send this inputs ep through the gamepad input dev
+		if (drvdata.gamepad_cfg && drvdata.gamepad_cfg->input) {
+			input_unregister_device(drvdata.gamepad_cfg->input);
+			hid_info(hdev, "Ally X removed unrequired input dev.\n");
+		}
+	}
+
+	return 0;
+
+err_close:
+	hid_hw_close(hdev);
+err_stop:
+	hid_hw_stop(hdev);
+	return ret;
+}
+
+static void ally_remove(struct hid_device *hdev)
+{
+	if (drvdata.ally_x)
+		ally_x_remove(hdev);
+	if (drvdata.led_rgb)
+		ally_rgb_remove(hdev);
+	if (drvdata.gamepad_cfg)
+		ally_cfg_remove(hdev);
+	hid_hw_close(hdev);
+	hid_hw_stop(hdev);
+}
+
+static int ally_resume(struct hid_device *hdev)
+{
+	int ret;
+
+	ret = ally_gamepad_init(hdev, FEATURE_REPORT_ID);
+	if (ret < 0)
+		return ret;
+
+	ret = ally_gamepad_init(hdev, FEATURE_KBD_LED_REPORT_ID1);
+	if (ret < 0)
+		return ret;
+
+	ret = ally_gamepad_init(hdev, FEATURE_KBD_LED_REPORT_ID2);
+	if (ret < 0)
+		return ret;
+
+	if (drvdata.ally_x && drvdata.ally_x->output_worker_initialized)
+		schedule_work(&drvdata.ally_x->output_worker);
+
+	return ret;
+}
+
+MODULE_DEVICE_TABLE(hid, rog_ally_devices);
+
+static struct hid_driver rog_ally_cfg = {
+	.name = "asus_rog_ally",
+	.id_table = rog_ally_devices,
+	.probe = ally_probe,
+	.remove = ally_remove,
+	.raw_event = ally_raw_event,
+	.resume = ally_resume,
+};
+
+static int __init rog_ally_cfg_init(void)
+{
+	return hid_register_driver(&rog_ally_cfg);
+}
+
+static void __exit rog_ally_cfg_exit(void)
+{
+	hid_unregister_driver(&rog_ally_cfg);
+}
+
+module_init(rog_ally_cfg_init);
+module_exit(rog_ally_cfg_exit);
+
+MODULE_AUTHOR("Luke D. Jones");
+MODULE_DESCRIPTION("HID Driver for ASUS ROG Ally gamepad configuration.");
+MODULE_LICENSE("GPL");
diff --git a/drivers/hid/hid-asus-ally.h b/drivers/hid/hid-asus-ally.h
new file mode 100644
index 000000000000..252d9f126e32
--- /dev/null
+++ b/drivers/hid/hid-asus-ally.h
@@ -0,0 +1,544 @@
+/* SPDX-License-Identifier: GPL-2.0-or-later
+ *
+ *  HID driver for Asus ROG laptops and Ally
+ *
+ *  Copyright (c) 2023 Luke Jones <luke@ljones.dev>
+ */
+
+#include <linux/hid.h>
+#include <linux/types.h>
+
+#define ALLY_X_INTERFACE_ADDRESS 0x87
+
+#define BTN_CODE_LEN 11
+#define MAPPING_BLOCK_LEN 44
+
+#define TURBO_BLOCK_LEN 32
+#define TURBO_BLOCK_STEP 2
+
+#define PAD_A "pad_a"
+#define PAD_B "pad_b"
+#define PAD_X "pad_x"
+#define PAD_Y "pad_y"
+#define PAD_LB "pad_lb"
+#define PAD_RB "pad_rb"
+#define PAD_LS "pad_ls"
+#define PAD_RS "pad_rs"
+#define PAD_DPAD_UP "pad_dpad_up"
+#define PAD_DPAD_DOWN "pad_dpad_down"
+#define PAD_DPAD_LEFT "pad_dpad_left"
+#define PAD_DPAD_RIGHT "pad_dpad_right"
+#define PAD_VIEW "pad_view"
+#define PAD_MENU "pad_menu"
+#define PAD_XBOX "pad_xbox"
+
+#define KB_M1 "kb_m1"
+#define KB_M2 "kb_m2"
+#define KB_ESC "kb_esc"
+#define KB_F1 "kb_f1"
+#define KB_F2 "kb_f2"
+#define KB_F3 "kb_f3"
+#define KB_F4 "kb_f4"
+#define KB_F5 "kb_f5"
+#define KB_F6 "kb_f6"
+#define KB_F7 "kb_f7"
+#define KB_F8 "kb_f8"
+#define KB_F9 "kb_f9"
+#define KB_F10 "kb_f10"
+#define KB_F11 "kb_f11"
+#define KB_F12 "kb_f12"
+#define KB_F14 "kb_f14"
+#define KB_F15 "kb_f15"
+
+#define KB_BACKTICK "kb_backtick"
+#define KB_1 "kb_1"
+#define KB_2 "kb_2"
+#define KB_3 "kb_3"
+#define KB_4 "kb_4"
+#define KB_5 "kb_5"
+#define KB_6 "kb_6"
+#define KB_7 "kb_7"
+#define KB_8 "kb_8"
+#define KB_9 "kb_9"
+#define KB_0 "kb_0"
+#define KB_HYPHEN "kb_hyphen"
+#define KB_EQUALS "kb_equals"
+#define KB_BACKSPACE "kb_backspace"
+
+#define KB_TAB "kb_tab"
+#define KB_Q "kb_q"
+#define KB_W "kb_w"
+#define KB_E "kb_e"
+#define KB_R "kb_r"
+#define KB_T "kb_t"
+#define KB_Y "kb_y"
+#define KB_U "kb_u"
+#define KB_I "kb_i"
+#define KB_O "kb_o"
+#define KB_P "kb_p"
+#define KB_LBRACKET "kb_lbracket"
+#define KB_RBRACKET "kb_rbracket"
+#define KB_BACKSLASH "kb_bkslash"
+
+#define KB_CAPS "kb_caps"
+#define KB_A "kb_a"
+#define KB_S "kb_s"
+#define KB_D "kb_d"
+#define KB_F "kb_f"
+#define KB_G "kb_g"
+#define KB_H "kb_h"
+#define KB_J "kb_j"
+#define KB_K "kb_k"
+#define KB_L "kb_l"
+#define KB_SEMI "kb_semicolon"
+#define KB_QUOTE "kb_quote"
+#define KB_RET "kb_enter"
+
+#define KB_LSHIFT "kb_lshift"
+#define KB_Z "kb_z"
+#define KB_X "kb_x"
+#define KB_C "kb_c"
+#define KB_V "kb_v"
+#define KB_B "kb_b"
+#define KB_N "kb_n"
+#define KB_M "kb_m"
+#define KB_COMMA "kb_comma"
+#define KB_PERIOD "kb_period"
+#define KB_FWDSLASH "kb_fwdslash"
+#define KB_RSHIFT "kb_rshift"
+
+#define KB_LCTL "kb_lctl"
+#define KB_META "kb_meta"
+#define KB_LALT "kb_lalt"
+#define KB_SPACE "kb_space"
+#define KB_RALT "kb_ralt"
+#define KB_MENU "kb_menu"
+#define KB_RCTL "kb_rctl"
+
+#define KB_PRNTSCN "kb_prntscn"
+#define KB_SCRLCK "kb_scrlck"
+#define KB_PAUSE "kb_pause"
+#define KB_INS "kb_ins"
+#define KB_HOME "kb_home"
+#define KB_PGUP "kb_pgup"
+#define KB_DEL "kb_del"
+#define KB_END "kb_end"
+#define KB_PGDWN "kb_pgdwn"
+
+#define KB_UP_ARROW "kb_up_arrow"
+#define KB_DOWN_ARROW "kb_down_arrow"
+#define KB_LEFT_ARROW "kb_left_arrow"
+#define KB_RIGHT_ARROW "kb_right_arrow"
+
+#define NUMPAD_LOCK "numpad_lock"
+#define NUMPAD_FWDSLASH "numpad_fwdslash"
+#define NUMPAD_ASTERISK "numpad_asterisk"
+#define NUMPAD_HYPHEN "numpad_hyphen"
+#define NUMPAD_0 "numpad_0"
+#define NUMPAD_1 "numpad_1"
+#define NUMPAD_2 "numpad_2"
+#define NUMPAD_3 "numpad_3"
+#define NUMPAD_4 "numpad_4"
+#define NUMPAD_5 "numpad_5"
+#define NUMPAD_6 "numpad_6"
+#define NUMPAD_7 "numpad_7"
+#define NUMPAD_8 "numpad_8"
+#define NUMPAD_9 "numpad_9"
+#define NUMPAD_PLUS "numpad_plus"
+#define NUMPAD_ENTER "numpad_enter"
+#define NUMPAD_PERIOD "numpad_."
+
+#define MOUSE_LCLICK "rat_lclick"
+#define MOUSE_RCLICK "rat_rclick"
+#define MOUSE_MCLICK "rat_mclick"
+#define MOUSE_WHEEL_UP "rat_wheel_up"
+#define MOUSE_WHEEL_DOWN "rat_wheel_down"
+
+#define MEDIA_SCREENSHOT "media_screenshot"
+#define MEDIA_SHOW_KEYBOARD "media_show_keyboard"
+#define MEDIA_SHOW_DESKTOP "media_show_desktop"
+#define MEDIA_START_RECORDING "media_start_recording"
+#define MEDIA_MIC_OFF "media_mic_off"
+#define MEDIA_VOL_DOWN "media_vol_down"
+#define MEDIA_VOL_UP "media_vol_up"
+
+/* required so we can have nested attributes with same name but different functions */
+#define ALLY_DEVICE_ATTR_RW(_name, _sysfs_name)    \
+	struct device_attribute dev_attr_##_name = \
+		__ATTR(_sysfs_name, 0644, _name##_show, _name##_store)
+
+#define ALLY_DEVICE_ATTR_RO(_name, _sysfs_name)    \
+	struct device_attribute dev_attr_##_name = \
+		__ATTR(_sysfs_name, 0444, _name##_show, NULL)
+
+#define ALLY_DEVICE_ATTR_WO(_name, _sysfs_name)    \
+	struct device_attribute dev_attr_##_name = \
+		__ATTR(_sysfs_name, 0200, NULL, _name##_store)
+
+/* response curve macros */
+#define ALLY_RESP_CURVE_SHOW(_name, _point_n)                                 \
+	static ssize_t _name##_show(struct device *dev,                       \
+				    struct device_attribute *attr, char *buf) \
+	{                                                                     \
+		struct ally_gamepad_cfg *ally_cfg = drvdata.gamepad_cfg;      \
+		int idx = (_point_n - 1) * 2;                                 \
+		if (!drvdata.gamepad_cfg)                                     \
+			return -ENODEV;                                       \
+		return sysfs_emit(                                            \
+			buf, "%d %d\n",                                       \
+			ally_cfg->response_curve[ally_cfg->mode]              \
+						[btn_pair_side_left][idx],    \
+			ally_cfg->response_curve[ally_cfg->mode]              \
+						[btn_pair_side_right]         \
+						[idx + 1]);                   \
+	}
+
+#define ALLY_RESP_CURVE_STORE(_name, _side, _point_n)               \
+	static ssize_t _name##_store(struct device *dev,            \
+				     struct device_attribute *attr, \
+				     const char *buf, size_t count) \
+	{                                                           \
+		int ret = __gamepad_store_response_curve(           \
+			dev, buf, btn_pair_side_##_side, _point_n); \
+		if (ret < 0)                                        \
+			return ret;                                 \
+		return count;                                       \
+	}
+
+/* _point_n must start at 1 */
+#define ALLY_JS_RC_POINT(_side, _point_n, _sysfs_label)                        \
+	ALLY_RESP_CURVE_SHOW(rc_point_##_side##_##_point_n, _point_n);         \
+	ALLY_RESP_CURVE_STORE(rc_point_##_side##_##_point_n, _side, _point_n); \
+	ALLY_DEVICE_ATTR_RW(rc_point_##_side##_##_point_n,                     \
+			    _sysfs_label##_point_n)
+
+/* deadzone macros */
+#define ALLY_AXIS_DEADZONE_SHOW(_axis)                                         \
+	static ssize_t _axis##_deadzone_show(                                  \
+		struct device *dev, struct device_attribute *attr, char *buf)  \
+	{                                                                      \
+		struct ally_gamepad_cfg *ally_cfg = drvdata.gamepad_cfg;       \
+		int side, is_tr;                                               \
+		if (!drvdata.gamepad_cfg)                                      \
+			return -ENODEV;                                        \
+		is_tr = _axis > xpad_axis_xy_right;                            \
+		side = _axis == xpad_axis_xy_right ||                          \
+				       _axis == xpad_axis_z_right ?            \
+			       2 :                                             \
+			       0;                                              \
+		return sysfs_emit(                                             \
+			buf, "%d %d\n",                                        \
+			ally_cfg->deadzones[ally_cfg->mode][is_tr][side],      \
+			ally_cfg->deadzones[ally_cfg->mode][is_tr][side + 1]); \
+	}
+
+#define ALLY_AXIS_DEADZONE_STORE(_axis)                                      \
+	static ssize_t _axis##_deadzone_store(struct device *dev,            \
+					      struct device_attribute *attr, \
+					      const char *buf, size_t count) \
+	{                                                                    \
+		struct ally_gamepad_cfg *ally_cfg = drvdata.gamepad_cfg;     \
+		if (!drvdata.gamepad_cfg)                                    \
+			return -ENODEV;                                      \
+		int ret = __gamepad_store_deadzones(ally_cfg, _axis, buf);   \
+		if (ret < 0)                                                 \
+			return ret;                                          \
+		return count;                                                \
+	}
+
+#define ALLY_AXIS_DEADZONE(_axis, _sysfs_label) \
+	ALLY_AXIS_DEADZONE_SHOW(_axis);         \
+	ALLY_AXIS_DEADZONE_STORE(_axis);        \
+	ALLY_DEVICE_ATTR_RW(_axis##_deadzone, _sysfs_label)
+
+/* button specific macros */
+#define ALLY_BTN_SHOW(_fname, _pair, _side, _secondary)                        \
+	static ssize_t _fname##_show(struct device *dev,                       \
+				     struct device_attribute *attr, char *buf) \
+	{                                                                      \
+		struct ally_gamepad_cfg *ally_cfg = drvdata.gamepad_cfg;       \
+		if (!drvdata.gamepad_cfg)                                      \
+			return -ENODEV;                                        \
+		return sysfs_emit(buf, "%s\n",                                 \
+				  __btn_map_to_string(ally_cfg, _pair, _side,  \
+						      _secondary));            \
+	}
+
+#define ALLY_BTN_STORE(_fname, _pair, _side, _secondary)                       \
+	static ssize_t _fname##_store(struct device *dev,                      \
+				      struct device_attribute *attr,           \
+				      const char *buf, size_t count)           \
+	{                                                                      \
+		struct ally_gamepad_cfg *ally_cfg = drvdata.gamepad_cfg;       \
+		if (!drvdata.gamepad_cfg)                                      \
+			return -ENODEV;                                        \
+		int ret = __gamepad_mapping_store(ally_cfg, buf, _pair, _side, \
+						  _secondary);                 \
+		if (ret < 0)                                                   \
+			return ret;                                            \
+		return count;                                                  \
+	}
+
+#define ALLY_BTN_TURBO_SHOW(_fname, _pair, _side)                             \
+	static ssize_t _fname##_turbo_show(                                   \
+		struct device *dev, struct device_attribute *attr, char *buf) \
+	{                                                                     \
+		return sysfs_emit(buf, "%d\n",                                \
+				  __gamepad_turbo_show(dev, _pair, _side));   \
+	}
+
+#define ALLY_BTN_TURBO_STORE(_fname, _pair, _side)                         \
+	static ssize_t _fname##_turbo_store(struct device *dev,            \
+					    struct device_attribute *attr, \
+					    const char *buf, size_t count) \
+	{                                                                  \
+		int ret = __gamepad_turbo_store(dev, buf, _pair, _side);   \
+		if (ret < 0)                                               \
+			return ret;                                        \
+		return count;                                              \
+	}
+
+#define ALLY_BTN_ATTRS_GROUP(_name, _fname)                               \
+	static struct attribute *_fname##_attrs[] = {                     \
+		&dev_attr_##_fname.attr, &dev_attr_##_fname##_macro.attr, \
+		&dev_attr_##_fname##_turbo.attr, NULL                     \
+	};                                                                \
+	static const struct attribute_group _fname##_attr_group = {       \
+		.name = __stringify(_name),                               \
+		.attrs = _fname##_attrs,                                  \
+	}
+
+#define ALLY_BTN_MAPPING(_fname, _pair, _side)                            \
+	ALLY_BTN_SHOW(btn_mapping_##_fname, _pair, _side, false);         \
+	ALLY_BTN_STORE(btn_mapping_##_fname, _pair, _side, false);        \
+	ALLY_BTN_SHOW(btn_mapping_##_fname##_macro, _pair, _side, true);  \
+	ALLY_BTN_STORE(btn_mapping_##_fname##_macro, _pair, _side, true); \
+	ALLY_BTN_TURBO_SHOW(btn_mapping_##_fname, _pair, _side);          \
+	ALLY_BTN_TURBO_STORE(btn_mapping_##_fname, _pair, _side);         \
+	ALLY_DEVICE_ATTR_RW(btn_mapping_##_fname, remap);                 \
+	ALLY_DEVICE_ATTR_RW(btn_mapping_##_fname##_macro, macro_remap);   \
+	ALLY_DEVICE_ATTR_RW(btn_mapping_##_fname##_turbo, turbo);         \
+	ALLY_BTN_ATTRS_GROUP(btn_##_fname, btn_mapping_##_fname)
+
+/* calibration macros */
+#define ALLY_CAL_STORE(_fname, _axis)                                \
+	static ssize_t _fname##_store(struct device *dev,            \
+				      struct device_attribute *attr, \
+				      const char *buf, size_t count) \
+	{                                                            \
+		int ret = __gamepad_cal_store(dev, buf, _axis);      \
+		if (ret < 0)                                         \
+			return ret;                                  \
+		return count;                                        \
+	}
+
+#define ALLY_CAL_SHOW(_fname, _axis)                                           \
+	static ssize_t _fname##_show(struct device *dev,                       \
+				     struct device_attribute *attr, char *buf) \
+	{                                                                      \
+		return __gamepad_cal_show(dev, buf, _axis);                    \
+	}
+
+#define ALLY_CAL_ATTR(_fname, _axis, _sysfs_label) \
+	ALLY_CAL_STORE(_fname, _axis);             \
+	ALLY_CAL_SHOW(_fname, _axis);              \
+	ALLY_DEVICE_ATTR_RW(_fname, _sysfs_label)
+
+#define ALLY_CAL_RESET_STORE(_fname, _axis)                          \
+	static ssize_t _fname##_store(struct device *dev,            \
+				      struct device_attribute *attr, \
+				      const char *buf, size_t count) \
+	{                                                            \
+		int ret = __gamepad_cal_reset(dev, buf, _axis);      \
+		if (ret < 0)                                         \
+			return ret;                                  \
+		return count;                                        \
+	}
+
+#define ALLY_CAL_RESET_ATTR(_fname, _axis, _sysfs_label) \
+	ALLY_CAL_RESET_STORE(_fname, _axis);             \
+	ALLY_DEVICE_ATTR_WO(_fname, _sysfs_label)
+
+/*
+ * The following blocks of packets exist to make setting a default boot config
+ * easier. They were directly captured from setting the gamepad up.
+ */
+
+/* Default blocks for the xpad mode */
+static const u8 XPAD_DEF1[MAPPING_BLOCK_LEN] = {
+	0x01, 0x09, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
+	0x05, 0x00, 0x00, 0x19, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
+	0x01, 0x0a, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
+	0x04, 0x00, 0x00, 0x00, 0x00, 0x03, 0x8c, 0x88, 0x76, 0x00, 0x00
+};
+static const u8 XPAD_DEF2[MAPPING_BLOCK_LEN] = {
+	0x01, 0x0b, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
+	0x04, 0x00, 0x00, 0x00, 0x00, 0x02, 0x82, 0x23, 0x00, 0x00, 0x00,
+	0x01, 0x0c, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
+	0x04, 0x00, 0x00, 0x00, 0x00, 0x02, 0x82, 0x0d, 0x00, 0x00, 0x00
+};
+static const u8 XPAD_DEF3[MAPPING_BLOCK_LEN] = {
+	0x01, 0x07, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
+	0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
+	0x01, 0x08, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
+	0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
+};
+static const u8 XPAD_DEF4[MAPPING_BLOCK_LEN] = {
+	0x01, 0x05, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
+	0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
+	0x01, 0x06, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
+	0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
+};
+static const u8 XPAD_DEF5[MAPPING_BLOCK_LEN] = {
+	0x01, 0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
+	0x05, 0x00, 0x00, 0x16, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
+	0x01, 0x02, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
+	0x04, 0x00, 0x00, 0x00, 0x00, 0x02, 0x82, 0x31, 0x00, 0x00, 0x00
+};
+static const u8 XPAD_DEF6[MAPPING_BLOCK_LEN] = {
+	0x01, 0x03, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
+	0x04, 0x00, 0x00, 0x00, 0x00, 0x02, 0x82, 0x4d, 0x00, 0x00, 0x00,
+	0x01, 0x04, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
+	0x05, 0x00, 0x00, 0x1e, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
+};
+static const u8 XPAD_DEF7[MAPPING_BLOCK_LEN] = {
+	0x01, 0x11, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
+	0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
+	0x01, 0x12, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
+	0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
+};
+static const u8 XPAD_DEF8[MAPPING_BLOCK_LEN] = {
+	0x02, 0x00, 0x8e, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
+	0x02, 0x00, 0x8e, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
+	0x02, 0x00, 0x8f, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
+	0x02, 0x00, 0x8f, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
+};
+static const u8 XPAD_DEF9[MAPPING_BLOCK_LEN] = {
+	0x01, 0x0d, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
+	0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
+	0x01, 0x0e, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
+	0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
+};
+
+/* default blocks for the wasd mode */
+static const u8 WASD_DEF1[MAPPING_BLOCK_LEN] = {
+	0x02, 0x00, 0x98, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
+	0x05, 0x00, 0x00, 0x19, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
+	0x02, 0x00, 0x99, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
+	0x04, 0x00, 0x00, 0x00, 0x00, 0x03, 0x8c, 0x88, 0x76, 0x00, 0x00
+};
+static const u8 WASD_DEF2[MAPPING_BLOCK_LEN] = {
+	0x02, 0x00, 0x9a, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
+	0x04, 0x00, 0x00, 0x00, 0x00, 0x02, 0x82, 0x23, 0x00, 0x00, 0x00,
+	0x02, 0x00, 0x9b, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
+	0x04, 0x00, 0x00, 0x00, 0x00, 0x02, 0x82, 0x0d, 0x00, 0x00, 0x00
+};
+static const u8 WASD_DEF3[MAPPING_BLOCK_LEN] = {
+	0x02, 0x00, 0x88, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
+	0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
+	0x03, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
+	0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
+};
+static const u8 WASD_DEF4[MAPPING_BLOCK_LEN] = {
+	0x02, 0x00, 0x0d, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
+	0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
+	0x03, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
+	0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
+};
+static const u8 WASD_DEF5[MAPPING_BLOCK_LEN] = {
+	0x02, 0x00, 0x5a, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
+	0x05, 0x00, 0x00, 0x16, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
+	0x02, 0x00, 0x76, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
+	0x04, 0x00, 0x00, 0x00, 0x00, 0x02, 0x82, 0x31, 0x00, 0x00, 0x00
+};
+static const u8 WASD_DEF6[MAPPING_BLOCK_LEN] = {
+	0x02, 0x00, 0x97, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
+	0x04, 0x00, 0x00, 0x00, 0x00, 0x02, 0x82, 0x4d, 0x00, 0x00, 0x00,
+	0x02, 0x00, 0x96, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
+	0x05, 0x00, 0x00, 0x1e, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
+};
+static const u8 WASD_DEF7[MAPPING_BLOCK_LEN] = {
+	0x01, 0x11, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
+	0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
+	0x01, 0x12, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
+	0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
+};
+static const u8 WASD_DEF8[MAPPING_BLOCK_LEN] = {
+	0x02, 0x00, 0x8e, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
+	0x02, 0x00, 0x8e, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
+	0x02, 0x00, 0x8f, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
+	0x02, 0x00, 0x8f, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
+};
+static const u8 WASD_DEF9[MAPPING_BLOCK_LEN] = {
+	0x04, 0x00, 0x00, 0x00, 0x00, 0x02, 0x88, 0x0d, 0x00, 0x00, 0x00,
+	0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
+	0x03, 0x00, 0x00, 0x00, 0x02, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
+	0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
+};
+
+/*
+ * the xpad_mode is used inside the mode setting packet and is used
+ * for indexing (xpad_mode - 1)
+ */
+enum xpad_mode {
+	xpad_mode_game = 0x01,
+	xpad_mode_wasd = 0x02,
+	xpad_mode_mouse = 0x03,
+};
+
+/* the xpad_cmd determines which feature is set or queried */
+enum xpad_cmd {
+	xpad_cmd_set_mode = 0x01,
+	xpad_cmd_set_mapping = 0x02,
+	xpad_cmd_set_js_dz = 0x04, /* deadzones */
+	xpad_cmd_set_tr_dz = 0x05, /* deadzones */
+	xpad_cmd_set_vibe_intensity = 0x06,
+	xpad_cmd_set_leds = 0x08,
+	xpad_cmd_check_ready = 0x0A,
+	xpad_cmd_set_calibration = 0x0D,
+	xpad_cmd_set_turbo = 0x0F,
+	xpad_cmd_set_response_curve = 0x13,
+	xpad_cmd_set_adz = 0x18,
+};
+
+/* the xpad_cmd determines which feature is set or queried */
+enum xpad_cmd_len {
+	xpad_cmd_len_mode = 0x01,
+	xpad_cmd_len_mapping = 0x2c,
+	xpad_cmd_len_deadzone = 0x04,
+	xpad_cmd_len_vibe_intensity = 0x02,
+	xpad_cmd_len_leds = 0x0C,
+	xpad_cmd_len_calibration2 = 0x01,
+	xpad_cmd_len_calibration3 = 0x01,
+	xpad_cmd_len_turbo = 0x20,
+	xpad_cmd_len_response_curve = 0x09,
+	xpad_cmd_len_adz = 0x02,
+};
+
+/*
+ * the xpad_mode is used in various set and query HID packets and is
+ * used for indexing (xpad_axis - 1)
+ */
+enum xpad_axis {
+	xpad_axis_xy_left = 0x01,
+	xpad_axis_xy_right = 0x02,
+	xpad_axis_z_left = 0x03,
+	xpad_axis_z_right = 0x04,
+};
+
+enum btn_pair {
+	btn_pair_dpad_u_d = 0x01,
+	btn_pair_dpad_l_r = 0x02,
+	btn_pair_ls_rs = 0x03,
+	btn_pair_lb_rb = 0x04,
+	btn_pair_a_b = 0x05,
+	btn_pair_x_y = 0x06,
+	btn_pair_view_menu = 0x07,
+	btn_pair_m1_m2 = 0x08,
+	btn_pair_lt_rt = 0x09,
+};
+
+enum btn_pair_side {
+	btn_pair_side_left = 0x00,
+	btn_pair_side_right = 0x01,
+};
diff --git a/drivers/hid/hid-asus.c b/drivers/hid/hid-asus.c
index 659cf9c96e26..528c210f9e8c 100644
--- a/drivers/hid/hid-asus.c
+++ b/drivers/hid/hid-asus.c
@@ -52,6 +52,10 @@ MODULE_DESCRIPTION("Asus HID Keyboard and TouchPad");
 #define FEATURE_KBD_LED_REPORT_ID1 0x5d
 #define FEATURE_KBD_LED_REPORT_ID2 0x5e
 
+#define ALLY_CFG_INTF_IN_ADDRESS 0x83
+#define ALLY_CFG_INTF_OUT_ADDRESS 0x04
+#define ALLY_X_INTERFACE_ADDRESS 0x87
+
 #define SUPPORT_KBD_BACKLIGHT BIT(0)
 
 #define MAX_TOUCH_MAJOR 8
@@ -84,6 +88,7 @@ MODULE_DESCRIPTION("Asus HID Keyboard and TouchPad");
 #define QUIRK_MEDION_E1239T		BIT(10)
 #define QUIRK_ROG_NKEY_KEYBOARD		BIT(11)
 #define QUIRK_ROG_CLAYMORE_II_KEYBOARD BIT(12)
+#define QUIRK_ROG_ALLY_XPAD		BIT(13)
 
 #define I2C_KEYBOARD_QUIRKS			(QUIRK_FIX_NOTEBOOK_REPORT | \
 						 QUIRK_NO_INIT_REPORTS | \
@@ -1003,6 +1008,17 @@ static int asus_probe(struct hid_device *hdev, const struct hid_device_id *id)
 
 	drvdata->quirks = id->driver_data;
 
+	/* Ignore these endpoints as they will be used by other drivers */
+	if (drvdata->quirks & QUIRK_ROG_ALLY_XPAD) {
+		struct usb_interface *intf = to_usb_interface(hdev->dev.parent);
+		struct usb_host_endpoint *ep = intf->cur_altsetting->endpoint;
+
+		if (ep->desc.bEndpointAddress == ALLY_X_INTERFACE_ADDRESS ||
+			ep->desc.bEndpointAddress == ALLY_CFG_INTF_IN_ADDRESS ||
+			ep->desc.bEndpointAddress == ALLY_CFG_INTF_OUT_ADDRESS)
+			return -ENODEV;
+	}
+
 	/*
 	 * T90CHI's keyboard dock returns same ID values as T100CHI's dock.
 	 * Thus, identify T90CHI dock with product name string.
@@ -1254,10 +1270,10 @@ static const struct hid_device_id asus_devices[] = {
 	  QUIRK_USE_KBD_BACKLIGHT | QUIRK_ROG_NKEY_KEYBOARD },
 	{ HID_USB_DEVICE(USB_VENDOR_ID_ASUSTEK,
 	    USB_DEVICE_ID_ASUSTEK_ROG_NKEY_ALLY),
-	  QUIRK_USE_KBD_BACKLIGHT | QUIRK_ROG_NKEY_KEYBOARD },
+	  QUIRK_USE_KBD_BACKLIGHT | QUIRK_ROG_NKEY_KEYBOARD | QUIRK_ROG_ALLY_XPAD},
 	{ HID_USB_DEVICE(USB_VENDOR_ID_ASUSTEK,
 	    USB_DEVICE_ID_ASUSTEK_ROG_NKEY_ALLY_X),
-	  QUIRK_USE_KBD_BACKLIGHT | QUIRK_ROG_NKEY_KEYBOARD },
+	  QUIRK_USE_KBD_BACKLIGHT | QUIRK_ROG_NKEY_KEYBOARD | QUIRK_ROG_ALLY_XPAD },
 	{ HID_USB_DEVICE(USB_VENDOR_ID_ASUSTEK,
 	    USB_DEVICE_ID_ASUSTEK_ROG_CLAYMORE_II_KEYBOARD),
 	  QUIRK_ROG_CLAYMORE_II_KEYBOARD },
-- 
2.45.2


