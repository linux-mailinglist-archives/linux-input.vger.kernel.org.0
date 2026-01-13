Return-Path: <linux-input+bounces-17049-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 6706BD187C5
	for <lists+linux-input@lfdr.de>; Tue, 13 Jan 2026 12:28:42 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id BE6BD3083156
	for <lists+linux-input@lfdr.de>; Tue, 13 Jan 2026 11:25:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4475938E5F2;
	Tue, 13 Jan 2026 11:24:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="TXOvSB/1"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-pf1-f177.google.com (mail-pf1-f177.google.com [209.85.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3BC4838BDDD
	for <linux-input@vger.kernel.org>; Tue, 13 Jan 2026 11:24:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768303486; cv=none; b=hX6jMDq6W+fj/Iu7nYHUSzTTy2BfZAs9LdNnEAFyX9A8aLZz0AC8a5iTp1SUud9pAlkdwhaQtRrNmr5ZfR3lkUjONpdE6mSBe0chTIaPXXD75wuEFfBc3AFpKoK3NHOG+W8N5WmfelSExNSdv0cui7r9hCozD2ivlMVs5DClL6g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768303486; c=relaxed/simple;
	bh=zdNFAH0iTWr7CYfBHRXif+JE5op8kPFWmv5y6FI3muw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=fsacG4kHpw4a8oLfJMRXqv9IXB2IkusJzIozCbEzTXQU64PgJu8wENQBwRfWxATaVVgJT5lqDGUAFOGw7MYe5pIFyn83SuLiyzmS7M4ekJoOKtUWXQzfD5fQSSrfBCiFBHXbtHEsDRX65WxEQDR7MckmKeizg+jX7FPmCMv+I5k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=TXOvSB/1; arc=none smtp.client-ip=209.85.210.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f177.google.com with SMTP id d2e1a72fcca58-81e9d0cd082so2996428b3a.0
        for <linux-input@vger.kernel.org>; Tue, 13 Jan 2026 03:24:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768303482; x=1768908282; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=d4hgjP3w88kDagdzWx8wSWq+XQR1e0+zfKSduukvDaU=;
        b=TXOvSB/1qbQo3axMJRvhS3AjlAteMjwLVfMXx4jeV4f5JKsFvmeIiP9iONoZVurdfS
         HQR7jgKEA7UEpsi8lcodChhGBy3wzKSAWtr34Ma2iqxuraag/+wQRxnAtT56RuZAlDyv
         Wi2obHTHUS3629E3F8FefDWXT+o7/unzTG5661b1CcXpXuOhnWAAfSh0pHFsu9ErY2pp
         T2r6X20zFDRATl4dPptEIHo9ZIXlKzZH0YpOfsrPYk62WtZMCVFGv3XStS7a7iibmskG
         RzVR3FP1K++U4u3XXwZPrzWkw//e+RoYQwo6CJ0YuCmL64c18aIf6k88nTRPG1z1Fq3W
         8Tag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768303482; x=1768908282;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=d4hgjP3w88kDagdzWx8wSWq+XQR1e0+zfKSduukvDaU=;
        b=v5E9pzyUr2EvYt8YS78weDsqFSQuOEzp+35KDNeIxVjNGJOt6VlT45xHLREdkv8bz4
         1uMJ9meXZiCrhRrN1OnFVRF5GkpVDHhqFtgjfs2bFdnTEDRiliisjcWM50Zf8xIKG4vm
         185QcZ3mEapzKpzUAF6gwHKnb63SjihnJryzJMO4bO3im0cTQo2UzOkSk+tqaQxNtEhl
         qpI4bgfe3XTOsfbN27S599gSeqPgTjetlujpxw9bPiA9tmO8QqGrJ5QwWWipDOg0bbWX
         uH8cXx68TvC93e8vryFzP80iLqblouy5dEznLIAX37ybAzEQJmpt5MQrgPRFjcbGM1SB
         B7mA==
X-Forwarded-Encrypted: i=1; AJvYcCVnfG7um2nRUgL/ZYrSgMfp3q1JJXd3n5+Sq/BV/JA86/MIXNvKgE1/VTOK8FAFXqSG/GKdjeCeMx4XbA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yy51NxVZrwX9ARkUThVb8WF3eb4ea21AtEyGvfXO8CLNLGQKshx
	zA64Ze+Kl2gw16bwRD8F3STsAN7kJJ23N/bCzGoJMlGFyCdpb7DQnHGC+uYsZA==
X-Gm-Gg: AY/fxX51xOhTiJ+aEivBbmfrkX9lcxQUib0EGR6Wc93OEOuwlTCWxoR72Bhd7/7CSeN
	7J0PeOVJe4qZCBTT22NKIHKIZIzj1t7ntdr1fIY8qpcjBy3VuotfbQ7nKfWZjP+tG3rfglw3D1W
	s2pilVkWYfnob2Ej/ysUBl36W3j+FAvGL/2PhMXrkcmMV/NBalbMhamKw6PxuJehIZmaCwQ+zI8
	uoEdgfnsNg1f7yvaWBmtXUGFmPNUMcpxt5WCJuGOy+c1SYJ4HTOTVrO0FRvDRoJfEfpniYBNHOA
	0qgBrPh7SlnOdUSnNTJNBSmxkzOWsilU6sH/mH8xtwcjYPt9l5Z1y7+IzZ7flIjYd3OaewBaQlh
	V46d8nyshjB8h3byZKO6TEpDzg1ZSHBrniQ1K0uXg2trtofrNbeTyiKXGFQBBeL3EvLH9qzi9Br
	1Z0TWLaruI0xDPsNS00P2v0HTNt+owrPLr8geKoLnAKOxeGwJ6G6Fz6IpWERwGmbGZMaDCRKF2v
	a06tKEgiH94n3C46CjJ1Q==
X-Google-Smtp-Source: AGHT+IERyXXRObriIfp3G5vGgqAQ938C3mDCOXYLyt4LrW1z/WW3eq0L+wGB0uC11elqp7ivzib0lQ==
X-Received: by 2002:a17:90b:38c4:b0:340:fb6a:cb4c with SMTP id 98e67ed59e1d1-34f68d231bamr19378825a91.30.1768296384398;
        Tue, 13 Jan 2026 01:26:24 -0800 (PST)
Received: from visitorckw-work01.c.googlers.com.com (25.118.81.34.bc.googleusercontent.com. [34.81.118.25])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-34f5f8b0f67sm19483200a91.15.2026.01.13.01.26.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Jan 2026 01:26:24 -0800 (PST)
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
Subject: [PATCH v4 1/6] dt-bindings: serial: google,goldfish-tty: Convert to DT schema
Date: Tue, 13 Jan 2026 09:25:57 +0000
Message-ID: <20260113092602.3197681-2-visitorckw@gmail.com>
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

Convert the Google Goldfish TTY binding to DT schema format.
Move the file to the serial directory to match the subsystem.
Update the example node name to 'serial' to comply with generic node
naming standards.

Signed-off-by: Kuan-Wei Chiu <visitorckw@gmail.com>
Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
Changes in v4:
- Use decimal format for interrupts in the example.

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
index 000000000000..0626ce58740c
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
+        interrupts = <12>;
+    };
-- 
2.52.0.457.g6b5491de43-goog


