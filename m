Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2B9963FE675
	for <lists+linux-input@lfdr.de>; Thu,  2 Sep 2021 02:34:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240259AbhIAXoC (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 1 Sep 2021 19:44:02 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45730 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240154AbhIAXoB (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Wed, 1 Sep 2021 19:44:01 -0400
Received: from mail-qt1-x831.google.com (mail-qt1-x831.google.com [IPv6:2607:f8b0:4864:20::831])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DE126C061575
        for <linux-input@vger.kernel.org>; Wed,  1 Sep 2021 16:43:03 -0700 (PDT)
Received: by mail-qt1-x831.google.com with SMTP id x5so44533qtq.13
        for <linux-input@vger.kernel.org>; Wed, 01 Sep 2021 16:43:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=Kt3HE+9REXxtcXIWO419ERw+Nald967yyQrwnW18nkI=;
        b=WroPmUo2dygI6eX2p5k0LOAsXM/YmYtHZVrZzzgV4eCVolvMiodKyYgf8vPEwE8j2I
         riV0Z8KSmtkGFYDB5yIHiHv339T9AYqYUj6TdNb8n5kDZKQPSsG2U20xM4boLunOKaMI
         5uiJqvQxEGdGS2SkJHUU2H6XXfRsI5BMLh0Ju+zWk2uxiADZ0AsWoyNy8AEaXwbzcndH
         VdDV0rRrgRAB64XBI7SF8esINqzCbaueC8znCq6GF2kdJaEO3Id8XmLHPRkvsKvdx3s7
         VH3jc0wMufcfjC5tNMFLGf0ygUIFccXpCIydwKdLE9lZg4JdrhEO0tH1Pt8+unaptx6z
         D29A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=Kt3HE+9REXxtcXIWO419ERw+Nald967yyQrwnW18nkI=;
        b=c0VwSPCGJNbU0VIh38XN6wyFNhRYATVesf3IqqJhb8jrIgtG8UJ8tOAPneV8RRj6Bp
         dpTuxqlO4W+jaSms03cugB4PeuKhVMjhdi0DD7EV1BxcH2iraZPZmgmNbDd45YJtJwrw
         p2ToOIZ/YTByuOqo4kVSkCXAmTYyK8/hztxbex8ZEgrLIn0yK3rQca44cWVumoxFdT0F
         BxoX8+sywyJp2yWwJIVMNUEi6Tg9uU6qfUYRR322IiGaRhwqfO26caQzqGElu7eNk38J
         lR+1xZWhvURx2mn2NDB/seaYaH7LLrwXJd3edKo/g8VsKIKWE1xECFDJzRaUubUfIgQv
         2Oog==
X-Gm-Message-State: AOAM530b26mCYzArDfPxxYQrjrTAHoIxXmKIPBWgMsdNQ0s99hGJ6PGU
        XfY4gQu/VGPVWq8l3DbihimRhklq4Og=
X-Google-Smtp-Source: ABdhPJw3RbRtLYU5WqREfn5a5F7sdc7HakokfyJqJK1hyKZh+lGCDtWWMJbef+qL5XYneIzc+7AZxA==
X-Received: by 2002:a05:622a:1451:: with SMTP id v17mr336461qtx.83.1630539782996;
        Wed, 01 Sep 2021 16:43:02 -0700 (PDT)
Received: from Arrakis.djogorchock.com (pool-173-68-59-147.nycmny.fios.verizon.net. [173.68.59.147])
        by smtp.gmail.com with ESMTPSA id n5sm13422qtp.35.2021.09.01.16.43.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Sep 2021 16:43:02 -0700 (PDT)
From:   "Daniel J. Ogorchock" <djogorchock@gmail.com>
To:     linux-input@vger.kernel.org
Cc:     thunderbird2k@gmail.com, blaws05@gmail.com,
        benjamin.tissoires@redhat.com, jikos@kernel.org,
        Roderick.Colenbrander@sony.com, svv@google.com, s.jegen@gmail.com,
        carmueller@gmail.com, pgriffais@valvesoftware.com,
        hadess@hadess.net, pobrn@protonmail.com,
        "Daniel J. Ogorchock" <djogorchock@gmail.com>
Subject: [PATCH v15 15/16] HID: nintendo: ratelimit subcommands and rumble
Date:   Wed,  1 Sep 2021 19:42:35 -0400
Message-Id: <20210901234236.3113-16-djogorchock@gmail.com>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20210901234236.3113-1-djogorchock@gmail.com>
References: <20210901234236.3113-1-djogorchock@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

It has been found that sending subcommands and rumble data packets at
too great a rate can result in controller disconnects. This patch limits
the rate of subcommands/rumble to once every 25 milliseconds.

Similar to sending subcommands, it is more reliable to send the rumble
data packets immediately after we've received an input report from the
controller. This results in far fewer bluetooth disconnects for the
controller.

Signed-off-by: Daniel J. Ogorchock <djogorchock@gmail.com>
---
 drivers/hid/hid-nintendo.c | 69 +++++++++++++++++++++++++++-----------
 1 file changed, 49 insertions(+), 20 deletions(-)

diff --git a/drivers/hid/hid-nintendo.c b/drivers/hid/hid-nintendo.c
index 9376f20baab00..2281806b5167f 100644
--- a/drivers/hid/hid-nintendo.c
+++ b/drivers/hid/hid-nintendo.c
@@ -2,7 +2,7 @@
 /*
  * HID driver for Nintendo Switch Joy-Cons and Pro Controllers
  *
- * Copyright (c) 2019-2020 Daniel J. Ogorchock <djogorchock@gmail.com>
+ * Copyright (c) 2019-2021 Daniel J. Ogorchock <djogorchock@gmail.com>
  *
  * The following resources/projects were referenced for this driver:
  *   https://github.com/dekuNukem/Nintendo_Switch_Reverse_Engineering
@@ -431,6 +431,7 @@ struct joycon_ctlr {
 	u8 usb_ack_match;
 	u8 subcmd_ack_match;
 	bool received_input_report;
+	unsigned int last_subcmd_sent_msecs;
 
 	/* factory calibration data */
 	struct joycon_stick_cal left_stick_cal_x;
@@ -510,6 +511,50 @@ static int __joycon_hid_send(struct hid_device *hdev, u8 *data, size_t len)
 	return ret;
 }
 
+static void joycon_wait_for_input_report(struct joycon_ctlr *ctlr)
+{
+	int ret;
+
+	/*
+	 * If we are in the proper reporting mode, wait for an input
+	 * report prior to sending the subcommand. This improves
+	 * reliability considerably.
+	 */
+	if (ctlr->ctlr_state == JOYCON_CTLR_STATE_READ) {
+		unsigned long flags;
+
+		spin_lock_irqsave(&ctlr->lock, flags);
+		ctlr->received_input_report = false;
+		spin_unlock_irqrestore(&ctlr->lock, flags);
+		ret = wait_event_timeout(ctlr->wait,
+					 ctlr->received_input_report,
+					 HZ / 4);
+		/* We will still proceed, even with a timeout here */
+		if (!ret)
+			hid_warn(ctlr->hdev,
+				 "timeout waiting for input report\n");
+	}
+}
+
+/*
+ * Sending subcommands and/or rumble data at too high a rate can cause bluetooth
+ * controller disconnections.
+ */
+static void joycon_enforce_subcmd_rate(struct joycon_ctlr *ctlr)
+{
+	static const unsigned int max_subcmd_rate_ms = 25;
+	unsigned int current_ms = jiffies_to_msecs(jiffies);
+	unsigned int delta_ms = current_ms - ctlr->last_subcmd_sent_msecs;
+
+	while (delta_ms < max_subcmd_rate_ms &&
+	       ctlr->ctlr_state == JOYCON_CTLR_STATE_READ) {
+		joycon_wait_for_input_report(ctlr);
+		current_ms = jiffies_to_msecs(jiffies);
+		delta_ms = current_ms - ctlr->last_subcmd_sent_msecs;
+	}
+	ctlr->last_subcmd_sent_msecs = current_ms;
+}
+
 static int joycon_hid_send_sync(struct joycon_ctlr *ctlr, u8 *data, size_t len,
 				u32 timeout)
 {
@@ -521,25 +566,7 @@ static int joycon_hid_send_sync(struct joycon_ctlr *ctlr, u8 *data, size_t len,
 	 * doing one retry after a timeout appears to always work.
 	 */
 	while (tries--) {
-		/*
-		 * If we are in the proper reporting mode, wait for an input
-		 * report prior to sending the subcommand. This improves
-		 * reliability considerably.
-		 */
-		if (ctlr->ctlr_state == JOYCON_CTLR_STATE_READ) {
-			unsigned long flags;
-
-			spin_lock_irqsave(&ctlr->lock, flags);
-			ctlr->received_input_report = false;
-			spin_unlock_irqrestore(&ctlr->lock, flags);
-			ret = wait_event_timeout(ctlr->wait,
-						 ctlr->received_input_report,
-						 HZ / 4);
-			/* We will still proceed, even with a timeout here */
-			if (!ret)
-				hid_warn(ctlr->hdev,
-					 "timeout waiting for input report\n");
-		}
+		joycon_enforce_subcmd_rate(ctlr);
 
 		ret = __joycon_hid_send(ctlr->hdev, data, len);
 		if (ret < 0) {
@@ -1359,6 +1386,8 @@ static int joycon_send_rumble_data(struct joycon_ctlr *ctlr)
 	if (++ctlr->subcmd_num > 0xF)
 		ctlr->subcmd_num = 0;
 
+	joycon_enforce_subcmd_rate(ctlr);
+
 	ret = __joycon_hid_send(ctlr->hdev, (u8 *)&rumble_output,
 				sizeof(rumble_output));
 	return ret;
-- 
2.33.0

