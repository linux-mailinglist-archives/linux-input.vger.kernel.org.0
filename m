Return-Path: <linux-input+bounces-14677-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id AE00BB55FE5
	for <lists+linux-input@lfdr.de>; Sat, 13 Sep 2025 11:27:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 52D4A580154
	for <lists+linux-input@lfdr.de>; Sat, 13 Sep 2025 09:27:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 12E712EACE9;
	Sat, 13 Sep 2025 09:27:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.b="XtZdpwQT"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-ed1-f52.google.com (mail-ed1-f52.google.com [209.85.208.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B0C22EA730
	for <linux-input@vger.kernel.org>; Sat, 13 Sep 2025 09:27:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757755638; cv=none; b=eg02mAqkzV3/KK5E7OKUymRX/vaATskANimJa0jnyHmRdDYLJhltkjRqFEGGWj7VVEzCOmjWweuVFd7nBA048PzD4i4LLdQhJ7FX1ZLf+YbDaz+ah+BeCHO+1PZS8mrfLXnd+sVXftn7ihpZ/9cNnFD7WXk7IWn7aB2+CvCSXvM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757755638; c=relaxed/simple;
	bh=OyzbIHease9EEYAbJIr/UO0Oi4xj2IKpsRHXJ9y0e6M=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=uN4I/db24qZG0Y4SxU9f+2v8y8982leje8lGbD55k1e0LjQE18W6CuossFt318WcdzoFlYw5fz8B8fX56wyuFDBe0AhTLNRFDt/HBjnR63CrfNCdKC6Z5FoCdHxiySXpuKSOB6/fNyd64PAZfk8vENUpeK28XAt3ssAyOEi0AfU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amarulasolutions.com; spf=pass smtp.mailfrom=amarulasolutions.com; dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.b=XtZdpwQT; arc=none smtp.client-ip=209.85.208.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amarulasolutions.com
Received: by mail-ed1-f52.google.com with SMTP id 4fb4d7f45d1cf-62f1987d446so199545a12.0
        for <linux-input@vger.kernel.org>; Sat, 13 Sep 2025 02:27:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google; t=1757755634; x=1758360434; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Q8sTG2aW7CCN6Ok61/8IbQqhCfdouCWd9pDONO8Yrxw=;
        b=XtZdpwQTAkwfJdWwlrHFX1K/wtkhRLNBcgiseFL7vC/F/K8B2Pvyg2IMbUyTn1RdWn
         cdcRw3sE/vH50wcNKziRFjrqG+CxXDlWBQQUxO34GV+VqQsq1rcEKV5yh5Tq3ofjzyp8
         fcVZ9S5ifZtCEggShKCz3Uegxu10j81JybGTI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757755634; x=1758360434;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Q8sTG2aW7CCN6Ok61/8IbQqhCfdouCWd9pDONO8Yrxw=;
        b=OARYNWyU7drJsNUelpVgQ13n/lQn8QfoEcQo0cFM0huhjayRIfNcPOjuWFEN9VFs9g
         diLd57WXFIlxQg/CPLEgdWqUTQZJWMFOsUkYK71JiiVvoU/pY6/Az/VlHhczOsIT9xZg
         YeUjjP4y6zLXgabStJJjMnEOEkQTKkkkRJ9kSmjRvajRS7gLtel4NjVtpJ168edfP7zc
         NDdWxxxa7wvQ9EOSNAdNkuhJin/HnnlofBKQG+6hQpuN+av58MnBNTCvxcZ/4r0xCueB
         sbt5m74Du71XVilOOo84kEQwp4Q+/vHdPcEFrc9oIpSwc8iCCnlb/QRi7/ebFVc2Wmx3
         N8Sw==
X-Forwarded-Encrypted: i=1; AJvYcCW2Howu1+vGyhFzAFir4ui6Te1gQggZP+BEqwy5tIFbKY0sMZ1+n8LW325aSo4hd9OczsUhO2v8EG/H5g==@vger.kernel.org
X-Gm-Message-State: AOJu0YxMSqhwZo8brYyLXvNXfrG0hbF8RtmsFvWoFlRlkGnkrd9fi7BP
	H8GhIbX8QQDSG3RmoGmLCGtJm9GVTsNFw5Pzeun1Gj2L+21WN9fBI6KV7gsVwUKEE+E=
X-Gm-Gg: ASbGncuJf3/iNiV45z8AivO8GpVNxUjGb728Ubvy08TDoW0qD491YzObIEwxq99hKl0
	JTXJ36AcWpQ2/pb1zdKVLBikNxuu2Q7q9nRi+PIUMbqj+rIcDbduJpnqebTapEwhngS9qX2kgud
	kj66a3WjD1A3WdvWZeKrFy2FkRq4iwCshzbbBH42e8zK4Wi6+VJWjmFTLfGnhSFJF+UhOoK/6Ve
	C7traL32vSlYeSioold3kBXnyj4y9zStkP+Pv4vhiCoW+0GR24lzNC2EZ6VNV38HzSlyoYpFrY3
	Fdaz5I/GIiRQ+kEFu/WwyhUS57A9EF07shIMXMPe4tiXXvk84UPrZ+tXBklLjGs+M/il+5mloc2
	dOfZZtNKO3+GY3QbgRctkYWtSTNBvzsADqP0EUWkTWd1dRSiZDTJ+hfrLRfD4KpRzWeOAi0uzeg
	RS5okfqlo3pA3RJ7fp0igVwXBgyuob6LjdxguYDkbM9DC1EODOU+zKFhPhYnYk2OGDCzSixtgFN
	3AQvX9GA1kLcA==
X-Google-Smtp-Source: AGHT+IGDgtfcXCTKrkwWfNIswey6Q82jjAojqmnYLlWD9nANCJYHBa416Imm5QX70EwDR8EVn7lX/A==
X-Received: by 2002:a17:906:794d:b0:b04:8701:7304 with SMTP id a640c23a62f3a-b07c3546e64mr582834866b.10.1757755634269;
        Sat, 13 Sep 2025 02:27:14 -0700 (PDT)
Received: from dario-ThinkPad-T14s-Gen-2i.homenet.telecomitalia.it (host-82-56-38-125.retail.telecomitalia.it. [82.56.38.125])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b07b33478besm551705766b.99.2025.09.13.02.27.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 13 Sep 2025 02:27:13 -0700 (PDT)
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
Subject: [PATCH v2 4/5] dt-bindings: touchscreen: convert zet6223 bindings to json schema
Date: Sat, 13 Sep 2025 11:26:54 +0200
Message-ID: <20250913092707.1005616-4-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250913092707.1005616-1-dario.binacchi@amarulasolutions.com>
References: <20250913092707.1005616-1-dario.binacchi@amarulasolutions.com>
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

Changes in v2:
- Added in v2

 .../bindings/input/touchscreen/zet6223.txt    | 30 ---------
 .../bindings/input/touchscreen/zet6223.yaml   | 62 +++++++++++++++++++
 2 files changed, 62 insertions(+), 30 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/input/touchscreen/zet6223.txt
 create mode 100644 Documentation/devicetree/bindings/input/touchscreen/zet6223.yaml

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
diff --git a/Documentation/devicetree/bindings/input/touchscreen/zet6223.yaml b/Documentation/devicetree/bindings/input/touchscreen/zet6223.yaml
new file mode 100644
index 000000000000..a126f3f369ea
--- /dev/null
+++ b/Documentation/devicetree/bindings/input/touchscreen/zet6223.yaml
@@ -0,0 +1,62 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/input/touchscreen/zet6223.yaml#
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
+    description: Phandle to the 1.8V or 3.3V VIO supply.
+
+  vcc-supply:
+    description: Phandle to the 3.3V VCC supply.
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
-- 
2.43.0

base-commit: 22f20375f5b71f30c0d6896583b93b6e4bba7279
branch: drop-touchscreen.txt

