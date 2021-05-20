Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C116738B9A5
	for <lists+linux-input@lfdr.de>; Fri, 21 May 2021 00:47:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231879AbhETWtA (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 20 May 2021 18:49:00 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55792 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231876AbhETWs7 (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Thu, 20 May 2021 18:48:59 -0400
Received: from mail-qk1-x736.google.com (mail-qk1-x736.google.com [IPv6:2607:f8b0:4864:20::736])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 55575C061761
        for <linux-input@vger.kernel.org>; Thu, 20 May 2021 15:47:37 -0700 (PDT)
Received: by mail-qk1-x736.google.com with SMTP id h20so2430179qko.11
        for <linux-input@vger.kernel.org>; Thu, 20 May 2021 15:47:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=0BVMlO847dX6VbVdsAQsjLW9yq9tSZMZzpys90okjro=;
        b=f+lkfBEw25oLcXLr4DcVQVpFueKqkPrJ4CLhwtmIdwHU5GkyI+U7y5EnDkxSGZJThz
         LMy8npoXkmwQpVHhLSYCczm6XPFWcsDyK5JmOLk4mWw28wIYryrhnPrNnmOul1ZnwXTw
         p+/XbK8n3mPRTK1oo/nQNf/dS8R5Y1kr97HTDlNqlsPzdVQcZmMhUh66Z9sM6gSwd6XI
         dZEnoPtmG4AuApXkn1QDh/xTGxSeISlg438TjbcKda4GlZGFdCCgsbOK+Tg9bEn1jDer
         Tc+rkEhfdvZKXw+Ncs12HiUhBAlnd8i+VPMUkq22CFyzNx9kyi0R4QyjIipsVFAM1ba3
         hBdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=0BVMlO847dX6VbVdsAQsjLW9yq9tSZMZzpys90okjro=;
        b=gTuy3kvd8MFpQwcXujzi/pL0JQMrM2XHkMD/j0m0jA/Wnr2SCT/erH7AQjm/hUcVK/
         i7sJPP107/jASAdjBGbqfdb3a2saOTbmRV2NW0yAiUdcC7n/mYCiDbGjKjwXW3GtGEaj
         A9xSGvZ5zUikaJOx4QckC+1J9mucqSvVrCgHDwPH2MsLuRM8TgK+WV/4waF0uCml5EFl
         aJgw4nlj6wYg+pi2UKJ+E9h0f7Ag+SNtHqbfafmShYxN3yivyEXMw/OlIDUZ8PVJtamH
         k0QpvTBk+5eyva0gkgUZ7BRy+gSLsfCIZNI4z9hl8ml1s4cLWALAJYnCrf3U8ouNM0MY
         owkA==
X-Gm-Message-State: AOAM533LqQOLQET0ftyj5ALde3vvZqwhl1NwsTdppvNdUrJNDz6jn+DO
        V4GjUPrKHwSjUWVA3SG1vqK03835JxUJsw==
X-Google-Smtp-Source: ABdhPJyQzXzkq32d5WF/G23dIS0dujDE4UtMwfUqv/bJA3RApg380F2MGgPQgmu/uc1tfVkfaCJhcg==
X-Received: by 2002:a05:620a:146d:: with SMTP id j13mr8030066qkl.493.1621550856417;
        Thu, 20 May 2021 15:47:36 -0700 (PDT)
Received: from Arrakis.djogorchock.com (pool-173-68-68-24.nycmny.fios.verizon.net. [173.68.68.24])
        by smtp.gmail.com with ESMTPSA id s11sm2126251qtn.77.2021.05.20.15.47.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 May 2021 15:47:35 -0700 (PDT)
From:   "Daniel J. Ogorchock" <djogorchock@gmail.com>
To:     linux-input@vger.kernel.org
Cc:     thunderbird2k@gmail.com, blaws05@gmail.com,
        benjamin.tissoires@redhat.com, jikos@kernel.org,
        Roderick.Colenbrander@sony.com, svv@google.com, s.jegen@gmail.com,
        carmueller@gmail.com, pgriffais@valvesoftware.com,
        hadess@hadess.net, "Daniel J. Ogorchock" <djogorchock@gmail.com>
Subject: [PATCH v13 08/15] HID: nintendo: reduce device removal subcommand errors
Date:   Thu, 20 May 2021 18:47:08 -0400
Message-Id: <20210520224715.680919-9-djogorchock@gmail.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210520224715.680919-1-djogorchock@gmail.com>
References: <20210520224715.680919-1-djogorchock@gmail.com>
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
index 3c450b378efa3..15cdcd9ef4f54 100644
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
@@ -1515,9 +1527,17 @@ static int nintendo_hid_probe(struct hid_device *hdev,
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
2.31.1

