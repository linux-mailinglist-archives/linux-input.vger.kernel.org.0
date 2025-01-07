Return-Path: <linux-input+bounces-8993-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id DEBB8A04024
	for <lists+linux-input@lfdr.de>; Tue,  7 Jan 2025 13:59:58 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 82FA73A6FF6
	for <lists+linux-input@lfdr.de>; Tue,  7 Jan 2025 12:59:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1B9E51F0E5B;
	Tue,  7 Jan 2025 12:58:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="vI7nhjo2"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B18101F0E23
	for <linux-input@vger.kernel.org>; Tue,  7 Jan 2025 12:58:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736254731; cv=none; b=PvvKNA8JzM49oOx0TQlpCd6me4jR4WWN8z/jES2KxuEOsswCTWFktP7YK0C2QxkU8Fj9xZOpUEGGDxK4aNXJofypzUfzaH634AT/j1DZvYZkgi89iC0KYKnELlbuOtnkHIHOuMJCcT5ZY7VNj5X+Vfnr0vFNvroN9GfcyNZK84Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736254731; c=relaxed/simple;
	bh=wlaO3AJ9OYX0Qw7UHvKhMLm6zO8rWmjR4OwCAC6whc8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=qRN5hu9kpTxpnRhfQCsEqq8or9a9xqLxPr3oDtZst/5Zo6lDWJbihv+xI7UXlGLDCULP3bx0W00atnowgFX2pssO38Tln4Ox7Wzn0DMZ5cn9OAfp0lEm2TrA05fuQ8Z/kE5JYSZDQ81JxOYLqpU4mkKZa/m129dL3MvUtddHB6A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=vI7nhjo2; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-4363298fff2so22088275e9.3
        for <linux-input@vger.kernel.org>; Tue, 07 Jan 2025 04:58:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1736254727; x=1736859527; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=5C/sFNAXY8klp3trjE/Y4l07v3FNmgHaHglxAlB5FO4=;
        b=vI7nhjo2ultK/+6l4WypuSY6FwPnaOFAlLlCopH3I03YGE31gHbH/oJmjvLOqhkeuU
         u/4Sj+DBsmoNBriBPEoE9xpHjle41qV9kjAvCh4WtVhLjWJi5Kg2vsUAs4hP38pEaw+Q
         tkhP4kL1WpwV0WnpHMJFdmtM5ZjSLwCBxOGw/kWVdSy61qZnzbx5RNv7U1KMuwifif3n
         WiAodCktCH+IGKNwdc2/vMVWRMA2nemPLTfaXphLykfSe5dSS3nGdS0Xcm22Qbi3NTn6
         dsFutTDKXsdW2s/J/Fi6i7styn0e/zlKT5HNO2EMqbK/YiUk905CgTAC0vjNGVP7DOLv
         4vFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736254727; x=1736859527;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=5C/sFNAXY8klp3trjE/Y4l07v3FNmgHaHglxAlB5FO4=;
        b=r3IR0RLOh+buk9WGZmL9xuLrvdFv1DHf/cw2hPUAxtzsgdR9MALtjbip9DyndHzMTh
         qY23+R7VmKROEee0aEqPrLl2kT1GDztsdXlEYOPDDz3bJ4fAixqx6jhj8TtWKWysTl0m
         RoC5zF4KvDvQZNT4wYQLMN5s9hWbD0tlU0Da94ln4Bq15emR7o3be8KP57hhm62WEJlt
         8LBYVS3k721kjdNgYgofAnJFGrDMIcvunPGKO0BujiA9G/0jVC13xue6WLB/YS2Zy0Vw
         6DxrF4YUoGxKiNR2HBH57jUOVyEzgQz4QsOlfgHO6/wxqJvNiPBEsrVSXT55DkIkawKh
         XQig==
X-Forwarded-Encrypted: i=1; AJvYcCWfooKJMGMYyrNRS+a+JOZmq6ZsEKNfFKVO+M9lSd0oQAIIyaTfiLqPjKCzfXeRkJpIunb6w0JODxYF6Q==@vger.kernel.org
X-Gm-Message-State: AOJu0Ywr6roj30gp0Sg6kx/8zrZ+YeZSct8QR2u5MBSBW+l486lfI55/
	CHZpSvCx6rrvWri2gnGn1vJ6rjzYsvolojnk6h95wfK9/FtAOct0UVWvA8EFcJo=
