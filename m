Return-Path: <linux-input+bounces-15762-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id A2040C118D1
	for <lists+linux-input@lfdr.de>; Mon, 27 Oct 2025 22:26:03 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 603194E37C4
	for <lists+linux-input@lfdr.de>; Mon, 27 Oct 2025 21:26:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1DC6230F534;
	Mon, 27 Oct 2025 21:25:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.de header.i=hendrik-noack@gmx.de header.b="q9z1wK6Z"
X-Original-To: linux-input@vger.kernel.org
Received: from mout.gmx.net (mout.gmx.net [212.227.15.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B40E26C3A7;
	Mon, 27 Oct 2025 21:25:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.15.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761600357; cv=none; b=r1hfZe5kHowG4frsbvKplqZQX8d1Ra85lCXBF+a7nvzQJZ0P+o7EOQxJqtbed5I7JZtenUyXA7+8EvXYsfd9tNTeUJskLAx0vQHz8Vz8hGv7t/CRIixVoOdm7/PrPmj7fVLpy/Zodop6+Si8Zu9KSfdWLUYixrBhcW3Pxp2gUwM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761600357; c=relaxed/simple;
	bh=31Lcgb8eIRoLbg+qPdJ7eanVB5yKqu408eFfjUPJmD0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=jRaEmEppaJ5TlpRDolSCLL9HeAi7yVdaF7FXDmGGo3TDsDqRU7MCN/Q/ABEwJcFxHCro0QlzHtgmJlYeLX35vgipJ1HIHSPG42K/y1dmC5sdVeZaEFiqcNe6P4ePreUn1hNuA3QwfVKQeLUYHSw++dBusXQEI5luhaYkuwTgvO4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de; spf=pass smtp.mailfrom=gmx.de; dkim=pass (2048-bit key) header.d=gmx.de header.i=hendrik-noack@gmx.de header.b=q9z1wK6Z; arc=none smtp.client-ip=212.227.15.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
	s=s31663417; t=1761600352; x=1762205152; i=hendrik-noack@gmx.de;
	bh=cBahhpfbLe+wQHysvgm9aZS7Y1YwmPlhMZGYlimJknk=;
	h=X-UI-Sender-Class:From:To:Cc:Subject:Date:Message-ID:In-Reply-To:
	 References:MIME-Version:Content-Transfer-Encoding:cc:
	 content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=q9z1wK6Z5yih5saip0QM6a36sIp21ZHnbjoHqaeylno1T5Obv9zPbNafKSgOfMYu
	 zq8q4bfIt+HUyuxWPg30iJcsD9gRkuFCXORjRUyilWliiJ7oClknu3FJDIZnKH7ao
	 Hm9bgyFgTeG9eqs/Zu4RK+3msqFsQmIhl/iahUfVn4snxgeNmgDuVW57OHTTrQ6Hy
	 ndWC9by/AwgypqbY2PqTZMskArOFqYV1yR/eYgN7u2x/0UilyeGwxRDDHY2kgc9HS
	 jvWv2oqvSSpPoeRQFrxkluECqUnZDqZp7fNWi1v40BLQdz3wpIOTD6KoBHyvf8NHI
	 +rS7fT+BR6DU47Ok3g==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from ThinkPad-T420 ([80.187.116.161]) by mail.gmx.net (mrgmx005
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MdNcA-1ue9yK0cKG-00eA7c; Mon, 27
 Oct 2025 22:25:52 +0100
From: Hendrik Noack <hendrik-noack@gmx.de>
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: Hendrik Noack <hendrik-noack@gmx.de>,
	linux-input@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 1/2] dt-bindings: Input: Add Wacom W9000-series penabled touchscreens
Date: Mon, 27 Oct 2025 22:25:34 +0100
Message-ID: <20251027212535.4078-1-hendrik-noack@gmx.de>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251027164050.113623-1-hendrik-noack@gmx.de>
References: <20251027164050.113623-1-hendrik-noack@gmx.de>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:fmmZY9TgFJ1S/Bm80DEzHaLUGGwdFlIN5gQt1iczEfr4FMpCvnH
 HuumTO9aCs6cNxFgJtC5ejgqY7VzBlG2GhAOstStiUnDku6zNL1yXcNZIYdnrJPmsG+RDOh
 tH4pqnXcxDD+SILiRnaF1bM9yI1xedneO0gazyLpZ3SSBFHz0mJMIddq3I6q9UjLSGU7/v3
 xlnqtB8XF89IHeJ2mhBoQ==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:9TojoVt8wFs=;pc8oLy6Po8R5p+NIaHFey6OyVzQ
 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
 JsZdBOOIrOqAUvbNjtb1VB7+Kh3A9emXKTy00a

Add bindings for two Wacom W9007 variants which can be found in tablets.

Signed-off-by: Hendrik Noack <hendrik-noack@gmx.de>
=2D--
 .../input/touchscreen/wacom,w9000-series.yaml | 79 +++++++++++++++++++
 1 file changed, 79 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/input/touchscreen/wa=
com,w9000-series.yaml

diff --git a/Documentation/devicetree/bindings/input/touchscreen/wacom,w90=
00-series.yaml b/Documentation/devicetree/bindings/input/touchscreen/wacom=
,w9000-series.yaml
new file mode 100644
index 000000000000..93579ae0297e
=2D-- /dev/null
+++ b/Documentation/devicetree/bindings/input/touchscreen/wacom,w9000-seri=
es.yaml
@@ -0,0 +1,79 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/input/touchscreen/wacom,w9000-series.y=
aml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Wacom W9000-series penabled I2C touchscreen driver
+
+description:
+  The W9000-series are penabled touchscreen controllers by Wacom.
+
+maintainers:
+  - Hendrik Noack <hendrik-noack@gmx.de>
+
+allOf:
+  - $ref: touchscreen.yaml#
+
+properties:
+  compatible:
+    enum:
+      - wacom,w9007a_lt03
+      - wacom,w9007a_v1
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
+  pdct-gpios:
+    maxItems: 1
+    description:
+      Optional GPIO specifier for the touchscreen's pdct pin.
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
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/interrupt-controller/irq.h>
+    #include <dt-bindings/gpio/gpio.h>
+    i2c {
+      #address-cells =3D <1>;
+      #size-cells =3D <0>;
+      digitizer@56 {
+        compatible =3D "wacom,wacom,w9007a_v1";
+        reg =3D <0x56>;
+        interrupt-parent =3D <&gpx3>;
+        interrupts =3D <5 IRQ_TYPE_EDGE_RISING>;
+
+        vdd-supply =3D <&stylus_reg>;
+
+        pdct-gpios =3D <&gpd1 2 GPIO_ACTIVE_HIGH>;
+        flash-mode-gpios =3D <&gpd1 3 GPIO_ACTIVE_HIGH>;
+        pen-inserted-gpios =3D <&gpx0 0 GPIO_ACTIVE_LOW>;
+
+        touchscreen-x-mm =3D <262>;
+        touchscreen-y-mm =3D <164>;
+      };
+    };
=2D-=20
2.43.0


