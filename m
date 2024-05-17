Return-Path: <linux-input+bounces-3726-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 161F18C8370
	for <lists+linux-input@lfdr.de>; Fri, 17 May 2024 11:27:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 4002D1C20A5A
	for <lists+linux-input@lfdr.de>; Fri, 17 May 2024 09:27:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A1A42224EA;
	Fri, 17 May 2024 09:27:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="TNWsaPS7"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-lf1-f49.google.com (mail-lf1-f49.google.com [209.85.167.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F10BB2137E
	for <linux-input@vger.kernel.org>; Fri, 17 May 2024 09:27:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715938061; cv=none; b=F8jOsR8kndkQCY+Cir66VgLsMxKF3UZfEA2XEHonL86QiVVNLtZYSw/quMnL5UQCZhOTXZ1rpJMbVhQdtF0SHOi8srAkqaIZaQHdfRDovgoeba86Xj71iOUxLOvUwJo7EezwI8kcIVwxQdr0OfSIxAyocQuN6IyPjMo8+cxRPAg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715938061; c=relaxed/simple;
	bh=KWX8ar2CimX84Eb36CfpMLWfzlZb+xqUoJ81pzrxogU=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=YJLOaRnoLe1riYzSZiurnyntryE/wuYFakbTaA2G1J+2drhPaLYmpqEz4QWed++5vA+hyUx8oWO5VeRuBOyuECFLb4eInj5353xBWYbyAcSfLwOyMPqdY4CbREdpZcDCuHVq37kkZQagYg8KkW3k8qDlzFo33F4AGGEOr2np8gY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=TNWsaPS7; arc=none smtp.client-ip=209.85.167.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lf1-f49.google.com with SMTP id 2adb3069b0e04-51f71e4970bso2095319e87.2
        for <linux-input@vger.kernel.org>; Fri, 17 May 2024 02:27:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1715938058; x=1716542858; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Z3t9MFjMon/9ln8aMxt1mFbQjn1jO8+VXh5d2Ni9N40=;
        b=TNWsaPS75NmQQmjEAz6LbloS/wKmQzx3TUbV/e3uLbtU4CVEcMJoYgYgt5AxSJW9iR
         L9iu2Tcru6XatsmZhZebRDIco92pPqFtQ+DKQTzL/64IZN4RdQzXVlZbX0zWSO4LfUBj
         BjbHkh5wZBlx7op2Gq0ZvlUeRvpWTmKUXBkwrRn3B1/87AY2AkZcPHkuvKhdNzyWDm9W
         E5Q8RevK0Exh0wtZDwHjn04TxNh2hAnNINYUF0b6cjIJue0MDr4/rdiYcJEsooD7TWU8
         9IUObwmaBHNvqXE/kMCNfgXszf+58pwIYQx2eXaT5imPJyLo0ORMBQbnro0r9X6NEME9
         pJkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715938058; x=1716542858;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Z3t9MFjMon/9ln8aMxt1mFbQjn1jO8+VXh5d2Ni9N40=;
        b=uFvh1NhgcalSI1lsn3UBuaOSI9HqU0SSx3QjKi8L/D/hJgewbH+an2FdtIABIUIY0y
         ZcwgoQGl4lJkO7LL3mCU4xz6jabTpr7WhWccf630s4Vhx+RT+SsjI1pq2oSZTaRqvTM4
         KXyz8dWgNz+4kcOIbklv91IZarJUwbFQkpPOiMdkFlIUxirdRastGJWjvFwiOgzyO4HF
         rEF9Y8kG9aVK4USjWwW+m+4As5/sZNZoCS8H2uPUOAvm0ZLybg6erKYwRJO+bOOxzmyV
         JYyXRkviMtLk8+nFkH62lAkVEmMeNUVPN58IueY8Lg4V4bLlXzXeJ55bc05mtrmjv+G8
         7yfA==
X-Gm-Message-State: AOJu0YyMIWjAcX+AcVGcW7I0ZWBEWIc0ZeFlFvEniZ/EgLgfptB2vznt
	650T06l1ZyFQf8N40+chj4LtfWrPPHJ0zZvTs6FH076+IJfuzso2ioimHQ==
X-Google-Smtp-Source: AGHT+IG/yPR6bPmRQFzRb0DFgdKRWgkVC7J3LEEJpy2X4EIB4OGBV2ssTAg4f0FLMDuzNZ0jZUP9Tg==
X-Received: by 2002:a05:6512:3f08:b0:51a:d9a3:dbf5 with SMTP id 2adb3069b0e04-5221016b4a2mr23249588e87.47.1715938057980;
        Fri, 17 May 2024 02:27:37 -0700 (PDT)
Received: from kuzhyl-vm.localdomain (89-64-18-73.dynamic.chello.pl. [89.64.18.73])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-523b261ace6sm645977e87.8.2024.05.17.02.27.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 May 2024 02:27:37 -0700 (PDT)
From: Oleh Kuzhylnyi <kuzhylol@gmail.com>
To: linux-input@vger.kernel.org
Cc: dmitry.torokhov@gmail.com,
	artur.serhiienko@gmail.com,
	igor.opaniuk@gmail.com,
	Oleh Kuzhylnyi <kuzhylol@gmail.com>
Subject: [PATCH 2/2] dt-bindings: input: touchscreen: add Hynitron CST816X
Date: Fri, 17 May 2024 11:27:32 +0200
Message-Id: <20240517092732.47715-2-kuzhylol@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240517092732.47715-1-kuzhylol@gmail.com>
References: <20240517092732.47715-1-kuzhylol@gmail.com>
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
 .../input/touchscreen/hynitron,cst816x.yaml   | 57 +++++++++++++++++++
 1 file changed, 57 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/input/touchscreen/hynitron,cst816x.yaml

diff --git a/Documentation/devicetree/bindings/input/touchscreen/hynitron,cst816x.yaml b/Documentation/devicetree/bindings/input/touchscreen/hynitron,cst816x.yaml
new file mode 100644
index 000000000000..b08e907ee672
--- /dev/null
+++ b/Documentation/devicetree/bindings/input/touchscreen/hynitron,cst816x.yaml
@@ -0,0 +1,57 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/input/touchscreen/hynitron,cst816x.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Hynitron CST816X series touchscreen controller
+
+description: |
+  Bindings for Hynitron CST816X series touchscreen controllers.
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
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+    i2c {
+      #address-cells = <1>;
+      #size-cells = <0>;
+      cst816s: cst816s@15 {
+        compatible = "hynitron,cst816s";
+        reg = <0x15>;
+        interrupt-parent = <&gpio>;
+        interrupts = <4 1>;
+        reset-gpios = <&gpio 17 0>;
+        status="okay";
+      };
+    };
+
+...
-- 
2.34.1


