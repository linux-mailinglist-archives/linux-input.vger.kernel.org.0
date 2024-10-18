Return-Path: <linux-input+bounces-7517-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 399E89A3267
	for <lists+linux-input@lfdr.de>; Fri, 18 Oct 2024 04:09:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id DAAD42850BC
	for <lists+linux-input@lfdr.de>; Fri, 18 Oct 2024 02:09:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 68F1F13D297;
	Fri, 18 Oct 2024 02:09:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jI+MAhWV"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-pf1-f182.google.com (mail-pf1-f182.google.com [209.85.210.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D60BA3C466;
	Fri, 18 Oct 2024 02:09:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729217378; cv=none; b=OHpTKKWfS/SKQLK/K2VjuntR2ir7k02yvT3Inp9IO72faoHv77mGiCCe03/anXpreiZ5Elg7Rv41lCqASZNhn0Y06dj9gZ0/kWMrUHKiACWIOCx+Q7UtPIlQHMXLNPYfvWiscT87a3c8SfcA6ZA60AEEZWV7YxLsf08ZcC5AhTQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729217378; c=relaxed/simple;
	bh=Fnq5E2/U8nIWkcbf+UWXQI58yc4QGrbB5RutID5ItnQ=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=gGmxmsRYC3e6g9oBBU0yCGKonUumbhRjhse+ZJ1ozA/Bpcb6LD15kUrWBoELCnxAuMsZvP94ueZEot5NPMnEilnSeutx0a8iwNOqqVv0yEGEfOEiNqi5Pme9SipejjAfiHcBIRGiR5YXPGp30c8M7o8mGROxMW83qFp7Jc7xSTQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jI+MAhWV; arc=none smtp.client-ip=209.85.210.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f182.google.com with SMTP id d2e1a72fcca58-71ea2643545so325667b3a.3;
        Thu, 17 Oct 2024 19:09:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1729217376; x=1729822176; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=XlKYpT7sDjUMgCx/siAW+uJ44M4eWiyd8shl3ylHezA=;
        b=jI+MAhWVHSPnlPymjOuV6Ak4DKkzvMwmPcosMhlt3+f5ugoSyBccRcnTHf70l8gD0C
         VlRreAVSItkcfcs+EMQ2o04WQ4dXt40au6Xfqj9VloNpJY1jW7KlxnPfl2/16xwMRPBC
         Fc7+DcVO0yN8jh+YGkxAZcxr+i6m8mDvnXwnHpw+CLwT9j3cHmvwguIyx0XGZyNKJHdj
         xoSO6wlMjVVmi4Ky0flcaFF38TZ/GFocTvsP/moqewvP8v24DHSsEChWpiAwzRcHtpwV
         8tQpijemQzBsLoC+Ufr3fWsYtzKAJvzeN2O9aTuEC9lZuVC/Dnre8DwqG0xHsBEGseKX
         m9ug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729217376; x=1729822176;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=XlKYpT7sDjUMgCx/siAW+uJ44M4eWiyd8shl3ylHezA=;
        b=M+euUF/JqT6PEIjQBYx11OxiEIFqpakCu61KEHvUqYhTAy8PrztlRmt1CmxBGysw+P
         maFQdTmp0Mow+DqV/OUgS9ZSVdbLShPoMAJT2qkr1AfxhYX/qd+acgaLiz8fkFys1vcp
         zDK7x6083pfKDs0fsTsEoqxOwXvY+NA1uVHIF0Ei8qyj3JpIa1w+0TpKhmMlOscuelnw
         0kTStXcNrZfZ6+XT607q69KQHxESd81yoVKXO0T85i297Sxy2YJCUkX8qwm6JOw/YRIw
         G2CI1gbBaKGu70HqrtzUPTBTz27uEdMf2exayQ5hpr55Z7zkCCZ2+qmYUqdn1h4i2dPd
         BIPg==
X-Forwarded-Encrypted: i=1; AJvYcCVz+3QJfcZnV0FcQlJ9t+KdbmKcMYpDzD6jdZFvWXTK3qZpUywzXTedGQ6fcfh6k834TPHcNCZJE1aG@vger.kernel.org, AJvYcCW27P5dKNFkeZtznsn9icuOJh0IjE+CqXbLWgtL/JBFgDemeCmrpMkgdXDIMQRjmcWTZi1yYeX4ImFmYfxu@vger.kernel.org, AJvYcCWBuyDyZnn/Op48xd0qRkc2PDLg6bkjwU4eo6+6s7cRLzg2Ouin33Db7DLKYZmYFD6+K6IWNKsV6vHIxk0=@vger.kernel.org
X-Gm-Message-State: AOJu0Ywg1Jl07EZbN1K0gxhIzKHNJOr8+CHMloXmsN5gEOMaQ+b5YOYo
	Db7Nvd/E9KmLnApFkPfHhxmOcsRCTgoe9qglNfFrXt3x4NOlWFR/
