Return-Path: <linux-input+bounces-16567-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 8ACCDCBD32A
	for <lists+linux-input@lfdr.de>; Mon, 15 Dec 2025 10:38:41 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 8A9B1300D30D
	for <lists+linux-input@lfdr.de>; Mon, 15 Dec 2025 09:38:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E66B2329E43;
	Mon, 15 Dec 2025 09:38:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="AobHGnmi"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 063A6327C11
	for <linux-input@vger.kernel.org>; Mon, 15 Dec 2025 09:38:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765791509; cv=none; b=rIeRlP0/lAe5hogfFXmzm/s8ewgLtVvTXd1Le5HUrpn/RxXsqlFIWuiQU6zlKLyBJ3XI8EbcR0aeZH2XjnY9BZlQoIP7WkzPtFj4uE7PF183TXG6Vk4uYNGzzbxdrBA6F64I3oXw5rwPxp5ON40Y8WozUVqynb9uhS0ZM1AVaCw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765791509; c=relaxed/simple;
	bh=1YhAJ71JAqllcUxuxUDlvMTFEA7zknc8xk9iFLWBSoc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=S0EsBF/N9Eu29+N18Bx45Sq18ryFnYx+vK3r4dr9Qn5uA2ziugDMXnodPvYZmWTNB8p4OqYOykaPhiZCnC4GxmHI0A+HWfcE/hWXuttxeB7OSRmAZqBIigSqjwnWkgdEP88Wb1cAQf65J9Oc1q7KEFocX43PhKBGh4rURdgGx0o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=AobHGnmi; arc=none smtp.client-ip=209.85.214.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f176.google.com with SMTP id d9443c01a7336-2a1022dda33so5129745ad.2
        for <linux-input@vger.kernel.org>; Mon, 15 Dec 2025 01:38:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1765791507; x=1766396307; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=bQd1CFACF7OPtngAk8oFYqrLhlc/9YnP6z76rt/UJmA=;
        b=AobHGnmioXoitrG6fhEdyUg0hyA+R2K1WgHGY6MGe21Fq9j0nr/t+Pcm7bE1xepc49
         Tiu2rFlJhUG06UPkQoyTJSWOqwFdVJhKElKeTrzFW/F1MZv+gpWLSaxdjukAvRmiykgV
         DDbTFe75eRbjM4zXzMIinBk5LtRc+C4bBVlxtZINvRrsA0C9MqcXG2oJJsKdbbMivw8H
         VFtNDid+rY6O3vHRw02sVWW1XKT4HOl7sv32B7sIO+ZByVZ50W6tt4VU3yUCbjzga2Jo
         qr1EKc7vbwDWKKcLDxkxBJujrTlvm8YSl0eDoo0QEAtH/Fv8BCUa7eGYutdXMshJYanR
         DJhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765791507; x=1766396307;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=bQd1CFACF7OPtngAk8oFYqrLhlc/9YnP6z76rt/UJmA=;
        b=P+jv/ybo7Hd8+xYcZVu2xVTjhfGpVQFxEJ0JMo/py2RoEQoJ2g2lKquZG8r/VUuAId
         xq+YEmdcvQXp2UBcHo1jjWOQQJbL1lvnu+bzW+7H082vg2o/SjBbyhq9Cz7JwMXCEYkg
         2CBVsuQXH/+Orcb3UDVLbTbs7+tslNj0Jf2oJHP8q9Vl3EPTDNLZS8Q/gnS7v5fSnjT6
         pSfnSW63JfBWDSkECQ4F2TWsOi/lg8FpFWZYIsk1bXcV64eKa6+3fFyFskkUJCgiE/Hv
         xYt2MkUNkPcE+l4uWC5W/T+AB4nVBibr9wHmq+UcgiWn/0wwppzE3KXA1wHy7zaYDJbn
         gGBg==
X-Forwarded-Encrypted: i=1; AJvYcCVD04HjtlYYjiIqz7YEAX6j+SKEsJ5Sso1JZcsILd+ROpl1MrcCs4UY3AdzWNmKaHZTMv5hTifoEFh6hg==@vger.kernel.org
X-Gm-Message-State: AOJu0YzdWicFPoCUs5J9iYbo2vPAer0EkRPlgmzewLK3omwuCeZL3zoA
	DWbnwQY2w64pgR6aiFsIqeA7YZVJbCGDBH4PZnpwIKSaFuPJI7XwRuM7
