Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5A09A2A6985
	for <lists+linux-input@lfdr.de>; Wed,  4 Nov 2020 17:26:04 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731089AbgKDQZo (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 4 Nov 2020 11:25:44 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35766 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730987AbgKDQZE (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Wed, 4 Nov 2020 11:25:04 -0500
Received: from mail-wm1-x344.google.com (mail-wm1-x344.google.com [IPv6:2a00:1450:4864:20::344])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0F556C061A4D
        for <linux-input@vger.kernel.org>; Wed,  4 Nov 2020 08:25:04 -0800 (PST)
Received: by mail-wm1-x344.google.com with SMTP id e2so2901848wme.1
        for <linux-input@vger.kernel.org>; Wed, 04 Nov 2020 08:25:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=gEEnx9N3Q6ff4TorTnZ32g1gwXsaI47EH/IMR+WZidg=;
        b=r3DtYquA9eQDmSD8EW1+bhREgzlV6LvrBBEaMbs2ZbGnZsxd0B7Ny0INQFWdj3D7Na
         +4/kMzSys6PKK6/3Q+brrOCiFFXgVcRSS0g9J2h0BRu2LesSSz1RTSA6+EwH+1kOdqOL
         NGVUxj8cRbOkhi5UKo572NgzFqy3prqW+s9PkrrTH+dcoZ/YvXouI43w3qeH7oyL2qPy
         yP22JD5q8Qa07DTRK/ia+yqxjglgJ/SbUkZqBEszmFT99IykGP8hrbG7yRBlqGoxQKNf
         MWz0D5Y3JJhf0fKqQvLr/bEdd3+B8Vx/B0sVnb0oBhHFDwDhBpdsdsIPV5Gv03+lAu19
         J8bQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=gEEnx9N3Q6ff4TorTnZ32g1gwXsaI47EH/IMR+WZidg=;
        b=eKRbEvadLFvvZa7oKytk+Ph84rPBIhKzFKySVQReuitUD/QOFbyTlFiffNDEYQdSAs
         mV8bX/r9PH8oSHxFfG0HdqxgF/wCC1YbdHmjo91pzlTJga9shtkN+xbhV/YNAM+OF37h
         tzH47ycK7ulRqfwJy0OBI5PGTwOdQUuA4bkiG+rVHBee9mqOmrUxLLMnK8Oi8MW4+enC
         r2PQbOJ3ksMFPne/4CQ6RO3zs1FshKdAoXhl5j6/HBgEss/CFt6mXlzXaofjP1pZw6+w
         Ztd8SG9YgYUQrvQ3Ta2E4Qvk015zD8x74J17sx8yIr6SB5Ba43Sz4UAOwj9+LehM+BTG
         42Ww==
X-Gm-Message-State: AOAM532Tn6VHpX9gNbYqih8bo05v9cs3wjElE9cVZ/rJWWEvCso/yH7+
        0ATikHiuXoixCewqOGwHTtnnQA==
X-Google-Smtp-Source: ABdhPJxGqzrZnMIGaRg5z6soxSJjVletd47ti4DjCQzkqa4Lt8eafXod2NPLJ+2rqaagHZWPvAoFRw==
X-Received: by 2002:a1c:2d5:: with SMTP id 204mr5624113wmc.181.1604507102814;
        Wed, 04 Nov 2020 08:25:02 -0800 (PST)
Received: from dell.default ([91.110.221.242])
        by smtp.gmail.com with ESMTPSA id o129sm3008564wmb.25.2020.11.04.08.25.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Nov 2020 08:25:02 -0800 (PST)
From:   Lee Jones <lee.jones@linaro.org>
To:     lee.jones@linaro.org
Cc:     linux-kernel@vger.kernel.org,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Dan Murphy <dmurphy@ti.com>, linux-input@vger.kernel.org
Subject: [PATCH 17/20] input: misc: drv2665: Fix formatting expected by kernel-doc
Date:   Wed,  4 Nov 2020 16:24:24 +0000
Message-Id: <20201104162427.2984742-18-lee.jones@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20201104162427.2984742-1-lee.jones@linaro.org>
References: <20201104162427.2984742-1-lee.jones@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Fixes the following W=1 kernel build warning(s):

 drivers/input/misc/drv2665.c:59: warning: Function parameter or member 'input_dev' not described in 'drv2665_data'
 drivers/input/misc/drv2665.c:59: warning: Function parameter or member 'client' not described in 'drv2665_data'
 drivers/input/misc/drv2665.c:59: warning: Function parameter or member 'regmap' not described in 'drv2665_data'
 drivers/input/misc/drv2665.c:59: warning: Function parameter or member 'work' not described in 'drv2665_data'
 drivers/input/misc/drv2665.c:59: warning: Function parameter or member 'regulator' not described in 'drv2665_data'

Cc: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: Dan Murphy <dmurphy@ti.com>
Cc: linux-input@vger.kernel.org
Signed-off-by: Lee Jones <lee.jones@linaro.org>
---
 drivers/input/misc/drv2665.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/input/misc/drv2665.c b/drivers/input/misc/drv2665.c
index 918ad9c3fa812..0e65ab180f499 100644
--- a/drivers/input/misc/drv2665.c
+++ b/drivers/input/misc/drv2665.c
@@ -44,11 +44,11 @@
 
 /**
  * struct drv2665_data -
- * @input_dev - Pointer to the input device
- * @client - Pointer to the I2C client
- * @regmap - Register map of the device
- * @work - Work item used to off load the enable/disable of the vibration
- * @regulator - Pointer to the regulator for the IC
+ * @input_dev: Pointer to the input device
+ * @client: Pointer to the I2C client
+ * @regmap: Register map of the device
+ * @work: Work item used to off load the enable/disable of the vibration
+ * @regulator: Pointer to the regulator for the IC
  */
 struct drv2665_data {
 	struct input_dev *input_dev;
-- 
2.25.1

