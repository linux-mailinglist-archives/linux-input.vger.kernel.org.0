Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A743A566B41
	for <lists+linux-input@lfdr.de>; Tue,  5 Jul 2022 14:05:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233787AbiGEMFg (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 5 Jul 2022 08:05:36 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46672 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233777AbiGEME2 (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Tue, 5 Jul 2022 08:04:28 -0400
Received: from mail-lf1-x12b.google.com (mail-lf1-x12b.google.com [IPv6:2a00:1450:4864:20::12b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9F1A718B03
        for <linux-input@vger.kernel.org>; Tue,  5 Jul 2022 05:04:06 -0700 (PDT)
Received: by mail-lf1-x12b.google.com with SMTP id f39so20180728lfv.3
        for <linux-input@vger.kernel.org>; Tue, 05 Jul 2022 05:04:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=yoi+zPkWqTTvlN+wO0cy6XLBUH8069tfMWIB3LL7MAs=;
        b=WWm4T6oxPdyPf5nsyg+DEokjkXa55qLaAcSi2GDKKfFnM1SJamkJj8diao1wh7h519
         GDoPLkEc/u9fTELcdU6Q4+o4/K40UotZ89sbgkmxhlbDvVJ9Gcc2lfyDde/6o8F1fRCI
         tNGW81W1D02hV+RFSs5ZkEXmXzO6VIebpXuWx+W4l/Y7d4iheXr73VyKBbpIFUPm0PcK
         WvOOKxYVB5Euu0yKFIWxIB87V2IAyJcx8UOBPhZLKvyC2/JVMr9WeKeP7SIzCIXBDNnw
         M7AuCQ55qjw3wgT9gUYaSVTmxU7wDLuq/oHaOSw+9HQEmN1UwlQbqKD/Pr74pThF5Adq
         7Q8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=yoi+zPkWqTTvlN+wO0cy6XLBUH8069tfMWIB3LL7MAs=;
        b=Ovws2hcvDEYrvsJqByP3bn5NakJDarbnE6j6nPRkqwvihQKXvVE8HaECj41Z8h8GUL
         6flZDfecwsMXm7/0uKTuXnxUQfz89x6Kq08DFyl/kC7xwFPZfVwUn+2QntWJllQ4mppu
         4LRhl8UuSs2lGHX9uP6gwRXnFdm46Nq7BbDwDegL1VUMvFc6Ke9vywQfoHP5DfeHFazi
         SFQ369WxvUcGpKLQn9C5ddXQ+mRqitsP/RBlyEOYcsEtfErEX9rUpxtQXMc6V+1Urbz6
         /fvsKxdNhoAsXrQgyRnQYF5pmShykfmCqlYlTMDgprWPz++gJAK4UjPG1MTDZC4JJ8rP
         1BRg==
X-Gm-Message-State: AJIora824ayBIK68hDIELpFy2CJD/3vfFi1qX+Ma9LL/L8d4DgBE+rdv
        MDhyqC5mMQUEYx5H97oYdWBGRkdkZjFwvA==
X-Google-Smtp-Source: AGRyM1tJsEWFcvfyYuEaK0/YaV0GLte8Y2Pk2okWn5zzhgGVTJYfJHiMKhSx90vLBPEz9AYpkSVJBg==
X-Received: by 2002:a19:f208:0:b0:481:5db8:7ce7 with SMTP id q8-20020a19f208000000b004815db87ce7mr14835124lfh.526.1657022644777;
        Tue, 05 Jul 2022 05:04:04 -0700 (PDT)
Received: from krzk-bin.home ([84.20.121.239])
        by smtp.gmail.com with ESMTPSA id n13-20020a2e82cd000000b0025a885a135csm5547082ljh.119.2022.07.05.05.04.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 Jul 2022 05:04:04 -0700 (PDT)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To:     Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        linux-input@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Cc:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [RESEND PATCH v3 2/3] dt-bindings: input: gpio-keys: reference input.yaml and document properties
Date:   Tue,  5 Jul 2022 14:03:55 +0200
Message-Id: <20220705120356.94876-3-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220705120356.94876-1-krzysztof.kozlowski@linaro.org>
References: <20220705120356.94876-1-krzysztof.kozlowski@linaro.org>
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

The original text bindings documented "autorepeat" and "label"
properties (in the device node, beside the nodes with keys).  DTS use
also poll-interval.  Reference the input.yaml to get these top-level
properties.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 .../devicetree/bindings/input/gpio-keys.yaml  | 32 +++++++++++--------
 1 file changed, 19 insertions(+), 13 deletions(-)

diff --git a/Documentation/devicetree/bindings/input/gpio-keys.yaml b/Documentation/devicetree/bindings/input/gpio-keys.yaml
index 27bb5c6ab8d9..e722e681d237 100644
--- a/Documentation/devicetree/bindings/input/gpio-keys.yaml
+++ b/Documentation/devicetree/bindings/input/gpio-keys.yaml
@@ -15,6 +15,13 @@ properties:
       - gpio-keys
       - gpio-keys-polled
 
+  autorepeat: true
+
+  label:
+    description: Name of entire device
+
+  poll-interval: true
+
 patternProperties:
   "^(button|event|key|switch|(button|event|key|switch)-[a-z0-9-]+|[a-z0-9-]+-(button|event|key|switch))$":
     $ref: input.yaml#
@@ -94,19 +101,18 @@ patternProperties:
 
     unevaluatedProperties: false
 
-if:
-  properties:
-    compatible:
-      const: gpio-keys-polled
-then:
-  properties:
-    poll-interval:
-      description:
-        Poll interval time in milliseconds
-      $ref: /schemas/types.yaml#/definitions/uint32
-
-  required:
-    - poll-interval
+allOf:
+  - $ref: input.yaml#
+  - if:
+      properties:
+        compatible:
+          const: gpio-keys-polled
+    then:
+      required:
+        - poll-interval
+    else:
+      properties:
+        poll-interval: false
 
 additionalProperties: false
 
-- 
2.34.1

