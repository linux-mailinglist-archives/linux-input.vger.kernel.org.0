Return-Path: <linux-input+bounces-3820-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 17DF28CE73A
	for <lists+linux-input@lfdr.de>; Fri, 24 May 2024 16:39:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 49AA01C20B2E
	for <lists+linux-input@lfdr.de>; Fri, 24 May 2024 14:39:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0F83F12C53A;
	Fri, 24 May 2024 14:39:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="a5U1d6lj"
X-Original-To: linux-input@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D1CC117C9;
	Fri, 24 May 2024 14:39:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716561589; cv=none; b=mhSZozOCHHwLC7QBTi9Llbcv9sXgk0e9kLoTbzMDhl6ODod6YAhYvjF6SbMvPxfpNKTeBDL52hNgmOt9W/8RcM3P9bx3pIEpsLRgwH2O73GssuadzfozrOW7Ed51hYGVBCiqpPo6K9xIhvSoZkGdIhmyS3wUbh/3SXNDfjiXPts=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716561589; c=relaxed/simple;
	bh=qPagS3nf7JxLDEBoJP6Rlhnx9zPxEQqI9AG4+8sd/Oo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=SXrlhEh/wTJKWQ16zw324XF0Jbfs3tL3AdgAVzpin9wJrtykg2Yyn8pO1p6Dg95dPxl0LKyjNrOkUKqDGxFPSiCme/hkVfA19m1AtkZZJwxkcMnGywWvTchgBdhE92KIoYD7TcxfT/YvQd/q+wNllnTrxuTks6xwmHHB7eWsiOQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=a5U1d6lj; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 81378C2BD11;
	Fri, 24 May 2024 14:39:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1716561589;
	bh=qPagS3nf7JxLDEBoJP6Rlhnx9zPxEQqI9AG4+8sd/Oo=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=a5U1d6lj5avUgnLbwhLnasDun9VuLD6Pq/mjpi/7jv7N7IGzpIngjgD4vilY1n6QZ
	 zOfbqsOmWG1fxUABq3uBdE2Pf67RCpya3JZRtbrU8EAjEq5oRHJqxRiZAUazcw2ekT
	 iLj+dG3T5C1aKQCpib/8bKODh+xQnpzheOniz3SHbA7sjxl4Poqg8XVMuhkbHIe4rW
	 Uzz6GyNwE2K2WuFK4FzA3QLbDUrQPvoMsNdIoiXBqDbAGh5GTUq9jaU7hr5vPGh0AZ
	 JPncP6XxhC+5r8zyDInFjaaLJvEc3mr2h5MQRA377B2DbzViyLaCLvura7nl6j0sIm
	 4jhX8OEwoRf5A==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6912FC25B7D;
	Fri, 24 May 2024 14:39:49 +0000 (UTC)
From: Joel Selvaraj via B4 Relay <devnull+joelselvaraj.oss.gmail.com@kernel.org>
Date: Fri, 24 May 2024 09:39:19 -0500
Subject: [PATCH v2 2/3] dt-bindings: input: document Novatek NVT
 touchscreen controller
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240524-nvt-ts-devicetree-regulator-support-v2-2-b74947038c44@gmail.com>
References: <20240524-nvt-ts-devicetree-regulator-support-v2-0-b74947038c44@gmail.com>
In-Reply-To: <20240524-nvt-ts-devicetree-regulator-support-v2-0-b74947038c44@gmail.com>
To: Hans de Goede <hdegoede@redhat.com>, 
 Dmitry Torokhov <dmitry.torokhov@gmail.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 =?utf-8?q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Cc: linux-input@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, platform-driver-x86@vger.kernel.org, 
 Joel Selvaraj <joelselvaraj.oss@gmail.com>
X-Mailer: b4 0.14-dev
X-Developer-Signature: v=1; a=ed25519-sha256; t=1716561588; l=2807;
 i=joelselvaraj.oss@gmail.com; s=20240420; h=from:subject:message-id;
 bh=Y6dkGY1AKwCQh1ciYwF2DiXPtYGhHE52a60bkhbIlpc=;
 b=YJD1TuFL0D65mNKAyem1JMSxF062NJeL2lFevzqLNvapmkGwEpGn6W+EksRgr26odzQCIas0Z
 ARnVuVCHoCHAQSjHxcO1EKB+XS9z9dysNdHYAWfB8a2InIhr0Ja1/na
X-Developer-Key: i=joelselvaraj.oss@gmail.com; a=ed25519;
 pk=qT4gsuVtlPE0Dpr+tQA/Fumm7wzVP6qfeVaY+6pX04s=
X-Endpoint-Received: by B4 Relay for joelselvaraj.oss@gmail.com/20240420
 with auth_id=165
X-Original-From: Joel Selvaraj <joelselvaraj.oss@gmail.com>
Reply-To: joelselvaraj.oss@gmail.com

From: Joel Selvaraj <joelselvaraj.oss@gmail.com>

Document the Novatek NVT touchscreen controller present in devices like
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
index 0000000000000..c47b4de9d58e7
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



