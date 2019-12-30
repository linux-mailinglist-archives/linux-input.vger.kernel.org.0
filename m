Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4471D12CB9F
	for <lists+linux-input@lfdr.de>; Mon, 30 Dec 2019 02:27:37 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726653AbfL3B1g (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Sun, 29 Dec 2019 20:27:36 -0500
Received: from mail-yw1-f68.google.com ([209.85.161.68]:46426 "EHLO
        mail-yw1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726643AbfL3B1f (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Sun, 29 Dec 2019 20:27:35 -0500
Received: by mail-yw1-f68.google.com with SMTP id u139so13551146ywf.13
        for <linux-input@vger.kernel.org>; Sun, 29 Dec 2019 17:27:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=MBxgxEM+1exTwV62vA4dNtN1CHW78KiverAz03q2jX0=;
        b=PF0WqLOIMgnKqIz4qMMFVFjRCgX1++pGr3QCib5d9/F7RJwyzSALd3oHgki+OR/AHJ
         dEbDWh/dJ1PlEk+wYp46OXchmMnoRKTfQQL+WeKX8fFyUsvQa/v/2FeQfWcvNqrGNUuw
         vRLYh+u8dCT80iHGO+ZJfb5JlLZx1puW8hXyRdOps8mbISj5govbT1ryupx0o0cvVHNb
         i/E2ErNxoP1L0c46KtDYEUKbW30mk/XHhmKAnfwp1SLZxuR5nkh81Yxs84xltLXk1zix
         yir6zWWndX9Cp3uJb7s2wG/Z74gHVnaQebycxbdodx/df5Q8eiAQkNQaFfY6EMzyzMNZ
         nD1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=MBxgxEM+1exTwV62vA4dNtN1CHW78KiverAz03q2jX0=;
        b=RWG7sWQX1KFlicCo+fVzbAhganPfNDKn2ash1mrSLYC/1dpA/1+5d+/OpdrzofFhax
         k/YOzuPcTwahtjMZoX4D/IRr8PuIMK7L78Tnhvb41+GGjp5Sljq8s79jv01jx2WlbbDU
         TsYH4936gb4k4GlkgyMa+GitUt080EmyszYQc6P5qVYrAO1E743t2+oYICh6ZbcVyxUI
         X9MToIyRIe1U3UsozECybpMVbadBWdL3HFQMhkBaKjdLb2mqhhnkmuz1m3eo28HkdRKK
         rXTQf+LftHRs/8iJF0VOPqD2tUiy60ybt+PCE5rRtfq4KNWhmJ1ktzd+3bCsQ5JffjIl
         jB/Q==
X-Gm-Message-State: APjAAAUAaxCtHCpqCu9xvvFRon422t30LExqFgbUAxGcV5WRQTHQ1ly7
        aSpXvm7pPIhUX7nXZZT0pMtjsOeOe3Q=
X-Google-Smtp-Source: APXvYqyg2ucFcWELlRb4tXsljKT6X5bYAmJCkttIojnZG0cb1igb72kcQeYahteYgW+iaC89hzIAPA==
X-Received: by 2002:a81:1889:: with SMTP id 131mr45122772ywy.277.1577669254427;
        Sun, 29 Dec 2019 17:27:34 -0800 (PST)
Received: from Arrakis.djogorchock.com ([136.33.205.58])
        by smtp.gmail.com with ESMTPSA id g11sm17175584ywe.14.2019.12.29.17.27.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 29 Dec 2019 17:27:33 -0800 (PST)
From:   "Daniel J. Ogorchock" <djogorchock@gmail.com>
To:     linux-input@vger.kernel.org
Cc:     thunderbird2k@gmail.com, blaws05@gmail.com,
        benjamin.tissoires@redhat.com, jikos@kernel.org,
        Roderick.Colenbrander@sony.com, svv@google.com, s.jegen@gmail.com,
        carmueller@gmail.com, "Daniel J. Ogorchock" <djogorchock@gmail.com>
Subject: [PATCH v10 06/12] HID: nintendo: improve subcommand reliability
Date:   Sun, 29 Dec 2019 19:27:14 -0600
Message-Id: <20191230012720.2368987-7-djogorchock@gmail.com>
X-Mailer: git-send-email 2.24.1
In-Reply-To: <20191230012720.2368987-1-djogorchock@gmail.com>
References: <20191230012720.2368987-1-djogorchock@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

The controller occasionally doesn't respond to subcommands. It appears
that it's dropping them. To improve reliability, this patch attempts one
retry in the case of a synchronous send timeout. In testing, this has
resolved all timeout failures (most common for LED setting and rumble
setting subcommands).

The 1 second timeout is excessively long for rumble and LED subcommands,
so the timeout has been made a param for joycon_hid_send_sync. Most
subcommands continue to use the 1s timeout, since they can result in
long response times. Rumble and LED setting subcommands have been
reduced to 250ms, since response times for them are much quicker (and
this significantly reduces the observable impact in the case of a retry
being required).

Signed-off-by: Daniel J. Ogorchock <djogorchock@gmail.com>
---
 drivers/hid/hid-nintendo.c | 66 ++++++++++++++++++++++++--------------
 1 file changed, 42 insertions(+), 24 deletions(-)

diff --git a/drivers/hid/hid-nintendo.c b/drivers/hid/hid-nintendo.c
index 7afb84234c6d..05d4c0e9636e 100644
--- a/drivers/hid/hid-nintendo.c
+++ b/drivers/hid/hid-nintendo.c
@@ -365,27 +365,45 @@ static int __joycon_hid_send(struct hid_device *hdev, u8 *data, size_t len)
 	return ret;
 }
 
-static int joycon_hid_send_sync(struct joycon_ctlr *ctlr, u8 *data, size_t len)
+static int joycon_hid_send_sync(struct joycon_ctlr *ctlr, u8 *data, size_t len,
+				u32 timeout)
 {
 	int ret;
+	int tries = 2;
 
-	ret = __joycon_hid_send(ctlr->hdev, data, len);
-	if (ret < 0) {
-		memset(ctlr->input_buf, 0, JC_MAX_RESP_SIZE);
-		return ret;
-	}
+	/*
+	 * The controller occasionally seems to drop subcommands. In testing,
+	 * doing one retry after a timeout appears to always work.
+	 */
+	while (tries--) {
+		ret = __joycon_hid_send(ctlr->hdev, data, len);
+		if (ret < 0) {
+			memset(ctlr->input_buf, 0, JC_MAX_RESP_SIZE);
+			return ret;
+		}
 
-	if (!wait_event_timeout(ctlr->wait, ctlr->received_resp, HZ)) {
-		hid_dbg(ctlr->hdev, "synchronous send/receive timed out\n");
-		memset(ctlr->input_buf, 0, JC_MAX_RESP_SIZE);
-		return -ETIMEDOUT;
+		ret = wait_event_timeout(ctlr->wait, ctlr->received_resp,
+					 timeout);
+		if (!ret) {
+			hid_dbg(ctlr->hdev,
+				"synchronous send/receive timed out\n");
+			if (tries) {
+				hid_dbg(ctlr->hdev,
+					"retrying sync send after timeout\n");
+			}
+			memset(ctlr->input_buf, 0, JC_MAX_RESP_SIZE);
+			ret = -ETIMEDOUT;
+		} else {
+			ret = 0;
+			break;
+		}
 	}
 
 	ctlr->received_resp = false;
-	return 0;
+	return ret;
 }
 
-static int joycon_send_usb(struct joycon_ctlr *ctlr, u8 cmd)
+static int joycon_send_usb(struct joycon_ctlr *ctlr, u8 cmd, u32 timeout)
 {
 	int ret;
 	u8 buf[2] = {JC_OUTPUT_USB_CMD};
@@ -393,7 +411,7 @@ static int joycon_send_usb(struct joycon_ctlr *ctlr, u8 cmd)
 	buf[1] = cmd;
 	ctlr->usb_ack_match = cmd;
 	ctlr->msg_type = JOYCON_MSG_TYPE_USB;
-	ret = joycon_hid_send_sync(ctlr, buf, sizeof(buf));
+	ret = joycon_hid_send_sync(ctlr, buf, sizeof(buf), timeout);
 	if (ret)
 		hid_dbg(ctlr->hdev, "send usb command failed; ret=%d\n", ret);
 	return ret;
@@ -401,7 +419,7 @@ static int joycon_send_usb(struct joycon_ctlr *ctlr, u8 cmd)
 
 static int joycon_send_subcmd(struct joycon_ctlr *ctlr,
 			      struct joycon_subcmd_request *subcmd,
-			      size_t data_len)
+			      size_t data_len, u32 timeout)
 {
 	int ret;
 	unsigned long flags;
@@ -419,7 +437,7 @@ static int joycon_send_subcmd(struct joycon_ctlr *ctlr,
 	ctlr->msg_type = JOYCON_MSG_TYPE_SUBCMD;
 
 	ret = joycon_hid_send_sync(ctlr, (u8 *)subcmd,
-				   sizeof(*subcmd) + data_len);
+				   sizeof(*subcmd) + data_len, timeout);
 	if (ret < 0)
 		hid_dbg(ctlr->hdev, "send subcommand failed; ret=%d\n", ret);
 	else
@@ -438,7 +456,7 @@ static int joycon_set_player_leds(struct joycon_ctlr *ctlr, u8 flash, u8 on)
 	req->data[0] = (flash << 4) | on;
 
 	hid_dbg(ctlr->hdev, "setting player leds\n");
-	return joycon_send_subcmd(ctlr, req, 1);
+	return joycon_send_subcmd(ctlr, req, 1, HZ/4);
 }
 
 static const u16 DFLT_STICK_CAL_CEN = 2000;
@@ -469,7 +487,7 @@ static int joycon_request_calibration(struct joycon_ctlr *ctlr)
 	data[4] = JC_CAL_DATA_SIZE;
 
 	hid_dbg(ctlr->hdev, "requesting cal data\n");
-	ret = joycon_send_subcmd(ctlr, req, 5);
+	ret = joycon_send_subcmd(ctlr, req, 5, HZ);
 	if (ret) {
 		hid_warn(ctlr->hdev,
 			 "Failed to read stick cal, using defaults; ret=%d\n",
@@ -559,7 +577,7 @@ static int joycon_set_report_mode(struct joycon_ctlr *ctlr)
 	req->data[0] = 0x30; /* standard, full report mode */
 
 	hid_dbg(ctlr->hdev, "setting controller report mode\n");
-	return joycon_send_subcmd(ctlr, req, 1);
+	return joycon_send_subcmd(ctlr, req, 1, HZ);
 }
 
 static int joycon_enable_rumble(struct joycon_ctlr *ctlr, bool enable)
@@ -572,7 +590,7 @@ static int joycon_enable_rumble(struct joycon_ctlr *ctlr, bool enable)
 	req->data[0] = enable ? 0x01 : 0x00;
 
 	hid_dbg(ctlr->hdev, "%s rumble\n", enable ? "enabling" : "disabling");
-	return joycon_send_subcmd(ctlr, req, 1);
+	return joycon_send_subcmd(ctlr, req, 1, HZ/4);
 }
 
 static s32 joycon_map_stick_val(struct joycon_stick_cal *cal, s32 val)
@@ -1030,7 +1048,7 @@ static int joycon_home_led_brightness_set(struct led_classdev *led,
 
 	hid_dbg(hdev, "setting home led brightness\n");
 	mutex_lock(&ctlr->output_mutex);
-	ret = joycon_send_subcmd(ctlr, req, 5);
+	ret = joycon_send_subcmd(ctlr, req, 5, HZ/4);
 	mutex_unlock(&ctlr->output_mutex);
 
 	return ret;
@@ -1326,16 +1344,16 @@ static int nintendo_hid_probe(struct hid_device *hdev,
 	mutex_lock(&ctlr->output_mutex);
 	/* if handshake command fails, assume ble pro controller */
 	if (hdev->product == USB_DEVICE_ID_NINTENDO_PROCON &&
-	    !joycon_send_usb(ctlr, JC_USB_CMD_HANDSHAKE)) {
+	    !joycon_send_usb(ctlr, JC_USB_CMD_HANDSHAKE, HZ)) {
 		hid_dbg(hdev, "detected USB controller\n");
 		/* set baudrate for improved latency */
-		ret = joycon_send_usb(ctlr, JC_USB_CMD_BAUDRATE_3M);
+		ret = joycon_send_usb(ctlr, JC_USB_CMD_BAUDRATE_3M, HZ);
 		if (ret) {
 			hid_err(hdev, "Failed to set baudrate; ret=%d\n", ret);
 			goto err_mutex;
 		}
 		/* handshake */
-		ret = joycon_send_usb(ctlr, JC_USB_CMD_HANDSHAKE);
+		ret = joycon_send_usb(ctlr, JC_USB_CMD_HANDSHAKE, HZ);
 		if (ret) {
 			hid_err(hdev, "Failed handshake; ret=%d\n", ret);
 			goto err_mutex;
@@ -1344,7 +1362,7 @@ static int nintendo_hid_probe(struct hid_device *hdev,
 		 * Set no timeout (to keep controller in USB mode).
 		 * This doesn't send a response, so ignore the timeout.
 		 */
-		joycon_send_usb(ctlr, JC_USB_CMD_NO_TIMEOUT);
+		joycon_send_usb(ctlr, JC_USB_CMD_NO_TIMEOUT, HZ/10);
 	}
 
 	/* get controller calibration data, and parse it */
-- 
2.24.1

