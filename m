Return-Path: <linux-input+bounces-16032-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id D40ACC522DC
	for <lists+linux-input@lfdr.de>; Wed, 12 Nov 2025 13:08:18 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 67123192174A
	for <lists+linux-input@lfdr.de>; Wed, 12 Nov 2025 12:02:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B9B51315794;
	Wed, 12 Nov 2025 11:59:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=pegatron-corp-partner-google-com.20230601.gappssmtp.com header.i=@pegatron-corp-partner-google-com.20230601.gappssmtp.com header.b="WnhyXE4c"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-pj1-f41.google.com (mail-pj1-f41.google.com [209.85.216.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B511314D02
	for <linux-input@vger.kernel.org>; Wed, 12 Nov 2025 11:59:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762948756; cv=none; b=Nss38sbfHjtkAuqzVUn1QXSPs/Yi9gH8yGRVjuXxjJUSEpFNrLA9/9Hysz+s4FK1s0SQ6td7z64/Ks93KEaaLz/HZazwJ0G0bde41IABGAX6/4RhpNltOKx0pYSJC0Rw4Yd6bfW0vfibjvWRjxF39hQKoED6P6OrHyasH3ebVRY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762948756; c=relaxed/simple;
	bh=Y5lLKstGDY1Pc29kL/97w+SyWuyTuOT5IGfFDoH20aU=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=qG2SwogIne+CCeO7fMtN+fi1mAfsB3anzR4kwfKwthWdAck5AQXfnZmC4gYn5piootLUAlmEjSUbUUHYjptrYr3b3NVu9DGzM/lW/fe7EQ2GkzeMm/GckN7PoZV2yyTkG50R/EDMJN61/V3FnguQmHyK3WdRb0Plf/GWqKPXVsU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=pegatron.corp-partner.google.com; spf=pass smtp.mailfrom=pegatron.corp-partner.google.com; dkim=pass (2048-bit key) header.d=pegatron-corp-partner-google-com.20230601.gappssmtp.com header.i=@pegatron-corp-partner-google-com.20230601.gappssmtp.com header.b=WnhyXE4c; arc=none smtp.client-ip=209.85.216.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=pegatron.corp-partner.google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pegatron.corp-partner.google.com
Received: by mail-pj1-f41.google.com with SMTP id 98e67ed59e1d1-3437af8444cso686854a91.2
        for <linux-input@vger.kernel.org>; Wed, 12 Nov 2025 03:59:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=pegatron-corp-partner-google-com.20230601.gappssmtp.com; s=20230601; t=1762948753; x=1763553553; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=SiyOAeJRKTUJTKhEW85SIMSH5lByvfK0g14ZquI4Zkk=;
        b=WnhyXE4cS+KrUFN6oKLxvqL1vu3lzZ17Q19eM/w/paLHfe22ndVA2iY16IXKW44LdR
         d5kDrmTHqp/5Qfbn3w2YnNO2VyrV/vUOGRlmCe7Afmjl7NViyekmX6MWq7/sb8pkabvP
         t5L3RPqA2Ga8W8NXWveFfYw5+1yAiDc6EAWJNnrVAtEjY8CmMUlgp4eJcqGGGaKf0Bwo
         PZu9qMOaUGKTzpLySMhzGReZvwMMi144hbNMHJHzT/SspMXM1dTBug+FNYGHZ4PQ0B6s
         8g6Wabi5ytfzM+ynCAcRvFo549Jo4u0eRVpaSK+6ahfghQatcn21MEJa0rRnQEAg3DFK
         mqXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762948753; x=1763553553;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SiyOAeJRKTUJTKhEW85SIMSH5lByvfK0g14ZquI4Zkk=;
        b=hTqPN4TMIjCDvp2XIaP8B2MhJ5/Ho/amr3qUK1sRo9OubDDhg55n/Lf3TNWUAKXsGD
         2YTxU3zN0yMtECynnsmgXip1P5M2bN5WYxnGce5L1c4Vi7/I/CsqqSBJJP4aGEl2jYd4
         ndVl1Q2cCPUTGzSQjuepoL5hnu+9AE61sU3f32C7n2RDfCb9T66sBPnO0AsQF9uelsHJ
         xeW+TIPbrlnM41zb5zLZ0yDswY0t3YqfbzMvzGWIMxFpPIA74BiOkYri5HV+HYNobd6n
         o329cG2FrHOn7HVBIK2YUjjyoDhj+HmH/pwPXQbTjg3C5Vfq1c9odx2Asghilgus99sX
         nQFA==
X-Forwarded-Encrypted: i=1; AJvYcCXhOg7USMId3QcvCFxt7yng8RbqcHVwh7zsNoGkCgX1R39O5rNN8Jgj+xj8q8Z2WIzzf5ZS1BMoYj/F1Q==@vger.kernel.org
X-Gm-Message-State: AOJu0Yzqf8Lun5kX7K6g1zNODe5At3tYqw3rMfvvcly4pz+fQ2rN2uIZ
	OvV+zchQmeRTUx6D9i92iNQCBI6amM7I3nFvVPBdoF7uimYbFB7v/Wwc4x54CHGRMw==
X-Gm-Gg: ASbGncvefKCwbh2UEYcts3cEiCyHFKRaUwrvjDSwi3e0N4Zi1OtdK45lgaSILVycesB
	kyDSMQK1qs+89n9lUWW+grR3GtDdMmyOpmMdN0/hjPHL4QjP944lQchBkaB5JUzIV2F2DeaMvpM
	GdxTmJn3C63EXQYGCZohiL75SIZxf2Yw+05EaI8NXa0Bk+LUmhM7tJTfPWW9RwY9ddGkc7+9of/
	qMd27aovIpcFLf+0AvliS/Z/D7eKiB8dMrlCRQwhV0CcceNrYY+6eYY9C7eiNksUGsGaCAExXG+
	xXaqeNTV5Gu1rNQiI0HqHsLcEXVqIlm0+36xtZ+42dk+y4AYG2c8WtfIsvAXVrm7cWQUARlHzaG
	cLspvBECUbjoFY063D9lRDhVMunw80ygmNAUIXye7pbA04qbZygqH1Sw51MsDOclTgkhxaFfatT
	4Q84HxpS/m5ykoNUKYmCVYTYueiM5KwpAi+oiYkz7X9Y1zRGmnohZY6gJ9slnT/cm8ZNHfoa0Ya
	tcl4ZYupnZJDGLXk32TUdFNU3AP6MBx0XbZmIF9FYJtwAWRO4dCxLC/OgE=
X-Google-Smtp-Source: AGHT+IEPODYI5DGv5mdJrYei+FpqFhn1kolGZ3QnlSCdtH16SEj6/23l5FhErEzEnnmFa3KvBD4vgA==
X-Received: by 2002:a17:90b:1808:b0:341:88ba:bdda with SMTP id 98e67ed59e1d1-343ddeccff4mr3337075a91.31.1762948753355;
        Wed, 12 Nov 2025 03:59:13 -0800 (PST)
Received: from sw-TUF-Gaming-FX505GU-FX505GU.. (2001-b400-e2ac-65d6-840d-05d3-e7aa-72e2.emome-ip6.hinet.net. [2001:b400:e2ac:65d6:840d:5d3:e7aa:72e2])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7b2c83906e5sm14278922b3a.71.2025.11.12.03.59.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Nov 2025 03:59:13 -0800 (PST)
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
Subject: [PATCH v3 1/2] dt-bindings: input: i2c-hid: Introduce FocalTech FT8112
Date: Wed, 12 Nov 2025 19:59:04 +0800
Message-Id: <20251112195751.v3.1.I894dde5015f4acad94cb5bada61e5811c5142395@changeid>
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
- Modified the subject description.
- Modified maintainers to myself of this binding file.
- Fixed the extra '>' on section of "interrupts = <15 IRQ_TYPE_LEVEL_LOW>;" and confirm command 'make dt_binding_check' correctly.
- Restored MAINTAINERS file.

---

(no changes since v1)

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


