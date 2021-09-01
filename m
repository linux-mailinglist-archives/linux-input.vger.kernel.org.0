Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E5BEE3FE663
	for <lists+linux-input@lfdr.de>; Thu,  2 Sep 2021 02:34:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237105AbhIAXnv (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 1 Sep 2021 19:43:51 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45666 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232479AbhIAXnu (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Wed, 1 Sep 2021 19:43:50 -0400
Received: from mail-qv1-xf36.google.com (mail-qv1-xf36.google.com [IPv6:2607:f8b0:4864:20::f36])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7B928C061575
        for <linux-input@vger.kernel.org>; Wed,  1 Sep 2021 16:42:53 -0700 (PDT)
Received: by mail-qv1-xf36.google.com with SMTP id e18so158220qvo.1
        for <linux-input@vger.kernel.org>; Wed, 01 Sep 2021 16:42:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=jMvb1HA4Qb9OGpa6IHl5Cr3nQAS0ueWhq65QMg36H+Y=;
        b=aLMykylUTylTKTXwXBDGrK7j13mPhWKcAUhAQQR/igYevZD5tVRQn5yfrUPW9UYLCZ
         K0CzoQdV7VPE6eSNmiynhGDExRpwQPZwWmkc8faOx00LNJjMcU2V0Fn/hokMEWKv9m5d
         6Ye/2txcmEic5yLEDvbaCT1D+m8Bm5fYxSAKWsB4Qb3MCxAOYbgH/RQHMFsWMCjWtCHd
         cdMXEaHDJh8PC/yYbtvVN/zph9DikpJ4AhqSsUZe0a9frKZNkEl++lFfuaAuYvEtLQ3w
         Y5sCTlQ2Of5yPiv2NE6v6qXIPAiwKxmGL6t3QQKOscwDIOxUxMwncTljJyOzl2DfPc3V
         8g/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=jMvb1HA4Qb9OGpa6IHl5Cr3nQAS0ueWhq65QMg36H+Y=;
        b=ECvifeybyDrIXlBy0D0BkxDNByrAGkh8zBURf53Jc7Gx/VZCJQfDc0hUS1d1Bpc/KO
         TU6tCmJ1u+imd2rfpv+/QD9x0u0cji5SGfJ22eUloZlOXLRZjtaMn7pWsOnllfkdC5w7
         OO/Vmurngwm2Tq4Iurxyhs0H3KjSzhHVtGPA1A6QF4p25e3y7KkwbEFfEa4hR5a1POnV
         O+uli3c6gGV6zyzTo7KJFf4wiMSYII5CjRhL5YMyPPYfJbitbXgdaOLF+LrNSRN2jtu6
         WOBzcsd7elqV7UftbWLzW8IHsRKafYxgGSYJsbr5Cuv1u4G20XreERfZStRWRQC9Bo4b
         YRyw==
X-Gm-Message-State: AOAM530+NYPVBkH5hW309iQa1ZKel2bs43+a/uObOAqE2XembTs1c5Ml
        TvQwg2+TJK7X8F7ASV3ueurVTcLgxhQ=
X-Google-Smtp-Source: ABdhPJxgqlUCQWaZ/dTT0Wx+nUyAsgZBzuetwWAY4hFIFyyfAZmQY/6OHk6+oCqgklkJZCn08aFvZg==
X-Received: by 2002:a0c:a992:: with SMTP id a18mr191579qvb.10.1630539772574;
        Wed, 01 Sep 2021 16:42:52 -0700 (PDT)
Received: from Arrakis.djogorchock.com (pool-173-68-59-147.nycmny.fios.verizon.net. [173.68.59.147])
        by smtp.gmail.com with ESMTPSA id n5sm13422qtp.35.2021.09.01.16.42.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Sep 2021 16:42:51 -0700 (PDT)
From:   "Daniel J. Ogorchock" <djogorchock@gmail.com>
To:     linux-input@vger.kernel.org
Cc:     thunderbird2k@gmail.com, blaws05@gmail.com,
        benjamin.tissoires@redhat.com, jikos@kernel.org,
        Roderick.Colenbrander@sony.com, svv@google.com, s.jegen@gmail.com,
        carmueller@gmail.com, pgriffais@valvesoftware.com,
        hadess@hadess.net, pobrn@protonmail.com,
        "Daniel J. Ogorchock" <djogorchock@gmail.com>
Subject: [PATCH v15 06/16] HID: nintendo: improve subcommand reliability
Date:   Wed,  1 Sep 2021 19:42:26 -0400
Message-Id: <20210901234236.3113-7-djogorchock@gmail.com>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20210901234236.3113-1-djogorchock@gmail.com>
References: <20210901234236.3113-1-djogorchock@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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
index a05211c48bf47..11f489c40678d 100644
--- a/drivers/hid/hid-nintendo.c
+++ b/drivers/hid/hid-nintendo.c
@@ -377,27 +377,45 @@ static int __joycon_hid_send(struct hid_device *hdev, u8 *data, size_t len)
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
@@ -405,7 +423,7 @@ static int joycon_send_usb(struct joycon_ctlr *ctlr, u8 cmd)
 	buf[1] = cmd;
 	ctlr->usb_ack_match = cmd;
 	ctlr->msg_type = JOYCON_MSG_TYPE_USB;
-	ret = joycon_hid_send_sync(ctlr, buf, sizeof(buf));
+	ret = joycon_hid_send_sync(ctlr, buf, sizeof(buf), timeout);
 	if (ret)
 		hid_dbg(ctlr->hdev, "send usb command failed; ret=%d\n", ret);
 	return ret;
@@ -413,7 +431,7 @@ static int joycon_send_usb(struct joycon_ctlr *ctlr, u8 cmd)
 
 static int joycon_send_subcmd(struct joycon_ctlr *ctlr,
 			      struct joycon_subcmd_request *subcmd,
-			      size_t data_len)
+			      size_t data_len, u32 timeout)
 {
 	int ret;
 	unsigned long flags;
@@ -431,7 +449,7 @@ static int joycon_send_subcmd(struct joycon_ctlr *ctlr,
 	ctlr->msg_type = JOYCON_MSG_TYPE_SUBCMD;
 
 	ret = joycon_hid_send_sync(ctlr, (u8 *)subcmd,
-				   sizeof(*subcmd) + data_len);
+				   sizeof(*subcmd) + data_len, timeout);
 	if (ret < 0)
 		hid_dbg(ctlr->hdev, "send subcommand failed; ret=%d\n", ret);
 	else
@@ -450,7 +468,7 @@ static int joycon_set_player_leds(struct joycon_ctlr *ctlr, u8 flash, u8 on)
 	req->data[0] = (flash << 4) | on;
 
 	hid_dbg(ctlr->hdev, "setting player leds\n");
-	return joycon_send_subcmd(ctlr, req, 1);
+	return joycon_send_subcmd(ctlr, req, 1, HZ/4);
 }
 
 static const u16 DFLT_STICK_CAL_CEN = 2000;
@@ -481,7 +499,7 @@ static int joycon_request_calibration(struct joycon_ctlr *ctlr)
 	data[4] = JC_CAL_DATA_SIZE;
 
 	hid_dbg(ctlr->hdev, "requesting cal data\n");
-	ret = joycon_send_subcmd(ctlr, req, 5);
+	ret = joycon_send_subcmd(ctlr, req, 5, HZ);
 	if (ret) {
 		hid_warn(ctlr->hdev,
 			 "Failed to read stick cal, using defaults; ret=%d\n",
@@ -571,7 +589,7 @@ static int joycon_set_report_mode(struct joycon_ctlr *ctlr)
 	req->data[0] = 0x30; /* standard, full report mode */
 
 	hid_dbg(ctlr->hdev, "setting controller report mode\n");
-	return joycon_send_subcmd(ctlr, req, 1);
+	return joycon_send_subcmd(ctlr, req, 1, HZ);
 }
 
 static int joycon_enable_rumble(struct joycon_ctlr *ctlr)
@@ -584,7 +602,7 @@ static int joycon_enable_rumble(struct joycon_ctlr *ctlr)
 	req->data[0] = 0x01; /* note: 0x00 would disable */
 
 	hid_dbg(ctlr->hdev, "enabling rumble\n");
-	return joycon_send_subcmd(ctlr, req, 1);
+	return joycon_send_subcmd(ctlr, req, 1, HZ/4);
 }
 
 static s32 joycon_map_stick_val(struct joycon_stick_cal *cal, s32 val)
@@ -1088,7 +1106,7 @@ static int joycon_home_led_brightness_set(struct led_classdev *led,
 
 	hid_dbg(hdev, "setting home led brightness\n");
 	mutex_lock(&ctlr->output_mutex);
-	ret = joycon_send_subcmd(ctlr, req, 5);
+	ret = joycon_send_subcmd(ctlr, req, 5, HZ/4);
 	mutex_unlock(&ctlr->output_mutex);
 
 	return ret;
@@ -1381,16 +1399,16 @@ static int nintendo_hid_probe(struct hid_device *hdev,
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
@@ -1399,7 +1417,7 @@ static int nintendo_hid_probe(struct hid_device *hdev,
 		 * Set no timeout (to keep controller in USB mode).
 		 * This doesn't send a response, so ignore the timeout.
 		 */
-		joycon_send_usb(ctlr, JC_USB_CMD_NO_TIMEOUT);
+		joycon_send_usb(ctlr, JC_USB_CMD_NO_TIMEOUT, HZ/10);
 	}
 
 	/* get controller calibration data, and parse it */
-- 
2.33.0

