Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C84275FA12E
	for <lists+linux-input@lfdr.de>; Mon, 10 Oct 2022 17:35:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229653AbiJJPfc (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 10 Oct 2022 11:35:32 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52936 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229769AbiJJPfa (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Mon, 10 Oct 2022 11:35:30 -0400
Received: from mail-oa1-x33.google.com (mail-oa1-x33.google.com [IPv6:2001:4860:4864:20::33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9B90E61DAC;
        Mon, 10 Oct 2022 08:35:28 -0700 (PDT)
Received: by mail-oa1-x33.google.com with SMTP id 586e51a60fabf-132fb4fd495so12826648fac.12;
        Mon, 10 Oct 2022 08:35:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rDMt2JC0mFVrAyROjhYhKH6Is13/rwZg9I5xtGmlcCA=;
        b=UItFxc/jeflr7JQQ1Bu9ZG16dxITUYQYgGw5c2uK28fO8azKfiRw3gn165yCb4zUoO
         one13+76aKIf80vkul+2jYHoxeRbpBdWi3irdFR0DicC2ATQu7mOUxuH+4WRuns9orqD
         xjnVlai6oMzzekAedKOIPBW6kQa+N38rQLfdxSxHls0p3f0siiWERh4wooVLut6K9AQB
         fPGrCxNKeP97hpCxUJLZarIpFvGRb4StsyCyUOGtNus3hWvuiwT7eglMuwipI+tKIhpu
         Fw0ZIShJHWqz2/KjIi1dUjwls+p99CW24j8tmFr9BKcWWJ0O8lLl57CdciOazTt+HZ80
         oHIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=rDMt2JC0mFVrAyROjhYhKH6Is13/rwZg9I5xtGmlcCA=;
        b=ss86qgU15lntzKI0MtHkvKnWkfPR0iuYzQsdXrWnqrDOnjR6WpBRaSf52vDnKmTrL3
         vzCZzFdDgJbxyvqMFUklyqWNrNbfct2mWYar77nqTdVxO2iPKihSoHlOxeYT3Sz+hY1x
         ZHELISGfxuecafasGBJtTs8N3NeJvoV7WoHz53bQeqfQGb1THBynT6rk0+sxIdg6bTj0
         11D+kO14sHTvGv00K5G7ncouFO0D8q+w4R8ZHXKbH+h4R4PaRVV+Uzy0Xe4xjDko6MGT
         BT1fAyMKwMMBHuwKoz16z1v1ni99cOL7Wu4aCftr+qrLAfb5T3HxMGlqi7LZn3SadSuo
         D6RA==
X-Gm-Message-State: ACrzQf1xHZckFyD5ySGbMhcZ97tExdMEo8TAly9GZMArr9HeitQdp4Nj
        38hgkFmTRHBuTaktq84IUUjnOYcJiKo=
X-Google-Smtp-Source: AMsMyM6fDqjPlgXi3n8zWPU8SuT72f3SPhMFocYWyAn646wQQ9vGsElpIl2ZQVezSzhKLdRRilV9yw==
X-Received: by 2002:a05:6870:f116:b0:136:9add:7857 with SMTP id k22-20020a056870f11600b001369add7857mr2519706oac.117.1665416127633;
        Mon, 10 Oct 2022 08:35:27 -0700 (PDT)
Received: from wintermute.localdomain (76-244-6-13.lightspeed.rcsntx.sbcglobal.net. [76.244.6.13])
        by smtp.gmail.com with ESMTPSA id a2-20020a056870d18200b0013125e6a60fsm5264309oac.58.2022.10.10.08.35.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Oct 2022 08:35:27 -0700 (PDT)
From:   Chris Morgan <macroalpha82@gmail.com>
To:     linux-input@vger.kernel.org
Cc:     devicetree@vger.kernel.org, jeff@labundy.com,
        neil.armstrong@linaro.org, arnd@arndb.de, robert.jarzmik@free.fr,
        Jonathan.Cameron@huawei.com, christianshewitt@gmail.com,
        stano.jakubek@gmail.com, rydberg@bitmath.org,
        krzysztof.kozlowski+dt@linaro.org, robh+dt@kernel.org,
        dmitry.torokhov@gmail.com, Chris Morgan <macromorgan@hotmail.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH v3 2/3] dt-bindings: input: touchscreen: Add Hynitron cstxxx
Date:   Mon, 10 Oct 2022 10:35:21 -0500
Message-Id: <20221010153522.17503-3-macroalpha82@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20221010153522.17503-1-macroalpha82@gmail.com>
References: <20221010153522.17503-1-macroalpha82@gmail.com>
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
Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
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

