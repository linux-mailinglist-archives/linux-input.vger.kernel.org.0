Return-Path: <linux-input+bounces-6382-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id E8F38973676
	for <lists+linux-input@lfdr.de>; Tue, 10 Sep 2024 13:52:12 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 1D24F1C24821
	for <lists+linux-input@lfdr.de>; Tue, 10 Sep 2024 11:52:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DEFD318E77F;
	Tue, 10 Sep 2024 11:52:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kSkD9rEr"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-lf1-f48.google.com (mail-lf1-f48.google.com [209.85.167.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1ECDF18785A;
	Tue, 10 Sep 2024 11:52:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725969126; cv=none; b=lextbXlMF2hBhCdCutg3yNhNLaW3T6xabhnnXKx9JWVdGtos+FiMQtS7331EnYy77m/5TYBoxuPDWA0T8udV4W+/tuo6hbSi3bwEnAFB5fV0QWD9QW4YeA2IaoXpRaXSb5zUUd5Kzyz7/QSFjGYUCDLnt4eZ2kDrLmvIZYRnj28=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725969126; c=relaxed/simple;
	bh=Ozkhhtc8keO96JP7DbB7pUh7uyTgImZ7a5BI3N6+Kn0=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=WyHg6/Q840Twoli/MUlHNvBTFJt4ixRHfS+1ngw1ueK9ongnNDCky7xuomW0RLSgtwl/+gny4Ooyzu5G8mm1Lnwqat3snlX8pfaMnC5jVzwEnuYKhKnHI4K+1F6ZbN1QANjQOz6J9Wv8BRTiALQOgUL3e+Id+20+rizNt6Bqhwo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=kSkD9rEr; arc=none smtp.client-ip=209.85.167.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lf1-f48.google.com with SMTP id 2adb3069b0e04-53660856a21so3066428e87.2;
        Tue, 10 Sep 2024 04:52:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1725969123; x=1726573923; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=LpQEnTJoJcWVLzjCPdzJAjUs5rW4bpr1g7ypfKTBLoo=;
        b=kSkD9rErgt9a+zzYnqEeqGuzeEJfxswMcYYW6Mzfn/uwGa+KuIJyngBLjCZ7WgQIJf
         c+oUMTjn1Ypk5zy5QszRY9sJKwsIYLEL7p+WqSXPV4gqt3gAyfAeFA9zQ77JNAaX+V68
         ptIO7kP9XqURPCgb+p9Fn3T/+Vt8ndbHcoo3jFDcdtCkhhclVeelBtB9yBc8S84oH6r7
         N68AeUL4K8gxW5d3Wkz2Fwlzkt2sf2e9yc5paw2tWMks90S4oh9y2otd4Xl4CSRz2lR1
         tbTeonQxbhRCJpG20MUtlf2OqeCVxtQU3vehPbxHPkA0uC1RdSzDxQhh1Q/b6N8XRO0t
         ohEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725969123; x=1726573923;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=LpQEnTJoJcWVLzjCPdzJAjUs5rW4bpr1g7ypfKTBLoo=;
        b=C9YFigQHwERypBIU3oD+XXHT1vYgyRhE0e0KHv4fK5IZAv7NjY2vHCZ0XnMxNedV+g
         X+b0X8gvI6GY4viv8XkK8vXtwJzGgZOKcecTSBWr/BBtSFRppAB1OtnS9FSwjAvZODC7
         sImHqvB9DlJNkSMfWJ4yGkGGfznL/0vu57dfxxCYvbZR8wkYJ/qaOcu3YCJR3Pq4IKY/
         ftr7S98HDMsx8N4GTcb+mUy71rbfr9rJbcaJa5KqAlU/28+KeL9Wjdz0FlB/IslpL2+W
         3fKKaa2sdRuSUuvFqctWcZphJ79widXRhZINVmrrsZwlLNT5vKzRmkX+FLFyd2DzEmD6
         wA9Q==
X-Forwarded-Encrypted: i=1; AJvYcCUvsZLFGc5/JgFtZy5gboKEeGLF8inbh26MsIL0NzBkU2qAjQj8kACD9qrYLKTBVa8GWXHFhlSfJ1H0DgI=@vger.kernel.org, AJvYcCWBLLe1BR10+fse7C87B6U162bCYVSePoSyW1y9E+/qXVchx7b4l7XZCjdMVV195qymhNDIsuFjj2CAAcbH@vger.kernel.org, AJvYcCX7xSr/fY7rVDFf6QunUum7E2LY2HjIaaaKXLbHnkgd2t7dyRtP1VihHjdSznVxCuANq+8JEBkC5uT2@vger.kernel.org
X-Gm-Message-State: AOJu0YzkNzGNItgjh7EtD14cEEDhJi4Gb21k1bDngGN0tlTushRiz92j
	v2YZcTAqrVBipEgmWPPH6h8K2DvLa3EDAVnrlHiYgn2dm56osYVR
X-Google-Smtp-Source: AGHT+IFwAFUn6MaKR7D6IPTnhn7JnewOyJSQx1gyoVnko+GDPSIJecIocLm5GGSHw9n/DvbBScxBVg==
X-Received: by 2002:a05:6512:124b:b0:52e:941d:7039 with SMTP id 2adb3069b0e04-5365881a437mr10068689e87.59.1725969122100;
        Tue, 10 Sep 2024 04:52:02 -0700 (PDT)
Received: from kuzhyl-vm.. (89-64-30-233.dynamic.chello.pl. [89.64.30.233])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5365f870ce0sm1122963e87.116.2024.09.10.04.52.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Sep 2024 04:52:01 -0700 (PDT)
From: Oleh Kuzhylnyi <kuzhylol@gmail.com>
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	linux-input@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Oleh Kuzhylnyi <kuzhylol@gmail.com>,
	Conor Dooley <conor.dooley@microchip.com>,
	igor.opaniuk@gmail.com,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Jeff LaBundy <jeff@labundy.com>
Subject: [PATCH v6 1/2] dt-bindings: input: touchscreen: add Hynitron CST816X
Date: Tue, 10 Sep 2024 13:51:57 +0200
Message-Id: <20240910115158.74502-1-kuzhylol@gmail.com>
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

 .../input/touchscreen/hynitron,cst816s.yaml   | 57 +++++++++++++++++++
 1 file changed, 57 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/input/touchscreen/hynitron,cst816s.yaml

diff --git a/Documentation/devicetree/bindings/input/touchscreen/hynitron,cst816s.yaml b/Documentation/devicetree/bindings/input/touchscreen/hynitron,cst816s.yaml
new file mode 100644
index 000000000000..b3f4049e4b9b
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
+required:
+  - compatible
+  - reg
+  - interrupts
+  - reset-gpios
+
+additionalProperties: false
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


