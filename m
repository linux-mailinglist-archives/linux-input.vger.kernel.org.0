Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C4411611B84
	for <lists+linux-input@lfdr.de>; Fri, 28 Oct 2022 22:27:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229744AbiJ1U1F (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Fri, 28 Oct 2022 16:27:05 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34050 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229766AbiJ1U1D (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Fri, 28 Oct 2022 16:27:03 -0400
Received: from mail-oa1-x32.google.com (mail-oa1-x32.google.com [IPv6:2001:4860:4864:20::32])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6CE2420DB7E;
        Fri, 28 Oct 2022 13:27:00 -0700 (PDT)
Received: by mail-oa1-x32.google.com with SMTP id 586e51a60fabf-13b23e29e36so7534870fac.8;
        Fri, 28 Oct 2022 13:27:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rDMt2JC0mFVrAyROjhYhKH6Is13/rwZg9I5xtGmlcCA=;
        b=lOSt9ttcYi3et2c6SP+VRN2rz34kMCluWHAqhHptZIQ0eQ4vt00unf7fZDpSJHYD5c
         CaqZKSuPWxk/eOuQLyZUKE/Fo8ZBN03tTUehwsOLEliucROFq1E8kInp3QjKGLt8+dTq
         v8srhrYwl5XBywYySLaeo5o2sMFGH+tpwm9+2Wp6fj782eCVumWHb+k4640qinLW3Ta7
         31Mr8cQ3WcrY5HUd8GJ5aE81VzkkoVj0c71TyKyBegst7dGAHXW2Ea/7XSOLmSST6t0q
         DJdlz5wsiFEQzjz3qxKGsKSVuzcIlEytinr9rb4XnqfUY6lkYZ7RBg90laErvwFjkQnQ
         RoPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=rDMt2JC0mFVrAyROjhYhKH6Is13/rwZg9I5xtGmlcCA=;
        b=HKSgiti/4pQpGaZ/mOotyIO64gTBsKs25UIMQOcR9e979i96oEWKDaPT/x9//zIBfL
         vgZvrLfUYiwncYhYisHBXn2AVIXMkILDjvG9/ZHoFc7wCVZ8ixwU3dMWXXn+FUeRGIpM
         bxb1UFkZVTlZWHM3V/eAmqBu7ClEBLYYxBw/BRpFIDMM9L3fNuHLNlYZS6QJ0pFfifhk
         TbCl5TbV1ImvUo2npINpx93wtzLFhjWOgMkrci3uW+1ZfMO/y/HgfmuSwWNOTNXRmBwn
         4L3R8LlrfKJJzZAcX2sIATcj5OtFqgIHrYHs1IU21FK2U5HoF5HTCd/SUVNMmXSTo/UR
         GG6w==
X-Gm-Message-State: ACrzQf09lBadEnKzOQbCs2A1bVxx0/iFyrQxYnyQfKt/tx71g/NwjO7d
        xrMoxtl1BQ2CuCG15/EUiRdNqJRlDkM=
X-Google-Smtp-Source: AMsMyM7b+OcSL4McjO7gXRrLIxiVh/sllwzLpybNMeUNEhGQy1Gvw39scszjthxGCDyQCLkRwGaMYg==
X-Received: by 2002:a05:6870:960d:b0:13b:254d:247e with SMTP id d13-20020a056870960d00b0013b254d247emr10417050oaq.237.1666988819404;
        Fri, 28 Oct 2022 13:26:59 -0700 (PDT)
Received: from wintermute.localdomain (76-244-6-13.lightspeed.rcsntx.sbcglobal.net. [76.244.6.13])
        by smtp.gmail.com with ESMTPSA id u43-20020a4a972e000000b004728e64dc0fsm1914744ooi.38.2022.10.28.13.26.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Oct 2022 13:26:58 -0700 (PDT)
From:   Chris Morgan <macroalpha82@gmail.com>
To:     linux-input@vger.kernel.org
Cc:     devicetree@vger.kernel.org, rydberg@bitmath.org,
        krzysztof.kozlowski+dt@linaro.org, robh+dt@kernel.org,
        dmitry.torokhov@gmail.com, mkorpershoek@baylibre.com,
        Chris Morgan <macromorgan@hotmail.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH V4 2/3] dt-bindings: input: touchscreen: Add Hynitron cstxxx
Date:   Fri, 28 Oct 2022 15:26:35 -0500
Message-Id: <20221028202636.14341-3-macroalpha82@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20221028202636.14341-1-macroalpha82@gmail.com>
References: <20221028202636.14341-1-macroalpha82@gmail.com>
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

