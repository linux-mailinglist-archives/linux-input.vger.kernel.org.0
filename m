Return-Path: <linux-input+bounces-17045-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id AA0B7D17BC8
	for <lists+linux-input@lfdr.de>; Tue, 13 Jan 2026 10:44:00 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 0CEFD302D5F3
	for <lists+linux-input@lfdr.de>; Tue, 13 Jan 2026 09:31:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 96A1538FF01;
	Tue, 13 Jan 2026 09:26:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kySEflIu"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-pj1-f51.google.com (mail-pj1-f51.google.com [209.85.216.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3871A389448
	for <linux-input@vger.kernel.org>; Tue, 13 Jan 2026 09:26:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768296417; cv=none; b=qdFjBs9CEoYlce8bi3PVmaPGdlcboqe65O+w2PdfC2FYTDj1YwTJe7kfhm5Qt7MKT1glG6qsCq+xd4cxBUjh1GT6Vxyo8+v+JxAeAG1XcIyN7TVsIyRJlZWGniYbg9XvpoQ8bogPNIa1UlNtlsFTMHpZ+1iW/9XAcJUPF+E+a90=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768296417; c=relaxed/simple;
	bh=+L8oRv6c4uzxGnAOgO1ncLSet2u2lLn2QoYO/8E8mV4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=J+UIMpa09/RTjmgjgLzkMxK7Qfpa1aeT/0DjPhA2coxRD9qnp9lySrz3owHBkzRydL+Ncs4hvIJT5jxuKphv3oVjNqZiAOuGWwrJqBdaHViGS9Ovw1jZx4GsSM13mQemmq5Hu/PEpu3sWm3T+TMnZ7FBIo6Wreb/vuU5kXnvzBI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=kySEflIu; arc=none smtp.client-ip=209.85.216.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pj1-f51.google.com with SMTP id 98e67ed59e1d1-34f634dbfd6so5302991a91.2
        for <linux-input@vger.kernel.org>; Tue, 13 Jan 2026 01:26:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768296409; x=1768901209; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=aq61suyXUukebztJUE3K7EWOiO6kPR6U4DExpN7jb1o=;
        b=kySEflIuUilN0f+EMaydKBA+7sgyMwOtjXgaAgqis3XYlF8IEIrAIyWTXjmQ9vPspd
         qEfbh4uf7kSUOL45OkXUhCBp316mYLdJOJM3q4Q6o/sGcJ35XMyytep6RHqisQ7Whjo2
         4wqLZma26ll0xwmeRdVR1RzDW1aBP3twbXfbReM4SSW1lnyVrf1q1Rl9bhiPhF/Ltz56
         2FMco47ydttcGqeJLFTNQVcn021tvufj/XJbkJ8MJNsaW34/kGyz4M8jLma+wFDhfBxr
         wmlFndAULJe3xYfMhZDJS2jdxrhyWZVz6qU7cD5bT3PUVzAOiRkWL6a+2HKk3iU78oRC
         CtMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768296409; x=1768901209;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=aq61suyXUukebztJUE3K7EWOiO6kPR6U4DExpN7jb1o=;
        b=wU1zlglYfk/5hcrsYi/USCfSdXpbJIK0R04XQ8K/A6RmCTEnzyXxYdjBRXXiDLlff8
         JCy7+Jave6OvV/X1i/AmcBt7UXCWuJD0gTvEelwEKZDfOr+AVs0LR6q/8+L3jr/txFBr
         otOCcQMcC2gV+KZrL1ZBGyIRomCi/OqcXF5BQ0eeNTljTdSx4czJINvjekdxxlIE/tCa
         PDuj1YvmDlJN8y8cswKfBbtZ9bbmuyu0IpJYNqtP7b0+Ov4Pi3syTl5luXx4HeWPfNvC
         X3kZeK6T+BgrSsHW0/HPDgx1+Wf4m3zKL9if+c5Q0OvdO6YgFX/bI467zrEgoChz+GMj
         Zj9Q==
X-Forwarded-Encrypted: i=1; AJvYcCXA4dBCvCLKMdKHahTfaE6736Y3ZQ3ndd35LNJy+aVuqwk3kvlBS3x80ww9kiAfm8lcicSP57OpFZYBOw==@vger.kernel.org
X-Gm-Message-State: AOJu0YxU6ar+rohpRKCHSqLoB0Dg+DmyMkaM8Cw+3cQyFz7mwEJIbK7P
	0ZOvtSutA3G7ykrNcVD8jDNhPjW5u8RTFz+IQvI1m5fNiAa/Whz9fbYM
X-Gm-Gg: AY/fxX7XHryx8ApZ5sLvaTpODishFdLUcyZZ5kpEvzg13Mbb3spitlvgh36KtlMYajQ
	CfT/Km51lETmJGEugWR4xLISKzWPQPWXUJzWshfGpcC1AevBpujG5/t97kjav44LWLLSGIhjo9N
	s6kwImVkyH+CAijWHt1x4ctCT9d6cHrCRbrYK7MdQvGIMkbk/kmbbFwqZZQjUBAhxfqW7HsifCJ
	CKECeKAlUeTfMicUm5LqFQzD+uJ3WS9gYN33RfrRHsxBPHTnauKY8GRlsEEn8bIeIii7O95cLtM
	sC9Wf6+GB3k7qL7mlz/LkY32/GLodmfd98maAD3b7rTnvs7ZxMkP6r7CdV7WdUt34t4ETNNz0fw
	bDlqgMmdrhwAF/0z7OgNTG7QsK8vyybb2rT1qfHEOAv3XGbP5/EywlcBpPiP910Jn4JPhqRobWq
	1Hw8Yle87xo2JKd4MSRKov7XJIx5j+AlHYFZrvRO79rfB9A9JnjDFwM3S9lR40YTCkdV+qodbsR
	vsgn1KjACyzcIjT90CSBA==
X-Google-Smtp-Source: AGHT+IFysOWrChXhSoJPQJFZ+6qYg/6GiILncbhIBk3UgY6IvdbI61uVn8gPqLHEqaP0DqKTMcvR7g==
X-Received: by 2002:a17:90b:2647:b0:340:dd2c:a3f5 with SMTP id 98e67ed59e1d1-34f68c30870mr18506943a91.3.1768296409472;
        Tue, 13 Jan 2026 01:26:49 -0800 (PST)
Received: from visitorckw-work01.c.googlers.com.com (25.118.81.34.bc.googleusercontent.com. [34.81.118.25])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-34f5f8b0f67sm19483200a91.15.2026.01.13.01.26.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Jan 2026 01:26:49 -0800 (PST)
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
Subject: [PATCH v4 6/6] dt-bindings: display: google,goldfish-fb: Convert to DT schema
Date: Tue, 13 Jan 2026 09:26:02 +0000
Message-ID: <20260113092602.3197681-7-visitorckw@gmail.com>
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


