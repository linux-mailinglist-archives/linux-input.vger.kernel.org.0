Return-Path: <linux-input+bounces-6953-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 9AA7D98BE0A
	for <lists+linux-input@lfdr.de>; Tue,  1 Oct 2024 15:38:21 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 592E1284F54
	for <lists+linux-input@lfdr.de>; Tue,  1 Oct 2024 13:38:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7B2871C3F2B;
	Tue,  1 Oct 2024 13:38:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=analog.com header.i=@analog.com header.b="FRjtAhU5"
X-Original-To: linux-input@vger.kernel.org
Received: from mx0a-00128a01.pphosted.com (mx0a-00128a01.pphosted.com [148.163.135.77])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A5EF61C3F36;
	Tue,  1 Oct 2024 13:37:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.163.135.77
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727789880; cv=none; b=VGfOE50s67yKu6r66dKpF+TsK3dxZattNmB8Bfw2WS7TYdFRhNWRi4Cwc6dvMQis6t2dcO/SIZDKz/dl6cUlsbgfHsx9074M2OfGnrLWmWDP8Jsk2YEMzETC39dkU/9oxn+wbd06sFKkfJVnyTB2hx0EWOesw9Dip66l1wKuWUI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727789880; c=relaxed/simple;
	bh=MennTgJ2M8ajNVy4wFGg56mHJe5j7/2L5MBG1F1Zbr8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:References:
	 In-Reply-To:To:CC; b=Kz4UH3L7WJY3qBmADniVqbNZamJ9Wo+R0bsqqB+xg6tz3P+6PBKEhZVsOd3glxW4tymTH6f0kLgDSvN8U5atm6bEwxmlSspH0RQqEft3+IPbefJ9s1o9qxlTrb8nMqYaHBU4GeV6fEcaY58Ck6MdZQJPBBJAQR2FtMMYjMRRsfs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=analog.com; spf=pass smtp.mailfrom=analog.com; dkim=pass (2048-bit key) header.d=analog.com header.i=@analog.com header.b=FRjtAhU5; arc=none smtp.client-ip=148.163.135.77
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=analog.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=analog.com
Received: from pps.filterd (m0167088.ppops.net [127.0.0.1])
	by mx0a-00128a01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 49191SQe032169;
	Tue, 1 Oct 2024 09:37:46 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=analog.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=DKIM; bh=+n/dL
	Ymlf+SwpMbkbdnKYl/xUpHZFtM74yo26cqXbCs=; b=FRjtAhU5Sqoeq+gp9sMvr
	iLrav7RhUTKm+D8T4SCBh+3zz1yUXdHhjdgAndSmDjureFPcfkxL1Ou+wBydh8hE
	rckvAoW60pWJcPk7EnfVHlZoXj7G+8kFYSCLzPxQfMYuLfSfKfxeev04oktSswPS
	ikjoxW3tbhGyQFZrRYj6glG3RO6QrGq9M95SmblBnjn4f906v620j6E/h/Q5gHwX
	QBwZ7Ng5rmH65InrMRiwybfTe4E4liI/VywyTOZjEYr1yfpzm0UBGYRM2Y34/lhA
	mzzRFslXVGMzJv67gTza1MYEpVNV+1s0O63V15EZGIGQb2pNBlC4dfEyXqPB33UH
	w==
Received: from nwd2mta4.analog.com ([137.71.173.58])
	by mx0a-00128a01.pphosted.com (PPS) with ESMTPS id 41xbn4d9k5-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 01 Oct 2024 09:37:46 -0400 (EDT)
