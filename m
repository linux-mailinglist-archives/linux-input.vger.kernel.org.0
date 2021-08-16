Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 771EC3EE072
	for <lists+linux-input@lfdr.de>; Tue, 17 Aug 2021 01:29:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234599AbhHPX3n (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 16 Aug 2021 19:29:43 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48874 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232618AbhHPX3n (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Mon, 16 Aug 2021 19:29:43 -0400
Received: from mail-lf1-x129.google.com (mail-lf1-x129.google.com [IPv6:2a00:1450:4864:20::129])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DEE8AC061764
        for <linux-input@vger.kernel.org>; Mon, 16 Aug 2021 16:29:10 -0700 (PDT)
Received: by mail-lf1-x129.google.com with SMTP id d4so37643885lfk.9
        for <linux-input@vger.kernel.org>; Mon, 16 Aug 2021 16:29:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=zgTkZngvNSKjUeOVIVFtb0tqi+sz5AqT1e8MB1FTV7A=;
        b=eGLke5SqoC5HuZHxXeTimRbJWO7LV/R0qjS55roXPYI/UYPn9SqXpi11dl+c4FT1V6
         M4Odyz8O/jy3PuZ8q9kkFyn1H0dTFJHsHWbR10FZ3+uhDL9N9NkfB1GC1HrQqCYxV8cM
         YNWFl7hx+oGA00J96ZkxPMi9Mc2rXvAiRMJb9R7hu4i9pOhKvX91GlcrNz46YyAyhtnC
         k+vRPKWbidNkS+Ob7yorroyScWr0PJlvI6KpTEKAgGA3CjjiBK1eBHuSkjmzcA+H8Q+B
         tKlY9nKKCgpWyD3ZBdsNtXaVYamabJ5bs0314wF+GwYJfTm9TrAIJD6vvCZ8r7TdPb2t
         gUVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=zgTkZngvNSKjUeOVIVFtb0tqi+sz5AqT1e8MB1FTV7A=;
        b=NMM68V4n4lNLg16f6OZZFr80AQsvJsXe54fhN/qGSXgYU239QVkER8SmBmhPVX92nt
         m90kzyTFEQKY0BUuFZ3T6lVvcXa5N6/LmaryTRM8gfMzP+GT5ziUhrAUcFamtkVPO3p9
         TiEcXtvbs+e/u5kp4ZOgz+87RAfrsvU25Y2a3I9kJ67AYHIEXz9FD202aIOTOukTf0Di
         rg6RrLttLMiOfD5ByvVXHhILpp2N3nBBStMqSgPW9Ltq61vLFYsa5Im8T29R35SmiEb7
         VfRT4iXfCH1RaZ4h1T0rFuULS/OTqlJJiHFgcYntEYufK7KyLiqR0GKuC+UAWtQUyNaR
         Liaw==
X-Gm-Message-State: AOAM5319a27kCfVykV59qhT3lA/2cKjswFZLoLxPuH/pdVwBmDpAJblf
        GLb5kXvc3OyPxdT21Rrstk7N1A==
X-Google-Smtp-Source: ABdhPJxC2gnBlmOef275KglQEmKv9zlwdT1UlATC7J1D8n7sjVsyRQxJFw/Iv8pQVEMFec5y7uMYJw==
X-Received: by 2002:a19:4853:: with SMTP id v80mr174978lfa.375.1629156549283;
        Mon, 16 Aug 2021 16:29:09 -0700 (PDT)
Received: from localhost.localdomain (c-fdcc225c.014-348-6c756e10.bbcust.telenor.se. [92.34.204.253])
        by smtp.gmail.com with ESMTPSA id n12sm41141ljc.74.2021.08.16.16.29.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Aug 2021 16:29:09 -0700 (PDT)
From:   Linus Walleij <linus.walleij@linaro.org>
To:     Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        linux-input@vger.kernel.org
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Michael Hennerich <michael.hennerich@analog.com>,
        Alexandru Ardelean <Alexandru.ardelean@analog.com>
Subject: [PATCH] Input: adp5589-keys - Use the right header
Date:   Tue, 17 Aug 2021 01:27:07 +0200
Message-Id: <20210816232707.485031-1-linus.walleij@linaro.org>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

This keyboard driver is implementing a GPIO driver, so it need
to include <linux/gpio/driver.h> and not the legacy <linux/gpio.h>
header.

Cc: Michael Hennerich <michael.hennerich@analog.com>
Cc: Alexandru Ardelean <Alexandru.ardelean@analog.com>
Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
 drivers/input/keyboard/adp5589-keys.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/input/keyboard/adp5589-keys.c b/drivers/input/keyboard/adp5589-keys.c
index 654e0476406b..bdd264459a97 100644
--- a/drivers/input/keyboard/adp5589-keys.c
+++ b/drivers/input/keyboard/adp5589-keys.c
@@ -18,7 +18,7 @@
 #include <linux/platform_device.h>
 #include <linux/input.h>
 #include <linux/i2c.h>
-#include <linux/gpio.h>
+#include <linux/gpio/driver.h>
 #include <linux/slab.h>
 
 #include <linux/input/adp5589.h>
-- 
2.31.1

