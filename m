Return-Path: <linux-input+bounces-13662-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 04359B0EB89
	for <lists+linux-input@lfdr.de>; Wed, 23 Jul 2025 09:14:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id E15127ABAA3
	for <lists+linux-input@lfdr.de>; Wed, 23 Jul 2025 07:13:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8524225A659;
	Wed, 23 Jul 2025 07:14:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.b="ckyEgRp8"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-ed1-f53.google.com (mail-ed1-f53.google.com [209.85.208.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A6CA9158535
	for <linux-input@vger.kernel.org>; Wed, 23 Jul 2025 07:14:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753254889; cv=none; b=rrbZ9PFXQ0cr858VCLn+WnKQ04ld8/93QimsIfGWknpEsAD1Ld8M9m0IPKUBhZDd/gicn6C1TsbrCLfVMsCQeWdTPVzxAz22jykebtBhR1ebQn6NqNv0Te5YRHirE7wUk8QQGn5Fp73I5MPTfAl16RfVZlJQKnkiTF9NEEWelUY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753254889; c=relaxed/simple;
	bh=mI3eOP0Qv/SWk/IoD2/DKt5erOKKXZgTjawchOE/wRk=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Vvy4qhMQTPoHPRgOxlOX7HGhIrWKSsRMBjlhd7vhu5hWsGQrquJtGj9IDtXwyhaEOUN1zl9ZizuSGBHtkTJQkhVtTZ/rKWEcDtseqMR995Ougfx2OmujxBY9RAxfSBIo4oRjQ5GNVoaJn0Rtrdzb53DMXEdvvATAFz6/7ssipPc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amarulasolutions.com; spf=pass smtp.mailfrom=amarulasolutions.com; dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.b=ckyEgRp8; arc=none smtp.client-ip=209.85.208.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amarulasolutions.com
Received: by mail-ed1-f53.google.com with SMTP id 4fb4d7f45d1cf-6129ff08877so1049932a12.1
        for <linux-input@vger.kernel.org>; Wed, 23 Jul 2025 00:14:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google; t=1753254886; x=1753859686; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=9zsnQoYlGAtPfOsdm2IE5TQWxuSL8YKpwWHSnuH75p8=;
        b=ckyEgRp8qwvzf4kOZB6ipyJO5ybWCaE15us5CdqlttkOYgd9OalWGHP/lnW51UotAC
         O0NHyEc9rX69AzRXArO1WUvUauz1/A61ECTtadLjeFhkeuwNPjVlItyA/XfV+0R82PmV
         EoY+GWTNFcCimZpP4EPQb1UOiJMQkRQhtG3SM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753254886; x=1753859686;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=9zsnQoYlGAtPfOsdm2IE5TQWxuSL8YKpwWHSnuH75p8=;
        b=kqE28xx0RreukSkdeuL5QNrwbUh4xOYSozw/ZjXl71y16JYzZ5IPzouKSGMJ//pBH2
         jre3LbdzbN/Hf9i8fekc8fmrN80tFy23l9o6ZFEmpxV+7p6g33ogDrh2vFhz/VVqP1sB
         HySxAOIqYe9OfZmhxP0befRM4I7asHH+GyzijW10PfYZeqTPJmDUX9q3kxM5v0WpQQOD
         CoZW1P+f/m1I6NineCpBgrCjoDppwdKGz9r82Th59ZliOml/imDxS7dPP5sJ6skvrd/N
         wmW3Jq/zI3LkLifd1DVyH6IjWkF09M8gzeaTJ+F0vaz8bmZWVfk4T8PMTWifuQ0TltzQ
         AYhQ==
X-Forwarded-Encrypted: i=1; AJvYcCWF2Bv/dEyWUKeBwPR2Yx8ilYxhAP6dMstVgiYxR4bgFXKB5htBD40iQTMAwR80SsX1xm+LieuAZUporw==@vger.kernel.org
X-Gm-Message-State: AOJu0YyILJ+v2ELRQonzb9rdR8ckiCakTYEMT1yZ/qoAunzcwpXnnCRH
	GqnCnuhsSt1rGa6gAkRvFpAURmgVBfjXkNCjwp7fbygV2XLIvOQxKxxUsdxWe3WzDZs=
X-Gm-Gg: ASbGncu/e+H4FmraLZcC1op+hiVuB6pxvU8ZrDVjLxlpPBkUb/Tq9Uy6FZLzrZNqxYI
	tfBUa0dY7lo1VevX3g7Txlz1QyDPcau+pS/pSRd52YFlwkdHI1bF0/CsRNWS7t7CrELNTWC96Y8
	ghVFqk/7uPA6R2QaaIQptgheyyNJiIv1SI3pRjpW5PaKh3MHgJ/DiA4agtzm5D4oSjZoJJaoyan
	PyUSTN1fPrFhvbYYAIB491shVjUsNGKsi3vu80p0KhC4AVafj10XhHGfYldIKKap8KzCOBUkg31
	KTMyyOsIg8pP6IaQj+0LyBp8MhqWlqgTbTjLyUpEuGxOHtxJNLHjW800/UC3qi3X42iYtffjDRk
	fz4t7MFoA8GhcuOO1CHn/Y6KjXcWCbwOQvNH1fL8v0VJ5Y7BrnNBL7xXoYfJexFp0xmmiA6BUHg
	vBwzEI40Uedw1lRuKoE3WoUehqZzMzR9+LFqccJgjqoB3/IyXboeJQ65B5GUGydZht
X-Google-Smtp-Source: AGHT+IHXPN5Tuqtpbz2c82B4GJgt/27zMO5flrScxbOfd0W5i6tJDzdfZGk1pNa38lNrnnbEsvlhKQ==
X-Received: by 2002:a17:907:c2a:b0:aec:6701:b4ef with SMTP id a640c23a62f3a-af15484cc84mr638526466b.16.1753254885856;
        Wed, 23 Jul 2025 00:14:45 -0700 (PDT)
Received: from dario-ThinkPad-T14s-Gen-2i.homenet.telecomitalia.it (host-87-15-176-33.retail.telecomitalia.it. [87.15.176.33])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-aec6c7d524asm999334466b.45.2025.07.23.00.14.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Jul 2025 00:14:45 -0700 (PDT)
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
Subject: [PATCH] dt-bindings: touchscreen: drop any reference to touchscreen.txt
Date: Wed, 23 Jul 2025 09:14:20 +0200
Message-ID: <20250723071442.3456665-1-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

With commit 1d6204e2f51f ("dt-bindings: touchscreen: Add touchscreen
schema") touchscreen.txt is no longer needed. Remove the file and
replace every reference to it with the corresponding YAML schema.

Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>

---

 .../devicetree/bindings/input/touchscreen/bu21013.txt  |  2 +-
 .../devicetree/bindings/input/touchscreen/eeti.txt     |  2 +-
 .../input/touchscreen/raspberrypi,firmware-ts.txt      | 10 +++++-----
 .../bindings/input/touchscreen/touchscreen.txt         |  1 -
 .../devicetree/bindings/input/touchscreen/zet6223.txt  | 10 +++++-----
 5 files changed, 12 insertions(+), 13 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/input/touchscreen/touchscreen.txt

diff --git a/Documentation/devicetree/bindings/input/touchscreen/bu21013.txt b/Documentation/devicetree/bindings/input/touchscreen/bu21013.txt
index da4c9d8b99b1..9f1a6d03c4da 100644
--- a/Documentation/devicetree/bindings/input/touchscreen/bu21013.txt
+++ b/Documentation/devicetree/bindings/input/touchscreen/bu21013.txt
@@ -17,7 +17,7 @@ Optional properties:
  - touchscreen-swapped-x-y : General touchscreen binding, see [1].
 
 [1] All general touchscreen properties are described in
-    Documentation/devicetree/bindings/input/touchscreen/touchscreen.txt.
+    Documentation/devicetree/bindings/input/touchscreen/touchscreen.yaml.
 
 Deprecated properties:
  - rohm,touch-max-x        : Maximum outward permitted limit in the X axis
diff --git a/Documentation/devicetree/bindings/input/touchscreen/eeti.txt b/Documentation/devicetree/bindings/input/touchscreen/eeti.txt
index 32b3712c916e..1230b0fd153f 100644
--- a/Documentation/devicetree/bindings/input/touchscreen/eeti.txt
+++ b/Documentation/devicetree/bindings/input/touchscreen/eeti.txt
@@ -10,7 +10,7 @@ Optional properties:
 		latched. This is necessary for platforms that lack
 		support for level-triggered IRQs.
 
-The following optional properties described in touchscreen.txt are
+The following optional properties described in touchscreen.yaml are
 also supported:
 
 - touchscreen-inverted-x
diff --git a/Documentation/devicetree/bindings/input/touchscreen/raspberrypi,firmware-ts.txt b/Documentation/devicetree/bindings/input/touchscreen/raspberrypi,firmware-ts.txt
index 2a1af240ccc3..c554c89b4e55 100644
--- a/Documentation/devicetree/bindings/input/touchscreen/raspberrypi,firmware-ts.txt
+++ b/Documentation/devicetree/bindings/input/touchscreen/raspberrypi,firmware-ts.txt
@@ -6,11 +6,11 @@ Required properties:
 
 Optional properties:
  - firmware: Reference to RPi's firmware device node
- - touchscreen-size-x: See touchscreen.txt
- - touchscreen-size-y: See touchscreen.txt
- - touchscreen-inverted-x: See touchscreen.txt
- - touchscreen-inverted-y: See touchscreen.txt
- - touchscreen-swapped-x-y: See touchscreen.txt
+ - touchscreen-size-x: See touchscreen.yaml
+ - touchscreen-size-y: See touchscreen.yaml
+ - touchscreen-inverted-x: See touchscreen.yaml
+ - touchscreen-inverted-y: See touchscreen.yaml
+ - touchscreen-swapped-x-y: See touchscreen.yaml
 
 Example:
 
diff --git a/Documentation/devicetree/bindings/input/touchscreen/touchscreen.txt b/Documentation/devicetree/bindings/input/touchscreen/touchscreen.txt
deleted file mode 100644
index e1adb902d503..000000000000
--- a/Documentation/devicetree/bindings/input/touchscreen/touchscreen.txt
+++ /dev/null
@@ -1 +0,0 @@
-See touchscreen.yaml
diff --git a/Documentation/devicetree/bindings/input/touchscreen/zet6223.txt b/Documentation/devicetree/bindings/input/touchscreen/zet6223.txt
index 27d55a506f18..384eeb4a333e 100644
--- a/Documentation/devicetree/bindings/input/touchscreen/zet6223.txt
+++ b/Documentation/devicetree/bindings/input/touchscreen/zet6223.txt
@@ -10,11 +10,11 @@ Optional properties:
 - vio-supply		  : Specification for VIO supply (1.8V or 3.3V,
 			    depending on system interface needs).
 - vcc-supply		  : Specification for 3.3V VCC supply.
-- touchscreen-size-x	  : See touchscreen.txt
-- touchscreen-size-y	  : See touchscreen.txt
-- touchscreen-inverted-x  : See touchscreen.txt
-- touchscreen-inverted-y  : See touchscreen.txt
-- touchscreen-swapped-x-y : See touchscreen.txt
+- touchscreen-size-x	  : See touchscreen.yaml
+- touchscreen-size-y	  : See touchscreen.yaml
+- touchscreen-inverted-x  : See touchscreen.yaml
+- touchscreen-inverted-y  : See touchscreen.yaml
+- touchscreen-swapped-x-y : See touchscreen.yaml
 
 Example:
 
-- 
2.43.0

base-commit: 89be9a83ccf1f88522317ce02f854f30d6115c41
branch: drop-touchscreen.txt

