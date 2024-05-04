Return-Path: <linux-input+bounces-3454-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id F1D2D8BBDE8
	for <lists+linux-input@lfdr.de>; Sat,  4 May 2024 21:48:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 2F81E1C20CD0
	for <lists+linux-input@lfdr.de>; Sat,  4 May 2024 19:48:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6CBA284FAA;
	Sat,  4 May 2024 19:47:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mff.cuni.cz header.i=@mff.cuni.cz header.b="YIzlC84L"
X-Original-To: linux-input@vger.kernel.org
Received: from smtp1.ms.mff.cuni.cz (smtp-in1.ms.mff.cuni.cz [195.113.20.234])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6CB5084A53;
	Sat,  4 May 2024 19:47:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.113.20.234
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714852060; cv=none; b=jl8368+6l5fTwEaCKffW7upzKreXGiJjiquQtEyKA31X2CMXSlQidgDAyalx0wE9GVlDHXNKJMsRFV9yoFdJDY+MUlrBGIOLSAKhebzFPTZhj8PvohLCzlYfWjXUf1+DwAb6gaGbiu8gsD5HhfOb3LqhVzbhi6Pj/zzYH5v+YKw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714852060; c=relaxed/simple;
	bh=pxdGHqYKtxSvHPrIVyd0Y84o9/pDLy//Ve22cvKWMW4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=BV6Z/452bGTdjlexPm4vFzz1lcapDk/Q2ulrUGo3pDTamHTnYmSM42DResSGINbDKp9u9LhQaqMnoRhB0wPlEd9x4H7cmIF8O9kYX5JaoZCbLxHhbouvhM5HvFQqgldE+AXHIMbE4tneU3MVqRWyGxKLdIPEkD4vusuDo0Cm0LE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=matfyz.cz; spf=pass smtp.mailfrom=matfyz.cz; dkim=pass (2048-bit key) header.d=mff.cuni.cz header.i=@mff.cuni.cz header.b=YIzlC84L; arc=none smtp.client-ip=195.113.20.234
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=matfyz.cz
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=matfyz.cz
X-SubmittedBy: id balejk@matfyz.cz subject /postalCode=110+2000/O=Univerzita+20Karlova/street=Ovocn+5CxC3+5CxBD+20trh+20560/5/ST=Praha,+20Hlavn+5CxC3+5CxAD+20m+5CxC4+5Cx9Bsto/C=CZ/CN=Karel+20Balej/emailAddress=balejk@matfyz.cz
	serial F5FD910E8FE2121B897F7E55B84E351D
	issued by /C=NL/O=GEANT+20Vereniging/CN=GEANT+20Personal+20CA+204
	auth type TLS.CUNI
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mff.cuni.cz;
	s=submission; t=1714852024; x=1716152024;
	bh=SVNnWK/qcWbnoPIGMZtbef7rLPL/exkv8m8cWxVTupY=; h=From;
	b=YIzlC84LqEvPUM58OhcUV6xV7W4W0tkPZrBHMiRbGZACp9knFzso9N9FCSfe28VXY
	 XF2mnw+NFbAsHj+UrI0fS4lhHDzsJ+wlJTXx/UydWbFt+DmmvVMwjBsP9RU9PXfNsl
	 TR5cU0byoIE7ObFW3XP/LFUUs/yREwBjuEMMMJYyWp8MGHyz+AV2QANZE1gK6yjntf
	 aTQCvO8yXiU2uxBf5cv4cHP6h30sOu+E+f8DKkLKVgbYRZDJQNxq+Jhh1YMNzU4n7H
	 zL8abpWRCK/WJ3ImgSXUmHuvzFol9Ef4R6Y0rRmMrBfys7mT9Q5NS/ZrRWGfx4j65v
	 Rh0NTbRKfyryA==
Received: from localhost (internet5.mraknet.com [185.200.108.250])
	(authenticated)
	by smtp1.ms.mff.cuni.cz (8.16.1/8.16.1) with ESMTPS id 444Jl3F2074191
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=OK);
	Sat, 4 May 2024 21:47:04 +0200 (CEST)
	(envelope-from balejk@matfyz.cz)
