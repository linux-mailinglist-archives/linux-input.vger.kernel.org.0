Return-Path: <linux-input+bounces-3782-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 49AF58CC7B7
	for <lists+linux-input@lfdr.de>; Wed, 22 May 2024 22:34:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 04974282D1E
	for <lists+linux-input@lfdr.de>; Wed, 22 May 2024 20:34:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BA9AA146001;
	Wed, 22 May 2024 20:34:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="c4+kguVP"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-lj1-f174.google.com (mail-lj1-f174.google.com [209.85.208.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C96C7E575;
	Wed, 22 May 2024 20:34:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716410050; cv=none; b=YnzAYVrYv25hA67JTN6c7H1oc8c5r26VxUm7U2sa8+KxoJn7It6n0YDWfcGvxB9ZF214xVSQdUS0h00u1bYH5CLMLrCRQ5E8a8soVI/W46Vskjwy6h1yxn0z4FKWZpS6O4Rf2btrprgA26QUwaRnGM9eMe1xs5u37yjb1uIWy6w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716410050; c=relaxed/simple;
	bh=/6RBSwUUWg/HR/XrYDouHPaKrC8vOaWXZq2wcQh9Vhk=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=JbsGfZOHtHwVPIbZpj2pYRqsRHbn7j8buN1sWHjIL8ZFbHXQq7SoKJVyCRzn59McVKFk1G0zaplwMduZgRAehvOdJIjUWC+OQLIbJswW7CyPwQPPuNj2/6cs0+quAJeKTQm4wtM7V+1ne92QqfmPBkzeDGjDmnrwPqkcbIYr4g8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=c4+kguVP; arc=none smtp.client-ip=209.85.208.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lj1-f174.google.com with SMTP id 38308e7fff4ca-2e6f2534e41so55807711fa.0;
        Wed, 22 May 2024 13:34:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1716410047; x=1717014847; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=juCkMaHMrzaKXgLhLu9+/j0ickUzidNday1E+cJ916c=;
        b=c4+kguVPIJoktOJTS+AazTlGetLNZZKRCXaU7Z3XG2OCxpygpZTw0PR9iw3QQr9/Qv
         QdB3Cgc0A5dCALGg7cDzhgnVkB/UhpwxHv9/9PV6IQbaRxvkH778W0ZIFhg84rEFrnE2
         9BtMC3VZ8Wz695ZZkrhu7g1MZP1gYIs/DDsWaT+dyz9bpNqhM3xTrIGXH8Gp46mwmS1T
         Vn5SuxN1TAmninx03THzqwbkAFq0UfsDdHL1KpWln4hTfaUjmTos2eWZFqoyd8aEbUO4
         /GEBVMc6C6bGLQew2mLVDCbQaZD9o5S+q6sTAC+3fdB266WBK5IAm/WM1fx3beKkTCnY
         vwPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716410047; x=1717014847;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=juCkMaHMrzaKXgLhLu9+/j0ickUzidNday1E+cJ916c=;
        b=W1XfojPSkF5v4ISapxZ9ai79pVfhEJi4mC+7dOfOrBpkJGVhi9Mc9v7e5dxM9mzVKS
         ZQ7tHGMXS6GlRGvw+PYiZRt+3EaDELyrdL/AALVBKsu0iU3E4fg8E3u2vOBYYpf9iy1/
         DeB7jm1JlTldLSBNjg2TBYfE8RTTUQFtow9CQdXHHH5ryyawdR5PkkIvxTwgvMxV+0Ng
         bfZb+WN969N9qYxjVsO98jq7TZj+RDopOxlY2Q2kFA/+9nygAbRyoww3mUX8TIDGnFGJ
         1TjALFRbup4wzglKWOcc+f2/s7SYo95vXFnrAuxH+1+nSjrmn8ufm2Oksl222o3y8lSG
         cy9Q==
X-Forwarded-Encrypted: i=1; AJvYcCW0/rpZQoYIeUpFCwQ6UI9XoPbM0EH7W17fjJ1SsUnx708A80Bjz6p5SaJqR+Botij1fgDvi24YX8FWfdFlQ2lBSu1/+Lqv5BPkCm2zcb8M+gutgm04b1c/gafx9stoQCA9U70+WSIB5g==
X-Gm-Message-State: AOJu0Yzsg2iSntbDOHS4RN35nRehetsaxEhbwTIzVtLx0IqUP6C+t6Vs
	wHbZuk6QU7Th0yTDLssv1+GtU3f/0OrofM9xD8A2OGqO/eoXdv/vnh2Uevzvk6Q=
X-Google-Smtp-Source: AGHT+IF/RlGn1Aaddcf4QEPpAcrsp+lceodnSjZlFNLFzQPFFKa1tt4y8BjqBA5+mQIC8SRizt3Mjg==
X-Received: by 2002:a2e:330a:0:b0:2e5:67a9:4dcf with SMTP id 38308e7fff4ca-2e9494be817mr18094341fa.18.1716410046915;
        Wed, 22 May 2024 13:34:06 -0700 (PDT)
Received: from localhost.localdomain (89-64-18-73.dynamic.chello.pl. [89.64.18.73])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-2e4d0ce35dcsm41575161fa.34.2024.05.22.13.34.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 May 2024 13:34:06 -0700 (PDT)
From: Oleh Kuzhylnyi <kuzhylol@gmail.com>
To: linux-input@vger.kernel.org
Cc: dmitry.torokhov@gmail.com,
	jeff@labundy.com,
	neil.armstrong@linaro.org,
	schnelle@linux.ibm.com,
	arnd@kernel.org,
	kuzhylol@gmail.com,
	hdegoede@redhat.com,
	linux-kernel@vger.kernel.org,
	robh@kernel.org,
	krzysztof.kozlowski+dt@linaro.org,
	conor+dt@kernel.org,
	devicetree@vger.kernel.org,
	artur.serhiienko@gmail.com,
	igor.opaniuk@gmail.com
Subject: [PATCH v2 1/2] dt-bindings: input: touchscreen: add Hynitron CST816X
Date: Wed, 22 May 2024 17:33:46 -0300
Message-Id: <20240522203347.2263425-1-kuzhylol@gmail.com>
X-Mailer: git-send-email 2.30.2
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

Changes in v2:
 - Apply pin definitions and DT headers
 - Use generic name for DT node
 - Drop status field

 .../input/touchscreen/hynitron,cst816x.yaml   | 56 +++++++++++++++++++
 1 file changed, 56 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/input/touchscreen/hynitron,cst816x.yaml

diff --git a/Documentation/devicetree/bindings/input/touchscreen/hynitron,cst816x.yaml b/Documentation/devicetree/bindings/input/touchscreen/hynitron,cst816x.yaml
new file mode 100644
index 000000000000..22bd145db5ee
--- /dev/null
+++ b/Documentation/devicetree/bindings/input/touchscreen/hynitron,cst816x.yaml
@@ -0,0 +1,56 @@
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
+    #include <dt-bindings/interrupt-controller/irq.h>
+    i2c {
+      #address-cells = <1>;
+      #size-cells = <0>;
+      touchscreen@15 {
+        compatible = "hynitron,cst816s";
+        reg = <0x15>;
+        interrupt-parent = <&gpio>;
+        interrupts = <4 IRQ_TYPE_EDGE_RISING>;
+        reset-gpios = <&gpio 17 GPIO_ACTIVE_HIGH>;
+      };
+    };
+
+...
-- 
2.30.2


