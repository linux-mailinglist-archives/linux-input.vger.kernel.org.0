Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7110A68A4F1
	for <lists+linux-input@lfdr.de>; Fri,  3 Feb 2023 22:51:53 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233822AbjBCVvw (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Fri, 3 Feb 2023 16:51:52 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49592 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233817AbjBCVvv (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Fri, 3 Feb 2023 16:51:51 -0500
Received: from mail-qt1-x830.google.com (mail-qt1-x830.google.com [IPv6:2607:f8b0:4864:20::830])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 695FEA58ED
        for <linux-input@vger.kernel.org>; Fri,  3 Feb 2023 13:51:29 -0800 (PST)
Received: by mail-qt1-x830.google.com with SMTP id v17so7149691qto.3
        for <linux-input@vger.kernel.org>; Fri, 03 Feb 2023 13:51:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gyzeDLExfIbsxff9QObmtNG4lfZckN3yKuHNHqYzaj4=;
        b=jzLkC6PNT9EC2hINdAfPc9DBtF067lkcwjr5vEJGbBIBazS/lbGid52ycLrWOrCHS2
         ueLiPxhmtbsAe5LpMexLIlEeVwYEQh58D4Mcm1khz6Rn7rZnP80vnre4uM4pijkc9weN
         gTrafgSXHv52/A+Xdib+LIA9H3cmYRoO1t6YkXf/Qij7qWG8+0ihsrlKOZVuyADuZPQj
         2XYY4gE99w8cF2JVFOZ49k7J13QVhxXTP/kbXxB4KNy0Mw0SP+wLsQfZ+7WfJfsCi4Rz
         BUTryEopv6ABewE8pUYn0L8BTARExDtBvImDuTh+Lxf/bKBahmoVabvl/pNs764VnrED
         Xe/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=gyzeDLExfIbsxff9QObmtNG4lfZckN3yKuHNHqYzaj4=;
        b=ln0NFN37ilBVSRDUhHxVvBUM+QMESd30ySEbEg1mNdlYQYXV8IflLMvTn/ug4KwkA8
         kkvGIRumy3w23vf696mPmDtyelDQ9bMFIE+IPZWTAQaUpvageee19fKGKKsZYI0fMayD
         4fErfT6uraLielKXKD45lBotQFXhmv5o5/EZ7pevr9wx4Px42t4QzSuUSrITU7uAVwXR
         7vk6zoXn7WWTEcFX4yFZut8pWfaWHK5qE/HTPAIyp2LdY8BKZyWdsfnP6OHWNlUpDMaM
         gyL/2piJSJbN5p9oymItaeu4QTxffp2z6A6vBiKua/vB+6gpdzEzMETUL/PaMjCSUnU+
         ZF4A==
X-Gm-Message-State: AO0yUKUfY4f+C0+pUSFg4XrikVQaXE4iCXK/WIJtoBlHsnhPKRj1ZST9
        vQVe+byTeYw5D1SyzlgtJlaA8n2ZZ7w=
X-Google-Smtp-Source: AK7set8Js130Rn2+P6BmRZKzm32p2kB9ZmfgHLYxZYHMHnb9aXhlHc2DFJuIqUg6rlXqXR/67Cor/w==
X-Received: by 2002:ac8:7fc3:0:b0:3b8:6a5f:9918 with SMTP id b3-20020ac87fc3000000b003b86a5f9918mr22052721qtk.63.1675461087798;
        Fri, 03 Feb 2023 13:51:27 -0800 (PST)
Received: from Arrakis.djogorchock.com (pool-173-68-97-122.nycmny.fios.verizon.net. [173.68.97.122])
        by smtp.gmail.com with ESMTPSA id r10-20020ac83b4a000000b003b9bcd88f7dsm2277408qtf.43.2023.02.03.13.51.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Feb 2023 13:51:26 -0800 (PST)
From:   "Daniel J. Ogorchock" <djogorchock@gmail.com>
To:     linux-input@vger.kernel.org
Cc:     jikos@kernel.org, benjamin.tissoires@redhat.com,
        Roderick.Colenbrander@sony.com,
        "Daniel J. Ogorchock" <djogorchock@gmail.com>
Subject: [PATCH v0 2/2] HID: nintendo: fix rumble rate limiter
Date:   Fri,  3 Feb 2023 16:51:18 -0500
Message-Id: <20230203215119.435091-3-djogorchock@gmail.com>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230203215119.435091-1-djogorchock@gmail.com>
References: <20230203215119.435091-1-djogorchock@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

It's been discovered that BT controller disconnect events correlate to
erratic input report timestamp deltas.

In experimentation, it's been found that ensuring that multiple
timestamp deltas are consistent prior to transmitting a rumble packet
drastically reduces the occurence rate of BT disconnects.

Alter the joycon_enforce_subcmd_rate() function to use this new
approach.

Signed-off-by: Daniel J. Ogorchock <djogorchock@gmail.com>
---
 drivers/hid/hid-nintendo.c | 75 +++++++++++++++++++++++++++++++++++---
 1 file changed, 69 insertions(+), 6 deletions(-)

diff --git a/drivers/hid/hid-nintendo.c b/drivers/hid/hid-nintendo.c
index 2b781cc9082b4..250f5d2f888ab 100644
--- a/drivers/hid/hid-nintendo.c
+++ b/drivers/hid/hid-nintendo.c
@@ -433,7 +433,9 @@ struct joycon_ctlr {
 	u8 usb_ack_match;
 	u8 subcmd_ack_match;
 	bool received_input_report;
+	unsigned int last_input_report_msecs;
 	unsigned int last_subcmd_sent_msecs;
+	unsigned int consecutive_valid_report_deltas;
 
 	/* factory calibration data */
 	struct joycon_stick_cal left_stick_cal_x;
@@ -543,19 +545,54 @@ static void joycon_wait_for_input_report(struct joycon_ctlr *ctlr)
  * Sending subcommands and/or rumble data at too high a rate can cause bluetooth
  * controller disconnections.
  */
+#define JC_INPUT_REPORT_MIN_DELTA	8
+#define JC_INPUT_REPORT_MAX_DELTA	17
+#define JC_SUBCMD_TX_OFFSET_MS		4
+#define JC_SUBCMD_VALID_DELTA_REQ	3
+#define JC_SUBCMD_RATE_MAX_ATTEMPTS	500
+#define JC_SUBCMD_RATE_LIMITER_USB_MS	20
+#define JC_SUBCMD_RATE_LIMITER_BT_MS	60
+#define JC_SUBCMD_RATE_LIMITER_MS(ctlr)	((ctlr)->hdev->bus == BUS_USB ? JC_SUBCMD_RATE_LIMITER_USB_MS : JC_SUBCMD_RATE_LIMITER_BT_MS)
 static void joycon_enforce_subcmd_rate(struct joycon_ctlr *ctlr)
 {
-	static const unsigned int max_subcmd_rate_ms = 25;
-	unsigned int current_ms = jiffies_to_msecs(jiffies);
-	unsigned int delta_ms = current_ms - ctlr->last_subcmd_sent_msecs;
+	unsigned int current_ms;
+	unsigned long subcmd_delta;
+	int consecutive_valid_deltas = 0;
+	int attempts = 0;
+	unsigned long flags;
+
+	if (unlikely(ctlr->ctlr_state != JOYCON_CTLR_STATE_READ))
+		return;
 
-	while (delta_ms < max_subcmd_rate_ms &&
-	       ctlr->ctlr_state == JOYCON_CTLR_STATE_READ) {
+	do {
 		joycon_wait_for_input_report(ctlr);
 		current_ms = jiffies_to_msecs(jiffies);
-		delta_ms = current_ms - ctlr->last_subcmd_sent_msecs;
+		subcmd_delta = current_ms - ctlr->last_subcmd_sent_msecs;
+
+		spin_lock_irqsave(&ctlr->lock, flags);
+		consecutive_valid_deltas = ctlr->consecutive_valid_report_deltas;
+		spin_unlock_irqrestore(&ctlr->lock, flags);
+
+		attempts++;
+	} while ((consecutive_valid_deltas < JC_SUBCMD_VALID_DELTA_REQ ||
+		  subcmd_delta < JC_SUBCMD_RATE_LIMITER_MS(ctlr)) &&
+		 ctlr->ctlr_state == JOYCON_CTLR_STATE_READ &&
+		 attempts < JC_SUBCMD_RATE_MAX_ATTEMPTS);
+
+	if (attempts >= JC_SUBCMD_RATE_MAX_ATTEMPTS) {
+		hid_warn(ctlr->hdev, "%s: exceeded max attempts", __func__);
+		return;
 	}
+
 	ctlr->last_subcmd_sent_msecs = current_ms;
+
+	/*
+	 * Wait a short time after receiving an input report before
+	 * transmitting. This should reduce odds of a TX coinciding with an RX.
+	 * Minimizing concurrent BT traffic with the controller seems to lower
+	 * the rate of disconnections.
+	 */
+	msleep(JC_SUBCMD_TX_OFFSET_MS);
 }
 
 static int joycon_hid_send_sync(struct joycon_ctlr *ctlr, u8 *data, size_t len,
@@ -1223,6 +1260,7 @@ static void joycon_parse_report(struct joycon_ctlr *ctlr,
 	u8 tmp;
 	u32 btns;
 	unsigned long msecs = jiffies_to_msecs(jiffies);
+	unsigned long report_delta_ms = msecs - ctlr->last_input_report_msecs;
 
 	spin_lock_irqsave(&ctlr->lock, flags);
 	if (IS_ENABLED(CONFIG_NINTENDO_FF) && rep->vibrator_report &&
@@ -1364,6 +1402,31 @@ static void joycon_parse_report(struct joycon_ctlr *ctlr,
 
 	input_sync(dev);
 
+	spin_lock_irqsave(&ctlr->lock, flags);
+	ctlr->last_input_report_msecs = msecs;
+	/*
+	 * Was this input report a reasonable time delta compared to the prior
+	 * report? We use this information to decide when a safe time is to send
+	 * rumble packets or subcommand packets.
+	 */
+	if (report_delta_ms >= JC_INPUT_REPORT_MIN_DELTA &&
+	    report_delta_ms <= JC_INPUT_REPORT_MAX_DELTA) {
+		if (ctlr->consecutive_valid_report_deltas < JC_SUBCMD_VALID_DELTA_REQ)
+			ctlr->consecutive_valid_report_deltas++;
+	} else {
+		ctlr->consecutive_valid_report_deltas = 0;
+	}
+	/*
+	 * Our consecutive valid report tracking is only relevant for
+	 * bluetooth-connected controllers. For USB devices, we're beholden to
+	 * USB's underlying polling rate anyway. Always set to the consecutive
+	 * delta requirement.
+	 */
+	if (ctlr->hdev->bus == BUS_USB)
+		ctlr->consecutive_valid_report_deltas = JC_SUBCMD_VALID_DELTA_REQ;
+
+	spin_unlock_irqrestore(&ctlr->lock, flags);
+
 	/*
 	 * Immediately after receiving a report is the most reliable time to
 	 * send a subcommand to the controller. Wake any subcommand senders
-- 
2.39.1

