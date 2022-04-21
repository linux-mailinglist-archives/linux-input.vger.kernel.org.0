Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id AE29250A17C
	for <lists+linux-input@lfdr.de>; Thu, 21 Apr 2022 16:03:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1387990AbiDUOGS (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 21 Apr 2022 10:06:18 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40398 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1388007AbiDUOGQ (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Thu, 21 Apr 2022 10:06:16 -0400
Received: from mail-wr1-x42e.google.com (mail-wr1-x42e.google.com [IPv6:2a00:1450:4864:20::42e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7BC2F3A5C2
        for <linux-input@vger.kernel.org>; Thu, 21 Apr 2022 07:03:10 -0700 (PDT)
Received: by mail-wr1-x42e.google.com with SMTP id bv16so6815746wrb.9
        for <linux-input@vger.kernel.org>; Thu, 21 Apr 2022 07:03:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=wQKtX8WQCvG5ejnoi5Tx3qqomca9PHBF2mLes/stX7M=;
        b=AgEJXmMrcJiYHb/zC+7om2oCRjpYUw8xNsSKSQV9uECuRMPTThufzJ1NJY+df/hfKK
         XV9IBzJaoUikKzxvhHEXHe7kK+RqS6k4BEZ6Vyq3uQySxeXxYfJO9sgcVe5o2Xx6G4tt
         vFjNsdML7fETc24SqP/5MXFeTEpuRO5k+/4dC65zh312CKWKi2DgDWFQxeruHy4fmuOG
         jmhD9RwDHKfa4qmANxzECjdjQeC2h1IavNVWNTyDvuKztgwbmIfc9OMRPfFYV82O+9Ma
         wUyY6IxNyvlJtIxV1WW3gW9lseMJcOwoLKSuuBDd2FfImpLXdYUjm1o9Uw+kFrwC2ms4
         1m1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=wQKtX8WQCvG5ejnoi5Tx3qqomca9PHBF2mLes/stX7M=;
        b=tj6XdjvIKcU4WdPiPAMKr2k/6JP/MbBLMOlo2j3lSUjy5z6YzeOmZBlJxYRFfMpwlQ
         uFPY7aQjv8tFJY11AUQfiQ5q+/PT8Nh6orH3WSl1iYrToc8iEfkzVkPETLVWY3vDan2z
         xzs3JWWfiqY0CEOJ67oNryi3HhrkYHa0TokomnWYqt3Bo9CWO02dV5EZU4UeN7P4Cdjf
         fuLg5ByTfoKsZix4fStZYCAv8gLutLp/+GcX+ODPC+sB6OVX4h1k1BHgBFOm6huPCHyy
         WTipLS+2u/ZXq9yGnFJmvXfuOJ4kFydhb2U9Ydy7+DPqllJh43pdJj6AzILthrVqFZtg
         9jXg==
X-Gm-Message-State: AOAM532FgMy+hLiO9khRsVtCZd/H+Z4j216CyCVH6a8Re0Seu1qRDIsq
        NXE8FS4Zkd9fRXNUnBZbrMEH3tgoAlm1lA==
X-Google-Smtp-Source: ABdhPJwNBbP3ZT3FPSvScQRH2EbIoBe4I+WYo8GwVldT54PatPc9ePoTluWLxh6Mkgyejmraj+GshA==
X-Received: by 2002:a5d:53cb:0:b0:207:ab75:3ce7 with SMTP id a11-20020a5d53cb000000b00207ab753ce7mr20360816wrw.171.1650549788683;
        Thu, 21 Apr 2022 07:03:08 -0700 (PDT)
Received: from groot.home ([2a01:cb19:85e6:1900:e19f:c42c:d783:89c1])
        by smtp.gmail.com with ESMTPSA id g5-20020adfd1e5000000b0020a97e7ba9fsm2899192wrd.92.2022.04.21.07.03.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 21 Apr 2022 07:03:08 -0700 (PDT)
From:   Mattijs Korpershoek <mkorpershoek@baylibre.com>
To:     Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        Fengping Yu <fengping.yu@mediatek.com>
Cc:     Kevin Hilman <khilman@baylibre.com>, linux-input@vger.kernel.org,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org,
        Mattijs Korpershoek <mkorpershoek@baylibre.com>
Subject: [PATCH] dt-bindings: input: mediatek,mt6779-keypad: update maintainer
Date:   Thu, 21 Apr 2022 16:02:55 +0200
Message-Id: <20220421140255.2781505-1-mkorpershoek@baylibre.com>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Fengping has no longer interest and time to maintain this driver so he
agreed to transfer maintainership over to me.

Signed-off-by: Mattijs Korpershoek <mkorpershoek@baylibre.com>
---
 .../devicetree/bindings/input/mediatek,mt6779-keypad.yaml       | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/input/mediatek,mt6779-keypad.yaml b/Documentation/devicetree/bindings/input/mediatek,mt6779-keypad.yaml
index b1770640f94b..03ebd2665d07 100644
--- a/Documentation/devicetree/bindings/input/mediatek,mt6779-keypad.yaml
+++ b/Documentation/devicetree/bindings/input/mediatek,mt6779-keypad.yaml
@@ -7,7 +7,7 @@ $schema: http://devicetree.org/meta-schemas/core.yaml#
 title: Mediatek's Keypad Controller device tree bindings
 
 maintainers:
-  - Fengping Yu <fengping.yu@mediatek.com>
+  - Mattijs Korpershoek <mkorpershoek@baylibre.com>
 
 allOf:
   - $ref: "/schemas/input/matrix-keymap.yaml#"
-- 
2.32.0

