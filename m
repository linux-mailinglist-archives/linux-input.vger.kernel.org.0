Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 64695C2128
	for <lists+linux-input@lfdr.de>; Mon, 30 Sep 2019 15:03:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731121AbfI3NDP (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 30 Sep 2019 09:03:15 -0400
Received: from mail-wm1-f67.google.com ([209.85.128.67]:38517 "EHLO
        mail-wm1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731105AbfI3NDH (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Mon, 30 Sep 2019 09:03:07 -0400
Received: by mail-wm1-f67.google.com with SMTP id 3so12653412wmi.3
        for <linux-input@vger.kernel.org>; Mon, 30 Sep 2019 06:03:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=zCXYF953/vPYwz7eiQFUSs/AEguNESyV96474n4IASY=;
        b=Nf+gaIXC0Ge/0BwRg9S/STvB6+9x02OEyJfwicPnb2ADufpdrmo1vfw+tYoQLsxxJ5
         5J4EjdPlP0rFxxFSexrYwZzTo5oXdX5EwgyQfHg9F21ZI9v8b1j4wtWm6C0VIUNaVB7f
         z2hYt7MBqAbNQkf+phMS5i3LywrehGo3y8a5z1RaPZ82gsF/Bx2JD+DMo6vou7CPXzQN
         sya1shbs/pjzjbzKs/nJ488uwxA1KCYAeLAuoz6h+eKPxL+q+fvymMKKxpOJ5LcM2xQ5
         3lSJJtz8j500+wft6PJYCtXXQ0QVa7CIuyQJOBbLKodGskE+BYV1vVN5uBLG3an/yC6E
         C99Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=zCXYF953/vPYwz7eiQFUSs/AEguNESyV96474n4IASY=;
        b=hw3I+K35+rOYHCI76l0iGFFPjgDI5Yy2ej/h2Tn6Jyu0XBxhGu5k1jx76Xst38ouip
         p4LC99mzFid4zn/iXI8czqu4XEHR2SRxkvQW2MMW0jv1vD6CdUa54Y2HPSRMQ6egrh90
         uQFMZ0tc6SNcHGg7F48jSPl1i5ZeLerckUtRxwloZPdE9QP5M8yKcduFHccvPCQmLtYK
         n+By54K/N2bgoXD40nh95nsOPY9vT4ErVUTXezzv5X43YoZIk5YOJO5a5DbYt3NwMoWZ
         2qvzYLrBzxygLffMgB6A4nkRdCUkz/UappTcR0rxFHAr27ieNBNR+WqYYUOQWegy/J0K
         rthw==
X-Gm-Message-State: APjAAAUmvUQSrMTWcdWyxTVQ6dNevPATBa19/PmXfEyQWKjIFZR1pCD7
        D7sOFgp+YgOL08hZFl8eIdLCsw==
X-Google-Smtp-Source: APXvYqx2obH7hRkkN4bY0nbY+Nu/cmpaQYw5+2PMIJMC3OXw+Li14HL6JkwFIeJb93ckMDFPY5G6tA==
X-Received: by 2002:a05:600c:238a:: with SMTP id m10mr18382086wma.51.1569848583334;
        Mon, 30 Sep 2019 06:03:03 -0700 (PDT)
Received: from localhost.localdomain (amontpellier-652-1-281-69.w109-210.abo.wanadoo.fr. [109.210.96.69])
        by smtp.gmail.com with ESMTPSA id e6sm10654756wrp.91.2019.09.30.06.03.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Sep 2019 06:03:02 -0700 (PDT)
From:   Bartosz Golaszewski <brgl@bgdev.pl>
To:     Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Jacek Anaszewski <jacek.anaszewski@gmail.com>,
        Pavel Machek <pavel@ucw.cz>, Dan Murphy <dmurphy@ti.com>,
        Lee Jones <lee.jones@linaro.org>,
        Sebastian Reichel <sre@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Mark Brown <broonie@kernel.org>
Cc:     linux-input@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-leds@vger.kernel.org,
        linux-pm@vger.kernel.org,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>
Subject: [PATCH 5/6] dt-bindings: leds: max77650: convert the binding document to yaml
Date:   Mon, 30 Sep 2019 15:02:45 +0200
Message-Id: <20190930130246.4860-6-brgl@bgdev.pl>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20190930130246.4860-1-brgl@bgdev.pl>
References: <20190930130246.4860-1-brgl@bgdev.pl>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

From: Bartosz Golaszewski <bgolaszewski@baylibre.com>

Convert the binding document for max77650 LED module to yaml.

Signed-off-by: Bartosz Golaszewski <bgolaszewski@baylibre.com>
---
 .../bindings/leds/leds-max77650.txt           | 58 +------------
 .../bindings/leds/leds-max77650.yaml          | 82 +++++++++++++++++++
 2 files changed, 83 insertions(+), 57 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/leds/leds-max77650.yaml

diff --git a/Documentation/devicetree/bindings/leds/leds-max77650.txt b/Documentation/devicetree/bindings/leds/leds-max77650.txt
index 3a67115cc1da..33d6ff23f0ef 100644
--- a/Documentation/devicetree/bindings/leds/leds-max77650.txt
+++ b/Documentation/devicetree/bindings/leds/leds-max77650.txt
@@ -1,57 +1 @@
-LED driver for MAX77650 PMIC from Maxim Integrated.
-
-This module is part of the MAX77650 MFD device. For more details
-see Documentation/devicetree/bindings/mfd/max77650.txt.
-
-The LED controller is represented as a sub-node of the PMIC node on
-the device tree.
-
-This device has three current sinks.
-
-Required properties:
---------------------
-- compatible:		Must be "maxim,max77650-led"
-- #address-cells:	Must be <1>.
-- #size-cells:		Must be <0>.
-
-Each LED is represented as a sub-node of the LED-controller node. Up to
-three sub-nodes can be defined.
-
-Required properties of the sub-node:
-------------------------------------
-
-- reg:			Must be <0>, <1> or <2>.
-
-Optional properties of the sub-node:
-------------------------------------
-
-- label:		See Documentation/devicetree/bindings/leds/common.txt
-- linux,default-trigger: See Documentation/devicetree/bindings/leds/common.txt
-
-For more details, please refer to the generic GPIO DT binding document
-<devicetree/bindings/gpio/gpio.txt>.
-
-Example:
---------
-
-	leds {
-		compatible = "maxim,max77650-led";
-		#address-cells = <1>;
-		#size-cells = <0>;
-
-		led@0 {
-			reg = <0>;
-			label = "blue:usr0";
-		};
-
-		led@1 {
-			reg = <1>;
-			label = "red:usr1";
-			linux,default-trigger = "heartbeat";
-		};
-
-		led@2 {
-			reg = <2>;
-			label = "green:usr2";
-		};
-	};
+This file has been moved to leds-max77650.yaml.
diff --git a/Documentation/devicetree/bindings/leds/leds-max77650.yaml b/Documentation/devicetree/bindings/leds/leds-max77650.yaml
new file mode 100644
index 000000000000..bb541ff67f80
--- /dev/null
+++ b/Documentation/devicetree/bindings/leds/leds-max77650.yaml
@@ -0,0 +1,82 @@
+# SPDX-License-Identifier: GPL-2.0
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/leds/leds-max77650.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: LED driver for MAX77650 PMIC from Maxim Integrated.
+
+maintainers:
+  - Bartosz Golaszewski <bgolaszewski@baylibre.com>
+
+description: |
+  This module is part of the MAX77650 MFD device. For more details
+  see Documentation/devicetree/bindings/mfd/max77650.txt.
+
+  The LED controller is represented as a sub-node of the PMIC node on
+  the device tree.
+
+  This device has three current sinks.
+
+properties:
+  compatible:
+    const: maxim,max77650-led
+
+  "#address-cells":
+    const: 1
+
+  "#size-cells":
+    const: 0
+
+patternProperties:
+  "^led@[0-2]$":
+    type: object
+    description: |
+      Properties for a single LED.
+
+    properties:
+      reg:
+        description:
+          Index of the LED.
+        maxItems: 1
+        minimum: 0
+        maximum: 2
+
+      label:
+        $ref: "/schemas/types.yaml#/definitions/string"
+        description:
+          The label of this LED.
+
+      linux,default-trigger:
+        $ref: "/schemas/types.yaml#/definitions/string"
+        description:
+          String defining the default trigger assigned to this LED.
+
+required:
+  - compatible
+  - "#address-cells"
+  - "#size-cells"
+
+examples:
+  - |
+    leds {
+        compatible = "maxim,max77650-led";
+        #address-cells = <1>;
+        #size-cells = <0>;
+
+        led@0 {
+            reg = <0>;
+            label = "blue:usr0";
+        };
+
+        led@1 {
+            reg = <1>;
+            label = "red:usr1";
+            linux,default-trigger = "heartbeat";
+        };
+
+        led@2 {
+            reg = <2>;
+            label = "green:usr2";
+        };
+    };
-- 
2.23.0

