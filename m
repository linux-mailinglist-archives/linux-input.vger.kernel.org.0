Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AFF823D4B36
	for <lists+linux-input@lfdr.de>; Sun, 25 Jul 2021 05:28:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230229AbhGYCrc (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Sat, 24 Jul 2021 22:47:32 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44444 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230217AbhGYCr2 (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Sat, 24 Jul 2021 22:47:28 -0400
Received: from mail-qk1-x72f.google.com (mail-qk1-x72f.google.com [IPv6:2607:f8b0:4864:20::72f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 32ADDC061760
        for <linux-input@vger.kernel.org>; Sat, 24 Jul 2021 20:27:59 -0700 (PDT)
Received: by mail-qk1-x72f.google.com with SMTP id c9so1734372qkc.13
        for <linux-input@vger.kernel.org>; Sat, 24 Jul 2021 20:27:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=uw2l/xjAsMRX2jdbLt62nuPbMV2/l1JRX4nC14/dios=;
        b=LCZ4BHhHpKh1wqxZ3dI7DP5+Sh1GmvA7k8jvZWnsZxunceDONo3rtOYSWP6GpyD3Xr
         gZWmCE8cpDZW+FyVwskH9y7RW67r/18buGrIEW54hL49scofYVIuNFsLc5oq/4I/ctoo
         wKcomnsBY0tmSGyw2Q6/nHceRGwv0or5eGlVo4XBpqGqn1iqOFL3Q6Bdn59kVzDsqt6V
         2EiAaiHAzx8xArh6MNdQrxngimKoAJnJHViKknt9/5Jco9FvXtT1Bef8sl3FAqUDYrX/
         mN+c3XPjiVvmmG+qf6eAYt5Tx+LBjfAjul2tHTVB5GlHdnlyjPlLrBi9WvO6aZIwbexU
         hegA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=uw2l/xjAsMRX2jdbLt62nuPbMV2/l1JRX4nC14/dios=;
        b=cZ+xcISTSBYEE9GwAnLMv6iSAd2eJ0aDPph4w46HuvzUNuHV+gAseF97NzgcCuC+W+
         A2kgOTgVmSpf9ROCfcf0JQM/k4JBnU5gEWSKX4gLkVnW10L7xqkAL4rvsEPHLzVw9f4k
         sOSXKUIzzI5+WY4PfIFsxx09s83R9IFXtrHu1MvKXK3b9K3R0WXepca4ZLGNGo/VsP5z
         HBKrkhjfLK/URtxGDnlsAJmn72Q9umj6WxJxsFLcqUklAefREEsNpq+RFkBPP/k6viR0
         cMxlr/zd7XbqUoSxqBDdx40enKvF4K9rUBtrjF2A7Es5whO1wiG0A3kqkCP7rrgIKBh1
         wohw==
X-Gm-Message-State: AOAM533anJivZrjAl7LlXB3V9a7PtHO2p4Ye8VrqOCN+x/8g7EuH8rhP
        jJ46eaAMui/JknV1ivyLj4CxWw+CcomNsjHT
X-Google-Smtp-Source: ABdhPJzdaDFbK8XYZ0nSIMfIu5W4uVYBl/oDWYAOLP+Tugm5f56fkIF8+l9CgHNpB8mpdwCTB0jlXw==
X-Received: by 2002:a37:684f:: with SMTP id d76mr11714096qkc.357.1627183678270;
        Sat, 24 Jul 2021 20:27:58 -0700 (PDT)
Received: from Arrakis.djogorchock.com (pool-98-116-189-238.nycmny.fios.verizon.net. [98.116.189.238])
        by smtp.gmail.com with ESMTPSA id j16sm4843738qkk.132.2021.07.24.20.27.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 24 Jul 2021 20:27:57 -0700 (PDT)
From:   "Daniel J. Ogorchock" <djogorchock@gmail.com>
To:     linux-input@vger.kernel.org
Cc:     thunderbird2k@gmail.com, blaws05@gmail.com,
        benjamin.tissoires@redhat.com, jikos@kernel.org,
        Roderick.Colenbrander@sony.com, svv@google.com, s.jegen@gmail.com,
        carmueller@gmail.com, pgriffais@valvesoftware.com,
        hadess@hadess.net, "Daniel J. Ogorchock" <djogorchock@gmail.com>
Subject: [PATCH v14 17/17] HID: nintendo: prevent needless queueing of the rumble worker
Date:   Sat, 24 Jul 2021 23:27:08 -0400
Message-Id: <20210725032707.440071-18-djogorchock@gmail.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20210725032707.440071-1-djogorchock@gmail.com>
References: <20210725032707.440071-1-djogorchock@gmail.com>
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
index d3ec45de9649f..21c88fc45a1e4 100644
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
@@ -1216,8 +1218,19 @@ static void joycon_parse_report(struct joycon_ctlr *ctlr,
 
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
2.32.0

