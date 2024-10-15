Return-Path: <linux-input+bounces-7404-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7DCC499EA59
	for <lists+linux-input@lfdr.de>; Tue, 15 Oct 2024 14:53:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id AC3BD1C223EB
	for <lists+linux-input@lfdr.de>; Tue, 15 Oct 2024 12:53:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9C9181C07EF;
	Tue, 15 Oct 2024 12:53:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="AmGBVFFU"
X-Original-To: linux-input@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 696F01C07CD;
	Tue, 15 Oct 2024 12:53:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728996812; cv=none; b=ILsCAwUTKi6fWTzQqYqLXe7+sYCYhjZiubpVVy5bvy12OO/m/xrryDmXNfTKCzyd4wMCCy7HxWUliYyow/1J82l5MXMcRgWlqGQDzB9AlwsSfAOegMGThHFPdCYuev2QlXK+M+CzBGnB++AlRPGPz7SnAevOF6SrJNy4N1szeaI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728996812; c=relaxed/simple;
	bh=k4sHN8F0vEpbhstI4pP9YlVgxqXHlxI77MHkEXqdZ2Q=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=TfYa1IbYxxoWZeQlAT1taJt/g3nq2Vlhjy5W1UcSY00JjcRcAzWu7Dk2dMKy00ftc0B333oX+8fR7eQR7rDg0XgnttuVECNxdczBtTOdDCzYxAtwodOPebIDZtb3rj17VSGip+b5LT87ir4dSlQ+/ufil9QoZ/3ZtQxW2x52lsw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=AmGBVFFU; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 0A3EFC4CECF;
	Tue, 15 Oct 2024 12:53:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1728996812;
	bh=k4sHN8F0vEpbhstI4pP9YlVgxqXHlxI77MHkEXqdZ2Q=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=AmGBVFFUhDFf9q0SM1LLzat+P7WqsQzZLhYDcBg3hgko2cGkggQOuJmcjfVVjrsuz
	 R/iBFzOvaMcC3BbQR/ffQt41gUJtXBbEY4xtuVveKUdxipqi4d73CeZnXNvdaNFZ+j
	 3DbWop7M3NRkYW598qwtD0EcHLLhibAMMng4s6a1Uwp7ma8oSEjGsbxGv+nWSt4Q+z
	 /ZTTnAjC+sgzvaGreg6UPIviY69KDNCePp/wpOxQxx8stT8phNbwYoAXOwyfVBAUOR
	 K54ZBt5YiCZQtBgCSAbPsfTNGb/O8AtOnMlI+TocwUr1F9SwK0JTzAkcHfJ3nnjUCt
	 JwrrFiIJaFvnA==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EB0E0D21690;
	Tue, 15 Oct 2024 12:53:31 +0000 (UTC)
From: George Chan via B4 Relay <devnull+gchan9527.gmail.com@kernel.org>
Date: Tue, 15 Oct 2024 20:53:29 +0800
Subject: [PATCH RFC/RFT 1/3] dt-bindings: touchscreen: Add binding for
 Novatek NT36xxx series driver
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241015-nt36xxx-v1-1-3919d0bffee6@gmail.com>
References: <20241015-nt36xxx-v1-0-3919d0bffee6@gmail.com>
In-Reply-To: <20241015-nt36xxx-v1-0-3919d0bffee6@gmail.com>
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Del Regno <kholk11@gmail.com>, 
 Henrik Rydberg <rydberg@bitmath.org>
Cc: linux-input@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, George Chan <gchan9527@gmail.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1728996810; l=2336;
 i=gchan9527@gmail.com; s=20241015; h=from:subject:message-id;
 bh=6oXy8utpLvYCjX6FpS5vMO4JWOmudlGhgWpN7w1GKpA=;
 b=CWp38R0kg4uaRnXXylbmhUTfN0jCdb9ZlwmWTWEB23Q+QeTeiwx1ni+IxplTJCJ1KKwRp0uKk
 X7ejSsE16zZA5e6/vpxusNPxamsZPsFqVl7osdTto0WB7CYSF86tKyR
X-Developer-Key: i=gchan9527@gmail.com; a=ed25519;
 pk=dscYWhT+BiQOBMpPE19NFQAjBBmcpipc6zdf2MTze/U=
X-Endpoint-Received: by B4 Relay for gchan9527@gmail.com/20241015 with
 auth_id=248
X-Original-From: George Chan <gchan9527@gmail.com>
Reply-To: gchan9527@gmail.com

From: George Chan <gchan9527@gmail.com>

Add binding for the Novatek NT36xxx series touchscreen driver.

Signed-off-by: AngeloGioacchino Del Regno <kholk11@gmail.com>
Signed-off-by: George Chan <gchan9527@gmail.com>
---
 .../bindings/input/touchscreen/nt36xxx.yaml        | 70 ++++++++++++++++++++++
 1 file changed, 70 insertions(+)

diff --git a/Documentation/devicetree/bindings/input/touchscreen/nt36xxx.yaml b/Documentation/devicetree/bindings/input/touchscreen/nt36xxx.yaml
new file mode 100644
index 0000000000..3919f0d026
--- /dev/null
+++ b/Documentation/devicetree/bindings/input/touchscreen/nt36xxx.yaml
@@ -0,0 +1,70 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/input/touchscreen/nt36xxx.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Novatek NT36xxx series touchscreen controller Bindings
+
+maintainers:
+  - AngeloGioacchino Del Regno <kholk11@gmail.com>
+  - George Chan <gchan9527@gmail.com>
+
+allOf:
+  - $ref: touchscreen.yaml#
+
+properties:
+  compatible:
+    enum:
+        - novatek,nt36525-spi
+        - novatek,nt36672a-spi
+        - novatek,nt36675-spi
+        - novatek,nt36676f-spi
+        - novatek,nt36772-spi
+
+  reg:
+    maxItems: 1
+
+  irq-gpio:
+    maxItems: 1
+
+  vdd-supply:
+    description: Power supply regulator for VDD pin
+
+  vio-supply:
+    description: Power supply regulator on VDD-IO pin
+
+  firmware-name:
+    description: Firmware for device initialization, if unspecify, all
+                  other IC treat as no firmware needed. For nt36675, default
+                  to "novatek_ts_tianma_fw.bin".
+
+  spi-max-frequency:
+    description: Set max frequency to spi bus communication. This is optional.
+
+unevaluatedProperties: false
+
+required:
+  - compatible
+  - reg
+  - irq-gpio
+
+examples:
+  - |
+    #include <dt-bindings/interrupt-controller/irq.h>
+    #include <dt-bindings/gpio/gpio.h>
+
+    spi {
+      #address-cells = <1>;
+      #size-cells = <0>;
+
+      touchscreen@0 {
+        compatible = "novatek,nt36675-spi";
+        reg = <0>;
+        spi-max-frequency = <4000000>;
+        irq-gpio = <&tlmm 9 0x2001>;
+        firmware-name = "novatek_ts_tianma_fw.bin";
+      };
+    };
+
+...

-- 
2.43.0



