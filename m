Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D9EA124EB66
	for <lists+linux-input@lfdr.de>; Sun, 23 Aug 2020 06:42:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726187AbgHWEml (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Sun, 23 Aug 2020 00:42:41 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59436 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725981AbgHWEmd (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Sun, 23 Aug 2020 00:42:33 -0400
Received: from mail-oi1-x244.google.com (mail-oi1-x244.google.com [IPv6:2607:f8b0:4864:20::244])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4DCEDC0613ED
        for <linux-input@vger.kernel.org>; Sat, 22 Aug 2020 21:42:33 -0700 (PDT)
Received: by mail-oi1-x244.google.com with SMTP id u24so5307695oic.7
        for <linux-input@vger.kernel.org>; Sat, 22 Aug 2020 21:42:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=q8wCq0VPpORS1g2FyMDp3PohkW41J2FQiwSKuqgpm94=;
        b=FagKX5TIDNwTpqvmwXOCrkexLlEaQ69seqlUhIJt6gAexDU4O3K2xLjvjJArkmEOO7
         zPdFv5RLKlBl8imZ3aY0i+XKBr3ZFhZuVPZkt4TPR6u6W2KsT+9qkEJdetpjbC6tEQ8c
         H+k1+GnJOk5RLkajtO48Fu2O/LgRuvgR8RMfZISmFfuqt5iSkY5EmAQyOszYZ/T1T4JD
         /J4HKsEo9Mr6tFzTU2ZsMDLYY3V8wOj/CIW1w+cw/9zAR5MQJb5QV1rIyivIGF+y2oSE
         dY2GpbiVz8AZBzq7NiwqF993w8Sv9+AHSjXRH+1+1jea8b3OCfdWSvodZCzWybADReB0
         sDng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=q8wCq0VPpORS1g2FyMDp3PohkW41J2FQiwSKuqgpm94=;
        b=Cs868ZeMoxTXECQyZyYEe9r9Ip2uTu41Sk2tjVXNZbN/i3dh8dtmJWydhs48lJ5R/g
         H+niOvJfg7Jl7p19CXjGR7cJbZzeaVZBzCMcBDiwf43dTO3eqBdEp30eWiEdbauxFrMd
         RC4/q2E+841IpQnlHSu0JkQXK31D/TVK4s+NqIz22ct1g6v9e2Ujsu54/u0xeCFpApXK
         kttNS84Ii2xfa9aixN7NYsLTu8PZ77DAt+FLnbmhD4J1vi6sNITFcIfv+QT2T30c+q0l
         D1HtzyRaG3L8E3y5ohH43KZvMfO+q8mCNu4oJtrxYhgvDdJU9ZGjzVbqlvfeziiVltPP
         RjZQ==
X-Gm-Message-State: AOAM5323OQWPMlx3/cShOVmyBzeZSJngQSYrWGxWg95O7xVjtaFTXrKo
        tmU5XWzT1xY2shXhjfk1pheaJZ+N0wMzUOa2
X-Google-Smtp-Source: ABdhPJyRJ3Phj2r8mg+EcKblAjS4HqbW61G8F/sHE6m4crDVmepQuodd6hEx/UjmImBirQPofB9Ovg==
X-Received: by 2002:aca:db0b:: with SMTP id s11mr99825oig.161.1598157752572;
        Sat, 22 Aug 2020 21:42:32 -0700 (PDT)
Received: from Arrakis.djogorchock.com ([136.33.205.58])
        by smtp.gmail.com with ESMTPSA id z10sm1308572otk.6.2020.08.22.21.42.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 22 Aug 2020 21:42:31 -0700 (PDT)
From:   "Daniel J. Ogorchock" <djogorchock@gmail.com>
To:     linux-input@vger.kernel.org
Cc:     thunderbird2k@gmail.com, blaws05@gmail.com,
        benjamin.tissoires@redhat.com, jikos@kernel.org,
        Roderick.Colenbrander@sony.com, svv@google.com, s.jegen@gmail.com,
        carmueller@gmail.com, pgriffais@valvesoftware.com,
        hadess@hadess.net, "Daniel J. Ogorchock" <djogorchock@gmail.com>
Subject: [PATCH v12 13/14] HID: nintendo: prevent needless queueing of the rumble worker
Date:   Sat, 22 Aug 2020 23:41:56 -0500
Message-Id: <20200823044157.339677-14-djogorchock@gmail.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20200823044157.339677-1-djogorchock@gmail.com>
References: <20200823044157.339677-1-djogorchock@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-input-owner@vger.kernel.org
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
index 88a853570faf..80f33ab58a5e 100644
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
2.28.0

