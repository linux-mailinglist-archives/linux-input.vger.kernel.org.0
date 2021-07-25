Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6D8C33D4B33
	for <lists+linux-input@lfdr.de>; Sun, 25 Jul 2021 05:28:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230210AbhGYCr1 (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Sat, 24 Jul 2021 22:47:27 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44430 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230217AbhGYCr0 (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Sat, 24 Jul 2021 22:47:26 -0400
Received: from mail-qk1-x736.google.com (mail-qk1-x736.google.com [IPv6:2607:f8b0:4864:20::736])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D959CC061757
        for <linux-input@vger.kernel.org>; Sat, 24 Jul 2021 20:27:56 -0700 (PDT)
Received: by mail-qk1-x736.google.com with SMTP id 129so5528006qkg.4
        for <linux-input@vger.kernel.org>; Sat, 24 Jul 2021 20:27:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=J2/Ce+3lerdku2zmQTfBm8IgRNBcPlr+ZIgLnc9GTbc=;
        b=TgzSwtTMmCQrJE9di1hj8Wurdjw87WH2HgxFGGV8S85F4cP97wbEpxRN3uovSh821U
         hyV+oTPBaJ6nIwAKU9wiCa5vqD1swP4kqKNF1nXUtqs7hnV7uwPDNvm5s+tLOsgIWJXu
         m9aiB+JhDFy0usS9iXzPvwFrNRf6ISb3oQEc1+WgsEKjUSqyBEDN9UG39fhkvdI1gkU2
         Pyk2m4Bta+XyWrdn9Pf+UYsz9mdK9Cps5CvBZCjEdHcl1uDHqKPyFl+jiRkRBfjJDE+u
         DFoX61yydO+DfFu6cHsr5iWvwYlx7NfX9ltn7TaigNcXbxG+klirBPz2tXYJ0f27RctD
         C/dA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=J2/Ce+3lerdku2zmQTfBm8IgRNBcPlr+ZIgLnc9GTbc=;
        b=FZVBZhsSsqrlrcOjq5IJ4++5/ZFdBn9H/Ox9eh64vVhEt85m9d0GTmLq2rTsMJd4kZ
         IxTtnarPkLJtpx+hpW07QqvLhRgKWPlxdQYpJVMA7QupOr3roVfKT6RPxv/a8ZRamib9
         VDRvJe0ptQsMyNplVg7WGUI8Jpg7GR3eFub1Tbk6DY+BWqVkKkcu3I2zipO6yLJzzkgD
         0ETp5/Dc6y4W+A61HtaESlhxhmvw54gbNuPzfqiWmEdXYgI45gKR5EguJRo5WHy2Mjby
         uCBNHp//xyf8SP9fu3WNqW1TDjvu/IkJ4luu8ood9u1/Je3ya/DtUIHH7HCwjXQtO7hx
         Oz8A==
X-Gm-Message-State: AOAM5333ATfahKxVatsM7ucqrZP2P5SPGH40eh2aAYcn5RPh1wqRGzbw
        TLD5dgUNy6M6CVLbELhLbhyRHedXLccMK8uQ
X-Google-Smtp-Source: ABdhPJxMOslfMz+xBdgzcfze/Ce5pnMcYSep4EtPKND4JpN2eoOiIE5zvQ3357qmfPYiyUKYeQWKzg==
X-Received: by 2002:a05:620a:4f9:: with SMTP id b25mr11871792qkh.191.1627183675967;
        Sat, 24 Jul 2021 20:27:55 -0700 (PDT)
Received: from Arrakis.djogorchock.com (pool-98-116-189-238.nycmny.fios.verizon.net. [98.116.189.238])
        by smtp.gmail.com with ESMTPSA id j16sm4843738qkk.132.2021.07.24.20.27.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 24 Jul 2021 20:27:55 -0700 (PDT)
From:   "Daniel J. Ogorchock" <djogorchock@gmail.com>
To:     linux-input@vger.kernel.org
Cc:     thunderbird2k@gmail.com, blaws05@gmail.com,
        benjamin.tissoires@redhat.com, jikos@kernel.org,
        Roderick.Colenbrander@sony.com, svv@google.com, s.jegen@gmail.com,
        carmueller@gmail.com, pgriffais@valvesoftware.com,
        hadess@hadess.net, "Daniel J. Ogorchock" <djogorchock@gmail.com>
Subject: [PATCH v14 14/17] HID: nintendo: improve rumble performance and stability
Date:   Sat, 24 Jul 2021 23:27:05 -0400
Message-Id: <20210725032707.440071-15-djogorchock@gmail.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20210725032707.440071-1-djogorchock@gmail.com>
References: <20210725032707.440071-1-djogorchock@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

This patch alters the method that the rumble data is sent to the
controller. Rather than using the enable rumble subcommand for this
purpose, the driver now employs the RUMBLE_ONLY output report. This has
the advantage of not needing to receive a subcommand reply (to the major
benefit of reducing IMU latency) and also seems to make the rumble
vibrations more continuous. Perhaps most importantly it reduces
disconnects during times of heavy rumble.

Signed-off-by: Daniel J. Ogorchock <djogorchock@gmail.com>
---
 drivers/hid/hid-nintendo.c | 38 +++++++++++++++++++++++++++++++++++++-
 1 file changed, 37 insertions(+), 1 deletion(-)

diff --git a/drivers/hid/hid-nintendo.c b/drivers/hid/hid-nintendo.c
index 041de7637441d..9376f20baab00 100644
--- a/drivers/hid/hid-nintendo.c
+++ b/drivers/hid/hid-nintendo.c
@@ -348,6 +348,12 @@ enum joycon_msg_type {
 	JOYCON_MSG_TYPE_SUBCMD,
 };
 
+struct joycon_rumble_output {
+	u8 output_id;
+	u8 packet_num;
+	u8 rumble_data[8];
+} __packed;
+
 struct joycon_subcmd_request {
 	u8 output_id; /* must be 0x01 for subcommand, 0x10 for rumble only */
 	u8 packet_num; /* incremented every send */
@@ -1328,6 +1334,36 @@ static void joycon_parse_report(struct joycon_ctlr *ctlr,
 		joycon_parse_imu_report(ctlr, rep);
 }
 
+static int joycon_send_rumble_data(struct joycon_ctlr *ctlr)
+{
+	int ret;
+	unsigned long flags;
+	struct joycon_rumble_output rumble_output = { 0 };
+
+	spin_lock_irqsave(&ctlr->lock, flags);
+	/*
+	 * If the controller has been removed, just return ENODEV so the LED
+	 * subsystem doesn't print invalid errors on removal.
+	 */
+	if (ctlr->ctlr_state == JOYCON_CTLR_STATE_REMOVED) {
+		spin_unlock_irqrestore(&ctlr->lock, flags);
+		return -ENODEV;
+	}
+	memcpy(rumble_output.rumble_data,
+	       ctlr->rumble_data[ctlr->rumble_queue_tail],
+	       JC_RUMBLE_DATA_SIZE);
+	spin_unlock_irqrestore(&ctlr->lock, flags);
+
+	rumble_output.output_id = JC_OUTPUT_RUMBLE_ONLY;
+	rumble_output.packet_num = ctlr->subcmd_num;
+	if (++ctlr->subcmd_num > 0xF)
+		ctlr->subcmd_num = 0;
+
+	ret = __joycon_hid_send(ctlr->hdev, (u8 *)&rumble_output,
+				sizeof(rumble_output));
+	return ret;
+}
+
 static void joycon_rumble_worker(struct work_struct *work)
 {
 	struct joycon_ctlr *ctlr = container_of(work, struct joycon_ctlr,
@@ -1338,7 +1374,7 @@ static void joycon_rumble_worker(struct work_struct *work)
 
 	while (again) {
 		mutex_lock(&ctlr->output_mutex);
-		ret = joycon_enable_rumble(ctlr);
+		ret = joycon_send_rumble_data(ctlr);
 		mutex_unlock(&ctlr->output_mutex);
 
 		/* -ENODEV means the controller was just unplugged */
-- 
2.32.0

