Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 037852B8C3F
	for <lists+linux-input@lfdr.de>; Thu, 19 Nov 2020 08:26:56 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725857AbgKSHYW (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 19 Nov 2020 02:24:22 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54668 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725648AbgKSHYW (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Thu, 19 Nov 2020 02:24:22 -0500
Received: from mail-pg1-x542.google.com (mail-pg1-x542.google.com [IPv6:2607:f8b0:4864:20::542])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E7D84C0613CF;
        Wed, 18 Nov 2020 23:24:21 -0800 (PST)
Received: by mail-pg1-x542.google.com with SMTP id 62so3413261pgg.12;
        Wed, 18 Nov 2020 23:24:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:mime-version:content-disposition;
        bh=hEJLsZT8Aqe5PMU2l/Eicvoj6XPSoqGky9zOzFnUW7A=;
        b=G47tsyv7jBofpIvJByu7Dfv0IqhO6MuEJwzvBkCr8D1pXpa597Vc39qgRtX4LyN/gb
         K8n52j0tjN5iPMU55rwQnm5tx/vnA3EwLObvjcuHMJkAs4lIQ7YDkBYS1dFaS6Ln/vuW
         39v/OI035wQ89m1Wpbsi4Ud7bgv1kDBmUITl6H4AXVITSJzBVMYtlzySjp3KqOOAXJJZ
         tOnCg7+WC9LY6m4YM/7OYoB1LwMD7FMOAkb+016vdKtzsxu9diN281kMviROPohCkuBu
         65pE3Mnr3SV6k9Nbc9cLXF98AoV3Lqp1BeLP8eRADW1xoj2BnRoy4qcKVv1bvKWfxyx2
         wsWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:mime-version
         :content-disposition;
        bh=hEJLsZT8Aqe5PMU2l/Eicvoj6XPSoqGky9zOzFnUW7A=;
        b=JALfopfBMMuqFG0Hfqkrbaph6azlOLcrQ6uK8Dfv58wI3oYAri+l8hzEm6wwoVahzM
         9uOUdluiTYpVaH6uXHPz3xTn6uLmfxebBWVrM6462dgjmCQxdtmuN1iddipW/DF59/dQ
         MDCVE93l0fTAebR/EEInupUhKd8AVUvNSF2us0Q5PfvGRJCL/rOKgpdTCAJZtC5fgJYn
         ntT/5c1oY7uGMmyLhNsyAXxNdnuAftKvG+JSgL06welAPFayxiJgDCAB4iDXKiMdw3Bd
         +wg4/Um5tmTBFnVxemTJ+DVqZc49XVYYgcoe6QdMwQd2ak/uw8WWiPsFXw5MvUjMmcpK
         0TnQ==
X-Gm-Message-State: AOAM532twdX+SjSSvGDfTCrCw9nwu63iN7GWZNfAcXxDpmZE194OJy9O
        l1+fBhbl6f3X9qChD1rOQKR5KJhacp8=
X-Google-Smtp-Source: ABdhPJx7J8jedbQ9Sy9/bbXBYzN3FATAYxLZdYs00wB7tkonFFXC2oTKLa0biPdQVHQSZ7XMl0RrUA==
X-Received: by 2002:a63:c945:: with SMTP id y5mr11829559pgg.118.1605770661070;
        Wed, 18 Nov 2020 23:24:21 -0800 (PST)
Received: from dtor-ws ([2620:15c:202:201:a6ae:11ff:fe11:fcc3])
        by smtp.gmail.com with ESMTPSA id x3sm2312182pjk.17.2020.11.18.23.24.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Nov 2020 23:24:20 -0800 (PST)
Date:   Wed, 18 Nov 2020 23:24:18 -0800
From:   Dmitry Torokhov <dmitry.torokhov@gmail.com>
To:     linux-input@vger.kernel.org
Cc:     Alexandru Ardelean <alexandru.ardelean@analog.com>,
        linux-kernel@vger.kernel.org
Subject: [PATCH] Input: adp5589-keys - mark suspend and resume methods as
 __maybe_unused
Message-ID: <20201119072418.GA114677@dtor-ws>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

This improves compile coverage of the code; unused code will be dropped by
the linker.

Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
---
 drivers/input/keyboard/adp5589-keys.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/input/keyboard/adp5589-keys.c b/drivers/input/keyboard/adp5589-keys.c
index 31145a85c819..a9b69a268c09 100644
--- a/drivers/input/keyboard/adp5589-keys.c
+++ b/drivers/input/keyboard/adp5589-keys.c
@@ -1016,8 +1016,7 @@ static int adp5589_probe(struct i2c_client *client,
 	return 0;
 }
 
-#ifdef CONFIG_PM_SLEEP
-static int adp5589_suspend(struct device *dev)
+static int __maybe_unused adp5589_suspend(struct device *dev)
 {
 	struct adp5589_kpad *kpad = dev_get_drvdata(dev);
 	struct i2c_client *client = kpad->client;
@@ -1033,7 +1032,7 @@ static int adp5589_suspend(struct device *dev)
 	return 0;
 }
 
-static int adp5589_resume(struct device *dev)
+static int __maybe_unused adp5589_resume(struct device *dev)
 {
 	struct adp5589_kpad *kpad = dev_get_drvdata(dev);
 	struct i2c_client *client = kpad->client;
@@ -1048,7 +1047,6 @@ static int adp5589_resume(struct device *dev)
 
 	return 0;
 }
-#endif
 
 static SIMPLE_DEV_PM_OPS(adp5589_dev_pm_ops, adp5589_suspend, adp5589_resume);
 
-- 
2.29.2.299.gdc1121823c-goog


-- 
Dmitry
