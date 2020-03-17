Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 78FDB187831
	for <lists+linux-input@lfdr.de>; Tue, 17 Mar 2020 04:30:09 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726189AbgCQDaI (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 16 Mar 2020 23:30:08 -0400
Received: from mail-qk1-f195.google.com ([209.85.222.195]:41186 "EHLO
        mail-qk1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725783AbgCQDaI (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Mon, 16 Mar 2020 23:30:08 -0400
Received: by mail-qk1-f195.google.com with SMTP id s11so18915402qks.8
        for <linux-input@vger.kernel.org>; Mon, 16 Mar 2020 20:30:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=leVLAdT+W/buvZ8Zg3ry/YZKPP0/AxJaPWTc4uA+O2Y=;
        b=dILMJV/J2tt4Mh922sbRlk03nugYLYdCKFScZrvK6S7BTeIGdpU2b8OKi/Y4/8GsaD
         gvKVXtMVrccAF5CpGBSsJR69CxSUquCxBKLMPhoUcBhxN3sAvs0bU5SJ7M5yUtj3ZPdD
         34RntNlydVv6xDJMTr0J9Dcs81ZQqlhqmNDjrPKr+ENo5u0d5QGpTRX1OxXr23fnlGv+
         bG1xLUaXnBez50dthUxvSczi8hzXqmmaha/hcZqUwTGjqCOLyms8p162YJP2YVBNyoGq
         s/MZ4oW3Nw+05xhPEm0XPEwo6nNVPEbwPf4vJwnGUIORnnwKl8DGS+8fFsHc+Fd+UURh
         2ygA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=leVLAdT+W/buvZ8Zg3ry/YZKPP0/AxJaPWTc4uA+O2Y=;
        b=j1EVxFNHkjX1vuST5+KOFldQlJSvXdqQeWKF/Dn43GkhA1w964Z4MuAQ32wZWI2xCa
         SQVeSiDoD0afPHf64QOHBZTqvjb3eXCaAm4LTpTc0gUzc0eFoqEqJml4CsbjPQLO3YTM
         6O34EkY+zpenHHe4kmt3fKiZBuvtN92tUb+y09BlrPW2FGB4h+iO47cf8bOh4L6l7L87
         PCsARNgZqFSQ8JgOXgJJJL3oy6qwd8UYoIMu2kmBckc9iZCLsrJt9n1X0Wi4olvmloh5
         hbTbjZSD3vVMJftPGXO+tXmPs/25lnvIFjjvfIWZ2UxVCBTVZHBX5DU9RoV4iuT8wBM2
         cZ4Q==
X-Gm-Message-State: ANhLgQ1TMYEx6kAQrFbNf1cQDrCX7shLe9l5HfrOxzSqYqTySfSpn91h
        Eo/uCfi5W4rzR1QZLBHMbLsWS2/wLZU=
X-Google-Smtp-Source: ADFU+vspCG8U1Mj5/NvMqL4Vd2hb1arCoFORwTsiZzlVSNRWXFHyHYGQEnV2Je3qWMbX/d5q31ldZw==
X-Received: by 2002:ae9:c012:: with SMTP id u18mr3029271qkk.140.1584415807059;
        Mon, 16 Mar 2020 20:30:07 -0700 (PDT)
Received: from Arrakis.djogorchock.com ([136.33.205.58])
        by smtp.gmail.com with ESMTPSA id t2sm1272264qtp.13.2020.03.16.20.30.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Mar 2020 20:30:06 -0700 (PDT)
From:   "Daniel J. Ogorchock" <djogorchock@gmail.com>
To:     linux-input@vger.kernel.org
Cc:     thunderbird2k@gmail.com, blaws05@gmail.com,
        benjamin.tissoires@redhat.com, jikos@kernel.org,
        Roderick.Colenbrander@sony.com, svv@google.com, s.jegen@gmail.com,
        carmueller@gmail.com, "Daniel J. Ogorchock" <djogorchock@gmail.com>
Subject: [PATCH v11 08/11] HID: nintendo: reduce device removal subcommand errors
Date:   Mon, 16 Mar 2020 22:29:25 -0500
Message-Id: <20200317032928.546172-9-djogorchock@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200317032928.546172-1-djogorchock@gmail.com>
References: <20200317032928.546172-1-djogorchock@gmail.com>
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
index 8e26672661dc..abac0497b1cb 100644
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
@@ -1516,9 +1528,17 @@ static int nintendo_hid_probe(struct hid_device *hdev,
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
2.25.1

