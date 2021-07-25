Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DB53B3D4B2D
	for <lists+linux-input@lfdr.de>; Sun, 25 Jul 2021 05:27:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230162AbhGYCrZ (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Sat, 24 Jul 2021 22:47:25 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44402 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230187AbhGYCrW (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Sat, 24 Jul 2021 22:47:22 -0400
Received: from mail-qt1-x82a.google.com (mail-qt1-x82a.google.com [IPv6:2607:f8b0:4864:20::82a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 247BEC061757
        for <linux-input@vger.kernel.org>; Sat, 24 Jul 2021 20:27:52 -0700 (PDT)
Received: by mail-qt1-x82a.google.com with SMTP id b1so4657171qtx.0
        for <linux-input@vger.kernel.org>; Sat, 24 Jul 2021 20:27:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=4IrcYWhHHxxbQQ5WCnOUTb8jjQHyNToXSqMTB/V3Op4=;
        b=UZwg0RA1CE9n+tHX1pXQtnK8n6G4yTFZ8tbvTgyU10y74y0kEoeTFNhHrwcmsjfhRF
         V/WLMSqi626hAGetyGvfTYSywQ6wkMiHQEgwEMpX/c154BkOSHhmC2eaCr+OlLlGnT42
         uVtuoizekYR5yQQeGtlCwJO0IGF89+FTGl88TkMCIGwIb8+m/QXQ0Ozwmz2qYprWsJ7n
         XNFeI6Fm3hWrW8G6umIDEqKz/94y56BT1cInB9v0EN3cp9PuS4EB08pKlwuDtFj3Dh/9
         1U0vu2no6sSZmjMLadCxehmApXOY8DG9Jq/RZ9SrdfFD6+Dq24d+g0usTnVnvm/HB2BR
         1BJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=4IrcYWhHHxxbQQ5WCnOUTb8jjQHyNToXSqMTB/V3Op4=;
        b=FVJ3ysp8XMhQp21pWqo7EyAJJNojNoH4OPsVHYSuoL7nTPQAWbDsn6gf3+Fl/ToLiq
         7boqnM6tykquHGKU5eEyegQPyL64lkJBHe4ItzutWyatx0iTHArgE946iGz1LiRvMq1F
         K5KttmSOES+R1XE8jjL5yoOotk1FGuT6liGdhzgDuF7u1QrY5PWuZpG6gn0ns4rdV5TI
         8nOlDWukuYbHeEr9PQeAibcU8vxKlf81tJmJuu61bD6QSbHZdP+cpNybRjAcpIZtI8t5
         gYdWBNjdaFcMDDnGVOJ/W2IdlcTvppM3o/aueo1COK6zIfRAsIwyzD2QiN34qi86efEH
         a2Zw==
X-Gm-Message-State: AOAM532O1Lnb59EcqYox1pTpBlvB/VssgDPKWD0F060pywV7sHRqRtTj
        gbw+kMNsrxYGB+vkvLVZWQIdXu4167ZeFL6L
X-Google-Smtp-Source: ABdhPJxuBQ5TJ0s4d6VMkk6V/gvXSHumjWuXfV8kwxPjl1PB3/5ZwY2DqDZlszPwkH2GpMapQIRvaA==
X-Received: by 2002:ac8:7f03:: with SMTP id f3mr10124783qtk.370.1627183671206;
        Sat, 24 Jul 2021 20:27:51 -0700 (PDT)
Received: from Arrakis.djogorchock.com (pool-98-116-189-238.nycmny.fios.verizon.net. [98.116.189.238])
        by smtp.gmail.com with ESMTPSA id j16sm4843738qkk.132.2021.07.24.20.27.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 24 Jul 2021 20:27:50 -0700 (PDT)
From:   "Daniel J. Ogorchock" <djogorchock@gmail.com>
To:     linux-input@vger.kernel.org
Cc:     thunderbird2k@gmail.com, blaws05@gmail.com,
        benjamin.tissoires@redhat.com, jikos@kernel.org,
        Roderick.Colenbrander@sony.com, svv@google.com, s.jegen@gmail.com,
        carmueller@gmail.com, pgriffais@valvesoftware.com,
        hadess@hadess.net, "Daniel J. Ogorchock" <djogorchock@gmail.com>
Subject: [PATCH v14 08/17] HID: nintendo: reduce device removal subcommand errors
Date:   Sat, 24 Jul 2021 23:26:59 -0400
Message-Id: <20210725032707.440071-9-djogorchock@gmail.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20210725032707.440071-1-djogorchock@gmail.com>
References: <20210725032707.440071-1-djogorchock@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

This patch fixes meaningless error output from trying to send
subcommands immediately after controller removal. It now disables
subcommands as soon as possible on removal.

Signed-off-by: Daniel J. Ogorchock <djogorchock@gmail.com>
---
 drivers/hid/hid-nintendo.c | 24 ++++++++++++++++++++++--
 1 file changed, 22 insertions(+), 2 deletions(-)

diff --git a/drivers/hid/hid-nintendo.c b/drivers/hid/hid-nintendo.c
index daa95fa8e9a0b..c13fcd777fa21 100644
--- a/drivers/hid/hid-nintendo.c
+++ b/drivers/hid/hid-nintendo.c
@@ -230,6 +230,7 @@ static const struct joycon_rumble_amp_data joycon_rumble_amplitudes[] = {
 enum joycon_ctlr_state {
 	JOYCON_CTLR_STATE_INIT,
 	JOYCON_CTLR_STATE_READ,
+	JOYCON_CTLR_STATE_REMOVED,
 };
 
 struct joycon_stick_cal {
@@ -458,6 +459,14 @@ static int joycon_send_subcmd(struct joycon_ctlr *ctlr,
 	unsigned long flags;
 
 	spin_lock_irqsave(&ctlr->lock, flags);
+	/*
+	 * If the controller has been removed, just return ENODEV so the LED
+	 * subsystem doesn't print invalid errors on removal.
+	 */
+	if (ctlr->ctlr_state == JOYCON_CTLR_STATE_REMOVED) {
+		spin_unlock_irqrestore(&ctlr->lock, flags);
+		return -ENODEV;
+	}
 	memcpy(subcmd->rumble_data, ctlr->rumble_data[ctlr->rumble_queue_tail],
 	       JC_RUMBLE_DATA_SIZE);
 	spin_unlock_irqrestore(&ctlr->lock, flags);
@@ -807,10 +816,13 @@ static void joycon_rumble_worker(struct work_struct *work)
 		mutex_lock(&ctlr->output_mutex);
 		ret = joycon_enable_rumble(ctlr);
 		mutex_unlock(&ctlr->output_mutex);
-		if (ret < 0)
-			hid_warn(ctlr->hdev, "Failed to set rumble; e=%d", ret);
 
+		/* -ENODEV means the controller was just unplugged */
 		spin_lock_irqsave(&ctlr->lock, flags);
+		if (ret < 0 && ret != -ENODEV &&
+		    ctlr->ctlr_state != JOYCON_CTLR_STATE_REMOVED)
+			hid_warn(ctlr->hdev, "Failed to set rumble; e=%d", ret);
+
 		ctlr->rumble_msecs = jiffies_to_msecs(jiffies);
 		if (ctlr->rumble_queue_tail != ctlr->rumble_queue_head) {
 			if (++ctlr->rumble_queue_tail >= JC_RUMBLE_QUEUE_SIZE)
@@ -1520,9 +1532,17 @@ static int nintendo_hid_probe(struct hid_device *hdev,
 static void nintendo_hid_remove(struct hid_device *hdev)
 {
 	struct joycon_ctlr *ctlr = hid_get_drvdata(hdev);
+	unsigned long flags;
 
 	hid_dbg(hdev, "remove\n");
+
+	/* Prevent further attempts at sending subcommands. */
+	spin_lock_irqsave(&ctlr->lock, flags);
+	ctlr->ctlr_state = JOYCON_CTLR_STATE_REMOVED;
+	spin_unlock_irqrestore(&ctlr->lock, flags);
+
 	destroy_workqueue(ctlr->rumble_queue);
+
 	hid_hw_close(hdev);
 	hid_hw_stop(hdev);
 }
-- 
2.32.0