X-Gm-Gg: ASbGncsQRPBhxY6A7Hj+KefGuRTEzKx7iMnzcCZ78urBu8B4sAp0KuQC+05bWxfFV6R
	0L34C5ab8vamiY74G0Txsurv4JluA2rlRFsuIzfxKcH0uTxrFvbijEY6tnI3c8yib22pXEv9I4F
	+3aNrTkvprWCq7fqHIdmCGpMjzkdwR/ZWPo+wMWtfZM3z7uYid2oz0CzmmgO7w04Y8EAwkHMjon
	ajhWRgZUdAmWdfNnhQf75MThbRfA8FnJjBXJsrSa5CPkaay4fXKA0TeVvHI5JbJjcr0YW0=
X-Google-Smtp-Source: AGHT+IESBLWYlSIfi7wxN2DEKQk+daQDclS6+lJaW/+8/BxClMnBziT40HZf7Tg1VR2FDiFfnUZ+3g==
X-Received: by 2002:a5d:5f8f:0:b0:385:dd10:213f with SMTP id ffacd0b85a97d-38a223f5cb1mr22351728f8f.9.1736254726977;
        Tue, 07 Jan 2025 04:58:46 -0800 (PST)
Received: from krzk-bin.. ([178.197.223.165])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43656b11aecsm629480935e9.23.2025.01.07.04.58.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Jan 2025 04:58:46 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Alexander Stein <alexander.stein@ew.tq-group.com>,
	Marek Vasut <marex@denx.de>,
	linux-arm-msm@vger.kernel.org,
	linux-input@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH] dt-bindings: input: Correct indentation and style in DTS example
Date: Tue,  7 Jan 2025 13:58:43 +0100
Message-ID: <20250107125844.226466-1-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

DTS example in the bindings should be indented with 2- or 4-spaces and
aligned with opening '- |', so correct any differences like 3-spaces or
mixtures 2- and 4-spaces in one binding.

No functional changes here, but saves some comments during reviews of
new patches built on existing code.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 .../bindings/input/qcom,pm8921-keypad.yaml    | 46 +++++++++----------
 .../bindings/input/qcom,pm8921-pwrkey.yaml    | 36 +++++++--------
 .../input/touchscreen/ti,ads7843.yaml         | 30 ++++++------
 3 files changed, 56 insertions(+), 56 deletions(-)

diff --git a/Documentation/devicetree/bindings/input/qcom,pm8921-keypad.yaml b/Documentation/devicetree/bindings/input/qcom,pm8921-keypad.yaml
index 88764adcd696..e03611eef93d 100644
--- a/Documentation/devicetree/bindings/input/qcom,pm8921-keypad.yaml
+++ b/Documentation/devicetree/bindings/input/qcom,pm8921-keypad.yaml
@@ -62,28 +62,28 @@ unevaluatedProperties: false
 
 examples:
   - |
-   #include <dt-bindings/input/input.h>
-   #include <dt-bindings/interrupt-controller/irq.h>
-   pmic {
-       #address-cells = <1>;
-       #size-cells = <0>;
+    #include <dt-bindings/input/input.h>
+    #include <dt-bindings/interrupt-controller/irq.h>
+    pmic {
+        #address-cells = <1>;
+        #size-cells = <0>;
 
-       keypad@148 {
-           compatible = "qcom,pm8921-keypad";
-           reg = <0x148>;
-           interrupt-parent = <&pmicintc>;
-           interrupts = <74 IRQ_TYPE_EDGE_RISING>, <75 IRQ_TYPE_EDGE_RISING>;
-           linux,keymap = <
-               MATRIX_KEY(0, 0, KEY_VOLUMEUP)
-               MATRIX_KEY(0, 1, KEY_VOLUMEDOWN)
-               MATRIX_KEY(0, 2, KEY_CAMERA_FOCUS)
-               MATRIX_KEY(0, 3, KEY_CAMERA)
-           >;
-           keypad,num-rows = <1>;
-           keypad,num-columns = <5>;
-           debounce = <15>;
-           scan-delay = <32>;
-           row-hold = <91500>;
-       };
-   };
+        keypad@148 {
+            compatible = "qcom,pm8921-keypad";
+            reg = <0x148>;
+            interrupt-parent = <&pmicintc>;
+            interrupts = <74 IRQ_TYPE_EDGE_RISING>, <75 IRQ_TYPE_EDGE_RISING>;
+            linux,keymap = <
+                MATRIX_KEY(0, 0, KEY_VOLUMEUP)
+                MATRIX_KEY(0, 1, KEY_VOLUMEDOWN)
+                MATRIX_KEY(0, 2, KEY_CAMERA_FOCUS)
+                MATRIX_KEY(0, 3, KEY_CAMERA)
+            >;
+            keypad,num-rows = <1>;
+            keypad,num-columns = <5>;
+            debounce = <15>;
+            scan-delay = <32>;
+            row-hold = <91500>;
+        };
+    };
 ...
