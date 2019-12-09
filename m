Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id DACAA117785
	for <lists+linux-input@lfdr.de>; Mon,  9 Dec 2019 21:39:05 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726354AbfLIUjE (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 9 Dec 2019 15:39:04 -0500
Received: from mail-ot1-f67.google.com ([209.85.210.67]:37349 "EHLO
        mail-ot1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726342AbfLIUjE (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Mon, 9 Dec 2019 15:39:04 -0500
Received: by mail-ot1-f67.google.com with SMTP id k14so13472278otn.4;
        Mon, 09 Dec 2019 12:39:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=37oZTgoK/rHPkvQpIwtmm074AngHLngksVgGvWUxYhk=;
        b=Bb8zFyZwzkBiDZXB2SzwOHTu6dyQ6SEpaXqYj1PFLKVeOxwdGICoGBdvMVYb+YUzDJ
         NvOkRlVEh9hxOFp8soQMxzHEyMrwbcBqZ+6Xbrg9rjKhY5vXL7pPlcZaI5x3v8AyCERn
         67VsUVY8rMWPndiM4RNTyJNhu2SlMKK/gl8x1V8fkI+Kwn8rTAlr+irVE+64ceKJW7vt
         n68oJC75jQToZh4s10cP+f0nu9u2TWH+W3v9mJ+2oGNAlgc0v17MmurhcNn2F5Ap5MVK
         qcsnwWCZ2PAXLXNW5YvlNDmuscLkMAS1Lc46/VotzwnoPQN25BUFipGyjBtrnlwt9VVw
         aFUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=37oZTgoK/rHPkvQpIwtmm074AngHLngksVgGvWUxYhk=;
        b=JM8Kn+B3JQuM72YDfAuAa9ndgrFZ1B5r/HjS/gWY0pJAutJztvtEgo6rvVz8gMEHNb
         ifvdUYtNi2Qc4i3H1B98vP2lRgsXlx0MKeNLnbPyI8x4hCsFGp1GAq3P+VuDE9BqMkCU
         BCgjh9aJfcayGBJh2Xg5TYhfM6tTfXvz5mqQhd5Z4A7HyWY/1mPJcg5uR1J5Yxt1i3Sn
         rAl5HS3wCQQmWXGAQSKiRvkUp2dprYKU7V89rapok/XbYJCCZdHlGyADGdgoKLFg4ZP7
         hDyzeIvoqspMVRUbmPDcECGjBU+dSKpuuBDX/coLe5q4/k5vvXAtc34aOiwWFKCaaTED
         tl5g==
X-Gm-Message-State: APjAAAWEYCNhO+LiIG+rXvk2hw3+A4EweRXcYHQDfQu3CEaJcMBH5buF
        uObzk9bG3Ne5qXjGEW3D0Oo=
X-Google-Smtp-Source: APXvYqwhdyGRE34rE7dhSvcAXjrWJ1uSVNz4Oa5xebg4Ew9aSa8w04PyPFSSg2R/MWayf19b4GZhaA==
X-Received: by 2002:a05:6830:1e5c:: with SMTP id e28mr14328632otj.293.1575923943676;
        Mon, 09 Dec 2019 12:39:03 -0800 (PST)
Received: from localhost.localdomain ([2604:1380:4111:8b00::1])
        by smtp.gmail.com with ESMTPSA id 17sm376776oty.48.2019.12.09.12.39.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Dec 2019 12:39:02 -0800 (PST)
From:   Nathan Chancellor <natechancellor@gmail.com>
To:     Jiri Kosina <jkosina@suse.cz>,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>
Cc:     linux-input@vger.kernel.org, linux-kernel@vger.kernel.org,
        clang-built-linux@googlegroups.com,
        Nathan Chancellor <natechancellor@gmail.com>
Subject: [PATCH] HID: core: Adjust indentation in hid_add_device
Date:   Mon,  9 Dec 2019 13:38:55 -0700
Message-Id: <20191209203855.25500-1-natechancellor@gmail.com>
X-Mailer: git-send-email 2.24.0
MIME-Version: 1.0
X-Patchwork-Bot: notify
Content-Transfer-Encoding: 8bit
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Clang warns:

../drivers/hid/hid-core.c:2378:3: warning: misleading indentation;
statement is not part of the previous 'if' [-Wmisleading-indentation]
         if (!hdev->ll_driver->raw_request) {
         ^
../drivers/hid/hid-core.c:2372:2: note: previous statement is here
        if (hid_ignore(hdev))
        ^
1 warning generated.

This warning occurs because there is a space after the tab on this line.
Remove it so that the indentation is consistent with the Linux kernel
coding style and clang no longer warns.

Fixes: 3c86726cfe38 ("HID: make .raw_request mandatory")
Link: https://github.com/ClangBuiltLinux/linux/issues/793
Signed-off-by: Nathan Chancellor <natechancellor@gmail.com>
---
 drivers/hid/hid-core.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/hid/hid-core.c b/drivers/hid/hid-core.c
index e0b241bd3070..9c7f03f23eca 100644
--- a/drivers/hid/hid-core.c
+++ b/drivers/hid/hid-core.c
@@ -2375,10 +2375,10 @@ int hid_add_device(struct hid_device *hdev)
 	/*
 	 * Check for the mandatory transport channel.
 	 */
-	 if (!hdev->ll_driver->raw_request) {
+	if (!hdev->ll_driver->raw_request) {
 		hid_err(hdev, "transport driver missing .raw_request()\n");
 		return -EINVAL;
-	 }
+	}
 
 	/*
 	 * Read the device report descriptor once and use as template
-- 
2.24.0

