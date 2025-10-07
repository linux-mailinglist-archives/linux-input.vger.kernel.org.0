Return-Path: <linux-input+bounces-15281-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 63EF1BC1354
	for <lists+linux-input@lfdr.de>; Tue, 07 Oct 2025 13:27:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 0386A1892C98
	for <lists+linux-input@lfdr.de>; Tue,  7 Oct 2025 11:27:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 62D6E2DAFA4;
	Tue,  7 Oct 2025 11:17:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XXN7HPGj"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-pg1-f171.google.com (mail-pg1-f171.google.com [209.85.215.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D41E2DA76F
	for <linux-input@vger.kernel.org>; Tue,  7 Oct 2025 11:17:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759835857; cv=none; b=AdgclIR5PUQfUSz3Kr4TlJxAaNlTTnG+148Y64xiFKM0Bya8nSxctEYI/SIyu1RaFG1Vm1LhWEceB6N58x4WJ3cYLVUWXbYcV5gveO45+H97HUrkVMz/n+H7v1GuJRuPRf3uZBwxnK82K19iVTEnMdg4TT+JBiSrVNmuyD3N6Rw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759835857; c=relaxed/simple;
	bh=laVpP74gTzMbo2qrGHUEyEkSlszTpZA5CERei0FVY5s=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=lskkWVWBxQN6h8HidYE1I3y2bNrTaduz9e9MxhZ3PT6Trc0HNrfHYfJUMgoUfB+vf66poNZd9gn6EGO6855KJ8rIzw2gKxJLmpH1+htt9datfpYRQ3X8BsaZSs2Z9bnl5XDmsvDsXzywB41UIgvX3/rahEWxEMIx9PcJlsy1pSI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=XXN7HPGj; arc=none smtp.client-ip=209.85.215.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pg1-f171.google.com with SMTP id 41be03b00d2f7-b55640a2e33so4561394a12.2
        for <linux-input@vger.kernel.org>; Tue, 07 Oct 2025 04:17:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1759835854; x=1760440654; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ati20Ylz/khRNYG15B4+E/fLC+jK8mAaQ816iOPHxo4=;
        b=XXN7HPGjjYYMwfGCozDPIbDomS38KWTaisHM9ZQA/dVpVmuMGfZ9axBs5DZT6lNI48
         vuPSaIWUTW+4AfC2vvyMsAVoW4LJAgkUojM7RWX2c5TpzEXG9D4I/6OQCcNlzh7TYKhI
         Z0Gxbi8YhYKptw4UCOfjkrVwcF8Wb3IqofB5bI3IEcHqpWueNvoOwWBPheM5FCu8XOtW
         wIsukkmSHOdjyi+/tOCPe8jyP/enhxomUwseijK61goaz12tDniIycX+IMmq8yX0UdC4
         o2r3CTH59OETkrO8wsGz2FTnY2+5IkcfnYq60PcCHQxph3YtdxRYQJoXJ/je8w9lrszI
         iC3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759835854; x=1760440654;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ati20Ylz/khRNYG15B4+E/fLC+jK8mAaQ816iOPHxo4=;
        b=bDbw9yazW4v+s+mWlaWxsyMBnEj697/5repdfJoKwGeQOO7rNoVPxgt5hZolHRwxQQ
         5as9a9Xs5Nt3vLVt7dlEGNSg4L/KPdhv3jjKh/5YobforlUPJL1GPATUcbJUQfNbrpxC
         ZT8OARllvoNhCbwLRgxoNP4E99HHofKMDy6YMkF5A0SPTSL+CGmaEVe4z9L95SVv5YWl
         kfRx8FJM3SPVTGFhzYIe/nDVNgkHkl+Gd5qdYVZ4CrqmZNzKbhUNLql5+0czujHnR2bR
         7qbr5TtZ+9f6AoEULqsccC7wLritwZuuxyOXZvlrdH5/fIySdIjxP16eCMPMa0B5YbK6
         Y7vw==
