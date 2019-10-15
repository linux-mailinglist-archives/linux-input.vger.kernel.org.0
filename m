Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 7E8E8D7B34
	for <lists+linux-input@lfdr.de>; Tue, 15 Oct 2019 18:23:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387937AbfJOQXN (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 15 Oct 2019 12:23:13 -0400
Received: from mail-wr1-f66.google.com ([209.85.221.66]:32980 "EHLO
        mail-wr1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2387895AbfJOQXL (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Tue, 15 Oct 2019 12:23:11 -0400
Received: by mail-wr1-f66.google.com with SMTP id b9so24654831wrs.0
        for <linux-input@vger.kernel.org>; Tue, 15 Oct 2019 09:23:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=ecEOVvVQZ5mhgGBjJTEl6lzO4iyftGF76AQ8D8ASw0U=;
        b=JjbUuwJYLYkmaYLE3E1Naa7+ymQjSaxbTCuq7NqsIOslNMK1UzZApQlcxyPrAs3Xsg
         g+hJCLRf9ebxqZ3+T/L9BSqaRA9nbk6Sg8FwFL3SURrpjMRh4N1+qc08uEIkMjAtMOpx
         JK3/tpfBW/qMsbcd7nDWQBIL7wkmAQAtFi8h2w1jpTl2RKiAmguLRZGjiKfuFc2ZcQpZ
         3988pWa6ByvglVVp986DA1VDl9A//7ZNTjJ7ZuLLE+KU1wLqVX547kxLQsxYR3BDvcZb
         EiwxEAAPVM2rW/4xatzJlFlGBk+tZphrA7NyVEX5hd87b+0MuGmdrWzP4qBi5gUhAgpG
         AacA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=ecEOVvVQZ5mhgGBjJTEl6lzO4iyftGF76AQ8D8ASw0U=;
        b=s8WxPHs4WVL+rJmozqnWNJMjLdwtDomNKdLHnJj3DP2enSsyYGP35pmrhBkl8Av1Wy
         y2MUpQjlZ71fFmORLdbom+v+AetMcIkC+X16L3HafhHU2EjDzpHd/qK2afa9J0UGmNVB
         Z4DE0chO/rlLOYTO+EnqsQt6SYvBxw7EDBejU5q6pagtJsHMqAkNhPIGK8eJjDn3UIz0
         AQkRtmDZoH6ed+5NSCPs3ha1o6g3BZPuKgySFsw4szQE/oYugS4eaXQjXDGaHicg0Njq
         o7bt94Ajra00a/swXke+FPiHrrnK51ULJNn50WgNVToF9d0upnqfp5xGMcpkZOF4sJ/D
         yCIQ==
X-Gm-Message-State: APjAAAUw/wikQqwZqnTmFQhZYflEN/nOacNthKqSgZ36Se8iira1DEun
        1K1GWEHD+lMKuHGtKXXewGLvFw==
X-Google-Smtp-Source: APXvYqxTlGURckyxe8xKZFHfyXGsEZKiq+XZ4jbSogIXJ1MlJzGRolqXijrT94s+bwmwdElCnbuoYg==
X-Received: by 2002:adf:f64f:: with SMTP id x15mr10732927wrp.381.1571156588511;
        Tue, 15 Oct 2019 09:23:08 -0700 (PDT)
Received: from debian-brgl.home ([2a01:cb1d:af:5b00:6d6c:8493:1ab5:dad7])
        by smtp.gmail.com with ESMTPSA id x129sm41427605wmg.8.2019.10.15.09.23.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Oct 2019 09:23:07 -0700 (PDT)
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
Subject: [PATCH v2 2/6] dt-bindings: input: max77650: convert the binding document to yaml
Date:   Tue, 15 Oct 2019 18:22:56 +0200
Message-Id: <20191015162300.22024-3-brgl@bgdev.pl>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20191015162300.22024-1-brgl@bgdev.pl>
References: <20191015162300.22024-1-brgl@bgdev.pl>
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
 .../bindings/input/max77650-onkey.txt         | 27 +-----------
 .../bindings/input/max77650-onkey.yaml        | 43 +++++++++++++++++++
 2 files changed, 44 insertions(+), 26 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/input/max77650-onkey.yaml

diff --git a/Documentation/devicetree/bindings/input/max77650-onkey.txt b/Documentation/devicetree/bindings/input/max77650-onkey.txt
index 477dc74f452a..a691fc49f1ea 100644
--- a/Documentation/devicetree/bindings/input/max77650-onkey.txt
+++ b/Documentation/devicetree/bindings/input/max77650-onkey.txt
@@ -1,26 +1 @@
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
+This file has been moved to max77650-onkey.yaml.
diff --git a/Documentation/devicetree/bindings/input/max77650-onkey.yaml b/Documentation/devicetree/bindings/input/max77650-onkey.yaml
new file mode 100644
index 000000000000..eb2f8609bae2
--- /dev/null
+++ b/Documentation/devicetree/bindings/input/max77650-onkey.yaml
@@ -0,0 +1,43 @@
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
+
+examples:
+  - |
+    onkey {
+        compatible = "maxim,max77650-onkey";
+        linux,code = <KEY_END>;
+        maxim,onkey-slide;
+    };
-- 
2.23.0