diff --git a/Documentation/devicetree/bindings/input/qcom,pm8921-pwrkey.yaml b/Documentation/devicetree/bindings/input/qcom,pm8921-pwrkey.yaml
index 12c74c083258..64590894857a 100644
--- a/Documentation/devicetree/bindings/input/qcom,pm8921-pwrkey.yaml
+++ b/Documentation/devicetree/bindings/input/qcom,pm8921-pwrkey.yaml
@@ -52,24 +52,24 @@ unevaluatedProperties: false
 
 examples:
   - |
-   #include <dt-bindings/interrupt-controller/irq.h>
-   ssbi {
-     #address-cells = <1>;
-     #size-cells = <0>;
+    #include <dt-bindings/interrupt-controller/irq.h>
+    ssbi {
+        #address-cells = <1>;
+        #size-cells = <0>;
 
-     pmic@0 {
-       reg = <0x0>;
-       #address-cells = <1>;
-       #size-cells = <0>;
+        pmic@0 {
+            reg = <0x0>;
+            #address-cells = <1>;
+            #size-cells = <0>;
 
-       pwrkey@1c {
-         compatible = "qcom,pm8921-pwrkey";
-         reg = <0x1c>;
-         interrupt-parent = <&pmicint>;
-         interrupts = <50 IRQ_TYPE_EDGE_RISING>, <51 IRQ_TYPE_EDGE_RISING>;
-         debounce = <15625>;
-         pull-up;
-       };
-     };
-   };
+            pwrkey@1c {
+                compatible = "qcom,pm8921-pwrkey";
+                reg = <0x1c>;
+                interrupt-parent = <&pmicint>;
+                interrupts = <50 IRQ_TYPE_EDGE_RISING>, <51 IRQ_TYPE_EDGE_RISING>;
+                debounce = <15625>;
+                pull-up;
+            };
+        };
+    };
 ...
diff --git a/Documentation/devicetree/bindings/input/touchscreen/ti,ads7843.yaml b/Documentation/devicetree/bindings/input/touchscreen/ti,ads7843.yaml
index 604921733d2c..8f6335d7da1c 100644
--- a/Documentation/devicetree/bindings/input/touchscreen/ti,ads7843.yaml
+++ b/Documentation/devicetree/bindings/input/touchscreen/ti,ads7843.yaml
@@ -164,20 +164,20 @@ examples:
         #size-cells = <0>;
 
         touchscreen@0 {
-           compatible = "ti,tsc2046";
-           reg = <0>;	/* CS0 */
-           interrupt-parent = <&gpio1>;
-           interrupts = <8 0>;	/* BOOT6 / GPIO 8 */
-           pendown-gpio = <&gpio1 8 0>;
-           spi-max-frequency = <1000000>;
-           vcc-supply = <&reg_vcc3>;
-           wakeup-source;
+            compatible = "ti,tsc2046";
+            reg = <0>;	/* CS0 */
+            interrupt-parent = <&gpio1>;
+            interrupts = <8 0>;	/* BOOT6 / GPIO 8 */
+            pendown-gpio = <&gpio1 8 0>;
+            spi-max-frequency = <1000000>;
+            vcc-supply = <&reg_vcc3>;
+            wakeup-source;
 
-           ti,pressure-max = /bits/ 16 <255>;
-           ti,x-max = /bits/ 16 <8000>;
-           ti,x-min = /bits/ 16 <0>;
-           ti,x-plate-ohms = /bits/ 16 <40>;
-           ti,y-max = /bits/ 16 <4800>;
-           ti,y-min = /bits/ 16 <0>;
-       };
+            ti,pressure-max = /bits/ 16 <255>;
+            ti,x-max = /bits/ 16 <8000>;
+            ti,x-min = /bits/ 16 <0>;
+            ti,x-plate-ohms = /bits/ 16 <40>;
+            ti,y-max = /bits/ 16 <4800>;
+            ti,y-min = /bits/ 16 <0>;
+        };
     };
-- 
2.43.0