X-Forwarded-Encrypted: i=1; AJvYcCXMFux6okMNZV+IQcWMOVgPEJyqMtN1k1xIOGT2u9YD60KFJIl6EuKUW3cdbLZZubMAlICDi5ggF7+48A==@vger.kernel.org
X-Gm-Message-State: AOJu0Yxcr0Z2WrtS/1ElVIwSuzjM1kYprtcxGUhaGMy4wq/qqJOYG5SB
	DQEWPqPo5WfOldLHA2RDYnGLZBDUiJGDQMsIu2i9NqbEAZfbXiTu40H1
X-Gm-Gg: ASbGncurlwJy2ujTKS5JPCOfW5yS3ipuHCpmS8Uv0HMIjJQqJME9kF8qW7dYnHXo/vy
	2B8Z3NE5/w7EOBe27j6Hm1q08W49JhYc4/3OAw9z5rLcpZppwHM3rt/KzA314GHOItlq/BYCZmG
	ikaPhyxddE4Ig468/OGlmspuq7G6DDEJ2SZaAvR596fFew4CfgXjVTIP7agK1rzfD6uTTkH0dR/
	ZODU0tUKaDnf7h06MjarpEmFE/MblOr62H4c9fqS7eza4qPkSXnMJ5iwc0dsNKlzjvUpF9U/QI8
	nUvbWnzn/D8ToLEWMtTFfBN3OGfaMbkqF28tc3aYgcBswzM5nBO1uaUXqa5MdPbWcC4idSlW6ND
	PbbiYtKJqeuuk+AWm11nKDNsW52CLunrCruSYdqhOC0aq7On50IXWF2oy1zb0cFjCQhRxWma9Ed
	Zo70sXE9rSE00/QDDscU604vMtdP369CZfyFw3WM9uQw==
X-Google-Smtp-Source: AGHT+IEhXXBkgS53UtOPSU9xv9VmoipHjlFpFVZVBxm49fBbGCyRWBRrkT0xdjC0nLzp6fPABCn6yg==
X-Received: by 2002:a17:902:d50e:b0:269:96db:939 with SMTP id d9443c01a7336-28e9a6b0dcdmr219162705ad.58.1759835854077;
        Tue, 07 Oct 2025 04:17:34 -0700 (PDT)
Received: from [192.168.2.3] (2403-580a-80ed-0-4835-5a07-49e7-f115.ip6.aussiebb.net. [2403:580a:80ed:0:4835:5a07:49e7:f115])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-28e8d1d31bdsm162509045ad.94.2025.10.07.04.17.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Oct 2025 04:17:33 -0700 (PDT)
From: James Calligeros <jcalligeros99@gmail.com>
Date: Tue, 07 Oct 2025 21:16:43 +1000
Subject: [PATCH v3 02/13] dt-bindings: hwmon: Add Apple System Management
 Controller hwmon schema
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251007-macsmc-subdevs-v3-2-d7d3bfd7ae02@gmail.com>
References: <20251007-macsmc-subdevs-v3-0-d7d3bfd7ae02@gmail.com>
In-Reply-To: <20251007-macsmc-subdevs-v3-0-d7d3bfd7ae02@gmail.com>
To: Sven Peter <sven@kernel.org>, Janne Grunau <j@jannau.net>, 
 Alyssa Rosenzweig <alyssa@rosenzweig.io>, Neal Gompa <neal@gompa.dev>, 
 Lee Jones <lee@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Alexandre Belloni <alexandre.belloni@bootlin.com>, 
 Jean Delvare <jdelvare@suse.com>, Guenter Roeck <linux@roeck-us.net>, 
 Dmitry Torokhov <dmitry.torokhov@gmail.com>, 
 Jonathan Corbet <corbet@lwn.net>, 
 James Calligeros <jcalligeros99@gmail.com>
