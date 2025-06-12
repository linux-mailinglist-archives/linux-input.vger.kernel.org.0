Return-Path: <linux-input+bounces-12854-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 17950AD7B32
	for <lists+linux-input@lfdr.de>; Thu, 12 Jun 2025 21:42:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id E5B5D18934E5
	for <lists+linux-input@lfdr.de>; Thu, 12 Jun 2025 19:42:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D16E62D540E;
	Thu, 12 Jun 2025 19:41:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=disroot.org header.i=@disroot.org header.b="NcWu2j0e"
X-Original-To: linux-input@vger.kernel.org
Received: from layka.disroot.org (layka.disroot.org [178.21.23.139])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0804D2D540C;
	Thu, 12 Jun 2025 19:41:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=178.21.23.139
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749757314; cv=none; b=DNzX46wjiARJWtLYfPUBcYcFDudUjQ6goDvk6/hBIlC5AiHLgPpIXjAmfcIQxzJZzGxFzcxQks33bIyUCxLB/kINckYxjUa/t/LE2hQYXI5Aj8OxZ6Svg9+1HTX+kmR2RYB5l55ner/1TWAjeS40wkjPUEscqVNtfoYTm/pN4Pc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749757314; c=relaxed/simple;
	bh=kb6nDF3XHpH944ApFwN4563r+bV5OeHn65M+rhj/Ct8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=dgr/j+D37DO5ssD4eZzSycEionJB/btdJeqtTfQHwRS8e+AaMUPshcs0EEY9lXltj+IbvUenA0B7tF0AxXzJs1eIAtdJxD/31pCcFL7jHOdJySEGNrgriUky3Rkw4tKSJ1jMEHamvTZinNl//kFDQ/i7JzBnQWEroQ7nQ0PKFH8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=disroot.org; spf=pass smtp.mailfrom=disroot.org; dkim=pass (2048-bit key) header.d=disroot.org header.i=@disroot.org header.b=NcWu2j0e; arc=none smtp.client-ip=178.21.23.139
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=disroot.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=disroot.org
Received: from mail01.disroot.lan (localhost [127.0.0.1])
	by disroot.org (Postfix) with ESMTP id 6D0562600D;
	Thu, 12 Jun 2025 21:41:51 +0200 (CEST)
