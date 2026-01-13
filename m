Return-Path: <linux-input+bounces-17044-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 4ECFBD17C5C
	for <lists+linux-input@lfdr.de>; Tue, 13 Jan 2026 10:51:42 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 19A563038D15
	for <lists+linux-input@lfdr.de>; Tue, 13 Jan 2026 09:30:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A919138BDC6;
	Tue, 13 Jan 2026 09:26:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QdHFDrGq"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-pg1-f170.google.com (mail-pg1-f170.google.com [209.85.215.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0162238BDCD
	for <linux-input@vger.kernel.org>; Tue, 13 Jan 2026 09:26:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768296411; cv=none; b=S8WTkuwdIjPYGWzzXETZzqRcsP7tgNlWvW21k7vRlgXgo2W9EBXppmi1tm0EcXXOLnVVEsMXMJ3a2arJ6C+v2axOWvRcLzxtsLGGDvZjeYCzfZKBtbLYJQsVgp9O33SiOFed8u1PQEsbdWFtjuCXPn919mGuFZakzZCX/WlG7i4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768296411; c=relaxed/simple;
	bh=ws1p+puMOcBf/qfb0sFtnVfbyocdGIjo6AESCEhizgo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Nb4JARURL8om27k1Hu/UlgzAU1h09L8a5w0/QQ07NgZi2AcW/RFPDwXpM2zS0/QchdCTcuP0dxqleot9Dz8yLbAhovLVp252TpI9H/S/HrBZczJEsHm2v65Nl0wOsFAh2GW7HF0eLl0SU+ExYKJSpttbFcnQPFI6i3vvhssLuhs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=QdHFDrGq; arc=none smtp.client-ip=209.85.215.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pg1-f170.google.com with SMTP id 41be03b00d2f7-c56188aef06so1489508a12.2
        for <linux-input@vger.kernel.org>; Tue, 13 Jan 2026 01:26:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768296405; x=1768901205; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=U7EWk7TuRK54To9ZAGQlu+fCN9Q9oadA9Ns4P4AvNGA=;
        b=QdHFDrGqqCR+WcxB146DlBBMKwfRMeXhb3Dpy1o7T8ppDIfxBKmGwj7y/CQHmtc4ft
         IEE4KePrThXEN3XugJJqPbtwPf9TVio+dRxTs7lNju5a6Li7K77eKd6CnsKaQu2u7a4e
         8GW0u7Agubdx4ucIMvZD0C+dgA6pCD7evlOHQqTBJGUIcRwfkijMghBW8SUBY24Q8BDc
         LZ5YAqgKJNMQ601PWds66a7YxKBgc5AUtWKH99EI+EY+OcvXPZiFkmYPnOR7o3Ey4jKk
         FbJ7/p2Sc1oC7v75Z/mL6cUY+fvKjrHzQ+6bdVO8m3GCYeclikBq0a2qvyhzMxWfkJic
         DpnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768296405; x=1768901205;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=U7EWk7TuRK54To9ZAGQlu+fCN9Q9oadA9Ns4P4AvNGA=;
        b=ur7jhRq0ASARMGtPokj5dDkgK2JEfpRTFDltl1D6dByXLaJShYogdpnKGjszQQxN4x
         14JIgp+5dXXz6wogDoVwUujT++q02sLclEN8iLn3ApBxYGk20vDH2ALcLpXvWPzGhh8O
         DOdBpqV18HSMPIjKOZf1RqA1W24lFgoGZXYQ2avl3mWsfOxM7IPr9oQlsIYH1kKcmlmI
         9ctmJIZgKPcumOHY8uV69R0caGIJY4eXJGyJupXC2fHCWOPjNBndr1zalUd2YUXPSf4N
         h95o3+PE0SgnSNeljNLln9tynsSqRSx3+BgPaZriF3fa5pKGr6NFZZtyVRZZ91FTvTms
         Lo5w==
X-Forwarded-Encrypted: i=1; AJvYcCXZBh2UYTliO31ymCWbtVcxX4IMKoT53GrwLnDE4PyQks5aVlSeriv7NFMiw9JqR+/HgOVH9vBiCGyc2g==@vger.kernel.org
X-Gm-Message-State: AOJu0YzH2dM8hM4FfvwNCv6/PWh9EBAlptPfqit9yCDOVdKVCRZ812DH
	IjvlCoGPUYPW3MehmnZgl0tNnhFqJsms/S/0m5kbsgxAstnyA6V5RIHT
X-Gm-Gg: AY/fxX6hkxlB7hRHbsmCSZDiWcHfFsTUc6bCQrjXp3359vWUT/PbeD5Y+oV5mriQdAY
	kozmYmcp1SkXQWSwpMiJSbNIs1DaFR1lsJofjZyM+Kfdn1ba9G2BGGY3U1IG2j99nzLUen8Uh0p
	aDTSGwZbHtViytLvd8C1ML92NAdrqRtTIDZNggtI0Kb8uDqgeUZK1EtOa4R/t/szFqNF24Ajswn
	Yc1rZbf5WzNCe/RXPDDu7Cfap1F+oPeYQ5uoIsNOw8M2utlrrmpTOqBOdGcG+zEs7v3j50qbTgn
	CEotSTmX6As38HX/DWpxNYPhRMo5leAU62jbIJCops+xX/iqlaUKFP/UCCAI8StGqIfkBa0uK/I
	AdYs4/ormdJUB56/DQk0UVaiHsPcLX/F/fcPOhUA5pnemsw8RElPzY0w9ifoqAaIQZTiU3gsfxk
	x2qV5USjO9Gtg0r3780e275iN+f433csRo9//Y0sL9utRF7qSoQOyUX5haUF1nqqfRO2vD06YSt
	Egeo8arhV89Xaw7DOxN6Q==