Cc: asahi@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-rtc@vger.kernel.org, linux-hwmon@vger.kernel.org, 
 linux-input@vger.kernel.org, linux-doc@vger.kernel.org
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=6641;
 i=jcalligeros99@gmail.com; h=from:subject:message-id;
 bh=laVpP74gTzMbo2qrGHUEyEkSlszTpZA5CERei0FVY5s=;
 b=owGbwMvMwCV2xczoYuD3ygTG02pJDBlPvm3lO6Wf/5I7V2qC1Ml9R6Ydsd7NdJ59yXP/soyL+
 24UKrJrd5SyMIhxMciKKbJsaBLymG3EdrNfpHIvzBxWJpAhDFycAjCRGR0M/xTu2asYrrj+vODf
 srBTN445tcez9GjOXjBtZcEitRPzX9xgZNj0a8/XzrTaNUGh7DKPxFMffmFw4LbqyX7tE/jHczH
 PKhYA
X-Developer-Key: i=jcalligeros99@gmail.com; a=openpgp;
 fpr=B08212489B3206D98F1479BDD43632D151F77960

Apple Silicon devices integrate a vast array of sensors, monitoring
current, power, temperature, and voltage across almost every part of
the system. The sensors themselves are all connected to the System
Management Controller (SMC). The SMC firmware exposes the data
reported by these sensors via its standard FourCC-based key-value
API. The SMC is also responsible for monitoring and controlling any
fans connected to the system, exposing them in the same way.

For reasons known only to Apple, each device exposes its sensors with
an almost totally unique set of keys. This is true even for devices
which share an SoC. An M1 Mac mini, for example, will report its core
temperatures on different keys to an M1 MacBook Pro. Worse still, the
SMC does not provide a way to enumerate the available keys at runtime,
nor do the keys follow any sort of reasonable or consistent naming
rules that could be used to deduce their purpose. We must therefore
know which keys are present on any given device, and which function
they serve, ahead of time.

Add a schema so that we can describe the available sensors for a given
Apple Silicon device in the Devicetree.

Reviewed-by: Neal Gompa <neal@gompa.dev>
Signed-off-by: James Calligeros <jcalligeros99@gmail.com>
---
 .../bindings/hwmon/apple,smc-hwmon.yaml  | 86 +++++++++++++++++++++++++
 .../bindings/mfd/apple,smc.yaml          | 36 +++++++++++
 MAINTAINERS                              |  1 +
 3 files changed, 123 insertions(+)

