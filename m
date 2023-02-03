Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 269CB68A4F0
	for <lists+linux-input@lfdr.de>; Fri,  3 Feb 2023 22:51:53 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233823AbjBCVvw (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Fri, 3 Feb 2023 16:51:52 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49588 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231593AbjBCVvv (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Fri, 3 Feb 2023 16:51:51 -0500
Received: from mail-qt1-x831.google.com (mail-qt1-x831.google.com [IPv6:2607:f8b0:4864:20::831])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6224CAA277
        for <linux-input@vger.kernel.org>; Fri,  3 Feb 2023 13:51:27 -0800 (PST)
Received: by mail-qt1-x831.google.com with SMTP id g8so7105728qtq.13
        for <linux-input@vger.kernel.org>; Fri, 03 Feb 2023 13:51:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uZ0s1l8g1sDEusbbDpNkTJJgc0rmIwRdm52BByj4wlk=;
        b=f4XdajJiisGayiyEOPIdpMpnBB0xZ3nC/6UUPSMTFkX9q6BzojNDz6rudWVGJWWkwC
         V9CEddR223LKyJlIgF0CPc5GldRD3p3Tg5tYSfYO3+uH2ZqVo4byDMvQ3vveumQ/rgrQ
         GFaXZLlyJZSjNpdP9TQtnP6bpPcHt7a78Yx6IWp+LaOmUHXChMD0bm/1sPrizTx/mUK4
         AB9ga2Z3PMQn68KXJGSVkULp38cC5CXzh2xB4e2Pbowsp8bAK3tu+T9ly5XNtvblCCPi
         V4/KvaVBhh0Krql0g69aZRIbjwNk+0/4x19voO7ZWg7hEBi754F/yCpPxtGhInB5LyFX
         bgLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=uZ0s1l8g1sDEusbbDpNkTJJgc0rmIwRdm52BByj4wlk=;
        b=5l+q0dKdNAdAkbKTCxqsA8uu7eq+d/Qp6X8J15JSYK/DDJKWJLzSM9HZNW6Dd2y581
         5M8/N5mb5F78+Ae0SvOj1piv8wWgYt1F5scx6+USt3rR51nB7+vtjz7/j32kUvK/yda8
         Mz5z2/NVojD5zXur8lRFj+7NJTg8cOK/PsGazhbEk2JcPp4TDy2qIUhcn9baVbv3+h0T
         0FgN4ApuDWKDDQTLe+WzZA8aqTShEk9VfwjRMho8xvFlJwl2dcLPyObRHS0D4uWg0FK/
         unvPMbFUrzjaH+mXYcSdVN5+Swiy33VebqWDTyTCGc7FD12GF2Eihx9PeY1pMSNwZKh2
         KWiQ==
X-Gm-Message-State: AO0yUKUgU9UDpSyr3XzJjhvHIURcQ+4gCqMcqtkAEM9fpn6b80Hp2RTi
        pfdhOIO8le5GN7DsuJp3ENFl8MOn7mE=
X-Google-Smtp-Source: AK7set+K2BXSR0VjpdVfQRNC+YZafXxPcYU80TmR5K9yqtAFCi/qnS5fZOO+jQ3C8lKsi8XeWz+DTg==
X-Received: by 2002:a05:622a:1206:b0:3b4:79f8:26c3 with SMTP id y6-20020a05622a120600b003b479f826c3mr21826502qtx.33.1675461085754;
        Fri, 03 Feb 2023 13:51:25 -0800 (PST)
Received: from Arrakis.djogorchock.com (pool-173-68-97-122.nycmny.fios.verizon.net. [173.68.97.122])
        by smtp.gmail.com with ESMTPSA id r10-20020ac83b4a000000b003b9bcd88f7dsm2277408qtf.43.2023.02.03.13.51.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Feb 2023 13:51:23 -0800 (PST)
From:   "Daniel J. Ogorchock" <djogorchock@gmail.com>
To:     linux-input@vger.kernel.org
Cc:     jikos@kernel.org, benjamin.tissoires@redhat.com,
        Roderick.Colenbrander@sony.com,
        "Daniel J. Ogorchock" <djogorchock@gmail.com>
Subject: [PATCH v0 1/2] HID: nintendo: prevent rumble queue overruns
Date:   Fri,  3 Feb 2023 16:51:17 -0500
Message-Id: <20230203215119.435091-2-djogorchock@gmail.com>
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

Make sure that we never throw out the most recent rumble setting,
opting to overwrite the prior queue head instead. This prevents
instances where we could get rumble stuck on if there were an overrun at
the wrong time.

Signed-off-by: Daniel J. Ogorchock <djogorchock@gmail.com>
---
 drivers/hid/hid-nintendo.c | 20 +++++++++++++++++---
 1 file changed, 17 insertions(+), 3 deletions(-)

diff --git a/drivers/hid/hid-nintendo.c b/drivers/hid/hid-nintendo.c
index 5bfc0c4504608..2b781cc9082b4 100644
--- a/drivers/hid/hid-nintendo.c
+++ b/drivers/hid/hid-nintendo.c
@@ -1527,6 +1527,7 @@ static int joycon_set_rumble(struct joycon_ctlr *ctlr, u16 amp_r, u16 amp_l,
 	u16 freq_l_low;
 	u16 freq_l_high;
 	unsigned long flags;
+	int next_rq_head;
 
 	spin_lock_irqsave(&ctlr->lock, flags);
 	freq_r_low = ctlr->rumble_rl_freq;
@@ -1547,8 +1548,21 @@ static int joycon_set_rumble(struct joycon_ctlr *ctlr, u16 amp_r, u16 amp_l,
 	joycon_encode_rumble(data, freq_l_low, freq_l_high, amp);
 
 	spin_lock_irqsave(&ctlr->lock, flags);
-	if (++ctlr->rumble_queue_head >= JC_RUMBLE_QUEUE_SIZE)
-		ctlr->rumble_queue_head = 0;
+
+	next_rq_head = ctlr->rumble_queue_head + 1;
+	if (next_rq_head >= JC_RUMBLE_QUEUE_SIZE)
+		next_rq_head = 0;
+
+	/* Did we overrun the circular buffer?
+	 * If so, be sure we keep the latest intended rumble state.
+	 */
+	if (next_rq_head == ctlr->rumble_queue_tail) {
+		hid_dbg(ctlr->hdev, "rumble queue is full");
+		/* overwrite the prior value at the end of the circular buf */
+		next_rq_head = ctlr->rumble_queue_head;
+	}
+
+	ctlr->rumble_queue_head = next_rq_head;
 	memcpy(ctlr->rumble_data[ctlr->rumble_queue_head], data,
 	       JC_RUMBLE_DATA_SIZE);
 
@@ -2128,7 +2142,7 @@ static int nintendo_hid_probe(struct hid_device *hdev,
 
 	ctlr->hdev = hdev;
 	ctlr->ctlr_state = JOYCON_CTLR_STATE_INIT;
-	ctlr->rumble_queue_head = JC_RUMBLE_QUEUE_SIZE - 1;
+	ctlr->rumble_queue_head = 0;
 	ctlr->rumble_queue_tail = 0;
 	hid_set_drvdata(hdev, ctlr);
 	mutex_init(&ctlr->output_mutex);
-- 
2.39.1

