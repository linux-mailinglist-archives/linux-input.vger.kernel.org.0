Return-Path: <linux-input+bounces-16740-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 7DB9ECEA6F2
	for <lists+linux-input@lfdr.de>; Tue, 30 Dec 2025 19:11:25 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 952503015871
	for <lists+linux-input@lfdr.de>; Tue, 30 Dec 2025 18:11:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0F69F221F1F;
	Tue, 30 Dec 2025 18:11:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gp2ahs32"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-pj1-f48.google.com (mail-pj1-f48.google.com [209.85.216.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B82E2C11E3
	for <linux-input@vger.kernel.org>; Tue, 30 Dec 2025 18:11:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767118261; cv=none; b=qw5Qcn7rhX+agmkYCFDwoLHIKL+tdvy+KCALLqRW3Kxe7ByvsqMNiA9lVHWpK4sfj30xPSBac++3wwPHQMDLpqQE/f7MKmHTwHVWYzDrLOlkGESvisdVX5ylSUZq2B14nfz/G5VC+lyn2TdpcuBupSL/fVzmaJOe37pVMtQZi90=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767118261; c=relaxed/simple;
	bh=TPtWoE4C3jRebC+9Hd/fYSLNQqRY65T1NXTeH1DCygs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=DSggbUeouLELLggHgDsITiTP5T9lVdgO5ZxayIeV8wD8jXe1Q9p9uBL/DSpCYJXtxdDOW6gfr9sDrQUxBna/N8k7Bb1HaVH1mTEyfua7nmtxFmqJ23tBCuV63mZ71tkdLM1Nt5M0QGxFjExY8gjAFcH6ZhTvqOsYe0BztHmRLgo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=gp2ahs32; arc=none smtp.client-ip=209.85.216.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pj1-f48.google.com with SMTP id 98e67ed59e1d1-34c21417781so10504490a91.3
        for <linux-input@vger.kernel.org>; Tue, 30 Dec 2025 10:11:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1767118260; x=1767723060; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wiqtyI0E+EZ2TXt7IOrDDwvPaZp+SknY+Ea1unU062o=;
        b=gp2ahs32IzCjIw06uLOX9joppinreo8/MHeGq9gZVuKQRB/I+Fj878pzYjDSt3i+ik
         YCqR7uD6CGX1Bfy4tf08jeU+I2ypnyitJ0i4ZH8LK0dpch6MaZEGlDfcQwMMGPFCfH8Y
         lTeJdXxwj1Yj9AICIC+Uptv5n24FzSF6ddlQ9DO48Z40D0BHYwHZSztTnxeqmlVA2g0q
         0Im0LYIXx+32K7MGuICESO/hHYLr48/5kxBZCFdZZoLMEC4Cp9XIo8wT+tRhtQ5ozEp/
         Iu1+Z/rXlu9PVNnauD7QEt9P62uWJFlSZrYH10QrRSA9CRBs+R6feTaTFSL+xUyUf48X
         W/VA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767118260; x=1767723060;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=wiqtyI0E+EZ2TXt7IOrDDwvPaZp+SknY+Ea1unU062o=;
        b=m9wkr94Mx4H1uvNOlzAPmS/Q9AoWR0GatWyZrBeIlYlfZlzM4qCFsued36/uYvBQt/
         BoOh8+vzTa8Mp/HQOY25AUJcEPOJeLe1UTC+5xZNoUfyBAkuXD8UIyDl6J/6ceg3VbyH
         MpMlBcBKcpya3CB3QvtdpamUmjhmow+FsG6E4VNAtlqqjoIlrIilORT2WklPlFkpB8S0
         HMh2QCQ6Mj+vkB8AYTgOjsdvUnTkTapSbteS4ewcEvoDO1vx55t+60GfJSTxw78tUW0/
         ZtxgPF4vmjR/b38NwzP9w5pQfWF2b3T1g0K0q8wCqW9PKcPBd9J0bZ7qoUdnDbUii2oP
         5JJA==
X-Forwarded-Encrypted: i=1; AJvYcCX21KkJ6LcP37QeykHQ203Uft0QbN21FQG5wCjbfLmQr2NBPJmqBPcRkIvTwfh8n3R0Wn0S18dR1S3nlw==@vger.kernel.org
X-Gm-Message-State: AOJu0YwHRp5DqsRaBhR0Njh0VJNaGXyR5bJgheNv4NdR0XvqYDeO9Kme
	zEChuyst1a6njjTkPtWUVC9Nx6GTTgp4tfFHF81CEoHm61iGYh+VJNYh
