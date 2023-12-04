Return-Path: <linux-input+bounces-432-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B92E802CF5
	for <lists+linux-input@lfdr.de>; Mon,  4 Dec 2023 09:17:53 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 5DEB01C209C5
	for <lists+linux-input@lfdr.de>; Mon,  4 Dec 2023 08:17:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 24793D512;
	Mon,  4 Dec 2023 08:17:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YLWbWG9N"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-pl1-x635.google.com (mail-pl1-x635.google.com [IPv6:2607:f8b0:4864:20::635])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DB04CFE
	for <linux-input@vger.kernel.org>; Mon,  4 Dec 2023 00:17:40 -0800 (PST)
Received: by mail-pl1-x635.google.com with SMTP id d9443c01a7336-1d069b1d127so8317475ad.0
        for <linux-input@vger.kernel.org>; Mon, 04 Dec 2023 00:17:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1701677860; x=1702282660; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=pg9/Mik6R59hbfwuvjk0k+DUUFbeulkUM0ETYMgfTzs=;
        b=YLWbWG9NNIlDw8u57g4gCJGk2lQ4+ubnJKSOHo7mNBLz4b6N1Xj03y+pSkzG317giY
         0Bv6M9Ct11rfVMLyAjOWZGV453W2IBmAhAhsDB2v23StHLXQcKl+IKx+iHQUwyPjUVyE
         +0VeVDIwb4Q467ejxzA45aKOubcIIHw1e8BpfRUCxlAMfUGrQ5CHOLQKfbgKWZ2he9Ag
         y5NlkfEwG5bu5OSQOKtQQjYtCj2mOrUm7UVJnaBZ60iNs4r6bhzoCjceRpQDkIO0EOTh
         STNq/icygHfsg9V21DnLudyLQDn5xcO2zyP0ZQu+bAkYPT+F78d5ireCbpXE9zb76mMD
         jjdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701677860; x=1702282660;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=pg9/Mik6R59hbfwuvjk0k+DUUFbeulkUM0ETYMgfTzs=;
        b=akhP6dR0hY6B015mzTkaYh4u1q3twus3eEHFhZMyj18d8OIJbXUUDDcMuEUeQv9kWs
         RZLOuW+mIwFODHlhn2KjsW5l/WWxfjG9blspC6sDLWnTsUd2DVHYWYEKbYhuuxrp7+UB
         rvolUoWCgX4xBzUyRdf9Bgi0wmL1ov1NMVvnnRuPF48R77qICrd77bOUaVTyLI3WEZjZ
         If16C0GJ821H5vPEaIBFQhixg1klDJOXMDUQR1wU5/PjUP1EclbZHungc4wzyCsEA5yz
         /RMxxS/Rqn4HE1kVikpqGb6ew/J6Rh81zkYcvd+5xPLg73pC2Z6mnpGy05Sb/xJxGu4W
         nJGw==
X-Gm-Message-State: AOJu0YwulcN6ec/UaqbLamiTxDtnItVuNNOhxXBRgdfeiOrBLQPhxHDk
	Kg8iT+/C4QKioO/Qe43tKohBJNKCirPeCu9N
X-Google-Smtp-Source: AGHT+IHVDLuwZSUbb7De6MrEm4JpSjTG37754shxv35yWLFUnnjbxPWd+tZm9sOjU/36hXiM3PaVDA==
X-Received: by 2002:a17:902:bd0a:b0:1d0:acfc:a662 with SMTP id p10-20020a170902bd0a00b001d0acfca662mr402286pls.123.1701677859541;
        Mon, 04 Dec 2023 00:17:39 -0800 (PST)
Received: from localhost.localdomain ([50.47.187.252])
        by smtp.gmail.com with ESMTPSA id i13-20020a17090332cd00b001d0545482dasm5895667plr.92.2023.12.04.00.17.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 04 Dec 2023 00:17:39 -0800 (PST)
From: Ryan McClelland <rymcclel@gmail.com>
To: linux-input@vger.kernel.org
Cc: djogorchock@gmail.com,
	benjamin.tissoires@redhat.com,
	jikos@kernel.org,
	Ryan McClelland <rymcclel@gmail.com>
Subject: [PATCH] HID: nintendo: add support for nso controllers
Date: Mon,  4 Dec 2023 00:17:21 -0800
Message-Id: <20231204081721.19507-1-rymcclel@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This adds support for the nintendo switch online controllers which
include the SNES, Genesis, and N64 Controllers.

As each nso controller only implements a subset of what a pro
controller can do. Each of these 'features' were broken up in to
seperate functions which include right stick, left stick, imu, and
dpad and depending on the controller type that it is, it will call
the supported functions appropriately.

Each controller now has a struct which maps the bit within the hid
in report to a button.

The name given to the device now comes directly from the hid
device name rather than looking up a predefined string.

Signed-off-by: Ryan McClelland <rymcclel@gmail.com>
---
 drivers/hid/Kconfig        |  13 +-
 drivers/hid/hid-ids.h      |   5 +-
 drivers/hid/hid-nintendo.c | 897 ++++++++++++++++++++++++++-----------
 3 files changed, 649 insertions(+), 266 deletions(-)

diff --git a/drivers/hid/Kconfig b/drivers/hid/Kconfig
index 4ce74af79657..347c284fb27e 100644
--- a/drivers/hid/Kconfig
+++ b/drivers/hid/Kconfig
@@ -761,14 +761,15 @@ config HID_MULTITOUCH
 	  module will be called hid-multitouch.
 
 config HID_NINTENDO
-	tristate "Nintendo Joy-Con and Pro Controller support"
+	tristate "Nintendo Joy-Con, NSO, and Pro Controller support"
 	depends on NEW_LEDS
 	depends on LEDS_CLASS
 	select POWER_SUPPLY
 	help
-	Adds support for the Nintendo Switch Joy-Cons and Pro Controller.
+	Adds support for the Nintendo Switch Joy-Cons, NSO, Pro Controller.
 	All controllers support bluetooth, and the Pro Controller also supports
-	its USB mode.
+	its USB mode. This also includes support for the Nintendo Switch Online
+	Controllers which include the Genesis, SNES, and N64 controllers.
 
 	To compile this driver as a module, choose M here: the
 	module will be called hid-nintendo.
@@ -779,9 +780,9 @@ config NINTENDO_FF
 	select INPUT_FF_MEMLESS
 	help
 	Say Y here if you have a Nintendo Switch controller and want to enable
-	force feedback support for it. This works for both joy-cons and the pro
-	controller. For the pro controller, both rumble motors can be controlled
-	individually.
+	force feedback support for it. This works for both joy-cons, the pro
+	controller, and the NSO N64 controller. For the pro controller, both
+	rumble motors can be controlled individually.
 
 config HID_NTI
 	tristate "NTI keyboard adapters"
diff --git a/drivers/hid/hid-ids.h b/drivers/hid/hid-ids.h
index c6e4e0d1f214..a90aa3c31dd0 100644
--- a/drivers/hid/hid-ids.h
+++ b/drivers/hid/hid-ids.h
@@ -986,7 +986,10 @@
 #define USB_DEVICE_ID_NINTENDO_JOYCONL	0x2006
 #define USB_DEVICE_ID_NINTENDO_JOYCONR	0x2007
 #define USB_DEVICE_ID_NINTENDO_PROCON	0x2009