X-Gm-Gg: AY/fxX6vWnoesaLS6C2WGrjg7miI4XHWoVYEhIPekrUlo3Bo58KGWg2yNsjiwPzFqCk
	rNB3dy1Ruzl4Kymv1y5yiL/cKSlCam/kikqZ38GelkJgv9eIkobbfhQBa7E+84BQyFELEgBJzVw
	Umk00GmEY0gwFTHB/NvtHOwyx1a4doKJZO/8W2hd6vR+c0oHlJ6/EFeVY4Xd5I46c1ckWb/pHMZ
	/FfXDHm0qonTFAlR/CQubk8ksw79w80CnU5ZWXuJcIx4GAfbM0PYEQwZH9Ajr42bHuL0OfGzqc/
	rmJcsucdMNCH9/wgbRC9CIIPBOdHFOsaFNyzvvHEiWNCKs8i2SNZinFReloZ1vIUvNf/c2k+M6R
	I9Y8QjtubEocQfs3+Hqbva85XPvJstfqvdSsUC/VIT/p3t6cR+eY9AFh0fJU3QEPnnNUja+/kf5
	yRhIMG48hRSI9XOroVaKEPlTu9l2y7y013M5+KY0Q44zwiBXsSJO0xhrn/v0kJc4HthmIUYCT/l
	6tz29ZRFN8xkjw8Xdv4HoM6AxSfhNBL2zFb71Fkl+YJtpNM2iJLDVFiWWztNk/e1S5vJR8eD1QU
	fIC85d4IhSZ15lYipCXy8JNT1c/KANGyexY5uNnPZ079eHe16Bg=
X-Google-Smtp-Source: AGHT+IHXjaO0kZdI0jvqgos1WrDuGav3uz9uPzrIQ/XBD2ij7oSPEGrTgf+//QBfvWQ0XjlmdCFENg==
X-Received: by 2002:a17:903:8cc:b0:297:f0a8:e84c with SMTP id d9443c01a7336-29f24386514mr104092335ad.52.1765791506920;
        Mon, 15 Dec 2025 01:38:26 -0800 (PST)
Received: from [192.168.2.3] (2403-580a-80ed-0-4835-5a07-49e7-f115.ip6.aussiebb.net. [2403:580a:80ed:0:4835:5a07:49e7:f115])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-29efd74f5e1sm113017705ad.16.2025.12.15.01.38.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Dec 2025 01:38:26 -0800 (PST)
From: James Calligeros <jcalligeros99@gmail.com>
Date: Mon, 15 Dec 2025 19:37:45 +1000
Subject: [PATCH v6 1/7] dt-bindings: hwmon: Add Apple System Management
 Controller hwmon schema
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251215-macsmc-subdevs-v6-1-0518cb5f28ae@gmail.com>
References: <20251215-macsmc-subdevs-v6-0-0518cb5f28ae@gmail.com>
In-Reply-To: <20251215-macsmc-subdevs-v6-0-0518cb5f28ae@gmail.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=6691;
 i=jcalligeros99@gmail.com; h=from:subject:message-id;
 bh=1YhAJ71JAqllcUxuxUDlvMTFEA7zknc8xk9iFLWBSoc=;
 b=owGbwMvMwCV2xczoYuD3ygTG02pJDJn215k3aCQdqL9kFX3Dy31+Ft+WOeXTaqtd8nmEOP86H
 /HtnbWgYyILgxgXg6WYIsuGJiGP2UZsN/tFKvfCzGFlAhkiLdLAAAQsDHy5iXmlRjpGeqbahnqG
 hjrGOkYMXJwCMNUKNowMk4t+dz4091c+cuxot3MQj18u2+Gtdsd3Xd+n2n6z5fcsTYZfTKHWRS7
 C/1s+CnecWs7h/1z69ebCX589Alx0pI46m9hxAQA=
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
Reviewed-by: Rob Herring (Arm) <robh@kernel.org>
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
index 5b11839cba9d..5f160eb6762e 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -2458,6 +2458,7 @@ F:	Documentation/devicetree/bindings/cpufreq/apple,cluster-cpufreq.yaml
 F:	Documentation/devicetree/bindings/dma/apple,admac.yaml
 F:	Documentation/devicetree/bindings/gpio/apple,smc-gpio.yaml
 F:	Documentation/devicetree/bindings/gpu/apple,agx.yaml
+F:	Documentation/devicetree/bindings/hwmon/apple,smc-hwmon.yaml
 F:	Documentation/devicetree/bindings/i2c/apple,i2c.yaml
 F:	Documentation/devicetree/bindings/input/touchscreen/apple,z2-multitouch.yaml
 F:	Documentation/devicetree/bindings/interrupt-controller/apple,*

-- 
2.52.0


