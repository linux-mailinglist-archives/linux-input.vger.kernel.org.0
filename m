Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B7F0D12CBA0
	for <lists+linux-input@lfdr.de>; Mon, 30 Dec 2019 02:27:37 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726643AbfL3B1g (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Sun, 29 Dec 2019 20:27:36 -0500
Received: from mail-yw1-f66.google.com ([209.85.161.66]:38119 "EHLO
        mail-yw1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726626AbfL3B1g (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Sun, 29 Dec 2019 20:27:36 -0500
Received: by mail-yw1-f66.google.com with SMTP id 10so13576199ywv.5
        for <linux-input@vger.kernel.org>; Sun, 29 Dec 2019 17:27:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=VNnkxzS6snfPds8Lpr9Ryl5MbnoheMlKu9R+/SD5FTk=;
        b=ZE1w041UsiHUybOJjluNxNuNhoFZRUXhag0IeqxHI5cc+pAAy6tR/N2tDqa05XN06s
         HGS1XCsxB+BFY07xrQWEWvMF+iXqXf8u/91jZtLDPanxIUndWws+nPKA8oSusa9ASizA
         jfBXYiBRGYcs56rWqglHx9OukbStp8ps0YXKKKriPoW87+nB8IlByAMYCsjsugM7NkzS
         HULPIt5rxJGsAQs0PDKX8yBHmlD0T96+qNMINOgXftko5gc9m8HYo7RdA03aqTKlIfZp
         BEIiotm9bZqAaF9zCEdipGH1yYE3GjqXZh8WZ+ULgSQ1UHf4LxlG2Jcznt/mgsQFAVgS
         DQ6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=VNnkxzS6snfPds8Lpr9Ryl5MbnoheMlKu9R+/SD5FTk=;
        b=XxgRN+rudBsHDUTBW6tDHLmAXD3uzpTt5fhT9O3U/eQiGTF/rM7W2/n/Tv8+ELGen8
         hG6H6XbVxg4PGNyKBofyhuA++vPzb6VnrS0X0TB7Aumhp4dNmw9pLrJCGA8r+0Hagidy
         YHJjSwA/hwC6zYMXyzew+ZFvTyqIyozPXZaDCP7FTyQg/9vtNA+zWMTQcrvlfMOiACUV
         dxdWQL62WVvev6lJAzMRkgAIy17ThVOR0BzHq2JtHenzzyYfye3c9KaxWfjUJtRG4haf
         w1NUOiQ7yB1b9dZnkMIAHLYlEuwiGI7VIbRq69fjXB8SlmQD0H4A+5G8OnA2CT7/msfS
         h2ew==
X-Gm-Message-State: APjAAAW0zyjRkl+sbthOeUbxwLscLuUPNqvzO6Dbl28i9r6EiC8ZNwIe
        MjzjwH2+L+crme7HKtboX1oMGIj7xAk=
X-Google-Smtp-Source: APXvYqwO5zgPB1Jo+PMDpTsMLYAOk9PFZdn6UKGi36U/Wl/p6/BTErhxdUd1Qtnws8hj9gpn39OhBw==
X-Received: by 2002:a81:142:: with SMTP id 63mr45168859ywb.457.1577669255640;
        Sun, 29 Dec 2019 17:27:35 -0800 (PST)
Received: from Arrakis.djogorchock.com ([136.33.205.58])
        by smtp.gmail.com with ESMTPSA id g11sm17175584ywe.14.2019.12.29.17.27.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 29 Dec 2019 17:27:35 -0800 (PST)
From:   "Daniel J. Ogorchock" <djogorchock@gmail.com>
To:     linux-input@vger.kernel.org
Cc:     thunderbird2k@gmail.com, blaws05@gmail.com,
        benjamin.tissoires@redhat.com, jikos@kernel.org,
        Roderick.Colenbrander@sony.com, svv@google.com, s.jegen@gmail.com,
        carmueller@gmail.com, "Daniel J. Ogorchock" <djogorchock@gmail.com>
Subject: [PATCH v10 07/12] HID: nintendo: send subcommands after receiving input report
Date:   Sun, 29 Dec 2019 19:27:15 -0600
Message-Id: <20191230012720.2368987-8-djogorchock@gmail.com>
X-Mailer: git-send-email 2.24.1
In-Reply-To: <20191230012720.2368987-1-djogorchock@gmail.com>
References: <20191230012720.2368987-1-djogorchock@gmail.com>
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
index 05d4c0e9636e..152d7eb9c27d 100644
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
@@ -725,6 +746,18 @@ static void joycon_parse_report(struct joycon_ctlr *ctlr,
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
2.24.1

