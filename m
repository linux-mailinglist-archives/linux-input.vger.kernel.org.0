Return-Path: <linux-input+bounces-14853-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 491E3B85AC8
	for <lists+linux-input@lfdr.de>; Thu, 18 Sep 2025 17:37:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 1193F7B9816
	for <lists+linux-input@lfdr.de>; Thu, 18 Sep 2025 15:35:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D1BB4312839;
	Thu, 18 Sep 2025 15:36:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.b="XDfXmjVc"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com [209.85.218.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E5C1C21B9C8
	for <linux-input@vger.kernel.org>; Thu, 18 Sep 2025 15:36:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758209798; cv=none; b=Sw1pp6EKc5Ee8nBpueHrQSccx+m+8ppy/27Kh3fNg8j6gLnJj6C2ZAQ6nS3MSHviTITwd/1IrndSAhnAwcNBGQdmZHclIVAaWFiGg2m8i+zeCblvVkEpy+VEV6BPcRPU2i0uOeG9jmTgAnreQRjeCdyIl3jm3aIZync8nCY+DcY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758209798; c=relaxed/simple;
	bh=yJbw+gSxRuXDmWufyAOowWGK2y93o+NpPc1oFEaM3c0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=rnhCxBgr+4AJqGVzbhe83dFaJ7cOlOHHHYPIIrMdHNQBSYf6fnKPOvFC/mcRQpGxhQV9l29tg9RZZaasp1Yp/X7dggEwyex5vkrjmCJLG3N7JZUnz59tCbGJ3xsKSO+Na8pqgA3Tmw9uoD4nQ2mB9vAacG5gLJcuGgU2N8evxFY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amarulasolutions.com; spf=pass smtp.mailfrom=amarulasolutions.com; dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.b=XDfXmjVc; arc=none smtp.client-ip=209.85.218.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amarulasolutions.com
Received: by mail-ej1-f49.google.com with SMTP id a640c23a62f3a-b2391596dcfso58995666b.0
        for <linux-input@vger.kernel.org>; Thu, 18 Sep 2025 08:36:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google; t=1758209795; x=1758814595; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ClzalLpVry0Z3N5zOF7y4pLh21VJainWEs72sUomkbg=;
        b=XDfXmjVcwTir/COUw1XBMPcEr9jDm6d2WoWNMaYTgWlZzHqv6xwnKs0YiM+yydHpwC
         dztCK402edWN6xtSlXYe5XHj2ZoP/uNOyhFXF9CtvdEAma5Lb96zF6DU+77FOfyf4mJv
         CHEpplOz83c03qz9jSluy636aiymqTliu8YZY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758209795; x=1758814595;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ClzalLpVry0Z3N5zOF7y4pLh21VJainWEs72sUomkbg=;
        b=LlrHyfrZVTvco70v5gWvYUtD/xHcMO32z9Eh2QD4Op63RsnkHC5xtTlZg+fwmSVksE
         RBNKleoUCtZlnNDNIbbGvrTF3fjdQpbyhk53Gs0VCJ5FBXv+hsJKcPR0n/8cJaW/CU31
         koijx8orzB5DB2C6H46Uy4VfwsLlN2uGmCL55whGXt12cdLyB2eLBSn3lBJypfSOXcg9
         jVBk+L2yvjtbn9FVg1oYpfaa1T9CJ5ANL7Ik2Hliwpb9Q+hhSoyZo50AdmBrLeFn+Jyd
         G16hx0hOtnpcIYPOxred/kVHcLwkWNx5a+vUXZAfenf2dSFmwIijNtDZshimUXW2RNNK
         murA==
X-Forwarded-Encrypted: i=1; AJvYcCUvkkS9cblTNQy4laya9HW1p+x6cHxMwBvoFZtLRB4X/EcvMoRjyt/7LvdqolP1s4CtwuHb0F/TFejTfQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YzcmZ7rN9VxyMtoV5tP6FaMA7dWN0dUNbsdaqaEx/0p1l7VkDH6
	xx/D34VyPo8aLo392tEdeNLy0UavjvoF9mbQsvVShY7FSNcM/ww08JO0erDQkQqGqsc=
X-Gm-Gg: ASbGnctmCEPdZKIbo3Bu3IjT39EF7kbEGhQvLGdTDk2f0nePTrPE0T56CjpgjQzVDVU
	kfO/IUD9q8Nl1W81zxOGm4nHwITmEOjV9G1WANZTxGByUnbbLRB3z3w9j8gKT/LdDrPvPrIHEe6
	EsfvDMKdbvmMV783HAxcbKibEydJLUAZTw5Kn9zXKDdVFHNV+XkOFJ1DUxZcNNyuCKINx/4nM7i
	F6eRUJPlVdIMMkHOylNjFJIOk3NlnrmTPq4MfTKUMrgMIvXASiYii8gIyQi8ycHMb7kvcHjZIFa
	YF7BMoSwhMp/bF3ITOYp9dd/SBosOxT39g80n2TTyEoXt2S298ugV3Wh3+59ncodzoynvJLM31Y
	xXXdpG9rwzcIoqX2EuLu7mMX0MmOaS8/UaBxk9Wnq37j+Qkg7KGsGsruwwaZwiD3av1zvYduLhl
	uvoG6CvCTk6vy6TR7SfUbXemZV/pT1ZNOmolceWOb8SDXWvYGoxtObLkdXkXg7N+QHO2gMwgtz3
	IRH6U4KcY8=
X-Google-Smtp-Source: AGHT+IHIWguhdTTcSEPHpA68B5M9ZRFqGwOkLHhqYJ7bIM1IdIIL45yanJ52h9csCvpQHzoT21dlGA==
X-Received: by 2002:a17:906:f592:b0:b07:8893:83da with SMTP id a640c23a62f3a-b1bb9b218ddmr625079866b.64.1758209794779;
        Thu, 18 Sep 2025 08:36:34 -0700 (PDT)
Received: from dario-ThinkPad-T14s-Gen-2i.homenet.telecomitalia.it (host-82-56-38-125.retail.telecomitalia.it. [82.56.38.125])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b1fd272026csm212430766b.102.2025.09.18.08.36.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 18 Sep 2025 08:36:34 -0700 (PDT)
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
Subject: [PATCH v4 2/5] dt-bindings: touchscreen: convert eeti bindings to json schema
Date: Thu, 18 Sep 2025 17:36:07 +0200
Message-ID: <20250918153630.2535208-2-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250918153630.2535208-1-dario.binacchi@amarulasolutions.com>
References: <20250918153630.2535208-1-dario.binacchi@amarulasolutions.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Convert EETI touchscreen controller device tree binding to json-schema.

Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>

---

(no changes since v2)

Changes in v2:
- Added in v2

 .../bindings/input/touchscreen/eeti.txt       | 30 ---------
 .../bindings/input/touchscreen/eeti.yaml      | 62 +++++++++++++++++++
 2 files changed, 62 insertions(+), 30 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/input/touchscreen/eeti.txt
 create mode 100644 Documentation/devicetree/bindings/input/touchscreen/eeti.yaml

diff --git a/Documentation/devicetree/bindings/input/touchscreen/eeti.txt b/Documentation/devicetree/bindings/input/touchscreen/eeti.txt
deleted file mode 100644
index 32b3712c916e..000000000000
--- a/Documentation/devicetree/bindings/input/touchscreen/eeti.txt
+++ /dev/null
@@ -1,30 +0,0 @@
-Bindings for EETI touchscreen controller
-
-Required properties:
-- compatible:	should be "eeti,exc3000-i2c"
-- reg:		I2C address of the chip. Should be set to <0xa>
-- interrupts:	interrupt to which the chip is connected
-
-Optional properties:
-- attn-gpios:	A handle to a GPIO to check whether interrupt is still
-		latched. This is necessary for platforms that lack
-		support for level-triggered IRQs.
-
-The following optional properties described in touchscreen.txt are
-also supported:
-
-- touchscreen-inverted-x
-- touchscreen-inverted-y
-- touchscreen-swapped-x-y
-
-Example:
-
-i2c-master {
-	touchscreen@a {
-		compatible = "eeti,exc3000-i2c";
-		reg = <0xa>;
-		interrupt-parent = <&gpio>;
-		interrupts = <123 IRQ_TYPE_EDGE_RISING>;
-		attn-gpios = <&gpio 123 GPIO_ACTIVE_HIGH>;
-	};
-};
diff --git a/Documentation/devicetree/bindings/input/touchscreen/eeti.yaml b/Documentation/devicetree/bindings/input/touchscreen/eeti.yaml
new file mode 100644
index 000000000000..97027914d6a6
--- /dev/null
+++ b/Documentation/devicetree/bindings/input/touchscreen/eeti.yaml
@@ -0,0 +1,62 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/input/touchscreen/eeti.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: EETI touchscreen controller
+
+description:
+  EETI I2C driven touchscreen controller.
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
+      - eeti,exc3000-i2c
+
+  reg:
+    maxItems: 1
+
+  interrupts:
+    maxItems: 1
+
+  attn-gpios:
+    maxItems: 1
+    description: Phandle to a GPIO to check whether interrupt is still
+                 latched. This is necessary for platforms that lack
+                 support for level-triggered IRQs.
+
+  touchscreen-inverted-x: true
+  touchscreen-inverted-y: true
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
+        touchscreen@a {
+            compatible = "eeti,exc3000-i2c";
+            reg = <0xa>;
+
+            interrupt-parent = <&gpio>;
+            interrupts = <123 IRQ_TYPE_EDGE_RISING>;
+            attn-gpios = <&gpio 123 GPIO_ACTIVE_HIGH>;
+        };
+    };
-- 
2.43.0

base-commit: 8b789f2b7602a818e7c7488c74414fae21392b63
branch: drop-touchscreen.txt

