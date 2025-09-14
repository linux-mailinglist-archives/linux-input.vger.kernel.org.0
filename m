Return-Path: <linux-input+bounces-14723-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 84F2AB56C34
	for <lists+linux-input@lfdr.de>; Sun, 14 Sep 2025 22:38:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id D24F7189BCBD
	for <lists+linux-input@lfdr.de>; Sun, 14 Sep 2025 20:39:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E49532E7BA8;
	Sun, 14 Sep 2025 20:38:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.b="A6qhIEM7"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-ed1-f45.google.com (mail-ed1-f45.google.com [209.85.208.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 01AC52E6CAE
	for <linux-input@vger.kernel.org>; Sun, 14 Sep 2025 20:38:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757882311; cv=none; b=jjKiPNA8XERE+4dhrqNyIZ3g7k2Z7g42p1ZwcsIbAd7LUC2D1IW8UoP3omwNe76HwzDcfnbkwBwB+jBr5P0ejQv1o3DCebfSm+kFrWEOhzJkLNgQyyJGQwbEEIud8bC0bVyPmUferJ2JsYvqHCJP2ldzVNBQTeVhoybKMnpgOOs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757882311; c=relaxed/simple;
	bh=Z89xAdFSfLdnjxGqKH7V4bJm474RtbP2ANzuBWqmySc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=b9LASSkGij3CIOIgzJR3qN0zvs+/DdmDJQYeEqannsgcpXAGrIp0RiNLtU/qYB5n4XkWhrU2tRsQMIuqfZ9dM1FkyMj4bjsq5xU9nWii2rXcY6J/Lmop6Y/T6xzsDcAlbWiYMVJyMFrr8KHL08FSv/Tueh7ayNFqhtJam42rGIE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amarulasolutions.com; spf=pass smtp.mailfrom=amarulasolutions.com; dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.b=A6qhIEM7; arc=none smtp.client-ip=209.85.208.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amarulasolutions.com
Received: by mail-ed1-f45.google.com with SMTP id 4fb4d7f45d1cf-62f4273a404so275846a12.0
        for <linux-input@vger.kernel.org>; Sun, 14 Sep 2025 13:38:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google; t=1757882308; x=1758487108; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zFrj3gEfIT3tk5nJrn5YbyG7ZS/WolhxcrzQL1fTi+0=;
        b=A6qhIEM7tsCQEpqjvht3hPJKm33o1yJiFurT5VrIwbiLEFX/M2+10O/2ojpUCPAeJ+
         DljYIQfsqNUzNTiwiyHM0a774d+oHvxFcLYhGtYcInGyypaCrAMlr+yGdlCSOJMHXu+C
         s9NpNAoaEt9o7U1KATu1f4jDRAxwoEVRsv8JI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757882308; x=1758487108;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=zFrj3gEfIT3tk5nJrn5YbyG7ZS/WolhxcrzQL1fTi+0=;
        b=NjH3MMEqSQzQVACWPRiFHRjpSOVQ5IO7KxEh117T91zLHsc5Y1I7tF6WF2JGKchDJb
         fJa7KoK45oYIbAiKni4jLUol4ypl/RJEXq43d1i28hxa1YGuO7m+Y0MInmJkfSuq+018
         yLJgBPj7HkD6OzBGuzDaea4a0UTRW/nXGsykxtPllWSI9x0AWGAbrg0PGU4t+tN/uBT/
         kapZooVx9t2lYF0dTp9Yti7QvYTXY20BX8gVRS71fGV/nwshVesNfxWAvMLi7kgrpgVP
         Gu2iZTrz1ouIIU0/xUUmpLz8Iy5OojuRmysGImLeJXaCfAT02wXbkSUvS2MmDFh2mHku
         9l0g==
X-Forwarded-Encrypted: i=1; AJvYcCVzKPbWXwQRbcflFhhIxu4mHLbD4eF8AOoSmhLmdzm/e373ugZu8OChHhk2k2W9O4dZkIPqRJur6SEhFw==@vger.kernel.org
X-Gm-Message-State: AOJu0YzQCxuUex49RNcY3rUhKtsfHqOZkuozNGZlf6C5Wys8J/Ai6kWP
	rtwn+xme5xd77Vb6I8+2nrhFn9nGyqgVZRcS/iZCthuNhfoe8gxGEhmlwp9dtghZRKA=
X-Gm-Gg: ASbGnctU45uiBvg9+M/X9wAZ6/+dcCNqMzuf5VGiLO8aFwLeMU70Cru3tCwBkDVEM/K
	avknxQQQAyq0gJ6/E5ZAQBPN8LNHf8P1UoGmwP9H+UStKpGVX5yOi4f8xJ0h1YQiPzQ0mKlFnJ1
	r4g4DoFk7W8f+agMZTgUzyf8bQoHrusNGtfiZokZzjhg3ORKFJYRPHl0NSnZ/x3m3PiaOZ6GGF+
	ej5o5gfTTgvFKrbOWuQOpKnjvocRICwFenE4WJRBbY3OAFHwqI3KNgFVB/rW6wHpaYIzxx1ku9/
	v4yrx0bQ4peE6BfYxN26/KeBSuadLMN5IdpTDFpeMYmal2cmSpQ1AV2/JWDJjVGLFeMIPqBl+2i
	KR8+BWi9x+LFiINDxG5o86adYtKKwd2dOOq9W0d79HD7bHCj+sp4WYPL/HbxtidioCoAN9MAj1H
	tPH60Jd4OzOPxcPSEtya2VJqSytpT/C6xErJgnj69YTnhGq1D5HQIsU9WdKCynxmsMCh83pQ62r
	s8=
X-Google-Smtp-Source: AGHT+IHD40fLYi4O1kTcM1Rp7p7ZYRGGkgLnzuTVUkbYF/Dv84qViywJ6Kd34fqgy/JBzIXC++JDJw==
X-Received: by 2002:a50:d647:0:b0:62e:c5f7:cf92 with SMTP id 4fb4d7f45d1cf-62ec5f7cff2mr8580125a12.13.1757882308297;
        Sun, 14 Sep 2025 13:38:28 -0700 (PDT)
Received: from dario-ThinkPad-T14s-Gen-2i.homenet.telecomitalia.it (host-82-56-38-125.retail.telecomitalia.it. [82.56.38.125])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-62ec33ad242sm7803739a12.17.2025.09.14.13.38.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 14 Sep 2025 13:38:27 -0700 (PDT)
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
Subject: [PATCH v3 3/5] dt-bindings: touchscreen: convert raspberrypi,firmware-ts bindings to json schema
Date: Sun, 14 Sep 2025 22:37:54 +0200
Message-ID: <20250914203812.1055696-3-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250914203812.1055696-1-dario.binacchi@amarulasolutions.com>
References: <20250914203812.1055696-1-dario.binacchi@amarulasolutions.com>
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

base-commit: df86f912b45c20e236060321c85fe35437e9325d
branch: drop-touchscreen.txt

