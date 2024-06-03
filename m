Return-Path: <linux-input+bounces-4046-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E42D28D8635
	for <lists+linux-input@lfdr.de>; Mon,  3 Jun 2024 17:40:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 06A6F1C20D38
	for <lists+linux-input@lfdr.de>; Mon,  3 Jun 2024 15:40:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5B8E3130A49;
	Mon,  3 Jun 2024 15:40:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="jMRjoozV"
X-Original-To: linux-input@vger.kernel.org
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net [217.70.183.200])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B3DB6882B;
	Mon,  3 Jun 2024 15:40:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.200
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717429237; cv=none; b=D7k4NI6aM9D6ElM+YMDDFoVH3bjVtPIhjIvyIrPaY41eVjxxmzcU/nP9HR4SLPxJzoiu1UsfBncEwPxFkE2QaxDT6k06N5/VJECRtqeUj0L3gLcXBAVvldgoahldKSmZ1wWlya+w0KSox+rnzEi8Iw9b4AjyA4vBjghzN1O2m0U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717429237; c=relaxed/simple;
	bh=PQWwAwlEnBREZ6TGncG2YN022xaCSGsXTa+dUIzPx0E=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Ato/3w+Hk7WLaogGGl2VguDZNWqZMKm3jSNGVvHaPYWjOrSc8xT/BB8JjVmNDfg1nUhrkaiiSrnJIWDZOacI+HF8XtQtS1H/z4BkPYcF9dcUaGD1o9rQ5NR8jEE5VDuQTe4PJiEiEiyPpvH+Nez8PCygPvKtICRz18LsKBObWFs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=jMRjoozV; arc=none smtp.client-ip=217.70.183.200
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id 4D2B020002;
	Mon,  3 Jun 2024 15:40:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1717429233;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=M2PtE5CESFJxKL7JvvPbdq+3ps8sNXMJTX6WIUyssys=;
	b=jMRjoozV7W567qKvTwuObeuv0MFmdggNMsFL2KVWtTw2lg5dc6X975CYvkH2RhvIsxbfun
	mB+XSMfQSV3LJSyUY2koKJm/qArhOo0glrdXX00BYaq8ZjELBaMvdtLPSIuT10HC8+dWrO
	vjRLLosQ7HwM7DcT+n85WndLRFdymUdVeugXsmxr5bAi9h14oDW2CAH4qhfPHIe8jDHFn2
	ufGlU755k1RPjRvkQ0lOOZEfdvrEQ0+aR6GEfRlH/2V5ONBED8a7wkRekP/seXBxPDAX1u
	MgUmLgzHDTSeOjK7z9RaVOdj6djvMlmK0XmwWU2coskiUWPYM9HlpyJY0adPfw==
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
Subject: [PATCH v13 2/3] dt-bindings: input: Add TouchNetix axiom touchscreen
Date: Mon,  3 Jun 2024 17:39:24 +0200
Message-ID: <20240603153929.29218-3-kamel.bouhara@bootlin.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240603153929.29218-1-kamel.bouhara@bootlin.com>
References: <20240603153929.29218-1-kamel.bouhara@bootlin.com>
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
index 8754ac2c259d..225309db4110 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -22742,6 +22742,12 @@ L:	platform-driver-x86@vger.kernel.org
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


