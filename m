Return-Path: <linux-input+bounces-14722-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 043ABB56C32
	for <lists+linux-input@lfdr.de>; Sun, 14 Sep 2025 22:38:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 4C374189BC23
	for <lists+linux-input@lfdr.de>; Sun, 14 Sep 2025 20:39:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 193982E7165;
	Sun, 14 Sep 2025 20:38:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.b="iJRU5FOg"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-ed1-f48.google.com (mail-ed1-f48.google.com [209.85.208.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D7E972773CA
	for <linux-input@vger.kernel.org>; Sun, 14 Sep 2025 20:38:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757882311; cv=none; b=CYgEI95D/QP594XXZ8FvktT9qKP2sDYmzRA0wPSODOj3G769TKbTMRJXWqdNEHte4XNOgcTDyoOzh1hSnNDGQfI5+yZD+L5P0LpVcLw2bfJRMXBoEW9TFCISsKF5kyjbXTvO1o7wlmoPzWYCz/cSOncrQK9eDAgMHOuOKOagDHg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757882311; c=relaxed/simple;
	bh=zJcIVyNpcaK/O4R23SruK64NmCPkL6otbqrKObR7bm0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Qq7Lx/I31tBVuPeS2sIarPzyxK4ky3Rv/0W5jc5iiMisxtk0UGUvLJw7Ky0bGVmc4zRXVKl6NGriAPM1aibMHWEvh6m84FL+sezgQfDEyg6BjFAX0IihK/YLIacUz0vnXXRBek+5hAwLBYli/ppt9M9kFhi9TeiAAJeg6RdagR8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amarulasolutions.com; spf=pass smtp.mailfrom=amarulasolutions.com; dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.b=iJRU5FOg; arc=none smtp.client-ip=209.85.208.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amarulasolutions.com
Received: by mail-ed1-f48.google.com with SMTP id 4fb4d7f45d1cf-62ee43b5e96so3028817a12.1
        for <linux-input@vger.kernel.org>; Sun, 14 Sep 2025 13:38:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google; t=1757882306; x=1758487106; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8H/L7y4Tyqg+sD/ZSblYNA7DyfUtToTD7oJptEqMJeg=;
        b=iJRU5FOgqgVdJEU0g9IfJ6uciyxfWQh81AuxPgacWRB5QKmAb05LXRopFSD4q6qRUL
         f9KDYInslOLPtreiToAEBXPi/bivaMeFUadS78drgQM8J4hegNk6SilXoAzTZ0kx3f3D
         IZMF1NJWlPeBfmNPLQZKrov845XrO1ysOsy8A=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757882306; x=1758487106;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8H/L7y4Tyqg+sD/ZSblYNA7DyfUtToTD7oJptEqMJeg=;
        b=WFkUAgmYQuyIUgwmmgcg2KtNdfFvOkBtdzusaQMY2MnIcAJRAQrkI8QbX6qthFdsSh
         OiF0nW1T3Ef9BBxSrgqNcvcYR63Sm7VnVFQS6O577dOIyviFaEAWLgfYt23Y41RIBNi+
         Rnox6uUYjAx7Jtyk9I2DuSX8o462cy8R+xyB+jIyJ06f3ZG99RRtnzGlkqaWyzyLHJxb
         jp22LzgyPTUwj3Wflad+72bSM2l+oxwrjp6azYR/qzgihnVHLiw05k4Yntt+H4H7gNlk
         4J5UFQ3c4viO38yFO8Tx+HhG2FtAGBbb1F/WP4eAz9/MfSCmwGc9iin65DuojnN8d0zn
         Y9Ag==
X-Forwarded-Encrypted: i=1; AJvYcCWY5Njkz2aY+lOc6EnbYVTZyyFvxxRp5Axtb43j9c+H0dAVLnBakaxHjkQZqDwuTKIdk+IO8LE7LOg4Nw==@vger.kernel.org
X-Gm-Message-State: AOJu0YyQOtjKoXADmdZW9CSQaqZvsgkNr+PsIwT8g9X2aXWs9GIgty2Q
	OCQpn1cyhSMiNVUeKmuhUPDe1jfbUbgEsPQTIzO/WwLNeIuTsTtkmu+qmYlcsfs4uic=
X-Gm-Gg: ASbGncuKxLILC2D55ZTU7vF1eICauMYVc6E5+hR3Btc2FxDeeMuL+SR2HAyN5hxTf7o
	++4R3O+MwbyJ9eYCBM8x8VIFJVXf+f0Sxmn+uYjAncNwyYBZZRs8ZOTSs65bg7OSzhW2GNoeUbp
	eugJ665L2nZ3LTqOZBnPEcPDn3lIEyYjT7Asaf2f5JqtliB186LtiP6Xp3pvTf4QjuoyrIB+pzK
	bTnvMYqEMH4rKaov9155v7OcHRAi4RrLd6L4O2/SbRLAdI7hu3EPrLYCAKXWmAL/Npkkknj7Grt
	XCC2SIf5DwehUtGOzSURifDksnVsoSk7JyT3phWDZUjbC4ZGipTe+zVgIg1c9a1xEQZdgfgDqip
	xgPMBVefjSFGKFZL3M9pxST67axCjPMOhNxTUCvgFWW65xnNOhmy649aeSEACVAqr8C+bDClnZ/
	x7MlNklXvDpbHB9j5POD3eDJVyq5GYD+llIpmIhoVQzYaAMRpzxrYPVwSbJVIJzMRg
X-Google-Smtp-Source: AGHT+IGqxe+OJJI94gs7+C7Lsm//rFgMgmSYPIkCUrGy6YYptJg8EP7vamMSG/Te2XdWUuc+XYsVvw==
X-Received: by 2002:a05:6402:42cc:b0:627:eaf6:88e0 with SMTP id 4fb4d7f45d1cf-62ed82c5a38mr10034225a12.18.1757882306053;
        Sun, 14 Sep 2025 13:38:26 -0700 (PDT)
Received: from dario-ThinkPad-T14s-Gen-2i.homenet.telecomitalia.it (host-82-56-38-125.retail.telecomitalia.it. [82.56.38.125])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-62ec33ad242sm7803739a12.17.2025.09.14.13.38.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 14 Sep 2025 13:38:25 -0700 (PDT)
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
Subject: [PATCH v3 2/5] dt-bindings: touchscreen: convert eeti bindings to json schema
Date: Sun, 14 Sep 2025 22:37:53 +0200
Message-ID: <20250914203812.1055696-2-dario.binacchi@amarulasolutions.com>
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

base-commit: df86f912b45c20e236060321c85fe35437e9325d
branch: drop-touchscreen.txt

