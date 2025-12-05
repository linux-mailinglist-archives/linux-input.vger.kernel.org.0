Return-Path: <linux-input+bounces-16471-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 218B1CA83A5
	for <lists+linux-input@lfdr.de>; Fri, 05 Dec 2025 16:38:50 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 65BA3332E94B
	for <lists+linux-input@lfdr.de>; Fri,  5 Dec 2025 15:32:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E354D2FD1C5;
	Fri,  5 Dec 2025 15:30:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.de header.i=hendrik-noack@gmx.de header.b="Xt/cqJI3"
X-Original-To: linux-input@vger.kernel.org
Received: from mout.gmx.net (mout.gmx.net [212.227.15.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 476922F5A18;
	Fri,  5 Dec 2025 15:29:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.15.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764948604; cv=none; b=sO1dqHZ7YzCJ/dJH2zFbnUNCm+Mq+pKGmjLd8i4IE3hbs4d8+cXyomRJrv0jJzYCT3W4FjxAE/ja3M+gDjqpC55Rh8lGi0OOW2pEO/uUclQCMsbDBMeR0AU10gJJlB1LgdjxmIwJuLXlmBN5oXGIaO7Y0wu23F+WFJc3MryFXNk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764948604; c=relaxed/simple;
	bh=/Bykqzkgm3K396KP+IqPaLGif6rfN/e3s2wJUcVW7xg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=SD+IUH6i7QrLqDrCBucl2f9GtK89sDTpxAfIRovB+fPvYLP2R880VFG5wOdNeM6uZGFSdAZgCpLJcDsqhA9tB8o3zWlKyYrihCrK8zhl59QtN48nbOHU5QUyShNJUHAVyb4clQoSQMnO5/Lf57j5+hO35nqvEJuLJXla7aJNpG4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de; spf=pass smtp.mailfrom=gmx.de; dkim=pass (2048-bit key) header.d=gmx.de header.i=hendrik-noack@gmx.de header.b=Xt/cqJI3; arc=none smtp.client-ip=212.227.15.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
	s=s31663417; t=1764948577; x=1765553377; i=hendrik-noack@gmx.de;
	bh=yRuHwEjKxk05uLV9zF6k054IxJGlnwVFKhsin2me5N8=;
	h=X-UI-Sender-Class:From:To:Cc:Subject:Date:Message-ID:In-Reply-To:
	 References:MIME-Version:Content-Transfer-Encoding:cc:
	 content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=Xt/cqJI3kIT22roHIXffd+2DCJur7zBIk7vFECJERvX4zC1DD/zwyMk5yMflw0IQ
	 /z+wcKSyUcxnmteejMcwpCEnHNERAXD5lcaRw4oiY1brwm3qe45hvfLzTBM/JEsGj
	 h9SzBINFG7Spvhf2vP7WuVxf7a+rYf6p328964C6Ywke7xQVJPlPGkJ1F6tb8UoFE
	 AMPsi92sm0ip/cNdMwIKK2LyVATou7SUboZQcDIjP/jFGqk30QmR2/fKNoRjUmfTC
	 QTlTkDXC8hqkuPKLBlpm1hkOEHFhnsy6vvtckxkoadoaIF+qX/2cFn9dD41r7h3wh
	 k9FPB4L21OneXSZTAw==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from guguhost.ddns.net ([217.85.36.251]) by mail.gmx.net (mrgmx005
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1Mqs0R-1vnd5M1iCX-00hRcS; Fri, 05
 Dec 2025 16:29:37 +0100
From: Hendrik Noack <hendrik-noack@gmx.de>
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: Hendrik Noack <hendrik-noack@gmx.de>,
	linux-input@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: [PATCH v3 1/2] dt-bindings: Input: Add Wacom W9000-series penabled touchscreens
Date: Fri,  5 Dec 2025 16:26:17 +0100
Message-ID: <20251205152858.14415-2-hendrik-noack@gmx.de>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251205152858.14415-1-hendrik-noack@gmx.de>
References: <20251205152858.14415-1-hendrik-noack@gmx.de>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:Jf61MPlFilL3Fk4YPZXYDC5d6uOfbqlSIo68jlsdGwkFPhDc79c
 5ENMjF7uBNvsR5Y5uJK0aeeMQXfmO/EQqsqvM07Y5cCwxnUEMC3AQ6T9pNxvJEGXyvTbibx
 FI6q1CrFXuuH5YQTiS6iz2uxYkK1eROjKZDPrFFMH0EB7745XrsO6H2h/I93jSTOCOqVAtF
 bjeQqDSlB9zw5EsNDNrOg==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:A8QnB2azDSw=;F+JTIKGX3a2gzeqkjRSAvc+4mcB
 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
 P3mDDnajghllcUcTleVjuGJzqJyVEDSVA==

Add bindings for two Wacom W9007 variants which can be found in tablets.

Signed-off-by: Hendrik Noack <hendrik-noack@gmx.de>
Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
=2D--
 .../input/touchscreen/wacom,w9007a-lt03.yaml  | 79 +++++++++++++++++++
 1 file changed, 79 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/input/touchscreen/wa=
com,w9007a-lt03.yaml

diff --git a/Documentation/devicetree/bindings/input/touchscreen/wacom,w90=
07a-lt03.yaml b/Documentation/devicetree/bindings/input/touchscreen/wacom,=
w9007a-lt03.yaml
new file mode 100644
index 000000000000..80d12cb8392d
=2D-- /dev/null
+++ b/Documentation/devicetree/bindings/input/touchscreen/wacom,w9007a-lt0=
3.yaml
@@ -0,0 +1,79 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/input/touchscreen/wacom,w9007a-lt03.ya=
ml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Wacom W9000-series penabled I2C touchscreen
+
+maintainers:
+  - Hendrik Noack <hendrik-noack@gmx.de>
+
+description: |
+  The W9000-series are penabled touchscreen controllers by Wacom.
+
+  The firmware of chips between devices can differ and with it also
+  how the chips behaves.
+
+allOf:
+  - $ref: touchscreen.yaml#
+
+properties:
+  compatible:
+    enum:
+      - wacom,w9007a-lt03
+      - wacom,w9007a-v1
+
+  reg:
+    maxItems: 1
+
+  interrupts:
+    maxItems: 1
+
+  vdd-supply:
+    description:
+      Optional regulator for the VDD digital voltage.
+
+  flash-mode-gpios:
+    maxItems: 1
+    description:
+      Optional GPIO specifier for the touchscreen's flash-mode pin.
+
+  pen-inserted-gpios:
+    maxItems: 1
+    description:
+      Optional GPIO specifier for the touchscreen's pen-insert pin.
+
+required:
+  - compatible
+  - reg
+  - interrupts
+  - vdd-supply
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/gpio/gpio.h>
+    #include <dt-bindings/interrupt-controller/irq.h>
+
+    i2c {
+        #address-cells =3D <1>;
+        #size-cells =3D <0>;
+
+        digitizer@56 {
+            compatible =3D "wacom,w9007a-lt03";
+            reg =3D <0x56>;
+            interrupt-parent =3D <&gpd1>;
+            interrupts =3D <1 IRQ_TYPE_EDGE_RISING>;
+
+            vdd-supply =3D <&stylus_reg>;
+
+            flash-mode-gpios =3D <&gpd1 3 GPIO_ACTIVE_HIGH>;
+            pen-inserted-gpios =3D <&gpx0 0 GPIO_ACTIVE_LOW>;
+
+            touchscreen-x-mm =3D <216>;
+            touchscreen-y-mm =3D <135>;
+            touchscreen-inverted-x;
+        };
+    };
=2D-=20
2.43.0


