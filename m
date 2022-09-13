Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6784D5B7CBC
	for <lists+linux-input@lfdr.de>; Tue, 13 Sep 2022 23:32:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229573AbiIMVck (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 13 Sep 2022 17:32:40 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56118 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229601AbiIMVck (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Tue, 13 Sep 2022 17:32:40 -0400
Received: from mail-ej1-x633.google.com (mail-ej1-x633.google.com [IPv6:2a00:1450:4864:20::633])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C031561113
        for <linux-input@vger.kernel.org>; Tue, 13 Sep 2022 14:32:38 -0700 (PDT)
Received: by mail-ej1-x633.google.com with SMTP id l14so30453070eja.7
        for <linux-input@vger.kernel.org>; Tue, 13 Sep 2022 14:32:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
        bh=4/Y2483smiW9+osP+p9/HksqUIOgYceNtoqvW0gFiFw=;
        b=olyTs7NerXZRrCDIZ92lnMgV3tlxK5cPqBS402kR3bWbIO8Ig44RVvR0U6HbfHpzrQ
         kNbwXyVjG+v/224fhjuwfposN20J0sqU434d+4foUVvoEwHq0p9ZKJ7DQBFp+3eTmEec
         gAiOS31jwsm6B9wfsBrZdrfMK78HRdzZPJa90LGPwf8dZ2NBJ4xHT1V9rhCfJeLLzouc
         7pdu61Kzza7KRRsnmY7fb7bI1sk1QagSux/Y01l9cx+fxi3Gbipd3LH23TLCtW+d3OcT
         zAKcbFjc7VjyUxTWCafX9z8TbWLkwnoLd3hCIJ+nndpmmLSem3qavVneBhgfR0F7SJR9
         FQYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date;
        bh=4/Y2483smiW9+osP+p9/HksqUIOgYceNtoqvW0gFiFw=;
        b=jXOjy5YZs4Q670eAkV29WP4jv2y+LpDJJUByreBk0kvUZyBprUwoQt+UHX9J+ASLlE
         Uc/VUpvUIHMMxADl0pvPHPQ4yp1D4Ydlrw/fdyCcpVqQTNDGmmIuzaKzVIj/u+fIIzKE
         5aPgqwN8g2FTYkZP9HTPVBPRDiR9k76p522Y4Tjohrs1dg9fssGpZ3T0tqlMXWUvwS0o
         TjnuE1DLVESBpkxkEdtDgTp86KoWhXr0V2Zv66mCsjVTUZJiFXYzpLko2KUpNmpYb93X
         mrTIn4EHDEJSnVpg++OLDQ8ul77mBMjWA89JGHawtUgMLEqRNfmM6lBNo5cyoxsCIpjT
         AsKg==
X-Gm-Message-State: ACgBeo3C9jhzoBhvd42eeIGPqrqPCc6AYh4sEu75B+JfLKeazR72sLtn
        Cbf7WR2AyN1pOXPk2qbq4fW6TK5/4AaRmg==
X-Google-Smtp-Source: AA6agR5Fn+XtFfsMSlIqqeNXJrK1RWz9FXO25wW9CuVMb0tC8WQ9UrfnGjdeHO0Ba2/dHHJETzciWg==
X-Received: by 2002:a17:907:7638:b0:76f:cad4:f176 with SMTP id jy24-20020a170907763800b0076fcad4f176mr23908161ejc.647.1663104757073;
        Tue, 13 Sep 2022 14:32:37 -0700 (PDT)
Received: from deepwhite.fritz.box ([2001:9e8:2218:7900:8fcc:6ea7:4870:fd6b])
        by smtp.gmail.com with ESMTPSA id p26-20020a17090635da00b0073d5e1edd1csm6592819ejb.225.2022.09.13.14.32.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Sep 2022 14:32:36 -0700 (PDT)
From:   Pavel Rojtberg <rojtberg@gmail.com>
X-Google-Original-From: Pavel Rojtberg < rojtberg@gmail.com >
To:     linux-input@vger.kernel.org, dmitry.torokhov@gmail.com,
        gregkh@linuxfoundation.org
Cc:     Pavel Rojtberg <rojtberg@gmail.com>
Subject: [PATCH 1/2] Input: xpad - refactor using BIT() macro
Date:   Tue, 13 Sep 2022 23:31:32 +0200
Message-Id: <20220913213133.584979-2-rojtberg@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220913213133.584979-1-rojtberg@gmail.com>
References: <20220913213133.584979-1-rojtberg@gmail.com>
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

From: Pavel Rojtberg <rojtberg@gmail.com>

reduces the amount of magic numbers and makes the code more readable

Signed-off-by: Pavel Rojtberg <rojtberg@gmail.com>
---
 drivers/input/joystick/xpad.c | 112 ++++++++++++++++++++++++++++-----------------------------
 1 file changed, 56 insertions(+), 56 deletions(-)

diff --git a/drivers/input/joystick/xpad.c b/drivers/input/joystick/xpad.c
index 4d0e581..19e3958 100644
--- a/drivers/input/joystick/xpad.c
+++ b/drivers/input/joystick/xpad.c
@@ -709,10 +709,10 @@ static void xpad_process_packet(struct usb_xpad *xpad, u16 cmd, unsigned char *d
 	/* digital pad */
 	if (xpad->mapping & MAP_DPAD_TO_BUTTONS) {
 		/* dpad as buttons (left, right, up, down) */
-		input_report_key(dev, BTN_TRIGGER_HAPPY1, data[2] & 0x04);
-		input_report_key(dev, BTN_TRIGGER_HAPPY2, data[2] & 0x08);
-		input_report_key(dev, BTN_TRIGGER_HAPPY3, data[2] & 0x01);
-		input_report_key(dev, BTN_TRIGGER_HAPPY4, data[2] & 0x02);
+		input_report_key(dev, BTN_TRIGGER_HAPPY1, data[2] & BIT(2));
+		input_report_key(dev, BTN_TRIGGER_HAPPY2, data[2] & BIT(3));
+		input_report_key(dev, BTN_TRIGGER_HAPPY3, data[2] & BIT(0));
+		input_report_key(dev, BTN_TRIGGER_HAPPY4, data[2] & BIT(1));
 	} else {
 		input_report_abs(dev, ABS_HAT0X,
 				 !!(data[2] & 0x08) - !!(data[2] & 0x04));
@@ -721,10 +721,10 @@ static void xpad_process_packet(struct usb_xpad *xpad, u16 cmd, unsigned char *d
 	}
 
 	/* start/back buttons and stick press left/right */
-	input_report_key(dev, BTN_START,  data[2] & 0x10);
-	input_report_key(dev, BTN_SELECT, data[2] & 0x20);
-	input_report_key(dev, BTN_THUMBL, data[2] & 0x40);
-	input_report_key(dev, BTN_THUMBR, data[2] & 0x80);
+	input_report_key(dev, BTN_START,  data[2] & BIT(4));
+	input_report_key(dev, BTN_SELECT, data[2] & BIT(5));
+	input_report_key(dev, BTN_THUMBL, data[2] & BIT(6));
+	input_report_key(dev, BTN_THUMBR, data[2] & BIT(7));
 
 	/* "analog" buttons A, B, X, Y */
 	input_report_key(dev, BTN_A, data[4]);
@@ -759,10 +759,10 @@ static void xpad360_process_packet(struct usb_xpad *xpad, struct input_dev *dev,
 	/* digital pad */
 	if (xpad->mapping & MAP_DPAD_TO_BUTTONS) {
 		/* dpad as buttons (left, right, up, down) */
-		input_report_key(dev, BTN_TRIGGER_HAPPY1, data[2] & 0x04);
-		input_report_key(dev, BTN_TRIGGER_HAPPY2, data[2] & 0x08);
-		input_report_key(dev, BTN_TRIGGER_HAPPY3, data[2] & 0x01);
-		input_report_key(dev, BTN_TRIGGER_HAPPY4, data[2] & 0x02);
+		input_report_key(dev, BTN_TRIGGER_HAPPY1, data[2] & BIT(2));
+		input_report_key(dev, BTN_TRIGGER_HAPPY2, data[2] & BIT(3));
+		input_report_key(dev, BTN_TRIGGER_HAPPY3, data[2] & BIT(0));
+		input_report_key(dev, BTN_TRIGGER_HAPPY4, data[2] & BIT(1));
 	}
 
 	/*
@@ -780,21 +780,21 @@ static void xpad360_process_packet(struct usb_xpad *xpad, struct input_dev *dev,
 	}
 
 	/* start/back buttons */
-	input_report_key(dev, BTN_START,  data[2] & 0x10);
-	input_report_key(dev, BTN_SELECT, data[2] & 0x20);
+	input_report_key(dev, BTN_START,  data[2] & BIT(4));
+	input_report_key(dev, BTN_SELECT, data[2] & BIT(5));
 
 	/* stick press left/right */
-	input_report_key(dev, BTN_THUMBL, data[2] & 0x40);
-	input_report_key(dev, BTN_THUMBR, data[2] & 0x80);
+	input_report_key(dev, BTN_THUMBL, data[2] & BIT(6));
+	input_report_key(dev, BTN_THUMBR, data[2] & BIT(7));
 
 	/* buttons A,B,X,Y,TL,TR and MODE */
-	input_report_key(dev, BTN_A,	data[3] & 0x10);
-	input_report_key(dev, BTN_B,	data[3] & 0x20);
-	input_report_key(dev, BTN_X,	data[3] & 0x40);
-	input_report_key(dev, BTN_Y,	data[3] & 0x80);
-	input_report_key(dev, BTN_TL,	data[3] & 0x01);
-	input_report_key(dev, BTN_TR,	data[3] & 0x02);
-	input_report_key(dev, BTN_MODE,	data[3] & 0x04);
+	input_report_key(dev, BTN_A,	data[3] & BIT(4));
+	input_report_key(dev, BTN_B,	data[3] & BIT(5));
+	input_report_key(dev, BTN_X,	data[3] & BIT(6));
+	input_report_key(dev, BTN_Y,	data[3] & BIT(7));
+	input_report_key(dev, BTN_TL,	data[3] & BIT(0));
+	input_report_key(dev, BTN_TR,	data[3] & BIT(1));
+	input_report_key(dev, BTN_MODE,	data[3] & BIT(2));
 
 	if (!(xpad->mapping & MAP_STICKS_TO_NULL)) {
 		/* left stick */
@@ -832,7 +832,7 @@ static void xpad360_process_packet(struct usb_xpad *xpad, struct input_dev *dev,
 		}
 
 		/* mode button down/up */
-		if (data[3] & 0x04)
+		if (data[3] & BIT(2))
 			xpad->mode_btn_down_ts = ktime_get_seconds();
 		else
 			xpad->mode_btn_down_ts = 0;
@@ -928,7 +928,7 @@ static void xpadone_process_packet(struct usb_xpad *xpad, u16 cmd, unsigned char
 		if (data[1] == 0x30)
 			xpadone_ack_mode_report(xpad, data[2]);
 
-		input_report_key(dev, BTN_MODE, data[4] & 0x01);
+		input_report_key(dev, BTN_MODE, data[4] & BIT(0));
 
 		do_sync = true;
 	} else if (data[0] == 0X0C) {
@@ -942,33 +942,33 @@ static void xpadone_process_packet(struct usb_xpad *xpad, u16 cmd, unsigned char
 				data[18] = 0;
 
 			/* Elite Series 2 split packet paddle bits */
-			input_report_key(dev, BTN_TRIGGER_HAPPY5, data[18] & 0x01);
-			input_report_key(dev, BTN_TRIGGER_HAPPY6, data[18] & 0x02);
-			input_report_key(dev, BTN_TRIGGER_HAPPY7, data[18] & 0x04);
-			input_report_key(dev, BTN_TRIGGER_HAPPY8, data[18] & 0x08);
+			input_report_key(dev, BTN_TRIGGER_HAPPY5, data[18] & BIT(0));
+			input_report_key(dev, BTN_TRIGGER_HAPPY6, data[18] & BIT(1));
+			input_report_key(dev, BTN_TRIGGER_HAPPY7, data[18] & BIT(2));
+			input_report_key(dev, BTN_TRIGGER_HAPPY8, data[18] & BIT(3));
 
 			do_sync = true;
 		}
 	} else if (data[0] == 0X20) { /* The main valid packet type for inputs */
 		/* menu/view buttons */
-		input_report_key(dev, BTN_START,  data[4] & 0x04);
-		input_report_key(dev, BTN_SELECT, data[4] & 0x08);
+		input_report_key(dev, BTN_START,  data[4] & BIT(2));
+		input_report_key(dev, BTN_SELECT, data[4] & BIT(3));
 		if (xpad->mapping & MAP_SELECT_BUTTON)
-			input_report_key(dev, KEY_RECORD, data[22] & 0x01);
+			input_report_key(dev, KEY_RECORD, data[22] & BIT(0));
 
 		/* buttons A,B,X,Y */
-		input_report_key(dev, BTN_A,	data[4] & 0x10);
-		input_report_key(dev, BTN_B,	data[4] & 0x20);
-		input_report_key(dev, BTN_X,	data[4] & 0x40);
-		input_report_key(dev, BTN_Y,	data[4] & 0x80);
+		input_report_key(dev, BTN_A,	data[4] & BIT(4));
+		input_report_key(dev, BTN_B,	data[4] & BIT(5));
+		input_report_key(dev, BTN_X,	data[4] & BIT(6));
+		input_report_key(dev, BTN_Y,	data[4] & BIT(7));
 
 		/* digital pad */
 		if (xpad->mapping & MAP_DPAD_TO_BUTTONS) {
 			/* dpad as buttons (left, right, up, down) */
-			input_report_key(dev, BTN_TRIGGER_HAPPY1, data[5] & 0x04);
-			input_report_key(dev, BTN_TRIGGER_HAPPY2, data[5] & 0x08);
-			input_report_key(dev, BTN_TRIGGER_HAPPY3, data[5] & 0x01);
-			input_report_key(dev, BTN_TRIGGER_HAPPY4, data[5] & 0x02);
+			input_report_key(dev, BTN_TRIGGER_HAPPY1, data[5] & BIT(2));
+			input_report_key(dev, BTN_TRIGGER_HAPPY2, data[5] & BIT(3));
+			input_report_key(dev, BTN_TRIGGER_HAPPY3, data[5] & BIT(0));
+			input_report_key(dev, BTN_TRIGGER_HAPPY4, data[5] & BIT(1));
 		} else {
 			input_report_abs(dev, ABS_HAT0X,
 					!!(data[5] & 0x08) - !!(data[5] & 0x04));
@@ -977,12 +977,12 @@ static void xpadone_process_packet(struct usb_xpad *xpad, u16 cmd, unsigned char
 		}
 
 		/* TL/TR */
-		input_report_key(dev, BTN_TL,	data[5] & 0x10);
-		input_report_key(dev, BTN_TR,	data[5] & 0x20);
+		input_report_key(dev, BTN_TL,	data[5] & BIT(4));
+		input_report_key(dev, BTN_TR,	data[5] & BIT(5));
 
 		/* stick press left/right */
-		input_report_key(dev, BTN_THUMBL, data[5] & 0x40);
-		input_report_key(dev, BTN_THUMBR, data[5] & 0x80);
+		input_report_key(dev, BTN_THUMBL, data[5] & BIT(6));
+		input_report_key(dev, BTN_THUMBR, data[5] & BIT(7));
 
 		if (!(xpad->mapping & MAP_STICKS_TO_NULL)) {
 			/* left stick */
@@ -1023,10 +1023,10 @@ static void xpadone_process_packet(struct usb_xpad *xpad, u16 cmd, unsigned char
 					data[32] = 0;
 
 				/* OG Elite Series Controller paddle bits */
-				input_report_key(dev, BTN_TRIGGER_HAPPY5, data[32] & 0x02);
-				input_report_key(dev, BTN_TRIGGER_HAPPY6, data[32] & 0x08);
-				input_report_key(dev, BTN_TRIGGER_HAPPY7, data[32] & 0x01);
-				input_report_key(dev, BTN_TRIGGER_HAPPY8, data[32] & 0x04);
+				input_report_key(dev, BTN_TRIGGER_HAPPY5, data[32] & BIT(1));
+				input_report_key(dev, BTN_TRIGGER_HAPPY6, data[32] & BIT(3));
+				input_report_key(dev, BTN_TRIGGER_HAPPY7, data[32] & BIT(0));
+				input_report_key(dev, BTN_TRIGGER_HAPPY8, data[32] & BIT(2));
 			} else if (xpad->packet_type == PKT_XBE2_FW_OLD) {
 				/* Mute paddles if controller has a custom mapping applied.
 				 * Checked by comparing the current mapping
@@ -1036,10 +1036,10 @@ static void xpadone_process_packet(struct usb_xpad *xpad, u16 cmd, unsigned char
 					data[18] = 0;
 
 				/* Elite Series 2 4.x firmware paddle bits */
-				input_report_key(dev, BTN_TRIGGER_HAPPY5, data[18] & 0x01);
-				input_report_key(dev, BTN_TRIGGER_HAPPY6, data[18] & 0x02);
-				input_report_key(dev, BTN_TRIGGER_HAPPY7, data[18] & 0x04);
-				input_report_key(dev, BTN_TRIGGER_HAPPY8, data[18] & 0x08);
+				input_report_key(dev, BTN_TRIGGER_HAPPY5, data[18] & BIT(0));
+				input_report_key(dev, BTN_TRIGGER_HAPPY6, data[18] & BIT(1));
+				input_report_key(dev, BTN_TRIGGER_HAPPY7, data[18] & BIT(2));
+				input_report_key(dev, BTN_TRIGGER_HAPPY8, data[18] & BIT(3));
 			} else if (xpad->packet_type == PKT_XBE2_FW_5_EARLY) {
 				/* Mute paddles if controller has a custom mapping applied.
 				 * Checked by comparing the current mapping
@@ -1051,10 +1051,10 @@ static void xpadone_process_packet(struct usb_xpad *xpad, u16 cmd, unsigned char
 				/* Elite Series 2 5.x firmware paddle bits
 				 * (before the packet was split)
 				 */
-				input_report_key(dev, BTN_TRIGGER_HAPPY5, data[22] & 0x01);
-				input_report_key(dev, BTN_TRIGGER_HAPPY6, data[22] & 0x02);
-				input_report_key(dev, BTN_TRIGGER_HAPPY7, data[22] & 0x04);
-				input_report_key(dev, BTN_TRIGGER_HAPPY8, data[22] & 0x08);
+				input_report_key(dev, BTN_TRIGGER_HAPPY5, data[22] & BIT(0));
+				input_report_key(dev, BTN_TRIGGER_HAPPY6, data[22] & BIT(1));
+				input_report_key(dev, BTN_TRIGGER_HAPPY7, data[22] & BIT(2));
+				input_report_key(dev, BTN_TRIGGER_HAPPY8, data[22] & BIT(3));
 			}
 		}
 
-- 
2.34.1

