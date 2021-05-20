Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 742F338B9AB
	for <lists+linux-input@lfdr.de>; Fri, 21 May 2021 00:47:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231948AbhETWtK (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 20 May 2021 18:49:10 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55824 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231871AbhETWtF (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Thu, 20 May 2021 18:49:05 -0400
Received: from mail-qt1-x82c.google.com (mail-qt1-x82c.google.com [IPv6:2607:f8b0:4864:20::82c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 35A4AC061574
        for <linux-input@vger.kernel.org>; Thu, 20 May 2021 15:47:42 -0700 (PDT)
Received: by mail-qt1-x82c.google.com with SMTP id 1so14086241qtb.0
        for <linux-input@vger.kernel.org>; Thu, 20 May 2021 15:47:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=1AoeyijL6TGgV+NjdlX4S+qM2lKx4/5f3P6oGVVy9zs=;
        b=ZY+C5uxBkj1w3v1SK9fGVxfuHOey1huwxMHh+bSU8ulkDHXMq8tegF2BMKEouVB6qI
         8tDYrA4S8Xgd15C6dII+NDBQgAao+/Vz735WQyRK/8Rdsic0jd9fCVQYY0NEibsbirWF
         3ZgZ5e6qVqS66ZEIE+GmbOtBWMefxoaWrDHP9LBrK+GaitQMLfl+OCkwZm/Wg6OrDS+z
         ZflMmEONDogkig2v467lCKHzQ69yjUNjmnz4bmHE0rIPNbqM/vin6a4zh7J7YFoGHsIk
         zxIiebGt3yQWTd+S3uAWk1WcZTqvPhezeiYPbUE+w0xggpMTyP0UqMvp58C578mWrQRQ
         X19g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=1AoeyijL6TGgV+NjdlX4S+qM2lKx4/5f3P6oGVVy9zs=;
        b=kzFsOGS15wVWlEQlDPEBBGkhhg+43EsdgcT1abEINYBxvIwoIOoazBhJCIUirlUM8Z
         7oyMNJGnhBLAq16sWmrW1KP+jGn8BjXDZKKrAsX2Nl6yvJtGwjabJK48+xYmcTxgYa9q
         aE3+7pLL8T9BXE7LBc+sPn9AgFgoi010/IFjszhvZ2CaV/QexorcrX+U56erZ79cpRgJ
         XbKgOXXi+q8WeMVwitETO7oGU8COJAfoTtkZfeb9EH8FjEQ3qEzlR3Aft71RS76+lidZ
         8O74jFYx7mgQ/4pB0kEl07J7sdO2bD2/GIgSKR28rvB33y0NejDkR43P8HjIdZYL0qcN
         bVUw==
X-Gm-Message-State: AOAM530DfQPTZkJrQ7URE7mJvNoB9m+sBy+IqmVt6jXzCQ8yMmVfaC8u
        4YL6D8thPVUdFsL8INcSXSZ8puHP8aBY1Q==
X-Google-Smtp-Source: ABdhPJxdL+yAVsWYtWKnGGHmjrV5/Y361R/pvkPDDAa767k+662PZLLC6Uqthlws8kj2V5qU1CIiEg==
X-Received: by 2002:ac8:7a92:: with SMTP id x18mr7891352qtr.342.1621550861162;
        Thu, 20 May 2021 15:47:41 -0700 (PDT)
Received: from Arrakis.djogorchock.com (pool-173-68-68-24.nycmny.fios.verizon.net. [173.68.68.24])
        by smtp.gmail.com with ESMTPSA id s11sm2126251qtn.77.2021.05.20.15.47.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 May 2021 15:47:40 -0700 (PDT)
From:   "Daniel J. Ogorchock" <djogorchock@gmail.com>
To:     linux-input@vger.kernel.org
Cc:     thunderbird2k@gmail.com, blaws05@gmail.com,
        benjamin.tissoires@redhat.com, jikos@kernel.org,
        Roderick.Colenbrander@sony.com, svv@google.com, s.jegen@gmail.com,
        carmueller@gmail.com, pgriffais@valvesoftware.com,
        hadess@hadess.net, "Daniel J. Ogorchock" <djogorchock@gmail.com>
Subject: [PATCH v13 13/15] HID: nintendo: prevent needless queueing of the rumble worker
Date:   Thu, 20 May 2021 18:47:13 -0400
Message-Id: <20210520224715.680919-14-djogorchock@gmail.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210520224715.680919-1-djogorchock@gmail.com>
References: <20210520224715.680919-1-djogorchock@gmail.com>
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

Signed-off-by: Daniel J. Ogorchock <djogorchock@gmail.com>
---
 drivers/hid/hid-nintendo.c | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/drivers/hid/hid-nintendo.c b/drivers/hid/hid-nintendo.c
index cdb931d9bfae4..7e9b7ebc5a674 100644
--- a/drivers/hid/hid-nintendo.c
+++ b/drivers/hid/hid-nintendo.c
@@ -378,6 +378,7 @@ struct joycon_ctlr {
 	u16 rumble_lh_freq;
 	u16 rumble_rl_freq;
 	u16 rumble_rh_freq;
+	bool rumble_zero_amp;
 };
 
 /* Helper macros for checking controller type */
@@ -777,7 +778,9 @@ static void joycon_parse_report(struct joycon_ctlr *ctlr,
 
 	spin_lock_irqsave(&ctlr->lock, flags);
 	if (IS_ENABLED(CONFIG_NINTENDO_FF) && rep->vibrator_report &&
-	    (msecs - ctlr->rumble_msecs) >= JC_RUMBLE_PERIOD_MS)
+	    (msecs - ctlr->rumble_msecs) >= JC_RUMBLE_PERIOD_MS &&
+	    (ctlr->rumble_queue_head != ctlr->rumble_queue_tail ||
+	     !ctlr->rumble_zero_amp))
 		queue_work(ctlr->rumble_queue, &ctlr->rumble_worker);
 
 	/* Parse the battery status */
@@ -1036,6 +1039,8 @@ static int joycon_set_rumble(struct joycon_ctlr *ctlr, u16 amp_r, u16 amp_l,
 	freq_r_high = ctlr->rumble_rh_freq;
 	freq_l_low = ctlr->rumble_ll_freq;
 	freq_l_high = ctlr->rumble_lh_freq;
+	/* this flag is used to reduce subcommand traffic */
+	ctlr->rumble_zero_amp = (amp_l == 0) && (amp_r == 0);
 	spin_unlock_irqrestore(&ctlr->lock, flags);
 
 	/* right joy-con */
-- 
2.31.1

