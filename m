Return-Path: <linux-input+bounces-15988-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E004C4BB15
	for <lists+linux-input@lfdr.de>; Tue, 11 Nov 2025 07:39:28 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 7BC594E8E4E
	for <lists+linux-input@lfdr.de>; Tue, 11 Nov 2025 06:39:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1609A2DC331;
	Tue, 11 Nov 2025 06:39:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=pegatron-corp-partner-google-com.20230601.gappssmtp.com header.i=@pegatron-corp-partner-google-com.20230601.gappssmtp.com header.b="KUE6pxN/"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-pf1-f179.google.com (mail-pf1-f179.google.com [209.85.210.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A15B2DBF5E
	for <linux-input@vger.kernel.org>; Tue, 11 Nov 2025 06:39:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762843152; cv=none; b=D10xe5XHjHpMq7nTFnwsAWfL872R9r+5htt0qz/anJyvH4Dbd+hk/DUIn0Um8Waa82DsVRFOcM86fK3BTIYdmAz97PVShRwjIBoWgtq0usQ/toVwAWMZYNGYLRrfn6qu634OuFTDst+UPb3uGoxT1uzDrL+80YSBl+7pAvPf/r0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762843152; c=relaxed/simple;
	bh=76ABllftNutziPZMfTsAUOfZ4NSqPsrwSGo7hCu81bQ=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=OONtTXFx+tMAUa99qZAyHYI/vvi7I5sCJmO4gtqIiGiTP9mg9iEpfDuKDP8T/Ds0saAZ6TK0aAIWvT180Ogckn3YWcYGqJG3NIh+mndCRAHRVWtS3tXhGrCGxzalEc/UJTHDfAUBya+cCZCB0hoPWYz33eQeK/qA3a1t8UoYKX4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=pegatron.corp-partner.google.com; spf=pass smtp.mailfrom=pegatron.corp-partner.google.com; dkim=pass (2048-bit key) header.d=pegatron-corp-partner-google-com.20230601.gappssmtp.com header.i=@pegatron-corp-partner-google-com.20230601.gappssmtp.com header.b=KUE6pxN/; arc=none smtp.client-ip=209.85.210.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=pegatron.corp-partner.google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pegatron.corp-partner.google.com
Received: by mail-pf1-f179.google.com with SMTP id d2e1a72fcca58-7b0246b27b2so4112217b3a.0
        for <linux-input@vger.kernel.org>; Mon, 10 Nov 2025 22:39:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=pegatron-corp-partner-google-com.20230601.gappssmtp.com; s=20230601; t=1762843148; x=1763447948; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=0TxzvcO8Ijul3ALJ59ZtrQlKnZ0E0zof1tiecvpAdh0=;
        b=KUE6pxN/2usja5SEEKiQl6lYp4Fpb96ubwL9vmzDOsrK+mMCLhpvEdaB4q4NLcYIVn
         lPZ+2K56pZ5uF/Djrg2BNaeolH4g9ZIjUZHJN2/SGoAv35yt8hnaVjMkCIR+zWk2mqtx
         ZATxB/jeijnrQtCimMBkqPKhi5AFad6Q7kSdl+54BgmI/QtOAe/1d0TcL18bE2W96bRv
         gm4wDUdmHLNiDYXKNkyUJBHUwder/JQuwQMq15FKi0UZDHfS8IjUFHTBgs7daEV6j/wM
         X1WLjgIOKpt5qYnZjJ4GIVFxBBKbXPGayz0HYfV9N/php1w0YB47lkhhsnkJjFv2veSM
         lTtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762843148; x=1763447948;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0TxzvcO8Ijul3ALJ59ZtrQlKnZ0E0zof1tiecvpAdh0=;
        b=vv7i2ZVfUfzFSc+cMW5Uq0KdhH+w2dQ7tQ1x8J2nul0jJrUwBRawStcytTUqfdaZCy
         rfNVOj+nAY/s/uj6HmHTDkjPb/Jph/FJXcqNlZ73jh+UQcmOzsPrtqfJrsUKWo8Pw+Vs
         gQG7Whviy8/Qgdzyh865tl8o4gnKP6P/5KuUja936TdJnqjNoEwjQY/MVUQjsoVlnuXs
         ONE8RGgplrtqVHHxre5UUn6wgspI6XxF3S3XQ7eYS6zJvd/gJL/OvUUI/b6v84FhS1Td
         srnQaXavkXdrERQOS1X70TcuW4X8xilESJh28aXaFdA092b7q9qiMoFQsUB79ASMj8lY
         /EUw==
X-Forwarded-Encrypted: i=1; AJvYcCWyQJqCk5x9nSkqFY98mcQQ4UdLBadmiol7xGrlldc8KwDGzyrjOAuih1YjAjWYbCI8JRrn6RGW892u2Q==@vger.kernel.org
X-Gm-Message-State: AOJu0Yy/Grnfu74mth4BdJt49iLUIKhtOCI4DQ/qWgylMwOVQbgpVwzV
	iCoS8Y4/qmG6M/LNoZYgiJLCsuEGhMuL+13ZxXaNX2SfbCCzD/fercq0uyPHwNvxaVjevQfLmJK
	iQhw=
X-Gm-Gg: ASbGncsTdOWqAfP1camrfGgefHnssNWDElMHdFUNO75epceE55sb2DxuXPhR2k7Az9l
	fPYRRb+sOcgDEJmxg9v0urQ1Asbez2z0ZTnkU9l0yy5eK+bi66v/h9aUFGqeg2RqQzzrT0XS33W
	RgE6L6dBWc0VYZWeVGZR1NF+UUKi/czZsaliGayroaepJEoBliW4tYgHoUIJPmNVkyp5+IsmIqJ
	F24oKB5ODrFY8VLFX69Cg/rXOn4yKndeAlsICCr8fWcgWd/tOy/TgY4LB2Ep6WcWjL7qbpemaEj
	mrLel5Hkg/6YIqlYEOQBJVFL7RVph3AM+rqpXmNJ3hYOWXza0V0UP7BcqrhEXbD05Y7Cn6+2tvg
	LasZ/4SSWzimKEfqRktjzEDN2TG66Lg4/yWfHqZnng8OkqtLrZm5UaTdHR3CghdqCn5XgG5EB15
	FySWYjOgWzw6FqsnxjnD3Ljf9FifK3B5IwXXVHlXvaypBPWTRnim++UCe4edWEGwjumAyM5Onym
	Vhp4S5HkMGJgfjWo9jBqu3fg7W2yu8+R3IhRNoJx2wtKYGBu/C7yXguwawm8P0T7ACArYc=
X-Google-Smtp-Source: AGHT+IG5KqPahXbbmibL5vikOZZx0fOqdq9+WZQW+1be30DeSfCc7ofE7W/ExoFor7vmsaV/es1lpA==
X-Received: by 2002:a17:90b:4a4d:b0:340:dd2c:a3d9 with SMTP id 98e67ed59e1d1-3436cb29cafmr17037940a91.12.1762843148630;
        Mon, 10 Nov 2025 22:39:08 -0800 (PST)
Received: from sw-TUF-Gaming-FX505GU-FX505GU.. (2001-b400-e2ac-65d6-f177-1588-49fc-6b55.emome-ip6.hinet.net. [2001:b400:e2ac:65d6:f177:1588:49fc:6b55])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-ba8f9ed1e73sm15237243a12.12.2025.11.10.22.39.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Nov 2025 22:39:08 -0800 (PST)
From: daniel_peng@pegatron.corp-partner.google.com
X-Google-Original-From: Daniel_Peng@pegatron.corp-partner.google.com
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	linux-input@vger.kernel.org
Cc: LKML <linux-kernel@vger.kernel.org>,
	Daniel Peng <Daniel_Peng@pegatron.corp-partner.google.com>,
	Conor Dooley <conor+dt@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Rob Herring <robh@kernel.org>,
	devicetree@vger.kernel.org
Subject: [PATCH 1/2] dt-bindings: input: i2c-hid: Introduce FocalTech FT8112
Date: Tue, 11 Nov 2025 14:38:59 +0800
Message-Id: <20251111143853.1.I76ee34ac45e1469dbeb11de0d1e47d794af7dc88@changeid>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Daniel Peng <Daniel_Peng@pegatron.corp-partner.google.com>

The FocalTech FT8112 touch screen chip same as Ilitek ili2901 controller
has a reset gpio. The difference is that they have different
post_gpio_reset_on_delay_ms.
FocalTech FT8112 also uses 3.3V power supply.

Signed-off-by: Daniel Peng <Daniel_Peng@pegatron.corp-partner.google.com>
---

 .../bindings/input/focaltech,ft8112.yaml      | 66 +++++++++++++++++++
 MAINTAINERS                                   |  1 +
 2 files changed, 67 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/input/focaltech,ft8112.yaml

diff --git a/Documentation/devicetree/bindings/input/focaltech,ft8112.yaml b/Documentation/devicetree/bindings/input/focaltech,ft8112.yaml
new file mode 100644
index 000000000000..114288787c98
--- /dev/null
+++ b/Documentation/devicetree/bindings/input/focaltech,ft8112.yaml
@@ -0,0 +1,66 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/input/focaltech,ft8112.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: FocalTech FT8112 touchscreen controller
+
+maintainers:
+  - Dmitry Torokhov <dmitry.torokhov@gmail.com>
+
+description:
+  Supports the FocalTech FT8112 touchscreen controller.
+  This touchscreen controller uses the i2c-hid protocol with a reset GPIO.
+
+allOf:
+  - $ref: /schemas/input/touchscreen/touchscreen.yaml#
+
+properties:
+  compatible:
+    enum:
+      - focaltech,ft8112
+
+  reg:
+    maxItems: 1
+
+  interrupts:
+    maxItems: 1
+
+  panel: true
+
+  reset-gpios:
+    maxItems: 1
+
+  vcc33-supply: true
+
+  vccio-supply: true
+
+required:
+  - compatible
+  - reg
+  - interrupts
+  - vcc33-supply
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/gpio/gpio.h>
+    #include <dt-bindings/interrupt-controller/irq.h>
+
+    i2c {
+      #address-cells = <1>;
+      #size-cells = <0>;
+
+      touchscreen@38 {
+        compatible = "focaltech,ft8112";
+        reg = <0x38>;
+
+        interrupt-parent = <&pio>;
+        interrupts = <15 IRQ_TYPE_LEVEL_LOW>;
+
+        reset-gpios = <&pio 126 GPIO_ACTIVE_LOW>;
+        vcc33-supply = <&pp3300_tchscr_x>;
+      };
+    };
diff --git a/MAINTAINERS b/MAINTAINERS
index ddecf1ef3bed..69f54515fe98 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -12326,6 +12326,7 @@ T:	git git://git.kernel.org/pub/scm/linux/kernel/git/dtor/input.git
 F:	Documentation/devicetree/bindings/input/
 F:	Documentation/devicetree/bindings/serio/
 F:	Documentation/input/
+F:	drivers/hid/
 F:	drivers/input/
 F:	include/dt-bindings/input/
 F:	include/linux/gameport.h
-- 
2.34.1