X-Google-Smtp-Source: AGHT+IEUC0KJ50PkwzVSwPCDoxMcw68KkQ+8iOouE/4n+Sa2Bhle44HLNHQWtPdhk/bI7tQ9NQN1XA==
X-Received: by 2002:a17:90b:5823:b0:34e:6b7b:ded4 with SMTP id 98e67ed59e1d1-34f68ccceb1mr17985068a91.36.1768296404680;
        Tue, 13 Jan 2026 01:26:44 -0800 (PST)
Received: from visitorckw-work01.c.googlers.com.com (25.118.81.34.bc.googleusercontent.com. [34.81.118.25])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-34f5f8b0f67sm19483200a91.15.2026.01.13.01.26.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Jan 2026 01:26:44 -0800 (PST)
From: Kuan-Wei Chiu <visitorckw@gmail.com>
To: airlied@gmail.com,
	simona@ffwll.ch,
	maarten.lankhorst@linux.intel.com,
	mripard@kernel.org,
	tzimmermann@suse.de,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	dmitry.torokhov@gmail.com,
	sre@kernel.org,
	gregkh@linuxfoundation.org,
	jirislaby@kernel.org,
	lgirdwood@gmail.com,
	broonie@kernel.org
Cc: jserv@ccns.ncku.edu.tw,
	eleanor15x@gmail.com,
	dri-devel@lists.freedesktop.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-input@vger.kernel.org,
	linux-pm@vger.kernel.org,
	linux-serial@vger.kernel.org,
	linux-sound@vger.kernel.org,
	Kuan-Wei Chiu <visitorckw@gmail.com>
Subject: [PATCH v4 5/6] dt-bindings: sound: google,goldfish-audio: Convert to DT schema
Date: Tue, 13 Jan 2026 09:26:01 +0000
Message-ID: <20260113092602.3197681-6-visitorckw@gmail.com>
X-Mailer: git-send-email 2.52.0.457.g6b5491de43-goog
In-Reply-To: <20260113092602.3197681-1-visitorckw@gmail.com>
References: <20260113092602.3197681-1-visitorckw@gmail.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Convert the Android Goldfish Audio binding to DT schema format.
Move the file to the sound directory to match the subsystem.
Update the example node name to 'sound' to comply with generic node
naming standards.

Signed-off-by: Kuan-Wei Chiu <visitorckw@gmail.com>
---
 .../devicetree/bindings/goldfish/audio.txt    | 17 ---------
 .../bindings/sound/google,goldfish-audio.yaml | 38 +++++++++++++++++++
 2 files changed, 38 insertions(+), 17 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/goldfish/audio.txt
 create mode 100644 Documentation/devicetree/bindings/sound/google,goldfish-audio.yaml

diff --git a/Documentation/devicetree/bindings/goldfish/audio.txt b/Documentation/devicetree/bindings/goldfish/audio.txt
deleted file mode 100644
index d043fda433ba..000000000000
--- a/Documentation/devicetree/bindings/goldfish/audio.txt
+++ /dev/null
@@ -1,17 +0,0 @@
-Android Goldfish Audio
-
-Android goldfish audio device generated by android emulator.
-
-Required properties:
-
-- compatible : should contain "google,goldfish-audio" to match emulator
-- reg        : <registers mapping>
-- interrupts : <interrupt mapping>
-
-Example:
-
-	goldfish_audio@9030000 {
-		compatible = "google,goldfish-audio";
-		reg = <0x9030000 0x100>;
-		interrupts = <0x4>;
-	};
diff --git a/Documentation/devicetree/bindings/sound/google,goldfish-audio.yaml b/Documentation/devicetree/bindings/sound/google,goldfish-audio.yaml
new file mode 100644
index 000000000000..d395a5cbc945
--- /dev/null
+++ b/Documentation/devicetree/bindings/sound/google,goldfish-audio.yaml
@@ -0,0 +1,38 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/sound/google,goldfish-audio.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Android Goldfish Audio
+
+maintainers:
+  - Kuan-Wei Chiu <visitorckw@gmail.com>
+
+description:
+  Android goldfish audio device generated by Android emulator.
+
+properties:
+  compatible:
+    const: google,goldfish-audio
+
+  reg:
+    maxItems: 1
+
+  interrupts:
+    maxItems: 1
+
+required:
+  - compatible
+  - reg
+  - interrupts
+
+additionalProperties: false
+
+examples:
+  - |
+    sound@9030000 {
+        compatible = "google,goldfish-audio";
+        reg = <0x9030000 0x100>;
+        interrupts = <4>;
+    };
-- 
2.52.0.457.g6b5491de43-goog


