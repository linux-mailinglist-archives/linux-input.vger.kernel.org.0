Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 858B3478021
	for <lists+linux-input@lfdr.de>; Thu, 16 Dec 2021 23:46:50 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236290AbhLPWqn (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 16 Dec 2021 17:46:43 -0500
Received: from mail.valdk.tel ([185.177.150.13]:41604 "EHLO mail.valdk.tel"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S236264AbhLPWqn (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Thu, 16 Dec 2021 17:46:43 -0500
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id DEF762C17D6;
        Fri, 17 Dec 2021 01:46:36 +0300 (MSK)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=valdikss.org.ru;
        s=msrv; t=1639694799; h=from:subject:date:message-id:to:cc:mime-version:
         content-transfer-encoding:in-reply-to:references;
        bh=CcXu7ewysGuiQjTVbLup/KhKwW6s6+sdQYfkeSo28dA=;
        b=DngqjMuYikwZX8oaB1uWDY4m5Ci0kFQsBIN0q33ra4ln2nKcNrqShvYWUMMDX8s0Xih2wy
        S7pyb8glMkeaBsC93B9aqa+B7cbHa4UfxtXDPh2SpyKlA62iUQBhp4TwtpoSdP8bpAxW6v
        ulmvj6f8QEGjQKYG2sG8d1zgG3PVu6x/+bsK1P/wo/K8v8EbonPohy0bSmmASlUn7XkgT5
        1gGpxwimfj7pmrwBLL9qxxyPwHlO3kp0p9mxKaaRQyipG7PUxlQcOgayX6T7lz6f53mxzi
        DDfWVCNXmhhij5SFZCCGLNygIfIA8d08svpiK160kTmV170RzDlezWr2ghwOcg==
From:   ValdikSS <iam@valdikss.org.ru>
To:     Jiri Kosina <jikos@kernel.org>,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>
Cc:     linux-input@vger.kernel.org
Subject: [PATCH v2 2/3] HID: lenovo: Sync Fn-lock state on button press for Compact and TrackPoint II keyboards
Date:   Fri, 17 Dec 2021 01:46:10 +0300
Message-Id: <20211216224611.440397-3-iam@valdikss.org.ru>
In-Reply-To: <20211216224611.440397-1-iam@valdikss.org.ru>
References: <20211216224611.440397-1-iam@valdikss.org.ru>
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

