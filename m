Return-Path: <linux-input+bounces-17104-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A61BD22220
	for <lists+linux-input@lfdr.de>; Thu, 15 Jan 2026 03:35:45 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id D536830158C3
	for <lists+linux-input@lfdr.de>; Thu, 15 Jan 2026 02:35:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0DB9925333F;
	Thu, 15 Jan 2026 02:35:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="MNC3zM8u";
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="tH6Ndhcs"
X-Original-To: linux-input@vger.kernel.org
Received: from mout-p-102.mailbox.org (mout-p-102.mailbox.org [80.241.56.152])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 51BA146BF;
	Thu, 15 Jan 2026 02:35:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.241.56.152
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768444541; cv=none; b=pVHjSvWoOY8Atc1JuuTHTq+SosUaAKJpRdM/t5PObn+MjE/rWOBil7duOjztRGQdi7LiXfVb+UzEEtJqC+jNn+TdMKmvwCK3DzFr86Gx6u/STaH69kLjAWj6tvN2Dc9sexf4YKG2XNIgbc87AC2fFXbK0HSU8MV/gmXAHfHvhjk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768444541; c=relaxed/simple;
	bh=EepzTtwSOLxFYUvRhOByAf4NX8UUW2eXLxlZ52P6DM8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=MqYUvMICqqOR6u6bo3llVtf92BN2426aWQFj9xmsShN+1mRIMDXOr6aNd/dsLvndnIy2UodlWa6vxcu5ir4aM5aqtS3k4MS7ps2WymLm/BT5eKnBDC+zZddohlgJrmfy/zsUdyIBljKsAyyg4qyDp7UAbKTb3bi5UwdY47S2eTs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org; spf=pass smtp.mailfrom=mailbox.org; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=MNC3zM8u; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=tH6Ndhcs; arc=none smtp.client-ip=80.241.56.152
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mailbox.org
Received: from smtp102.mailbox.org (smtp102.mailbox.org [IPv6:2001:67c:2050:b231:465::102])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-102.mailbox.org (Postfix) with ESMTPS id 4ds6Xp0hrJz9t32;
	Thu, 15 Jan 2026 03:35:38 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1768444538;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=/IFVEHud5UojcTZcWh0XzlQzDkXoFLoKiXehoDpPkCA=;
	b=MNC3zM8u2r5vnl1RHTK0MFBjXMH+bXTsznt9HnsjUmx3b33lNrUrIaCee0jw+oHd6lbiLo
	8ti4Ys2fNBZm9qRLdUg/ZHMZjffvpgDPvFqZGxp2MyOKVFqh4nELplpVVXp5klf1WfG2kd
	f2CsN85yslFv0OLyssYqxy2F5Bl/+NQdiwqlORFM2UrSmqB9nqvRLKz0qfQ37HtwVy6/jT
	Zns1ULJ2g4nG5yw6qtbUoAHvjytipVyN86BZuPqDq+adfJaDA4eudJVr37Bkh6eEbeirQJ
	U5gCbY2MIJE5GPFUVzPm6EBm7otAAlksexkBMOFX+Cm2AAfm4NnTDXiPFmQyWw==
Authentication-Results: outgoing_mbo_mout;
	dkim=pass header.d=mailbox.org header.s=mail20150812 header.b=tH6Ndhcs;
	spf=pass (outgoing_mbo_mout: domain of marek.vasut+renesas@mailbox.org designates 2001:67c:2050:b231:465::102 as permitted sender) smtp.mailfrom=marek.vasut+renesas@mailbox.org
From: Marek Vasut <marek.vasut+renesas@mailbox.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1768444535;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=/IFVEHud5UojcTZcWh0XzlQzDkXoFLoKiXehoDpPkCA=;
	b=tH6NdhcsKB+nELk0Y7E+NK6s65xCF0Zxfok0kANBsvZ0wdEEpx0Njs4eELa1PN5e5lQpep
	+wY/384jBwG0FPqacVd+DkBoLKlLemeeEuxUXv9wyKv7tMa9od0icmLZT5APnCPWGOZOo/
	LBF6ZLIOSGwByledK0PgtK/XpdjwU1JOhgTKuHdA+5RyicZuVkvPyWDuVbzYuZZRK1F160
	+ud5y6/htCcZdzP21r+i2Xm6ZBaCad50tzJ4w1G2EZU158O1W5d9vtsvDicaJiz1EVAlQs
	+gltHr1sKtnBplr4QCpcwxsBzb6BY4ewiieFtQamrHDdrMmXBTj+L41Pr7DQgQ==
To: linux-input@vger.kernel.org
Cc: Marek Vasut <marek.vasut+renesas@mailbox.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Frank Li <Frank.Li@nxp.com>,
	Job Noorman <job@noorman.info>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Rob Herring <robh@kernel.org>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org
Subject: [PATCH v2 1/2] dt-bindings: touchscreen: trivial-touch: Drop 'interrupts' requirement for old Ilitek
Date: Thu, 15 Jan 2026 03:34:58 +0100
Message-ID: <20260115023530.656645-1-marek.vasut+renesas@mailbox.org>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-MBO-RS-ID: 189e044311892561c91
X-MBO-RS-META: 4jbezsu546g5sa3mmwmnruqyrdjs77gz
X-Rspamd-Queue-Id: 4ds6Xp0hrJz9t32

The old Ilitek touch controllers V3 and V6 can operate without
interrupt line, in polling mode. Drop the 'interrupts' property
requirement for those four controllers. To avoid overloading the
trivial-touch, fork the old Ilitek V3/V6 touch controller binding
into separate document.

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