-#define USB_DEVICE_ID_NINTENDO_CHRGGRIP	0x200E
+#define USB_DEVICE_ID_NINTENDO_CHRGGRIP	0x200e
+#define USB_DEVICE_ID_NINTENDO_SNESCON	0x2017
+#define USB_DEVICE_ID_NINTENDO_GENCON	0x201e
+#define USB_DEVICE_ID_NINTENDO_N64CON	0x2019
 
 #define USB_VENDOR_ID_NOVATEK		0x0603
 #define USB_DEVICE_ID_NOVATEK_PCT	0x0600
diff --git a/drivers/hid/hid-nintendo.c b/drivers/hid/hid-nintendo.c
index 138f154fecef..47af111ef3a2 100644
--- a/drivers/hid/hid-nintendo.c
+++ b/drivers/hid/hid-nintendo.c
@@ -3,6 +3,9 @@
  * HID driver for Nintendo Switch Joy-Cons and Pro Controllers
  *
  * Copyright (c) 2019-2021 Daniel J. Ogorchock <djogorchock@gmail.com>
+ * Portions Copyright (c) 2020 Nadia Holmquist Pedersen <nadia@nhp.sh>
+ * Copyright (c) 2022 Emily Strickland <linux@emily.st>
+ * Copyright (c) 2023 Ryan McClelland <rymcclel@gmail.com>
  *
  * The following resources/projects were referenced for this driver:
  *   https://github.com/dekuNukem/Nintendo_Switch_Reverse_Engineering
@@ -17,6 +20,9 @@
  * This driver supports the Nintendo Switch Joy-Cons and Pro Controllers. The
  * Pro Controllers can either be used over USB or Bluetooth.
  *
+ * This driver also incorporates support for Nintendo Switch Online controllers
+ * for the NES, SNES, Sega Genesis, and N64.
+ *
  * The driver will retrieve the factory calibration info from the controllers,
  * so little to no user calibration should be required.
  *
