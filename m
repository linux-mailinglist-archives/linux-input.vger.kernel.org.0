Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 780D4F0EBB
	for <lists+linux-input@lfdr.de>; Wed,  6 Nov 2019 07:07:08 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730192AbfKFGHI (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 6 Nov 2019 01:07:08 -0500
Received: from mail-yw1-f66.google.com ([209.85.161.66]:45765 "EHLO
        mail-yw1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729966AbfKFGHH (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Wed, 6 Nov 2019 01:07:07 -0500
Received: by mail-yw1-f66.google.com with SMTP id j137so3001803ywa.12
        for <linux-input@vger.kernel.org>; Tue, 05 Nov 2019 22:07:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=RUUVI4tPjb0488dqXuiXLvB7XNzExNqZK4N7eC+BHN0=;
        b=VSs+pl02MTiBfd+L4DqKOgdi0GzMKby9A27kHHtpABmbycbWgkHF9OFEeNtQy8DLiv
         ybnaBNyOkINg44O+J1HQiEeCOBa4s+dNpHDBv25NamkXk3NrrQ5b9KXAzPsdgStZ92ci
         T7oyDGJdF5zhEfeBBAftP8UpTID98tBAcSpE1wVzxmYBRaIbWeNkWff7gN8xBji23uhi
         m/buUYu1rPp+9cVm8gKYxE3VqoQ03D9JvLRhK7JqKyklfmryQ1PYSu/x635T6gnjihG6
         rj/RZdb+3tdceQ/L/zaRMpkPvhsiBZeX5ORn4XvrHrFoCKKOFeX5cO/o4jZTU0kCtHfK
         ENnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=RUUVI4tPjb0488dqXuiXLvB7XNzExNqZK4N7eC+BHN0=;
        b=WrQrzrmNAiX2r18rmR24qlSuYxSNoLqXapSxoHfa2jtooBz5X7Wc0YMF63kYCfsDcM
         F972B88OjdWnCVr4IfmnyWDtg+eMOyqwPtG5Z+NuNanbcP5pTRqIB9t5uAfAX50z6KAR
         P54YbcCm3g9oFSXbFh7HaVPSA+gcCc3ckQVqpuu9JTatvzOlV/r+/Q2Jwk2/OJpMpf2B
         kJj0qzKyaWSxML2xmdRXDPcl6SYNEc3YMQPT2BZYpt9G+60tyy/++3jEv7NZbEYazNF7
         zUQI8ySYH/zMDfnTEN0yLxu37+HYdb0rwvvPCHhe0n5J7sByy1Jo9BsxoTIteONGQzHL
         Ta+g==
X-Gm-Message-State: APjAAAUS68GqmFAcf9hOFaSLH0wF1KSVKTNLIiycRI/zWxgZaTfkskzp
        oulaCU9SPRN6dNFWqstZ2jP+BkmCzeD4cA==
X-Google-Smtp-Source: APXvYqxZ2LMeu1ZT5S8+HGMKPVDYlW3hFpi95Ks1ghcygZXaAY0RRYKSZsSWwQ7AobxP+3uL5WCbHQ==
X-Received: by 2002:a81:1e54:: with SMTP id e81mr418487ywe.437.1573020426774;
        Tue, 05 Nov 2019 22:07:06 -0800 (PST)
Received: from Arrakis.djogorchock.com ([136.33.205.58])
        by smtp.gmail.com with ESMTPSA id e82sm11039596ywb.87.2019.11.05.22.07.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 Nov 2019 22:07:06 -0800 (PST)
From:   "Daniel J. Ogorchock" <djogorchock@gmail.com>
To:     linux-input@vger.kernel.org
Cc:     thunderbird2k@gmail.com, blaws05@gmail.com,
        benjamin.tissoires@redhat.com, jikos@kernel.org,
        Roderick.Colenbrander@sony.com, svv@google.com, s.jegen@gmail.com,
        "Daniel J. Ogorchock" <djogorchock@gmail.com>
Subject: [PATCH v9 08/10] HID: nintendo: reduce device removal subcommand errors
Date:   Wed,  6 Nov 2019 00:06:46 -0600
Message-Id: <20191106060648.3018478-9-djogorchock@gmail.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20191106060648.3018478-1-djogorchock@gmail.com>
References: <20191106060648.3018478-1-djogorchock@gmail.com>
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
index 14ffd188ef78..074fd59decbe 100644
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
@@ -1449,9 +1462,17 @@ static int nintendo_hid_probe(struct hid_device *hdev,
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

