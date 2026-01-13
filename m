Return-Path: <linux-input+bounces-17050-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id B28A3D187CE
	for <lists+linux-input@lfdr.de>; Tue, 13 Jan 2026 12:29:26 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id E2BF7309157B
	for <lists+linux-input@lfdr.de>; Tue, 13 Jan 2026 11:25:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B733238BDAD;
	Tue, 13 Jan 2026 11:25:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="h2WcCc8v"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-qk1-f172.google.com (mail-qk1-f172.google.com [209.85.222.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE66338B9B9
	for <linux-input@vger.kernel.org>; Tue, 13 Jan 2026 11:25:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768303516; cv=none; b=a7c3Xm83VDQLe9mPcZUHgoIGlZBmUS6CD5S+wFMy4/IXlwH1NCAxHeZnQ73+5FFvhYj2WIuTkgvIAiIkB9wRoPzCnlTXhsylH4YiBFjWz3FoM9tIqagfreT27bzFOaLmfkfA6WLilZ72IctOe3U/el2mOXd+kgs+fGU5H5AC1QQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768303516; c=relaxed/simple;
	bh=HDUKH+I7Fa+PmeSfYZXj+pEr7M14pExXySUjkX85juE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=pYedyLRlBCGCagseqaMk61gY01EAYkeY5Ovv3ul4cJ8NRs7yL17UzMpT+zho6+BP1NX5xOVWJ+OJj/3gJ0HIyJpAhaQlIkTHFl0ixtJe4Y9NKIuuggqg9Qc/FExo2yJA1FZqQS2hBDbMnBdCvkChODUU7ChDV18K68sI/ewK+e8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=h2WcCc8v; arc=none smtp.client-ip=209.85.222.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qk1-f172.google.com with SMTP id af79cd13be357-8b2a4b6876fso1148480685a.3
        for <linux-input@vger.kernel.org>; Tue, 13 Jan 2026 03:25:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768303512; x=1768908312; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/DtPGFQHFju1IO/Degf1/ys2a0tv707U6qKEmBe4+A8=;
        b=h2WcCc8v9Ja9I93Fv84UBYo7xllJMz1MBy52cVAxv2G8Bio1jnf+SfHWkHifLmpRCw
         WEUCYCy/NhzGmqZoqdFweWjxkwIDJYpycWUoCgJ0CmIebFUeye+u5o0Da6lcCNtckowf
         J0DV8YjS+g0yrRdy8b/xWUw7c2hxZ5OTrZRHh49y6R0I2xGaNvUdFIYSa3FQcPs7C0j2
         3B/8IryzBDHpZYxc1NtgIHwOs134ewheXJ2ARTt8oJ2NSUCX6KsDVIKyb+y/oJdo0za/
         5E1tRHTJqo0utqXUsSij1Jxd/+m/SzVUlOEw5kpIGRi1d45r17qjqlDYa11JbZaJRRRJ
         oI8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768303512; x=1768908312;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=/DtPGFQHFju1IO/Degf1/ys2a0tv707U6qKEmBe4+A8=;
        b=uv9VILc4SOsBEMQ1Pa8N/6+A8/DN6Gitz4YdWx/Fp2wg+XNpBZPx1PqJVSpj7jar8I
         YdchZZoPVn6Ignt8FJQfE2v349rHfrcJBUU/4/iSnfl3XuoSBK8noPIIB5TdmrjKGSsx
         H56q5ZsJ0xkob67e+ht5SDk6exXPOCNzmP1cxg+6us483oOZsw50msG7PRXUUSDI+ZPK
         LZ2p6CAc/jET1qG3FZlPVYABvwRHH1U5Nr9iZlSD96+D19InoFJjSCG57+MKPwPMN+i+
         jDbCYkBKVjvoO6dxueZxpuFqJI9ATf/HBF4PUxLezcG1Ch4l6KabAxds2IUPALZ7OPdm
         feFA==
X-Forwarded-Encrypted: i=1; AJvYcCUVBSWO1zsMBR2+5I807JOWr45Ing3BiUwbbK0dFhUcS1CqwoUvL9xo0SCwggUB6yXMD8z2piO8vKirqA==@vger.kernel.org
X-Gm-Message-State: AOJu0YwaP3hhIYFirWSAqSRONZidc5kQkxGPUYNrZqQKhcTdzBeu+8ZN
	LdL1vb4V3kx8uCCTSo2UBExvsV5W1MOG5wb5pZsMge69BT18wMz+OSRSvwGqsw==
X-Gm-Gg: AY/fxX4Pg3SekzzqXM9BMRfEnCApPjZqanQIS3X6rsBRtaQIku76Q9v3gpscJwXEomM
	damj3POoiqMmpNvD4iS8bThPrPEwzIg2C+ddfc/fRggEkpkfa+VuZAnSuVnSKP7l0KxviVqgdvK
	cw7Vb71D4bdmCHKNas0ViXbOMfAEy2oA0n5wthnMgzAx/o6lL1xbmXV8bRQt7dV3UbIY0t4nYAS
	ikFAoMQZLcsXOc2Yn6y5o31zGJ8ZktJySJVYs3sLUxdYrRreU/F6AzkhI+PeqiZUieiCs+OVzZ7
	dSa43O5hT6XHbVqh0pGkgB5hEur+uH8yqyQLgwE/PJluJBb7XZsxFLNqB/q7nJgh//UeNoPRdIe
	R4EBDfRF8rvA9WJsUW9XIzJeqU2G0HOlHKAnS/9S/tDiO6GR3v2d/8YnaslOVxxD6gBS40TGFG5
	us98RFxXOi2Y3tIwT/Q+Z84X86QAOEVPZWyu066qgDH1bIB9ZOcUIg8ln15zyvvAhyC2jdVPfGH
	AzonsJqDAPaxwTW3oDadQ==
X-Google-Smtp-Source: AGHT+IGN7YtptJAvyBxGsryFp/ZVQ3AtqkPm+d6Uo/gUGIm0zr03kGaJ57Syx71qzIqCdd6goycVuA==
X-Received: by 2002:a17:90b:4b0b:b0:330:6d5e:f174 with SMTP id 98e67ed59e1d1-34f68d0bc5fmr21176395a91.20.1768296400127;
        Tue, 13 Jan 2026 01:26:40 -0800 (PST)
Received: from visitorckw-work01.c.googlers.com.com (25.118.81.34.bc.googleusercontent.com. [34.81.118.25])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-34f5f8b0f67sm19483200a91.15.2026.01.13.01.26.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Jan 2026 01:26:39 -0800 (PST)
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
Subject: [PATCH v4 4/6] dt-bindings: power: supply: google,goldfish-battery: Convert to DT schema
Date: Tue, 13 Jan 2026 09:26:00 +0000
Message-ID: <20260113092602.3197681-5-visitorckw@gmail.com>
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

Convert the Android Goldfish Battery binding to DT schema format.
Move the file to the power/supply directory to match the subsystem.
Update the example node name to 'battery' to comply with generic node
naming standards.

Signed-off-by: Kuan-Wei Chiu <visitorckw@gmail.com>
---
 .../devicetree/bindings/goldfish/battery.txt  | 17 --------
 .../power/supply/google,goldfish-battery.yaml | 41 +++++++++++++++++++
 2 files changed, 41 insertions(+), 17 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/goldfish/battery.txt
 create mode 100644 Documentation/devicetree/bindings/power/supply/google,goldfish-battery.yaml

diff --git a/Documentation/devicetree/bindings/goldfish/battery.txt b/Documentation/devicetree/bindings/goldfish/battery.txt
deleted file mode 100644
index 4fb613933214..000000000000
--- a/Documentation/devicetree/bindings/goldfish/battery.txt
+++ /dev/null
@@ -1,17 +0,0 @@
-Android Goldfish Battery
-
-Android goldfish battery device generated by android emulator.
-
-Required properties:
-
-- compatible : should contain "google,goldfish-battery" to match emulator
-- reg        : <registers mapping>
-- interrupts : <interrupt mapping>
-
-Example:
-
-	goldfish_battery@9020000 {
-		compatible = "google,goldfish-battery";
-		reg = <0x9020000 0x1000>;
-		interrupts = <0x3>;
-	};
diff --git a/Documentation/devicetree/bindings/power/supply/google,goldfish-battery.yaml b/Documentation/devicetree/bindings/power/supply/google,goldfish-battery.yaml
new file mode 100644
index 000000000000..634327c89c88
--- /dev/null
+++ b/Documentation/devicetree/bindings/power/supply/google,goldfish-battery.yaml
@@ -0,0 +1,41 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/power/supply/google,goldfish-battery.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Android Goldfish Battery
+
+maintainers:
+  - Kuan-Wei Chiu <visitorckw@gmail.com>
+
+allOf:
+  - $ref: power-supply.yaml#
+
+description:
+  Android goldfish battery device generated by Android emulator.
+
+properties:
+  compatible:
+    const: google,goldfish-battery
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
+    battery@9020000 {
+        compatible = "google,goldfish-battery";
+        reg = <0x9020000 0x1000>;
+        interrupts = <3>;
+    };
-- 
2.52.0.457.g6b5491de43-goog


