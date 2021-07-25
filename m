Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B66623D4B34
	for <lists+linux-input@lfdr.de>; Sun, 25 Jul 2021 05:28:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230239AbhGYCr2 (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Sat, 24 Jul 2021 22:47:28 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44434 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230199AbhGYCr1 (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Sat, 24 Jul 2021 22:47:27 -0400
Received: from mail-qk1-x730.google.com (mail-qk1-x730.google.com [IPv6:2607:f8b0:4864:20::730])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A0E04C06175F
        for <linux-input@vger.kernel.org>; Sat, 24 Jul 2021 20:27:57 -0700 (PDT)
Received: by mail-qk1-x730.google.com with SMTP id f22so5489669qke.10
        for <linux-input@vger.kernel.org>; Sat, 24 Jul 2021 20:27:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=2IF9ntFPak28hpZvJ2Xmy5KYhBNg7e0graZRczzChYI=;
        b=lnbi99RAsnl4DGGoFLDO2y54rUIvTLcT5jhiYpFEHVK0WuSjsxa1vrgW7zKSyWg4dz
         3MYiNq5lWjUxqHtRrv6F98/oj0qYVE/PDoYsJIeod6rLhoQN5z8b7z9KGczEHAWp7Lda
         moG8XR098M1A31dV8YcQmpjefIj8B4LvRwRa3Cm5jnwJRnD57jJywwrdT/8eHGu5eCza
         TdZ6ydHuGddaKAtWO2nnuLuryeZh+bg8jme5rZsh1cueIUuDyLwTCPZKIhdbjyjwfApV
         DwGLD+L4zEOaOVnurUjvamF6ntXQ71CpnO72Lz9Jmo3p2BVA7b+u+bNiMesI2DnuAbq6
         dBXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=2IF9ntFPak28hpZvJ2Xmy5KYhBNg7e0graZRczzChYI=;
        b=jM9A/WHLkwgBr97mE6K2Rs13I6ty/RI3iYeqGWIYEheyEd1HvjdNXWmowWRSXRLPZF
         sYEyx3N3ZHtvNuabWti0axTdKvUITOhn6mKgJJQ5OQEXxSAVKxK8CTgaf1yEr+1hQB7D
         s2rRfjPMv9SX/5suUxDcV5SAPKXV25ach4WNs0ra/N1MgUirMCIQgctnuJn4LSg6e9YM
         PxrVp4o3zDWzUK1xPB2Tn8J54znbWLzoRrYg99+BjcMOC7ScltEG4shEZf80xU2yI0Xk
         9P3DqLeUOR9H4ggvWw6kmgL3LabQtAR54WfjsLBW8n6jFPWyxG9s5PC2hwQVDTmeQbDF
         3Rxg==
X-Gm-Message-State: AOAM530bGTIF3VuRK1ZMffgsEGqxpWHAVIH1i9SX3WKsBDAPRxx3vgkS
        g4ic33dDra7Bd6PLyOQ1k8QJQFe0Y2dBOF/X
X-Google-Smtp-Source: ABdhPJzXCJLaU2ajBJf75zRpep9SD0SlO3ZhlWBFk+qFy4sTF9Yin3w7P5/aEfiGFJuYWKDn2sfsLA==
X-Received: by 2002:a37:ba03:: with SMTP id k3mr12070293qkf.220.1627183676745;
        Sat, 24 Jul 2021 20:27:56 -0700 (PDT)
Received: from Arrakis.djogorchock.com (pool-98-116-189-238.nycmny.fios.verizon.net. [98.116.189.238])
        by smtp.gmail.com with ESMTPSA id j16sm4843738qkk.132.2021.07.24.20.27.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 24 Jul 2021 20:27:56 -0700 (PDT)
From:   "Daniel J. Ogorchock" <djogorchock@gmail.com>
To:     linux-input@vger.kernel.org
Cc:     thunderbird2k@gmail.com, blaws05@gmail.com,
        benjamin.tissoires@redhat.com, jikos@kernel.org,
        Roderick.Colenbrander@sony.com, svv@google.com, s.jegen@gmail.com,
        carmueller@gmail.com, pgriffais@valvesoftware.com,
        hadess@hadess.net, "Daniel J. Ogorchock" <djogorchock@gmail.com>
Subject: [PATCH v14 15/17] HID: nintendo: ratelimit subcommands and rumble
Date:   Sat, 24 Jul 2021 23:27:06 -0400
Message-Id: <20210725032707.440071-16-djogorchock@gmail.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20210725032707.440071-1-djogorchock@gmail.com>
References: <20210725032707.440071-1-djogorchock@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

It has been found that sending subcommands and rumble data packets at
too great a rate can result in controller disconnects. This patch limits
the rate of subcommands/rumble to once every 25 milliseconds.

Signed-off-by: Daniel J. Ogorchock <djogorchock@gmail.com>
---
 drivers/hid/hid-nintendo.c | 20 ++++++++++++++++++++
 1 file changed, 20 insertions(+)

diff --git a/drivers/hid/hid-nintendo.c b/drivers/hid/hid-nintendo.c
index 9376f20baab00..71aa676ba3907 100644
--- a/drivers/hid/hid-nintendo.c
+++ b/drivers/hid/hid-nintendo.c
@@ -431,6 +431,7 @@ struct joycon_ctlr {
 	u8 usb_ack_match;
 	u8 subcmd_ack_match;
 	bool received_input_report;
+	unsigned int last_subcmd_sent_msecs;
 
 	/* factory calibration data */
 	struct joycon_stick_cal left_stick_cal_x;
@@ -582,6 +583,21 @@ static int joycon_send_usb(struct joycon_ctlr *ctlr, u8 cmd, u32 timeout)
 	return ret;
 }
 
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
+	if (delta_ms < max_subcmd_rate_ms)
+		msleep(max_subcmd_rate_ms - delta_ms);
+	ctlr->last_subcmd_sent_msecs = current_ms;
+}
+
 static int joycon_send_subcmd(struct joycon_ctlr *ctlr,
 			      struct joycon_subcmd_request *subcmd,
 			      size_t data_len, u32 timeout)
@@ -589,6 +605,8 @@ static int joycon_send_subcmd(struct joycon_ctlr *ctlr,
 	int ret;
 	unsigned long flags;
 
+	joycon_enforce_subcmd_rate(ctlr);
+
 	spin_lock_irqsave(&ctlr->lock, flags);
 	/*
 	 * If the controller has been removed, just return ENODEV so the LED
@@ -1340,6 +1358,8 @@ static int joycon_send_rumble_data(struct joycon_ctlr *ctlr)
 	unsigned long flags;
 	struct joycon_rumble_output rumble_output = { 0 };
 
+	joycon_enforce_subcmd_rate(ctlr);
+
 	spin_lock_irqsave(&ctlr->lock, flags);
 	/*
 	 * If the controller has been removed, just return ENODEV so the LED
-- 
2.32.0

