Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C3A6A566B46
	for <lists+linux-input@lfdr.de>; Tue,  5 Jul 2022 14:05:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233985AbiGEMFi (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 5 Jul 2022 08:05:38 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46704 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233572AbiGEME2 (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Tue, 5 Jul 2022 08:04:28 -0400
Received: from mail-lj1-x22e.google.com (mail-lj1-x22e.google.com [IPv6:2a00:1450:4864:20::22e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 68B6118391
        for <linux-input@vger.kernel.org>; Tue,  5 Jul 2022 05:04:07 -0700 (PDT)
Received: by mail-lj1-x22e.google.com with SMTP id bx13so14239415ljb.1
        for <linux-input@vger.kernel.org>; Tue, 05 Jul 2022 05:04:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=n04xRHDLPG5HTJiUoTVbiyOiGV01+5rVdjSb2OnFTXM=;
        b=BCDuSqECc+nJ4QixySuzLrzpTldvI4Om7Dhhe79zvfcZpzEzGecmAsDtbOf3XLzQC7
         w1uhu4rB9AKVhxlEOmTXJsDmqBX/3XMZXi9nrbmqxCnspovd7Q8yAdlrQQX0aZYeV6Fl
         c8WcJWt8Si79EF8UcAIz71wn15IahJMZQdjSgHyrHfHv/2MYqOUJadjBcEzDAjbrBDzj
         rRImKl3ArYsXlhHZx7+a/pZCSpAYvIjJP14wEi6xVHIkMAoeQyfbYASKFAWMrBNse3wm
         KDbQ04/bH6MFUz+3trU9Jg7lhMH741aCEqeBNZBq8fgVsCxnHx9VVKxFpE/9R8U5Fvkr
         YDOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=n04xRHDLPG5HTJiUoTVbiyOiGV01+5rVdjSb2OnFTXM=;
        b=KtrK4jVaTZQmRvbU18UoeCezQiX/idUG2slL4jlKMQCqUT+fJCcv7grG03jebgqxnI
         JsE0yB+gIFSHgpimiUCdMIeDbL1BzCR3iNyegDTXau9uYieh9Drb1hwjb3o3GjAHQK8Q
         oRkHNayk5Kv8/1wxnQAxOq1xvVuey0qd1wPg4ezF/oKXkF4v9w3xbBaxhFHyGnCeo1Ur
         f6u7zdgUCLEcTI3WyQ2ObbF2ht83sZm8mYUleFhd7mzuF1wpDa0yg8ODfKIKt45RHTZy
         odPYY0da1x77cNoeWCJvqrgMMDbQBc6/q3yLaFPKh4cG5Y2mV5IqbkHaGXbWIqtp6R6x
         Ufyw==
X-Gm-Message-State: AJIora+wcVEjFpsy1Kw/fVSsWnCASVn4etFifanffuKsKz8EUmPmmfD0
        bFMrez59jVJzfjVWauZOIrsHhg==
X-Google-Smtp-Source: AGRyM1sl7oYOktjybXQ7DcS9EisH+raxTv/CIYoUdIA4mqFgH0EaCpesDAtzqgGs0ayhR8cQfoLLyg==
X-Received: by 2002:a05:651c:1699:b0:25b:c598:3803 with SMTP id bd25-20020a05651c169900b0025bc5983803mr20101511ljb.0.1657022646876;
        Tue, 05 Jul 2022 05:04:06 -0700 (PDT)
Received: from krzk-bin.home ([84.20.121.239])
        by smtp.gmail.com with ESMTPSA id n13-20020a2e82cd000000b0025a885a135csm5547082ljh.119.2022.07.05.05.04.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 Jul 2022 05:04:05 -0700 (PDT)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To:     Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        linux-input@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Cc:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [RESEND PATCH v3 3/3] dt-bindings: input: gpio-keys: accept also interrupt-extended
Date:   Tue,  5 Jul 2022 14:03:56 +0200
Message-Id: <20220705120356.94876-4-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220705120356.94876-1-krzysztof.kozlowski@linaro.org>
References: <20220705120356.94876-1-krzysztof.kozlowski@linaro.org>
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

Each key device node might have interrupts-extended instead of
interrupts property:

  fsl-ls1028a-kontron-sl28-var1.dtb: buttons0: power-button: 'anyOf' conditional failed, one must be fixed:
    'interrupts' is a required property
    'gpios' is a required property

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 Documentation/devicetree/bindings/input/gpio-keys.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/input/gpio-keys.yaml b/Documentation/devicetree/bindings/input/gpio-keys.yaml
index e722e681d237..17ac9dff7972 100644
--- a/Documentation/devicetree/bindings/input/gpio-keys.yaml
+++ b/Documentation/devicetree/bindings/input/gpio-keys.yaml
@@ -92,6 +92,8 @@ patternProperties:
     anyOf:
       - required:
           - interrupts
+      - required:
+          - interrupts-extended
       - required:
           - gpios
 
-- 
2.34.1

