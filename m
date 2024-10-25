Return-Path: <linux-input+bounces-7698-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 96B1D9B0195
	for <lists+linux-input@lfdr.de>; Fri, 25 Oct 2024 13:47:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 1D0891F23B55
	for <lists+linux-input@lfdr.de>; Fri, 25 Oct 2024 11:47:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4153B201017;
	Fri, 25 Oct 2024 11:47:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Pf7Gcjx5"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com [209.85.218.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 016351B6D1E;
	Fri, 25 Oct 2024 11:47:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729856843; cv=none; b=HpE0LxCi7xEwGhZw1/c8wT7+d3Iqyc1ZaJ9yOeTCPDn7Qftc7cpP4909zf6CK3igSdCTWu28DUhwH0RXQuPqhj0p1JvuKBcYkhGP8DUpVjW62tx8t75wAveUxIZrvpBD6B9R5X2AwLWsJMo+sZjvGV93672JM4HPg65ZoFxanXc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729856843; c=relaxed/simple;
	bh=fLmrWU7t0THA1YaPb1LJ38jD7RQ7Xu0w4t7Bf0+HIVY=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=GhQiWMt2L/JvUYBMPbg/fudu3UGFjQ3YAMQogG5WFFHoJtGfMkqjB/9Yyalp401yYh5trQ6hLIoW32bUpG1dHQ80Vph+Ak0lBASgXSe/qVFHYK3f6wttOB+PFr7Dtva6aPKX7kWX8acNPoFRDx4/ckRBeJ6HCfpzjpAlLBIgBII=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Pf7Gcjx5; arc=none smtp.client-ip=209.85.218.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f50.google.com with SMTP id a640c23a62f3a-a9a0c7abaa6so227721166b.2;
        Fri, 25 Oct 2024 04:47:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1729856837; x=1730461637; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=sQW2K/wohTXmsw0+B0S6RKXga9qt5PMY2IPs92Yfwb4=;
        b=Pf7Gcjx5kx9+SsRE3Rc2aPpB+3twrj/bnp15uTz/RfirxnoR+QhIu1GInNxYvjmJkd
         TAmjaST3+mpOicAKg5IODhK+DVihV4RlZ1eykrWl5MAEMguZYVms0JqTaq2Cz+mMt+sI
         W8rMHsy2d8ZTDilifJZ6bIg0XuakCIkshOng6mfQ+98TPc8rYAmKdqOcngGxYdNV/Zqc
         37ZKH+kcSoEu6Qy2n7De2CYGuimHf2gflXF09OQH3j+7DlcSVDH8SpAnE68VcGAx/BVJ
         RcneeYsThgvyqU/Z+xmg6vr8J0wbTFKK7atP2RkEkEMygXO//QxEGs3c4Z+jmQjBsGli
         3XUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729856837; x=1730461637;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=sQW2K/wohTXmsw0+B0S6RKXga9qt5PMY2IPs92Yfwb4=;
        b=iJDFbqU1TolRsZ7vxTkrLOItIPGOk928/N0JpLBEbqoq/kO9hOomwfyGlj3Qy0TeKO
         OA1lBKPKy31uBYLV3TOFlnIm6jxkVSL9IbYrXOymcUqWzFzaR8RnqNg7FukIyGaolFbg
         LpSsMYBRHiFiyvih1JzFOfu5bVsB7N9whhtR5muNFtPr/8B8oGFPOuC4vRjoaCdqWsLS
         arXWFqTHgMwuQk77S6sX5ZjwmizUHQbupS2XAYhiuIuyU3UKMOXZEHznFKNHXDInZhhK
         cWloF8QUwQpVQn+12i9+6UvUNFvo5qOluf9C2A7jcj2M09BJyvHfyUcG3sxCHQuGsGiC
         tYaA==
X-Forwarded-Encrypted: i=1; AJvYcCUltr0OeERdv8Zjk0olfOugwbsUFO/1QGsfmR3rwj/aAOkleMKakXA9lpv5TSECbM2OcmxgwHqJxahT@vger.kernel.org, AJvYcCVsnHhfpfmmC23Yq84lUwKhHaAndZjXFTNyD1F2inMlcBfeXxxQ0qEmo0Oa3SAu6Y4qWZGxvA0Oiri+pTQ=@vger.kernel.org, AJvYcCWEtZolz75rj4Fo/V3Q1Hd9WCpGLPtEyEtSgQCJOmA4IMKEp8cdfDXkbYxBmHkNp+S3Th6+VO17kX8oFEjC@vger.kernel.org
X-Gm-Message-State: AOJu0YzZM364pJyUp9h6RnvungtgDIKAN4nJ3PnzPBInw9bbZUg6a/CA
	3aevK+XkbS9diWUIAs2t2TDXmSPchIQnPEtO8QIX35x1o+yCcM/j
X-Google-Smtp-Source: AGHT+IGxQwABxlqhjTuf3tFVjTG3QNS2n46WR7qOnWpapq8jY7kZ2agTgMPwpLIKs3M8qJQ6cANozQ==
X-Received: by 2002:a17:907:7216:b0:a99:3318:e7c3 with SMTP id a640c23a62f3a-a9abf94de69mr914003066b.43.1729856837008;
        Fri, 25 Oct 2024 04:47:17 -0700 (PDT)
Received: from ux-UP-WHL01.. (mailgw01.gttektw.com. [45.117.96.243])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a9b1f028e1asm61877166b.55.2024.10.25.04.47.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Oct 2024 04:47:16 -0700 (PDT)
From: Charles Wang <charles.goodix@gmail.com>
To: dianders@chromium.org,
	dmitry.torokhov@gmail.com,
	hbarnor@chromium.org,
	conor.dooley@microchip.com
Cc: krzk@kernel.org,
	jikos@kernel.org,
	bentiss@kernel.org,
	linux-input@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Charles Wang <charles.goodix@gmail.com>
Subject: [PATCH] dt-bindings: input: Goodix SPI HID Touchscreen
Date: Fri, 25 Oct 2024 19:46:43 +0800
Message-ID: <20241025114642.40793-2-charles.goodix@gmail.com>
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
 .../bindings/input/goodix,gt7986u.yaml        | 71 +++++++++++++++++++
 1 file changed, 71 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/input/goodix,gt7986u.yaml

diff --git a/Documentation/devicetree/bindings/input/goodix,gt7986u.yaml b/Documentation/devicetree/bindings/input/goodix,gt7986u.yaml
new file mode 100644
index 000000000..849117639
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
+      - goodix,gt7986u-spi
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
+        compatible = "goodix,gt7986u-spi";
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


