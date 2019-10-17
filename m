Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4B34DDA60D
	for <lists+linux-input@lfdr.de>; Thu, 17 Oct 2019 09:12:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2407943AbfJQHMo (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 17 Oct 2019 03:12:44 -0400
Received: from mail-wr1-f65.google.com ([209.85.221.65]:45537 "EHLO
        mail-wr1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2407947AbfJQHMo (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Thu, 17 Oct 2019 03:12:44 -0400
Received: by mail-wr1-f65.google.com with SMTP id r5so984505wrm.12
        for <linux-input@vger.kernel.org>; Thu, 17 Oct 2019 00:12:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=3bOb1AKJG3bDEr1FgpNlaFfI94OCjr2yDrXcaaBRNYg=;
        b=h5cjymHanIeuqRg2f6PHLWtTKxGIGeWwYBrxDn3dqeqUrRXvmQ/H/EJ7fdKo0WYEvX
         zMvQs7GZUv5bR5yySSUIxjbhoOXJhKsbhE5Yd7Fz/BLWglt/fMjYsUq4YIFCYFE8SuF/
         lLJbAhtCdBdoafQN7L+NLeRCYjbEnNzkKxN6WX6i//uKhyiTaMJwR8bQ8OiUi7XBglcU
         JrvMnRLys1v0LcebJJRuYsEJuW6GQP1elTy8W6Ts79uwFTg9Xc7fGDNNNPZ2N61AL41T
         xUgd6AgLY/QujzlTleid8OOXnNmZspRAU82+jbJqUA1MlvRDU5tkCX/zSR8bSa5oduX5
         GNsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=3bOb1AKJG3bDEr1FgpNlaFfI94OCjr2yDrXcaaBRNYg=;
        b=kKkusIrP4CsrDDE4Jew7g4BELY2CYz/MAMwXgfoOcTeg/CCPDvOXdsCQ2ZZmaWzE00
         Lhnuh7jwfJNPIJdof/jVnXNbHtJAKCgGaSQhzoxBKXDEpn2AvRh0Mh4N7Q2NozZZh2nh
         qy+a+tktze1vyru765+7oFfKM+OAz3Tp0xWwv7fNfkXizezgQvXrbxBk9ZZ72yYv842x
         6i0PvGUn1uBnvg54g1Q76/x/FhOLQE/d5uLBWGygeKZr4l4KVaYpSSWWLe30+y/gP8mn
         ks6vL/BKceY6G3pGQVRay6fjHtjAHptMBeOwcpMxsoufL1hJN02afWF1UvNJXt8KeVBh
         AEgw==
X-Gm-Message-State: APjAAAVP6i73OgSbbfgbT+4fL04bTfX5sLPq1qTQzruYdr54pcwkdhuC
        u1Z0ASW2QOHkt3b07ms+EvI1Dg==
X-Google-Smtp-Source: APXvYqz55R/u66x2hhzpqDGgG8BwQelWQK9VRVJUp9ocyDd81uTXM8KarRo/wU7uHDUUsX8/LzGOsA==
X-Received: by 2002:adf:fc42:: with SMTP id e2mr1730108wrs.100.1571296362163;
        Thu, 17 Oct 2019 00:12:42 -0700 (PDT)
Received: from debian-brgl.home ([2a01:cb1d:af:5b00:6d6c:8493:1ab5:dad7])
        by smtp.gmail.com with ESMTPSA id n22sm1156689wmk.19.2019.10.17.00.12.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Oct 2019 00:12:40 -0700 (PDT)
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
Subject: [PATCH v3 2/6] dt-bindings: input: max77650: convert the binding document to yaml
Date:   Thu, 17 Oct 2019 09:12:30 +0200
Message-Id: <20191017071234.8719-3-brgl@bgdev.pl>
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

Convert the binding document for MAX77650 onkey module to YAML.

Signed-off-by: Bartosz Golaszewski <bgolaszewski@baylibre.com>
---
 .../bindings/input/max77650-onkey.txt         | 26 --------------
 .../bindings/input/max77650-onkey.yaml        | 35 +++++++++++++++++++
 2 files changed, 35 insertions(+), 26 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/input/max77650-onkey.txt
 create mode 100644 Documentation/devicetree/bindings/input/max77650-onkey.yaml

diff --git a/Documentation/devicetree/bindings/input/max77650-onkey.txt b/Documentation/devicetree/bindings/input/max77650-onkey.txt
deleted file mode 100644
index 477dc74f452a..000000000000
--- a/Documentation/devicetree/bindings/input/max77650-onkey.txt
+++ /dev/null
@@ -1,26 +0,0 @@
-Onkey driver for MAX77650 PMIC from Maxim Integrated.
-
-This module is part of the MAX77650 MFD device. For more details
-see Documentation/devicetree/bindings/mfd/max77650.txt.
-
-The onkey controller is represented as a sub-node of the PMIC node on
-the device tree.
-
-Required properties:
---------------------
-- compatible:		Must be "maxim,max77650-onkey".
-
-Optional properties:
-- linux,code:		The key-code to be reported when the key is pressed.
-			Defaults to KEY_POWER.
-- maxim,onkey-slide:	The system's button is a slide switch, not the default
-			push button.
-
-Example:
---------
-
-	onkey {
-		compatible = "maxim,max77650-onkey";
-		linux,code = <KEY_END>;
-		maxim,onkey-slide;
-	};
diff --git a/Documentation/devicetree/bindings/input/max77650-onkey.yaml b/Documentation/devicetree/bindings/input/max77650-onkey.yaml
new file mode 100644
index 000000000000..2f2e0b6ebbbd
--- /dev/null
+++ b/Documentation/devicetree/bindings/input/max77650-onkey.yaml
@@ -0,0 +1,35 @@
+# SPDX-License-Identifier: GPL-2.0
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/input/max77650-onkey.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Onkey driver for MAX77650 PMIC from Maxim Integrated.
+
+maintainers:
+  - Bartosz Golaszewski <bgolaszewski@baylibre.com>
+
+description: |
+  This module is part of the MAX77650 MFD device. For more details
+  see Documentation/devicetree/bindings/mfd/max77650.yaml.
+
+  The onkey controller is represented as a sub-node of the PMIC node on
+  the device tree.
+
+properties:
+  compatible:
+    const: maxim,max77650-onkey
+
+  linux,code:
+    $ref: /schemas/types.yaml#/definitions/uint32
+    description:
+      The key-code to be reported when the key is pressed. Defaults
+      to KEY_POWER.
+
+  maxim,onkey-slide:
+    $ref: /schemas/types.yaml#/definitions/flag
+    description:
+      The system's button is a slide switch, not the default push button.
+
+required:
+  - compatible
-- 
2.23.0

