Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E01003A5AFC
	for <lists+linux-input@lfdr.de>; Mon, 14 Jun 2021 01:31:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232220AbhFMXdq (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Sun, 13 Jun 2021 19:33:46 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58616 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232245AbhFMXdp (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Sun, 13 Jun 2021 19:33:45 -0400
Received: from mail-wm1-x334.google.com (mail-wm1-x334.google.com [IPv6:2a00:1450:4864:20::334])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D4DE9C061767;
        Sun, 13 Jun 2021 16:31:27 -0700 (PDT)
Received: by mail-wm1-x334.google.com with SMTP id 3-20020a05600c0243b029019f2f9b2b8aso11712948wmj.2;
        Sun, 13 Jun 2021 16:31:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=16tOXTFARRM7dKHNQ+/96ISTaL6FsxfGvA/KqriFMEI=;
        b=n7zBl0CXUp2knd7Z1u/xgP7MXaDYm2cbdIJwuSJe458mygeXpa++bY9+2NGqacnEyx
         HfGuSmD33i+4kO0faJr8etKOREGsXRU8CAAlbHp7oUAW+7PDfYKGVTR+RZulQnZHIJat
         OCXk+39Hx3w24wLllbNPQ+EiRcSXVzMy76nV17epgpz4PuwwJ71/9i35hOUpyaZlfImB
         S9LAyWLtt8sZQKZdtyyXHYfn5/98xb/9prbXIjfxcGkME1+yiUhHKfD2PEggkRXFqgqP
         ySdDgYLiIZh7Xw4XEzeXFhGNUmRH7fIrL2QGuElWewLRnyFMqdbhKibTYZ92NKp5FSAD
         DAcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=16tOXTFARRM7dKHNQ+/96ISTaL6FsxfGvA/KqriFMEI=;
        b=r/dYTLXcniPKFXrafZnXlwXWPloSSK+wIAOHBilLhNwgY4MxlDm/ofFPIKEc1pKXNO
         Y3SBtmJhbDz/jac1BgMxuateuvmo1EYl4T9HQ+24V4AEex0tlzUzWG+DNtpZh6P1nF6w
         Lv4kFHzLG2NiaGRCBVNSJ4J5VRBvX33G10Px00iOgucdoRLI6deFDB3qdDPQdibuAvxK
         zUqEaEX9Ge6UqvNITTE6bUcHm70A1C7Q6w1VUXTZFvNqKyMCcjo8/4ih7BNBjYEcE5RL
         hapBfdoYkQSd7hLfTQtf+nJZdhxM7jzZotikTX05YtnKq+K15Oh9jd7/ITlFcFjmua6/
         torw==
X-Gm-Message-State: AOAM530kXsk93BbSdPFT1uAUO6YXuNYrgcl0EkzIkj6LYKdfHKxplR4r
        cAY80kfg/xoem0VZD7mCl2Q=
X-Google-Smtp-Source: ABdhPJyenv4WmNvHo9WeEQc1A13FYXEHa5yHxB+e6gDqJyLjjfp5k8D6OjkKq5vTzruexNKKgHgR3Q==
X-Received: by 2002:a05:600c:1c1b:: with SMTP id j27mr13670286wms.133.1623627082242;
        Sun, 13 Jun 2021 16:31:22 -0700 (PDT)
Received: from localhost.localdomain ([195.245.23.224])
        by smtp.gmail.com with ESMTPSA id i9sm17882511wrn.54.2021.06.13.16.31.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 13 Jun 2021 16:31:21 -0700 (PDT)
From:   Alexander Sverdlin <alexander.sverdlin@gmail.com>
To:     Geert Uytterhoeven <geert@linux-m68k.org>,
        Nikita Shubin <nikita.shubin@maquefel.me>,
        linux-input@vger.kernel.org
Cc:     Alexander Sverdlin <alexander.sverdlin@gmail.com>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        linux-kernel@vger.kernel.org
Subject: [PATCH 3/7] Input: ep93xx_keypad: Prepare clock before using it
Date:   Mon, 14 Jun 2021 01:30:37 +0200
Message-Id: <20210613233041.128961-4-alexander.sverdlin@gmail.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20210613233041.128961-1-alexander.sverdlin@gmail.com>
References: <20210613233041.128961-1-alexander.sverdlin@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Use clk_prepare_enable()/clk_disable_unprepare() in preparation for switch
to Common Clock Framework.

Signed-off-by: Alexander Sverdlin <alexander.sverdlin@gmail.com>
---
 drivers/input/keyboard/ep93xx_keypad.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/input/keyboard/ep93xx_keypad.c b/drivers/input/keyboard/ep93xx_keypad.c
index c8194333d612..e0e931e796fa 100644
--- a/drivers/input/keyboard/ep93xx_keypad.c
+++ b/drivers/input/keyboard/ep93xx_keypad.c
@@ -157,7 +157,7 @@ static int ep93xx_keypad_open(struct input_dev *pdev)
 
 	if (!keypad->enabled) {
 		ep93xx_keypad_config(keypad);
-		clk_enable(keypad->clk);
+		clk_prepare_enable(keypad->clk);
 		keypad->enabled = true;
 	}
 
@@ -169,7 +169,7 @@ static void ep93xx_keypad_close(struct input_dev *pdev)
 	struct ep93xx_keypad *keypad = input_get_drvdata(pdev);
 
 	if (keypad->enabled) {
-		clk_disable(keypad->clk);
+		clk_disable_unprepare(keypad->clk);
 		keypad->enabled = false;
 	}
 }
-- 
2.32.0

