Return-Path: <linux-input+bounces-638-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A746780B2C4
	for <lists+linux-input@lfdr.de>; Sat,  9 Dec 2023 08:34:01 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 3888928111B
	for <lists+linux-input@lfdr.de>; Sat,  9 Dec 2023 07:34:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 236B463D2;
	Sat,  9 Dec 2023 07:33:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="L8G40mZY"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-wr1-x434.google.com (mail-wr1-x434.google.com [IPv6:2a00:1450:4864:20::434])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5374E10EA
	for <linux-input@vger.kernel.org>; Fri,  8 Dec 2023 23:33:48 -0800 (PST)
Received: by mail-wr1-x434.google.com with SMTP id ffacd0b85a97d-3332e351670so2659736f8f.0
        for <linux-input@vger.kernel.org>; Fri, 08 Dec 2023 23:33:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1702107226; x=1702712026; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=31dDSPmTEwAk2xBEYscYsgGP3NvqtS1pbeFP7C1NdB4=;
        b=L8G40mZYegqcCvYV8k0c0aqTGnQDNPY8HR/ACoIUbFaqwm0lthDrxB2nlUBYuqrYXH
         xKQwnpfM1/+A8qufZcLrR7/6EBOq95MM2sUm/T0OqFOxmzxMWWfTcM8quqPYJoeBUuu8
         EK3CsIdWRmc7498XA3Cgcg7BNN9lsNECX8pSCM9MLaFAy+GWdCILlZlE5Vv46wfZUfd4
         M/CdJW+Bsi9F8YZUqG1XW1bexx4QUfE0MHL2fhXaw81d6EX0BfW/2mjtsX2V8Q1hKBdi
         5WS/aSPMtaGoR54p5yrAUj7I90wioBtpbGxopGPlnsB7SedvB2fhMNAIQ5JWCKHHNhQV
         u0Xw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702107226; x=1702712026;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=31dDSPmTEwAk2xBEYscYsgGP3NvqtS1pbeFP7C1NdB4=;
        b=ZwA09RLYra4Jv/JlkBDxfWPkq9NJQ27ufNXfOj0jI+d69QKLzdHYG6BMJktiXgedAP
         RzGEH7sK3QIq6rLw+HDSgPhtgg0mXCuatQsLUA5ylOPDybSJeXX2Fk3uEliYUt85EoW0
         RYWssaPE90RP35zSVCeUUVlYrF3gSk67keTQECS0p7unl+l/OYGbPuk1gjR0BGs2Jwo0
         j9J3VTsJyQsjLaCSP1j2iNjuuXMcrrT1I/MO8V0MRe+jliiPHS1i5czE9T2o4xrA7FvI
         14eyj8Z93qeIqk/yE5x93M73TxEY4vngvMEop/8mojvq2O0eeYHmapdLa0bUKinHD89B
         aZqA==
X-Gm-Message-State: AOJu0YzfdQR4890IirMaMt7LLmQxpyyUY1YpBgrsGQXtnj3obXwc1F72
	qMCYXTvCk9CNtyK77VBfKou3wg==
X-Google-Smtp-Source: AGHT+IHj7ShhVjMt4093im1KcDZC0Z5/bXfMGgTmQoUM7WxPNHI6nB8hoARq+oKGRCkeIx68Mubt2g==
X-Received: by 2002:a5d:6e8d:0:b0:333:3117:c43e with SMTP id k13-20020a5d6e8d000000b003333117c43emr284271wrz.207.1702107226672;
        Fri, 08 Dec 2023 23:33:46 -0800 (PST)
Received: from arrakeen.starnux.net ([2a01:e0a:982:cbb0:8261:5fff:fe11:bdda])
        by smtp.gmail.com with ESMTPSA id m3-20020a5d56c3000000b003334520e49bsm3577803wrw.53.2023.12.08.23.33.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 08 Dec 2023 23:33:46 -0800 (PST)
From: Neil Armstrong <neil.armstrong@linaro.org>
Date: Sat, 09 Dec 2023 08:33:39 +0100
Subject: [PATCH v12 1/4] dt-bindings: input: document Goodix Berlin
 Touchscreen IC
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20231209-topic-goodix-berlin-upstream-initial-v12-1-eaffaeb53fb5@linaro.org>
References: <20231209-topic-goodix-berlin-upstream-initial-v12-0-eaffaeb53fb5@linaro.org>
In-Reply-To: <20231209-topic-goodix-berlin-upstream-initial-v12-0-eaffaeb53fb5@linaro.org>
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>, 
 linux-input@vger.kernel.org
Cc: Rob Herring <robh+dt@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Conor Dooley <conor+dt@kernel.org>, Bastien Nocera <hadess@hadess.net>, 
 Hans de Goede <hdegoede@redhat.com>, Henrik Rydberg <rydberg@bitmath.org>, 
 Jeff LaBundy <jeff@labundy.com>, linux-arm-msm@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Neil Armstrong <neil.armstrong@linaro.org>, Rob Herring <robh@kernel.org>
