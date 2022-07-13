Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 894D6573DB2
	for <lists+linux-input@lfdr.de>; Wed, 13 Jul 2022 22:21:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231673AbiGMUVL (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 13 Jul 2022 16:21:11 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51738 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230479AbiGMUVK (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Wed, 13 Jul 2022 16:21:10 -0400
Received: from mail-qt1-x831.google.com (mail-qt1-x831.google.com [IPv6:2607:f8b0:4864:20::831])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AE78B2B278
        for <linux-input@vger.kernel.org>; Wed, 13 Jul 2022 13:21:09 -0700 (PDT)
Received: by mail-qt1-x831.google.com with SMTP id e5so1979027qts.1
        for <linux-input@vger.kernel.org>; Wed, 13 Jul 2022 13:21:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=Mmap5UciJw0dtKO0Xp0ZZnk2+huFB8IKnW9rI4FA4EY=;
        b=V+pQEFS/7+X2+cgRaDz9VYA+dRyLChEwMhW97O3EgUa/7JJ6QRfY1S3ne3OnoTw0/+
         w7jsTvMYhnKjNIvVyzGgznBKtClFhY7aPZx2M01KX8GniPChX2jDUwHXmfIZh2WXoafy
         Gek9OTic+ZuxQdFcs2tLtGGd7MW6U4rCY++4+hUczVF0oRRA49iFyYRBD+zBqTQVtNmV
         EkjiHcsvHSJ1TEnLEXGVeUKBzETRgo0wnynzYQFKcPkT4IlE5lEqUKqlpNhvpS+t5bUy
         DtlQ9sLVV7nAUCUAtMJhk5kjQuii/XN/FDblVuPXtgV4vftgNDJVigb1AaS/P+9USurU
         KYKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=Mmap5UciJw0dtKO0Xp0ZZnk2+huFB8IKnW9rI4FA4EY=;
        b=lD1zLKsA53MkgjezVpiTk1/edtkd6ix6H2mRU8QwtIF15dS2DU7CZyevAdhqp5Q8GR
         6kGHZ5Sca9652vROGhmB03T18SQednW/of1iNnVs8eqGGz5g+y113hkJSH+Yx3zAAqqf
         vShu2E9ZjhEB69XKxf7PsV6dBTG4cSeFp5mn57hIuBEyGyREmVcN+/PoFx5BCzmiWa8x
         3ywhboQ6Rbo8K0qZ3OhI8ZUsNLVFCh52SjNiGDaRlpu+wnKJvlmwahwjwv+uIpxYx0O3
         8Dh49Jn5vDNS038pVablxs4APTINu+GamdW5UhPSg+lAMumeh5JVbqY+f/j2PU9FDhNo
         0CZw==
X-Gm-Message-State: AJIora9xLBGkTHpy4/qMe3kr92ona+I045IplGqfiwMiE2V5tD2u0HeN
        icmlQYpaAAY9aZ2ZeD2chxaFGrT+2EE=
X-Google-Smtp-Source: AGRyM1skNNAmdtJuZDh53QIdNI/eO3WVwMjChd5tMRuARsRlZCqi7yGfpfdLIlT0KT19VwaBasPsAQ==
X-Received: by 2002:a05:622a:1482:b0:31e:9c01:ed76 with SMTP id t2-20020a05622a148200b0031e9c01ed76mr4746689qtx.547.1657743667963;
        Wed, 13 Jul 2022 13:21:07 -0700 (PDT)
Received: from Arrakis.djogorchock.com (pool-173-56-36-208.nycmny.fios.verizon.net. [173.56.36.208])
        by smtp.gmail.com with ESMTPSA id x8-20020a05620a258800b006a793bde241sm12184477qko.63.2022.07.13.13.21.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 Jul 2022 13:21:06 -0700 (PDT)
From:   "Daniel J. Ogorchock" <djogorchock@gmail.com>
To:     linux-input@vger.kernel.org
Cc:     "Daniel J. Ogorchock" <djogorchock@gmail.com>
Subject: [PATCH] HID: nintendo: fix rumble worker null pointer deref
Date:   Wed, 13 Jul 2022 16:20:59 -0400
Message-Id: <20220713202059.3835-1-djogorchock@gmail.com>
X-Mailer: git-send-email 2.37.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

We can dereference a null pointer trying to queue work to a destroyed
workqueue.

If the device is disconnected, nintendo_hid_remove is called, in which
the rumble_queue is destroyed. Avoid using that queue to defer rumble
work once the controller state is set to JOYCON_CTLR_STATE_REMOVED.

This eliminates the null pointer dereference.

Signed-off-by: Daniel J. Ogorchock <djogorchock@gmail.com>
---
 drivers/hid/hid-nintendo.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/hid/hid-nintendo.c b/drivers/hid/hid-nintendo.c
index 2204de889739f..98551a3087c3b 100644
--- a/drivers/hid/hid-nintendo.c
+++ b/drivers/hid/hid-nintendo.c
@@ -1222,6 +1222,7 @@ static void joycon_parse_report(struct joycon_ctlr *ctlr,
 
 	spin_lock_irqsave(&ctlr->lock, flags);
 	if (IS_ENABLED(CONFIG_NINTENDO_FF) && rep->vibrator_report &&
+	    ctlr->ctlr_state != JOYCON_CTLR_STATE_REMOVED &&
 	    (msecs - ctlr->rumble_msecs) >= JC_RUMBLE_PERIOD_MS &&
 	    (ctlr->rumble_queue_head != ctlr->rumble_queue_tail ||
 	     ctlr->rumble_zero_countdown > 0)) {
@@ -1546,12 +1547,13 @@ static int joycon_set_rumble(struct joycon_ctlr *ctlr, u16 amp_r, u16 amp_l,
 		ctlr->rumble_queue_head = 0;
 	memcpy(ctlr->rumble_data[ctlr->rumble_queue_head], data,
 	       JC_RUMBLE_DATA_SIZE);
-	spin_unlock_irqrestore(&ctlr->lock, flags);
 
 	/* don't wait for the periodic send (reduces latency) */
-	if (schedule_now)
+	if (schedule_now && ctlr->ctlr_state != JOYCON_CTLR_STATE_REMOVED)
 		queue_work(ctlr->rumble_queue, &ctlr->rumble_worker);
 
+	spin_unlock_irqrestore(&ctlr->lock, flags);
+
 	return 0;
 }
 
-- 
2.37.1

