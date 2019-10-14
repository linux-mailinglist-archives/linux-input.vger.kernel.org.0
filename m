Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 8C38ED58FC
	for <lists+linux-input@lfdr.de>; Mon, 14 Oct 2019 02:22:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729431AbfJNAW4 (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Sun, 13 Oct 2019 20:22:56 -0400
Received: from mail-io1-f66.google.com ([209.85.166.66]:44233 "EHLO
        mail-io1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729296AbfJNAWz (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Sun, 13 Oct 2019 20:22:55 -0400
Received: by mail-io1-f66.google.com with SMTP id w12so34189176iol.11
        for <linux-input@vger.kernel.org>; Sun, 13 Oct 2019 17:22:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=csnTcHAp5vpyLV0D+KYbXGjd7O7SAXk6v1wiupWy7VM=;
        b=iiQrsANNFnVorGC4F/KxetUsk1NtVx/oYjNSRiqxNVqL7rIRHiD1jXId1ua1PzSYIg
         4v3ue/sApjJE8JdNVc3g+0aQDuwHwY1onmXrmtuZf0a34jrYT2hUHPIWMOmUyEwHnuL/
         /fo7rqaFLMF83oMAx937IcX7cZ3gMekNLKX7XOJBJyGpt0sD47gqzann0rqa0kTBKmQU
         SIGECTYNbKgkbQhpe1cHeeUoW1D+GegvvKcOrkjPaNst4NPtnKsCAJ4sDlYvK1K3hpKE
         QboK1iC6EN1PxTfMkUAvDv47kWg5NsizhD6adDKXIOlNnM50rZRzmQ47Za0o2z2b6ucD
         +6AA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=csnTcHAp5vpyLV0D+KYbXGjd7O7SAXk6v1wiupWy7VM=;
        b=Pr7DfoT7PAd94tx+qsZ7zPzEbi9+BlyXQbcpy5lDydGqIwmo7zjE0X+xO8x4qsBnpL
         Kpwv+Ew6oMzSmYR9KCVey8wEq9uJwr9643WYHVHY10Fbk1DIgn3VFiHC7a1r+EsJCv7q
         9saVPa67AM/cvyyhWyKihBKChqw1vN9y5oprTqZqH9FvLzanV87NMWrajPAWHoslm84+
         6ZvgR5PFlOwCdGCsOBO+DqBsiW8974hXlTIXuopMwaBAp37A5EFrD2E5YlPl/r1fD6lP
         rpfbyN13l7bxsYb171MWPageAy9+IOXFjtrtlyA1M94W3jJBG72PifRJGDBNFXPWOXDG
         Zh/w==
X-Gm-Message-State: APjAAAVzGtVbADfYTjTu0e/mJWevSi+z/NoJLaPVpUQgfZKuuzEmvQJW
        INWn+XJl62tJgmFX0SlG7n6UuVw5t6I=
X-Google-Smtp-Source: APXvYqwG37xy2uqTdj2ab+9VtGOQaHzvt3mT4tp7sYaFD2Ge5lpnchcO20Bxcf2zdm2axa+eF1u1bQ==
X-Received: by 2002:a6b:be81:: with SMTP id o123mr14811643iof.86.1571012574630;
        Sun, 13 Oct 2019 17:22:54 -0700 (PDT)
Received: from Arrakis.djogorchock.com ([136.61.189.171])
        by smtp.gmail.com with ESMTPSA id s201sm22103963ios.83.2019.10.13.17.22.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 13 Oct 2019 17:22:53 -0700 (PDT)
From:   "Daniel J. Ogorchock" <djogorchock@gmail.com>
To:     linux-input@vger.kernel.org
Cc:     thunderbird2k@gmail.com, blaws05@gmail.com,
        benjamin.tissoires@redhat.com, jikos@kernel.org,
        Roderick.Colenbrander@sony.com, svv@google.com, s.jegen@gmail.com,
        "Daniel J. Ogorchock" <djogorchock@gmail.com>
Subject: [PATCH v8 8/9] HID: nintendo: reduce device removal subcommand errors
Date:   Sun, 13 Oct 2019 19:22:40 -0500
Message-Id: <20191014002241.2560195-9-djogorchock@gmail.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20191014002241.2560195-1-djogorchock@gmail.com>
References: <20191014002241.2560195-1-djogorchock@gmail.com>
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
 drivers/hid/hid-nintendo.c | 27 ++++++++++++++++++++++++---
 1 file changed, 24 insertions(+), 3 deletions(-)

diff --git a/drivers/hid/hid-nintendo.c b/drivers/hid/hid-nintendo.c
index d51d701fa21c..333d1e0d07d6 100644
--- a/drivers/hid/hid-nintendo.c
+++ b/drivers/hid/hid-nintendo.c
@@ -324,6 +324,7 @@ struct joycon_ctlr {
 	u8 usb_ack_match;
 	u8 subcmd_ack_match;
 	bool received_input_report;
+	bool ctlr_removed;
 
 	/* factory calibration data */
 	struct joycon_stick_cal left_stick_cal_x;
@@ -391,10 +392,12 @@ static int joycon_hid_send_sync(struct joycon_ctlr *ctlr, u8 *data, size_t len,
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
@@ -446,6 +449,14 @@ static int joycon_send_subcmd(struct joycon_ctlr *ctlr,
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
@@ -773,10 +784,12 @@ static void joycon_rumble_worker(struct work_struct *work)
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
@@ -1454,9 +1467,17 @@ static int nintendo_hid_probe(struct hid_device *hdev,
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
 	destroy_workqueue(ctlr->rumble_queue);
+
 	hid_hw_close(hdev);
 	hid_hw_stop(hdev);
 }
-- 
2.23.0

