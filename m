Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 441553D4B35
	for <lists+linux-input@lfdr.de>; Sun, 25 Jul 2021 05:28:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230199AbhGYCrc (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Sat, 24 Jul 2021 22:47:32 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44436 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230229AbhGYCr2 (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Sat, 24 Jul 2021 22:47:28 -0400
Received: from mail-qv1-xf33.google.com (mail-qv1-xf33.google.com [IPv6:2607:f8b0:4864:20::f33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 67E76C061757
        for <linux-input@vger.kernel.org>; Sat, 24 Jul 2021 20:27:58 -0700 (PDT)
Received: by mail-qv1-xf33.google.com with SMTP id g6so3402747qvj.8
        for <linux-input@vger.kernel.org>; Sat, 24 Jul 2021 20:27:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=0z4MJu9zRAilXdaPa0+ei7RC8O0mWiq7QoZVBuBaQaE=;
        b=osEMdquR3Ahj+wJBCguIHXC7zLaf6dbX22/9q5hZSPne3HW+SS4lwGC4l7Y62JrX+z
         gGeGZF8Va8Slg+aFZm8ELdir+0R1/FuS6EcWRuxpRePOvcBKpZnta9gOnz2k9v3PU0ty
         oOxmBirImALfIqqaCiRDVNQJkb02zsN+sdSjEjddYHnMZWQfaM+nqVIeHejNol6+YQuu
         sn5nrbx9AGgFt75Tf9xazL9HX3K5wRoda8wxKZ6rFNhJHsDhs9GudXAGk+kS/os9z6O5
         gx5yB16AjPi+ZBRiONrEsowsWUkWMowBCtrMmCEfFb+gg2KD4fMuS3JoDA2lhlxjQ9A1
         hxPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=0z4MJu9zRAilXdaPa0+ei7RC8O0mWiq7QoZVBuBaQaE=;
        b=tTa3llClYcBit6yuC7RGjcuDKfrxAKvoVNZBzyky0icl6YX5B9FEQFpfNQLGcx8/ix
         8nXVnkthMWlOe/3a2RD+wWvZFWh//i/SzX2XFOpkZxwxzpB0SmFnDd0RurO8ae+3+VNi
         DJ3HPls1AkdCzgbSDd1v23zgIyeYObNGh+wsJ5feUjGluVe6ywzK1QUVeacoxy9ev5gq
         /dTo4ZjOmz1ZDC8rZz4amkAbPhjcWx2s7//2M3DpehIgJVlyCjyXXV0UhZoPpR3JQexT
         vs5p2nKIv1tAcVZC4Gc50xo3mOzAorcuGQGRD7YvsvfWfmn4zkntux8WqRYvivl48qxi
         tM0A==
X-Gm-Message-State: AOAM531Y3hZ7H3mvVjHdZSz5M8CHxMwxVh1s7A8ROKj6khlxpoLNW29a
        hwi1vWzFOh0mjQoBwnBgYql8t/Bii0yU76jG
X-Google-Smtp-Source: ABdhPJxw56uWlGlH4u5IRM00Z077Y1G4kQOIrYpECxkB6vch7eSVuLIOwlAVxeNnHjG5vaaV4/GhiQ==
X-Received: by 2002:a0c:8525:: with SMTP id n34mr8903292qva.19.1627183677524;
        Sat, 24 Jul 2021 20:27:57 -0700 (PDT)
Received: from Arrakis.djogorchock.com (pool-98-116-189-238.nycmny.fios.verizon.net. [98.116.189.238])
        by smtp.gmail.com with ESMTPSA id j16sm4843738qkk.132.2021.07.24.20.27.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 24 Jul 2021 20:27:57 -0700 (PDT)
From:   "Daniel J. Ogorchock" <djogorchock@gmail.com>
To:     linux-input@vger.kernel.org
Cc:     thunderbird2k@gmail.com, blaws05@gmail.com,
        benjamin.tissoires@redhat.com, jikos@kernel.org,
        Roderick.Colenbrander@sony.com, svv@google.com, s.jegen@gmail.com,
        carmueller@gmail.com, pgriffais@valvesoftware.com,
        hadess@hadess.net, "Daniel J. Ogorchock" <djogorchock@gmail.com>
Subject: [PATCH v14 16/17] HID: nintendo: send rumble cmds post input reports
Date:   Sat, 24 Jul 2021 23:27:07 -0400
Message-Id: <20210725032707.440071-17-djogorchock@gmail.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20210725032707.440071-1-djogorchock@gmail.com>
References: <20210725032707.440071-1-djogorchock@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Similar to sending subcommands, it is more reliable to send the rumble
data packets immediately after we've received an input report from the
controller. This results in far fewer bluetooth disconnects for the
controller.

Signed-off-by: Daniel J. Ogorchock <djogorchock@gmail.com>
---
 drivers/hid/hid-nintendo.c | 49 ++++++++++++++++++++++----------------
 1 file changed, 29 insertions(+), 20 deletions(-)

diff --git a/drivers/hid/hid-nintendo.c b/drivers/hid/hid-nintendo.c
index 71aa676ba3907..d3ec45de9649f 100644
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
@@ -511,6 +511,31 @@ static int __joycon_hid_send(struct hid_device *hdev, u8 *data, size_t len)
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
 static int joycon_hid_send_sync(struct joycon_ctlr *ctlr, u8 *data, size_t len,
 				u32 timeout)
 {
@@ -522,25 +547,7 @@ static int joycon_hid_send_sync(struct joycon_ctlr *ctlr, u8 *data, size_t len,
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
+		joycon_wait_for_input_report(ctlr);
 
 		ret = __joycon_hid_send(ctlr->hdev, data, len);
 		if (ret < 0) {
@@ -1379,6 +1386,8 @@ static int joycon_send_rumble_data(struct joycon_ctlr *ctlr)
 	if (++ctlr->subcmd_num > 0xF)
 		ctlr->subcmd_num = 0;
 
+	joycon_wait_for_input_report(ctlr);
+
 	ret = __joycon_hid_send(ctlr->hdev, (u8 *)&rumble_output,
 				sizeof(rumble_output));
 	return ret;
-- 
2.32.0

