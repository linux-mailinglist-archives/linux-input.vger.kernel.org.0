Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D6FED3FE673
	for <lists+linux-input@lfdr.de>; Thu,  2 Sep 2021 02:34:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232479AbhIAXoB (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 1 Sep 2021 19:44:01 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45722 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240259AbhIAXoA (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Wed, 1 Sep 2021 19:44:00 -0400
Received: from mail-qv1-xf2e.google.com (mail-qv1-xf2e.google.com [IPv6:2607:f8b0:4864:20::f2e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DA58AC061575
        for <linux-input@vger.kernel.org>; Wed,  1 Sep 2021 16:43:02 -0700 (PDT)
Received: by mail-qv1-xf2e.google.com with SMTP id eh1so138519qvb.11
        for <linux-input@vger.kernel.org>; Wed, 01 Sep 2021 16:43:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=hT19LOJfQN2z746EgMtCBr/K0GKv7xoMsHK9RejhTS4=;
        b=lrI+L22HdElWNxI4a0v00/AcgdNDvsPcgU9vJDm+yUfZv8n9onminGWSuHWRn5+HU9
         713teynPYGlL4TUu8kgS+JHb6NBoN7ZBLeYqK57p1tmpjbhDOvKe+vMPBfEltv9rh4ov
         J9BYaaQwlKqmPzKW8ZKSyP9Hm60/48o8oVgzl0O6p1+jDgFinXIxrG+x3+FBhrrAtbRv
         rzyUcKr3mnygUfqDJwb35js9kzW2uajPITnDzv4LdouaJEeYI6GiLXusyMUo8vY8sz5j
         qdlTfEMH8GTMslv+BYy+jl3eQORbaeYuM/FfcjM1sD7u9x1Jsx7jz8nr6YTbXs71jQ4L
         znpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=hT19LOJfQN2z746EgMtCBr/K0GKv7xoMsHK9RejhTS4=;
        b=rQNjH8AYgc9N8w5DPuTjrBq6jGRyJkq64ubcZR5pYFNK5US8dOojd+K+ZEe313OxIl
         pVe0E2Szn/GnSaM31Tu9w4i6NdVsElwsmsRwRRXmWLNUG6XLl6TELV+L9iNiK83SPgss
         MA7I3usUaCpesck8QlIgGk7Q2r32BQc2HaglfUXXDp8ZZ48JSBezmREcWRcELP31IH9i
         3Xr55LJ/Rc1mqCKT1XtXpLz9C419uBonny4tb2o8gdQTPY+L1FYMATn2FGgPjrJNBXBG
         6pCvOGQvFAPIwi+kIlA3xa8M6Py0nMHc5gGWSgp6mMsX2wujA6m8F2tb2gi++lA19F6G
         fIhw==
X-Gm-Message-State: AOAM533uSmYDii+hizvAjk9G7t178phOpeJZnSabgKGqSwGeu+5SSzal
        LCiPJAf+MRNVmTSMSviC/FG2NHGkqR4=
X-Google-Smtp-Source: ABdhPJwzkdfnZZ2JJWH1N2KLsEyXDD73iaxsjWb8K/T+npi2iWSHvbUiIbqx8iAykbJe9MBRFPy8sQ==
X-Received: by 2002:a05:6214:6f0:: with SMTP id bk16mr264494qvb.40.1630539781996;
        Wed, 01 Sep 2021 16:43:01 -0700 (PDT)
Received: from Arrakis.djogorchock.com (pool-173-68-59-147.nycmny.fios.verizon.net. [173.68.59.147])
        by smtp.gmail.com with ESMTPSA id n5sm13422qtp.35.2021.09.01.16.43.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Sep 2021 16:43:01 -0700 (PDT)
From:   "Daniel J. Ogorchock" <djogorchock@gmail.com>
To:     linux-input@vger.kernel.org
Cc:     thunderbird2k@gmail.com, blaws05@gmail.com,
        benjamin.tissoires@redhat.com, jikos@kernel.org,
        Roderick.Colenbrander@sony.com, svv@google.com, s.jegen@gmail.com,
        carmueller@gmail.com, pgriffais@valvesoftware.com,
        hadess@hadess.net, pobrn@protonmail.com,
        "Daniel J. Ogorchock" <djogorchock@gmail.com>
Subject: [PATCH v15 14/16] HID: nintendo: improve rumble performance and stability
Date:   Wed,  1 Sep 2021 19:42:34 -0400
Message-Id: <20210901234236.3113-15-djogorchock@gmail.com>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20210901234236.3113-1-djogorchock@gmail.com>
References: <20210901234236.3113-1-djogorchock@gmail.com>
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
2.33.0

