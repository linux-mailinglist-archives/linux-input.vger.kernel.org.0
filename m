Return-Path: <linux-input+bounces-14-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 16D997E8B3B
	for <lists+linux-input@lfdr.de>; Sat, 11 Nov 2023 15:32:44 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id BF69B280E65
	for <lists+linux-input@lfdr.de>; Sat, 11 Nov 2023 14:32:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8C68A18E2C;
	Sat, 11 Nov 2023 14:32:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="EVG4BSnG"
X-Original-To: linux-input@vger.kernel.org
Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BDFDB14A87
	for <linux-input@vger.kernel.org>; Sat, 11 Nov 2023 14:32:32 +0000 (UTC)
Received: from mail-ej1-x62a.google.com (mail-ej1-x62a.google.com [IPv6:2a00:1450:4864:20::62a])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 57C5A3C05
	for <linux-input@vger.kernel.org>; Sat, 11 Nov 2023 06:32:26 -0800 (PST)
Received: by mail-ej1-x62a.google.com with SMTP id a640c23a62f3a-9e62b14c9eeso233543866b.2
        for <linux-input@vger.kernel.org>; Sat, 11 Nov 2023 06:32:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1699713145; x=1700317945; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Ub4VI3MZ7DSmkukUX/fiEV7NAmUSVlsfQVOOR3bbu7U=;
        b=EVG4BSnGOavD/Qw7HgnrENa9WDABPIT0igsYMOaFDsiOQ2KkdzAbftWN2W80kfvoIn
         cpp6NNGDGUFGa7rmD/gtCeWppb9VnVFLRkAeCBu9Qgg2RW03Ks/CdrWyJzxHIPuez7/D
         zUDHpYFttixi68nyCoBcWHPfjTn8b24fht/ehLZZFME36m73Zk3RZo4fm3XyLpanjbP6
         BjlKWlLQXQ3cEz6wu1yiuhzlQjoaltZnizmFoexnfTen3goES3Qdfq7a5IZYF/1V0bQR
         81AuGvKnpeZGPi5eiQ3u3Knw7hNFHKjY3dDtkOku7QihtFa6STkIJtW94q5nZp05viHC
         O2nA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699713145; x=1700317945;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Ub4VI3MZ7DSmkukUX/fiEV7NAmUSVlsfQVOOR3bbu7U=;
        b=JWMKkeiIYMNnylKVKb5e2WhxFZ2kywX4B5ER7BFHTA7ARbCFeNl5cFZmrushg9419x
         CSU3LUvfN28m7MXzZDBNXkjmoTu3Vh9lXkEw2lbrOOj5scJphHZCURh9UfvbTVuCSBxU
         ydsETupALYMGB4S2TV1JeDNgk7l9AOLEsUfz/md3QxgSllkel1Q7Ha+kEGanddDng9i3
         QspkE0V8z790h6KTJ8b14g9SwrfXw8Fu8wVIfjLdUyRUmrxjuLMUO4inD2HNPLEi0Jal
         mO3X0j4utPES1Z8kJ1OQvHXnCRhSaubeqebG0paCPBYzlztsJCJ+4qxR7yfG+F9lOFOV
         nqSQ==
X-Gm-Message-State: AOJu0Yz9WDTdPIAwALy8pmUZ08EurhK6vWv5WT4MxTE0LUsnJTPFzfkL
	nFqE/s1PkIABij3pVzp1kmFhpA==
X-Google-Smtp-Source: AGHT+IFhbal/t9dQICzWzQexo59iM2onji5W66rDi2OmOwwG1cMKENrsger0nKbYz10Q5RUipiWJfQ==
X-Received: by 2002:a17:906:6c92:b0:9e8:2c4d:40d4 with SMTP id s18-20020a1709066c9200b009e82c4d40d4mr180958ejr.30.1699713144759;
        Sat, 11 Nov 2023 06:32:24 -0800 (PST)
Received: from krzk-bin.. ([178.197.218.126])
        by smtp.gmail.com with ESMTPSA id b13-20020a170906038d00b009bd9ac83a9fsm1136889eja.152.2023.11.11.06.32.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 11 Nov 2023 06:32:24 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Andi Shyti <andi.shyti@kernel.org>,
	linux-input@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH] dt-bindings: input: samsung,s6sy761: convert to DT schema
