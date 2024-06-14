Return-Path: <linux-input+bounces-4355-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7408E908B76
	for <lists+linux-input@lfdr.de>; Fri, 14 Jun 2024 14:17:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id B03AEB215ED
	for <lists+linux-input@lfdr.de>; Fri, 14 Jun 2024 12:17:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 33E1219AA7A;
	Fri, 14 Jun 2024 12:16:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dGDPSqUN"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B4328197A8A;
	Fri, 14 Jun 2024 12:16:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718367397; cv=none; b=QP0ODZjHft0ATeGgtysAll32TdB2vNWXO+2aVVeRhHfmh43iHdpIRY3htHt26D9KI7w4qqZm8IhZ+ejTESQPgv/vlAU/XiRcNI4YKxOga9PWZyBXwBlMd1EtJ2CgmKbb6MamlKOOABaq3iP4wSgwpTVtBGuzkGnSX2GU+RLc5pM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718367397; c=relaxed/simple;
	bh=6+FqQk6IJEPdTq5FojDq/OcN9uOUPNYCEvrt4xZXs3I=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=UQmGpdgjqU0I87/S4I1HkbvDEkAI6F+YmoSTjB/JaElMtW1VKD9c0swRQrVbXeJEK1cqI7KaBTh1H5mp6DdyuPfXLcjkZirz01yZVRY9zf38hPnZK8jcZ0MfEz+OjPyb8U+KtjjTN/DgRDuYzY2M1MmLjnPljJC6zQbIpLQ3Knk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=dGDPSqUN; arc=none smtp.client-ip=209.85.214.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-1f44b594deeso20477475ad.2;
        Fri, 14 Jun 2024 05:16:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1718367395; x=1718972195; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9n0Qi/rwg6YnQEHXxkXWrr9MjK3SxHwTlzMqsij1QcE=;
        b=dGDPSqUN3chgGV1iP3ho+etAdmCN5q8HuyoGagsRQ8X/TcX3ttJhjEX1B8AmV6wyQ3
         jCDCvVoUPOiuhKoOCAkLQ3L0h6KkkFCfbO7pKwRmSmoe6Q+K0wWoWA7dIpdlutzlYhk9
         QztCiXzJ/6mxaHEQLk+kTlXAnhzEWfUAkUkBBfoaKmj1Sz3Q/p5UBaemzWQaxnd2MTRB
         faeEB5fcdAOH+Ur1uISibevVgmE0zAbgA2Gfz9CknH2fufN1SY+URtaMwxNn+xElcKZo
         H5d2ediQ8uQgTQvYk+mMEQ+76UK+EZXlWyZAZmRDVHhuqfRs91jD30pQL0YG16iPdDiJ
         Mm2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718367395; x=1718972195;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9n0Qi/rwg6YnQEHXxkXWrr9MjK3SxHwTlzMqsij1QcE=;
        b=jo0FDnD4keYQsb6S9GkIrxxBmJYTbZskBIrAq6REi/0Kd8bsxHXl+Gb0Ug0mJKsq3r
         bUzSgXz1I0Z6r/1tqBzZOSnBN8YWNjSNNQpji3LgUNLkBIJfl5PlYl/4ZDCCsuIqJ8WZ
         OwS24wrhHwwJDGc9259hRRDu3C5FvsAEI5y9X9avO+TTdmRKqd7aQBT3E0a6hhE0aMVj
         +UotUlP0R3/LduJaDKV2dB/xvtLe8eu0krtcTzSJsw5qXS53JsEfR0vvpxqrRReDVsXH
         HKlyO3ObiA//5wy5+jRpCllWPfa2dzZendc48vAECM7hA+ja4eHrCf7QnJoVL7ZuwIdk
         EAAQ==
X-Forwarded-Encrypted: i=1; AJvYcCVHraKw8bRnA/Pkwnb2kawuDWm2vLWfrwH5Lg+19JJtZz+uLjiPdx1TfKfDC4GItNCbAMEwaPQxt9Y1Pwf/EbvFARj6v535DZ4FFUthykxgl8mWUXUp7SKR5BKBXUDC5f/OhwX1CkVbOz8dyQQJCyXwu3TyojPPlFQbZe/yjUPNl9ht0W2E
X-Gm-Message-State: AOJu0YyhPLaZ4M1J+4z9AV3ZyBf35tFCAgdIYx/4ccF+WRwuh3CIC6Nn
	gELA3FgG1bSSkTdftlvZ4G57ItFA4aHK2i8QJ24or8yw/fD3lR/9
X-Google-Smtp-Source: AGHT+IEcqIxiQ+ySp+5x/j6b0Rg+YvhfCH/5o6qBVZoUVY4cJnPV+EJ8uIEgmXMKfyU4U/QSVcEz2A==
X-Received: by 2002:a17:902:6b09:b0:1f7:1006:9d53 with SMTP id d9443c01a7336-1f8627d49aamr21371705ad.37.1718367394876;
        Fri, 14 Jun 2024 05:16:34 -0700 (PDT)
Received: from ux-UP-WHL01.. ([120.237.109.178])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-1f855f40947sm30476035ad.276.2024.06.14.05.16.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 14 Jun 2024 05:16:34 -0700 (PDT)
From: Charles Wang <charles.goodix@gmail.com>
To: dmitry.torokhov@gmail.com,
	dan.carpenter@linaro.org
Cc: dianders@chromium.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	jikos@kernel.org,
	bentiss@kernel.org,
	hbarnor@chromium.org,
	linux-input@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Charles Wang <charles.goodix@gmail.com>
Subject: [PATCH v4 2/2] dt-bindings: input: Goodix SPI HID Touchscreen
Date: Fri, 14 Jun 2024 20:15:38 +0800
Message-ID: <20240614121538.236727-3-charles.goodix@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240614121538.236727-1-charles.goodix@gmail.com>
References: <20240614121538.236727-1-charles.goodix@gmail.com>
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
 .../bindings/input/goodix,gt7986u.yaml        | 65 +++++++++++++++++++
 1 file changed, 65 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/input/goodix,gt7986u.yaml

diff --git a/Documentation/devicetree/bindings/input/goodix,gt7986u.yaml b/Documentation/devicetree/bindings/input/goodix,gt7986u.yaml
new file mode 100644
index 000000000..1c518d03b
--- /dev/null
+++ b/Documentation/devicetree/bindings/input/goodix,gt7986u.yaml
@@ -0,0 +1,65 @@
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
+description:
+  Supports the Goodix GT7986U touchscreen.
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
+    description: the register address for retrieving HID report data.
+    $ref: /schemas/types.yaml#/definitions/uint32
+
+additionalProperties: false
+
+required:
+  - compatible
+  - reg
+  - interrupts
+  - goodix,hid-report-addr
+
+examples:
+  - |
+    #include <dt-bindings/interrupt-controller/irq.h>
+    #include <dt-bindings/gpio/gpio.h>
+    spi {
+      #address-cells = <1>;
+      #size-cells = <0>;
+      num-cs = <1>;
+      cs-gpios = <&gpio 2 GPIO_ACTIVE_HIGH>;
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
-- 
2.43.0


