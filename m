Return-Path: <linux-input+bounces-17046-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id A7D3DD186A5
	for <lists+linux-input@lfdr.de>; Tue, 13 Jan 2026 12:19:33 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 95F50305F33F
	for <lists+linux-input@lfdr.de>; Tue, 13 Jan 2026 11:09:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2B9ED3446AD;
	Tue, 13 Jan 2026 11:09:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XX9SpLhx"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-qk1-f171.google.com (mail-qk1-f171.google.com [209.85.222.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 59421346AFC
	for <linux-input@vger.kernel.org>; Tue, 13 Jan 2026 11:09:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768302593; cv=none; b=CLapu6cmke9zlCiTYIHOq0B4eOofVYWyCimTgKlqvctmA0swt1igIERchFr6c2LpmAwr5Heb2Qek2lUoL9sZ0PhXWSZ5mcfOtTXpfTuNKEW7YLNPcGhSYwt/mHgbGs1V4GESxIdA3pxc3BEqWzT2qztoNKjuJ5+OJoDvdp9UwcM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768302593; c=relaxed/simple;
	bh=6pLYfVuIQXu+6i9yGbsc8JllWJct6Sa1co6E2UbDaRA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=OgbOL8TAQdUWt6ZYtmwffkqWaaNUJC30Uo9c/NLfV1vHWfatjgFU1T40jjR+Y6vSqTVYaxiO3+cuzsCSiFHIGxhPKzHjgwfwIC4G8Mf7VEXkLQrs9SV9mIiIRBepfrHkBHho/FgD7I0ii7t/Lw9UjWrnutodGNbr0T7LjWGHKB0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=XX9SpLhx; arc=none smtp.client-ip=209.85.222.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qk1-f171.google.com with SMTP id af79cd13be357-8bc53dae8c2so1103202585a.2
        for <linux-input@vger.kernel.org>; Tue, 13 Jan 2026 03:09:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768302590; x=1768907390; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zyUyxp8wAgf/XnChDYwKqc2QzM4UH8wRrO9JxGpfnDE=;
        b=XX9SpLhxf5UUbNbLg0aPhxQO8xg7KKfHXvYwpd5FSWJFadsi3QWbt19uM90T7rOkd9
         puMTSGzlbmqVwR79EBD1vEhrW/cDWZQAyWSnKD1Tici+sbD0GQnR2LbJDHbUxVfGtNsG
         YgQjzTOPROt9jxg1vrXRp6Or3I3jJUKPy/QB16tKjE72xz5ofJqfy5Gqmx8OxLmDm1Rd
         +lEhNZgzPo2zygULI96c2foH1K1iWAfw+w1R9brG2117pOtSAjql9ZBksydUvEjJl9rd
         WS4BgXTPxt3rXVMlubqlKAepAH4JL+YNu1OgTOjnnJLSaT0JFrDhdlg6PFP/z5m+kKLP
         TasQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768302590; x=1768907390;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=zyUyxp8wAgf/XnChDYwKqc2QzM4UH8wRrO9JxGpfnDE=;
        b=qcFkj3o+8pTXjyv21qFM+9epKA6MSrXf/8t4qzdyrHfk6jYHULHOgtAnlgVWDK3L1/
         aiZr0aRfr8w6OL0FOfBw7KGEGQleNHoKRw+uydX3Ewtshp8l5YwBqudwvYiCW+4aY5hQ
         x+eaBuFYbndWzeTw/Ql1yWxGuX2uhJqJyLOHCgbgANPmIBPDQFNwlGcYI5BOL+d1PREY
         Ma/OdSDTYFVEUcpfUIR6lT9TAJmGh6SEHg+E8D7mEL7fTEe5ahURsP9Ky9t+YWMc+LuY
         NDsqTNFeyNp17WPtm8RpEt9s0OQ+Kj1On4dLmhRkv6xfM1K/fTmmuAWiqJK+E2NSR6o0
         t8Tg==
X-Forwarded-Encrypted: i=1; AJvYcCXIeiH0Vvz7qWygOvoMvMuG5eLBOaTIZQu13NDmUuPcYjOxGzGDk5vL40q+AJdDNAjSo2MDQuaNW7vq7w==@vger.kernel.org
X-Gm-Message-State: AOJu0YxLWfEui/8pIe88yysl6VWoQwuswfPv+w5SEyXlSRUzKctn8lQ/
	0/XqHtilRWwVN3/6oRSxLkN1Zkxm5N1025Xkjjfu0G6g02GHOVI3LfL4HQIKrw==
