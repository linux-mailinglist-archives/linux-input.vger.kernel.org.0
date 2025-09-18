Return-Path: <linux-input+bounces-14855-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 78B2BB85B49
	for <lists+linux-input@lfdr.de>; Thu, 18 Sep 2025 17:43:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 1F954188C87A
	for <lists+linux-input@lfdr.de>; Thu, 18 Sep 2025 15:38:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 21235313E3F;
	Thu, 18 Sep 2025 15:36:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.b="M3AaOBAz"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com [209.85.218.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E97B43128D9
	for <linux-input@vger.kernel.org>; Thu, 18 Sep 2025 15:36:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758209802; cv=none; b=pcc8VQo/KUbtanrNpoqMNDUo69yG04jw0M7RRxNZHY3NL+ZYhKHDLSCZqAxs+p2kfkKizIKUsv42xNfbrcR0GWOjlxXgnSG/TBa6/D45Ve9frGAp4/GPwiKSyA4s6Vxb2thBphPHjFQ8qWEmNDwr8VQznfNpQc4sIfTgTG3KUVw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758209802; c=relaxed/simple;
	bh=TLBeizH1ivp98ljtrl6wOL7+mlBI3jCetRbuKHlWzV0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=IdOv1s0+15fmgXMHSL70iEXkbcZiq893X0JuZwqxCWqzuppDEur23X+DFlKlWgYV9wPNc9iQ13aigstrNP582HucDJTFZCldrfFLJv71zdXFlHZZmIDRhgR0w0utG7oTqfKXD6G/g5jCZN+9oKreCjsAXfILbrHhnPSZynmX6YA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amarulasolutions.com; spf=pass smtp.mailfrom=amarulasolutions.com; dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.b=M3AaOBAz; arc=none smtp.client-ip=209.85.218.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amarulasolutions.com
Received: by mail-ej1-f46.google.com with SMTP id a640c23a62f3a-b0787fa12e2so176732966b.2
        for <linux-input@vger.kernel.org>; Thu, 18 Sep 2025 08:36:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google; t=1758209798; x=1758814598; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=w56MkMThum1WU0dP+PLWvivQxFiwAsg2/7Wi+5KWDW8=;
        b=M3AaOBAzjh9xQ8jj23eRAj+iIA0n4/iOt5OnJdy0GvkUpWpjkA/iIwsRYQQasIK9ZQ
         E9c0LxaxXA/9eQizF0Rv8OsIYnVrV04EHei0PCz1W9GDuRxLFcHZWr10DyIC0MxsYBmt
         b/uch+czgtM8AHYOv3FbUNW+B1kQTUO3DeKfQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758209798; x=1758814598;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=w56MkMThum1WU0dP+PLWvivQxFiwAsg2/7Wi+5KWDW8=;
        b=NRtt8uItXse7RqwBZIoz67bMIYrskzpYEEScIJWZcxOvy0RSTVcV7wHXFn0eq12ohH
         6TZ/tlrsSOMdbtOj/V76KOcBj8ztaAUgCHwRkiUp6OmMDqH0VvxkSO7tcROB4PWTPEf+
         v5cllQO+MybJOZ93FMJ/AM6E+xS0bJDlHPmkhB2CPLGMqLHSAqmWepTe3+NOS3Hca56k
         bb7nmxn6sI4tSy10gq4/+fBAcj7sPx2EsELdyRhkRPOdKzpAarAEA4bE9v7ukoNOHRXN
         gOu1HLRd9woaKi1wAjlpbkD3WYCguSFVa5dZunII6psAwj/kQ14TDHSDoXraPzJtLRU0
         D5Ag==
X-Forwarded-Encrypted: i=1; AJvYcCVgO4KHcF07RiR8fIegiDacl1WnMzLSswlIqK2dpsLPaJlhwJ5rTDRk0OLesRCW+EV1CAn7qjT7vTx3+g==@vger.kernel.org
X-Gm-Message-State: AOJu0YxsQyiBp8Fase1ZKRn4Y5gd25wJfH1CTerrFTn9ao2Z/563Rv0S
	xrgulytLI7B/t1dkg5sJ+leHJS0wPPKtpfcQJCZOR1mPRNkV2BrlJni5mSgVun0ZtMHeuB2Jq6t
	mVuCV
X-Gm-Gg: ASbGncs5YcjMyn0Gc+QROwXAyaasmfYTfu/exyP7jmJ/xfqfU8QwUZrt0aBqwPdCSIp
	ZqQ5GyfFOSQbM8tcsbQgrU+wYfvfSrjoeFDCHk094rPOm8PS5BnauHRyhefduG6pq5/b97KjHf8
	zkbUJMUpVMOxgNKaHBler6S5vvnGaREP3e0b72buK0/h89PSIjB3ztNXXtkSIZ2Aogohd2Asw4n
	bshCbcVLgxHVgwXJ5fl9ws0yizWHNgBC72vzlKq12JrB48q5KRvrC0AAP8ZcV85leav9ptlT/kP
	crOxQaK6uqJaxx9ZaJtuA2fYPYxpBCT2M6LTDxpbQsVbxLKPT+iJcMefDT2/dmd+UNXwJVsMzcL
	8nVAYjE5BOYLopEGg+Vti4Fcq+FtZ0iMWk12jw3qodLpgN/n1jMFBNT2DGTNwfW33Ymu6dSD/kp
	fD9Kd7SXWabGlb0W0K1f42Dcm/YIKW/pjYAb6z41NsFprh7lkPcYU7Lq38NTHx6sysYUDf/yXg1
	mcFKR42aAg/2KKl9HarVA==
X-Google-Smtp-Source: AGHT+IGKq2xMUGFiPJLoivDLc3hhH8x7+T1P4XBwT2jh+b8TpeeRreLlMX7eSddPKddIg6bfHJFj+Q==
X-Received: by 2002:a17:907:2d24:b0:b01:6e50:208c with SMTP id a640c23a62f3a-b1bb226e5d8mr676897066b.22.1758209798188;
        Thu, 18 Sep 2025 08:36:38 -0700 (PDT)
Received: from dario-ThinkPad-T14s-Gen-2i.homenet.telecomitalia.it (host-82-56-38-125.retail.telecomitalia.it. [82.56.38.125])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b1fd272026csm212430766b.102.2025.09.18.08.36.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 18 Sep 2025 08:36:37 -0700 (PDT)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: linux-kernel@vger.kernel.org
Cc: linux-amarula@amarulasolutions.com,
	Dario Binacchi <dario.binacchi@amarulasolutions.com>,
	Conor Dooley <conor+dt@kernel.org>,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Rob Herring <robh@kernel.org>,
	devicetree@vger.kernel.org,
	linux-input@vger.kernel.org
Subject: [PATCH v4 4/5] dt-bindings: touchscreen: convert zet6223 bindings to json schema
Date: Thu, 18 Sep 2025 17:36:09 +0200
Message-ID: <20250918153630.2535208-4-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250918153630.2535208-1-dario.binacchi@amarulasolutions.com>
References: <20250918153630.2535208-1-dario.binacchi@amarulasolutions.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Convert Zeitec ZET6223 touchscreen controller device tree binding to
json-schema.

Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>

---

Changes in v4:
- Drop "Phandle to the" from vio-supply and vcc-supply
- Rename to zeitec,zet6223.yaml

Changes in v2:
- Added in v2

 .../input/touchscreen/zeitec,zet6223.yaml     | 62 +++++++++++++++++++
 .../bindings/input/touchscreen/zet6223.txt    | 30 ---------
 2 files changed, 62 insertions(+), 30 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/input/touchscreen/zeitec,zet6223.yaml
 delete mode 100644 Documentation/devicetree/bindings/input/touchscreen/zet6223.txt

diff --git a/Documentation/devicetree/bindings/input/touchscreen/zeitec,zet6223.yaml b/Documentation/devicetree/bindings/input/touchscreen/zeitec,zet6223.yaml
new file mode 100644
index 000000000000..d5e132ec0273
--- /dev/null
+++ b/Documentation/devicetree/bindings/input/touchscreen/zeitec,zet6223.yaml
@@ -0,0 +1,62 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/input/touchscreen/zeitec,zet6223.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Zeitec ZET6223 touchscreen controller
+
+description:
+  Zeitec ZET6223 I2C driven touchscreen controller.
+
+maintainers:
+  - Dario Binacchi <dario.binacchi@amarulasolutions.com>
+
+allOf:
+  - $ref: touchscreen.yaml#
+
+properties:
+  compatible:
+    enum:
+      - zeitec,zet6223
+
+  reg:
+    maxItems: 1
+
+  interrupts:
+    maxItems: 1
+
+  vio-supply:
+    description: 1.8V or 3.3V VIO supply.
+
+  vcc-supply:
+    description: 3.3V VCC supply.
+
+  touchscreen-inverted-x: true
+  touchscreen-inverted-y: true
+  touchscreen-size-x: true
+  touchscreen-size-y: true
+  touchscreen-swapped-x-y: true
+
+additionalProperties: false
+
+required:
+  - compatible
+  - reg
+  - interrupts
+
+examples:
+  - |
+    #include <dt-bindings/gpio/gpio.h>
+    #include <dt-bindings/interrupt-controller/irq.h>
+    i2c {
+        #address-cells = <1>;
+        #size-cells = <0>;
+
+        touchscreen@76 {
+            compatible = "zeitec,zet6223";
+            reg = <0x76>;
+            interrupt-parent = <&pio>;
+            interrupts = <6 11 IRQ_TYPE_EDGE_FALLING>;
+        };
+    };
diff --git a/Documentation/devicetree/bindings/input/touchscreen/zet6223.txt b/Documentation/devicetree/bindings/input/touchscreen/zet6223.txt
deleted file mode 100644
index 27d55a506f18..000000000000
--- a/Documentation/devicetree/bindings/input/touchscreen/zet6223.txt
+++ /dev/null
@@ -1,30 +0,0 @@
-Zeitec ZET6223 I2C touchscreen controller
-
-Required properties:
-- compatible		  : "zeitec,zet6223"
-- reg			  : I2C slave address of the chip (0x76)
-- interrupts		  : interrupt specification for the zet6223 interrupt
-
-Optional properties:
-
-- vio-supply		  : Specification for VIO supply (1.8V or 3.3V,
-			    depending on system interface needs).
-- vcc-supply		  : Specification for 3.3V VCC supply.
-- touchscreen-size-x	  : See touchscreen.txt
-- touchscreen-size-y	  : See touchscreen.txt
-- touchscreen-inverted-x  : See touchscreen.txt
-- touchscreen-inverted-y  : See touchscreen.txt
-- touchscreen-swapped-x-y : See touchscreen.txt
-
-Example:
-
-i2c@00000000 {
-
-	zet6223: touchscreen@76 {
-		compatible = "zeitec,zet6223";
-		reg = <0x76>;
-		interrupt-parent = <&pio>;
-		interrupts = <6 11 IRQ_TYPE_EDGE_FALLING>
-	};
-
-};
-- 
2.43.0

base-commit: 8b789f2b7602a818e7c7488c74414fae21392b63
branch: drop-touchscreen.txt