X-Mailer: b4 0.12.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=3093;
 i=neil.armstrong@linaro.org; h=from:subject:message-id;
 bh=sfk9uxvNPIwk9f8d5iBn9m2N4nTZgMQFpRmAil1gnVU=;
 b=owEBbQKS/ZANAwAKAXfc29rIyEnRAcsmYgBldBhWpRETZRzoQ+wlfao2qaeIz/dVT35rxQE1WjFg
 IjOi2xaJAjMEAAEKAB0WIQQ9U8YmyFYF/h30LIt33NvayMhJ0QUCZXQYVgAKCRB33NvayMhJ0bS8EA
 Co7RUt5x8LnwxAYh/dZWYLnhHM1Q6IVTinFG/1H89CHCKiPZCTMjBpIuSdZs62KHyft80VllwvUB9X
 cDGNjqTkGNvbGNCIprLSiTU/klc4hEn25g0vLsa2ZsOT4Toisr4O4UpbEHckC9Tx04Zwtt4Kx+R6sy
 M2KQ3vmNPR2RHGxWppmoc/UwHd2i4Csx8MCbFwfokLMNf90M+nv0TXlKdUt6QBKtkLOV3oMCZWzRqX
 5wSqLzTc+oHvvhND1RtKrIJT6jv9+44mIdhn0WjOJeKuWSoKC5yIX5rjG8OMEdIBnfJwmZlg7FKp8Q
 3S/ziQ3wGH/kMBgi0txThzq/RF7RdXz5N2ZmjZ2icRqTFPiSq0wZ93bb9YjnVG4xRZh2QVkzrVVxpJ
 2z/Jai+oC6+bpv3sj5DT+lLvd/gBlEH21rkb76DkZbhutpt1pr0tguRCOg3hBGYw1m8tYEvYZWVOPr
 9bMW9jqrxfWhZCaIEDPreUVGzB2gAiyV/AMnbM0mV5J7H/lcSn/3STEeIon4mVp4eWut3XPjvqnxAv
 tHmk7aKyPWd0h8MBZzyTTP3zANUhx2esrw6STVJoBFiXrIQMajgOqumFaiYtOq8Oa95XO34e4RpDxo
 PtSVvPSmuxXekM09PvqQ8GalmLtjt64ZIIPKhsoQPw9+36SjEDLsLABG+V9Q==
X-Developer-Key: i=neil.armstrong@linaro.org; a=openpgp;
 fpr=89EC3D058446217450F22848169AB7B1A4CFF8AE

Document the Goodix GT9916 wich is part of the "Berlin" serie
of Touchscreen controllers IC from Goodix.

Reviewed-by: Rob Herring <robh@kernel.org>
Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
---
 .../bindings/input/touchscreen/goodix,gt9916.yaml  | 95 ++++++++++++++++++++++
 1 file changed, 95 insertions(+)

diff --git a/Documentation/devicetree/bindings/input/touchscreen/goodix,gt9916.yaml b/Documentation/devicetree/bindings/input/touchscreen/goodix,gt9916.yaml
new file mode 100644
index 000000000000..d90f045ac06c
--- /dev/null
+++ b/Documentation/devicetree/bindings/input/touchscreen/goodix,gt9916.yaml
@@ -0,0 +1,95 @@
+# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/input/touchscreen/goodix,gt9916.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Goodix Berlin series touchscreen controller
+
+description: The Goodix Berlin series of touchscreen controllers
+  be connected to either I2C or SPI buses.
+
+maintainers:
+  - Neil Armstrong <neil.armstrong@linaro.org>
+
+allOf:
+  - $ref: touchscreen.yaml#
+  - $ref: /schemas/spi/spi-peripheral-props.yaml#
+
+properties:
+  compatible:
+    enum:
+      - goodix,gt9916
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
+  avdd-supply:
+    description: Analog power supply regulator on AVDD pin
+
+  vddio-supply:
+    description: power supply regulator on VDDIO pin
+
+  spi-max-frequency: true
+  touchscreen-inverted-x: true
+  touchscreen-inverted-y: true
+  touchscreen-size-x: true
+  touchscreen-size-y: true
+  touchscreen-swapped-x-y: true
+
+additionalProperties: false
+
+required:
+  - compatible
+  - reg
+  - interrupts
+  - avdd-supply
+  - touchscreen-size-x
+  - touchscreen-size-y
+
+examples:
+  - |
+    #include <dt-bindings/interrupt-controller/irq.h>
+    #include <dt-bindings/gpio/gpio.h>
+    i2c {
+      #address-cells = <1>;
+      #size-cells = <0>;
+      touchscreen@5d {
+        compatible = "goodix,gt9916";
+        reg = <0x5d>;
+        interrupt-parent = <&gpio>;
+        interrupts = <25 IRQ_TYPE_LEVEL_LOW>;
+        reset-gpios = <&gpio1 1 GPIO_ACTIVE_LOW>;
+        avdd-supply = <&ts_avdd>;
+        touchscreen-size-x = <1024>;
+        touchscreen-size-y = <768>;
+      };
+    };
+  - |
+    #include <dt-bindings/interrupt-controller/irq.h>
+    #include <dt-bindings/gpio/gpio.h>
+    spi {
+      #address-cells = <1>;
+      #size-cells = <0>;
+      num-cs = <1>;
+      cs-gpios = <&gpio 2 GPIO_ACTIVE_HIGH>;
+      touchscreen@0 {
+        compatible = "goodix,gt9916";
+        reg = <0>;
+        interrupt-parent = <&gpio>;
+        interrupts = <25 IRQ_TYPE_LEVEL_LOW>;
+        reset-gpios = <&gpio1 1 GPIO_ACTIVE_LOW>;
+        avdd-supply = <&ts_avdd>;
+        spi-max-frequency = <1000000>;
+        touchscreen-size-x = <1024>;
+        touchscreen-size-y = <768>;
+      };
+    };
+
+...

-- 
2.34.1


