Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 160B52B034B
	for <lists+linux-input@lfdr.de>; Thu, 12 Nov 2020 12:02:18 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728041AbgKLLCP (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 12 Nov 2020 06:02:15 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55090 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727969AbgKLLCO (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Thu, 12 Nov 2020 06:02:14 -0500
Received: from mail-wr1-x442.google.com (mail-wr1-x442.google.com [IPv6:2a00:1450:4864:20::442])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E2FDAC061A04
        for <linux-input@vger.kernel.org>; Thu, 12 Nov 2020 03:02:11 -0800 (PST)
Received: by mail-wr1-x442.google.com with SMTP id c17so5484621wrc.11
        for <linux-input@vger.kernel.org>; Thu, 12 Nov 2020 03:02:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=nMKE4IlOr6evhy/Ie8gXbBmQpqdbJ7dvrI7Z+uES9YU=;
        b=oVniKyKUgho7jnPFtk0I6A3ULuPQSFCnRTuKY4hKAiDWM7bzWwqQlEqO39PpFQArz7
         7Kqy9ACSUzCdM08TmqUwgI5w+JT0w7sgLA8EGVf1Tmqgg03brLsa6UKebtFQTTzOu6+V
         X0ViJv6AQyvIim12RFf3D25MXR3vfJseB3sqLXF+fdKRmzMtR6VUkq+dkIRonoT25SLI
         MYhBAUJkOfqdrw0KEeY4997CdiVGlLVoSn+6d/AOSU9Krlhm6c4eqxJtgjFepJz3Y64A
         iIU9Asz2/ElC2Un237l1Z9IlsQxOKXdiSi1DXskNYPJ8XSNt++pTPN5TYw1XqeklloiP
         6DpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=nMKE4IlOr6evhy/Ie8gXbBmQpqdbJ7dvrI7Z+uES9YU=;
        b=HOmNKKqOYEcAl7KvAtTJ57oQqk/LaEE+/3jVm2Q47O3p5ySCz8rllv05f5UqUxJsj0
         qXZ2RcfWC8hHyY8vy0hQHjA1ddcFSxa5Bn3/AiQ3+LyUjq56FAwgdLuq3sdAQdjQ3i8K
         OReZlHX+Fkr5oLZYNYCo7BR9HBdGyMztCVvmqNF6Aj9Pt07VTtNkwnneNCRqG7kfbW6k
         HWKZAuizrtkPU/GDqvoslM7LhE+Hd+HeYKk5r1tM3aeIRdUIOde61s8wKATLvPl8VT4M
         AQJj3BDUz+EuUiMV3BPZaTktZHjLRPZKFXieGVEOOgm7KhHBMQfPz6+eqM6jfh15Le5q
         teBQ==
X-Gm-Message-State: AOAM532makLNFNQ0GCWPGGkx20de5thIT6t05um27kqWQ/fFUuK6m8r9
        99ZJdhRgKxFr4ykDI5cPgS4BMA==
X-Google-Smtp-Source: ABdhPJxF7qJ/C1URUnUKpfIrnKc9ev2GZap1FEfEiAR06eLwFKpSNee+i1z21hmzKDMgd//sCFww5w==
X-Received: by 2002:a05:6000:364:: with SMTP id f4mr7221199wrf.290.1605178930645;
        Thu, 12 Nov 2020 03:02:10 -0800 (PST)
Received: from dell.default ([91.110.221.159])
        by smtp.gmail.com with ESMTPSA id x81sm6515329wmg.5.2020.11.12.03.02.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Nov 2020 03:02:10 -0800 (PST)
From:   Lee Jones <lee.jones@linaro.org>
To:     lee.jones@linaro.org
Cc:     linux-kernel@vger.kernel.org,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Joonyoung Shim <jy0922.shim@samsung.com>,
        Donghwa Lee <dh09.lee@samsung.com>, linux-input@vger.kernel.org
Subject: [PATCH 02/15] input: keyboard: samsung-keypad: Remove set but unused variable 'var'
Date:   Thu, 12 Nov 2020 11:01:51 +0000
Message-Id: <20201112110204.2083435-3-lee.jones@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20201112110204.2083435-1-lee.jones@linaro.org>
References: <20201112110204.2083435-1-lee.jones@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Fixes the following W=1 kernel build warning(s):

 drivers/input/keyboard/samsung-keypad.c: In function ‘samsung_keypad_irq’:
 drivers/input/keyboard/samsung-keypad.c:149:15: warning: variable ‘val’ set but not used [-Wunused-but-set-variable]

Cc: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: Joonyoung Shim <jy0922.shim@samsung.com>
Cc: Donghwa Lee <dh09.lee@samsung.com>
Cc: linux-input@vger.kernel.org
Signed-off-by: Lee Jones <lee.jones@linaro.org>
---
 drivers/input/keyboard/samsung-keypad.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/input/keyboard/samsung-keypad.c b/drivers/input/keyboard/samsung-keypad.c
index 70c1d086bdd2a..1ed939d9798cf 100644
--- a/drivers/input/keyboard/samsung-keypad.c
+++ b/drivers/input/keyboard/samsung-keypad.c
@@ -146,13 +146,12 @@ static irqreturn_t samsung_keypad_irq(int irq, void *dev_id)
 {
 	struct samsung_keypad *keypad = dev_id;
 	unsigned int row_state[SAMSUNG_MAX_COLS];
-	unsigned int val;
 	bool key_down;
 
 	pm_runtime_get_sync(&keypad->pdev->dev);
 
 	do {
-		val = readl(keypad->base + SAMSUNG_KEYIFSTSCLR);
+		readl(keypad->base + SAMSUNG_KEYIFSTSCLR);
 		/* Clear interrupt. */
 		writel(~0x0, keypad->base + SAMSUNG_KEYIFSTSCLR);
 
-- 
2.25.1

