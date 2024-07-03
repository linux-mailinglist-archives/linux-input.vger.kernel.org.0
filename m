Return-Path: <linux-input+bounces-4817-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 2246B926357
	for <lists+linux-input@lfdr.de>; Wed,  3 Jul 2024 16:25:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id CED0C1F21A4D
	for <lists+linux-input@lfdr.de>; Wed,  3 Jul 2024 14:25:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7BFB517C20C;
	Wed,  3 Jul 2024 14:25:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="gNk9q2cW"
X-Original-To: linux-input@vger.kernel.org
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net [217.70.183.194])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 337FA17A5BD;
	Wed,  3 Jul 2024 14:25:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.194
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720016729; cv=none; b=Ze+X44dnjB+ugV00zD5AIH2ZHQR1JjQDL4mxI1fLqhlVR1b2JUuoZ8eQiEWszuDv0eJt69wNYVDdV3znIHJMYn1MHadmwn34RCrteOt4VNMuVRATaoYge6P3a8FCPgu/hg9ECm2SAsOP2u1pieg+SG/KLGFe128NboJT1ZFnrb8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720016729; c=relaxed/simple;
	bh=y8/0OBssFtCTjW31cdeQJoO6HaHTmkhjaybMACJbuWE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=BbQbHshDi5WmO0feA2pJjCJPfxmzHge0jd5UFLSdq5gUn6MDAQhbohQcj15cE56IGO6rRyUvqhFMPt2mPVWDWcrG94pgyIXSw/RpvIlJCJsbWpR2TLeCymExDqBbBJ+EryQ3krQxwFHvhviiEcmt5nRWlFxUW10Il+Gr81+KweQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=gNk9q2cW; arc=none smtp.client-ip=217.70.183.194
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id 2D19C40002;
	Wed,  3 Jul 2024 14:25:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1720016725;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=xR28blvI6ZbzxQD0WpsU4qIsBlXgQhHhDdAdvRtmyIg=;
	b=gNk9q2cW7x3JkzfR/PfVE4a6Gma1uPrDkBpNMhgQJKIje6LGglgAPLkiFvmcDcoaBc4bPj
	Bu8Gv1dTvJCcE/HBOz/nhyK5C9y2Y2xWuXlGjuGnKhgVUxHnywZXuz0wD0MsH/+dtJP6u7
	8Pp/JsEkt/ZHWNJbxz886RNk9nSK8rgjJjCGajbEKpK+oyOcYVd9jRFm1y/Mry/ZGBDokQ
	3l3M5DSHQVFdmi16Fbq5nazR8XGk7WIEwskgjpr4wI0rCMGR8J4RPG41nZM/qydQU8MuOy
	QaMAga6AU/QzluRP3dGsi5muAmS/Re+zsmmbPsKrEIRn5t73IkGiUO5ip4Qkgw==
From: Kamel Bouhara <kamel.bouhara@bootlin.com>
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Henrik Rydberg <rydberg@bitmath.org>,
	linux-input@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	Marco Felsch <m.felsch@pengutronix.de>,
	Jeff LaBundy <jeff@labundy.com>
Cc: catalin.popescu@leica-geosystems.com,
	mark.satterthwaite@touchnetix.com,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
	Gregory Clement <gregory.clement@bootlin.com>,
	bsp-development.geo@leica-geosystems.com,
	Kamel Bouhara <kamel.bouhara@bootlin.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH v16 2/3] dt-bindings: input: Add TouchNetix axiom touchscreen
Date: Wed,  3 Jul 2024 16:25:17 +0200
Message-ID: <20240703142520.207066-3-kamel.bouhara@bootlin.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240703142520.207066-1-kamel.bouhara@bootlin.com>
References: <20240703142520.207066-1-kamel.bouhara@bootlin.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-GND-Sasl: kamel.bouhara@bootlin.com

Add the TouchNetix axiom I2C touchscreen device tree bindings
documentation.

Signed-off-by: Kamel Bouhara <kamel.bouhara@bootlin.com>
Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 .../input/touchscreen/touchnetix,ax54a.yaml   | 62 +++++++++++++++++++
 MAINTAINERS                                   |  6 ++
 2 files changed, 68 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/input/touchscreen/touchnetix,ax54a.yaml

diff --git a/Documentation/devicetree/bindings/input/touchscreen/touchnetix,ax54a.yaml b/Documentation/devicetree/bindings/input/touchscreen/touchnetix,ax54a.yaml
new file mode 100644
index 000000000000..66229a4d6f15
--- /dev/null
+++ b/Documentation/devicetree/bindings/input/touchscreen/touchnetix,ax54a.yaml
@@ -0,0 +1,62 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/input/touchscreen/touchnetix,ax54a.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: TouchNetix Axiom series touchscreen controller
+
+maintainers:
+  - Kamel Bouhara <kamel.bouhara@bootlin.com>
+
+allOf:
+  - $ref: /schemas/input/touchscreen/touchscreen.yaml#
+  - $ref: /schemas/input/input.yaml#
+
+properties:
+  compatible:
+    const: touchnetix,ax54a
+
+  reg:
+    const: 0x66
+
+  interrupts:
+    maxItems: 1
+
+  reset-gpios:
+    maxItems: 1
+
+  vdda-supply:
+    description: Analog power supply regulator on VDDA pin
+
+  vddi-supply:
+    description: I/O power supply regulator on VDDI pin
+
+required:
+  - compatible
+  - reg
+  - vdda-supply
+  - vddi-supply
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/gpio/gpio.h>
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+    i2c {
+      #address-cells = <1>;
+      #size-cells = <0>;
+
+      touchscreen@66 {
+        compatible = "touchnetix,ax54a";
+        reg = <0x66>;
+        interrupt-parent = <&gpio2>;
+        interrupts = <2 IRQ_TYPE_EDGE_FALLING>;
+        reset-gpios = <&gpio1 1 GPIO_ACTIVE_HIGH>;
+        vdda-supply = <&vdda_reg>;
+        vddi-supply = <&vddi_reg>;
+        poll-interval = <20>;
+      };
+    };
+...
diff --git a/MAINTAINERS b/MAINTAINERS
index cd2ca0c3158e..2041384d3866 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -22740,6 +22740,12 @@ L:	platform-driver-x86@vger.kernel.org
 S:	Maintained
 F:	drivers/platform/x86/toshiba-wmi.c
 
+TOUCHNETIX AXIOM I2C TOUCHSCREEN DRIVER
+M:	Kamel Bouhara <kamel.bouhara@bootlin.com>
+L:	linux-input@vger.kernel.org
+S:	Maintained
+F:	Documentation/devicetree/bindings/input/touchscreen/touchnetix,ax54a.yaml
+
 TPM DEVICE DRIVER
 M:	Peter Huewe <peterhuewe@gmx.de>
 M:	Jarkko Sakkinen <jarkko@kernel.org>
-- 
2.25.1


