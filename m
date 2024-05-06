Return-Path: <linux-input+bounces-3498-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 2AB338BD2B3
	for <lists+linux-input@lfdr.de>; Mon,  6 May 2024 18:24:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 956A21F24B0F
	for <lists+linux-input@lfdr.de>; Mon,  6 May 2024 16:24:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A65AA156F31;
	Mon,  6 May 2024 16:24:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=kemnade.info header.i=@kemnade.info header.b="Ja29wunq"
X-Original-To: linux-input@vger.kernel.org
Received: from mail2.andi.de1.cc (vmd64148.contaboserver.net [161.97.139.27])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 492B6155A4F;
	Mon,  6 May 2024 16:24:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=161.97.139.27
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715012650; cv=none; b=HlVOkHJVVxd73Z8s2HAw5oe5ylFnp67gvtFOYHzU9SGit8iM1Rq6pSa1SGNe+zWPNeK1K+COlw+WWH10OuNuu6xQvfe1W9zLxAeZtKCSx4HqUZEt00PpyCI2TBbjNHA2QHhDhjlXBVLJupDBVYaEHJFDwADZ4rWUBiLvzOdg7DQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715012650; c=relaxed/simple;
	bh=iw38Cb900grqd7jDffEvI+TnYxm9SZQxb+r7nkvrhv4=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=Aib88xvCne7047jdQXLBY2mz95JVKeFBEFH8ogjYyoLJ2foj4bexvpNWiADVaN3gGcEFNSQvHzVDHSL5czH2YzBfFGjCbSiXvMMVCLkA3zh9plSG9446nku75Kd0MFLcQOVEcQwtUNiQkLwAgEO37BWNVtqqXaCVw/CWwE7SVpc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kemnade.info; spf=pass smtp.mailfrom=kemnade.info; dkim=pass (2048-bit key) header.d=kemnade.info header.i=@kemnade.info header.b=Ja29wunq; arc=none smtp.client-ip=161.97.139.27
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kemnade.info
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kemnade.info
Received: from mail.andi.de1.cc ([2a02:c205:3004:2154::1])
	by mail2.andi.de1.cc with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <andreas@kemnade.info>)
	id 1s418F-005r2e-0l;
	Mon, 06 May 2024 18:24:04 +0200
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=kemnade.info; s=20220719; h=Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
	List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=yWwlkRcSo+6kETf3mZVatASIaqAtWv3jvH9G8RGngdQ=; b=Ja29wunqEEOS2PlpuH+bYb9/uk
	D6jIXOd3hPWKsyZpDlZzI2FgontyfaGG8V/S7PeE1N4P2K6320Xz7GaTVCDWomYBg1q/d1tr1fw4Z
	5pvYIOOKxysmc/gMXvZ+LrwVYmA8MiNHgsYd5f56RiL7mhonWTP56G4EuztCthYNEBK4oUw3bw+XT
	HtQ3qyUq0RLtUNYVf1KAwGFFNRAfTezRsyfHW1jU1LcMVVyJw7HaRVESmCyAznNhGT+eG9TH1WIFV
	X0J/A3r1lEhXA4Tmmi1v277EyQBVm8HuXLYJZ81YXu3WQKHIKhFp24dC5su6nR1NclWTgX4BP/BTC
	0gcidBTQ==;
Received: from p200300c20737c2001a3da2fffebfd33a.dip0.t-ipconnect.de ([2003:c2:737:c200:1a3d:a2ff:febf:d33a] helo=aktux)
	by mail.andi.de1.cc with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <andreas@kemnade.info>)
	id 1s418E-000fJg-09;
	Mon, 06 May 2024 18:24:03 +0200
Received: from andi by aktux with local (Exim 4.96)
	(envelope-from <andreas@kemnade.info>)
	id 1s418F-003pVF-08;
	Mon, 06 May 2024 18:24:03 +0200
From: Andreas Kemnade <andreas@kemnade.info>
To: dmitry.torokhov@gmail.com,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	andreas@kemnade.info,
	hdegoede@redhat.com,
	andy.shevchenko@gmail.com,
	u.kleine-koenig@pengutronix.de,
	siebren.vroegindeweij@hotmail.com,
	linux-input@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH v3 1/3] dt-bindings: touchscreen: convert elan,ektf2127 to json-schema
