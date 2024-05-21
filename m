Return-Path: <linux-input+bounces-3755-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 173BA8CADE8
	for <lists+linux-input@lfdr.de>; Tue, 21 May 2024 14:10:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 481B81C221AF
	for <lists+linux-input@lfdr.de>; Tue, 21 May 2024 12:10:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7AFE8762E0;
	Tue, 21 May 2024 12:10:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="TSdto/ub"
X-Original-To: linux-input@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 447647581A;
	Tue, 21 May 2024 12:10:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716293428; cv=none; b=Psdw/q55pRMsudD6tU5lXaRhSc6/JXaevY377SsqxljIfgGDLq+GrAXf0a+EXzGJSPY+iFAmBP7HzNMYqty1MqNpiMsPHrNQA2VaKGGiM9hn7QC6SW+sM46HcmvrpRV2RKhEfyI3k7m+VKm51Nfl1zLDVp/UKpiDYhYeLvVR7YI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716293428; c=relaxed/simple;
	bh=UG5eBhNRoib+nYNoHj5imPkbdo4AU8SmjD6PNxoq7gM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=j3QtDsch+f0v5ldB1MKzLtiqHTBWmkoka1X4pG+0bhHC4nIen3lHpnfVToWCFy4qPutYa3rZrSXwKk+MU+MywoZdIfWzRcI7zG5IfbVvaScGIfdbpU8nL1XuwQQXFmMnJCeT4zbRRcjXR7VcMT1I8g9pdzrdZ3AeWWIqF0Ci/uQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=TSdto/ub; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id DF557C32789;
	Tue, 21 May 2024 12:10:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1716293428;
	bh=UG5eBhNRoib+nYNoHj5imPkbdo4AU8SmjD6PNxoq7gM=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=TSdto/ubvqOF+SkOLydd0ua3x4Pl9NScjWMBvqtnI9PYHJh8J5bZTpH3GrPOSRZN2
	 U29YccWmqw1Cy3I1WNW+vs2zHvq2bzYNjZx2h//LviDPr4LmvJ26Xuhpv8loeTu+AK
	 60kDmDJJrmK8WhZldFEO60CJ4pYlNRVX8erLRBLKXurZSvKCbyhUPuaLqPck+OfUKF
	 YM5xwPYd8AYv6tBvopacHX2hqmLniGRNGiqsn4uHyOajGjWEykrUkHNtasYFuqawQ+
	 ItB8OxzH9e1MK4mBE1KwsEP5v8XQYcdmkg28bPdzYggGzFTSfwxcAvFEHmk7nyl7gP
	 VJ9CizJDi5AAQ==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C6191C25B7A;
	Tue, 21 May 2024 12:10:27 +0000 (UTC)
From: Joel Selvaraj via B4 Relay <devnull+joelselvaraj.oss.gmail.com@kernel.org>
Date: Tue, 21 May 2024 07:09:45 -0500
Subject: [PATCH 1/2] dt-bindings: input: document Novatek NVT touchscreen
 controller
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240521-nvt-ts-devicetree-regulator-support-v1-1-8d766c639dca@gmail.com>
References: <20240521-nvt-ts-devicetree-regulator-support-v1-0-8d766c639dca@gmail.com>
In-Reply-To: <20240521-nvt-ts-devicetree-regulator-support-v1-0-8d766c639dca@gmail.com>
To: Hans de Goede <hdegoede@redhat.com>, 
 Dmitry Torokhov <dmitry.torokhov@gmail.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-input@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Joel Selvaraj <joelselvaraj.oss@gmail.com>
X-Mailer: b4 0.14-dev
X-Developer-Signature: v=1; a=ed25519-sha256; t=1716293427; l=2805;
 i=joelselvaraj.oss@gmail.com; s=20240420; h=from:subject:message-id;
 bh=95WsWhwuKwzTjQEHVYwidX2cErhdi13Wf2Y2e3kqVx4=;
 b=DFdnkNQ88kGuYJgJN2dt9CqbycC27i5ly3Gg5cl4PZJMTdk2g+tzWNiUokTLfTH1ME1f9Lpvb
 tx0rruaBrubDIWMG71ap8cQ3MWdbsPkNF/C+TMRmEk4l7kY3X7iozMm
X-Developer-Key: i=joelselvaraj.oss@gmail.com; a=ed25519;
 pk=qT4gsuVtlPE0Dpr+tQA/Fumm7wzVP6qfeVaY+6pX04s=
X-Endpoint-Received: by B4 Relay for joelselvaraj.oss@gmail.com/20240420
 with auth_id=165
X-Original-From: Joel Selvaraj <joelselvaraj.oss@gmail.com>
Reply-To: joelselvaraj.oss@gmail.com

From: Joel Selvaraj <joelselvaraj.oss@gmail.com>

Document the Novatek NVT touchscreen driver which is used in devices like
the Xiaomi Poco F1 [1]. Also, include the devictree binding file in the
MAINTAINERS file.

[1] https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/arch/arm64/boot/dts/qcom/sdm845-xiaomi-beryllium-tianma.dts?h=v6.9

Signed-off-by: Joel Selvaraj <joelselvaraj.oss@gmail.com>
---
 .../bindings/input/touchscreen/novatek,nvt-ts.yaml | 62 ++++++++++++++++++++++
 MAINTAINERS                                        |  1 +
 2 files changed, 63 insertions(+)

diff --git a/Documentation/devicetree/bindings/input/touchscreen/novatek,nvt-ts.yaml b/Documentation/devicetree/bindings/input/touchscreen/novatek,nvt-ts.yaml
new file mode 100644
index 0000000000000..7839c6a028e4a
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
+      - novatek,nvt-ts
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
+unevaluatedProperties: false
+
+required:
+  - compatible
+  - reg
+  - interrupts
+
+examples:
+  - |
+    #include <dt-bindings/gpio/gpio.h>
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+    i2c {
+        #address-cells = <1>;
+        #size-cells = <0>;
+        touchscreen@1 {
+          compatible = "novatek,nt36672a-ts";
+          reg = <0x01>;
+          interrupts-extended = <&tlmm 31 IRQ_TYPE_EDGE_RISING>;
+          reset-gpios = <&tlmm 32 GPIO_ACTIVE_LOW>;
+          vcc-supply = <&vreg_l22a_2p85>;
+          iovcc-supply = <&vreg_l14a_1p8>;
+          pinctrl-0 = <&ts_int_default &ts_reset_default>;
+          pinctrl-1 = <&ts_int_sleep &ts_reset_sleep>;
+          pinctrl-names = "default", "sleep";
+          touchscreen-size-x = <1080>;
+          touchscreen-size-y = <2246>;
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



