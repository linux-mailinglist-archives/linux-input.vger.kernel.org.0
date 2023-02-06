Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B3A9368BEBC
	for <lists+linux-input@lfdr.de>; Mon,  6 Feb 2023 14:50:59 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230305AbjBFNus (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 6 Feb 2023 08:50:48 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53604 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230525AbjBFNuf (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Mon, 6 Feb 2023 08:50:35 -0500
Received: from mail-qt1-x82e.google.com (mail-qt1-x82e.google.com [IPv6:2607:f8b0:4864:20::82e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B3DBE252BE;
        Mon,  6 Feb 2023 05:50:17 -0800 (PST)
Received: by mail-qt1-x82e.google.com with SMTP id h24so12730721qta.12;
        Mon, 06 Feb 2023 05:50:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=L6uVVIDWDMsCSFQLILis/DJgYmwxhPs3uU4Pp+RwuOM=;
        b=QgEPBKlAP0Nb+KY4nNP1RfnZfXkujCDbvkvIc8Ctxg3boGN925uZWEtKPg0PHw4zZ2
         URaem5rgIe0+NFz4k+ZRYsrN1PrjHfiFnt/Yhquhh22Bisliq9BoZRfeD4YDnDlf8K+a
         NdiwhiajmhvIYN1F4I0nH1d8NSVZqsDISuaN4Af52f3mVtNpSih+sJY3dYWchbKNe4oD
         c9Mzm9BJ3NkqEufV0LTYhTa2blWjHnBJmnD+hdJM352wC08BkS6gZim+mSHrY8WwVmz2
         1uw2gvCluK/Au+CAkomTpadbX8g+bhz3jWY+6Us++mIFJw8GJLjSZqgRR2yLl4A97H4d
         hFEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=L6uVVIDWDMsCSFQLILis/DJgYmwxhPs3uU4Pp+RwuOM=;
        b=dwSiKNF4G2R/WKTd1gpx1UU9HLRagSdiPeURtiz+/v8RvDyHVCmkZy21H1sFKARiq/
         jcRPT7wtrG6KWWdhzGurrZvyCpa6TdNO+CTMl3rluLHVQIEBsQnIFdodcJ/fh4SVWDyM
         /XY298NQqO0n+zXRsMcqUd1rVtFmY1qB+3YeMFvomtq4FYKB253PNP6OWiDXmZrPnWOx
         uA52kh2Xo8dqaqwdaUgqVNAxiak4dBERci8zuFtTwl40yr9hmEnT44f2Qf5RVbf6WT2m
         kil7iOJaw0ZQuysgJclRFqMqh9p3wF2peMKLlypUP5hUQONL6FHGmtvC81cKcIFS3eAC
         QdWg==
X-Gm-Message-State: AO0yUKU3DxdyTzKXbzn/Dw/QMKw+nmznwAvZpZhAdmdlBPULSCo8eV9X
        yvzJIVFUUQyGeBmKlz2frWg=
X-Google-Smtp-Source: AK7set/FyAoqW2QrtDuXDoNMFUF0UOEPbbLod86SLlRySTJTJuIGdz3UIYYbWnwX2rvAiQQBriaQkw==
X-Received: by 2002:ac8:5955:0:b0:3b6:2bb3:fb53 with SMTP id 21-20020ac85955000000b003b62bb3fb53mr35598467qtz.16.1675691416639;
        Mon, 06 Feb 2023 05:50:16 -0800 (PST)
Received: from DANNY-DESKTOP.localdomain (071-013-243-092.res.spectrum.com. [71.13.243.92])
        by smtp.gmail.com with ESMTPSA id ed4-20020a05620a490400b007195af894e7sm7349492qkb.76.2023.02.06.05.50.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Feb 2023 05:50:16 -0800 (PST)
From:   Danny Kaehn <kaehndan@gmail.com>
To:     robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
        jikos@kernel.org, benjamin.tissoires@redhat.com
Cc:     devicetree@vger.kernel.org, linux-input@vger.kernel.org,
        ethan.twardy@plexus.com
Subject: [PATCH v4 1/4] dt-bindings: i2c: Add CP2112 HID USB to SMBus Bridge
Date:   Mon,  6 Feb 2023 07:50:13 -0600
Message-Id: <20230206135016.6737-2-kaehndan@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230206135016.6737-1-kaehndan@gmail.com>
References: <20230206135016.6737-1-kaehndan@gmail.com>
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
 .../bindings/i2c/silabs,cp2112.yaml           | 112 ++++++++++++++++++
 1 file changed, 112 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/i2c/silabs,cp2112.yaml

diff --git a/Documentation/devicetree/bindings/i2c/silabs,cp2112.yaml b/Documentation/devicetree/bindings/i2c/silabs,cp2112.yaml
new file mode 100644
index 000000000000..286e4dbafd69
--- /dev/null
+++ b/Documentation/devicetree/bindings/i2c/silabs,cp2112.yaml
@@ -0,0 +1,112 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/i2c/silabs,cp2112.yaml#
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
+    unevaluatedProperties: false
+    properties:
+      clock-frequency:
+        minimum: 10000
+        default: 100000
+        maximum: 400000
+
+  gpio:
+    description: The GPIO controller node for the CP2112
+    type: object
+    properties:
+      interrupt-controller: true
+      "#interrupt-cells":
+        const: 2
+
+      gpio-controller: true
+      "#gpio-cells":
+        const: 2
+
+      ngpios:
+        const: 8
+
+      gpio-line-names:
+        minItems: 1
+        maxItems: 8
+
+    patternProperties:
+      "^(hog-[0-9]+|.+-hog(-[0-9]+)?)$":
+        type: object
+        properties:
+          gpio-hog: true
+          input: true
+          output-high: true
+          output-low: true
+          line-name: true
+          gpios:
+            minItems: 1
+            maxItems: 8
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
+          gpio-line-names = "TEST0", "TEST1", "TEST2",
+            "TEST3", "TEST4", "TEST5", "TEST6", "TEST7";
+        };
+      };
+    };
-- 
2.25.1

