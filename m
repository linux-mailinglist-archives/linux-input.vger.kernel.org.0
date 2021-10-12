Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D5B99429B12
	for <lists+linux-input@lfdr.de>; Tue, 12 Oct 2021 03:37:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234857AbhJLBjp (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 11 Oct 2021 21:39:45 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54360 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234883AbhJLBjo (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Mon, 11 Oct 2021 21:39:44 -0400
Received: from mail-pj1-x1031.google.com (mail-pj1-x1031.google.com [IPv6:2607:f8b0:4864:20::1031])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 31714C06161C;
        Mon, 11 Oct 2021 18:37:44 -0700 (PDT)
Received: by mail-pj1-x1031.google.com with SMTP id kk10so14532863pjb.1;
        Mon, 11 Oct 2021 18:37:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=JuTrusPmcxFZVC/Xp3VUv/nhvyc/B5TfxbStn00X03o=;
        b=UhjNqDQB6CpZhMBGQBkKs0FPEP7Kw1kGREoPHf0IsgdJQBSyPP76ZbTa6y2zm8MoNU
         Y0WvO0NA4y8y/eNjBEXXiJsd0jxRF9QDCyTs7BrExE+tEI+weLebxDHoxfBwPKsMk97l
         jXvTT3BVe1db0tdS62qc426RsAmgPD1gVrrx+ezCRpzBjRaTPwIKBAQ6aoO8gH7/NW9T
         DbwLjUyIxYMLoZ6osiAn+j0PSe/jWZaYp4v1AvD5aR4VUENhU4Xo9iulldqbuiY1r6rS
         atTIj0OA308AR8zPKF7O5AQAW4Ic5wXvTWVLyl9pRMg/nIcSv6sRKSOKaVaW3zV8dECs
         tAUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=JuTrusPmcxFZVC/Xp3VUv/nhvyc/B5TfxbStn00X03o=;
        b=zyK1wPT64+N803TZYXPjV3XtvYL8CyDddCCWFQoCK+HEaw9PnPuufqevZ77KwEi34B
         RTU4bpfsvBOV3s37itu0wesOo2Sx1K8PdOtVb8/1RUXBAgal1LKCawdJZg6TR1X5Al5n
         bmouHhtDOnCNbj76P75nI4NDgvP9TmGE0MWe+ID3JsOvdUNJxWEqMdpC+YkNo3ddU4sX
         f3M/+L1YN0/z8TfZ5L/tvJsZZUl90BOckDA9KN31N4VzvhSc1YQmEZ+iy0xltKeLPGHS
         W9VLjL5RJFMcmTUe2G2suPYf6rS5UvKPJW7f6KDHXNIJWgwxPN0a3hfW61dX7vpYEEVr
         72HA==
X-Gm-Message-State: AOAM533uJgZXVt8vTrZHppOT3+akMCB38VvywKeVysjmRvT3TfjQuW3X
        4am0szroY8AqRRjgs8+rjRQRwhnClXU=
X-Google-Smtp-Source: ABdhPJxFeuL4/oAvFlqfKV7YamSy/GEgfAEqvE4igop89RRb40Hu8UNrMBXD5+/8pJ+3MOg4X9vqtQ==
X-Received: by 2002:a17:903:32c7:b0:13e:ea76:f8cb with SMTP id i7-20020a17090332c700b0013eea76f8cbmr27395192plr.74.1634002662925;
        Mon, 11 Oct 2021 18:37:42 -0700 (PDT)
Received: from dtor-ws.mtv.corp.google.com ([2620:15c:202:201:10fb:4b55:2926:7ada])
        by smtp.gmail.com with ESMTPSA id nr14sm654719pjb.24.2021.10.11.18.37.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 Oct 2021 18:37:42 -0700 (PDT)
From:   Dmitry Torokhov <dmitry.torokhov@gmail.com>
To:     linux-input@vger.kernel.org
Cc:     Alexander Sverdlin <alexander.sverdlin@gmail.com>,
        linux-kernel@vger.kernel.org
Subject: [PATCH 3/4] Input: ep93xx_keypad - use dev_pm_set_wake_irq()
Date:   Mon, 11 Oct 2021 18:37:34 -0700
Message-Id: <20211012013735.3523140-3-dmitry.torokhov@gmail.com>
X-Mailer: git-send-email 2.33.0.882.g93a45727a2-goog
In-Reply-To: <20211012013735.3523140-1-dmitry.torokhov@gmail.com>
References: <20211012013735.3523140-1-dmitry.torokhov@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Instead of manually toggling interrupt as wakeup source in suspend/resume
methods, let's declare keypad interrupt and wakeup interrupt and leave the
rest to the PM core.

Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
---
 drivers/input/keyboard/ep93xx_keypad.c | 13 +++++++------
 1 file changed, 7 insertions(+), 6 deletions(-)

diff --git a/drivers/input/keyboard/ep93xx_keypad.c b/drivers/input/keyboard/ep93xx_keypad.c
index 6be5474ba2f2..a66cfeaf5b21 100644
--- a/drivers/input/keyboard/ep93xx_keypad.c
+++ b/drivers/input/keyboard/ep93xx_keypad.c
@@ -27,6 +27,7 @@
 #include <linux/slab.h>
 #include <linux/soc/cirrus/ep93xx.h>
 #include <linux/platform_data/keypad-ep93xx.h>
+#include <linux/pm_wakeirq.h>
 
 /*
  * Keypad Interface Register offsets
@@ -191,9 +192,6 @@ static int __maybe_unused ep93xx_keypad_suspend(struct device *dev)
 
 	mutex_unlock(&input_dev->mutex);
 
-	if (device_may_wakeup(&pdev->dev))
-		enable_irq_wake(keypad->irq);
-
 	return 0;
 }
 
@@ -203,9 +201,6 @@ static int __maybe_unused ep93xx_keypad_resume(struct device *dev)
 	struct ep93xx_keypad *keypad = platform_get_drvdata(pdev);
 	struct input_dev *input_dev = keypad->input_dev;
 
-	if (device_may_wakeup(&pdev->dev))
-		disable_irq_wake(keypad->irq);
-
 	mutex_lock(&input_dev->mutex);
 
 	if (input_device_enabled(input_dev)) {
@@ -316,7 +311,11 @@ static int ep93xx_keypad_probe(struct platform_device *pdev)
 		goto failed_free_irq;
 
 	platform_set_drvdata(pdev, keypad);
+
 	device_init_wakeup(&pdev->dev, 1);
+	err = dev_pm_set_wake_irq(&pdev->dev, keypad->irq);
+	if (err)
+		dev_warn(&pdev->dev, "failed to set up wakeup irq: %d\n", err);
 
 	return 0;
 
@@ -342,6 +341,8 @@ static int ep93xx_keypad_remove(struct platform_device *pdev)
 	struct ep93xx_keypad *keypad = platform_get_drvdata(pdev);
 	struct resource *res;
 
+	dev_pm_clear_wake_irq(&pdev->dev);
+
 	free_irq(keypad->irq, keypad);
 
 	if (keypad->enabled)
-- 
2.33.0.882.g93a45727a2-goog

