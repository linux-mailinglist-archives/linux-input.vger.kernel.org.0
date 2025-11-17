Return-Path: <linux-input+bounces-16147-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [IPv6:2a01:60a::1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 120F3C6355D
	for <lists+linux-input@lfdr.de>; Mon, 17 Nov 2025 10:50:05 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 3B2B8365D2A
	for <lists+linux-input@lfdr.de>; Mon, 17 Nov 2025 09:43:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B42DF329E77;
	Mon, 17 Nov 2025 09:40:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=pegatron-corp-partner-google-com.20230601.gappssmtp.com header.i=@pegatron-corp-partner-google-com.20230601.gappssmtp.com header.b="wWBhIMQT"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-pf1-f180.google.com (mail-pf1-f180.google.com [209.85.210.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E371C328601
	for <linux-input@vger.kernel.org>; Mon, 17 Nov 2025 09:40:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763372451; cv=none; b=GZ4aXFUQW/tqh/l4UsNocqv0UiuHpbmxvtbNxfpftbuPUR/Btny8+ySlvMoqtEwm+z9Do32WXDhxe4j/NxTnCbveoJEO5BDLB9izeRIhEzpy3SJhSryt3YaCPNSmxv9qOjoxoR0zT9x09xEewFy3bEplOBmFrclZ+VGLEey1iVU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763372451; c=relaxed/simple;
	bh=0uRA3fp2t/Y8f/4SnhskMOoR8H6ms6VaEKgrS143ZBM=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=e+emST9R5vMtvHqODXwh28wuatRPSauEjxR8aFa5xBk/Ff8kh6/1mEJQS7A4asX3Pnx6FlpIeeHf4R1m//SM2/Z0U+wNHd5Xw4CUHSaV7V6fID3UUoXXFmt28JBAD/5+0yJnAkOD/LupktyKhPuIPNDVr6pYLl2kuiFFwHgXnW4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=pegatron.corp-partner.google.com; spf=pass smtp.mailfrom=pegatron.corp-partner.google.com; dkim=pass (2048-bit key) header.d=pegatron-corp-partner-google-com.20230601.gappssmtp.com header.i=@pegatron-corp-partner-google-com.20230601.gappssmtp.com header.b=wWBhIMQT; arc=none smtp.client-ip=209.85.210.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=pegatron.corp-partner.google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pegatron.corp-partner.google.com
Received: by mail-pf1-f180.google.com with SMTP id d2e1a72fcca58-7bc0cd6a13aso2161351b3a.0
        for <linux-input@vger.kernel.org>; Mon, 17 Nov 2025 01:40:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=pegatron-corp-partner-google-com.20230601.gappssmtp.com; s=20230601; t=1763372449; x=1763977249; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=tvj18FuIz0t2FkyZpu6/3sZk/6oMLpGNjr6BxbnNu90=;
        b=wWBhIMQTp55f41WSlSYx0broloqO+0wNe4CZr8xwE2PlFAhYPkK1ti3/Ek+iDiX+8n
         2qdPIptSw575zntlrzHNlBqTj8DzRjlyiuQevgWmqLnCGKTNXtaq8Jsm0enXpKEqfY5q
         QG+TZ0mTal1Uv01QQpDnXBEBd76golABJMPzrE+WVc/uf1lQLbFf7QJyzNnUskH25Vzn
         ZxK9ESgxHlDFDI1lzuyWqRO8YmcaGjxEYmei0BdFyBN7jIC6NAwG0otqVONtz/Tgx0tY
         y8UnYM+3Thidp/0eOggVKheikyklUHfKTVxvtHuGTzz4AmQPcfxHn0bUjNRnRWrJh+Lm
         uPJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763372449; x=1763977249;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tvj18FuIz0t2FkyZpu6/3sZk/6oMLpGNjr6BxbnNu90=;
        b=RqaLv6UQpSKz+8qbE6yIeQg+Jz/kA4arAbC2wvmlNObOStsRqtH8ERX0g7Hj/VM9q+
         Fz1Um3Rs5860llB/ApEmkkkl2M/UCDJ7MhdeOQH0rZ/u0852r3KUaVaWSbQe+7FlvXLJ
         IKpOtBeQP8SirnQYXlHEqxaLb5NckvJ5k+IHlvcuTFwcFq4RY9PTk8BTTfBV+zC6B4bG
         M/w3VO+7ItIIvjXC/dIqC9n6S8tOoMJYaFECzeGQwA5XbGpC92p/eOG7Y8s63Hf6XdV2
         uAMBtpKTnkGY/D+hmGcnvD/vkXrfDGldPhy23SKRdIydGjhecbeZEa0R93fk6xuXiUrS
         eXdw==
X-Forwarded-Encrypted: i=1; AJvYcCUX6tI2s02+8eccJ0wAjOps8YYC9IxMAj4RQGdFF8cwOuA4DMwaouZYb4n3sPS634JaLeasd4+BIn8ZEA==@vger.kernel.org
X-Gm-Message-State: AOJu0YzNln7XU7KCDMnt6AEq1hGEy1R7y1sqclvwWnw2iqDmL9s8y7Iw
	I6j+L2o/N5F87YBpY0UgNx2DwBMBtsTm0oLhhAkDjIKS7Q9JHarMniTjTVti1r6aPQ==
X-Gm-Gg: ASbGncu44jzxJglkKmbGRgSbzSwGwuHobLdGlr8TQO4RDCgWRoNDZ6xGM2DDcBcHZLy
	PENxqJWLiSPapMueX6DeIsjdNwyQcfjGXHe0vxE+CwZ8BGiJIwwW4AgtPJMkSZlVjb4f2fONJv1
	f/9C/h5CGO7ZU1hLcHXlqpaEguk2d52kKZ7ohe2fzdxTaqExoMWOmIFgzlydfzzDf2GlS4iUiq9
	y2um4FD81tZdIbeNooVU8q3SAJccQiiXP8YeBHr5xtz2utQ3Er+B0qw7b+G4arYAtGfttDFw3L7
	4vB2HTbpSrfSJgO3gN2E0mYpsqZtNLrEIcYEBQHd2rzNgVy4AaTubQ8NunQjTDbPxlQwRDY0StG
	iVRbg1ssaKGcSehZlJfC/Pb8MCtXWYhk46E5tLWeOUdLQySjwe2szKYhj3DaJ7toyynS4kD7bW3
	XHBdZ+PCB4Y72/hrSlwH6WY5QOSvOueySaYnnZsfaRoHDp+D6GFRr0k+NZ9OAJykR9LApujGl0d
	5zx+/5CDtBGEMQev5oL+CZvzxLui/XwcT93R+sPWYUStRabKgNNIxzg20tuassQjLEztohwJ9HE
	t0kCHEWQelekCbHP
X-Google-Smtp-Source: AGHT+IH37Ti2rPCcU4pAOmYWgMQd1s8YDoVHPGcyxMts6z75uOU6H3LDQVOqcNsZLR1JdSnNfXIVMQ==
X-Received: by 2002:a05:6a00:2ea6:b0:7ad:1907:5756 with SMTP id d2e1a72fcca58-7ba34972361mr13110293b3a.12.1763372449220;
        Mon, 17 Nov 2025 01:40:49 -0800 (PST)
Received: from sw-TUF-Gaming-FX505GU-FX505GU.. (2001-b400-e2ac-65d6-eb05-e285-77fd-2924.emome-ip6.hinet.net. [2001:b400:e2ac:65d6:eb05:e285:77fd:2924])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7b92782d390sm12606095b3a.60.2025.11.17.01.40.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Nov 2025 01:40:48 -0800 (PST)
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
Subject: [PATCH v6 1/2] dt-bindings: input: i2c-hid: Introduce FocalTech FT8112
Date: Mon, 17 Nov 2025 17:40:40 +0800
Message-Id: <20251117094041.300083-1-Daniel_Peng@pegatron.corp-partner.google.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Daniel Peng <Daniel_Peng@pegatron.corp-partner.google.com>

Create new binding file for the FocalTech FT8112 due to
new touchscreen chip. Confirm its compatible, reg for the
device via vendor, and set the interrupt and reset gpio
to map for Skywalker platform.
FocalTech FT8112 also uses vcc33/vccio power supply.

Signed-off-by: Daniel Peng <Daniel_Peng@pegatron.corp-partner.google.com>
---

Changes in v6:
- Remove the commit description for the incorrect section.

 .../bindings/input/focaltech,ft8112.yaml      | 66 +++++++++++++++++++
 1 file changed, 66 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/input/focaltech,ft8112.yaml

diff --git a/Documentation/devicetree/bindings/input/focaltech,ft8112.yaml b/Documentation/devicetree/bindings/input/focaltech,ft8112.yaml
new file mode 100644
index 000000000000..197f30b14d45
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
+  - Daniel Peng <Daniel_Peng@pegatron.corp-partner.google.com>
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
-- 
2.34.1