Date: Mon,  6 May 2024 18:23:48 +0200
Message-Id: <20240506162350.912950-2-andreas@kemnade.info>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240506162350.912950-1-andreas@kemnade.info>
References: <20240506162350.912950-1-andreas@kemnade.info>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Convert EKTF2127 infrared touchscreen controller binding to DT schema
and add ektf2232 compatible.

Signed-off-by: Andreas Kemnade <andreas@kemnade.info>
Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 .../bindings/input/touchscreen/ektf2127.txt   | 25 --------
 .../input/touchscreen/elan,ektf2127.yaml      | 57 +++++++++++++++++++
 2 files changed, 57 insertions(+), 25 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/input/touchscreen/ektf2127.txt
 create mode 100644 Documentation/devicetree/bindings/input/touchscreen/elan,ektf2127.yaml

diff --git a/Documentation/devicetree/bindings/input/touchscreen/ektf2127.txt b/Documentation/devicetree/bindings/input/touchscreen/ektf2127.txt
deleted file mode 100644
index c9f2c9f578e34..0000000000000
--- a/Documentation/devicetree/bindings/input/touchscreen/ektf2127.txt
+++ /dev/null
@@ -1,25 +0,0 @@
-* Elan eKTF2127 I2C touchscreen controller
-
-Required properties:
- - compatible		  : "elan,ektf2127" or "elan,ektf2132"
- - reg			  : I2C slave address of the chip (0x40)
- - interrupts		  : interrupt specification for the ektf2127 interrupt
- - power-gpios		  : GPIO specification for the pin connected to the
-			    ektf2127's wake input. This needs to be driven high
-			    to take ektf2127 out of its low power state
-
-For additional optional properties see: touchscreen.txt
-
-Example:
-
-i2c@00000000 {
-	ektf2127: touchscreen@15 {
-		compatible = "elan,ektf2127";
-		reg = <0x15>;
-		interrupt-parent = <&pio>;
-		interrupts = <6 11 IRQ_TYPE_EDGE_FALLING>
-		power-gpios = <&pio 1 3 GPIO_ACTIVE_HIGH>;
-		touchscreen-inverted-x;
-		touchscreen-swapped-x-y;
-	};
-};
diff --git a/Documentation/devicetree/bindings/input/touchscreen/elan,ektf2127.yaml b/Documentation/devicetree/bindings/input/touchscreen/elan,ektf2127.yaml
new file mode 100644
index 0000000000000..5c4c29da0b11d
--- /dev/null
+++ b/Documentation/devicetree/bindings/input/touchscreen/elan,ektf2127.yaml
@@ -0,0 +1,57 @@
+# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/input/touchscreen/elan,ektf2127.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Elan eKTF2127 I2C touchscreen controller
+
+maintainers:
+  - Siebren Vroegindeweij <siebren.vroegindeweij@hotmail.com>
+
+allOf:
+  - $ref: touchscreen.yaml#
+
+properties:
+  compatible:
+    enum:
+      - elan,ektf2127
+      - elan,ektf2132
+
+  reg:
+    maxItems: 1
+
+  interrupts:
+    maxItems: 1
+
+  power-gpios:
+    maxItems: 1
+
+required:
+  - compatible
+  - reg
+  - interrupts
+  - power-gpios
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/gpio/gpio.h>
+    #include <dt-bindings/interrupt-controller/irq.h>
+
+    i2c {
+        #address-cells = <1>;
+        #size-cells = <0>;
+
+        touchscreen@15 {
+            compatible = "elan,ektf2127";
+            reg = <0x15>;
+            interrupt-parent = <&pio>;
+            interrupts = <6 11 IRQ_TYPE_EDGE_FALLING>;
+            power-gpios = <&pio 1 3 GPIO_ACTIVE_HIGH>;
+            touchscreen-inverted-x;
+            touchscreen-swapped-x-y;
+        };
+    };
+...
-- 
2.39.2


