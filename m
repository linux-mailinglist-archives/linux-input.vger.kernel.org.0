Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DA13F395500
	for <lists+linux-input@lfdr.de>; Mon, 31 May 2021 07:23:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229970AbhEaFYw (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 31 May 2021 01:24:52 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34422 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229803AbhEaFYv (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Mon, 31 May 2021 01:24:51 -0400
Received: from mail-pj1-x102c.google.com (mail-pj1-x102c.google.com [IPv6:2607:f8b0:4864:20::102c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4453EC061574;
        Sun, 30 May 2021 22:23:11 -0700 (PDT)
Received: by mail-pj1-x102c.google.com with SMTP id g6-20020a17090adac6b029015d1a9a6f1aso9763486pjx.1;
        Sun, 30 May 2021 22:23:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=0xibS8mz/JdJSyNGf1+HxezErHYeOwtLnDSIUIiAJqw=;
        b=f5VAN3eTRZgcud7m2Vlk5QUjWe5E+K4THRKtEbSnOpndKBtpzBIjcbjumwQqEox9jP
         TQ00JUQqQhcXDDEeNR82bjPEHow1UKlQS6KUK/Flp4iWI33N+sRETOfafT/YjijihYpU
         Zc9CZUhgLob1ug4PNn5COz5Mron4O7c84T6ePygWKtHaQeBF9z3p+OTQYUaXxNiA+NYk
         rMshCPyoJtmEVM1aGjSkzCfGhjO7RJ3LTHk2FBgc1yb+35Y+B3RSc7VlZhxMY7POCo6Q
         458jtBvq816tBM7DiTrtSusKXBNlfuqHU95r5iave1DjYQLkHOhfF7KW9B+N0atEqs8w
         YmdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=0xibS8mz/JdJSyNGf1+HxezErHYeOwtLnDSIUIiAJqw=;
        b=CuTwataQxv0VKEP21MSCUI8RhJZyLxKiUxHokQSpg/5r3GqXoNZ0R3MUORQqq7Bt1G
         +GZtBEAo1Kuq72hBGwKyHbgEgqY+DGUklogHsww9Ekzj1KMyS4kLBtLoqtZERbbKi1HC
         x1L9Oeg+XVYOxY8TEe5uEIBNpsKsi1Rx2dmFN7BHSc0VJcm7FRscMart7MTriPvi+Gjc
         Z5FH6Cd8cQfuJGFPvrQ8Rl2iklb6VVrRDMtcA+FBYk0ANx2LjS95eL+O4CCxbTao2CMN
         EXWPG5QvpOicR9GnM2g380U99StGh0Fb2wazdcTTEmuZHR/EF8xaZte6SieO4Kv6xS22
         3Z4A==
X-Gm-Message-State: AOAM531nCCslFWN7CTEu+JKGWzlh2aEdxNvNCmrAIMMUprDxU+yAXZsF
        OcWF8SPJz87WUcZ79/9LP1K8EgfJ/Z8=
X-Google-Smtp-Source: ABdhPJwi5WBCdANmuUtFZDs/3wpz/u2huq03n/KH4sVSe87JV4/lww+EPgOU9ns47aYilrvYrx8T3w==
X-Received: by 2002:a17:902:9a83:b029:105:e1ad:c54e with SMTP id w3-20020a1709029a83b0290105e1adc54emr882794plp.41.1622438590692;
        Sun, 30 May 2021 22:23:10 -0700 (PDT)
Received: from dtor-ws.mtv.corp.google.com ([2620:15c:202:201:f797:8c47:4837:ec11])
        by smtp.gmail.com with ESMTPSA id y1sm9895555pfn.13.2021.05.30.22.23.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 30 May 2021 22:23:09 -0700 (PDT)
From:   Dmitry Torokhov <dmitry.torokhov@gmail.com>
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     linux-input@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH 1/2] Input: cyttsp - change maintainer
Date:   Sun, 30 May 2021 22:23:06 -0700
Message-Id: <20210531052307.1433979-1-dmitry.torokhov@gmail.com>
X-Mailer: git-send-email 2.32.0.rc0.204.g9fa02ecfa5-goog
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Ferruh's email has been bouncing for quite some time ans Linus has agreed
to look over the driver.

Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
---
 MAINTAINERS | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index 08005bafb97f..9a43400480e2 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -4914,9 +4914,9 @@ S:	Maintained
 F:	drivers/input/touchscreen/cy8ctma140.c
 
 CYTTSP TOUCHSCREEN DRIVER
-M:	Ferruh Yigit <fery@cypress.com>
+M:	Linus Walleij <linus.walleij@linaro.org>
 L:	linux-input@vger.kernel.org
-S:	Supported
+S:	Maintained
 F:	drivers/input/touchscreen/cyttsp*
 F:	include/linux/input/cyttsp.h
 
-- 
2.32.0.rc0.204.g9fa02ecfa5-goog

