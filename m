Return-Path: <linux-input+bounces-8006-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0712D9C393E
	for <lists+linux-input@lfdr.de>; Mon, 11 Nov 2024 08:50:53 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 5E230B20C0F
	for <lists+linux-input@lfdr.de>; Mon, 11 Nov 2024 07:50:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 11EDC15A85E;
	Mon, 11 Nov 2024 07:50:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="TRdRmAcf"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A3F014F9FF;
	Mon, 11 Nov 2024 07:50:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731311448; cv=none; b=RklJvPOsszU92gNnSoPx/XJcGfvoTMxx2cvfrApu0fN/eSiPvFdqnVFvR/g1H/dATbNsWJ0iStZW6Y5arpi5DO9gzZ+h+XhOiKDXZTLRSgQIomZvbgEMny5ui8wQhdNhXxyUCB2a0VIzEEWzC0/zCqXndZr6tk2CUuZiXRrd16s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731311448; c=relaxed/simple;
	bh=c5LXDOHqgbp8sLxi6WpE9EjjCFyLARC/UuHg3IkynPg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=bgQ51PB/2icPHB2V8SHYVRojdi1RduodFEs4kuPob+xQqqCy2bgxQtXh2cI5YYeDCl8FGx4s6jKM5hEQjJDMir1xpnPY1D7lH3sqhj1YI1IGTGVhKyE5W4icaCHB19oqOtP+00CHx4qBS4Txz3WlCTADXG0Gorti3Hx1iBJNqpM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=TRdRmAcf; arc=none smtp.client-ip=209.85.214.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f172.google.com with SMTP id d9443c01a7336-2110a622d76so37480935ad.3;
        Sun, 10 Nov 2024 23:50:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1731311446; x=1731916246; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=q99LSVNUTdGfCo2rfRXXSQHXLojNygf9nm8aXyJf0jA=;
        b=TRdRmAcfQ7amnLkxdgxoIG11Xgr9RHVmlJCoJnk4E6JkHQp+he2JDi+lRKhJxZKO5i
         3QLRCD5HXvkgPAnLYDNee7xZywrw1w44oCNBAPO7Y0bGic9Bm3OcbdZj68KauD95UCrO
         CKopNeFi7EoiU0en4IydUM0J7uyF/11Fw4IQbH2J9u/SS270G2Ze/aRCNKcnYQpO0efo
         iNf21DdqODVTB7eTIhOjcHDv5AWn3mEVzcdJfAibUlzJxhzdVp7q/2ARpjBSiKNuc6Gw
         jjMVvDfdiE16bKePOI+jlqUNrGJSN26bGkS8Q+B2QgMQLiUPKO31hRoWqjJjPZ6b3/AA
         2VWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731311446; x=1731916246;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=q99LSVNUTdGfCo2rfRXXSQHXLojNygf9nm8aXyJf0jA=;
        b=JU41QtJ6jqTeVLJ4J9HUZi7uI322WXfoBAwhTu6yjNFaPaOMe6SJQTDjtcVBzo7u5W
         1kfQKhsspFx4U82uBTB92qaZXbUyVUeI8noHQCWK9jnWcw+EndXQYsTOry9OFvlj20cG
         /M9bLZIw25JfmlH8Xw87GC5lAhKs5M8TL1dxXYxnVwio9IzALX4dFLIK9Q2Y/E3+r9Zp
         k8huGPS3R7N8i76RTg1Q4MscFQAxjPn7BnJWUq9h1JKMY7Y8F/4b3QGNRsLFaxK2fG5s
         rslsHT9nDQ6psi644UwNICsWYGz5+FVbG3ry04eQlYsD9BFQV4KWi/q0LqL610zl2vGh
         ptFQ==
X-Forwarded-Encrypted: i=1; AJvYcCUXpNJ6jEaBjl8bJfGS+429tNYENalsExPc3UMgOiHtqOtdJA+siW4ZUDOIiWuBD5j2oD6OVo48uzkM@vger.kernel.org, AJvYcCW/O7qOAMin6Lm7NqUqznJeB/k4mxox3/vYGJwNkZxG/9TzJFdCorpXf3yOLw7vQ5cm3cKc9XpMkmlkvNW8@vger.kernel.org, AJvYcCWG7eoFBlAzz3ET5825xs173Ru8g928hMdNBv391kIGeiZixSsFTDKPnKsLOFzq62bXxm+LiKE7xE0g/mY=@vger.kernel.org
X-Gm-Message-State: AOJu0YwTQw+r7pp8ENF1OMbhLTnC+qTiu3isgII9hgf9GQL2K8Q3Mh3f
	BDb2q5oyLjDTZGVP4nUDvz8lq/FcdrisUbSLwo3m1l2R68nQFuCZ
X-Google-Smtp-Source: AGHT+IGBZJeKmntDSJMRJeW50xKcjGO08RpShVU/7L/IDt7cawgxsxuBjMvAHzy+2m532BCPW1zwrA==
X-Received: by 2002:a17:90b:2792:b0:2cf:fe5d:ea12 with SMTP id 98e67ed59e1d1-2e9b177d820mr15688715a91.24.1731311445653;
        Sun, 10 Nov 2024 23:50:45 -0800 (PST)
Received: from ux-UP-WHL01.. (mailgw01.goodix.com. [45.117.96.243])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2e9a5feb222sm8951522a91.52.2024.11.10.23.50.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 10 Nov 2024 23:50:45 -0800 (PST)
From: Charles Wang <charles.goodix@gmail.com>
To: robh@kernel.org,
	krzk@kernel.org,
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
Subject: [PATCH v4 1/2] dt-bindings: input: Goodix GT7986U SPI HID Touchscreen
Date: Mon, 11 Nov 2024 15:49:59 +0800
Message-ID: <20241111075000.111509-2-charles.goodix@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241111075000.111509-1-charles.goodix@gmail.com>
References: <20241111075000.111509-1-charles.goodix@gmail.com>
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
 .../bindings/input/goodix,gt7986u-spifw.yaml  | 69 +++++++++++++++++++
 1 file changed, 69 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/input/goodix,gt7986u-spifw.yaml

diff --git a/Documentation/devicetree/bindings/input/goodix,gt7986u-spifw.yaml b/Documentation/devicetree/bindings/input/goodix,gt7986u-spifw.yaml
new file mode 100644
index 000000000..92bd0041f
--- /dev/null
+++ b/Documentation/devicetree/bindings/input/goodix,gt7986u-spifw.yaml
@@ -0,0 +1,69 @@
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
+description: |
+  Supports the Goodix GT7986U touchscreen.
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
+  spi-max-frequency: true
+
+required:
+  - compatible
+  - reg
+  - interrupts
+  - reset-gpios
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
+      };
+    };
+
+...
-- 
2.43.0


