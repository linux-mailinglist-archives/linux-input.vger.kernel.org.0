Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 42AE250812E
	for <lists+linux-input@lfdr.de>; Wed, 20 Apr 2022 08:27:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1349298AbiDTGaT (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 20 Apr 2022 02:30:19 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55098 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1346486AbiDTGaQ (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Wed, 20 Apr 2022 02:30:16 -0400
Received: from mail-lj1-x233.google.com (mail-lj1-x233.google.com [IPv6:2a00:1450:4864:20::233])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EB05839B9A
        for <linux-input@vger.kernel.org>; Tue, 19 Apr 2022 23:27:30 -0700 (PDT)
Received: by mail-lj1-x233.google.com with SMTP id f5so719685ljp.8
        for <linux-input@vger.kernel.org>; Tue, 19 Apr 2022 23:27:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=M9+7e030qIA7KV/EaPMAI0KhomRiXStsyJ6Ix9CM/0k=;
        b=dGM/YySdLkBh75SQVH5NfkTBWfN3sLgRESx41uwPv5A3S/YpJJXDx6sS61MpqOLXCX
         BvpQTw1U9QFlwmGCyKtB5JQDR5ZJDQwCN9IcMm8UHcEJOUZuu28rf5f4dsI2GEAth4Y1
         1cDvDsBsGEAvuQwzGXc4jpwaiiOJkXhjl+yEWp5l5nuBaTPbJFS7KJRAQdCwri+4VVjR
         M6iMbGpu9zXANVVPksAAbz1z0FQI+G/9R12WAwVwPbo8+eHQhCwuEOxS70eeAQFWCfAG
         Rol+tWuHc82/0l5VHr+A9AUj3/NtbAHQH9sVpzAKDmYeGbPUqSpEZyy4ZFEV1WgXoOl0
         GmXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=M9+7e030qIA7KV/EaPMAI0KhomRiXStsyJ6Ix9CM/0k=;
        b=Y0ry8iGfqcmTwZIimrkWJW41kG6qDqEVZehD+HwOpa7hhIEC+uptY0E7OUBMCCYVT9
         JEYYfgUJjtkOe1TasNzVP3OktUw1fLb9a/QcLozE+mzBNnkTWFt9y8J7C+EO6k8JEa7I
         c/08xOWWzN76OLf1aBFb6NUoxi4UPq+obc0IYhUC7Q48PeyAXys79TwERzM2biV8IFnS
         OX7oN+8Fijwsjz6I8g2V4k6GebWvmCJg3vbA6muBWcVn1sj/B/Twmt3TqUAhTYynlHuN
         uqMjEVn2EIIUinUcyCLh4w1UPfCSi8CbtJRmV6ApTyklbztS4TseOgn9yv3ugkuFuZV2
         n+hQ==
X-Gm-Message-State: AOAM530zsqMe+Iu1lsCx1V+QedvT6bi1/Ejb7VoA616OzqTuhmynbORt
        fcTXkDNtab9t2WkuEnOQ5eURjWN3en8uXC5r
X-Google-Smtp-Source: ABdhPJz1kpQzoOeQi/bE8+0Nk+5aTHx1Q3n1zy7FKI1V7zQPR24o3U6is+k4uN5iAG+PD8LqEf2QlQ==
X-Received: by 2002:a2e:7e04:0:b0:24d:abc8:5b16 with SMTP id z4-20020a2e7e04000000b0024dabc85b16mr12165018ljc.390.1650436048552;
        Tue, 19 Apr 2022 23:27:28 -0700 (PDT)
Received: from shc.milas.spb.ru ([188.243.217.78])
        by smtp.gmail.com with ESMTPSA id e3-20020a196903000000b00471930966cdsm820952lfc.233.2022.04.19.23.27.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 Apr 2022 23:27:28 -0700 (PDT)
From:   Alexander Shiyan <eagle.alexander923@gmail.com>
To:     linux-input@vger.kernel.org
Cc:     Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Alexander Shiyan <eagle.alexander923@gmail.com>
Subject: [PATCH] input: clps711x-keypad: Use syscon_regmap_lookup_by_phandle
Date:   Wed, 20 Apr 2022 09:27:25 +0300
Message-Id: <20220420062725.25614-1-eagle.alexander923@gmail.com>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,
        FREEMAIL_FROM,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Since version 5.13, the standard syscon bindings have been added
to all clps711x DT nodes, so we can now use the more general
syscon_regmap_lookup_by_phandle function to get the syscon pointer.

Signed-off-by: Alexander Shiyan <eagle.alexander923@gmail.com>
---
 drivers/input/keyboard/clps711x-keypad.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/input/keyboard/clps711x-keypad.c b/drivers/input/keyboard/clps711x-keypad.c
index 019dd6ed2c29..939c88655fc0 100644
--- a/drivers/input/keyboard/clps711x-keypad.c
+++ b/drivers/input/keyboard/clps711x-keypad.c
@@ -95,8 +95,7 @@ static int clps711x_keypad_probe(struct platform_device *pdev)
 	if (!priv)
 		return -ENOMEM;
 
-	priv->syscon =
-		syscon_regmap_lookup_by_compatible("cirrus,ep7209-syscon1");
+	priv->syscon = syscon_regmap_lookup_by_phandle(np, "syscon");
 	if (IS_ERR(priv->syscon))
 		return PTR_ERR(priv->syscon);
 
-- 
2.32.0