diff --git a/Documentation/devicetree/bindings/hwmon/apple,smc-hwmon.yaml b/Documentation/devicetree/bindings/hwmon/apple,smc-hwmon.yaml
new file mode 100644
index 000000000000..2eec317bc4b3
--- /dev/null
+++ b/Documentation/devicetree/bindings/hwmon/apple,smc-hwmon.yaml
@@ -0,0 +1,86 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/hwmon/apple,smc-hwmon.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Apple SMC Hardware Monitoring
+
+description:
+  Apple's System Management Controller (SMC) exposes a vast array of
+  hardware monitoring sensors, including temperature probes, current and
+  voltage sense, power meters, and fan speeds. It also provides endpoints
+  to manually control the speed of each fan individually. Each Apple
+  Silicon device exposes a different set of endpoints via SMC keys. This
+  is true even when two machines share an SoC. The CPU core temperature
+  sensor keys on an M1 Mac mini are different to those on an M1 MacBook
+  Pro, for example.
+
+maintainers:
+  - James Calligeros <jcalligeros99@gmail.com>
+
+$defs:
+  sensor:
+    type: object
+
+    properties:
+      apple,key-id:
+        $ref: /schemas/types.yaml#/definitions/string
+        pattern: "^[A-Za-z0-9]{4}$"
+        description: The SMC FourCC key of the desired sensor.
+          Must match the node's suffix.
+
+      label:
+        description: Human-readable name for the sensor
+
+    required:
+      - apple,key-id
+
+properties:
+  compatible:
+    const: apple,smc-hwmon
+
+patternProperties:
+  "^current-[A-Za-z0-9]{4}$":
+    $ref: "#/$defs/sensor"
+    unevaluatedProperties: false
+
+  "^fan-[A-Za-z0-9]{4}$":
+    $ref: "#/$defs/sensor"
+    unevaluatedProperties: false
+
+    properties:
+      apple,fan-minimum:
+        $ref: /schemas/types.yaml#/definitions/string
+        pattern: "^[A-Za-z0-9]{4}$"
+        description: SMC key containing the fan's minimum speed
+
+      apple,fan-maximum:
+        $ref: /schemas/types.yaml#/definitions/string
+        pattern: "^[A-Za-z0-9]{4}$"
+        description: SMC key containing the fan's maximum speed
+
+      apple,fan-target:
+        $ref: /schemas/types.yaml#/definitions/string
+        pattern: "^[A-Za-z0-9]{4}$"
+        description: Writeable endpoint for setting desired fan speed
+
+      apple,fan-mode:
+        $ref: /schemas/types.yaml#/definitions/string
+        pattern: "^[A-Za-z0-9]{4}$"
+        description: Writeable key to enable/disable manual fan control
+
+
+  "^power-[A-Za-z0-9]{4}$":
+    $ref: "#/$defs/sensor"
+    unevaluatedProperties: false
+
+  "^temperature-[A-Za-z0-9]{4}$":
+    $ref: "#/$defs/sensor"
+    unevaluatedProperties: false
+
+  "^voltage-[A-Za-z0-9]{4}$":
+    $ref: "#/$defs/sensor"
+    unevaluatedProperties: false
+
+additionalProperties: false
diff --git a/Documentation/devicetree/bindings/mfd/apple,smc.yaml b/Documentation/devicetree/bindings/mfd/apple,smc.yaml
index 0410e712c900..34ce048619f5 100644
--- a/Documentation/devicetree/bindings/mfd/apple,smc.yaml
+++ b/Documentation/devicetree/bindings/mfd/apple,smc.yaml
@@ -49,6 +49,9 @@ properties:
   rtc:
     $ref: /schemas/rtc/apple,smc-rtc.yaml
 
+  hwmon:
+    $ref: /schemas/hwmon/apple,smc-hwmon.yaml
+
 additionalProperties: false
 
 required:
@@ -89,5 +92,38 @@ examples:
           nvmem-cells = <&rtc_offset>;
           nvmem-cell-names = "rtc_offset";
        };
+
+        hwmon {
+          compatible = "apple,smc-hwmon";
+
+          current-ID0R {
+            apple,key-id = "ID0R";
+            label = "AC Input Current";
+          };
+
+          fan-F0Ac {
+            apple,key-id = "F0Ac";
+            apple,fan-minimum = "F0Mn";
+            apple,fan-maximum = "F0Mx";
+            apple,fan-target = "F0Tg";
+            apple,fan-mode = "F0Md";
+            label = "Fan 1";
+          };
+
+          power-PSTR {
+            apple,key-id = "PSTR";
+            label = "Total System Power";
+          };
+
+          temperature-TW0P {
+            apple,key-id = "TW0P";
+            label = "WiFi/BT Module Temperature";
+          };
+
+          voltage-VD0R {
+            apple,key-id = "VD0R";
+            label = "AC Input Voltage";
+          };
+        };
       };
     };
diff --git a/MAINTAINERS b/MAINTAINERS
index 745d85b66365..10f4c0034b5e 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -2418,6 +2418,7 @@ F:	Documentation/devicetree/bindings/cpufreq/apple,cluster-cpufreq.yaml
 F:	Documentation/devicetree/bindings/dma/apple,admac.yaml
 F:	Documentation/devicetree/bindings/gpio/apple,smc-gpio.yaml
 F:	Documentation/devicetree/bindings/gpu/apple,agx.yaml
+F:	Documentation/devicetree/bindings/hwmon/apple,smc-hwmon.yaml
 F:	Documentation/devicetree/bindings/i2c/apple,i2c.yaml
 F:	Documentation/devicetree/bindings/input/touchscreen/apple,z2-multitouch.yaml
 F:	Documentation/devicetree/bindings/interrupt-controller/apple,*

-- 
2.51.0


