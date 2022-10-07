Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7FC175F7D84
	for <lists+linux-input@lfdr.de>; Fri,  7 Oct 2022 20:47:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229637AbiJGSrW (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Fri, 7 Oct 2022 14:47:22 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51334 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229651AbiJGSrV (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Fri, 7 Oct 2022 14:47:21 -0400
Received: from mail-oo1-xc31.google.com (mail-oo1-xc31.google.com [IPv6:2607:f8b0:4864:20::c31])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B46BC3B970;
        Fri,  7 Oct 2022 11:47:20 -0700 (PDT)
Received: by mail-oo1-xc31.google.com with SMTP id h1-20020a4aa741000000b004756c611188so4083022oom.4;
        Fri, 07 Oct 2022 11:47:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=o/WJnW9TcUfMscRQFA0XCHNrFcCRMWEo3PjehOnts0Q=;
        b=a8KTNTsMTkhHx1jAUGqHAqf/6hgPQzzI7xXG4CDDMecvGVUaQ/em30Yb+HM8gtkBnu
         kugWlhAQbxkQWhnQgr9N8rTNf7dbghvi0/0L6bMDj18v7NdvoHRyO87k+oM1KcSXOaoJ
         kFcWBo8gi2M9YBTI9IL/GuL+NXakYkhOOdgJFEQ5GquOuDqIlDQ8Tg0TfgfORd0Ja3Wi
         Bmm7LeNFjQGSBsUMREzAL0nh+al+DJh9KAV3T4BeKoiBLySyQIOmsl4+Gkn1YYkw3l9i
         0DDkwafoTmh8E7SFgw4QtNWDrDCkFJCou5ET2DtVeCIPke8sGaSj2rmuZKKosbV0o0oE
         ym3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=o/WJnW9TcUfMscRQFA0XCHNrFcCRMWEo3PjehOnts0Q=;
        b=JH32xKuw9A6rtQEbgOJqmvzR2VuPGpOjYmSKomc2frEWhcrimYeoWuGjd6hw6/3Leb
         H5xOeTpca4Mrhe53/f61p9C9XL2rX3y8CZn3PDIvRt2ezKXpp/CRJmWirv0mUeqdc2Ps
         t/YM346Qq/9brRpUlWlpiYhdvGk51wd/lxpHz2Vscpa6RxqwgSBGFK6dOWf2impX5eWX
         kj+8p1I0K8OgnelANkxLpZzsx4GRXdTr/8a8Q7Bzg+Ge+vYB4kBU1Uc/JMlNWJxckqT2
         6V/xXGtrOCR5J5AdNkoSUy/+nH99Xg9rH4lcoVb2Lmj8N8gahyHdrmMs3m8wzZY2Glct
         sslQ==
X-Gm-Message-State: ACrzQf2uSl1xkyRkIMEWvj5anCdrqlK5frbX5AEnr/zv+UfFhKb3MpXl
        kD+H8n3jacHkGsYEok7nEzbRCRJzaK0=
X-Google-Smtp-Source: AMsMyM69e7scoJ5fxIc818i42gc+3/J8CpRO3EVZZ2yv4lKxsM/a4as3ucfIG1sJJozCNfer5WFkUg==
X-Received: by 2002:a4a:9506:0:b0:476:4812:3edf with SMTP id m6-20020a4a9506000000b0047648123edfmr2393936ooi.62.1665168439676;
        Fri, 07 Oct 2022 11:47:19 -0700 (PDT)
Received: from wintermute.localdomain ([76.244.6.13])
        by smtp.gmail.com with ESMTPSA id n6-20020a4ad626000000b00425806a20f5sm1267861oon.3.2022.10.07.11.47.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 07 Oct 2022 11:47:19 -0700 (PDT)
From:   Chris Morgan <macroalpha82@gmail.com>
To:     linux-input@vger.kernel.org
Cc:     devicetree@vger.kernel.org, jeff@labundy.com,
        neil.armstrong@linaro.org, arnd@arndb.de, robert.jarzmik@free.fr,
        Jonathan.Cameron@huawei.com, christianshewitt@gmail.com,
        stano.jakubek@gmail.com, rydberg@bitmath.org,
        krzysztof.kozlowski+dt@linaro.org, robh+dt@kernel.org,
        dmitry.torokhov@gmail.com, Chris Morgan <macromorgan@hotmail.com>
Subject: [PATCH v2 2/3] dt-bindings: input: touchscreen: Add Hynitron cstxxx
Date:   Fri,  7 Oct 2022 13:47:09 -0500
Message-Id: <20221007184710.6395-3-macroalpha82@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20221007184710.6395-1-macroalpha82@gmail.com>
References: <20221007184710.6395-1-macroalpha82@gmail.com>
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
now this is expected to only be compatible with the cst3xx series,
specifically the CST340, CST348, and CST356.

Signed-off-by: Chris Morgan <macromorgan@hotmail.com>
---
 .../input/touchscreen/hynitron,cstxxx.yaml    | 65 +++++++++++++++++++
 1 file changed, 65 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/input/touchscreen/hynitron,cstxxx.yaml

diff --git a/Documentation/devicetree/bindings/input/touchscreen/hynitron,cstxxx.yaml b/Documentation/devicetree/bindings/input/touchscreen/hynitron,cstxxx.yaml
new file mode 100644
index 000000000000..9cb5d4af00f7
--- /dev/null
+++ b/Documentation/devicetree/bindings/input/touchscreen/hynitron,cstxxx.yaml
@@ -0,0 +1,65 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/input/touchscreen/hynitron,cstxxx.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Hynitron cstxxx series touchscreen controller
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
+      - hynitron,cst340
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
+        compatible = "hynitron,cst340";
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