@@ -305,9 +311,14 @@ enum joycon_ctlr_state {
 
 /* Controller type received as part of device info */
 enum joycon_ctlr_type {
-	JOYCON_CTLR_TYPE_JCL = 0x01,
-	JOYCON_CTLR_TYPE_JCR = 0x02,
-	JOYCON_CTLR_TYPE_PRO = 0x03,
+	JOYCON_CTLR_TYPE_JCL  = 0x01,
+	JOYCON_CTLR_TYPE_JCR  = 0x02,
+	JOYCON_CTLR_TYPE_PRO  = 0x03,
+	JOYCON_CTLR_TYPE_NESL = 0x09,
+	JOYCON_CTLR_TYPE_NESR = 0x0A,
+	JOYCON_CTLR_TYPE_SNES = 0x0B,
+	JOYCON_CTLR_TYPE_GEN  = 0x0D,
+	JOYCON_CTLR_TYPE_N64  = 0x0C,
 };
 
 struct joycon_stick_cal {
@@ -348,6 +359,137 @@ static const u32 JC_BTN_SL_L	= BIT(21);
 static const u32 JC_BTN_L	= BIT(22);
 static const u32 JC_BTN_ZL	= BIT(23);
 
+struct joycon_ctlr_button_mapping {
+	u32 code;
+	u32 bit;
+};
+
+/*
+ * D-pad is configured as buttons for the left Joy-Con only!
+ */
+static const struct joycon_ctlr_button_mapping left_joycon_button_mappings[] = {
+	{ BTN_TL,		JC_BTN_L,	},
+	{ BTN_TL2,		JC_BTN_ZL,	},
+	{ BTN_SELECT,		JC_BTN_MINUS,	},
+	{ BTN_THUMBL,		JC_BTN_LSTICK,	},
+	{ BTN_DPAD_UP,		JC_BTN_UP,	},
+	{ BTN_DPAD_DOWN,	JC_BTN_DOWN,	},
+	{ BTN_DPAD_LEFT,	JC_BTN_LEFT,	},
+	{ BTN_DPAD_RIGHT,	JC_BTN_RIGHT,	},
+	{ BTN_Z,		JC_BTN_CAP,	},
+	{ /* sentinel */ },
+};
+
+/*
+ * The unused *right*-side triggers become the SL/SR triggers for the *left*
+ * Joy-Con, if and only if we're not using a charging grip.
+ */
+static const struct joycon_ctlr_button_mapping left_joycon_s_button_mappings[] = {
+	{ BTN_TR,	JC_BTN_SL_L,	},
+	{ BTN_TR2,	JC_BTN_SR_L,	},
+	{ /* sentinel */ },
+};
+
+static const struct joycon_ctlr_button_mapping right_joycon_button_mappings[] = {
+	{ BTN_EAST,	JC_BTN_A,	},
+	{ BTN_SOUTH,	JC_BTN_B,	},
+	{ BTN_NORTH,	JC_BTN_X,	},
+	{ BTN_WEST,	JC_BTN_Y,	},
+	{ BTN_TR,	JC_BTN_R,	},
+	{ BTN_TR2,	JC_BTN_ZR,	},
+	{ BTN_START,	JC_BTN_PLUS,	},
+	{ BTN_THUMBR,	JC_BTN_RSTICK,	},
+	{ BTN_MODE,	JC_BTN_HOME,	},
+	{ /* sentinel */ },
+};
+
+/*
+ * The unused *left*-side triggers become the SL/SR triggers for the *right*
+ * Joy-Con, if and only if we're not using a charging grip.
+ */
+static const struct joycon_ctlr_button_mapping right_joycon_s_button_mappings[] = {
+	{ BTN_TL,	JC_BTN_SL_R,	},
+	{ BTN_TL2,	JC_BTN_SR_R,	},
+	{ /* sentinel */ },
+};
+
+static const struct joycon_ctlr_button_mapping procon_button_mappings[] = {
+	{ BTN_EAST,	JC_BTN_A,	},
+	{ BTN_SOUTH,	JC_BTN_B,	},
+	{ BTN_NORTH,	JC_BTN_X,	},
+	{ BTN_WEST,	JC_BTN_Y,	},
+	{ BTN_TL,	JC_BTN_L,	},
+	{ BTN_TR,	JC_BTN_R,	},
+	{ BTN_TL2,	JC_BTN_ZL,	},
+	{ BTN_TR2,	JC_BTN_ZR,	},
+	{ BTN_SELECT,	JC_BTN_MINUS,	},
+	{ BTN_START,	JC_BTN_PLUS,	},
+	{ BTN_THUMBL,	JC_BTN_LSTICK,	},
+	{ BTN_THUMBR,	JC_BTN_RSTICK,	},
+	{ BTN_MODE,	JC_BTN_HOME,	},
+	{ BTN_Z,	JC_BTN_CAP,	},
+	{ /* sentinel */ },
+};
+
+static const struct joycon_ctlr_button_mapping nescon_button_mappings[] = {
+	{ BTN_SOUTH,	JC_BTN_A,	},
+	{ BTN_EAST,	JC_BTN_B,	},
+	{ BTN_TL,	JC_BTN_L,	},
+	{ BTN_TR,	JC_BTN_R,	},
+	{ BTN_SELECT,	JC_BTN_MINUS,	},
+	{ BTN_START,	JC_BTN_PLUS,	},
+	{ /* sentinel */ },
+};
+
+static const struct joycon_ctlr_button_mapping snescon_button_mappings[] = {
+	{ BTN_EAST,	JC_BTN_A,	},
+	{ BTN_SOUTH,	JC_BTN_B,	},
+	{ BTN_NORTH,	JC_BTN_X,	},
+	{ BTN_WEST,	JC_BTN_Y,	},
+	{ BTN_TL,	JC_BTN_L,	},
+	{ BTN_TR,	JC_BTN_R,	},
+	{ BTN_TL2,	JC_BTN_ZL,	},
+	{ BTN_TR2,	JC_BTN_ZR,	},
+	{ BTN_SELECT,	JC_BTN_MINUS,	},
+	{ BTN_START,	JC_BTN_PLUS,	},
+	{ /* sentinel */ },
+};
+
+/*
+ * "A", "B", and "C" are mapped positionally, rather than by label (e.g., "A"
+ * gets assigned to BTN_EAST instead of BTN_A).
+ */
+static const struct joycon_ctlr_button_mapping gencon_button_mappings[] = {
+	{ BTN_SOUTH,	JC_BTN_A,	},
+	{ BTN_EAST,	JC_BTN_B,	},
+	{ BTN_WEST,	JC_BTN_R,	},
+	{ BTN_SELECT,	JC_BTN_ZR,	},
+	{ BTN_START,	JC_BTN_PLUS,	},
+	{ BTN_MODE,	JC_BTN_HOME,	},
+	{ BTN_Z,	JC_BTN_CAP,	},
+	{ /* sentinel */ },
+};
+
+/*
+ * N64's C buttons get assigned to d-pad directions and registered as buttons.
+ */
+static const struct joycon_ctlr_button_mapping n64con_button_mappings[] = {
+	{ BTN_A,		JC_BTN_A,	},
+	{ BTN_B,		JC_BTN_B,	},
+	{ BTN_TL2,		JC_BTN_ZL,	}, /* Z */
+	{ BTN_TL,		JC_BTN_L,	},
+	{ BTN_TR,		JC_BTN_R,	},
+	{ BTN_TR2,		JC_BTN_LSTICK,	}, /* ZR */
+	{ BTN_START,		JC_BTN_PLUS,	},
+	{ BTN_FORWARD,		JC_BTN_Y,	}, /* C UP */
+	{ BTN_BACK,		JC_BTN_ZR,	}, /* C DOWN */
+	{ BTN_LEFT,		JC_BTN_X,	}, /* C LEFT */
+	{ BTN_RIGHT,		JC_BTN_MINUS,	}, /* C RIGHT */
+	{ BTN_MODE,		JC_BTN_HOME,	},
+	{ BTN_Z,		JC_BTN_CAP,	},
+	{ /* sentinel */ },
+};
+
 enum joycon_msg_type {
 	JOYCON_MSG_TYPE_NONE,
 	JOYCON_MSG_TYPE_USB,
@@ -506,13 +648,182 @@ struct joycon_ctlr {
 /* Does this controller have inputs associated with left joycon? */
 #define jc_type_has_left(ctlr) \
 	(ctlr->ctlr_type == JOYCON_CTLR_TYPE_JCL || \
-	 ctlr->ctlr_type == JOYCON_CTLR_TYPE_PRO)
+	 ctlr->ctlr_type == JOYCON_CTLR_TYPE_PRO || \
+	 ctlr->ctlr_type == JOYCON_CTLR_TYPE_N64)
 
 /* Does this controller have inputs associated with right joycon? */
 #define jc_type_has_right(ctlr) \
 	(ctlr->ctlr_type == JOYCON_CTLR_TYPE_JCR || \
 	 ctlr->ctlr_type == JOYCON_CTLR_TYPE_PRO)
 
+
+/*
+ * Controller device helpers
+ *
+ * These look at the device ID known to the HID subsystem to identify a device,
+ * but take caution: some NSO devices lie about themselves (NES Joy-Cons and
+ * Sega Genesis controller). See type helpers below.
+ *
+ * These helpers are most useful early during the HID probe or in conjunction
+ * with the capability helpers below.
+ */
+static inline bool joycon_device_is_left_joycon(struct joycon_ctlr *ctlr)
+{
+	return ctlr->hdev->product == USB_DEVICE_ID_NINTENDO_JOYCONL;
+}
+
+static inline bool joycon_device_is_right_joycon(struct joycon_ctlr *ctlr)
+{
+	return ctlr->hdev->product == USB_DEVICE_ID_NINTENDO_JOYCONR;
+}
+
+static inline bool joycon_device_is_procon(struct joycon_ctlr *ctlr)
+{
+	return ctlr->hdev->product == USB_DEVICE_ID_NINTENDO_PROCON;
+}
+
+static inline bool joycon_device_is_chrggrip(struct joycon_ctlr *ctlr)
+{
+	return ctlr->hdev->product == USB_DEVICE_ID_NINTENDO_CHRGGRIP;
+}
+
+static inline bool joycon_device_is_snescon(struct joycon_ctlr *ctlr)
+{
+	return ctlr->hdev->product == USB_DEVICE_ID_NINTENDO_SNESCON;
+}
+
+static inline bool joycon_device_is_gencon(struct joycon_ctlr *ctlr)
+{
+	return ctlr->hdev->product == USB_DEVICE_ID_NINTENDO_GENCON;
+}
+
+static inline bool joycon_device_is_n64con(struct joycon_ctlr *ctlr)
+{
+	return ctlr->hdev->product == USB_DEVICE_ID_NINTENDO_N64CON;
+}
+
+static inline bool joycon_device_has_usb(struct joycon_ctlr *ctlr)
+{
+	return joycon_device_is_procon(ctlr) ||
+	       joycon_device_is_chrggrip(ctlr) ||
+	       joycon_device_is_snescon(ctlr) ||
+	       joycon_device_is_gencon(ctlr) ||
+	       joycon_device_is_n64con(ctlr);
+}
+
+/*
+ * Controller type helpers
+ *
+ * These are slightly different than the device-ID-based helpers above. They are
+ * generally more reliable, since they can distinguish between, e.g., Genesis
+ * versus SNES, or NES Joy-Cons versus regular Switch Joy-Cons. They're most
+ * useful for reporting available inputs. For other kinds of distinctions, see
+ * the capability helpers below.
+ *
+ * They have two major drawbacks: (1) they're not available until after we set
+ * the reporting method and then request the device info; (2) they can't
+ * distinguish all controllers (like the Charging Grip from the Pro controller.)
+ */
+static inline bool joycon_type_is_left_joycon(struct joycon_ctlr *ctlr)
+{
+	return ctlr->ctlr_type == JOYCON_CTLR_TYPE_JCL;
+}
+
+static inline bool joycon_type_is_right_joycon(struct joycon_ctlr *ctlr)
+{
+	return ctlr->ctlr_type == JOYCON_CTLR_TYPE_JCR;
+}
+
+static inline bool joycon_type_is_procon(struct joycon_ctlr *ctlr)
+{
+	return ctlr->ctlr_type == JOYCON_CTLR_TYPE_PRO;
+}
+
+static inline bool joycon_type_is_snescon(struct joycon_ctlr *ctlr)
+{
+	return ctlr->ctlr_type == JOYCON_CTLR_TYPE_SNES;
+}
+
+static inline bool joycon_type_is_gencon(struct joycon_ctlr *ctlr)
+{
+	return ctlr->ctlr_type == JOYCON_CTLR_TYPE_GEN;
+}
+
+static inline bool joycon_type_is_n64con(struct joycon_ctlr *ctlr)
+{
+	return ctlr->ctlr_type == JOYCON_CTLR_TYPE_N64;
+}
+
+static inline bool joycon_type_is_left_nescon(struct joycon_ctlr *ctlr)
+{
+	return ctlr->ctlr_type == JOYCON_CTLR_TYPE_NESL;
+}
+
+static inline bool joycon_type_is_right_nescon(struct joycon_ctlr *ctlr)
+{
+	return ctlr->ctlr_type == JOYCON_CTLR_TYPE_NESR;
+}
+
+static inline bool joycon_type_has_left_controls(struct joycon_ctlr *ctlr)
+{
+	return joycon_type_is_left_joycon(ctlr) ||
+	       joycon_type_is_procon(ctlr);
+}
+
+static inline bool joycon_type_has_right_controls(struct joycon_ctlr *ctlr)
+{
+	return joycon_type_is_right_joycon(ctlr) ||
+	       joycon_type_is_procon(ctlr);
+}
+
+static inline bool joycon_type_is_any_joycon(struct joycon_ctlr *ctlr)
+{
+	return joycon_type_is_left_joycon(ctlr) ||
+	       joycon_type_is_right_joycon(ctlr) ||
+	       joycon_device_is_chrggrip(ctlr);
+}
+
+static inline bool joycon_type_is_any_nescon(struct joycon_ctlr *ctlr)
+{
+	return joycon_type_is_left_nescon(ctlr) ||
+	       joycon_type_is_right_nescon(ctlr);
+}
+
+/*
+ * Controller capability helpers
+ *
+ * These helpers combine the use of the helpers above to detect certain
+ * capabilities during initialization. They are always accurate but (since they
+ * use type helpers) cannot be used early in the HID probe.
+ */
+static inline bool joycon_has_imu(struct joycon_ctlr *ctlr)
+{
+	return joycon_device_is_chrggrip(ctlr) ||
+	       joycon_type_is_any_joycon(ctlr) ||
+	       joycon_type_is_procon(ctlr);
+}
+
+static inline bool joycon_has_joysticks(struct joycon_ctlr *ctlr)
+{
+	return joycon_device_is_chrggrip(ctlr) ||
+	       joycon_type_is_any_joycon(ctlr) ||
+	       joycon_type_is_procon(ctlr) ||
+	       joycon_type_is_n64con(ctlr);
+}
+
+static inline bool joycon_has_rumble(struct joycon_ctlr *ctlr)
+{
+	return joycon_device_is_chrggrip(ctlr) ||
+	       joycon_type_is_any_joycon(ctlr) ||
+	       joycon_type_is_procon(ctlr) ||
+	       joycon_type_is_n64con(ctlr);
+}
+
+static inline bool joycon_using_usb(struct joycon_ctlr *ctlr)
+{
+	return ctlr->hdev->bus == BUS_USB;
+}
+
 static int __joycon_hid_send(struct hid_device *hdev, u8 *data, size_t len)
 {
 	u8 *buf;
@@ -1283,15 +1594,10 @@ static void joycon_parse_imu_report(struct joycon_ctlr *ctlr,
 	}
 }
 
-static void joycon_parse_report(struct joycon_ctlr *ctlr,
-				struct joycon_input_report *rep)
+static void joycon_handle_rumble_report(struct joycon_ctlr *ctlr, struct joycon_input_report *rep)
 {
-	struct input_dev *dev = ctlr->input;
 	unsigned long flags;
-	u8 tmp;
-	u32 btns;
 	unsigned long msecs = jiffies_to_msecs(jiffies);
-	unsigned long report_delta_ms = msecs - ctlr->last_input_report_msecs;
 
 	spin_lock_irqsave(&ctlr->lock, flags);
 	if (IS_ENABLED(CONFIG_NINTENDO_FF) && rep->vibrator_report &&
@@ -1310,11 +1616,21 @@ static void joycon_parse_report(struct joycon_ctlr *ctlr,
 		queue_work(ctlr->rumble_queue, &ctlr->rumble_worker);
 	}
 
-	/* Parse the battery status */
+	spin_unlock_irqrestore(&ctlr->lock, flags);
+}
+
+static void joycon_parse_battery_status(struct joycon_ctlr *ctlr, struct joycon_input_report *rep)
+{
+	u8 tmp;
+	unsigned long flags;
+
+	spin_lock_irqsave(&ctlr->lock, flags);
+
 	tmp = rep->bat_con;
 	ctlr->host_powered = tmp & BIT(0);
 	ctlr->battery_charging = tmp & BIT(4);
 	tmp = tmp >> 5;
+
 	switch (tmp) {
 	case 0: /* empty */
 		ctlr->battery_capacity = POWER_SUPPLY_CAPACITY_LEVEL_CRITICAL;
@@ -1336,102 +1652,121 @@ static void joycon_parse_report(struct joycon_ctlr *ctlr,
 		hid_warn(ctlr->hdev, "Invalid battery status\n");
 		break;
 	}
+
 	spin_unlock_irqrestore(&ctlr->lock, flags);
+}
 
-	/* Parse the buttons and sticks */
-	btns = hid_field_extract(ctlr->hdev, rep->button_status, 0, 24);
-
-	if (jc_type_has_left(ctlr)) {
-		u16 raw_x;
-		u16 raw_y;
-		s32 x;
-		s32 y;
-
-		/* get raw stick values */
-		raw_x = hid_field_extract(ctlr->hdev, rep->left_stick, 0, 12);
-		raw_y = hid_field_extract(ctlr->hdev,
-					  rep->left_stick + 1, 4, 12);
-		/* map the stick values */
-		x = joycon_map_stick_val(&ctlr->left_stick_cal_x, raw_x);
-		y = -joycon_map_stick_val(&ctlr->left_stick_cal_y, raw_y);
-		/* report sticks */
-		input_report_abs(dev, ABS_X, x);
-		input_report_abs(dev, ABS_Y, y);
-
-		/* report buttons */
-		input_report_key(dev, BTN_TL, btns & JC_BTN_L);
-		input_report_key(dev, BTN_TL2, btns & JC_BTN_ZL);
-		input_report_key(dev, BTN_SELECT, btns & JC_BTN_MINUS);
-		input_report_key(dev, BTN_THUMBL, btns & JC_BTN_LSTICK);
-		input_report_key(dev, BTN_Z, btns & JC_BTN_CAP);
-
-		if (jc_type_is_joycon(ctlr)) {
-			/* Report the S buttons as the non-existent triggers */
-			input_report_key(dev, BTN_TR, btns & JC_BTN_SL_L);
-			input_report_key(dev, BTN_TR2, btns & JC_BTN_SR_L);
-
-			/* Report d-pad as digital buttons for the joy-cons */
-			input_report_key(dev, BTN_DPAD_DOWN,
-					 btns & JC_BTN_DOWN);
-			input_report_key(dev, BTN_DPAD_UP, btns & JC_BTN_UP);
-			input_report_key(dev, BTN_DPAD_RIGHT,
-					 btns & JC_BTN_RIGHT);
-			input_report_key(dev, BTN_DPAD_LEFT,
-					 btns & JC_BTN_LEFT);
-		} else {
-			int hatx = 0;
-			int haty = 0;
-
-			/* d-pad x */
-			if (btns & JC_BTN_LEFT)
-				hatx = -1;
-			else if (btns & JC_BTN_RIGHT)
-				hatx = 1;
-			input_report_abs(dev, ABS_HAT0X, hatx);
-
-			/* d-pad y */
-			if (btns & JC_BTN_UP)
-				haty = -1;
-			else if (btns & JC_BTN_DOWN)
-				haty = 1;
-			input_report_abs(dev, ABS_HAT0Y, haty);
-		}
-	}
-	if (jc_type_has_right(ctlr)) {
-		u16 raw_x;
-		u16 raw_y;
-		s32 x;
-		s32 y;
-
-		/* get raw stick values */
-		raw_x = hid_field_extract(ctlr->hdev, rep->right_stick, 0, 12);
-		raw_y = hid_field_extract(ctlr->hdev,
-					  rep->right_stick + 1, 4, 12);
-		/* map stick values */
-		x = joycon_map_stick_val(&ctlr->right_stick_cal_x, raw_x);
-		y = -joycon_map_stick_val(&ctlr->right_stick_cal_y, raw_y);
-		/* report sticks */
-		input_report_abs(dev, ABS_RX, x);
-		input_report_abs(dev, ABS_RY, y);
-
-		/* report buttons */
-		input_report_key(dev, BTN_TR, btns & JC_BTN_R);
-		input_report_key(dev, BTN_TR2, btns & JC_BTN_ZR);
-		if (jc_type_is_joycon(ctlr)) {
-			/* Report the S buttons as the non-existent triggers */
-			input_report_key(dev, BTN_TL, btns & JC_BTN_SL_R);
-			input_report_key(dev, BTN_TL2, btns & JC_BTN_SR_R);
-		}
-		input_report_key(dev, BTN_START, btns & JC_BTN_PLUS);
-		input_report_key(dev, BTN_THUMBR, btns & JC_BTN_RSTICK);
-		input_report_key(dev, BTN_MODE, btns & JC_BTN_HOME);
-		input_report_key(dev, BTN_WEST, btns & JC_BTN_Y);
-		input_report_key(dev, BTN_NORTH, btns & JC_BTN_X);
-		input_report_key(dev, BTN_EAST, btns & JC_BTN_A);
-		input_report_key(dev, BTN_SOUTH, btns & JC_BTN_B);
+static void joycon_report_left_stick(struct joycon_ctlr *ctlr,
+				     struct joycon_input_report *rep)
+{
+	u16 raw_x;
+	u16 raw_y;
+	s32 x;
+	s32 y;
+
+	raw_x = hid_field_extract(ctlr->hdev, rep->left_stick, 0, 12);
+	raw_y = hid_field_extract(ctlr->hdev, rep->left_stick + 1, 4, 12);
+
+	x = joycon_map_stick_val(&ctlr->left_stick_cal_x, raw_x);
+	y = -joycon_map_stick_val(&ctlr->left_stick_cal_y, raw_y);
+
+	input_report_abs(ctlr->input, ABS_X, x);
+	input_report_abs(ctlr->input, ABS_Y, y);
+}
+
+static void joycon_report_right_stick(struct joycon_ctlr *ctlr,
+				      struct joycon_input_report *rep)
+{
+	u16 raw_x;
+	u16 raw_y;
+	s32 x;
+	s32 y;
+
+	raw_x = hid_field_extract(ctlr->hdev, rep->right_stick, 0, 12);
+	raw_y = hid_field_extract(ctlr->hdev, rep->right_stick + 1, 4, 12);
+
+	x = joycon_map_stick_val(&ctlr->right_stick_cal_x, raw_x);
+	y = -joycon_map_stick_val(&ctlr->right_stick_cal_y, raw_y);
+
+	input_report_abs(ctlr->input, ABS_RX, x);
+	input_report_abs(ctlr->input, ABS_RY, y);
+}
+
+static void joycon_report_dpad(struct joycon_ctlr *ctlr,
+			       struct joycon_input_report *rep)
+{
+	int hatx = 0;
+	int haty = 0;
+	u32 btns = hid_field_extract(ctlr->hdev, rep->button_status, 0, 24);
+
+	if (btns & JC_BTN_LEFT)
+		hatx = -1;
+	else if (btns & JC_BTN_RIGHT)
+		hatx = 1;
+
+	if (btns & JC_BTN_UP)
+		haty = -1;
+	else if (btns & JC_BTN_DOWN)
+		haty = 1;
+
+	input_report_abs(ctlr->input, ABS_HAT0X, hatx);
+	input_report_abs(ctlr->input, ABS_HAT0Y, haty);
+}
+
+static void joycon_report_buttons(struct joycon_ctlr *ctlr,
+				  struct joycon_input_report *rep,
+				  const struct joycon_ctlr_button_mapping button_mappings[])
+{
+	const struct joycon_ctlr_button_mapping *button;
+	u32 status = hid_field_extract(ctlr->hdev, rep->button_status, 0, 24);
+
+	for (button = button_mappings; button->code; button++)
+		input_report_key(ctlr->input, button->code, status & button->bit);
+}
+
+static void joycon_parse_report(struct joycon_ctlr *ctlr,
+				struct joycon_input_report *rep)
+{
+	unsigned long flags;
+	unsigned long msecs = jiffies_to_msecs(jiffies);
+	unsigned long report_delta_ms = msecs - ctlr->last_input_report_msecs;
+
+	if (joycon_has_rumble(ctlr))
+		joycon_handle_rumble_report(ctlr, rep);
+
+	joycon_parse_battery_status(ctlr, rep);
+
+	if (joycon_type_is_left_joycon(ctlr)) {
+		joycon_report_left_stick(ctlr, rep);
+		joycon_report_buttons(ctlr, rep, left_joycon_button_mappings);
+		if (!joycon_device_is_chrggrip(ctlr))
+			joycon_report_buttons(ctlr, rep, left_joycon_s_button_mappings);
+	} else if (joycon_type_is_right_joycon(ctlr)) {
+		joycon_report_right_stick(ctlr, rep);
+		joycon_report_buttons(ctlr, rep, right_joycon_button_mappings);
+		if (!joycon_device_is_chrggrip(ctlr))
+			joycon_report_buttons(ctlr, rep, right_joycon_s_button_mappings);
+	} else if (joycon_type_is_procon(ctlr)) {
+		joycon_report_left_stick(ctlr, rep);
+		joycon_report_right_stick(ctlr, rep);
+		joycon_report_dpad(ctlr, rep);
+		joycon_report_buttons(ctlr, rep, procon_button_mappings);
+	} else if (joycon_type_is_any_nescon(ctlr)) {
+		joycon_report_dpad(ctlr, rep);
+		joycon_report_buttons(ctlr, rep, nescon_button_mappings);
+	} else if (joycon_type_is_snescon(ctlr)) {
+		joycon_report_dpad(ctlr, rep);
+		joycon_report_buttons(ctlr, rep, snescon_button_mappings);
+	} else if (joycon_type_is_gencon(ctlr)) {
+		joycon_report_dpad(ctlr, rep);
+		joycon_report_buttons(ctlr, rep, gencon_button_mappings);
+	} else if (joycon_type_is_n64con(ctlr)) {
+		joycon_report_left_stick(ctlr, rep);
+		joycon_report_dpad(ctlr, rep);
+		joycon_report_buttons(ctlr, rep, n64con_button_mappings);
 	}
 
-	input_sync(dev);
+	input_sync(ctlr->input);
 
 	spin_lock_irqsave(&ctlr->lock, flags);
 	ctlr->last_input_report_msecs = msecs;
@@ -1471,7 +1806,7 @@ static void joycon_parse_report(struct joycon_ctlr *ctlr,
 	}
 
 	/* parse IMU data if present */
-	if (rep->id == JC_INPUT_IMU_DATA)
+	if ((rep->id == JC_INPUT_IMU_DATA) && joycon_has_imu(ctlr))
 		joycon_parse_imu_report(ctlr, rep);
 }
 
@@ -1684,123 +2019,65 @@ static int joycon_play_effect(struct input_dev *dev, void *data,
 }
 #endif /* IS_ENABLED(CONFIG_NINTENDO_FF) */
 
-static const unsigned int joycon_button_inputs_l[] = {
-	BTN_SELECT, BTN_Z, BTN_THUMBL,
-	BTN_TL, BTN_TL2,
-	0 /* 0 signals end of array */
-};
-
-static const unsigned int joycon_button_inputs_r[] = {
-	BTN_START, BTN_MODE, BTN_THUMBR,
-	BTN_SOUTH, BTN_EAST, BTN_NORTH, BTN_WEST,
-	BTN_TR, BTN_TR2,
-	0 /* 0 signals end of array */
-};
-
-/* We report joy-con d-pad inputs as buttons and pro controller as a hat. */
-static const unsigned int joycon_dpad_inputs_jc[] = {
-	BTN_DPAD_UP, BTN_DPAD_DOWN, BTN_DPAD_LEFT, BTN_DPAD_RIGHT,
-	0 /* 0 signals end of array */
-};
-
-static int joycon_input_create(struct joycon_ctlr *ctlr)
+static void joycon_config_left_stick(struct input_dev *idev)
 {
-	struct hid_device *hdev;
-	const char *name;
-	const char *imu_name;
-	int ret;
-	int i;
-
-	hdev = ctlr->hdev;
+	input_set_abs_params(idev,
+			     ABS_X,
+			     -JC_MAX_STICK_MAG,
+			     JC_MAX_STICK_MAG,
+			     JC_STICK_FUZZ,
+			     JC_STICK_FLAT);
+	input_set_abs_params(idev,
+			     ABS_Y,
+			     -JC_MAX_STICK_MAG,
+			     JC_MAX_STICK_MAG,
+			     JC_STICK_FUZZ,
+			     JC_STICK_FLAT);
+}
 
-	switch (hdev->product) {
-	case USB_DEVICE_ID_NINTENDO_PROCON:
-		name = "Nintendo Switch Pro Controller";
-		imu_name = "Nintendo Switch Pro Controller IMU";
-		break;
-	case USB_DEVICE_ID_NINTENDO_CHRGGRIP:
-		if (jc_type_has_left(ctlr)) {
-			name = "Nintendo Switch Left Joy-Con (Grip)";
-			imu_name = "Nintendo Switch Left Joy-Con IMU (Grip)";
-		} else {
-			name = "Nintendo Switch Right Joy-Con (Grip)";
-			imu_name = "Nintendo Switch Right Joy-Con IMU (Grip)";
-		}
-		break;
-	case USB_DEVICE_ID_NINTENDO_JOYCONL:
-		name = "Nintendo Switch Left Joy-Con";
-		imu_name = "Nintendo Switch Left Joy-Con IMU";
-		break;
-	case USB_DEVICE_ID_NINTENDO_JOYCONR:
-		name = "Nintendo Switch Right Joy-Con";
-		imu_name = "Nintendo Switch Right Joy-Con IMU";
-		break;
-	default: /* Should be impossible */
-		hid_err(hdev, "Invalid hid product\n");
-		return -EINVAL;
-	}
+static void joycon_config_right_stick(struct input_dev *idev)
+{
+	input_set_abs_params(idev,
+			     ABS_RX,
+			     -JC_MAX_STICK_MAG,
+			     JC_MAX_STICK_MAG,
+			     JC_STICK_FUZZ,
+			     JC_STICK_FLAT);
+	input_set_abs_params(idev,
+			     ABS_RY,
+			     -JC_MAX_STICK_MAG,
+			     JC_MAX_STICK_MAG,
+			     JC_STICK_FUZZ,
+			     JC_STICK_FLAT);
+}
 
-	ctlr->input = devm_input_allocate_device(&hdev->dev);
-	if (!ctlr->input)
-		return -ENOMEM;
-	ctlr->input->id.bustype = hdev->bus;
-	ctlr->input->id.vendor = hdev->vendor;
-	ctlr->input->id.product = hdev->product;
-	ctlr->input->id.version = hdev->version;
-	ctlr->input->uniq = ctlr->mac_addr_str;
-	ctlr->input->name = name;
-	ctlr->input->phys = hdev->phys;
-	input_set_drvdata(ctlr->input, ctlr);
+static void joycon_config_dpad(struct input_dev *idev)
+{
+	input_set_abs_params(idev,
+			     ABS_HAT0X,
+			     -JC_MAX_DPAD_MAG,
+			     JC_MAX_DPAD_MAG,
+			     JC_DPAD_FUZZ,
+			     JC_DPAD_FLAT);
+	input_set_abs_params(idev,
+			     ABS_HAT0Y,
+			     -JC_MAX_DPAD_MAG,
+			     JC_MAX_DPAD_MAG,
+			     JC_DPAD_FUZZ,
+			     JC_DPAD_FLAT);
+}
 
-	/* set up sticks and buttons */
-	if (jc_type_has_left(ctlr)) {
-		input_set_abs_params(ctlr->input, ABS_X,
-				     -JC_MAX_STICK_MAG, JC_MAX_STICK_MAG,
-				     JC_STICK_FUZZ, JC_STICK_FLAT);
-		input_set_abs_params(ctlr->input, ABS_Y,
-				     -JC_MAX_STICK_MAG, JC_MAX_STICK_MAG,
-				     JC_STICK_FUZZ, JC_STICK_FLAT);
-
-		for (i = 0; joycon_button_inputs_l[i] > 0; i++)
-			input_set_capability(ctlr->input, EV_KEY,
-					     joycon_button_inputs_l[i]);
-
-		/* configure d-pad differently for joy-con vs pro controller */
-		if (hdev->product != USB_DEVICE_ID_NINTENDO_PROCON) {
-			for (i = 0; joycon_dpad_inputs_jc[i] > 0; i++)
-				input_set_capability(ctlr->input, EV_KEY,
-						     joycon_dpad_inputs_jc[i]);
-		} else {
-			input_set_abs_params(ctlr->input, ABS_HAT0X,
-					     -JC_MAX_DPAD_MAG, JC_MAX_DPAD_MAG,
-					     JC_DPAD_FUZZ, JC_DPAD_FLAT);
-			input_set_abs_params(ctlr->input, ABS_HAT0Y,
-					     -JC_MAX_DPAD_MAG, JC_MAX_DPAD_MAG,
-					     JC_DPAD_FUZZ, JC_DPAD_FLAT);
-		}
-	}
-	if (jc_type_has_right(ctlr)) {
-		input_set_abs_params(ctlr->input, ABS_RX,
-				     -JC_MAX_STICK_MAG, JC_MAX_STICK_MAG,
-				     JC_STICK_FUZZ, JC_STICK_FLAT);
-		input_set_abs_params(ctlr->input, ABS_RY,
-				     -JC_MAX_STICK_MAG, JC_MAX_STICK_MAG,
-				     JC_STICK_FUZZ, JC_STICK_FLAT);
-
-		for (i = 0; joycon_button_inputs_r[i] > 0; i++)
-			input_set_capability(ctlr->input, EV_KEY,
-					     joycon_button_inputs_r[i]);
-	}
+static void joycon_config_buttons(struct input_dev *idev,
+		 const struct joycon_ctlr_button_mapping button_mappings[])
+{
+	const struct joycon_ctlr_button_mapping *button;
 
-	/* Let's report joy-con S triggers separately */
-	if (hdev->product == USB_DEVICE_ID_NINTENDO_JOYCONL) {
-		input_set_capability(ctlr->input, EV_KEY, BTN_TR);
-		input_set_capability(ctlr->input, EV_KEY, BTN_TR2);
-	} else if (hdev->product == USB_DEVICE_ID_NINTENDO_JOYCONR) {
-		input_set_capability(ctlr->input, EV_KEY, BTN_TL);
-		input_set_capability(ctlr->input, EV_KEY, BTN_TL2);
-	}
+	for (button = button_mappings; button->code; button++)
+		input_set_capability(idev, EV_KEY, button->code);
+}
 
+static void joycon_config_rumble(struct joycon_ctlr *ctlr)
+{
 #if IS_ENABLED(CONFIG_NINTENDO_FF)
 	/* set up rumble */
 	input_set_capability(ctlr->input, EV_FF, FF_RUMBLE);
@@ -1813,10 +2090,15 @@ static int joycon_input_create(struct joycon_ctlr *ctlr)
 	joycon_set_rumble(ctlr, 0, 0, false);
 	ctlr->rumble_msecs = jiffies_to_msecs(jiffies);
 #endif
+}
 
-	ret = input_register_device(ctlr->input);
-	if (ret)
-		return ret;
+static int joycon_imu_input_create(struct joycon_ctlr *ctlr)
+{
+	struct hid_device *hdev;
+	const char *imu_name;
+	int ret;
+
+	hdev = ctlr->hdev;
 
 	/* configure the imu input device */
 	ctlr->imu_input = devm_input_allocate_device(&hdev->dev);
@@ -1828,8 +2110,14 @@ static int joycon_input_create(struct joycon_ctlr *ctlr)
 	ctlr->imu_input->id.product = hdev->product;
 	ctlr->imu_input->id.version = hdev->version;
 	ctlr->imu_input->uniq = ctlr->mac_addr_str;
-	ctlr->imu_input->name = imu_name;
 	ctlr->imu_input->phys = hdev->phys;
+
+	imu_name = devm_kasprintf(&hdev->dev, GFP_KERNEL, "%s (IMU)", ctlr->input->name);
+	if (!imu_name)
+		return -ENOMEM;
+
+	ctlr->imu_input->name = imu_name;
+
 	input_set_drvdata(ctlr->imu_input, ctlr);
 
 	/* configure imu axes */
@@ -1871,6 +2159,71 @@ static int joycon_input_create(struct joycon_ctlr *ctlr)
 	return 0;
 }
 
+static int joycon_input_create(struct joycon_ctlr *ctlr)
+{
+	struct hid_device *hdev;
+	int ret;
+
+	hdev = ctlr->hdev;
+
+	ctlr->input = devm_input_allocate_device(&hdev->dev);
+	if (!ctlr->input)
+		return -ENOMEM;
+	ctlr->input->id.bustype = hdev->bus;
+	ctlr->input->id.vendor = hdev->vendor;
+	ctlr->input->id.product = hdev->product;
+	ctlr->input->id.version = hdev->version;
+	ctlr->input->uniq = ctlr->mac_addr_str;
+	ctlr->input->name = hdev->name;
+	ctlr->input->phys = hdev->phys;
+	input_set_drvdata(ctlr->input, ctlr);
+
+	ret = input_register_device(ctlr->input);
+	if (ret)
+		return ret;
+
+	if (joycon_type_is_right_joycon(ctlr)) {
+		joycon_config_right_stick(ctlr->input);
+		joycon_config_buttons(ctlr->input, right_joycon_button_mappings);
+		if (!joycon_device_is_chrggrip(ctlr))
+			joycon_config_buttons(ctlr->input, right_joycon_s_button_mappings);
+	} else if (joycon_type_is_left_joycon(ctlr)) {
+		joycon_config_left_stick(ctlr->input);
+		joycon_config_buttons(ctlr->input, left_joycon_button_mappings);
+		if (!joycon_device_is_chrggrip(ctlr))
+			joycon_config_buttons(ctlr->input, left_joycon_s_button_mappings);
+	} else if (joycon_type_is_procon(ctlr)) {
+		joycon_config_left_stick(ctlr->input);
+		joycon_config_right_stick(ctlr->input);
+		joycon_config_dpad(ctlr->input);
+		joycon_config_buttons(ctlr->input, procon_button_mappings);
+	} else if (joycon_type_is_any_nescon(ctlr)) {
+		joycon_config_dpad(ctlr->input);
+		joycon_config_buttons(ctlr->input, nescon_button_mappings);
+	} else if (joycon_type_is_snescon(ctlr)) {
+		joycon_config_dpad(ctlr->input);
+		joycon_config_buttons(ctlr->input, snescon_button_mappings);
+	} else if (joycon_type_is_gencon(ctlr)) {
+		joycon_config_dpad(ctlr->input);
+		joycon_config_buttons(ctlr->input, gencon_button_mappings);
+	} else if (joycon_type_is_n64con(ctlr)) {
+		joycon_config_dpad(ctlr->input);
+		joycon_config_left_stick(ctlr->input);
+		joycon_config_buttons(ctlr->input, n64con_button_mappings);
+	}
+
+	if (joycon_has_imu(ctlr)) {
+		ret = joycon_imu_input_create(ctlr);
+		if (ret)
+			return ret;
+	}
+
+	if (joycon_has_rumble(ctlr))
+		joycon_config_rumble(ctlr);
+
+	return 0;
+}
+
 /* Because the subcommand sets all the leds at once, the brightness argument is ignored */
 static int joycon_player_led_brightness_set(struct led_classdev *led,
 					    enum led_brightness brightness)
@@ -2107,9 +2460,7 @@ static int joycon_read_info(struct joycon_ctlr *ctlr)
 	struct joycon_input_report *report;
 
 	req.subcmd_id = JC_SUBCMD_REQ_DEV_INFO;
-	mutex_lock(&ctlr->output_mutex);
 	ret = joycon_send_subcmd(ctlr, &req, 0, HZ);
-	mutex_unlock(&ctlr->output_mutex);
 	if (ret) {
 		hid_err(ctlr->hdev, "Failed to get joycon info; ret=%d\n", ret);
 		return ret;
@@ -2132,8 +2483,17 @@ static int joycon_read_info(struct joycon_ctlr *ctlr)
 		return -ENOMEM;
 	hid_info(ctlr->hdev, "controller MAC = %s\n", ctlr->mac_addr_str);
 
-	/* Retrieve the type so we can distinguish for charging grip */
+	/*
+	 * Retrieve the type so we can distinguish the controller type
+	 * Unfortantly the hdev->product can't always be used due to a ?bug?
+	 * with the NSO Genesis controller. Over USB, it will report the
+	 * PID as 0x201E, but over bluetooth it will report the PID as 0x2017
+	 * which is the same as the NSO SNES controller. This is different from
+	 * the rest of the controllers which will report the same PID over USB
+	 * and bluetooth.
+	 */
 	ctlr->ctlr_type = report->subcmd_reply.data[2];
+	hid_dbg(ctlr->hdev, "controller type = 0x%02X\n", ctlr->ctlr_type);
 
 	return 0;
 }
@@ -2145,8 +2505,7 @@ static int joycon_init(struct hid_device *hdev)
 
 	mutex_lock(&ctlr->output_mutex);
 	/* if handshake command fails, assume ble pro controller */
-	if ((jc_type_is_procon(ctlr) || jc_type_is_chrggrip(ctlr)) &&
-	    !joycon_send_usb(ctlr, JC_USB_CMD_HANDSHAKE, HZ)) {
+	if (joycon_using_usb(ctlr) && !joycon_send_usb(ctlr, JC_USB_CMD_HANDSHAKE, HZ)) {
 		hid_dbg(hdev, "detected USB controller\n");
 		/* set baudrate for improved latency */
 		ret = joycon_send_usb(ctlr, JC_USB_CMD_BAUDRATE_3M, HZ);
@@ -2171,24 +2530,43 @@ static int joycon_init(struct hid_device *hdev)
 		goto out_unlock;
 	}
 
-	/* get controller calibration data, and parse it */
-	ret = joycon_request_calibration(ctlr);
+	/* needed to retrieve the controller type */
+	ret = joycon_read_info(ctlr);
 	if (ret) {
-		/*
-		 * We can function with default calibration, but it may be
-		 * inaccurate. Provide a warning, and continue on.
-		 */
-		hid_warn(hdev, "Analog stick positions may be inaccurate\n");
+		hid_err(hdev, "Failed to retrieve controller info; ret=%d\n",
+			ret);
+		goto out_unlock;
 	}
 
-	/* get IMU calibration data, and parse it */
-	ret = joycon_request_imu_calibration(ctlr);
-	if (ret) {
-		/*
-		 * We can function with default calibration, but it may be
-		 * inaccurate. Provide a warning, and continue on.
-		 */
-		hid_warn(hdev, "Unable to read IMU calibration data\n");
+	if (joycon_has_joysticks(ctlr)) {
+		/* get controller calibration data, and parse it */
+		ret = joycon_request_calibration(ctlr);
+		if (ret) {
+			/*
+			 * We can function with default calibration, but it may be
+			 * inaccurate. Provide a warning, and continue on.
+			 */
+			hid_warn(hdev, "Analog stick positions may be inaccurate\n");
+		}
+	}
+
+	if (joycon_has_imu(ctlr)) {
+		/* get IMU calibration data, and parse it */
+		ret = joycon_request_imu_calibration(ctlr);
+		if (ret) {
+			/*
+			 * We can function with default calibration, but it may be
+			 * inaccurate. Provide a warning, and continue on.
+			 */
+			hid_warn(hdev, "Unable to read IMU calibration data\n");
+		}
+
+		/* Enable the IMU */
+		ret = joycon_enable_imu(ctlr);
+		if (ret) {
+			hid_err(hdev, "Failed to enable the IMU; ret=%d\n", ret);
+			goto out_unlock;
+		}
 	}
 
 	/* Set the reporting mode to 0x30, which is the full report mode */
@@ -2198,18 +2576,13 @@ static int joycon_init(struct hid_device *hdev)
 		goto out_unlock;
 	}
 
-	/* Enable rumble */
-	ret = joycon_enable_rumble(ctlr);
-	if (ret) {
-		hid_err(hdev, "Failed to enable rumble; ret=%d\n", ret);
-		goto out_unlock;
-	}
-
-	/* Enable the IMU */
-	ret = joycon_enable_imu(ctlr);
-	if (ret) {
-		hid_err(hdev, "Failed to enable the IMU; ret=%d\n", ret);
-		goto out_unlock;
+	if (joycon_has_rumble(ctlr)) {
+		/* Enable rumble */
+		ret = joycon_enable_rumble(ctlr);
+		if (ret) {
+			hid_err(hdev, "Failed to enable rumble; ret=%d\n", ret);
+			goto out_unlock;
+		}
 	}
 
 out_unlock:
@@ -2354,13 +2727,6 @@ static int nintendo_hid_probe(struct hid_device *hdev,
 		goto err_close;
 	}
 
-	ret = joycon_read_info(ctlr);
-	if (ret) {
-		hid_err(hdev, "Failed to retrieve controller info; ret=%d\n",
-			ret);
-		goto err_close;
-	}
-
 	/* Initialize the leds */
 	ret = joycon_leds_create(ctlr);
 	if (ret) {
@@ -2432,6 +2798,12 @@ static int nintendo_hid_resume(struct hid_device *hdev)
 static const struct hid_device_id nintendo_hid_devices[] = {
 	{ HID_USB_DEVICE(USB_VENDOR_ID_NINTENDO,
 			 USB_DEVICE_ID_NINTENDO_PROCON) },
+	{ HID_USB_DEVICE(USB_VENDOR_ID_NINTENDO,
+			 USB_DEVICE_ID_NINTENDO_SNESCON) },
+	{ HID_USB_DEVICE(USB_VENDOR_ID_NINTENDO,
+			 USB_DEVICE_ID_NINTENDO_GENCON) },
+	{ HID_USB_DEVICE(USB_VENDOR_ID_NINTENDO,
+			 USB_DEVICE_ID_NINTENDO_N64CON) },
 	{ HID_BLUETOOTH_DEVICE(USB_VENDOR_ID_NINTENDO,
 			 USB_DEVICE_ID_NINTENDO_PROCON) },
 	{ HID_USB_DEVICE(USB_VENDOR_ID_NINTENDO,
@@ -2440,6 +2812,12 @@ static const struct hid_device_id nintendo_hid_devices[] = {
 			 USB_DEVICE_ID_NINTENDO_JOYCONL) },
 	{ HID_BLUETOOTH_DEVICE(USB_VENDOR_ID_NINTENDO,
 			 USB_DEVICE_ID_NINTENDO_JOYCONR) },
+	{ HID_BLUETOOTH_DEVICE(USB_VENDOR_ID_NINTENDO,
+			 USB_DEVICE_ID_NINTENDO_SNESCON) },
+	{ HID_BLUETOOTH_DEVICE(USB_VENDOR_ID_NINTENDO,
+			 USB_DEVICE_ID_NINTENDO_GENCON) },
+	{ HID_BLUETOOTH_DEVICE(USB_VENDOR_ID_NINTENDO,
+			 USB_DEVICE_ID_NINTENDO_N64CON) },
 	{ }
 };
 MODULE_DEVICE_TABLE(hid, nintendo_hid_devices);
@@ -2458,6 +2836,7 @@ static struct hid_driver nintendo_hid_driver = {
 module_hid_driver(nintendo_hid_driver);
 
 MODULE_LICENSE("GPL");
+MODULE_AUTHOR("Ryan McClelland <rymcclel@gmail.com>");
+MODULE_AUTHOR("Emily Strickland <linux@emily.st>");
 MODULE_AUTHOR("Daniel J. Ogorchock <djogorchock@gmail.com>");
 MODULE_DESCRIPTION("Driver for Nintendo Switch Controllers");
-
-- 
2.34.1


