Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8EE1F3D4B2C
	for <lists+linux-input@lfdr.de>; Sun, 25 Jul 2021 05:27:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230089AbhGYCrV (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Sat, 24 Jul 2021 22:47:21 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44398 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230162AbhGYCrV (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Sat, 24 Jul 2021 22:47:21 -0400
Received: from mail-qt1-x82e.google.com (mail-qt1-x82e.google.com [IPv6:2607:f8b0:4864:20::82e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4BF75C06175F
        for <linux-input@vger.kernel.org>; Sat, 24 Jul 2021 20:27:51 -0700 (PDT)
Received: by mail-qt1-x82e.google.com with SMTP id h27so4569706qtu.9
        for <linux-input@vger.kernel.org>; Sat, 24 Jul 2021 20:27:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=qBvatRTJQZwVGjtXMQXKQaG+aSaVgF3BnXYZDm1I+uI=;
        b=d/Bescxs2d/jKmzuUR55qkhnn3J5R1ZDJqC/VqooB/nPSSJpnVolEk/HpmLpe9QFKg
         UWBsRlHZg1ZqNEVl65pjLW/vS3ZWTssheLP8cIhUwG2Kirim+CMnCSFaR2iOBWRIU+OP
         VNJCbesH+o7HUPuTnsekESgo57MFrK7U4ugydrrvEm6W6/Dh+sR3i9K1SzmefF8ft/UB
         OchxlMGXRoKJdjcEUuoVcEak511EpuL6B//Svt6RcJJEGDmhJtDN2jAcoSuRv1xTHTya
         usARabwo35JnheJKKlUsUSp9HHw0rA5IEpvTjBARS/WQKMdCj7zIAxYTx9K4rlDqLsMG
         Jr1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=qBvatRTJQZwVGjtXMQXKQaG+aSaVgF3BnXYZDm1I+uI=;
        b=M9lX3fvNSS8vXcwUgWiBZZkVeVkI+jld+szQiX58w1SgAKMA5a+zACfRBl1bF6IuuY
         fG0otwarxcP1tFvW+XLiECn1iGQPyXlpN8lbX5KJcE5WF9KQbwEexwfv1zGXNmn3GQ9X
         jbOkW8QTcJL0FEzV680rxpqCfDKu5Yo4GqtL7Hf5QJifbTppgusPiSQrfz8ApyzZtnuJ
         fmLNZYVtNm/SORzdehztICJDC6CV7/wIOLxcG37KYVT2x5gfrgJ/luVDy5dZ+vW8/uY9
         AtDuzDtlbvEGonw0J+P2W11WNjgBt3TvxD6bHUgfw6TWXYOY2DRRgunRwYYOp+H+GqaF
         wu9A==
X-Gm-Message-State: AOAM530WCYzFOeePCgMtWCv8MXVdNIh92/mCm6Km27lG25/GvG5vY65u
        t0naIx0SqoKIYNPryKRRecLwUTof0QqXgVUu
X-Google-Smtp-Source: ABdhPJzX0XTuLaXU12EhUyRdgMZu6iZ9Z6EHKinrF4Po4yi62uZLoNDrArSx8XUVv0YasTiC7wQWcw==
X-Received: by 2002:ac8:5a96:: with SMTP id c22mr9955281qtc.229.1627183670389;
        Sat, 24 Jul 2021 20:27:50 -0700 (PDT)
Received: from Arrakis.djogorchock.com (pool-98-116-189-238.nycmny.fios.verizon.net. [98.116.189.238])
        by smtp.gmail.com with ESMTPSA id j16sm4843738qkk.132.2021.07.24.20.27.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 24 Jul 2021 20:27:50 -0700 (PDT)
From:   "Daniel J. Ogorchock" <djogorchock@gmail.com>
To:     linux-input@vger.kernel.org
Cc:     thunderbird2k@gmail.com, blaws05@gmail.com,
        benjamin.tissoires@redhat.com, jikos@kernel.org,
        Roderick.Colenbrander@sony.com, svv@google.com, s.jegen@gmail.com,
        carmueller@gmail.com, pgriffais@valvesoftware.com,
        hadess@hadess.net, "Daniel J. Ogorchock" <djogorchock@gmail.com>
Subject: [PATCH v14 07/17] HID: nintendo: send subcommands after receiving input report
Date:   Sat, 24 Jul 2021 23:26:58 -0400
Message-Id: <20210725032707.440071-8-djogorchock@gmail.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20210725032707.440071-1-djogorchock@gmail.com>
References: <20210725032707.440071-1-djogorchock@gmail.com>
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
2.32.0

