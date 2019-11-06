Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3C533F0EBC
	for <lists+linux-input@lfdr.de>; Wed,  6 Nov 2019 07:07:10 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730272AbfKFGHJ (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 6 Nov 2019 01:07:09 -0500
Received: from mail-yw1-f65.google.com ([209.85.161.65]:40346 "EHLO
        mail-yw1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729966AbfKFGHJ (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Wed, 6 Nov 2019 01:07:09 -0500
Received: by mail-yw1-f65.google.com with SMTP id a67so9216725ywg.7
        for <linux-input@vger.kernel.org>; Tue, 05 Nov 2019 22:07:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=SmFjnAIFh2gUqdvKRpTCd7aeEiOY9CdSh1BQkzZ/c3c=;
        b=tSihw4YnCDL7JjmklsFJlGA8L2zScTcLFXDY2WYgFdDX4IUuPwb6DC7EAC4eCkLuLX
         EZmkATgaY7+gutKLXW2saLyogSPUQAt8/Z4KD3mLloamDSlufo2ACpqnfGMAh168Mvlh
         pomHlPnJ9d0A11ajpedKko5yByoYBwsfLuW1BFrtFHJUeXwJqhQKteFRQDkynnhdB1zU
         ZDflvtcz/Fa8aWyeexyKa/0RXPZWxvGpysZSBVs6ANnvdhhratt477EyUFsDVhmt2+LY
         jtk/Yrt/zDeCc3zgB7R6oVCu1Os1l9CSQOyG8Yjv5pxcQ52uPpDmIfhHz6JRxOqOWLW1
         3Z6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=SmFjnAIFh2gUqdvKRpTCd7aeEiOY9CdSh1BQkzZ/c3c=;
        b=HzDqXxrybJvrgd3+tEnL7b1t5mahiDtMp74kaD3O/CtOS1Zh1s5tyk11ua4Bj8zQWA
         2yXTQZOIId7tFPTS45uJ5+wxoD0GlNPsX5PqwXO8CxB8TiSeTqDQmX6mnO+iMzmOcx0q
         FU9QBJq9LrPqOE5PP4ub4yVdYqomGYhfxpC1aA0cGMHnyMeP6pICPaJpsLNy1bX2UJJO
         Aw51Xssl4nauwCA25Bm18CML3D4C2O4rvZdJN0VkXtG0KwQs/7wK3ecxDiW6quWDKJ+i
         xK2qG+G704H9aXkGJR0GRYcjqjXDD+JPe4uyItnJ/pnw3cumz+ucBa12AbrAk9f95rh6
         XZow==
X-Gm-Message-State: APjAAAWwAwhM30gg8q9P+aDv4vSQDsZg7mxV4foL01CfBA13D8doTYMf
        WVUoSNkbOAMq/Pvh5WnQBsMVzo1D25gIqA==
X-Google-Smtp-Source: APXvYqz7HHttA/JWVBe96MA0cW7MahviepkdWZ0lGeEEUfOkt4VIwBt2On5O0LsMAl73qE0IYjbsvg==
X-Received: by 2002:a81:5745:: with SMTP id l66mr485741ywb.70.1573020428092;
        Tue, 05 Nov 2019 22:07:08 -0800 (PST)
Received: from Arrakis.djogorchock.com ([136.33.205.58])
        by smtp.gmail.com with ESMTPSA id e82sm11039596ywb.87.2019.11.05.22.07.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 Nov 2019 22:07:07 -0800 (PST)
From:   "Daniel J. Ogorchock" <djogorchock@gmail.com>
To:     linux-input@vger.kernel.org
Cc:     thunderbird2k@gmail.com, blaws05@gmail.com,
        benjamin.tissoires@redhat.com, jikos@kernel.org,
        Roderick.Colenbrander@sony.com, svv@google.com, s.jegen@gmail.com,
        "Daniel J. Ogorchock" <djogorchock@gmail.com>
Subject: [PATCH v9 09/10] HID: nintendo: patch hw version for userspace HID mappings
Date:   Wed,  6 Nov 2019 00:06:47 -0600
Message-Id: <20191106060648.3018478-10-djogorchock@gmail.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20191106060648.3018478-1-djogorchock@gmail.com>
References: <20191106060648.3018478-1-djogorchock@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

This patch sets the most significant bit of the hid hw version to allow
userspace to distinguish between this driver's input mappings vs. the
default hid mappings. This prevents breaking userspace applications that
use SDL2 for gamepad input, allowing them to distinguish the mappings
based on the version.

Signed-off-by: Daniel J. Ogorchock <djogorchock@gmail.com>
---
 drivers/hid/hid-nintendo.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/drivers/hid/hid-nintendo.c b/drivers/hid/hid-nintendo.c
index 074fd59decbe..24c4ec4e453a 100644
--- a/drivers/hid/hid-nintendo.c
+++ b/drivers/hid/hid-nintendo.c
@@ -1356,6 +1356,15 @@ static int nintendo_hid_probe(struct hid_device *hdev,
 		goto err_wq;
 	}
 
+	/*
+	 * Patch the hw version of pro controller/joycons, so applications can
+	 * distinguish between the default HID mappings and the mappings defined
+	 * by the Linux game controller spec. This is important for the SDL2
+	 * library, which has a game controller database, which uses device ids
+	 * in combination with version as a key.
+	 */
+	hdev->version |= 0x8000;
+
 	ret = hid_hw_start(hdev, HID_CONNECT_HIDRAW);
 	if (ret) {
 		hid_err(hdev, "HW start failed\n");
-- 
2.23.0

