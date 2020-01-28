Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 5CC8414B260
	for <lists+linux-input@lfdr.de>; Tue, 28 Jan 2020 11:15:20 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726199AbgA1KPL (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 28 Jan 2020 05:15:11 -0500
Received: from mx07-00178001.pphosted.com ([62.209.51.94]:2814 "EHLO
        mx07-00178001.pphosted.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1725926AbgA1KPK (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Tue, 28 Jan 2020 05:15:10 -0500
Received: from pps.filterd (m0046668.ppops.net [127.0.0.1])
        by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id 00SA4Bsx006239;
        Tue, 28 Jan 2020 11:15:01 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com; h=from : to : cc : subject
 : date : message-id : mime-version : content-type :
 content-transfer-encoding; s=STMicroelectronics;
 bh=XPDA0YgYv7szrLllt+wbRgbm7tyir48cuHVcJnA9Q/c=;
 b=Urb2AZSyG2CvPWwNfyY6Ynk1ANzLuRA0K+Hlf3NPhAiStpTUdf3+05RVjgWyaQZMZ6fI
 dlt5u7/kUeYb6j0JbgfSxseSUgvRRVEjDcztwPjx3PoKMxdIgXfXC1PUE9upBqXrZUwg
 bvKXTUqaK+/u7WvYCy0Esmu7OxiH2Rb2oSOkYYuBjn4pj3css1H9F9iObU5xwVK+GUsF
 Jxas4tMPpPlgoPByWFjAZ8JWZ+iG4sqF+vZsmT1vhRBZMDfhEZqMSlq329RiVvKR8V+q
 4AebQvCMm8dpnv405Rnm9HrchH6ewKJ1aG3ibq7QRNgCaIf6VqElVulIi4AS30RCIP+E Fg== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
        by mx07-00178001.pphosted.com with ESMTP id 2xrc1359ch-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Tue, 28 Jan 2020 11:15:01 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
        by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 6A6F110002A;
        Tue, 28 Jan 2020 11:15:00 +0100 (CET)
Received: from Webmail-eu.st.com (sfhdag3node3.st.com [10.75.127.9])
        by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 3A49F21ED06;
        Tue, 28 Jan 2020 11:15:00 +0100 (CET)
Received: from localhost (10.75.127.46) by SFHDAG3NODE3.st.com (10.75.127.9)
 with Microsoft SMTP Server (TLS) id 15.0.1347.2; Tue, 28 Jan 2020 11:14:59
 +0100
From:   Benjamin Gaignard <benjamin.gaignard@st.com>
To:     <dmitry.torokhov@gmail.com>, <robh+dt@kernel.org>,
        <mark.rutland@arm.com>, <megous@megous.com>,
        <mylene.josserand@bootlin.com>
CC:     <linux-input@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>,
        Benjamin Gaignard <benjamin.gaignard@st.com>
Subject: [PATCH] dt-bindings: touchscreen: Convert edt-ft5x06 to json-schema
Date:   Tue, 28 Jan 2020 11:14:55 +0100
Message-ID: <20200128101455.4635-1-benjamin.gaignard@st.com>
X-Mailer: git-send-email 2.15.0
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.75.127.46]
X-ClientProxiedBy: SFHDAG2NODE2.st.com (10.75.127.5) To SFHDAG3NODE3.st.com
 (10.75.127.9)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138,18.0.572
 definitions=2020-01-28_02:2020-01-24,2020-01-28 signatures=0
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Convert the EDT-FT5x06 to DT schema using json-schema.

Signed-off-by: Benjamin Gaignard <benjamin.gaignard@st.com>
---
 .../bindings/input/touchscreen/edt-ft5x06.txt      |  75 -------------
 .../bindings/input/touchscreen/edt-ft5x06.yaml     | 119 +++++++++++++++++++++
 2 files changed, 119 insertions(+), 75 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/input/touchscreen/edt-ft5x06.txt
 create mode 100644 Documentation/devicetree/bindings/input/touchscreen/edt-ft5x06.yaml

diff --git a/Documentation/devicetree/bindings/input/touchscreen/edt-ft5x06.txt b/Documentation/devicetree/bindings/input/touchscreen/edt-ft5x06.txt
deleted file mode 100644
index 0f6950073d6f..000000000000
--- a/Documentation/devicetree/bindings/input/touchscreen/edt-ft5x06.txt
+++ /dev/null
@@ -1,75 +0,0 @@
-FocalTech EDT-FT5x06 Polytouch driver
-=====================================
-
-There are 5 variants of the chip for various touch panel sizes
-FT5206GE1  2.8" .. 3.8"
-FT5306DE4  4.3" .. 7"
-FT5406EE8  7"   .. 8.9"
-FT5506EEG  7"   .. 8.9"
-FT5726NEI  5.7” .. 11.6"
-
-The software interface is identical for all those chips, so that
-currently there is no need for the driver to distinguish between the
-different chips. Nevertheless distinct compatible strings are used so
-that a distinction can be added if necessary without changing the DT
-bindings.
-
-
-Required properties:
- - compatible:  "edt,edt-ft5206"
-           or:  "edt,edt-ft5306"
-           or:  "edt,edt-ft5406"
-           or:  "edt,edt-ft5506"
-           or:  "evervision,ev-ft5726"
-           or:  "focaltech,ft6236"
-
- - reg:         I2C slave address of the chip (0x38)
- - interrupts:       interrupt specification for the touchdetect
-                     interrupt
-
-Optional properties:
- - reset-gpios: GPIO specification for the RESET input
- - wake-gpios:  GPIO specification for the WAKE input
- - vcc-supply:  Regulator that supplies the touchscreen
-
- - pinctrl-names: should be "default"
- - pinctrl-0:   a phandle pointing to the pin settings for the
-                control gpios
-
- - threshold:   allows setting the "click"-threshold in the range
-                from 0 to 80.
-
- - gain:        allows setting the sensitivity in the range from 0 to
-                31. Note that lower values indicate higher
-                sensitivity.
-
- - offset:      allows setting the edge compensation in the range from
-                0 to 31.
-
- - offset-x:    Same as offset, but applies only to the horizontal position.
-                Range from 0 to 80, only supported by evervision,ev-ft5726
-                devices.
-
- - offset-y:    Same as offset, but applies only to the vertical position.
-                Range from 0 to 80, only supported by evervision,ev-ft5726
-                devices.
-
- - touchscreen-size-x	   : See touchscreen.txt
- - touchscreen-size-y	   : See touchscreen.txt
- - touchscreen-fuzz-x      : See touchscreen.txt
- - touchscreen-fuzz-y      : See touchscreen.txt
- - touchscreen-inverted-x  : See touchscreen.txt
- - touchscreen-inverted-y  : See touchscreen.txt
- - touchscreen-swapped-x-y : See touchscreen.txt
-
-Example:
-	polytouch: edt-ft5x06@38 {
-		compatible = "edt,edt-ft5406", "edt,edt-ft5x06";
-		reg = <0x38>;
-		pinctrl-names = "default";
-		pinctrl-0 = <&edt_ft5x06_pins>;
-		interrupt-parent = <&gpio2>;
-		interrupts = <5 IRQ_TYPE_EDGE_FALLING>;
-		reset-gpios = <&gpio2 6 GPIO_ACTIVE_LOW>;
-		wake-gpios = <&gpio4 9 GPIO_ACTIVE_HIGH>;
-	};
diff --git a/Documentation/devicetree/bindings/input/touchscreen/edt-ft5x06.yaml b/Documentation/devicetree/bindings/input/touchscreen/edt-ft5x06.yaml
new file mode 100644
index 000000000000..178b7aea0f83
--- /dev/null
+++ b/Documentation/devicetree/bindings/input/touchscreen/edt-ft5x06.yaml
@@ -0,0 +1,119 @@
+# SPDX-License-Identifier: GPL-2.0
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/input/touchscreen/edt-ft5x06.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: FocalTech EDT-FT5x06 Polytouch Bindings
+
+description: There are 5 variants of the chip for various touch panel sizes
+             FT5206GE1  2.8" .. 3.8"
+             FT5306DE4  4.3" .. 7"
+             FT5406EE8  7"   .. 8.9"
+             FT5506EEG  7"   .. 8.9"
+             FT5726NEI  5.7” .. 11.6"
+
+maintainers:
+  - Dmitry Torokhov <dmitry.torokhov@gmail.com>
+
+allOf:
+  - $ref: touchscreen.yaml#
+  - if:
+     properties:
+       compatible:
+         contains:
+           enum:
+             - evervision,ev-ft5726
+
+    then:
+      properties:
+        offset-x: true
+        offset-y: true
+
+properties:
+  compatible:
+    enum:
+      - edt,edt-ft5206
+      - edt,edt-ft5306
+      - edt,edt-ft5406
+      - edt,edt-ft5506
+      - evervision,ev-ft5726
+      - focaltech,ft6236
+
+  reg:
+    enum: [ 0x38 ]
+
+  interrupts:
+    maxItems: 1
+
+  reset-gpios:
+    maxItems: 1
+
+  wake-gpios:
+    maxItems: 1
+
+  vcc-supply:
+    maxItems: 1
+
+  gain:
+    description: Allows setting the sensitivity in the range from 0 to 31.
+                 Note that lower values indicate higher sensitivity.
+    $ref: /schemas/types.yaml#/definitions/uint32
+    minimum: 0
+    maximum: 31
+
+  offset:
+    description: Allows setting the edge compensation in the range from 0 to 31.
+    $ref: /schemas/types.yaml#/definitions/uint32
+    minimum: 0
+    maximum: 31
+
+  offset-x:
+    description: Same as offset, but applies only to the horizontal position.
+                 Range from 0 to 80, only supported by evervision,ev-ft5726 devices.
+    $ref: /schemas/types.yaml#/definitions/uint32
+    minimum: 0
+    maximum: 80
+
+  offset-y:
+    description: Same as offset, but applies only to the vertical position.
+                 Range from 0 to 80, only supported by evervision,ev-ft5726 devices.
+    $ref: /schemas/types.yaml#/definitions/uint32
+    minimum: 0
+    maximum: 80
+
+  touchscreen-size-x: true
+  touchscreen-size-y: true
+  touchscreen-fuzz-x: true
+  touchscreen-fuzz-y: true
+  touchscreen-inverted-x: true
+  touchscreen-inverted-y: true
+  touchscreen-swapped-x-y: true
+  interrupt-controller: true
+
+additionalProperties: false
+
+required:
+  - compatible
+  - reg
+  - interrupts
+
+examples:
+  - |
+    #include <dt-bindings/gpio/gpio.h>
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+    i2c@00000000 {
+      #address-cells = <1>;
+      #size-cells = <0>;
+      edt-ft5x06@38 {
+        compatible = "edt,edt-ft5406";
+        reg = <0x38>;
+        interrupt-parent = <&gpio2>;
+        interrupts = <5 IRQ_TYPE_EDGE_FALLING>;
+        reset-gpios = <&gpio2 6 GPIO_ACTIVE_LOW>;
+        wake-gpios = <&gpio4 9 GPIO_ACTIVE_HIGH>;
+      };
+    };
+
+...
+
-- 
2.15.0

