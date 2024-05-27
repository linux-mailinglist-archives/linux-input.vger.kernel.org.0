Return-Path: <linux-input+bounces-3853-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 690058CF818
	for <lists+linux-input@lfdr.de>; Mon, 27 May 2024 05:26:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id CCB57B20997
	for <lists+linux-input@lfdr.de>; Mon, 27 May 2024 03:26:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EAB308830;
	Mon, 27 May 2024 03:26:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="hSQzQPzO"
X-Original-To: linux-input@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A94D7523D;
	Mon, 27 May 2024 03:26:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716780395; cv=none; b=iKlipF08+ljUwN98EooaGqbaPyhugESHwEjy3KoBlufly3UQfSMsSbe99J9P2nfmsSWfnKca/0mNOMdiaMQtccsabFpOaw9Aik7Edu4brAYlUGr6na+jfpax97KGdySensxhQmqgAwzLKUu+T1UgIh/g2yUgJHH9gM8n2M/UpjU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716780395; c=relaxed/simple;
	bh=HaKiHpwKze6xx8hrZ0HkUm95XgsXEh+3lnAI2MmKvj0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=bX4WloQYoLJuK1TZ3GsJr2qied0+gXasEQVZ3VOGQiebpsGakj+gPGmstIohAw4Kjeulm+NuOf6JgOl2SAfzFHcSyRERDMyy1WDuANc3dLICI4RS50+1EyywYGe5z1K1vW1Ma7UkA7rsiHYFwrUe9VGmpAFScVwnSW8hDenB7pA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=hSQzQPzO; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 3C2D3C4AF09;
	Mon, 27 May 2024 03:26:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1716780395;
	bh=HaKiHpwKze6xx8hrZ0HkUm95XgsXEh+3lnAI2MmKvj0=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=hSQzQPzOcDZh8g4syl8bAi/FqRgg06Tnqw0t1ZWFwV2BECM+OrHoc2TxuHgV/zPX/
	 rodp6X/yjO1Cx1KNzsKCFAi4pxMrSrkkGb7E4/aOdovuTn9ui/RrgUk46gQWJmYzkw
	 98IX+cV1Cr9/H/4wBJjaUX3WWt+FB+unPEcoLrALUACY6LR5+btwPRg1dQtHf9KtSS
	 zTkzp3ce4UvPwEAHKEABEUmyoQAUOkNyOtw1Ic5TY2wjd22xh2zp1r5ETTrki1iusw
	 oCZp8JqhqvCszY37mum15RMUF21bPD1E/XxovpPdVKnMkyZPFomP1pmX4xhE5JA61A
	 JAFIRk0PrPrnA==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2A799C25B7D;
	Mon, 27 May 2024 03:26:35 +0000 (UTC)
From: Joel Selvaraj via B4 Relay <devnull+joelselvaraj.oss.gmail.com@kernel.org>
Date: Sun, 26 May 2024 22:26:25 -0500
Subject: [PATCH v3 2/3] dt-bindings: input: document Novatek NVT
 touchscreen controller
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240526-nvt-ts-devicetree-regulator-support-v3-2-aa88d10ccd9a@gmail.com>
References: <20240526-nvt-ts-devicetree-regulator-support-v3-0-aa88d10ccd9a@gmail.com>
In-Reply-To: <20240526-nvt-ts-devicetree-regulator-support-v3-0-aa88d10ccd9a@gmail.com>
To: Hans de Goede <hdegoede@redhat.com>, 
 Dmitry Torokhov <dmitry.torokhov@gmail.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 =?utf-8?q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Cc: linux-input@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, platform-driver-x86@vger.kernel.org, 
 Joel Selvaraj <joelselvaraj.oss@gmail.com>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.14-dev
