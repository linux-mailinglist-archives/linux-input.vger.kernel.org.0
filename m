Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D61F54079FD
	for <lists+linux-input@lfdr.de>; Sat, 11 Sep 2021 19:37:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233244AbhIKRiW (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Sat, 11 Sep 2021 13:38:22 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48588 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233185AbhIKRiV (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Sat, 11 Sep 2021 13:38:21 -0400
Received: from mail-qk1-x72f.google.com (mail-qk1-x72f.google.com [IPv6:2607:f8b0:4864:20::72f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 197CBC061574
        for <linux-input@vger.kernel.org>; Sat, 11 Sep 2021 10:37:09 -0700 (PDT)
Received: by mail-qk1-x72f.google.com with SMTP id 22so5822945qkg.2
        for <linux-input@vger.kernel.org>; Sat, 11 Sep 2021 10:37:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=s1Awho1PHHofKLm5+hY3OlZ/znxopfa+Mj3ZusTpWAI=;
        b=d3E4hQvdJssAIciOvf9p8DoMrF1OzFWCUjvXD3aktTke/vU8WEaYwe8lvIazfROEKO
         DSJ9SvjxL9l+ELB3j4HWT8nHN71jwdNdJbdLm+NzDzJ7fKpE1TmLuCeqVMX5TzYQkaXI
         XEHqw1qIM857w2sJvT8vVd9A4bgFiKskbBH5f2v4RkxNzkfMs1C+QeCTJLsn4DL7t/9b
         c/4Idp+U6O6pigmhOc1EIv9IE12ANlguhcCBton0WRT6WonTj6eTtBHsHD3sJnbzMLuh
         qKcSIrCvyGR+SAlqvP4gnLbOdEsz7YWwBDHxk5vgpNxpRlDw/6FMAAQPPjjuHA8APtaK
         qfOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=s1Awho1PHHofKLm5+hY3OlZ/znxopfa+Mj3ZusTpWAI=;
        b=avh8yve7r5gGHXzFOai1ATIkODufpfSZtjTTrknXJ3jYozLEVjSSuiTAIexErdbm52
         q7+6eWDP0lD6qs5KzlzednYwkctyHsIiSaFbCfYVfYATDNWQKizgxo9iq4Y/XbL7hCz3
         5uomTbpHkbvkmt8QhcjRTWD/iRXx3rw/On+jkAsUJa5Jw9G5IBEX6wOPr8Pbn1VNAJ7M
         vBjd/3oMv2WmBDsP9dgFYf2xtQAZTyE4D8m2OgjrfkKz7LivfZHTZuU/63FQYG9Jj6SK
         M7vQcfSTJh/Y5eW6+HMQth+nm4z3Q+L2ug+yg78mmoJYXD+jjW7+u1TGBID1/JkCDXYo
         kwHA==
X-Gm-Message-State: AOAM533kaC9ig5XHN3POfgU8b5DqNMQ8jbla4Pbmp9lZn1j3heX2WWdS
        FgLLpz9I33RdStlhPlg5u1ApAcXGWmMZlQ==
X-Google-Smtp-Source: ABdhPJyU5AGMSIalFqdc7a8lyHIiKlExGMl3XBoFlej7hpLJ2z3wZ4p3N2tWN8tuOKFUrAx9jyYMcQ==
X-Received: by 2002:a37:741:: with SMTP id 62mr2887966qkh.490.1631381828169;
        Sat, 11 Sep 2021 10:37:08 -0700 (PDT)
Received: from Arrakis.djogorchock.com (pool-173-68-59-147.nycmny.fios.verizon.net. [173.68.59.147])
        by smtp.gmail.com with ESMTPSA id m5sm1594286qkn.33.2021.09.11.10.37.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 11 Sep 2021 10:37:07 -0700 (PDT)
From:   "Daniel J. Ogorchock" <djogorchock@gmail.com>
To:     linux-input@vger.kernel.org
Cc:     thunderbird2k@gmail.com, blaws05@gmail.com,
        benjamin.tissoires@redhat.com, jikos@kernel.org,
        Roderick.Colenbrander@sony.com, svv@google.com, s.jegen@gmail.com,
        carmueller@gmail.com, pgriffais@valvesoftware.com,
        hadess@hadess.net, pobrn@protonmail.com, lee.jones@linaro.org,
        "Daniel J. Ogorchock" <djogorchock@gmail.com>
Subject: [PATCH v16 16/16] HID: nintendo: prevent needless queueing of the rumble worker
Date:   Sat, 11 Sep 2021 13:36:39 -0400
Message-Id: <20210911173639.5688-17-djogorchock@gmail.com>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20210911173639.5688-1-djogorchock@gmail.com>
References: <20210911173639.5688-1-djogorchock@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

This patch adds a check for if the rumble queue ringbuffer is empty
prior to queuing the rumble workqueue. If the current rumble setting is
using a non-zero amplitude though, it will queue the worker anyway. This
is because the controller will automatically disable the rumble effect
if it isn't "refreshed".

This change improves bluetooth communication reliability with the
controller, since it reduces the amount of traffic.

Note that we still send a few periodic zero packets to avoid scenarios
where the controller fails to process the zero amplitude packet. Without
sending a few to be sure, the rumble could get stuck on until the
controller times out.

Signed-off-by: Daniel J. Ogorchock <djogorchock@gmail.com>
---
 drivers/hid/hid-nintendo.c | 18 +++++++++++++++++-
 1 file changed, 17 insertions(+), 1 deletion(-)

diff --git a/drivers/hid/hid-nintendo.c b/drivers/hid/hid-nintendo.c
index ae3cd8ca9fa78..c4270499fc6f3 100644
--- a/drivers/hid/hid-nintendo.c
+++ b/drivers/hid/hid-nintendo.c
@@ -400,6 +400,7 @@ struct joycon_input_report {
 static const u16 JC_RUMBLE_DFLT_LOW_FREQ = 160;
 static const u16 JC_RUMBLE_DFLT_HIGH_FREQ = 320;
 static const u16 JC_RUMBLE_PERIOD_MS = 50;
+static const unsigned short JC_RUMBLE_ZERO_AMP_PKT_CNT = 5;
 
 static const char * const joycon_player_led_names[] = {
 	LED_FUNCTION_PLAYER1,
@@ -464,6 +465,7 @@ struct joycon_ctlr {
 	u16 rumble_lh_freq;
 	u16 rumble_rl_freq;
 	u16 rumble_rh_freq;
+	unsigned short rumble_zero_countdown;
 
 	/* imu */
 	struct input_dev *imu_input;
@@ -1218,8 +1220,19 @@ static void joycon_parse_report(struct joycon_ctlr *ctlr,
 
 	spin_lock_irqsave(&ctlr->lock, flags);
 	if (IS_ENABLED(CONFIG_NINTENDO_FF) && rep->vibrator_report &&
-	    (msecs - ctlr->rumble_msecs) >= JC_RUMBLE_PERIOD_MS)
+	    (msecs - ctlr->rumble_msecs) >= JC_RUMBLE_PERIOD_MS &&
+	    (ctlr->rumble_queue_head != ctlr->rumble_queue_tail ||
+	     ctlr->rumble_zero_countdown > 0)) {
+		/*
+		 * When this value reaches 0, we know we've sent multiple
+		 * packets to the controller instructing it to disable rumble.
+		 * We can safely stop sending periodic rumble packets until the
+		 * next ff effect.
+		 */
+		if (ctlr->rumble_zero_countdown > 0)
+			ctlr->rumble_zero_countdown--;
 		queue_work(ctlr->rumble_queue, &ctlr->rumble_worker);
+	}
 
 	/* Parse the battery status */
 	tmp = rep->bat_con;
@@ -1513,6 +1526,9 @@ static int joycon_set_rumble(struct joycon_ctlr *ctlr, u16 amp_r, u16 amp_l,
 	freq_r_high = ctlr->rumble_rh_freq;
 	freq_l_low = ctlr->rumble_ll_freq;
 	freq_l_high = ctlr->rumble_lh_freq;
+	/* limit number of silent rumble packets to reduce traffic */
+	if (amp_l != 0 || amp_r != 0)
+		ctlr->rumble_zero_countdown = JC_RUMBLE_ZERO_AMP_PKT_CNT;
 	spin_unlock_irqrestore(&ctlr->lock, flags);
 
 	/* right joy-con */
-- 
2.33.0

