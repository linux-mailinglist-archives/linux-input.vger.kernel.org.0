Return-Path: <linux-input+bounces-3463-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 21C388BC406
	for <lists+linux-input@lfdr.de>; Sun,  5 May 2024 23:48:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 5319B1C21118
	for <lists+linux-input@lfdr.de>; Sun,  5 May 2024 21:48:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3A780136E13;
	Sun,  5 May 2024 21:48:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=kemnade.info header.i=@kemnade.info header.b="qMSfeUDM"
X-Original-To: linux-input@vger.kernel.org
Received: from mail2.andi.de1.cc (vmd64148.contaboserver.net [161.97.139.27])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 93FA2135A73;
	Sun,  5 May 2024 21:48:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=161.97.139.27
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714945728; cv=none; b=cN1lwW6Pf/lqqZrmdkSYNL7nEl/bMgAfUQs/g0u5fz/sKTEcyy+RyneVur+fLxOBvnyAhage1hIEFvV27Qso0Y4KpWE3p6rrgprEjiIPoTCTdW6KaA4qALtha5FKyMJ1y0sXxWcmdeVNiTWbFThfNEPEEV0nZyeKBirLbvbeoUs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714945728; c=relaxed/simple;
	bh=JqftZOBROHB7NDMLLUBkN2gSJoBeMNEhVZ+5p5CrOTY=;
	h=From:To:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=AQ1cIM+k2lnq0UoiVjHeOIczh/8TgF4NpUeohganhFBqw+Og1fYLcQSaXzwc1TrPQYJ6Cq7hP/AEDAsNvA4NqWpsbtnpztI0PYMM/Tg1vX3ZUko/KuomwnNFI76XH/lXcMbDNIbU+LceqRfOA75r6vKb2ihvZe1uCivkSsoBHxM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kemnade.info; spf=pass smtp.mailfrom=kemnade.info; dkim=pass (2048-bit key) header.d=kemnade.info header.i=@kemnade.info header.b=qMSfeUDM; arc=none smtp.client-ip=161.97.139.27
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kemnade.info
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kemnade.info
Received: from mail.andi.de1.cc ([2a02:c205:3004:2154::1])
	by mail2.andi.de1.cc with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <andreas@kemnade.info>)
	id 1s3jiq-005kk0-15;
	Sun, 05 May 2024 23:48:41 +0200
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=kemnade.info; s=20220719; h=Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-Id:Date:Subject:To:From:Sender:Reply-To:Cc:
	Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
	List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=yXjkb0l1HEEZRrAe8oSGj/9/GnOCVXNmuf6WaMu1Sk4=; b=qMSfeUDM8/+UHT0PZMHAAGYAj2
	tJ2TRUnSwLsFPo/6wkjt9BZBpoBavtrDccVRGYwoki6zf6rMbMKG5o8lO1BxA0PhKuOpUTxcAzlXg
	2RFmCQNei0rlZQm75e8lyE5otXXonQyEgT1n5Vq2/0UXmeqxbsn5bIPvFZGNNqeqJtsLcuDQN0BMg
	yyXhweKVTqGT4NIGxUdciDJaBspP7hQqAvfwoQNNsdGAIjWKbT0kZGXHF7fUeDntugBBipCeuDtH9
	BIKitK1wP/DU4Uc74nYio3N6wWtXlUl5r0Rog31gHeYxMHzcVH6AyoPh6J/ape4o1i5eQ3lnLGqSI
	DiCKS6Ww==;
Received: from p200300c20737c2001a3da2fffebfd33a.dip0.t-ipconnect.de ([2003:c2:737:c200:1a3d:a2ff:febf:d33a] helo=aktux)
	by mail.andi.de1.cc with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <andreas@kemnade.info>)
	id 1s3jim-000cc8-1b;
	Sun, 05 May 2024 23:48:37 +0200
Received: from andi by aktux with local (Exim 4.96)
	(envelope-from <andreas@kemnade.info>)
	id 1s3jin-003jyV-1c;
	Sun, 05 May 2024 23:48:37 +0200
From: Andreas Kemnade <andreas@kemnade.info>
To: dmitry.torokhov@gmail.com,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	andreas@kemnade.info,
	u.kleine-koenig@pengutronix.de,
	hdegoede@redhat.com,
	andy.shevchenko@gmail.com,
	siebren.vroegindeweij@hotmail.com,
	linux-input@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 1/3] dt-bindings: touchscreen: convert elan,ektf2127 to json-schema
Date: Sun,  5 May 2024 23:47:52 +0200
Message-Id: <20240505214754.891700-2-andreas@kemnade.info>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240505214754.891700-1-andreas@kemnade.info>
References: <20240505214754.891700-1-andreas@kemnade.info>
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