X-Developer-Signature: v=1; a=ed25519-sha256; t=1716780394; l=2767;
 i=joelselvaraj.oss@gmail.com; s=20240420; h=from:subject:message-id;
 bh=l1XN86Z3ZftRDCgivV8HiV5DOjOZR8yQT8aQnuoq5qg=;
 b=8MKpZQ+jAWvpa7Z2PwoswXduI3+KPMvom9PUSnswFG7Pi+7ij9fKXwW8z6N/ru78Yqf2kPnUa
 YN0dTDBgvCyB0vq0+1EpZyhWYJ0ZTDShUsM1r60qu/ROdD5euy+OlPK
X-Developer-Key: i=joelselvaraj.oss@gmail.com; a=ed25519;
 pk=qT4gsuVtlPE0Dpr+tQA/Fumm7wzVP6qfeVaY+6pX04s=
X-Endpoint-Received: by B4 Relay for joelselvaraj.oss@gmail.com/20240420
 with auth_id=165
X-Original-From: Joel Selvaraj <joelselvaraj.oss@gmail.com>
Reply-To: joelselvaraj.oss@gmail.com

From: Joel Selvaraj <joelselvaraj.oss@gmail.com>

Document the Novatek NVT touchscreen controller present in devices like
qcom/sdm845-xiaomi-beryllium-tianma.dts. Also, include the devictree
binding file in the MAINTAINERS file.

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Signed-off-by: Joel Selvaraj <joelselvaraj.oss@gmail.com>
---
 .../bindings/input/touchscreen/novatek,nvt-ts.yaml | 62 ++++++++++++++++++++++
 MAINTAINERS                                        |  1 +
 2 files changed, 63 insertions(+)

diff --git a/Documentation/devicetree/bindings/input/touchscreen/novatek,nvt-ts.yaml b/Documentation/devicetree/bindings/input/touchscreen/novatek,nvt-ts.yaml
new file mode 100644
index 0000000000000..bd6a60486d1f1
--- /dev/null
+++ b/Documentation/devicetree/bindings/input/touchscreen/novatek,nvt-ts.yaml
@@ -0,0 +1,62 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/input/touchscreen/novatek,nvt-ts.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Novatek NVT Touchscreen Controller
+
+maintainers:
+  - Hans de Goede <hdegoede@redhat.com>
+
+allOf:
+  - $ref: touchscreen.yaml#
+
+properties:
+  compatible:
+    enum:
+      - novatek,nt11205-ts
+      - novatek,nt36672a-ts
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
+  vcc-supply: true
+  iovcc-supply: true
+
+required:
+  - compatible
+  - reg
+  - interrupts
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/gpio/gpio.h>
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+    i2c {
+        #address-cells = <1>;
+        #size-cells = <0>;
+        touchscreen@1 {
+            compatible = "novatek,nt36672a-ts";
+            reg = <0x01>;
+            interrupts-extended = <&tlmm 31 IRQ_TYPE_EDGE_RISING>;
+            reset-gpios = <&tlmm 32 GPIO_ACTIVE_LOW>;
+            vcc-supply = <&vreg_l22a_2p85>;
+            iovcc-supply = <&vreg_l14a_1p8>;
+            pinctrl-0 = <&ts_int_default &ts_reset_default>;
+            pinctrl-1 = <&ts_int_sleep &ts_reset_sleep>;
+            pinctrl-names = "default", "sleep";
+            touchscreen-size-x = <1080>;
+            touchscreen-size-y = <2246>;
+        };
+    };
+
+...
diff --git a/MAINTAINERS b/MAINTAINERS
index 90754a451bcfc..e1f744992b15f 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -15942,6 +15942,7 @@ NOVATEK NVT-TS I2C TOUCHSCREEN DRIVER
 M:	Hans de Goede <hdegoede@redhat.com>
 L:	linux-input@vger.kernel.org
 S:	Maintained
+F:	Documentation/devicetree/bindings/input/touchscreen/novatek,nvt-ts.yaml
 F:	drivers/input/touchscreen/novatek-nvt-ts.c
 
 NSDEPS

-- 
2.45.1



