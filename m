Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 800A818782F
	for <lists+linux-input@lfdr.de>; Tue, 17 Mar 2020 04:30:08 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726248AbgCQDaH (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 16 Mar 2020 23:30:07 -0400
Received: from mail-qv1-f68.google.com ([209.85.219.68]:35092 "EHLO
        mail-qv1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726189AbgCQDaH (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Mon, 16 Mar 2020 23:30:07 -0400
Received: by mail-qv1-f68.google.com with SMTP id q73so719492qvq.2
        for <linux-input@vger.kernel.org>; Mon, 16 Mar 2020 20:30:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=aQVQq6DSGTARUeMfCqttECjVabSNlBbzqiBUKqjGzNQ=;
        b=bewIoH3UfbPUF03ZAHpQ46rjYl1irqOBosmv7lYjzBdTE82f1RWF0C6b+U8CisBF2T
         RKkyX8D8YmFCAsEPFSmFR3d+I4a3thz/Y0O/2UQCHVLhoXeD9a5vNTjc3ZZbsPUvgvr0
         GewVIfXLgcd7KdBvORD6YF/TUpi+l9mrojaWKbGA/mEhTrHTc6BYk3b8bm/qKIHWqhe4
         gZ4dkGZNiRDpOtelx36zZ9fiWpeuT3ACqbc+nnfLqP6gCOLshLsKYV2QC2b6NIsCmUT3
         FfMug9gD40ox0laBDVjbC4GtPOsYucLqTG45K29X1/+ypI5CZthrA7Sp4V7lma4WKoVM
         vN4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=aQVQq6DSGTARUeMfCqttECjVabSNlBbzqiBUKqjGzNQ=;
        b=ljP3/H8mHH8Gq2YAjqF0SjXTE3bb/47tetKSpEkw9ztzAUS556NbyQRDmdin5jz1c0
         /Y8sEz96BB+64oqXDesnmkyENZI+R43o31ifZziPOjU5l8mcXjPQeQgCjHjEqAS46yMd
         tp1jtQ4wGtilcfgsYOFFYWLK7kfkjONpqtAfnKSKYX3CXcclRh6cmTDMkaSK7IPTRjbs
         HlEDxf2N7UEou3H/gO7w04+iU4MI2vA/yCK9PjtZsocM4rkNyGhGaPHxamm1FdzhAohW
         Yrn3t3DlIx2HxcjnrIcOcayoCm8Uw9+XGTBTAItURnbJqeCoS8wE7tP4MYRQab32f/wS
         nwTg==
X-Gm-Message-State: ANhLgQ1wgkVO+Lrrj0SvR+9JrEClM3cUSmAs7k2YzeO656olKCXr+Spf
        NnfokbKZxrKeVlUiNx2uSA0jck71BLw=
X-Google-Smtp-Source: ADFU+vvKsIJu+aLOAlzVz+uOWVwl5V3+DoeASRCrTg2iTFqgetfGKtz5xrMqiIgK6EyEYQV8h7xTOA==
X-Received: by 2002:a0c:ebcc:: with SMTP id k12mr3006970qvq.69.1584415804181;
        Mon, 16 Mar 2020 20:30:04 -0700 (PDT)
Received: from Arrakis.djogorchock.com ([136.33.205.58])
        by smtp.gmail.com with ESMTPSA id t2sm1272264qtp.13.2020.03.16.20.30.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Mar 2020 20:30:03 -0700 (PDT)
From:   "Daniel J. Ogorchock" <djogorchock@gmail.com>
To:     linux-input@vger.kernel.org
Cc:     thunderbird2k@gmail.com, blaws05@gmail.com,
        benjamin.tissoires@redhat.com, jikos@kernel.org,
        Roderick.Colenbrander@sony.com, svv@google.com, s.jegen@gmail.com,
        carmueller@gmail.com, "Daniel J. Ogorchock" <djogorchock@gmail.com>
Subject: [PATCH v11 06/11] HID: nintendo: improve subcommand reliability
Date:   Mon, 16 Mar 2020 22:29:23 -0500
Message-Id: <20200317032928.546172-7-djogorchock@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200317032928.546172-1-djogorchock@gmail.com>
References: <20200317032928.546172-1-djogorchock@gmail.com>
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
index 50242a0b6296..2421ce10f234 100644
--- a/drivers/hid/hid-nintendo.c
+++ b/drivers/hid/hid-nintendo.c
@@ -370,27 +370,45 @@ static int __joycon_hid_send(struct hid_device *hdev, u8 *data, size_t len)
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
@@ -398,7 +416,7 @@ static int joycon_send_usb(struct joycon_ctlr *ctlr, u8 cmd)
 	buf[1] = cmd;
 	ctlr->usb_ack_match = cmd;
 	ctlr->msg_type = JOYCON_MSG_TYPE_USB;
-	ret = joycon_hid_send_sync(ctlr, buf, sizeof(buf));
+	ret = joycon_hid_send_sync(ctlr, buf, sizeof(buf), timeout);
 	if (ret)
 		hid_dbg(ctlr->hdev, "send usb command failed; ret=%d\n", ret);
 	return ret;
@@ -406,7 +424,7 @@ static int joycon_send_usb(struct joycon_ctlr *ctlr, u8 cmd)
 
 static int joycon_send_subcmd(struct joycon_ctlr *ctlr,
 			      struct joycon_subcmd_request *subcmd,
-			      size_t data_len)
+			      size_t data_len, u32 timeout)
 {
 	int ret;
 	unsigned long flags;
@@ -424,7 +442,7 @@ static int joycon_send_subcmd(struct joycon_ctlr *ctlr,
 	ctlr->msg_type = JOYCON_MSG_TYPE_SUBCMD;
 
 	ret = joycon_hid_send_sync(ctlr, (u8 *)subcmd,
-				   sizeof(*subcmd) + data_len);
+				   sizeof(*subcmd) + data_len, timeout);
 	if (ret < 0)
 		hid_dbg(ctlr->hdev, "send subcommand failed; ret=%d\n", ret);
 	else
@@ -443,7 +461,7 @@ static int joycon_set_player_leds(struct joycon_ctlr *ctlr, u8 flash, u8 on)
 	req->data[0] = (flash << 4) | on;
 
 	hid_dbg(ctlr->hdev, "setting player leds\n");
-	return joycon_send_subcmd(ctlr, req, 1);
+	return joycon_send_subcmd(ctlr, req, 1, HZ/4);
 }
 
 static const u16 DFLT_STICK_CAL_CEN = 2000;
@@ -474,7 +492,7 @@ static int joycon_request_calibration(struct joycon_ctlr *ctlr)
 	data[4] = JC_CAL_DATA_SIZE;
 
 	hid_dbg(ctlr->hdev, "requesting cal data\n");
-	ret = joycon_send_subcmd(ctlr, req, 5);
+	ret = joycon_send_subcmd(ctlr, req, 5, HZ);
 	if (ret) {
 		hid_warn(ctlr->hdev,
 			 "Failed to read stick cal, using defaults; ret=%d\n",
@@ -564,7 +582,7 @@ static int joycon_set_report_mode(struct joycon_ctlr *ctlr)
 	req->data[0] = 0x30; /* standard, full report mode */
 
 	hid_dbg(ctlr->hdev, "setting controller report mode\n");
-	return joycon_send_subcmd(ctlr, req, 1);
+	return joycon_send_subcmd(ctlr, req, 1, HZ);
 }
 
 static int joycon_enable_rumble(struct joycon_ctlr *ctlr, bool enable)
@@ -577,7 +595,7 @@ static int joycon_enable_rumble(struct joycon_ctlr *ctlr, bool enable)
 	req->data[0] = enable ? 0x01 : 0x00;
 
 	hid_dbg(ctlr->hdev, "%s rumble\n", enable ? "enabling" : "disabling");
-	return joycon_send_subcmd(ctlr, req, 1);
+	return joycon_send_subcmd(ctlr, req, 1, HZ/4);
 }
 
 static s32 joycon_map_stick_val(struct joycon_stick_cal *cal, s32 val)
@@ -1081,7 +1099,7 @@ static int joycon_home_led_brightness_set(struct led_classdev *led,
 
 	hid_dbg(hdev, "setting home led brightness\n");
 	mutex_lock(&ctlr->output_mutex);
-	ret = joycon_send_subcmd(ctlr, req, 5);
+	ret = joycon_send_subcmd(ctlr, req, 5, HZ/4);
 	mutex_unlock(&ctlr->output_mutex);
 
 	return ret;
@@ -1377,16 +1395,16 @@ static int nintendo_hid_probe(struct hid_device *hdev,
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
@@ -1395,7 +1413,7 @@ static int nintendo_hid_probe(struct hid_device *hdev,
 		 * Set no timeout (to keep controller in USB mode).
 		 * This doesn't send a response, so ignore the timeout.
 		 */
-		joycon_send_usb(ctlr, JC_USB_CMD_NO_TIMEOUT);
+		joycon_send_usb(ctlr, JC_USB_CMD_NO_TIMEOUT, HZ/10);
 	}
 
 	/* get controller calibration data, and parse it */
-- 
2.25.1

