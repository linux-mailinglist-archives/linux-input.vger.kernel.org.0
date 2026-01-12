Return-Path: <linux-input+bounces-16999-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 60F79D153AB
	for <lists+linux-input@lfdr.de>; Mon, 12 Jan 2026 21:32:40 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 60DEB3014DDB
	for <lists+linux-input@lfdr.de>; Mon, 12 Jan 2026 20:32:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 741393019B2;
	Mon, 12 Jan 2026 20:32:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="EnPn9k6b"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-oo1-f52.google.com (mail-oo1-f52.google.com [209.85.161.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C9E3329385
	for <linux-input@vger.kernel.org>; Mon, 12 Jan 2026 20:32:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768249957; cv=none; b=dFBloYuevPYvhLEuougYewe732RpwbeJ9iYIVn2AaMYM7ka9osS9B7kq8W7Ubug37fTsjGmRQabSOy+eh02V+nS+gZJmTngN984sUaegCHQZ3YYQwa5GFNIRunA+27yuU6TdVCGmJmuQezzg7u3s1sSy9DrknMCe96gNMy9YXYE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768249957; c=relaxed/simple;
	bh=1cgc9CyPLdaamTqWSH/prcaGYr4QsO4nAqSVaUroafU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Tv/u9BeVO15S2Lpk9LPagAYXhnCJ5Oc0gsyDaPwrM0uF4LiGCP5jLa7yo/T6uYE4Z8g16uyLvfdMob4UGD//Svbe1EZYKerxT77LUyVhhZ/sSoxZIHvgly9IV1+ci/hsRwgJoHDlOSXWcwpJbvy8gHNumCf0XKH50uzcvxQbK6A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=EnPn9k6b; arc=none smtp.client-ip=209.85.161.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-oo1-f52.google.com with SMTP id 006d021491bc7-65f66a770cbso2160852eaf.1
        for <linux-input@vger.kernel.org>; Mon, 12 Jan 2026 12:32:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768249955; x=1768854755; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=A0PErH3A+TCXfgL5PR8asxXBIGBytLNSMzZeGmnD/jY=;
        b=EnPn9k6bBgVqa69oGJzH66Hy5kU2VA6ZV87kjBEW0mTarZDDHIAl1bI0x5JzA+WYgw
         5PmSSBZJfWRcDIv+nuK4N/WD8ug3vqtIYNhepUQlh0oXtELofSC7saugZZ/15JHR7Jrv
         OQMeUaG+3sMnRU56XGTaGujJaVIfikmryXry8s/aRhFIuGL9KhMrB6RQsEeaOMBu1hoc
         oEQruZjQ28YrvmyyHr+ndfroEVFch5ecotZ/CNdcXbWg69mZAjPYhwC+1AHM+v1af3gJ
         bRD1aRx46bys8wHweLLFNS6niTouQMfiTw1nREV+ZucVnPklQQT/yfRMs0uTsKzmW4eM
         tOeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768249955; x=1768854755;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=A0PErH3A+TCXfgL5PR8asxXBIGBytLNSMzZeGmnD/jY=;
        b=EgpvIJEuKX8nfRuI5w9AXpNM7LdpVklID0B5oSJvHhCc5PA68BvUGxEKHgeYj1bI8R
         KVZa91I8a0SpuG/lfj5lB21fEPCYDCzxwiNe66R4/j43j+4f8UZXy6fZGwsiRu/jJ9RT
         Fa4lf4e+L5x3yGmcMKzgP4f2F5i3x/7+VIwFG/S1VMPMTZm3lmHanVZhMhxh3o54PVbj
         UfqNZqbMupyPa0YZe2/dyd2D4FvLNruV+l3cBJhKj8NZ7Pw+R+qZXsuPHMOv/mVHsu/t
         GXxGMx6995ekikLg5quQm2ewwHikktznLEgbHx6KPW7EAlod+GpSaAGlgUxgJEbeYSlx
         pkFQ==
X-Forwarded-Encrypted: i=1; AJvYcCU7OJErTiSn8qNuRLNgrIT9WtFpwbX20oSRlXb+pP/tPi1YjzeOdR0+qowCTyGM9xaRLU1luGUMiy/ztw==@vger.kernel.org
X-Gm-Message-State: AOJu0Yy9wvIgFFh0+w9sIFiDCA8w1Litjuh4moDPjujhLMU4cf9XU8nZ
	FitNl4dSVexYBX7xQtaRr1zFAUOQpljtZivAPWajnARAx4Jy2B5TUD5+6IJDGA==
X-Gm-Gg: AY/fxX4v3t160DeFygJWZiGTTVNq4Xm3oTJ2LSkAO1c33e64TR8V0vXDNtkvKk8c/Y5
	l2/ieAWnHbdA3Rpu6A4lnzk/9dPLlE25J1t6TlpzwAlxXz7C9Pzer4IT4axcLacrX5wEVnQXwrI
	zNyUuXM+pMOR3T42gpwRYdOHc+lDSyurvxghMenhBZBxRNQL8/qMFNofUCIoSG9dOBivbVeIOjm
	r1oeOC6nTbIl3gHsVudi0CS4Ny+jMutJiYtt4IzrYOAdTMx8J3d6b9B0x02cI6/emNsyg4Loyy3
	yqctTQc9NI8cSTokOkUdUKPYv5oLkRJF/xivz/ICSev3uDJ8Jbf7zialaelX2IENtkcWdESSen8
	t+FG3i6obG2UtK9VmBqLAph+fVoN8gg3wowc/8iGHH60xApgmdJIBynRVz73EmjhdqA4qd9hww5
	tfjDtupw3GOxu1UjWqaseTg3koVjRcWbNwQ5mC0vOecuct3LYPkyioI8SzKbcxUr4+UUEBYvx+p
	i8E7tUINEU7RRKGWfrEcg==
X-Google-Smtp-Source: AGHT+IGZVQoYbx2iilZrdLG2Ztf307Z50A6C9NTY1Qg4UTlyKWI05nICHsHwet4uo+a7zycAJ/JW+Q==
X-Received: by 2002:a05:6a21:3291:b0:35f:5fc4:d896 with SMTP id adf61e73a8af0-3898f906a35mr17214236637.20.1768243921460;
        Mon, 12 Jan 2026 10:52:01 -0800 (PST)
Received: from visitorckw-work01.c.googlers.com.com (25.118.81.34.bc.googleusercontent.com. [34.81.118.25])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c4cca06b16fsm18874197a12.31.2026.01.12.10.51.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Jan 2026 10:52:01 -0800 (PST)
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
Subject: [PATCH v3 3/6] dt-bindings: input: google,goldfish-events-keypad: Convert to DT schema
Date: Mon, 12 Jan 2026 18:50:41 +0000
Message-ID: <20260112185044.1865605-4-visitorckw@gmail.com>
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

Convert the Android Goldfish Events Keypad binding to DT schema format.
Move the file to the input directory to match the subsystem.
Update the example node name to 'keypad' to comply with generic node
naming standards.

Signed-off-by: Kuan-Wei Chiu <visitorckw@gmail.com>
---
Changes in v3:
- Use decimal format for interrupts in the example.

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
index 000000000000..4e3a010a70c5
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
+        interrupts = <5>;
+    };
-- 
2.52.0.457.g6b5491de43-goog