Received: from ASHBMBX9.ad.analog.com (ASHBMBX9.ad.analog.com [10.64.17.10])
	by nwd2mta4.analog.com (8.14.7/8.14.7) with ESMTP id 491Dbj1e054545
	(version=TLSv1/SSLv3 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
	Tue, 1 Oct 2024 09:37:45 -0400
Received: from ASHBMBX8.ad.analog.com (10.64.17.5) by ASHBMBX9.ad.analog.com
 (10.64.17.10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.14; Tue, 1 Oct 2024
 09:37:44 -0400
Received: from zeus.spd.analog.com (10.66.68.11) by ashbmbx8.ad.analog.com
 (10.64.17.5) with Microsoft SMTP Server id 15.2.986.14 via Frontend
 Transport; Tue, 1 Oct 2024 09:37:44 -0400
Received: from [127.0.0.1] ([10.44.3.60])
	by zeus.spd.analog.com (8.15.1/8.15.1) with ESMTP id 491DbTeO022143;
	Tue, 1 Oct 2024 09:37:41 -0400
From: Nuno Sa <nuno.sa@analog.com>
Date: Tue, 1 Oct 2024 15:41:36 +0200
Subject: [PATCH 05/13] dt-bindings: input: Document adp5589 and similar
 devices
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20241001-b4-dev-adp5589-fw-conversion-v1-5-fca0149dfc47@analog.com>
References: <20241001-b4-dev-adp5589-fw-conversion-v1-0-fca0149dfc47@analog.com>
In-Reply-To: <20241001-b4-dev-adp5589-fw-conversion-v1-0-fca0149dfc47@analog.com>
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Mike Frysinger
	<vapier@gentoo.org>, Dmitry Torokhov <dtor@mail.ru>,
        Rob Herring
	<robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
	<conor+dt@kernel.org>
CC: <linux-input@vger.kernel.org>, <devicetree@vger.kernel.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1727790102; l=11173;
 i=nuno.sa@analog.com; s=20231116; h=from:subject:message-id;
 bh=MennTgJ2M8ajNVy4wFGg56mHJe5j7/2L5MBG1F1Zbr8=;
 b=TzL+hSv5z8zE7B9RIracGiqIzhOUEe0dlrG7VOT8tFcXxpw1DDEvddZPkNn31xZZIGAjNr/s4
 hDSZUadfCHgBgp/msCFfkaaRy1AxkFWlubRLMHHig1vPTmJawJ8q1Vu
X-Developer-Key: i=nuno.sa@analog.com; a=ed25519;
 pk=3NQwYA013OUYZsmDFBf8rmyyr5iQlxV/9H4/Df83o1E=
X-ADIRuleOP-NewSCL: Rule Triggered
X-Proofpoint-ORIG-GUID: I08dBS1pXtssETkBNwPih5FzHjhQMnrj
X-Proofpoint-GUID: I08dBS1pXtssETkBNwPih5FzHjhQMnrj
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0 clxscore=1015
 spamscore=0 lowpriorityscore=0 bulkscore=0 mlxscore=0 adultscore=0
 priorityscore=1501 mlxlogscore=999 impostorscore=0 malwarescore=0
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2408220000 definitions=main-2410010087

Add device tree bindings for the adp5589 keypad (and similar devices). The
ADP5585 family has small differences like the lack of the unlock
function and less pins (cols x rows) for the keymap.

As there's no MAINTAINERS entry for these devices, add one. Also to note
that these devices were removed from trivial-devices.yaml.

Signed-off-by: Nuno Sa <nuno.sa@analog.com>
---
 .../devicetree/bindings/input/adi,adp5589.yaml     | 310 +++++++++++++++++++++
 .../devicetree/bindings/trivial-devices.yaml       |   6 -
 MAINTAINERS                                        |   9 +
 3 files changed, 319 insertions(+), 6 deletions(-)

diff --git a/Documentation/devicetree/bindings/input/adi,adp5589.yaml b/Documentation/devicetree/bindings/input/adi,adp5589.yaml
new file mode 100644
index 0000000000000000000000000000000000000000..bdbc79758a0390952c8363ec28f48057dab929a9
--- /dev/null
+++ b/Documentation/devicetree/bindings/input/adi,adp5589.yaml
@@ -0,0 +1,310 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/input/adi,adp5589.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Analog Devices ADP5589 and similar Keypad Controllers
+
+maintainers:
+  - Nuno Sa <nuno.sa@analog.com>
+  - Michael Hennerich <michael.hennerich@analog.com>
+
+description: |
+  Analog Devices Mobile I/O Expander and QWERTY Keypad Controllers
+   - https://www.analog.com/media/en/technical-documentation/data-sheets/ADP5589.pdf
+   - https://www.analog.com/media/en/technical-documentation/data-sheets/ADP5585.pdf
+
+properties:
+  compatible:
+    enum:
+      - adi,adp5589
+      - adi,adp5585
+      - adi,adp5585-2
+
+  reg:
+    maxItems: 1
+
+  vcc-supply: true
+
+  interrupts:
+    maxItems: 1
+
+  gpio-controller:
+    description:
+      This property applies if there are pins not used in the keypad.
+
+  '#gpio-cells':
+    const: 2
+
+  interrupt-controller:
+    description:
+      This property applies if there are pins not used in the keypad.
+
+  '#interrupt-cells':
+    const: 2
+
+  adi,cols-mask:
+    description:
+      Defines the number of pins (columns) being used ad part of the keymap. As
+      the device is fully configurable and we can have holes in the columns
+      being used, this is given as mask.
+    $ref: /schemas/types.yaml#/definitions/uint32
+    minimum: 0x1
+    maximum: 0x3f
+
+  adi,rows-mask:
+    description:
+      Defines the number of pins (rows) being used ad part of the keymap. As
+      the device is fully configurable and we can have holes in the rows being
+      used, this is given as mask.
+    $ref: /schemas/types.yaml#/definitions/uint32
+    minimum: 0x1
+    maximum: 0xff
+
+  adi,key-poll-ms:
+    description: Configure time between consecutive scan cycles.
+    enum: [10, 20, 30, 40]
+    default: 10
+
+  adi,unlock-keys:
+    description:
+      Specifies a maximum of 2 keys that can be used to unlock the keypad.
+      If this property is set, the keyboard will be locked and only unlocked
+      after these keys are pressed. The value 127 serves as a wildcard which
+      means any key can be used for unlocking.
+    $ref: /schemas/types.yaml#/definitions/uint32-array
+    minItems: 1
+    maxItems: 2
+    items:
+      anyOf:
+        - minimum: 1
+          maximum: 88
+        - minimum: 97
+          maximum: 115
+        - const: 127
+
+  adi,unlock-trigger-sec:
+    description:
+      Defines the time in which the second unlock event must occur after the
+      first unlock event has occurred.
+    maximum: 7
+    default: 0
+
+  adi,reset1-keys:
+    description:
+      Defines the trigger events (key presses) that can generate reset
+      conditions one the reset1 block.
+    $ref: /schemas/types.yaml#/definitions/uint32-array
+    minItems: 1
+    maxItems: 3
+    items:
+      anyOf:
+        - minimum: 1
+          maximum: 88
+        - minimum: 97
+          maximum: 115
+
+  adi,reset2-keys:
+    description:
+      Defines the trigger events (key presses) that can generate reset
+      conditions one the reset2 block.
+    $ref: /schemas/types.yaml#/definitions/uint32-array
+    minItems: 1
+    maxItems: 2
+    items:
+      anyOf:
+        - minimum: 1
+          maximum: 88
+        - minimum: 97
+          maximum: 115
+
+  adi,reset1-active-high:
+    description: Sets the reset1 signal as active high.
+    type: boolean
+
+  adi,reset2-active-high:
+    description: Sets the reset2 signal as active high.
+    type: boolean
+
+  adi,rst-passtrough-enable:
+    description: Allows the RST pin to override (OR with) the reset1 signal.
+    type: boolean
+
+  adi,reset-trigger-ms:
+    description:
+      Defines the length of time that the reset events must be active before a
+      reset signal is generated. All events must be active at the same time for
+      the same duration.
+    enum: [0, 1000, 1500, 2000, 2500, 3000, 3500, 4000]
+    default: 0
+
+  adi,reset-pulse-width-us:
+    description: Defines the pulse width of the reset signals.
+    enum: [500, 1000, 2000, 10000]
+    default: 500
+
+  '#address-cells':
+    const: 1
+
+  '#size-cells':
+    const: 0
+
+patternProperties:
+  "^gpio@":
+    type: object
+    additionalProperties: false
+
+    properties:
+      reg:
+        description: The GPIO number being configured.
+        maximum: 18
+
+      adi,pull-up-ohms:
+        description: The pullup resistor to be used.
+        enum: [100000, 300000]
+        default: 300000
+
+    required:
+      - reg
+
+dependencies:
+  adi,rows-mask:
+    - linux,keymap
+    - adi,cols-mask
+  adi,cols-mask:
+    - linux,keymap
+    - adi,rows-mask
+  linux,keymap:
+    - adi,rows-mask
+    - adi,cols-mask
+    - interrupts
+  interrupt-controller:
+    - interrupts
+  adi,unlock-trigger-sec:
+    - adi,unlock-keys
+  adi,reset1-active-high:
+    - adi,reset1-keys
+  adi,rst-passtrough-enable:
+    - adi,reset1-keys
+  adi,reset2-active-high:
+    - adi,reset2-keys
+
+required:
+  - compatible
+  - reg
+  - vcc-supply
+
+allOf:
+  - $ref: matrix-keymap.yaml#
+  - $ref: input.yaml#
+  - if:
+      properties:
+        compatible:
+          enum:
+            - adi,adp5585-2
+    then:
+      properties:
+        adi,unlock-keys: false
+        adi,unlock-trigger-sec: false
+        adi,rows-mask:
+          maximum: 0x2f
+        adi,cols-mask:
+          maximum: 0x1f
+        adi,reset1-keys:
+          items:
+            anyOf:
+              - minimum: 1
+                maximum: 30
+              - minimum: 37
+                maximum: 47
+        adi,reset2-keys:
+          items:
+            anyOf:
+              - minimum: 1
+                maximum: 30
+              - minimum: 37
+                maximum: 47
+      patternProperties:
+        "^gpio@":
+          properties:
+            reg:
+              maximum: 10
+  - if:
+      properties:
+        compatible:
+          enum:
+            - adi,adp5585
+    then:
+      properties:
+        adi,unlock-keys: false
+        adi,unlock-trigger-sec: false
+        adi,rows-mask:
+          maximum: 0x1f
+        adi,cols-mask:
+          maximum: 0x1f
+        adi,reset1-keys:
+          items:
+            anyOf:
+              - minimum: 1
+                maximum: 25
+              - enum: [37, 38, 39, 40, 41, 43, 44, 45, 46, 47]
+        adi,reset2-keys:
+          items:
+            anyOf:
+              - minimum: 1
+                maximum: 25
+              - enum: [37, 38, 39, 40, 41, 43, 44, 45, 46, 47]
+      patternProperties:
+        "^gpio@":
+          properties:
+            reg:
+              enum: [0, 1, 2, 3, 4, 6, 7, 8, 9, 10]
+
+unevaluatedProperties: false
+
+
+examples:
+  - |
+    #include <dt-bindings/interrupt-controller/irq.h>
+    #include <dt-bindings/input/input.h>
+    i2c {
+        #address-cells = <1>;
+        #size-cells = <0>;
+
+        keys@34 {
+            compatible = "adi,adp5589";
+            reg = <0x34>;
+
+            vcc-supply = <&vcc>;
+            interrupts = <21 IRQ_TYPE_EDGE_FALLING>;
+            interrupt-parent = <&gpio>;
+
+            adi,rows-mask = <0x13>;
+            adi,cols-mask = <0xf>;
+
+            linux,keymap = <
+                MATRIX_KEY(0x00, 0x00, KEY_1)
+                MATRIX_KEY(0x00, 0x01, KEY_2)
+                MATRIX_KEY(0x00, 0x02, KEY_3)
+                MATRIX_KEY(0x00, 0x03, KEY_4)
+                MATRIX_KEY(0x01, 0x00, KEY_5)
+                MATRIX_KEY(0x01, 0x01, KEY_6)
+                MATRIX_KEY(0x01, 0x02, KEY_7)
+                MATRIX_KEY(0x01, 0x03, KEY_8)
+                MATRIX_KEY(0x04, 0x00, KEY_9)
+                MATRIX_KEY(0x04, 0x01, KEY_A)
+                MATRIX_KEY(0x04, 0x02, KEY_B)
+                MATRIX_KEY(0x04, 0x03, KEY_C)
+            >;
+
+            #address-cells = <1>;
+            #size-cells = <0>;
+
+            gpio@10 {
+                reg = <10>;
+                adi,pull-up-ohms = <100000>;
+            };
+        };
+    };
+...
diff --git a/Documentation/devicetree/bindings/trivial-devices.yaml b/Documentation/devicetree/bindings/trivial-devices.yaml
index 7913ca9b6b54020c58e387b3618922386ce03763..35238b1d89e65bfed09e1a1a5b421a07555f6351 100644
--- a/Documentation/devicetree/bindings/trivial-devices.yaml
+++ b/Documentation/devicetree/bindings/trivial-devices.yaml
@@ -38,12 +38,6 @@ properties:
           - ad,adm9240
             # AD5110 - Nonvolatile Digital Potentiometer
           - adi,ad5110
-            # Analog Devices ADP5585 Keypad Decoder and I/O Expansion
-          - adi,adp5585
-            # Analog Devices ADP5585 Keypad Decoder and I/O Expansion with support for Row5
-          - adi,adp5585-02
-            # Analog Devices ADP5589 Keypad Decoder and I/O Expansion
-          - adi,adp5589
             # Analog Devices LT7182S Dual Channel 6A, 20V PolyPhase Step-Down Silent Switcher
           - adi,lt7182s
             # AMS iAQ-Core VOC Sensor
diff --git a/MAINTAINERS b/MAINTAINERS
index a533d882b0022fd7580b829b68d846d319a4a8a7..120a1867b8f716ae11bffedab94a938c25888457 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -545,6 +545,15 @@ W:	https://ez.analog.com/linux-software-drivers
 F:	Documentation/devicetree/bindings/input/adi,adp5588.yaml
 F:	drivers/input/keyboard/adp5588-keys.c
 
+ADP5589 QWERTY KEYPAD AND IO EXPANDER DRIVER (ADP5589/ADP5585)
+M:	Michael Hennerich <michael.hennerich@analog.com>
+M:	Nuno Sa <nuno.sa@analog.com>
+S:	Supported
+W:	https://ez.analog.com/linux-software-drivers
+F:	Documentation/devicetree/bindings/input/adi,adp5589.yaml
+F:	drivers/input/keyboard/adp5589-keys.c
+F:	include/linux/input/adp5589.h
+
 ADP8860 BACKLIGHT DRIVER (ADP8860/ADP8861/ADP8863)
 M:	Michael Hennerich <michael.hennerich@analog.com>
 S:	Supported

-- 
2.46.1


