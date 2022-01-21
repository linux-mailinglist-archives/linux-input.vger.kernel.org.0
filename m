Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8EE71495F28
	for <lists+linux-input@lfdr.de>; Fri, 21 Jan 2022 13:42:16 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1350501AbiAUMmP (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Fri, 21 Jan 2022 07:42:15 -0500
Received: from mail.zeus.flokli.de ([88.198.15.28]:35164 "EHLO zeus.flokli.de"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1380420AbiAUMmP (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Fri, 21 Jan 2022 07:42:15 -0500
Received: by zeus.flokli.de (Postfix, from userid 207)
        id 150351276C1E; Fri, 21 Jan 2022 12:41:29 +0000 (UTC)
Received: by zeus.flokli.de (Postfix, from userid 207)
        id 7EEE11276C01; Fri, 21 Jan 2022 12:37:05 +0000 (UTC)
Received: by zeus.flokli.de (Postfix, from userid 207)
        id 5D7BE1276BCE; Fri, 21 Jan 2022 12:34:51 +0000 (UTC)
Received: from localhost (ip-178-200-100-55.hsi07.unitymediagroup.de [178.200.100.55])
        (using TLSv1.2 with cipher AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: flokli@flokli.de)
        by zeus.flokli.de (Postfix) with ESMTPSA id F00131276B9B;
        Fri, 21 Jan 2022 12:32:36 +0000 (UTC)
From:   Florian Klink <flokli@flokli.de>
To:     linux-input@vger.kernel.org
Cc:     ValdikSS <iam@valdikss.org.ru>, Florian Klink <flokli@flokli.de>
Subject: [PATCH v3 2/3] HID: lenovo: Sync Fn-lock state on button press for Compact and TrackPoint II keyboards
Date:   Fri, 21 Jan 2022 13:32:05 +0100
Message-Id: <20220121123206.36978-2-flokli@flokli.de>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220121123206.36978-1-flokli@flokli.de>
References: <e9e1f6ce-f12c-291b-81a8-c76f72ee29f2@valdikss.org.ru>
 <20220121123206.36978-1-flokli@flokli.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

From: ValdikSS <iam@valdikss.org.ru>

When Fn-Esc is pressed on the keyboard, it emits the scancode which could
be used to sync the fn_lock sysfs state.

Previously fn_lock only allowed to set new Fn-lock state and did not
keep the value in sync upon Fn-Esc press, which is now fixed.

Signed-off-by: Florian Klink <flokli@flokli.de>
---
 drivers/hid/hid-lenovo.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/drivers/hid/hid-lenovo.c b/drivers/hid/hid-lenovo.c
index a612ae7dfbfc..e9466ae8a9cb 100644
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
2.34.1

