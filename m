Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 62F45442334
	for <lists+linux-input@lfdr.de>; Mon,  1 Nov 2021 23:13:09 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232272AbhKAWOj (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 1 Nov 2021 18:14:39 -0400
Received: from mail.valdk.tel ([185.177.150.13]:49918 "EHLO mail.valdk.tel"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231161AbhKAWOi (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Mon, 1 Nov 2021 18:14:38 -0400
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 25776297B40
        for <linux-input@vger.kernel.org>; Tue,  2 Nov 2021 01:11:59 +0300 (MSK)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=valdikss.org.ru;
        s=msrv; t=1635804721; h=from:subject:date:message-id:to:mime-version:
         content-transfer-encoding:in-reply-to:references;
        bh=CcXu7ewysGuiQjTVbLup/KhKwW6s6+sdQYfkeSo28dA=;
        b=xHArEdgQ048gS4n0EJ6clkmFuebrZS3I85OFJhoZlel38jWZFdkWYncVf/POnrBpZvmDy/
        3Ob0QiaCY1FEqItPIMeRympug2AHx4UvAizppUYBfmySn+GZxho+gwmQNA94Tn2BIOzy8f
        OI99fucu56tIG/wsHloGNnf0dPH3ILsYRITigRdTxTmqgfBzXaDiHRed/YALVPBhpPRmP9
        UoIrY00tnxeQdp11qEzreYcMw5SpVHoEa9UpJwBwt5/hswERE9EfhvVNiqB5CVz4HMLkF4
        wys9221l2PsVYajvEhLw2x1ScGAg0AAEvTgQ8Fq4bSUfpre0psBEBSLYqBpKBA==
From:   ValdikSS <iam@valdikss.org.ru>
To:     linux-input@vger.kernel.org
Subject: [PATCH v2 2/3] HID: lenovo: Sync Fn-lock state on button press for Compact and TrackPoint II keyboards
Date:   Tue,  2 Nov 2021 01:11:31 +0300
Message-Id: <20211101221132.1564649-3-iam@valdikss.org.ru>
In-Reply-To: <20211101221132.1564649-1-iam@valdikss.org.ru>
References: <20211101221132.1564649-1-iam@valdikss.org.ru>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

When Fn-Esc is pressed on the keyboard, it emits the scancode which could
be used to sync the fn_lock sysfs state.

Previously fn_lock only allowed to set new Fn-lock state and did not
keep the value in sync upon Fn-Esc press, which is now fixed.

Signed-off-by: ValdikSS <iam@valdikss.org.ru>
---
 drivers/hid/hid-lenovo.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/drivers/hid/hid-lenovo.c b/drivers/hid/hid-lenovo.c
index a612ae7df..e9466ae8a 100644
--- a/drivers/hid/hid-lenovo.c
+++ b/drivers/hid/hid-lenovo.c
@@ -690,6 +690,15 @@ static int lenovo_event_cptkbd(struct hid_device *hdev,
 		return 1;
 	}
 
+	if (usage->type == EV_KEY && usage->code == KEY_FN_ESC && value == 1) {
+		/*
+		 * The user has toggled the Fn-lock state. Toggle our own
+		 * cached value of it and sync our value to the keyboard to
+		 * ensure things are in sync (the syncing should be a no-op).
+		 */
+		cptkbd_data->fn_lock = !cptkbd_data->fn_lock;
+	}
+
 	return 0;
 }
 
-- 
2.31.1

