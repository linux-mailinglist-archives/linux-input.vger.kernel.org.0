Return-Path: <linux-input+bounces-14854-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 4468CB85ACB
	for <lists+linux-input@lfdr.de>; Thu, 18 Sep 2025 17:37:48 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 835B27B9AC6
	for <lists+linux-input@lfdr.de>; Thu, 18 Sep 2025 15:36:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B5AF6313D6C;
	Thu, 18 Sep 2025 15:36:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.b="Zk+grS5S"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com [209.85.218.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ADE07312814
	for <linux-input@vger.kernel.org>; Thu, 18 Sep 2025 15:36:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758209800; cv=none; b=OXhqAbWCUW+Su3mx2DYaznUaRTV8VjWVeM++62oM5SerOourmHHMrewp5pysJmewSpAuQMzAGu9uLLwxG8fezEJ1l2P1hwZydQtVYIf0FWDhPNQWfmDA5Za7RQFVcYkpCxiYc1nUWcy19krMOCyKc3mg/7h2nl5MUIW0ySSgR8M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758209800; c=relaxed/simple;
	bh=WHRaGrKLsqVg0CPq9CQiAAjtX1UXdov4WyNhS1fqM7I=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Di5l7Z9NydvFcNqmjdX0K3ECjq75z/Ji3TBdNcJuM6XiveBuKIH7OSUoPSnrhlfNMplO8fm15KbMwvyYH2Y5PT5okJ2WR3h03pcDTbdc9BMGy6WjiotE0H7FcE8touYtopLiHDEgZJYOv84qHy7We6w3EtBEkU0kz+g3c8RItJ4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amarulasolutions.com; spf=pass smtp.mailfrom=amarulasolutions.com; dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.b=Zk+grS5S; arc=none smtp.client-ip=209.85.218.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amarulasolutions.com
Received: by mail-ej1-f44.google.com with SMTP id a640c23a62f3a-b03fa5c5a89so9163866b.2
        for <linux-input@vger.kernel.org>; Thu, 18 Sep 2025 08:36:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google; t=1758209797; x=1758814597; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TEyYKH4qkqBCP6LUsqOTNG7YVoVZeon8od5MlA8LTKM=;
        b=Zk+grS5SF3U8JWeHCWcFhq2576lLX34BAZGYuKsJuaxV7pfH+c/bq0NACjTVbLA9B/
         drMR6Vt+VL1HBHWSLmJbULSinK2siWjQoZwXqAzwy/69f8gJRT/0dxfCTlYcnuaLs8sU
         z3H/zW7/wAevSYrlJSS4I6YqqF+bwUprI2vNI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758209797; x=1758814597;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=TEyYKH4qkqBCP6LUsqOTNG7YVoVZeon8od5MlA8LTKM=;
        b=v01nGf42LnmUFE1EOnqMeJVRjFqYHC8rWtgB6EtM/HHieQeDxe1d2YV279SNozkAG2
         i4YkdH+VLUlidrIrDpiR0Z/1FRsI93/5lrij+aNX1HnhRUEBVJ4ne8id6x37tn8odMdU
         KtTwOXVuFLuRrVy0LU6ZbkwQfV16qE+HqjQHeIYP241RfvBNqBlGuTVOUTiyXMenSdUu
         zh4ezPTgXGGJi0Mi8NAO7Y5v1oxaXxk8JThrI2LCfMGomk5SlxeSj8NHoFw1zc95yY2G
         UVu842K6tU2PTL49m+lrNlZmfOy1iukZrnQ7NKNlRhb/8jw3fOwp8pjgFjQujRHGYmyF
         rScA==
X-Forwarded-Encrypted: i=1; AJvYcCXb19+hX9tbJEzuh/0BdGU2uOpKDZ68XgfADrMJb/MwdJBnB18/FetB3we4Xz3EhSCEWKJCfUqCqOHjOQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YwwYEONV+WIymaQPVaC9IH9ZC+vfR/LhiuxnwIg8S9FYlqdps3z
	J8esFTfFC8aRkXQ5mt2t5VrxgjtkX0qy17z1KngEKdJpamlMKcD34eveAfqpSk+zcoc=
X-Gm-Gg: ASbGncvOZY4ywqEXqKtogfrCSugKuZmYx6Q8gYUvoi3Z1YnNdSLbsEIdJHXz0rDNEUf
	HIQ1b+3V+705I329PmaAGavwMe4fbZUio7jxhaHu1uFBCgnUT3dTIdtx48duyf8FmijFsgGcv5r
	uWEMPIBvtN0JpYcGjb3cPTkvNilhdBHJ45i4PBkn9ZP9xZYP2VSHfMFGQjK0RW09H9pzXkfVKNp
	gbg1gFOguxdBnbyZORC9VGT3Lf84bZ7Tfn0ybVJcpFmL0Ywle14ftsv4D9LPXot3lkXOzUuJmXG
	XUP6tj3HvuA1MpHjsiYUXYbwtgodQBOCSMVLAR+Z206OARgJpDwgm02aYbaDNYlFXpJvaPK+jwS
	T2jaQ6oHsolkyOoKh0OmdShl6iwSSmtbqSsGtENxC/rg9Um5oFiW5Hkt7RDCJKL5ThoyEZsRJpe
	hILNjCQfwgb/Wb+nIK5iQtyqOjfFcMGU6dHaSP+O/WgE3Xj4AcKVHOxDTGfDnK82WTwjJi0vBWa
	njS90ngHOQ=
X-Google-Smtp-Source: AGHT+IGYaHFbg/1QCb5L+gBEaKgygAIv/jFGntbk+uDxzoL55Zp1d+zUktfDGz/HaUwuss8VFlD8jg==
X-Received: by 2002:a17:907:2da5:b0:b0c:fdb7:4ddc with SMTP id a640c23a62f3a-b1bb0c43f6dmr683814966b.19.1758209796976;
        Thu, 18 Sep 2025 08:36:36 -0700 (PDT)
Received: from dario-ThinkPad-T14s-Gen-2i.homenet.telecomitalia.it (host-82-56-38-125.retail.telecomitalia.it. [82.56.38.125])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b1fd272026csm212430766b.102.2025.09.18.08.36.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 18 Sep 2025 08:36:36 -0700 (PDT)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: linux-kernel@vger.kernel.org
Cc: linux-amarula@amarulasolutions.com,
	Dario Binacchi <dario.binacchi@amarulasolutions.com>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	Conor Dooley <conor+dt@kernel.org>,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Rob Herring <robh@kernel.org>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-input@vger.kernel.org,
	linux-rpi-kernel@lists.infradead.org
Subject: [PATCH v4 3/5] dt-bindings: touchscreen: convert raspberrypi,firmware-ts bindings to json schema
Date: Thu, 18 Sep 2025 17:36:08 +0200
Message-ID: <20250918153630.2535208-3-dario.binacchi@amarulasolutions.com>
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

Convert Raspberry Pi firmware 7" touchscreen controller device tree
binding to json-schema.

Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>

---

(no changes since v3)

Changes in v3:
- Drop firmware-rpi node and use only touchscreen node to fix warnings
  you can see in
  https://patchwork.ozlabs.org/project/devicetree-bindings/patch/20250913092707.1005616-3-dario.binacchi@amarulasolutions.com/

Changes in v2:
- Added in v2

 .../touchscreen/raspberrypi,firmware-ts.txt   | 26 ------------
 .../touchscreen/raspberrypi,firmware-ts.yaml  | 40 +++++++++++++++++++
 2 files changed, 40 insertions(+), 26 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/input/touchscreen/raspberrypi,firmware-ts.txt
 create mode 100644 Documentation/devicetree/bindings/input/touchscreen/raspberrypi,firmware-ts.yaml

diff --git a/Documentation/devicetree/bindings/input/touchscreen/raspberrypi,firmware-ts.txt b/Documentation/devicetree/bindings/input/touchscreen/raspberrypi,firmware-ts.txt
deleted file mode 100644
index 2a1af240ccc3..000000000000
--- a/Documentation/devicetree/bindings/input/touchscreen/raspberrypi,firmware-ts.txt
+++ /dev/null
@@ -1,26 +0,0 @@
-Raspberry Pi firmware based 7" touchscreen
-=====================================
-
-Required properties:
- - compatible: "raspberrypi,firmware-ts"
-
-Optional properties:
- - firmware: Reference to RPi's firmware device node
- - touchscreen-size-x: See touchscreen.txt
- - touchscreen-size-y: See touchscreen.txt
- - touchscreen-inverted-x: See touchscreen.txt
- - touchscreen-inverted-y: See touchscreen.txt
- - touchscreen-swapped-x-y: See touchscreen.txt
-
-Example:
-
-firmware: firmware-rpi {
-	compatible = "raspberrypi,bcm2835-firmware";
-	mboxes = <&mailbox>;
-
-	ts: touchscreen {
-		compatible = "raspberrypi,firmware-ts";
-		touchscreen-size-x = <800>;
-		touchscreen-size-y = <480>;
-	};
-};
diff --git a/Documentation/devicetree/bindings/input/touchscreen/raspberrypi,firmware-ts.yaml b/Documentation/devicetree/bindings/input/touchscreen/raspberrypi,firmware-ts.yaml
new file mode 100644
index 000000000000..697c508326b3
--- /dev/null
+++ b/Documentation/devicetree/bindings/input/touchscreen/raspberrypi,firmware-ts.yaml
@@ -0,0 +1,40 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/input/touchscreen/raspberrypi,firmware-ts.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Raspberry Pi firmware based 7" touchscreen
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
+      - raspberrypi,firmware-ts
+
+  firmware:
+    description: Phandle to RPi's firmware device node.
+
+  touchscreen-size-x: true
+  touchscreen-size-y: true
+  touchscreen-inverted-x: true
+  touchscreen-inverted-y: true
+  touchscreen-swapped-x-y: true
+
+additionalProperties: false
+
+required:
+  - compatible
+
+examples:
+  - |
+    touchscreen {
+        compatible = "raspberrypi,firmware-ts";
+        touchscreen-size-x = <800>;
+        touchscreen-size-y = <480>;
+    };
-- 
2.43.0

base-commit: 8b789f2b7602a818e7c7488c74414fae21392b63
branch: drop-touchscreen.txt

