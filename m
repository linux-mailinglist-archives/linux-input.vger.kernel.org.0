Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C73CFD0730
	for <lists+linux-input@lfdr.de>; Wed,  9 Oct 2019 08:29:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729500AbfJIG3I (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 9 Oct 2019 02:29:08 -0400
Received: from mail-io1-f66.google.com ([209.85.166.66]:34881 "EHLO
        mail-io1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729464AbfJIG3I (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Wed, 9 Oct 2019 02:29:08 -0400
Received: by mail-io1-f66.google.com with SMTP id q10so2550527iop.2
        for <linux-input@vger.kernel.org>; Tue, 08 Oct 2019 23:29:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=89hPRCeM8w4QucmC8ZTMIZFIzFYTAY9881GTMdU+IwU=;
        b=uf0El2j5iUp82gEetr6eYtP6S0c1INsdZ9RODWsXOBaq5ZoxGgfLvmSHrZXFz7ergU
         p3IYEuT4FJ1gbEV0WeDLLrD+alJCH8oegBUxalNCCFW14TVhI9q6lOWdYZciEkGJ0FnX
         9eyOI6a0XrYBA3vmzwTBwH4NkTGonvB+jPqmX9b1uqn7QBWP3vWr3cggdhIMDmg3mSpT
         aOs7tbfWtXop+nSONgxFxIXA875nrqnsBe/mk7Z2wvbvKFKU/fJMQzPGx0xSXdGHXCou
         68Ktvb2qkSPXDRrZET/IRDEBJzzLGkHmWo3sBikCsYvGp+fgn8JOLFf6FR/pHOtCmUv0
         PNqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=89hPRCeM8w4QucmC8ZTMIZFIzFYTAY9881GTMdU+IwU=;
        b=ZBXnjM6QuMDfCnzoEt2FyN2iZA/YDy4kwr1l/587yM6QP1F1+CBZHkAmuwHFLKWMpw
         wJGgYjgrQPRALpwbbvR7Zn/kF1tO20fVfsKf9on/LVrinUIz6ej3JytTjK265UyOEVXU
         etm5EJ3ihvNT7EArqRO5dw0GGe4yIuffjxFxtL+be/E45ZXnJm0QpM/nlwv8QmnTfXBr
         t7NJjfdeaGq3rgq5FpYbxq7tz5W0WYMtOTpyJShUS//PVO+54MKQG7UkwtOS1mAq41Sl
         QNEPAGDlrTuVZgWC7emvZWH46IQDW0GZaDPgejSKnKkr3AJFVTS+fawGNe37r4pRcp52
         EDsQ==
X-Gm-Message-State: APjAAAVpOLTWoO1YhDRNpw9NpQ0LCoVrTmEUkkgGAgEHQXZifcysA9up
        wIKsUcoEenmLufyOiGwdbJjec0VeUfo=
X-Google-Smtp-Source: APXvYqyendIs3aYyr7OwsOPlXJtBEg/ESjflTmPg91qPM3K/WSxCjpp7EyZ4M6ixAQOUaXSSNeXh0g==
X-Received: by 2002:a5d:9393:: with SMTP id c19mr1758187iol.37.1570602547674;
        Tue, 08 Oct 2019 23:29:07 -0700 (PDT)
Received: from Arrakis.djogorchock.com ([136.61.189.171])
        by smtp.gmail.com with ESMTPSA id r22sm880844ilb.85.2019.10.08.23.29.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Oct 2019 23:29:06 -0700 (PDT)
From:   "Daniel J. Ogorchock" <djogorchock@gmail.com>
To:     linux-input@vger.kernel.org
Cc:     thunderbird2k@gmail.com, blaws05@gmail.com,
        benjamin.tissoires@redhat.com, jikos@kernel.org,
        Roderick.Colenbrander@sony.com, svv@google.com, s.jegen@gmail.com,
        "Daniel J. Ogorchock" <djogorchock@gmail.com>
Subject: [PATCH v7 7/8] HID: nintendo: send subcommands after receiving input report
Date:   Wed,  9 Oct 2019 01:28:32 -0500
Message-Id: <20191009062833.3599398-8-djogorchock@gmail.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20191009062833.3599398-1-djogorchock@gmail.com>
References: <20191009062833.3599398-1-djogorchock@gmail.com>
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
index 63bd58234767..0c6fe135c750 100644
--- a/drivers/hid/hid-nintendo.c
+++ b/drivers/hid/hid-nintendo.c
@@ -323,6 +323,7 @@ struct joycon_ctlr {
 	bool received_resp;
 	u8 usb_ack_match;
 	u8 subcmd_ack_match;
+	bool received_input_report;
 
 	/* factory calibration data */
 	struct joycon_stick_cal left_stick_cal_x;
@@ -375,6 +376,26 @@ static int joycon_hid_send_sync(struct joycon_ctlr *ctlr, u8 *data, size_t len,
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
@@ -725,6 +746,18 @@ static void joycon_parse_report(struct joycon_ctlr *ctlr,
 	}
 
 	input_sync(dev);
+
+	/*
+	 * Immediately after receiving a report is the most reliable time to
+	 * send a subcommand to the controller. Wake any subcommand senders
+	 * waiting for a report.
+	 */
+	if (!ctlr->received_input_report) {
+		spin_lock_irqsave(&ctlr->lock, flags);
+		ctlr->received_input_report = true;
+		spin_unlock_irqrestore(&ctlr->lock, flags);
+		wake_up(&ctlr->wait);
+	}
 }
 
 static void joycon_rumble_worker(struct work_struct *work)
-- 
2.23.0

