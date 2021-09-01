Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 738EE3FE677
	for <lists+linux-input@lfdr.de>; Thu,  2 Sep 2021 02:34:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240154AbhIAXoC (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 1 Sep 2021 19:44:02 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45734 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239077AbhIAXoC (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Wed, 1 Sep 2021 19:44:02 -0400
Received: from mail-qk1-x735.google.com (mail-qk1-x735.google.com [IPv6:2607:f8b0:4864:20::735])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F1239C061575
        for <linux-input@vger.kernel.org>; Wed,  1 Sep 2021 16:43:04 -0700 (PDT)
Received: by mail-qk1-x735.google.com with SMTP id t190so148479qke.7
        for <linux-input@vger.kernel.org>; Wed, 01 Sep 2021 16:43:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=M3/s+SNLAHz5ZWLUMe/fbp1/rf/4ncF7R8PZTc3ZpHM=;
        b=Ci4I4ZEZrSRvmZNy//YZbb6U2gySWKY9uVWT5T7eMAQiPWAXVn1RfG6qDq2M+SNU9o
         CvEkB7G/EpulAKAIBeMD74UQIdIAdGEbxV/8mjHMA8Mvt3fKzQBl6ZkBHCAgRM12Oewh
         7n+S654ZZSZL5IgnUqvh6d8FYMMf/9rIqENf+Nmt7jrDexxk6eSEyXv0kx+BWfVaocaB
         PfVbIj0N9h+qb+3NQbYl5+GGEPI2+RyTk1+C7xCuzfhhdl3I2Hsmwp/23EQ8R7eF5l0E
         ioTWvh+G044adQi2ZZdVOPHOYrMj1fHBvq16MlpPJS+/SwQeXdHDXV65KFvxcURjsonD
         Irsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=M3/s+SNLAHz5ZWLUMe/fbp1/rf/4ncF7R8PZTc3ZpHM=;
        b=Z1vBEvTs237QO6W4WhQgp8FEG4UPwVb48ls4AOi5+ZQC5c2itq30/Pr0EXT1iE8fVx
         /Af/7ZuGL/AyW8+PK7V2FgC7z9np3LHd64ingiitQkj+jHhIfy64rLkOQ8rM3zQ/K5Ei
         4kRVUOs5DihDeaU/CqmQ4Y/n3obaElNlol3Y4F5DvbyZftbhI5SDYZ+r6kqp92lQwQop
         lLcWODOkEDLLpl19AxFnks+h1WaOldhI018oIm75KfBwNJTSUg5R7MHWCvA22CBaSbeM
         uXDf/tlR2kNqNkE2WAi/vS2UmFIWf42hpP+YNiibfz7KSz9kPkaLdWznryERHyakYaUQ
         CKMg==
X-Gm-Message-State: AOAM530tk55BFbicx51O8elgV8k6juuQLqw6fIH0oJKNNM0LcABcimv2
        iOWIF0oRDDUe7XitAVj+l1aI0fZ/uvs=
X-Google-Smtp-Source: ABdhPJxEn/Dt/gBUQHSGnn287kHlpswOogcTVeCDzNuem8/HvwIadcYyE2HhP2pBxTOELVeUiybRbw==
X-Received: by 2002:a37:591:: with SMTP id 139mr486027qkf.41.1630539783950;
        Wed, 01 Sep 2021 16:43:03 -0700 (PDT)
Received: from Arrakis.djogorchock.com (pool-173-68-59-147.nycmny.fios.verizon.net. [173.68.59.147])
        by smtp.gmail.com with ESMTPSA id n5sm13422qtp.35.2021.09.01.16.43.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Sep 2021 16:43:03 -0700 (PDT)
From:   "Daniel J. Ogorchock" <djogorchock@gmail.com>
To:     linux-input@vger.kernel.org
Cc:     thunderbird2k@gmail.com, blaws05@gmail.com,
        benjamin.tissoires@redhat.com, jikos@kernel.org,
        Roderick.Colenbrander@sony.com, svv@google.com, s.jegen@gmail.com,
        carmueller@gmail.com, pgriffais@valvesoftware.com,
        hadess@hadess.net, pobrn@protonmail.com,
        "Daniel J. Ogorchock" <djogorchock@gmail.com>
Subject: [PATCH v15 16/16] HID: nintendo: prevent needless queueing of the rumble worker
Date:   Wed,  1 Sep 2021 19:42:36 -0400
Message-Id: <20210901234236.3113-17-djogorchock@gmail.com>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20210901234236.3113-1-djogorchock@gmail.com>
References: <20210901234236.3113-1-djogorchock@gmail.com>
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
index 2281806b5167f..b558577b27656 100644
--- a/drivers/hid/hid-nintendo.c
+++ b/drivers/hid/hid-nintendo.c
@@ -400,6 +400,7 @@ struct joycon_input_report {
 static const u16 JC_RUMBLE_DFLT_LOW_FREQ = 160;
 static const u16 JC_RUMBLE_DFLT_HIGH_FREQ = 320;
 static const u16 JC_RUMBLE_PERIOD_MS = 50;
+static const unsigned short JC_RUMBLE_ZERO_AMP_PKT_CNT = 5;
 
 static const char * const joycon_player_led_names[] = {
 	LED_FUNCTION_PLAYER "-1",
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

