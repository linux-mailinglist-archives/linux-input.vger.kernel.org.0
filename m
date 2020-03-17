Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0DF0218782E
	for <lists+linux-input@lfdr.de>; Tue, 17 Mar 2020 04:30:08 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726222AbgCQDaH (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 16 Mar 2020 23:30:07 -0400
Received: from mail-qk1-f194.google.com ([209.85.222.194]:33777 "EHLO
        mail-qk1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726192AbgCQDaG (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Mon, 16 Mar 2020 23:30:06 -0400
Received: by mail-qk1-f194.google.com with SMTP id q17so5571993qki.0
        for <linux-input@vger.kernel.org>; Mon, 16 Mar 2020 20:30:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=LMJ6lOJDnC5LdR8tL831SC3Pwn85DmO9Vw2+wVHOXhY=;
        b=HaMgVoj6CixK/fiRARinTvZKL13++Gx7v7/wsUhGVTPfAzeouoyGYJeiK3WTlwwD+c
         s/QmGhSm6hxH7RkUl1qLaASZ7IcWAlOHvg835vtRaN940HspYbiWr/CkXAOWnObIA6QM
         x2Oo9X7GE0vbW64MFlkc+TRcESScjMriA3TGTb4m3dphqp9K+nWjH2/UqMFOLKxqQwmp
         uuhNEOZbTAP5r3SsLEdngBlSYeiLzwqy+fq/M4QUW9BwENSkntFklB5SXkRPMzM214MV
         uGlfMv2j9FQQd5TeZXMgYY0SoCr5dk6FvyjwI/EvCcHG4hZxr7Gk7/l8/bzCJ71H1HTS
         hZ4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=LMJ6lOJDnC5LdR8tL831SC3Pwn85DmO9Vw2+wVHOXhY=;
        b=QZn8T89XKe22M+uzR54tVvg1h4g5+v7SIzF5vN8YBWQYkkmjtS6XxxziVpMGrvT4UN
         qFeAJZSxwq5Wjr00ytnwCdRFKbf/yd4jSobESBGoDIyzFI1gGeeTGfIzih4KSxt0V8Zi
         7sSjpsFSoQD6xVSlz20LgSSMlZVvspov/4d0IiPGM5Za8HpA3uVolSfAUACj3HsTdBbP
         9HOziy2XeZhrFNaMWDsz63tnPvaPyCnw4OFJ0RUe+A2Lqa82ZHLPRV9MCFNfjJpTl2LW
         sPNePdZtl9qwNup2a7gEA/oHmFlwprneLtpowPoR2TqlGb9Ox7opG0QguWkqftu04AwW
         GM2Q==
X-Gm-Message-State: ANhLgQ1FlO3EvohyW8Ngf9h3aHVby08O2U+R0dFFuPCsnZ0lDyr9sN9z
        7gz4U4a+C+lFNGa41DR/Dkg9SdUaH2U=
X-Google-Smtp-Source: ADFU+vsUc8nGAGz4ZpvB/aNbdbdMcWGIf8VznSPT7rfrDFUWDX7zY5imw3TWltfdL0YPnWALtLNuPA==
X-Received: by 2002:ae9:e8c6:: with SMTP id a189mr2867902qkg.361.1584415805683;
        Mon, 16 Mar 2020 20:30:05 -0700 (PDT)
Received: from Arrakis.djogorchock.com ([136.33.205.58])
        by smtp.gmail.com with ESMTPSA id t2sm1272264qtp.13.2020.03.16.20.30.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Mar 2020 20:30:04 -0700 (PDT)
From:   "Daniel J. Ogorchock" <djogorchock@gmail.com>
To:     linux-input@vger.kernel.org
Cc:     thunderbird2k@gmail.com, blaws05@gmail.com,
        benjamin.tissoires@redhat.com, jikos@kernel.org,
        Roderick.Colenbrander@sony.com, svv@google.com, s.jegen@gmail.com,
        carmueller@gmail.com, "Daniel J. Ogorchock" <djogorchock@gmail.com>
Subject: [PATCH v11 07/11] HID: nintendo: send subcommands after receiving input report
Date:   Mon, 16 Mar 2020 22:29:24 -0500
Message-Id: <20200317032928.546172-8-djogorchock@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200317032928.546172-1-djogorchock@gmail.com>
References: <20200317032928.546172-1-djogorchock@gmail.com>
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
index 2421ce10f234..8e26672661dc 100644
--- a/drivers/hid/hid-nintendo.c
+++ b/drivers/hid/hid-nintendo.c
@@ -328,6 +328,7 @@ struct joycon_ctlr {
 	bool received_resp;
 	u8 usb_ack_match;
 	u8 subcmd_ack_match;
+	bool received_input_report;
 
 	/* factory calibration data */
 	struct joycon_stick_cal left_stick_cal_x;
@@ -381,6 +382,26 @@ static int joycon_hid_send_sync(struct joycon_ctlr *ctlr, u8 *data, size_t len,
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
@@ -753,6 +774,18 @@ static void joycon_parse_report(struct joycon_ctlr *ctlr,
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
2.25.1

