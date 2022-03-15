Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 257564DA64F
	for <lists+linux-input@lfdr.de>; Wed, 16 Mar 2022 00:37:38 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242751AbiCOXis (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 15 Mar 2022 19:38:48 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41098 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238451AbiCOXir (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Tue, 15 Mar 2022 19:38:47 -0400
Received: from mail-lf1-x12a.google.com (mail-lf1-x12a.google.com [IPv6:2a00:1450:4864:20::12a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A000A5620B
        for <linux-input@vger.kernel.org>; Tue, 15 Mar 2022 16:37:34 -0700 (PDT)
Received: by mail-lf1-x12a.google.com with SMTP id bt26so1089464lfb.3
        for <linux-input@vger.kernel.org>; Tue, 15 Mar 2022 16:37:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=7ZIpRMUfxfN2P2Jphf5BBz91uNjdePO2QpnTEW+cZn8=;
        b=h7K4ipBrkcUPp40+kb4TMB4L0kfO1QGxpsLYlNBl9xg8kpitCZzCJpJwOuIMtcgWmR
         bBGwFVVpeqNHkhp1UODqUeTaZSmLmhP5jfwv0SJSgBhexgn3wUvIoropaw0ozbp8pBpe
         oRBEzAZYN/nC/FVdCv1UHO9kcj9yfdO8J48uvyTX3MG7XHjLE+uDfvQJGVzxN/lclEgk
         FfIRSleeNqcShYjj1aPJk3CTjs2x0qYiDOoBT1w2yscSJ7dfh/KM0c6P+eIs5MZgCnfu
         PcCCcUbgqCTLAiuNjoDw7EV5EXginVIGMRRrrAX/nxwUmJDj3SYk7jpYp/bgM37yiGWF
         nwcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=7ZIpRMUfxfN2P2Jphf5BBz91uNjdePO2QpnTEW+cZn8=;
        b=Y8n0I0cALW6c+YxdwQ7aP+sKAviusQNzL5d/ZQKVVkByxcYx8pzu1y65RCNQCQhgye
         TpCf/1rg00OqZfR5cUzoxX99XVz3fpB47cte4vuVsEwXQm0V0tcReMwgn7iPh0F/yF+P
         aw35K+vT+TsKqjsKyt6xLkDazjwV0UEH6unIzhhCASRx0FHiyGyhcAiutxfVe5v8n7R8
         VQKAvdnSjPQ2Gi39PPSfR63sVUUlnLNGc2EUDbAyVB8TcWL2E1/iCO/0FffKlZhUhZdR
         teV05KtKwqFsOB284U3DNW2wsNMND0mbLdFsqhsf1IKy4dVg/SQzBq9oYveH3QxMy1Qk
         45YA==
X-Gm-Message-State: AOAM530vBTGWHbnkiw8dPabukAUKNrQ6GKe6obskxRN4MB8U+uLqkpv9
        juwLo/uAlj98XNecIj19N23alg==
X-Google-Smtp-Source: ABdhPJzGaBMUCoamCqlgIUEPBhuiznEKx2/oynitinUTRrLY2L/zfR2xcTl2BhntaGU0Vo11+77CcQ==
X-Received: by 2002:a05:6512:3ca6:b0:448:626f:b3a7 with SMTP id h38-20020a0565123ca600b00448626fb3a7mr15831589lfv.261.1647387453042;
        Tue, 15 Mar 2022 16:37:33 -0700 (PDT)
Received: from localhost.localdomain (c-fdcc225c.014-348-6c756e10.bbcust.telenor.se. [92.34.204.253])
        by smtp.gmail.com with ESMTPSA id w10-20020ac2442a000000b0044835a52a08sm29543lfl.163.2022.03.15.16.37.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Mar 2022 16:37:32 -0700 (PDT)
From:   Linus Walleij <linus.walleij@linaro.org>
To:     Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        linux-input@vger.kernel.org
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        phone-devel@vger.kernel.org, devicetree@vger.kernel.org
Subject: [PATCH 1/3] dt-bindings: Add Immersion Corporation prefix
Date:   Wed, 16 Mar 2022 00:35:26 +0100
Message-Id: <20220315233528.1204930-1-linus.walleij@linaro.org>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
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

