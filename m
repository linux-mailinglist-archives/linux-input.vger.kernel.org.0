Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E40D2429B0E
	for <lists+linux-input@lfdr.de>; Tue, 12 Oct 2021 03:37:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234408AbhJLBjm (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 11 Oct 2021 21:39:42 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54344 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232492AbhJLBjl (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Mon, 11 Oct 2021 21:39:41 -0400
Received: from mail-pj1-x102a.google.com (mail-pj1-x102a.google.com [IPv6:2607:f8b0:4864:20::102a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D1EB4C061570;
        Mon, 11 Oct 2021 18:37:40 -0700 (PDT)
Received: by mail-pj1-x102a.google.com with SMTP id k23-20020a17090a591700b001976d2db364so1310130pji.2;
        Mon, 11 Oct 2021 18:37:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=TbVMS7P/q6HafBOcr4bcqRI0ZoGUj1NgWInPQIDJGfs=;
        b=eWrljR1e27yaXHJZXIimuNiWJn6RXDQO1aX150IBEOwZKwJZbqacL/orOFJket7vf7
         35xxweILdJRnIFPZ1ULciJeG3FZi1PL4N+qzH9M9HKAZTjt+9fcM8aWRbmCuBULgQ4bl
         v2pVUdljn5OXo2w6Y7oTLyKR2jt31OnSWCivdsjIaTwr0ZQUt+HO4sABg/iG/nAFBEn2
         n+E/FJckrsufJsNyK7/QWlS2+Ihotv3wDoMFeimpJFtqcgO9oSXIkEnhYSm4oSB5C1O3
         MrtLRBMtZQ6acEg52FeRITLi89zeSeLKGMsHrr2guv+mB2zEdNetgE2FzXLlPYkalZ3n
         aobg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=TbVMS7P/q6HafBOcr4bcqRI0ZoGUj1NgWInPQIDJGfs=;
        b=2ef14eWt7ZGCP6FhQv0aOh/o0c5WqOza8Y1NYlghloqJN7YgfQhOctqPwVkia6D8zm
         GXjjvuYNPwiImFExWA/vb12BqENkCumVcuuLU9lYqxkR1NmlVaACG/8ibHaWgqJd+qNR
         JTADur6zM71J5CGui/wSGlWW/5eN/ZRVKl3V/SFA4M5RyPcCTPx9o2fgu1Bf0wYsXGt3
         VJ+3jf40U1zxzrSjQ7TY826tuo90yJZCYc2pKBtADcBaO1yOo17CBSzHZA5I4Cqds1+n
         IygiAYqPzvQ8gmEhhzXVeBegnoxo+XXuYNzGTWhCVeosDnExrIp4OnU5TG+z+2tCREN6
         i2nw==
X-Gm-Message-State: AOAM533I4tMWwk9nfmmXmUsRfXCxfGZlnZce2YYE7Y8TF/6FfLMv1KNi
        +S7KKCRSrN9p7sSUtH/HCmKEqNxvPBo=
X-Google-Smtp-Source: ABdhPJy6Q9TlBNrOJ0TAkl+CiHCMxlhzhhhJiVCTfmQDwW1cqDZ388o7KJnQerhPSZ1t/Vzhe8GPFg==
X-Received: by 2002:a17:90b:354a:: with SMTP id lt10mr2833374pjb.3.1634002659345;
        Mon, 11 Oct 2021 18:37:39 -0700 (PDT)
Received: from dtor-ws.mtv.corp.google.com ([2620:15c:202:201:10fb:4b55:2926:7ada])
        by smtp.gmail.com with ESMTPSA id nr14sm654719pjb.24.2021.10.11.18.37.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 Oct 2021 18:37:38 -0700 (PDT)
From:   Dmitry Torokhov <dmitry.torokhov@gmail.com>
To:     linux-input@vger.kernel.org
Cc:     Alexander Sverdlin <alexander.sverdlin@gmail.com>,
        linux-kernel@vger.kernel.org
Subject: [PATCH 1/4] Input: ep93xx_keypad - annotate suspend/resume as __maybe_unused
Date:   Mon, 11 Oct 2021 18:37:32 -0700
Message-Id: <20211012013735.3523140-1-dmitry.torokhov@gmail.com>
X-Mailer: git-send-email 2.33.0.882.g93a45727a2-goog
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Instead of guarding suspend/resume methods with #ifdef CONFIG_PM
let's mark them as __maybe_unused as this allows better compile
coverage.

Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
---
 drivers/input/keyboard/ep93xx_keypad.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/input/keyboard/ep93xx_keypad.c b/drivers/input/keyboard/ep93xx_keypad.c
index e0e931e796fa..a0c6cdf8e0d3 100644
--- a/drivers/input/keyboard/ep93xx_keypad.c
+++ b/drivers/input/keyboard/ep93xx_keypad.c
@@ -175,8 +175,7 @@ static void ep93xx_keypad_close(struct input_dev *pdev)
 }
 
 
-#ifdef CONFIG_PM_SLEEP
-static int ep93xx_keypad_suspend(struct device *dev)
+static int __maybe_unused ep93xx_keypad_suspend(struct device *dev)
 {
 	struct platform_device *pdev = to_platform_device(dev);
 	struct ep93xx_keypad *keypad = platform_get_drvdata(pdev);
@@ -197,7 +196,7 @@ static int ep93xx_keypad_suspend(struct device *dev)
 	return 0;
 }
 
-static int ep93xx_keypad_resume(struct device *dev)
+static int __maybe_unused ep93xx_keypad_resume(struct device *dev)
 {
 	struct platform_device *pdev = to_platform_device(dev);
 	struct ep93xx_keypad *keypad = platform_get_drvdata(pdev);
@@ -220,7 +219,6 @@ static int ep93xx_keypad_resume(struct device *dev)
 
 	return 0;
 }
-#endif
 
 static SIMPLE_DEV_PM_OPS(ep93xx_keypad_pm_ops,
 			 ep93xx_keypad_suspend, ep93xx_keypad_resume);
-- 
2.33.0.882.g93a45727a2-goog

