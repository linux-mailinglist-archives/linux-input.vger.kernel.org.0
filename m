Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5E35F5B7CBD
	for <lists+linux-input@lfdr.de>; Tue, 13 Sep 2022 23:32:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229601AbiIMVcl (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 13 Sep 2022 17:32:41 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56138 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229603AbiIMVck (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Tue, 13 Sep 2022 17:32:40 -0400
Received: from mail-ej1-x62d.google.com (mail-ej1-x62d.google.com [IPv6:2a00:1450:4864:20::62d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id ABDBC61115
        for <linux-input@vger.kernel.org>; Tue, 13 Sep 2022 14:32:39 -0700 (PDT)
Received: by mail-ej1-x62d.google.com with SMTP id dv25so30393226ejb.12
        for <linux-input@vger.kernel.org>; Tue, 13 Sep 2022 14:32:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
        bh=Pz599/tGS47Z8KZoON44yUAsXhdp4gOe0RD3lxgB0NM=;
        b=lVKy3SwDQC5rKQcUGgZTDdciAvTXRBVKE5FbgmI0NV40SD5BZKyDojrXbckHBErUVV
         L5VWMCs1Lh4TlSfTBVvRgMiAXFCG4SN+p8Bq21D+45gCxDh7USawOMc87Sd/z0GFMh9d
         ly0DpTLsKYm6l3p4rt2yfTPdtEdqfbXtP/wUnUiUIxINB+YrWa2N1JscXp54ogVuur/t
         mwuAChwUVQj7YFwWleIqYz0kmzHDFUvM6muKRB0nc6uhGEvU8nFbqYjjWXleihZxVpWW
         pSv9INr9eUzKdpL0Jytt6PHc6u4mJ74QbysCEN2zOwB6Tf+lKV+DgW9NH4Vo7UmwP+cq
         MSyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date;
        bh=Pz599/tGS47Z8KZoON44yUAsXhdp4gOe0RD3lxgB0NM=;
        b=Yzu5eeHolfyMYSowTcsEhBCUQWL15Kb+qSFhV3eEqgf9ZN/01Vv9S1loZu/o+gQ5+f
         MpAwh3Omd8aempjDX5l0y97U8FODXs/6Nd+4hiEJ+A6aEf1LtSglyqnmqev/4TsF2TaG
         2b2XhglMl0nfeGBZkWs8cyuTFv5mzlKsmHazbWypxPHSUxkP3HlPdKJaKlzN2PQg6htk
         yymS837CybCcXmAMwIwl6fWi4QwYNfHGK1VXb3nkPjbLewUe7fYKaF0swy4mToZLxn8A
         9iE4ItVKfDyh3rBJv63qc6pC7hNRylrze0dnIlsd0JO/AABWvMCse/jdfP9KJ/tXICnz
         k5Vw==
X-Gm-Message-State: ACgBeo2xFckaijvbYy5YdRNxzB0ngfX9AKG2XVf0VCMFXpRMLBvDGoII
        WWuH4SSBqZ7jm/qiiwlfgo2MiT2EOqKzww==
X-Google-Smtp-Source: AA6agR68Qd8c3ap1vdJ16knRReuAqmplVQXji4u9cN5ZrfYAaS8JbLKN3oshxkQ2P0aiS3Amd38n8Q==
X-Received: by 2002:a17:906:58cc:b0:770:7e79:a2ee with SMTP id e12-20020a17090658cc00b007707e79a2eemr23932376ejs.166.1663104758100;
        Tue, 13 Sep 2022 14:32:38 -0700 (PDT)
Received: from deepwhite.fritz.box ([2001:9e8:2218:7900:8fcc:6ea7:4870:fd6b])
        by smtp.gmail.com with ESMTPSA id p26-20020a17090635da00b0073d5e1edd1csm6592819ejb.225.2022.09.13.14.32.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Sep 2022 14:32:37 -0700 (PDT)
From:   Pavel Rojtberg <rojtberg@gmail.com>
X-Google-Original-From: Pavel Rojtberg < rojtberg@gmail.com >
To:     linux-input@vger.kernel.org, dmitry.torokhov@gmail.com,
        gregkh@linuxfoundation.org
Cc:     Pavel Rojtberg <rojtberg@gmail.com>
Subject: [PATCH 2/2] Input: xpad - decipher xpadone packages with GIP defines
Date:   Tue, 13 Sep 2022 23:31:33 +0200
Message-Id: <20220913213133.584979-3-rojtberg@gmail.com>
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

only renames, no functional changes. Some of the packets we send
seem superfluous now. Unfortunately I dont have the hardware to verify
whether they are.

Signed-off-by: Pavel Rojtberg <rojtberg@gmail.com>
---
 drivers/input/joystick/xpad.c | 99 ++++++++++++++++++++++++++++++++++++++++------------------
 1 file changed, 69 insertions(+), 30 deletions(-)

diff --git a/drivers/input/joystick/xpad.c b/drivers/input/joystick/xpad.c
index 19e3958..ec5ec51 100644
--- a/drivers/input/joystick/xpad.c
+++ b/drivers/input/joystick/xpad.c
@@ -513,13 +513,52 @@ struct xboxone_init_packet {
 		.len		= ARRAY_SIZE(_data),	\
 	}
 
+/*
+ * starting with xbox one, the game input protocol is used
+ * magic numbers are taken from
+ * - https://github.com/xpadneo/gip-dissector/blob/main/src/gip-dissector.lua
+ * - https://github.com/medusalix/xone/blob/master/bus/protocol.c
+ */
+#define GIP_CMD_ACK      0x01
+#define GIP_CMD_IDENTIFY 0x04
+#define GIP_CMD_POWER    0x05
+#define GIP_CMD_AUTHENTICATE 0x06
+#define GIP_CMD_VIRTUAL_KEY  0x07
+#define GIP_CMD_RUMBLE   0x09
+#define GIP_CMD_LED      0x0a
+#define GIP_CMD_FIRMWARE 0x0c
+#define GIP_CMD_INPUT    0x20
+
+#define GIP_SEQ0 0x00
+
+#define GIP_OPT_ACK      0x10
+#define GIP_OPT_INTERNAL 0x20
+
+/*
+ * length of the command payload encoded with
+ * https://en.wikipedia.org/wiki/LEB128
+ * which is a no-op for N < 128
+ */
+#define GIP_PL_LEN(N) (N)
+
+/*
+ * payload specific defines
+ */
+#define GIP_PWR_ON 0x00
+#define GIP_LED_ON 0x01
+
+#define GIP_MOTOR_R  BIT(0)
+#define GIP_MOTOR_L  BIT(1)
+#define GIP_MOTOR_RT BIT(2)
+#define GIP_MOTOR_LT BIT(3)
+#define GIP_MOTOR_ALL (GIP_MOTOR_R | GIP_MOTOR_L | GIP_MOTOR_RT | GIP_MOTOR_LT)
 
 /*
  * This packet is required for all Xbox One pads with 2015
  * or later firmware installed (or present from the factory).
  */
-static const u8 xboxone_fw2015_init[] = {
-	0x05, 0x20, 0x00, 0x01, 0x00
+static const u8 xboxone_power_on[] = {
+	GIP_CMD_POWER, GIP_OPT_INTERNAL, GIP_SEQ0, GIP_PL_LEN(1), GIP_PWR_ON
 };
 
 /*
@@ -529,7 +568,7 @@ static const u8 xboxone_fw2015_init[] = {
  * Bluetooth mode.
  */
 static const u8 xboxone_s_init[] = {
-	0x05, 0x20, 0x00, 0x0f, 0x06
+	GIP_CMD_POWER, GIP_OPT_INTERNAL, GIP_SEQ0, 0x0f, 0x06
 };
 
 /*
@@ -546,9 +585,9 @@ static const u8 extra_input_packet_init[] = {
  * (0x0e6f:0x0165) to finish initialization and for Hori pads
  * (0x0f0d:0x0067) to make the analog sticks work.
  */
-static const u8 xboxone_hori_init[] = {
-	0x01, 0x20, 0x00, 0x09, 0x00, 0x04, 0x20, 0x3a,
-	0x00, 0x00, 0x00, 0x80, 0x00
+static const u8 xboxone_hori_ack_id[] = {
+	GIP_CMD_ACK, GIP_OPT_INTERNAL, GIP_SEQ0, GIP_PL_LEN(9),
+	0x00, GIP_CMD_IDENTIFY, GIP_OPT_INTERNAL, 0x3a, 0x00, 0x00, 0x00, 0x80, 0x00
 };
 
 /*
@@ -556,8 +595,8 @@ static const u8 xboxone_hori_init[] = {
  * sending input reports. These pads include: (0x0e6f:0x02ab),
  * (0x0e6f:0x02a4), (0x0e6f:0x02a6).
  */
-static const u8 xboxone_pdp_init1[] = {
-	0x0a, 0x20, 0x00, 0x03, 0x00, 0x01, 0x14
+static const u8 xboxone_pdp_led_on[] = {
+	GIP_CMD_LED, GIP_OPT_INTERNAL, GIP_SEQ0, GIP_PL_LEN(3), 0x00, GIP_LED_ON, 0x14
 };
 
 /*
@@ -565,8 +604,8 @@ static const u8 xboxone_pdp_init1[] = {
  * sending input reports. These pads include: (0x0e6f:0x02ab),
  * (0x0e6f:0x02a4), (0x0e6f:0x02a6).
  */
-static const u8 xboxone_pdp_init2[] = {
-	0x06, 0x20, 0x00, 0x02, 0x01, 0x00
+static const u8 xboxone_pdp_auth[] = {
+	GIP_CMD_AUTHENTICATE, GIP_OPT_INTERNAL, GIP_SEQ0, GIP_PL_LEN(2), 0x01, 0x00
 };
 
 /*
@@ -574,8 +613,8 @@ static const u8 xboxone_pdp_init2[] = {
  * sending input reports. One of those pads is (0x24c6:0x543a).
  */
 static const u8 xboxone_rumblebegin_init[] = {
-	0x09, 0x00, 0x00, 0x09, 0x00, 0x0F, 0x00, 0x00,
-	0x1D, 0x1D, 0xFF, 0x00, 0x00
+	GIP_CMD_RUMBLE, 0x00, GIP_SEQ0, GIP_PL_LEN(9),
+	0x00, GIP_MOTOR_ALL, 0x00, 0x00, 0x1D, 0x1D, 0xFF, 0x00, 0x00
 };
 
 /*
@@ -585,8 +624,8 @@ static const u8 xboxone_rumblebegin_init[] = {
  * spin up to enough speed to actually vibrate the gamepad.
  */
 static const u8 xboxone_rumbleend_init[] = {
-	0x09, 0x00, 0x00, 0x09, 0x00, 0x0F, 0x00, 0x00,
-	0x00, 0x00, 0x00, 0x00, 0x00
+	GIP_CMD_RUMBLE, 0x00, GIP_SEQ0, GIP_PL_LEN(9),
+	0x00, GIP_MOTOR_ALL, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
 };
 
 /*
@@ -596,14 +635,14 @@ static const u8 xboxone_rumbleend_init[] = {
  * packet is going to be sent.
  */
 static const struct xboxone_init_packet xboxone_init_packets[] = {
-	XBOXONE_INIT_PKT(0x0e6f, 0x0165, xboxone_hori_init),
-	XBOXONE_INIT_PKT(0x0f0d, 0x0067, xboxone_hori_init),
-	XBOXONE_INIT_PKT(0x0000, 0x0000, xboxone_fw2015_init),
+	XBOXONE_INIT_PKT(0x0e6f, 0x0165, xboxone_hori_ack_id),
+	XBOXONE_INIT_PKT(0x0f0d, 0x0067, xboxone_hori_ack_id),
+	XBOXONE_INIT_PKT(0x0000, 0x0000, xboxone_power_on),
 	XBOXONE_INIT_PKT(0x045e, 0x02ea, xboxone_s_init),
 	XBOXONE_INIT_PKT(0x045e, 0x0b00, xboxone_s_init),
 	XBOXONE_INIT_PKT(0x045e, 0x0b00, extra_input_packet_init),
-	XBOXONE_INIT_PKT(0x0e6f, 0x0000, xboxone_pdp_init1),
-	XBOXONE_INIT_PKT(0x0e6f, 0x0000, xboxone_pdp_init2),
+	XBOXONE_INIT_PKT(0x0e6f, 0x0000, xboxone_pdp_led_on),
+	XBOXONE_INIT_PKT(0x0e6f, 0x0000, xboxone_pdp_auth),
 	XBOXONE_INIT_PKT(0x24c6, 0x541a, xboxone_rumblebegin_init),
 	XBOXONE_INIT_PKT(0x24c6, 0x542a, xboxone_rumblebegin_init),
 	XBOXONE_INIT_PKT(0x24c6, 0x543a, xboxone_rumblebegin_init),
@@ -919,19 +958,19 @@ static void xpadone_process_packet(struct usb_xpad *xpad, u16 cmd, unsigned char
 	bool do_sync = false;
 
 	/* the xbox button has its own special report */
-	if (data[0] == 0X07) {
+	if (data[0] == GIP_CMD_VIRTUAL_KEY) {
 		/*
 		 * The Xbox One S controller requires these reports to be
 		 * acked otherwise it continues sending them forever and
 		 * won't report further mode button events.
 		 */
-		if (data[1] == 0x30)
+		if (data[1] == (GIP_OPT_ACK | GIP_OPT_INTERNAL))
 			xpadone_ack_mode_report(xpad, data[2]);
 
 		input_report_key(dev, BTN_MODE, data[4] & BIT(0));
 
 		do_sync = true;
-	} else if (data[0] == 0X0C) {
+	} else if (data[0] == GIP_CMD_FIRMWARE) {
 		/* Some packet formats force us to use this separate to poll paddle inputs */
 		if (xpad->packet_type == PKT_XBE2_FW_5_11) {
 			/* Mute paddles if controller is in a custom profile slot
@@ -949,7 +988,7 @@ static void xpadone_process_packet(struct usb_xpad *xpad, u16 cmd, unsigned char
 
 			do_sync = true;
 		}
-	} else if (data[0] == 0X20) { /* The main valid packet type for inputs */
+	} else if (data[0] == GIP_CMD_INPUT) { /* The main valid packet type for inputs */
 		/* menu/view buttons */
 		input_report_key(dev, BTN_START,  data[4] & BIT(2));
 		input_report_key(dev, BTN_SELECT, data[4] & BIT(3));
@@ -1362,8 +1401,8 @@ static void xpadone_ack_mode_report(struct usb_xpad *xpad, u8 seq_num)
 	struct xpad_output_packet *packet =
 			&xpad->out_packets[XPAD_OUT_CMD_IDX];
 	static const u8 mode_report_ack[] = {
-		0x01, 0x20, 0x00, 0x09, 0x00, 0x07, 0x20, 0x02,
-		0x00, 0x00, 0x00, 0x00, 0x00
+		GIP_CMD_ACK, GIP_OPT_INTERNAL, GIP_SEQ0, GIP_PL_LEN(9),
+		0x00, GIP_CMD_VIRTUAL_KEY, GIP_OPT_INTERNAL, 0x02, 0x00, 0x00, 0x00, 0x00, 0x00
 	};
 
 	spin_lock_irqsave(&xpad->odata_lock, flags);
@@ -1441,14 +1480,14 @@ static int xpad_play_effect(struct input_dev *dev, void *data, struct ff_effect
 		break;
 
 	case XTYPE_XBOXONE:
-		packet->data[0] = 0x09; /* activate rumble */
+		packet->data[0] = GIP_CMD_RUMBLE; /* activate rumble */
 		packet->data[1] = 0x00;
 		packet->data[2] = xpad->odata_serial++;
-		packet->data[3] = 0x09;
+		packet->data[3] = GIP_PL_LEN(9);
 		packet->data[4] = 0x00;
-		packet->data[5] = 0x0F;
-		packet->data[6] = 0x00;
-		packet->data[7] = 0x00;
+		packet->data[5] = GIP_MOTOR_ALL;
+		packet->data[6] = 0x00; /* left trigger */
+		packet->data[7] = 0x00; /* right trigger */
 		packet->data[8] = strong / 512;	/* left actuator */
 		packet->data[9] = weak / 512;	/* right actuator */
 		packet->data[10] = 0xFF; /* on period */
-- 
2.34.1

