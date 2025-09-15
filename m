Return-Path: <linux-input+bounces-14733-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 1FBA9B57EC3
	for <lists+linux-input@lfdr.de>; Mon, 15 Sep 2025 16:22:21 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 35D9B3A9540
	for <lists+linux-input@lfdr.de>; Mon, 15 Sep 2025 14:20:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 02A2C31D74F;
	Mon, 15 Sep 2025 14:20:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="R1EoUba4"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-wm1-f66.google.com (mail-wm1-f66.google.com [209.85.128.66])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E645931D731
	for <linux-input@vger.kernel.org>; Mon, 15 Sep 2025 14:20:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.66
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757946014; cv=none; b=i1ojrAbEB4XE7g82/A1DXzWV+jnZ6pvX36aTY7yCguELg+08PimPGARrE+u1loopSA7ep7ICX7Jw//7IhaQ2wEs3KuJrF+1mrgCFXYLnE0EhWl9ADuz6nmiO5NxDGQcY/hPv2b/rMU6zo6qt2iNSe1kIk1CtZPXxwMbmcQZHRGs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757946014; c=relaxed/simple;
	bh=8Qnm3ZHlu5D9iJRuLjIbduVppAN2k0oBQs6Ewj9hYZ4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=GmWDop3EHSBlNK60GdnRaVn0tu5/fo3JnolMIZgXXi2XYYw5wK3+SOdBlu1CYLq356fhsZ+kMb7JraT5nh1Pr8MgNvghyrvO9AO5JCganeRE0nLcEwypyMw4MdzGj/wv2UYT7g8k49jk53Zzxhxh9d5EWn/XE5GibiEZE6H/uJA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=R1EoUba4; arc=none smtp.client-ip=209.85.128.66
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f66.google.com with SMTP id 5b1f17b1804b1-45decc9e83eso46636855e9.3
        for <linux-input@vger.kernel.org>; Mon, 15 Sep 2025 07:20:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1757946011; x=1758550811; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=6BaeP+u139pVz62zC0j4CWHyJGRFuQubU7wGhgVzl9I=;
        b=R1EoUba4vyWzx//sQNU4jdYKU/y/xQSKScw5wRU6V8ZYJ+OSEpsVAogeWLCrnVRqM+
         zthFjYbMiM9yTwN0oRtyJyNOb2XSrRxvLawJaoJ7sLUgn39WE9KwNPyrtyh3D5fiBWv0
         y98VDyugUFBy7NACYJDfuTJ22FIK8XchhmLLXBF9QWzj54ISJJA7hcBQweXtKoii8Xof
         VYTbDMYMai+WMS6KbV5getJNTdO0aqL2v01VaD21nfidscWTVpv5GuvI1NaVlEhiDiIZ
         fxe3VnvmEyDBhj3sWEFZvwpC1wvRneSV445IIo0chbUTWPpPHBL/s9Nlr/obW3i+hVE0
         +RKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757946011; x=1758550811;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6BaeP+u139pVz62zC0j4CWHyJGRFuQubU7wGhgVzl9I=;
        b=QIstNKsdofYwcYl+f3Vywi970W6UhgSnbVTEg+sTRomEImcoE0khCwaTYri0IMViy3
         oXcHn6joAbr21EivBb280jl59Bm+E5A98Ul2d4vbxu33Br4bkfJAg1rdY9M3KKI56dav
         jCL+Yiv1Zx4ILu9fyjbYLzS5O241TbhUP17OeCZXUdsOdGn5YavmO+ABKaUgtosgwUcn
         6rCgJnqAynEA8SK9NUxgJ1HCsxRarpnTsVO8HA8569jPHUtKHJRZGB7Dq6duXzPCJ3r5
         mCLipt0trD5+c7PM+BHLKAQW41vCKZVRa1QSoNP0ARoRNqba5R01wmbyg6gorou0iI3P
         S8iQ==
X-Forwarded-Encrypted: i=1; AJvYcCUmbofVNJN/VVgxmzoCh7O/RRb131zu0Ceaeq3mG+ilcPaqtZsPJX0txpKh49UtxGGIy/31xz6H0mPENA==@vger.kernel.org
X-Gm-Message-State: AOJu0Ywe5R1KDAfjDfN58rNxrF+MNzn5GW1vZyGiCYcAvlimoL4h6L+5
	9jh6XJdRu058GyeDk1CJ0gjhKgupGbXdcHyw6V1OTZyk9lGqh5tQUAIEq7V4qnfY7/OR164KOzF
	dn+D9DQpAMg==
X-Gm-Gg: ASbGncv7pVb3H1xIUVq93mVCPcsqLvzbqBRfRKfeImm9QVHqol/ylJpMMsTHDmrFc04
	EW5HdzRNapvGXTpKiWGm98sBavbIWgZz9prJQo1wxwFQyvj2FejCiYjn7npaDNB9B1jmfmpqcFb
	IEGeykhOyQB0di9iXM/6R69zzCEpFOaeZowNC4UFkFi79Va6fWXHjiuF0flPCSPEDaZxua1+aaH
	mt4z+HGEQ5YGdB7n795cOysivKzsITs9l+qixth86HPab2MUSp5Eet+kVw+f5bNHOI6D1RxbpUM
	ZS7J7hVpupDZvU6BXjJynSMpFUdHVgjiFLb/NLjdNSlJ6+IWd0sUWYqT+l1lVYb/LHpSbJqsU5z
	DeHcEoQ/mPd2buLEvZT30mD9Ch0VIXt+qwgk=
