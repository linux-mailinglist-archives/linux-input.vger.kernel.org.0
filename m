Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 22AB8D58FB
	for <lists+linux-input@lfdr.de>; Mon, 14 Oct 2019 02:22:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729019AbfJNAWy (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Sun, 13 Oct 2019 20:22:54 -0400
Received: from mail-io1-f68.google.com ([209.85.166.68]:39297 "EHLO
        mail-io1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729296AbfJNAWy (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Sun, 13 Oct 2019 20:22:54 -0400
Received: by mail-io1-f68.google.com with SMTP id a1so34323385ioc.6
        for <linux-input@vger.kernel.org>; Sun, 13 Oct 2019 17:22:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=kxk2RLIcJAwqGZuqsWFMIos6ztyuuVK5PwBVjURovv0=;
        b=s8Nsw3ED7CgwS6khU0Rm6jj59UkcghfXdq6usxSpmIXrGYhTpWlbWDsCEbTvgA6nto
         HUdKa2g5VMfzZNoLRi3ZHlXiRQlv4zLa1EPz+rWy6rW68as2hmNVGXfEDfV5k0cJ46b9
         cPN5MF6IQoQ8r9bmOhPzUO+jRiR2is8EW05hNQAACYUvix+BjYAge43ELzL6ndYnsb6z
         Ehz49VDJVl16jSUjPItTkqJQQ2knRKYVTJjHYT1z7BJ9GWYs6TT9pU7YCj/TjdJNF8V3
         l9jUUOtFZg7KpOEG6MQGX7ebg/Bs8thVkyLgZ0Gfohy1+evtqxjuwMb0Py8+vpHXpN7k
         kbSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=kxk2RLIcJAwqGZuqsWFMIos6ztyuuVK5PwBVjURovv0=;
        b=plZN7SGYysQABak5nsmoJXYpw/0KKymW/GWVCBJHUb0qDl116WIV3Pm4x5smCqTvsT
         sW/AXv59sx7mknM/G6qxuXWUPAAKcpaQlmXQ8sTXrv21BcH2bQgXc/2pFxmZNgXs5aVK
         2mMRRYFyXcuT4gI09lhN8LiBBUY79tfoH1ycIiYypmtDqB6AN4N8oUrn6XO7vxRVzE04
         YUblo54yQCltyZsS9ICgHKlHH6iPGPPTPSCoOA1vMTHjuIOJ05X/2XK1w+gHMl0FFe5R
         y2WE2pqIorzjFAOgGHuub0KDXfkaGPYeKA3zvRX/SO2CZQMl3vS3UJPUwkjwMqkzWeGX
         xbfQ==
X-Gm-Message-State: APjAAAX5B/48O9tG8dDQbriN2Yw7lgI3DEXk8Hs3DfZcZUUI1YyRpdkR
        lmoK/FzlA2dyVNz+CYEzGkx4cHjlUWA=
X-Google-Smtp-Source: APXvYqwUb5OdxAe4T6SN3LQNHy382PxjEGpSPQSjVoLJ/dYUfGeH+UhYnJ5xnkGpEWRwDrZUktXvrA==
X-Received: by 2002:a02:ab96:: with SMTP id t22mr30587506jan.78.1571012573431;
        Sun, 13 Oct 2019 17:22:53 -0700 (PDT)
Received: from Arrakis.djogorchock.com ([136.61.189.171])
        by smtp.gmail.com with ESMTPSA id s201sm22103963ios.83.2019.10.13.17.22.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 13 Oct 2019 17:22:52 -0700 (PDT)
From:   "Daniel J. Ogorchock" <djogorchock@gmail.com>
To:     linux-input@vger.kernel.org
Cc:     thunderbird2k@gmail.com, blaws05@gmail.com,
        benjamin.tissoires@redhat.com, jikos@kernel.org,
        Roderick.Colenbrander@sony.com, svv@google.com, s.jegen@gmail.com,
        "Daniel J. Ogorchock" <djogorchock@gmail.com>
Subject: [PATCH v8 7/9] HID: nintendo: send subcommands after receiving input report
Date:   Sun, 13 Oct 2019 19:22:39 -0500
Message-Id: <20191014002241.2560195-8-djogorchock@gmail.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20191014002241.2560195-1-djogorchock@gmail.com>
References: <20191014002241.2560195-1-djogorchock@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-input-owner@vger.kernel.org
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
index df00d2a6504d..d51d701fa21c 100644
--- a/drivers/hid/hid-nintendo.c
+++ b/drivers/hid/hid-nintendo.c
@@ -323,6 +323,7 @@ struct joycon_ctlr {
 	bool received_resp;
 	u8 usb_ack_match;
 	u8 subcmd_ack_match;
+	bool received_input_report;
 
 	/* factory calibration data */
 	struct joycon_stick_cal left_stick_cal_x;
@@ -376,6 +377,26 @@ static int joycon_hid_send_sync(struct joycon_ctlr *ctlr, u8 *data, size_t len,
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
@@ -726,6 +747,18 @@ static void joycon_parse_report(struct joycon_ctlr *ctlr,
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
2.23.0

