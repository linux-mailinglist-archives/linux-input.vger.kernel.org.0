Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1EF804079FC
	for <lists+linux-input@lfdr.de>; Sat, 11 Sep 2021 19:37:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233089AbhIKRiV (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Sat, 11 Sep 2021 13:38:21 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48582 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233181AbhIKRiU (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Sat, 11 Sep 2021 13:38:20 -0400
Received: from mail-qk1-x72b.google.com (mail-qk1-x72b.google.com [IPv6:2607:f8b0:4864:20::72b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 167F4C061574
        for <linux-input@vger.kernel.org>; Sat, 11 Sep 2021 10:37:08 -0700 (PDT)
Received: by mail-qk1-x72b.google.com with SMTP id y144so5810957qkb.6
        for <linux-input@vger.kernel.org>; Sat, 11 Sep 2021 10:37:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=8yKC4KVJDFdQGz6EqFNaGHcVw2fwaznIXaB+lSathQE=;
        b=CHHVtKwWNLPXz+A19bcHZDkYijB0scpVJkjIvNUiSUBJWXj1HTvCRrAl8nLP/H8Y/k
         6u3EOpjzuhhdZXh4ogvgonIuoYSygioX3IsnTdiiqP0b6vjVnPmqZN0XAVMKD1t9DDhg
         8UQ+Udt6Z6+ouNUwPLy0X/KtiP7VoydHqEPiT1uNfFjuaD+jeJMYnmfx+JeiW53Ygtr2
         vLGQngvv9ailAqc1wrSNQmfRyslBZqYVaKSObD5RtNVSjL+gnqkwz73ypht3VBAK/0Q2
         6vz5NG0maZgLsfliQu47OKqCtm/YIMyKiu7nK9J0QaYmu429X1SktCSmNA3eka4Wk4aQ
         ISTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=8yKC4KVJDFdQGz6EqFNaGHcVw2fwaznIXaB+lSathQE=;
        b=b7D5DTwSTXzmjyI6Y2NuCrMVPVYxvCRMiDg87O/45NDKQtP37DboxrZ4Sy78rQoz5a
         NxC75mUMofVnPLgT+LoTlsaDAIXKijRGyaQ/gyLXIDePZniqug1qtDdmM8d0nCbs1CTf
         K3bogg/ty7c8E4hehqCtN9fuvP3xVCpUNGORUXaO8QTzt1DPbKeTkbiOt0W1rfgnBDXy
         CcIAxWT8Hwpb/rou7Jxh9+IZaM15+v3rxxdvlKK9HWLPMngDbu8AB9yEfQsoIjd2AvFJ
         B1fPay75tJEnHfBSExT4NU+yLNr/CUe5vrX7RFXAjYbtOjT5aUmlIjXb9iWGr3ISQZb5
         rSWw==
X-Gm-Message-State: AOAM533S4i8SOFX6bs3X/7Y0SEQh20wrO+lp66Xsfh5P24dLVADIcX2F
        X4Rdz5t8aMrup5mY+LVaiiAgD9iN3EjGAA==
X-Google-Smtp-Source: ABdhPJyjs/aAS6wHyw5pL3ZeZYHJygsV55HrMbZCYMhiVs2rru7kuAxpW2TJDkSSmXu+lS7AZroWag==
X-Received: by 2002:a37:9e8c:: with SMTP id h134mr2947146qke.366.1631381827079;
        Sat, 11 Sep 2021 10:37:07 -0700 (PDT)
Received: from Arrakis.djogorchock.com (pool-173-68-59-147.nycmny.fios.verizon.net. [173.68.59.147])
        by smtp.gmail.com with ESMTPSA id m5sm1594286qkn.33.2021.09.11.10.37.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 11 Sep 2021 10:37:06 -0700 (PDT)
From:   "Daniel J. Ogorchock" <djogorchock@gmail.com>
To:     linux-input@vger.kernel.org
Cc:     thunderbird2k@gmail.com, blaws05@gmail.com,
        benjamin.tissoires@redhat.com, jikos@kernel.org,
        Roderick.Colenbrander@sony.com, svv@google.com, s.jegen@gmail.com,
        carmueller@gmail.com, pgriffais@valvesoftware.com,
        hadess@hadess.net, pobrn@protonmail.com, lee.jones@linaro.org,
        "Daniel J. Ogorchock" <djogorchock@gmail.com>
Subject: [PATCH v16 15/16] HID: nintendo: ratelimit subcommands and rumble
Date:   Sat, 11 Sep 2021 13:36:38 -0400
Message-Id: <20210911173639.5688-16-djogorchock@gmail.com>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20210911173639.5688-1-djogorchock@gmail.com>
References: <20210911173639.5688-1-djogorchock@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

It has been found that sending subcommands and rumble data packets at
too great a rate can result in controller disconnects. This patch limits
the rate of subcommands/rumble to once every 25 milliseconds.

Similar to sending subcommands, it is more reliable to send the rumble
data packets immediately after we've received an input report from the
controller. This results in far fewer bluetooth disconnects for the
controller.

Signed-off-by: Daniel J. Ogorchock <djogorchock@gmail.com>
---
 drivers/hid/hid-nintendo.c | 69 +++++++++++++++++++++++++++-----------
 1 file changed, 49 insertions(+), 20 deletions(-)

diff --git a/drivers/hid/hid-nintendo.c b/drivers/hid/hid-nintendo.c
index 2351e1d8c8e07..ae3cd8ca9fa78 100644
--- a/drivers/hid/hid-nintendo.c
+++ b/drivers/hid/hid-nintendo.c
@@ -2,7 +2,7 @@
 /*
  * HID driver for Nintendo Switch Joy-Cons and Pro Controllers
  *
- * Copyright (c) 2019-2020 Daniel J. Ogorchock <djogorchock@gmail.com>
+ * Copyright (c) 2019-2021 Daniel J. Ogorchock <djogorchock@gmail.com>
  *
  * The following resources/projects were referenced for this driver:
  *   https://github.com/dekuNukem/Nintendo_Switch_Reverse_Engineering
@@ -431,6 +431,7 @@ struct joycon_ctlr {
 	u8 usb_ack_match;
 	u8 subcmd_ack_match;
 	bool received_input_report;
+	unsigned int last_subcmd_sent_msecs;
 
 	/* factory calibration data */
 	struct joycon_stick_cal left_stick_cal_x;
@@ -510,6 +511,50 @@ static int __joycon_hid_send(struct hid_device *hdev, u8 *data, size_t len)
 	return ret;
 }
 
+static void joycon_wait_for_input_report(struct joycon_ctlr *ctlr)
+{
+	int ret;
+
+	/*
+	 * If we are in the proper reporting mode, wait for an input
+	 * report prior to sending the subcommand. This improves
+	 * reliability considerably.
+	 */
+	if (ctlr->ctlr_state == JOYCON_CTLR_STATE_READ) {
+		unsigned long flags;
+
+		spin_lock_irqsave(&ctlr->lock, flags);
+		ctlr->received_input_report = false;
+		spin_unlock_irqrestore(&ctlr->lock, flags);
+		ret = wait_event_timeout(ctlr->wait,
+					 ctlr->received_input_report,
+					 HZ / 4);
+		/* We will still proceed, even with a timeout here */
+		if (!ret)
+			hid_warn(ctlr->hdev,
+				 "timeout waiting for input report\n");
+	}
+}
+
+/*
+ * Sending subcommands and/or rumble data at too high a rate can cause bluetooth
+ * controller disconnections.
+ */
+static void joycon_enforce_subcmd_rate(struct joycon_ctlr *ctlr)
+{
+	static const unsigned int max_subcmd_rate_ms = 25;
+	unsigned int current_ms = jiffies_to_msecs(jiffies);
+	unsigned int delta_ms = current_ms - ctlr->last_subcmd_sent_msecs;
+
+	while (delta_ms < max_subcmd_rate_ms &&
+	       ctlr->ctlr_state == JOYCON_CTLR_STATE_READ) {
+		joycon_wait_for_input_report(ctlr);
+		current_ms = jiffies_to_msecs(jiffies);
+		delta_ms = current_ms - ctlr->last_subcmd_sent_msecs;
+	}
+	ctlr->last_subcmd_sent_msecs = current_ms;
+}
+
 static int joycon_hid_send_sync(struct joycon_ctlr *ctlr, u8 *data, size_t len,
 				u32 timeout)
 {
@@ -521,25 +566,7 @@ static int joycon_hid_send_sync(struct joycon_ctlr *ctlr, u8 *data, size_t len,
 	 * doing one retry after a timeout appears to always work.
 	 */
 	while (tries--) {
-		/*
-		 * If we are in the proper reporting mode, wait for an input
-		 * report prior to sending the subcommand. This improves
-		 * reliability considerably.
-		 */
-		if (ctlr->ctlr_state == JOYCON_CTLR_STATE_READ) {
-			unsigned long flags;
-
-			spin_lock_irqsave(&ctlr->lock, flags);
-			ctlr->received_input_report = false;
-			spin_unlock_irqrestore(&ctlr->lock, flags);
-			ret = wait_event_timeout(ctlr->wait,
-						 ctlr->received_input_report,
-						 HZ / 4);
-			/* We will still proceed, even with a timeout here */
-			if (!ret)
-				hid_warn(ctlr->hdev,
-					 "timeout waiting for input report\n");
-		}
+		joycon_enforce_subcmd_rate(ctlr);
 
 		ret = __joycon_hid_send(ctlr->hdev, data, len);
 		if (ret < 0) {
@@ -1359,6 +1386,8 @@ static int joycon_send_rumble_data(struct joycon_ctlr *ctlr)
 	if (++ctlr->subcmd_num > 0xF)
 		ctlr->subcmd_num = 0;
 
+	joycon_enforce_subcmd_rate(ctlr);
+
 	ret = __joycon_hid_send(ctlr->hdev, (u8 *)&rumble_output,
 				sizeof(rumble_output));
 	return ret;
-- 
2.33.0

