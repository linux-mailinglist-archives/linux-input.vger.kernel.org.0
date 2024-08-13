Return-Path: <linux-input+bounces-5549-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 9485F9506B0
	for <lists+linux-input@lfdr.de>; Tue, 13 Aug 2024 15:38:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 5381C1F23192
	for <lists+linux-input@lfdr.de>; Tue, 13 Aug 2024 13:38:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BB67219D893;
	Tue, 13 Aug 2024 13:37:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fqmfTomK"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 429AA19CD01;
	Tue, 13 Aug 2024 13:37:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723556251; cv=none; b=kk9cZT/LW2FXKNJX9YIBFdA0cQT/PzqxoHpjJp3wQp1TwYOA2w0JYmjnSXG0xSoJo/AtCZbRrX2ut+ja25l9adq9GzMXaR6uTe2VzwzlrqjyI3De6+6gG8dnBeknb0JzZJcSdavM/VlxPrRk7DR1XC9S26R30PWirUFAgu6ZlVo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723556251; c=relaxed/simple;
	bh=76WTtItW0ojLKUiUb3R4LyhT2R6h+6vsf4cp8pm7TOU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Xv8iqLCiklsbt6qaT8baIoZXfc+y6nAcCZO/YP98YygRmKI4+uNicEC0WV9dziuUfg3Ctvl6/CQYZxOAEEAgYEjB7naJkzjjAeToIgaYtjk7XcoF2n/8P3wL8zegnm7brddDKrJEDlYmldLGQEHYt9x4SqGscPPDmmP/G6TaPN4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=fqmfTomK; arc=none smtp.client-ip=209.85.214.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-1fc4fccdd78so38981075ad.2;
        Tue, 13 Aug 2024 06:37:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1723556249; x=1724161049; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=imlFjsoISkuqzhmDA+Tr8PM1wAT+5MYWC2gCJow726k=;
        b=fqmfTomKAm34gqDMv9SITBliCUWpq5FvBNnG2+nWilhzI0MtqK/5HIWPl4fp3ehZoa
         Kjoh5fk+E3D+nfMGY5jobkY8T3Q04i/rwN/bCy0+foQsO4W8vmrZPSieUwwiWwmOEvhH
         bCbMrTciIK6PDJvTp4m8+Aj+zXY4du36J2YmkAMeCv0rAAtPQuHk7uCGjwEgTHTG8/xn
         oo3i92R3iYZD7TL046lm1Ss9eO49josQQob9r2MFchD5Zq7+vm+mfGq/xWXZlHjeYnvj
         vjxwkoAdfjeKAGmUd1AzAL/dUrsF7yIMcKJJaaNXvVwclEI/0W/oWN7/xX0iFfxpxSmg
         pWyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723556249; x=1724161049;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=imlFjsoISkuqzhmDA+Tr8PM1wAT+5MYWC2gCJow726k=;
        b=UFDs1drXIGYLQ0SM+aLWLsV0fnsRNriKeIRgVLIpJ8BmbxILDwtGv5NTIa0MxIWIaW
         I+Z6TTzoxEXtxjl/F6EXDTD6V/lxYo5k+acHVLDqQ843Whayye26LkQTm8Crp/cYGdDJ
         5cvzyRcNwfM0JVTXgS9bh13i6ULgVu7fc4i/JAWK1/XaDoGRbziSi6XzmNeQkImwzLAj
         BkAeP1mT0yh8/BQjMjj/EIF6h/tLuqbfe1Y3OkNNWFMt86ZsiM/sgnoVstSW+DkMW03Z
         u49ffwaKtQDUpbqn8YlHNe59xJ/FjWkLvtS34MSsDAvE+R0eyoDPYnQS2E2zJBJNyifN
         GOew==
X-Forwarded-Encrypted: i=1; AJvYcCVzSfOae86OYWa1sAt/2j2bu49ulWvWJ6Wf6oI2fgscNcLZB1o1KT3YMpqRXmsAzZuRI9YwHQAbRQMchhsqACg9AVxwXtoJICYWZnzpPHSaeBXfors/h+ycCc8HP0HlUx33rFqVE3AmsEKwF8rAuuVf675ojfpsEOXAOrFVcST6aOSsLFhj
X-Gm-Message-State: AOJu0YzgsP43Gs1hdiKqB0TZC0HPp8hBF87UrO3oCciVKjwYmTlXT4Rf
	au9ALzJRqjDmeNXl4+n+Xyd8H/fuGnzTkdc2R1e7W9HETdSve021
X-Google-Smtp-Source: AGHT+IHENCrXZlTzS49pR4gxuZBRDLttIi26/9zyU2wvM7l6twbZNKPI2YGECHlTxXuOF0mIvgAffw==
X-Received: by 2002:a17:902:ce06:b0:1ff:52c:34ce with SMTP id d9443c01a7336-201ca1cb2c4mr48423505ad.53.1723556249283;
        Tue, 13 Aug 2024 06:37:29 -0700 (PDT)
Received: from ux-UP-WHL01.. ([240e:47e:2ef8:4fc3:dde8:ca2c:7f06:eeca])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-201d3e23a56sm2529545ad.48.2024.08.13.06.37.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Aug 2024 06:37:28 -0700 (PDT)
From: Charles Wang <charles.goodix@gmail.com>
To: dmitry.torokhov@gmail.com,
	dianders@chromium.org,
	dan.carpenter@linaro.org,
	conor@kernel.org,
	robh@kernel.org
Cc: krzk+dt@kernel.org,
	jikos@kernel.org,
	bentiss@kernel.org,
	hbarnor@chromium.org,
	linux-input@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Charles Wang <charles.goodix@gmail.com>
Subject: [PATCH v6 2/2] dt-bindings: input: Goodix SPI HID Touchscreen
Date: Tue, 13 Aug 2024 21:36:12 +0800
Message-ID: <20240813133612.49095-3-charles.goodix@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240813133612.49095-1-charles.goodix@gmail.com>
References: <20240813133612.49095-1-charles.goodix@gmail.com>
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
 .../bindings/input/goodix,gt7986u.yaml        | 71 +++++++++++++++++++
 1 file changed, 71 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/input/goodix,gt7986u.yaml

diff --git a/Documentation/devicetree/bindings/input/goodix,gt7986u.yaml b/Documentation/devicetree/bindings/input/goodix,gt7986u.yaml
new file mode 100644
index 000000000..a7d42a5d6
--- /dev/null
+++ b/Documentation/devicetree/bindings/input/goodix,gt7986u.yaml
@@ -0,0 +1,71 @@
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
+
+  goodix,hid-report-addr:
+    $ref: /schemas/types.yaml#/definitions/uint32
+    description:
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


