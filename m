Return-Path: <linux-input+bounces-3557-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 978D68BE672
	for <lists+linux-input@lfdr.de>; Tue,  7 May 2024 16:49:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 4DD1B1F25237
	for <lists+linux-input@lfdr.de>; Tue,  7 May 2024 14:49:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E234F161B4D;
	Tue,  7 May 2024 14:48:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="b66R8hOJ"
X-Original-To: linux-input@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9823C160787;
	Tue,  7 May 2024 14:48:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715093330; cv=none; b=Fts2iorPNWonoqZPZNwTRhnxIwf/yny1LrZH7rmodM0tHylZOuzreW2uSBQBf8KXYbcE1VMpWYmN5P8WjCrqSW41HTHtLHQ2SzzARVrf/6P41AkdzJcIuP0eGG+R87ikj1+6SPix0bVoZGck4/oIm8muS46ip2mg58TwvqJxnTk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715093330; c=relaxed/simple;
	bh=6WJMlO8gbUhTSrAmcfkEkiZgyq69dy2zzKoL04LcRnY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=PaL3eLZkJAVjxhLpUAbjktKoH3c78oDArhCQwUh7cATKb5frnW0YgcKGywjVsFHRm4ea8GIsxghUOlghjqfpIEi24LjHq8+Wt4lTXGfvt9DZ1SeMKg+a5+l0ju1l4OKaJ837go38X44JH95/fMJGSN48gsDkshYzzE3fV/Hw3lY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=b66R8hOJ; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 42F93C4DDE0;
	Tue,  7 May 2024 14:48:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1715093330;
	bh=6WJMlO8gbUhTSrAmcfkEkiZgyq69dy2zzKoL04LcRnY=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=b66R8hOJPqr0ImuxapZCr3pdViEH/w+wc0r8asncTRwE6WVnaDZUJTZk7oJyEld/l
	 w+ffXPElsnVef9Gmuhc1fy+3JAs9iYlcLK7sytKJI6YzEfD+tUx76u1HPNxtn9WoG7
	 LIdPtspYkpffD1cOvT4rkPavw7d1aDQxv2zrjfh9y6Nz/8rv7ZQjTjE1kKDpBqldwb
	 JnV8TETpyheH3gYA2cIxRTSX2jRIJyzUO/RO35ioHcl3JXksd4xx4mNb5HKmacdDOp
	 eZUkUSxG2azPwzxE/3FV/E8ynCpuGf2H392EI0DghsNg8Qo7VOA7Pr3J/ByseSL+h/
	 VVkp+x/GQch+A==
Received: from johan by xi.lan with local (Exim 4.97.1)
	(envelope-from <johan+linaro@kernel.org>)
	id 1s4M7g-000000003Co-1C7q;
	Tue, 07 May 2024 16:48:52 +0200
From: Johan Hovold <johan+linaro@kernel.org>
To: Jiri Kosina <jikos@kernel.org>,
	Benjamin Tissoires <benjamin.tissoires@redhat.com>,
	Bjorn Andersson <andersson@kernel.org>
Cc: Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Konrad Dybcio <konrad.dybcio@linaro.org>,
	Linus Walleij <linus.walleij@linaro.org>,
	Douglas Anderson <dianders@chromium.org>,
	linux-input@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Johan Hovold <johan+linaro@kernel.org>,
	Zhengqiao Xia <xiazhengqiao@huaqin.corp-partner.google.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH v2 1/7] dt-bindings: HID: i2c-hid: add dedicated Ilitek ILI2901 schema
Date: Tue,  7 May 2024 16:48:15 +0200
Message-ID: <20240507144821.12275-2-johan+linaro@kernel.org>
X-Mailer: git-send-email 2.43.2
In-Reply-To: <20240507144821.12275-1-johan+linaro@kernel.org>
References: <20240507144821.12275-1-johan+linaro@kernel.org>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The Ilitek ILI2901 touch screen controller was apparently incorrectly
added to the Elan eKTH6915 schema simply because it also has a reset
gpio and is currently managed by the Elan driver in Linux.

The two controllers are not related even if an unfortunate wording in
the commit message adding the Ilitek compatible made it sound like they
were.

Add a dedicated schema for the ILI2901 which does not specify the I2C
address (which is likely 0x41 rather than 0x10 as for other Ilitek touch
controllers) to avoid cluttering the Elan schema with unrelated devices
and to make it easier to find the correct schema when adding further
Ilitek controllers.

Fixes: d74ac6f60a7e ("dt-bindings: HID: i2c-hid: elan: Introduce Ilitek ili2901")
Cc: Zhengqiao Xia <xiazhengqiao@huaqin.corp-partner.google.com>
Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Signed-off-by: Johan Hovold <johan+linaro@kernel.org>
---
 .../bindings/input/elan,ekth6915.yaml         |  1 -
 .../bindings/input/ilitek,ili2901.yaml        | 66 +++++++++++++++++++
 2 files changed, 66 insertions(+), 1 deletion(-)
 create mode 100644 Documentation/devicetree/bindings/input/ilitek,ili2901.yaml

diff --git a/Documentation/devicetree/bindings/input/elan,ekth6915.yaml b/Documentation/devicetree/bindings/input/elan,ekth6915.yaml
index dc4ac41f2441..c1fcf8c90c24 100644
--- a/Documentation/devicetree/bindings/input/elan,ekth6915.yaml
+++ b/Documentation/devicetree/bindings/input/elan,ekth6915.yaml
@@ -20,7 +20,6 @@ properties:
   compatible:
     enum:
       - elan,ekth6915
-      - ilitek,ili2901
 
   reg:
     const: 0x10
diff --git a/Documentation/devicetree/bindings/input/ilitek,ili2901.yaml b/Documentation/devicetree/bindings/input/ilitek,ili2901.yaml
new file mode 100644
index 000000000000..1abeec768d79
--- /dev/null
+++ b/Documentation/devicetree/bindings/input/ilitek,ili2901.yaml
@@ -0,0 +1,66 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/input/ilitek,ili2901.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Ilitek ILI2901 touchscreen controller
+
+maintainers:
+  - Jiri Kosina <jkosina@suse.com>
+
+description:
+  Supports the Ilitek ILI2901 touchscreen controller.
+  This touchscreen controller uses the i2c-hid protocol with a reset GPIO.
+
+allOf:
+  - $ref: /schemas/input/touchscreen/touchscreen.yaml#
+
+properties:
+  compatible:
+    enum:
+      - ilitek,ili2901
+
+  reg:
+    maxItems: 1
+
+  interrupts:
+    maxItems: 1
+
+  panel: true
+
+  reset-gpios:
+    maxItems: 1
+
+  vcc33-supply: true
+
+  vccio-supply: true
+
+required:
+  - compatible
+  - reg
+  - interrupts
+  - vcc33-supply
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/gpio/gpio.h>
+    #include <dt-bindings/interrupt-controller/irq.h>
+
+    i2c {
+      #address-cells = <1>;
+      #size-cells = <0>;
+
+      touchscreen@41 {
+        compatible = "ilitek,ili2901";
+        reg = <0x41>;
+
+        interrupt-parent = <&tlmm>;
+        interrupts = <9 IRQ_TYPE_LEVEL_LOW>;
+
+        reset-gpios = <&tlmm 8 GPIO_ACTIVE_LOW>;
+        vcc33-supply = <&pp3300_ts>;
+      };
+    };
-- 
2.43.2


