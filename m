Return-Path: <linux-input+bounces-7981-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 144C69C1C92
	for <lists+linux-input@lfdr.de>; Fri,  8 Nov 2024 13:03:47 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 6678AB23AA2
	for <lists+linux-input@lfdr.de>; Fri,  8 Nov 2024 12:03:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B0E801E6DD4;
	Fri,  8 Nov 2024 12:03:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DjD0E+XF"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-pf1-f170.google.com (mail-pf1-f170.google.com [209.85.210.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A1A51E5721;
	Fri,  8 Nov 2024 12:03:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731067411; cv=none; b=SutuPj7cbkJQByxjPPLumbIu5lHfBLXdB/jm5q1grWTrlJN5/pEqN2YP8ONQLsFNHrwQ0A/1q5D6AE+pbsjWB3Slis3XrmSFaVGcM//uor25HXJ8WyvSJ2zC/X650uGHF2CVCxM8FutT3p+w5vB2SvX8eGHz79ZSGptjUBkJmzc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731067411; c=relaxed/simple;
	bh=kak8+PuARXuSGio98YkM2i1soiYRpSfGtPCyC+yBT+k=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=coa3eqXhxuwQDrlcVt8Vin8uq97fF7KjUzG0lCdGhhepGGJrRLW2cdiVP8IXcsDGiiJCk0ygFC/IFTvEFA4u7eqloY3tgq/IHwMdievOn5cUq6KwtEGRDmZN2x8vEmxqnBgpt+1PXafc9Tdo4mK/L1NnNxDf5iG5/F4IRMzG9vE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=DjD0E+XF; arc=none smtp.client-ip=209.85.210.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f170.google.com with SMTP id d2e1a72fcca58-71e953f4e7cso1584987b3a.3;
        Fri, 08 Nov 2024 04:03:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1731067409; x=1731672209; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yZV37t9uqIdEuftQYvw+4E0W0H36QIb6rckaStuSrGk=;
        b=DjD0E+XFFO0A614xX8hkWEQVbJu4G2l/ykFwvyu5BlYZ+z6JW8asVbyNEuUus7OF5V
         aXocO4On+Tl6DMr+kWK9C09txLjyxkVKm6zHPn7uWyv7SmvM0YMbSwYoHfxn1n301OGY
         63i6qI97jUHZCxjHuSRwj5SoaqAohI5DU5ytbjL/AmlMpF3WOQSme7Lcw9I5j0wOnoEV
         Zgz9m3HMx+viMDu3TjJRHT+KkJZM8fa5yzJp5YoinOTLHAUymvgv6mAX8EcEHJn0mny9
         ig+eT5el77MxeKpHNytOCr/y62M7JEawjLid5Pyde7cnvNiZVlFGLY4b1mWNB7+wxqYJ
         71Uw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731067409; x=1731672209;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=yZV37t9uqIdEuftQYvw+4E0W0H36QIb6rckaStuSrGk=;
        b=vJZyRrPne2KAxWmBOdNRHTds3sIzUyjtp6ml9UW7EIoNhTmxdMYAj/VSsC1H7EdRum
         WVQqcO1EITldBGzbtUzlmvV9DCDCjmWe1DKK4rG8BuWPznu1uWtWCvq68J0W2lHVSGT2
         zV6pNVca1PwKvf77m6zOfcxjCWPE7YShS5/rzZLTbKhy4rK/DXBAx5iB3s1IfCLkHVs3
         glEnQG6rfRT4arsKwyjBULdHDzpoT54PX2ZuSf0VDepUWUlGbT3TkXjeELAlANFApIr4
         KpHckrW/WsdCdo0Y7bFkyFpOyLhU9Jn7N4685SLETHZI9vB2Ql3YUB8wvVvS/vbrB8ez
         tOeA==
