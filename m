Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1B8153F3676
	for <lists+linux-input@lfdr.de>; Sat, 21 Aug 2021 00:32:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231378AbhHTWcn (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Fri, 20 Aug 2021 18:32:43 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33592 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231274AbhHTWcl (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Fri, 20 Aug 2021 18:32:41 -0400
Received: from mail-lj1-x234.google.com (mail-lj1-x234.google.com [IPv6:2a00:1450:4864:20::234])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 96393C061575
        for <linux-input@vger.kernel.org>; Fri, 20 Aug 2021 15:32:02 -0700 (PDT)
Received: by mail-lj1-x234.google.com with SMTP id y7so19593972ljp.3
        for <linux-input@vger.kernel.org>; Fri, 20 Aug 2021 15:32:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=LgYBVMN6GzUKjZP5GJGYn+7OStuZGF4uVrfkyLmZ5Nc=;
        b=ANtFvTYsVGExgVvvhJphfE3cAs3abU9NK10b28judfgRg13Rih+gi6AUCxZ/aoyjwD
         92OjX4J7TjZWL9jWB+XFnGRjFx96C2WP9Eyb1KzG28uVx5ghPbepsSmpU8TlACGs7nBs
         uecSczVhjdkV4UyzAnv0DbMkvoJC9omT9rTbptnGVWUIs7sTEkKfP02Qn46yWNXKNoYx
         Vvzx/6OjoORIFllGY27te/5+LDaJEcXUyghdbtttkwGu5HFZrmV3S21zBT1aItntMSLW
         iJv/leUk9EdGBl5csNB9PGTSUzuKvWee0DMWOtaXiAVQQAkMiF/RUjDopBL9h0Lwq5by
         GV+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=LgYBVMN6GzUKjZP5GJGYn+7OStuZGF4uVrfkyLmZ5Nc=;
        b=atxJI5oeP2tViBwEfC2Kg31Y0XqjH5w1ARvt2BcTF62kvpGrMfG0atEl61SLN4+qxI
         nnYl/pEtyaXFn0SDjHmjpnwi0Yu/+yci/NNXF0ogXCaRKjEN4C/0B0X8fTwZqd5ZT3Hy
         9hcqZK6keBJN3A2GBL07BzmrJwAdzcHZRSnS8rLBr2bRMy4MLnn6vqNkx1Bj5A3+uh7g
         A4Czr5wb+suq2p8xzg5PywGa9AM6kNJUjTyJSwrL+xbHLoxTmSkTQzw+kymiVWUBlrLU
         m3g0YPsSodjqeUyHH4OReFQlhj266efl4h5ezX31D0k+Wvo6QCOPP1UT9IhJ4cBU+cew
         ohFA==
X-Gm-Message-State: AOAM530JDqd9fN+QCN22+MxLSBKv/pC4cH7YMzBryKr2hOXnqrP5qqCt
        wm1bdXY6sqtiYWX5rPUejUWUKw==
X-Google-Smtp-Source: ABdhPJw3q8IiFVYgkWANZSqI8kbrv3FILm10Yf151IpElUbb2+8Kpboy5WbF230oq9AUBC7UR9zwIw==
X-Received: by 2002:a2e:9c17:: with SMTP id s23mr17764321lji.197.1629498720910;
        Fri, 20 Aug 2021 15:32:00 -0700 (PDT)
Received: from localhost.localdomain (c-fdcc225c.014-348-6c756e10.bbcust.telenor.se. [92.34.204.253])
        by smtp.gmail.com with ESMTPSA id o3sm744552lfo.301.2021.08.20.15.32.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Aug 2021 15:32:00 -0700 (PDT)
From:   Linus Walleij <linus.walleij@linaro.org>
To:     Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        linux-input@vger.kernel.org
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Jean-Francois Dagenais <jeff.dagenais@gmail.com>,
        Michael Hennerich <michael.hennerich@analog.com>
Subject: [PATCH] Input: adp5588-keys - Use the right header
Date:   Sat, 21 Aug 2021 00:29:58 +0200
Message-Id: <20210820222958.57238-1-linus.walleij@linaro.org>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

This keyboard driver is implementing a GPIO driver, so it need
to include <linux/gpio/driver.h> and not the legacy <linux/gpio.h>
header.

Cc: Jean-Francois Dagenais <jeff.dagenais@gmail.com>
Cc: Michael Hennerich <michael.hennerich@analog.com>
Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
 drivers/input/keyboard/adp5588-keys.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/input/keyboard/adp5588-keys.c b/drivers/input/keyboard/adp5588-keys.c
index 90a59b973d00..1592da4de336 100644
--- a/drivers/input/keyboard/adp5588-keys.c
+++ b/drivers/input/keyboard/adp5588-keys.c
@@ -17,7 +17,7 @@
 #include <linux/platform_device.h>
 #include <linux/input.h>
 #include <linux/i2c.h>
-#include <linux/gpio.h>
+#include <linux/gpio/driver.h>
 #include <linux/slab.h>
 
 #include <linux/platform_data/adp5588.h>
-- 
2.31.1

