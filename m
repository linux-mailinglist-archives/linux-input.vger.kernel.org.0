Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6AC9B4079F5
	for <lists+linux-input@lfdr.de>; Sat, 11 Sep 2021 19:37:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232635AbhIKRiQ (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Sat, 11 Sep 2021 13:38:16 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48548 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232985AbhIKRiP (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Sat, 11 Sep 2021 13:38:15 -0400
Received: from mail-qk1-x731.google.com (mail-qk1-x731.google.com [IPv6:2607:f8b0:4864:20::731])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8E84FC061574
        for <linux-input@vger.kernel.org>; Sat, 11 Sep 2021 10:37:01 -0700 (PDT)
Received: by mail-qk1-x731.google.com with SMTP id a10so5781719qka.12
        for <linux-input@vger.kernel.org>; Sat, 11 Sep 2021 10:37:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=7/xIbnp5ZVSaeqEchGpv2YmibEAZBCWsjfrCBMSqhGc=;
        b=kXdxKGKA5OMUZ+6KXUoyeO/uSvm9TEoeogomQ+EUrPSkB9NTAorPqeXUtbiFCQ9v2F
         NDzxgQVEKDJOEqeDVrkPu4WXP5cvmEap9GdJ5njvpYXS/Us7XDi/xh16i0F/JPzIC1b3
         FTjfGSDWJq7pJ+ALQmUoRaD9hX23ImGiopWvqc4oHIoLyLKog4twOkaUHEBq+7Oc7Uot
         xKncOO+mPJ3AtAdWppAShqaRcu3uZKUKY/BGbAMYEhPdllrEp/pnDvxY5/Zh/9Obo61f
         4t6bcrXauTFuwWuIQNbqrMXHoHUFrY+rvc2m+7hIagYnGAy8TRBUE1okxT2brRkgWDrT
         aESw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=7/xIbnp5ZVSaeqEchGpv2YmibEAZBCWsjfrCBMSqhGc=;
        b=SO3MnxRCaWnEAoXKeWNAThwG/Im9nlPavGBYg09miICHn9YwivFqdXTs0jhjOOc92e
         1HGIKNYMdpYO+ZfrskAZ9wl/dcNqgn3UnQsYzj0Wykm6PZXfCv7sOawQf7gSBhnkevfT
         Cs+4aX4HV1Xc+Y8iAIMyoG87ljIIBQKlTqxtx5ApU2yWpzo1tXh9n6vIl1J3fJ2Wpw3f
         X0rG0iHZxPiyEE3xLrtGLeDXGdl2EGs6tCToQ1DiRvgySoYSWl65f8peQkks9yWSFVLy
         Toth7LxnrMa6U2Gdb13jtmJ1Y7akm/oJC5mjqCDV7p/1UmbJJaIfFPGPo2y9FS9+K3WG
         O25w==
X-Gm-Message-State: AOAM530jIUCn5N6yTPXFtNXFPD1U+ZySgyJyABzfk+mJwWKXLJFm9ss4
        F1UlTQnZIkvPZnUpgPrWFzAjkD2z/DvQEQ==
X-Google-Smtp-Source: ABdhPJy6CXbE6sL+lmM00ogqhFQ5afYBJN2WFiANwYKrm2dwCUJesZ9BeCIMAP24WL6g6xjm4x8PVQ==
X-Received: by 2002:a05:620a:2451:: with SMTP id h17mr3024570qkn.168.1631381820654;
        Sat, 11 Sep 2021 10:37:00 -0700 (PDT)
Received: from Arrakis.djogorchock.com (pool-173-68-59-147.nycmny.fios.verizon.net. [173.68.59.147])
        by smtp.gmail.com with ESMTPSA id m5sm1594286qkn.33.2021.09.11.10.36.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 11 Sep 2021 10:36:59 -0700 (PDT)
From:   "Daniel J. Ogorchock" <djogorchock@gmail.com>
To:     linux-input@vger.kernel.org
Cc:     thunderbird2k@gmail.com, blaws05@gmail.com,
        benjamin.tissoires@redhat.com, jikos@kernel.org,
        Roderick.Colenbrander@sony.com, svv@google.com, s.jegen@gmail.com,
        carmueller@gmail.com, pgriffais@valvesoftware.com,
        hadess@hadess.net, pobrn@protonmail.com, lee.jones@linaro.org,
        "Daniel J. Ogorchock" <djogorchock@gmail.com>
Subject: [PATCH v16 08/16] HID: nintendo: reduce device removal subcommand errors
Date:   Sat, 11 Sep 2021 13:36:31 -0400
Message-Id: <20210911173639.5688-9-djogorchock@gmail.com>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20210911173639.5688-1-djogorchock@gmail.com>
References: <20210911173639.5688-1-djogorchock@gmail.com>
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
index a000a287206e8..cda0118ebd14b 100644
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

