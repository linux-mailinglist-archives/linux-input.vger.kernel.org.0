Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 41A91430740
	for <lists+linux-input@lfdr.de>; Sun, 17 Oct 2021 10:38:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S245082AbhJQIkv (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Sun, 17 Oct 2021 04:40:51 -0400
Received: from mail.valdk.tel ([185.177.150.13]:48978 "EHLO mail.valdk.tel"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S245085AbhJQIkv (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Sun, 17 Oct 2021 04:40:51 -0400
X-Greylist: delayed 310 seconds by postgrey-1.27 at vger.kernel.org; Sun, 17 Oct 2021 04:40:50 EDT
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 9018F28C9CC
        for <linux-input@vger.kernel.org>; Sun, 17 Oct 2021 11:33:24 +0300 (MSK)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=valdikss.org.ru;
        s=msrv; t=1634459606; h=from:subject:date:message-id:to:mime-version:
         content-transfer-encoding:in-reply-to:references;
        bh=YxyGfVJXUl8xRFIvCAje0X50X4q2kdPdRWs456LrRzU=;
        b=jMaXMH7EK4GMMQaHWHgQIgUH4CzbGqBjKEqqzLvbPsSroGW9w0tHJQ5sEFF/wjO9L3mzZs
        NmRO2yPy93LS8aSfk18Ur3BJsDVqe0nEysRBsMOvAa+/2jRJDliln5oTRtycDY0iKXy4Nf
        SQHFHV5N0ueqHS0HhCWppIQBa8PXEWtOXqzXa3H+wy1Gi/nDLsbMkxRCmqmyYI9trHCf+Z
        mcN+vcyCla2JvC1psdoHeekqmGa9HXUWLYQMvJePoK5jdqtmMSUx4x8aZx/LXrp97M9JRT
        +GXkIm/XQbhyQLrXRlERcSK9c++vsxApqEpKe3ruBScL+4wkLtnz7dgttdFaKw==
From:   ValdikSS <iam@valdikss.org.ru>
To:     linux-input@vger.kernel.org
Subject: [PATCH 2/2] Sync Fn-lock state on button press for Compact and TrackPoint II keyboards
Date:   Sun, 17 Oct 2021 11:32:46 +0300
Message-Id: <20211017083246.977096-2-iam@valdikss.org.ru>
In-Reply-To: <20211017083246.977096-1-iam@valdikss.org.ru>
References: <20211017083246.977096-1-iam@valdikss.org.ru>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

When Fn-Esc is pressed on the keyboard, it emits the scancode which could
be used to sync the fn_lock sysfs state.
Previously fn_lock only allowed to set new Fn-lock state.

Signed-off-by: ValdikSS <iam@valdikss.org.ru>
---
 drivers/hid/hid-lenovo.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/drivers/hid/hid-lenovo.c b/drivers/hid/hid-lenovo.c
index 498246cab..62561fb9f 100644
--- a/drivers/hid/hid-lenovo.c
+++ b/drivers/hid/hid-lenovo.c
@@ -695,6 +695,15 @@ static int lenovo_event_cptkbd(struct hid_device *hdev,
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

