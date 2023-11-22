Return-Path: <linux-input+bounces-197-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id E372F7F40EB
	for <lists+linux-input@lfdr.de>; Wed, 22 Nov 2023 10:01:51 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 9D6BE281786
	for <lists+linux-input@lfdr.de>; Wed, 22 Nov 2023 09:01:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 241713D99B;
	Wed, 22 Nov 2023 09:01:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="JrnUjH5+"
X-Original-To: linux-input@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A9F573D96B;
	Wed, 22 Nov 2023 09:01:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 8A96CC116D4;
	Wed, 22 Nov 2023 09:01:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1700643675;
	bh=Uc7PJz2dGKOR2vHAmtuhg5DEDRFO9rqEpfrTgOTmlbk=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=JrnUjH5+K7lYL+AO5xTGpF1MUPhxDa62p/jU+n45L5gHlP6vSBMihNQE/SVUTvEYt
	 YsCra9dujW5+NKvxQWGpgjvUTrK4t7b1R69dL3QXLM0eJbsc5ef73ZGVFIHp9rq2+K
	 nbDnDKgDvUYlnIHU3d2NlNU7b+Gc+MansNymgW0ISsMC7I/vUvxT3AVgGaQGfVrOBT
	 x92sKREhZ5MKvoFGpcwNAkCcpwN8d5YkFjgVhNDx+YDPjsi3uO/lWWdSJY/tZJWSfg
	 XZEpz2IbUfIz5NgPTmdqz5sn5DyA41R9dRxB72Ul9Z+s+Gy8lSRHcX+OWY18d5o2IX
	 RUSQMxj2dMndw==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7A9BBC61DA4;
	Wed, 22 Nov 2023 09:01:15 +0000 (UTC)
From:
 Nikita Shubin via B4 Relay <devnull+nikita.shubin.maquefel.me@kernel.org>
Date: Wed, 22 Nov 2023 12:00:00 +0300
Subject: [PATCH v5 22/39] dt-bindings: input: Add Cirrus EP93xx keypad
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20231122-ep93xx-v5-22-d59a76d5df29@maquefel.me>
References: <20231122-ep93xx-v5-0-d59a76d5df29@maquefel.me>
In-Reply-To: <20231122-ep93xx-v5-0-d59a76d5df29@maquefel.me>
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>, 
 Rob Herring <robh+dt@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Alexander Sverdlin <alexander.sverdlin@gmail.com>
Cc: linux-input@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, 
 Alexander Sverdlin <alexander.sverdlin@gmail.com>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.13-dev-e3e53
X-Developer-Signature: v=1; a=ed25519-sha256; t=1700643671; l=3129;
 i=nikita.shubin@maquefel.me; s=20230718; h=from:subject:message-id;
 bh=gecB565jZiEHE7OtxQWd2Hls2eduV5DcTU6RNeTP/vk=; =?utf-8?q?b=3DhLyuCuHKcLck?=
 =?utf-8?q?HeT3At4p5fkNhPJfYPnWBIX4seEClDUJh7AsazVYoi7Wy2rb0U4xW99AY7wAMsrz?=
 5QdPpahoDlDt2IsaHGXrAiZOXw7jFPxR+bz/t5bV/0GMEXrU1y5Z
X-Developer-Key: i=nikita.shubin@maquefel.me; a=ed25519;
 pk=vqf5YIUJ7BJv3EJFaNNxWZgGuMgDH6rwufTLflwU9ac=
X-Endpoint-Received:
 by B4 Relay for nikita.shubin@maquefel.me/20230718 with auth_id=65
X-Original-From: Nikita Shubin <nikita.shubin@maquefel.me>
Reply-To: <nikita.shubin@maquefel.me>

From: Nikita Shubin <nikita.shubin@maquefel.me>

Add YAML bindings for ep93xx SoC keypad.

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Signed-off-by: Nikita Shubin <nikita.shubin@maquefel.me>
---
 .../bindings/input/cirrus,ep9307-keypad.yaml       | 87 ++++++++++++++++++++++
 1 file changed, 87 insertions(+)

diff --git a/Documentation/devicetree/bindings/input/cirrus,ep9307-keypad.yaml b/Documentation/devicetree/bindings/input/cirrus,ep9307-keypad.yaml
new file mode 100644
index 000000000000..c4f9850d8cdd
--- /dev/null
+++ b/Documentation/devicetree/bindings/input/cirrus,ep9307-keypad.yaml
@@ -0,0 +1,87 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/input/cirrus,ep9307-keypad.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Cirrus ep93xx keypad
+
+maintainers:
+  - Alexander Sverdlin <alexander.sverdlin@gmail.com>
+
+allOf:
+  - $ref: /schemas/input/matrix-keymap.yaml#
+
+description:
+  The KPP is designed to interface with a keypad matrix with 2-point contact
+  or 3-point contact keys. The KPP is designed to simplify the software task
+  of scanning a keypad matrix. The KPP is capable of detecting, debouncing,
+  and decoding one or multiple keys pressed simultaneously on a keypad.
+
+properties:
+  compatible:
+    oneOf:
+      - const: cirrus,ep9307-keypad
+      - items:
+          - enum:
+              - cirrus,ep9312-keypad
+              - cirrus,ep9315-keypad
+          - const: cirrus,ep9307-keypad
+
+  reg:
+    maxItems: 1
+
+  interrupts:
+    maxItems: 1
+
+  clocks:
+    maxItems: 1
+
+  debounce-delay-ms:
+    description: |
+          Time in microseconds that key must be pressed or
+          released for state change interrupt to trigger.
+
+  cirrus,prescale:
+    description: row/column counter pre-scaler load value
+    $ref: /schemas/types.yaml#/definitions/uint16
+    maximum: 1023
+
+required:
+  - compatible
+  - reg
+  - interrupts
+  - clocks
+  - linux,keymap
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/input/input.h>
+    #include <dt-bindings/soc/cirrus,ep9301-syscon.h>
+    keypad@800f0000 {
+        compatible = "cirrus,ep9307-keypad";
+        reg = <0x800f0000 0x0c>;
+        interrupt-parent = <&vic0>;
+        interrupts = <29>;
+        clocks = <&eclk EP93XX_CLK_KEYPAD>;
+        pinctrl-names = "default";
+        pinctrl-0 = <&keypad_default_pins>;
+        linux,keymap = <KEY_UP>,
+                       <KEY_DOWN>,
+                       <KEY_VOLUMEDOWN>,
+                       <KEY_HOME>,
+                       <KEY_RIGHT>,
+                       <KEY_LEFT>,
+                       <KEY_ENTER>,
+                       <KEY_VOLUMEUP>,
+                       <KEY_F6>,
+                       <KEY_F8>,
+                       <KEY_F9>,
+                       <KEY_F10>,
+                       <KEY_F1>,
+                       <KEY_F2>,
+                       <KEY_F3>,
+                       <KEY_POWER>;
+    };

-- 
2.41.0


