Return-Path: <linux-input+bounces-13394-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 88349AFA639
	for <lists+linux-input@lfdr.de>; Sun,  6 Jul 2025 17:44:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C3A023AE247
	for <lists+linux-input@lfdr.de>; Sun,  6 Jul 2025 15:44:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B84092882A9;
	Sun,  6 Jul 2025 15:44:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gQdWB3qX"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-ed1-f44.google.com (mail-ed1-f44.google.com [209.85.208.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DCF251E86E;
	Sun,  6 Jul 2025 15:44:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751816680; cv=none; b=kE/P77nUFIlOgDNZcFaBDLB67PR1Fu7g/6FppKYqbddoUeFEBEn/MfK1TzA71vdFDvgaEKnRz1iup7nD0gAq+dcdXrCsKNUlDvN9RXeOeAvyPKl1MqV8PUONwZMXCQhPcR/6WswrwX2qoWOkrn5nhj9hLFiLWLwmapcYNcwUuZo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751816680; c=relaxed/simple;
	bh=VrL5tCUIHQAn6qmf+uwzSyi2pqmzd0wf53fIlG/bztk=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=LU17GZagI5khT9WV1r06YaM689+KbXaGU96aXHhU9OL1zFwcIjddKoLMG64NxjiFUbg//n5J2NX74B9jXVQ8HuyuDT9ymhBxO5jdYGs6CGJcrJa5VKc8DPQMYzy1lvwmCVaQDA6jRB4Iv9IPx/Mh7py2PuETfEc00yIpsFymVY4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=gQdWB3qX; arc=none smtp.client-ip=209.85.208.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ed1-f44.google.com with SMTP id 4fb4d7f45d1cf-60c4521ae2cso4050218a12.0;
        Sun, 06 Jul 2025 08:44:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1751816674; x=1752421474; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=S1VxJd0ftI9lmd3P4Wrl4+ydKOBwPcBk4404L4MsBrY=;
        b=gQdWB3qX3ZyXjk4XPRxsLnshE7QlKuRPvhkouF6dJ8BGi4w+L3GqP7oUmkOaya/XDX
         2rP01O+zJSdASMK8OSR34MI1TX0RyReo0HDbg6bSgBQE6EvvT+ewtJdGmr9arDI+L7lH
         r3x4yzHQKYjeWP5TazamsxX9NFKe51rnQrzG0UR62IJsrr0AIJWGb4xMdwzRa4GqBxSD
         bYXg0LoNXEzydAOxA2DBJPUDxY0DH/YOL3n24G1PKjom0h+rPvmq7yBdp8HqWvYENddm
         9xNnPp+9JSZiPABQIFrQcVXwsYsv4qd5qU3ypsINE6u7EeQbDCaInKtcc/KdWOKWeQew
         usUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751816674; x=1752421474;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=S1VxJd0ftI9lmd3P4Wrl4+ydKOBwPcBk4404L4MsBrY=;
        b=Jx9patFnywbPT7+F2KRGpDOZvLIFkv3sCdD1JOOVDq5N+SYy+CRc0spb836yo9APxV
         8iUdfOQErBpTP8ZHSu1BiR/YHj2zqLl1GaFaitcJyPaSm1ny11xbDIbxLns+f2ZyWb10
         KjdrUXzVcAUzrDZUDWbjRN49H/fcYc/eRLkt41YdC8vdranfUOC8LphWr2tAwjUPYtWW
         /7MuczHZ6wd5Yf0jhw7jeD/hhMaj3VtO4CQ+VSz+e17u6u6dlg+vctmrmIyLUaV2DXCM
         7+EcS61JMQOnoFPKg9yX1M+/ls7dLw/n1cISo6I213Jo+erUVDOa5OEbZMkRDmhK7i6B
         ngwQ==
X-Forwarded-Encrypted: i=1; AJvYcCUkdvOufC7SMVttb2QesrvFDx3HyUK9aBqItvI6m2dYuEngGFApsf7iAif3NAtZLpFt0bg8Zx9axZ9+sf26@vger.kernel.org, AJvYcCUlXTuCKk9eTIzl5HuAo3kfzpQgsj+u8DX73ATg8K7Uj8Hk2bGtscmuCROEVmNkwoZ+/WaSU07kAdZW@vger.kernel.org, AJvYcCWnGGVMu/fyvFFf8PhJL11j2xUXE3Ra5L7fkX/T1Cc3UXJjPomxIv5RlgzgByMqmQlUZQ6MSdZK0fkPwhs=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz4xD68LIUnFTsiBnfunBJLMOADdLjBOB3oDKLcobzq4fTR8PK+
	pjBm07dHKuYl6d2UtlYo+Y1cfkC3TaanrkRMoXkiAXZDZxHkxrV+nyse
X-Gm-Gg: ASbGncuJkze6iYNyG3538JdNdlJ65EeBN8ry3tuNCcr4Ds6AiWZeiPDgnmjew7CkLM2
	0h7RRcq3eSz06cAvVtqTzYyIfPaUMjw19CBNbEsalZvpADxMxoJH+fjRYKK211D1NkjMEs2cRo8
	cCE1JbJvf9O5Ef0MlNJUz+W8zxNJqdLr0JwRxfvgqoyn/oiKxA9IM5cM69w3jyhl9CgqD7Gr6eZ
	odk7OROaVt2g+NICrtyJpOFPxCBS+AEpgyWeqiDqFubmGbwEF9e+B7eLCPHTUFCOfSzJngj8ZLz
	yIKKZS+LVIpnGSGFwCtCvinlDqwphUKb4XUyQzaJaX5daD1Hqq+mE3WxHl0Xa8p3UJZx+0okyvv
	sHj5HdN5erAqo8fwwHJ2kSGWh2GoMj4fiU5csbNDRbmM=
