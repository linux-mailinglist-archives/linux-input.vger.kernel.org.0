Return-Path: <linux-input+bounces-16428-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [IPv6:2a01:60a::1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 42053C97BE8
	for <lists+linux-input@lfdr.de>; Mon, 01 Dec 2025 14:57:13 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id B7A3034473F
	for <lists+linux-input@lfdr.de>; Mon,  1 Dec 2025 13:57:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 37C42314B85;
	Mon,  1 Dec 2025 13:57:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.de header.i=hendrik-noack@gmx.de header.b="bOiInRU2"
X-Original-To: linux-input@vger.kernel.org
Received: from mout.gmx.net (mout.gmx.net [212.227.17.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ECA59313525;
	Mon,  1 Dec 2025 13:57:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.17.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764597430; cv=none; b=bxTQ7BLgfSmnBitTyh1uBqUIL/vfxK42EnS9gTMp0T2JZbnz04tHgq8MS1BkFkyqC7DtdqKEuKI1EhiK/DF6AH36bO0vLurtdoWxkyjFh+EP8fbv20DIOld00eCRNw17gGbuVZXguCCjVicApqq1tL0q7gDlL6iq2P0MehoS/Fg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764597430; c=relaxed/simple;
	bh=Q78z6zWmo1XZOJF342jr+Wu8SBXNOAFmjJy+q8cyzJY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=teXjEeLX2VCYI+m8H3b52Q5hZE7I5+8rl+2U5e5PGGP+Mb9vXQCK+k+Mqkwm8XKMY7EY9ErGSkkzx3NsAs+TOQ0Bmhegosr2olPLLJzxhvmlrfoAqFCgP0cr0Ea8Jlb52omTgvqBFKoaSmAFM8id8ySLsmf5XL2tP/35MYKgF3U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de; spf=pass smtp.mailfrom=gmx.de; dkim=pass (2048-bit key) header.d=gmx.de header.i=hendrik-noack@gmx.de header.b=bOiInRU2; arc=none smtp.client-ip=212.227.17.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
	s=s31663417; t=1764597423; x=1765202223; i=hendrik-noack@gmx.de;
	bh=nG9h5QOtX94dF9HtlyB/U3/neznnsuC8fhx+fJdOk1I=;
	h=X-UI-Sender-Class:From:To:Cc:Subject:Date:Message-ID:In-Reply-To:
	 References:MIME-Version:Content-Transfer-Encoding:cc:
	 content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=bOiInRU2o7mRWFsnZw8kxE/4EC/jLocZ5t/BrnxwZUs0HrEP/jz6HFyqsmzpRtpD
	 8RWLON09R82xzkcGrbu6FV4f8rfFlC2FLu1cxRFQI9VSMKmFNB1NU0yNwvOp8nw+L
	 0RJPouTwB4HAGqB6dxjh3rpOw3GS7jo3NNQ3fHHJP3+dmBS6VeoufGHKGzpeG+YXi
	 40ugZnRNRuinp2BlpDMvDsApMzVoqlToEuHIfiLgS4IjCJ5ydFuHJydn/Dy0BwDK0
	 FpQXvZAU4AoRpMEMCPLi6E4hiSSHq+xxlHnb/djxbFfyDgL5uM+csZHF6ZQ/C8KeY
	 CMw9N6LfvOz1SH7k1Q==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from Hendrik-Linux ([217.85.36.251]) by mail.gmx.net (mrgmx105
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MKsj7-1ve9R52khx-00LUMg; Mon, 01
 Dec 2025 14:57:02 +0100
From: Hendrik Noack <hendrik-noack@gmx.de>
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: Hendrik Noack <hendrik-noack@gmx.de>,
	linux-input@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 1/2] dt-bindings: Input: Add Wacom W9000-series penabled touchscreens
Date: Mon,  1 Dec 2025 14:31:13 +0100
Message-ID: <20251201135552.93540-2-hendrik-noack@gmx.de>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251201135552.93540-1-hendrik-noack@gmx.de>
References: <20251201135552.93540-1-hendrik-noack@gmx.de>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:A1eXDHAj7e18ligmH0/KOmqgXIcJsGjhpquzC3G3fQ9EkGpquLr
 04uDU+FJG9X9uBslFNZrAWNNbzV5pW7WdzBVoifGQEzRd+4E0fSbOnCyarzMB9SI0iQDu/P
 KBdJarE0Dv8rQD+UuY8yQIuTVVGaijq3nh9o5wcrUqUjoV43KWQqbbLQvg3qYhEnhahP1fu
 WbmKpq05OFiXbSnYIDckg==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:5OwSfvGbzr4=;wrUrGbj/VDq0QKSCLnxFdLNkU3r
 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
 AEDAiH2yxvD

Add bindings for two Wacom W9007 variants which can be found in tablets.

Signed-off-by: Hendrik Noack <hendrik-noack@gmx.de>
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


