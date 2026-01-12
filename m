Return-Path: <linux-input+bounces-17000-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id C3D09D1544D
	for <lists+linux-input@lfdr.de>; Mon, 12 Jan 2026 21:37:38 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 3D81B301B669
	for <lists+linux-input@lfdr.de>; Mon, 12 Jan 2026 20:36:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6256F2C3768;
	Mon, 12 Jan 2026 20:36:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hoL/UU6x"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-qv1-f41.google.com (mail-qv1-f41.google.com [209.85.219.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E11CF326931
	for <linux-input@vger.kernel.org>; Mon, 12 Jan 2026 20:36:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768250194; cv=none; b=Y+kGTOiFN9+lLQfdDFXPA6S1waiqzZOk6af5JF0IPvZ1fb4jiACZdF1zEc+FVdtA1PQbkWW6FwGlSDQw7UDBuryXU+nLhoraTfF0aCLciDiRhTczCeFsFxgVpyXapi3CMS5pDZRBe39YF0F58NJ8XxxS8gib24+2m1awxflpEMg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768250194; c=relaxed/simple;
	bh=x1koErt0KZrKg7lQQJMxHMUYCfWzQV0KokubZfs0FJs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=KYuOengF32HO7sxdF++IRb+HmXSL/AjyVjkcJWWHoMyJMMbz4KJYbucRE3kCySy3t5b94fcuWQJq9bwSsvt6Z48W79vW4k/7N40EzLoAkdD8fFi85TFDn0UbsnCK88n2j/pP1cYZOAPrc8QzNDOsPDWobrhjuo2R9g/6AdZjBkE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hoL/UU6x; arc=none smtp.client-ip=209.85.219.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qv1-f41.google.com with SMTP id 6a1803df08f44-8888a16d243so64326086d6.1
        for <linux-input@vger.kernel.org>; Mon, 12 Jan 2026 12:36:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768250191; x=1768854991; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MnJl4mjA928H7c6+CxPcUynMWnjGzO8z//ft5AvFLSQ=;
        b=hoL/UU6xQWnrxIY2jJ26FKeJoap5pl7vA38+QHmlP/08qg4ta8qyTQ4BUigz64wfTB
         2jJosMt1bim+NWbpClNS6cSFED5hGypzuQ1QE6JBhcLRPpmP11oFwMPLmgQ7nLM1LCml
         xxIoQcD0gvn1JWujv7uH1WMrI7HHmFeklnmEA81hsHpRbebH6RbnyTqS8J4ZeFn/bJxm
         wjViaITpDNRdSwOfOtIlJpmBgZqewQumXHp8B1OLLQV57s/AVfwGhlTJ432Q7rqpZpTb
         pXDiPb85BN2ODUPJFD/yasIkcpxFXGdkfr5fhcDa57nkublh4siIhXvuXy0v7uEDKzHp
         RffA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768250191; x=1768854991;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=MnJl4mjA928H7c6+CxPcUynMWnjGzO8z//ft5AvFLSQ=;
        b=BAu2Tz2XtJzLD1xsMiZDGO+Rb2rwifD1tHms6ROpLMkEa2dwbnkxCHFM/29EltCSUA
         XECUCfs7v8k0gA7mXcfXDgNloMbBligAP+9m2r9O3gU0a/ryk3a7PghtwPz9hFHFkl2C
         XdecXjCY4EKZkN7i8SBBqxp2k8lwIUPeTs43PlMtVMrZqFMB6gbsklXUfKIu90a+IJJ+
         2sLkhVOFYh1C2/NdeNGtYGx3v41pV2mGEAMQ9yoxNEzO/42Ki8pLgzF3ozxwpyNFlkMt
         xy+IMxLdHtB/cVClixvEoQfGCjxl5fvo0TanF/FrA5a9TUCuPxhWbssFd4hKQGrBOyCs
         3UvA==
X-Forwarded-Encrypted: i=1; AJvYcCVvbT6VM6CnRwOreMzlpHk9Sd57LCV1Y4Mk9g+N4YdtfbADn3XkDnPKXVkjA3T1vtECQgoRij4PCrfaZQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YwTVupKQ4G839Vmy7GRr2pN19L4ODwZzx9laYLsQSbB1nbG5yo3
	wMSRC8ADrnJIqlw5aLhJl0uJJ9BRkAa2xZ73EwdEBbWHYnq9YFEmqdkJyO+X4w==
X-Gm-Gg: AY/fxX764ZfQMNSGD/FIhEZDPv7uAEYVuZiuu/v21SmHF5GUeCwCD5FEGfbtC0f21+W
	tHMvtdQHaL9pK68jrZVRkFYpoOd3DNqujsUfMXBj1ZiFeuRyq2Rgk0WJD/FzwaJ0nyV1Buihew3
	Xw9i06mDXmiB7usad55e+pG0eZVJ0b+tjg4erKGGnc7oP1lgUZ+l7le4x9PiMod5WfV3+DFTYon
	Ns2l6ph6obcr6pdQxsHzB0VJvDgXmaie2h1NjFDx/VWvkfoDMVTN9C13kkHKOZJRP7jAHd1IPHa
	Rh44+HZCxjq1Zn2HlMa52Cs4z4RegcMiFudiwWFFkVjX8mTD7QIKOS5nLd67QVn2Du0kkNar6tm
	FQO72IKCd8xtS19gfou5qmfdvOw3+Xur0xJxSHqqVNrm67Q2Vmuapa2i0/q6h5aM2n4joJHLgZU
	QJ3tqZKePXRROMqcuZQw5yAEmGW9JdJqHX47GkMP/YeXhQjIA10fa97PzLapfJbQsR9w8MKBHcu
	TiH+owhXDJsU2THW9oDzg==
X-Google-Smtp-Source: AGHT+IFEOJtKiZOekw3QKky7cg+SUdsdDlCfIy6gQ1Y92OIF6fv5PXYBPdHBg9wlGXMZd4H/lsyNmg==
X-Received: by 2002:a05:6a20:3952:b0:366:584c:62fa with SMTP id adf61e73a8af0-3898f9053f9mr18835078637.21.1768243935601;
        Mon, 12 Jan 2026 10:52:15 -0800 (PST)
Received: from visitorckw-work01.c.googlers.com.com (25.118.81.34.bc.googleusercontent.com. [34.81.118.25])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c4cca06b16fsm18874197a12.31.2026.01.12.10.52.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Jan 2026 10:52:15 -0800 (PST)
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
Subject: [PATCH v3 6/6] dt-bindings: display: google,goldfish-fb: Convert to DT schema
Date: Mon, 12 Jan 2026 18:50:44 +0000
Message-ID: <20260112185044.1865605-7-visitorckw@gmail.com>
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

Convert the Android Goldfish Framebuffer binding to DT schema format.
Update the example node name to 'display' to comply with generic node
naming standards.

Signed-off-by: Kuan-Wei Chiu <visitorckw@gmail.com>
---
Changes in v3:
- Use decimal format for interrupts in the example.

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
index 000000000000..36ed77cbbcd7
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
+        interrupts = <16>;
+    };
-- 
2.52.0.457.g6b5491de43-goog


