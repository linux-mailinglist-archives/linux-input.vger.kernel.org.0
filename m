Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5E0244DA631
	for <lists+linux-input@lfdr.de>; Wed, 16 Mar 2022 00:20:50 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1352560AbiCOXVx (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 15 Mar 2022 19:21:53 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38938 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1352557AbiCOXVu (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Tue, 15 Mar 2022 19:21:50 -0400
Received: from mail-lf1-x12f.google.com (mail-lf1-x12f.google.com [IPv6:2a00:1450:4864:20::12f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9BEF75D67E
        for <linux-input@vger.kernel.org>; Tue, 15 Mar 2022 16:20:35 -0700 (PDT)
Received: by mail-lf1-x12f.google.com with SMTP id w27so1026647lfa.5
        for <linux-input@vger.kernel.org>; Tue, 15 Mar 2022 16:20:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=7ZIpRMUfxfN2P2Jphf5BBz91uNjdePO2QpnTEW+cZn8=;
        b=RwYdQSAoWoDbz2/CBqBb0cLYGu2znL37ANrs+xa/8YtihaiKlXyMXXNaLjN+1ad0OU
         yJ7izY3QFEpnhPQb/z5VajZ7f1W4aaM4adadWeFZSH+gcWsOpxCBUraWt9FQrlzGEKXA
         H4I6YbDJw55I9M6qULhclBOa1JP+M4r3mqus3G4gqdFUG9Y1epc9vr8gGXM764mkSdlo
         CdNogW2u7ab/aqSPiExdw2fp9MC8y8nP+yHaKGLlyA+1FtnmPU/pe3HPbW1umhgEZh7e
         GGv5aJYozsLy1xAZW5iQlwwPWUgNn3TiY8Z+TcRcIh0IxS52xb3PhYRiVLhX1bmVt6lb
         4AbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=7ZIpRMUfxfN2P2Jphf5BBz91uNjdePO2QpnTEW+cZn8=;
        b=4eih41Peuiic2UERW+RNmwJtJcfrSzif2LHp+Rxl8Oud31ym6OhrAt2SkGINgPWBL9
         btw2w+7zHjtw6CKIJD5uRx4E2jD88ye4zHkVxyaviUYoIVXJiescYsjjg+U1fyBS4+rl
         VID0X2oUaYKjk9QkLaje5AchbENIvHa/VOzYJ0lm5DtuJyawYXNBLeYBzCWVRnIg9f7s
         l0/beElzO5AQsfWv6dkFj686B9jihEzb4F4jz/8xtKNoYS5EtF1up1xDLYkaBJLms96H
         W4qVoxJ2vTPGZAgBIPt8WFu3PwYDBE4uaw9bbEDPtrbeLtOq47m+qs3kYazByndQAT7a
         GecA==
X-Gm-Message-State: AOAM531GAnDv1xHlbU9aTwcaiLX0bmMbfK2JGB0xx9yWWbV18GNLLwbZ
        QSQ7UaGlu8Uk8lgLeFGBEHxalA==
X-Google-Smtp-Source: ABdhPJz6yq5lnR6rhcusCM5Ar5iY4uBgyBwI4ixAeeTy/WaL+V6nXxzQ9Us3o2ZSeVokb5N5RwRV0w==
X-Received: by 2002:ac2:532a:0:b0:448:7483:1640 with SMTP id f10-20020ac2532a000000b0044874831640mr13289428lfh.70.1647386433898;
        Tue, 15 Mar 2022 16:20:33 -0700 (PDT)
Received: from localhost.localdomain (c-fdcc225c.014-348-6c756e10.bbcust.telenor.se. [92.34.204.253])
        by smtp.gmail.com with ESMTPSA id a26-20020a195f5a000000b004486aec65b7sm26707lfj.209.2022.03.15.16.20.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Mar 2022 16:20:33 -0700 (PDT)
From:   Linus Walleij <linus.walleij@linaro.org>
To:     Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        linux-input@vger.kernel.org
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        phone-devel@vger.kernel.org, devicetree@vger.kernel.org
Subject: [PATCH 1/3] dt-bindings: Add Immersion Corporation prefix
Date:   Wed, 16 Mar 2022 00:18:27 +0100
Message-Id: <20220315231829.1204009-1-linus.walleij@linaro.org>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Immersion Corporation makes haptic feedback circuits such as
the ISA1200.

Cc: phone-devel@vger.kernel.org
Cc: devicetree@vger.kernel.org
Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
 Documentation/devicetree/bindings/vendor-prefixes.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/vendor-prefixes.yaml b/Documentation/devicetree/bindings/vendor-prefixes.yaml
index 294093d45a23..182771cc913d 100644
--- a/Documentation/devicetree/bindings/vendor-prefixes.yaml
+++ b/Documentation/devicetree/bindings/vendor-prefixes.yaml
@@ -549,6 +549,8 @@ patternProperties:
     description: Imagination Technologies Ltd.
   "^imi,.*":
     description: Integrated Micro-Electronics Inc.
+  "^immersion,.*":
+    description: Immersion Corporation
   "^incircuit,.*":
     description: In-Circuit GmbH
   "^inet-tek,.*":
-- 
2.35.1

