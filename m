Return-Path: <linux-input+bounces-6439-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D3B6976A8F
	for <lists+linux-input@lfdr.de>; Thu, 12 Sep 2024 15:28:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id DEC8C1F237A7
	for <lists+linux-input@lfdr.de>; Thu, 12 Sep 2024 13:28:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 88CFA1AD245;
	Thu, 12 Sep 2024 13:28:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="LSdRc6Z6"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-lf1-f44.google.com (mail-lf1-f44.google.com [209.85.167.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A9C431A4E7E;
	Thu, 12 Sep 2024 13:28:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726147718; cv=none; b=iyLafpo9lyRYzqWvP2JhUzmMj+wNVWXM88p+z42OrOAxCNNyAmvgoeBQ78Qom+plR+4lKj3TYigFul8hbImh/QpLoYHe+Lr4yKTvZxG+9ogwnisQeA+Pph3daZS4Ova93QZnfLvWOkC6HOwx+qfzIGQb9UeTfGYyq4TlUt4XI9c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726147718; c=relaxed/simple;
	bh=r7lZLM/2ST0gqJtUyNpFMQvnSVTYdDxkDdvKfOxlT7A=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=nrK1Do9PgCdvMAMkUKlxVFK308iBHBYzHrtlmarnrQWvMSYqSnACdLMgihLGO1tUlNv51dEbv7+yMm+31Qi86Wi9DpPTZaThLrQKHVgM0xWxfYAXwKAL/5dhIYUtBaz68Frml+Ct6xVjaZX3eDgZhnNZPrVNhc6VaXquJ/yDqao=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=LSdRc6Z6; arc=none smtp.client-ip=209.85.167.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lf1-f44.google.com with SMTP id 2adb3069b0e04-5365a9574b6so1449828e87.1;
        Thu, 12 Sep 2024 06:28:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1726147715; x=1726752515; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=VxTzMWqkKizJl8/2348jMkNr4MWZPdDRiF9Kr0wUwqk=;
        b=LSdRc6Z6ip4ImAMKUFZR/hRC9IZ82zmbJrh6XDXsl6VWtb8NLH2/FCqtu7+/vwGjLx
         xaoChF3DJ6veI36udcBB+Oi1C3gWv5Gg655zE80x0VeH+LWiysUTye3vBK+52AZKKvo4
         Tf42bLv+Uu2nF2UVehrvCc5Ju9po3dKJjuGeITan9asbsP9PTB3CUknf7+8knFCipKO6
         g3G/yGiov9i+PEHeRG9IF6xBV0PSrbc6AlT6sFGsd1IBYnRRyG+r56A0fWwffrYlUSkG
         kQ19M1QIyXjvtMBoHM3dzlLIC+6o3JtSDV8hy2RTfHeUm8E6fwG63FJkSsQzw2YzZ8qR
         wWng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726147715; x=1726752515;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=VxTzMWqkKizJl8/2348jMkNr4MWZPdDRiF9Kr0wUwqk=;
        b=tGb8hQolSpTDrDPlDij0RQfm6KF8MPQhRyhaLc4i59Umh+h80Obq5LCXk+ac82LPRY
         bMtC/XIkqCnAa1fTTUEixpZDC1xWif0eFNaTbnksyYOEyurEfV3cioDtWXhryD9NyjXS
         k0NS1P5/GcD5YtBmJH7EravqvdvAYmmv74LVt+UDU+7Z+AYHaJX3mddM1TcM22d3TkPh
         HWJb/CMYeLjkY9FVOIKMcRnEHXaIAbDqkWrMZdkEjhUTObb+VxYXszPQ6mZteMbSgTIT
         +P/hGnG8/+FZwuxoVWIPRPZ8JD8n56NoriW2Om174xmKTnUofqNRDMi7ZOSHyXcwz/5g
         8TKQ==
X-Forwarded-Encrypted: i=1; AJvYcCWQEbo+nZngjHrPOcvMv+RJkt+sSHo52PgKZKbfOjmtjfb428GpavCw48VKt1nqTuztbQhflFQ3l/WJ@vger.kernel.org, AJvYcCWurjtbKt2dFr/c9eRqVOfw5NyR0LzIOcWT08mwFdVJbmWju/GZVFZ8EnF45bp5Qe03tn8u3G/iOi6+MJo=@vger.kernel.org, AJvYcCXwtdXWpghERqeNBA1otSGlKj8DXIMi/71yPm2lArOT4no2QZZ34G/lcAM9jb7pZRPzmT1oz+0gJo2GyFNe@vger.kernel.org
X-Gm-Message-State: AOJu0YyUHaE5PVdJn8URaiEQvQjOdE2a+1NX32BdFfHgN8R7T6TtJ8oD
	XHz5zpKLpV30CsY1jVo4YE3eQj88LX1nCOBTECXHCVviVQ/MGo5U
X-Google-Smtp-Source: AGHT+IGPmhUARstgSGYLvwo7kHaV0GNtu4HzNSnxmeCx6HMCRSCmDpSDaaM2CayCHuybmtb9CcYicw==
X-Received: by 2002:a05:6512:114f:b0:533:483f:9562 with SMTP id 2adb3069b0e04-53678fe6b16mr2662491e87.42.1726147713680;
        Thu, 12 Sep 2024 06:28:33 -0700 (PDT)
Received: from kuzhyl-vm.. (89-64-30-233.dynamic.chello.pl. [89.64.30.233])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a8d25a28408sm745121166b.86.2024.09.12.06.28.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Sep 2024 06:28:33 -0700 (PDT)
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
Subject: [PATCH v7 1/2] dt-bindings: input: touchscreen: add Hynitron CST816X
Date: Thu, 12 Sep 2024 15:28:22 +0200
Message-Id: <20240912132823.123409-1-kuzhylol@gmail.com>
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

 .../input/touchscreen/hynitron,cst816s.yaml   | 126 ++++++++++++++++++
 1 file changed, 126 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/input/touchscreen/hynitron,cst816s.yaml

diff --git a/Documentation/devicetree/bindings/input/touchscreen/hynitron,cst816s.yaml b/Documentation/devicetree/bindings/input/touchscreen/hynitron,cst816s.yaml
new file mode 100644
index 000000000000..99ac29da7a5a
--- /dev/null
+++ b/Documentation/devicetree/bindings/input/touchscreen/hynitron,cst816s.yaml
@@ -0,0 +1,126 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/input/touchscreen/hynitron,cst816s.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Hynitron CST816S Touchscreen controller
+
+description:
+  The CST816S is a touchscreen controller from Hynitron, which supports gesture
+  recognition for swipe directions, tap, and long-press actions. This binding
+  document defines the necessary properties for integrating the CST816S with
+  a Linux system.
+
+maintainers:
+  - Oleh Kuzhylnyi <kuzhylol@gmail.com>
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
+    description:
+      Optional GPIO line used to reset the touchscreen controller.
+    optional: true
+
+  gestures:
+    type: object
+    description:
+      A list of gestures supported by the CST816S touchscreen controller and
+      their associated Linux input event codes.
+    optional: true
+
+    properties:
+      "^.*$":
+        type: object
+        description:
+          Each child node represents a gesture that the touchscreen controller
+          can recognize.
+
+        properties:
+          cst816x,gesture:
+            description:
+              Numeric value representing the gesture ID recognized by the
+              CST816S touchscreen controller.
+            $ref: /schemas/types.yaml#/definitions/uint32
+
+          linux,code:
+            description:
+              Linux input event code (from linux/input-event-codes.h) that
+              corresponds to the gesture.
+            $ref: /schemas/types.yaml#/definitions/uint32
+
+        required:
+          - cst816x,gesture
+          - linux,code
+
+        additionalProperties: false
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
+
+    i2c {
+      #address-cells = <1>;
+      #size-cells = <0>;
+
+      touchscreen@15 {
+        compatible = "hynitron,cst816s";
+        reg = <0x15>;
+        interrupt-parent = <&gpio0>;
+        interrupts = <4 IRQ_TYPE_EDGE_RISING>;
+        reset-gpios = <&gpio 17 GPIO_ACTIVE_LOW>;
+
+        gestures {
+          swipe_up {
+            cst816x,gesture = <0x1>;
+            linux,code = <BTN_FORWARD>;
+          };
+
+          swipe_down {
+            cst816x,gesture = <0x2>;
+            linux,code = <BTN_BACK>;
+          };
+
+          swipe_left {
+            cst816x,gesture = <0x3>;
+            linux,code = <BTN_LEFT>;
+          };
+
+          swipe_right {
+            cst816x,gesture = <0x4>;
+            linux,code = <BTN_RIGHT>;
+          };
+
+          single_tap {
+            cst816x,gesture = <0x5>;
+            linux,code = <BTN_TOUCH>;
+          };
+
+          long_press {
+            cst816x,gesture = <0xC>;
+            linux,code = <BTN_TOOL_TRIPLETAP>;
+          };
+        };
+      };
+    };
+
+...
-- 
2.34.1


