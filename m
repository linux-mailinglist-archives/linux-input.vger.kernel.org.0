Return-Path: <linux-input+bounces-765-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D62EF811A8F
	for <lists+linux-input@lfdr.de>; Wed, 13 Dec 2023 18:13:36 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 5C5C2B212CD
	for <lists+linux-input@lfdr.de>; Wed, 13 Dec 2023 17:13:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 202275100B;
	Wed, 13 Dec 2023 17:13:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="vRf3GCAm"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-wm1-x32f.google.com (mail-wm1-x32f.google.com [IPv6:2a00:1450:4864:20::32f])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7A1E7F3
	for <linux-input@vger.kernel.org>; Wed, 13 Dec 2023 09:13:23 -0800 (PST)
Received: by mail-wm1-x32f.google.com with SMTP id 5b1f17b1804b1-40c256ffdbcso73538275e9.2
        for <linux-input@vger.kernel.org>; Wed, 13 Dec 2023 09:13:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1702487602; x=1703092402; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=31dDSPmTEwAk2xBEYscYsgGP3NvqtS1pbeFP7C1NdB4=;
        b=vRf3GCAmd+2vsajOLfAobRT+HWtWdv+hzJNN85w4SlVSwkTshej+VkKMBeWv+acXml
         C9XpuvlgS++/L5bfwGASViy5FYv1NfwwFsWi7g6zGYnHFnascWiKlpZLFvrvfvzyjjSl
         QBidhyT7ChrPhfMvmAilBGRxXxoZGnIZQ1Y2QfMUkIVF8YcQUiun4vNkyc5y8OAYkymu
         XyIQCxgiSIk9Z3zADaN5XdBCErAQTpG8XgjlqB5SCpSMTJAZNIanKVUnn3LhJxad3YGB
         tQOsDVeltktB1Ya6sYdrm0pN+maEkahjfBCQ0JkxCXTp0vV2WYphhtKsQdxNblZcJnsx
         NgDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702487602; x=1703092402;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=31dDSPmTEwAk2xBEYscYsgGP3NvqtS1pbeFP7C1NdB4=;
        b=eKtPuy6PEI/rfJaElIL+UEWUShJWz2DhenicKXt6ssJgOnfHl7H7uyoX1qVQBoQxw6
         4ydv+sziHbF5BshVxIcIJf7YDSS64wmQ17CqhtoeCTzb3SXCFYRyZ08nfYFGk6CBCOho
         RsZ5PDCOq52BQ3jC10VeJwzLUlh9zGjsMwXVxvpPd/VQPdc7loxCtaxRIJ0lP7Ore/q+
         ltUu/yUsG/WIwV8F4m06yrGn5d5FZG/csmAEhcLA2n1a3Ct45g2JKwl4j3QV9T09mOKp
         olts1j3uqWpqBd1fZokSLWAu657W36EKb5IwyppwcnRYXm+y0uTtjUNUkHft+4vX57HB
         WtKA==
X-Gm-Message-State: AOJu0YxHHCpYFD4Wm2PaHKsT1LTb8CftiTWWTtVxj1LeSAaPro2U7gRl
	mM4e/iQbALFCziuXrAdYvwWaZg==
X-Google-Smtp-Source: AGHT+IFNxRWuoyoMH99OVMds74dBq0nzs3ZGX6y7FzWzIYWb39Co8GjVY1K8MQjTbIB5l3gmiCGrGQ==
X-Received: by 2002:a05:600c:21c7:b0:40b:5e59:c56d with SMTP id x7-20020a05600c21c700b0040b5e59c56dmr3995877wmj.151.1702487601882;
        Wed, 13 Dec 2023 09:13:21 -0800 (PST)
Received: from arrakeen.starnux.net ([2a01:e0a:982:cbb0:52eb:f6ff:feb3:451a])
        by smtp.gmail.com with ESMTPSA id fs27-20020a05600c3f9b00b0040b36050f1bsm20711039wmb.44.2023.12.13.09.13.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 Dec 2023 09:13:21 -0800 (PST)
From: Neil Armstrong <neil.armstrong@linaro.org>
Date: Wed, 13 Dec 2023 18:13:15 +0100
Subject: [PATCH v13 1/4] dt-bindings: input: document Goodix Berlin
 Touchscreen IC
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20231213-topic-goodix-berlin-upstream-initial-v13-1-5d7a26a5eaa2@linaro.org>
References: <20231213-topic-goodix-berlin-upstream-initial-v13-0-5d7a26a5eaa2@linaro.org>
In-Reply-To: <20231213-topic-goodix-berlin-upstream-initial-v13-0-5d7a26a5eaa2@linaro.org>
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>, 
 linux-input@vger.kernel.org
Cc: Rob Herring <robh+dt@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Conor Dooley <conor+dt@kernel.org>, Bastien Nocera <hadess@hadess.net>, 
 Hans de Goede <hdegoede@redhat.com>, Henrik Rydberg <rydberg@bitmath.org>, 
 Jeff LaBundy <jeff@labundy.com>, linux-arm-msm@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Neil Armstrong <neil.armstrong@linaro.org>, Rob Herring <robh@kernel.org>
X-Mailer: b4 0.12.4
X-Developer-Signature: v=1; a=openpgp-sha256; l=3093;
 i=neil.armstrong@linaro.org; h=from:subject:message-id;
 bh=sfk9uxvNPIwk9f8d5iBn9m2N4nTZgMQFpRmAil1gnVU=;
 b=owEBbQKS/ZANAwAKAXfc29rIyEnRAcsmYgBleeYtdo3/RXb6z9No87q/nEif3kzQeQmpKl3o0czv
 dBOjeaaJAjMEAAEKAB0WIQQ9U8YmyFYF/h30LIt33NvayMhJ0QUCZXnmLQAKCRB33NvayMhJ0SNFD/
 4mDZ9YQJBUetNhtMkQ1OwNW2iiRHIva7gDQ0eXvOZSnejUXC0krLIS2/LeWhzWbgjY8RS4jZ8fxlVY
 ufvtpjrC0RYSBsVLNYROB5TTFMakp0b5PplncZuFOL6xD9kFT5nhHJVxglIPWi9afFHobmgAzoq/1A
 5Z3ypeh15eXYfAVzxqlZR9zaIDnWQFqa0Tzox9+GGYYt53E3uPGmNznsXREthx+25Fxf0eHnd243JR
 cvAEN/pyI7OCvFm5JVLQY8vGV4ZU5V0jR7dC72WMwF8XU4mu0B3Z3CpMN8tNts5h9DXkhZTk31mBzb
 7bLNaY2fKrFS4rEXSyd7x6fliIRRPpzfRMMfwBewO7Lx1VdHHxQdpf0T6HXF9rB662/kigJb/f3fkH
 Qj/1I43y4JiNGxiSq0DG7q7dGeQdbtX4xcD1hWgrf6s5gonieDKyN6juaYdd4RLNCFEbx4NDigu1Hx
 RngW8T/ecjZCJcVknWc9gR26O5tNWvm55qolQDHLp/+kZW6XCnEDsGZIa4/i4gjyURcLoQyvCC6rJ9
 zCmuGWNc/9nUc7n0Q5wXpvsJYEPk418VjICddEJFaXub1uTHUkAUAB96xzM4UHMUi/3e5rq8BVpkqU
 poiSSwbPPwLJP6BiXxyNKNjNIqbJS5ngAmUz1CBAtsiHaYTQsdx9f6xiaBtA==
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


