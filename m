Return-Path: <linux-input+bounces-17004-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id A3C76D154F2
	for <lists+linux-input@lfdr.de>; Mon, 12 Jan 2026 21:45:51 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 5435E302E72F
	for <lists+linux-input@lfdr.de>; Mon, 12 Jan 2026 20:45:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0A2F223D294;
	Mon, 12 Jan 2026 20:45:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="V1H4OxJE"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-oi1-f180.google.com (mail-oi1-f180.google.com [209.85.167.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 935662147E6
	for <linux-input@vger.kernel.org>; Mon, 12 Jan 2026 20:45:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768250736; cv=none; b=G3qODnaYuhhjubIR47bp/Mbqle2PDbwlUzOF09wGlGKCt/chfTqQ+6mQjqWyEobSex13csnVuqlZNHH5VMeb+3e9IsYFVyBNfz9Ps8cJP2sUvr7WCPAr6KO4ZUWwzQF/ncJrmc2ozCfiRecpSDUtwF5nvajCE4n3yuFo37bG96w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768250736; c=relaxed/simple;
	bh=GTLyrTF/q6Eyc9fZ3Fa8bSl/4UWeB/Vses9dYwQVfyQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=QNqYx1qlQAK/HKQfviU2Vq8j+D136UpXqAnKFMmAIDNWBJJv4fj9zy6QXVgra7ZwwAjhOn/nSQ5yHadLd/SKWNMW0TtmdYAwR4NZcaUKmzQ9p8fyHA8c3suqmXpXrD0GA73WoOo8BC/NwoL84eXgotutsBrvl80qC3i804rBc/0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=V1H4OxJE; arc=none smtp.client-ip=209.85.167.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-oi1-f180.google.com with SMTP id 5614622812f47-455dc1cf59aso4149758b6e.0
        for <linux-input@vger.kernel.org>; Mon, 12 Jan 2026 12:45:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768250734; x=1768855534; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=oL3a/4UaA+a8Zff5y8gdtJeilEUr13wkA6OARJeIofo=;
        b=V1H4OxJEvfZRzNQlq7JGcuOVk9kSwOYxUIKpnmE6Wp9vlNTszfTE50oZ0K9YcI4eVc
         dYIMVFomySn2VpnF1PY5c60pBiIspd5LgzZqifVjqaPNOsRycZBfsnDlrIksyIWTPxML
         UVNHi8gVBpl1WgwzFIIg/P0z2SzihH8SbsCbXy7OroLDAr6nxopVJCD4iaCzL+FmdvOz
         p3D6bFvrPBxTNKVqEIF7Gj+I0LMC8nwenZK8f88Yl9pYTuSZyc8rIfkPTEbfGf0Pnq6j
         KAaSL99m2/B8fh4o7qpuxOpv2EZD+qAG1rjx5fRgK+n68GumxF/CfIIo8OFDlFjfVhNg
         99zQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768250734; x=1768855534;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=oL3a/4UaA+a8Zff5y8gdtJeilEUr13wkA6OARJeIofo=;
        b=UoOr8eW50hKcSAMsvtFeVTNvwDjOE+5tA8WGm786i62SwToucrN3mbGATldnRtNusv
         uTM4hiDAxcXxANYrHuX2uxaN/ulUtxRgrKLtpWH2oWbQb7OoXNe0uatsSerwkPagjXBY
         LRnXqnuAc+2abvW4DOh5eSPX3WK5SJFPzDRDqTABYwwz8mM4zMo69npkz8aIb6lAbMmb
         53x39B+hJLAuDnyHVLX1fMdYyhq8j5A7Xe1Ru/r/DNypDLt8dzomtJelGay+iujjSK3i
         HzSpUd0P5N6684Qm54NUNJcJwPiWsmqKE269SCp1zWfs/mT37E4v+4eeQiFDgb08iyXo
         jDtw==
X-Forwarded-Encrypted: i=1; AJvYcCWtUPUukBdjQxlYBxhjj7OvANEJydo19hxf/klnQ677LllwqMMnP30+b8pOa7bkcNm1kXsXqGbEeFU1kw==@vger.kernel.org
X-Gm-Message-State: AOJu0YyHGmiPcaq/GDmjLmbAG2azbL6341jUGLFwRbu/5Zg+YrbgkQ42
	tEvfgkIhf8wWb+wo23cY2/j8nYIr+5nFkAiRFDNEFTbCePEcCXqFwtzN1F8vUQ==
X-Gm-Gg: AY/fxX6dx0U99bw2XyKhDji3kQrRlCIkdEG6m5JJqChiK+l3airwzYnvCoPDqKdQv+E
	sYKzUhCXMrdShyfbPSdh0+0XGLQeudpZjxvQ9qISRITw3ckEPqz8dKNRrwjGSiBMbAg1A3tDkai
	6xAdZHJ/30Gd3uuxTEmnoH/qHEoSYbOy7nhHunb+O3vu94y+iaVh54e+M57qSKBXeH3086ttzXO
	+vIA2thi6H7bpmnoXUwlbJ0gn8SHUt3RzB2hBhcYCK3qH807PIM93xPHR6mcFasBK3oLlHNf97m
	X1nkr8DfpGtXaIuKe4IisNdXgYVzr8+uBACb+gA0U49GNjeg+B68hqvDa2MWeN15xueZqniyYS7
	WOqeETPj9NAAyw5eBhbnRg62vyVyKUSrFrcJWIVMLrcX6fA79Rt6vYkMKxmtq9mbHpIkd4GW+0Z
	pDSlhVpB6WXlqa36HP4jhptjOf/jZKOQAydXM1YgSTvqMIJ5hHC92dj1gOw5VwGMI95tJTB4hVn
	y6bo4XodzCnZGaGBgTweA==
X-Google-Smtp-Source: AGHT+IFAodgf1HCpii8yqntRagZFeymJlZlYuy8XB+cGQHdG7vRM/mtdZt981BYzjdhg5eNahHLaYQ==
X-Received: by 2002:a05:6a21:6d8c:b0:35f:6e12:1862 with SMTP id adf61e73a8af0-3898f94c400mr17035763637.19.1768243912001;
        Mon, 12 Jan 2026 10:51:52 -0800 (PST)
Received: from visitorckw-work01.c.googlers.com.com (25.118.81.34.bc.googleusercontent.com. [34.81.118.25])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c4cca06b16fsm18874197a12.31.2026.01.12.10.51.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Jan 2026 10:51:51 -0800 (PST)
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
	Kuan-Wei Chiu <visitorckw@gmail.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: [PATCH v3 1/6] dt-bindings: serial: google,goldfish-tty: Convert to DT schema
Date: Mon, 12 Jan 2026 18:50:39 +0000
Message-ID: <20260112185044.1865605-2-visitorckw@gmail.com>
X-Mailer: git-send-email 2.52.0.457.g6b5491de43-goog
In-Reply-To: <20260112185044.1865605-1-visitorckw@gmail.com>
References: <20260112185044.1865605-1-visitorckw@gmail.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Convert the Google Goldfish TTY binding to DT schema format.
Move the file to the serial directory to match the subsystem.
Update the example node name to 'serial' to comply with generic node
naming standards.

Signed-off-by: Kuan-Wei Chiu <visitorckw@gmail.com>
Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
Changes in v3:
- None.

 .../devicetree/bindings/goldfish/tty.txt      | 17 --------
 .../bindings/serial/google,goldfish-tty.yaml  | 41 +++++++++++++++++++
 2 files changed, 41 insertions(+), 17 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/goldfish/tty.txt
 create mode 100644 Documentation/devicetree/bindings/serial/google,goldfish-tty.yaml

diff --git a/Documentation/devicetree/bindings/goldfish/tty.txt b/Documentation/devicetree/bindings/goldfish/tty.txt
deleted file mode 100644
index 82648278da77..000000000000
--- a/Documentation/devicetree/bindings/goldfish/tty.txt
+++ /dev/null
@@ -1,17 +0,0 @@
-Android Goldfish TTY
-
-Android goldfish tty device generated by android emulator.
-
-Required properties:
-
-- compatible : should contain "google,goldfish-tty" to match emulator
-- reg        : <registers mapping>
-- interrupts : <interrupt mapping>
-
-Example:
-
-	goldfish_tty@1f004000 {
-		compatible = "google,goldfish-tty";
-		reg = <0x1f004000 0x1000>;
-		interrupts = <0xc>;
-	};
diff --git a/Documentation/devicetree/bindings/serial/google,goldfish-tty.yaml b/Documentation/devicetree/bindings/serial/google,goldfish-tty.yaml
new file mode 100644
index 000000000000..0b702c8657c2
--- /dev/null
+++ b/Documentation/devicetree/bindings/serial/google,goldfish-tty.yaml
@@ -0,0 +1,41 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/serial/google,goldfish-tty.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Google Goldfish TTY
+
+maintainers:
+  - Kuan-Wei Chiu <visitorckw@gmail.com>
+
+allOf:
+  - $ref: /schemas/serial/serial.yaml#
+
+description:
+  Android goldfish TTY device generated by Android emulator.
+
+properties:
+  compatible:
+    const: google,goldfish-tty
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
+    serial@1f004000 {
+        compatible = "google,goldfish-tty";
+        reg = <0x1f004000 0x1000>;
+        interrupts = <0xc>;
+    };
-- 
2.52.0.457.g6b5491de43-goog


