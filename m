Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3995A3FE665
	for <lists+linux-input@lfdr.de>; Thu,  2 Sep 2021 02:34:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237711AbhIAXnw (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 1 Sep 2021 19:43:52 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45674 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232479AbhIAXnv (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Wed, 1 Sep 2021 19:43:51 -0400
Received: from mail-qt1-x82d.google.com (mail-qt1-x82d.google.com [IPv6:2607:f8b0:4864:20::82d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 80E7DC061575
        for <linux-input@vger.kernel.org>; Wed,  1 Sep 2021 16:42:54 -0700 (PDT)
Received: by mail-qt1-x82d.google.com with SMTP id g11so64604qtk.5
        for <linux-input@vger.kernel.org>; Wed, 01 Sep 2021 16:42:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=icOlhqTrU/cuumG7vjsZNaQB7v3rJzLPnQXwKxrLYwQ=;
        b=ZI5J/Fo6b96zuu3rAtYOs+UIro6b3it1AEcyHv7tzkhP/HR/teIARt+47b1IvdAtri
         KBkRasTrn6yn8of2gy+DdLmFGPBOK/+YGoNRYO3oj6275h180Nb4f8UI8O5qK5FYorwf
         cj3vcmi75QVKMbQy64E9Tf7W803lUn9vk3TnVzmvl6+kj91XNOQik6sINj6Mx7mITB5/
         u2HDcxulJnz2XjBp16Er79evgcO2Wgc/0l51tEFo7+KMPrBh5AYV1Yd7W/zarbSjmQAp
         gpsnTy/Iy9B4ollk19DwecZCTyQpSiUJs4CVM8Z76/Ir3JfwxY1Rt8NPTuZ7kUY4qfT0
         LvTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=icOlhqTrU/cuumG7vjsZNaQB7v3rJzLPnQXwKxrLYwQ=;
        b=eF8NYvlansqGFiqwt1XObgEHVSHIgxR4fPSIH3qQvswKo03/z2GrmNp+4OhToRP6ux
         x0GTB6O8ZkTQqNcVNfEDKipLwHVFpQlsLcP1F9VWOpfkSrrATTDhs5/6VRPN9DncGK0E
         kreMmirSnEwZMvOA1F50toBm4sKUakuhOwrS8uENU7o33xepaXXcsczf1W6P1PWP1DF/
         MumWnakE7qAmjsvcLcSrYO4y2astH5f/8w2p0/7t89K/+2qkAWBkIj0LvsE7YwNeFmHM
         2i5X+gsldCcXipuKQ5c8KpvbBwlCQWFrk2eivSwkzOmUa6cA9+mdJ3uyS+jvVZWJEie1
         +tDQ==
X-Gm-Message-State: AOAM532ODT+aOR6eNLflhg66sWUturhAWpTcieGTR9HN7B7ZyPzB3vO2
        +zLUe6HcQUFkgaOIULT9qGZjsz5rCAw=
X-Google-Smtp-Source: ABdhPJzZ+r1Bi0e+ke4Ton/yOzSVKm8zroPoy34/2CuSqL3QujDGx7jGszBGnMKfEg6gzzL8laYvgQ==
X-Received: by 2002:a05:622a:28d:: with SMTP id z13mr312801qtw.313.1630539773596;
        Wed, 01 Sep 2021 16:42:53 -0700 (PDT)
Received: from Arrakis.djogorchock.com (pool-173-68-59-147.nycmny.fios.verizon.net. [173.68.59.147])
        by smtp.gmail.com with ESMTPSA id n5sm13422qtp.35.2021.09.01.16.42.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Sep 2021 16:42:52 -0700 (PDT)
From:   "Daniel J. Ogorchock" <djogorchock@gmail.com>
To:     linux-input@vger.kernel.org
Cc:     thunderbird2k@gmail.com, blaws05@gmail.com,
        benjamin.tissoires@redhat.com, jikos@kernel.org,
        Roderick.Colenbrander@sony.com, svv@google.com, s.jegen@gmail.com,
        carmueller@gmail.com, pgriffais@valvesoftware.com,
        hadess@hadess.net, pobrn@protonmail.com,
        "Daniel J. Ogorchock" <djogorchock@gmail.com>
Subject: [PATCH v15 07/16] HID: nintendo: send subcommands after receiving input report
Date:   Wed,  1 Sep 2021 19:42:27 -0400
Message-Id: <20210901234236.3113-8-djogorchock@gmail.com>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20210901234236.3113-1-djogorchock@gmail.com>
References: <20210901234236.3113-1-djogorchock@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Waiting to send subcommands until right after receiving an input report
drastically improves subcommand reliability. If the driver has finished
initial controller configuration, it now waits until receiving an input
report for all subcommands.

Signed-off-by: Daniel J. Ogorchock <djogorchock@gmail.com>
---
 drivers/hid/hid-nintendo.c | 33 +++++++++++++++++++++++++++++++++
 1 file changed, 33 insertions(+)

diff --git a/drivers/hid/hid-nintendo.c b/drivers/hid/hid-nintendo.c
index 11f489c40678d..daa95fa8e9a0b 100644
--- a/drivers/hid/hid-nintendo.c
+++ b/drivers/hid/hid-nintendo.c
@@ -335,6 +335,7 @@ struct joycon_ctlr {
 	bool received_resp;
 	u8 usb_ack_match;
 	u8 subcmd_ack_match;
+	bool received_input_report;
 
 	/* factory calibration data */
 	struct joycon_stick_cal left_stick_cal_x;
@@ -388,6 +389,26 @@ static int joycon_hid_send_sync(struct joycon_ctlr *ctlr, u8 *data, size_t len,
 	 * doing one retry after a timeout appears to always work.
 	 */
 	while (tries--) {
+		/*
+		 * If we are in the proper reporting mode, wait for an input
+		 * report prior to sending the subcommand. This improves
+		 * reliability considerably.
+		 */
+		if (ctlr->ctlr_state == JOYCON_CTLR_STATE_READ) {
+			unsigned long flags;
+
+			spin_lock_irqsave(&ctlr->lock, flags);
+			ctlr->received_input_report = false;
+			spin_unlock_irqrestore(&ctlr->lock, flags);
+			ret = wait_event_timeout(ctlr->wait,
+						 ctlr->received_input_report,
+						 HZ / 4);
+			/* We will still proceed, even with a timeout here */
+			if (!ret)
+				hid_warn(ctlr->hdev,
+					 "timeout waiting for input report\n");
+		}
+
 		ret = __joycon_hid_send(ctlr->hdev, data, len);
 		if (ret < 0) {
 			memset(ctlr->input_buf, 0, JC_MAX_RESP_SIZE);
@@ -760,6 +781,18 @@ static void joycon_parse_report(struct joycon_ctlr *ctlr,
 	}
 
 	input_sync(dev);
+
+	/*
+	 * Immediately after receiving a report is the most reliable time to
+	 * send a subcommand to the controller. Wake any subcommand senders
+	 * waiting for a report.
+	 */
+	if (unlikely(mutex_is_locked(&ctlr->output_mutex))) {
+		spin_lock_irqsave(&ctlr->lock, flags);
+		ctlr->received_input_report = true;
+		spin_unlock_irqrestore(&ctlr->lock, flags);
+		wake_up(&ctlr->wait);
+	}
 }
 
 static void joycon_rumble_worker(struct work_struct *work)
-- 
2.33.0

