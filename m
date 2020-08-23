Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0D87524EB62
	for <lists+linux-input@lfdr.de>; Sun, 23 Aug 2020 06:42:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726345AbgHWEmd (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Sun, 23 Aug 2020 00:42:33 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59414 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726056AbgHWEm2 (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Sun, 23 Aug 2020 00:42:28 -0400
Received: from mail-ot1-x342.google.com (mail-ot1-x342.google.com [IPv6:2607:f8b0:4864:20::342])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 01973C0613ED
        for <linux-input@vger.kernel.org>; Sat, 22 Aug 2020 21:42:27 -0700 (PDT)
Received: by mail-ot1-x342.google.com with SMTP id 5so1883901otp.12
        for <linux-input@vger.kernel.org>; Sat, 22 Aug 2020 21:42:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=5BapThEX9wd+p/pPXL0LmGX/oPuRXFrOhFaZ1kMOrZ4=;
        b=M5QYTRYlo3JQKQdXsrOietayXM5x//64dak4Cnkf0M99VPgCQUJcloDvDw63fNKXTp
         CCAqkzhcfKp7lOEj2YRaUo7xV0v/GlVTTgrIyr/tIxVG2f7ifyemHsHSlTCEhDtf4LLv
         gYsoRBcoO6bohU1MVT0PSzNnRnewcWUHzRviKGjQ6cc8rlJHcWsTLG9BEepRlQbazaZu
         IgTBfJTZwgYgl6oi1IqTUVnQIJ5u4Ld+mh7bpS6DMgwRpF96+FYVIYL/3S7FGk7rhaBV
         bbeKMfUJ70uy0ffRE5npkDbRUwAustomRqqe1HQ+bkBCHWHurbag7ixnTEaHjBEAgOHH
         V/dw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=5BapThEX9wd+p/pPXL0LmGX/oPuRXFrOhFaZ1kMOrZ4=;
        b=XBJ2/OpCF5AOqvIUY8WiNq1Jp9xT9+RYkgzUYkF4j7iRhHEcEwbQkeeNeKAYGyfNLB
         IU84uebGK/FRHk9Cg+OuKgdy+0OGtih221p4xAyCTfNOLLdl7BoNDYhDRMDCa0wc12YZ
         xIoBWRuwEK+yE7WGHVXl48xnWd49nSthrtusCDH5uF6HXjO7OqVdoCJH8TPgU9InUfPz
         //CWe/PUvh8WZdEJt+cY24bLmEnxQdm33lFJPb2aKccgJN/63zUXGl2CSxZhDLqnx8HZ
         tsZL5eU8/qJ3aDgwQDlzd5zYEVLEJbs7zC/ywgniknBqd7AFUBWNCTBnIlCNpMP8JeNe
         UN6w==
X-Gm-Message-State: AOAM532XT5PxlhnSRyFBSHZF3wdtNrjKyNfOz/bYa/eIgusGOFtoJ+UM
        IyO50Zx7WVAxk4etMFX+ZdXYMHJh+k41RLEg
X-Google-Smtp-Source: ABdhPJyMdHQReryhcn6cFU5gFQ1RvjXWKtZokxgkJMxMUNqv7r9Q7swTONo4FwHk8Wg2w+c4MqPdnQ==
X-Received: by 2002:a9d:942:: with SMTP id 60mr281843otp.32.1598157747085;
        Sat, 22 Aug 2020 21:42:27 -0700 (PDT)
Received: from Arrakis.djogorchock.com ([136.33.205.58])
        by smtp.gmail.com with ESMTPSA id z10sm1308572otk.6.2020.08.22.21.42.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 22 Aug 2020 21:42:26 -0700 (PDT)
From:   "Daniel J. Ogorchock" <djogorchock@gmail.com>
To:     linux-input@vger.kernel.org
Cc:     thunderbird2k@gmail.com, blaws05@gmail.com,
        benjamin.tissoires@redhat.com, jikos@kernel.org,
        Roderick.Colenbrander@sony.com, svv@google.com, s.jegen@gmail.com,
        carmueller@gmail.com, pgriffais@valvesoftware.com,
        hadess@hadess.net, "Daniel J. Ogorchock" <djogorchock@gmail.com>
Subject: [PATCH v12 08/14] HID: nintendo: reduce device removal subcommand errors
Date:   Sat, 22 Aug 2020 23:41:51 -0500
Message-Id: <20200823044157.339677-9-djogorchock@gmail.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20200823044157.339677-1-djogorchock@gmail.com>
References: <20200823044157.339677-1-djogorchock@gmail.com>
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
 drivers/hid/hid-nintendo.c | 24 ++++++++++++++++++++++--
 1 file changed, 22 insertions(+), 2 deletions(-)

diff --git a/drivers/hid/hid-nintendo.c b/drivers/hid/hid-nintendo.c
index 2ec099dc3869..f2864fd9fc5d 100644
--- a/drivers/hid/hid-nintendo.c
+++ b/drivers/hid/hid-nintendo.c
@@ -230,6 +230,7 @@ static const struct joycon_rumble_amp_data joycon_rumble_amplitudes[] = {
 enum joycon_ctlr_state {
 	JOYCON_CTLR_STATE_INIT,
 	JOYCON_CTLR_STATE_READ,
+	JOYCON_CTLR_STATE_REMOVED,
 };
 
 struct joycon_stick_cal {
@@ -451,6 +452,14 @@ static int joycon_send_subcmd(struct joycon_ctlr *ctlr,
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
@@ -800,10 +809,13 @@ static void joycon_rumble_worker(struct work_struct *work)
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
@@ -1517,9 +1529,17 @@ static int nintendo_hid_probe(struct hid_device *hdev,
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
2.28.0

