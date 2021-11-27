Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 11E9A45FEBF
	for <lists+linux-input@lfdr.de>; Sat, 27 Nov 2021 14:11:56 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1354762AbhK0NPC (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Sat, 27 Nov 2021 08:15:02 -0500
Received: from ixit.cz ([94.230.151.217]:58576 "EHLO ixit.cz"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S239495AbhK0NM7 (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Sat, 27 Nov 2021 08:12:59 -0500
Received: from localhost.localdomain (ip-89-176-96-70.net.upcbroadband.cz [89.176.96.70])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by ixit.cz (Postfix) with ESMTPSA id 7473C20064;
        Sat, 27 Nov 2021 14:09:43 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ixit.cz; s=dkim;
        t=1638018583;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding;
        bh=US+PlJt5YuBn+f6zl65VjL2KEdtWIGuDQwqGvr+BSqk=;
        b=C03XU15udkdTbf1mtk64f8XDQ9LsyfeKw1plCkHHQ3csM0DfNyI4tBXpzGdkh1xA5A4Joo
        vhr5p8mNhn6aEahgsS+D3vRRomijXRFjCeDT+ii9JOHexTWbpTZyvzymx/jTVTk1IH2y2R
        lnqVmCsshHXfKUlcpY/9iVKpGJYSzd4=
From:   David Heidelberg <david@ixit.cz>
To:     Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        Sebastian Reichel <sre@kernel.org>
Cc:     ~okias/devicetree@lists.sr.ht, David Heidelberg <david@ixit.cz>,
        linux-input@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH] dt-bindings: input: pwm-vibrator: Convert txt bindings to yaml
Date:   Sat, 27 Nov 2021 14:09:40 +0100
Message-Id: <20211127130941.38684-1-david@ixit.cz>
X-Mailer: git-send-email 2.33.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Converts txt binding to new YAML format and simplify example.

Signed-off-by: David Heidelberg <david@ixit.cz>
---
 .../bindings/input/pwm-vibrator.txt           | 66 -------------------
 .../bindings/input/pwm-vibrator.yaml          | 59 +++++++++++++++++
 2 files changed, 59 insertions(+), 66 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/input/pwm-vibrator.txt
 create mode 100644 Documentation/devicetree/bindings/input/pwm-vibrator.yaml

diff --git a/Documentation/devicetree/bindings/input/pwm-vibrator.txt b/Documentation/devicetree/bindings/input/pwm-vibrator.txt
deleted file mode 100644
index 88c775a3fe21..000000000000
--- a/Documentation/devicetree/bindings/input/pwm-vibrator.txt
+++ /dev/null
@@ -1,66 +0,0 @@
-* PWM vibrator device tree bindings
-
-Registers a PWM device as vibrator. It is expected, that the vibrator's
-strength increases based on the duty cycle of the enable PWM channel
-(100% duty cycle meaning strongest vibration, 0% meaning no vibration).
-
-The binding supports an optional direction PWM channel, that can be
-driven at fixed duty cycle. If available this is can be used to increase
-the vibration effect of some devices.
-
-Required properties:
-- compatible: should contain "pwm-vibrator"
-- pwm-names: Should contain "enable" and optionally "direction"
-- pwms: Should contain a PWM handle for each entry in pwm-names
-
-Optional properties:
-- vcc-supply: Phandle for the regulator supplying power
-- direction-duty-cycle-ns: Duty cycle of the direction PWM channel in
-                           nanoseconds, defaults to 50% of the channel's
-			   period.
-
-Example from Motorola Droid 4:
-
-&omap4_pmx_core {
-	vibrator_direction_pin: pinmux_vibrator_direction_pin {
-		pinctrl-single,pins = <
-		OMAP4_IOPAD(0x1ce, PIN_OUTPUT | MUX_MODE1) /* dmtimer8_pwm_evt (gpio_27) */
-		>;
-	};
-
-	vibrator_enable_pin: pinmux_vibrator_enable_pin {
-		pinctrl-single,pins = <
-		OMAP4_IOPAD(0X1d0, PIN_OUTPUT | MUX_MODE1) /* dmtimer9_pwm_evt (gpio_28) */
-		>;
-	};
-};
-
-/ {
-	pwm8: dmtimer-pwm {
-		pinctrl-names = "default";
-		pinctrl-0 = <&vibrator_direction_pin>;
-
-		compatible = "ti,omap-dmtimer-pwm";
-		#pwm-cells = <3>;
-		ti,timers = <&timer8>;
-		ti,clock-source = <0x01>;
-	};
-
-	pwm9: dmtimer-pwm {
-		pinctrl-names = "default";
-		pinctrl-0 = <&vibrator_enable_pin>;
-
-		compatible = "ti,omap-dmtimer-pwm";
-		#pwm-cells = <3>;
-		ti,timers = <&timer9>;
-		ti,clock-source = <0x01>;
-	};
-
-	vibrator {
-		compatible = "pwm-vibrator";
-		pwms = <&pwm9 0 1000000000 0>,
-                       <&pwm8 0 1000000000 0>;
-		pwm-names = "enable", "direction";
-		direction-duty-cycle-ns = <1000000000>;
-	};
-};
diff --git a/Documentation/devicetree/bindings/input/pwm-vibrator.yaml b/Documentation/devicetree/bindings/input/pwm-vibrator.yaml
new file mode 100644
index 000000000000..ec2466c63fe6
--- /dev/null
+++ b/Documentation/devicetree/bindings/input/pwm-vibrator.yaml
@@ -0,0 +1,59 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: "http://devicetree.org/schemas/input/pwm-vibrator.yaml#"
+$schema: "http://devicetree.org/meta-schemas/core.yaml#"
+
+title: PWM vibrator
+
+maintainers:
+  - Sebastian Reichel <sre@kernel.org>
+
+description: >
+  Registers a PWM device as vibrator. It is expected, that the vibrator's
+  strength increases based on the duty cycle of the enable PWM channel
+  (100% duty cycle meaning strongest vibration, 0% meaning no vibration).
+
+  The binding supports an optional direction PWM channel, that can be
+  driven at fixed duty cycle. If available this is can be used to increase
+  the vibration effect of some devices.
+
+properties:
+  compatible:
+    const: pwm-vibrator
+
+  pwm-names:
+    anyOf:
+      - items:
+          - const: enable
+      - items:
+          - const: enable
+          - const: direction
+
+  pwms:
+    minItems: 1
+    maxItems: 2
+
+  vcc-supply: true
+
+  direction-duty-cycle-ns:
+    description: >
+      Duty cycle of the direction PWM channel in nanoseconds,
+      defaults to 50% of the channel's period.
+
+required:
+  - compatible
+  - pwm-names
+  - pwms
+
+additionalProperties: false
+
+examples:
+  - |
+    vibrator {
+        compatible = "pwm-vibrator";
+        pwms = <&pwm9 0 1000000000 0>,
+               <&pwm8 0 1000000000 0>;
+        pwm-names = "enable", "direction";
+        direction-duty-cycle-ns = <1000000000>;
+    };
-- 
2.33.0

