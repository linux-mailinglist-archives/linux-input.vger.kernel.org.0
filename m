Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9A51B4079FB
	for <lists+linux-input@lfdr.de>; Sat, 11 Sep 2021 19:37:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233074AbhIKRiU (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Sat, 11 Sep 2021 13:38:20 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48576 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233089AbhIKRiT (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Sat, 11 Sep 2021 13:38:19 -0400
Received: from mail-qk1-x72f.google.com (mail-qk1-x72f.google.com [IPv6:2607:f8b0:4864:20::72f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E971FC061756
        for <linux-input@vger.kernel.org>; Sat, 11 Sep 2021 10:37:06 -0700 (PDT)
Received: by mail-qk1-x72f.google.com with SMTP id bk29so5797676qkb.8
        for <linux-input@vger.kernel.org>; Sat, 11 Sep 2021 10:37:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=llFbMXzMCU1Eu82olVdviSVAoAUt627NXnd472vZ83A=;
        b=f+GAUFEYuSVWieDzoIU1GNtRXbVbxvRW6vvrrbaSQqLP5/oCPw4IAhcFf51PUGRyCp
         y4oIQ2hZZFGqvdJDUktFwNCLu7qdzuGDaVmuinKjImST3qjS+YABgeeEni9/1UhtoL/F
         EscAmpMWvriNHPIxi7f89xhH/H2zfv8cZ8IFkvG7CD4qRyNsirg/Px4/RxGMR1pdT+o+
         y50EzfZ3TFpBM0wvsGwWqQwoijyWPtZYXfGnFdcMieAPPYqQaSM7kz4s4dshUN6QAaN6
         7LYMBGbQfUOsLa7Cp55pZqlb7LJuMmo00o+ySp4roEpjx7BrewnpB/mIc0iN7ZeuNRf+
         niYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=llFbMXzMCU1Eu82olVdviSVAoAUt627NXnd472vZ83A=;
        b=eHCxTQGY/fkK/B6BMwIytAtMLaBAPsbL0eE/5SAdBkM8naj4MbAonOtmjDm2FRSfhB
         qVlIQk62shEu844FoIgbH86CMRULkVHajTX5T3gOSh3R33QS8FLHY8K5JrxVewF69wBO
         cNTytzPbmJrF6icYFhauNsWLdTlZ+mAr55OHngmkkAfnJ22rK5JIHl37ctCSu8n9dQB/
         6cdA+hDfpY5mVEyUUj39IeFqHaYapShAkCL1JjM1cdghsMwewZaf0fVw3wP7hFLiOIEA
         gwZs09XyBaOmcEwhLcj2h10Ff74JSGzRbvqwgH4R3eOQmA+waB1iTRe4YumSUkGIttfp
         DIxA==
X-Gm-Message-State: AOAM530xEQ+YCJ8PqlrTENSVuMexgVa73WDUP0J2aNPws0vYSNNIp5l1
        9bgi/svLG6h0sJz9Kh1ClbJceEFQF9dgrg==
X-Google-Smtp-Source: ABdhPJwovXuObsmOqwI23X9rvoK47kftKSDGwxbrdk9GvNreV9J52Bm4gP8Hr1RDkCh1G/34MU1j+Q==
X-Received: by 2002:a37:7801:: with SMTP id t1mr2974279qkc.162.1631381826077;
        Sat, 11 Sep 2021 10:37:06 -0700 (PDT)
Received: from Arrakis.djogorchock.com (pool-173-68-59-147.nycmny.fios.verizon.net. [173.68.59.147])
        by smtp.gmail.com with ESMTPSA id m5sm1594286qkn.33.2021.09.11.10.37.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 11 Sep 2021 10:37:05 -0700 (PDT)
From:   "Daniel J. Ogorchock" <djogorchock@gmail.com>
To:     linux-input@vger.kernel.org
Cc:     thunderbird2k@gmail.com, blaws05@gmail.com,
        benjamin.tissoires@redhat.com, jikos@kernel.org,
        Roderick.Colenbrander@sony.com, svv@google.com, s.jegen@gmail.com,
        carmueller@gmail.com, pgriffais@valvesoftware.com,
        hadess@hadess.net, pobrn@protonmail.com, lee.jones@linaro.org,
        "Daniel J. Ogorchock" <djogorchock@gmail.com>
Subject: [PATCH v16 14/16] HID: nintendo: improve rumble performance and stability
Date:   Sat, 11 Sep 2021 13:36:37 -0400
Message-Id: <20210911173639.5688-15-djogorchock@gmail.com>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20210911173639.5688-1-djogorchock@gmail.com>
References: <20210911173639.5688-1-djogorchock@gmail.com>
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
index 1e8dc34f39802..2351e1d8c8e07 100644
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
2.33.0

