Return-Path: <linux-input+bounces-17116-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 90C8BD25AFA
	for <lists+linux-input@lfdr.de>; Thu, 15 Jan 2026 17:19:31 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 78B633008C62
	for <lists+linux-input@lfdr.de>; Thu, 15 Jan 2026 16:19:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B91803B8D7E;
	Thu, 15 Jan 2026 16:19:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="qKR/eMpW";
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="ktLSB1FD"
X-Original-To: linux-input@vger.kernel.org
Received: from mout-p-202.mailbox.org (mout-p-202.mailbox.org [80.241.56.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E7E93B8D7C;
	Thu, 15 Jan 2026 16:19:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.241.56.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768493954; cv=none; b=YBSUOHO6jDGx16B4DbTWt2dbEuNKe1kABl+BCBpt6PlHyGSf49fbjdfSdEzWex3++Grh8zdFmBBvYv+Z87QXuZD6K7TIWajZNhcU498L+ZY4+BMyZ6JS2ids5JWApxgU7WDBaZTG1n/L4pZV6PxR+fnSdikpSZNg6WbQaPvggQM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768493954; c=relaxed/simple;
	bh=RF383TaLUd1pEIXWlS46S8YghSF6y60dVTNmg8WY26g=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Xl+TjVdtj2ilqmqSLB+N7jwznT57T+K/rs2xAQt1ysUDuhwSRt/Wm4jyGMKfNKM9GtNEh4sPu4v6lM1HYX2QxFIxnihdWwnm1Jz9r3ELnGYhfBaEgfjtcIwdLD3eZIoHIrRLCbPPypymUyh9Uwm7iYljmsd+M5lRykGKjgTLC4w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org; spf=pass smtp.mailfrom=mailbox.org; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=qKR/eMpW; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=ktLSB1FD; arc=none smtp.client-ip=80.241.56.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mailbox.org
Received: from smtp102.mailbox.org (smtp102.mailbox.org [10.196.197.102])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-202.mailbox.org (Postfix) with ESMTPS id 4dsSq20myZz9syt;
	Thu, 15 Jan 2026 17:19:10 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1768493950;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=16LcqABaAazl+snSHHcxi1+Mopm/hBQsbVtc+xjvqJI=;
	b=qKR/eMpWHxMMFULrVi5khh3KKfPxfqYtkIcZYY9CovyU4IH8QkD4CoSmsXKe2lFRAUFcXj
	LD+v8XBaHYRyuXftdkVWsIkXlSnoAxd+zTPBA7gRUvltJo8S1FYA0H0pOPn5ljOlyr/BGo
	h1i0ZN3VAqnU9b+SagZ7GpeACxdFoG8b5LJJ/JhNgiboKnMAroFS9GbJrQDsmAhpBc3ntt
	khpQdMR/AXD85djJEfPGQ7wHog4T5nDKecTXLkSxwKh86VJDgpDaJq8VSh65HywP7jcoeM
	8yTlhvlXUroVBTSjRBClUgyhkWpdtfRTHlM9t0F6Zmt4B6d/h47jWiEC/nYCNQ==
From: Marek Vasut <marek.vasut+renesas@mailbox.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1768493947;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=16LcqABaAazl+snSHHcxi1+Mopm/hBQsbVtc+xjvqJI=;
	b=ktLSB1FDNP8IsvArcN8XxQgK5orWng0EOuhBt8q38xx6KfF/sW/U1B6lnMD7edenX0fbIf
	JKYVx50J11qE3GkU7u+3YTrrFtxVYgXSfzkRCKryxrctKHqtr4ZXa7gRk7jnWuL5FDBXMn
	6LSUu8yo4f6s5EQ+0e3xFObAy2NClNg5VrwOggLkvWzOMUxyuz5yuvZjZ+UVxYHzFak+Wf
	PJCzkD3mSiwnMBBwcW22OqLg33jaFYrXaMa7W19DP5gJTVkFGjDbYIFhDrKrMFBFMnI1Qe
	nCY31epc2/A7Yz0kg4VzJrBQkRpVY22ikNObTBHEN7ZYEDkkBIxvaFbPoscM4A==
To: linux-input@vger.kernel.org
Cc: Marek Vasut <marek.vasut+renesas@mailbox.org>,
	Frank Li <Frank.Li@nxp.com>,
	Conor Dooley <conor+dt@kernel.org>,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Job Noorman <job@noorman.info>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Rob Herring <robh@kernel.org>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org
Subject: [PATCH v3 1/3] dt-bindings: touchscreen: trivial-touch: Drop 'interrupts' requirement for old Ilitek
Date: Thu, 15 Jan 2026 17:18:07 +0100
Message-ID: <20260115161858.20226-1-marek.vasut+renesas@mailbox.org>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-MBO-RS-ID: 389f7d00e9600d5212c
X-MBO-RS-META: 7mnw9ospjqq4t6auwrswfjyszt4m9u5t

The old Ilitek touch controllers V3 and V6 can operate without
interrupt line, in polling mode. Drop the 'interrupts' property
requirement for those four controllers. To avoid overloading the
trivial-touch, fork the old Ilitek V3/V6 touch controller binding
into separate document.

Reviewed-by: Frank Li <Frank.Li@nxp.com>
Signed-off-by: Marek Vasut <marek.vasut+renesas@mailbox.org>
---
Cc: Conor Dooley <conor+dt@kernel.org>
Cc: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: Frank Li <Frank.Li@nxp.com>
Cc: Job Noorman <job@noorman.info>
Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>
Cc: Rob Herring <robh@kernel.org>
Cc: devicetree@vger.kernel.org
Cc: linux-input@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
Cc: linux-renesas-soc@vger.kernel.org
---
V2: Fork the Ilitek V3/V6 bindings into separate document
V3: Add RB from Frank
---
 .../input/touchscreen/ilitek,ili210x.yaml     | 51 +++++++++++++++++++
 .../input/touchscreen/trivial-touch.yaml      |  4 --
 2 files changed, 51 insertions(+), 4 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/input/touchscreen/ilitek,ili210x.yaml

diff --git a/Documentation/devicetree/bindings/input/touchscreen/ilitek,ili210x.yaml b/Documentation/devicetree/bindings/input/touchscreen/ilitek,ili210x.yaml
new file mode 100644
index 0000000000000..1d02aaba64f97
--- /dev/null
+++ b/Documentation/devicetree/bindings/input/touchscreen/ilitek,ili210x.yaml
@@ -0,0 +1,51 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/input/touchscreen/ilitek,ili210x.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Ilitek ILI21xx/ILI251x V3/V6 touch screen controller with i2c interface
+
+maintainers:
+  - Frank Li <Frank.Li@nxp.com>
+  - Marek Vasut <marek.vasut+renesas@mailbox.org>
+
+properties:
+  compatible:
+    enum:
+      - ilitek,ili210x
+      - ilitek,ili2117
+      - ilitek,ili2120
+      - ilitek,ili251x
+
+  reg:
+    maxItems: 1
+
+  interrupts:
+    maxItems: 1
+
+  reset-gpios:
+    maxItems: 1
+
+  wakeup-source: true
+
+allOf:
+  - $ref: touchscreen.yaml
+
+required:
+  - compatible
+  - reg
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    i2c {
+        #address-cells = <1>;
+        #size-cells = <0>;
+
+        touchscreen@41 {
+            compatible = "ilitek,ili2120";
+            reg = <0x41>;
+        };
+    };
diff --git a/Documentation/devicetree/bindings/input/touchscreen/trivial-touch.yaml b/Documentation/devicetree/bindings/input/touchscreen/trivial-touch.yaml
index fa27c6754ca4e..6441d21223caf 100644
--- a/Documentation/devicetree/bindings/input/touchscreen/trivial-touch.yaml
+++ b/Documentation/devicetree/bindings/input/touchscreen/trivial-touch.yaml
@@ -23,9 +23,6 @@ properties:
       # Hynitron cstxxx series touchscreen controller
       - hynitron,cst340
       # Ilitek I2C Touchscreen Controller
-      - ilitek,ili210x
-      - ilitek,ili2117
-      - ilitek,ili2120
       - ilitek,ili2130
       - ilitek,ili2131
       - ilitek,ili2132
@@ -33,7 +30,6 @@ properties:
       - ilitek,ili2322
       - ilitek,ili2323
       - ilitek,ili2326
-      - ilitek,ili251x
       - ilitek,ili2520
       - ilitek,ili2521
       # MAXI MAX11801 Resistive touch screen controller with i2c interface
-- 
2.51.0


