Return-Path: <linux-input+bounces-15105-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id F22DDBA0635
	for <lists+linux-input@lfdr.de>; Thu, 25 Sep 2025 17:39:15 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id BA85B3BAED4
	for <lists+linux-input@lfdr.de>; Thu, 25 Sep 2025 15:32:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D85E12FB61C;
	Thu, 25 Sep 2025 15:31:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.b="TQZhRP5E"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com [209.85.218.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F25902E54DE
	for <linux-input@vger.kernel.org>; Thu, 25 Sep 2025 15:31:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758814313; cv=none; b=AhkUFAF6FDnw3BftKKWJccYZsHELr68SbTsuITRvxO3ur64gR6MtHn3kDCcXO96SZ0BzNQIj2imTKXAfXrRgaXS4bguaYFCF4Me6Cf1UhPJPQcvnJdn612DjmZTMB5C0P1ZzR4bV9ZWPfWtd85XOIfR9zCEFZf9WOpgRjmFMQ60=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758814313; c=relaxed/simple;
	bh=644PMervGuZhLRtTxo42BpqSF+8nWdIjBlmVIsZS8Ds=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=EhZb2BzbraGRWOu6/6coyzJ1mDanXHRRLg5+3KR/k5sO0mD2883rN3pgJ3xBJaMMgPlf2veA4vSZD/45TLuXyslKQNAgrDLIdXdU3Bbp9JRJA35prZj9riIDR2jM0sU+qL1f23Y7XNf1/blY8cam81t7Fo1tWluL9dajrXVHkMM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amarulasolutions.com; spf=pass smtp.mailfrom=amarulasolutions.com; dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.b=TQZhRP5E; arc=none smtp.client-ip=209.85.218.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amarulasolutions.com
Received: by mail-ej1-f46.google.com with SMTP id a640c23a62f3a-afcb7a16441so180003566b.2
        for <linux-input@vger.kernel.org>; Thu, 25 Sep 2025 08:31:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google; t=1758814310; x=1759419110; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5s1NkUGStweVlYWGlUVqWZR3tOWBeOpZjnhIgCBEaNw=;
        b=TQZhRP5EAAP5ZRKR32Y9MrAcdhDcN9e4bD5GROQnZ9vVs6W8Wrz34ZjHNDcqnMrLJB
         GKoiDxHp/VVWKoqeoYMsBJl8e5k3JJudZlsD/nYVeYGrCtl1gi1DE1BWb4CdNErzHpdJ
         pJiM2yATNA7A87AntD101W05bhWzfPOpjQpHA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758814310; x=1759419110;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5s1NkUGStweVlYWGlUVqWZR3tOWBeOpZjnhIgCBEaNw=;
        b=ItnGLPVOT9OnqfKFOHSiSfNQv+SodfFsC2109mfUY9DoulrGCBbAaX/rrBvmNgkk76
         dbvYNNnJbVQxR0wU1yyJ7SYfFpQIiaYN/KvbrbHN4s3B/I0MXS8LdIWs/uUh+YC3S4Jg
         NM59XWYqi5sLwnBdceO4Cj2CR2tMLi1M+3B8jcLpXABCC8JianvmKMmAJbScaNMVE1sU
         PVr1fyQsZ8T4avIHQT9/jVywsrMmqbq8/TMOtEosiElKUtwMcPQtR5PVMLYGxS8gTYS5
         F8wj3h+FO683ZZsTHr/3jecK9gcWjOPi+hqZGQAftJe2MOBpO0Vli2F97nCAFjbM7CBL
         u5Tw==
X-Forwarded-Encrypted: i=1; AJvYcCVyCllCWnkijJStRpd1tbZL6T4PMCjG3lNTozzMaN+wyhJXe0hrtT+iuUGgiuN98yhBDeqGjI6y0XjTyw==@vger.kernel.org
X-Gm-Message-State: AOJu0Yy1f+AAFLX2OVM4mXfEW+iUQBzSW0QbQpsX/GgyrVV9flr8+Cnj
	+j2NMCasNwfwGRMSykuPFF0GzwcXbVS696AwMDBFaucJKuXJjjf7RpVE5GriKUfCrVc=
X-Gm-Gg: ASbGnctVSaotcBnGB0IYcrzwUISkGG8kmfG7s1ftx9H17YsKWHuDCMAwGg/gq7j71nk
	c41TH7gl06c9iOMgnxi5XTiB2s+wMfNx1Kf7LfTpb+DK3Rb9WGY0TX6KqQpU8EmpzZtVeE/sMiI
	oVfPdgQQ87diOILptzM6F9Bybwrf5GjNI6Zmx51K13BdCI0nE7vSSY9eOUt8+v7jMT2zJ2Xo3xS
	NZSXcO+zy+fn6LrazJJZinFDQ+dts1haW6MBTeERRPqbR0QvCfFzac7nSQF4NFEZRROjSLlNF40
	pwtsNk/+yvNVbWi4ONDWTq5KE250IHxyEfoyGGVUNzx9I1GdUOv27c4m+3KQsw3WAKrl+NXm6qT
	0kr8rH+lV5woWqDzfI7x9Sx6xx+rraY14ZV2BIdWPKb6w2FAaIz7IqXGGPZEJrhrZzAskqXr0Ds
	h0Htb2qSPYFLkUDk+SM0NBflFYMoKSz1JAHxizyE3uX2nnWOfv0KdNW6br40WUYrn7fA17g28cO
	iITtSHWqRs=
X-Google-Smtp-Source: AGHT+IF7BuPuSGwyBCz2UCqO+HRTTylRFxaIlwU3C5Efe36PDl6FBJSX2Hnycv4Zf1+SFTY6NIs+yw==
X-Received: by 2002:a17:907:d94:b0:b04:2d6c:551 with SMTP id a640c23a62f3a-b34bb9e9ffemr417345866b.42.1758814310288;
        Thu, 25 Sep 2025 08:31:50 -0700 (PDT)
Received: from dario-ThinkPad-T14s-Gen-2i.homenet.telecomitalia.it (host-82-56-38-125.retail.telecomitalia.it. [82.56.38.125])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b36f410e129sm43924766b.89.2025.09.25.08.31.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 25 Sep 2025 08:31:49 -0700 (PDT)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: linux-kernel@vger.kernel.org
Cc: sebastian.reichel@collabora.com,
	linux-amarula@amarulasolutions.com,
	Dario Binacchi <dario.binacchi@amarulasolutions.com>,
	Rob Herring <robh@kernel.org>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	Conor Dooley <conor+dt@kernel.org>,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Eric Anholt <eric@anholt.net>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Ray Jui <rjui@broadcom.com>,
	Scott Branden <sbranden@broadcom.com>,
	Stefan Wahren <wahrenst@gmx.net>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-input@vger.kernel.org,
	linux-rpi-kernel@lists.infradead.org
Subject: [linux-next PATCH v8 2/3] dt-bindings: arm: bcm: raspberrypi,bcm2835-firmware: Add touchscreen child node
Date: Thu, 25 Sep 2025 17:31:34 +0200
Message-ID: <20250925153144.4082786-2-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250925153144.4082786-1-dario.binacchi@amarulasolutions.com>
References: <20250925153144.4082786-1-dario.binacchi@amarulasolutions.com>
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
Reviewed-by: Rob Herring (Arm) <robh@kernel.org>

---

Changes in v8:
- Add Reviewed-by tag of Rob Herring

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

base-commit: b5a4da2c459f79a2c87c867398f1c0c315779781
branch: drop-touchscreen