Date: Sat, 11 Nov 2023 15:32:21 +0100
Message-Id: <20231111143221.55452-1-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Convert Samsung  S6SY761 touchscreen controller bindings to DT schema.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

---

I put original autho, Andi, as bindings maintainer, but I don't think he
has access to the device anymore. Anyone else has datasheet or hardware?
---
 .../input/touchscreen/samsung,s6sy761.txt     | 32 -----------
 .../input/touchscreen/samsung,s6sy761.yaml    | 54 +++++++++++++++++++
 2 files changed, 54 insertions(+), 32 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/input/touchscreen/samsung,s6sy761.txt
 create mode 100644 Documentation/devicetree/bindings/input/touchscreen/samsung,s6sy761.yaml

diff --git a/Documentation/devicetree/bindings/input/touchscreen/samsung,s6sy761.txt b/Documentation/devicetree/bindings/input/touchscreen/samsung,s6sy761.txt
deleted file mode 100644
index 6805d10d226d..000000000000
--- a/Documentation/devicetree/bindings/input/touchscreen/samsung,s6sy761.txt
+++ /dev/null
@@ -1,32 +0,0 @@
-* Samsung S6SY761 touchscreen controller
-
-Required properties:
-- compatible		: must be "samsung,s6sy761"
-- reg			: I2C slave address, (e.g. 0x48)
-- interrupts		: interrupt specification
-- avdd-supply		: analogic power supply
-- vdd-supply		: power supply
-
-Optional properties:
-- touchscreen-size-x	: see touchscreen.txt. This property is embedded in the
-			  device. If defined it forces a different x resolution.
-- touchscreen-size-y	: see touchscreen.txt. This property is embedded in the
-			  device. If defined it forces a different y resolution.
-
-Example:
-
-i2c@00000000 {
-
-	/* ... */
-
-	touchscreen@48 {
-		compatible = "samsung,s6sy761";
-		reg = <0x48>;
-		interrupt-parent = <&gpa1>;
-		interrupts = <1 IRQ_TYPE_NONE>;
-		avdd-supply = <&ldo30_reg>;
-		vdd-supply = <&ldo31_reg>;
-		touchscreen-size-x = <4096>;
-		touchscreen-size-y = <4096>;
-	};
-};
diff --git a/Documentation/devicetree/bindings/input/touchscreen/samsung,s6sy761.yaml b/Documentation/devicetree/bindings/input/touchscreen/samsung,s6sy761.yaml
new file mode 100644
index 000000000000..1ffd17af3c53
--- /dev/null
+++ b/Documentation/devicetree/bindings/input/touchscreen/samsung,s6sy761.yaml
@@ -0,0 +1,54 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/input/touchscreen/samsung,s6sy761.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Samsung S6SY761 touchscreen controller
+
+maintainers:
+  - Andi Shyti <andi.shyti@kernel.org>
+
+allOf:
+  - $ref: touchscreen.yaml#
+
+properties:
+  compatible:
+    const: samsung,s6sy761
+
+  reg:
+    maxItems: 1
+
+  interrupts:
+    maxItems: 1
+
+  avdd-supply: true
+  vdd-supply: true
+
+unevaluatedProperties: false
+
+required:
+  - compatible
+  - reg
+  - interrupts
+  - avdd-supply
+  - vdd-supply
+
+examples:
+  - |
+    #include <dt-bindings/interrupt-controller/irq.h>
+    i2c {
+        #address-cells = <1>;
+        #size-cells = <0>;
+
+        touchscreen@48 {
+            compatible = "samsung,s6sy761";
+            reg = <0x48>;
+            interrupt-parent = <&gpa1>;
+            interrupts = <1 IRQ_TYPE_LEVEL_HIGH>;
+            avdd-supply = <&ldo30_reg>;
+            vdd-supply = <&ldo31_reg>;
+            touchscreen-size-x = <4096>;
+            touchscreen-size-y = <4096>;
+        };
+    };
-- 
2.34.1