X-Virus-Scanned: SPAM Filter at disroot.org
Received: from layka.disroot.org ([127.0.0.1])
 by localhost (disroot.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id XrQMMlhQz_Af; Thu, 12 Jun 2025 21:41:50 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=disroot.org; s=mail;
	t=1749757310; bh=kb6nDF3XHpH944ApFwN4563r+bV5OeHn65M+rhj/Ct8=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=NcWu2j0evKneiYO9xqXQYq2cgY0d6jMWhdyhz3VGtM+pUxzuUdRpIbWXnspaLKBG/
	 VTouQrpwc5caMDL2KL43s4adFfBZBT3MsJotvlLbGh1OoBwB/9ykO1IEr/88MSpDd4
	 P+dp59nPuYVOo7OaVjSG/wmpnRmotDu9R9FrCO0I0ATq5wcalv52SjLhyPHWsky7iL
	 PYKYJxJIILB/zBQEN3vbxF+jlPt9bswZjC9XM72YsZkRwteNcu1ZbNtetbKh9Yw+hF
	 ORDnPnBwAD8qv6hpoCS9OPpCx+MZO0G1cWCqXUJQgHCV5mNcXPR6s+Rzy70ZhoRfKI
	 mncE0x1M2va2A==
From: Kaustabh Chakraborty <kauschluss@disroot.org>
Date: Fri, 13 Jun 2025 01:11:33 +0530
Subject: [PATCH RFC v2 1/5] dt-bindings: input: melfas-mip4: convert to
 dtschema
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250613-mip4-touchkey-v2-1-9bbbe14c016d@disroot.org>
References: <20250613-mip4-touchkey-v2-0-9bbbe14c016d@disroot.org>
In-Reply-To: <20250613-mip4-touchkey-v2-0-9bbbe14c016d@disroot.org>
To: Sangwon Jee <jeesw@melfas.com>, 
 Dmitry Torokhov <dmitry.torokhov@gmail.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Henrik Rydberg <rydberg@bitmath.org>
Cc: linux-input@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Kaustabh Chakraborty <kauschluss@disroot.org>
X-Developer-Signature: v=1; a=ed25519-sha256; t=1749757299; l=2902;
 i=kauschluss@disroot.org; s=20250202; h=from:subject:message-id;
 bh=kb6nDF3XHpH944ApFwN4563r+bV5OeHn65M+rhj/Ct8=;
 b=3Crb8yAOhMTHaMISmdk4bGxVqp7w7GjrNq1Emme+CldZsfr9ZAW/T3oJeNSNhS89xDb1eaIoR
 vogPzSq5ja5A/N4rkZbpcbJewxl4q9nQLLQvuHvtlRTOHFtAL5Nlq+7
X-Developer-Key: i=kauschluss@disroot.org; a=ed25519;
 pk=h2xeR+V2I1+GrfDPAhZa3M+NWA0Cnbdkkq1bH3ct1hE=

Port the documentation file melfas_mip4.txt over to melfas,mip4_ts.yaml.

Signed-off-by: Kaustabh Chakraborty <kauschluss@disroot.org>
---
 .../bindings/input/touchscreen/melfas,mip4_ts.yaml | 55 ++++++++++++++++++++++
 .../bindings/input/touchscreen/melfas_mip4.txt     | 20 --------
 2 files changed, 55 insertions(+), 20 deletions(-)

diff --git a/Documentation/devicetree/bindings/input/touchscreen/melfas,mip4_ts.yaml b/Documentation/devicetree/bindings/input/touchscreen/melfas,mip4_ts.yaml
new file mode 100644
index 0000000000000000000000000000000000000000..5532d46f85a235127e2b3513846259aa7372bda5
--- /dev/null
+++ b/Documentation/devicetree/bindings/input/touchscreen/melfas,mip4_ts.yaml
@@ -0,0 +1,55 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/input/touchscreen/melfas,mip4_ts.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: MELFAS MIP4 touchscreen controller
+
+maintainers:
+  - Sangwon Jee <jeesw@melfas.com>
+
+allOf:
+  - $ref: touchscreen.yaml#
+
+properties:
+  $nodename:
+    pattern: "^touchscreen(@.*)?$"
+
+  compatible:
+    const: melfas,mip4_ts
+
+  reg:
+    enum: [ 0x48, 0x34 ]
+    description: I2C slave address of the chip
+
+  interrupts:
+    maxItems: 1
+
+  ce-gpios:
+    description: GPIO connected to the CE (chip enable) pin of the chip
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
+    #include <dt-bindings/interrupt-controller/irq.h>
+    i2c {
+      #address-cells = <1>;
+      #size-cells = <0>;
+      touchscreen@48 {
+        compatible = "melfas,mip4_ts";
+        reg = <0x48>;
+        interrupt-parent = <&gpio>;
+        interrupts = <0 IRQ_TYPE_EDGE_FALLING>;
+        ce-gpios = <&gpio 0 GPIO_ACTIVE_HIGH>;
+      };
+    };
+
+...
diff --git a/Documentation/devicetree/bindings/input/touchscreen/melfas_mip4.txt b/Documentation/devicetree/bindings/input/touchscreen/melfas_mip4.txt
deleted file mode 100644
index b2ab5498e51900e887fab4d9b5239cccccec2ea9..0000000000000000000000000000000000000000
--- a/Documentation/devicetree/bindings/input/touchscreen/melfas_mip4.txt
+++ /dev/null
@@ -1,20 +0,0 @@
-* MELFAS MIP4 Touchscreen
-
-Required properties:
-- compatible: must be "melfas,mip4_ts"
-- reg: I2C slave address of the chip (0x48 or 0x34)
-- interrupts: interrupt to which the chip is connected
-
-Optional properties:
-- ce-gpios: GPIO connected to the CE (chip enable) pin of the chip
-
-Example:
-	i2c@00000000 {
-		touchscreen: melfas_mip4@48 {
-			compatible = "melfas,mip4_ts";
-			reg = <0x48>;
-			interrupt-parent = <&gpio>;
-			interrupts = <0 IRQ_TYPE_EDGE_FALLING>;
-			ce-gpios = <&gpio 0 GPIO_ACTIVE_HIGH>;
-		};
-	};

-- 
2.49.0


