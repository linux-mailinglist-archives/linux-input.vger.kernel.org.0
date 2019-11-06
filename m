Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D9AB2F0EB8
	for <lists+linux-input@lfdr.de>; Wed,  6 Nov 2019 07:07:05 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726129AbfKFGHF (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 6 Nov 2019 01:07:05 -0500
Received: from mail-yw1-f67.google.com ([209.85.161.67]:32969 "EHLO
        mail-yw1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729966AbfKFGHF (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Wed, 6 Nov 2019 01:07:05 -0500
Received: by mail-yw1-f67.google.com with SMTP id q140so3997745ywg.0
        for <linux-input@vger.kernel.org>; Tue, 05 Nov 2019 22:07:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=VwgkrQc2MBNZEL6w6XYbE0uQdjbohGCU3eWkXwbPbsY=;
        b=c0VtaimFoQIOCZvhcpnNhsAkXrC5PUbKkRSP9f25NwIfGVbCu1sdVecd+P/2eTQ5Q+
         s9JBSgZuL8Hg9cmc5ek91sm8w16CExp4pGheRzUbPcHjQINJTfasAbYajWXsPJ+ZFsxE
         otYRFkNdIzCK4JsEnuxIyWptZDK2vNklcpGQhoIy6hg8ZJPYpMtEGJC6rnUeIyE5fi4H
         JVYQiNA+6ie3FzEvlm0DvJsBeWWXygQHYCU0JmavAz8MCmPFQ8PLoJgQ8Ek4Ablf542b
         yFRW1GAatDqpAJjFsBeGyrRjl/PIyZW6cm1diA3FR7/SpA7CO04/62WoyV/Yspptw3B1
         fJOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=VwgkrQc2MBNZEL6w6XYbE0uQdjbohGCU3eWkXwbPbsY=;
        b=MNXp4jSVOKTECgV8Q2grz9P33egTMDHR0UiCxMdFs/+YYuR8QtxMLLOxT8HZvYY+SR
         jDOlSCsySRMFPWiyoyzQk+b9t1aLe5o8wPfcaYyO0olv3rtnr/d1XKT4w+yFmvwNyx7R
         1+j4QcSO6Ki490h/hLieIcms+xsV2zOKUrqAurYxcfhidRwPuWuj+cUD17eOCoo8AH4x
         GrCZbBWMzFIOr/tNJFsP2pELvZDSnIPRohNk/ZCTjn6qmQhtPfLNhAKPRX7cFKuJjybP
         Q4STi1CPromR42C/Bu24xkBADDPLiS1ABM0otLYoAlsliHoxZmND57DVIKAgpjSZ+Ugr
         UQ+w==
X-Gm-Message-State: APjAAAWt/eJ3V6vXrUQuJRemabz/+FqByRSyNkiv3D/Bm0l9DL3Y8A6o
        ns7+Tv/Q38qaeQa4nZXtD8x+N7/BPQtJsA==
X-Google-Smtp-Source: APXvYqyCrw7/k3ZGVUtXrVnVTg2InXsLCrONvtFnz1ESAMSGLhQELagLMCzProXqvK7/FDuV67A8hA==
X-Received: by 2002:a81:1b49:: with SMTP id b70mr453457ywb.124.1573020424045;
        Tue, 05 Nov 2019 22:07:04 -0800 (PST)
Received: from Arrakis.djogorchock.com ([136.33.205.58])
        by smtp.gmail.com with ESMTPSA id e82sm11039596ywb.87.2019.11.05.22.07.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 Nov 2019 22:07:03 -0800 (PST)
From:   "Daniel J. Ogorchock" <djogorchock@gmail.com>
To:     linux-input@vger.kernel.org
Cc:     thunderbird2k@gmail.com, blaws05@gmail.com,
        benjamin.tissoires@redhat.com, jikos@kernel.org,
        Roderick.Colenbrander@sony.com, svv@google.com, s.jegen@gmail.com,
        "Daniel J. Ogorchock" <djogorchock@gmail.com>
Subject: [PATCH v9 06/10] HID: nintendo: improve subcommand reliability
Date:   Wed,  6 Nov 2019 00:06:44 -0600
Message-Id: <20191106060648.3018478-7-djogorchock@gmail.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20191106060648.3018478-1-djogorchock@gmail.com>
References: <20191106060648.3018478-1-djogorchock@gmail.com>
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
index ec632a4b9785..8bd49f3a67ab 100644
--- a/drivers/hid/hid-nintendo.c
+++ b/drivers/hid/hid-nintendo.c
@@ -365,24 +365,42 @@ static int __joycon_hid_send(struct hid_device *hdev, u8 *data, size_t len)
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
@@ -393,7 +411,7 @@ static int joycon_send_usb(struct joycon_ctlr *ctlr, u8 cmd)
 	buf[1] = cmd;
 	ctlr->usb_ack_match = cmd;
 	ctlr->msg_type = JOYCON_MSG_TYPE_USB;
-	ret = joycon_hid_send_sync(ctlr, buf, sizeof(buf));
+	ret = joycon_hid_send_sync(ctlr, buf, sizeof(buf), HZ);
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
@@ -1014,7 +1032,7 @@ static int joycon_home_led_brightness_set(struct led_classdev *led,
 
 	hid_dbg(hdev, "setting home led brightness\n");
 	mutex_lock(&ctlr->output_mutex);
-	ret = joycon_send_subcmd(ctlr, req, 5);
+	ret = joycon_send_subcmd(ctlr, req, 5, HZ/4);
 	mutex_unlock(&ctlr->output_mutex);
 
 	return ret;
-- 
2.23.0

