Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B1BE1607366
	for <lists+linux-input@lfdr.de>; Fri, 21 Oct 2022 11:09:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231146AbiJUJJJ (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Fri, 21 Oct 2022 05:09:09 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35476 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230498AbiJUJIx (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Fri, 21 Oct 2022 05:08:53 -0400
Received: from mail-wm1-x32c.google.com (mail-wm1-x32c.google.com [IPv6:2a00:1450:4864:20::32c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2CEEC1A3E10
        for <linux-input@vger.kernel.org>; Fri, 21 Oct 2022 02:08:51 -0700 (PDT)
Received: by mail-wm1-x32c.google.com with SMTP id 186-20020a1c02c3000000b003c6c154d528so4530527wmc.4
        for <linux-input@vger.kernel.org>; Fri, 21 Oct 2022 02:08:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=JEMkL9tW27qh7qB7z1dOyn6IVj+P4lSJ9BRc/xcD6yA=;
        b=Fdv0tSfxqc9lFn2vsyEpLqH/mIfo2xlGI5ESruFQWGS2H4h4Xve67qskhiUC4vkAOL
         jp9s3CL7OL9VFHy8lrK8VXN/6vbZ9+PFl7l5oHsPgS/DH8z7Df70OdRyyEezSH/OWx5V
         LgfO2hCylr060TxHJUkGlMlcF+Dec01lMALbEAItXTNTExjXlSUGvZlkmPjwX+YeAtgc
         SIUxTSEkdTv/+OgA8IZw9IK9CcZ7Eb8EwahdRV/oR/NrkkaeK4/tx5ziPO4acSk4kQp8
         m+nE4brnCJiwik/WmeBNLPzgbQul/9ZHOlT5SKBV9+pUl570jgvOh2YOjfXEUYV2xUPp
         Lobw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=JEMkL9tW27qh7qB7z1dOyn6IVj+P4lSJ9BRc/xcD6yA=;
        b=UMzcAwfUU0dau25+6UMzpLLkG4xB7iAlBW9vz5zP0B3ZrUlL6C8nwLLRentxWvKGK4
         kN7NxhYRze4kI480idIt4FBikfMEDLvnRoMUv9aAHDNGGy21yiJ3tcKv2rgp5PvYQ02E
         HPy8C8q52LDMrK6KWUXBo0QwsL2OJfvk4w74Jo9+P8aSrB7Jn71qW6KZ4hvZhejJS7m+
         USYZE3yi7WWt2PYetLz66wgEFxVWFScewLOfIamBJ43B++Q0NXSy2WBK+mg3gpKlaFv0
         Xoz5WTRCamJ4LDZ9hd6LEsEAv1bT6pn2iWPv5ks5kuMugbiKf1EzK5iAh+5s+DanIeqC
         IYUA==
X-Gm-Message-State: ACrzQf1U42YkF+w4nI5+VLXDNyAOxnRkE++jdn9v0v/ZV/BeyNcwGiRs
        Bbikha1jRf4nPOo1YIHe2xEURg==
X-Google-Smtp-Source: AMsMyM6V1N6SjorKzw6JVSS3tvnK0Y49BcdyxB/3asfQVXN2SL4B7kTCY2CQ1hyzpoAQpPgHl6JTlQ==
X-Received: by 2002:a05:600c:3c8e:b0:3b4:d224:ae27 with SMTP id bg14-20020a05600c3c8e00b003b4d224ae27mr12509297wmb.187.1666343329602;
        Fri, 21 Oct 2022 02:08:49 -0700 (PDT)
Received: from arrakeen.starnux.net ([2a01:e0a:982:cbb0:8261:5fff:fe11:bdda])
        by smtp.gmail.com with ESMTPSA id v10-20020a05600c444a00b003c6f27d275dsm2230286wmn.33.2022.10.21.02.08.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Oct 2022 02:08:49 -0700 (PDT)
From:   Neil Armstrong <neil.armstrong@linaro.org>
Date:   Fri, 21 Oct 2022 11:06:37 +0200
Subject: [PATCH v4 01/11] dt-bindings: arm: qcom: move swir,mangoh-green-wp8548 board
 documentation to qcom.yaml
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20220928-mdm9615-dt-schema-fixes-v4-1-dac2dfaac703@linaro.org>
References: <20220928-mdm9615-dt-schema-fixes-v4-0-dac2dfaac703@linaro.org>
In-Reply-To: <20220928-mdm9615-dt-schema-fixes-v4-0-dac2dfaac703@linaro.org>
To:     Bjorn Andersson <andersson@kernel.org>,
        Satya Priya <quic_c_skakit@quicinc.com>,
        Lee Jones <lee@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Andy Gross <agross@kernel.org>,
        Alessandro Zummo <a.zummo@towertech.it>
Cc:     Bjorn Andersson <andersson@kernel.org>,
        linux-input@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        devicetree@vger.kernel.org,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Rob Herring <robh@kernel.org>, linux-rtc@vger.kernel.org,
        linux-kernel@vger.kernel.org
X-Mailer: b4 0.10.1
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Document into the main qcom.yaml as conversion from swir.txt to dt-schema.

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
---
 Documentation/devicetree/bindings/arm/qcom.yaml |  6 ++++++
 Documentation/devicetree/bindings/arm/swir.txt  | 12 ------------
 2 files changed, 6 insertions(+), 12 deletions(-)

diff --git a/Documentation/devicetree/bindings/arm/qcom.yaml b/Documentation/devicetree/bindings/arm/qcom.yaml
index 1b5ac6b02bc5..0a9a1dc68c1b 100644
--- a/Documentation/devicetree/bindings/arm/qcom.yaml
+++ b/Documentation/devicetree/bindings/arm/qcom.yaml
@@ -265,6 +265,12 @@ properties:
               - qcom,ipq8074-hk10-c2
           - const: qcom,ipq8074
 
+      - description: Sierra Wireless MangOH Green with WP8548 Module
+        items:
+          - const: swir,mangoh-green-wp8548
+          - const: swir,wp8548
+          - const: qcom,mdm9615
+
       - description: Qualcomm Technologies, Inc. SC7180 IDP
         items:
           - enum:
diff --git a/Documentation/devicetree/bindings/arm/swir.txt b/Documentation/devicetree/bindings/arm/swir.txt
deleted file mode 100644
index 042be73a95d3..000000000000
--- a/Documentation/devicetree/bindings/arm/swir.txt
+++ /dev/null
@@ -1,12 +0,0 @@
-Sierra Wireless Modules device tree bindings
---------------------------------------------
-
-Supported Modules :
- - WP8548 : Includes MDM9615 and PM8018 in a module
-
-Sierra Wireless modules shall have the following properties :
-  Required root node property
-   - compatible: "swir,wp8548" for the WP8548 CF3 Module
-
-Board compatible values:
-  - "swir,mangoh-green-wp8548" for the mangOH green board with the WP8548 module

-- 
b4 0.10.1