X-Google-Smtp-Source: AGHT+IHX7I6b0UJWPq4ArFJRqvCVjzHn8Mc/xKDrgkX25TYBbgOR2ULGGsJQIolv1a5OJ2m+Eq3Qxg==
X-Received: by 2002:a05:600c:1384:b0:458:b01c:8f with SMTP id 5b1f17b1804b1-45f211cc941mr129811515e9.8.1757946011048;
        Mon, 15 Sep 2025 07:20:11 -0700 (PDT)
Received: from [127.0.0.2] ([2a02:2454:ff21:41:eee1:5042:e713:2e9a])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3e7ff9f77c4sm11801928f8f.27.2025.09.15.07.20.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Sep 2025 07:20:10 -0700 (PDT)
From: Stephan Gerhold <stephan.gerhold@linaro.org>
Date: Mon, 15 Sep 2025 16:19:56 +0200
Subject: [PATCH v5 1/2] dt-bindings: input: touchscreen: document Himax
 HX852x(ES)
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250915-hx852x-v5-1-b938182f1056@linaro.org>
References: <20250915-hx852x-v5-0-b938182f1056@linaro.org>
In-Reply-To: <20250915-hx852x-v5-0-b938182f1056@linaro.org>
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Henrik Rydberg <rydberg@bitmath.org>, 
 Jeff LaBundy <jeff@labundy.com>, 
 Jonathan Albrieux <jonathan.albrieux@gmail.com>, 
 linux-input@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Stephan Gerhold <stephan@gerhold.net>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.14.2

From: Stephan Gerhold <stephan@gerhold.net>

Himax HX852x(ES) is a touch panel controller with optional support
for capacitive touch keys.

Unfortunately, the model naming is quite unclear and confusing. There
seems to be a distinction between models (e.g. HX8526) and the "series"
suffix (e.g. -A, -B, -C, -D, -E, -ES). But this doesn't seem to be
applied very consistently because e.g. HX8527-E(44) actually seems to
belong to the -ES series.

The compatible consists of the actual part number followed by the
"series" as fallback compatible. Typically only the latter will be
interesting for drivers as there is no relevant difference on the
driver side.

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Signed-off-by: Stephan Gerhold <stephan@gerhold.net>
---
 .../bindings/input/touchscreen/himax,hx852es.yaml  | 81 ++++++++++++++++++++++
 1 file changed, 81 insertions(+)

diff --git a/Documentation/devicetree/bindings/input/touchscreen/himax,hx852es.yaml b/Documentation/devicetree/bindings/input/touchscreen/himax,hx852es.yaml
new file mode 100644
index 0000000000000000000000000000000000000000..40a60880111de7f4994cd73457bb8a1d4bfd6a88
--- /dev/null
+++ b/Documentation/devicetree/bindings/input/touchscreen/himax,hx852es.yaml
@@ -0,0 +1,81 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/input/touchscreen/himax,hx852es.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Himax HX852x(ES) touch panel controller
+
+maintainers:
+  - Stephan Gerhold <stephan@gerhold.net>
+
+allOf:
+  - $ref: touchscreen.yaml#
+
+properties:
+  compatible:
+    items:
+      - enum:
+          - himax,hx8525e
+          - himax,hx8526e
+          - himax,hx8527e
+      - const: himax,hx852es
+
+  reg:
+    maxItems: 1
+
+  interrupts:
+    maxItems: 1
+    description: Touch Screen Interrupt (TSIX), active low
+
+  reset-gpios:
+    maxItems: 1
+    description: External Reset (XRES), active low
+
+  vcca-supply:
+    description: Analog power supply (VCCA)
+
+  vccd-supply:
+    description: Digital power supply (VCCD)
+
+  touchscreen-inverted-x: true
+  touchscreen-inverted-y: true
+  touchscreen-size-x: true
+  touchscreen-size-y: true
+  touchscreen-swapped-x-y: true
+
+  linux,keycodes:
+    minItems: 1
+    maxItems: 4
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
+    #include <dt-bindings/input/input.h>
+    #include <dt-bindings/interrupt-controller/irq.h>
+
+    i2c {
+      #address-cells = <1>;
+      #size-cells = <0>;
+
+      touchscreen@48 {
+        compatible = "himax,hx8527e", "himax,hx852es";
+        reg = <0x48>;
+        interrupt-parent = <&tlmm>;
+        interrupts = <13 IRQ_TYPE_LEVEL_LOW>;
+        reset-gpios = <&tlmm 12 GPIO_ACTIVE_LOW>;
+        vcca-supply = <&reg_ts_vcca>;
+        vccd-supply = <&pm8916_l6>;
+        linux,keycodes = <KEY_BACK KEY_HOMEPAGE KEY_APPSELECT>;
+      };
+    };
+
+...

-- 
2.50.1


