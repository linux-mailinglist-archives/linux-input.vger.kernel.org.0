Return-Path: <linux-input+bounces-14724-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C8D5B56C37
	for <lists+linux-input@lfdr.de>; Sun, 14 Sep 2025 22:39:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 4E8FC7A4449
	for <lists+linux-input@lfdr.de>; Sun, 14 Sep 2025 20:37:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5882F2E7F15;
	Sun, 14 Sep 2025 20:38:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.b="qxkFo656"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-ed1-f43.google.com (mail-ed1-f43.google.com [209.85.208.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 835EE2E762E
	for <linux-input@vger.kernel.org>; Sun, 14 Sep 2025 20:38:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757882313; cv=none; b=W6GUTkz2/zFM21GrNVa6ACPzIICybEbS/dmMm0JCUBLzNQrQK+fWZiOu0qivrjWeciGlxSMfIqzyCZy2ttJIxLHyqbUvfSWxkI+LB2ctpa7AGVHmvm7eBRMiaxwIpKKZgjN0JjdZlE2L5lN1XyB8k9BOaV35wdAdix1nxOIC1Rs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757882313; c=relaxed/simple;
	bh=2aP7ZNnKsj64rUeEHduOQ/Z8EfbTpQ+D4oav9/vzXhQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=scyt5aP6sp7mz5ZeNo0r0f864kW2A0m4rO0iNTZ2HGAXgJBZ96Q1EQJpvIoiCDABxFaw5tpxFOQV4IHJzqo9+g7SSiwAEwA32Ja5e2qod9k9sMV9EOV2PTyEDCMg+rkGzeD4xOhy58ufIxgO5uolkcyoLCn0B8pu9aZmMmRRVQc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amarulasolutions.com; spf=pass smtp.mailfrom=amarulasolutions.com; dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.b=qxkFo656; arc=none smtp.client-ip=209.85.208.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amarulasolutions.com
Received: by mail-ed1-f43.google.com with SMTP id 4fb4d7f45d1cf-62ee43b5e5bso4073090a12.1
        for <linux-input@vger.kernel.org>; Sun, 14 Sep 2025 13:38:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google; t=1757882310; x=1758487110; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zogDSCC9sjp5/MJLHL2D4fuF8U7ldK3mZBr4RRBDP2s=;
        b=qxkFo656nmoip8tRKVEIFQRUCXack2OlPywg6uQEelgG7F78ePL52trzdQF7tPGzp7
         EK9extH3ah0kqndU10nvm7m9CNVc2qz6W8CiZh1znSnmONJBdBBZRieAj6Jm94qQ0pAe
         EfytXOsRClrfY7Oo7j8vNx/QLxy4qdguufcN4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757882310; x=1758487110;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=zogDSCC9sjp5/MJLHL2D4fuF8U7ldK3mZBr4RRBDP2s=;
        b=CY2yEhvAGHaZX36ix+2GkIbf0BNoP1nSpsoMSQ6x7Y7crXIrsoOVv5ECxH4REvIuoN
         gAKtki/vKjiFyzJGdukKPRgYzdhLXsbWDwwur+MXPGq7nW7sLhfUcKjTifWO4S8PxXaL
         yFcDBGmDNB4yZjvuNesh5F64x/PTqPIJSluGWsnp4CalSN4fs/lyD/0zYaiXSkTst4aF
         KpEuTa3izdbHE/FGOyaboy5QQeunq085Eb5mSIve3BIb/YDgzBLNgOLE53Y2+upGeaEv
         65YIMYHLqjgK1oLpW/9d0s9HY6S3BGHXkfFOtddeHGKLhuy+YXhyNCiNTM0A0Dy6UmYA
         1WBw==
X-Forwarded-Encrypted: i=1; AJvYcCVl6VPG+Uc91R1m3qxVI+jDXJuKnmIpfmObmW/RjUAQxm0cu66sHiVQF5eBArF2jUrRqL3NpYxeJJW+qg==@vger.kernel.org
X-Gm-Message-State: AOJu0YxMmnvc4+Ni8FteqhcP3jkG3DoBVjAvX7eAjnz/TB7vzd7GxKm9
	nn75uFmDDKXMfj9/DUj41s720FJ2EVyr7PsQBp/Xnx52uwDMnI7drVBhg4Gwfh6amcw=
X-Gm-Gg: ASbGncuWsh8KJK8lcBOEldCFN+g8FpiP8+8AO6yWUuGOJhjJCwD8PJ8Aipv+MCvq0LK
	uSNcplzKjGTH4H4xLxMiukELW0dAtl1O/YlToMdJgsXQVA+U32Rpb9hYEuEG8P7d1dOCU3eXoVV
	l/SeOtPapZ3bRVf75wAvWNDMoQQmeQPO/uJrEO7v5hZHTHepqWCAkQgfuTkOrZzKCuGludAT/sy
	TYXstaggsBKF85aWYTozgOBhJM9I0dC1kZ4EO/K4syrmHWMnpIW6yrOf6zh+0XCQ1qD5Qpvw+fk
	t99WAEvoxSquEh/7CK+/VgriDyvWSz21JPFs0Inn2wtCD15R/IG3LQLzcVZD2tLWH47lFVs8JtD
	UwaelH5q2Cvh+DZ/hgAo3CACAYjHuQfnbwQNjjTk/4M2L0yUJubU8wKc7QXaDP4fj4gvhP3iBmd
	IMUKGZdrfE9g3tvXksDu/NPAhzcnbZAsdKnRbslt/iX+Tp57iwYzd+A/2qjZYikNiDbs/wpaZ8f
	MU=
X-Google-Smtp-Source: AGHT+IHZRqeG8YCJqWhmCcxUblf7Z56+CmrQsZREuQzXIH47fTIg3gZSrOqr8GCfaea14PdW5W858A==
X-Received: by 2002:a05:6402:46d9:b0:628:f072:2f18 with SMTP id 4fb4d7f45d1cf-62ed81ff6fdmr10494542a12.3.1757882309960;
        Sun, 14 Sep 2025 13:38:29 -0700 (PDT)
Received: from dario-ThinkPad-T14s-Gen-2i.homenet.telecomitalia.it (host-82-56-38-125.retail.telecomitalia.it. [82.56.38.125])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-62ec33ad242sm7803739a12.17.2025.09.14.13.38.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 14 Sep 2025 13:38:29 -0700 (PDT)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: linux-kernel@vger.kernel.org
Cc: linux-amarula@amarulasolutions.com,
	Dario Binacchi <dario.binacchi@amarulasolutions.com>,
	Conor Dooley <conor+dt@kernel.org>,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Rob Herring <robh@kernel.org>,
	devicetree@vger.kernel.org,
	linux-input@vger.kernel.org
Subject: [PATCH v3 4/5] dt-bindings: touchscreen: convert zet6223 bindings to json schema
Date: Sun, 14 Sep 2025 22:37:55 +0200
Message-ID: <20250914203812.1055696-4-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250914203812.1055696-1-dario.binacchi@amarulasolutions.com>
References: <20250914203812.1055696-1-dario.binacchi@amarulasolutions.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Convert Zeitec ZET6223 touchscreen controller device tree binding to
json-schema.

Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>

---

(no changes since v2)

Changes in v2:
- Added in v2

 .../bindings/input/touchscreen/zet6223.txt    | 30 ---------
 .../bindings/input/touchscreen/zet6223.yaml   | 62 +++++++++++++++++++
 2 files changed, 62 insertions(+), 30 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/input/touchscreen/zet6223.txt
 create mode 100644 Documentation/devicetree/bindings/input/touchscreen/zet6223.yaml

diff --git a/Documentation/devicetree/bindings/input/touchscreen/zet6223.txt b/Documentation/devicetree/bindings/input/touchscreen/zet6223.txt
deleted file mode 100644
index 27d55a506f18..000000000000
--- a/Documentation/devicetree/bindings/input/touchscreen/zet6223.txt
+++ /dev/null
@@ -1,30 +0,0 @@
-Zeitec ZET6223 I2C touchscreen controller
-
-Required properties:
-- compatible		  : "zeitec,zet6223"
-- reg			  : I2C slave address of the chip (0x76)
-- interrupts		  : interrupt specification for the zet6223 interrupt
-
-Optional properties:
-
-- vio-supply		  : Specification for VIO supply (1.8V or 3.3V,
-			    depending on system interface needs).
-- vcc-supply		  : Specification for 3.3V VCC supply.
-- touchscreen-size-x	  : See touchscreen.txt
-- touchscreen-size-y	  : See touchscreen.txt
-- touchscreen-inverted-x  : See touchscreen.txt
-- touchscreen-inverted-y  : See touchscreen.txt
-- touchscreen-swapped-x-y : See touchscreen.txt
-
-Example:
-
-i2c@00000000 {
-
-	zet6223: touchscreen@76 {
-		compatible = "zeitec,zet6223";
-		reg = <0x76>;
-		interrupt-parent = <&pio>;
-		interrupts = <6 11 IRQ_TYPE_EDGE_FALLING>
-	};
-
-};
diff --git a/Documentation/devicetree/bindings/input/touchscreen/zet6223.yaml b/Documentation/devicetree/bindings/input/touchscreen/zet6223.yaml
new file mode 100644
index 000000000000..a126f3f369ea
--- /dev/null
+++ b/Documentation/devicetree/bindings/input/touchscreen/zet6223.yaml
@@ -0,0 +1,62 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/input/touchscreen/zet6223.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Zeitec ZET6223 touchscreen controller
+
+description:
+  Zeitec ZET6223 I2C driven touchscreen controller.
+
+maintainers:
+  - Dario Binacchi <dario.binacchi@amarulasolutions.com>
+
+allOf:
+  - $ref: touchscreen.yaml#
+
+properties:
+  compatible:
+    enum:
+      - zeitec,zet6223
+
+  reg:
+    maxItems: 1
+
+  interrupts:
+    maxItems: 1
+
+  vio-supply:
+    description: Phandle to the 1.8V or 3.3V VIO supply.
+
+  vcc-supply:
+    description: Phandle to the 3.3V VCC supply.
+
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
+
+examples:
+  - |
+    #include <dt-bindings/gpio/gpio.h>
+    #include <dt-bindings/interrupt-controller/irq.h>
+    i2c {
+        #address-cells = <1>;
+        #size-cells = <0>;
+
+        touchscreen@76 {
+            compatible = "zeitec,zet6223";
+            reg = <0x76>;
+            interrupt-parent = <&pio>;
+            interrupts = <6 11 IRQ_TYPE_EDGE_FALLING>;
+        };
+    };
-- 
2.43.0

base-commit: df86f912b45c20e236060321c85fe35437e9325d
branch: drop-touchscreen.txt

