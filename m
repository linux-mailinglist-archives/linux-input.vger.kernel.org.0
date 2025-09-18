Return-Path: <linux-input+bounces-14848-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 02E5DB8508C
	for <lists+linux-input@lfdr.de>; Thu, 18 Sep 2025 16:09:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id F14D07C2A52
	for <lists+linux-input@lfdr.de>; Thu, 18 Sep 2025 14:07:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B3CE230FC0E;
	Thu, 18 Sep 2025 14:05:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mainlining.org header.i=@mainlining.org header.b="TKXzhdtn";
	dkim=permerror (0-bit key) header.d=mainlining.org header.i=@mainlining.org header.b="vfKX71Ib"
X-Original-To: linux-input@vger.kernel.org
Received: from mail.mainlining.org (mail.mainlining.org [5.75.144.95])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F0CC930F7FF;
	Thu, 18 Sep 2025 14:05:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=5.75.144.95
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758204359; cv=none; b=ikWatQNZYGW29FAXuxcnE2XQ7MBjuUJ9AcjS7wfYmJHnRpt215Vtyog+yhyGwAQlyrgI/HQhovgEu5WIkKzwJQmBWsSMOvuKzG628Ixp1F7iH64++KbEm62RCYP54vBcqffw/Ho7eqODl8VdOB+h3a7mv2zrmLTSSD5mkCpvy3I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758204359; c=relaxed/simple;
	bh=BaIFuhOdWS550GfDk5xRaiCGr7whdWY9iLeJhUBxzXw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=AjqRb6FvJrlF6rRqw74r69CrZLeC7u+ZMbF7rXVrDcyKeq76duSR1Ty06QKWhfRf/WTiRfiBRciWx3YXjjf+D0X2f47xus/da5Sy3jeev5amKlwQHA+44MmH9dw78jvPiJJiqPPUEfbYx699BjuE/wkjeQqUl60Vuf7sbuWo0NI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mainlining.org; spf=pass smtp.mailfrom=mainlining.org; dkim=pass (2048-bit key) header.d=mainlining.org header.i=@mainlining.org header.b=TKXzhdtn; dkim=permerror (0-bit key) header.d=mainlining.org header.i=@mainlining.org header.b=vfKX71Ib; arc=none smtp.client-ip=5.75.144.95
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mainlining.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mainlining.org
DKIM-Signature: v=1; a=rsa-sha256; s=202507r; d=mainlining.org; c=relaxed/relaxed;
	h=To:Message-Id:Subject:Date:From; t=1758204200; bh=lWrv9lnJZaC2TX4+SGPSERu
	hETFPVBGyWJgT+xONhGs=; b=TKXzhdtnVNYatqUAFKqzQhRv1MOK5ilvgOFPqEV8lAgTI6EQ7k
	eYwfSJhMknqWPTGnkp5Zeqm88sNvI160E2W1Le9Xrd/2Cxbl88bi0J/rN2D5hzINOq9fo1QUCpP
	OAwqacJXV0kFLEuCOidOBwju7Na8VQH0Dk4EgwPHl0vp6Pe37D6phpLd9lbFDUdfUw2t4+k6MoF
	zdFoeBFmWUgKMzteSywmY6WSU+/afzzpDWLslwfvjCpj3Pm70lvYDtbqxwxC+NdKjhNA4B5qAsI
	F5q6gpRdyiOhyHZfmhTerQuTzVUpyVF4rgh2OvoeBUnUFxkSqwFMuIIIk3oBI+UZ27Q==;
DKIM-Signature: v=1; a=ed25519-sha256; s=202507e; d=mainlining.org; c=relaxed/relaxed;
	h=To:Message-Id:Subject:Date:From; t=1758204200; bh=lWrv9lnJZaC2TX4+SGPSERu
	hETFPVBGyWJgT+xONhGs=; b=vfKX71IbYFs+5nBBafBYtO0khc0xRg95CQmGqwCXfTfKmlB/gK
	UQfnWjvviFLrlz7Ohvh4WHRwNqTmVA5hEOAA==;
