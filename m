Return-Path: <linux-input+bounces-15003-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C6B2B95E7D
	for <lists+linux-input@lfdr.de>; Tue, 23 Sep 2025 14:58:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 96B82179CA5
	for <lists+linux-input@lfdr.de>; Tue, 23 Sep 2025 12:57:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D31DB323F7E;
	Tue, 23 Sep 2025 12:57:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.b="Lthjn3bL"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com [209.85.208.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 09E1E323418
	for <linux-input@vger.kernel.org>; Tue, 23 Sep 2025 12:57:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758632270; cv=none; b=CKE666VlfCbqUG3xRz5nESbAaPhiqFcczffV1aiVPS0pOdqgQjUVuQ8+0lpF7TgdaFu7ErYhFPC6bI0EIc8BIdKTSWlPF168XgqrqlVakrugg7gOs0mooAX8WqF9UKA5eEKOSotYP/3FhwQgZqKxLs79+x1jQ3fWZUi8W5rzCn0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758632270; c=relaxed/simple;
	bh=bnh8GbGCyR8IvnNWt9bRFqHNgzI3hQZhpUpv3weFsXQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=qGgKBGqtledakol0Q4f3yefesTBrpxF1e+iInNQSIFOd2HJch3BPLLT9EQa77WXx/zQP3VlcEVY82F4fB0QM1Nzfn9k6iuhjxV/w+63ZcLZl0jACUk7U9jqJhWKuj0G0UrTqIYE1mjbh4h2eAdy0ha/dzo5nFokw/DuuBpoJp8k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amarulasolutions.com; spf=pass smtp.mailfrom=amarulasolutions.com; dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.b=Lthjn3bL; arc=none smtp.client-ip=209.85.208.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amarulasolutions.com
Received: by mail-ed1-f49.google.com with SMTP id 4fb4d7f45d1cf-62fc14af3fbso8807872a12.3
        for <linux-input@vger.kernel.org>; Tue, 23 Sep 2025 05:57:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google; t=1758632267; x=1759237067; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=eq3dfyrFYclljj1qT31cA5X22L5O+KUSooUYqpQO2X0=;
        b=Lthjn3bLUELh6JPqeZwD1fMV0AH8WmEs+hij2lZpj5sjo3uZmjwOJgmWi35nO307nL
         k5RGJpVOj8B1E9jevIwWTIf1Y9nmVQdCUTH8vONRUTYEYh+YhrNn1YfRtgTFM/MVSp93
         apr7wmwgCIFGZJa83Tyza+ycIHo71Jp9W+ulo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758632267; x=1759237067;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=eq3dfyrFYclljj1qT31cA5X22L5O+KUSooUYqpQO2X0=;
        b=OXPAvVsgZHQ/F0up8TfGjDKrBX9Emnd7OItrqNrZM1lfqPi8AyJH1dzNOtp2TPmlG7
         Zo1iJ7B175wiVgkiJ/X3RgUPf1Bx75znaa2kLViSb+P+LdhTLBNYIA/dyD4znt4N7xQr
         Dw09g611AlUe6W1rk9ttv+6kk10f/H/mLvhRQD+eBFdCbn6A4oDZ1ya9mCSWjT8vJ85Z
         fXtGYSY6NZ1TU1Y6aok+57i81YNPw3hJ4cvzkW4DcbfET3tJVkeC7Riw4MB5gekOzV/a
         KxO1hoD/LDi5aCMZ8MDAxX5Hlc9nrBfoXuAe7pIRbBRU+APY5ez1GJxKcLxRAzrbp3B6
         qf6g==
X-Forwarded-Encrypted: i=1; AJvYcCXUdgz7lLeqMLoc9btiOQay8uapme8688SGAh/kAXKYuuhRlPE/bZpap4trquSZL/myhOTAdrxMTsJ/tA==@vger.kernel.org
X-Gm-Message-State: AOJu0YxSQBpqoDLqC2BUbZWbQ7V+UWOwhwM4kZz5A0z6S0mgju+JafqS
	NAshIakZScJWgD2VbNpt52DJanqCOB+ObYtfrjJFVFjjIQQQUcpYhW9gFEhHsvr7xeg=
X-Gm-Gg: ASbGncvXrI9WlMYcRtoCDM1jfGXxCEz0KSrYF3NFDRPKhV7zfAsIG+8RzLNX4VEW70M
	AIReG56/qQJZe13pUtVdX7dyxsmH6Kiqjgrp66vlC2WdICrRqWyVShTCkYPOwpQbxjk+HECct2H
	11jk+Jqw2tc80QmdAYHImbntwsMYJOoWhOYlInED4DfR89bTVDv2r9gkL4qztJmG2TEa7UuGcYK
	jQBh/2ZQXqO/EG9Y8vH+eXQbpKXYNGRw8nSvpyKUHrRG6/BRjib3Bmzz6mi3QvDZNI596Vl13b3
	VhdCGY7hCHdi0sEw7cXYool/GAJbTXgMgtgc11OQ7GVxiv/Lxsmg0z/YwTOotg1CrwpvHNFBDVP
	2R9catdSFZY2nTnbCDXueLSRBJIjIBrYm7M0MmzNmj8nIZO0lRAz/eF/A4+oKLefLrbQgFILNih
	WeFbDQHstm+uIeNZMuuyAgJXVTCbKqMi3YZ5nCZIISoy/PrKt4jASq59H+2qgucOg4
X-Google-Smtp-Source: AGHT+IFGakYPF5iPMB1/+894VRlbLwCXmeQPzZ6Q8KuBpQCg4xITr20xSCf3DfifCufaTwJ53CPxGg==
X-Received: by 2002:a17:906:f58a:b0:b2a:dc08:5914 with SMTP id a640c23a62f3a-b302ad3922bmr241240166b.45.1758632267240;
        Tue, 23 Sep 2025 05:57:47 -0700 (PDT)
Received: from dario-ThinkPad-T14s-Gen-2i.homenet.telecomitalia.it (host-82-56-38-125.retail.telecomitalia.it. [82.56.38.125])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b2761cb532esm872331166b.67.2025.09.23.05.57.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Sep 2025 05:57:46 -0700 (PDT)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: linux-kernel@vger.kernel.org
Cc: linux-amarula@amarulasolutions.com,
	sebastian.reichel@collabora.com,
	Dario Binacchi <dario.binacchi@amarulasolutions.com>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	Conor Dooley <conor+dt@kernel.org>,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Eric Anholt <eric@anholt.net>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Ray Jui <rjui@broadcom.com>,
	Rob Herring <robh@kernel.org>,
	Scott Branden <sbranden@broadcom.com>,
	Stefan Wahren <wahrenst@gmx.net>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-input@vger.kernel.org,
	linux-rpi-kernel@lists.infradead.org
Subject: [PATCH v7 2/3] dt-bindings: arm: bcm: raspberrypi,bcm2835-firmware: Add touchscreen child node
Date: Tue, 23 Sep 2025 14:57:11 +0200
Message-ID: <20250923125741.2705551-2-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250923125741.2705551-1-dario.binacchi@amarulasolutions.com>
References: <20250923125741.2705551-1-dario.binacchi@amarulasolutions.com>
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

Changes in v7:
- Add $ref: /schemas/input/touchscreen/touchscreen.yaml#

Changes in v5:
- Move bindings into raspberrypi,bcm2835-firmware.yaml
- Remove raspberrypi,firmware-ts.yaml
- Update the commit message

Changes in v3:
- Drop firmware-rpi node and use only touchscreen node to fix warnings
  you can see in
  https://patchwork.ozlabs.org/project/devicetree-bindings/patch/20250913092707.1005616-3-dario.binacchi@amarulasolutions.com/

Changes in v2:
- Added in v2

 .../arm/bcm/raspberrypi,bcm2835-firmware.yaml | 28 +++++++++++++++++++
 .../touchscreen/raspberrypi,firmware-ts.txt   | 26 -----------------
 2 files changed, 28 insertions(+), 26 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/input/touchscreen/raspberrypi,firmware-ts.txt

diff --git a/Documentation/devicetree/bindings/arm/bcm/raspberrypi,bcm2835-firmware.yaml b/Documentation/devicetree/bindings/arm/bcm/raspberrypi,bcm2835-firmware.yaml
index 1f84407a73e4..8349c0a854d9 100644
--- a/Documentation/devicetree/bindings/arm/bcm/raspberrypi,bcm2835-firmware.yaml
+++ b/Documentation/devicetree/bindings/arm/bcm/raspberrypi,bcm2835-firmware.yaml
@@ -103,6 +103,28 @@ properties:
       - compatible
       - "#pwm-cells"
 
+  touchscreen:
+    type: object
+    $ref: /schemas/input/touchscreen/touchscreen.yaml#
+    additionalProperties: false
+
+    properties:
+      compatible:
+        const: raspberrypi,firmware-ts
+
+      firmware:
+        deprecated: true
+        description: Phandle to RPi's firmware device node.
+
+      touchscreen-size-x: true
+      touchscreen-size-y: true
+      touchscreen-inverted-x: true
+      touchscreen-inverted-y: true
+      touchscreen-swapped-x-y: true
+
+    required:
+      - compatible
+
 required:
   - compatible
   - mboxes
@@ -135,5 +157,11 @@ examples:
             compatible = "raspberrypi,firmware-poe-pwm";
             #pwm-cells = <2>;
         };
+
+        ts: touchscreen {
+            compatible = "raspberrypi,firmware-ts";
+            touchscreen-size-x = <800>;
+            touchscreen-size-y = <480>;
+        };
     };
 ...
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
-- 
2.43.0

base-commit: cec1e6e5d1ab33403b809f79cd20d6aff124ccfe
branch: drop-touchscreen.txt

