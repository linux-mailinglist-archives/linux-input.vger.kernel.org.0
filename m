Return-Path: <linux-input+bounces-16868-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id BDD2AD04754
	for <lists+linux-input@lfdr.de>; Thu, 08 Jan 2026 17:40:31 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id D0C50352AD27
	for <lists+linux-input@lfdr.de>; Thu,  8 Jan 2026 15:31:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BC00638944A;
	Thu,  8 Jan 2026 10:01:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KQnqOUnL"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-vk1-f172.google.com (mail-vk1-f172.google.com [209.85.221.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8BEF938737C
	for <linux-input@vger.kernel.org>; Thu,  8 Jan 2026 10:01:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767866510; cv=none; b=KMdr90VI4MwEMoQZmbzLTNuOg3xyVUMTykXfr7zFnbUTqEFuANKheztFQWowHbqiFgfNPJ/75wUW7pdSlM3FBQwKrRKirgQut4r9e6t/B/KtvJdOLgyvXxpJwvs9MvTS07op5dCgFFLLEKrySI1Vhl5/zQHve7bg7NJsJAew5UY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767866510; c=relaxed/simple;
	bh=+em6k554hiEdgZ3gCIS3vNjm0IbnUUOfSriX33xjyhs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=uMnbCtZwqDH1iZPhMAAGYwch/jvoa9Cz5CMBiO5I6aI2nm9NZtbBs0mDhOx5IW+KXJm2Za4c1rMtouSpn9sbHNJ8lVx9J12K1YHLv9A+HU4HC6/A82WK4Gmw7y7cslY21dlrdebOCCxSk1NLvYuDnfXYbVj5hq3LNNXps5jD/Pg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=KQnqOUnL; arc=none smtp.client-ip=209.85.221.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f172.google.com with SMTP id 71dfb90a1353d-563497c549cso1126210e0c.3
        for <linux-input@vger.kernel.org>; Thu, 08 Jan 2026 02:01:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1767866504; x=1768471304; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=s9Cv7mdPPcZ8e/4RiioRb+FP1zONlTuWhguDLBncdBY=;
        b=KQnqOUnLuC/7LUiJ6QXLN+Wsgwk2oJ/4TfXNt+omGPirgVxz7gJoWimF0Wz2J3Z1Zy
         hEOvtI6AS48Sad31NthlQ01LbHgjiZOJ0LZ8qr5LqxfaGG7kpXMN2ZHGihShD9CVzrnM
         8lx60gEG7/2I9mtzMl62mp/ntmRAzV9cqxSTS2yMnSaEjv/D3U7pJqgRgkJNshUyLHeQ
         20aKki5otIv8Rma/7cvEdqVjpuG/PpPFHtPuItBXq9lV8tvLZwigGhRciaoFxxYx9rhH
         rtiS/BTkg9sUoswb/Jf8NDS3cbOIQ2hnIyywCgW2amOEctQne/5zdidnAoCW4qzDw0jg
         sG5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767866504; x=1768471304;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=s9Cv7mdPPcZ8e/4RiioRb+FP1zONlTuWhguDLBncdBY=;
        b=i9M9dWsZOSND+fHYx1l4mtuCPa8TbMxIK4mVUnjpRtHfGkOavlvmcr1005xV3Vvqjc
         GhJak8rGKTCa/wtFFexW0RsCoWOvZlfmtf7kdIBW1eHUFK5Um5tIeVv2MHyypJwhj3mU
         W23VITOh3crGovp3JNRgxyiY6+SepoUo2cwjWAZGrK23WV1BadYG6InjfJq9OPz2Y7hc
         VpLNv/LvJImlRKw/b2VGyIN5mvQGFkkekCBMBT81XcMjlKjHgi3KrV1NfKg7gGU8GB9y
         p/2tEoSh7nnTItnH475tY5BLgkIljmkiJYBuUE/l6547+Z4ih8KO5vJgSTf5GpS9UYao
         RBrA==
X-Forwarded-Encrypted: i=1; AJvYcCXFqEjfIEYXp8mOyxI4UkTHPHelMPZ4ocN+ED8T4e26Zyas3vm92fJO4qabnk8UAF8zrHU/5fiSZiu9Pg==@vger.kernel.org
X-Gm-Message-State: AOJu0Yx5GvJ204gdRzg6hbfu7anPowrbY9OuQVPMd2N0twhJ5JamjkdS
	X7bR+XFS+FJsHnWOpygB4AMuYYmFfmRZgxt52AF0YAvPS/mvzslW0MgyZqxBDQ==