X-Google-Smtp-Source: AGHT+IGhvIvJfR3KxVucWt6Ck0IwS+TjchZgBqZOQcS5rEa9Cg408LnHLstnmWGDTNC00jmEI4MrIg==
X-Received: by 2002:a05:6a21:2d88:b0:1d4:fd63:95bc with SMTP id adf61e73a8af0-1d92c4a0507mr1455367637.9.1729217376037;
        Thu, 17 Oct 2024 19:09:36 -0700 (PDT)
Received: from ux-UP-WHL01.. ([240e:47e:2e70:4bab:d596:9c3a:e3cc:f02b])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-71ea33185b8sm354412b3a.34.2024.10.17.19.09.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Oct 2024 19:09:35 -0700 (PDT)
From: Charles Wang <charles.goodix@gmail.com>
To: krzk@kernel.org,
	dmitry.torokhov@gmail.com,
	hbarnor@chromium.org,
	dianders@chromium.org,
	conor.dooley@microchip.com
Cc: jikos@kernel.org,
	bentiss@kernel.org,
	linux-input@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Charles Wang <charles.goodix@gmail.com>
Subject: [PATCH] dt-bindings: input: Goodix SPI HID Touchscreen
Date: Fri, 18 Oct 2024 10:08:16 +0800
Message-ID: <20241018020815.3098263-2-charles.goodix@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The Goodix GT7986U touch controller report touch data according to the
HID protocol through the SPI bus. However, it is incompatible with
Microsoft's HID-over-SPI protocol.

Signed-off-by: Charles Wang <charles.goodix@gmail.com>
---
 .../bindings/input/goodix,gt7375p.yaml        | 68 ++++++++++++++++---
 1 file changed, 58 insertions(+), 10 deletions(-)

diff --git a/Documentation/devicetree/bindings/input/goodix,gt7375p.yaml b/Documentation/devicetree/bindings/input/goodix,gt7375p.yaml
index 358cb8275..184d9c320 100644
--- a/Documentation/devicetree/bindings/input/goodix,gt7375p.yaml
+++ b/Documentation/devicetree/bindings/input/goodix,gt7375p.yaml
@@ -8,27 +8,27 @@ title: Goodix GT7375P touchscreen
 
 maintainers:
   - Douglas Anderson <dianders@chromium.org>
+  - Charles Wang <charles.goodix@gmail.com>
 
 description:
-  Supports the Goodix GT7375P touchscreen.
-  This touchscreen uses the i2c-hid protocol but has some non-standard
-  power sequencing required.
-
-allOf:
-  - $ref: /schemas/input/touchscreen/touchscreen.yaml#
+  The Goodix GT7375P and GT7986U touchscreens support both SPI and I2C interfaces.
+  With the I2C interface, they use the i2c-hid protocol but require non-standard
+  power sequencing. With the SPI interface, they use a custom HID protocol that
+  is incompatible with Microsoft's HID-over-SPI protocol.
 
 properties:
   compatible:
     oneOf:
-      - const: goodix,gt7375p
+      - items:
+          - const: goodix,gt7375p
       - items:
           - const: goodix,gt7986u
           - const: goodix,gt7375p
+      - items:
+          - const: goodix,gt7986u
 
   reg:
-    enum:
-      - 0x5d
-      - 0x14
+    maxItems: 1
 
   interrupts:
     maxItems: 1
@@ -57,6 +57,15 @@ properties:
       This property is used to avoid the back-powering issue.
     type: boolean
 
+  goodix,hid-report-addr:
+    $ref: /schemas/types.yaml#/definitions/uint32
+    description:
+      The register address for retrieving HID report data.
+      This address is related to the device firmware and may
+      change after a firmware update.
+
+  spi-max-frequency: true
+
 required:
   - compatible
   - reg
@@ -64,6 +73,25 @@ required:
   - reset-gpios
   - vdd-supply
 
+allOf:
+  - $ref: /schemas/input/touchscreen/touchscreen.yaml#
+  - $ref: /schemas/spi/spi-peripheral-props.yaml#
+
+  - if:
+      properties:
+        compatible:
+          items:
+            - const: goodix,gt7986u
+    then:
+      required:
+        - goodix,hid-report-addr
+    else:
+      properties:
+        goodix,hid-report-addr: false
+        spi-max-frequency: false
+        reg:
+          enum: [0x5d, 0x14]
+
 additionalProperties: false
 
 examples:
@@ -87,3 +115,23 @@ examples:
         vdd-supply = <&pp3300_ts>;
       };
     };
+
+  - |
+    #include <dt-bindings/interrupt-controller/irq.h>
+    #include <dt-bindings/gpio/gpio.h>
+
+    spi {
+      #address-cells = <1>;
+      #size-cells = <0>;
+
+      touchscreen@0 {
+        compatible = "goodix,gt7986u";
+        reg = <0>;
+        interrupt-parent = <&gpio>;
+        interrupts = <25 IRQ_TYPE_LEVEL_LOW>;
+        reset-gpios = <&gpio1 1 GPIO_ACTIVE_LOW>;
+        spi-max-frequency = <10000000>;
+        goodix,hid-report-addr = <0x22c8c>;
+        vdd-supply = <&pp3300_ts>;
+      };
+    };
-- 
2.43.0


