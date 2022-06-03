Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id CECAE53C876
	for <lists+linux-input@lfdr.de>; Fri,  3 Jun 2022 12:17:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233907AbiFCKQU (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Fri, 3 Jun 2022 06:16:20 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59362 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S243536AbiFCKQS (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Fri, 3 Jun 2022 06:16:18 -0400
Received: from mail-ed1-x534.google.com (mail-ed1-x534.google.com [IPv6:2a00:1450:4864:20::534])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 120113B290
        for <linux-input@vger.kernel.org>; Fri,  3 Jun 2022 03:16:17 -0700 (PDT)
Received: by mail-ed1-x534.google.com with SMTP id z7so9513296edm.13
        for <linux-input@vger.kernel.org>; Fri, 03 Jun 2022 03:16:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=JlijKPUpN7eg9y5V6tQzRcvhZCbUNkKX6ORJW+ZchpY=;
        b=X619W18EorKvqB8krpdh0k0JIaYrrMLqMYHCgR0uVPtQab+hLmkenmpHYXAMZjMSac
         Ak9c3p/5jKZ+Kwz80tKGD314epV/P8/s9Fibi6P0MaaEIoNWPza+1htiBW5AiQdk1CEP
         bJEmp0KMFknILapLGsmMJ4oeasSCJm4RJDPHPfemQygSiopEA5KpY3/xjJ2moLlMWOzs
         wwSUNHH9CBMhpd2NstNoXhgYAqbOtudAvh5jWn0nqjlGcTJ/baZ93xRuQsBG1P7pBFqX
         VY/yHdgt3bsJAzyeHnwLg4/2n5sFCUQdzG2jsswZjAPmyx3mQZaYRIZcfPeUe74UtkHA
         NOsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=JlijKPUpN7eg9y5V6tQzRcvhZCbUNkKX6ORJW+ZchpY=;
        b=rpSCTZylipeTUNEY1qwCnMmfhHrdFiRIrt+PndLXTF8zKtqm4FKAv8W7pGkW5SGQjH
         Pa2CxcT/ZbtFoiERDb5x1ue0N/H2Wo2EhnzQ5b4UCUizqjLQpPJuBXJ/HorfLSnuHnqf
         MTnXUwmCaSfQ67LrYxvQtS8UY/Qq7AYqn5rfNTFOT91G2V73DfI7uI+GvAC2d3nf4muQ
         0WamoiSmKcZh0v+0EadTH1RI9+Nt9Wi6SvoMFOdv9Pk8cazfHdVkZDlugTsz+uG2CdcW
         yM4zH0QC7nnmptYo06TFb9WDs3GL/ykXU/ygSeroGpIKhAtCWf7OwVDFDW5klgbELPVQ
         pLjA==
X-Gm-Message-State: AOAM533cir4ttD8r8EQY9ymYrSFq9Dai2XnT8EmWWaPGEviJdI2Na16r
        J3+AtGBhsiFBaqiPAHe9jdiUdQ==
X-Google-Smtp-Source: ABdhPJy5M62dwEnzpriUikn5iXWTB9F8bekwfIrDQt7Hq5iWQdGHiY1Sw/k2ADO+GkfIDai8/fMgpw==
X-Received: by 2002:a05:6402:3594:b0:42b:65dd:489 with SMTP id y20-20020a056402359400b0042b65dd0489mr9892016edc.222.1654251375656;
        Fri, 03 Jun 2022 03:16:15 -0700 (PDT)
Received: from localhost.localdomain (xdsl-188-155-176-92.adslplus.ch. [188.155.176.92])
        by smtp.gmail.com with ESMTPSA id j15-20020a170906430f00b006f3ef214dc7sm2779008ejm.45.2022.06.03.03.16.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Jun 2022 03:16:14 -0700 (PDT)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To:     Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        linux-input@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Cc:     Stefan Hansson <newbie13xd@gmail.com>,
        Andreas Kemnade <andreas@kemnade.info>,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [RFC PATCH 2/2] dt-bindings: input: gpio-keys: document label and autorepeat properties
Date:   Fri,  3 Jun 2022 12:16:01 +0200
Message-Id: <20220603101601.542054-3-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220603101601.542054-1-krzysztof.kozlowski@linaro.org>
References: <20220603101601.542054-1-krzysztof.kozlowski@linaro.org>
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

The original text bindings documented "autorepeat" and "label"
properties (in the device node, beside the nodes with keys).

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 Documentation/devicetree/bindings/input/gpio-keys.yaml | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/Documentation/devicetree/bindings/input/gpio-keys.yaml b/Documentation/devicetree/bindings/input/gpio-keys.yaml
index 49d388dc8d78..b1c910a5e233 100644
--- a/Documentation/devicetree/bindings/input/gpio-keys.yaml
+++ b/Documentation/devicetree/bindings/input/gpio-keys.yaml
@@ -15,6 +15,14 @@ properties:
       - gpio-keys
       - gpio-keys-polled
 
+  autorepeat:
+    type: boolean
+    description:
+      Enable operating system (not hardware) key auto repeat feature.
+
+  label:
+    description: Name of entire device
+
 patternProperties:
   "^(key|key-[a-z0-9-]+|[a-z0-9-]+-key)$":
     $ref: input.yaml#
-- 
2.34.1

