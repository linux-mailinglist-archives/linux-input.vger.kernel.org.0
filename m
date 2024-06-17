Return-Path: <linux-input+bounces-4378-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 6773F90A9E8
	for <lists+linux-input@lfdr.de>; Mon, 17 Jun 2024 11:39:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 10D6A1F2476B
	for <lists+linux-input@lfdr.de>; Mon, 17 Jun 2024 09:39:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CD6C2194AF6;
	Mon, 17 Jun 2024 09:38:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="nleGknVQ"
X-Original-To: linux-input@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F14C194AE1;
	Mon, 17 Jun 2024 09:38:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718617105; cv=none; b=lsC/JNJn5k9fUbKp4jO2+mdxNkIxXQnL2/truUcIISPSOkeqY2tiRAlS1SZJ8M4g6t+ulGtqhbaTsPl4O3KnYGFiHmnSYv9AiY8eaVbSJZio58YZpdMvPsY8EpLmJigGpPNe2e4rTd8WIi76KR5OfxK0urHv+DTBfJBvjtF+Vrw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718617105; c=relaxed/simple;
	bh=985+UlFULic6LgAh253V4PgK2g0KvpjtDw3UMIKIEeA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=pXiD6TVuUnm7hAK81j4/0P0InCLFX7gCZ2/DM9vv8uof7KPL5b1xWKYYgZHDoo+P4VBC9SxhIgrMt+m07jNedOereUaqREH+ONo78bpiZ4tgrptQsBzCTUPtdjIIVAYV9NC+kS1PXJzpnmTDNrW8c1iaZ2Y9/5MQBhW27DLS7QQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=nleGknVQ; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id D1642C4DE18;
	Mon, 17 Jun 2024 09:38:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1718617104;
	bh=985+UlFULic6LgAh253V4PgK2g0KvpjtDw3UMIKIEeA=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=nleGknVQq/D03uzuvlRo7aUlAE9tBXFRqfSbPLfk+moQz0kWJnKLJ7cwgYwl+0bg0
	 A2Fzz0G5xgU/CpHjW+ixSmi+5B0oXUmBScqqPOxZkfmFSBf9u+7T4JXWUFUyE2zEsA
	 PLaWxDWwTz5h1RztwSQRpZfxUYB79vCXrBKu5YYaHmCrIYhduQ4m5aMJqNRLtjmnyb
	 vKWNClfHiiqooPBUu5ZyK6G7/sVj9AM58Fhfh86CQ5/5GxdZ75ReM29mqmhYgvWNKH
	 qXnWqxMsUzrcrKNWoqdM9rydMqNh8S5HUelNxunFIf045raufmwdjzx4eZITJbglSd
	 uJ60TxMVorABg==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C6146C2BA18;
	Mon, 17 Jun 2024 09:38:24 +0000 (UTC)
From: Nikita Shubin via B4 Relay <devnull+nikita.shubin.maquefel.me@kernel.org>
Date: Mon, 17 Jun 2024 12:36:56 +0300
Subject: [PATCH v10 22/38] dt-bindings: input: Add Cirrus EP93xx keypad
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240617-ep93xx-v10-22-662e640ed811@maquefel.me>
References: <20240617-ep93xx-v10-0-662e640ed811@maquefel.me>
In-Reply-To: <20240617-ep93xx-v10-0-662e640ed811@maquefel.me>
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Alexander Sverdlin <alexander.sverdlin@gmail.com>
Cc: linux-input@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Arnd Bergmann <arnd@arndb.de>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.13-dev-e3e53
X-Developer-Signature: v=1; a=ed25519-sha256; t=1718617100; l=3131;
 i=nikita.shubin@maquefel.me; s=20230718; h=from:subject:message-id;
 bh=ArW40vHeN5DKryw3IpGISVSZUOgIwSTy8lnGeu9e4oI=;
 b=0nrLy6aiWIYrvMpdiccGipAUfDQAlVnIIlwTlsFt9WFZp51hHUx7lGdPZaF7hSKH6f8MQ5N01qu3
 eFlX6STZD+wAnhwusVvjriMo9oN6qEZimAHGAJrCdVMj2xEcFQRX
X-Developer-Key: i=nikita.shubin@maquefel.me; a=ed25519;
 pk=vqf5YIUJ7BJv3EJFaNNxWZgGuMgDH6rwufTLflwU9ac=
X-Endpoint-Received: by B4 Relay for nikita.shubin@maquefel.me/20230718
 with auth_id=65
X-Original-From: Nikita Shubin <nikita.shubin@maquefel.me>
Reply-To: nikita.shubin@maquefel.me

From: Nikita Shubin <nikita.shubin@maquefel.me>

Add YAML bindings for ep93xx SoC keypad.

Signed-off-by: Nikita Shubin <nikita.shubin@maquefel.me>
Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 .../bindings/input/cirrus,ep9307-keypad.yaml       | 87 ++++++++++++++++++++++
 1 file changed, 87 insertions(+)

diff --git a/Documentation/devicetree/bindings/input/cirrus,ep9307-keypad.yaml b/Documentation/devicetree/bindings/input/cirrus,ep9307-keypad.yaml
new file mode 100644
index 000000000000..a0d2460c55ab
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
+    #include <dt-bindings/clock/cirrus,ep9301-syscon.h>
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
2.43.2