From: Jens Reidel <adrian@mainlining.org>
Date: Thu, 18 Sep 2025 16:02:48 +0200
Subject: [PATCH RFC 1/3] dt-bindings: input: document Goodix GTX8
 Touchscreen ICs
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250918-gtx8-v1-1-cba879c84775@mainlining.org>
References: <20250918-gtx8-v1-0-cba879c84775@mainlining.org>
In-Reply-To: <20250918-gtx8-v1-0-cba879c84775@mainlining.org>
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Hans de Goede <hansg@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Henrik Rydberg <rydberg@bitmath.org>
Cc: linux-input@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux@mainlining.org, 
 phone-devel@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht, 
 Jens Reidel <adrian@mainlining.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2288; i=adrian@mainlining.org;
 h=from:subject:message-id; bh=BaIFuhOdWS550GfDk5xRaiCGr7whdWY9iLeJhUBxzXw=;
 b=owGbwMvMwCWmfPDpV6GDysyMp9WSGDLOCKrNkt4TK3zEQnrSvpqLif1XswNuatgo8nmYMLfa5
 X5fGLWvo5SFQYyLQVZMkaX+RoLJVetvh+bn26yGmcPKBDKEgYtTACby3IXhf3TiPq7+PeWnd5+d
 MeNWE5P8QdmC97MOJ73PcZxVtuzyznWMDM+r0rNWi866ybu/6WuqUcNJ3oR259UvnknaHzuamK0
 TxgEA
X-Developer-Key: i=adrian@mainlining.org; a=openpgp;
 fpr=7FD86034D53BF6C29F6F3CAB23C1E5F512C12303

Document the Goodix GT9886 and GT9896 which are part of the GTX8 series
of Touchscreen controller ICs from Goodix.

Signed-off-by: Jens Reidel <adrian@mainlining.org>
---
 .../bindings/input/touchscreen/goodix,gt9886.yaml  | 71 ++++++++++++++++++++++
 1 file changed, 71 insertions(+)

diff --git a/Documentation/devicetree/bindings/input/touchscreen/goodix,gt9886.yaml b/Documentation/devicetree/bindings/input/touchscreen/goodix,gt9886.yaml
new file mode 100644
index 0000000000000000000000000000000000000000..b1635032c81105836775d3c9b17977c25b1921e4
--- /dev/null
+++ b/Documentation/devicetree/bindings/input/touchscreen/goodix,gt9886.yaml
@@ -0,0 +1,71 @@
+# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/input/touchscreen/goodix,gt9886.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Goodix GTX8 series touchscreen controller
+
+maintainers:
+  - Jens Reidel <adrian@mainlining.org>
+
+allOf:
+  - $ref: touchscreen.yaml#
+
+properties:
+  compatible:
+    enum:
+      - goodix,gt9886
+      - goodix,gt9896
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
+  avdd-supply:
+    description: Analog power supply regulator on AVDD pin
+
+  vddio-supply:
+    description: power supply regulator on VDDIO pin
+
+  touchscreen-inverted-x: true
+  touchscreen-inverted-y: true
+  touchscreen-size-x: true
+  touchscreen-size-y: true
+  touchscreen-swapped-x-y: true
+
+additionalProperties: false
+
+required:
+  - compatible
+  - reg
+  - interrupts
+  - avdd-supply
+  - touchscreen-size-x
+  - touchscreen-size-y
+
+examples:
+  - |
+    #include <dt-bindings/interrupt-controller/irq.h>
+    #include <dt-bindings/gpio/gpio.h>
+    i2c {
+      #address-cells = <1>;
+      #size-cells = <0>;
+      touchscreen@5d {
+        compatible = "goodix,gt9886";
+        reg = <0x5d>;
+        interrupt-parent = <&gpio>;
+        interrupts = <9 IRQ_TYPE_LEVEL_LOW>;
+        reset-gpios = <&gpio1 8 GPIO_ACTIVE_LOW>;
+        avdd-supply = <&ts_avdd>;
+        touchscreen-size-x = <1080>;
+        touchscreen-size-y = <2340>;
+      };
+    };
+
+...

-- 
2.51.0