X-Gm-Gg: AY/fxX4ZbQGiW0pVOTZOs1kuc0UKe5DjiadoRMQGzQsHj4tIUA0LtsfbI7x/dHcW8fX
	mbdUkwkMtNgv4ulTSd4uJ2LsCvOYTk1bGVbJNLEt8BdRjGNOULArfu7CEAVfFcmmWokRQTH/3Oz
	H1PYJ4vU8xq9rA2o9BI7pESQTqApAia3c55Y+ffN88KdNhsaUVFOa33pV0l8skot5zzdkSBdx2i
	3s3d96boD/YOxuwnyVTK/SyApU812SxMwZNTMewuvB/9RKxbpxo3l4mL0Aio3XUSNixefP/jJ7V
	satHotQa5HG1WgRIiFMeix9+pLZVtu4UHpUkpDLsR8OCsIfsYHrQhIPi+do0lcwt55lfAvuHra5
	lUy85WfwkqgGlwqBNr7RZVOBJCuYRkyMO0uiu6MAkU7PHk2dI7HyrmzHEDDsPZ+18tJ0LvVymcO
	Oz5i4EtEK8Q3T/gQMZK2kNYFxFqIODnnsCtD03Y/079Kx/yG30fg0rRd1d8e1TbrUTU4pugnxvW
	EatZk4A/ZQLuS6ius5jxw==
X-Google-Smtp-Source: AGHT+IEQYBKDIx5Gyb5nb9QDIlP5wjHoYpr1ATatTX3/LBRfDVJ6GHb1+HOoMcW7bBTYInLSSSdvlw==
X-Received: by 2002:a17:90b:1c07:b0:32e:1b1c:f8b8 with SMTP id 98e67ed59e1d1-34f68cdda94mr20382740a91.26.1768296395660;
        Tue, 13 Jan 2026 01:26:35 -0800 (PST)
Received: from visitorckw-work01.c.googlers.com.com (25.118.81.34.bc.googleusercontent.com. [34.81.118.25])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-34f5f8b0f67sm19483200a91.15.2026.01.13.01.26.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Jan 2026 01:26:35 -0800 (PST)
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
Subject: [PATCH v4 3/6] dt-bindings: input: google,goldfish-events-keypad: Convert to DT schema
Date: Tue, 13 Jan 2026 09:25:59 +0000
Message-ID: <20260113092602.3197681-4-visitorckw@gmail.com>
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

Convert the Android Goldfish Events Keypad binding to DT schema format.
Move the file to the input directory to match the subsystem.
Update the example node name to 'keypad' to comply with generic node
naming standards.

Signed-off-by: Kuan-Wei Chiu <visitorckw@gmail.com>
---
 .../devicetree/bindings/goldfish/events.txt   | 17 --------
 .../input/google,goldfish-events-keypad.yaml  | 41 +++++++++++++++++++
 2 files changed, 41 insertions(+), 17 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/goldfish/events.txt
 create mode 100644 Documentation/devicetree/bindings/input/google,goldfish-events-keypad.yaml

diff --git a/Documentation/devicetree/bindings/goldfish/events.txt b/Documentation/devicetree/bindings/goldfish/events.txt
deleted file mode 100644
index 5babf46317a4..000000000000
--- a/Documentation/devicetree/bindings/goldfish/events.txt
+++ /dev/null
@@ -1,17 +0,0 @@
-Android Goldfish Events Keypad
-
-Android goldfish events keypad device generated by android emulator.
-
-Required properties:
-
-- compatible : should contain "google,goldfish-events-keypad" to match emulator
-- reg        : <registers mapping>
-- interrupts : <interrupt mapping>
-
-Example:
-
-	goldfish-events@9040000 {
-		compatible = "google,goldfish-events-keypad";
-		reg = <0x9040000 0x1000>;
-		interrupts = <0x5>;
-	};
diff --git a/Documentation/devicetree/bindings/input/google,goldfish-events-keypad.yaml b/Documentation/devicetree/bindings/input/google,goldfish-events-keypad.yaml
new file mode 100644
index 000000000000..4e3a010a70c5
--- /dev/null
+++ b/Documentation/devicetree/bindings/input/google,goldfish-events-keypad.yaml
@@ -0,0 +1,41 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/input/google,goldfish-events-keypad.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Android Goldfish Events Keypad
+
+maintainers:
+  - Kuan-Wei Chiu <visitorckw@gmail.com>
+
+allOf:
+  - $ref: input.yaml#
+
+description:
+  Android goldfish events keypad device generated by android emulator.
+
+properties:
+  compatible:
+    const: google,goldfish-events-keypad
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
+unevaluatedProperties: false
+
+examples:
+  - |
+    keypad@9040000 {
+        compatible = "google,goldfish-events-keypad";
+        reg = <0x9040000 0x1000>;
+        interrupts = <5>;
+    };
-- 
2.52.0.457.g6b5491de43-goog