X-Google-Smtp-Source: AGHT+IGojFiOTvUwLHD/1y4nK1A5m7aje19PzaUW5T/89yIKMQ8IN/Gfix6eco2s4owdOo4nPtB+pA==
X-Received: by 2002:a05:6402:3895:b0:60c:496a:c504 with SMTP id 4fb4d7f45d1cf-60ff3e20ba2mr4510936a12.23.1751816673810;
        Sun, 06 Jul 2025 08:44:33 -0700 (PDT)
Received: from kuzhyl-vm.mshome.net (46.205.205.61.nat.ftth.dynamic.t-mobile.pl. [46.205.205.61])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-60fcb1fb083sm4026953a12.62.2025.07.06.08.44.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 06 Jul 2025 08:44:33 -0700 (PDT)
From: Oleh Kuzhylnyi <kuzhylol@gmail.com>
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Sasha Finkelstein <fnkl.kernel@gmail.com>,
	Javier Carrasco <javier.carrasco.cruz@gmail.com>,
	Linus Walleij <linus.walleij@linaro.org>,
	Javier Martinez Canillas <javierm@redhat.com>,
	Janne Grunau <j@jannau.net>,
	Igor Opaniuk <igor.opaniuk@gmail.com>,
	Neal Gompa <neal@gompa.dev>,
	Jeff LaBundy <jeff@labundy.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Oleh Kuzhylnyi <kuzhylol@gmail.com>,
	linux-input@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v9 1/2] dt-bindings: input: touchscreen: add hynitron cst816x series
Date: Sun,  6 Jul 2025 17:44:29 +0200
Message-Id: <20250706154430.357948-1-kuzhylol@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add documentation for Hynitron CST816x series touchscreen bindings.

Signed-off-by: Oleh Kuzhylnyi <kuzhylol@gmail.com>
---
Changes in v9:
 - Adjust linux,keycodes: Add items with event descriptions, and remove maxItems
 - Adjust dt example: Fix four-spaces indentation

Changes in v8:
 - Update the bindings title to indicate CST816x series support
 - Rephrase bindings description to describe controller more precisely
 - Remove redundant description field from the reset-gpio property
 - Completely remove cst816x,gestures object with all dependants
 - Apply linux,keycodes to represent gestures (slide up, slide down, etc.)
 - Extend dt example with linux,keycodes
 - Align indentation in dt example to use four spaces

Changes in v7:
 - Introduce the gestures field along with its sub-fields
 - Make reset-gpio property optional
 - Extend main description
 - Remove "touchscreen" reference

Changes in v6:
 - Fix minor tweak adviced by Krzysztof:
 - Move additionalProperties field after required

Changes in v5:
 - No code changes

Changes in v4:
 - Add Conor's Dooley "Reviewed-by" tag

Changes in v3:
 - Rename filename to hynitron,cst816s.yaml
 - Update description with display details

Changes in v2:
 - Apply pin definitions and DT headers
 - Use generic name for DT node
 - Drop status field

 .../input/touchscreen/hynitron,cst816x.yaml   | 65 +++++++++++++++++++
 1 file changed, 65 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/input/touchscreen/hynitron,cst816x.yaml

diff --git a/Documentation/devicetree/bindings/input/touchscreen/hynitron,cst816x.yaml b/Documentation/devicetree/bindings/input/touchscreen/hynitron,cst816x.yaml
new file mode 100644
index 000000000000..72d4da636881
--- /dev/null
+++ b/Documentation/devicetree/bindings/input/touchscreen/hynitron,cst816x.yaml
@@ -0,0 +1,65 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/input/touchscreen/hynitron,cst816x.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Hynitron CST816x Series Capacitive Touch controller
+
+maintainers:
+  - Oleh Kuzhylnyi <kuzhylol@gmail.com>
+
+description: |
+  Bindings for CST816x high performance self-capacitance touch chip series
+  with single point gesture and real two-point operation.
+
+properties:
+  compatible:
+    enum:
+      - hynitron,cst816s
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
+  linux,keycodes:
+    minItems: 1
+    items:
+      - description: Slide up gesture
+      - description: Slide down gesture
+      - description: Slide left gesture
+      - description: Slide right gesture
+      - description: Long press gesture
+
+required:
+  - compatible
+  - reg
+  - interrupts
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/gpio/gpio.h>
+    #include <dt-bindings/input/linux-event-codes.h>
+    #include <dt-bindings/interrupt-controller/irq.h>
+    i2c {
+        #address-cells = <1>;
+        #size-cells = <0>;
+        touchscreen@15 {
+            compatible = "hynitron,cst816s";
+            reg = <0x15>;
+            interrupt-parent = <&gpio0>;
+            interrupts = <4 IRQ_TYPE_EDGE_RISING>;
+            reset-gpios = <&gpio 17 GPIO_ACTIVE_LOW>;
+            linux,keycodes = <KEY_UP>, <KEY_DOWN>, <KEY_LEFT>, <KEY_RIGHT>,
+                             <BTN_TOOL_TRIPLETAP>;
+        };
+    };
+
+...
-- 
2.34.1


