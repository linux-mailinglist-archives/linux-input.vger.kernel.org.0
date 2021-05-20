Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 286F038B9A3
	for <lists+linux-input@lfdr.de>; Fri, 21 May 2021 00:47:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231874AbhETWs7 (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 20 May 2021 18:48:59 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55786 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231871AbhETWs7 (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Thu, 20 May 2021 18:48:59 -0400
Received: from mail-qk1-x72e.google.com (mail-qk1-x72e.google.com [IPv6:2607:f8b0:4864:20::72e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 74660C061574
        for <linux-input@vger.kernel.org>; Thu, 20 May 2021 15:47:36 -0700 (PDT)
Received: by mail-qk1-x72e.google.com with SMTP id k4so6852886qkd.0
        for <linux-input@vger.kernel.org>; Thu, 20 May 2021 15:47:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=NLQyHi5Vmp3PDas+1SUT6QWeiQUDJNdil/D9GYpM3ww=;
        b=bLbtc17q+skes7HTuSb8OHmhYqhwulTY87VCMAS1sRNZogRrw/YuF9ZJutiVIO00wk
         yta8L51US/eBtwcjaoO047Yo9uGYkT1srUldABzbKAmR5OyvX5XtQSMMxTP9NfBEhcFH
         let7d+5XxjNt7Rfvo9BdotHC8U/9uCjKMmFry1RXagt694L8e2cUI6oPXpNkFIGPtpt9
         Hh0ePzbf2nOwKkAyaIcMFpxibVSUKQt7t0lqRHWvM2orVLNsRYx+2G9dOKFtNcYzz0R+
         5riJ839CEqTsfDVsLW36qEcXJKFzW02E1ZXsK46EC+OPy6oowoGCs5hMgQla9JmneagT
         JXbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=NLQyHi5Vmp3PDas+1SUT6QWeiQUDJNdil/D9GYpM3ww=;
        b=mYoe5oZQAjCBorMtROoAiTdOlZMOCKI+WYM/6ivT1uIR1DfapOguaiosRrVoSuh19d
         Jhm4b2Bla2ZX9ArsoPFF3kXp+HMGHlQ/DltZqkaB2trnolryf9yS6ACuz1FfMXm/bSTj
         gDokBP6BPWIM+tfgm4zXxNQRcK2v1REXjsd8I4ehYIuP+4BKDvB07HdBRdlmM1gK9JtL
         LJaOOxLDE/pZNCiFCvz2KK9YVOCtjWJuxO7c8kQDOmfpytiooc+B/ZktdBrgyZtHea+S
         WGdEO84TaJWYJSrb3fQSP0L/X1lxKyZkjg6BffQeR4TMCn/miIr+ZNF92RH2JuvMppYV
         iyfQ==
X-Gm-Message-State: AOAM530N9wMRQBehy+e5X2addekUwGAk9memZ7wN4iS+SsWXNyKqh3eC
        /IhB/FmyvMJo0eMDogLpuCPgj6UKo1SwCw==
X-Google-Smtp-Source: ABdhPJxd5UMHbDAHmKU+o0ZXUxOlzP2miEQFqZpmmthQRc8+9GOLVKj6yUcJzTh2Ea3wgAVNgIiTeg==
X-Received: by 2002:ae9:d60f:: with SMTP id r15mr8502826qkk.20.1621550855482;
        Thu, 20 May 2021 15:47:35 -0700 (PDT)
Received: from Arrakis.djogorchock.com (pool-173-68-68-24.nycmny.fios.verizon.net. [173.68.68.24])
        by smtp.gmail.com with ESMTPSA id s11sm2126251qtn.77.2021.05.20.15.47.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 May 2021 15:47:34 -0700 (PDT)
From:   "Daniel J. Ogorchock" <djogorchock@gmail.com>
To:     linux-input@vger.kernel.org
Cc:     thunderbird2k@gmail.com, blaws05@gmail.com,
        benjamin.tissoires@redhat.com, jikos@kernel.org,
        Roderick.Colenbrander@sony.com, svv@google.com, s.jegen@gmail.com,
        carmueller@gmail.com, pgriffais@valvesoftware.com,
        hadess@hadess.net, "Daniel J. Ogorchock" <djogorchock@gmail.com>
Subject: [PATCH v13 07/15] HID: nintendo: send subcommands after receiving input report
Date:   Thu, 20 May 2021 18:47:07 -0400
Message-Id: <20210520224715.680919-8-djogorchock@gmail.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210520224715.680919-1-djogorchock@gmail.com>
References: <20210520224715.680919-1-djogorchock@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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
index f475d7f3f63f0..3c450b378efa3 100644
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
2.31.1

