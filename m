Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B17D438B9A1
	for <lists+linux-input@lfdr.de>; Fri, 21 May 2021 00:47:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231873AbhETWs5 (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 20 May 2021 18:48:57 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55782 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231861AbhETWs5 (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Thu, 20 May 2021 18:48:57 -0400
Received: from mail-qk1-x72c.google.com (mail-qk1-x72c.google.com [IPv6:2607:f8b0:4864:20::72c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7ECF1C061761
        for <linux-input@vger.kernel.org>; Thu, 20 May 2021 15:47:35 -0700 (PDT)
Received: by mail-qk1-x72c.google.com with SMTP id k4so6852816qkd.0
        for <linux-input@vger.kernel.org>; Thu, 20 May 2021 15:47:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=wi0b8e1Qbmaf9olg3RUDdmwTRlycPyRfgxs2W03I7Vw=;
        b=cUyB/AKhry3rimF8rfIDmDQwAQLw1pmQ1C8FeBT+zlCN2+VwR69610D3jR26HUppOb
         0WmSbRuQhRJ2Qk7hUhxnHvLClPzHlxL/9OcoohLz4gkHOJMP9musl8+ctmWwuNZticKD
         HmKajSkZAdg/BeQIy0e5bEcm6PhbO1gc0vcFtej/HORFKc5K+4P+zV5YSJBLIDdBdju4
         dm8k0HckDa/1EyhkQ8mCL+Ehwi2qtvQgFAzhreqx93DCtmgcuDL2DVvjVnTmT9fjQy8W
         Bz4oDwhs5u+HAZ+wByiKRlAvxZgMU2HQ+d9I3B2/zes/qVVnpeWRCLJ77U3z7FNSebDu
         vTKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=wi0b8e1Qbmaf9olg3RUDdmwTRlycPyRfgxs2W03I7Vw=;
        b=tXPZ0SzoCroiDotWUnBlAIYbf84hoUdPvaBAYEivoQfDJsAsB4AmHIt+moxfIG8lV/
         s8cwLVrf2N5Quyxup5ncpXKRvRgVlmk+eJ0ywmFGZcWxSyRPEsTC894ShHR3I9136vPk
         +PMI54aameqkP6bEEspC2vN+KIYxKvL04zXmOoCZIbL+LYRAvpuMVfd31ToAVR31NyHs
         eP0AR+1wx1kSnG3fAN4EjQq4yV3dfXty/bnSSy9oYND53BGpg9iMYvc/l5yiGcCY+Cv7
         bkCkX5feSlJB2PS9CQJOgfPB9ARKoVO3Dfm065KSvo8urrzeZkEyJ0vgx+B33JVY9oiY
         KvvA==
X-Gm-Message-State: AOAM531hGLX+xB+XfexVvVfqxuGmDHaN3UFxH0nQJqLsRG9e2hXPf/Mq
        7Y1UMwtZwvXD+dReBYOH7rL/FBOMCLvIJA==
X-Google-Smtp-Source: ABdhPJymAaGwWcLM83SJAtMXlxxUTQ4QqDbZsVntusEtKeOmwyu5Ad9R7adevTRUQ+TGW6bCMOIXfg==
X-Received: by 2002:a05:620a:2149:: with SMTP id m9mr8500540qkm.284.1621550854506;
        Thu, 20 May 2021 15:47:34 -0700 (PDT)
Received: from Arrakis.djogorchock.com (pool-173-68-68-24.nycmny.fios.verizon.net. [173.68.68.24])
        by smtp.gmail.com with ESMTPSA id s11sm2126251qtn.77.2021.05.20.15.47.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 May 2021 15:47:33 -0700 (PDT)
From:   "Daniel J. Ogorchock" <djogorchock@gmail.com>
To:     linux-input@vger.kernel.org
Cc:     thunderbird2k@gmail.com, blaws05@gmail.com,
        benjamin.tissoires@redhat.com, jikos@kernel.org,
        Roderick.Colenbrander@sony.com, svv@google.com, s.jegen@gmail.com,
        carmueller@gmail.com, pgriffais@valvesoftware.com,
        hadess@hadess.net, "Daniel J. Ogorchock" <djogorchock@gmail.com>
Subject: [PATCH v13 06/15] HID: nintendo: improve subcommand reliability
Date:   Thu, 20 May 2021 18:47:06 -0400
Message-Id: <20210520224715.680919-7-djogorchock@gmail.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210520224715.680919-1-djogorchock@gmail.com>
References: <20210520224715.680919-1-djogorchock@gmail.com>
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
index 7236ec301de9e..f475d7f3f63f0 100644
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
 
 static int joycon_enable_rumble(struct joycon_ctlr *ctlr)
@@ -577,7 +595,7 @@ static int joycon_enable_rumble(struct joycon_ctlr *ctlr)
 	req->data[0] = 0x01; /* note: 0x00 would disable */
 
 	hid_dbg(ctlr->hdev, "enabling rumble\n");
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
@@ -1376,16 +1394,16 @@ static int nintendo_hid_probe(struct hid_device *hdev,
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
@@ -1394,7 +1412,7 @@ static int nintendo_hid_probe(struct hid_device *hdev,
 		 * Set no timeout (to keep controller in USB mode).
 		 * This doesn't send a response, so ignore the timeout.
 		 */
-		joycon_send_usb(ctlr, JC_USB_CMD_NO_TIMEOUT);
+		joycon_send_usb(ctlr, JC_USB_CMD_NO_TIMEOUT, HZ/10);
 	}
 
 	/* get controller calibration data, and parse it */
-- 
2.31.1

