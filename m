Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 53EC9789A0C
	for <lists+linux-input@lfdr.de>; Sun, 27 Aug 2023 03:00:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229713AbjH0BAD (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Sat, 26 Aug 2023 21:00:03 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57018 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229787AbjH0A7a (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Sat, 26 Aug 2023 20:59:30 -0400
Received: from mail-lf1-x132.google.com (mail-lf1-x132.google.com [IPv6:2a00:1450:4864:20::132])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 47FA41A6
        for <linux-input@vger.kernel.org>; Sat, 26 Aug 2023 17:59:27 -0700 (PDT)
Received: by mail-lf1-x132.google.com with SMTP id 2adb3069b0e04-4ff882397ecso3190639e87.3
        for <linux-input@vger.kernel.org>; Sat, 26 Aug 2023 17:59:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1693097965; x=1693702765;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ftZ2Tumjuft2L/jMeghfFCeyN+7Sk5vcVoiCNz6lz7w=;
        b=RLc0vPJ9nWphLou1W4l+fZ7B8H1v95f2drjxgJpKCR+uWMGa/QDa4152vcfEJAc5B5
         87aOUXTPE1vj/j2y/+iAXk3Fji445jqkRSFzJ5aYnnUbsvIV9GXyKMSAu/sx8O8V8K4C
         Ww2w2zpMlTq5sdvYfCzSDybwbbs4NDgV0zc58m8BgNqj/14p9bM8lAy/23zr8pvWteKn
         Etpx1rvGv20sgW12Qb4aStQqg0eDu9/I9AyHcR3kPE1kH5tYxug7VsDH+vpVSYLipuan
         3lDdgGfrxUisf9LJy0cVRGR8eElf32sSXvnnTrLj2pOuGvbyj1ELVdG8fJ1BG72MC86n
         VRNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693097965; x=1693702765;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ftZ2Tumjuft2L/jMeghfFCeyN+7Sk5vcVoiCNz6lz7w=;
        b=fGSs3TtmfJEIHNduNLaUHHraHdU5VkQRvwO/5yph8EIGwp3js08+6hfoi/iIJWlUpS
         UKKO4VsKVslYpgQWefpzsIYiQSjezn43OcCOT7BKW0RkgsUs/oe+ijU2pkhx+tVlxIp1
         9ujPG8lHpqa0HRd4r3pPEZNntNj4VZ7PM2ISoE9A4w1CZJrpvZN5LPqPci75ffsgPDBJ
         dr3eV128kYNTsQ3WDJl18bjbbZaqclf53RjuN9OK8ieL0lWRp3rJgJstG5t2iHB5Aj7h
         xacLxfFExqNE28LolVfmfzcGUju/rLfaE7Ck2wSEn9E4mI6fmDKYgPts5MNAsBZDXjcI
         Sg2A==
X-Gm-Message-State: AOJu0YxweaCAdPE0wM0F+X20bma65OyPBlT7TBgwydcM1qsqfWAzZpyJ
        OvK+ztlWHBf9HBzYZiMeeMq2Aw==
X-Google-Smtp-Source: AGHT+IENHKPsw9h+nW13xatHL0xF5smcFOWLqTWgwdnLDje/K+y8BeQmcNjf7LWfgd+GhfqOgdbVTQ==
X-Received: by 2002:a05:6512:3189:b0:4f7:6453:f3f1 with SMTP id i9-20020a056512318900b004f76453f3f1mr21068807lfe.15.1693097965514;
        Sat, 26 Aug 2023 17:59:25 -0700 (PDT)
Received: from umbar.unikie.fi ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id p18-20020ac246d2000000b00500a08e42e7sm917729lfo.124.2023.08.26.17.59.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 26 Aug 2023 17:59:24 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     devicetree@vger.kernel.org, Lee Jones <lee@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        linux-arm-msm@vger.kernel.org, Jonathan Cameron <jic23@kernel.org>,
        Lars-Peter Clausen <lars@metafoo.de>,
        linux-iio@vger.kernel.org,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        linux-input@vger.kernel.org, Pavel Machek <pavel@ucw.cz>,
        linux-leds@vger.kernel.org
Subject: [PATCH v4 03/38] dt-bindings: mfd: qcom-pm8xxx: allow using interrupts-extended
Date:   Sun, 27 Aug 2023 03:58:45 +0300
Message-Id: <20230827005920.898719-4-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230827005920.898719-1-dmitry.baryshkov@linaro.org>
References: <20230827005920.898719-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Allow using interrupts-extended, which is a preferred form of interrupts
specification compared to the interrupt-parrent + interrupts pair.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 Documentation/devicetree/bindings/mfd/qcom-pm8xxx.yaml | 10 +++++++++-
 1 file changed, 9 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/mfd/qcom-pm8xxx.yaml b/Documentation/devicetree/bindings/mfd/qcom-pm8xxx.yaml
index 7fe3875a5996..33d9615e63c8 100644
--- a/Documentation/devicetree/bindings/mfd/qcom-pm8xxx.yaml
+++ b/Documentation/devicetree/bindings/mfd/qcom-pm8xxx.yaml
@@ -37,6 +37,9 @@ properties:
   interrupts:
     maxItems: 1
 
+  interrupts-extended:
+    maxItems: 1
+
   '#interrupt-cells':
     const: 2
 
@@ -75,11 +78,16 @@ patternProperties:
     type: object
     $ref: /schemas/iio/adc/qcom,pm8018-adc.yaml#
 
+oneOf:
+  - required:
+      - interrupts
+  - required:
+      - interrupts-extended
+
 required:
   - compatible
   - '#address-cells'
   - '#size-cells'
-  - interrupts
   - '#interrupt-cells'
   - interrupt-controller
 
-- 
2.39.2

