Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5CD4B5EE898
	for <lists+linux-input@lfdr.de>; Wed, 28 Sep 2022 23:48:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233803AbiI1VsT (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 28 Sep 2022 17:48:19 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33432 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233766AbiI1VsR (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Wed, 28 Sep 2022 17:48:17 -0400
Received: from mail-ot1-x331.google.com (mail-ot1-x331.google.com [IPv6:2607:f8b0:4864:20::331])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E1E0F6C133;
        Wed, 28 Sep 2022 14:48:16 -0700 (PDT)
Received: by mail-ot1-x331.google.com with SMTP id r13-20020a056830418d00b0065601df69c0so9027027otu.7;
        Wed, 28 Sep 2022 14:48:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
        bh=4ZYga9yWmoqKhUfBR3g+Uo8MTICLjmrXVYkxBU0zB0k=;
        b=FXV7eZ7EY22NQv7sk0ZG69Z1OhJdd0/V+QTWZLvqjfPxXvUm1xetZauB0FQtRqUX8P
         jmXvpYCUm2VvajcP/3IEopHo71Veej7rWhpmkt/5lvZGgO38Vw+vQGXfZhPLjbeJVZG0
         aZ3rgg4uIyNQ3eA6r5pD3E+yQqGhA2SsxFlb7hRUH36bRm/03WIgxIQPQwgyy5q8UdrI
         ktZJTAT+428QWDF88ZZU5DWaWS3rCyF4oUoZJuUGCfY3KVEjR10g0tP/J5C43g9BlpYZ
         0OKHFfGZ7a48UgaVH/bzK9695TQAgM/FvPgb2siWD6Z/SrboPOIY1CCda2B6LHe2jCIn
         DYTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date;
        bh=4ZYga9yWmoqKhUfBR3g+Uo8MTICLjmrXVYkxBU0zB0k=;
        b=L1pDGu3KjmpAtPCmZQHR1CBXPU2cg6q1WzMkl73HhV2rEEsQ4GTnuZrj0d7McwHsyV
         mki2argO0gjk6VjWnhKYomKzAX0nrTn/DRzp8maTbcUAbOsVFBBUT3PBBGsu6XWAh+Yq
         mCOD0cuX9kJrAMwDLr5kGZ7HMykYYilIdEe7F+vevUg2JkvLIVbPMD/Du4Fys14yGAex
         sdKGO4fj9In+8Bei9U/pFp5R2ubCDcFwNGVow/8aHtEJLHUWmAcnq77LqmLjPDP87FBT
         Dd5/6D2QJ0mKl1JnhrtmhuykiUbTBfedPZbqgHohFQ7vBlFrVrYVEEtnEOS62qahjyln
         1uXQ==
X-Gm-Message-State: ACrzQf3DagzpvNenJYqSCY7Iy1WqZb6QRWjiXkqMmhrVEjpyInnj9BMm
        RKIUKTCVXLjH/w8C6ARTIPkss4eM/z0=
X-Google-Smtp-Source: AMsMyM55LL9GJCJ6azEFeZhMGHwi81ZT0lPt1q7n98eESTaFdFC0ODFKJJpqWm9FaEDv3Tc0E6UqwA==
X-Received: by 2002:a05:6830:2b28:b0:657:7798:2eda with SMTP id l40-20020a0568302b2800b0065777982edamr16038615otv.153.1664401695820;
        Wed, 28 Sep 2022 14:48:15 -0700 (PDT)
Received: from wintermute.localdomain (76-244-6-13.lightspeed.rcsntx.sbcglobal.net. [76.244.6.13])
        by smtp.gmail.com with ESMTPSA id m18-20020a9d6452000000b00657a221eb71sm2623211otl.65.2022.09.28.14.48.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Sep 2022 14:48:15 -0700 (PDT)
From:   Chris Morgan <macroalpha82@gmail.com>
To:     linux-input@vger.kernel.org
Cc:     devicetree@vger.kernel.org, rydberg@bitmath.org,
        krzysztof.kozlowski+dt@linaro.org, robh+dt@kernel.org,
        dmitry.torokhov@gmail.com, Chris Morgan <macromorgan@hotmail.com>
Subject: [PATCH 2/3] dt-bindings: input: touchscreen: Add Hynitron cstxxx bindings
Date:   Wed, 28 Sep 2022 16:48:05 -0500
Message-Id: <20220928214806.13572-3-macroalpha82@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220928214806.13572-1-macroalpha82@gmail.com>
References: <20220928214806.13572-1-macroalpha82@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-1.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,
        FREEMAIL_FROM,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

From: Chris Morgan <macromorgan@hotmail.com>

Add documentation for the Hynitron cstxxx touchscreen bindings.
Hynitron makes a series of touchscreen controllers, however for
now this is expected to only be compatible with the cst3xx series.

Signed-off-by: Chris Morgan <macromorgan@hotmail.com>
---
 .../input/touchscreen/hynitron,cstxxx.yaml    | 65 +++++++++++++++++++
 1 file changed, 65 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/input/touchscreen/hynitron,cstxxx.yaml

diff --git a/Documentation/devicetree/bindings/input/touchscreen/hynitron,cstxxx.yaml b/Documentation/devicetree/bindings/input/touchscreen/hynitron,cstxxx.yaml
new file mode 100644
index 000000000000..c98d14e9844a
--- /dev/null
+++ b/Documentation/devicetree/bindings/input/touchscreen/hynitron,cstxxx.yaml
@@ -0,0 +1,65 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/input/touchscreen/hynitron,cstxxx.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Hynitron cstxxx series touchscreen controller bindings
+
+description: |
+  Bindings for Hynitron cstxxx series multi-touch touchscreen
+  controllers.
+
+maintainers:
+  - Chris Morgan <macromorgan@hotmail.com>
+
+allOf:
+  - $ref: touchscreen.yaml#
+
+properties:
+  compatible:
+    enum:
+      - hynitron,cst3xx
+
+  reg:
+    maxItems: 1
+
+  interrupts:
+    maxItems: 1
+
+  reset-gpios:
+    maxItems: 1
+
+  touchscreen-size-x: true
+  touchscreen-size-y: true
+  touchscreen-inverted-x: true
+  touchscreen-inverted-y: true
+  touchscreen-swapped-x-y: true
+
+additionalProperties: false
+
+required:
+  - compatible
+  - reg
+  - interrupts
+  - reset-gpios
+
+examples:
+  - |
+    #include <dt-bindings/gpio/gpio.h>
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+    i2c {
+      #address-cells = <1>;
+      #size-cells = <0>;
+      touchscreen@1a {
+        compatible = "hynitron,cst3xx";
+        reg = <0x1a>;
+        interrupt-parent = <&gpio4>;
+        interrupts = <9 IRQ_TYPE_EDGE_FALLING>;
+        reset-gpios = <&gpio4 6 GPIO_ACTIVE_LOW>;
+        touchscreen-size-x = <640>;
+        touchscreen-size-y = <480>;
+      };
+    };
+
+...
-- 
2.25.1

