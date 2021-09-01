Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8239D3FE667
	for <lists+linux-input@lfdr.de>; Thu,  2 Sep 2021 02:34:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237500AbhIAXnx (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 1 Sep 2021 19:43:53 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45680 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232479AbhIAXnw (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Wed, 1 Sep 2021 19:43:52 -0400
Received: from mail-qt1-x82a.google.com (mail-qt1-x82a.google.com [IPv6:2607:f8b0:4864:20::82a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8BE7DC061575
        for <linux-input@vger.kernel.org>; Wed,  1 Sep 2021 16:42:55 -0700 (PDT)
Received: by mail-qt1-x82a.google.com with SMTP id b4so96401qtx.0
        for <linux-input@vger.kernel.org>; Wed, 01 Sep 2021 16:42:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=4hI8ev2OTj2sYH2K1byscZJGz6u4ZmDOCxwsDBwpXjE=;
        b=D0MKEjg9zSnttUGhUL2MySHIAW5QM7GAzK0sbLJOmrpdRCyUl1TOLr21htvG0DjGJH
         oou/dS6yxd2PlZ8/5MUfEtc+R+Med1XwzAJ67DaoGeGmf2dJ7LrJtdRmXwh3/pC9wWjS
         lIRvVcMawyvR4U7/NRu/Q6M6DnEdmUOfJ5VYH1vkoEoNiLaQTuZSb23OClHjqeIDZG/X
         HiNyr7xW54qm6vJVAQN8RHd0z7onAS7Oc0kAmD+2RGIcYBX+EhgDJEvBcaC4OQq2d8bu
         icD1sVAozbdXg35seSjARHCvtAH30GC2GUl//ag5dyb3MtE1RHQzrSH4qR+yqa3i/kAg
         X/aw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=4hI8ev2OTj2sYH2K1byscZJGz6u4ZmDOCxwsDBwpXjE=;
        b=tN66jIOwvqHz4KHhR8KAqLRqK4yTBXIAs//MK7h3P+PiWxxQznCRgsCYIL3N7KyRxW
         zCpa9wiOZiR6FEf9hZ9XdItlWec6+132eOmmmhcgampjvCivK43CqHX5zpifTIolttmv
         ihe/oFcd1x8O47EPvXQS4Bf46qvY0Y99d/5WOLzHjunskdPl7XQ+pSEzRKaUFzHhkufW
         ZkMLwaPcuUk+jf8bau6YolZ7kIgPRedj2AdvsWpIYUu2G53RO6ZNiBVhC14VeACzb6uI
         lprJNCUqBesQxE/qAt/4xpnUd/SO0qDFttHqn+jrh2XjT3ZQa8QVl8OiPePQznRZFhXz
         U+bQ==
X-Gm-Message-State: AOAM5300OK5kbioQSPd0z0YUdNtJH1F6wrrYceayYN88SmaKoyWnwvTV
        14JWe+xOgAH8WY3qzlhcZkNeOE06QT8=
X-Google-Smtp-Source: ABdhPJxQ23OOFi3MeuCANLveF+/e1pv111bUFEvP2TCjiQxvjGrpiQK6seOpbq3VN//dwhtlfR/a2Q==
X-Received: by 2002:ac8:4a04:: with SMTP id x4mr308741qtq.301.1630539774626;
        Wed, 01 Sep 2021 16:42:54 -0700 (PDT)
Received: from Arrakis.djogorchock.com (pool-173-68-59-147.nycmny.fios.verizon.net. [173.68.59.147])
        by smtp.gmail.com with ESMTPSA id n5sm13422qtp.35.2021.09.01.16.42.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Sep 2021 16:42:54 -0700 (PDT)
From:   "Daniel J. Ogorchock" <djogorchock@gmail.com>
To:     linux-input@vger.kernel.org
Cc:     thunderbird2k@gmail.com, blaws05@gmail.com,
        benjamin.tissoires@redhat.com, jikos@kernel.org,
        Roderick.Colenbrander@sony.com, svv@google.com, s.jegen@gmail.com,
        carmueller@gmail.com, pgriffais@valvesoftware.com,
        hadess@hadess.net, pobrn@protonmail.com,
        "Daniel J. Ogorchock" <djogorchock@gmail.com>
Subject: [PATCH v15 08/16] HID: nintendo: reduce device removal subcommand errors
Date:   Wed,  1 Sep 2021 19:42:28 -0400
Message-Id: <20210901234236.3113-9-djogorchock@gmail.com>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20210901234236.3113-1-djogorchock@gmail.com>
References: <20210901234236.3113-1-djogorchock@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

This patch fixes meaningless error output from trying to send
subcommands immediately after controller removal. It now disables
subcommands as soon as possible on removal.

Signed-off-by: Daniel J. Ogorchock <djogorchock@gmail.com>
---
 drivers/hid/hid-nintendo.c | 24 ++++++++++++++++++++++--
 1 file changed, 22 insertions(+), 2 deletions(-)

diff --git a/drivers/hid/hid-nintendo.c b/drivers/hid/hid-nintendo.c
index daa95fa8e9a0b..c13fcd777fa21 100644
--- a/drivers/hid/hid-nintendo.c
+++ b/drivers/hid/hid-nintendo.c
@@ -230,6 +230,7 @@ static const struct joycon_rumble_amp_data joycon_rumble_amplitudes[] = {
 enum joycon_ctlr_state {
 	JOYCON_CTLR_STATE_INIT,
 	JOYCON_CTLR_STATE_READ,
+	JOYCON_CTLR_STATE_REMOVED,
 };
 
 struct joycon_stick_cal {
@@ -458,6 +459,14 @@ static int joycon_send_subcmd(struct joycon_ctlr *ctlr,
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
@@ -807,10 +816,13 @@ static void joycon_rumble_worker(struct work_struct *work)
 		mutex_lock(&ctlr->output_mutex);
 		ret = joycon_enable_rumble(ctlr);
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
@@ -1520,9 +1532,17 @@ static int nintendo_hid_probe(struct hid_device *hdev,
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
2.33.0

