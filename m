Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id F073CC2134
	for <lists+linux-input@lfdr.de>; Mon, 30 Sep 2019 15:03:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731159AbfI3NDZ (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 30 Sep 2019 09:03:25 -0400
Received: from mail-wm1-f67.google.com ([209.85.128.67]:53269 "EHLO
        mail-wm1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731091AbfI3NDE (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Mon, 30 Sep 2019 09:03:04 -0400
Received: by mail-wm1-f67.google.com with SMTP id i16so13322957wmd.3
        for <linux-input@vger.kernel.org>; Mon, 30 Sep 2019 06:03:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=r1biT3z4HmAvefafF9uIXaOf/W/MJzkBlJwoZ49uPn4=;
        b=Jo/WBmAF7Fx7KoQj04IyncOX+koFGrFGMhNCzZnkJrgWepLEcOtKzJoXvX4A/vSdBx
         aYLxRpb3bFqb4Y2UoUHhlbcrbnuA7iqopq09y4Sjq3tfr30KCoNaACPdrlcrDGQ96xF5
         5eGlPPR0Ay1nXoOE30DU2fuoYr32rkhblV5QukBhpg/4cr6yd7QAtT/WfBo4f00gloEg
         9KMC1Ky9gpXU+DFRTZllk/woqnzdb56JLSoeSYATshVlSY+/shvpmS0F8LOGlEHqWuBP
         qHIeeAwiKajIC4VyOPwQIKiWGRs4ugl/7LS1TRFqMNin5sugUHHpK1L1BSZfK6KGPEyf
         5ZoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=r1biT3z4HmAvefafF9uIXaOf/W/MJzkBlJwoZ49uPn4=;
        b=ntijuPeswt9NFzVGQA6uNN8i4hl1Y7uvTFNHA/lVRoA/CkndMw0vEtSZcjo5aN9D0K
         LbHseZQ/aOxmBXFltQ4uIk1wFjm8p5bPGAnUH7BzWpdRJHm0EWeHtNJH+3yDw1rqXmpd
         G1UqlO59snt5ZkNxOuSU9EInD4hPN5GdfAmHFnrrgtbLqiMXea3717mlct+gwt3/ERG4
         D8oEMhtMwD8/QOYcIvWs6hGJvrOdVvqLrh/IzL+TffBn/kyDXYwFI3VCY4wGnCJkzo8b
         jB8/C3WrKxX7DkTt1OB0lhGcOmGca+yeOTA1kZjWWo3yl1yzAbXhXUhtt33+LJP82nXB
         4Z0A==
X-Gm-Message-State: APjAAAUBaKXMMgh3F2rP3HbcIaqEUJGZl+G6i02qNjF3Yadxo00TT/Hq
        egjDsw0H2dEBvDZe+Q2G/lhlfQ==
X-Google-Smtp-Source: APXvYqyUiRHOSL+ukTU1KeQ0u0W4UWcc3iXtjoPGnJT3uuv36m3JieAsjCXuI8JIrKnrGzsep8fgxg==
X-Received: by 2002:a7b:c10b:: with SMTP id w11mr16341237wmi.108.1569848582114;
        Mon, 30 Sep 2019 06:03:02 -0700 (PDT)
Received: from localhost.localdomain (amontpellier-652-1-281-69.w109-210.abo.wanadoo.fr. [109.210.96.69])
        by smtp.gmail.com with ESMTPSA id e6sm10654756wrp.91.2019.09.30.06.03.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Sep 2019 06:03:01 -0700 (PDT)
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
Subject: [PATCH 4/6] dt-bindings: power: max77650: convert the binding document to yaml
Date:   Mon, 30 Sep 2019 15:02:44 +0200
Message-Id: <20190930130246.4860-5-brgl@bgdev.pl>
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

Convert the binding document for max77650 charger module to yaml.

Signed-off-by: Bartosz Golaszewski <bgolaszewski@baylibre.com>
---
 .../power/supply/max77650-charger.txt         | 29 +------------
 .../power/supply/max77650-charger.yaml        | 42 +++++++++++++++++++
 2 files changed, 43 insertions(+), 28 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/power/supply/max77650-charger.yaml

diff --git a/Documentation/devicetree/bindings/power/supply/max77650-charger.txt b/Documentation/devicetree/bindings/power/supply/max77650-charger.txt
index e6d0fb6ff94e..fbab7d3ac8e3 100644
--- a/Documentation/devicetree/bindings/power/supply/max77650-charger.txt
+++ b/Documentation/devicetree/bindings/power/supply/max77650-charger.txt
@@ -1,28 +1 @@
-Battery charger driver for MAX77650 PMIC from Maxim Integrated.
-
-This module is part of the MAX77650 MFD device. For more details
-see Documentation/devicetree/bindings/mfd/max77650.txt.
-
-The charger is represented as a sub-node of the PMIC node on the device tree.
-
-Required properties:
---------------------
-- compatible:		Must be "maxim,max77650-charger"
-
-Optional properties:
---------------------
-- input-voltage-min-microvolt:	Minimum CHGIN regulation voltage. Must be one
-				of: 4000000, 4100000, 4200000, 4300000,
-				4400000, 4500000, 4600000, 4700000.
-- input-current-limit-microamp:	CHGIN input current limit (in microamps). Must
-				be one of: 95000, 190000, 285000, 380000,
-				475000.
-
-Example:
---------
-
-	charger {
-		compatible = "maxim,max77650-charger";
-		input-voltage-min-microvolt = <4200000>;
-		input-current-limit-microamp = <285000>;
-	};
+This file was moved to max77650-charger.yaml.
diff --git a/Documentation/devicetree/bindings/power/supply/max77650-charger.yaml b/Documentation/devicetree/bindings/power/supply/max77650-charger.yaml
new file mode 100644
index 000000000000..9dd0dad0f948
--- /dev/null
+++ b/Documentation/devicetree/bindings/power/supply/max77650-charger.yaml
@@ -0,0 +1,42 @@
+# SPDX-License-Identifier: GPL-2.0
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/power/supply/max77650-charger.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Battery charger driver for MAX77650 PMIC from Maxim Integrated.
+
+maintainers:
+  - Bartosz Golaszewski <bgolaszewski@baylibre.com>
+
+description: |
+  This module is part of the MAX77650 MFD device. For more details
+  see Documentation/devicetree/bindings/mfd/max77650.txt.
+
+  The charger is represented as a sub-node of the PMIC node on the device tree.
+
+properties:
+  compatible:
+    const: maxim,max77650-charger
+
+  input-voltage-min-microvolt:
+    description:
+      Minimum CHGIN regulation voltage.
+    enum: [ 4000000, 4100000, 4200000, 4300000,
+            4400000, 4500000, 4600000, 4700000 ]
+
+  input-current-limit-microamp:
+    description:
+      CHGIN input current limit (in microamps).
+    enum: [ 95000, 190000, 285000, 380000, 475000 ]
+
+required:
+  - compatible
+
+examples:
+  - |
+    charger {
+        compatible = "maxim,max77650-charger";
+        input-voltage-min-microvolt = <4200000>;
+        input-current-limit-microamp = <285000>;
+    };
-- 
2.23.0