X-Gm-Gg: AY/fxX7dDkAWAYAeZnrpb6RTxZf47tzwUITURlON1UfeP1WJ/c13jpWTirI3yQlyIdO
	ieDCNRm9aDlONuzjSzn+IYkure0rjZAYoNGLUO+8HV9nVW7+h7Ak2SXAGnwlbg1u8pXZBY6JxxG
	ZxpUq6TzZJxtiaOoRxEt2yH89AbLPo/sxyUAZsx78kbrRsMyryG2JvOWHy37+I6CNVk2N8OqWCO
	eK/zW8r7U44QZ9KeTycgLW+AIk4/RUqOXOdvZzTK8scNSXXg3Y6sIq8ZQAIFdEBiO8tUjvKtTFT
	5qyqQap7rvB16alTjkuuznGOcNOU/RSTPc+8oJisWjUVLphwn+2nyrLwEEBGMwrYG0SYwIYb2Xr
	gLMGSINN2ItOt8n2WR24MCWyIRA7/Q2tKnNn2IhujmkH3iUnImQKlHKcJF/NipTd/U54QlHaczV
	7rLCWnN1b016hzqKXe4O/XT1HEBUz2ikoQmhSJuweb7A7JavIqHHLXkNWP+6K3AJ6zYVeOtpxT1
	wUMJsJnKC8VPXAUN9LWG0PA+M/Z10s9
X-Google-Smtp-Source: AGHT+IE5lf3uPbw8VErEKzhFGGbzHGx8u/fDHReHMHASFjL4yvedLS17Wjxspaaf5SF45aWguaeksQ==
X-Received: by 2002:a05:6a00:8c10:b0:7f7:497d:8118 with SMTP id d2e1a72fcca58-81b7eb26e99mr4452899b3a.7.1767859776927;
        Thu, 08 Jan 2026 00:09:36 -0800 (PST)
Received: from visitorckw-work01.c.googlers.com.com (25.118.81.34.bc.googleusercontent.com. [34.81.118.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-819bafe991dsm6900582b3a.16.2026.01.08.00.09.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Jan 2026 00:09:36 -0800 (PST)
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
Subject: [PATCH v2 6/6] dt-bindings: display: google,goldfish-fb: Convert to DT schema
Date: Thu,  8 Jan 2026 08:08:36 +0000
Message-ID: <20260108080836.3777829-7-visitorckw@gmail.com>
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

Convert the Android Goldfish Framebuffer binding to DT schema format.
Update the example node name to 'display' to comply with generic node
naming standards.

Signed-off-by: Kuan-Wei Chiu <visitorckw@gmail.com>
---
Changes in v2:
- None.

 .../bindings/display/google,goldfish-fb.txt   | 17 ---------
 .../bindings/display/google,goldfish-fb.yaml  | 38 +++++++++++++++++++
 2 files changed, 38 insertions(+), 17 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/display/google,goldfish-fb.txt
 create mode 100644 Documentation/devicetree/bindings/display/google,goldfish-fb.yaml

diff --git a/Documentation/devicetree/bindings/display/google,goldfish-fb.txt b/Documentation/devicetree/bindings/display/google,goldfish-fb.txt
deleted file mode 100644
index 751fa9f51e5d..000000000000
--- a/Documentation/devicetree/bindings/display/google,goldfish-fb.txt
+++ /dev/null
@@ -1,17 +0,0 @@
-Android Goldfish framebuffer
-
-Android Goldfish framebuffer device used by Android emulator.
-
-Required properties:
-
-- compatible : should contain "google,goldfish-fb"
-- reg        : <registers mapping>
-- interrupts : <interrupt mapping>
-
-Example:
-
-	display-controller@1f008000 {
-		compatible = "google,goldfish-fb";
-		interrupts = <0x10>;
-		reg = <0x1f008000 0x100>;
-	};
diff --git a/Documentation/devicetree/bindings/display/google,goldfish-fb.yaml b/Documentation/devicetree/bindings/display/google,goldfish-fb.yaml
new file mode 100644
index 000000000000..48b9c056d9ac
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/google,goldfish-fb.yaml
@@ -0,0 +1,38 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/display/google,goldfish-fb.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Android Goldfish Framebuffer
+
+maintainers:
+  - Kuan-Wei Chiu <visitorckw@gmail.com>
+
+description:
+  Android Goldfish framebuffer device used by Android emulator.
+
+properties:
+  compatible:
+    const: google,goldfish-fb
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
+    display@1f008000 {
+        compatible = "google,goldfish-fb";
+        reg = <0x1f008000 0x100>;
+        interrupts = <0x10>;
+    };
-- 
2.52.0.457.g6b5491de43-goog


