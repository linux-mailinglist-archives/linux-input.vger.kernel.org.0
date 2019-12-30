Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id BC33612CBA1
	for <lists+linux-input@lfdr.de>; Mon, 30 Dec 2019 02:27:38 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726654AbfL3B1i (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Sun, 29 Dec 2019 20:27:38 -0500
Received: from mail-yb1-f196.google.com ([209.85.219.196]:43035 "EHLO
        mail-yb1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726626AbfL3B1h (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Sun, 29 Dec 2019 20:27:37 -0500
Received: by mail-yb1-f196.google.com with SMTP id v24so13565672ybd.10
        for <linux-input@vger.kernel.org>; Sun, 29 Dec 2019 17:27:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=ymIB6k3kyRa46xcthMf1MVE2bano9evSFfQe2j/4sMM=;
        b=VRtSIePFOXvplmQpUUW4DAqA9dElo9IHmrjunC45x71VNYXAlhD0/x5z9RuElWG5rL
         pXrCr8NbfOW4UMRwPvt4ZIQ3u4k5AqBy8mveUvSM+odXpifjsplwnn4TM6hVrmCa8JQm
         pllczaNs4RjKcrfbQlzz+1bMKMpHZF2g7BKJjOMprrCpj/8+Ej5cmUtbdP11RSFwyVaT
         wo+jfwLfTmWG+K6CnY6tsKlILmrPZgYfKJeoSgvmI1A2MyGOmp3DW5D+vMwOdWAIG7Xe
         /10ERzMcO8/WuyfZppUvh13EnSq85SOrMmFT/sb62qqY2XNa96zOWmB0YQBdibWF60pq
         z6eg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=ymIB6k3kyRa46xcthMf1MVE2bano9evSFfQe2j/4sMM=;
        b=MT5G7gHgpqY2ixX8YsQCB7F2RHjx0hHsiwfF14jz6f/apao2WNZTXRR8LUoncM1k0u
         T3Q16ki79VWwuch+d5YszcuDXCRUpS0Lsx0IzAXt4oLaxmZfGFbvh7Xrg+Ej0sl7n8Q8
         Mpyhb2w7v+IpGivd4bjJJCvigg7EbLSrVhu4XQlZAAn++5183YU0Wbrn4YpviR0xIi9K
         /kVWF/PF5MMTzjYJawlv3TlV8EAtzztrDfrUUSB4984bAfr8ukezh5tyOiIe5gj5waSx
         CcnyA0KQbQbY052eFZMAbib+NgvcJtvHbBwPZg2azXMd0dBagf+EfhWOPKAkP7gJpujL
         kW0w==
X-Gm-Message-State: APjAAAWIyHMErKUtL7bwKRFdOHsUaO9Y9NrohZg7q8YV4Dyr6HFeK8Da
        vchcC+wo3/bfQbKHBxTH0dCm06rnUmw=
X-Google-Smtp-Source: APXvYqznTVict70dJYbySCftB1tJoIwTMcWuco4GokvOe5ZuocOpvsfwTo8vHWD8bipJ62X+rWQh6A==
X-Received: by 2002:a25:d18c:: with SMTP id i134mr39896576ybg.38.1577669256959;
        Sun, 29 Dec 2019 17:27:36 -0800 (PST)
Received: from Arrakis.djogorchock.com ([136.33.205.58])
        by smtp.gmail.com with ESMTPSA id g11sm17175584ywe.14.2019.12.29.17.27.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 29 Dec 2019 17:27:36 -0800 (PST)
From:   "Daniel J. Ogorchock" <djogorchock@gmail.com>
To:     linux-input@vger.kernel.org
Cc:     thunderbird2k@gmail.com, blaws05@gmail.com,
        benjamin.tissoires@redhat.com, jikos@kernel.org,
        Roderick.Colenbrander@sony.com, svv@google.com, s.jegen@gmail.com,
        carmueller@gmail.com, "Daniel J. Ogorchock" <djogorchock@gmail.com>
Subject: [PATCH v10 08/12] HID: nintendo: reduce device removal subcommand errors
Date:   Sun, 29 Dec 2019 19:27:16 -0600
Message-Id: <20191230012720.2368987-9-djogorchock@gmail.com>
X-Mailer: git-send-email 2.24.1
In-Reply-To: <20191230012720.2368987-1-djogorchock@gmail.com>
References: <20191230012720.2368987-1-djogorchock@gmail.com>
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
 drivers/hid/hid-nintendo.c | 26 ++++++++++++++++++++++++--
 1 file changed, 24 insertions(+), 2 deletions(-)

diff --git a/drivers/hid/hid-nintendo.c b/drivers/hid/hid-nintendo.c
index 152d7eb9c27d..4653a0a10782 100644
--- a/drivers/hid/hid-nintendo.c
+++ b/drivers/hid/hid-nintendo.c
@@ -225,6 +225,7 @@ static const struct joycon_rumble_amp_data joycon_rumble_amplitudes[] = {
 enum joycon_ctlr_state {
 	JOYCON_CTLR_STATE_INIT,
 	JOYCON_CTLR_STATE_READ,
+	JOYCON_CTLR_STATE_REMOVED,
 };
 
 struct joycon_stick_cal {
@@ -391,10 +392,12 @@ static int joycon_hid_send_sync(struct joycon_ctlr *ctlr, u8 *data, size_t len,
 			ret = wait_event_timeout(ctlr->wait,
 						 ctlr->received_input_report,
 						 HZ / 4);
+			spin_lock_irqsave(&ctlr->lock, flags);
 			/* We will still proceed, even with a timeout here */
 			if (!ret)
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
+	if (ctlr->ctlr_state == JOYCON_CTLR_STATE_REMOVED) {
+		spin_unlock_irqrestore(&ctlr->lock, flags);
+		return -ENODEV;
+	}
 	memcpy(subcmd->rumble_data, ctlr->rumble_data[ctlr->rumble_queue_tail],
 	       JC_RUMBLE_DATA_SIZE);
 	spin_unlock_irqrestore(&ctlr->lock, flags);
@@ -772,10 +783,13 @@ static void joycon_rumble_worker(struct work_struct *work)
 		mutex_lock(&ctlr->output_mutex);
 		ret = joycon_enable_rumble(ctlr, true);
 		mutex_unlock(&ctlr->output_mutex);
-		if (ret < 0)
-			hid_warn(ctlr->hdev, "Failed to set rumble; e=%d", ret);
 
+		/* -ENODEV means the controller was just unplugged */
 		spin_lock_irqsave(&ctlr->lock, flags);
+		if (ret < 0 && ret != -ENODEV &&
+		    ctlr->ctlr_state != JOYCON_CTLR_STATE_REMOVED)
+			hid_warn(ctlr->hdev, "Failed to set rumble; e=%d", ret);
+
 		ctlr->rumble_msecs = jiffies_to_msecs(jiffies);
 		if (ctlr->rumble_queue_tail != ctlr->rumble_queue_head) {
 			if (++ctlr->rumble_queue_tail >= JC_RUMBLE_QUEUE_SIZE)
@@ -1465,9 +1479,17 @@ static int nintendo_hid_probe(struct hid_device *hdev,
 static void nintendo_hid_remove(struct hid_device *hdev)
 {
 	struct joycon_ctlr *ctlr = hid_get_drvdata(hdev);
+	unsigned long flags;
 
 	hid_dbg(hdev, "remove\n");
+
+	/* Prevent further attempts at sending subcommands. */
+	spin_lock_irqsave(&ctlr->lock, flags);
+	ctlr->ctlr_state = JOYCON_CTLR_STATE_REMOVED;
+	spin_unlock_irqrestore(&ctlr->lock, flags);
+
 	destroy_workqueue(ctlr->rumble_queue);
+
 	hid_hw_close(hdev);
 	hid_hw_stop(hdev);
 }
-- 
2.24.1