X-Gm-Gg: AY/fxX5oLQjeCdWK9o0DbVjbiX4ZKNeV/VFwwc17yfPjKvxHeVwAt+I2BSBk5121bjn
	AXnpRekJLov6V5VxayXPDREvE731+lax4BQrnFHg5j/Nc5xMNpwRzYYHlG+Rbxuv9oSbd9WY2D7
	qMkIEoSpZ82RDh/sy1SiNFVoxC/VqykKOsQXZ9ubIOfGnMBA51POhNHdpIuJsUf0MGoX6Yl8fDg
	O44c8c6Vo7RFlRwmMYF+C1yojQY63VF9GuNZ5smZuzlF5Nqd3guYHv2RYmtKnhhH1wxn+cY4LGV
	+YKtzWj+MhRaQWnQe07qf9vBSEAJp1GmBTVbn62EF3k+d3ejXS7uQFQ2WyvcqcFBI5WCTWkNir2
	Nf+1tDaKPD/9pfklJ6HjKeUSc0fRyUU15l0rcwhaaYknN8TH2y75HIniwVq2UbWLy/DJh3/z+KW
	3dU2lqTGcA7eq2ZKFLQ9Bg+QepCwkgOALsSNFyIirz2TwPs0NU0G2H+mhPn2sg2uQflsblR3YTO
	qQyVxv+62icWS4piKnngA==
X-Google-Smtp-Source: AGHT+IFysb5O/IJUVTITdM4KylhE1TplZEdTk/XkUcd/+h52MkW7iQODmWt+Z3OinYOcQ+IJmSy8Wg==
X-Received: by 2002:a17:90b:1f86:b0:340:2a16:94be with SMTP id 98e67ed59e1d1-34e921137c6mr25807297a91.4.1767118259879;
        Tue, 30 Dec 2025 10:10:59 -0800 (PST)
Received: from visitorckw-work01.c.googlers.com.com (25.118.81.34.bc.googleusercontent.com. [34.81.118.25])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c1e7bc69728sm29598278a12.19.2025.12.30.10.10.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Dec 2025 10:10:59 -0800 (PST)
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
Subject: [PATCH 2/6] dt-bindings: misc: google,android-pipe: Convert to DT schema
Date: Tue, 30 Dec 2025 18:10:27 +0000
Message-ID: <20251230181031.3191565-3-visitorckw@gmail.com>
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

Convert the Android Goldfish QEMU Pipe binding to DT schema format.
Move the file to the misc directory as it represents a miscellaneous
communication device.
Update the example node name to 'pipe' to comply with generic node
naming standards and fix the mismatch between unit address and reg
property in the original example.

Signed-off-by: Kuan-Wei Chiu <visitorckw@gmail.com>
---
 .../devicetree/bindings/goldfish/pipe.txt     | 17 ---------
 .../bindings/misc/google,android-pipe.yaml    | 38 +++++++++++++++++++
 2 files changed, 38 insertions(+), 17 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/goldfish/pipe.txt
 create mode 100644 Documentation/devicetree/bindings/misc/google,android-pipe.yaml

diff --git a/Documentation/devicetree/bindings/goldfish/pipe.txt b/Documentation/devicetree/bindings/goldfish/pipe.txt
deleted file mode 100644
index 5637ce701788..000000000000
--- a/Documentation/devicetree/bindings/goldfish/pipe.txt
+++ /dev/null
@@ -1,17 +0,0 @@
-Android Goldfish QEMU Pipe
-
-Android pipe virtual device generated by android emulator.
-
-Required properties:
-
-- compatible : should contain "google,android-pipe" to match emulator
-- reg        : <registers mapping>
-- interrupts : <interrupt mapping>
-
-Example:
-
-	android_pipe@a010000 {
-		compatible = "google,android-pipe";
-		reg = <ff018000 0x2000>;
-		interrupts = <0x12>;
-	};
diff --git a/Documentation/devicetree/bindings/misc/google,android-pipe.yaml b/Documentation/devicetree/bindings/misc/google,android-pipe.yaml
new file mode 100644
index 000000000000..12b0cfc815e4
--- /dev/null
+++ b/Documentation/devicetree/bindings/misc/google,android-pipe.yaml
@@ -0,0 +1,38 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/misc/google,android-pipe.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Android Goldfish QEMU Pipe
+
+maintainers:
+  - Kuan-Wei Chiu <visitorckw@gmail.com>
+
+description:
+  Android QEMU pipe virtual device generated by Android emulator.
+
+properties:
+  compatible:
+    const: google,android-pipe
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
+    pipe@ff018000 {
+        compatible = "google,android-pipe";
+        reg = <0xff018000 0x2000>;
+        interrupts = <0x12>;
+    };
-- 
2.52.0.358.g0dd7633a29-goog


