Return-Path: <linux-input+bounces-16867-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id D7904D04382
	for <lists+linux-input@lfdr.de>; Thu, 08 Jan 2026 17:12:43 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id C804C31C21CC
	for <lists+linux-input@lfdr.de>; Thu,  8 Jan 2026 15:56:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EC2923A7DF9;
	Thu,  8 Jan 2026 09:56:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KDlZVLG6"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-qt1-f171.google.com (mail-qt1-f171.google.com [209.85.160.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE052349B17
	for <linux-input@vger.kernel.org>; Thu,  8 Jan 2026 09:56:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767866218; cv=none; b=bFTDtfZq2YHz3p3ctb/y4bhQWGw3kSfXUkU8sJKgq9RBBlwEvi0w52IpKpRFI2Tfg5Dbua2R2vvneE433s/WpebjyCjfIgEbmVGKyicI26xvwkr9PM1xpqa1gOSwEvci6J94owgdosgQMp13sN16G7hzp1JSTjMe6UcB83uguS4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767866218; c=relaxed/simple;
	bh=3n90BbXpZmo7/97SyvwdOM2dgbMwLekUvvzKLPzma1k=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=rRDJDcQKPTCP6VZ9d09cVBcLemzqbmueCHxjcRpDmIekxSBuPzfUHv171l6Lc/wdH4KWlTlslFOADhKR/R5JgFfFpqmjVmhS95MyZfRFLlaUW9KUHQwA0qplFbwTlZ4ZoG88pFYV1gMM7hKuHalGxL+kZwM5Lu2ZV36nK9BONT8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=KDlZVLG6; arc=none smtp.client-ip=209.85.160.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qt1-f171.google.com with SMTP id d75a77b69052e-4ffc0ddefc4so9139201cf.3
        for <linux-input@vger.kernel.org>; Thu, 08 Jan 2026 01:56:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1767866206; x=1768471006; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3jVrer7foxeDXiFbFRi4WTYBqb7mxG96n3TZ489PhHs=;
        b=KDlZVLG6HsYr9O5+/FDJwQ/Wz5bQfBoKXnEF1wi4RBjrqxMVklK+b33QZz1wPPLUUV
         u/O2lijKZ1fHWsDl/MicqWjIDAYCz3+9VHEz/IEZQOzpvCaqokWuVVww4YSkj48+T5Ig
         FgzX6niTQxDSvhb5sCk/FQHBpq1uCN2FZOa5eim9GWwgqbpL6QnXRFpZbmVDwH/xqGy+
         2MJTacuUobfpST4/YsAp1/7xROTuDnloils1//eAXtWW4bcnENH3t8AI8t3Pbsx4Hey1
         9ShoDlmcsyKy1Bm+mA/81cy58AfnXc2KKxHHG7eQc6bq3eWc+cA01JUJ80Zbd5+zmlLU
         uQSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767866206; x=1768471006;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=3jVrer7foxeDXiFbFRi4WTYBqb7mxG96n3TZ489PhHs=;
        b=hPdX3jRpTTN/5cndJKK48wa2xuGRIVUj7ocILZzXWhdVA6oLko+9RpE4djQeGtWQr9
         LphPNUA3ADgQrDGfc6B29FjM5PZon+PweMo4+3TyWsTvpDVG4KzOpoxrUJGpgy5kxffo
         MJKcaGRjo/TWyMHssRw0uGB6QZrEhsMUqBmPj6U4qq1Y4UDL/ZdbDtikWGtUNu/26ukU
         +SnzFY+GkulK6e/knoDv54L66k1Ymub0p9CKEEafDVKBQkGegTraqNeYwzm+ZEO1S8Sw
         km2KmVILzizyL+mLII5Qr7jZSLYLNuQ1roftV6q6gMsMOVi53aslWiRiJG1hd7Hy+PE1
         nhMA==
X-Forwarded-Encrypted: i=1; AJvYcCX/oOYGg8iOHKWGy9HBADZUzrOZfRn6rycMwC5IsOHxsLFz2ib/57hBzEW7jLUZZ3cFbUbmO5TCaS8kYA==@vger.kernel.org
X-Gm-Message-State: AOJu0YyLb6QNjCASVpjLiLciXtuo9lD90Zhw5DIt17v2qpnfiCjRUfRL
	O4SXQWX1TBalXVOMDnYQCLFwC83gS1D8hDsK3wkuuYdQo7+4yOWu79MxEJ818g==
X-Gm-Gg: AY/fxX6Ok0EpBBqYCI+ebxKjHa9i5vodyAitdGeQWf57jsTQwCMkcTel+z8UKsFd0/d
	gOsYMiNhfMzsnD/LWE6Ex0XEWyGAATWgM1hA/Ks7useCZHuCg7V6J51MkqP6434T665jrDzLtE7
	iPRz2rxbkj6ElLBkJ6N2c8Ec9H5VhZ70SVG64VBnNvsYxGe4BHMM30N7BtyU6gCF3G9Gp72e7YH
	clH0/I+WLNwq44UFrNV/wHvRofFu9Mn+ChrDTgC1P5rdta7q7u5I9XnX1tAMXA8hvJOhdveGycj
	nlAL1Xbj+bC/g2xKMuHo4yJ8HSLw4BDeLKZdhwL9YJbs6hVkKX/NRtuwbJvke2hPSlfEqNqugxo
	lYhSuMnvNFjMpXzYqEm5SIszOTC2e/3wX/s/2v/VTu8SGAH9jRVTFTMO8aLIZe2ssvgDJiR1eho
	5lupHe7qFXfULxPd90yMug9ZdzF0bFz8bAaP3/0ZVFyddTxt4hMlbexbmSJeh9Hjl69rNT9H2ao
	sJnHAQO1eADMO1GscoLyjHXJTksQJ34
X-Google-Smtp-Source: AGHT+IHrWmrWZovQhYEcCj3OW2qe/OMr35yE9xC18wSEU8hxPlfPFqonbAeAYlH/zyT0y2ccrqO9lw==
X-Received: by 2002:a05:6a00:9085:b0:7e8:4471:8de with SMTP id d2e1a72fcca58-81b7fbc91b7mr5136728b3a.63.1767859762235;
        Thu, 08 Jan 2026 00:09:22 -0800 (PST)
Received: from visitorckw-work01.c.googlers.com.com (25.118.81.34.bc.googleusercontent.com. [34.81.118.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-819bafe991dsm6900582b3a.16.2026.01.08.00.09.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Jan 2026 00:09:21 -0800 (PST)
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
Subject: [PATCH v2 3/6] dt-bindings: input: google,goldfish-events-keypad: Convert to DT schema
Date: Thu,  8 Jan 2026 08:08:33 +0000
Message-ID: <20260108080836.3777829-4-visitorckw@gmail.com>
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

Convert the Android Goldfish Events Keypad binding to DT schema format.
Move the file to the input directory to match the subsystem.
Update the example node name to 'keypad' to comply with generic node
naming standards.

Signed-off-by: Kuan-Wei Chiu <visitorckw@gmail.com>
---
Changes in v2:
- Add reference to input.yaml schema.
- Change additionalProperties to unevaluatedProperties: false.

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
index 000000000000..4d359c9be600
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
+        interrupts = <0x5>;
+    };
-- 
2.52.0.457.g6b5491de43-goog


