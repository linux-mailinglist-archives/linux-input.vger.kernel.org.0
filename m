Return-Path: <linux-input+bounces-3845-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F3718CF61E
	for <lists+linux-input@lfdr.de>; Sun, 26 May 2024 23:25:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 0CB11B2147F
	for <lists+linux-input@lfdr.de>; Sun, 26 May 2024 21:25:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4E78D13A3E2;
	Sun, 26 May 2024 21:24:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="CRfEYSyN"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com [209.85.218.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9714A13A259;
	Sun, 26 May 2024 21:24:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716758691; cv=none; b=PttQ0eS6j5BxJ4qTpEjWPw0yGNjQGS1Nuw3K4ZGL5TI1WO0Ev5xGPNoAHM548Pd354HGb84Tf2XrYYP69p0HLtcXtVRD9Zw/xOqnr8h20Z3Cxv2O1cvJFYYufIAKTxkxcrF7Pu7uxgW8wadYMBzArN2H4joZcVZfA99Usrl3cNU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716758691; c=relaxed/simple;
	bh=oeEP4ygQRGenE4hVSLTsl2TaoTbK+XgklW7Ivx2ujiU=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=A9/3RXKZZn1lw6VffkYibZVrNNXxeGEslwUp/MmYYxaBYDxchaJHoARw7k2EyGSuSCMrN6ohft7NYs38VUIdD2Ah0xSXhif2PFVyyvO7L7ABola0JNhEI1VuxCzFCmRXSIBxEeogs1Qc08507aMSAtyYharZq8vVgicx0BEiAOw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=CRfEYSyN; arc=none smtp.client-ip=209.85.218.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f45.google.com with SMTP id a640c23a62f3a-a59a609dd3fso838913466b.0;
        Sun, 26 May 2024 14:24:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1716758688; x=1717363488; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=y+dEpyyCSvCFW4rqJdqF5eNr6betO3sf3jn2avdoLW0=;
        b=CRfEYSyNzk9+CGsj2TmyINP06MvLDZ2/zTjnJ4todz76f8VGZDnx0QqFGoEmzComRS
         6it/b9qzFQGDLK5BzTtdgEyfc4vdyUxM7bLCHSWXeUmjgUbE2oYFrQckh+GnzDZbAg91
         QEGoafmKe/jBgSeHFexlzIV+rQ5aB/6WO3u7/vzM9E+ZQJ2v2urRhvn4feZJP+17otfl
         xFbDaV+uOVGMJNb2PbJwgvx8qvksBlamUikh1Pc2yyvyL0B3+1yQI0qNTTz2AAV8Lt2A
         ridm9pta6c0f5m/4k6hJ0l2j5EP7JNugYkDZfCd6iQNj6unX9Xky1/zYU29XvEfH3i/T
         9PpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716758688; x=1717363488;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=y+dEpyyCSvCFW4rqJdqF5eNr6betO3sf3jn2avdoLW0=;
        b=uWQBWwKNTPt6FXjB85ym9x0JDWUOzz02v8RH0GeGJl+QQaioyi2MFOI54Jge8t1hsc
         Rk9ZvaWQ3L9yllfEjDsILG8/LgrZLV11nn16HAYC9Z7NNgEVhhtldQ5slr3hogBdslE+
         o0Rl3q7CH6pq9d3PKeAbtj6o/sQehxaNWkqdl/du2p/58jQwCGMgmyKcKq8EKGrjitG0
         Cf76wycWlm2mfQBdeD8+N1IawH75XdQlZmG7QiJhHyawrSt3rXQjEBv8EhgMu6dbWUhV
         Riwuc1DRShExN/zrHHbJ7BGgELZse1zDuIwWEtCgexSPY6SvrXNBPh/IdhDxfxGO4weV
         30iw==
X-Forwarded-Encrypted: i=1; AJvYcCWWKou/L3l7+39gspvt2wLh/v/6R8Ahj2P+dsfyz2NdtAgY0unZOMn5pGcmjSdjXuBRICjoYjle6gYO1XSWQfM74cXdbeSxu9vqUBoyreyUSfx3qW9yQM+PVvz8ERtF/iCmboabw0pEGA==
X-Gm-Message-State: AOJu0Yzd6DElkSvSkaNQn+rpBzk3M/SKq60E6MF7aBjSw7AXs73s4+7m
	KquY05HbgXLh9uYrnLs8+oIrmtQD0/wQSOyXagAyi7aPmg2FuAbBmGCDvg==
X-Google-Smtp-Source: AGHT+IExnpFoRBz8DfWymbraINrBAcfwwG8y93kzm2NnY6cqpxtoo2KOZnOUi6GecDN1adqlHeF1kQ==
X-Received: by 2002:a17:906:358e:b0:a62:49ae:cd7b with SMTP id a640c23a62f3a-a626250ddcemr689759966b.24.1716758687647;
        Sun, 26 May 2024 14:24:47 -0700 (PDT)
Received: from kuzhyl-vm.. (89-64-18-73.dynamic.chello.pl. [89.64.18.73])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a626c817088sm418093066b.24.2024.05.26.14.24.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 26 May 2024 14:24:47 -0700 (PDT)
From: Oleh Kuzhylnyi <kuzhylol@gmail.com>
To: linux-input@vger.kernel.org
Cc: dmitry.torokhov@gmail.com,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	kuzhylol@gmail.com,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	jeff@labundy.com,
	neil.armstrong@linaro.org,
	hdegoede@redhat.com,
	artur.serhiienko@gmail.com,
	igor.opaniuk@gmail.com
Subject: [PATCH v3 1/2] dt-bindings: input: touchscreen: add Hynitron CST816X
Date: Sun, 26 May 2024 23:24:41 +0200
Message-Id: <20240526212443.8496-1-kuzhylol@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add documentation for the Hynitron CST816X touchscreen bindings.

Signed-off-by: Oleh Kuzhylnyi <kuzhylol@gmail.com>
---

Changes in v3:
 - Rename filename to hynitron,cst816s.yaml
 - Update description with display details

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


