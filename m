Return-Path: <linux-input+bounces-12151-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 963F1AA9D5E
	for <lists+linux-input@lfdr.de>; Mon,  5 May 2025 22:39:21 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 824A61A80FE8
	for <lists+linux-input@lfdr.de>; Mon,  5 May 2025 20:39:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 15A5F270EA3;
	Mon,  5 May 2025 20:39:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (4096-bit key) header.d=david-bauer.net header.i=@david-bauer.net header.b="FB0zDdcf"
X-Original-To: linux-input@vger.kernel.org
Received: from mailgate02.uberspace.is (mailgate02.uberspace.is [185.26.156.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA7712701DA
	for <linux-input@vger.kernel.org>; Mon,  5 May 2025 20:38:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.26.156.114
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746477544; cv=none; b=mM9fpBNwfwcXfyX9So5fieowE7RxopPpBrKvGDzTlKdncyXGicY2yVLH3HXx26XZn3honHx59Tc3U+hLDOb/aAtJcrZ8O1BHlXSZpXqo5eIXcsA2nTEJs3xC4VxUkYgHyDptUHiwzO65y2KmlNmskcVUHkKPXzVLmnNotnd9tBI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746477544; c=relaxed/simple;
	bh=b1VdaxnbTgifyjhmcpWeHl2+iooGjNIhyVLAzp9jU+s=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=I1bl+xROfDbcwRte6+BTJkax+zwGItRLYe4LwP8qF4ZDBYhSQSJQSLf+Nr1B398ZEA9tugncsFZxrUEp1K0QJuVaTqw+aJDAy7az9/IVX3fQH4605dU1D8FJS97PawfxBG/J16QT2DwdBK+l49CpBvPAfLoNDH8uo97lh2R9ydc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=david-bauer.net; spf=pass smtp.mailfrom=david-bauer.net; dkim=pass (4096-bit key) header.d=david-bauer.net header.i=@david-bauer.net header.b=FB0zDdcf; arc=none smtp.client-ip=185.26.156.114
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=david-bauer.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=david-bauer.net
Received: from perseus.uberspace.de (perseus.uberspace.de [95.143.172.134])
	by mailgate02.uberspace.is (Postfix) with ESMTPS id 099F318015E
	for <linux-input@vger.kernel.org>; Mon,  5 May 2025 22:38:51 +0200 (CEST)
Received: (qmail 3330 invoked by uid 988); 5 May 2025 20:38:50 -0000
Authentication-Results: perseus.uberspace.de;
	auth=pass (plain)
Received: from unknown (HELO unkown) (::1)
	by perseus.uberspace.de (Haraka/3.0.1) with ESMTPSA; Mon, 05 May 2025 22:38:50 +0200
From: David Bauer <mail@david-bauer.net>
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: linux-input@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 1/2] dt-bindings: input: add Semtech SX951x binding
Date: Mon,  5 May 2025 22:38:44 +0200
Message-ID: <20250505203847.86714-1-mail@david-bauer.net>
X-Mailer: git-send-email 2.47.2
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Bar: -
X-Rspamd-Report: MID_CONTAINS_FROM(1) BAYES_HAM(-2.999999) MIME_GOOD(-0.1) R_MISSING_CHARSET(0.5)
X-Rspamd-Score: -1.599999
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
	d=david-bauer.net; s=uberspace;
	h=from:to:cc:subject:date;
	bh=b1VdaxnbTgifyjhmcpWeHl2+iooGjNIhyVLAzp9jU+s=;
	b=FB0zDdcfEzQWeHyPMJWwSB1vNltbJkgkZnd8fke9nUwvp0KIdH9lbHCvnov+dY8Q/0QobH38zb
	ka7YFagwCF59umPBdaMm7ySnBfxx1uv3M8zeAwT39tqidVXvmcXLjSA01zj6Kdz4At+1GUIJAE/Y
	Ft+qS7f/RPK7L3LycGtluRjbp2IoW6bd3MSeVoIPhWuXCu6gsneztKcSxOTPhbjoWinEKhkVRK1l
	h8D0K18KD/91czo9liakIJ+mjy2Mx6WFqHgWAIjNvi9vULcN1aUI3b2DJ5zIgpqi1bCv5QOlKFqh
	ZMFN1nB3Qrw62K+WfJTC57CAd0RzTKYqd0ieO0BzhwsrPQIKL0WrIvvzAfLdlOKRCLke+ME0U9Q3
	V7JoNUlumLppE5gGEAtcNSuNitbwcyl54hSlQx961tU8FFS+WcxJ35bGrXThbdX4iFIqFzS9FD1Y
	lmjpT3K9kbIvLolV33LpHt8cZSoVy6ogZUCOT0fLcxWhBH0Cwpn6ONP7cHuGqtrl3ajqIij9Fjib
	juLT5Qgv8jG6gewgR9nePUjbhqUT/uD+jVqihsCi6ZtodWQRra93COCe/nZZ2CBlrKFhh81a7Flo
	iLhG3rOFj2Hiruq5jLEuBUWX/W5s/2NizAsREGOYjM6kP+CLfM3annRXHjfyTCJCyb+25SzaMMbY
	k=

Add device-tree binding for the Semtech SX9512/SX9513 family of touch
controllers with integrated LED driver.

Signed-off-by: David Bauer <mail@david-bauer.net>
---
 .../bindings/input/semtech,sx951x.yaml        | 180 ++++++++++++++++++
 1 file changed, 180 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/input/semtech,sx951x.yaml

diff --git a/Documentation/devicetree/bindings/input/semtech,sx951x.yaml b/Documentation/devicetree/bindings/input/semtech,sx951x.yaml
new file mode 100644
index 000000000000..e4f938decd86
--- /dev/null
+++ b/Documentation/devicetree/bindings/input/semtech,sx951x.yaml
@@ -0,0 +1,180 @@
+# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/input/semtech,sx951x.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Semtech SX9512/SX9513 based capacitive touch sensors
+
+description: |
+  The Semtech SX9512/SX9513 Family of capacitive touch controllers
+  with integrated LED drivers. The device communication is using I2C only.
+
+maintainers:
+  - David Bauer <mail@david-bauer.net>
+
+properties:
+  compatible:
+    enum:
+      - semtech,sx9512
+      - semtech,sx9513
+
+  reg:
+    maxItems: 1
+
+  '#address-cells':
+    const: 1
+
+  '#size-cells':
+    const: 0
+
+  poll-interval:
+    default: 100
+    description: |
+      The polling interval for touch events in milliseconds.
+
+patternProperties:
+  "^channel@[0-7]$":
+    $ref: input.yaml#
+    type: object
+    description: |
+      Each node represents a channel of the touch controller.
+      Each channel provides a capacitive touch sensor input and
+      an LED driver output.
+
+    properties:
+      reg:
+        enum: [0, 1, 2, 3, 4, 5, 6, 7]
+
+      linux,keycodes:
+        maxItems: 1
+        description: |
+          Specifies an array of numeric keycode values to
+          be used for the channels. If this property is
+          omitted, the channel is not used as a key.
+
+      semtech,cin-delta:
+        $ref: /schemas/types.yaml#/definitions/uint32
+        minimum: 0
+        maximum: 3
+        default: 3
+        description: |
+          The capacitance delta which is used to detect a touch
+          or release event. The property value is mapped to a
+          farad range between 7pF and 2.3pF internally. The delta
+          becomes smaller the higher the value is.
+
+      semtech,sense-threshold:
+        $ref: /schemas/types.yaml#/definitions/uint32
+        minimum: 0
+        maximum: 255
+        default: 4
+        description: |
+          The threshold value after which the channel detects a touch.
+          Refer to the datasheet for the internal calculation of the
+          resulting touch sensitivity.
+
+      led:
+        $ref: /schemas/leds/common.yaml#
+        type: object
+        unevaluatedProperties: false
+        description: |
+          Presence of this property indicates the channel
+          is used as an LED driver.
+
+    required:
+      - reg
+
+    additionalProperties: false
+
+
+required:
+  - compatible
+  - reg
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/input/input.h>
+    #include <dt-bindings/leds/common.h>
+    i2c {
+      #address-cells = <1>;
+      #size-cells = <0>;
+
+      touch@2b {
+        compatible = "semtech,sx9512";
+
+        reg = <0x2b>;
+
+        #address-cells = <1>;
+        #size-cells = <0>;
+
+        poll-interval = <100>;
+
+        channel@1 {
+          reg = <1>;
+
+          semtech,cin-delta = <0x3>;
+          semtech,sense-threshold = <0xff>;
+
+          linux,keycodes = <KEY_A>;
+        };
+
+        channel@2 {
+          reg = <2>;
+
+          semtech,cin-delta = <0x3>;
+          semtech,sense-threshold = <0xff>;
+
+          linux,keycodes = <KEY_B>;
+        };
+
+        channel@3 {
+          reg = <3>;
+
+          semtech,cin-delta = <0x3>;
+          semtech,sense-threshold = <0xff>;
+
+          linux,keycodes = <KEY_WPS_BUTTON>;
+        };
+
+        channel@4 {
+          reg = <4>;
+
+          led {
+            color = <LED_COLOR_ID_RED>;
+            function = LED_FUNCTION_WAN;
+          };
+        };
+
+        channel@5 {
+          reg = <5>;
+
+          led {
+            color = <LED_COLOR_ID_GREEN>;
+            function = LED_FUNCTION_WAN;
+          };
+        };
+
+        channel@6 {
+          reg = <6>;
+
+          led {
+            color = <LED_COLOR_ID_GREEN>;
+            function = LED_FUNCTION_WLAN;
+            linux,default-trigger = "phy1tx";
+          };
+        };
+
+        channel@7 {
+          reg = <7>;
+
+          led {
+            color = <LED_COLOR_ID_GREEN>;
+            function = LED_FUNCTION_WLAN;
+            linux,default-trigger = "phy0tx";
+          };
+        };
+      };
+    };
-- 
2.47.2


