Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AE4F124EB61
	for <lists+linux-input@lfdr.de>; Sun, 23 Aug 2020 06:42:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726189AbgHWEmc (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Sun, 23 Aug 2020 00:42:32 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59412 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725981AbgHWEm2 (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Sun, 23 Aug 2020 00:42:28 -0400
Received: from mail-oi1-x241.google.com (mail-oi1-x241.google.com [IPv6:2607:f8b0:4864:20::241])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DD3F6C061755
        for <linux-input@vger.kernel.org>; Sat, 22 Aug 2020 21:42:27 -0700 (PDT)
Received: by mail-oi1-x241.google.com with SMTP id e6so5322940oii.4
        for <linux-input@vger.kernel.org>; Sat, 22 Aug 2020 21:42:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=HmaQuY9GvPKnK7dP6NxoXULMSfyaxGANEaqSUTVFWt8=;
        b=YyiLAmjppbveySbArRXiZlq70L5GsxMKlH+yeZN62cTLKtME/rWftiKEdI0HJl3Sac
         WwG1oCd574A8w+Gg6SGxtUEwuzQGAbu7UPBtn7mbZTZqZkgETImTz/fvpJzBz3M5XtbE
         MAtmLU9mA5fMz/RHXKOvuylecy3+7UiUljowQ8ffscvfb5p1WlVHI9aRys9i1jl+gk6N
         DmkWZlEWYjjk6ICyijmBJpOU8oA+n+8Zv62vuBQecBhpLDNT2JnTBdwgBEn/tNSGD6HT
         Sm9RqvMPobR3/CWbp7w4dPMTNaaVStRum2e+6IWSMucVgfmSKoE9VZHFMIXib78B37bp
         xofg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=HmaQuY9GvPKnK7dP6NxoXULMSfyaxGANEaqSUTVFWt8=;
        b=sYywXyB2dhGyZD2PX5XFnKaias4PcxbkoEjs6mfowZe1mo+hDna1l++2CEmx6Cp/8W
         scCPMlXlHx8MinT247iJlgalQF/TiBFBi/6NBmLpXFH6alQuilbobJUr1AqQB6kjBjgJ
         SZE3fJ0uxMMjixf6MXq/fXRoFdPkz12m3DdCOqMUEZlr/vRekRzx0EitpemDCGG8pozv
         q46VfJw8L84a0iJWC1/KsK7gDI87Od3W7syOnVtbFjqAf+KkzybX7I3hBDTyMdMYooKw
         /gB72Pdvk1kUcei7PDIYBSfgI93bqr82RQZxFInrrRIaQvfjXOSEIng/6K+a+3a4ooyc
         RX3Q==
X-Gm-Message-State: AOAM533zi27dd8DOFdRMsGhkuMhQkNTYyQQkVifcXD5fp3vjm/Ovwv27
        RAD5EZcq5yA6aPpYlwgOc7QK1VhIf+rK4vBP
X-Google-Smtp-Source: ABdhPJy11gxzca/JGODtGoDxtHzuDcdYGVsy1ViASdfB4qwLLYqA1LujdgtFZ6IyLuAVqx3WEQXZZw==
X-Received: by 2002:aca:56c1:: with SMTP id k184mr10505oib.26.1598157745854;
        Sat, 22 Aug 2020 21:42:25 -0700 (PDT)
Received: from Arrakis.djogorchock.com ([136.33.205.58])
        by smtp.gmail.com with ESMTPSA id z10sm1308572otk.6.2020.08.22.21.42.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 22 Aug 2020 21:42:25 -0700 (PDT)
From:   "Daniel J. Ogorchock" <djogorchock@gmail.com>
To:     linux-input@vger.kernel.org
Cc:     thunderbird2k@gmail.com, blaws05@gmail.com,
        benjamin.tissoires@redhat.com, jikos@kernel.org,
        Roderick.Colenbrander@sony.com, svv@google.com, s.jegen@gmail.com,
        carmueller@gmail.com, pgriffais@valvesoftware.com,
        hadess@hadess.net, "Daniel J. Ogorchock" <djogorchock@gmail.com>
Subject: [PATCH v12 07/14] HID: nintendo: send subcommands after receiving input report
Date:   Sat, 22 Aug 2020 23:41:50 -0500
Message-Id: <20200823044157.339677-8-djogorchock@gmail.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20200823044157.339677-1-djogorchock@gmail.com>
References: <20200823044157.339677-1-djogorchock@gmail.com>
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
index 2638c6aff9d2..2ec099dc3869 100644
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
2.28.0

