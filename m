Return-Path: <linux-input+bounces-14675-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 3EAC3B55FDE
	for <lists+linux-input@lfdr.de>; Sat, 13 Sep 2025 11:27:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 745E81C85135
	for <lists+linux-input@lfdr.de>; Sat, 13 Sep 2025 09:27:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 55FF62EA172;
	Sat, 13 Sep 2025 09:27:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.b="ZVx3MwVe"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com [209.85.218.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 727D22D739D
	for <linux-input@vger.kernel.org>; Sat, 13 Sep 2025 09:27:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757755635; cv=none; b=XHF+TpfyRwpCSX9Wqa4CwXrUkha/cnvWzMOjEVUAv6HG7qRd6LdR/VZI0c/MyIZ8pv1cKMGrsHjgOuVKNWOuDHr2OtRyQsBWbcnDbLvA9g80AIJJaUH5SNUP1sZE7QWbqVoohgo4NnsPtFWm9cjXRM4XijIZEiKuSPOy9SXRNx4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757755635; c=relaxed/simple;
	bh=nRK6N+Ibsz+2z4xifM3I2UIZS0TgjnsJr0Q7E1AwGDs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=HyVE8Md4AzYsJGtGy2q/2xWOweO2dXJ+cY7y4Rvv/8o6FsCD0CzH4qOtXcBxtTmBvQ3FpNJDu+bwaM6wneusYmLa8dIZP7SSdlWZ9DJ9f8rG8+fPohcHnPeDZOtWdL5EUNfgOaXM7rOw/JVl8HM43RZVSdfRD7ojorhTVyXojz8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amarulasolutions.com; spf=pass smtp.mailfrom=amarulasolutions.com; dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.b=ZVx3MwVe; arc=none smtp.client-ip=209.85.218.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amarulasolutions.com
Received: by mail-ej1-f44.google.com with SMTP id a640c23a62f3a-b07e3a77b72so61578166b.0
        for <linux-input@vger.kernel.org>; Sat, 13 Sep 2025 02:27:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google; t=1757755632; x=1758360432; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sGiYHcgbQQ/Nll0kzwHfCK66y6f3gzxV5kd/8fXvCFw=;
        b=ZVx3MwVe1XJrBaauErQwVuBgWNzleGGUGPUTIo9CVO59rlb026SK8KtZKPkGgL2PMu
         fjanVGxCoMteurzmySzPWJhHUXCi3mMTDcutXTKXlW8S1K8m5vwYXfGnq6cJDsGns/F6
         8Y+KGgt9DBvtz87xogrtXWFaAhYSJuYJYiVF8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757755632; x=1758360432;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=sGiYHcgbQQ/Nll0kzwHfCK66y6f3gzxV5kd/8fXvCFw=;
        b=oB9z271dhLg5TRTpFrEpEauyvmf9pMy3i/gDD2uQnMbxnkEQ/GLClSlAFj2NIqCt0T
         6eyC2H192wyeWR8cbkRi1ggwR6yXOJZytBL8BES/xVUZcg943zcPNvplf9snl0u3jJYt
         7vTYu+wBdhBe7dkSecHEijta7sMGZlfj2Ur6UHj52BEL917t1C8izjtyIe5e/ay0asVo
         bVnKc9dabC4W0EwQPx3EPw7phnaycb2lZ2QN8UFFBJBDtzYOWzr+6AT4s3I0PFE7dPAI
         mFdsRQMcMsk20cDquuO/+i+9eSEuSCg96fYK3dcxZqHozJwQuLC33x8jZ0fP9gWiaIjK
         jr0g==
X-Forwarded-Encrypted: i=1; AJvYcCW7ojBf0u48Ua9K7Ucky0FvdxNNS4+NKhPltobVnkroUOXYUmkudd+H+wjvgfXiD09t8S9LWarRBazHYA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yyz58dYZwkExg5vZvpqEwUosm70ZjZLIRAPrrNxJwh4mAV6ZI0/
	tuoh1NKKZlP0zYEvM7KCET3xRnaRvAs7py6Ar9w37d5usEUhL47jLaYcpJXZ4/lTPLM=
X-Gm-Gg: ASbGncvozJGbRq08ij1RacbGqlWxwd+F2dlV2QHFNVdPOzesmJzfQz+nSrBqt6sjW/n
	AurWEbC8CzUBFk5Kvs4oUZm/J+a76+21w56F5Vroj1Z0BUarbrIC4drBG2zEOWJlPU0gDcDdOdf
	e7n5q+lu91AuLLYMkw2xJWbdh3xwSpkeZjKpPpBfIguRVnQx16Gx5D6VITTF9NeiyIz/smRIJbr
	P1jjiU/JXnx2f5ccEXG9AwJazZNytSed/FtR09cRWyLDcWT94zVdXKE7J0TfRPbmZW6T/OXPTMA
	pGOwnFnaeFNZ4SzUIArAZ4HwuDBInGOPiwPZ4cLddkY2DyZYEGtAtLrjkcptFxwSwhzxUdD/Ol4
	a1q5tNxNy24xhw1Db1CI0GK5NmgBGLFBMyRJKb0tl/rYGJ2btHUW/fLRK5PnKd41dAqEdBoF5Fz
	+m2ZdOTY3LhOuOsmj0ne5tCBb2g9YkCluFX6VLt/H4+kieJpDK8j28pbNsdDwEuHoBXp1+1fDKE
	GQ=
X-Google-Smtp-Source: AGHT+IH05Rn/x9o/hdxCiRVMMVQ9w4BOGhkCvWvTVCa/SXrO6Fxr8UGUrSZ9/1YOcY66AtOtIhmc9g==
X-Received: by 2002:a17:907:7e8f:b0:b07:ce0a:9e83 with SMTP id a640c23a62f3a-b07ce0acb88mr418283466b.19.1757755631742;
        Sat, 13 Sep 2025 02:27:11 -0700 (PDT)
Received: from dario-ThinkPad-T14s-Gen-2i.homenet.telecomitalia.it (host-82-56-38-125.retail.telecomitalia.it. [82.56.38.125])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b07b33478besm551705766b.99.2025.09.13.02.27.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 13 Sep 2025 02:27:11 -0700 (PDT)
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
Subject: [PATCH v2 2/5] dt-bindings: touchscreen: convert eeti bindings to json schema
Date: Sat, 13 Sep 2025 11:26:52 +0200
Message-ID: <20250913092707.1005616-2-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250913092707.1005616-1-dario.binacchi@amarulasolutions.com>
References: <20250913092707.1005616-1-dario.binacchi@amarulasolutions.com>
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

base-commit: 22f20375f5b71f30c0d6896583b93b6e4bba7279
branch: drop-touchscreen.txt

