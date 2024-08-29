Return-Path: <linux-input+bounces-5992-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E64149651B9
	for <lists+linux-input@lfdr.de>; Thu, 29 Aug 2024 23:20:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A2C3C28224D
	for <lists+linux-input@lfdr.de>; Thu, 29 Aug 2024 21:20:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 53E2C18B46D;
	Thu, 29 Aug 2024 21:20:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="IWnDs27G"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-lj1-f179.google.com (mail-lj1-f179.google.com [209.85.208.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 877ED18A949;
	Thu, 29 Aug 2024 21:20:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724966434; cv=none; b=Tq7nAzf6bKcRDChJsWuz0kDMRZDS9B5oSYrEVm7DMJsT96HbdSsoV+CnlwDfqNCARuJVnnNwzPpllFf3pxX7aFquT0NuZgwASKCpTKI+aKCtjW6k4RhGIzPUkTHMQtPjYxVdH0XdPpAzsjWg7mHtLpS0wJXBQQ6rsLxaJMYhobE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724966434; c=relaxed/simple;
	bh=s23M7oMrEUJys+xAvGHuuwv3TEEjFq3xU4PMlfZckGo=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=FRfU7EHhiyOnrz77jSwdWNizeTk6BM18qacjXDtkkgd9MoaRCxms/mb+OZ2WAMpEGLtTB79Y/1LcCjI5HiQucjjJCUgsmM+xLhh24vUGN3beRyAMMeixM+Pk5z29x9tMTsfNnilWHVI7HdygSaie68bWIgNU/X2XicRasThbqLU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=IWnDs27G; arc=none smtp.client-ip=209.85.208.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lj1-f179.google.com with SMTP id 38308e7fff4ca-2f4f2868710so11885431fa.1;
        Thu, 29 Aug 2024 14:20:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1724966428; x=1725571228; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=fLi6/gNYCxBVU+mYmFe3F60tlH0Da5WXtkU2JtKbeFo=;
        b=IWnDs27GMBf5/aswIJYeC0XlQpzDY1RyJ6c2skQWJrotWKnmkV94do1NSOsZ56J2GU
         3fHRGCf51iNZ7Yb5sP1tk8pWCmUzfAnhEsvmfhgUahD174k/C7x+CuQoKTPTCYWQNEmr
         L6Kuu8Fs5wiw/zFdviXonTiiEQbK62o+6PM0twCxz2oqXKKEgCrr0uDiGMR4xIpqoCSH
         +2G5NklbQcCCWb5nWUlS03mQEsNzk+775Hk+zS0jL9tDeDBNmiI6qBXs0WTEGtnPdLdV
         Tvqyd4qgz5r1M4yigBoXruYfXPPcCxKsxNsve2mAWfkGBD6Hj6n/Wr3GeJt2CIHYMHOd
         /zLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724966428; x=1725571228;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=fLi6/gNYCxBVU+mYmFe3F60tlH0Da5WXtkU2JtKbeFo=;
        b=VeZ5UarHJG0H35R7usra0idFD0R32BqnzvjGxbDKCCFkj7mJyLWMnPFCbxDna+BYtP
         giSRkgJUZMtgFldLdDFU892CVQKv4dGCZndlpfwvGUO7ECGRWih9TE2+IEyurRdvVLiP
         P6SDryn1jlRS5ovp6KjlR1KrgLBU/gpnQRF0qI+EJf+1VGKc1QrWG9HVUBNh7ZsM7s/3
         rHMTQMsLRTMfJQLh+8BoAjV7Z7IrjpmnKmIbx0q88iD6vWzyPU5+cRhjrTlryT+flKm5
         kUiWOpZL1qpkxDlXec7m+j4K+B99iWXHuSGa8u+cI9rGaRDbiENCuGiJYm64I7Fq0BNf
         ssXQ==
X-Forwarded-Encrypted: i=1; AJvYcCUT8RrFs01sHbFp7vPN8r5ClTuCXnjTmiAZeA4nlEQwOMJ4L3VZF5wswjHut2QVrKzGDdLsWZaZrW98jq2K@vger.kernel.org, AJvYcCW5g1pPWq1NjTPnJf/VTSZNKNZkDDiZu/Kguui0dvn8n5Q7zjnOIfDpoqedZJiw4+mwXYNQdOL0suTx@vger.kernel.org
X-Gm-Message-State: AOJu0Yy6/yCgnyqdfDwodVWcOOe2hRm+TAY+fkkb+253+/ropnkdh9pG
	wn2qyY+r5eVI8qR092KAxI+73z/tMZmrg6vTzyq9fXTtpFGbjHvGfygwjg==
X-Google-Smtp-Source: AGHT+IFcgyF5XX8pBNH651vgfwOmcMYDl4QGEGs/tnVCRyTAxMd66Da8tIKruuGWKQwdE1eJujgEFA==
X-Received: by 2002:a2e:bea3:0:b0:2ef:2016:262e with SMTP id 38308e7fff4ca-2f6105acafbmr30548241fa.0.1724966427513;
        Thu, 29 Aug 2024 14:20:27 -0700 (PDT)
Received: from kuzhyl-vm.. (89-64-30-233.dynamic.chello.pl. [89.64.30.233])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-2f614ed15fcsm2746671fa.16.2024.08.29.14.20.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Aug 2024 14:20:27 -0700 (PDT)
From: Oleh Kuzhylnyi <kuzhylol@gmail.com>
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: linux-input@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Oleh Kuzhylnyi <kuzhylol@gmail.com>,
	Conor Dooley <conor.dooley@microchip.com>,
	igor.opaniuk@gmail.com,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Jeff LaBundy <jeff@labundy.com>
Subject: [PATCH v4 1/2] dt-bindings: input: touchscreen: add Hynitron CST816X
Date: Thu, 29 Aug 2024 23:20:13 +0200
Message-Id: <20240829212014.111357-1-kuzhylol@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add documentation for the Hynitron CST816X touchscreen bindings.

Reviewed-by: Conor Dooley <conor.dooley@microchip.com>
Signed-off-by: Oleh Kuzhylnyi <kuzhylol@gmail.com>
---

Changes in v4:
 - Add Conor's Dooley "Reviewed-by" tag

Changes in v3:
 - Rename filename to hynitron,cst816s.yaml
 - Update description with display details

Changes in v2:
 - Apply pin definitions and DT headers
 - Use generic name for DT node
 - Drop status field

 .../input/touchscreen/hynitron,cst816s.yaml   | 57 +++++++++++++++++++
 1 file changed, 57 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/input/touchscreen/hynitron,cst816s.yaml

diff --git a/Documentation/devicetree/bindings/input/touchscreen/hynitron,cst816s.yaml b/Documentation/devicetree/bindings/input/touchscreen/hynitron,cst816s.yaml
new file mode 100644
index 000000000000..ac9f1d8e8fc0
--- /dev/null
+++ b/Documentation/devicetree/bindings/input/touchscreen/hynitron,cst816s.yaml
@@ -0,0 +1,57 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/input/touchscreen/hynitron,cst816s.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Hynitron CST816S Touchscreen controller
+
+description:
+  Hynitron CST816S Touchscreen controller for 1.28-inch 240x240 Resolution
+  Touch LCD Display Module
+
+maintainers:
+  - Oleh Kuzhylnyi <kuzhylol@gmail.com>
+
+allOf:
+  - $ref: touchscreen.yaml#
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
+additionalProperties: false
+
+required:
+  - compatible
+  - reg
+  - interrupts
+  - reset-gpios
+
+examples:
+  - |
+    #include <dt-bindings/gpio/gpio.h>
+    #include <dt-bindings/interrupt-controller/irq.h>
+    i2c {
+      #address-cells = <1>;
+      #size-cells = <0>;
+      touchscreen@15 {
+        compatible = "hynitron,cst816s";
+        reg = <0x15>;
+        interrupt-parent = <&gpio0>;
+        interrupts = <4 IRQ_TYPE_EDGE_RISING>;
+        reset-gpios = <&gpio 17 GPIO_ACTIVE_LOW>;
+      };
+    };
+
+...
-- 
2.34.1


