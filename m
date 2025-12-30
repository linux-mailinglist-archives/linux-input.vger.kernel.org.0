Return-Path: <linux-input+bounces-16745-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C577CEA947
	for <lists+linux-input@lfdr.de>; Tue, 30 Dec 2025 21:06:43 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 3E6A830133AC
	for <lists+linux-input@lfdr.de>; Tue, 30 Dec 2025 20:06:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 397182773FC;
	Tue, 30 Dec 2025 20:06:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HdunzOzC"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-vk1-f182.google.com (mail-vk1-f182.google.com [209.85.221.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 90DBF233D85
	for <linux-input@vger.kernel.org>; Tue, 30 Dec 2025 20:06:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767125200; cv=none; b=J5nCKZfzwgSVvR5yPG3ed3A8dn5p7Vm4kHDVhy3UPbQaqgX91+UeKNHDGRtrxLksA/DI2wGlmHTsud7b1lMy65c2WvlqJ3B5/xcproQKFHSY9ZYbZqe4YhBOLUf2iW06HEy2LMo2wtCbKIt8r/Dnaa9/Q78I8fhZmXEDnhYbmPw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767125200; c=relaxed/simple;
	bh=wuouABNtno/my3xxB41xPlJVygP/E24Aj/Ddg3O+3RM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=biKJ3i+9E1z2ANO5ptRgCXe76BaXBFs210Ul86OUQ3+rAaEfQIBths9FvN+zwEYCyNrRhvWrW8JBVW8mNapDGX8TvNzSTlJ2gxJCVE8DDIwxE5N5/9B0waofNVcgCR8OVFPDPnxmKwAxcrHfoNkZSR0oLouUXHSvNix+owQn5e0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=HdunzOzC; arc=none smtp.client-ip=209.85.221.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f182.google.com with SMTP id 71dfb90a1353d-55b219b2242so5867300e0c.0
        for <linux-input@vger.kernel.org>; Tue, 30 Dec 2025 12:06:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1767125197; x=1767729997; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=eY9DKWu7ggurjBP9bHM5tPTMCGUI+TAaWzZpacbdf+Y=;
        b=HdunzOzC2sW5E0W62e7P+cOr14uwKsTb3pV/PCyltP7h/tNQxkgzpYLlaG3WrLD6p7
         EZ45Jg8U+piyKkjHmz2W8If82gfbek6BV71d9oh2x5rd3o0FKw+8DvD5ltFziB0LoMwv
         saDUYcr0ghjWVIWysF/cYtbZ14w3YKkv3Ld3C3JdDQNZ+x2GfRZaFbQAJzCUb6T7Ai9O
         Z1eP3/TsEgKEg6FDLnHunZygKrq5J8kl1mSGOaIO9nwjWjmqUN4DUytvPcJK1un+UMyh
         LD2/NBoSFMQJr+3t6035Hpqc+6JtQyr8UswMk71hpAizsi1dlvMqJUqUdwYlP2mUQU7P
         e86A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767125197; x=1767729997;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=eY9DKWu7ggurjBP9bHM5tPTMCGUI+TAaWzZpacbdf+Y=;
        b=lFgC+kwrUs+2WQEr2nF7skO4LAqjo39Le3JrDfU7EzGw2WZqwP/BY6ntyQOZpCPhnZ
         mI76fhiQZSQx9tRhdQKj7gpueuWX4HPDi46cUCXGd5zJoLFis4jNV5wSBH8I1g85VHU8
         dZHQ9mf98sF0uz4fd1O+zUi+LgkLsghoPD86LX31zM9G82vTvumHzWOOyOasm7sODLSP
         dkKyqn+GwUH/nU4FsHFQWamEMX/coR7s2vn+7IvjWUCkb5caZv8IFKRKIOOCxr06W8wJ
         jq+bfJmYWnIx3FF/+mQSE7ZQoxuF/tTKGiX/s9+DLOjBchLE5z6yWlpzW2Ru5CcObin8
         H0iQ==
X-Forwarded-Encrypted: i=1; AJvYcCVU0YIUHgoPwf8M8uuZyeLGjUs7P5qj6ZDKb7APd3nDH9xFrplQ8gK85nBFPcBkdCCvcKSeO9IEL8Tv3g==@vger.kernel.org
X-Gm-Message-State: AOJu0YzD8QJlmygYeQZUl20y36szbQtRCDa3G/gv3FezYJEBkSEafSUG
	1n5AGflxKSvcuCkdNbX39vktSVWQGsS1H5gej/Gt8Elp8V+VpTaXVfLgiKy95w==
X-Gm-Gg: AY/fxX6hHYNWqMElGrKI40i3G5NJRxGvowa5CSsm7idUkTL68EQ7ZMeKh00EyLMlv9/
	khHiE+nlVYNb8uPjk1Gx2VZZlMwf8nLuZ/4l30iVicPwAX4XiBlCI/k/FSqAwgvfDjuiVS4mJHH
	7oLEj+edgvMPhOd5jfzjYrtzcr9hKuOKOi9PbtetdgS/jylBhA/jahoCpnm/W2TYoEElsWLVCLe
	x6881F/EHTicUg4vcELWv0UKqxJzfHB90da9uWPAdLz7Oz9hh1yjkg1k6Zi2aT1yJ9RhWMYS+pE
	4JZmJ1X0fOv6qDi44eXSpbywImVm7kJgMhQIN8ZuoI1b+LlfTZUeb8TllY/JTzSAXuVzfp4AiM5
	eJ72J4jJuup8GgNNPULuwuDtWqvbhqB8cZKLysDVUkn63A/g1zByFYllfw+RDq9aa2tf14LP9Yb
	lqD0ZG4R3jJkc41ntg2qbP/I35UymUz8Yh+rUT0gWuOZC1zx65NW5aA6Xxz8WROTb3vinau//pe
	W0jb5BfM5bgk8V6D3g5KA==
X-Google-Smtp-Source: AGHT+IHNSjL6XO/9GG+VQ4LJ4CyetXEzcsFuGnG9Kdw0+OI361O47497s5aMUrTFKuua6BqPpBWyVQ==
X-Received: by 2002:a05:6a20:549d:b0:35f:84c7:4012 with SMTP id adf61e73a8af0-3769f92fca1mr31561858637.29.1767118275492;
        Tue, 30 Dec 2025 10:11:15 -0800 (PST)
Received: from visitorckw-work01.c.googlers.com.com (25.118.81.34.bc.googleusercontent.com. [34.81.118.25])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c1e7bc69728sm29598278a12.19.2025.12.30.10.11.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Dec 2025 10:11:15 -0800 (PST)
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
Subject: [PATCH 5/6] dt-bindings: sound: google,goldfish-audio: Convert to DT schema
Date: Tue, 30 Dec 2025 18:10:30 +0000
Message-ID: <20251230181031.3191565-6-visitorckw@gmail.com>
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

Convert the Android Goldfish Audio binding to DT schema format.
Move the file to the sound directory to match the subsystem.
Update the example node name to 'sound' to comply with generic node
naming standards.

Signed-off-by: Kuan-Wei Chiu <visitorckw@gmail.com>
---
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
2.52.0.358.g0dd7633a29-goog


