Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1FD4B4079F4
	for <lists+linux-input@lfdr.de>; Sat, 11 Sep 2021 19:37:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233130AbhIKRiQ (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Sat, 11 Sep 2021 13:38:16 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48540 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232635AbhIKRiN (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Sat, 11 Sep 2021 13:38:13 -0400
Received: from mail-qk1-x72a.google.com (mail-qk1-x72a.google.com [IPv6:2607:f8b0:4864:20::72a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 68345C061574
        for <linux-input@vger.kernel.org>; Sat, 11 Sep 2021 10:37:00 -0700 (PDT)
Received: by mail-qk1-x72a.google.com with SMTP id y144so5810656qkb.6
        for <linux-input@vger.kernel.org>; Sat, 11 Sep 2021 10:37:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=5BwZyKNVET1XegG16gwOWtMxcmyh03ak3Bqt1yLzo+U=;
        b=E+nuuWnSOSGdqWvizOG4GvQWWeklib+P+X3zp/jgWjNU+QbGeXgUQm0v4u2MXZXFHN
         off/f3HjRHMrUo6B5fq4isGNFgCyIiAPn6R1bgsC24mS3UnzlwLKjebg9+xLI5qOpICP
         Xt7HoyJvoQQoKAiUbIHnlBWJkT2eLg+hpbtuO+dNI7ut2VbDganNPwBffzue+3A0Mdda
         2uce5t4+J4BQhuxdz0ik3uCrI2AQUEinYg3U7qO9EupYe8e6Bq5TGLw5TIqixwa6b7kN
         Xr6elwW3248MuxRlvNponIcuTMIuzEm+69P3w9ZTqOJ/WkOUsaqxYkXUTgxX23Gge8it
         U3qg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=5BwZyKNVET1XegG16gwOWtMxcmyh03ak3Bqt1yLzo+U=;
        b=lcRwemVbm1i2LVW+B9l790g9VuiBK+XM2stUOBJahEODgAPt4zda8kIUOKx5XmIZNO
         SEo7To7MEgsJEEk7wmlEP/zQ5Dln933S9b6SEHg3J2EmuF0HSFDtabSuuphKsC1KUOej
         HD88RoN1aLHczJjZcfaFLTHjUcOJpUz/SdKLgAPkMB5brnUpwlg13Q6RiRKb/C/3JoQV
         xPlDveVGwUt2Xek0+6UeG4WLYaOVNnkgON0sLowiE1IA/RTFuXmkiJDyavN2j0u8hYVf
         lfrnTTZIRWEWpk25IyRub08Can0W9hzBhuZHtd6JcFDOCC8FiTlHzccEht6qLJmjf9A+
         r4BQ==
X-Gm-Message-State: AOAM5322ZpbUheMKUBo5nzg/9q8r66Zpvxg2V6CXTTTG88MHx1pQzir5
        l8RldyAe5om8wpIulQS9JIzDVIkB3gqDKA==
X-Google-Smtp-Source: ABdhPJwc+lIH9c0xosPsuoIkjAFEC4kDyYSwv3M8bV2yhcP/v+CfvF4UPYzbGQOJLz2n+QgZRcp7eg==
X-Received: by 2002:a37:a64b:: with SMTP id p72mr2849888qke.447.1631381819475;
        Sat, 11 Sep 2021 10:36:59 -0700 (PDT)
Received: from Arrakis.djogorchock.com (pool-173-68-59-147.nycmny.fios.verizon.net. [173.68.59.147])
        by smtp.gmail.com with ESMTPSA id m5sm1594286qkn.33.2021.09.11.10.36.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 11 Sep 2021 10:36:58 -0700 (PDT)
From:   "Daniel J. Ogorchock" <djogorchock@gmail.com>
To:     linux-input@vger.kernel.org
Cc:     thunderbird2k@gmail.com, blaws05@gmail.com,
        benjamin.tissoires@redhat.com, jikos@kernel.org,
        Roderick.Colenbrander@sony.com, svv@google.com, s.jegen@gmail.com,
        carmueller@gmail.com, pgriffais@valvesoftware.com,
        hadess@hadess.net, pobrn@protonmail.com, lee.jones@linaro.org,
        "Daniel J. Ogorchock" <djogorchock@gmail.com>
Subject: [PATCH v16 07/16] HID: nintendo: send subcommands after receiving input report
Date:   Sat, 11 Sep 2021 13:36:30 -0400
Message-Id: <20210911173639.5688-8-djogorchock@gmail.com>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20210911173639.5688-1-djogorchock@gmail.com>
References: <20210911173639.5688-1-djogorchock@gmail.com>
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
index a95943c2fc6c0..a000a287206e8 100644
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

