Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5FA62566B3C
	for <lists+linux-input@lfdr.de>; Tue,  5 Jul 2022 14:05:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233766AbiGEMFZ (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 5 Jul 2022 08:05:25 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46606 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233760AbiGEMES (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Tue, 5 Jul 2022 08:04:18 -0400
Received: from mail-lf1-x129.google.com (mail-lf1-x129.google.com [IPv6:2a00:1450:4864:20::129])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D1156186F1
        for <linux-input@vger.kernel.org>; Tue,  5 Jul 2022 05:04:04 -0700 (PDT)
Received: by mail-lf1-x129.google.com with SMTP id z21so20096415lfb.12
        for <linux-input@vger.kernel.org>; Tue, 05 Jul 2022 05:04:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=JgapXPYyQW6JU+RyRJDX7d0Fy2HJw7ZXGeTl306iS5I=;
        b=dveBFbC8hgUVm5BkPxrrIOODtPlRViXGjtbK6mwVwlEor73nvjb9Bd1eqgr9J2yyPo
         oZTqkVAT3ev7oZ6+e0Kpf6qITV/KiDt+qP7UytylZ9afsvCxhlwbkGXRyw2dNhdPNjau
         Ccx1ZieijojVAtsARP2lqrJUG95u6no9wkGe5nlW5b1q0Hl9QX5nrBm3BXC+I1RtlEIT
         ujotrXOh/LLUmKJbb44MR1aNLEIiuTb7PIqlrL6UUDCxsthf/Ze8qEnE5H3/7xa9pgop
         lDfZ2ZzL08IKTlgN2xFX3jblJqFT3s1zXZ57jKI9zYjEC3akViwX2WVCE/GXzTGmBii3
         w+Nw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=JgapXPYyQW6JU+RyRJDX7d0Fy2HJw7ZXGeTl306iS5I=;
        b=RsglFGy02vkBT3S7Bi+Y7Q4E7/b0EZfrPPph/x5LczOyJcgM4+DCw+dnM8UoIFNF12
         zPUTh3/jEj2ztSu4yxXbJ4xp0NamPlT4GtEmKGYDfqVGT1ELoB9tbEZgbHC03U0Kk6Gc
         ycsW/AHuoQYOHogU9To151tCJ4oKcC2GMGzFOVIwvpN1JZi9mtxTWA1c5jH+/+01Nolr
         84UOhJfWw+GEHrnuetvIqA90SxHXclYLuN3qXVInc47yfIL8Uprq1p6p0QdEyu88eOxS
         nXyfNscYretOvLmw2x2H95VX/ZNn34w+HhTMigDb9+On+5/6OcXeyEbjXPoU/zlYm8uk
         OAqw==
X-Gm-Message-State: AJIora+kkz5XV4fmsKQsYOQAQCbn2A/+Up4yZbUuoLbuBEYVjLgQlfbC
        sezM85oSgzndoKzt5rRvI16ePw==
X-Google-Smtp-Source: AGRyM1vqE6sWpPbtQ08eMXU7bf7adDcsPgHdfda8OrUuDVLnrB/a1O129CgFnqmYv9MnbLA7aowxBw==
X-Received: by 2002:a05:6512:114a:b0:481:1b5b:691 with SMTP id m10-20020a056512114a00b004811b5b0691mr21046294lfg.205.1657022643163;
        Tue, 05 Jul 2022 05:04:03 -0700 (PDT)
Received: from krzk-bin.home ([84.20.121.239])
        by smtp.gmail.com with ESMTPSA id n13-20020a2e82cd000000b0025a885a135csm5547082ljh.119.2022.07.05.05.04.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 Jul 2022 05:04:02 -0700 (PDT)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To:     Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        linux-input@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Cc:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [RESEND PATCH v3 1/3] dt-bindings: input: gpio-keys: enforce node names to match all properties
Date:   Tue,  5 Jul 2022 14:03:54 +0200
Message-Id: <20220705120356.94876-2-krzysztof.kozlowski@linaro.org>
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

The gpio-keys DT schema matches all properties with a wide pattern and
applies specific schema to children.  This has drawback - all regular
properties are also matched and are silently ignored, even if they are
not described in schema.  Basically this allows any non-object property
to be present.

Enforce specific naming pattern for children (keys) to narrow the
pattern thus do not match other properties.  This will require all
children to be properly prefixed or suffixed (button, event, switch or
key).

Removal of "if:" within patternProperties causes drop of one indentation
level, but there are no other changes in the affected block.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 .../devicetree/bindings/input/gpio-keys.yaml  | 157 +++++++++---------
 1 file changed, 77 insertions(+), 80 deletions(-)

diff --git a/Documentation/devicetree/bindings/input/gpio-keys.yaml b/Documentation/devicetree/bindings/input/gpio-keys.yaml
index 645dfa1e0d07..27bb5c6ab8d9 100644
--- a/Documentation/devicetree/bindings/input/gpio-keys.yaml
+++ b/Documentation/devicetree/bindings/input/gpio-keys.yaml
@@ -16,86 +16,83 @@ properties:
       - gpio-keys-polled
 
 patternProperties:
-  ".*":
-    if:
-      type: object
-    then:
-      $ref: input.yaml#
-
-      properties:
-        gpios:
-          maxItems: 1
-
-        interrupts:
-          maxItems: 1
-
-        label:
-          description: Descriptive name of the key.
-
-        linux,code:
-          description: Key / Axis code to emit.
-
-        linux,input-type:
-          default: 1  # EV_KEY
-
-        linux,input-value:
-          description: |
-            If linux,input-type is EV_ABS or EV_REL then this
-            value is sent for events this button generates when pressed.
-            EV_ABS/EV_REL axis will generate an event with a value of 0
-            when all buttons with linux,input-type == type and
-            linux,code == axis are released. This value is interpreted
-            as a signed 32 bit value, e.g. to make a button generate a
-            value of -1 use:
-
-            linux,input-value = <0xffffffff>; /* -1 */
-
-          $ref: /schemas/types.yaml#/definitions/uint32
-
-        debounce-interval:
-          description:
-            Debouncing interval time in milliseconds. If not specified defaults to 5.
-          $ref: /schemas/types.yaml#/definitions/uint32
-
-          default: 5
-
-        wakeup-source:
-          description: Button can wake-up the system.
-
-        wakeup-event-action:
-          description: |
-            Specifies whether the key should wake the system when asserted, when
-            deasserted, or both. This property is only valid for keys that wake up the
-            system (e.g., when the "wakeup-source" property is also provided).
-
-            Supported values are defined in linux-event-codes.h:
-
-              EV_ACT_ANY        - both asserted and deasserted
-              EV_ACT_ASSERTED   - asserted
-              EV_ACT_DEASSERTED - deasserted
-          $ref: /schemas/types.yaml#/definitions/uint32
-          enum: [0, 1, 2]
-
-        linux,can-disable:
-          description:
-            Indicates that button is connected to dedicated (not shared) interrupt
-            which can be disabled to suppress events from the button.
-          type: boolean
-
-      required:
-        - linux,code
-
-      anyOf:
-        - required:
-            - interrupts
-        - required:
-            - gpios
-
-      dependencies:
-        wakeup-event-action: [ wakeup-source ]
-        linux,input-value: [ gpios ]
-
-      unevaluatedProperties: false
+  "^(button|event|key|switch|(button|event|key|switch)-[a-z0-9-]+|[a-z0-9-]+-(button|event|key|switch))$":
+    $ref: input.yaml#
+
+    properties:
+      gpios:
+        maxItems: 1
+
+      interrupts:
+        maxItems: 1
+
+      label:
+        description: Descriptive name of the key.
+
+      linux,code:
+        description: Key / Axis code to emit.
+
+      linux,input-type:
+        default: 1  # EV_KEY
+
+      linux,input-value:
+        description: |
+          If linux,input-type is EV_ABS or EV_REL then this
+          value is sent for events this button generates when pressed.
+          EV_ABS/EV_REL axis will generate an event with a value of 0
+          when all buttons with linux,input-type == type and
+          linux,code == axis are released. This value is interpreted
+          as a signed 32 bit value, e.g. to make a button generate a
+          value of -1 use:
+
+          linux,input-value = <0xffffffff>; /* -1 */
+
+        $ref: /schemas/types.yaml#/definitions/uint32
+
+      debounce-interval:
+        description:
+          Debouncing interval time in milliseconds. If not specified defaults to 5.
+        $ref: /schemas/types.yaml#/definitions/uint32
+
+        default: 5
+
+      wakeup-source:
+        description: Button can wake-up the system.
+
+      wakeup-event-action:
+        description: |
+          Specifies whether the key should wake the system when asserted, when
+          deasserted, or both. This property is only valid for keys that wake up the
+          system (e.g., when the "wakeup-source" property is also provided).
+
+          Supported values are defined in linux-event-codes.h:
+
+            EV_ACT_ANY        - both asserted and deasserted
+            EV_ACT_ASSERTED   - asserted
+            EV_ACT_DEASSERTED - deasserted
+        $ref: /schemas/types.yaml#/definitions/uint32
+        enum: [0, 1, 2]
+
+      linux,can-disable:
+        description:
+          Indicates that button is connected to dedicated (not shared) interrupt
+          which can be disabled to suppress events from the button.
+        type: boolean
+
+    required:
+      - linux,code
+
+    anyOf:
+      - required:
+          - interrupts
+      - required:
+          - gpios
+
+    dependencies:
+      wakeup-event-action: [ wakeup-source ]
+      linux,input-value: [ gpios ]
+
+    unevaluatedProperties: false
 
 if:
   properties:
-- 
2.34.1

