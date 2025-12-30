Return-Path: <linux-input+bounces-16743-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 23898CEA91C
	for <lists+linux-input@lfdr.de>; Tue, 30 Dec 2025 20:59:04 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id E6C84300FE19
	for <lists+linux-input@lfdr.de>; Tue, 30 Dec 2025 19:59:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 71A5431D38A;
	Tue, 30 Dec 2025 19:59:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="aRz2k/K/"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-ua1-f43.google.com (mail-ua1-f43.google.com [209.85.222.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D1FE01F4CA9
	for <linux-input@vger.kernel.org>; Tue, 30 Dec 2025 19:59:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767124742; cv=none; b=RTvZPkJOKAMz46yoNgFkfzrmU6aXZAzARA2AzNyGdVpyIMFaK4fPyP1PaQaYaX0gAid91I68tXogZTn8wzxnOnkt0ylM8bPlNNpFcZCX4cbnNbJoX5QZJBwWO13ntNbG+LgB2ivaHrwhn8SNZEl9AM2/3RQc7z56TPGGUq1IcLA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767124742; c=relaxed/simple;
	bh=a9IYvFqlG/UaJElPMyJFzg5gch1C9rdzE80DQMDwPnI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=XpfOyVOZnHzLWLBR6alq4kX8W0U9BwShcwfDGdv8A7BXvFuoqY4iTBiOujx5z2X7MnScpqgPe7HqsnHMVD60KajnEWfAexduJ6JdMXMGrmbaNTo/HFYY4BFjh5dvOQJ0amFIW99PYcXVnpKjgUw3lDhdWjszMiItMdArdpnEpDg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=aRz2k/K/; arc=none smtp.client-ip=209.85.222.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ua1-f43.google.com with SMTP id a1e0cc1a2514c-9412f43cb9eso5982129241.2
        for <linux-input@vger.kernel.org>; Tue, 30 Dec 2025 11:59:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1767124740; x=1767729540; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vqq42GMedrB/T6d7mRybr+4FEurk5kHOMzPka2Yicmo=;
        b=aRz2k/K/OjCrrXmAOezko5tkmsbygSKKQ9vvjaka1joOSLp9HTWxOU8+LCRBt3V6hv
         rloU92dAnh7X80X6aX9CC4nEZNSOWnoMNpEmClGu27hgvaHNJsPUDV9A8UiCb1Y9OAzP
         XqWrtpldX3QKq4lTAOucqjorjnCe8b5LnfWeUaBap5LyNGQlDhLkw368q1w+UMB5/Jbt
         5u1CqvPkJV/f1B81hpRyw/9vP9wuH6cWXfb4HTIGyA16+IQ2QvfM5koRjYm7LEpvu4Kh
         nq8ceYhaUuD0yzlCiOz51ZOJwUFposXZy02tH3GvbQG5BBDyFn5Rr0UEoNoMj7Ktrs4v
         tDDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767124740; x=1767729540;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=vqq42GMedrB/T6d7mRybr+4FEurk5kHOMzPka2Yicmo=;
        b=Yl3qRXSPzI5bcrOcoCiiLg9I4ECFfdYKkCcq8clsQNK+YgXEPsUr4ZUBpgyMP1rw5Y
         2bmYyAjhMXiFoaVHmzLUrS0ZeDIrAsDe8rdc0p4uMZM3hIyJzSwUd3UUrYCaEtXVdZIr
         zPUqMVUN57uyNigQuTXW1GqfjVcu5jQGITi2BX8xE1rrZqLjjYGURzvKfwkWfcHl7vQq
         XJNr9sux+4Ib40+NKcjj66Tv54ZDvGxPIJZ5hlZTUASAquBVH3HF2MHf9D6OL2f6o4fa
         wM+lRPygWX1K6A6zCFFVHAMJe+zCu7MiamiVRCuTtu2c5HQ5r5iA2joSCLOVn+9nvHdt
         hLow==
X-Forwarded-Encrypted: i=1; AJvYcCX3G0xlBC1cK758tpyegh8qFzq8k+1Ce1W4hjYsISv9mgM+ggLllsCAYiDqkGAIIRBkpIND+voC5lWS3g==@vger.kernel.org
X-Gm-Message-State: AOJu0YwoJuxVKE95wh34Lml96Oh6gUS69udCowFEqnppG6m7ApmCw8Ks
	qkhPO1BcM+1yOPwPmgKj1UcJdGhXJFkgiSIPuFovsoAnXGBqo0kEG/KjcZ+pLQ==
X-Gm-Gg: AY/fxX6lPv6pMjuUu7nhQdTRJxox4wLzAQgZFklxIWasVhxhPisUSG7ishq87zRe2Ox
	WY9F9Nk15QgJ5Aw9/8KZSE2iGVdU/j0S+ZQnvcG3FT0UTSSogyO1CJtT2GJQNgtxNW6NKikPcd7
	Y/MJAyMquSHcS5o86qmL8ysUmccJa6EX7Otj3LPafsWl3zXcavBC6Rj2IW+51VkyJ6wY60J7vpa
	a5JSOtuoRl/0C9c3eot4/aiCVREnu4o/QdUCcdQcryXAgRWfiBNwL1pwovKt9dqRUvE8iAYm3ou
	K3D0paa4sUtD+SXLbf7qDWst17VgacFPqetg4YFw5vbqRNEJB78zWV5FqEr12RGMHWzfPOiPJ6C
	TW7kQ49NjSrduoPN7zmsyfcKsbNPWhm3Bj1UTB/RwTKEy7VRCxerW+k+uQZ2WxTS0L/iJm+NH/c
	MKNDwd1bwpryKIWHl401X6nZNjHaGMxJw/mWH/ibmcz738H29MYLNzQ9QHfRntUVrIhxFWGTxoo
	DfTpKCRdRQ1Iu+qsSQkNg==
X-Google-Smtp-Source: AGHT+IGG4IvGkIealWBZgvBLq7nxU8BQLyVFrfwWxsNjASkIojjiGo3aO9o10cXPbEY9owzzFvEfpg==
X-Received: by 2002:a17:902:e748:b0:295:738f:73fe with SMTP id d9443c01a7336-2a2f2732287mr344445935ad.30.1767118253801;
        Tue, 30 Dec 2025 10:10:53 -0800 (PST)
Received: from visitorckw-work01.c.googlers.com.com (25.118.81.34.bc.googleusercontent.com. [34.81.118.25])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c1e7bc69728sm29598278a12.19.2025.12.30.10.10.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Dec 2025 10:10:53 -0800 (PST)
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
Subject: [PATCH 1/6] dt-bindings: serial: google,goldfish-tty: Convert to DT schema
Date: Tue, 30 Dec 2025 18:10:26 +0000
Message-ID: <20251230181031.3191565-2-visitorckw@gmail.com>
X-Mailer: git-send-email 2.52.0.358.g0dd7633a29-goog
In-Reply-To: <20251230181031.3191565-1-visitorckw@gmail.com>
References: <20251230181031.3191565-1-visitorckw@gmail.com>
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
---
 .../devicetree/bindings/goldfish/tty.txt      | 17 ---------
 .../bindings/serial/google,goldfish-tty.yaml  | 38 +++++++++++++++++++
 2 files changed, 38 insertions(+), 17 deletions(-)
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
index 000000000000..08fa12449a01
--- /dev/null
+++ b/Documentation/devicetree/bindings/serial/google,goldfish-tty.yaml
@@ -0,0 +1,38 @@
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
+additionalProperties: false
+
+examples:
+  - |
+    serial@1f004000 {
+        compatible = "google,goldfish-tty";
+        reg = <0x1f004000 0x1000>;
+        interrupts = <0xc>;
+    };
-- 
2.52.0.358.g0dd7633a29-goog


