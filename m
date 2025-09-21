Return-Path: <linux-input+bounces-14953-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 60EC3B8E230
	for <lists+linux-input@lfdr.de>; Sun, 21 Sep 2025 19:34:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 32E81189C7D9
	for <lists+linux-input@lfdr.de>; Sun, 21 Sep 2025 17:34:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E7CFE27281D;
	Sun, 21 Sep 2025 17:34:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.b="cnmsxUxD"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com [209.85.218.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D677F2690E7
	for <linux-input@vger.kernel.org>; Sun, 21 Sep 2025 17:33:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758476041; cv=none; b=Ns7i8McNOrP5hTtUrLqaNQ+IuRWVWrQcM7vs2FCw/ntUUJ0UTanPv6LkmpF9OQEczJCvXRiWF2EQyVoxn/WJWxIkcPXkn9kpUPRMZ43uABQz0zHG3k+Q3rbUX7WGy9eZ+PoxmRJ2U8WsEGtdD7R8D0EIS6lwl21Flm6hwRBCyZM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758476041; c=relaxed/simple;
	bh=oOjZOItw2FyDSVtCNH8Oh9Mq0hYT66Z9X5gdpRuEPYU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=WCkexpkrb/eK/4Ab53ArODRdHSCpDXpi/r3oZMmmMlzHr3pA/V3/w2yT+r5T4ROv+KMow4MVKGDiOModoisccpCYpP2oRttuq2J8SMhsZFSIrn6TnNvV2byGUaLo2uiqC1kJywTnLX8t8neIXYReQSFWM65I273bhPICaiK1yUc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amarulasolutions.com; spf=pass smtp.mailfrom=amarulasolutions.com; dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.b=cnmsxUxD; arc=none smtp.client-ip=209.85.218.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amarulasolutions.com
Received: by mail-ej1-f54.google.com with SMTP id a640c23a62f3a-b29ebf9478bso102350966b.0
        for <linux-input@vger.kernel.org>; Sun, 21 Sep 2025 10:33:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google; t=1758476038; x=1759080838; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zj9dH/IE/77bdbBlwkTPAdjFGDmZXl6gQJLki2rgrNA=;
        b=cnmsxUxDKOc6gdcBmK/L5w9QtaHgCxWNzhLoMAjTUhpjgQSG0weOSJqXMKdw6TVu8z
         DzKXieU9Ob378Dy/mMm14TN0+ex8KT0cm6qyC6rBozMlqeE2yO0t4zuNMPaf7mSnqn0T
         tXhovrVsCI9FMKaPmpl55vGZk8R6jv8C3eO9M=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758476038; x=1759080838;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=zj9dH/IE/77bdbBlwkTPAdjFGDmZXl6gQJLki2rgrNA=;
        b=L6jFgQD9oG6SV8FKqEBBTsQfgxhId3vZabD9kK1X5VyAlcYFFfa3lCbYajFiQBwAUA
         yOHN3aA2LuBW5gpiYhqQIK0CQe1mOQth68mKf4XvrlslRj836zoyPwk75WwJAsH5A75X
         scnKi423m+n68Ala4CGUehdwOI6gS3o4N8oVimiakaOfpQD9JlPt3Y0X8zgrjNetMXGG
         3a0Sig7Wj7wWn0hn3cm2+W6wRjlBRw7Twli0GMj8k4/bOZ0GQZAhusC/p5+TDqPQEPbz
         zs6nNlNln5zYkkmK2ywlYJrDcMjkjZo5rRg2oWaVX+84OII6APVbx/iEItpa5MJiLrZB
         Cgkg==
X-Forwarded-Encrypted: i=1; AJvYcCXh1klGKtqGD6ew0hjDsZG1Y+zJwBzwLMjPC8sTOAbsEZKuXfMaV87uCxk0mRX5HqyjWeNeCQVONSqVaw==@vger.kernel.org
X-Gm-Message-State: AOJu0YxEDL5f0oNkxkQmXalVv4MG1Ujz5SkYVOh8wvQrkQFbQmQBJPcj
	zsuzg/9mEVZIvTK79bTnoiETS25dKBokDlfTMa+GlTV7Ftr9x52tdva9cEUxw2NEOWI=
X-Gm-Gg: ASbGncuwJdFFbaO81xF4fWTqT83zURZFWJDhN8vNLDBRJeibgaHhRmN9NrfUtOIjfFy
	rX8fi8rFJYAqcRsJdczjK0intjACrEODt3r8o4zsSwq5o9Ug2e4NYOBxs7hrhDXmnJ7YCwiQKKQ
	3c3by6tsdsKy/F/JixqO02F5gfTEET4Les+caHlYzrRrfo7pYB/+dsvwxUQufNAYWYVcyo3rfHV
	a8Es45YX6Mv9g7a8CtqC3gNKDFSN0tc3tu6sf4TeXanP3D5hrizqCz/dZiMjLLzKWol0vgX3lDa
	IezrZFYwXm4Fw4Mq7v6QiVi5KI5u94O9n/bG5RggGlgi1uGuG61uUOmY8U0JIGLskJWgP6kPS/l
	5dAED/y7a2l0y0eoX54lvRzh+bRVljSKxzz+DCxgWiU1afQoDue9ANSwNV9FaGHmUzVE4EYeEQE
	dE1IiwzinXJtB8H35G4UB8SJB2rkD7u248MvA2KDPc+yK4ISFgjlTAFzmKPIr99sQw
X-Google-Smtp-Source: AGHT+IELR3aAJwhh1aLPtkTHY1OkF1rr/ic7Ckv+/xLZy9AvN4maY3EHd3KWHVVOccM88c8SJc/H9g==
X-Received: by 2002:a17:907:1c1a:b0:b07:c290:6ce7 with SMTP id a640c23a62f3a-b24edd549f9mr962373366b.7.1758476037865;
        Sun, 21 Sep 2025 10:33:57 -0700 (PDT)
Received: from dario-ThinkPad-T14s-Gen-2i.homenet.telecomitalia.it (host-82-56-38-125.retail.telecomitalia.it. [82.56.38.125])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b2928cd31a6sm324347266b.102.2025.09.21.10.33.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 21 Sep 2025 10:33:57 -0700 (PDT)
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
Subject: [PATCH v6 2/3] dt-bindings: arm: bcm: raspberrypi,bcm2835-firmware: Add touchscreen child node
Date: Sun, 21 Sep 2025 19:33:43 +0200
Message-ID: <20250921173353.2641438-2-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250921173353.2641438-1-dario.binacchi@amarulasolutions.com>
References: <20250921173353.2641438-1-dario.binacchi@amarulasolutions.com>
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

(no changes since v5)

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

 .../arm/bcm/raspberrypi,bcm2835-firmware.yaml | 27 +++++++++++++++++++
 .../touchscreen/raspberrypi,firmware-ts.txt   | 26 ------------------
 2 files changed, 27 insertions(+), 26 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/input/touchscreen/raspberrypi,firmware-ts.txt

diff --git a/Documentation/devicetree/bindings/arm/bcm/raspberrypi,bcm2835-firmware.yaml b/Documentation/devicetree/bindings/arm/bcm/raspberrypi,bcm2835-firmware.yaml
index 1f84407a73e4..044544c17e8e 100644
--- a/Documentation/devicetree/bindings/arm/bcm/raspberrypi,bcm2835-firmware.yaml
+++ b/Documentation/devicetree/bindings/arm/bcm/raspberrypi,bcm2835-firmware.yaml
@@ -103,6 +103,27 @@ properties:
       - compatible
       - "#pwm-cells"
 
+  touchscreen:
+    type: object
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
@@ -135,5 +156,11 @@ examples:
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

base-commit: f975f08c2e899ae2484407d7bba6bb7f8b6d9d40
branch: drop-touchscreen.txt

