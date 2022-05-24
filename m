Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B17A4532679
	for <lists+linux-input@lfdr.de>; Tue, 24 May 2022 11:33:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235640AbiEXJbr (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 24 May 2022 05:31:47 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41070 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235610AbiEXJbr (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Tue, 24 May 2022 05:31:47 -0400
Received: from mail-lf1-x12f.google.com (mail-lf1-x12f.google.com [IPv6:2a00:1450:4864:20::12f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 060C04EA00
        for <linux-input@vger.kernel.org>; Tue, 24 May 2022 02:31:45 -0700 (PDT)
Received: by mail-lf1-x12f.google.com with SMTP id p4so28419718lfg.4
        for <linux-input@vger.kernel.org>; Tue, 24 May 2022 02:31:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=9nrI7YiSyYQ7Y/X0QFQ+SqgqG6o8iofh9fkLStbCKSA=;
        b=AdCDXmVIvkLD95zyxngXCxPArySis6nnzTDFoOS/AHX6lNFbSnK2tArP/ANsSMcfwB
         r+SWu81KcvPVKroFGu8s2JJVBTg1j6/cDvGIJCI+s5q1Kd0tO2CcC2e5m0x6517E35pV
         F6pXBV09ZEiLjGe0suJcvtEW3NPXLlT1EJ5BrRbeGQyGq6eA0RHkFLcm2zICD/Sjih4P
         IMfzWJ+8iBAFcIpEpIJUDaGnQboFnHFeLFsApdprNTXgeRgepGXkcj2crgSQKcmOr1ll
         OmSOhYMOGqgyg0qfk9yI3L9S6Vf2sPdSjE/TacO3oouOmTh0fnp1ZNQihKjIe0CYTIxq
         r6KA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=9nrI7YiSyYQ7Y/X0QFQ+SqgqG6o8iofh9fkLStbCKSA=;
        b=z4+rfR10blKNiWi0hhcMVQQZ0r1qz87DKXcjZxUyoTS02YNn60vSSKqxGn1eqIIq1q
         eXl4pPRPr3+8Mwq/UA6JF6YJxbF38z/itAopNjUW762NhmfY4QXjR2kX462Vd1WSP7c7
         OajjOgrTJmOFYf9c1DcI0e5mT1yMSgS9iZ07me5weGYK/DzpnXyENBos63Dp88jwCjKF
         vr+pKbs74YgOkZAj3Qu2Hs3UpJTRFgBqhbg54uP/TxDFhM818PGCay0zNruoN0+bq98p
         xsJCLx5R5R+5KpnONlv/tYFp3BneGOdDPDB64f38crYFSV5V8go/evJ+0nL5WPiH1BCX
         S17g==
X-Gm-Message-State: AOAM530cwKXmEIavX0aFytSXZP43RB8oNo4773dYmVcrwK831LPTDbrm
        uPN9RgW0tdvOZhLAVSEhbMBayA==
X-Google-Smtp-Source: ABdhPJwFxrAvDTuvMQYljVIrHPBvZF52hEqcTEDK4dnVxRLtDEczUbqMN3la4jkBhGwCJ+/VU8CNpw==
X-Received: by 2002:a05:6512:3d8c:b0:478:7996:935d with SMTP id k12-20020a0565123d8c00b004787996935dmr5158485lfv.542.1653384703330;
        Tue, 24 May 2022 02:31:43 -0700 (PDT)
Received: from krzk-bin.. ([91.221.145.6])
        by smtp.gmail.com with ESMTPSA id q30-20020ac2515e000000b0047255d2112asm2443218lfd.89.2022.05.24.02.31.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 May 2022 02:31:42 -0700 (PDT)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To:     Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Jeff LaBundy <jeff@labundy.com>, linux-input@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Cc:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Andreas Kemnade <andreas@kemnade.info>
Subject: [PATCH] dt-bindings: input: use generic node names
Date:   Tue, 24 May 2022 11:31:36 +0200
Message-Id: <20220524093136.7980-1-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
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

Devicetree specification expects nodes to have generic names, if
possible, so replace custom ones with something generic.  For gpio-keys,
the more popular format is "key-xxx" instead of "xxx-key", so choose the
first one.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

---

Cc: Andreas Kemnade <andreas@kemnade.info>
---
 .../devicetree/bindings/input/fsl,mpr121-touchkey.yaml        | 4 ++--
 Documentation/devicetree/bindings/input/gpio-keys.yaml        | 4 ++--
 Documentation/devicetree/bindings/input/iqs269a.yaml          | 2 +-
 Documentation/devicetree/bindings/input/iqs626a.yaml          | 2 +-
 .../devicetree/bindings/input/microchip,cap11xx.yaml          | 2 +-
 5 files changed, 7 insertions(+), 7 deletions(-)

diff --git a/Documentation/devicetree/bindings/input/fsl,mpr121-touchkey.yaml b/Documentation/devicetree/bindings/input/fsl,mpr121-touchkey.yaml
index 878464f128dc..5139af287d3e 100644
--- a/Documentation/devicetree/bindings/input/fsl,mpr121-touchkey.yaml
+++ b/Documentation/devicetree/bindings/input/fsl,mpr121-touchkey.yaml
@@ -57,7 +57,7 @@ examples:
         #address-cells = <1>;
         #size-cells = <0>;
 
-        mpr121@5a {
+        touchkey@5a {
             compatible = "fsl,mpr121-touchkey";
             reg = <0x5a>;
             interrupt-parent = <&gpio1>;
@@ -77,7 +77,7 @@ examples:
         #address-cells = <1>;
         #size-cells = <0>;
 
-        mpr121@5a {
+        touchkey@5a {
             compatible = "fsl,mpr121-touchkey";
             reg = <0x5a>;
             poll-interval = <20>;
diff --git a/Documentation/devicetree/bindings/input/gpio-keys.yaml b/Documentation/devicetree/bindings/input/gpio-keys.yaml
index 7fe1966ea28a..93f601c58984 100644
--- a/Documentation/devicetree/bindings/input/gpio-keys.yaml
+++ b/Documentation/devicetree/bindings/input/gpio-keys.yaml
@@ -127,13 +127,13 @@ examples:
         compatible = "gpio-keys";
         autorepeat;
 
-        up {
+        key-up {
             label = "GPIO Key UP";
             linux,code = <103>;
             gpios = <&gpio1 0 1>;
         };
 
-        down {
+        key-down {
             label = "GPIO Key DOWN";
             linux,code = <108>;
             interrupts = <1 IRQ_TYPE_EDGE_FALLING>;
diff --git a/Documentation/devicetree/bindings/input/iqs269a.yaml b/Documentation/devicetree/bindings/input/iqs269a.yaml
index 9c154e5e1a91..d84d69f5455d 100644
--- a/Documentation/devicetree/bindings/input/iqs269a.yaml
+++ b/Documentation/devicetree/bindings/input/iqs269a.yaml
@@ -475,7 +475,7 @@ examples:
             #address-cells = <1>;
             #size-cells = <0>;
 
-            iqs269a@44 {
+            touch@44 {
                     #address-cells = <1>;
                     #size-cells = <0>;
 
diff --git a/Documentation/devicetree/bindings/input/iqs626a.yaml b/Documentation/devicetree/bindings/input/iqs626a.yaml
index 0cb736c541c9..dd727befe564 100644
--- a/Documentation/devicetree/bindings/input/iqs626a.yaml
+++ b/Documentation/devicetree/bindings/input/iqs626a.yaml
@@ -751,7 +751,7 @@ examples:
             #address-cells = <1>;
             #size-cells = <0>;
 
-            iqs626a@44 {
+            touch@44 {
                     #address-cells = <1>;
                     #size-cells = <0>;
 
diff --git a/Documentation/devicetree/bindings/input/microchip,cap11xx.yaml b/Documentation/devicetree/bindings/input/microchip,cap11xx.yaml
index d5d6bced3148..96358b12f9b2 100644
--- a/Documentation/devicetree/bindings/input/microchip,cap11xx.yaml
+++ b/Documentation/devicetree/bindings/input/microchip,cap11xx.yaml
@@ -112,7 +112,7 @@ examples:
       #address-cells = <1>;
       #size-cells = <0>;
 
-      cap1188@28 {
+      touch@28 {
         compatible = "microchip,cap1188";
         interrupt-parent = <&gpio1>;
         interrupts = <0 0>;
-- 
2.34.1

