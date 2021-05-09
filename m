Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 097CB377952
	for <lists+linux-input@lfdr.de>; Mon, 10 May 2021 01:38:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229853AbhEIXjl (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Sun, 9 May 2021 19:39:41 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36104 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230019AbhEIXjj (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Sun, 9 May 2021 19:39:39 -0400
Received: from mail-lf1-x134.google.com (mail-lf1-x134.google.com [IPv6:2a00:1450:4864:20::134])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 49D6FC061573
        for <linux-input@vger.kernel.org>; Sun,  9 May 2021 16:38:35 -0700 (PDT)
Received: by mail-lf1-x134.google.com with SMTP id 7so200157lfp.9
        for <linux-input@vger.kernel.org>; Sun, 09 May 2021 16:38:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=DsYVHmDLDBWBajPAxy8Ub0s7nvbeZln5fO+9XAQ5QhM=;
        b=K2fTeSrsThRwtJP5dNwpo5cJBo1DxUt59lkTjtPOK+8IA2EYjcRkk+aBas7GFsTf2i
         n6ovksRcHpedyqkHf4FBKQk6Gu1PHolb2qWYZzjoXJhEtEdqMaufqpmY97hRzyhx13wp
         gcvY1ufTQ8APMDH8lre4JvlxQ5oMrkKNY+BtxRj/FJKzJnk3A+I0D/ZmHWuMTNIbWdv5
         Ttb52f1UNsRlg9F0Fcyj5Af4/Z1h9zGG28RCvAn5GlhMGDiVsw3Soa9td01jqlZoSJhm
         G5JGOWsDFL2+XRVdZH26fWANjn51LxFoGP0vNCeFNwBvgxvBuowzIFmfyERdCAZPNGyn
         UYbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=DsYVHmDLDBWBajPAxy8Ub0s7nvbeZln5fO+9XAQ5QhM=;
        b=DtaBkvgNQxIObPXyeeHdsRGUL7vtRbCUsPI8E6TxcRv0A8k4HvSVdqZ7PTc0gSg3zy
         ZrGFiLSe6xJYyjbj1P0qaU1FCSi4zX2jexivHKt7k5IgYo0b4NeEVc86AYHPOIPUuiQm
         XTex+hqQkr9IGiIJviizb/+NlS6P9/SexA/cZh7cjsA6idcdP/SR86Z+ssenh4sRNkLs
         QcWQIk9cedhWOVSQnd7EZ7jL2Bvmnz01CVdDu8xKrR3+AdoNpp++n6n9aAZK0e05Y/IQ
         TVNLTHrvZiqFxtUVVOY5gwnhkRyfBynSb2I1ST/yFRlalsd8iarz2BaqGf2OrdBCD9Hs
         4Okw==
X-Gm-Message-State: AOAM530J8ZcRoMxud8mj6zqxb3sSO+mr4JlfWJqfMdcuh5MSxKb3u6MA
        QKWl0HsFDqeYHa6jjTWvY25BktPvZW8QKg==
X-Google-Smtp-Source: ABdhPJz/QXJ60JfLAHEUMFXY2IOd1KOnossL2tw3zSyRDIJd2q2s1zm49Enct+H90MQ1/S1KcsJ4hg==
X-Received: by 2002:a05:6512:3481:: with SMTP id v1mr901374lfr.376.1620603513849;
        Sun, 09 May 2021 16:38:33 -0700 (PDT)
Received: from localhost.localdomain (c-fdcc225c.014-348-6c756e10.bbcust.telenor.se. [92.34.204.253])
        by smtp.gmail.com with ESMTPSA id m25sm2074826lfo.279.2021.05.09.16.38.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 09 May 2021 16:38:33 -0700 (PDT)
From:   Linus Walleij <linus.walleij@linaro.org>
To:     Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        linux-input@vger.kernel.org
Cc:     Linus Walleij <linus.walleij@linaro.org>
Subject: [PATCH] Input: tsc200x: Drop hard-coded IRQ edge
Date:   Mon, 10 May 2021 01:38:30 +0200
Message-Id: <20210509233830.359134-1-linus.walleij@linaro.org>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

This edge setting should come from the device tree not
the driver. Also, most device trees sets this to the
falling edge, which is contradictory to what is hardcoded.

Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
 drivers/input/touchscreen/tsc200x-core.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/input/touchscreen/tsc200x-core.c b/drivers/input/touchscreen/tsc200x-core.c
index ce2fe30d6b8a..5f0ce663a2dc 100644
--- a/drivers/input/touchscreen/tsc200x-core.c
+++ b/drivers/input/touchscreen/tsc200x-core.c
@@ -540,7 +540,7 @@ int tsc200x_probe(struct device *dev, int irq, const struct input_id *tsc_id,
 
 	error = devm_request_threaded_irq(dev, irq, NULL,
 					  tsc200x_irq_thread,
-					  IRQF_TRIGGER_RISING | IRQF_ONESHOT,
+					  IRQF_ONESHOT,
 					  "tsc200x", ts);
 	if (error) {
 		dev_err(dev, "Failed to request irq, err: %d\n", error);
-- 
2.30.2

