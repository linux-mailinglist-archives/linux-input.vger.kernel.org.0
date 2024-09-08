Return-Path: <linux-input+bounces-6298-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id CC5559706E6
	for <lists+linux-input@lfdr.de>; Sun,  8 Sep 2024 13:30:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 89DCE281C11
	for <lists+linux-input@lfdr.de>; Sun,  8 Sep 2024 11:30:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5D2C1152170;
	Sun,  8 Sep 2024 11:30:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="AXP/sj6m"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-lf1-f49.google.com (mail-lf1-f49.google.com [209.85.167.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 93BBD26AC2;
	Sun,  8 Sep 2024 11:30:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725795037; cv=none; b=YxCCCOt8YfXb4Tpw2K/c2gx0yLw0jOb+6Tw8Ox14wDb/6O+E0CpFOCT+l+zE34Qd5WCkgYXD04pByY0Zqf+i94aYjHnk5onbpA7qIPFSSzwkvZFw3wV0V0xUG7GXxyptHk4ArUrAFl/PdXMtr8T389VENwtzHpsmbXpY+rBclUw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725795037; c=relaxed/simple;
	bh=wvVYxazph3kD3oSNk3/SN/aqPbf7pfU6af5fWK8kxNo=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=so30MFC6XZYzRL/gbGndl2/QRAAB8aZmsg5l7MBXtjHxlRqMR7QTu7MdYjPFb2A35WZsjq2NsqDz3C5Cf8eSZmOVVJPN/mTVjXPqPXH1rWywfaR5QzcGUyquKHjNfGP4gZzHY3vXwd+LnHR0n3OByTU1ng7kQ9fFFUmBI6YP7BQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=AXP/sj6m; arc=none smtp.client-ip=209.85.167.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lf1-f49.google.com with SMTP id 2adb3069b0e04-5365928acd0so2409274e87.2;
        Sun, 08 Sep 2024 04:30:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1725795034; x=1726399834; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=6aBmTg89WmUNqPCbMScwvT8EAdQvqGkgyn43obvAbQM=;
        b=AXP/sj6mXWFYrELE7tqdY2WNkDfFl/USydpZ5QMpzy+8f0KHR+e6HaCwLlrhb8GW5e
         7NX2uVejfCgp9HZ0hrnPqvcW0LMqVO2lUDb8LukiYsQaUfrjrEaeBYlvKVsmIEuJnvX3
         fqeaPSgj5HHKc2BO6ZSFvaZIlnsVclU/GfrITYJOK1f9oPVMNDklmBxBxuEnSm3y7N7H
         YTSG+GMhgtErLcX0cvudpinEN+6OOUHm1Kn2uRzzf/vVeiw2DtVAqPkT5IaIVTnFy5dN
         T6UxDk8EdAMgRNPrjg00d3Z7DOOTrLQY4CJn2txe+HmAimRWn+A/W9g5VFymwYroZG64
         jOpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725795034; x=1726399834;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=6aBmTg89WmUNqPCbMScwvT8EAdQvqGkgyn43obvAbQM=;
        b=P6H3pu6QRQGrrBM/CvcV7JI77kptT+qdDlsZNmF4CSMhh6dliMOct3SB0G9z2uxPko
         Dw/ISIC895VJTqe95ly2zAkwPz0S/nZ//0Yu5e+jT4ozx/O1SqciDHMJbLfk/7/uhaYi
         P1bk4BwcdWccEhGtgrUiR9WJfEo+EieJj/LO3BseJlVI72/oigmSdpoeVlHEYdQJ0x83
         /9umFTTz6PNBBp6IqzpcsAtO+2B5dWlB8gZeIoPAUvwBZnwyLID48/h/H7C/6dSDe7gs
         x+mGi/SJlAmwv/7nhugYAfv1PtgtLidzAupdIYyBHRt5zwQqQsfKNXelSRvnPCXyLNw8
         MfRQ==
X-Forwarded-Encrypted: i=1; AJvYcCUb1Rx+Lz0+1UFdBd5OwioK+vkoswLj3d8xVCDb/yMc74jFmm5attMHQY1H5OJNlGemylfH+w+FK/ls@vger.kernel.org, AJvYcCVK9Vx87PGBReQoVOg6deDAvtCZZYx3GN0glzuiv71hOcFxctCXdNEMcxqvCYdCl6R45+3Hsg2WT33UQdg=@vger.kernel.org, AJvYcCXQ3O2ZQkc797PvVb8IVL7vqZvUDk20bl1gYbZcmjejhUwS9T8rdJRtnlchGcS9fnfWOkIZ2xIC1p7jg05h@vger.kernel.org
X-Gm-Message-State: AOJu0YzzZpH0e1wqe04AS9aqAKGHl4XzIGRZsM+UWB9xj/pfkRYtKrJZ
	mq4vhY+fowF2mR9cJ7ETnAl0Wx6wJURogQJWhkvbz8yzbbFZIXLy
X-Google-Smtp-Source: AGHT+IF2iS2/BT9a6Rk3/5ETDArfof1wB8EEXOaMp301Komw2p59vxwDB0N6VeGzt7ltggDrcSjOsw==
X-Received: by 2002:a05:6512:1092:b0:533:e4d:3374 with SMTP id 2adb3069b0e04-53658813b0emr4830836e87.57.1725795032748;
        Sun, 08 Sep 2024 04:30:32 -0700 (PDT)
Received: from kuzhyl-vm.. (89-64-30-233.dynamic.chello.pl. [89.64.30.233])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5365f903fccsm386929e87.235.2024.09.08.04.30.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 08 Sep 2024 04:30:32 -0700 (PDT)
From: Oleh Kuzhylnyi <kuzhylol@gmail.com>
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	linux-input@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Oleh Kuzhylnyi <kuzhylol@gmail.com>,
	Conor Dooley <conor.dooley@microchip.com>,
	igor.opaniuk@gmail.com,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Jeff LaBundy <jeff@labundy.com>
Subject: [PATCH v5 1/2] dt-bindings: input: touchscreen: add Hynitron CST816X
Date: Sun,  8 Sep 2024 13:30:26 +0200
Message-Id: <20240908113027.69471-1-kuzhylol@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add documentation for the Hynitron CST816X touchscreen bindings.

Reviewed-by: Conor Dooley <conor.dooley@microchip.com>
Signed-off-by: Oleh Kuzhylnyi <kuzhylol@gmail.com>
---
 .../input/touchscreen/hynitron,cst816s.yaml   | 57 +++++++++++++++++++
 1 file changed, 57 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/input/touchscreen/hynitron,cst816s.yaml

diff --git a/Documentation/devicetree/bindings/input/touchscreen/hynitron,cst816s.yaml b/Documentation/devicetree/bindings/input/touchscreen/hynitron,cst816s.yaml
new file mode 100644
index 000000000000..ac9f1d8e8fc0
--- /dev/null
+++ b/Documentation/devicetree/bindings/input/touchscreen/hynitron,cst816s.yaml
@@ -0,0 +1,57 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/input/touchscreen/hynitron,cst816s.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Hynitron CST816S Touchscreen controller
+
+description:
+  Hynitron CST816S Touchscreen controller for 1.28-inch 240x240 Resolution
+  Touch LCD Display Module
+
+maintainers:
+  - Oleh Kuzhylnyi <kuzhylol@gmail.com>
+
+allOf:
+  - $ref: touchscreen.yaml#
+
+properties:
+  compatible:
+    enum:
+      - hynitron,cst816s
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
+additionalProperties: false
+
+required:
+  - compatible
+  - reg
+  - interrupts
+  - reset-gpios
+
+examples:
+  - |
+    #include <dt-bindings/gpio/gpio.h>
+    #include <dt-bindings/interrupt-controller/irq.h>
+    i2c {
+      #address-cells = <1>;
+      #size-cells = <0>;
+      touchscreen@15 {
+        compatible = "hynitron,cst816s";
+        reg = <0x15>;
+        interrupt-parent = <&gpio0>;
+        interrupts = <4 IRQ_TYPE_EDGE_RISING>;
+        reset-gpios = <&gpio 17 GPIO_ACTIVE_LOW>;
+      };
+    };
+
+...
-- 
2.34.1


