Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6D09538B9AA
	for <lists+linux-input@lfdr.de>; Fri, 21 May 2021 00:47:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231913AbhETWtJ (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 20 May 2021 18:49:09 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55836 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231983AbhETWtH (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Thu, 20 May 2021 18:49:07 -0400
Received: from mail-qv1-xf2d.google.com (mail-qv1-xf2d.google.com [IPv6:2607:f8b0:4864:20::f2d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 19247C0613CE
        for <linux-input@vger.kernel.org>; Thu, 20 May 2021 15:47:44 -0700 (PDT)
Received: by mail-qv1-xf2d.google.com with SMTP id c13so8316242qvx.5
        for <linux-input@vger.kernel.org>; Thu, 20 May 2021 15:47:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=zbXCxsJXucMViEztm8fCjOOu+qgOi5gXNmyr1W/IEq0=;
        b=CmevYP+KfpOZPAC3jAqhhYOir7cED1W8iaKjmK3rWqZc82cIpmnlECzDbouAMGC1iT
         iN/cUWqQmqsITOViP6SWq84ne/N6n3zR9emYpOOYViYxTcM9xJSbMPn5vyF+KZaDsBl/
         7H6vRf8h6jL6IWxwL5O9RgtVwwQOgD7F4JmVsFdRSgQOcspGzm+ubL2OO5JlcNHwWd3n
         JYtTYTqfMToGco7yROP+KlzEDQ5GMUzGIvq65CRZiatAOFrsTv9gs7GR7fUE30tuCltx
         4iAsNcOHauy1mQDKpGOgDTz6uGzcw/A8xd4QUDujJNpGazKS6gcdCNtST+JIVUJHJe2i
         SsIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=zbXCxsJXucMViEztm8fCjOOu+qgOi5gXNmyr1W/IEq0=;
        b=Wv0HpEUxpv0va/HGQOa90SN1EU63yrbq55Tvp65CCIeHNht8UMJCjRKK+rmqW5NZs7
         83ojXL9im/V1uYmeL5rd/hiVYQDKzkbFl8XAwg5B8pMKvNOW8EfQFrbrKmKV4X/+2goY
         hqnDCXg25iSIIATpWUMqFAwOYW0vqBrLz5S6dCfaMYkA5iv7EBhggu7M0QmoPmBPHFWw
         n0jslcUepS1vdKN7agzDo56XMW5aYHj5lPLKC6wq+0CL20c7hSB5bbsPiniXawQL6HTJ
         h67Q1zm4F9AKwS0iRWPETdPYm0BX3J/X1PWM7p6IUF5tAXyE5+edLULIsgWIDYlE0IMn
         /qmQ==
X-Gm-Message-State: AOAM5336msxMcSUeTFNAB1Q7WN8pzzyI6GGZVUYsAUgVgVp9OECK/xxw
        g7gzgeAvF5yL+uPG5OKRPXR+HGASs9vhEw==
X-Google-Smtp-Source: ABdhPJzu6na6gdR2GcbH/RQaXVtj9WSOdyysc3rdxVvO1uVD1DE0L7D0VCPgWX8NKiI0/1ey5WKp2A==
X-Received: by 2002:ad4:5809:: with SMTP id dd9mr9035836qvb.10.1621550863128;
        Thu, 20 May 2021 15:47:43 -0700 (PDT)
Received: from Arrakis.djogorchock.com (pool-173-68-68-24.nycmny.fios.verizon.net. [173.68.68.24])
        by smtp.gmail.com with ESMTPSA id s11sm2126251qtn.77.2021.05.20.15.47.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 May 2021 15:47:42 -0700 (PDT)
From:   "Daniel J. Ogorchock" <djogorchock@gmail.com>
To:     linux-input@vger.kernel.org
Cc:     thunderbird2k@gmail.com, blaws05@gmail.com,
        benjamin.tissoires@redhat.com, jikos@kernel.org,
        Roderick.Colenbrander@sony.com, svv@google.com, s.jegen@gmail.com,
        carmueller@gmail.com, pgriffais@valvesoftware.com,
        hadess@hadess.net, "Daniel J. Ogorchock" <djogorchock@gmail.com>
Subject: [PATCH v13 15/15] HID: nintendo: improve rumble performance and stability
Date:   Thu, 20 May 2021 18:47:15 -0400
Message-Id: <20210520224715.680919-16-djogorchock@gmail.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210520224715.680919-1-djogorchock@gmail.com>
References: <20210520224715.680919-1-djogorchock@gmail.com>
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
index d5027e77af06a..3e1e3d2963062 100644
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
@@ -1324,6 +1330,36 @@ static void joycon_parse_report(struct joycon_ctlr *ctlr,
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
@@ -1334,7 +1370,7 @@ static void joycon_rumble_worker(struct work_struct *work)
 
 	while (again) {
 		mutex_lock(&ctlr->output_mutex);
-		ret = joycon_enable_rumble(ctlr);
+		ret = joycon_send_rumble_data(ctlr);
 		mutex_unlock(&ctlr->output_mutex);
 
 		/* -ENODEV means the controller was just unplugged */
-- 
2.31.1

