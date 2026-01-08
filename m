Return-Path: <linux-input+bounces-16871-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id EBDE0D033BE
	for <lists+linux-input@lfdr.de>; Thu, 08 Jan 2026 15:09:37 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 1638F319729F
	for <lists+linux-input@lfdr.de>; Thu,  8 Jan 2026 13:47:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BFE4C3B8D40;
	Thu,  8 Jan 2026 10:13:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Z8II8nga"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-vs1-f47.google.com (mail-vs1-f47.google.com [209.85.217.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 98C223AEF5A
	for <linux-input@vger.kernel.org>; Thu,  8 Jan 2026 10:13:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.217.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767867193; cv=none; b=rxaxotmLI6bn9gHllnWDyEdL+CWkcNRb9qNg2Rf5ip06IJR4qoTttJYwaOaaiZ4UMGpzAktIC8wjzFP2fI3CvPteTAKDDmKyQsi5oH8ljfdmaiCc6P7b19+KiYZW1teHNVNs2YRJvxpwXOxRKrZYDG2rKJNaB3ldUg82+Awn1KA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767867193; c=relaxed/simple;
	bh=Hgv7QBj2VJ/Dph4tylg9AUwEbK+W2yWO3bKu+SnomLg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=e8E5e8t55a3T1XCOlmVQ4Mgh/UdZ5+iIzGFAbk2GPlDHEw1JTe7ckIyExyhvek5IEYDl1QWaJLilZmZGs0ReeqoMN8NY2YrnAh6EPyroDFBl39WmpH2WkcYV7MYpayJoJS9Ze4AvUrmAT5PJamfD615atCN2ZryVCH8tvrx+QPA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Z8II8nga; arc=none smtp.client-ip=209.85.217.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vs1-f47.google.com with SMTP id ada2fe7eead31-5deb0b2f685so1255702137.0
        for <linux-input@vger.kernel.org>; Thu, 08 Jan 2026 02:13:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1767867188; x=1768471988; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=l0UMQNQize8y0H61kPqmNx/nuhGzGL/JdEumTcbx0Oc=;
        b=Z8II8ngaINIhVEcVtUWNEgXfkg+wxLyYeGNxZOC7Dph325goasKVDGWE8TK0NjG26k
         lb9z+iovFAqwIY7PPeDAD8GUAp+S5r5j5w4pc6WfoNp+XYYGtcKoMydVJmPA4AJxsf0x
         kmpKWCN+rGN7PuU0SYlxwKprfQcAxcIHxB8En61TsfHXFI5f9ztJy6gTe/XCih3g1dYu
         1BhqxQRac1va9eXx0YQz/2x+LUpTDc5KCBg3+Vf8l5KBRb2faIZ5qyVXKqfvx7hJqci7
         m5TUv7XjjmeDbSG5CITUyBq1oA8RpjoTSJelBZqY3nDfKzhaHwnzteGNgcy/P61V4teS
         Bs5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767867188; x=1768471988;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=l0UMQNQize8y0H61kPqmNx/nuhGzGL/JdEumTcbx0Oc=;
        b=LtB5M5gshEWTZqKIB26o6v8K5VyTXaCE5l84IqLHuV0AiCt14KFojl9Gvjc4BI7HdA
         CPX3Nmsvu1gFgjpO3lv5LowlpmZJdMZ329KS0Yg/SBm2Vt6aM+O/lgCKqTNkGpXFcK58
         G+KPYe70sZ3Xv1/4mdwILEcnpna+e0jurlmtg5SD4uLNmjmA0HRrZRa3Gnm7eT7cgB96
         UBC5YJBwLAzun79JbqhRAiKTQFAG/UKlS+209zoJVJ7k3XsJ6zEDsC5iYZMkC4aLzVzx
         3y5yet13NDXy+isHFhMHs9IDVNFF7pLabYKN3ZzloAf9z1mpATxd+vvWKGDhNfARsGhX
         rD0A==
X-Forwarded-Encrypted: i=1; AJvYcCVeq7GkoKHuVh8rUIG8sYq53D4WTumXfz5c5uDFf6kbvrOma7T64yeigDQ3JHrGG0ZGF3o8k7Po6M6CXg==@vger.kernel.org
X-Gm-Message-State: AOJu0YwmSaRfM1p+CAcHzdDBeZtbMT/LN9zjF17d3wmbuR7+ODEyjSVk
	wqbk936hjob5YewlvJVKpyU4RXg1g6TbOK0InCs300W/8+FqGfK+PhnZZRonzQ==
X-Gm-Gg: AY/fxX6BD8c6iIbob5ViP3fcLgLNmgiAj33bfgO1bpQqg0AS22/BE1/tmEoirqv5qFu
	u9dejP0RFlggIl7GQtBklh3SZCtai0sxks7vGVsiJOgA14reNr0289gpJ3Ph6uduUbvjGCiRtup
	iI85joPwWb16zDQnH2eDUIqMJ4xIdTdLafusaUWiEIE2OwEukTaMS4KVEEotUSSe+jjIFCZunQE
	ku+fwYSRPmTy8AT8sxv5rYxBU4L0cixpLTSxoSURj4qvm1GeYvF1kGIP3+ZKaPpyGCuqis6FwAo
	V8w2g+0jLdCnPdzmL28Z2wOekQmWDU+r0LoVWwq0Zod/OMcERz3VBCqlgxZKIhN6xeAqNP8G1Z6
	O/4nar3knkvaxUnU703GL+n1IoE5Z5sRchcTjESnmIvyNRFtbRKNDmX97v9s8pdkNIO/kZlOZ2Q
	SgYZE4oMmZJThpoxnGZKfGmzToK4j4JsaeHVgBY+df2SkQX3Vrq/1MPl9Rgudtv800v/WJM9x9d
	FFNRglwSk1SgRfi8gL19g==
X-Google-Smtp-Source: AGHT+IHZ2UUjx42RRlWVNMw3b1W04C9piTrC4WnPU6SDQCVTlKuzNskyckz41dtty4xhtSX8347Scw==
X-Received: by 2002:a17:90b:53d0:b0:34a:c671:50df with SMTP id 98e67ed59e1d1-34f5f95c745mr7519717a91.17.1767859772019;
        Thu, 08 Jan 2026 00:09:32 -0800 (PST)
Received: from visitorckw-work01.c.googlers.com.com (25.118.81.34.bc.googleusercontent.com. [34.81.118.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-819bafe991dsm6900582b3a.16.2026.01.08.00.09.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Jan 2026 00:09:31 -0800 (PST)
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
	krzysztof.kozlowski@oss.qualcomm.com,
	Kuan-Wei Chiu <visitorckw@gmail.com>
Subject: [PATCH v2 5/6] dt-bindings: sound: google,goldfish-audio: Convert to DT schema
Date: Thu,  8 Jan 2026 08:08:35 +0000
Message-ID: <20260108080836.3777829-6-visitorckw@gmail.com>
X-Mailer: git-send-email 2.52.0.457.g6b5491de43-goog
In-Reply-To: <20260108080836.3777829-1-visitorckw@gmail.com>
References: <20260108080836.3777829-1-visitorckw@gmail.com>
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
Changes in v2:
- None.

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
index 000000000000..e0b26c1f7b8e
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
+        interrupts = <0x4>;
+    };
-- 
2.52.0.457.g6b5491de43-goog


