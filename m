Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 23178DA61E
	for <lists+linux-input@lfdr.de>; Thu, 17 Oct 2019 09:13:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2405119AbfJQHM7 (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 17 Oct 2019 03:12:59 -0400
Received: from mail-wm1-f66.google.com ([209.85.128.66]:38770 "EHLO
        mail-wm1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2407967AbfJQHMq (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Thu, 17 Oct 2019 03:12:46 -0400
Received: by mail-wm1-f66.google.com with SMTP id 3so1290045wmi.3
        for <linux-input@vger.kernel.org>; Thu, 17 Oct 2019 00:12:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=2JhZXgpu4dUNgUWOnAT62hGIKmc/tHNXrxRtuYvr7w8=;
        b=nXztOB+NJP5/6TCNuxLNs7RYMG808oSa92A/hRXfjUGd8gGnl++eh3yqOqjCtoVjVo
         rsAsmLoaR31LpGitvJk1e2nrwnDV2OAoe3QZz+o7rj+OSZiCVqgdXbHo917SAldplXQ4
         Kl6q8CH/Jnh8eAK9LJIUVQHgcK4t3e+11svGbAaqs8qLx+qN0LTTBG7DA9wA0VGGrHli
         4o1Ht+uscXr/qEL+B0lD4w3tVSt0FgdIc4JoEQpyGowdSB2Fu8PGXJ2nKsHWNtUj8TEp
         X4qgdiqeMdWuqf3UNReQWZEP+rakPyrxNxUxJd5FSaK5hP4c9FiJsIdhsB8Hq/9nCuIP
         Y4sw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=2JhZXgpu4dUNgUWOnAT62hGIKmc/tHNXrxRtuYvr7w8=;
        b=qfngXGxiCVcoBk2nUDeEq9gaWqTjDi7dpPnh2F/IkT/n/I388trbtNkxDnfEF4Fshf
         F2iJjrh+Gx8vyWUrCLI9/QE5AUoNO+CLHgQd4Wlinx8+7b2mYJGn9c4MAojQDnnAC1SY
         ft3yqD1T6OHxBhLBgZGhMJQuNem8TUUbsWPpt4s2t5ppkvOSvYRiq16v+qf3ve5+ucdz
         YnnxNAXDnTtnpwjgZGxKVrlrrwgsDVZZB5d9KdUaUQkk2EIzohE+1CQ3/uTsZEww4k+3
         CGSZQfEzzZ6+wQS6xNv3VnQj/fB6pfTbjfRnUSKef2Tv1TVZVeV1KuCFuSxl/qGGOmmu
         7o+Q==
X-Gm-Message-State: APjAAAUrf5YBNtiL4vHheRB/dKw+XqZGhki7gizkm0JJyT56UXAf5gMm
        /AuwPpNj1kAU3uwSb3/rtlF9nw==
X-Google-Smtp-Source: APXvYqy1lyxMrIzO5yCkzKi/iR0u4zrnr6xf4R0o/Tonlq4e8EEQqu+rPTeRA96JRjUBhsVmWrgkaw==
X-Received: by 2002:a1c:6389:: with SMTP id x131mr1479817wmb.55.1571296364946;
        Thu, 17 Oct 2019 00:12:44 -0700 (PDT)
Received: from debian-brgl.home ([2a01:cb1d:af:5b00:6d6c:8493:1ab5:dad7])
        by smtp.gmail.com with ESMTPSA id n22sm1156689wmk.19.2019.10.17.00.12.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Oct 2019 00:12:44 -0700 (PDT)
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
Subject: [PATCH v3 4/6] dt-bindings: power: max77650: convert the binding document to yaml
Date:   Thu, 17 Oct 2019 09:12:32 +0200
Message-Id: <20191017071234.8719-5-brgl@bgdev.pl>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20191017071234.8719-1-brgl@bgdev.pl>
References: <20191017071234.8719-1-brgl@bgdev.pl>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

From: Bartosz Golaszewski <bgolaszewski@baylibre.com>

Convert the binding document for MAX77650 charger module to YAML.

Signed-off-by: Bartosz Golaszewski <bgolaszewski@baylibre.com>
Acked-by: Sebastian Reichel <sre@kernel.org>
---
 .../power/supply/max77650-charger.txt         | 28 ---------------
 .../power/supply/max77650-charger.yaml        | 34 +++++++++++++++++++
 2 files changed, 34 insertions(+), 28 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/power/supply/max77650-charger.txt
 create mode 100644 Documentation/devicetree/bindings/power/supply/max77650-charger.yaml

diff --git a/Documentation/devicetree/bindings/power/supply/max77650-charger.txt b/Documentation/devicetree/bindings/power/supply/max77650-charger.txt
deleted file mode 100644
index e6d0fb6ff94e..000000000000
--- a/Documentation/devicetree/bindings/power/supply/max77650-charger.txt
+++ /dev/null
@@ -1,28 +0,0 @@
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
diff --git a/Documentation/devicetree/bindings/power/supply/max77650-charger.yaml b/Documentation/devicetree/bindings/power/supply/max77650-charger.yaml
new file mode 100644
index 000000000000..a48054cc87cb
--- /dev/null
+++ b/Documentation/devicetree/bindings/power/supply/max77650-charger.yaml
@@ -0,0 +1,34 @@
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
-- 
2.23.0

