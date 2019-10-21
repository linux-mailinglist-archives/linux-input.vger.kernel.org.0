Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 5D0EDDEC97
	for <lists+linux-input@lfdr.de>; Mon, 21 Oct 2019 14:44:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728841AbfJUMol (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 21 Oct 2019 08:44:41 -0400
Received: from mail-wm1-f67.google.com ([209.85.128.67]:53625 "EHLO
        mail-wm1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728827AbfJUMol (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Mon, 21 Oct 2019 08:44:41 -0400
Received: by mail-wm1-f67.google.com with SMTP id i16so13168235wmd.3
        for <linux-input@vger.kernel.org>; Mon, 21 Oct 2019 05:44:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=Y7gENDxapt1vI6u/xEHM9T0bQ8UH+GWKfmCLbv4CxrI=;
        b=N3K6Ornt7pVIdC7MOhYN8b5+hpGvtXx5FMdIjNZGjFHAS/cW4aEbX8MP3dEIi+DYEM
         d6JpBo4Oxb+FrN4/KDdcxikUxOl9ABTtBHaHIVMGYs8+lA/UEgOp7SCOFtPR7qqN2dMw
         MUdwwA2lJtgfVxwZl4Z6aNm5tsB4o34qXsKSuoPUypi7wPVkkWAFBkCU/+U1zF7caUa7
         aGwX+oH2PAMc0n4WNW64kbw/eLYDQY+oZCZVi9Dl4veWXZBdLDM+0ZYdQq8EcFcTejrY
         5jTE9ihlV3laSEl/b2hx9QNLEjDDpX/0JiIeiQgLbQDE5q/W0Wgu0Kr/rEOQMtPenB4H
         hpYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=Y7gENDxapt1vI6u/xEHM9T0bQ8UH+GWKfmCLbv4CxrI=;
        b=BrfNan1vUW+pShfb+ZQRYs37g/3QgtA+saf9Ks2u7+yjExo+evA+MigRybDtNpP7hI
         czWKExMwgH3bNhHLWMqylYMiXoO6/mcLRCxJZZIU8SHR2ZEvyPtksXvaKAxwZIrgYifl
         k7hV3Q14/tZ8Ppwgx6il0mhZBa8ltO7HHZ0o5blmV8Zf0qZ5Vj6invs/Ht7oAT5K/VXG
         Y/6NKagBbEcV2sxiD+Qyeh0aLxKLYryfXke1HgvePuVgSJ3bDgeWzQ/lpL5czhpBozI3
         83Co5L42sRGvyJNBEwUPvIDoig7Lga95IfECCK5qjU3TwjtutSvnbeLv4J4XXkUElryD
         GeCQ==
X-Gm-Message-State: APjAAAWFyuchiw5W5c9hUlHlUeA0DnApx/EA9ybqY9iZnHAc54MixmNf
        oTeN+SL6oE4x5WT98OcKm0U7Hg==
X-Google-Smtp-Source: APXvYqwyNHJlB1bT6Tqad/TuwHhp9berZIcmnpf54K+K8JcEPD6zvRbkcKunc9knaM3MzsTcqfVyvA==
X-Received: by 2002:a1c:7311:: with SMTP id d17mr17985960wmb.49.1571661878539;
        Mon, 21 Oct 2019 05:44:38 -0700 (PDT)
Received: from debian-brgl.home ([2a01:cb1d:af:5b00:6d6c:8493:1ab5:dad7])
        by smtp.gmail.com with ESMTPSA id a17sm10216150wmb.8.2019.10.21.05.44.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Oct 2019 05:44:38 -0700 (PDT)
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
Subject: [PATCH v4 4/6] dt-bindings: leds: max77650: convert the binding document to yaml
Date:   Mon, 21 Oct 2019 14:44:26 +0200
Message-Id: <20191021124428.2541-5-brgl@bgdev.pl>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20191021124428.2541-1-brgl@bgdev.pl>
References: <20191021124428.2541-1-brgl@bgdev.pl>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

From: Bartosz Golaszewski <bgolaszewski@baylibre.com>

Convert the binding document for MAX77650 LED module to YAML.

Signed-off-by: Bartosz Golaszewski <bgolaszewski@baylibre.com>
---
 .../bindings/leds/leds-max77650.txt           | 57 -------------------
 .../bindings/leds/leds-max77650.yaml          | 51 +++++++++++++++++
 2 files changed, 51 insertions(+), 57 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/leds/leds-max77650.txt
 create mode 100644 Documentation/devicetree/bindings/leds/leds-max77650.yaml

diff --git a/Documentation/devicetree/bindings/leds/leds-max77650.txt b/Documentation/devicetree/bindings/leds/leds-max77650.txt
deleted file mode 100644
index 3a67115cc1da..000000000000
--- a/Documentation/devicetree/bindings/leds/leds-max77650.txt
+++ /dev/null
@@ -1,57 +0,0 @@
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
diff --git a/Documentation/devicetree/bindings/leds/leds-max77650.yaml b/Documentation/devicetree/bindings/leds/leds-max77650.yaml
new file mode 100644
index 000000000000..8c43f1e1bf7d
--- /dev/null
+++ b/Documentation/devicetree/bindings/leds/leds-max77650.yaml
@@ -0,0 +1,51 @@
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
+  see Documentation/devicetree/bindings/mfd/max77650.yaml.
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
+        minimum: 0
+        maximum: 2
+
+      label: true
+
+      linux,default-trigger: true
+
+required:
+  - compatible
+  - "#address-cells"
+  - "#size-cells"
-- 
2.23.0

