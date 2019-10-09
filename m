Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E1BC0D0731
	for <lists+linux-input@lfdr.de>; Wed,  9 Oct 2019 08:29:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728187AbfJIG3K (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 9 Oct 2019 02:29:10 -0400
Received: from mail-io1-f66.google.com ([209.85.166.66]:36743 "EHLO
        mail-io1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729464AbfJIG3J (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Wed, 9 Oct 2019 02:29:09 -0400
Received: by mail-io1-f66.google.com with SMTP id b136so2534354iof.3
        for <linux-input@vger.kernel.org>; Tue, 08 Oct 2019 23:29:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=sTK2jpGVKtPzLSKXxWrg/sfMCq3l/SScSsePQOVIKpk=;
        b=oiG04WSRG6sTEAsoW3Jwopr/yYWX1Sad8jnen5cvnBhM1IdUUBmPNU4EvwCX12Q322
         kwcMHcFqsz9zFv//Xjg47u7aV2GBU0Otz6xvvw/+++q7OuJ3oMW4dJ4mK3/L1SOn2vLJ
         7SmtVn91IfXW/Qfm8QVSLAalR+VQy19DDxrg2pWuyvejMm9q91gR4Ld+AF9norSjvX1A
         vbCzYrgfUyDE+Tgl9OQZqQc2I/Eo/kyYaCbZ/1OC7hjv9WZUkdOTR/Xi8gBOGZCYvVrG
         bKZO2Jt68OOoQ4GZadUjCRgXbXnPRcx6dyqLW7FzW01J6k4LPMD7RR/3YiYDVMdn7wNH
         EKDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=sTK2jpGVKtPzLSKXxWrg/sfMCq3l/SScSsePQOVIKpk=;
        b=bfmJqKUNoqM73xGwaQDQGkillEbyQfolI6XweAIV8Q97vbGod9xTRDnj8YWmXFT++/
         70YIvYB0J2kM12EZpZ7uDCHaeahpPcidSc9gg217br5V259HOcsS4sqRbKXLZIhjclCp
         Xa3Nx0rABN6Cu/sNKhJNlSFeCw11FuCPqVpdDNddFnd41Gh3w8i2LBwPmOyHejCXgl2+
         3d6Messf4qeg8tUywUUnzNgm4eaMkodAPUFszD0OcWVDQPdXLwz8LwtDfTav3SNr3EMq
         2YssPXrj0wwb8jkDan3MtcVL7iNqZ+m4vwb8gRp+zOx+YYRz+UbeIg0y5ztPCGUiW7ZH
         +VVQ==
X-Gm-Message-State: APjAAAX3mKceJU0JtENthZEWMEoNa3lZ8QOdUmNg0rYaFhmwj6iyMU48
        lQBIxFk05w4O/tLlCVRBanzY+AQz4Z0=
X-Google-Smtp-Source: APXvYqwdEoLQ2s0VR9MzjgTU+9mAcI0tmEvVEdUfBybdOsZNlYwgVlW5Lk0sJ4oIsd6SJEL737cEqA==
X-Received: by 2002:a92:d0a:: with SMTP id 10mr1764129iln.238.1570602548814;
        Tue, 08 Oct 2019 23:29:08 -0700 (PDT)
Received: from Arrakis.djogorchock.com ([136.61.189.171])
        by smtp.gmail.com with ESMTPSA id r22sm880844ilb.85.2019.10.08.23.29.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Oct 2019 23:29:08 -0700 (PDT)
From:   "Daniel J. Ogorchock" <djogorchock@gmail.com>
To:     linux-input@vger.kernel.org
Cc:     thunderbird2k@gmail.com, blaws05@gmail.com,
        benjamin.tissoires@redhat.com, jikos@kernel.org,
        Roderick.Colenbrander@sony.com, svv@google.com, s.jegen@gmail.com,
        "Daniel J. Ogorchock" <djogorchock@gmail.com>
Subject: [PATCH v7 8/8] HID: nintendo: reduce device removal subcommand errors
Date:   Wed,  9 Oct 2019 01:28:33 -0500
Message-Id: <20191009062833.3599398-9-djogorchock@gmail.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20191009062833.3599398-1-djogorchock@gmail.com>
References: <20191009062833.3599398-1-djogorchock@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

This patch fixes meaningless error output from trying to send
subcommands immediately after controller removal. It now disables
subcommands as soon as possible on removal.

Signed-off-by: Daniel J. Ogorchock <djogorchock@gmail.com>
---
 drivers/hid/hid-nintendo.c | 26 +++++++++++++++++++++++---
 1 file changed, 23 insertions(+), 3 deletions(-)

diff --git a/drivers/hid/hid-nintendo.c b/drivers/hid/hid-nintendo.c
index 0c6fe135c750..3042ef5a54e1 100644
--- a/drivers/hid/hid-nintendo.c
+++ b/drivers/hid/hid-nintendo.c
@@ -324,6 +324,7 @@ struct joycon_ctlr {
 	u8 usb_ack_match;
 	u8 subcmd_ack_match;
 	bool received_input_report;
+	bool ctlr_removed;
 
 	/* factory calibration data */
 	struct joycon_stick_cal left_stick_cal_x;
@@ -390,10 +391,12 @@ static int joycon_hid_send_sync(struct joycon_ctlr *ctlr, u8 *data, size_t len,
 			ret = wait_event_timeout(ctlr->wait,
 						 ctlr->received_input_report,
 						 HZ / 4);
+			spin_lock_irqsave(&ctlr->lock, flags);
 			/* We will still proceed, even with a timeout here */
-			if (!ret)
+			if (!ret && !ctlr->ctlr_removed)
 				hid_warn(ctlr->hdev,
 					 "timeout waiting for input report\n");
+			spin_unlock_irqrestore(&ctlr->lock, flags);
 		}
 
 		ret = __joycon_hid_send(ctlr->hdev, data, len);
@@ -445,6 +448,14 @@ static int joycon_send_subcmd(struct joycon_ctlr *ctlr,
 	unsigned long flags;
 
 	spin_lock_irqsave(&ctlr->lock, flags);
+	/*
+	 * If the controller has been removed, just return ENODEV so the LED
+	 * subsystem doesn't print invalid errors on removal.
+	 */
+	if (ctlr->ctlr_removed) {
+		spin_unlock_irqrestore(&ctlr->lock, flags);
+		return -ENODEV;
+	}
 	memcpy(subcmd->rumble_data, ctlr->rumble_data[ctlr->rumble_queue_tail],
 	       JC_RUMBLE_DATA_SIZE);
 	spin_unlock_irqrestore(&ctlr->lock, flags);
@@ -772,10 +783,12 @@ static void joycon_rumble_worker(struct work_struct *work)
 		mutex_lock(&ctlr->output_mutex);
 		ret = joycon_enable_rumble(ctlr, true);
 		mutex_unlock(&ctlr->output_mutex);
-		if (ret < 0)
-			hid_warn(ctlr->hdev, "Failed to set rumble; e=%d", ret);
 
+		/* -ENODEV means the controller was just unplugged */
 		spin_lock_irqsave(&ctlr->lock, flags);
+		if (ret < 0 && ret != -ENODEV && !ctlr->ctlr_removed)
+			hid_warn(ctlr->hdev, "Failed to set rumble; e=%d", ret);
+
 		ctlr->rumble_msecs = jiffies_to_msecs(jiffies);
 		if (ctlr->rumble_queue_tail != ctlr->rumble_queue_head) {
 			if (++ctlr->rumble_queue_tail >= JC_RUMBLE_QUEUE_SIZE)
@@ -1443,8 +1456,15 @@ static int nintendo_hid_probe(struct hid_device *hdev,
 static void nintendo_hid_remove(struct hid_device *hdev)
 {
 	struct joycon_ctlr *ctlr = hid_get_drvdata(hdev);
+	unsigned long flags;
 
 	hid_dbg(hdev, "remove\n");
+
+	/* Prevent further attempts at sending subcommands. */
+	spin_lock_irqsave(&ctlr->lock, flags);
+	ctlr->ctlr_removed = true;
+	spin_unlock_irqrestore(&ctlr->lock, flags);
+
 	hid_hw_close(hdev);
 	hid_hw_stop(hdev);
 }
-- 
2.23.0

