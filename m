Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 8EF50174878
	for <lists+linux-input@lfdr.de>; Sat, 29 Feb 2020 18:43:42 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727495AbgB2Rnl (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Sat, 29 Feb 2020 12:43:41 -0500
Received: from mail-wr1-f66.google.com ([209.85.221.66]:34813 "EHLO
        mail-wr1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727247AbgB2Rnl (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Sat, 29 Feb 2020 12:43:41 -0500
Received: by mail-wr1-f66.google.com with SMTP id z15so7318037wrl.1;
        Sat, 29 Feb 2020 09:43:40 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=OlkVf2qhnH/lFuWWW44N2ysxvPKIgehhKY0+lEA5SDQ=;
        b=Dh05t7u5WV4DgYBCZbLVj9gi5yrehZtVaZxdnddw+jOWod3ZM4oHtGINdAFPZuX/mZ
         WEc2tMnwCGdUxZPX/5t5kfP29REMpmSdsI6LtZKAgMx8rLYtWyX07GkmfanKfbGD95dQ
         6eWO7W8Gh+guzWTsCdpcaVBZRF9ciXBil/+3bKLT6qikQtN0XOQoI2E04aQvVvyhku/X
         Je0Mwv8wwQK3OpsfsxL+lxnwUjS9X+fLE+DVXsYeChv0Y1HR/4fownggPLuYUiKF3Y93
         I3CxmLdl4hPr40LGbssD0exFQVjXRkEALdd+YTlA2drjGbDcQOZQMLeazrgqldaZmHFf
         FMUQ==
X-Gm-Message-State: APjAAAWDkVxazJsgd+AglZCGBX5PVjgGq7K8K1t3e/nUv+xlaKNRsivp
        cTQolYKICKOj6bgejmx/l3k=
X-Google-Smtp-Source: APXvYqwQu1iZSxBRIeWZKrYCKIvrKc3RPpnnijbspFLT+Z2QWIjxcBHB/tr8NcBiVDVm66z+oMuaGQ==
X-Received: by 2002:a5d:5745:: with SMTP id q5mr11791913wrw.374.1582998219475;
        Sat, 29 Feb 2020 09:43:39 -0800 (PST)
Received: from archtop.lan ([82.7.199.117])
        by smtp.googlemail.com with ESMTPSA id t3sm18132209wrx.38.2020.02.29.09.43.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 29 Feb 2020 09:43:38 -0800 (PST)
From:   Lucas Tanure <tanure@linux.com>
To:     Jiri Kosina <jikos@kernel.org>,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>,
        linux-input@vger.kernel.org, linux-kernel@vger.kernel.org
Cc:     Lucas Tanure <tanure@linux.com>
Subject: [PATCH 1/2] HID: appleir: Remove unnecessary goto label
Date:   Sat, 29 Feb 2020 17:43:33 +0000
Message-Id: <7c4c591bc1aa9e269cbf764a03e64d32dd6e6e96.1582998175.git.tanure@linux.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Signed-off-by: Lucas Tanure <tanure@linux.com>
---
 drivers/hid/hid-appleir.c | 7 ++-----
 1 file changed, 2 insertions(+), 5 deletions(-)

diff --git a/drivers/hid/hid-appleir.c b/drivers/hid/hid-appleir.c
index bf8d4afe0d6a..aafc285b538f 100644
--- a/drivers/hid/hid-appleir.c
+++ b/drivers/hid/hid-appleir.c
@@ -284,10 +284,8 @@ static int appleir_probe(struct hid_device *hid, const struct hid_device_id *id)
 	struct appleir *appleir;
 
 	appleir = kzalloc(sizeof(struct appleir), GFP_KERNEL);
-	if (!appleir) {
-		ret = -ENOMEM;
-		goto allocfail;
-	}
+	if (!appleir)
+		return -ENOMEM;
 
 	appleir->hid = hid;
 
@@ -314,7 +312,6 @@ static int appleir_probe(struct hid_device *hid, const struct hid_device_id *id)
 	return 0;
 fail:
 	kfree(appleir);
-allocfail:
 	return ret;
 }
 
-- 
2.25.1

