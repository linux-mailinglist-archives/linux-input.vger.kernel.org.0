Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9F2F468A83B
	for <lists+linux-input@lfdr.de>; Sat,  4 Feb 2023 05:43:21 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232165AbjBDEnT (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Fri, 3 Feb 2023 23:43:19 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36516 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229436AbjBDEnS (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Fri, 3 Feb 2023 23:43:18 -0500
Received: from mail-qt1-x82a.google.com (mail-qt1-x82a.google.com [IPv6:2607:f8b0:4864:20::82a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6B7861E5F6;
        Fri,  3 Feb 2023 20:43:16 -0800 (PST)
Received: by mail-qt1-x82a.google.com with SMTP id h24so7790066qta.12;
        Fri, 03 Feb 2023 20:43:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Hq7S589pClfngh7atm5SDuJU0tnsjL6477RHSbC1eCc=;
        b=lSUCzyVjxohX6Vu2Zf9hV9RtosSVY89T1IjM93Fw46PDasvbpRkNo4v3ZlheULgBFz
         Q0PLRWuYrYoXj8gqtBeAHmYBUkfP97c64LnvzGLU4iQl5a+ZiGpW3zgazcga14OzGYNr
         vU2/do49nN7AdFLKlGoN9NabjTZBwuIYrZhLFoyU9WuhEl6xYZ1ryuyU5aPsVdOy3ZT4
         QM34LxOBlhhDcavvXvcP2lDQkam50vr8kr4k47YITwRvVF+Af+dCGjxZtVlftqH5NSZZ
         SmFOofH32isc4BzW8SQauABd/Fv/OLzNh9tlDsuWDOLBjDxK2VwI9+k1WVrF5MLFuHrj
         flWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Hq7S589pClfngh7atm5SDuJU0tnsjL6477RHSbC1eCc=;
        b=QmI6F/9aysCSq2P+PSjHhNiUvVglh5Mk/5OVMeHF/ljpElV+M5/o99QDXgbYmBoSBc
         F1FkwFVQqTa73+8bGcRmATVOBjvOAB5MzIw7TAPhC7UXULOiVvYm49DJ9bEjgJqH+VhR
         gkIAMyOu4DzhJIu9K9dRcoous2NTvNhbFju+rvMBzjZs0ER85Wm5y2qjpgjzVF9FYcdh
         fSCp2Y/FHlSh51daSAIdjoVUw2/PBDoy3rWUabhTzRKLKe7qaRhJyVMrEd5fdxj8zehi
         4QanduLLtAhnSG+Fdr9NLhmXHKnl6W+EV9yxRRDyiqxfsBIlw8emTPgjZh8g7rQg3UQ5
         Ceww==
X-Gm-Message-State: AO0yUKXdAnFBtjXTmwHScdhUo7emrQjYviFa2RjGpnLlS61yELvAJP/m
        72ZIan5u8THg5s1W6uwU1talrGy9AMvffQ==
X-Google-Smtp-Source: AK7set/W6rwpWoRzmpmnmMD2oQlPjWNT+rbZPA6g2ongw0rqRFDDJO64ykkraORYlTd6YJMOnmOL+Q==
X-Received: by 2002:a05:622a:148b:b0:3b9:c153:f169 with SMTP id t11-20020a05622a148b00b003b9c153f169mr18739750qtx.0.1675485795400;
        Fri, 03 Feb 2023 20:43:15 -0800 (PST)
Received: from DANNY-DESKTOP.localdomain (071-013-243-092.res.spectrum.com. [71.13.243.92])
        by smtp.gmail.com with ESMTPSA id l23-20020ac84597000000b003b85ed59fa2sm2882135qtn.50.2023.02.03.20.43.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Feb 2023 20:43:15 -0800 (PST)
From:   Danny Kaehn <kaehndan@gmail.com>
To:     robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
        jikos@kernel.org, benjamin.tissoires@redhat.com
Cc:     devicetree@vger.kernel.org, linux-input@vger.kernel.org,
        ethan.twardy@plexus.com
Subject: [PATCH v2 1/4] dt-bindings: input: Add CP2112 HID USB to SMBus Bridge
Date:   Fri,  3 Feb 2023 22:43:10 -0600
Message-Id: <20230204044313.364-2-kaehndan@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230204044313.364-1-kaehndan@gmail.com>
References: <20230204044313.364-1-kaehndan@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

This is a USB HID device which includes an I2C controller and 8 GPIO pins.

The binding allows describing the chip's gpio and i2c controller in DT
using the subnodes named "gpio" and "i2c", respectively. This is
intended to be used in configurations where the CP2112 is permanently
connected in hardware.

Signed-off-by: Danny Kaehn <kaehndan@gmail.com>
---
 .../bindings/input/silabs,cp2112.yaml         | 114 ++++++++++++++++++
 1 file changed, 114 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/input/silabs,cp2112.yaml

diff --git a/Documentation/devicetree/bindings/input/silabs,cp2112.yaml b/Documentation/devicetree/bindings/input/silabs,cp2112.yaml
new file mode 100644
index 000000000000..a8d7f8aea6c2
--- /dev/null
+++ b/Documentation/devicetree/bindings/input/silabs,cp2112.yaml
@@ -0,0 +1,114 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/input/silabs,cp2112.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: CP2112 HID USB to SMBus/I2C Bridge
+
+maintainers:
+  - Danny Kaehn <kaehndan@gmail.com>
+
+description:
+  The CP2112 is a USB HID device which includes an integrated I2C controller
+  and 8 GPIO pins. Its GPIO pins can each be configured as inputs, open-drain
+  outputs, or push-pull outputs.
+
+properties:
+  compatible:
+    const: usb10c4,ea90
+
+  reg:
+    maxItems: 1
+    description: The USB port number on the host controller
+
+  i2c:
+    description: The SMBus/I2C controller node for the CP2112
+    $ref: /schemas/i2c/i2c-controller.yaml#
+
+    properties:
+      clock-frequency:
+        minimum: 10000
+        default: 100000
+        maximum: 400000
+
+  gpio:
+    description: The GPIO controller node for the CP2112
+    $ref: /schemas/gpio/gpio.yaml#
+
+    properties:
+      interrupt-controller: true
+      '#interrupt-cells':
+        const: 2
+
+      gpio-controller: true
+      "#gpio-cells":
+        const: 2
+
+      ngpios:
+        const: 8
+
+    patternProperties:
+      "^(hog-[0-9]+|.+-hog(-[0-9]+)?)$":
+        type: object
+        properties:
+          gpio-hog: true
+          gpios: true
+          input: true
+          output-high: true
+          output-low: true
+          line-name: true
+
+        required:
+          - gpio-hog
+          - gpios
+
+        additionalProperties: false
+
+    unevaluatedProperties: false
+
+required:
+  - compatible
+  - reg
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/input/input.h>
+    #include <dt-bindings/interrupt-controller/irq.h>
+
+    usb {
+      #address-cells = <1>;
+      #size-cells = <0>;
+
+      device@1 {
+        compatible = "usb10c4,ea90";
+        reg = <1>;
+
+        i2c {
+          #address-cells = <1>;
+          #size-cells = <0>;
+
+          temp@48 {
+            compatible = "national,lm75";
+            reg = <0x48>;
+          };
+        };
+
+        gpio {
+          gpio-controller;
+          interrupt-controller;
+          #gpio-cells = <2>;
+          gpio-line-names =
+            "TEST0",
+            "TEST1",
+            "TEST2",
+            "TEST3",
+            "TEST4",
+            "TEST5",
+            "TEST6",
+            "TEST7";
+        };
+      };
+    };
-- 
2.25.1