From: Karel Balej <balejk@matfyz.cz>
To: Lee Jones <lee@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-input@vger.kernel.org
Cc: =?UTF-8?q?Duje=20Mihanovi=C4=87?= <duje.mihanovic@skole.hr>,
        ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
        balejk@matfyz.cz
Subject: [PATCH v6 1/5] dt-bindings: mfd: add entry for Marvell 88PM886 PMIC
Date: Sat,  4 May 2024 21:37:04 +0200
Message-ID: <20240504194632.2456-2-balejk@matfyz.cz>
X-Mailer: git-send-email 2.45.0
In-Reply-To: <20240504194632.2456-1-balejk@matfyz.cz>
References: <20240504194632.2456-1-balejk@matfyz.cz>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Marvell 88PM886 is a PMIC with several subdevices such as onkey,
regulators or battery and charger. It comes in at least two revisions,
A0 and A1 -- only A1 is described here at the moment.

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Signed-off-by: Karel Balej <balejk@matfyz.cz>
---

Notes:
    RFC v4:
    - Address Krzysztof's comments:
      - Fix regulators indentation.
      - Add Krzysztof's trailer.
    RFC v3:
    - Add wakeup-source property.
    - Address Rob's feedback:
      - Move regulators into the MFD file.
      - Remove interrupt-controller and #interrupt-cells properties.
    RFC v2:
    - Address Rob's feedback:
      - Drop mention of 88PM880.
      - Make sure the file passes bindings check (add the necessary header
        and fix `interrupt-cells`).
      - Other small changes.
    - Add regulators. Changes with respect to the regulator RFC series:
      - Address Krzysztof's comments:
        - Drop unused compatible.
        - Fix sub-node pattern.

 .../bindings/mfd/marvell,88pm886-a1.yaml      | 76 +++++++++++++++++++
 1 file changed, 76 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/mfd/marvell,88pm886-a1.yaml

diff --git a/Documentation/devicetree/bindings/mfd/marvell,88pm886-a1.yaml b/Documentation/devicetree/bindings/mfd/marvell,88pm886-a1.yaml
new file mode 100644
index 000000000000..d6a71c912b76
--- /dev/null
+++ b/Documentation/devicetree/bindings/mfd/marvell,88pm886-a1.yaml
@@ -0,0 +1,76 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/mfd/marvell,88pm886-a1.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Marvell 88PM886 PMIC core
+
+maintainers:
+  - Karel Balej <balejk@matfyz.cz>
+
+description:
+  Marvell 88PM886 is a PMIC providing several functions such as onkey,
+  regulators or battery and charger.
+
+properties:
+  compatible:
+    const: marvell,88pm886-a1
+
+  reg:
+    maxItems: 1
+
+  interrupts:
+    maxItems: 1
+
+  wakeup-source: true
+
+  regulators:
+    type: object
+    additionalProperties: false
+    patternProperties:
+      "^(ldo(1[0-6]|[1-9])|buck[1-5])$":
+        type: object
+        $ref: /schemas/regulator/regulator.yaml#
+        description: LDO or buck regulator.
+        unevaluatedProperties: false
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
+    #include <dt-bindings/interrupt-controller/irq.h>
+    i2c {
+      #address-cells = <1>;
+      #size-cells = <0>;
+      pmic@30 {
+        compatible = "marvell,88pm886-a1";
+        reg = <0x30>;
+        interrupts = <0 4 IRQ_TYPE_LEVEL_HIGH>;
+        interrupt-parent = <&gic>;
+        wakeup-source;
+
+        regulators {
+          ldo2: ldo2 {
+            regulator-min-microvolt = <3100000>;
+            regulator-max-microvolt = <3300000>;
+          };
+
+          ldo15: ldo15 {
+            regulator-min-microvolt = <3300000>;
+            regulator-max-microvolt = <3300000>;
+          };
+
+          buck2: buck2 {
+            regulator-min-microvolt = <1800000>;
+            regulator-max-microvolt = <1800000>;
+          };
+        };
+      };
+    };
+...
-- 
2.45.0


