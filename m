Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B5D84D072F
	for <lists+linux-input@lfdr.de>; Wed,  9 Oct 2019 08:29:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729352AbfJIG3H (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 9 Oct 2019 02:29:07 -0400
Received: from mail-io1-f68.google.com ([209.85.166.68]:44667 "EHLO
        mail-io1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729464AbfJIG3H (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Wed, 9 Oct 2019 02:29:07 -0400
Received: by mail-io1-f68.google.com with SMTP id w12so2421536iol.11
        for <linux-input@vger.kernel.org>; Tue, 08 Oct 2019 23:29:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=kJmMzXfC/uM6Y0huX26QdKN+i9RymnExTP1TScZQ45g=;
        b=HnB/bKPS3kBddHKaObcsuV2kok5E49rC4opGaR3wziXluueCYlDkfUc2rJqsACmthL
         w+cy6JIY137+9mmnU7pxZQjrIjv5l0IdvdOJem53ca+9Nny8OGMzDDE5D9M8HJjgfGlP
         L0LcSJJf8CLJVqZ6LIpIp5fO3yCgIbF2mPiv+QqrT7gE2lT5rEhiAaWY+LzVk9cFIAsV
         SHdl1jQoqxi8g4J2OVV+8zhrOTHsfyPNdip4zDG88+zEAmddunqoBJROVCAl0azLxyr3
         6ZkuFjJJQHm4xbgjSmTw2mDhfgLqvzqhifauTBbJML4B1QIq1A/g5AV+4JIR+WUICJWe
         LICw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=kJmMzXfC/uM6Y0huX26QdKN+i9RymnExTP1TScZQ45g=;
        b=DJl5tn5p2uinZkbZwvAgRcRGJcLE3CKyhAhcIkZgXUQcm1PCJ2XRO5pSic/3XFfVdX
         jjPNSg0bDUVR/KWCGHhx8Dhsi9sY9yvmmLcFWFJO2yJ8pHHtmqzUSRnr2I4VtNglRAp6
         Sm9sZeF4KBnbREczfPIDyy70EggJoL8S0rGl5fOgOeld3jVmTD0pz/3PpyFYXUkLyHTd
         R2XzRi2F1PXtbUZc13aSMeflpa+1VEtfw3lL91i/sBLWa55sTkHfLkdSsAFfev42Po1i
         BxX0KuvyzyxEb0POQvK0P6y+P9i3wjQ/qHjMLCL1bzFz0a/fF4rPedWkwq9q4NmQdmIo
         9RiA==
X-Gm-Message-State: APjAAAXNBZQs09AxJFGSAo9niukq9V3ZgbKXQIs1a0bdq6Ac66S0SkAt
        lKv8AzdGtZa5KSZIkDVyv2PFOu6dXbY=
X-Google-Smtp-Source: APXvYqxZSH5jCFDRS3dvfs1nwvq0JsR78cTFFwhNrUDdwpBEcqXr384qHb1w9GN5tNt7HJk3gMdPeQ==
X-Received: by 2002:a02:a792:: with SMTP id e18mr1750504jaj.143.1570602546502;
        Tue, 08 Oct 2019 23:29:06 -0700 (PDT)
Received: from Arrakis.djogorchock.com ([136.61.189.171])
        by smtp.gmail.com with ESMTPSA id r22sm880844ilb.85.2019.10.08.23.29.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Oct 2019 23:29:05 -0700 (PDT)
From:   "Daniel J. Ogorchock" <djogorchock@gmail.com>
To:     linux-input@vger.kernel.org
Cc:     thunderbird2k@gmail.com, blaws05@gmail.com,
        benjamin.tissoires@redhat.com, jikos@kernel.org,
        Roderick.Colenbrander@sony.com, svv@google.com, s.jegen@gmail.com,
        "Daniel J. Ogorchock" <djogorchock@gmail.com>
Subject: [PATCH v7 6/8] HID: nintendo: improve subcommand reliability
Date:   Wed,  9 Oct 2019 01:28:31 -0500
Message-Id: <20191009062833.3599398-7-djogorchock@gmail.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20191009062833.3599398-1-djogorchock@gmail.com>
References: <20191009062833.3599398-1-djogorchock@gmail.com>
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
 drivers/hid/hid-nintendo.c | 56 +++++++++++++++++++++++++-------------
 1 file changed, 37 insertions(+), 19 deletions(-)

diff --git a/drivers/hid/hid-nintendo.c b/drivers/hid/hid-nintendo.c
index ada6374ba217..63bd58234767 100644
--- a/drivers/hid/hid-nintendo.c
+++ b/drivers/hid/hid-nintendo.c
@@ -364,24 +364,42 @@ static int __joycon_hid_send(struct hid_device *hdev, u8 *data, size_t len)
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
 
 static int joycon_send_usb(struct joycon_ctlr *ctlr, u8 cmd)
@@ -392,7 +410,7 @@ static int joycon_send_usb(struct joycon_ctlr *ctlr, u8 cmd)
 	buf[1] = cmd;
 	ctlr->usb_ack_match = cmd;
 	ctlr->msg_type = JOYCON_MSG_TYPE_USB;
-	ret = joycon_hid_send_sync(ctlr, buf, sizeof(buf));
+	ret = joycon_hid_send_sync(ctlr, buf, sizeof(buf), HZ);
 	if (ret)
 		hid_dbg(ctlr->hdev, "send usb command failed; ret=%d\n", ret);
 	return ret;
@@ -400,7 +418,7 @@ static int joycon_send_usb(struct joycon_ctlr *ctlr, u8 cmd)
 
 static int joycon_send_subcmd(struct joycon_ctlr *ctlr,
 			      struct joycon_subcmd_request *subcmd,
-			      size_t data_len)
+			      size_t data_len, u32 timeout)
 {
 	int ret;
 	unsigned long flags;
@@ -418,7 +436,7 @@ static int joycon_send_subcmd(struct joycon_ctlr *ctlr,
 	ctlr->msg_type = JOYCON_MSG_TYPE_SUBCMD;
 
 	ret = joycon_hid_send_sync(ctlr, (u8 *)subcmd,
-				   sizeof(*subcmd) + data_len);
+				   sizeof(*subcmd) + data_len, timeout);
 	if (ret < 0)
 		hid_dbg(ctlr->hdev, "send subcommand failed; ret=%d\n", ret);
 	else
@@ -437,7 +455,7 @@ static int joycon_set_player_leds(struct joycon_ctlr *ctlr, u8 flash, u8 on)
 	req->data[0] = (flash << 4) | on;
 
 	hid_dbg(ctlr->hdev, "setting player leds\n");
-	return joycon_send_subcmd(ctlr, req, 1);
+	return joycon_send_subcmd(ctlr, req, 1, HZ/4);
 }
 
 static const u16 DFLT_STICK_CAL_CEN = 2000;
@@ -468,7 +486,7 @@ static int joycon_request_calibration(struct joycon_ctlr *ctlr)
 	data[4] = JC_CAL_DATA_SIZE;
 
 	hid_dbg(ctlr->hdev, "requesting cal data\n");
-	ret = joycon_send_subcmd(ctlr, req, 5);
+	ret = joycon_send_subcmd(ctlr, req, 5, HZ);
 	if (ret) {
 		hid_warn(ctlr->hdev,
 			 "Failed to read stick cal, using defaults; ret=%d\n",
@@ -558,7 +576,7 @@ static int joycon_set_report_mode(struct joycon_ctlr *ctlr)
 	req->data[0] = 0x30; /* standard, full report mode */
 
 	hid_dbg(ctlr->hdev, "setting controller report mode\n");
-	return joycon_send_subcmd(ctlr, req, 1);
+	return joycon_send_subcmd(ctlr, req, 1, HZ);
 }
 
 static int joycon_enable_rumble(struct joycon_ctlr *ctlr, bool enable)
@@ -571,7 +589,7 @@ static int joycon_enable_rumble(struct joycon_ctlr *ctlr, bool enable)
 	req->data[0] = enable ? 0x01 : 0x00;
 
 	hid_dbg(ctlr->hdev, "%s rumble\n", enable ? "enabling" : "disabling");
-	return joycon_send_subcmd(ctlr, req, 1);
+	return joycon_send_subcmd(ctlr, req, 1, HZ/4);
 }
 
 static s32 joycon_map_stick_val(struct joycon_stick_cal *cal, s32 val)
@@ -1014,7 +1032,7 @@ static int joycon_home_led_brightness_set(struct led_classdev *led,
 
 	hid_dbg(hdev, "setting home led brightness\n");
 	mutex_lock(&ctlr->output_mutex);
-	ret = joycon_send_subcmd(ctlr, req, 5);
+	ret = joycon_send_subcmd(ctlr, req, 5, HZ/4);
 	mutex_unlock(&ctlr->output_mutex);
 
 	return ret;
-- 
2.23.0

