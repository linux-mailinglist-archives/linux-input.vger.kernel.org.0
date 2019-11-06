Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 98EB6F0EBA
	for <lists+linux-input@lfdr.de>; Wed,  6 Nov 2019 07:07:07 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725812AbfKFGHG (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 6 Nov 2019 01:07:06 -0500
Received: from mail-yb1-f195.google.com ([209.85.219.195]:41097 "EHLO
        mail-yb1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729966AbfKFGHG (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Wed, 6 Nov 2019 01:07:06 -0500
Received: by mail-yb1-f195.google.com with SMTP id b2so10453587ybr.8
        for <linux-input@vger.kernel.org>; Tue, 05 Nov 2019 22:07:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=B/yysPScvQxkf0Nqw8IXbXHBz/k48AdxrLpy2edWnUU=;
        b=Hj/xWwnv6EsE/Qen9yZHZngO6KkHFUN+DOi7mfHnAsj9StUfHD/k8CNYFvigwc70tq
         7HzAw+SG7bFz4z/GflsWD0WLAQVzJnWunRMLXdmvfvO70dOn7wFOjwO8SGGA22/WKy/5
         hS90VP8YpHv4Y+JNtC75TYqeNaj7ubYM821N0piUUFiXpJPj0Ef/Fk3Q0f0Rdi8pM8NR
         zGXhGLSTYZmTXnFbm4mzOlBiFRrODiaOeGDyxFuvtQHDDF4aea6XH/Wz3hUq992tHf3W
         uqddF8AGIE6FOsPqgdAoSar0ked+h58e646SgQjRwfDak73411q5vNiU+23gBs7mDMwC
         80GQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=B/yysPScvQxkf0Nqw8IXbXHBz/k48AdxrLpy2edWnUU=;
        b=heCWNbyMDgRPaCSfng31PmQ+AyO3WMDV/HsSH56O4i/4ywOXMatmklR63r9YsX3Nzk
         XhfDkWRsebrkysJ+JGLPHXh+YiBkhWu9UKT4SjA1TdCfoY8kxLJdEuMA9JXMjF2KtnYf
         wsKHurGaW0nyPVJD9bNRVNlrf5EetlprpQBXVuTBkvA1QxY2orERq5N8E0zYynNytZYx
         DWMERnHgzN/QTLrVxVQB4SnSh7cYpbjJUKTlyygEyoeb1TudlmMjZXVa+ibWmDxqS2TO
         4N+z0K1ATpV36i24jweaFkfRBti0rW+sIn/zJz4r8aP5vapKx9T+b+gtuLf/DQR97/0+
         u9yQ==
X-Gm-Message-State: APjAAAWqCox3m4bVbwbv2FuihHgAxxKwntPe2rouavzTKFPbQcspgrXC
        JyPp1cD0XvtWcJNItPXCqXMH83wTcGi74g==
X-Google-Smtp-Source: APXvYqxvoBqt2TU8wss8UI0h4xRcmr8gsulHXBsnjHs9ReFaCAXdeM12ws9SRiz4b0UCyj8KwCVL2g==
X-Received: by 2002:a25:c64b:: with SMTP id k72mr751796ybf.4.1573020425551;
        Tue, 05 Nov 2019 22:07:05 -0800 (PST)
Received: from Arrakis.djogorchock.com ([136.33.205.58])
        by smtp.gmail.com with ESMTPSA id e82sm11039596ywb.87.2019.11.05.22.07.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 Nov 2019 22:07:04 -0800 (PST)
From:   "Daniel J. Ogorchock" <djogorchock@gmail.com>
To:     linux-input@vger.kernel.org
Cc:     thunderbird2k@gmail.com, blaws05@gmail.com,
        benjamin.tissoires@redhat.com, jikos@kernel.org,
        Roderick.Colenbrander@sony.com, svv@google.com, s.jegen@gmail.com,
        "Daniel J. Ogorchock" <djogorchock@gmail.com>
Subject: [PATCH v9 07/10] HID: nintendo: send subcommands after receiving input report
Date:   Wed,  6 Nov 2019 00:06:45 -0600
Message-Id: <20191106060648.3018478-8-djogorchock@gmail.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20191106060648.3018478-1-djogorchock@gmail.com>
References: <20191106060648.3018478-1-djogorchock@gmail.com>
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
index 8bd49f3a67ab..14ffd188ef78 100644
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

