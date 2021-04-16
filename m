Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D06973617E7
	for <lists+linux-input@lfdr.de>; Fri, 16 Apr 2021 04:57:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234768AbhDPC6P (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 15 Apr 2021 22:58:15 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60308 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234548AbhDPC6P (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Thu, 15 Apr 2021 22:58:15 -0400
Received: from mail-pg1-x544.google.com (mail-pg1-x544.google.com [IPv6:2607:f8b0:4864:20::544])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 25237C061574;
        Thu, 15 Apr 2021 19:57:51 -0700 (PDT)
Received: by mail-pg1-x544.google.com with SMTP id p12so18255354pgj.10;
        Thu, 15 Apr 2021 19:57:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id;
        bh=wSLtLWNldL3bwnHVUbpbHPx0qmEqpwBVn9Q/YYOJZMM=;
        b=nzHjvcZoeaFfx2ht6hWPTSxnD7zz4+4tyDqDSLpnkA2/iWUakcCqL2ypHfWtJ6IsdO
         3oZIlUT4ImtKDklUYSHKdGil7yf1hcA3lzLu1BpIgt4s2ULb8tGsI7mB/Rav/7dL8wI5
         VWxO8J5Pu3XoBF9e85zOWX4cUgkzEyTy4GIBX16yz+yGoL+pSRZa6+lS62f0zJJJsxcl
         NkgVzKMXKEknoRhUwSFkGG4lhtZegY2V6q1XVS9fY+j/m7CDQMifURd5wXHZbjnZq2/P
         i7/yOZY5KDunHvJix+nU4hzABtfbnjCurDvpwvgSzXrI6v28PT/AOnQEbXfUSz6WIctf
         XQyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=wSLtLWNldL3bwnHVUbpbHPx0qmEqpwBVn9Q/YYOJZMM=;
        b=TZdN1n5afAq9k+iUF6dMLD+ePjS1pkZc+4iu9lgLIMIMSVQpQWuabPFYQ0KNS5Xjlm
         kM8PLb2gVi+t2LHvFl7htR9XIQjGaex26VVGWO99B7XUtcZS7OZblw4yuSo4Xo7neJfg
         1KdVnSQlVsq3ZVAN62W4XuNil33jhc2tuYXFrUWnRLGTrIBCUx2ozBqmvcoEow3KaVQk
         AtJf/ua65+/4ExxnSN7tC2qjlxpzrZdcIAfQ3H1kTbbrdCJ+4T7GxNGloY741LEmneWJ
         OqvvRFj4Jay+hTUMIX4f+M7K2vW0PrG0UanlfNFd7XEGRzFM9fdW4/7Z1G0IFoE29jTW
         fdkA==
X-Gm-Message-State: AOAM530DhmfonTWZlGpllrGYMsoLisd6pHdeqYt9LAqK0BFpPrsK3fcp
        saX1R2KiliCvghkGAnTJwow=
X-Google-Smtp-Source: ABdhPJxLm1q4S1c5CEqoGxOxhPGmq3m1vfEfEsJw27vRwto8JVbAnHl/cj/ypy6EWywPJ2xXqeB5Jw==
X-Received: by 2002:a63:1a47:: with SMTP id a7mr6162986pgm.437.1618541870762;
        Thu, 15 Apr 2021 19:57:50 -0700 (PDT)
Received: from mi-OptiPlex-7060.mioffice.cn ([209.9.72.212])
        by smtp.gmail.com with ESMTPSA id o9sm2956484pfu.112.2021.04.15.19.57.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Apr 2021 19:57:24 -0700 (PDT)
From:   zhuguangqing83@gmail.com
To:     Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Krzysztof Kozlowski <krzk@kernel.org>
Cc:     linux-input@vger.kernel.org, linux-kernel@vger.kernel.org,
        Guangqing Zhu <zhuguangqing83@gmail.com>
Subject: [PATCH] Input: twl4030_keypad - Fix missing IRQF_ONESHOT as only threaded handler
Date:   Fri, 16 Apr 2021 10:57:06 +0800
Message-Id: <20210416025706.11214-1-zhuguangqing83@gmail.com>
X-Mailer: git-send-email 2.17.1
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

From: Guangqing Zhu <zhuguangqing83@gmail.com>

Coccinelle noticed:
drivers/input/keyboard/twl4030_keypad.c:413:9-34: ERROR: Threaded IRQ with
no primary handler requested without IRQF_ONESHOT

Signed-off-by: Guangqing Zhu <zhuguangqing83@gmail.com>
---
 drivers/input/keyboard/twl4030_keypad.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/input/keyboard/twl4030_keypad.c b/drivers/input/keyboard/twl4030_keypad.c
index 77e0743a3cf8..05057ebb1ab2 100644
--- a/drivers/input/keyboard/twl4030_keypad.c
+++ b/drivers/input/keyboard/twl4030_keypad.c
@@ -411,7 +411,7 @@ static int twl4030_kp_probe(struct platform_device *pdev)
 	 * NOTE:  we assume this host is wired to TWL4040 INT1, not INT2 ...
 	 */
 	error = devm_request_threaded_irq(&pdev->dev, kp->irq, NULL, do_kp_irq,
-					  0, pdev->name, kp);
+					  IRQF_ONESHOT, pdev->name, kp);
 	if (error) {
 		dev_info(kp->dbg_dev, "request_irq failed for irq no=%d: %d\n",
 			kp->irq, error);
-- 
2.17.1

