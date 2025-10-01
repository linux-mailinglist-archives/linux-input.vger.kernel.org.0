Return-Path: <linux-input+bounces-15191-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 62317BB1845
	for <lists+linux-input@lfdr.de>; Wed, 01 Oct 2025 20:38:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 1DA912A1EE0
	for <lists+linux-input@lfdr.de>; Wed,  1 Oct 2025 18:38:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7A6772D5939;
	Wed,  1 Oct 2025 18:38:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=collabora.com header.i=ariel.dalessandro@collabora.com header.b="PfjXeWvF"
X-Original-To: linux-input@vger.kernel.org
Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com [136.143.188.112])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 97AD5285C8D;
	Wed,  1 Oct 2025 18:38:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.112
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759343911; cv=pass; b=VcAO8U6yWJcRFoFTK1JWWUY2kb/SCKFP6NhTEDAfwDSWalg9w5bvm3+CJgHii6YIV1f7KXMcRiE9OP1cZ263RY3sgw5pYoDYkmHJvxWcjOHsxe+3i11bjSjl8ysUUA4E3SVifabUy0HD9N5TtTUiZsDxeEkkjCqkwN/pGig8BwU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759343911; c=relaxed/simple;
	bh=+QF+n3LOx3LexgHOZSauGyH/TtFkOSt0J+V8Fdxp7HE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=cbP+st0qTg4zgiTZdCN54WpWxizOg6TjJ/UXhCNCZukdkLPXQ5e/G16Amkrsm0UtYCmkqWP8bd0IFcaeMbO0+uk9x0rcNtWGJkyKxnR5k9KNSDxMTbUPeiosdEY40KI2K/IzbS03dt+yIIlVvGPZLM4zopmb3gSJrjl9ZVgPfcU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (1024-bit key) header.d=collabora.com header.i=ariel.dalessandro@collabora.com header.b=PfjXeWvF; arc=pass smtp.client-ip=136.143.188.112
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
ARC-Seal: i=1; a=rsa-sha256; t=1759343899; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=lep1bEIN9ZDEArpYVe3pXGa0pZTqz1JaRsEfh5hmZt742ZDHGgZd4iyL/nyWA36F4Iv0H6MEM7obcO8ke1utbNIGWjNJSnOJWi1wKWTJ7cQubOvH4Lpnc4CkESJ65DmvxJaLq3jNf3pz2URcG3EsMu3OtWIXASRKp/gGYlu9ptI=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1759343899; h=Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=Ek7F2mrrsq+BqJrZYPH5KFCvcL/nkiJq6tvKo2uH9ms=; 
	b=BlaXKNJJevekvHH2q4jGrkjyOuyOftZzqL/NOazItM9Wkq+GoI50LwKzTc0N28vCm2MGe+OzVjaI8AePIjdzhgcdiC+ogEa0bWpqXketAkuFii4qb/Cz6FF+eCv6Q0V3M3W2mU2wT1rBEFEHtsXzD2A9pLpA2jGy+Ct2TG8mJbw=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=ariel.dalessandro@collabora.com;
	dmarc=pass header.from=<ariel.dalessandro@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1759343898;
	s=zohomail; d=collabora.com; i=ariel.dalessandro@collabora.com;
	h=From:From:To:To:Cc:Cc:Subject:Subject:Date:Date:Message-ID:MIME-Version:Content-Transfer-Encoding:Message-Id:Reply-To;
	bh=Ek7F2mrrsq+BqJrZYPH5KFCvcL/nkiJq6tvKo2uH9ms=;
	b=PfjXeWvFg0Xsb/jpfKo+8pqZI4oeBwJ/l5kT8YnmiBiIexncryEU+HlnfNPFiv4N
	SCZAcRv4wleArEfkEyJnmn2l7qvvChyw/0Gt4V5jdaCylExx3CX24ZIaisDKAF/+8KK
	IR2ySfvdB638KRDffgILy5xaTGiHcdKLQcaFNKxo=
Received: by mx.zohomail.com with SMTPS id 1759343896314557.1843119775383;
	Wed, 1 Oct 2025 11:38:16 -0700 (PDT)
From: Ariel D'Alessandro <ariel.dalessandro@collabora.com>
To: angelogioacchino.delregno@collabora.com,
	ariel.dalessandro@collabora.com,
	conor+dt@kernel.org,
	dmitry.torokhov@gmail.com,
	krzk+dt@kernel.org,
	robh@kernel.org
Cc: devicetree@vger.kernel.org,
	kernel@collabora.com,
	linux-input@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3] dt-bindings: input: Convert MELFAS MIP4 Touchscreen to DT schema
Date: Wed,  1 Oct 2025 15:38:09 -0300
Message-ID: <20251001183809.83472-1-ariel.dalessandro@collabora.com>
X-Mailer: git-send-email 2.51.0
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-ZohoMailClient: External

Convert the existing text-based DT bindings for MELFAS MIP4 Touchscreen
controller to a DT schema.

Signed-off-by: Ariel D'Alessandro <ariel.dalessandro@collabora.com>
Reviewed-by: Rob Herring (Arm) <robh@kernel.org>
Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 .../input/touchscreen/melfas,mip4_ts.yaml     | 56 +++++++++++++++++++
 .../input/touchscreen/melfas_mip4.txt         | 20 -------
 2 files changed, 56 insertions(+), 20 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/input/touchscreen/melfas,mip4_ts.yaml
 delete mode 100644 Documentation/devicetree/bindings/input/touchscreen/melfas_mip4.txt

diff --git a/Documentation/devicetree/bindings/input/touchscreen/melfas,mip4_ts.yaml b/Documentation/devicetree/bindings/input/touchscreen/melfas,mip4_ts.yaml
new file mode 100644
index 0000000000000..314be65c56caa
--- /dev/null
+++ b/Documentation/devicetree/bindings/input/touchscreen/melfas,mip4_ts.yaml
@@ -0,0 +1,56 @@
+# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/input/touchscreen/melfas,mip4_ts.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: MELFAS MIP4 Touchscreen
+
+maintainers:
+  - Ariel D'Alessandro <ariel.dalessandro@collabora.com>
+
+properties:
+  compatible:
+    const: melfas,mip4_ts
+
+  reg:
+    description: I2C address of the chip (0x48 or 0x34)
+    maxItems: 1
+
+  interrupts:
+    maxItems: 1
+
+  ce-gpios:
+    description:
+      GPIO connected to the CE (chip enable) pin of the chip (active high)
+    maxItems: 1
+
+required:
+  - compatible
+  - reg
+  - interrupts
+
+additionalProperties: false
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
+        touchscreen@34 {
+            compatible = "melfas,mip4_ts";
+            reg = <0x34>;
+
+            interrupts-extended = <&tlmm 13 IRQ_TYPE_EDGE_FALLING>;
+            ce-gpios = <&tlmm 12 GPIO_ACTIVE_HIGH>;
+
+            pinctrl-0 = <&touchscreen_default>;
+            pinctrl-names = "default";
+        };
+    };
+
+...
diff --git a/Documentation/devicetree/bindings/input/touchscreen/melfas_mip4.txt b/Documentation/devicetree/bindings/input/touchscreen/melfas_mip4.txt
deleted file mode 100644
index b2ab5498e5190..0000000000000
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
2.51.0


