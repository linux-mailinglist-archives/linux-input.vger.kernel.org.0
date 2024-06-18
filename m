Return-Path: <linux-input+bounces-4406-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id D3D3190C75A
	for <lists+linux-input@lfdr.de>; Tue, 18 Jun 2024 12:42:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 7DD3B1F23288
	for <lists+linux-input@lfdr.de>; Tue, 18 Jun 2024 10:42:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A77AB1B29D5;
	Tue, 18 Jun 2024 08:45:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="OYd+vWSR"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-pg1-f176.google.com (mail-pg1-f176.google.com [209.85.215.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4525D1B29D0;
	Tue, 18 Jun 2024 08:45:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718700338; cv=none; b=SmaaEN8eGJuJ6KT3CWx0b89ZHklwJpJ+aefpwtzQ8Bp1w2rPvo6vd8gTRza1ZALsICxyKfq9hTQw9yc6qYCiZB4ndzI64I1aRmEtX/VdzNx1yn/zydbzivSXTL4S3EaLLgMK/ld7e1o4kGVCRPgiz81Lb/5xYHS7IsAtAT84lDQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718700338; c=relaxed/simple;
	bh=Ub2t5qgnVuYavC7VQAm85YrqoVdqUssH3S//S9iqBJQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=H/cZL2NJ0mqN1ECozkLuXBGLX4rXhAlHSwLQOs+PXOYC1uVaYu602k8fW3jfirRMCaM4zf96SY/XSMYBXAFnwAYvqhfoWcIXihbsBlMbn4b3pGTI+sAx4HKHQxlQaH8BuFWP0hhLpP69umMCTx72X1TC4FkCpEWiMTG4dsyoMho=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=OYd+vWSR; arc=none smtp.client-ip=209.85.215.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pg1-f176.google.com with SMTP id 41be03b00d2f7-70df2135439so510671a12.1;
        Tue, 18 Jun 2024 01:45:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1718700336; x=1719305136; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FJ+TjqmXNAK43jB7MBhqEVQ50qkv8Dim6eWBP6KRcNw=;
        b=OYd+vWSRTnAz/ld1HgW+PLX+BwIPEnrZjO4dgLzF1QBFqUOCdJbB9Gp7AndrMVmtbk
         oHxnDYmf0X9BZFpz7pVrNEzRAvx+NCb0k5ZareVeJvKHKAoWbZ310W9zJkMHCIub5h+y
         u43Rf6xaoq0maJzuEmkAb32npx1U+jt0RkRSEnNXQAqn/34DHqJ4c59bDQZ6f2WqmAKH
         FNtzOdKLjqkWONMdjRSdHgZ6DM6xpiaOxJ9e8BdlgTNfgWAgwfl/Hr1kmOyhZ3KNJAqt
         APIQvD/+m0CBumcZPpeKqEp70DigEgQwWGPPEcYfHAM8qVzMgqDirlWiPNv5mKIvkjO9
         nA/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718700336; x=1719305136;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=FJ+TjqmXNAK43jB7MBhqEVQ50qkv8Dim6eWBP6KRcNw=;
        b=P2YuZFXs9ogHmFuVypACaP7tn7RWT+XECzmE/HCiizJwxd+KhV9OzGTsZhn+Qa0eEs
         NW3Q/hmHpkWGn+KZLDOvi2bY0Isri33tonsFgE636cTFczXWftV6bkqLmt+xX9+cdye9
         HJ3FtVDbA1KCfTPMtCqmvDVmFzl0V1j6mTG2KtMeofiMi6d3Go2Yazio6+DCyNMWTXpg
         w7s/g42y4L6l+0jF/p3sHwl4TOFD3oBqYkvUUcqNKfCEJ0bfTkoB48uENekUs9mxjG5Q
         mX/8FklnhD9Cx8Vk0R/iy7LYRHcpYb5ufC4e9K9FhV6jDyWAeOjFQNtDEz5XrilSloqy
         3nvA==
X-Forwarded-Encrypted: i=1; AJvYcCVZeXDugp/gjP7pOiWpUiKqWn5lUi0XA2ls2SHY9EM+n0PibJu4hEx8VKUWi5/fjCc9qACPzWMd3lFP6Sb6c1XGED+ztu2BtWVvboB0kp5E9+j53xD8asqF+2ha5pW1XQRBS4UXhK46A7XI1kbkvPnRM5ShLbHtjtnFUP45lqbHoj5Si3kh
X-Gm-Message-State: AOJu0Yx3+sJsmgOnKsJ+siaTCcbfHBziJD2P0GP6TdH2TPSYw5cSEEO+
	nRBPPbRRyK3gm0P1hAHkeh/WD0gq/ogeGNg3al4907D4ge+Wev1x
X-Google-Smtp-Source: AGHT+IEryfGSzXjrlttUGddNvEl6FX2UUW/ArpGmiA4CDMaySQs8sYgiC7k96SsbEhTr5VP+5YLBUA==
X-Received: by 2002:a05:6a20:914b:b0:1b2:a94d:4eca with SMTP id adf61e73a8af0-1bae823dc94mr12205677637.41.1718700336276;
        Tue, 18 Jun 2024 01:45:36 -0700 (PDT)
Received: from ux-UP-WHL01.. (mailgw01.goodix.com. [45.117.96.243])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-705ccb6b4efsm8512152b3a.151.2024.06.18.01.45.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 18 Jun 2024 01:45:35 -0700 (PDT)
From: Charles Wang <charles.goodix@gmail.com>
To: dmitry.torokhov@gmail.com,
	dan.carpenter@linaro.org,
	conor@kernel.org,
	robh@kernel.org
Cc: dianders@chromium.org,
	krzk+dt@kernel.org,
	jikos@kernel.org,
	bentiss@kernel.org,
	hbarnor@chromium.org,
	linux-input@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Charles Wang <charles.goodix@gmail.com>
Subject: [PATCH v5 2/2] dt-bindings: input: Goodix SPI HID Touchscreen
Date: Tue, 18 Jun 2024 16:44:54 +0800
Message-ID: <20240618084455.1451461-3-charles.goodix@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240618084455.1451461-1-charles.goodix@gmail.com>
References: <20240618084455.1451461-1-charles.goodix@gmail.com>
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
 .../bindings/input/goodix,gt7986u.yaml        | 72 +++++++++++++++++++
 1 file changed, 72 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/input/goodix,gt7986u.yaml

diff --git a/Documentation/devicetree/bindings/input/goodix,gt7986u.yaml b/Documentation/devicetree/bindings/input/goodix,gt7986u.yaml
new file mode 100644
index 000000000..25a26b4ce
--- /dev/null
+++ b/Documentation/devicetree/bindings/input/goodix,gt7986u.yaml
@@ -0,0 +1,72 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/input/goodix,gt7986u.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: GOODIX GT7986U SPI HID Touchscreen
+
+maintainers:
+  - Charles Wang <charles.goodix@gmail.com>
+
+description: Supports the Goodix GT7986U touchscreen.
+  This touch controller reports data packaged according to the HID protocol,
+  but is incompatible with Microsoft's HID-over-SPI protocol.
+
+allOf:
+  - $ref: /schemas/spi/spi-peripheral-props.yaml#
+
+properties:
+  compatible:
+    enum:
+      - goodix,gt7986u
+
+  reg:
+    maxItems: 1
+
+  interrupts:
+    maxItems: 1
+
+  reset-gpios:
+    maxItems: 1
+    description: reset gpio the chip is connected to.
+
+  goodix,hid-report-addr:
+    $ref: /schemas/types.yaml#/definitions/uint32
+    description: |
+      The register address for retrieving HID report data.
+      This address is related to the device firmware and may
+      change after a firmware update.
+
+  spi-max-frequency: true
+
+additionalProperties: false
+
+required:
+  - compatible
+  - reg
+  - interrupts
+  - reset-gpios
+  - goodix,hid-report-addr
+
+examples:
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
+      };
+    };
+
+...
-- 
2.43.0