X-Forwarded-Encrypted: i=1; AJvYcCVM4BAp6chq6GN55bxEtrktMD3hZbEF8bbrPau1+os213rd76qNm/p6wAq9T+vw93OoP5raHlnWSPR9@vger.kernel.org, AJvYcCWvCMFJpAmdrAfFwaDuQmRW8hBXMvFzro/Ze+00t8rRvtZJvKQ9MXxlJWevWJ4pa4hcSNK6jWzAjvYN3hPq@vger.kernel.org, AJvYcCXpkfgS9AOS4hHuy9BF2POgmQlYAtqr2e1z2VUDbm5M+kj58qTI1ay679LiGNRkIfPKcpAp7Mmn958PIhs=@vger.kernel.org
X-Gm-Message-State: AOJu0YxyY5yKrWGf4TdczABoHhhfjChsANf4guBX3vNwUYESZeqZ54dL
	FueMAbn5jnxEE2GfS3MJ7MApaHgdsMVdIWbS70nIGG4ahd2UTqSY
X-Google-Smtp-Source: AGHT+IFlUSXTo3Pv11YDofY+SBId+3cHzgjsjrqsJm+1XkFwlp3IC7d9Z0BaPeUWROiMZiF2njptLw==
X-Received: by 2002:a05:6a00:234b:b0:720:9a03:b6dc with SMTP id d2e1a72fcca58-724133597c8mr3464195b3a.18.1731067409452;
        Fri, 08 Nov 2024 04:03:29 -0800 (PST)
Received: from ux-UP-WHL01.. (mailgw01.goodix.com. [45.117.96.243])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-724079a403fsm3579656b3a.105.2024.11.08.04.03.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 08 Nov 2024 04:03:29 -0800 (PST)
From: Charles Wang <charles.goodix@gmail.com>
To: krzk@kernel.org,
	hbarnor@chromium.org,
	dianders@chromium.org,
	conor.dooley@microchip.com
Cc: dmitry.torokhov@gmail.com,
	jikos@kernel.org,
	bentiss@kernel.org,
	linux-input@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Charles Wang <charles.goodix@gmail.com>
Subject: [PATCH v3 1/2] dt-bindings: input: Goodix GT7986U SPI HID Touchscreen
Date: Fri,  8 Nov 2024 20:03:10 +0800
Message-ID: <20241108120311.87795-2-charles.goodix@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241108120311.87795-1-charles.goodix@gmail.com>
References: <20241108120311.87795-1-charles.goodix@gmail.com>
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

NOTE: these bindings are distinct from the bindings used with the
GT7986U when the chip is running I2C firmware. For some background,
see discussion on the mailing lists in the thread:

https://lore.kernel.org/r/20241018020815.3098263-2-charles.goodix@gmail.com

Signed-off-by: Charles Wang <charles.goodix@gmail.com>
---
 .../bindings/input/goodix,gt7986u-spifw.yaml  | 75 +++++++++++++++++++
 1 file changed, 75 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/input/goodix,gt7986u-spifw.yaml

diff --git a/Documentation/devicetree/bindings/input/goodix,gt7986u-spifw.yaml b/Documentation/devicetree/bindings/input/goodix,gt7986u-spifw.yaml
new file mode 100644
index 000000000..8105b9ce2
--- /dev/null
+++ b/Documentation/devicetree/bindings/input/goodix,gt7986u-spifw.yaml
@@ -0,0 +1,75 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/input/goodix,gt7986u-spifw.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Goodix GT7986U SPI HID Touchscreen
+
+maintainers:
+  - Charles Wang <charles.goodix@gmail.com>
+
+description: Supports the Goodix GT7986U touchscreen.
+  This touch controller reports data packaged according to the HID protocol
+  over the SPI bus, but it is incompatible with Microsoft's HID-over-SPI protocol.
+
+  NOTE: these bindings are distinct from the bindings used with the
+  GT7986U when the chip is running I2C firmware. This is because there's
+  not a single device that talks over both I2C and SPI but rather
+  distinct touchscreens that happen to be built with the same ASIC but
+  that are distinct products running distinct firmware.
+
+allOf:
+  - $ref: /schemas/spi/spi-peripheral-props.yaml#
+
+properties:
+  compatible:
+    enum:
+      - goodix,gt7986u-spifw
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
+
+  spi-max-frequency: true
+
+required:
+  - compatible
+  - reg
+  - interrupts
+  - reset-gpios
+  - goodix,hid-report-addr
+
+unevaluatedProperties: false
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
+        compatible = "goodix,gt7986u-spifw";
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


