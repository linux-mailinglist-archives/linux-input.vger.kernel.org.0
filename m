Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A9AB4377771
	for <lists+linux-input@lfdr.de>; Sun,  9 May 2021 17:52:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229669AbhEIPxe (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Sun, 9 May 2021 11:53:34 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48268 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229645AbhEIPxe (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Sun, 9 May 2021 11:53:34 -0400
Received: from mail-wm1-x32b.google.com (mail-wm1-x32b.google.com [IPv6:2a00:1450:4864:20::32b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E7E80C061573;
        Sun,  9 May 2021 08:52:30 -0700 (PDT)
Received: by mail-wm1-x32b.google.com with SMTP id s82so7793311wmf.3;
        Sun, 09 May 2021 08:52:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=/ypDkbMZaKPK8sfgDZCv9j21HgYlr75ecNlXl40Qqfc=;
        b=EoPa8bUdKFyBjVbsoqioR3RF8WK0eQBFtO6JeAJjjMKaT3ZyunKakwUcpUEE5LeJ73
         D0we/k8vulIchkHVu9VFjO0jBYpZoiXe/D1bZygKujfQAbPNxhPIh/DVzYayB0uAFq7f
         tWBlYJNdWaIUYAVnvJiRE+Q6K7Wt13sns47QTujP2+5jf4SlL5RGXESRgytBDDdij3o8
         LsXR9Py4gxjHyqOCEjxJDkDhKWetUfDo/2k2nNCAlPyePPtco5Oa1PTFKS4zPOAs1UTO
         NEqXPSxPN3gMVXuUtkpTc18lD4pCZKDhIgCMUwrML034BK8WRVWKbc+TQpasJmTT2U+k
         F35A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=/ypDkbMZaKPK8sfgDZCv9j21HgYlr75ecNlXl40Qqfc=;
        b=S2IaT79w44GjaSTzt6IWd5tqZXu93XMnDT3glFpCSfOBfZOJ7Mtt0uLRZ1w1DlTgkq
         wQzf5K4InZwOyeSGrVOz57xMQ1aDYxNl9vl4cZlhPOoi8qWqQ6+wdi5OrC0HQqUeqLSg
         /MTB1o6iIm2ekUTrab2kTaMrkWIFNu2vDKNBqrIuNvOhvJY/9lRTz6urRqxkTlK+G06c
         G6z3G2pVQ7ZQDw9y0k0n11na5y4siBGixUjaf3KcI9IK7QL28auZzgsXlAZWMfzBnUsz
         mUh74k6pIudcHCuYeqVVMrxmDjunCxxAt//HCpE4VA577uCqSzWsMPnHG042Ny3j8QfI
         yuOA==
X-Gm-Message-State: AOAM533NiBDyU58andPfDjYZPUJX5AwXnzNCZDyqf2tcORqQVcPRtx9Y
        +wM8+r89cyTLiyrsmV/K29PGJBL898bCYKR1
X-Google-Smtp-Source: ABdhPJwJYntq3Tn5Ue0vG01f4EXq0m3ObkAuA36mJMvQSRj6jrBm1DvonCOH8ATTF31Z8RKMjmrmgQ==
X-Received: by 2002:a1c:9a95:: with SMTP id c143mr22019705wme.143.1620575548969;
        Sun, 09 May 2021 08:52:28 -0700 (PDT)
Received: from localhost.localdomain ([94.73.38.147])
        by smtp.gmail.com with ESMTPSA id i3sm13591172wmq.28.2021.05.09.08.52.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 09 May 2021 08:52:28 -0700 (PDT)
From:   =?UTF-8?q?Jos=C3=A9=20Exp=C3=B3sito?= <jose.exposito89@gmail.com>
To:     jikos@kernel.org
Cc:     benjamin.tissoires@redhat.com, linux-input@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        =?UTF-8?q?Jos=C3=A9=20Exp=C3=B3sito?= <jose.exposito89@gmail.com>
Subject: [PATCH] HID: magicmouse: fix crash when disconnecting Magic Trackpad 2
Date:   Sun,  9 May 2021 17:51:38 +0200
Message-Id: <20210509155138.39601-1-jose.exposito89@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

When the Apple Magic Trackpad 2 is connected over USB it registers four
hid_device interfaces, however, the driver only handles the one with
type HID_TYPE_USBMOUSE and ignores the other three, thus, no driver
data is attached to them.

When the device is disconnected, the remove method is called for the
four hid_device interfaces, crashing when the driver data is NULL.

Check that the driver data is not NULL before using it on the remove
callback.

Signed-off-by: José Expósito <jose.exposito89@gmail.com>
---
 linux/drivers/hid/hid-magicmouse.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/linux/drivers/hid/hid-magicmouse.c b/linux/drivers/hid/hid-magicmouse.c
index 2bb473d..097870e 100644
--- a/linux/drivers/hid/hid-magicmouse.c
+++ b/linux/drivers/hid/hid-magicmouse.c
@@ -779,7 +779,10 @@ err_stop_hw:
 static void magicmouse_remove(struct hid_device *hdev)
 {
 	struct magicmouse_sc *msc = hid_get_drvdata(hdev);
-	cancel_delayed_work_sync(&msc->work);
+
+	if (msc)
+		cancel_delayed_work_sync(&msc->work);
+
 	hid_hw_stop(hdev);
 }
 
-- 
2.25.1

