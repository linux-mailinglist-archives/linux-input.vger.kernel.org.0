Return-Path: <linux-input+bounces-16744-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 02885CEA923
	for <lists+linux-input@lfdr.de>; Tue, 30 Dec 2025 21:00:02 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 32C62300F9CE
	for <lists+linux-input@lfdr.de>; Tue, 30 Dec 2025 20:00:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9CF863195EC;
	Tue, 30 Dec 2025 19:59:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="AolrrE+/"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-oa1-f44.google.com (mail-oa1-f44.google.com [209.85.160.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 02B3B22258C
	for <linux-input@vger.kernel.org>; Tue, 30 Dec 2025 19:59:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767124798; cv=none; b=eJcKwynX1Gp/q+1VuySXJT9MX6YXD5dNU0TIxMUoF94N/OEbQYaF6SRo6v1y8f1Le2nyR2Ke3GteYA5WcIkeQWnELYacq9lxXC2ftbKxYZq8cwUvtgnJ0Q4gyODipjw17bKm6hP1Ip2zTVhTbm4O9tZGq6Xjfl9Eik1f8aweayg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767124798; c=relaxed/simple;
	bh=4Uq/LuMFJ/bKwMeSTNcN1XmhonxlOFuHeuhk/6pGReA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ZUwQIaFkS/LljoJVtjG8mCSp4kjlW1cLkM6qhHst+Kpj8UwlTRJqK4ZomjlcmMBeVv/FWztXOpA3ouAW97dOTLX/Y1nSJnwQDrb5DYPdHvN2ACoKSsMWOhWysCS+q3ALH+nFsyyWrtFuEzENGHCD5OjMSqowmnbKi4t+KfwuFeU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=AolrrE+/; arc=none smtp.client-ip=209.85.160.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-oa1-f44.google.com with SMTP id 586e51a60fabf-3f0c93ecf42so7051636fac.0
        for <linux-input@vger.kernel.org>; Tue, 30 Dec 2025 11:59:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1767124796; x=1767729596; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SQ2qeV8/CMzii4Cc7pVXwWXbCg7/CDjibpfP3lPkew8=;
        b=AolrrE+/AvCokqeqq+L6sAGm5xhUVLZi8ETzBlhMSfsXUw4VPTffjgQ8dTchAoNm9O
         2fqXB7Vz2PO0ADnWQhG7LJ36hR+Soq18cL6YNGyEIzsmOR1N+TPMVosMAsDfjubJwtwa
         TX0N61LCO9t2j3PuuXXDOcrqRpSGzNnWHtcfG2sNPOzMGOKiNvb8ibGAifZ+SCRDbEE+
         ZkJGiHrghCnkgXn0PN/gf+X2HuGfyOzLtOo2RaK6MvXqd1OplL5B1IL6c4peQGlC5owR
         E1pVPJkv6mHMk8BQjaXMM4WhYeLy5apLoGYl0EWdfi77HcttnFX5hd7ZR9OKQVhGONpK
         hvXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767124796; x=1767729596;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=SQ2qeV8/CMzii4Cc7pVXwWXbCg7/CDjibpfP3lPkew8=;
        b=oD0B7DdkX5LQ0My/LkFmNHTUTt2VAwKIaQXTovAiRSWFwYL56WOnQr2bOOIPtCOVJ9
         3jRpkgRg17Ur5C/870aU05r6RxbC5IME6EOsfHzxnqOtnzs44NCXDl0mNreYdUY6bBFp
         vsULRfa+MCDgeJeyQy4RbIEO4gSg16GNO8iYwbs4UZgeXgGKHb8FOYThbRE6Up9GAX6j
         bUZXAO3Vk1ZmrZpekQslDikGg+ixY2ZSnYuI77p2ruzfWOZjfLLJejTxn5Lu6oN5I+9u
         lFdyZ7ZVxu6pwEt8LMuj0YSs/K786STr74IcHFXBX7yGVgOI5yw+oPe/5BAE8g8+xdXz
         zvJA==
X-Forwarded-Encrypted: i=1; AJvYcCX8H/1JsL54iHnzQjQuz0Fm+POVc6h9HsYZRmATKhXa7Pzlp4XcWKB5feQ/M5B2xxzsLT+Waw2htfA+TQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YwkeuZvL4/aDS+Pr8JbJu0DjmaCAlJSC+4TsGMnTFVdqYagJ0O6
	mDV/u59mnRQFe5TP/41sGG4WRHj0OA8mDb4iyGGCqWco01/8vUz5oA70OnjtOA==
X-Gm-Gg: AY/fxX5LfVZrHLz48JBzO5fMpCNhVl62TGZgXOI1ypgJsWIeg8eaHvISvI7zRi6RKZC
	QqoYaKqCjEuCadhbJXS4PpHHFuXvXBysLze52UtCZeoXwO3NaORnsOQxpEtavPpE3EF+hnwQJcC
	l6nfwAxq5BBedCY8t9ACOq85C1OwnNgkK5N2zLUbRwZLTr9QPHA/lDLX5mn7eX1P7BakQbs3Dgo
	hFWdgd+3jzAizekRgzjlt6QR+1Nq3KFP0QivKccpGLKBBajNZcJDQEscPQ/g2hyJLJZIpsfLoa8
	HPjbeef6PeyiV4juo3y5CoPGtZVFaSP/LHyUwsMcljwggHVeAi1Ihw7G+/N/Z72i33/L0OVLclf
	6WCikpcPl5PxZiyNG+mRv8FL1tMIMMzFym+LaE3qyhJjfAvfqrSQujidJYOK3DPwvWm11hzW8wL
	Kpev7miwHMb8yZWZhvkkhCRVqW0v3kdoFhI+YgR9EW7/xsC2tj2AgUK/bKWCqcw3uvRCBkueG7e
	2TfkqZ/UWQZwujzymw5AKGtC2voXryB
X-Google-Smtp-Source: AGHT+IESyaAQ5T3YAYk5oG3HpiGG3dgsPGYC0NsIxOY31vJ9VG1hZq4KkWvGFlOWl7CULDPAileC8w==
X-Received: by 2002:a17:90b:3843:b0:32e:4716:d551 with SMTP id 98e67ed59e1d1-34e90d6a42cmr29651001a91.6.1767118281443;
        Tue, 30 Dec 2025 10:11:21 -0800 (PST)
Received: from visitorckw-work01.c.googlers.com.com (25.118.81.34.bc.googleusercontent.com. [34.81.118.25])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c1e7bc69728sm29598278a12.19.2025.12.30.10.11.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Dec 2025 10:11:21 -0800 (PST)
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
Subject: [PATCH 6/6] dt-bindings: display: google,goldfish-fb: Convert to DT schema
Date: Tue, 30 Dec 2025 18:10:31 +0000
Message-ID: <20251230181031.3191565-7-visitorckw@gmail.com>
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

Convert the Android Goldfish Framebuffer binding to DT schema format.
Update the example node name to 'display' to comply with generic node
naming standards.

Signed-off-by: Kuan-Wei Chiu <visitorckw@gmail.com>
---
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
2.52.0.358.g0dd7633a29-goog


