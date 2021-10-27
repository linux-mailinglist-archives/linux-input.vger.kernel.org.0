Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B786643C223
	for <lists+linux-input@lfdr.de>; Wed, 27 Oct 2021 07:24:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239451AbhJ0F1F (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 27 Oct 2021 01:27:05 -0400
Received: from smtp-relay-internal-0.canonical.com ([185.125.188.122]:48114
        "EHLO smtp-relay-internal-0.canonical.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S239442AbhJ0F1F (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Wed, 27 Oct 2021 01:27:05 -0400
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com [209.85.128.72])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id 7657D3F17E
        for <linux-input@vger.kernel.org>; Wed, 27 Oct 2021 05:24:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
        s=20210705; t=1635312279;
        bh=Eo1KNYomB5B/psMAwvp3+GiQBww1T+eDR3xworxqiwg=;
        h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
         MIME-Version;
        b=agl4Y5EJ9wO/XUCKR+CKPuqGASL3vtjV/XFpin5f5lPC3/WlTFOZcQU+ZtKAM0ys5
         tPjojPw4bOlmUEzy/CCg4/JGlJtgC7GqGHqXj4sQN+U6uVNz5v1zA/a2CCbDETR6bP
         MsCmNnXA+SY2Ycq8If0lTo/ZTnF/EdvhsgjffnfrkG+BQ11hAk5jw2MG1ZwC+sNYlJ
         ndHYeywENsWwHVkqFNRCsq2iK6CgcTbmA1Ekhfc7SQBFZFyJSMch1goV8Lnqf5i9ow
         1Bz7gFu0PZBuP1V7jp9eI82WC/MkEt/EhJgRfZFW/ogre1gGowMu3Z/28mRrPr1ps3
         jntjia+DrYYag==
Received: by mail-wm1-f72.google.com with SMTP id f63-20020a1c3842000000b0032a621260deso1669680wma.8
        for <linux-input@vger.kernel.org>; Tue, 26 Oct 2021 22:24:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=Eo1KNYomB5B/psMAwvp3+GiQBww1T+eDR3xworxqiwg=;
        b=rarVyqQa9BbtUC/Oqt4z43iLIDk4cXNB44e1DCRRk9MIH9vCBufIMOAFsOrkiUk4tU
         tEJ1qaGYpyk9+zJH+xwxYzM4+VNg2Cu7tB3IoFLSx98OD+sAaH8rP7jpLrg3a2z0eKxC
         k7z2CYR+c1CY6cr4FC9RD5QOyUH4ImJp/+Oau0OxR22SwucJY0Atv2jEEsVwceyzkEF1
         EUQJocC7a+XtR3fPOX86hSEP/JvxbFbP7yEbuzSr7xeieuculg3VJ5ruBR8zQlBvEkNp
         8skPsfX0GY9OZzcn2j6CVWqxhbOcriZCTs2BPWkK1ES4hZI6R94BEKlvixtZmqNeD5f2
         7Kmg==
X-Gm-Message-State: AOAM530XpcXkrXTEtlu5UpGij1NToBrthE6dLuWJIBJ3ot1ij2q1MwYO
        6bpqpNnvVJDsQw0SmnlP6B6vjL8woHvtebAwKDZMyEzdgYN8bVY47yNLBXSa8mJSPR52G2a7JUZ
        hyHkN6jMU7KTU4NN8cGxikhF1Mf8om4im5Dx5eax5
X-Received: by 2002:a5d:40c9:: with SMTP id b9mr3470760wrq.409.1635312278983;
        Tue, 26 Oct 2021 22:24:38 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzUnLgtXP7fwsmBpbZq4uAMKnnG8Wu/BF/PfKcpoJZKOb7NKHGCunTaLRZqVw5tYz5k7Z3dIw==
X-Received: by 2002:a5d:40c9:: with SMTP id b9mr3470745wrq.409.1635312278761;
        Tue, 26 Oct 2021 22:24:38 -0700 (PDT)
Received: from alex.home (lfbn-lyo-1-470-249.w2-7.abo.wanadoo.fr. [2.7.60.249])
        by smtp.gmail.com with ESMTPSA id e8sm3155758wrp.58.2021.10.26.22.24.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 26 Oct 2021 22:24:38 -0700 (PDT)
From:   Alexandre Ghiti <alexandre.ghiti@canonical.com>
To:     Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        Adam Thomson <Adam.Thomson.Opensource@diasemi.com>,
        Support Opensource <support.opensource@diasemi.com>,
        Lee Jones <lee.jones@linaro.org>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Mark Brown <broonie@kernel.org>,
        Alessandro Zummo <a.zummo@towertech.it>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Wim Van Sebroeck <wim@linux-watchdog.org>,
        Guenter Roeck <linux@roeck-us.net>,
        linux-input@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-rtc@vger.kernel.org,
        linux-watchdog@vger.kernel.org
Cc:     Alexandre Ghiti <alexandre.ghiti@canonical.com>
Subject: [PATCH 2/2] dt-bindings: Migrate DA9063 text bindings to YAML
Date:   Wed, 27 Oct 2021 07:23:23 +0200
Message-Id: <20211027052323.1788476-2-alexandre.ghiti@canonical.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20211027052323.1788476-1-alexandre.ghiti@canonical.com>
References: <20211027052323.1788476-1-alexandre.ghiti@canonical.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

DA9063 devices bindings used text format, so migrate those bindings to YAML
format before adding any new bindings.

Signed-off-by: Alexandre Ghiti <alexandre.ghiti@canonical.com>
---
 .../bindings/input/da9063-onkey.yaml          |  39 ++++++
 .../devicetree/bindings/mfd/da9063.txt        | 111 ------------------
 .../devicetree/bindings/mfd/da9063.yaml       |  98 ++++++++++++++++
 .../bindings/regulator/da9063-regulator.yaml  |  51 ++++++++
 .../devicetree/bindings/rtc/da9063-rtc.yaml   |  31 +++++
 .../bindings/watchdog/da9063-watchdog.yaml    |  31 +++++
 6 files changed, 250 insertions(+), 111 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/input/da9063-onkey.yaml
 delete mode 100644 Documentation/devicetree/bindings/mfd/da9063.txt
 create mode 100644 Documentation/devicetree/bindings/mfd/da9063.yaml
 create mode 100644 Documentation/devicetree/bindings/regulator/da9063-regulator.yaml
 create mode 100644 Documentation/devicetree/bindings/rtc/da9063-rtc.yaml
 create mode 100644 Documentation/devicetree/bindings/watchdog/da9063-watchdog.yaml

diff --git a/Documentation/devicetree/bindings/input/da9063-onkey.yaml b/Documentation/devicetree/bindings/input/da9063-onkey.yaml
new file mode 100644
index 000000000000..e49f69f7aaac
--- /dev/null
+++ b/Documentation/devicetree/bindings/input/da9063-onkey.yaml
@@ -0,0 +1,39 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/input/da9063-onkey.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: OnKey driver for Dialog DA9063/DA9063L Power Management Integrated Circuit (PMIC)
+
+maintainers:
+  - Support Opensource <support.opensource@diasemi.com>
+
+description: |
+  This module is part of the DA9063 MFD device. For more details, see
+  Documentation/devicetree/bindings/mfd/da9063.yaml.
+
+  The OnKey controller is represented as a sub-node of the PMIC node
+  on the device tree.
+
+  This node defines the OnKey settings for controlling the key
+  functionality of the device. The node should contain the compatible property
+  with the value "dlg,da9063-onkey".
+
+properties:
+  compatible:
+    const: dlg,da9063-onkey
+
+  dlg,disable-key-power:
+    description: |
+      Disable power-down using a long key-press. If this
+      entry exists the OnKey driver will remove support for the KEY_POWER key
+      press. If this entry does not exist then by default the key-press
+      triggered power down is enabled and the OnKey will support both KEY_POWER
+      and KEY_SLEEP.
+    type: boolean
+
+required:
+  - compatible
+
+additionalProperties: false
diff --git a/Documentation/devicetree/bindings/mfd/da9063.txt b/Documentation/devicetree/bindings/mfd/da9063.txt
deleted file mode 100644
index 91b79a21d403..000000000000
--- a/Documentation/devicetree/bindings/mfd/da9063.txt
+++ /dev/null
@@ -1,111 +0,0 @@
-* Dialog DA9063/DA9063L Power Management Integrated Circuit (PMIC)
-
-DA9063 consists of a large and varied group of sub-devices (I2C Only):
-
-Device                   Supply Names    Description
-------                   ------------    -----------
-da9063-regulator        :               : LDOs & BUCKs
-da9063-onkey            :               : On Key
-da9063-rtc              :               : Real-Time Clock (DA9063 only)
-da9063-watchdog         :               : Watchdog
-
-======
-
-Required properties:
-
-- compatible : Should be "dlg,da9063" or "dlg,da9063l"
-- reg : Specifies the I2C slave address (this defaults to 0x58 but it can be
-  modified to match the chip's OTP settings).
-- interrupts : IRQ line information.
-- interrupt-controller
-
-Sub-nodes:
-
-- regulators : This node defines the settings for the LDOs and BUCKs.
-  The DA9063(L) regulators are bound using their names listed below:
-
-    bcore1    : BUCK CORE1
-    bcore2    : BUCK CORE2
-    bpro      : BUCK PRO
-    bmem      : BUCK MEM
-    bio       : BUCK IO
-    bperi     : BUCK PERI
-    ldo1      : LDO_1	(DA9063 only)
-    ldo2      : LDO_2	(DA9063 only)
-    ldo3      : LDO_3
-    ldo4      : LDO_4	(DA9063 only)
-    ldo5      : LDO_5	(DA9063 only)
-    ldo6      : LDO_6	(DA9063 only)
-    ldo7      : LDO_7
-    ldo8      : LDO_8
-    ldo9      : LDO_9
-    ldo10     : LDO_10	(DA9063 only)
-    ldo11     : LDO_11
-
-  The component follows the standard regulator framework and the bindings
-  details of individual regulator device can be found in:
-  Documentation/devicetree/bindings/regulator/regulator.txt
-
-- rtc : This node defines settings for the Real-Time Clock associated with
-  the DA9063 only. The RTC is not present in DA9063L. There are currently
-  no entries in this binding, however compatible = "dlg,da9063-rtc" should
-  be added if a node is created.
-
-- onkey : This node defines the OnKey settings for controlling the key
-  functionality of the device. The node should contain the compatible property
-  with the value "dlg,da9063-onkey".
-
-  Optional onkey properties:
-
-  - dlg,disable-key-power : Disable power-down using a long key-press. If this
-    entry exists the OnKey driver will remove support for the KEY_POWER key
-    press. If this entry does not exist then by default the key-press
-    triggered power down is enabled and the OnKey will support both KEY_POWER
-    and KEY_SLEEP.
-
-- watchdog : This node defines settings for the Watchdog timer associated
-  with the DA9063 and DA9063L. There are currently no entries in this
-  binding, however compatible = "dlg,da9063-watchdog" should be added
-  if a node is created.
-
-
-Example:
-
-	pmic0: da9063@58 {
-		compatible = "dlg,da9063"
-		reg = <0x58>;
-		interrupt-parent = <&gpio6>;
-		interrupts = <11 IRQ_TYPE_LEVEL_LOW>;
-		interrupt-controller;
-
-		rtc {
-			compatible = "dlg,da9063-rtc";
-		};
-
-		wdt {
-			compatible = "dlg,da9063-watchdog";
-		};
-
-		onkey {
-			compatible = "dlg,da9063-onkey";
-			dlg,disable-key-power;
-		};
-
-		regulators {
-			DA9063_BCORE1: bcore1 {
-				regulator-name = "BCORE1";
-				regulator-min-microvolt = <300000>;
-				regulator-max-microvolt = <1570000>;
-				regulator-min-microamp = <500000>;
-				regulator-max-microamp = <2000000>;
-				regulator-boot-on;
-			};
-			DA9063_LDO11: ldo11 {
-				regulator-name = "LDO_11";
-				regulator-min-microvolt = <900000>;
-				regulator-max-microvolt = <3600000>;
-				regulator-boot-on;
-			};
-		};
-	};
-
diff --git a/Documentation/devicetree/bindings/mfd/da9063.yaml b/Documentation/devicetree/bindings/mfd/da9063.yaml
new file mode 100644
index 000000000000..f3eedf766d29
--- /dev/null
+++ b/Documentation/devicetree/bindings/mfd/da9063.yaml
@@ -0,0 +1,98 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/mfd/da9063.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Dialog DA9063/DA9063L Power Management Integrated Circuit (PMIC)
+
+maintainers:
+  - Support Opensource <support.opensource@diasemi.com>
+
+description: |
+  DA9063 consists of a large and varied group of sub-devices (I2C Only):
+
+  Device                   Supply Names    Description
+  ------                   ------------    -----------
+  da9063-regulator        :               : LDOs & BUCKs
+  da9063-onkey            :               : On Key
+  da9063-rtc              :               : Real-Time Clock (DA9063 only)
+  da9063-watchdog         :               : Watchdog
+
+properties:
+  compatible:
+    oneOf:
+      - items:
+        - enum:
+          - dlg,da9063
+          - dlg,da9063l
+
+  reg:
+    description:
+      I2C device address.
+    maxItems: 1
+
+  interrupts:
+    maxItems: 1
+
+  interrupt-controller: true
+
+  regulators:
+    $ref: ../regulator/da9063-regulator.yaml
+
+  onkey:
+    $ref: ../input/da9063-onkey.yaml
+
+  rtc:
+    $ref: ../rtc/da9063-rtc.yaml
+
+  watchdog:
+    $ref: ../watchdog/da9063-watchdog.yaml
+
+required:
+  - compatible
+  - reg
+  - interrupts
+  - interrupt-controller
+
+additionalProperties: false
+
+examples:
+  - |
+        pmic0: da9063@58 {
+                compatible = "dlg,da9063"
+                reg = <0x58>;
+                interrupt-parent = <&gpio6>;
+                interrupts = <11 IRQ_TYPE_LEVEL_LOW>;
+                interrupt-controller;
+
+                rtc {
+                        compatible = "dlg,da9063-rtc";
+                };
+
+                wdt {
+                        compatible = "dlg,da9063-watchdog";
+                };
+
+                onkey {
+                        compatible = "dlg,da9063-onkey";
+                        dlg,disable-key-power;
+                };
+
+                regulators {
+                        DA9063_BCORE1: bcore1 {
+                                regulator-name = "BCORE1";
+                                regulator-min-microvolt = <300000>;
+                                regulator-max-microvolt = <1570000>;
+                                regulator-min-microamp = <500000>;
+                                regulator-max-microamp = <2000000>;
+                                regulator-boot-on;
+                        };
+                        DA9063_LDO11: ldo11 {
+                                regulator-name = "LDO_11";
+                                regulator-min-microvolt = <900000>;
+                                regulator-max-microvolt = <3600000>;
+                                regulator-boot-on;
+                        };
+                };
+        };
diff --git a/Documentation/devicetree/bindings/regulator/da9063-regulator.yaml b/Documentation/devicetree/bindings/regulator/da9063-regulator.yaml
new file mode 100644
index 000000000000..49128cf7369e
--- /dev/null
+++ b/Documentation/devicetree/bindings/regulator/da9063-regulator.yaml
@@ -0,0 +1,51 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/regulator/da9063-regulator.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Regulator driver for Dialog DA9063/DA9063L Power Management Integrated Circuit (PMIC)
+
+maintainers:
+  - Support Opensource <support.opensource@diasemi.com>
+
+description: |
+  This module is part of the DA9063 MFD device. For more details, see
+  Documentation/devicetree/bindings/mfd/da9063.yaml.
+
+  The regulator controller is represented as a sub-node of the PMIC node
+  on the device tree.
+
+  This node defines the settings for the LDOs and BUCKs.
+  The DA9063(L) regulators are bound using their names listed below:
+
+    bcore1    : BUCK CORE1
+    bcore2    : BUCK CORE2
+    bpro      : BUCK PRO
+    bmem      : BUCK MEM
+    bio       : BUCK IO
+    bperi     : BUCK PERI
+    ldo1      : LDO_1	(DA9063 only)
+    ldo2      : LDO_2	(DA9063 only)
+    ldo3      : LDO_3
+    ldo4      : LDO_4	(DA9063 only)
+    ldo5      : LDO_5	(DA9063 only)
+    ldo6      : LDO_6	(DA9063 only)
+    ldo7      : LDO_7
+    ldo8      : LDO_8
+    ldo9      : LDO_9
+    ldo10     : LDO_10	(DA9063 only)
+    ldo11     : LDO_11
+
+  The component follows the standard regulator framework and the bindings
+  details of individual regulator device can be found in:
+  Documentation/devicetree/bindings/regulator/regulator.txt
+
+properties:
+  compatible:
+    const: dlg,da9063-regulator
+
+required:
+  - compatible
+
+additionalProperties: false
diff --git a/Documentation/devicetree/bindings/rtc/da9063-rtc.yaml b/Documentation/devicetree/bindings/rtc/da9063-rtc.yaml
new file mode 100644
index 000000000000..3db1a9e5b572
--- /dev/null
+++ b/Documentation/devicetree/bindings/rtc/da9063-rtc.yaml
@@ -0,0 +1,31 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/rtc/da9063-rtc.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: RTC driver for Dialog DA9063/DA9063L Power Management Integrated Circuit (PMIC)
+
+maintainers:
+  - Support Opensource <support.opensource@diasemi.com>
+
+description:
+  This module is part of the DA9063 MFD device. For more details, see
+  Documentation/devicetree/bindings/mfd/da9063.yaml.
+
+  The RTC controller is represented as a sub-node of the PMIC node
+  on the device tree.
+
+  This node defines settings for the Real-Time Clock associated with
+  the DA9063 only. The RTC is not present in DA9063L. There are currently
+  no entries in this binding, however compatible = "dlg,da9063-rtc" should
+  be added if a node is created.
+
+properties:
+  compatible:
+    const: dlg,da9063-rtc
+
+required:
+  - compatible
+
+additionalProperties: false
diff --git a/Documentation/devicetree/bindings/watchdog/da9063-watchdog.yaml b/Documentation/devicetree/bindings/watchdog/da9063-watchdog.yaml
new file mode 100644
index 000000000000..d3286f4c04d2
--- /dev/null
+++ b/Documentation/devicetree/bindings/watchdog/da9063-watchdog.yaml
@@ -0,0 +1,31 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/watchdog/da9063-watchdog.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Watchdog driver for Dialog DA9063/DA9063L Power Management Integrated Circuit (PMIC)
+
+maintainers:
+  - Support Opensource <support.opensource@diasemi.com>
+
+description: |
+  This module is part of the DA9063 MFD device. For more details, see
+  Documentation/devicetree/bindings/mfd/da9063.yaml.
+
+  The watchdog controller is represented as a sub-node of the PMIC node
+  on the device tree.
+
+  This node defines settings for the Watchdog timer associated
+  with the DA9063 and DA9063L. There are currently no entries in this
+  binding, however compatible = "dlg,da9063-watchdog" should be added
+  if a node is created.
+
+properties:
+  compatible:
+    const: dlg,da9063-watchdog
+
+required:
+  - compatible
+
+additionalProperties: false
-- 
2.30.2

