Return-Path: <linux-input+bounces-4554-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 667E791307C
	for <lists+linux-input@lfdr.de>; Sat, 22 Jun 2024 00:43:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 0F8EE1F2196A
	for <lists+linux-input@lfdr.de>; Fri, 21 Jun 2024 22:43:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2879216F85B;
	Fri, 21 Jun 2024 22:40:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=kemnade.info header.i=@kemnade.info header.b="c+4Ap9eC"
X-Original-To: linux-input@vger.kernel.org
Received: from mail2.andi.de1.cc (vmd64148.contaboserver.net [161.97.139.27])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6CB0316F283;
	Fri, 21 Jun 2024 22:40:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=161.97.139.27
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719009643; cv=none; b=HdmokZr60diRriYffe5hAiZe3BPT+wrNVFwwCghLv/7qyrJwE0prIdW7OnOCDJYa6DmGm3jwFFM+Za7ufE89ii30RacZxesab0QotYVytwzBK557A09EjCt/E1eJA9bw5Y3NSsi7DeUp6bdcs1uKHkbawQ6k2r78/03NbP2/VA4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719009643; c=relaxed/simple;
	bh=iw38Cb900grqd7jDffEvI+TnYxm9SZQxb+r7nkvrhv4=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=GSmcAntCvb7W9CVGwvgI32Bp7d9xYE9xBXfGx2X3Z/55y0DHglSoknrtgoIevNIPJ9thjlmSbF/YB/FipcYWJnj1xOxKFS9iaMLEn4jL0wLlB/WoDAnwfOJ7x1W69pLz7KJv/tNLILmvH8rQMnk/TFjIhEF0cgG20RQg3WYoTaw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=kemnade.info; spf=pass smtp.mailfrom=kemnade.info; dkim=pass (2048-bit key) header.d=kemnade.info header.i=@kemnade.info header.b=c+4Ap9eC; arc=none smtp.client-ip=161.97.139.27
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=kemnade.info
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kemnade.info
Received: from mail.andi.de1.cc ([2a02:c205:3004:2154::1])
	by mail2.andi.de1.cc with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <andreas@kemnade.info>)
	id 1sKmvj-000Utv-1o;
	Sat, 22 Jun 2024 00:40:28 +0200
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=kemnade.info; s=20220719; h=Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
	List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=yWwlkRcSo+6kETf3mZVatASIaqAtWv3jvH9G8RGngdQ=; b=c+4Ap9eCKZKxBqFsljvDGbF949
	fAenKL7is4bS1Y9tk70z2mn7sXFc0+bJOAQZFtGPcBj+itA2GPXnNvv0tjwUmyuzamaeu9QD8nu0X
	bVZm9odoA7C6KkDDVq0nX+vkSE0zn+J7K2xit0KEBTFeyVBHN9nRvCbk9v5N9BmHUCGg6KtIp/O/X
	mGP1ik3hbgOO4N3e2CykLew4+nl3XRg5eAugHu1eHreIDM2kB8Mkr2CY4TQOVd3BP2Fgjk1+2+9s9
	iceNWQTmPzmZM/kN54wkmfi8RKcbsbpF3wplWaqGfe8Jrr/Uox0wkdxsRqPez5g2HShAMO6x+A6Ur
	C3IWdKAQ==;
Received: from p200300c20737c2001a3da2fffebfd33a.dip0.t-ipconnect.de ([2003:c2:737:c200:1a3d:a2ff:febf:d33a] helo=aktux)
	by mail.andi.de1.cc with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <andreas@kemnade.info>)
	id 1sKmvi-003PlF-0a;
	Sat, 22 Jun 2024 00:40:27 +0200
Received: from andi by aktux with local (Exim 4.96)
	(envelope-from <andreas@kemnade.info>)
	id 1sKmvj-006nfk-0f;
	Sat, 22 Jun 2024 00:40:27 +0200
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
Subject: [PATCH RESEND v3 1/3] dt-bindings: touchscreen: convert elan,ektf2127 to json-schema
Date: Sat, 22 Jun 2024 00:40:20 +0200
Message-Id: <20240621224022.1620897-2-andreas@kemnade.info>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240621224022.1620897-1-andreas@kemnade.info>
References: <20240621224022.1620897-1-andreas@kemnade.info>
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


