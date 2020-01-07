Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B91E9132721
	for <lists+linux-input@lfdr.de>; Tue,  7 Jan 2020 14:09:36 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728117AbgAGNJS (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 7 Jan 2020 08:09:18 -0500
Received: from mx08-00178001.pphosted.com ([91.207.212.93]:22522 "EHLO
        mx07-00178001.pphosted.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1728060AbgAGNJM (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Tue, 7 Jan 2020 08:09:12 -0500
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
        by mx08-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id 007D3eN4013503;
        Tue, 7 Jan 2020 14:09:07 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com; h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-type; s=STMicroelectronics;
 bh=HLx9i+/0RPKX4a7BkgUwWOWfGGEAfQSWOkgkflG2r0M=;
 b=gMQSYVxksKZfuCBlyHU2XMPwd09renYbNWAi0ymzPCaIMToquL5BV9ENr7NriH7OPCDi
 aOu+M3T0XNi0o/pTiS41LdHLlaX64Jq1v1z8RV/kRJojjvK4Kz6zW3HcMcebVwU9gr9G
 29R1mfGhkChS7P9xC1w29zrfSu+xof3b8egpF5eGLNy4og1iW7+/pj1gT3NzH4aC65bU
 m6HHqa9W/6KnP6jia6Pobycw/O/X/Evi8X3wMroeb0PPzKLD/KGeQbWb1D65MZfSXeKO
 zkHaemXx9tKtT19QRXtCjHQIMQebty2r5dB5hIdy2TyieHNNMJNA9qNnV/iDM44bV82o 9w== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
        by mx08-00178001.pphosted.com with ESMTP id 2xakkape5v-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Tue, 07 Jan 2020 14:09:07 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
        by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id CB9E110002A;
        Tue,  7 Jan 2020 14:09:06 +0100 (CET)
Received: from Webmail-eu.st.com (sfhdag3node3.st.com [10.75.127.9])
        by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id C016A2AD9ED;
        Tue,  7 Jan 2020 14:09:06 +0100 (CET)
Received: from localhost (10.75.127.49) by SFHDAG3NODE3.st.com (10.75.127.9)
 with Microsoft SMTP Server (TLS) id 15.0.1347.2; Tue, 7 Jan 2020 14:09:06
 +0100
From:   Benjamin Gaignard <benjamin.gaignard@st.com>
To:     <dmitry.torokhov@gmail.com>, <robh+dt@kernel.org>,
        <mark.rutland@arm.com>
CC:     <linux-input@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <yannick.fertre@st.com>,
        Benjamin Gaignard <benjamin.gaignard@st.com>
Subject: [PATCH 2/2] dt-bindings: touchscreen: Convert Goodix touchscreen to json-schema
Date:   Tue, 7 Jan 2020 14:09:03 +0100
Message-ID: <20200107130903.14421-3-benjamin.gaignard@st.com>
X-Mailer: git-send-email 2.15.0
In-Reply-To: <20200107130903.14421-1-benjamin.gaignard@st.com>
References: <20200107130903.14421-1-benjamin.gaignard@st.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.75.127.49]
X-ClientProxiedBy: SFHDAG8NODE1.st.com (10.75.127.22) To SFHDAG3NODE3.st.com
 (10.75.127.9)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.95,18.0.572
 definitions=2020-01-07_03:2020-01-06,2020-01-07 signatures=0
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Convert the Goodix binding to DT schema format using json-schema

Signed-off-by: Benjamin Gaignard <benjamin.gaignard@st.com>
---
 .../bindings/input/touchscreen/goodix.txt          | 50 ----------------
 .../bindings/input/touchscreen/goodix.yaml         | 69 ++++++++++++++++++++++
 2 files changed, 69 insertions(+), 50 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/input/touchscreen/goodix.txt
 create mode 100644 Documentation/devicetree/bindings/input/touchscreen/goodix.yaml

diff --git a/Documentation/devicetree/bindings/input/touchscreen/goodix.txt b/Documentation/devicetree/bindings/input/touchscreen/goodix.txt
deleted file mode 100644
index fc03ea4cf5ab..000000000000
--- a/Documentation/devicetree/bindings/input/touchscreen/goodix.txt
+++ /dev/null
@@ -1,50 +0,0 @@
-Device tree bindings for Goodix GT9xx series touchscreen controller
-
-Required properties:
-
- - compatible		: Should be "goodix,gt1151"
-				 or "goodix,gt5663"
-				 or "goodix,gt5688"
-				 or "goodix,gt911"
-				 or "goodix,gt9110"
-				 or "goodix,gt912"
-				 or "goodix,gt927"
-				 or "goodix,gt9271"
-				 or "goodix,gt928"
-				 or "goodix,gt967"
- - reg			: I2C address of the chip. Should be 0x5d or 0x14
- - interrupts		: Interrupt to which the chip is connected
-
-Optional properties:
-
- - irq-gpios		: GPIO pin used for IRQ. The driver uses the
-			  interrupt gpio pin as output to reset the device.
- - reset-gpios		: GPIO pin used for reset
- - AVDD28-supply	: Analog power supply regulator on AVDD28 pin
- - VDDIO-supply		: GPIO power supply regulator on VDDIO pin
- - touchscreen-inverted-x
- - touchscreen-inverted-y
- - touchscreen-size-x
- - touchscreen-size-y
- - touchscreen-swapped-x-y
-
-The touchscreen-* properties are documented in touchscreen.txt in this
-directory.
-
-Example:
-
-	i2c@00000000 {
-		/* ... */
-
-		gt928@5d {
-			compatible = "goodix,gt928";
-			reg = <0x5d>;
-			interrupt-parent = <&gpio>;
-			interrupts = <0 0>;
-
-			irq-gpios = <&gpio1 0 0>;
-			reset-gpios = <&gpio1 1 0>;
-		};
-
-		/* ... */
-	};
diff --git a/Documentation/devicetree/bindings/input/touchscreen/goodix.yaml b/Documentation/devicetree/bindings/input/touchscreen/goodix.yaml
new file mode 100644
index 000000000000..05b52d359ac5
--- /dev/null
+++ b/Documentation/devicetree/bindings/input/touchscreen/goodix.yaml
@@ -0,0 +1,69 @@
+# SPDX-License-Identifier: GPL-2.0
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/input/touchscreen/goodix.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Goodix GT9xx series touchscreen controller Bindings
+
+maintainers:
+  - Dmitry Torokhov <dmitry.torokhov@gmail.com>
+
+allOf:
+  - $ref: touchscreen.yaml#
+
+properties:
+  compatible:
+    enum:
+      - goodix,gt1151
+      - goodix,gt5663
+      - goodix,gt5688
+      - goodix,gt911
+      - goodix,gt9110
+      - goodix,gt912
+      - goodix,gt927
+      - goodix,gt9271
+      - goodix,gt928
+      - goodix,gt967
+
+  reg:
+    maxItems: 1
+
+  interrupts:
+    maxItems: 1
+
+  irq-gpios:
+    maxItems: 1
+
+  reset-gpios:
+    maxItems: 1
+
+  AVDD28-supply:
+    description: Analog power supply regulator on AVDD28 pin
+
+  VDDIO-supply:
+    description: GPIO power supply regulator on VDDIO pin
+
+additionalProperties: false
+
+required:
+  - compatible
+  - reg
+  - interrupts
+
+examples:
+- |
+    i2c@00000000 {
+      #address-cells = <1>;
+      #size-cells = <0>;
+      gt928@5d {
+        compatible = "goodix,gt928";
+        reg = <0x5d>;
+        interrupt-parent = <&gpio>;
+        interrupts = <0 0>;
+        irq-gpios = <&gpio1 0 0>;
+        reset-gpios = <&gpio1 1 0>;
+      };
+    };
+
+...
-- 
2.15.0

