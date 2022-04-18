Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 132FA5050F2
	for <lists+linux-input@lfdr.de>; Mon, 18 Apr 2022 14:27:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238912AbiDRMaQ (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 18 Apr 2022 08:30:16 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38414 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238908AbiDRM1b (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Mon, 18 Apr 2022 08:27:31 -0400
Received: from mail-wm1-x32d.google.com (mail-wm1-x32d.google.com [IPv6:2a00:1450:4864:20::32d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 49C721D0C7
        for <linux-input@vger.kernel.org>; Mon, 18 Apr 2022 05:20:55 -0700 (PDT)
Received: by mail-wm1-x32d.google.com with SMTP id v64-20020a1cac43000000b0038cfd1b3a6dso11646373wme.5
        for <linux-input@vger.kernel.org>; Mon, 18 Apr 2022 05:20:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=Je1Pol+4VruhFANA+eE6M8/pOl8TvSJDT9IpA23rzec=;
        b=hDiUYJo5LiOXXCIzujjWW17zkGoHBVV2Fg6jliDpjGB8bQ54yhK/GWMW4UQw+C+3It
         8JA1aj4dahMKrLr6QVkYvgfwA3RbmAeUJXNGUc45cHnNUhAGUeR2GpE5YB/bwYqw9HjM
         zu4B3pnsdLDIZ/GENTxq24rw19kZz1rjbzBPeyhk+yg3HrXMyPmkrmegbkl1PM1SZY+I
         +KEB+9A1dZbB7iHQkWpxes4n9SHqMjJbmwV+f/3AIrKfzC1G+zF9Bq8e20CUX3lS4v9j
         UF4zZPNMU8B0LRdO9zKiaestS7Xy6af9kLfaDrmh/etuaLKMW24SZkj9djrsJ5u3X4eG
         5fFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=Je1Pol+4VruhFANA+eE6M8/pOl8TvSJDT9IpA23rzec=;
        b=NIglUaTQ5Rd4E8mxZFTWRSp/B44Q8A2pSxDXhSMQtDtnknElhzLU7cwiid4lVcOiyA
         bphMefGmY6oBz5M2z2rjyOzEIpiKD9yVC+LenRVa/8G10rPssQzGNUjeRoZl/GmsjXqe
         mvJOGNb8fHfhinsjMVfBm7Tx4jCwXAq9PXVqviJLv5OHh7vTTr/kQCLz1tS2mrHKgSom
         CkcDW7XfXmFre3Bu50I45KVhbRbz2d1Gc18GB1RrNdiXd8WyjCPyBJBLhgufSO4gKRzR
         rLK1M6DvbUJBHlXx39w6x/FLEOCY3MSJ+hoOTPYOYpT1bslSjyvf2WRevJHOx03pJ3Vx
         syTg==
X-Gm-Message-State: AOAM532DigHcoGUa6nlXmz3kvdQGNRB2myqM5BQCsVEup/tOvsu9rqPX
        X/vMIJXcbCAECMRYUILECZC4SzzuOamXWg==
X-Google-Smtp-Source: ABdhPJzWe5ptKhI3OWmIIFizszHhuVtiJ2AP+F6kRIK1GuDnH82a3fWsKM37U5XHqU831WtNpxrhSA==
X-Received: by 2002:a05:600c:3789:b0:38c:bd93:77d6 with SMTP id o9-20020a05600c378900b0038cbd9377d6mr11105044wmr.12.1650284453455;
        Mon, 18 Apr 2022 05:20:53 -0700 (PDT)
Received: from deepwhite.fritz.box ([2001:9e8:2205:7500:31a3:8b23:14e3:7ccf])
        by smtp.gmail.com with ESMTPSA id k20-20020a05600c1c9400b0038ecd1ccc17sm17318963wms.35.2022.04.18.05.20.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 Apr 2022 05:20:53 -0700 (PDT)
From:   Pavel Rojtberg <rojtberg@gmail.com>
X-Google-Original-From: Pavel Rojtberg < rojtberg@gmail.com >
To:     linux-input@vger.kernel.org, dmitry.torokhov@gmail.com,
        gregkh@linuxfoundation.org
Cc:     Christopher Crockett <chaorace@gmail.com>,
        Pavel Rojtberg <rojtberg@gmail.com>
Subject: [PATCH v2] Input: xpad - add support for XBOX One Elite paddles
Date:   Mon, 18 Apr 2022 14:20:37 +0200
Message-Id: <20220418122037.27107-1-rojtberg@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

From: Christopher Crockett <chaorace@gmail.com>

An effort has been made to support every official model and firmware
version I could track down info on. The following controllers _should_
have working paddles with this PR:
- Xbox Elite (**untested**)
- Xbox Elite Series 2 on early firmwares (**untested**)
- Xbox Elite Series 2 on v4 firmwares (Tested v4.8.1908.0)
- Xbox Elite Series 2 on v5 pre-BLE firmwares (**untested**)
- Xbox Elite Series 2 on v5 post-BLE firmwares (Tested v5.13.3143.0)

This patch also introduces correct handling for the Elite 1 controller
and properly suppresses paddle inputs when using a custom profile slot.

Starting with firmware v5.11, certain inputs for the Elite 2 were moved
to an extra packet that is not enabled by default.

We must first manually enable this extra packet in order to correctly
process paddle input data with these later firmwares.

Signed-off-by: Christopher Crockett <chaorace@gmail.com>
Signed-off-by: Pavel Rojtberg <rojtberg@gmail.com>
---

compared to v1, this applies the style changes requested by greg k-h.
Also, this drops "Fmstrat" from the authors, as none of his initial code
is still contained in the patch and he chose to remain anonymous in the first place.

 drivers/input/joystick/xpad.c | 254 +++++++++++++++++++++++++++++++++++++++++++--------------
 1 file changed, 193 insertions(+), 61 deletions(-)

diff --git a/drivers/input/joystick/xpad.c b/drivers/input/joystick/xpad.c
index 53126d9..6618148 100644
--- a/drivers/input/joystick/xpad.c
+++ b/drivers/input/joystick/xpad.c
@@ -80,6 +80,7 @@
 #define MAP_TRIGGERS_TO_BUTTONS		(1 << 1)
 #define MAP_STICKS_TO_NULL		(1 << 2)
 #define MAP_SELECT_BUTTON		(1 << 3)
+#define MAP_PADDLES				(1 << 4)
 #define DANCEPAD_MAP_CONFIG	(MAP_DPAD_TO_BUTTONS |			\
 				MAP_TRIGGERS_TO_BUTTONS | MAP_STICKS_TO_NULL)
 
@@ -89,6 +90,12 @@
 #define XTYPE_XBOXONE     3
 #define XTYPE_UNKNOWN     4
 
+#define PKT_XB              0
+#define PKT_XBE1            1
+#define PKT_XBE2_FW_OLD     2
+#define PKT_XBE2_FW_5_EARLY 3
+#define PKT_XBE2_FW_5_11    4
+
 static bool dpad_to_buttons;
 module_param(dpad_to_buttons, bool, S_IRUGO);
 MODULE_PARM_DESC(dpad_to_buttons, "Map D-PAD to buttons rather than axes for unknown pads");
@@ -111,6 +118,7 @@ static const struct xpad_device {
 	char *name;
 	u8 mapping;
 	u8 xtype;
+	u8 packet_type;
 } xpad_device[] = {
 	{ 0x0079, 0x18d4, "GPD Win 2 X-Box Controller", 0, XTYPE_XBOX360 },
 	{ 0x044f, 0x0f00, "Thrustmaster Wheel", 0, XTYPE_XBOX },
@@ -128,7 +136,8 @@ static const struct xpad_device {
 	{ 0x045e, 0x0291, "Xbox 360 Wireless Receiver (XBOX)", MAP_DPAD_TO_BUTTONS, XTYPE_XBOX360W },
 	{ 0x045e, 0x02d1, "Microsoft X-Box One pad", 0, XTYPE_XBOXONE },
 	{ 0x045e, 0x02dd, "Microsoft X-Box One pad (Firmware 2015)", 0, XTYPE_XBOXONE },
-	{ 0x045e, 0x02e3, "Microsoft X-Box One Elite pad", 0, XTYPE_XBOXONE },
+	{ 0x045e, 0x02e3, "Microsoft X-Box One Elite pad", MAP_PADDLES, XTYPE_XBOXONE },
+	{ 0x045e, 0x0b00, "Microsoft X-Box One Elite 2 pad", MAP_PADDLES, XTYPE_XBOXONE },
 	{ 0x045e, 0x02ea, "Microsoft X-Box One S pad", 0, XTYPE_XBOXONE },
 	{ 0x045e, 0x0719, "Xbox 360 Wireless Receiver", MAP_DPAD_TO_BUTTONS, XTYPE_XBOX360W },
 	{ 0x045e, 0x0b12, "Microsoft Xbox Series S|X Controller", MAP_SELECT_BUTTON, XTYPE_XBOXONE },
@@ -390,6 +399,13 @@ static const signed short xpad_abs_triggers[] = {
 	-1
 };
 
+/* used when the controller has extra paddle buttons */
+static const signed short xpad_btn_paddles[] = {
+	BTN_TRIGGER_HAPPY5, BTN_TRIGGER_HAPPY6, /* paddle upper right, lower right */
+	BTN_TRIGGER_HAPPY7, BTN_TRIGGER_HAPPY8, /* paddle upper left, lower left */
+	-1						/* terminating entry */
+};
+
 /*
  * Xbox 360 has a vendor-specific class, so we cannot match it with only
  * USB_INTERFACE_INFO (also specifically refused by USB subsystem), so we
@@ -492,6 +508,15 @@ static const u8 xboxone_s_init[] = {
 	0x05, 0x20, 0x00, 0x0f, 0x06
 };
 
+/*
+ * This packet is required to get additional input data
+ * from Xbox One Elite Series 2 (0x045e:0x0b00) pads.
+ * We mostly do this right now to get paddle data
+ */
+static const u8 extra_input_packet_init[] = {
+	0x4d, 0x10, 0x01, 0x02, 0x07, 0x00
+};
+
 /*
  * This packet is required for the Titanfall 2 Xbox One pads
  * (0x0e6f:0x0165) to finish initialization and for Hori pads
@@ -552,6 +577,7 @@ static const struct xboxone_init_packet xboxone_init_packets[] = {
 	XBOXONE_INIT_PKT(0x0000, 0x0000, xboxone_fw2015_init),
 	XBOXONE_INIT_PKT(0x045e, 0x02ea, xboxone_s_init),
 	XBOXONE_INIT_PKT(0x045e, 0x0b00, xboxone_s_init),
+	XBOXONE_INIT_PKT(0x045e, 0x0b00, extra_input_packet_init),
 	XBOXONE_INIT_PKT(0x0e6f, 0x0000, xboxone_pdp_init1),
 	XBOXONE_INIT_PKT(0x0e6f, 0x0000, xboxone_pdp_init2),
 	XBOXONE_INIT_PKT(0x24c6, 0x541a, xboxone_rumblebegin_init),
@@ -608,6 +634,7 @@ struct usb_xpad {
 
 	int mapping;			/* map d-pad to buttons or to axes */
 	int xtype;			/* type of xbox device */
+	int packet_type;          /* type of the extended packet */
 	int pad_nr;			/* the order x360 pads were attached */
 	const char *name;		/* name of the device */
 	struct work_struct work;	/* init/remove device from callback */
@@ -846,6 +873,7 @@ static void xpad360w_process_packet(struct usb_xpad *xpad, u16 cmd, unsigned cha
 static void xpadone_process_packet(struct usb_xpad *xpad, u16 cmd, unsigned char *data)
 {
 	struct input_dev *dev = xpad->dev;
+	bool do_sync = false;
 
 	/* the xbox button has its own special report */
 	if (data[0] == 0X07) {
@@ -858,75 +886,140 @@ static void xpadone_process_packet(struct usb_xpad *xpad, u16 cmd, unsigned char
 			xpadone_ack_mode_report(xpad, data[2]);
 
 		input_report_key(dev, BTN_MODE, data[4] & 0x01);
-		input_sync(dev);
-		return;
-	}
-	/* check invalid packet */
-	else if (data[0] != 0X20)
-		return;
-
-	/* menu/view buttons */
-	input_report_key(dev, BTN_START,  data[4] & 0x04);
-	input_report_key(dev, BTN_SELECT, data[4] & 0x08);
-	if (xpad->mapping & MAP_SELECT_BUTTON)
-		input_report_key(dev, KEY_RECORD, data[22] & 0x01);
 
-	/* buttons A,B,X,Y */
-	input_report_key(dev, BTN_A,	data[4] & 0x10);
-	input_report_key(dev, BTN_B,	data[4] & 0x20);
-	input_report_key(dev, BTN_X,	data[4] & 0x40);
-	input_report_key(dev, BTN_Y,	data[4] & 0x80);
+		do_sync = true;
+	} else if (data[0] == 0X0C) {
+		/* Some packet formats force us to use this separate to poll paddle inputs */
+		if (xpad->packet_type == PKT_XBE2_FW_5_11) {
+			/* Mute paddles if controller is in a custom profile slot
+			 * Checked by looking at the active profile slot to
+			 * verify it's the default slot
+			 */
+			if (data[19] != 0)
+				data[18] = 0;
 
-	/* digital pad */
-	if (xpad->mapping & MAP_DPAD_TO_BUTTONS) {
-		/* dpad as buttons (left, right, up, down) */
-		input_report_key(dev, BTN_TRIGGER_HAPPY1, data[5] & 0x04);
-		input_report_key(dev, BTN_TRIGGER_HAPPY2, data[5] & 0x08);
-		input_report_key(dev, BTN_TRIGGER_HAPPY3, data[5] & 0x01);
-		input_report_key(dev, BTN_TRIGGER_HAPPY4, data[5] & 0x02);
-	} else {
-		input_report_abs(dev, ABS_HAT0X,
-				 !!(data[5] & 0x08) - !!(data[5] & 0x04));
-		input_report_abs(dev, ABS_HAT0Y,
-				 !!(data[5] & 0x02) - !!(data[5] & 0x01));
-	}
+			/* Elite Series 2 split packet paddle bits */
+			input_report_key(dev, BTN_TRIGGER_HAPPY5, data[18] & 0x01);
+			input_report_key(dev, BTN_TRIGGER_HAPPY6, data[18] & 0x02);
+			input_report_key(dev, BTN_TRIGGER_HAPPY7, data[18] & 0x04);
+			input_report_key(dev, BTN_TRIGGER_HAPPY8, data[18] & 0x08);
 
-	/* TL/TR */
-	input_report_key(dev, BTN_TL,	data[5] & 0x10);
-	input_report_key(dev, BTN_TR,	data[5] & 0x20);
+			do_sync = true;
+		}
+	} else if (data[0] == 0X20) { /* The main valid packet type for inputs */
+		/* menu/view buttons */
+		input_report_key(dev, BTN_START,  data[4] & 0x04);
+		input_report_key(dev, BTN_SELECT, data[4] & 0x08);
+		if (xpad->mapping & MAP_SELECT_BUTTON)
+			input_report_key(dev, KEY_RECORD, data[22] & 0x01);
+
+		/* buttons A,B,X,Y */
+		input_report_key(dev, BTN_A,	data[4] & 0x10);
+		input_report_key(dev, BTN_B,	data[4] & 0x20);
+		input_report_key(dev, BTN_X,	data[4] & 0x40);
+		input_report_key(dev, BTN_Y,	data[4] & 0x80);
+
+		/* digital pad */
+		if (xpad->mapping & MAP_DPAD_TO_BUTTONS) {
+			/* dpad as buttons (left, right, up, down) */
+			input_report_key(dev, BTN_TRIGGER_HAPPY1, data[5] & 0x04);
+			input_report_key(dev, BTN_TRIGGER_HAPPY2, data[5] & 0x08);
+			input_report_key(dev, BTN_TRIGGER_HAPPY3, data[5] & 0x01);
+			input_report_key(dev, BTN_TRIGGER_HAPPY4, data[5] & 0x02);
+		} else {
+			input_report_abs(dev, ABS_HAT0X,
+					!!(data[5] & 0x08) - !!(data[5] & 0x04));
+			input_report_abs(dev, ABS_HAT0Y,
+					!!(data[5] & 0x02) - !!(data[5] & 0x01));
+		}
 
-	/* stick press left/right */
-	input_report_key(dev, BTN_THUMBL, data[5] & 0x40);
-	input_report_key(dev, BTN_THUMBR, data[5] & 0x80);
+		/* TL/TR */
+		input_report_key(dev, BTN_TL,	data[5] & 0x10);
+		input_report_key(dev, BTN_TR,	data[5] & 0x20);
+
+		/* stick press left/right */
+		input_report_key(dev, BTN_THUMBL, data[5] & 0x40);
+		input_report_key(dev, BTN_THUMBR, data[5] & 0x80);
+
+		if (!(xpad->mapping & MAP_STICKS_TO_NULL)) {
+			/* left stick */
+			input_report_abs(dev, ABS_X,
+					(__s16) le16_to_cpup((__le16 *)(data + 10)));
+			input_report_abs(dev, ABS_Y,
+					~(__s16) le16_to_cpup((__le16 *)(data + 12)));
+
+			/* right stick */
+			input_report_abs(dev, ABS_RX,
+					(__s16) le16_to_cpup((__le16 *)(data + 14)));
+			input_report_abs(dev, ABS_RY,
+					~(__s16) le16_to_cpup((__le16 *)(data + 16)));
+		}
 
-	if (!(xpad->mapping & MAP_STICKS_TO_NULL)) {
-		/* left stick */
-		input_report_abs(dev, ABS_X,
-				 (__s16) le16_to_cpup((__le16 *)(data + 10)));
-		input_report_abs(dev, ABS_Y,
-				 ~(__s16) le16_to_cpup((__le16 *)(data + 12)));
+		/* triggers left/right */
+		if (xpad->mapping & MAP_TRIGGERS_TO_BUTTONS) {
+			input_report_key(dev, BTN_TL2,
+					(__u16) le16_to_cpup((__le16 *)(data + 6)));
+			input_report_key(dev, BTN_TR2,
+					(__u16) le16_to_cpup((__le16 *)(data + 8)));
+		} else {
+			input_report_abs(dev, ABS_Z,
+					(__u16) le16_to_cpup((__le16 *)(data + 6)));
+			input_report_abs(dev, ABS_RZ,
+					(__u16) le16_to_cpup((__le16 *)(data + 8)));
+		}
 
-		/* right stick */
-		input_report_abs(dev, ABS_RX,
-				 (__s16) le16_to_cpup((__le16 *)(data + 14)));
-		input_report_abs(dev, ABS_RY,
-				 ~(__s16) le16_to_cpup((__le16 *)(data + 16)));
-	}
+		/* paddle handling */
+		/* based on SDL's SDL_hidapi_xboxone.c */
+		if (xpad->mapping & MAP_PADDLES) {
+			if (xpad->packet_type == PKT_XBE1) {
+				/* Mute paddles if controller has a custom mapping applied.
+				 * Checked by comparing the current mapping
+				 * config against the factory mapping config
+				 */
+				if (memcmp(&data[4], &data[18], 2) != 0)
+					data[32] = 0;
+
+				/* OG Elite Series Controller paddle bits */
+				input_report_key(dev, BTN_TRIGGER_HAPPY5, data[32] & 0x02);
+				input_report_key(dev, BTN_TRIGGER_HAPPY6, data[32] & 0x08);
+				input_report_key(dev, BTN_TRIGGER_HAPPY7, data[32] & 0x01);
+				input_report_key(dev, BTN_TRIGGER_HAPPY8, data[32] & 0x04);
+			} else if (xpad->packet_type == PKT_XBE2_FW_OLD) {
+				/* Mute paddles if controller has a custom mapping applied.
+				 * Checked by comparing the current mapping
+				 * config against the factory mapping config
+				 */
+				if (data[19] != 0)
+					data[18] = 0;
+
+				/* Elite Series 2 4.x firmware paddle bits */
+				input_report_key(dev, BTN_TRIGGER_HAPPY5, data[18] & 0x01);
+				input_report_key(dev, BTN_TRIGGER_HAPPY6, data[18] & 0x02);
+				input_report_key(dev, BTN_TRIGGER_HAPPY7, data[18] & 0x04);
+				input_report_key(dev, BTN_TRIGGER_HAPPY8, data[18] & 0x08);
+			} else if (xpad->packet_type == PKT_XBE2_FW_5_EARLY) {
+				/* Mute paddles if controller has a custom mapping applied.
+				 * Checked by comparing the current mapping
+				 * config against the factory mapping config
+				 */
+				if (data[23] != 0)
+					data[22] = 0;
+
+				/* Elite Series 2 5.x firmware paddle bits
+				 * (before the packet was split)
+				 */
+				input_report_key(dev, BTN_TRIGGER_HAPPY5, data[22] & 0x01);
+				input_report_key(dev, BTN_TRIGGER_HAPPY6, data[22] & 0x02);
+				input_report_key(dev, BTN_TRIGGER_HAPPY7, data[22] & 0x04);
+				input_report_key(dev, BTN_TRIGGER_HAPPY8, data[22] & 0x08);
+			}
+		}
 
-	/* triggers left/right */
-	if (xpad->mapping & MAP_TRIGGERS_TO_BUTTONS) {
-		input_report_key(dev, BTN_TL2,
-				 (__u16) le16_to_cpup((__le16 *)(data + 6)));
-		input_report_key(dev, BTN_TR2,
-				 (__u16) le16_to_cpup((__le16 *)(data + 8)));
-	} else {
-		input_report_abs(dev, ABS_Z,
-				 (__u16) le16_to_cpup((__le16 *)(data + 6)));
-		input_report_abs(dev, ABS_RZ,
-				 (__u16) le16_to_cpup((__le16 *)(data + 8)));
+		do_sync = true;
 	}
 
-	input_sync(dev);
+	if (do_sync)
+		input_sync(dev);
 }
 
 static void xpad_irq_in(struct urb *urb)
@@ -1693,6 +1786,12 @@ static int xpad_init_input(struct usb_xpad *xpad)
 					     xpad_btn_pad[i]);
 	}
 
+	/* set up paddles if the controller has them */
+	if (xpad->mapping & MAP_PADDLES) {
+		for (i = 0; xpad_btn_paddles[i] >= 0; i++)
+			input_set_capability(input_dev, EV_KEY, xpad_btn_paddles[i]);
+	}
+
 	/*
 	 * This should be a simple else block. However historically
 	 * xbox360w has mapped DPAD to buttons while xbox360 did not. This
@@ -1779,6 +1878,7 @@ static int xpad_probe(struct usb_interface *intf, const struct usb_device_id *id
 	xpad->mapping = xpad_device[i].mapping;
 	xpad->xtype = xpad_device[i].xtype;
 	xpad->name = xpad_device[i].name;
+	xpad->packet_type = PKT_XB;
 	INIT_WORK(&xpad->work, xpad_presence_work);
 
 	if (xpad->xtype == XTYPE_UNKNOWN) {
@@ -1844,6 +1944,38 @@ static int xpad_probe(struct usb_interface *intf, const struct usb_device_id *id
 
 	usb_set_intfdata(intf, xpad);
 
+	/* Packet type detection */
+	if (le16_to_cpu(udev->descriptor.idVendor) == 0x045e) { /* Microsoft controllers */
+		if (le16_to_cpu(udev->descriptor.idProduct) == 0x02e3) {
+			/* The original elite controller always uses the oldest
+			 * type of extended packet
+			 */
+			xpad->packet_type = PKT_XBE1;
+		} else if (le16_to_cpu(udev->descriptor.idProduct) == 0x0b00) {
+			/* The elite 2 controller has seen multiple packet
+			 * revisions. These are tied to specific firmware
+			 * versions
+			 */
+			if (le16_to_cpu(udev->descriptor.bcdDevice) < 0x0500) {
+				/* This is the format that the Elite 2 used
+				 * prior to the BLE update
+				 */
+				xpad->packet_type = PKT_XBE2_FW_OLD;
+			} else if (le16_to_cpu(udev->descriptor.bcdDevice) <
+				   0x050b) {
+				/* This is the format that the Elite 2 used
+				 * prior to the update that split the packet
+				 */
+				xpad->packet_type = PKT_XBE2_FW_5_EARLY;
+			} else {
+				/* The split packet format that was introduced
+				 * in firmware v5.11
+				 */
+				xpad->packet_type = PKT_XBE2_FW_5_11;
+			}
+		}
+	}
+
 	if (xpad->xtype == XTYPE_XBOX360W) {
 		/*
 		 * Submit the int URB immediately rather than waiting for open
-- 
2.25.1

